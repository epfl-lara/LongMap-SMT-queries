; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31442 () Bool)

(assert start!31442)

(declare-fun b!314907 () Bool)

(declare-fun res!170515 () Bool)

(declare-fun e!196069 () Bool)

(assert (=> b!314907 (=> (not res!170515) (not e!196069))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314907 (= res!170515 (validKeyInArray!0 k!2441))))

(declare-fun b!314908 () Bool)

(declare-fun res!170516 () Bool)

(assert (=> b!314908 (=> (not res!170516) (not e!196069))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!16068 0))(
  ( (array!16069 (arr!7607 (Array (_ BitVec 32) (_ BitVec 64))) (size!7959 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16068)

(declare-datatypes ((SeekEntryResult!2747 0))(
  ( (MissingZero!2747 (index!13164 (_ BitVec 32))) (Found!2747 (index!13165 (_ BitVec 32))) (Intermediate!2747 (undefined!3559 Bool) (index!13166 (_ BitVec 32)) (x!31399 (_ BitVec 32))) (Undefined!2747) (MissingVacant!2747 (index!13167 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16068 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!314908 (= res!170516 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2747 i!1240)))))

(declare-fun b!314909 () Bool)

(declare-fun res!170519 () Bool)

(assert (=> b!314909 (=> (not res!170519) (not e!196069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16068 (_ BitVec 32)) Bool)

(assert (=> b!314909 (= res!170519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314910 () Bool)

(declare-fun e!196072 () Bool)

(declare-fun e!196071 () Bool)

(assert (=> b!314910 (= e!196072 e!196071)))

(declare-fun res!170520 () Bool)

(assert (=> b!314910 (=> (not res!170520) (not e!196071))))

(declare-fun lt!154052 () SeekEntryResult!2747)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lt!154053 () SeekEntryResult!2747)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314910 (= res!170520 (and (= lt!154053 lt!154052) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7607 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7607 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7607 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16068 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!314910 (= lt!154053 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314912 () Bool)

(declare-fun res!170522 () Bool)

(assert (=> b!314912 (=> (not res!170522) (not e!196069))))

(assert (=> b!314912 (= res!170522 (and (= (size!7959 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7959 a!3293))))))

(declare-fun b!314913 () Bool)

(assert (=> b!314913 (= e!196069 e!196072)))

(declare-fun res!170518 () Bool)

(assert (=> b!314913 (=> (not res!170518) (not e!196072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314913 (= res!170518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154052))))

(assert (=> b!314913 (= lt!154052 (Intermediate!2747 false resIndex!52 resX!52))))

(declare-fun b!314914 () Bool)

(declare-fun res!170517 () Bool)

(assert (=> b!314914 (=> (not res!170517) (not e!196069))))

(declare-fun arrayContainsKey!0 (array!16068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314914 (= res!170517 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314915 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314915 (= e!196071 (not (= lt!154053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))))

(declare-fun b!314911 () Bool)

(declare-fun res!170521 () Bool)

(assert (=> b!314911 (=> (not res!170521) (not e!196072))))

(assert (=> b!314911 (= res!170521 (and (= (select (arr!7607 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7959 a!3293))))))

(declare-fun res!170523 () Bool)

(assert (=> start!31442 (=> (not res!170523) (not e!196069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31442 (= res!170523 (validMask!0 mask!3709))))

(assert (=> start!31442 e!196069))

(declare-fun array_inv!5570 (array!16068) Bool)

(assert (=> start!31442 (array_inv!5570 a!3293)))

(assert (=> start!31442 true))

(assert (= (and start!31442 res!170523) b!314912))

(assert (= (and b!314912 res!170522) b!314907))

(assert (= (and b!314907 res!170515) b!314914))

(assert (= (and b!314914 res!170517) b!314908))

(assert (= (and b!314908 res!170516) b!314909))

(assert (= (and b!314909 res!170519) b!314913))

(assert (= (and b!314913 res!170518) b!314911))

(assert (= (and b!314911 res!170521) b!314910))

(assert (= (and b!314910 res!170520) b!314915))

(declare-fun m!324323 () Bool)

(assert (=> b!314910 m!324323))

(declare-fun m!324325 () Bool)

(assert (=> b!314910 m!324325))

(declare-fun m!324327 () Bool)

(assert (=> start!31442 m!324327))

(declare-fun m!324329 () Bool)

(assert (=> start!31442 m!324329))

(declare-fun m!324331 () Bool)

(assert (=> b!314908 m!324331))

(declare-fun m!324333 () Bool)

(assert (=> b!314913 m!324333))

(assert (=> b!314913 m!324333))

(declare-fun m!324335 () Bool)

(assert (=> b!314913 m!324335))

(declare-fun m!324337 () Bool)

(assert (=> b!314909 m!324337))

(declare-fun m!324339 () Bool)

(assert (=> b!314914 m!324339))

(declare-fun m!324341 () Bool)

(assert (=> b!314915 m!324341))

(assert (=> b!314915 m!324341))

(declare-fun m!324343 () Bool)

(assert (=> b!314915 m!324343))

(declare-fun m!324345 () Bool)

(assert (=> b!314911 m!324345))

(declare-fun m!324347 () Bool)

(assert (=> b!314907 m!324347))

(push 1)

(assert (not b!314907))

(assert (not b!314913))

(assert (not start!31442))

(assert (not b!314908))

(assert (not b!314914))

(assert (not b!314910))

(assert (not b!314909))

(assert (not b!314915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!315033 () Bool)

(declare-fun lt!154083 () SeekEntryResult!2747)

(assert (=> b!315033 (and (bvsge (index!13166 lt!154083) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154083) (size!7959 a!3293)))))

(declare-fun res!170601 () Bool)

(assert (=> b!315033 (= res!170601 (= (select (arr!7607 a!3293) (index!13166 lt!154083)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196133 () Bool)

(assert (=> b!315033 (=> res!170601 e!196133)))

(declare-fun b!315034 () Bool)

(assert (=> b!315034 (and (bvsge (index!13166 lt!154083) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154083) (size!7959 a!3293)))))

(assert (=> b!315034 (= e!196133 (= (select (arr!7607 a!3293) (index!13166 lt!154083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315035 () Bool)

(declare-fun e!196136 () SeekEntryResult!2747)

(assert (=> b!315035 (= e!196136 (Intermediate!2747 false index!1781 x!1427))))

(declare-fun b!315036 () Bool)

(assert (=> b!315036 (= e!196136 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!315037 () Bool)

(declare-fun e!196132 () SeekEntryResult!2747)

(assert (=> b!315037 (= e!196132 e!196136)))

(declare-fun c!49832 () Bool)

(declare-fun lt!154084 () (_ BitVec 64))

(assert (=> b!315037 (= c!49832 (or (= lt!154084 k!2441) (= (bvadd lt!154084 lt!154084) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315038 () Bool)

(assert (=> b!315038 (= e!196132 (Intermediate!2747 true index!1781 x!1427))))

(declare-fun b!315039 () Bool)

(assert (=> b!315039 (and (bvsge (index!13166 lt!154083) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154083) (size!7959 a!3293)))))

(declare-fun res!170600 () Bool)

(assert (=> b!315039 (= res!170600 (= (select (arr!7607 a!3293) (index!13166 lt!154083)) k!2441))))

(assert (=> b!315039 (=> res!170600 e!196133)))

(declare-fun e!196134 () Bool)

(assert (=> b!315039 (= e!196134 e!196133)))

(declare-fun d!68831 () Bool)

(declare-fun e!196135 () Bool)

(assert (=> d!68831 e!196135))

(declare-fun c!49831 () Bool)

(assert (=> d!68831 (= c!49831 (and (is-Intermediate!2747 lt!154083) (undefined!3559 lt!154083)))))

(assert (=> d!68831 (= lt!154083 e!196132)))

(declare-fun c!49833 () Bool)

(assert (=> d!68831 (= c!49833 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68831 (= lt!154084 (select (arr!7607 a!3293) index!1781))))

(assert (=> d!68831 (validMask!0 mask!3709)))

(assert (=> d!68831 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154083)))

(declare-fun b!315040 () Bool)

(assert (=> b!315040 (= e!196135 e!196134)))

(declare-fun res!170599 () Bool)

(assert (=> b!315040 (= res!170599 (and (is-Intermediate!2747 lt!154083) (not (undefined!3559 lt!154083)) (bvslt (x!31399 lt!154083) #b01111111111111111111111111111110) (bvsge (x!31399 lt!154083) #b00000000000000000000000000000000) (bvsge (x!31399 lt!154083) x!1427)))))

(assert (=> b!315040 (=> (not res!170599) (not e!196134))))

(declare-fun b!315041 () Bool)

(assert (=> b!315041 (= e!196135 (bvsge (x!31399 lt!154083) #b01111111111111111111111111111110))))

(assert (= (and d!68831 c!49833) b!315038))

(assert (= (and d!68831 (not c!49833)) b!315037))

(assert (= (and b!315037 c!49832) b!315035))

(assert (= (and b!315037 (not c!49832)) b!315036))

(assert (= (and d!68831 c!49831) b!315041))

(assert (= (and d!68831 (not c!49831)) b!315040))

(assert (= (and b!315040 res!170599) b!315039))

(assert (= (and b!315039 (not res!170600)) b!315033))

(assert (= (and b!315033 (not res!170601)) b!315034))

(declare-fun m!324411 () Bool)

(assert (=> b!315034 m!324411))

(assert (=> d!68831 m!324323))

(assert (=> d!68831 m!324327))

(assert (=> b!315039 m!324411))

(assert (=> b!315033 m!324411))

(assert (=> b!315036 m!324341))

(assert (=> b!315036 m!324341))

(declare-fun m!324413 () Bool)

(assert (=> b!315036 m!324413))

(assert (=> b!314910 d!68831))

(declare-fun d!68839 () Bool)

(assert (=> d!68839 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314907 d!68839))

(declare-fun d!68841 () Bool)

(assert (=> d!68841 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31442 d!68841))

(declare-fun d!68857 () Bool)

(assert (=> d!68857 (= (array_inv!5570 a!3293) (bvsge (size!7959 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31442 d!68857))

(declare-fun b!315126 () Bool)

(declare-fun e!196188 () SeekEntryResult!2747)

(declare-fun lt!154127 () SeekEntryResult!2747)

(assert (=> b!315126 (= e!196188 (MissingZero!2747 (index!13166 lt!154127)))))

(declare-fun b!315127 () Bool)

(declare-fun c!49865 () Bool)

(declare-fun lt!154126 () (_ BitVec 64))

(assert (=> b!315127 (= c!49865 (= lt!154126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196189 () SeekEntryResult!2747)

(assert (=> b!315127 (= e!196189 e!196188)))

(declare-fun b!315128 () Bool)

(assert (=> b!315128 (= e!196189 (Found!2747 (index!13166 lt!154127)))))

(declare-fun b!315129 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16068 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!315129 (= e!196188 (seekKeyOrZeroReturnVacant!0 (x!31399 lt!154127) (index!13166 lt!154127) (index!13166 lt!154127) k!2441 a!3293 mask!3709))))

(declare-fun b!315130 () Bool)

(declare-fun e!196187 () SeekEntryResult!2747)

(assert (=> b!315130 (= e!196187 e!196189)))

(assert (=> b!315130 (= lt!154126 (select (arr!7607 a!3293) (index!13166 lt!154127)))))

(declare-fun c!49864 () Bool)

(assert (=> b!315130 (= c!49864 (= lt!154126 k!2441))))

(declare-fun d!68859 () Bool)

(declare-fun lt!154128 () SeekEntryResult!2747)

(assert (=> d!68859 (and (or (is-Undefined!2747 lt!154128) (not (is-Found!2747 lt!154128)) (and (bvsge (index!13165 lt!154128) #b00000000000000000000000000000000) (bvslt (index!13165 lt!154128) (size!7959 a!3293)))) (or (is-Undefined!2747 lt!154128) (is-Found!2747 lt!154128) (not (is-MissingZero!2747 lt!154128)) (and (bvsge (index!13164 lt!154128) #b00000000000000000000000000000000) (bvslt (index!13164 lt!154128) (size!7959 a!3293)))) (or (is-Undefined!2747 lt!154128) (is-Found!2747 lt!154128) (is-MissingZero!2747 lt!154128) (not (is-MissingVacant!2747 lt!154128)) (and (bvsge (index!13167 lt!154128) #b00000000000000000000000000000000) (bvslt (index!13167 lt!154128) (size!7959 a!3293)))) (or (is-Undefined!2747 lt!154128) (ite (is-Found!2747 lt!154128) (= (select (arr!7607 a!3293) (index!13165 lt!154128)) k!2441) (ite (is-MissingZero!2747 lt!154128) (= (select (arr!7607 a!3293) (index!13164 lt!154128)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2747 lt!154128) (= (select (arr!7607 a!3293) (index!13167 lt!154128)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68859 (= lt!154128 e!196187)))

(declare-fun c!49866 () Bool)

(assert (=> d!68859 (= c!49866 (and (is-Intermediate!2747 lt!154127) (undefined!3559 lt!154127)))))

(assert (=> d!68859 (= lt!154127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68859 (validMask!0 mask!3709)))

(assert (=> d!68859 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154128)))

(declare-fun b!315131 () Bool)

(assert (=> b!315131 (= e!196187 Undefined!2747)))

(assert (= (and d!68859 c!49866) b!315131))

(assert (= (and d!68859 (not c!49866)) b!315130))

(assert (= (and b!315130 c!49864) b!315128))

(assert (= (and b!315130 (not c!49864)) b!315127))

(assert (= (and b!315127 c!49865) b!315126))

(assert (= (and b!315127 (not c!49865)) b!315129))

(declare-fun m!324469 () Bool)

(assert (=> b!315129 m!324469))

(declare-fun m!324471 () Bool)

(assert (=> b!315130 m!324471))

(assert (=> d!68859 m!324327))

(declare-fun m!324473 () Bool)

(assert (=> d!68859 m!324473))

(declare-fun m!324475 () Bool)

(assert (=> d!68859 m!324475))

(assert (=> d!68859 m!324333))

(assert (=> d!68859 m!324335))

(declare-fun m!324477 () Bool)

(assert (=> d!68859 m!324477))

(assert (=> d!68859 m!324333))

(assert (=> b!314908 d!68859))

(declare-fun b!315136 () Bool)

(declare-fun lt!154129 () SeekEntryResult!2747)

(assert (=> b!315136 (and (bvsge (index!13166 lt!154129) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154129) (size!7959 a!3293)))))

(declare-fun res!170634 () Bool)

(assert (=> b!315136 (= res!170634 (= (select (arr!7607 a!3293) (index!13166 lt!154129)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196195 () Bool)

(assert (=> b!315136 (=> res!170634 e!196195)))

(declare-fun b!315137 () Bool)

(assert (=> b!315137 (and (bvsge (index!13166 lt!154129) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154129) (size!7959 a!3293)))))

(assert (=> b!315137 (= e!196195 (= (select (arr!7607 a!3293) (index!13166 lt!154129)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315138 () Bool)

(declare-fun e!196198 () SeekEntryResult!2747)

(assert (=> b!315138 (= e!196198 (Intermediate!2747 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315139 () Bool)

(assert (=> b!315139 (= e!196198 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!315140 () Bool)

(declare-fun e!196194 () SeekEntryResult!2747)

(assert (=> b!315140 (= e!196194 e!196198)))

(declare-fun c!49868 () Bool)

(declare-fun lt!154130 () (_ BitVec 64))

(assert (=> b!315140 (= c!49868 (or (= lt!154130 k!2441) (= (bvadd lt!154130 lt!154130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315141 () Bool)

(assert (=> b!315141 (= e!196194 (Intermediate!2747 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315142 () Bool)

(assert (=> b!315142 (and (bvsge (index!13166 lt!154129) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154129) (size!7959 a!3293)))))

(declare-fun res!170633 () Bool)

(assert (=> b!315142 (= res!170633 (= (select (arr!7607 a!3293) (index!13166 lt!154129)) k!2441))))

(assert (=> b!315142 (=> res!170633 e!196195)))

(declare-fun e!196196 () Bool)

(assert (=> b!315142 (= e!196196 e!196195)))

(declare-fun d!68875 () Bool)

(declare-fun e!196197 () Bool)

(assert (=> d!68875 e!196197))

(declare-fun c!49867 () Bool)

(assert (=> d!68875 (= c!49867 (and (is-Intermediate!2747 lt!154129) (undefined!3559 lt!154129)))))

(assert (=> d!68875 (= lt!154129 e!196194)))

(declare-fun c!49869 () Bool)

(assert (=> d!68875 (= c!49869 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68875 (= lt!154130 (select (arr!7607 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68875 (validMask!0 mask!3709)))

(assert (=> d!68875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154129)))

(declare-fun b!315143 () Bool)

(assert (=> b!315143 (= e!196197 e!196196)))

(declare-fun res!170632 () Bool)

(assert (=> b!315143 (= res!170632 (and (is-Intermediate!2747 lt!154129) (not (undefined!3559 lt!154129)) (bvslt (x!31399 lt!154129) #b01111111111111111111111111111110) (bvsge (x!31399 lt!154129) #b00000000000000000000000000000000) (bvsge (x!31399 lt!154129) #b00000000000000000000000000000000)))))

(assert (=> b!315143 (=> (not res!170632) (not e!196196))))

(declare-fun b!315144 () Bool)

(assert (=> b!315144 (= e!196197 (bvsge (x!31399 lt!154129) #b01111111111111111111111111111110))))

(assert (= (and d!68875 c!49869) b!315141))

(assert (= (and d!68875 (not c!49869)) b!315140))

(assert (= (and b!315140 c!49868) b!315138))

(assert (= (and b!315140 (not c!49868)) b!315139))

(assert (= (and d!68875 c!49867) b!315144))

(assert (= (and d!68875 (not c!49867)) b!315143))

(assert (= (and b!315143 res!170632) b!315142))

(assert (= (and b!315142 (not res!170633)) b!315136))

(assert (= (and b!315136 (not res!170634)) b!315137))

(declare-fun m!324479 () Bool)

(assert (=> b!315137 m!324479))

(assert (=> d!68875 m!324333))

(declare-fun m!324481 () Bool)

(assert (=> d!68875 m!324481))

(assert (=> d!68875 m!324327))

(assert (=> b!315142 m!324479))

(assert (=> b!315136 m!324479))

(assert (=> b!315139 m!324333))

(declare-fun m!324483 () Bool)

(assert (=> b!315139 m!324483))

(assert (=> b!315139 m!324483))

(declare-fun m!324485 () Bool)

(assert (=> b!315139 m!324485))

(assert (=> b!314913 d!68875))

(declare-fun d!68877 () Bool)

(declare-fun lt!154144 () (_ BitVec 32))

(declare-fun lt!154143 () (_ BitVec 32))

(assert (=> d!68877 (= lt!154144 (bvmul (bvxor lt!154143 (bvlshr lt!154143 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68877 (= lt!154143 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68877 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170640 (let ((h!5366 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31409 (bvmul (bvxor h!5366 (bvlshr h!5366 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31409 (bvlshr x!31409 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170640 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170640 #b00000000000000000000000000000000))))))

(assert (=> d!68877 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154144 (bvlshr lt!154144 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314913 d!68877))

(declare-fun b!315156 () Bool)

(declare-fun lt!154145 () SeekEntryResult!2747)

(assert (=> b!315156 (and (bvsge (index!13166 lt!154145) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154145) (size!7959 a!3293)))))

(declare-fun res!170643 () Bool)

(assert (=> b!315156 (= res!170643 (= (select (arr!7607 a!3293) (index!13166 lt!154145)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196207 () Bool)

(assert (=> b!315156 (=> res!170643 e!196207)))

(declare-fun b!315157 () Bool)

(assert (=> b!315157 (and (bvsge (index!13166 lt!154145) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154145) (size!7959 a!3293)))))

(assert (=> b!315157 (= e!196207 (= (select (arr!7607 a!3293) (index!13166 lt!154145)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315158 () Bool)

(declare-fun e!196210 () SeekEntryResult!2747)

(assert (=> b!315158 (= e!196210 (Intermediate!2747 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315159 () Bool)

(assert (=> b!315159 (= e!196210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!315160 () Bool)

(declare-fun e!196206 () SeekEntryResult!2747)

(assert (=> b!315160 (= e!196206 e!196210)))

(declare-fun c!49874 () Bool)

(declare-fun lt!154146 () (_ BitVec 64))

(assert (=> b!315160 (= c!49874 (or (= lt!154146 k!2441) (= (bvadd lt!154146 lt!154146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315161 () Bool)

(assert (=> b!315161 (= e!196206 (Intermediate!2747 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315162 () Bool)

(assert (=> b!315162 (and (bvsge (index!13166 lt!154145) #b00000000000000000000000000000000) (bvslt (index!13166 lt!154145) (size!7959 a!3293)))))

(declare-fun res!170642 () Bool)

(assert (=> b!315162 (= res!170642 (= (select (arr!7607 a!3293) (index!13166 lt!154145)) k!2441))))

(assert (=> b!315162 (=> res!170642 e!196207)))

(declare-fun e!196208 () Bool)

(assert (=> b!315162 (= e!196208 e!196207)))

(declare-fun d!68885 () Bool)

(declare-fun e!196209 () Bool)

(assert (=> d!68885 e!196209))

(declare-fun c!49873 () Bool)

(assert (=> d!68885 (= c!49873 (and (is-Intermediate!2747 lt!154145) (undefined!3559 lt!154145)))))

(assert (=> d!68885 (= lt!154145 e!196206)))

(declare-fun c!49875 () Bool)

(assert (=> d!68885 (= c!49875 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68885 (= lt!154146 (select (arr!7607 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68885 (validMask!0 mask!3709)))

(assert (=> d!68885 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154145)))

(declare-fun b!315163 () Bool)

(assert (=> b!315163 (= e!196209 e!196208)))

(declare-fun res!170641 () Bool)

(assert (=> b!315163 (= res!170641 (and (is-Intermediate!2747 lt!154145) (not (undefined!3559 lt!154145)) (bvslt (x!31399 lt!154145) #b01111111111111111111111111111110) (bvsge (x!31399 lt!154145) #b00000000000000000000000000000000) (bvsge (x!31399 lt!154145) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315163 (=> (not res!170641) (not e!196208))))

(declare-fun b!315164 () Bool)

(assert (=> b!315164 (= e!196209 (bvsge (x!31399 lt!154145) #b01111111111111111111111111111110))))

(assert (= (and d!68885 c!49875) b!315161))

(assert (= (and d!68885 (not c!49875)) b!315160))

(assert (= (and b!315160 c!49874) b!315158))

(assert (= (and b!315160 (not c!49874)) b!315159))

(assert (= (and d!68885 c!49873) b!315164))

(assert (= (and d!68885 (not c!49873)) b!315163))

(assert (= (and b!315163 res!170641) b!315162))

(assert (= (and b!315162 (not res!170642)) b!315156))

(assert (= (and b!315156 (not res!170643)) b!315157))

(declare-fun m!324495 () Bool)

(assert (=> b!315157 m!324495))

(assert (=> d!68885 m!324341))

(declare-fun m!324497 () Bool)

(assert (=> d!68885 m!324497))

(assert (=> d!68885 m!324327))

(assert (=> b!315162 m!324495))

(assert (=> b!315156 m!324495))

(assert (=> b!315159 m!324341))

(declare-fun m!324499 () Bool)

(assert (=> b!315159 m!324499))

(assert (=> b!315159 m!324499))

(declare-fun m!324501 () Bool)

(assert (=> b!315159 m!324501))

(assert (=> b!314915 d!68885))

(declare-fun d!68887 () Bool)

(declare-fun lt!154155 () (_ BitVec 32))

(assert (=> d!68887 (and (bvsge lt!154155 #b00000000000000000000000000000000) (bvslt lt!154155 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68887 (= lt!154155 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68887 (validMask!0 mask!3709)))

(assert (=> d!68887 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154155)))

(declare-fun bs!11020 () Bool)

(assert (= bs!11020 d!68887))

(declare-fun m!324503 () Bool)

(assert (=> bs!11020 m!324503))

(assert (=> bs!11020 m!324327))

(assert (=> b!314915 d!68887))

(declare-fun d!68889 () Bool)

(declare-fun res!170655 () Bool)

(declare-fun e!196234 () Bool)

(assert (=> d!68889 (=> res!170655 e!196234)))

(assert (=> d!68889 (= res!170655 (bvsge #b00000000000000000000000000000000 (size!7959 a!3293)))))

(assert (=> d!68889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196234)))

(declare-fun b!315197 () Bool)

(declare-fun e!196233 () Bool)

(declare-fun call!25990 () Bool)

(assert (=> b!315197 (= e!196233 call!25990)))

(declare-fun b!315198 () Bool)

(declare-fun e!196232 () Bool)

(assert (=> b!315198 (= e!196232 e!196233)))

(declare-fun lt!154171 () (_ BitVec 64))

(assert (=> b!315198 (= lt!154171 (select (arr!7607 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9701 0))(
  ( (Unit!9702) )
))
(declare-fun lt!154173 () Unit!9701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16068 (_ BitVec 64) (_ BitVec 32)) Unit!9701)

(assert (=> b!315198 (= lt!154173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154171 #b00000000000000000000000000000000))))

(assert (=> b!315198 (arrayContainsKey!0 a!3293 lt!154171 #b00000000000000000000000000000000)))

(declare-fun lt!154172 () Unit!9701)

(assert (=> b!315198 (= lt!154172 lt!154173)))

(declare-fun res!170654 () Bool)

(assert (=> b!315198 (= res!170654 (= (seekEntryOrOpen!0 (select (arr!7607 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2747 #b00000000000000000000000000000000)))))

(assert (=> b!315198 (=> (not res!170654) (not e!196233))))

(declare-fun b!315199 () Bool)

(assert (=> b!315199 (= e!196232 call!25990)))

(declare-fun b!315200 () Bool)

(assert (=> b!315200 (= e!196234 e!196232)))

(declare-fun c!49887 () Bool)

(assert (=> b!315200 (= c!49887 (validKeyInArray!0 (select (arr!7607 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25987 () Bool)

(assert (=> bm!25987 (= call!25990 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68889 (not res!170655)) b!315200))

(assert (= (and b!315200 c!49887) b!315198))

(assert (= (and b!315200 (not c!49887)) b!315199))

(assert (= (and b!315198 res!170654) b!315197))

(assert (= (or b!315197 b!315199) bm!25987))

(declare-fun m!324515 () Bool)

(assert (=> b!315198 m!324515))

(declare-fun m!324517 () Bool)

(assert (=> b!315198 m!324517))

(declare-fun m!324519 () Bool)

(assert (=> b!315198 m!324519))

(assert (=> b!315198 m!324515))

(declare-fun m!324521 () Bool)

(assert (=> b!315198 m!324521))

(assert (=> b!315200 m!324515))

(assert (=> b!315200 m!324515))

(declare-fun m!324523 () Bool)

(assert (=> b!315200 m!324523))

(declare-fun m!324525 () Bool)

(assert (=> bm!25987 m!324525))

(assert (=> b!314909 d!68889))

(declare-fun d!68891 () Bool)

(declare-fun res!170660 () Bool)

(declare-fun e!196239 () Bool)

(assert (=> d!68891 (=> res!170660 e!196239)))

(assert (=> d!68891 (= res!170660 (= (select (arr!7607 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68891 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!196239)))

(declare-fun b!315205 () Bool)

(declare-fun e!196240 () Bool)

(assert (=> b!315205 (= e!196239 e!196240)))

(declare-fun res!170661 () Bool)

(assert (=> b!315205 (=> (not res!170661) (not e!196240))))

(assert (=> b!315205 (= res!170661 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7959 a!3293)))))

(declare-fun b!315206 () Bool)

(assert (=> b!315206 (= e!196240 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68891 (not res!170660)) b!315205))

(assert (= (and b!315205 res!170661) b!315206))

(assert (=> d!68891 m!324515))

(declare-fun m!324527 () Bool)

(assert (=> b!315206 m!324527))

(assert (=> b!314914 d!68891))

(push 1)

(assert (not d!68875))

(assert (not d!68859))

(assert (not b!315036))

(assert (not b!315159))

(assert (not d!68885))

(assert (not b!315206))

(assert (not b!315200))

(assert (not bm!25987))

