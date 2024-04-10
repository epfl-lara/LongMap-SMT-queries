; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33300 () Bool)

(assert start!33300)

(declare-fun b!331161 () Bool)

(declare-fun res!182568 () Bool)

(declare-fun e!203172 () Bool)

(assert (=> b!331161 (=> (not res!182568) (not e!203172))))

(declare-datatypes ((array!16908 0))(
  ( (array!16909 (arr!7995 (Array (_ BitVec 32) (_ BitVec 64))) (size!8347 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16908)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3126 0))(
  ( (MissingZero!3126 (index!14680 (_ BitVec 32))) (Found!3126 (index!14681 (_ BitVec 32))) (Intermediate!3126 (undefined!3938 Bool) (index!14682 (_ BitVec 32)) (x!32966 (_ BitVec 32))) (Undefined!3126) (MissingVacant!3126 (index!14683 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16908 (_ BitVec 32)) SeekEntryResult!3126)

(assert (=> b!331161 (= res!182568 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3126 i!1250)))))

(declare-fun b!331162 () Bool)

(declare-fun res!182567 () Bool)

(assert (=> b!331162 (=> (not res!182567) (not e!203172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331162 (= res!182567 (validKeyInArray!0 k0!2497))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!331163 () Bool)

(declare-fun e!203173 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!158733 () SeekEntryResult!3126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16908 (_ BitVec 32)) SeekEntryResult!3126)

(assert (=> b!331163 (= e!203173 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)) mask!3777) lt!158733)))))

(declare-datatypes ((Unit!10331 0))(
  ( (Unit!10332) )
))
(declare-fun lt!158731 () Unit!10331)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16908 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10331)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331163 (= lt!158731 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331164 () Bool)

(declare-fun res!182569 () Bool)

(assert (=> b!331164 (=> (not res!182569) (not e!203172))))

