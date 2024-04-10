; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86310 () Bool)

(assert start!86310)

(declare-fun b!999095 () Bool)

(declare-fun e!563338 () Bool)

(declare-fun e!563341 () Bool)

(assert (=> b!999095 (= e!563338 e!563341)))

(declare-fun res!668734 () Bool)

(assert (=> b!999095 (=> (not res!668734) (not e!563341))))

(declare-datatypes ((array!63162 0))(
  ( (array!63163 (arr!30408 (Array (_ BitVec 32) (_ BitVec 64))) (size!30910 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63162)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9340 0))(
  ( (MissingZero!9340 (index!39731 (_ BitVec 32))) (Found!9340 (index!39732 (_ BitVec 32))) (Intermediate!9340 (undefined!10152 Bool) (index!39733 (_ BitVec 32)) (x!87162 (_ BitVec 32))) (Undefined!9340) (MissingVacant!9340 (index!39734 (_ BitVec 32))) )
))
(declare-fun lt!441905 () SeekEntryResult!9340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63162 (_ BitVec 32)) SeekEntryResult!9340)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999095 (= res!668734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!441905))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999095 (= lt!441905 (Intermediate!9340 false resIndex!38 resX!38))))

(declare-fun b!999096 () Bool)

(declare-fun res!668737 () Bool)

(declare-fun e!563339 () Bool)

(assert (=> b!999096 (=> (not res!668737) (not e!563339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999096 (= res!668737 (validKeyInArray!0 (select (arr!30408 a!3219) j!170)))))

(declare-fun b!999097 () Bool)

(declare-fun res!668738 () Bool)

(assert (=> b!999097 (=> (not res!668738) (not e!563338))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999097 (= res!668738 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30910 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30910 a!3219))))))

(declare-fun b!999098 () Bool)

(declare-fun res!668736 () Bool)

(assert (=> b!999098 (=> (not res!668736) (not e!563339))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!999098 (= res!668736 (validKeyInArray!0 k!2224))))

(declare-fun b!999099 () Bool)

(declare-fun res!668742 () Bool)

