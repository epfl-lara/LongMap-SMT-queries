; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49034 () Bool)

(assert start!49034)

(declare-fun b!540391 () Bool)

(declare-fun e!313059 () Bool)

(declare-fun e!313057 () Bool)

(assert (=> b!540391 (= e!313059 e!313057)))

(declare-fun res!335440 () Bool)

(assert (=> b!540391 (=> (not res!335440) (not e!313057))))

(declare-datatypes ((SeekEntryResult!4893 0))(
  ( (MissingZero!4893 (index!21796 (_ BitVec 32))) (Found!4893 (index!21797 (_ BitVec 32))) (Intermediate!4893 (undefined!5705 Bool) (index!21798 (_ BitVec 32)) (x!50706 (_ BitVec 32))) (Undefined!4893) (MissingVacant!4893 (index!21799 (_ BitVec 32))) )
))
(declare-fun lt!247369 () SeekEntryResult!4893)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540391 (= res!335440 (or (= lt!247369 (MissingZero!4893 i!1153)) (= lt!247369 (MissingVacant!4893 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34195 0))(
  ( (array!34196 (arr!16435 (Array (_ BitVec 32) (_ BitVec 64))) (size!16799 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34195)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34195 (_ BitVec 32)) SeekEntryResult!4893)

(assert (=> b!540391 (= lt!247369 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540392 () Bool)

(declare-fun res!335437 () Bool)

(declare-fun e!313058 () Bool)

(assert (=> b!540392 (=> (not res!335437) (not e!313058))))

(declare-fun lt!247368 () SeekEntryResult!4893)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34195 (_ BitVec 32)) SeekEntryResult!4893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540392 (= res!335437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) (select (arr!16435 a!3154) j!147) a!3154 mask!3216) lt!247368))))