(declare-fun arrayContainsKey!0 (array!16908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331164 (= res!182569 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331165 () Bool)

(declare-fun res!182566 () Bool)

(assert (=> b!331165 (=> (not res!182566) (not e!203172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16908 (_ BitVec 32)) Bool)

(assert (=> b!331165 (= res!182566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331166 () Bool)

(declare-fun e!203170 () Bool)

(assert (=> b!331166 (= e!203170 e!203173)))

(declare-fun res!182564 () Bool)

(assert (=> b!331166 (=> (not res!182564) (not e!203173))))

(declare-fun lt!158732 () SeekEntryResult!3126)

(assert (=> b!331166 (= res!182564 (and (= lt!158733 lt!158732) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7995 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (=> b!331166 (= lt!158733 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!331167 () Bool)

(declare-fun res!182565 () Bool)

(assert (=> b!331167 (=> (not res!182565) (not e!203170))))

(assert (=> b!331167 (= res!182565 (and (= (select (arr!7995 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8347 a!3305))))))

(declare-fun b!331168 () Bool)

(declare-fun res!182563 () Bool)

(assert (=> b!331168 (=> (not res!182563) (not e!203172))))

(assert (=> b!331168 (= res!182563 (and (= (size!8347 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8347 a!3305))))))

(declare-fun res!182571 () Bool)

(assert (=> start!33300 (=> (not res!182571) (not e!203172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33300 (= res!182571 (validMask!0 mask!3777))))

(assert (=> start!33300 e!203172))

(declare-fun array_inv!5958 (array!16908) Bool)

(assert (=> start!33300 (array_inv!5958 a!3305)))

(assert (=> start!33300 true))

(declare-fun b!331169 () Bool)

(assert (=> b!331169 (= e!203172 e!203170)))

(declare-fun res!182570 () Bool)

(assert (=> b!331169 (=> (not res!182570) (not e!203170))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331169 (= res!182570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158732))))

(assert (=> b!331169 (= lt!158732 (Intermediate!3126 false resIndex!58 resX!58))))

(assert (= (and start!33300 res!182571) b!331168))

(assert (= (and b!331168 res!182563) b!331162))

(assert (= (and b!331162 res!182567) b!331164))

(assert (= (and b!331164 res!182569) b!331161))

(assert (= (and b!331161 res!182568) b!331165))

(assert (= (and b!331165 res!182566) b!331169))

(assert (= (and b!331169 res!182570) b!331167))

(assert (= (and b!331167 res!182565) b!331166))

(assert (= (and b!331166 res!182564) b!331163))

(declare-fun m!336161 () Bool)

(assert (=> b!331167 m!336161))

(declare-fun m!336163 () Bool)

(assert (=> b!331169 m!336163))

(assert (=> b!331169 m!336163))

(declare-fun m!336165 () Bool)

(assert (=> b!331169 m!336165))

(declare-fun m!336167 () Bool)

(assert (=> b!331162 m!336167))

(declare-fun m!336169 () Bool)

(assert (=> start!33300 m!336169))

(declare-fun m!336171 () Bool)

(assert (=> start!33300 m!336171))

(declare-fun m!336173 () Bool)

(assert (=> b!331166 m!336173))

(declare-fun m!336175 () Bool)

(assert (=> b!331166 m!336175))

(declare-fun m!336177 () Bool)

(assert (=> b!331161 m!336177))

(declare-fun m!336179 () Bool)

(assert (=> b!331164 m!336179))

(declare-fun m!336181 () Bool)

(assert (=> b!331165 m!336181))

(declare-fun m!336183 () Bool)

(assert (=> b!331163 m!336183))

(declare-fun m!336185 () Bool)

(assert (=> b!331163 m!336185))

(declare-fun m!336187 () Bool)

(assert (=> b!331163 m!336187))

(assert (=> b!331163 m!336187))

(declare-fun m!336189 () Bool)

(assert (=> b!331163 m!336189))

(check-sat (not b!331169) (not b!331164) (not b!331166) (not b!331162) (not start!33300) (not b!331161) (not b!331165) (not b!331163))
(check-sat)
(get-model)

(declare-fun b!331215 () Bool)

(declare-fun e!203198 () SeekEntryResult!3126)

(assert (=> b!331215 (= e!203198 (Intermediate!3126 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!331216 () Bool)

(declare-fun e!203197 () SeekEntryResult!3126)

(assert (=> b!331216 (= e!203197 (Intermediate!3126 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!70373 () Bool)

(declare-fun e!203200 () Bool)

(assert (=> d!70373 e!203200))

(declare-fun c!51951 () Bool)

(declare-fun lt!158748 () SeekEntryResult!3126)

(get-info :version)

(assert (=> d!70373 (= c!51951 (and ((_ is Intermediate!3126) lt!158748) (undefined!3938 lt!158748)))))

(assert (=> d!70373 (= lt!158748 e!203198)))

(declare-fun c!51950 () Bool)

(assert (=> d!70373 (= c!51950 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158747 () (_ BitVec 64))

(assert (=> d!70373 (= lt!158747 (select (arr!7995 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70373 (validMask!0 mask!3777)))

(assert (=> d!70373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158748)))

(declare-fun b!331217 () Bool)

(assert (=> b!331217 (and (bvsge (index!14682 lt!158748) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158748) (size!8347 a!3305)))))

(declare-fun res!182607 () Bool)

(assert (=> b!331217 (= res!182607 (= (select (arr!7995 a!3305) (index!14682 lt!158748)) k0!2497))))

(declare-fun e!203199 () Bool)

(assert (=> b!331217 (=> res!182607 e!203199)))

(declare-fun e!203196 () Bool)

(assert (=> b!331217 (= e!203196 e!203199)))

(declare-fun b!331218 () Bool)

(assert (=> b!331218 (= e!203198 e!203197)))

(declare-fun c!51949 () Bool)

(assert (=> b!331218 (= c!51949 (or (= lt!158747 k0!2497) (= (bvadd lt!158747 lt!158747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331219 () Bool)

(assert (=> b!331219 (and (bvsge (index!14682 lt!158748) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158748) (size!8347 a!3305)))))

(assert (=> b!331219 (= e!203199 (= (select (arr!7995 a!3305) (index!14682 lt!158748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331220 () Bool)

(assert (=> b!331220 (and (bvsge (index!14682 lt!158748) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158748) (size!8347 a!3305)))))

(declare-fun res!182605 () Bool)

(assert (=> b!331220 (= res!182605 (= (select (arr!7995 a!3305) (index!14682 lt!158748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!331220 (=> res!182605 e!203199)))

(declare-fun b!331221 () Bool)

(assert (=> b!331221 (= e!203197 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!331222 () Bool)

(assert (=> b!331222 (= e!203200 (bvsge (x!32966 lt!158748) #b01111111111111111111111111111110))))

(declare-fun b!331223 () Bool)

(assert (=> b!331223 (= e!203200 e!203196)))

(declare-fun res!182606 () Bool)

(assert (=> b!331223 (= res!182606 (and ((_ is Intermediate!3126) lt!158748) (not (undefined!3938 lt!158748)) (bvslt (x!32966 lt!158748) #b01111111111111111111111111111110) (bvsge (x!32966 lt!158748) #b00000000000000000000000000000000) (bvsge (x!32966 lt!158748) #b00000000000000000000000000000000)))))

(assert (=> b!331223 (=> (not res!182606) (not e!203196))))

(assert (= (and d!70373 c!51950) b!331215))

(assert (= (and d!70373 (not c!51950)) b!331218))

(assert (= (and b!331218 c!51949) b!331216))

(assert (= (and b!331218 (not c!51949)) b!331221))

(assert (= (and d!70373 c!51951) b!331222))

(assert (= (and d!70373 (not c!51951)) b!331223))

(assert (= (and b!331223 res!182606) b!331217))

(assert (= (and b!331217 (not res!182607)) b!331220))

(assert (= (and b!331220 (not res!182605)) b!331219))

(declare-fun m!336221 () Bool)

(assert (=> b!331219 m!336221))

(assert (=> d!70373 m!336163))

(declare-fun m!336223 () Bool)

(assert (=> d!70373 m!336223))

(assert (=> d!70373 m!336169))

(assert (=> b!331220 m!336221))

(assert (=> b!331221 m!336163))

(declare-fun m!336225 () Bool)

(assert (=> b!331221 m!336225))

(assert (=> b!331221 m!336225))

(declare-fun m!336227 () Bool)

(assert (=> b!331221 m!336227))

(assert (=> b!331217 m!336221))

(assert (=> b!331169 d!70373))

(declare-fun d!70375 () Bool)

(declare-fun lt!158754 () (_ BitVec 32))

(declare-fun lt!158753 () (_ BitVec 32))

(assert (=> d!70375 (= lt!158754 (bvmul (bvxor lt!158753 (bvlshr lt!158753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70375 (= lt!158753 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70375 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182608 (let ((h!5424 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32969 (bvmul (bvxor h!5424 (bvlshr h!5424 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32969 (bvlshr x!32969 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182608 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182608 #b00000000000000000000000000000000))))))

(assert (=> d!70375 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158754 (bvlshr lt!158754 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!331169 d!70375))

(declare-fun d!70379 () Bool)

(declare-fun res!182613 () Bool)

(declare-fun e!203205 () Bool)

(assert (=> d!70379 (=> res!182613 e!203205)))

(assert (=> d!70379 (= res!182613 (= (select (arr!7995 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70379 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!203205)))

(declare-fun b!331228 () Bool)

(declare-fun e!203206 () Bool)

(assert (=> b!331228 (= e!203205 e!203206)))

(declare-fun res!182614 () Bool)

(assert (=> b!331228 (=> (not res!182614) (not e!203206))))

(assert (=> b!331228 (= res!182614 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8347 a!3305)))))

(declare-fun b!331229 () Bool)

(assert (=> b!331229 (= e!203206 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70379 (not res!182613)) b!331228))

(assert (= (and b!331228 res!182614) b!331229))

(declare-fun m!336229 () Bool)

(assert (=> d!70379 m!336229))

(declare-fun m!336231 () Bool)

(assert (=> b!331229 m!336231))

(assert (=> b!331164 d!70379))

(declare-fun b!331230 () Bool)

(declare-fun e!203209 () SeekEntryResult!3126)

(assert (=> b!331230 (= e!203209 (Intermediate!3126 true index!1840 x!1490))))

(declare-fun b!331231 () Bool)

(declare-fun e!203208 () SeekEntryResult!3126)

(assert (=> b!331231 (= e!203208 (Intermediate!3126 false index!1840 x!1490))))

(declare-fun d!70381 () Bool)

(declare-fun e!203211 () Bool)

(assert (=> d!70381 e!203211))

(declare-fun c!51954 () Bool)

(declare-fun lt!158756 () SeekEntryResult!3126)

(assert (=> d!70381 (= c!51954 (and ((_ is Intermediate!3126) lt!158756) (undefined!3938 lt!158756)))))

(assert (=> d!70381 (= lt!158756 e!203209)))

(declare-fun c!51953 () Bool)

(assert (=> d!70381 (= c!51953 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158755 () (_ BitVec 64))

(assert (=> d!70381 (= lt!158755 (select (arr!7995 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305))) index!1840))))

(assert (=> d!70381 (validMask!0 mask!3777)))

(assert (=> d!70381 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)) mask!3777) lt!158756)))

(declare-fun b!331232 () Bool)

(assert (=> b!331232 (and (bvsge (index!14682 lt!158756) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158756) (size!8347 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)))))))

(declare-fun res!182617 () Bool)

(assert (=> b!331232 (= res!182617 (= (select (arr!7995 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305))) (index!14682 lt!158756)) k0!2497))))

(declare-fun e!203210 () Bool)

(assert (=> b!331232 (=> res!182617 e!203210)))

(declare-fun e!203207 () Bool)

(assert (=> b!331232 (= e!203207 e!203210)))

(declare-fun b!331233 () Bool)

(assert (=> b!331233 (= e!203209 e!203208)))

(declare-fun c!51952 () Bool)

(assert (=> b!331233 (= c!51952 (or (= lt!158755 k0!2497) (= (bvadd lt!158755 lt!158755) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331234 () Bool)

(assert (=> b!331234 (and (bvsge (index!14682 lt!158756) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158756) (size!8347 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)))))))

(assert (=> b!331234 (= e!203210 (= (select (arr!7995 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305))) (index!14682 lt!158756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331235 () Bool)

(assert (=> b!331235 (and (bvsge (index!14682 lt!158756) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158756) (size!8347 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)))))))

(declare-fun res!182615 () Bool)

(assert (=> b!331235 (= res!182615 (= (select (arr!7995 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305))) (index!14682 lt!158756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!331235 (=> res!182615 e!203210)))

(declare-fun b!331236 () Bool)

(assert (=> b!331236 (= e!203208 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)) mask!3777))))

(declare-fun b!331237 () Bool)

(assert (=> b!331237 (= e!203211 (bvsge (x!32966 lt!158756) #b01111111111111111111111111111110))))

(declare-fun b!331238 () Bool)

(assert (=> b!331238 (= e!203211 e!203207)))

(declare-fun res!182616 () Bool)

(assert (=> b!331238 (= res!182616 (and ((_ is Intermediate!3126) lt!158756) (not (undefined!3938 lt!158756)) (bvslt (x!32966 lt!158756) #b01111111111111111111111111111110) (bvsge (x!32966 lt!158756) #b00000000000000000000000000000000) (bvsge (x!32966 lt!158756) x!1490)))))

(assert (=> b!331238 (=> (not res!182616) (not e!203207))))

(assert (= (and d!70381 c!51953) b!331230))

(assert (= (and d!70381 (not c!51953)) b!331233))

(assert (= (and b!331233 c!51952) b!331231))

(assert (= (and b!331233 (not c!51952)) b!331236))

(assert (= (and d!70381 c!51954) b!331237))

(assert (= (and d!70381 (not c!51954)) b!331238))

(assert (= (and b!331238 res!182616) b!331232))

(assert (= (and b!331232 (not res!182617)) b!331235))

(assert (= (and b!331235 (not res!182615)) b!331234))

(declare-fun m!336233 () Bool)

(assert (=> b!331234 m!336233))

(declare-fun m!336235 () Bool)

(assert (=> d!70381 m!336235))

(assert (=> d!70381 m!336169))

(assert (=> b!331235 m!336233))

(assert (=> b!331236 m!336187))

(assert (=> b!331236 m!336187))

(declare-fun m!336237 () Bool)

(assert (=> b!331236 m!336237))

(assert (=> b!331232 m!336233))

(assert (=> b!331163 d!70381))

(declare-fun b!331300 () Bool)

(declare-fun e!203251 () Unit!10331)

(declare-fun Unit!10335 () Unit!10331)

(assert (=> b!331300 (= e!203251 Unit!10335)))

(declare-fun c!51977 () Bool)

(assert (=> b!331300 (= c!51977 (not (= resIndex!58 (nextIndex!0 index!1840 x!1490 mask!3777))))))

(declare-fun lt!158782 () Unit!10331)

(declare-fun e!203249 () Unit!10331)

(assert (=> b!331300 (= lt!158782 e!203249)))

(assert (=> b!331300 (= (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58)))

(declare-fun lt!158785 () Unit!10331)

(declare-fun Unit!10336 () Unit!10331)

(assert (=> b!331300 (= lt!158785 Unit!10336)))

(assert (=> b!331300 (= (select (arr!7995 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!331301 () Bool)

(declare-fun e!203252 () Unit!10331)

(declare-fun Unit!10337 () Unit!10331)

(assert (=> b!331301 (= e!203252 Unit!10337)))

(declare-fun e!203248 () (_ BitVec 32))

(declare-fun b!331302 () Bool)

(assert (=> b!331302 (= e!203248 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!331303 () Bool)

(declare-fun e!203253 () Unit!10331)

(declare-fun Unit!10338 () Unit!10331)

(assert (=> b!331303 (= e!203253 Unit!10338)))

(declare-fun call!26178 () SeekEntryResult!3126)

(assert (=> b!331303 (= call!26178 (Intermediate!3126 false (nextIndex!0 index!1840 x!1490 mask!3777) resX!58))))

(declare-fun lt!158783 () Unit!10331)

(declare-fun Unit!10339 () Unit!10331)

(assert (=> b!331303 (= lt!158783 Unit!10339)))

(assert (=> b!331303 false))

(declare-fun b!331304 () Bool)

(assert (=> b!331304 false))

(declare-fun Unit!10340 () Unit!10331)

(assert (=> b!331304 (= e!203252 Unit!10340)))

(declare-fun b!331305 () Bool)

(declare-fun call!26179 () (_ BitVec 32))

(assert (=> b!331305 (= e!203248 call!26179)))

(declare-fun d!70383 () Bool)

(declare-fun e!203250 () Bool)

(assert (=> d!70383 e!203250))

(declare-fun res!182636 () Bool)

(assert (=> d!70383 (=> (not res!182636) (not e!203250))))

(assert (=> d!70383 (= res!182636 (and (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8347 a!3305))))))

(declare-fun lt!158784 () Unit!10331)

(assert (=> d!70383 (= lt!158784 e!203251)))

(declare-fun c!51978 () Bool)

(assert (=> d!70383 (= c!51978 (= (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(assert (=> d!70383 (validMask!0 mask!3777)))

(assert (=> d!70383 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777) lt!158784)))

(declare-fun bm!26175 () Bool)

(assert (=> bm!26175 (= call!26179 (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!331306 () Bool)

(assert (=> b!331306 (= e!203251 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) call!26179 resIndex!58 resX!58 mask!3777))))

(declare-fun b!331307 () Bool)

(declare-fun Unit!10341 () Unit!10331)

(assert (=> b!331307 (= e!203249 Unit!10341)))

(declare-fun c!51981 () Bool)

(declare-fun b!331308 () Bool)

(assert (=> b!331308 (= c!51981 (or (= (select (arr!7995 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7995 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!331308 (= e!203249 e!203253)))

(declare-fun bm!26176 () Bool)

(assert (=> bm!26176 (= call!26178 (seekKeyOrZeroOrLongMinValue!0 (ite c!51981 (bvadd #b00000000000000000000000000000001 x!1490) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001)) e!203248 k0!2497 a!3305 mask!3777))))

(declare-fun c!51979 () Bool)

(assert (=> bm!26176 (= c!51979 c!51981)))

(declare-fun b!331309 () Bool)

(assert (=> b!331309 (= e!203250 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 (array!16909 (store (arr!7995 a!3305) i!1250 k0!2497) (size!8347 a!3305)) mask!3777) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun b!331310 () Bool)

(declare-fun Unit!10342 () Unit!10331)

(assert (=> b!331310 (= e!203253 Unit!10342)))

(declare-fun c!51980 () Bool)

(assert (=> b!331310 (= c!51980 ((_ is Intermediate!3126) call!26178))))

(declare-fun lt!158786 () Unit!10331)

(assert (=> b!331310 (= lt!158786 e!203252)))

(assert (=> b!331310 false))

(assert (= (and d!70383 c!51978) b!331300))

(assert (= (and d!70383 (not c!51978)) b!331306))

(assert (= (and b!331300 c!51977) b!331308))

(assert (= (and b!331300 (not c!51977)) b!331307))

(assert (= (and b!331308 c!51981) b!331303))

(assert (= (and b!331308 (not c!51981)) b!331310))

(assert (= (and b!331310 c!51980) b!331301))

(assert (= (and b!331310 (not c!51980)) b!331304))

(assert (= (or b!331303 b!331310) bm!26176))

(assert (= (and bm!26176 c!51979) b!331302))

(assert (= (and bm!26176 (not c!51979)) b!331305))

(assert (= (or b!331305 b!331306) bm!26175))

(assert (= (and d!70383 res!182636) b!331309))

(assert (=> b!331308 m!336187))

(declare-fun m!336259 () Bool)

(assert (=> b!331308 m!336259))

(assert (=> bm!26175 m!336187))

(declare-fun m!336261 () Bool)

(assert (=> bm!26175 m!336261))

(declare-fun m!336263 () Bool)

(assert (=> b!331306 m!336263))

(assert (=> b!331300 m!336187))

(assert (=> b!331300 m!336259))

(assert (=> d!70383 m!336169))

(declare-fun m!336265 () Bool)

(assert (=> bm!26176 m!336265))

(assert (=> b!331309 m!336183))

(assert (=> b!331309 m!336187))

(declare-fun m!336267 () Bool)

(assert (=> b!331309 m!336267))

(assert (=> b!331309 m!336187))

(declare-fun m!336269 () Bool)

(assert (=> b!331309 m!336269))

(assert (=> b!331163 d!70383))

(declare-fun d!70391 () Bool)

(declare-fun lt!158795 () (_ BitVec 32))

(assert (=> d!70391 (and (bvsge lt!158795 #b00000000000000000000000000000000) (bvslt lt!158795 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70391 (= lt!158795 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70391 (validMask!0 mask!3777)))

(assert (=> d!70391 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158795)))

(declare-fun bs!11444 () Bool)

(assert (= bs!11444 d!70391))

(declare-fun m!336271 () Bool)

(assert (=> bs!11444 m!336271))

(assert (=> bs!11444 m!336169))

(assert (=> b!331163 d!70391))

(declare-fun d!70395 () Bool)

(assert (=> d!70395 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33300 d!70395))

(declare-fun d!70399 () Bool)

(assert (=> d!70399 (= (array_inv!5958 a!3305) (bvsge (size!8347 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33300 d!70399))

(declare-fun b!331386 () Bool)

(declare-fun c!52012 () Bool)

(declare-fun lt!158833 () (_ BitVec 64))

(assert (=> b!331386 (= c!52012 (= lt!158833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203298 () SeekEntryResult!3126)

(declare-fun e!203300 () SeekEntryResult!3126)

(assert (=> b!331386 (= e!203298 e!203300)))

(declare-fun lt!158831 () SeekEntryResult!3126)

(declare-fun b!331387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16908 (_ BitVec 32)) SeekEntryResult!3126)

(assert (=> b!331387 (= e!203300 (seekKeyOrZeroReturnVacant!0 (x!32966 lt!158831) (index!14682 lt!158831) (index!14682 lt!158831) k0!2497 a!3305 mask!3777))))

(declare-fun b!331388 () Bool)

(declare-fun e!203299 () SeekEntryResult!3126)

(assert (=> b!331388 (= e!203299 e!203298)))

(assert (=> b!331388 (= lt!158833 (select (arr!7995 a!3305) (index!14682 lt!158831)))))

(declare-fun c!52013 () Bool)

(assert (=> b!331388 (= c!52013 (= lt!158833 k0!2497))))

(declare-fun b!331389 () Bool)

(assert (=> b!331389 (= e!203298 (Found!3126 (index!14682 lt!158831)))))

(declare-fun b!331390 () Bool)

(assert (=> b!331390 (= e!203299 Undefined!3126)))

(declare-fun d!70401 () Bool)

(declare-fun lt!158832 () SeekEntryResult!3126)

(assert (=> d!70401 (and (or ((_ is Undefined!3126) lt!158832) (not ((_ is Found!3126) lt!158832)) (and (bvsge (index!14681 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14681 lt!158832) (size!8347 a!3305)))) (or ((_ is Undefined!3126) lt!158832) ((_ is Found!3126) lt!158832) (not ((_ is MissingZero!3126) lt!158832)) (and (bvsge (index!14680 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14680 lt!158832) (size!8347 a!3305)))) (or ((_ is Undefined!3126) lt!158832) ((_ is Found!3126) lt!158832) ((_ is MissingZero!3126) lt!158832) (not ((_ is MissingVacant!3126) lt!158832)) (and (bvsge (index!14683 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14683 lt!158832) (size!8347 a!3305)))) (or ((_ is Undefined!3126) lt!158832) (ite ((_ is Found!3126) lt!158832) (= (select (arr!7995 a!3305) (index!14681 lt!158832)) k0!2497) (ite ((_ is MissingZero!3126) lt!158832) (= (select (arr!7995 a!3305) (index!14680 lt!158832)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3126) lt!158832) (= (select (arr!7995 a!3305) (index!14683 lt!158832)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70401 (= lt!158832 e!203299)))

(declare-fun c!52014 () Bool)

(assert (=> d!70401 (= c!52014 (and ((_ is Intermediate!3126) lt!158831) (undefined!3938 lt!158831)))))

(assert (=> d!70401 (= lt!158831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70401 (validMask!0 mask!3777)))

(assert (=> d!70401 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158832)))

(declare-fun b!331391 () Bool)

(assert (=> b!331391 (= e!203300 (MissingZero!3126 (index!14682 lt!158831)))))

(assert (= (and d!70401 c!52014) b!331390))

(assert (= (and d!70401 (not c!52014)) b!331388))

(assert (= (and b!331388 c!52013) b!331389))

(assert (= (and b!331388 (not c!52013)) b!331386))

(assert (= (and b!331386 c!52012) b!331391))

(assert (= (and b!331386 (not c!52012)) b!331387))

(declare-fun m!336311 () Bool)

(assert (=> b!331387 m!336311))

(declare-fun m!336313 () Bool)

(assert (=> b!331388 m!336313))

(assert (=> d!70401 m!336163))

(assert (=> d!70401 m!336165))

(declare-fun m!336315 () Bool)

(assert (=> d!70401 m!336315))

(declare-fun m!336317 () Bool)

(assert (=> d!70401 m!336317))

(assert (=> d!70401 m!336163))

(assert (=> d!70401 m!336169))

(declare-fun m!336319 () Bool)

(assert (=> d!70401 m!336319))

(assert (=> b!331161 d!70401))

(declare-fun d!70413 () Bool)

(assert (=> d!70413 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!331162 d!70413))

(declare-fun b!331409 () Bool)

(declare-fun e!203313 () Bool)

(declare-fun call!26185 () Bool)

(assert (=> b!331409 (= e!203313 call!26185)))

(declare-fun b!331410 () Bool)

(declare-fun e!203314 () Bool)

(assert (=> b!331410 (= e!203314 e!203313)))

(declare-fun lt!158844 () (_ BitVec 64))

(assert (=> b!331410 (= lt!158844 (select (arr!7995 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158842 () Unit!10331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16908 (_ BitVec 64) (_ BitVec 32)) Unit!10331)

(assert (=> b!331410 (= lt!158842 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158844 #b00000000000000000000000000000000))))

(assert (=> b!331410 (arrayContainsKey!0 a!3305 lt!158844 #b00000000000000000000000000000000)))

(declare-fun lt!158843 () Unit!10331)

(assert (=> b!331410 (= lt!158843 lt!158842)))

(declare-fun res!182659 () Bool)

(assert (=> b!331410 (= res!182659 (= (seekEntryOrOpen!0 (select (arr!7995 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3126 #b00000000000000000000000000000000)))))

(assert (=> b!331410 (=> (not res!182659) (not e!203313))))

(declare-fun bm!26182 () Bool)

(assert (=> bm!26182 (= call!26185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!331411 () Bool)

(declare-fun e!203312 () Bool)

(assert (=> b!331411 (= e!203312 e!203314)))

(declare-fun c!52020 () Bool)

(assert (=> b!331411 (= c!52020 (validKeyInArray!0 (select (arr!7995 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!331412 () Bool)

(assert (=> b!331412 (= e!203314 call!26185)))

(declare-fun d!70415 () Bool)

(declare-fun res!182660 () Bool)

(assert (=> d!70415 (=> res!182660 e!203312)))

(assert (=> d!70415 (= res!182660 (bvsge #b00000000000000000000000000000000 (size!8347 a!3305)))))

(assert (=> d!70415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203312)))

(assert (= (and d!70415 (not res!182660)) b!331411))

(assert (= (and b!331411 c!52020) b!331410))

(assert (= (and b!331411 (not c!52020)) b!331412))

(assert (= (and b!331410 res!182659) b!331409))

(assert (= (or b!331409 b!331412) bm!26182))

(assert (=> b!331410 m!336229))

(declare-fun m!336327 () Bool)

(assert (=> b!331410 m!336327))

(declare-fun m!336329 () Bool)

(assert (=> b!331410 m!336329))

(assert (=> b!331410 m!336229))

(declare-fun m!336331 () Bool)

(assert (=> b!331410 m!336331))

(declare-fun m!336333 () Bool)

(assert (=> bm!26182 m!336333))

(assert (=> b!331411 m!336229))

(assert (=> b!331411 m!336229))

(declare-fun m!336335 () Bool)

(assert (=> b!331411 m!336335))

(assert (=> b!331165 d!70415))

(declare-fun b!331413 () Bool)

(declare-fun e!203317 () SeekEntryResult!3126)

(assert (=> b!331413 (= e!203317 (Intermediate!3126 true index!1840 x!1490))))

(declare-fun b!331414 () Bool)

(declare-fun e!203316 () SeekEntryResult!3126)

(assert (=> b!331414 (= e!203316 (Intermediate!3126 false index!1840 x!1490))))

(declare-fun d!70423 () Bool)

(declare-fun e!203319 () Bool)

(assert (=> d!70423 e!203319))

(declare-fun c!52023 () Bool)

(declare-fun lt!158846 () SeekEntryResult!3126)

(assert (=> d!70423 (= c!52023 (and ((_ is Intermediate!3126) lt!158846) (undefined!3938 lt!158846)))))

(assert (=> d!70423 (= lt!158846 e!203317)))

(declare-fun c!52022 () Bool)

(assert (=> d!70423 (= c!52022 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158845 () (_ BitVec 64))

(assert (=> d!70423 (= lt!158845 (select (arr!7995 a!3305) index!1840))))

(assert (=> d!70423 (validMask!0 mask!3777)))

(assert (=> d!70423 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158846)))

(declare-fun b!331415 () Bool)

(assert (=> b!331415 (and (bvsge (index!14682 lt!158846) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158846) (size!8347 a!3305)))))

(declare-fun res!182663 () Bool)

(assert (=> b!331415 (= res!182663 (= (select (arr!7995 a!3305) (index!14682 lt!158846)) k0!2497))))

(declare-fun e!203318 () Bool)

(assert (=> b!331415 (=> res!182663 e!203318)))

(declare-fun e!203315 () Bool)

(assert (=> b!331415 (= e!203315 e!203318)))

(declare-fun b!331416 () Bool)

(assert (=> b!331416 (= e!203317 e!203316)))

(declare-fun c!52021 () Bool)

(assert (=> b!331416 (= c!52021 (or (= lt!158845 k0!2497) (= (bvadd lt!158845 lt!158845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331417 () Bool)

(assert (=> b!331417 (and (bvsge (index!14682 lt!158846) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158846) (size!8347 a!3305)))))

(assert (=> b!331417 (= e!203318 (= (select (arr!7995 a!3305) (index!14682 lt!158846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331418 () Bool)

(assert (=> b!331418 (and (bvsge (index!14682 lt!158846) #b00000000000000000000000000000000) (bvslt (index!14682 lt!158846) (size!8347 a!3305)))))

(declare-fun res!182661 () Bool)

(assert (=> b!331418 (= res!182661 (= (select (arr!7995 a!3305) (index!14682 lt!158846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!331418 (=> res!182661 e!203318)))

(declare-fun b!331419 () Bool)

(assert (=> b!331419 (= e!203316 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!331420 () Bool)

(assert (=> b!331420 (= e!203319 (bvsge (x!32966 lt!158846) #b01111111111111111111111111111110))))

(declare-fun b!331421 () Bool)

(assert (=> b!331421 (= e!203319 e!203315)))

(declare-fun res!182662 () Bool)

(assert (=> b!331421 (= res!182662 (and ((_ is Intermediate!3126) lt!158846) (not (undefined!3938 lt!158846)) (bvslt (x!32966 lt!158846) #b01111111111111111111111111111110) (bvsge (x!32966 lt!158846) #b00000000000000000000000000000000) (bvsge (x!32966 lt!158846) x!1490)))))

(assert (=> b!331421 (=> (not res!182662) (not e!203315))))

(assert (= (and d!70423 c!52022) b!331413))

(assert (= (and d!70423 (not c!52022)) b!331416))

(assert (= (and b!331416 c!52021) b!331414))

(assert (= (and b!331416 (not c!52021)) b!331419))

(assert (= (and d!70423 c!52023) b!331420))

(assert (= (and d!70423 (not c!52023)) b!331421))

(assert (= (and b!331421 res!182662) b!331415))

(assert (= (and b!331415 (not res!182663)) b!331418))

(assert (= (and b!331418 (not res!182661)) b!331417))

(declare-fun m!336337 () Bool)

(assert (=> b!331417 m!336337))

(assert (=> d!70423 m!336173))

(assert (=> d!70423 m!336169))

(assert (=> b!331418 m!336337))

(assert (=> b!331419 m!336187))

(assert (=> b!331419 m!336187))

(declare-fun m!336339 () Bool)

(assert (=> b!331419 m!336339))

(assert (=> b!331415 m!336337))

(assert (=> b!331166 d!70423))

(check-sat (not b!331419) (not bm!26176) (not d!70381) (not b!331236) (not d!70373) (not bm!26182) (not d!70401) (not d!70383) (not d!70391) (not b!331309) (not b!331221) (not b!331229) (not b!331306) (not bm!26175) (not d!70423) (not b!331410) (not b!331387) (not b!331411))
(check-sat)