(assert (=> b!999099 (=> (not res!668742) (not e!563338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63162 (_ BitVec 32)) Bool)

(assert (=> b!999099 (= res!668742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999100 () Bool)

(declare-fun res!668739 () Bool)

(assert (=> b!999100 (=> (not res!668739) (not e!563341))))

(assert (=> b!999100 (= res!668739 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!441905))))

(declare-fun b!999101 () Bool)

(assert (=> b!999101 (= e!563339 e!563338)))

(declare-fun res!668741 () Bool)

(assert (=> b!999101 (=> (not res!668741) (not e!563338))))

(declare-fun lt!441904 () SeekEntryResult!9340)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999101 (= res!668741 (or (= lt!441904 (MissingVacant!9340 i!1194)) (= lt!441904 (MissingZero!9340 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63162 (_ BitVec 32)) SeekEntryResult!9340)

(assert (=> b!999101 (= lt!441904 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999102 () Bool)

(declare-fun res!668735 () Bool)

(assert (=> b!999102 (=> (not res!668735) (not e!563339))))

(assert (=> b!999102 (= res!668735 (and (= (size!30910 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30910 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30910 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999103 () Bool)

(declare-fun lt!441903 () (_ BitVec 32))

(assert (=> b!999103 (= e!563341 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441903 #b00000000000000000000000000000000) (bvsge lt!441903 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(assert (=> b!999103 (= lt!441903 (toIndex!0 (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999104 () Bool)

(declare-fun res!668732 () Bool)

(assert (=> b!999104 (=> (not res!668732) (not e!563339))))

(declare-fun arrayContainsKey!0 (array!63162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999104 (= res!668732 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999105 () Bool)

(declare-fun res!668740 () Bool)

(assert (=> b!999105 (=> (not res!668740) (not e!563338))))

(declare-datatypes ((List!21084 0))(
  ( (Nil!21081) (Cons!21080 (h!22254 (_ BitVec 64)) (t!30085 List!21084)) )
))
(declare-fun arrayNoDuplicates!0 (array!63162 (_ BitVec 32) List!21084) Bool)

(assert (=> b!999105 (= res!668740 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21081))))

(declare-fun res!668733 () Bool)

(assert (=> start!86310 (=> (not res!668733) (not e!563339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86310 (= res!668733 (validMask!0 mask!3464))))

(assert (=> start!86310 e!563339))

(declare-fun array_inv!23532 (array!63162) Bool)

(assert (=> start!86310 (array_inv!23532 a!3219)))

(assert (=> start!86310 true))

(assert (= (and start!86310 res!668733) b!999102))

(assert (= (and b!999102 res!668735) b!999096))

(assert (= (and b!999096 res!668737) b!999098))

(assert (= (and b!999098 res!668736) b!999104))

(assert (= (and b!999104 res!668732) b!999101))

(assert (= (and b!999101 res!668741) b!999099))

(assert (= (and b!999099 res!668742) b!999105))

(assert (= (and b!999105 res!668740) b!999097))

(assert (= (and b!999097 res!668738) b!999095))

(assert (= (and b!999095 res!668734) b!999100))

(assert (= (and b!999100 res!668739) b!999103))

(declare-fun m!925463 () Bool)

(assert (=> b!999098 m!925463))

(declare-fun m!925465 () Bool)

(assert (=> b!999101 m!925465))

(declare-fun m!925467 () Bool)

(assert (=> b!999096 m!925467))

(assert (=> b!999096 m!925467))

(declare-fun m!925469 () Bool)

(assert (=> b!999096 m!925469))

(declare-fun m!925471 () Bool)

(assert (=> b!999103 m!925471))

(declare-fun m!925473 () Bool)

(assert (=> b!999103 m!925473))

(assert (=> b!999103 m!925473))

(declare-fun m!925475 () Bool)

(assert (=> b!999103 m!925475))

(assert (=> b!999100 m!925467))

(assert (=> b!999100 m!925467))

(declare-fun m!925477 () Bool)

(assert (=> b!999100 m!925477))

(declare-fun m!925479 () Bool)

(assert (=> b!999105 m!925479))

(declare-fun m!925481 () Bool)

(assert (=> b!999099 m!925481))

(assert (=> b!999095 m!925467))

(assert (=> b!999095 m!925467))

(declare-fun m!925483 () Bool)

(assert (=> b!999095 m!925483))

(assert (=> b!999095 m!925483))

(assert (=> b!999095 m!925467))

(declare-fun m!925485 () Bool)

(assert (=> b!999095 m!925485))

(declare-fun m!925487 () Bool)

(assert (=> b!999104 m!925487))

(declare-fun m!925489 () Bool)

(assert (=> start!86310 m!925489))

(declare-fun m!925491 () Bool)

(assert (=> start!86310 m!925491))

(push 1)

(assert (not b!999099))

(assert (not b!999103))

(assert (not start!86310))

(assert (not b!999104))

(assert (not b!999098))

(assert (not b!999101))

(assert (not b!999105))

(assert (not b!999096))

(assert (not b!999100))

(assert (not b!999095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119261 () Bool)

(assert (=> d!119261 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999098 d!119261))

(declare-fun d!119265 () Bool)

(assert (=> d!119265 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86310 d!119265))

(declare-fun d!119271 () Bool)

(assert (=> d!119271 (= (array_inv!23532 a!3219) (bvsge (size!30910 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86310 d!119271))

(declare-fun d!119275 () Bool)

(declare-fun lt!441937 () (_ BitVec 32))

(declare-fun lt!441936 () (_ BitVec 32))

(assert (=> d!119275 (= lt!441937 (bvmul (bvxor lt!441936 (bvlshr lt!441936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119275 (= lt!441936 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) (bvlshr (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119275 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668765 (let ((h!22256 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) (bvlshr (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87166 (bvmul (bvxor h!22256 (bvlshr h!22256 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87166 (bvlshr x!87166 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668765 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668765 #b00000000000000000000000000000000))))))

(assert (=> d!119275 (= (toIndex!0 (select (store (arr!30408 a!3219) i!1194 k!2224) j!170) mask!3464) (bvand (bvxor lt!441937 (bvlshr lt!441937 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999103 d!119275))

(declare-fun d!119287 () Bool)

(assert (=> d!119287 (= (validKeyInArray!0 (select (arr!30408 a!3219) j!170)) (and (not (= (select (arr!30408 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30408 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999096 d!119287))

(declare-fun d!119289 () Bool)

(declare-fun lt!441958 () SeekEntryResult!9340)

(assert (=> d!119289 (and (or (is-Undefined!9340 lt!441958) (not (is-Found!9340 lt!441958)) (and (bvsge (index!39732 lt!441958) #b00000000000000000000000000000000) (bvslt (index!39732 lt!441958) (size!30910 a!3219)))) (or (is-Undefined!9340 lt!441958) (is-Found!9340 lt!441958) (not (is-MissingZero!9340 lt!441958)) (and (bvsge (index!39731 lt!441958) #b00000000000000000000000000000000) (bvslt (index!39731 lt!441958) (size!30910 a!3219)))) (or (is-Undefined!9340 lt!441958) (is-Found!9340 lt!441958) (is-MissingZero!9340 lt!441958) (not (is-MissingVacant!9340 lt!441958)) (and (bvsge (index!39734 lt!441958) #b00000000000000000000000000000000) (bvslt (index!39734 lt!441958) (size!30910 a!3219)))) (or (is-Undefined!9340 lt!441958) (ite (is-Found!9340 lt!441958) (= (select (arr!30408 a!3219) (index!39732 lt!441958)) k!2224) (ite (is-MissingZero!9340 lt!441958) (= (select (arr!30408 a!3219) (index!39731 lt!441958)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9340 lt!441958) (= (select (arr!30408 a!3219) (index!39734 lt!441958)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!563428 () SeekEntryResult!9340)

(assert (=> d!119289 (= lt!441958 e!563428)))

(declare-fun c!101371 () Bool)

(declare-fun lt!441957 () SeekEntryResult!9340)

(assert (=> d!119289 (= c!101371 (and (is-Intermediate!9340 lt!441957) (undefined!10152 lt!441957)))))

(assert (=> d!119289 (= lt!441957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119289 (validMask!0 mask!3464)))

(assert (=> d!119289 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441958)))

(declare-fun b!999238 () Bool)

(assert (=> b!999238 (= e!563428 Undefined!9340)))

(declare-fun b!999239 () Bool)

(declare-fun e!563426 () SeekEntryResult!9340)

(assert (=> b!999239 (= e!563426 (MissingZero!9340 (index!39733 lt!441957)))))

(declare-fun b!999240 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63162 (_ BitVec 32)) SeekEntryResult!9340)

(assert (=> b!999240 (= e!563426 (seekKeyOrZeroReturnVacant!0 (x!87162 lt!441957) (index!39733 lt!441957) (index!39733 lt!441957) k!2224 a!3219 mask!3464))))

(declare-fun b!999241 () Bool)

(declare-fun e!563427 () SeekEntryResult!9340)

(assert (=> b!999241 (= e!563427 (Found!9340 (index!39733 lt!441957)))))

(declare-fun b!999242 () Bool)

(assert (=> b!999242 (= e!563428 e!563427)))

(declare-fun lt!441956 () (_ BitVec 64))

(assert (=> b!999242 (= lt!441956 (select (arr!30408 a!3219) (index!39733 lt!441957)))))

(declare-fun c!101372 () Bool)

(assert (=> b!999242 (= c!101372 (= lt!441956 k!2224))))

(declare-fun b!999243 () Bool)

(declare-fun c!101370 () Bool)

(assert (=> b!999243 (= c!101370 (= lt!441956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999243 (= e!563427 e!563426)))

(assert (= (and d!119289 c!101371) b!999238))

(assert (= (and d!119289 (not c!101371)) b!999242))

(assert (= (and b!999242 c!101372) b!999241))

(assert (= (and b!999242 (not c!101372)) b!999243))

(assert (= (and b!999243 c!101370) b!999239))

(assert (= (and b!999243 (not c!101370)) b!999240))

(declare-fun m!925529 () Bool)

(assert (=> d!119289 m!925529))

(declare-fun m!925531 () Bool)

(assert (=> d!119289 m!925531))

(declare-fun m!925533 () Bool)

(assert (=> d!119289 m!925533))

(assert (=> d!119289 m!925489))

(declare-fun m!925535 () Bool)

(assert (=> d!119289 m!925535))

(assert (=> d!119289 m!925531))

(declare-fun m!925537 () Bool)

(assert (=> d!119289 m!925537))

(declare-fun m!925539 () Bool)

(assert (=> b!999240 m!925539))

(declare-fun m!925541 () Bool)

(assert (=> b!999242 m!925541))

(assert (=> b!999101 d!119289))

(declare-fun d!119299 () Bool)

(declare-fun e!563470 () Bool)

(assert (=> d!119299 e!563470))

(declare-fun c!101396 () Bool)

(declare-fun lt!441991 () SeekEntryResult!9340)

(assert (=> d!119299 (= c!101396 (and (is-Intermediate!9340 lt!441991) (undefined!10152 lt!441991)))))

(declare-fun e!563472 () SeekEntryResult!9340)

(assert (=> d!119299 (= lt!441991 e!563472)))

(declare-fun c!101397 () Bool)

(assert (=> d!119299 (= c!101397 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441990 () (_ BitVec 64))

(assert (=> d!119299 (= lt!441990 (select (arr!30408 a!3219) index!1507))))

(assert (=> d!119299 (validMask!0 mask!3464)))

(assert (=> d!119299 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!441991)))

(declare-fun b!999310 () Bool)

(declare-fun e!563471 () Bool)

(assert (=> b!999310 (= e!563470 e!563471)))

(declare-fun res!668816 () Bool)

(assert (=> b!999310 (= res!668816 (and (is-Intermediate!9340 lt!441991) (not (undefined!10152 lt!441991)) (bvslt (x!87162 lt!441991) #b01111111111111111111111111111110) (bvsge (x!87162 lt!441991) #b00000000000000000000000000000000) (bvsge (x!87162 lt!441991) x!1245)))))

(assert (=> b!999310 (=> (not res!668816) (not e!563471))))

(declare-fun b!999311 () Bool)

(assert (=> b!999311 (and (bvsge (index!39733 lt!441991) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441991) (size!30910 a!3219)))))

(declare-fun e!563468 () Bool)

(assert (=> b!999311 (= e!563468 (= (select (arr!30408 a!3219) (index!39733 lt!441991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999312 () Bool)

(assert (=> b!999312 (= e!563472 (Intermediate!9340 true index!1507 x!1245))))

(declare-fun b!999313 () Bool)

(declare-fun e!563469 () SeekEntryResult!9340)

(assert (=> b!999313 (= e!563469 (Intermediate!9340 false index!1507 x!1245))))

(declare-fun b!999314 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999314 (= e!563469 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30408 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999315 () Bool)

(assert (=> b!999315 (and (bvsge (index!39733 lt!441991) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441991) (size!30910 a!3219)))))

(declare-fun res!668815 () Bool)

(assert (=> b!999315 (= res!668815 (= (select (arr!30408 a!3219) (index!39733 lt!441991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999315 (=> res!668815 e!563468)))

(declare-fun b!999316 () Bool)

(assert (=> b!999316 (and (bvsge (index!39733 lt!441991) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441991) (size!30910 a!3219)))))

(declare-fun res!668814 () Bool)

(assert (=> b!999316 (= res!668814 (= (select (arr!30408 a!3219) (index!39733 lt!441991)) (select (arr!30408 a!3219) j!170)))))

(assert (=> b!999316 (=> res!668814 e!563468)))

(assert (=> b!999316 (= e!563471 e!563468)))

(declare-fun b!999317 () Bool)

(assert (=> b!999317 (= e!563470 (bvsge (x!87162 lt!441991) #b01111111111111111111111111111110))))

(declare-fun b!999318 () Bool)

(assert (=> b!999318 (= e!563472 e!563469)))

(declare-fun c!101398 () Bool)

(assert (=> b!999318 (= c!101398 (or (= lt!441990 (select (arr!30408 a!3219) j!170)) (= (bvadd lt!441990 lt!441990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119299 c!101397) b!999312))

(assert (= (and d!119299 (not c!101397)) b!999318))

(assert (= (and b!999318 c!101398) b!999313))

(assert (= (and b!999318 (not c!101398)) b!999314))

(assert (= (and d!119299 c!101396) b!999317))

(assert (= (and d!119299 (not c!101396)) b!999310))

(assert (= (and b!999310 res!668816) b!999316))

(assert (= (and b!999316 (not res!668814)) b!999315))

(assert (= (and b!999315 (not res!668815)) b!999311))

(declare-fun m!925595 () Bool)

(assert (=> b!999311 m!925595))

(assert (=> b!999316 m!925595))

(declare-fun m!925597 () Bool)

(assert (=> d!119299 m!925597))

(assert (=> d!119299 m!925489))

(declare-fun m!925599 () Bool)

(assert (=> b!999314 m!925599))

(assert (=> b!999314 m!925599))

(assert (=> b!999314 m!925467))

(declare-fun m!925601 () Bool)

(assert (=> b!999314 m!925601))

(assert (=> b!999315 m!925595))

(assert (=> b!999100 d!119299))

(declare-fun d!119315 () Bool)

(declare-fun res!668829 () Bool)

(declare-fun e!563487 () Bool)

(assert (=> d!119315 (=> res!668829 e!563487)))

(assert (=> d!119315 (= res!668829 (bvsge #b00000000000000000000000000000000 (size!30910 a!3219)))))

(assert (=> d!119315 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21081) e!563487)))

(declare-fun b!999335 () Bool)

(declare-fun e!563486 () Bool)

(declare-fun call!42308 () Bool)

(assert (=> b!999335 (= e!563486 call!42308)))

(declare-fun bm!42305 () Bool)

(declare-fun c!101402 () Bool)

(assert (=> bm!42305 (= call!42308 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101402 (Cons!21080 (select (arr!30408 a!3219) #b00000000000000000000000000000000) Nil!21081) Nil!21081)))))

(declare-fun b!999336 () Bool)

(declare-fun e!563488 () Bool)

(assert (=> b!999336 (= e!563487 e!563488)))

(declare-fun res!668828 () Bool)

(assert (=> b!999336 (=> (not res!668828) (not e!563488))))

(declare-fun e!563489 () Bool)

(assert (=> b!999336 (= res!668828 (not e!563489))))

(declare-fun res!668827 () Bool)

(assert (=> b!999336 (=> (not res!668827) (not e!563489))))

(assert (=> b!999336 (= res!668827 (validKeyInArray!0 (select (arr!30408 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999337 () Bool)

(declare-fun contains!5879 (List!21084 (_ BitVec 64)) Bool)

(assert (=> b!999337 (= e!563489 (contains!5879 Nil!21081 (select (arr!30408 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999338 () Bool)

(assert (=> b!999338 (= e!563486 call!42308)))

(declare-fun b!999339 () Bool)

(assert (=> b!999339 (= e!563488 e!563486)))

(assert (=> b!999339 (= c!101402 (validKeyInArray!0 (select (arr!30408 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119315 (not res!668829)) b!999336))

(assert (= (and b!999336 res!668827) b!999337))

(assert (= (and b!999336 res!668828) b!999339))

(assert (= (and b!999339 c!101402) b!999335))

(assert (= (and b!999339 (not c!101402)) b!999338))

(assert (= (or b!999335 b!999338) bm!42305))

(declare-fun m!925611 () Bool)

(assert (=> bm!42305 m!925611))

(declare-fun m!925613 () Bool)

(assert (=> bm!42305 m!925613))

(assert (=> b!999336 m!925611))

(assert (=> b!999336 m!925611))

(declare-fun m!925615 () Bool)

(assert (=> b!999336 m!925615))

(assert (=> b!999337 m!925611))

(assert (=> b!999337 m!925611))

(declare-fun m!925617 () Bool)

(assert (=> b!999337 m!925617))

(assert (=> b!999339 m!925611))

(assert (=> b!999339 m!925611))

(assert (=> b!999339 m!925615))

(assert (=> b!999105 d!119315))

(declare-fun d!119317 () Bool)

(declare-fun e!563492 () Bool)

(assert (=> d!119317 e!563492))

(declare-fun c!101403 () Bool)

(declare-fun lt!441996 () SeekEntryResult!9340)

(assert (=> d!119317 (= c!101403 (and (is-Intermediate!9340 lt!441996) (undefined!10152 lt!441996)))))

(declare-fun e!563494 () SeekEntryResult!9340)

(assert (=> d!119317 (= lt!441996 e!563494)))

(declare-fun c!101404 () Bool)

(assert (=> d!119317 (= c!101404 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441995 () (_ BitVec 64))

(assert (=> d!119317 (= lt!441995 (select (arr!30408 a!3219) (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464)))))

(assert (=> d!119317 (validMask!0 mask!3464)))

(assert (=> d!119317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!441996)))

(declare-fun b!999340 () Bool)

(declare-fun e!563493 () Bool)

(assert (=> b!999340 (= e!563492 e!563493)))

(declare-fun res!668832 () Bool)

(assert (=> b!999340 (= res!668832 (and (is-Intermediate!9340 lt!441996) (not (undefined!10152 lt!441996)) (bvslt (x!87162 lt!441996) #b01111111111111111111111111111110) (bvsge (x!87162 lt!441996) #b00000000000000000000000000000000) (bvsge (x!87162 lt!441996) #b00000000000000000000000000000000)))))

(assert (=> b!999340 (=> (not res!668832) (not e!563493))))

(declare-fun b!999341 () Bool)

(assert (=> b!999341 (and (bvsge (index!39733 lt!441996) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441996) (size!30910 a!3219)))))

(declare-fun e!563490 () Bool)

(assert (=> b!999341 (= e!563490 (= (select (arr!30408 a!3219) (index!39733 lt!441996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999342 () Bool)

(assert (=> b!999342 (= e!563494 (Intermediate!9340 true (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999343 () Bool)

(declare-fun e!563491 () SeekEntryResult!9340)

(assert (=> b!999343 (= e!563491 (Intermediate!9340 false (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999344 () Bool)

(assert (=> b!999344 (= e!563491 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30408 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999345 () Bool)

(assert (=> b!999345 (and (bvsge (index!39733 lt!441996) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441996) (size!30910 a!3219)))))

(declare-fun res!668831 () Bool)

(assert (=> b!999345 (= res!668831 (= (select (arr!30408 a!3219) (index!39733 lt!441996)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999345 (=> res!668831 e!563490)))

(declare-fun b!999346 () Bool)

(assert (=> b!999346 (and (bvsge (index!39733 lt!441996) #b00000000000000000000000000000000) (bvslt (index!39733 lt!441996) (size!30910 a!3219)))))

(declare-fun res!668830 () Bool)

(assert (=> b!999346 (= res!668830 (= (select (arr!30408 a!3219) (index!39733 lt!441996)) (select (arr!30408 a!3219) j!170)))))

(assert (=> b!999346 (=> res!668830 e!563490)))

(assert (=> b!999346 (= e!563493 e!563490)))

(declare-fun b!999347 () Bool)

(assert (=> b!999347 (= e!563492 (bvsge (x!87162 lt!441996) #b01111111111111111111111111111110))))

(declare-fun b!999348 () Bool)

(assert (=> b!999348 (= e!563494 e!563491)))

(declare-fun c!101405 () Bool)

(assert (=> b!999348 (= c!101405 (or (= lt!441995 (select (arr!30408 a!3219) j!170)) (= (bvadd lt!441995 lt!441995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!119317 c!101404) b!999342))

(assert (= (and d!119317 (not c!101404)) b!999348))

(assert (= (and b!999348 c!101405) b!999343))

(assert (= (and b!999348 (not c!101405)) b!999344))

(assert (= (and d!119317 c!101403) b!999347))

(assert (= (and d!119317 (not c!101403)) b!999340))

(assert (= (and b!999340 res!668832) b!999346))

(assert (= (and b!999346 (not res!668830)) b!999345))

(assert (= (and b!999345 (not res!668831)) b!999341))

(declare-fun m!925619 () Bool)

(assert (=> b!999341 m!925619))

(assert (=> b!999346 m!925619))

(assert (=> d!119317 m!925483))

(declare-fun m!925621 () Bool)

(assert (=> d!119317 m!925621))

(assert (=> d!119317 m!925489))

(assert (=> b!999344 m!925483))

(declare-fun m!925623 () Bool)

(assert (=> b!999344 m!925623))

(assert (=> b!999344 m!925623))

(assert (=> b!999344 m!925467))

(declare-fun m!925625 () Bool)

(assert (=> b!999344 m!925625))

(assert (=> b!999345 m!925619))

(assert (=> b!999095 d!119317))

(declare-fun d!119319 () Bool)

(declare-fun lt!441998 () (_ BitVec 32))

(declare-fun lt!441997 () (_ BitVec 32))

(assert (=> d!119319 (= lt!441998 (bvmul (bvxor lt!441997 (bvlshr lt!441997 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119319 (= lt!441997 ((_ extract 31 0) (bvand (bvxor (select (arr!30408 a!3219) j!170) (bvlshr (select (arr!30408 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119319 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668765 (let ((h!22256 ((_ extract 31 0) (bvand (bvxor (select (arr!30408 a!3219) j!170) (bvlshr (select (arr!30408 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87166 (bvmul (bvxor h!22256 (bvlshr h!22256 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87166 (bvlshr x!87166 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668765 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668765 #b00000000000000000000000000000000))))))

(assert (=> d!119319 (= (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) (bvand (bvxor lt!441998 (bvlshr lt!441998 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999095 d!119319))

(declare-fun d!119321 () Bool)

(declare-fun res!668837 () Bool)

(declare-fun e!563499 () Bool)

(assert (=> d!119321 (=> res!668837 e!563499)))

(assert (=> d!119321 (= res!668837 (= (select (arr!30408 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119321 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!563499)))

(declare-fun b!999353 () Bool)

(declare-fun e!563500 () Bool)

(assert (=> b!999353 (= e!563499 e!563500)))

(declare-fun res!668838 () Bool)

(assert (=> b!999353 (=> (not res!668838) (not e!563500))))

(assert (=> b!999353 (= res!668838 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30910 a!3219)))))

(declare-fun b!999354 () Bool)

(assert (=> b!999354 (= e!563500 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119321 (not res!668837)) b!999353))

(assert (= (and b!999353 res!668838) b!999354))

(assert (=> d!119321 m!925611))

(declare-fun m!925627 () Bool)

(assert (=> b!999354 m!925627))

(assert (=> b!999104 d!119321))

(declare-fun b!999363 () Bool)

(declare-fun e!563508 () Bool)

(declare-fun e!563507 () Bool)

(assert (=> b!999363 (= e!563508 e!563507)))

(declare-fun c!101408 () Bool)

(assert (=> b!999363 (= c!101408 (validKeyInArray!0 (select (arr!30408 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999364 () Bool)

(declare-fun e!563509 () Bool)

(declare-fun call!42311 () Bool)

(assert (=> b!999364 (= e!563509 call!42311)))

(declare-fun b!999365 () Bool)

(assert (=> b!999365 (= e!563507 e!563509)))

(declare-fun lt!442005 () (_ BitVec 64))

(assert (=> b!999365 (= lt!442005 (select (arr!30408 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32996 0))(
  ( (Unit!32997) )
))
(declare-fun lt!442006 () Unit!32996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63162 (_ BitVec 64) (_ BitVec 32)) Unit!32996)

(assert (=> b!999365 (= lt!442006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!442005 #b00000000000000000000000000000000))))

(assert (=> b!999365 (arrayContainsKey!0 a!3219 lt!442005 #b00000000000000000000000000000000)))

(declare-fun lt!442007 () Unit!32996)

(assert (=> b!999365 (= lt!442007 lt!442006)))

(declare-fun res!668844 () Bool)

(assert (=> b!999365 (= res!668844 (= (seekEntryOrOpen!0 (select (arr!30408 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9340 #b00000000000000000000000000000000)))))

(assert (=> b!999365 (=> (not res!668844) (not e!563509))))

(declare-fun b!999366 () Bool)

(assert (=> b!999366 (= e!563507 call!42311)))

(declare-fun d!119323 () Bool)

(declare-fun res!668843 () Bool)

(assert (=> d!119323 (=> res!668843 e!563508)))

(assert (=> d!119323 (= res!668843 (bvsge #b00000000000000000000000000000000 (size!30910 a!3219)))))

(assert (=> d!119323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563508)))

(declare-fun bm!42308 () Bool)

(assert (=> bm!42308 (= call!42311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119323 (not res!668843)) b!999363))

(assert (= (and b!999363 c!101408) b!999365))

(assert (= (and b!999363 (not c!101408)) b!999366))

(assert (= (and b!999365 res!668844) b!999364))

(assert (= (or b!999364 b!999366) bm!42308))

(assert (=> b!999363 m!925611))

(assert (=> b!999363 m!925611))

(assert (=> b!999363 m!925615))

(assert (=> b!999365 m!925611))

(declare-fun m!925629 () Bool)

(assert (=> b!999365 m!925629))

(declare-fun m!925631 () Bool)

(assert (=> b!999365 m!925631))

(assert (=> b!999365 m!925611))

(declare-fun m!925633 () Bool)

(assert (=> b!999365 m!925633))

(declare-fun m!925635 () Bool)

(assert (=> bm!42308 m!925635))

(assert (=> b!999099 d!119323))

(push 1)

(assert (not b!999336))

(assert (not b!999339))

(assert (not b!999363))

(assert (not b!999337))

(assert (not bm!42305))

(assert (not b!999240))

(assert (not b!999314))

(assert (not b!999354))

(assert (not bm!42308))

(assert (not b!999365))

(assert (not d!119317))

(assert (not d!119289))

(assert (not d!119299))

(assert (not b!999344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

