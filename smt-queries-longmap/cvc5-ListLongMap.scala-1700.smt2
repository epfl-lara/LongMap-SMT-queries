; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31088 () Bool)

(assert start!31088)

(declare-fun b!312855 () Bool)

(declare-fun e!195024 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312855 (= e!195024 (bvsge resX!52 #b01111111111111111111111111111110))))

(declare-fun b!312856 () Bool)

(declare-fun res!169315 () Bool)

(declare-fun e!195023 () Bool)

(assert (=> b!312856 (=> (not res!169315) (not e!195023))))

(declare-datatypes ((array!15990 0))(
  ( (array!15991 (arr!7577 (Array (_ BitVec 32) (_ BitVec 64))) (size!7929 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15990)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15990 (_ BitVec 32)) Bool)

(assert (=> b!312856 (= res!169315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312857 () Bool)

(assert (=> b!312857 (= e!195023 e!195024)))

(declare-fun res!169317 () Bool)

(assert (=> b!312857 (=> (not res!169317) (not e!195024))))

(declare-datatypes ((SeekEntryResult!2717 0))(
  ( (MissingZero!2717 (index!13044 (_ BitVec 32))) (Found!2717 (index!13045 (_ BitVec 32))) (Intermediate!2717 (undefined!3529 Bool) (index!13046 (_ BitVec 32)) (x!31250 (_ BitVec 32))) (Undefined!2717) (MissingVacant!2717 (index!13047 (_ BitVec 32))) )
))
(declare-fun lt!153348 () SeekEntryResult!2717)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15990 (_ BitVec 32)) SeekEntryResult!2717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312857 (= res!169317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153348))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312857 (= lt!153348 (Intermediate!2717 false resIndex!52 resX!52))))

(declare-fun b!312858 () Bool)

(declare-fun res!169310 () Bool)

(assert (=> b!312858 (=> (not res!169310) (not e!195023))))

(declare-fun arrayContainsKey!0 (array!15990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312858 (= res!169310 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312859 () Bool)

(declare-fun res!169314 () Bool)

(assert (=> b!312859 (=> (not res!169314) (not e!195023))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15990 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!312859 (= res!169314 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2717 i!1240)))))

(declare-fun b!312860 () Bool)

(declare-fun res!169316 () Bool)

(assert (=> b!312860 (=> (not res!169316) (not e!195023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312860 (= res!169316 (validKeyInArray!0 k!2441))))

(declare-fun b!312861 () Bool)

(declare-fun res!169309 () Bool)

(assert (=> b!312861 (=> (not res!169309) (not e!195023))))

(assert (=> b!312861 (= res!169309 (and (= (size!7929 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7929 a!3293))))))

(declare-fun b!312862 () Bool)

(declare-fun res!169313 () Bool)

(assert (=> b!312862 (=> (not res!169313) (not e!195024))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312862 (= res!169313 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153348))))

(declare-fun b!312863 () Bool)

(declare-fun res!169312 () Bool)

(assert (=> b!312863 (=> (not res!169312) (not e!195024))))

(assert (=> b!312863 (= res!169312 (and (= (select (arr!7577 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7929 a!3293))))))

(declare-fun res!169311 () Bool)

(assert (=> start!31088 (=> (not res!169311) (not e!195023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31088 (= res!169311 (validMask!0 mask!3709))))

(assert (=> start!31088 e!195023))

(declare-fun array_inv!5540 (array!15990) Bool)

(assert (=> start!31088 (array_inv!5540 a!3293)))

(assert (=> start!31088 true))

(assert (= (and start!31088 res!169311) b!312861))

(assert (= (and b!312861 res!169309) b!312860))

(assert (= (and b!312860 res!169316) b!312858))

(assert (= (and b!312858 res!169310) b!312859))

(assert (= (and b!312859 res!169314) b!312856))

(assert (= (and b!312856 res!169315) b!312857))

(assert (= (and b!312857 res!169317) b!312863))

(assert (= (and b!312863 res!169312) b!312862))

(assert (= (and b!312862 res!169313) b!312855))

(declare-fun m!322997 () Bool)

(assert (=> b!312859 m!322997))

(declare-fun m!322999 () Bool)

(assert (=> start!31088 m!322999))

(declare-fun m!323001 () Bool)

(assert (=> start!31088 m!323001))

(declare-fun m!323003 () Bool)

(assert (=> b!312858 m!323003))

(declare-fun m!323005 () Bool)

(assert (=> b!312862 m!323005))

(declare-fun m!323007 () Bool)

(assert (=> b!312856 m!323007))

(declare-fun m!323009 () Bool)

(assert (=> b!312863 m!323009))

(declare-fun m!323011 () Bool)

(assert (=> b!312860 m!323011))

(declare-fun m!323013 () Bool)

(assert (=> b!312857 m!323013))

(assert (=> b!312857 m!323013))

(declare-fun m!323015 () Bool)

(assert (=> b!312857 m!323015))

(push 1)

(assert (not b!312857))

(assert (not b!312856))

(assert (not b!312858))

(assert (not start!31088))

(assert (not b!312862))

(assert (not b!312859))

(assert (not b!312860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68481 () Bool)

(assert (=> d!68481 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31088 d!68481))

(declare-fun d!68487 () Bool)

(assert (=> d!68487 (= (array_inv!5540 a!3293) (bvsge (size!7929 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31088 d!68487))

(declare-fun bm!25930 () Bool)

(declare-fun call!25933 () Bool)

(assert (=> bm!25930 (= call!25933 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!312938 () Bool)

(declare-fun e!195059 () Bool)

(assert (=> b!312938 (= e!195059 call!25933)))

(declare-fun b!312939 () Bool)

(declare-fun e!195060 () Bool)

(assert (=> b!312939 (= e!195060 call!25933)))

(declare-fun b!312940 () Bool)

(assert (=> b!312940 (= e!195060 e!195059)))

(declare-fun lt!153370 () (_ BitVec 64))

(assert (=> b!312940 (= lt!153370 (select (arr!7577 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9667 0))(
  ( (Unit!9668) )
))
(declare-fun lt!153372 () Unit!9667)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15990 (_ BitVec 64) (_ BitVec 32)) Unit!9667)

(assert (=> b!312940 (= lt!153372 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153370 #b00000000000000000000000000000000))))

(assert (=> b!312940 (arrayContainsKey!0 a!3293 lt!153370 #b00000000000000000000000000000000)))

(declare-fun lt!153371 () Unit!9667)

(assert (=> b!312940 (= lt!153371 lt!153372)))

(declare-fun res!169382 () Bool)

(assert (=> b!312940 (= res!169382 (= (seekEntryOrOpen!0 (select (arr!7577 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2717 #b00000000000000000000000000000000)))))

(assert (=> b!312940 (=> (not res!169382) (not e!195059))))

(declare-fun d!68489 () Bool)

(declare-fun res!169383 () Bool)

(declare-fun e!195061 () Bool)

(assert (=> d!68489 (=> res!169383 e!195061)))

(assert (=> d!68489 (= res!169383 (bvsge #b00000000000000000000000000000000 (size!7929 a!3293)))))

(assert (=> d!68489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195061)))

(declare-fun b!312941 () Bool)

(assert (=> b!312941 (= e!195061 e!195060)))

(declare-fun c!49383 () Bool)

(assert (=> b!312941 (= c!49383 (validKeyInArray!0 (select (arr!7577 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68489 (not res!169383)) b!312941))

(assert (= (and b!312941 c!49383) b!312940))

(assert (= (and b!312941 (not c!49383)) b!312939))

(assert (= (and b!312940 res!169382) b!312938))

(assert (= (or b!312938 b!312939) bm!25930))

(declare-fun m!323069 () Bool)

(assert (=> bm!25930 m!323069))

(declare-fun m!323071 () Bool)

(assert (=> b!312940 m!323071))

(declare-fun m!323073 () Bool)

(assert (=> b!312940 m!323073))

(declare-fun m!323075 () Bool)

(assert (=> b!312940 m!323075))

(assert (=> b!312940 m!323071))

(declare-fun m!323077 () Bool)

(assert (=> b!312940 m!323077))

(assert (=> b!312941 m!323071))

(assert (=> b!312941 m!323071))

(declare-fun m!323079 () Bool)

(assert (=> b!312941 m!323079))

(assert (=> b!312856 d!68489))

(declare-fun d!68493 () Bool)

(assert (=> d!68493 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312860 d!68493))

(declare-fun d!68495 () Bool)

(declare-fun res!169388 () Bool)

(declare-fun e!195066 () Bool)

(assert (=> d!68495 (=> res!169388 e!195066)))

(assert (=> d!68495 (= res!169388 (= (select (arr!7577 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68495 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195066)))

(declare-fun b!312946 () Bool)

(declare-fun e!195067 () Bool)

(assert (=> b!312946 (= e!195066 e!195067)))

(declare-fun res!169389 () Bool)

(assert (=> b!312946 (=> (not res!169389) (not e!195067))))

(assert (=> b!312946 (= res!169389 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7929 a!3293)))))

(declare-fun b!312947 () Bool)

(assert (=> b!312947 (= e!195067 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68495 (not res!169388)) b!312946))

(assert (= (and b!312946 res!169389) b!312947))

(assert (=> d!68495 m!323071))

(declare-fun m!323081 () Bool)

(assert (=> b!312947 m!323081))

(assert (=> b!312858 d!68495))

(declare-fun d!68497 () Bool)

(declare-fun lt!153401 () SeekEntryResult!2717)

(assert (=> d!68497 (and (or (is-Undefined!2717 lt!153401) (not (is-Found!2717 lt!153401)) (and (bvsge (index!13045 lt!153401) #b00000000000000000000000000000000) (bvslt (index!13045 lt!153401) (size!7929 a!3293)))) (or (is-Undefined!2717 lt!153401) (is-Found!2717 lt!153401) (not (is-MissingZero!2717 lt!153401)) (and (bvsge (index!13044 lt!153401) #b00000000000000000000000000000000) (bvslt (index!13044 lt!153401) (size!7929 a!3293)))) (or (is-Undefined!2717 lt!153401) (is-Found!2717 lt!153401) (is-MissingZero!2717 lt!153401) (not (is-MissingVacant!2717 lt!153401)) (and (bvsge (index!13047 lt!153401) #b00000000000000000000000000000000) (bvslt (index!13047 lt!153401) (size!7929 a!3293)))) (or (is-Undefined!2717 lt!153401) (ite (is-Found!2717 lt!153401) (= (select (arr!7577 a!3293) (index!13045 lt!153401)) k!2441) (ite (is-MissingZero!2717 lt!153401) (= (select (arr!7577 a!3293) (index!13044 lt!153401)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2717 lt!153401) (= (select (arr!7577 a!3293) (index!13047 lt!153401)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195098 () SeekEntryResult!2717)

(assert (=> d!68497 (= lt!153401 e!195098)))

(declare-fun c!49408 () Bool)

(declare-fun lt!153400 () SeekEntryResult!2717)

(assert (=> d!68497 (= c!49408 (and (is-Intermediate!2717 lt!153400) (undefined!3529 lt!153400)))))

(assert (=> d!68497 (= lt!153400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68497 (validMask!0 mask!3709)))

(assert (=> d!68497 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153401)))

(declare-fun b!313005 () Bool)

(assert (=> b!313005 (= e!195098 Undefined!2717)))

(declare-fun b!313006 () Bool)

(declare-fun c!49410 () Bool)

(declare-fun lt!153402 () (_ BitVec 64))

(assert (=> b!313006 (= c!49410 (= lt!153402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195100 () SeekEntryResult!2717)

(declare-fun e!195099 () SeekEntryResult!2717)

(assert (=> b!313006 (= e!195100 e!195099)))

(declare-fun b!313007 () Bool)

(assert (=> b!313007 (= e!195099 (MissingZero!2717 (index!13046 lt!153400)))))

(declare-fun b!313008 () Bool)

(assert (=> b!313008 (= e!195100 (Found!2717 (index!13046 lt!153400)))))

(declare-fun b!313009 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15990 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!313009 (= e!195099 (seekKeyOrZeroReturnVacant!0 (x!31250 lt!153400) (index!13046 lt!153400) (index!13046 lt!153400) k!2441 a!3293 mask!3709))))

(declare-fun b!313010 () Bool)

(assert (=> b!313010 (= e!195098 e!195100)))

(assert (=> b!313010 (= lt!153402 (select (arr!7577 a!3293) (index!13046 lt!153400)))))

(declare-fun c!49409 () Bool)

(assert (=> b!313010 (= c!49409 (= lt!153402 k!2441))))

(assert (= (and d!68497 c!49408) b!313005))

(assert (= (and d!68497 (not c!49408)) b!313010))

(assert (= (and b!313010 c!49409) b!313008))

(assert (= (and b!313010 (not c!49409)) b!313006))

(assert (= (and b!313006 c!49410) b!313007))

(assert (= (and b!313006 (not c!49410)) b!313009))

(declare-fun m!323101 () Bool)

(assert (=> d!68497 m!323101))

(declare-fun m!323103 () Bool)

(assert (=> d!68497 m!323103))

(assert (=> d!68497 m!323013))

(assert (=> d!68497 m!323015))

(assert (=> d!68497 m!322999))

(declare-fun m!323105 () Bool)

(assert (=> d!68497 m!323105))

(assert (=> d!68497 m!323013))

(declare-fun m!323107 () Bool)

(assert (=> b!313009 m!323107))

(declare-fun m!323109 () Bool)

(assert (=> b!313010 m!323109))

(assert (=> b!312859 d!68497))

(declare-fun b!313074 () Bool)

(declare-fun e!195144 () Bool)

(declare-fun e!195143 () Bool)

(assert (=> b!313074 (= e!195144 e!195143)))

(declare-fun res!169429 () Bool)

(declare-fun lt!153423 () SeekEntryResult!2717)

(assert (=> b!313074 (= res!169429 (and (is-Intermediate!2717 lt!153423) (not (undefined!3529 lt!153423)) (bvslt (x!31250 lt!153423) #b01111111111111111111111111111110) (bvsge (x!31250 lt!153423) #b00000000000000000000000000000000) (bvsge (x!31250 lt!153423) x!1427)))))

(assert (=> b!313074 (=> (not res!169429) (not e!195143))))

(declare-fun b!313075 () Bool)

(assert (=> b!313075 (and (bvsge (index!13046 lt!153423) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153423) (size!7929 a!3293)))))

(declare-fun e!195142 () Bool)

(assert (=> b!313075 (= e!195142 (= (select (arr!7577 a!3293) (index!13046 lt!153423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313076 () Bool)

(assert (=> b!313076 (and (bvsge (index!13046 lt!153423) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153423) (size!7929 a!3293)))))

(declare-fun res!169427 () Bool)

(assert (=> b!313076 (= res!169427 (= (select (arr!7577 a!3293) (index!13046 lt!153423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313076 (=> res!169427 e!195142)))

(declare-fun b!313077 () Bool)

(assert (=> b!313077 (= e!195144 (bvsge (x!31250 lt!153423) #b01111111111111111111111111111110))))

(declare-fun b!313078 () Bool)

(declare-fun e!195145 () SeekEntryResult!2717)

(assert (=> b!313078 (= e!195145 (Intermediate!2717 false index!1781 x!1427))))

(declare-fun d!68505 () Bool)

(assert (=> d!68505 e!195144))

(declare-fun c!49429 () Bool)

(assert (=> d!68505 (= c!49429 (and (is-Intermediate!2717 lt!153423) (undefined!3529 lt!153423)))))

(declare-fun e!195141 () SeekEntryResult!2717)

(assert (=> d!68505 (= lt!153423 e!195141)))

(declare-fun c!49430 () Bool)

(assert (=> d!68505 (= c!49430 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153422 () (_ BitVec 64))

(assert (=> d!68505 (= lt!153422 (select (arr!7577 a!3293) index!1781))))

(assert (=> d!68505 (validMask!0 mask!3709)))

(assert (=> d!68505 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153423)))

(declare-fun b!313079 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313079 (= e!195145 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313080 () Bool)

(assert (=> b!313080 (and (bvsge (index!13046 lt!153423) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153423) (size!7929 a!3293)))))

(declare-fun res!169428 () Bool)

(assert (=> b!313080 (= res!169428 (= (select (arr!7577 a!3293) (index!13046 lt!153423)) k!2441))))

(assert (=> b!313080 (=> res!169428 e!195142)))

(assert (=> b!313080 (= e!195143 e!195142)))

(declare-fun b!313081 () Bool)

(assert (=> b!313081 (= e!195141 (Intermediate!2717 true index!1781 x!1427))))

(declare-fun b!313082 () Bool)

(assert (=> b!313082 (= e!195141 e!195145)))

(declare-fun c!49431 () Bool)

(assert (=> b!313082 (= c!49431 (or (= lt!153422 k!2441) (= (bvadd lt!153422 lt!153422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68505 c!49430) b!313081))

(assert (= (and d!68505 (not c!49430)) b!313082))

(assert (= (and b!313082 c!49431) b!313078))

(assert (= (and b!313082 (not c!49431)) b!313079))

(assert (= (and d!68505 c!49429) b!313077))

(assert (= (and d!68505 (not c!49429)) b!313074))

(assert (= (and b!313074 res!169429) b!313080))

(assert (= (and b!313080 (not res!169428)) b!313076))

(assert (= (and b!313076 (not res!169427)) b!313075))

(declare-fun m!323133 () Bool)

(assert (=> d!68505 m!323133))

(assert (=> d!68505 m!322999))

(declare-fun m!323135 () Bool)

(assert (=> b!313079 m!323135))

(assert (=> b!313079 m!323135))

(declare-fun m!323137 () Bool)

(assert (=> b!313079 m!323137))

(declare-fun m!323139 () Bool)

(assert (=> b!313076 m!323139))

(assert (=> b!313075 m!323139))

(assert (=> b!313080 m!323139))

(assert (=> b!312862 d!68505))

(declare-fun b!313104 () Bool)

(declare-fun e!195160 () Bool)

(declare-fun e!195159 () Bool)

(assert (=> b!313104 (= e!195160 e!195159)))

(declare-fun res!169435 () Bool)

(declare-fun lt!153433 () SeekEntryResult!2717)

(assert (=> b!313104 (= res!169435 (and (is-Intermediate!2717 lt!153433) (not (undefined!3529 lt!153433)) (bvslt (x!31250 lt!153433) #b01111111111111111111111111111110) (bvsge (x!31250 lt!153433) #b00000000000000000000000000000000) (bvsge (x!31250 lt!153433) #b00000000000000000000000000000000)))))

(assert (=> b!313104 (=> (not res!169435) (not e!195159))))

(declare-fun b!313105 () Bool)

(assert (=> b!313105 (and (bvsge (index!13046 lt!153433) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153433) (size!7929 a!3293)))))

(declare-fun e!195158 () Bool)

(assert (=> b!313105 (= e!195158 (= (select (arr!7577 a!3293) (index!13046 lt!153433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313106 () Bool)

(assert (=> b!313106 (and (bvsge (index!13046 lt!153433) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153433) (size!7929 a!3293)))))

(declare-fun res!169433 () Bool)

(assert (=> b!313106 (= res!169433 (= (select (arr!7577 a!3293) (index!13046 lt!153433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313106 (=> res!169433 e!195158)))

(declare-fun b!313107 () Bool)

(assert (=> b!313107 (= e!195160 (bvsge (x!31250 lt!153433) #b01111111111111111111111111111110))))

(declare-fun b!313108 () Bool)

(declare-fun e!195161 () SeekEntryResult!2717)

(assert (=> b!313108 (= e!195161 (Intermediate!2717 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68519 () Bool)

(assert (=> d!68519 e!195160))

(declare-fun c!49441 () Bool)

(assert (=> d!68519 (= c!49441 (and (is-Intermediate!2717 lt!153433) (undefined!3529 lt!153433)))))

(declare-fun e!195157 () SeekEntryResult!2717)

(assert (=> d!68519 (= lt!153433 e!195157)))

(declare-fun c!49442 () Bool)

(assert (=> d!68519 (= c!49442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153432 () (_ BitVec 64))

(assert (=> d!68519 (= lt!153432 (select (arr!7577 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68519 (validMask!0 mask!3709)))

(assert (=> d!68519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153433)))

(declare-fun b!313109 () Bool)

(assert (=> b!313109 (= e!195161 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313110 () Bool)

(assert (=> b!313110 (and (bvsge (index!13046 lt!153433) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153433) (size!7929 a!3293)))))

(declare-fun res!169434 () Bool)

(assert (=> b!313110 (= res!169434 (= (select (arr!7577 a!3293) (index!13046 lt!153433)) k!2441))))

(assert (=> b!313110 (=> res!169434 e!195158)))

(assert (=> b!313110 (= e!195159 e!195158)))

(declare-fun b!313111 () Bool)

(assert (=> b!313111 (= e!195157 (Intermediate!2717 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313112 () Bool)

(assert (=> b!313112 (= e!195157 e!195161)))

(declare-fun c!49443 () Bool)

(assert (=> b!313112 (= c!49443 (or (= lt!153432 k!2441) (= (bvadd lt!153432 lt!153432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68519 c!49442) b!313111))

(assert (= (and d!68519 (not c!49442)) b!313112))

(assert (= (and b!313112 c!49443) b!313108))

(assert (= (and b!313112 (not c!49443)) b!313109))

(assert (= (and d!68519 c!49441) b!313107))

(assert (= (and d!68519 (not c!49441)) b!313104))

(assert (= (and b!313104 res!169435) b!313110))

(assert (= (and b!313110 (not res!169434)) b!313106))

(assert (= (and b!313106 (not res!169433)) b!313105))

(assert (=> d!68519 m!323013))

(declare-fun m!323149 () Bool)

(assert (=> d!68519 m!323149))

(assert (=> d!68519 m!322999))

(assert (=> b!313109 m!323013))

(declare-fun m!323151 () Bool)

(assert (=> b!313109 m!323151))

(assert (=> b!313109 m!323151))

(declare-fun m!323153 () Bool)

(assert (=> b!313109 m!323153))

(declare-fun m!323155 () Bool)

(assert (=> b!313106 m!323155))

(assert (=> b!313105 m!323155))

(assert (=> b!313110 m!323155))

(assert (=> b!312857 d!68519))

(declare-fun d!68523 () Bool)

(declare-fun lt!153450 () (_ BitVec 32))

(declare-fun lt!153449 () (_ BitVec 32))

(assert (=> d!68523 (= lt!153450 (bvmul (bvxor lt!153449 (bvlshr lt!153449 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68523 (= lt!153449 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68523 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169437 (let ((h!5348 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31258 (bvmul (bvxor h!5348 (bvlshr h!5348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31258 (bvlshr x!31258 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169437 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169437 #b00000000000000000000000000000000))))))

(assert (=> d!68523 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153450 (bvlshr lt!153450 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!312857 d!68523))

(push 1)