(declare-fun b!540393 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!540393 (= e!313058 (and (not (= (select (arr!16435 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16435 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540394 () Bool)

(assert (=> b!540394 (= e!313057 e!313058)))

(declare-fun res!335443 () Bool)

(assert (=> b!540394 (=> (not res!335443) (not e!313058))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540394 (= res!335443 (= lt!247368 (Intermediate!4893 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540394 (= lt!247368 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16435 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!335439 () Bool)

(assert (=> start!49034 (=> (not res!335439) (not e!313059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49034 (= res!335439 (validMask!0 mask!3216))))

(assert (=> start!49034 e!313059))

(assert (=> start!49034 true))

(declare-fun array_inv!12231 (array!34195) Bool)

(assert (=> start!49034 (array_inv!12231 a!3154)))

(declare-fun b!540395 () Bool)

(declare-fun res!335444 () Bool)

(assert (=> b!540395 (=> (not res!335444) (not e!313057))))

(assert (=> b!540395 (= res!335444 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16799 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16799 a!3154)) (= (select (arr!16435 a!3154) resIndex!32) (select (arr!16435 a!3154) j!147))))))

(declare-fun b!540396 () Bool)

(declare-fun res!335441 () Bool)

(assert (=> b!540396 (=> (not res!335441) (not e!313059))))

(declare-fun arrayContainsKey!0 (array!34195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540396 (= res!335441 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540397 () Bool)

(declare-fun res!335442 () Bool)

(assert (=> b!540397 (=> (not res!335442) (not e!313057))))

(declare-datatypes ((List!10554 0))(
  ( (Nil!10551) (Cons!10550 (h!11496 (_ BitVec 64)) (t!16782 List!10554)) )
))
(declare-fun arrayNoDuplicates!0 (array!34195 (_ BitVec 32) List!10554) Bool)

(assert (=> b!540397 (= res!335442 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10551))))

(declare-fun b!540398 () Bool)

(declare-fun res!335447 () Bool)

(assert (=> b!540398 (=> (not res!335447) (not e!313059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540398 (= res!335447 (validKeyInArray!0 k0!1998))))

(declare-fun b!540399 () Bool)

(declare-fun res!335438 () Bool)

(assert (=> b!540399 (=> (not res!335438) (not e!313057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34195 (_ BitVec 32)) Bool)

(assert (=> b!540399 (= res!335438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540400 () Bool)

(declare-fun res!335445 () Bool)

(assert (=> b!540400 (=> (not res!335445) (not e!313059))))

(assert (=> b!540400 (= res!335445 (validKeyInArray!0 (select (arr!16435 a!3154) j!147)))))

(declare-fun b!540401 () Bool)

(declare-fun res!335446 () Bool)

(assert (=> b!540401 (=> (not res!335446) (not e!313059))))

(assert (=> b!540401 (= res!335446 (and (= (size!16799 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16799 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16799 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49034 res!335439) b!540401))

(assert (= (and b!540401 res!335446) b!540400))

(assert (= (and b!540400 res!335445) b!540398))

(assert (= (and b!540398 res!335447) b!540396))

(assert (= (and b!540396 res!335441) b!540391))

(assert (= (and b!540391 res!335440) b!540399))

(assert (= (and b!540399 res!335438) b!540397))

(assert (= (and b!540397 res!335442) b!540395))

(assert (= (and b!540395 res!335444) b!540394))

(assert (= (and b!540394 res!335443) b!540392))

(assert (= (and b!540392 res!335437) b!540393))

(declare-fun m!519193 () Bool)

(assert (=> b!540392 m!519193))

(assert (=> b!540392 m!519193))

(declare-fun m!519195 () Bool)

(assert (=> b!540392 m!519195))

(assert (=> b!540392 m!519195))

(assert (=> b!540392 m!519193))

(declare-fun m!519197 () Bool)

(assert (=> b!540392 m!519197))

(declare-fun m!519199 () Bool)

(assert (=> start!49034 m!519199))

(declare-fun m!519201 () Bool)

(assert (=> start!49034 m!519201))

(declare-fun m!519203 () Bool)

(assert (=> b!540391 m!519203))

(declare-fun m!519205 () Bool)

(assert (=> b!540398 m!519205))

(declare-fun m!519207 () Bool)

(assert (=> b!540397 m!519207))

(declare-fun m!519209 () Bool)

(assert (=> b!540395 m!519209))

(assert (=> b!540395 m!519193))

(declare-fun m!519211 () Bool)

(assert (=> b!540399 m!519211))

(declare-fun m!519213 () Bool)

(assert (=> b!540396 m!519213))

(declare-fun m!519215 () Bool)

(assert (=> b!540393 m!519215))

(assert (=> b!540394 m!519193))

(assert (=> b!540394 m!519193))

(declare-fun m!519217 () Bool)

(assert (=> b!540394 m!519217))

(assert (=> b!540400 m!519193))

(assert (=> b!540400 m!519193))

(declare-fun m!519219 () Bool)

(assert (=> b!540400 m!519219))

(check-sat (not b!540400) (not b!540392) (not b!540394) (not b!540399) (not b!540396) (not b!540397) (not b!540398) (not start!49034) (not b!540391))
(check-sat)
(get-model)

(declare-fun b!540453 () Bool)

(declare-fun e!313085 () SeekEntryResult!4893)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540453 (= e!313085 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16435 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81667 () Bool)

(declare-fun e!313083 () Bool)

(assert (=> d!81667 e!313083))

(declare-fun c!62798 () Bool)

(declare-fun lt!247381 () SeekEntryResult!4893)

(get-info :version)

(assert (=> d!81667 (= c!62798 (and ((_ is Intermediate!4893) lt!247381) (undefined!5705 lt!247381)))))

(declare-fun e!313082 () SeekEntryResult!4893)

(assert (=> d!81667 (= lt!247381 e!313082)))

(declare-fun c!62797 () Bool)

(assert (=> d!81667 (= c!62797 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247380 () (_ BitVec 64))

(assert (=> d!81667 (= lt!247380 (select (arr!16435 a!3154) index!1177))))

(assert (=> d!81667 (validMask!0 mask!3216)))

(assert (=> d!81667 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16435 a!3154) j!147) a!3154 mask!3216) lt!247381)))

(declare-fun b!540454 () Bool)

(assert (=> b!540454 (and (bvsge (index!21798 lt!247381) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247381) (size!16799 a!3154)))))

(declare-fun e!313084 () Bool)

(assert (=> b!540454 (= e!313084 (= (select (arr!16435 a!3154) (index!21798 lt!247381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540455 () Bool)

(assert (=> b!540455 (= e!313083 (bvsge (x!50706 lt!247381) #b01111111111111111111111111111110))))

(declare-fun b!540456 () Bool)

(assert (=> b!540456 (= e!313085 (Intermediate!4893 false index!1177 x!1030))))

(declare-fun b!540457 () Bool)

(assert (=> b!540457 (= e!313082 e!313085)))

(declare-fun c!62796 () Bool)

(assert (=> b!540457 (= c!62796 (or (= lt!247380 (select (arr!16435 a!3154) j!147)) (= (bvadd lt!247380 lt!247380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540458 () Bool)

(assert (=> b!540458 (and (bvsge (index!21798 lt!247381) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247381) (size!16799 a!3154)))))

(declare-fun res!335487 () Bool)

(assert (=> b!540458 (= res!335487 (= (select (arr!16435 a!3154) (index!21798 lt!247381)) (select (arr!16435 a!3154) j!147)))))

(assert (=> b!540458 (=> res!335487 e!313084)))

(declare-fun e!313086 () Bool)

(assert (=> b!540458 (= e!313086 e!313084)))

(declare-fun b!540459 () Bool)

(assert (=> b!540459 (= e!313083 e!313086)))

(declare-fun res!335488 () Bool)

(assert (=> b!540459 (= res!335488 (and ((_ is Intermediate!4893) lt!247381) (not (undefined!5705 lt!247381)) (bvslt (x!50706 lt!247381) #b01111111111111111111111111111110) (bvsge (x!50706 lt!247381) #b00000000000000000000000000000000) (bvsge (x!50706 lt!247381) x!1030)))))

(assert (=> b!540459 (=> (not res!335488) (not e!313086))))

(declare-fun b!540460 () Bool)

(assert (=> b!540460 (and (bvsge (index!21798 lt!247381) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247381) (size!16799 a!3154)))))

(declare-fun res!335489 () Bool)

(assert (=> b!540460 (= res!335489 (= (select (arr!16435 a!3154) (index!21798 lt!247381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540460 (=> res!335489 e!313084)))

(declare-fun b!540461 () Bool)

(assert (=> b!540461 (= e!313082 (Intermediate!4893 true index!1177 x!1030))))

(assert (= (and d!81667 c!62797) b!540461))

(assert (= (and d!81667 (not c!62797)) b!540457))

(assert (= (and b!540457 c!62796) b!540456))

(assert (= (and b!540457 (not c!62796)) b!540453))

(assert (= (and d!81667 c!62798) b!540455))

(assert (= (and d!81667 (not c!62798)) b!540459))

(assert (= (and b!540459 res!335488) b!540458))

(assert (= (and b!540458 (not res!335487)) b!540460))

(assert (= (and b!540460 (not res!335489)) b!540454))

(declare-fun m!519249 () Bool)

(assert (=> b!540460 m!519249))

(declare-fun m!519251 () Bool)

(assert (=> b!540453 m!519251))

(assert (=> b!540453 m!519251))

(assert (=> b!540453 m!519193))

(declare-fun m!519253 () Bool)

(assert (=> b!540453 m!519253))

(assert (=> d!81667 m!519215))

(assert (=> d!81667 m!519199))

(assert (=> b!540454 m!519249))

(assert (=> b!540458 m!519249))

(assert (=> b!540394 d!81667))

(declare-fun d!81675 () Bool)

(assert (=> d!81675 (= (validKeyInArray!0 (select (arr!16435 a!3154) j!147)) (and (not (= (select (arr!16435 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16435 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540400 d!81675))

(declare-fun d!81677 () Bool)

(declare-fun res!335494 () Bool)

(declare-fun e!313091 () Bool)

(assert (=> d!81677 (=> res!335494 e!313091)))

(assert (=> d!81677 (= res!335494 (= (select (arr!16435 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81677 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313091)))

(declare-fun b!540466 () Bool)

(declare-fun e!313092 () Bool)

(assert (=> b!540466 (= e!313091 e!313092)))

(declare-fun res!335495 () Bool)

(assert (=> b!540466 (=> (not res!335495) (not e!313092))))

(assert (=> b!540466 (= res!335495 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16799 a!3154)))))

(declare-fun b!540467 () Bool)

(assert (=> b!540467 (= e!313092 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81677 (not res!335494)) b!540466))

(assert (= (and b!540466 res!335495) b!540467))

(declare-fun m!519255 () Bool)

(assert (=> d!81677 m!519255))

(declare-fun m!519257 () Bool)

(assert (=> b!540467 m!519257))

(assert (=> b!540396 d!81677))

(declare-fun b!540501 () Bool)

(declare-fun e!313118 () SeekEntryResult!4893)

(declare-fun e!313119 () SeekEntryResult!4893)

(assert (=> b!540501 (= e!313118 e!313119)))

(declare-fun lt!247390 () (_ BitVec 64))

(declare-fun lt!247389 () SeekEntryResult!4893)

(assert (=> b!540501 (= lt!247390 (select (arr!16435 a!3154) (index!21798 lt!247389)))))

(declare-fun c!62808 () Bool)

(assert (=> b!540501 (= c!62808 (= lt!247390 k0!1998))))

(declare-fun b!540502 () Bool)

(assert (=> b!540502 (= e!313118 Undefined!4893)))

(declare-fun d!81679 () Bool)

(declare-fun lt!247388 () SeekEntryResult!4893)

(assert (=> d!81679 (and (or ((_ is Undefined!4893) lt!247388) (not ((_ is Found!4893) lt!247388)) (and (bvsge (index!21797 lt!247388) #b00000000000000000000000000000000) (bvslt (index!21797 lt!247388) (size!16799 a!3154)))) (or ((_ is Undefined!4893) lt!247388) ((_ is Found!4893) lt!247388) (not ((_ is MissingZero!4893) lt!247388)) (and (bvsge (index!21796 lt!247388) #b00000000000000000000000000000000) (bvslt (index!21796 lt!247388) (size!16799 a!3154)))) (or ((_ is Undefined!4893) lt!247388) ((_ is Found!4893) lt!247388) ((_ is MissingZero!4893) lt!247388) (not ((_ is MissingVacant!4893) lt!247388)) (and (bvsge (index!21799 lt!247388) #b00000000000000000000000000000000) (bvslt (index!21799 lt!247388) (size!16799 a!3154)))) (or ((_ is Undefined!4893) lt!247388) (ite ((_ is Found!4893) lt!247388) (= (select (arr!16435 a!3154) (index!21797 lt!247388)) k0!1998) (ite ((_ is MissingZero!4893) lt!247388) (= (select (arr!16435 a!3154) (index!21796 lt!247388)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4893) lt!247388) (= (select (arr!16435 a!3154) (index!21799 lt!247388)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81679 (= lt!247388 e!313118)))

(declare-fun c!62809 () Bool)

(assert (=> d!81679 (= c!62809 (and ((_ is Intermediate!4893) lt!247389) (undefined!5705 lt!247389)))))

(assert (=> d!81679 (= lt!247389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81679 (validMask!0 mask!3216)))

(assert (=> d!81679 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247388)))

(declare-fun b!540503 () Bool)

(declare-fun e!313117 () SeekEntryResult!4893)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34195 (_ BitVec 32)) SeekEntryResult!4893)

(assert (=> b!540503 (= e!313117 (seekKeyOrZeroReturnVacant!0 (x!50706 lt!247389) (index!21798 lt!247389) (index!21798 lt!247389) k0!1998 a!3154 mask!3216))))

(declare-fun b!540504 () Bool)

(declare-fun c!62810 () Bool)

(assert (=> b!540504 (= c!62810 (= lt!247390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540504 (= e!313119 e!313117)))

(declare-fun b!540505 () Bool)

(assert (=> b!540505 (= e!313119 (Found!4893 (index!21798 lt!247389)))))

(declare-fun b!540506 () Bool)

(assert (=> b!540506 (= e!313117 (MissingZero!4893 (index!21798 lt!247389)))))

(assert (= (and d!81679 c!62809) b!540502))

(assert (= (and d!81679 (not c!62809)) b!540501))

(assert (= (and b!540501 c!62808) b!540505))

(assert (= (and b!540501 (not c!62808)) b!540504))

(assert (= (and b!540504 c!62810) b!540506))

(assert (= (and b!540504 (not c!62810)) b!540503))

(declare-fun m!519269 () Bool)

(assert (=> b!540501 m!519269))

(declare-fun m!519271 () Bool)

(assert (=> d!81679 m!519271))

(declare-fun m!519273 () Bool)

(assert (=> d!81679 m!519273))

(declare-fun m!519275 () Bool)

(assert (=> d!81679 m!519275))

(assert (=> d!81679 m!519271))

(declare-fun m!519277 () Bool)

(assert (=> d!81679 m!519277))

(assert (=> d!81679 m!519199))

(declare-fun m!519279 () Bool)

(assert (=> d!81679 m!519279))

(declare-fun m!519281 () Bool)

(assert (=> b!540503 m!519281))

(assert (=> b!540391 d!81679))

(declare-fun b!540544 () Bool)

(declare-fun e!313143 () Bool)

(declare-fun call!32021 () Bool)

(assert (=> b!540544 (= e!313143 call!32021)))

(declare-fun b!540545 () Bool)

(declare-fun e!313145 () Bool)

(declare-fun e!313146 () Bool)

(assert (=> b!540545 (= e!313145 e!313146)))

(declare-fun res!335527 () Bool)

(assert (=> b!540545 (=> (not res!335527) (not e!313146))))

(declare-fun e!313144 () Bool)

(assert (=> b!540545 (= res!335527 (not e!313144))))

(declare-fun res!335526 () Bool)

(assert (=> b!540545 (=> (not res!335526) (not e!313144))))

(assert (=> b!540545 (= res!335526 (validKeyInArray!0 (select (arr!16435 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540546 () Bool)

(declare-fun contains!2796 (List!10554 (_ BitVec 64)) Bool)

(assert (=> b!540546 (= e!313144 (contains!2796 Nil!10551 (select (arr!16435 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540547 () Bool)

(assert (=> b!540547 (= e!313146 e!313143)))

(declare-fun c!62822 () Bool)

(assert (=> b!540547 (= c!62822 (validKeyInArray!0 (select (arr!16435 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540548 () Bool)

(assert (=> b!540548 (= e!313143 call!32021)))

(declare-fun bm!32018 () Bool)

(assert (=> bm!32018 (= call!32021 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62822 (Cons!10550 (select (arr!16435 a!3154) #b00000000000000000000000000000000) Nil!10551) Nil!10551)))))

(declare-fun d!81699 () Bool)

(declare-fun res!335528 () Bool)

(assert (=> d!81699 (=> res!335528 e!313145)))

(assert (=> d!81699 (= res!335528 (bvsge #b00000000000000000000000000000000 (size!16799 a!3154)))))

(assert (=> d!81699 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10551) e!313145)))

(assert (= (and d!81699 (not res!335528)) b!540545))

(assert (= (and b!540545 res!335526) b!540546))

(assert (= (and b!540545 res!335527) b!540547))

(assert (= (and b!540547 c!62822) b!540548))

(assert (= (and b!540547 (not c!62822)) b!540544))

(assert (= (or b!540548 b!540544) bm!32018))

(assert (=> b!540545 m!519255))

(assert (=> b!540545 m!519255))

(declare-fun m!519289 () Bool)

(assert (=> b!540545 m!519289))

(assert (=> b!540546 m!519255))

(assert (=> b!540546 m!519255))

(declare-fun m!519291 () Bool)

(assert (=> b!540546 m!519291))

(assert (=> b!540547 m!519255))

(assert (=> b!540547 m!519255))

(assert (=> b!540547 m!519289))

(assert (=> bm!32018 m!519255))

(declare-fun m!519293 () Bool)

(assert (=> bm!32018 m!519293))

(assert (=> b!540397 d!81699))

(declare-fun d!81703 () Bool)

(assert (=> d!81703 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49034 d!81703))

(declare-fun d!81711 () Bool)

(assert (=> d!81711 (= (array_inv!12231 a!3154) (bvsge (size!16799 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49034 d!81711))

(declare-fun e!313183 () SeekEntryResult!4893)

(declare-fun b!540597 () Bool)

(assert (=> b!540597 (= e!313183 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16435 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!81713 () Bool)

(declare-fun e!313181 () Bool)

(assert (=> d!81713 e!313181))

(declare-fun c!62837 () Bool)

(declare-fun lt!247404 () SeekEntryResult!4893)

(assert (=> d!81713 (= c!62837 (and ((_ is Intermediate!4893) lt!247404) (undefined!5705 lt!247404)))))

(declare-fun e!313180 () SeekEntryResult!4893)

(assert (=> d!81713 (= lt!247404 e!313180)))

(declare-fun c!62836 () Bool)

(assert (=> d!81713 (= c!62836 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!247403 () (_ BitVec 64))

(assert (=> d!81713 (= lt!247403 (select (arr!16435 a!3154) (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216)))))

(assert (=> d!81713 (validMask!0 mask!3216)))

(assert (=> d!81713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) (select (arr!16435 a!3154) j!147) a!3154 mask!3216) lt!247404)))

(declare-fun b!540598 () Bool)

(assert (=> b!540598 (and (bvsge (index!21798 lt!247404) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247404) (size!16799 a!3154)))))

(declare-fun e!313182 () Bool)

(assert (=> b!540598 (= e!313182 (= (select (arr!16435 a!3154) (index!21798 lt!247404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!540599 () Bool)

(assert (=> b!540599 (= e!313181 (bvsge (x!50706 lt!247404) #b01111111111111111111111111111110))))

(declare-fun b!540600 () Bool)

(assert (=> b!540600 (= e!313183 (Intermediate!4893 false (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540601 () Bool)

(assert (=> b!540601 (= e!313180 e!313183)))

(declare-fun c!62835 () Bool)

(assert (=> b!540601 (= c!62835 (or (= lt!247403 (select (arr!16435 a!3154) j!147)) (= (bvadd lt!247403 lt!247403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540602 () Bool)

(assert (=> b!540602 (and (bvsge (index!21798 lt!247404) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247404) (size!16799 a!3154)))))

(declare-fun res!335553 () Bool)

(assert (=> b!540602 (= res!335553 (= (select (arr!16435 a!3154) (index!21798 lt!247404)) (select (arr!16435 a!3154) j!147)))))

(assert (=> b!540602 (=> res!335553 e!313182)))

(declare-fun e!313184 () Bool)

(assert (=> b!540602 (= e!313184 e!313182)))

(declare-fun b!540603 () Bool)

(assert (=> b!540603 (= e!313181 e!313184)))

(declare-fun res!335554 () Bool)

(assert (=> b!540603 (= res!335554 (and ((_ is Intermediate!4893) lt!247404) (not (undefined!5705 lt!247404)) (bvslt (x!50706 lt!247404) #b01111111111111111111111111111110) (bvsge (x!50706 lt!247404) #b00000000000000000000000000000000) (bvsge (x!50706 lt!247404) #b00000000000000000000000000000000)))))

(assert (=> b!540603 (=> (not res!335554) (not e!313184))))

(declare-fun b!540604 () Bool)

(assert (=> b!540604 (and (bvsge (index!21798 lt!247404) #b00000000000000000000000000000000) (bvslt (index!21798 lt!247404) (size!16799 a!3154)))))

(declare-fun res!335555 () Bool)

(assert (=> b!540604 (= res!335555 (= (select (arr!16435 a!3154) (index!21798 lt!247404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540604 (=> res!335555 e!313182)))

(declare-fun b!540605 () Bool)

(assert (=> b!540605 (= e!313180 (Intermediate!4893 true (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(assert (= (and d!81713 c!62836) b!540605))

(assert (= (and d!81713 (not c!62836)) b!540601))

(assert (= (and b!540601 c!62835) b!540600))

(assert (= (and b!540601 (not c!62835)) b!540597))

(assert (= (and d!81713 c!62837) b!540599))

(assert (= (and d!81713 (not c!62837)) b!540603))

(assert (= (and b!540603 res!335554) b!540602))

(assert (= (and b!540602 (not res!335553)) b!540604))

(assert (= (and b!540604 (not res!335555)) b!540598))

(declare-fun m!519311 () Bool)

(assert (=> b!540604 m!519311))

(assert (=> b!540597 m!519195))

(declare-fun m!519313 () Bool)

(assert (=> b!540597 m!519313))

(assert (=> b!540597 m!519313))

(assert (=> b!540597 m!519193))

(declare-fun m!519315 () Bool)

(assert (=> b!540597 m!519315))

(assert (=> d!81713 m!519195))

(declare-fun m!519317 () Bool)

(assert (=> d!81713 m!519317))

(assert (=> d!81713 m!519199))

(assert (=> b!540598 m!519311))

(assert (=> b!540602 m!519311))

(assert (=> b!540392 d!81713))

(declare-fun d!81715 () Bool)

(declare-fun lt!247425 () (_ BitVec 32))

(declare-fun lt!247424 () (_ BitVec 32))

(assert (=> d!81715 (= lt!247425 (bvmul (bvxor lt!247424 (bvlshr lt!247424 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81715 (= lt!247424 ((_ extract 31 0) (bvand (bvxor (select (arr!16435 a!3154) j!147) (bvlshr (select (arr!16435 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81715 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!335556 (let ((h!11498 ((_ extract 31 0) (bvand (bvxor (select (arr!16435 a!3154) j!147) (bvlshr (select (arr!16435 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50711 (bvmul (bvxor h!11498 (bvlshr h!11498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50711 (bvlshr x!50711 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!335556 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!335556 #b00000000000000000000000000000000))))))

(assert (=> d!81715 (= (toIndex!0 (select (arr!16435 a!3154) j!147) mask!3216) (bvand (bvxor lt!247425 (bvlshr lt!247425 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!540392 d!81715))

(declare-fun d!81717 () Bool)

(assert (=> d!81717 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540398 d!81717))

(declare-fun d!81721 () Bool)

(declare-fun res!335578 () Bool)

(declare-fun e!313214 () Bool)

(assert (=> d!81721 (=> res!335578 e!313214)))

(assert (=> d!81721 (= res!335578 (bvsge #b00000000000000000000000000000000 (size!16799 a!3154)))))

(assert (=> d!81721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313214)))

(declare-fun b!540647 () Bool)

(declare-fun e!313215 () Bool)

(declare-fun e!313216 () Bool)

(assert (=> b!540647 (= e!313215 e!313216)))

(declare-fun lt!247444 () (_ BitVec 64))

(assert (=> b!540647 (= lt!247444 (select (arr!16435 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16890 0))(
  ( (Unit!16891) )
))
(declare-fun lt!247445 () Unit!16890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34195 (_ BitVec 64) (_ BitVec 32)) Unit!16890)

(assert (=> b!540647 (= lt!247445 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247444 #b00000000000000000000000000000000))))

(assert (=> b!540647 (arrayContainsKey!0 a!3154 lt!247444 #b00000000000000000000000000000000)))

(declare-fun lt!247443 () Unit!16890)

(assert (=> b!540647 (= lt!247443 lt!247445)))

(declare-fun res!335577 () Bool)

(assert (=> b!540647 (= res!335577 (= (seekEntryOrOpen!0 (select (arr!16435 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4893 #b00000000000000000000000000000000)))))

(assert (=> b!540647 (=> (not res!335577) (not e!313216))))

(declare-fun b!540648 () Bool)

(assert (=> b!540648 (= e!313214 e!313215)))

(declare-fun c!62849 () Bool)

(assert (=> b!540648 (= c!62849 (validKeyInArray!0 (select (arr!16435 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540649 () Bool)

(declare-fun call!32033 () Bool)

(assert (=> b!540649 (= e!313215 call!32033)))

(declare-fun bm!32030 () Bool)

(assert (=> bm!32030 (= call!32033 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!540650 () Bool)

(assert (=> b!540650 (= e!313216 call!32033)))

(assert (= (and d!81721 (not res!335578)) b!540648))

(assert (= (and b!540648 c!62849) b!540647))

(assert (= (and b!540648 (not c!62849)) b!540649))

(assert (= (and b!540647 res!335577) b!540650))

(assert (= (or b!540650 b!540649) bm!32030))

(assert (=> b!540647 m!519255))

(declare-fun m!519343 () Bool)

(assert (=> b!540647 m!519343))

(declare-fun m!519345 () Bool)

(assert (=> b!540647 m!519345))

(assert (=> b!540647 m!519255))

(declare-fun m!519347 () Bool)

(assert (=> b!540647 m!519347))

(assert (=> b!540648 m!519255))

(assert (=> b!540648 m!519255))

(assert (=> b!540648 m!519289))

(declare-fun m!519349 () Bool)

(assert (=> bm!32030 m!519349))

(assert (=> b!540399 d!81721))

(check-sat (not b!540453) (not b!540503) (not b!540597) (not b!540545) (not d!81713) (not b!540648) (not b!540546) (not bm!32030) (not b!540547) (not b!540647) (not d!81679) (not b!540467) (not bm!32018) (not d!81667))
(check-sat)
