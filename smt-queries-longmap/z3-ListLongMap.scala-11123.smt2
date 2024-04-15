; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129918 () Bool)

(assert start!129918)

(declare-fun b!1524861 () Bool)

(declare-fun res!1043419 () Bool)

(declare-fun e!849973 () Bool)

(assert (=> b!1524861 (=> (not res!1043419) (not e!849973))))

(declare-datatypes ((array!101392 0))(
  ( (array!101393 (arr!48925 (Array (_ BitVec 32) (_ BitVec 64))) (size!49477 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101392)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101392 (_ BitVec 32)) Bool)

(assert (=> b!1524861 (= res!1043419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524862 () Bool)

(declare-fun res!1043414 () Bool)

(assert (=> b!1524862 (=> (not res!1043414) (not e!849973))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524862 (= res!1043414 (validKeyInArray!0 (select (arr!48925 a!2804) j!70)))))

(declare-fun res!1043415 () Bool)

(assert (=> start!129918 (=> (not res!1043415) (not e!849973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129918 (= res!1043415 (validMask!0 mask!2512))))

(assert (=> start!129918 e!849973))

(assert (=> start!129918 true))

(declare-fun array_inv!38158 (array!101392) Bool)

(assert (=> start!129918 (array_inv!38158 a!2804)))

(declare-fun b!1524863 () Bool)

(declare-fun e!849972 () Bool)

(declare-fun e!849970 () Bool)

(assert (=> b!1524863 (= e!849972 (not e!849970))))

(declare-fun res!1043413 () Bool)

(assert (=> b!1524863 (=> res!1043413 e!849970)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!660294 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1524863 (= res!1043413 (or (not (= (select (arr!48925 a!2804) j!70) lt!660294)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48925 a!2804) index!487) (select (arr!48925 a!2804) j!70)) (not (= (select (arr!48925 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!849968 () Bool)

(assert (=> b!1524863 e!849968))

(declare-fun res!1043412 () Bool)

(assert (=> b!1524863 (=> (not res!1043412) (not e!849968))))

(assert (=> b!1524863 (= res!1043412 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50849 0))(
  ( (Unit!50850) )
))
(declare-fun lt!660295 () Unit!50849)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50849)

(assert (=> b!1524863 (= lt!660295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524864 () Bool)

(declare-fun res!1043416 () Bool)

(assert (=> b!1524864 (=> (not res!1043416) (not e!849973))))

(assert (=> b!1524864 (= res!1043416 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49477 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49477 a!2804))))))

(declare-fun b!1524865 () Bool)

(declare-fun res!1043406 () Bool)

(assert (=> b!1524865 (=> (not res!1043406) (not e!849968))))

(declare-datatypes ((SeekEntryResult!13113 0))(
  ( (MissingZero!13113 (index!54847 (_ BitVec 32))) (Found!13113 (index!54848 (_ BitVec 32))) (Intermediate!13113 (undefined!13925 Bool) (index!54849 (_ BitVec 32)) (x!136545 (_ BitVec 32))) (Undefined!13113) (MissingVacant!13113 (index!54850 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13113)

(assert (=> b!1524865 (= res!1043406 (= (seekEntry!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) (Found!13113 j!70)))))

(declare-fun b!1524866 () Bool)

(declare-fun e!849971 () Bool)

(assert (=> b!1524866 (= e!849973 e!849971)))

(declare-fun res!1043410 () Bool)

(assert (=> b!1524866 (=> (not res!1043410) (not e!849971))))

(declare-fun lt!660293 () SeekEntryResult!13113)

(declare-fun lt!660296 () SeekEntryResult!13113)

(assert (=> b!1524866 (= res!1043410 (= lt!660293 lt!660296))))

(assert (=> b!1524866 (= lt!660296 (Intermediate!13113 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524866 (= lt!660293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524867 () Bool)

(declare-fun lt!660297 () array!101392)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13113)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101392 (_ BitVec 32)) SeekEntryResult!13113)

(assert (=> b!1524867 (= e!849970 (= (seekEntryOrOpen!0 lt!660294 lt!660297 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660294 lt!660297 mask!2512)))))

(declare-fun b!1524868 () Bool)

(declare-fun res!1043408 () Bool)

(assert (=> b!1524868 (=> (not res!1043408) (not e!849973))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524868 (= res!1043408 (validKeyInArray!0 (select (arr!48925 a!2804) i!961)))))

(declare-fun b!1524869 () Bool)

(declare-fun res!1043418 () Bool)

(assert (=> b!1524869 (=> (not res!1043418) (not e!849971))))

(assert (=> b!1524869 (= res!1043418 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660296))))

(declare-fun b!1524870 () Bool)

(assert (=> b!1524870 (= e!849971 e!849972)))

(declare-fun res!1043409 () Bool)

(assert (=> b!1524870 (=> (not res!1043409) (not e!849972))))

(assert (=> b!1524870 (= res!1043409 (= lt!660293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660294 mask!2512) lt!660294 lt!660297 mask!2512)))))

(assert (=> b!1524870 (= lt!660294 (select (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1524870 (= lt!660297 (array!101393 (store (arr!48925 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49477 a!2804)))))

(declare-fun e!849967 () Bool)

(declare-fun b!1524871 () Bool)

(assert (=> b!1524871 (= e!849967 (= (seekEntryOrOpen!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524872 () Bool)

(declare-fun res!1043407 () Bool)

(assert (=> b!1524872 (=> (not res!1043407) (not e!849973))))

(declare-datatypes ((List!35486 0))(
  ( (Nil!35483) (Cons!35482 (h!36913 (_ BitVec 64)) (t!50172 List!35486)) )
))
(declare-fun arrayNoDuplicates!0 (array!101392 (_ BitVec 32) List!35486) Bool)

(assert (=> b!1524872 (= res!1043407 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35483))))

(declare-fun b!1524873 () Bool)

(assert (=> b!1524873 (= e!849968 e!849967)))

(declare-fun res!1043411 () Bool)

(assert (=> b!1524873 (=> res!1043411 e!849967)))

(assert (=> b!1524873 (= res!1043411 (or (not (= (select (arr!48925 a!2804) j!70) lt!660294)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48925 a!2804) index!487) (select (arr!48925 a!2804) j!70)) (not (= (select (arr!48925 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1524874 () Bool)

(declare-fun res!1043417 () Bool)

(assert (=> b!1524874 (=> (not res!1043417) (not e!849973))))

(assert (=> b!1524874 (= res!1043417 (and (= (size!49477 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49477 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49477 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129918 res!1043415) b!1524874))

(assert (= (and b!1524874 res!1043417) b!1524868))

(assert (= (and b!1524868 res!1043408) b!1524862))

(assert (= (and b!1524862 res!1043414) b!1524861))

(assert (= (and b!1524861 res!1043419) b!1524872))

(assert (= (and b!1524872 res!1043407) b!1524864))

(assert (= (and b!1524864 res!1043416) b!1524866))

(assert (= (and b!1524866 res!1043410) b!1524869))

(assert (= (and b!1524869 res!1043418) b!1524870))

(assert (= (and b!1524870 res!1043409) b!1524863))

(assert (= (and b!1524863 res!1043412) b!1524865))

(assert (= (and b!1524865 res!1043406) b!1524873))

(assert (= (and b!1524873 (not res!1043411)) b!1524871))

(assert (= (and b!1524863 (not res!1043413)) b!1524867))

(declare-fun m!1407173 () Bool)

(assert (=> b!1524871 m!1407173))

(assert (=> b!1524871 m!1407173))

(declare-fun m!1407175 () Bool)

(assert (=> b!1524871 m!1407175))

(assert (=> b!1524871 m!1407173))

(declare-fun m!1407177 () Bool)

(assert (=> b!1524871 m!1407177))

(declare-fun m!1407179 () Bool)

(assert (=> b!1524861 m!1407179))

(declare-fun m!1407181 () Bool)

(assert (=> b!1524872 m!1407181))

(assert (=> b!1524865 m!1407173))

(assert (=> b!1524865 m!1407173))

(declare-fun m!1407183 () Bool)

(assert (=> b!1524865 m!1407183))

(declare-fun m!1407185 () Bool)

(assert (=> b!1524868 m!1407185))

(assert (=> b!1524868 m!1407185))

(declare-fun m!1407187 () Bool)

(assert (=> b!1524868 m!1407187))

(assert (=> b!1524862 m!1407173))

(assert (=> b!1524862 m!1407173))

(declare-fun m!1407189 () Bool)

(assert (=> b!1524862 m!1407189))

(assert (=> b!1524866 m!1407173))

(assert (=> b!1524866 m!1407173))

(declare-fun m!1407191 () Bool)

(assert (=> b!1524866 m!1407191))

(assert (=> b!1524866 m!1407191))

(assert (=> b!1524866 m!1407173))

(declare-fun m!1407193 () Bool)

(assert (=> b!1524866 m!1407193))

(declare-fun m!1407195 () Bool)

(assert (=> start!129918 m!1407195))

(declare-fun m!1407197 () Bool)

(assert (=> start!129918 m!1407197))

(declare-fun m!1407199 () Bool)

(assert (=> b!1524867 m!1407199))

(declare-fun m!1407201 () Bool)

(assert (=> b!1524867 m!1407201))

(assert (=> b!1524869 m!1407173))

(assert (=> b!1524869 m!1407173))

(declare-fun m!1407203 () Bool)

(assert (=> b!1524869 m!1407203))

(declare-fun m!1407205 () Bool)

(assert (=> b!1524870 m!1407205))

(assert (=> b!1524870 m!1407205))

(declare-fun m!1407207 () Bool)

(assert (=> b!1524870 m!1407207))

(declare-fun m!1407209 () Bool)

(assert (=> b!1524870 m!1407209))

(declare-fun m!1407211 () Bool)

(assert (=> b!1524870 m!1407211))

(assert (=> b!1524873 m!1407173))

(declare-fun m!1407213 () Bool)

(assert (=> b!1524873 m!1407213))

(assert (=> b!1524863 m!1407173))

(assert (=> b!1524863 m!1407213))

(declare-fun m!1407215 () Bool)

(assert (=> b!1524863 m!1407215))

(declare-fun m!1407217 () Bool)

(assert (=> b!1524863 m!1407217))

(check-sat (not b!1524871) (not b!1524866) (not b!1524869) (not start!129918) (not b!1524868) (not b!1524865) (not b!1524870) (not b!1524872) (not b!1524861) (not b!1524863) (not b!1524862) (not b!1524867))
(check-sat)
(get-model)

(declare-fun b!1524971 () Bool)

(declare-fun e!850023 () SeekEntryResult!13113)

(declare-fun lt!660335 () SeekEntryResult!13113)

(assert (=> b!1524971 (= e!850023 (Found!13113 (index!54849 lt!660335)))))

(declare-fun b!1524972 () Bool)

(declare-fun e!850022 () SeekEntryResult!13113)

(assert (=> b!1524972 (= e!850022 e!850023)))

(declare-fun lt!660336 () (_ BitVec 64))

(assert (=> b!1524972 (= lt!660336 (select (arr!48925 a!2804) (index!54849 lt!660335)))))

(declare-fun c!140288 () Bool)

(assert (=> b!1524972 (= c!140288 (= lt!660336 (select (arr!48925 a!2804) j!70)))))

(declare-fun b!1524973 () Bool)

(assert (=> b!1524973 (= e!850022 Undefined!13113)))

(declare-fun d!159201 () Bool)

(declare-fun lt!660334 () SeekEntryResult!13113)

(get-info :version)

(assert (=> d!159201 (and (or ((_ is Undefined!13113) lt!660334) (not ((_ is Found!13113) lt!660334)) (and (bvsge (index!54848 lt!660334) #b00000000000000000000000000000000) (bvslt (index!54848 lt!660334) (size!49477 a!2804)))) (or ((_ is Undefined!13113) lt!660334) ((_ is Found!13113) lt!660334) (not ((_ is MissingZero!13113) lt!660334)) (and (bvsge (index!54847 lt!660334) #b00000000000000000000000000000000) (bvslt (index!54847 lt!660334) (size!49477 a!2804)))) (or ((_ is Undefined!13113) lt!660334) ((_ is Found!13113) lt!660334) ((_ is MissingZero!13113) lt!660334) (not ((_ is MissingVacant!13113) lt!660334)) (and (bvsge (index!54850 lt!660334) #b00000000000000000000000000000000) (bvslt (index!54850 lt!660334) (size!49477 a!2804)))) (or ((_ is Undefined!13113) lt!660334) (ite ((_ is Found!13113) lt!660334) (= (select (arr!48925 a!2804) (index!54848 lt!660334)) (select (arr!48925 a!2804) j!70)) (ite ((_ is MissingZero!13113) lt!660334) (= (select (arr!48925 a!2804) (index!54847 lt!660334)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13113) lt!660334) (= (select (arr!48925 a!2804) (index!54850 lt!660334)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159201 (= lt!660334 e!850022)))

(declare-fun c!140289 () Bool)

(assert (=> d!159201 (= c!140289 (and ((_ is Intermediate!13113) lt!660335) (undefined!13925 lt!660335)))))

(assert (=> d!159201 (= lt!660335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159201 (validMask!0 mask!2512)))

(assert (=> d!159201 (= (seekEntryOrOpen!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660334)))

(declare-fun b!1524974 () Bool)

(declare-fun c!140287 () Bool)

(assert (=> b!1524974 (= c!140287 (= lt!660336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850024 () SeekEntryResult!13113)

(assert (=> b!1524974 (= e!850023 e!850024)))

(declare-fun b!1524975 () Bool)

(assert (=> b!1524975 (= e!850024 (MissingZero!13113 (index!54849 lt!660335)))))

(declare-fun b!1524976 () Bool)

(assert (=> b!1524976 (= e!850024 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!660335) (index!54849 lt!660335) (index!54849 lt!660335) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159201 c!140289) b!1524973))

(assert (= (and d!159201 (not c!140289)) b!1524972))

(assert (= (and b!1524972 c!140288) b!1524971))

(assert (= (and b!1524972 (not c!140288)) b!1524974))

(assert (= (and b!1524974 c!140287) b!1524975))

(assert (= (and b!1524974 (not c!140287)) b!1524976))

(declare-fun m!1407311 () Bool)

(assert (=> b!1524972 m!1407311))

(declare-fun m!1407313 () Bool)

(assert (=> d!159201 m!1407313))

(declare-fun m!1407315 () Bool)

(assert (=> d!159201 m!1407315))

(assert (=> d!159201 m!1407195))

(assert (=> d!159201 m!1407173))

(assert (=> d!159201 m!1407191))

(declare-fun m!1407317 () Bool)

(assert (=> d!159201 m!1407317))

(assert (=> d!159201 m!1407191))

(assert (=> d!159201 m!1407173))

(assert (=> d!159201 m!1407193))

(assert (=> b!1524976 m!1407173))

(declare-fun m!1407319 () Bool)

(assert (=> b!1524976 m!1407319))

(assert (=> b!1524871 d!159201))

(declare-fun b!1524989 () Bool)

(declare-fun e!850031 () SeekEntryResult!13113)

(assert (=> b!1524989 (= e!850031 Undefined!13113)))

(declare-fun b!1524990 () Bool)

(declare-fun e!850033 () SeekEntryResult!13113)

(assert (=> b!1524990 (= e!850031 e!850033)))

(declare-fun lt!660342 () (_ BitVec 64))

(declare-fun c!140298 () Bool)

(assert (=> b!1524990 (= c!140298 (= lt!660342 (select (arr!48925 a!2804) j!70)))))

(declare-fun d!159203 () Bool)

(declare-fun lt!660341 () SeekEntryResult!13113)

(assert (=> d!159203 (and (or ((_ is Undefined!13113) lt!660341) (not ((_ is Found!13113) lt!660341)) (and (bvsge (index!54848 lt!660341) #b00000000000000000000000000000000) (bvslt (index!54848 lt!660341) (size!49477 a!2804)))) (or ((_ is Undefined!13113) lt!660341) ((_ is Found!13113) lt!660341) (not ((_ is MissingVacant!13113) lt!660341)) (not (= (index!54850 lt!660341) index!487)) (and (bvsge (index!54850 lt!660341) #b00000000000000000000000000000000) (bvslt (index!54850 lt!660341) (size!49477 a!2804)))) (or ((_ is Undefined!13113) lt!660341) (ite ((_ is Found!13113) lt!660341) (= (select (arr!48925 a!2804) (index!54848 lt!660341)) (select (arr!48925 a!2804) j!70)) (and ((_ is MissingVacant!13113) lt!660341) (= (index!54850 lt!660341) index!487) (= (select (arr!48925 a!2804) (index!54850 lt!660341)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159203 (= lt!660341 e!850031)))

(declare-fun c!140296 () Bool)

(assert (=> d!159203 (= c!140296 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159203 (= lt!660342 (select (arr!48925 a!2804) index!487))))

(assert (=> d!159203 (validMask!0 mask!2512)))

(assert (=> d!159203 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660341)))

(declare-fun b!1524991 () Bool)

(declare-fun e!850032 () SeekEntryResult!13113)

(assert (=> b!1524991 (= e!850032 (MissingVacant!13113 index!487))))

(declare-fun b!1524992 () Bool)

(assert (=> b!1524992 (= e!850033 (Found!13113 index!487))))

(declare-fun b!1524993 () Bool)

(declare-fun c!140297 () Bool)

(assert (=> b!1524993 (= c!140297 (= lt!660342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524993 (= e!850033 e!850032)))

(declare-fun b!1524994 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524994 (= e!850032 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159203 c!140296) b!1524989))

(assert (= (and d!159203 (not c!140296)) b!1524990))

(assert (= (and b!1524990 c!140298) b!1524992))

(assert (= (and b!1524990 (not c!140298)) b!1524993))

(assert (= (and b!1524993 c!140297) b!1524991))

(assert (= (and b!1524993 (not c!140297)) b!1524994))

(declare-fun m!1407321 () Bool)

(assert (=> d!159203 m!1407321))

(declare-fun m!1407323 () Bool)

(assert (=> d!159203 m!1407323))

(assert (=> d!159203 m!1407213))

(assert (=> d!159203 m!1407195))

(declare-fun m!1407325 () Bool)

(assert (=> b!1524994 m!1407325))

(assert (=> b!1524994 m!1407325))

(assert (=> b!1524994 m!1407173))

(declare-fun m!1407327 () Bool)

(assert (=> b!1524994 m!1407327))

(assert (=> b!1524871 d!159203))

(declare-fun d!159205 () Bool)

(assert (=> d!159205 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129918 d!159205))

(declare-fun d!159211 () Bool)

(assert (=> d!159211 (= (array_inv!38158 a!2804) (bvsge (size!49477 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129918 d!159211))

(declare-fun b!1525015 () Bool)

(declare-fun e!850049 () Bool)

(declare-fun e!850050 () Bool)

(assert (=> b!1525015 (= e!850049 e!850050)))

(declare-fun lt!660360 () (_ BitVec 64))

(assert (=> b!1525015 (= lt!660360 (select (arr!48925 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660359 () Unit!50849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101392 (_ BitVec 64) (_ BitVec 32)) Unit!50849)

(assert (=> b!1525015 (= lt!660359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660360 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1525015 (arrayContainsKey!0 a!2804 lt!660360 #b00000000000000000000000000000000)))

(declare-fun lt!660358 () Unit!50849)

(assert (=> b!1525015 (= lt!660358 lt!660359)))

(declare-fun res!1043515 () Bool)

(assert (=> b!1525015 (= res!1043515 (= (seekEntryOrOpen!0 (select (arr!48925 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13113 #b00000000000000000000000000000000)))))

(assert (=> b!1525015 (=> (not res!1043515) (not e!850050))))

(declare-fun b!1525016 () Bool)

(declare-fun call!68419 () Bool)

(assert (=> b!1525016 (= e!850050 call!68419)))

(declare-fun b!1525017 () Bool)

(declare-fun e!850051 () Bool)

(assert (=> b!1525017 (= e!850051 e!850049)))

(declare-fun c!140304 () Bool)

(assert (=> b!1525017 (= c!140304 (validKeyInArray!0 (select (arr!48925 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525018 () Bool)

(assert (=> b!1525018 (= e!850049 call!68419)))

(declare-fun bm!68416 () Bool)

(assert (=> bm!68416 (= call!68419 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159213 () Bool)

(declare-fun res!1043514 () Bool)

(assert (=> d!159213 (=> res!1043514 e!850051)))

(assert (=> d!159213 (= res!1043514 (bvsge #b00000000000000000000000000000000 (size!49477 a!2804)))))

(assert (=> d!159213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!850051)))

(assert (= (and d!159213 (not res!1043514)) b!1525017))

(assert (= (and b!1525017 c!140304) b!1525015))

(assert (= (and b!1525017 (not c!140304)) b!1525018))

(assert (= (and b!1525015 res!1043515) b!1525016))

(assert (= (or b!1525016 b!1525018) bm!68416))

(declare-fun m!1407341 () Bool)

(assert (=> b!1525015 m!1407341))

(declare-fun m!1407343 () Bool)

(assert (=> b!1525015 m!1407343))

(declare-fun m!1407345 () Bool)

(assert (=> b!1525015 m!1407345))

(assert (=> b!1525015 m!1407341))

(declare-fun m!1407347 () Bool)

(assert (=> b!1525015 m!1407347))

(assert (=> b!1525017 m!1407341))

(assert (=> b!1525017 m!1407341))

(declare-fun m!1407349 () Bool)

(assert (=> b!1525017 m!1407349))

(declare-fun m!1407351 () Bool)

(assert (=> bm!68416 m!1407351))

(assert (=> b!1524861 d!159213))

(declare-fun b!1525029 () Bool)

(declare-fun e!850060 () Bool)

(declare-fun call!68422 () Bool)

(assert (=> b!1525029 (= e!850060 call!68422)))

(declare-fun bm!68419 () Bool)

(declare-fun c!140307 () Bool)

(assert (=> bm!68419 (= call!68422 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140307 (Cons!35482 (select (arr!48925 a!2804) #b00000000000000000000000000000000) Nil!35483) Nil!35483)))))

(declare-fun b!1525030 () Bool)

(declare-fun e!850061 () Bool)

(declare-fun contains!9955 (List!35486 (_ BitVec 64)) Bool)

(assert (=> b!1525030 (= e!850061 (contains!9955 Nil!35483 (select (arr!48925 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159221 () Bool)

(declare-fun res!1043522 () Bool)

(declare-fun e!850062 () Bool)

(assert (=> d!159221 (=> res!1043522 e!850062)))

(assert (=> d!159221 (= res!1043522 (bvsge #b00000000000000000000000000000000 (size!49477 a!2804)))))

(assert (=> d!159221 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35483) e!850062)))

(declare-fun b!1525031 () Bool)

(assert (=> b!1525031 (= e!850060 call!68422)))

(declare-fun b!1525032 () Bool)

(declare-fun e!850063 () Bool)

(assert (=> b!1525032 (= e!850063 e!850060)))

(assert (=> b!1525032 (= c!140307 (validKeyInArray!0 (select (arr!48925 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525033 () Bool)

(assert (=> b!1525033 (= e!850062 e!850063)))

(declare-fun res!1043524 () Bool)

(assert (=> b!1525033 (=> (not res!1043524) (not e!850063))))

(assert (=> b!1525033 (= res!1043524 (not e!850061))))

(declare-fun res!1043523 () Bool)

(assert (=> b!1525033 (=> (not res!1043523) (not e!850061))))

(assert (=> b!1525033 (= res!1043523 (validKeyInArray!0 (select (arr!48925 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159221 (not res!1043522)) b!1525033))

(assert (= (and b!1525033 res!1043523) b!1525030))

(assert (= (and b!1525033 res!1043524) b!1525032))

(assert (= (and b!1525032 c!140307) b!1525031))

(assert (= (and b!1525032 (not c!140307)) b!1525029))

(assert (= (or b!1525031 b!1525029) bm!68419))

(assert (=> bm!68419 m!1407341))

(declare-fun m!1407353 () Bool)

(assert (=> bm!68419 m!1407353))

(assert (=> b!1525030 m!1407341))

(assert (=> b!1525030 m!1407341))

(declare-fun m!1407355 () Bool)

(assert (=> b!1525030 m!1407355))

(assert (=> b!1525032 m!1407341))

(assert (=> b!1525032 m!1407341))

(assert (=> b!1525032 m!1407349))

(assert (=> b!1525033 m!1407341))

(assert (=> b!1525033 m!1407341))

(assert (=> b!1525033 m!1407349))

(assert (=> b!1524872 d!159221))

(declare-fun d!159227 () Bool)

(assert (=> d!159227 (= (validKeyInArray!0 (select (arr!48925 a!2804) j!70)) (and (not (= (select (arr!48925 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48925 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524862 d!159227))

(declare-fun d!159231 () Bool)

(assert (=> d!159231 (= (validKeyInArray!0 (select (arr!48925 a!2804) i!961)) (and (not (= (select (arr!48925 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48925 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524868 d!159231))

(declare-fun b!1525096 () Bool)

(declare-fun e!850099 () SeekEntryResult!13113)

(declare-fun e!850100 () SeekEntryResult!13113)

(assert (=> b!1525096 (= e!850099 e!850100)))

(declare-fun lt!660392 () (_ BitVec 64))

(declare-fun c!140331 () Bool)

(assert (=> b!1525096 (= c!140331 (or (= lt!660392 (select (arr!48925 a!2804) j!70)) (= (bvadd lt!660392 lt!660392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525097 () Bool)

(assert (=> b!1525097 (= e!850099 (Intermediate!13113 true index!487 x!534))))

(declare-fun b!1525098 () Bool)

(declare-fun e!850103 () Bool)

(declare-fun e!850101 () Bool)

(assert (=> b!1525098 (= e!850103 e!850101)))

(declare-fun res!1043546 () Bool)

(declare-fun lt!660391 () SeekEntryResult!13113)

(assert (=> b!1525098 (= res!1043546 (and ((_ is Intermediate!13113) lt!660391) (not (undefined!13925 lt!660391)) (bvslt (x!136545 lt!660391) #b01111111111111111111111111111110) (bvsge (x!136545 lt!660391) #b00000000000000000000000000000000) (bvsge (x!136545 lt!660391) x!534)))))

(assert (=> b!1525098 (=> (not res!1043546) (not e!850101))))

(declare-fun b!1525099 () Bool)

(assert (=> b!1525099 (= e!850103 (bvsge (x!136545 lt!660391) #b01111111111111111111111111111110))))

(declare-fun b!1525100 () Bool)

(assert (=> b!1525100 (= e!850100 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525101 () Bool)

(assert (=> b!1525101 (and (bvsge (index!54849 lt!660391) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660391) (size!49477 a!2804)))))

(declare-fun res!1043547 () Bool)

(assert (=> b!1525101 (= res!1043547 (= (select (arr!48925 a!2804) (index!54849 lt!660391)) (select (arr!48925 a!2804) j!70)))))

(declare-fun e!850102 () Bool)

(assert (=> b!1525101 (=> res!1043547 e!850102)))

(assert (=> b!1525101 (= e!850101 e!850102)))

(declare-fun b!1525102 () Bool)

(assert (=> b!1525102 (= e!850100 (Intermediate!13113 false index!487 x!534))))

(declare-fun b!1525103 () Bool)

(assert (=> b!1525103 (and (bvsge (index!54849 lt!660391) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660391) (size!49477 a!2804)))))

(declare-fun res!1043548 () Bool)

(assert (=> b!1525103 (= res!1043548 (= (select (arr!48925 a!2804) (index!54849 lt!660391)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525103 (=> res!1043548 e!850102)))

(declare-fun b!1525104 () Bool)

(assert (=> b!1525104 (and (bvsge (index!54849 lt!660391) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660391) (size!49477 a!2804)))))

(assert (=> b!1525104 (= e!850102 (= (select (arr!48925 a!2804) (index!54849 lt!660391)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159233 () Bool)

(assert (=> d!159233 e!850103))

(declare-fun c!140329 () Bool)

(assert (=> d!159233 (= c!140329 (and ((_ is Intermediate!13113) lt!660391) (undefined!13925 lt!660391)))))

(assert (=> d!159233 (= lt!660391 e!850099)))

(declare-fun c!140330 () Bool)

(assert (=> d!159233 (= c!140330 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159233 (= lt!660392 (select (arr!48925 a!2804) index!487))))

(assert (=> d!159233 (validMask!0 mask!2512)))

(assert (=> d!159233 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660391)))

(assert (= (and d!159233 c!140330) b!1525097))

(assert (= (and d!159233 (not c!140330)) b!1525096))

(assert (= (and b!1525096 c!140331) b!1525102))

(assert (= (and b!1525096 (not c!140331)) b!1525100))

(assert (= (and d!159233 c!140329) b!1525099))

(assert (= (and d!159233 (not c!140329)) b!1525098))

(assert (= (and b!1525098 res!1043546) b!1525101))

(assert (= (and b!1525101 (not res!1043547)) b!1525103))

(assert (= (and b!1525103 (not res!1043548)) b!1525104))

(assert (=> d!159233 m!1407213))

(assert (=> d!159233 m!1407195))

(assert (=> b!1525100 m!1407325))

(assert (=> b!1525100 m!1407325))

(assert (=> b!1525100 m!1407173))

(declare-fun m!1407381 () Bool)

(assert (=> b!1525100 m!1407381))

(declare-fun m!1407383 () Bool)

(assert (=> b!1525104 m!1407383))

(assert (=> b!1525103 m!1407383))

(assert (=> b!1525101 m!1407383))

(assert (=> b!1524869 d!159233))

(declare-fun b!1525113 () Bool)

(declare-fun e!850108 () SeekEntryResult!13113)

(declare-fun e!850109 () SeekEntryResult!13113)

(assert (=> b!1525113 (= e!850108 e!850109)))

(declare-fun c!140338 () Bool)

(declare-fun lt!660396 () (_ BitVec 64))

(assert (=> b!1525113 (= c!140338 (or (= lt!660396 lt!660294) (= (bvadd lt!660396 lt!660396) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525114 () Bool)

(assert (=> b!1525114 (= e!850108 (Intermediate!13113 true (toIndex!0 lt!660294 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525115 () Bool)

(declare-fun e!850112 () Bool)

(declare-fun e!850110 () Bool)

(assert (=> b!1525115 (= e!850112 e!850110)))

(declare-fun res!1043549 () Bool)

(declare-fun lt!660395 () SeekEntryResult!13113)

(assert (=> b!1525115 (= res!1043549 (and ((_ is Intermediate!13113) lt!660395) (not (undefined!13925 lt!660395)) (bvslt (x!136545 lt!660395) #b01111111111111111111111111111110) (bvsge (x!136545 lt!660395) #b00000000000000000000000000000000) (bvsge (x!136545 lt!660395) #b00000000000000000000000000000000)))))

(assert (=> b!1525115 (=> (not res!1043549) (not e!850110))))

(declare-fun b!1525116 () Bool)

(assert (=> b!1525116 (= e!850112 (bvsge (x!136545 lt!660395) #b01111111111111111111111111111110))))

(declare-fun b!1525117 () Bool)

(assert (=> b!1525117 (= e!850109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660294 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660294 lt!660297 mask!2512))))

(declare-fun b!1525118 () Bool)

(assert (=> b!1525118 (and (bvsge (index!54849 lt!660395) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660395) (size!49477 lt!660297)))))

(declare-fun res!1043550 () Bool)

(assert (=> b!1525118 (= res!1043550 (= (select (arr!48925 lt!660297) (index!54849 lt!660395)) lt!660294))))

(declare-fun e!850111 () Bool)

(assert (=> b!1525118 (=> res!1043550 e!850111)))

(assert (=> b!1525118 (= e!850110 e!850111)))

(declare-fun b!1525119 () Bool)

(assert (=> b!1525119 (= e!850109 (Intermediate!13113 false (toIndex!0 lt!660294 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525120 () Bool)

(assert (=> b!1525120 (and (bvsge (index!54849 lt!660395) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660395) (size!49477 lt!660297)))))

(declare-fun res!1043551 () Bool)

(assert (=> b!1525120 (= res!1043551 (= (select (arr!48925 lt!660297) (index!54849 lt!660395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525120 (=> res!1043551 e!850111)))

(declare-fun b!1525121 () Bool)

(assert (=> b!1525121 (and (bvsge (index!54849 lt!660395) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660395) (size!49477 lt!660297)))))

(assert (=> b!1525121 (= e!850111 (= (select (arr!48925 lt!660297) (index!54849 lt!660395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159247 () Bool)

(assert (=> d!159247 e!850112))

(declare-fun c!140336 () Bool)

(assert (=> d!159247 (= c!140336 (and ((_ is Intermediate!13113) lt!660395) (undefined!13925 lt!660395)))))

(assert (=> d!159247 (= lt!660395 e!850108)))

(declare-fun c!140337 () Bool)

(assert (=> d!159247 (= c!140337 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159247 (= lt!660396 (select (arr!48925 lt!660297) (toIndex!0 lt!660294 mask!2512)))))

(assert (=> d!159247 (validMask!0 mask!2512)))

(assert (=> d!159247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660294 mask!2512) lt!660294 lt!660297 mask!2512) lt!660395)))

(assert (= (and d!159247 c!140337) b!1525114))

(assert (= (and d!159247 (not c!140337)) b!1525113))

(assert (= (and b!1525113 c!140338) b!1525119))

(assert (= (and b!1525113 (not c!140338)) b!1525117))

(assert (= (and d!159247 c!140336) b!1525116))

(assert (= (and d!159247 (not c!140336)) b!1525115))

(assert (= (and b!1525115 res!1043549) b!1525118))

(assert (= (and b!1525118 (not res!1043550)) b!1525120))

(assert (= (and b!1525120 (not res!1043551)) b!1525121))

(assert (=> d!159247 m!1407205))

(declare-fun m!1407385 () Bool)

(assert (=> d!159247 m!1407385))

(assert (=> d!159247 m!1407195))

(assert (=> b!1525117 m!1407205))

(declare-fun m!1407387 () Bool)

(assert (=> b!1525117 m!1407387))

(assert (=> b!1525117 m!1407387))

(declare-fun m!1407389 () Bool)

(assert (=> b!1525117 m!1407389))

(declare-fun m!1407391 () Bool)

(assert (=> b!1525121 m!1407391))

(assert (=> b!1525120 m!1407391))

(assert (=> b!1525118 m!1407391))

(assert (=> b!1524870 d!159247))

(declare-fun d!159249 () Bool)

(declare-fun lt!660413 () (_ BitVec 32))

(declare-fun lt!660412 () (_ BitVec 32))

(assert (=> d!159249 (= lt!660413 (bvmul (bvxor lt!660412 (bvlshr lt!660412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159249 (= lt!660412 ((_ extract 31 0) (bvand (bvxor lt!660294 (bvlshr lt!660294 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159249 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043552 (let ((h!36917 ((_ extract 31 0) (bvand (bvxor lt!660294 (bvlshr lt!660294 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136552 (bvmul (bvxor h!36917 (bvlshr h!36917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136552 (bvlshr x!136552 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043552 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043552 #b00000000000000000000000000000000))))))

(assert (=> d!159249 (= (toIndex!0 lt!660294 mask!2512) (bvand (bvxor lt!660413 (bvlshr lt!660413 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524870 d!159249))

(declare-fun b!1525140 () Bool)

(declare-fun e!850122 () SeekEntryResult!13113)

(declare-fun e!850123 () SeekEntryResult!13113)

(assert (=> b!1525140 (= e!850122 e!850123)))

(declare-fun c!140350 () Bool)

(declare-fun lt!660415 () (_ BitVec 64))

(assert (=> b!1525140 (= c!140350 (or (= lt!660415 (select (arr!48925 a!2804) j!70)) (= (bvadd lt!660415 lt!660415) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525141 () Bool)

(assert (=> b!1525141 (= e!850122 (Intermediate!13113 true (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525142 () Bool)

(declare-fun e!850126 () Bool)

(declare-fun e!850124 () Bool)

(assert (=> b!1525142 (= e!850126 e!850124)))

(declare-fun res!1043553 () Bool)

(declare-fun lt!660414 () SeekEntryResult!13113)

(assert (=> b!1525142 (= res!1043553 (and ((_ is Intermediate!13113) lt!660414) (not (undefined!13925 lt!660414)) (bvslt (x!136545 lt!660414) #b01111111111111111111111111111110) (bvsge (x!136545 lt!660414) #b00000000000000000000000000000000) (bvsge (x!136545 lt!660414) #b00000000000000000000000000000000)))))

(assert (=> b!1525142 (=> (not res!1043553) (not e!850124))))

(declare-fun b!1525143 () Bool)

(assert (=> b!1525143 (= e!850126 (bvsge (x!136545 lt!660414) #b01111111111111111111111111111110))))

(declare-fun b!1525144 () Bool)

(assert (=> b!1525144 (= e!850123 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525145 () Bool)

(assert (=> b!1525145 (and (bvsge (index!54849 lt!660414) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660414) (size!49477 a!2804)))))

(declare-fun res!1043554 () Bool)

(assert (=> b!1525145 (= res!1043554 (= (select (arr!48925 a!2804) (index!54849 lt!660414)) (select (arr!48925 a!2804) j!70)))))

(declare-fun e!850125 () Bool)

(assert (=> b!1525145 (=> res!1043554 e!850125)))

(assert (=> b!1525145 (= e!850124 e!850125)))

(declare-fun b!1525146 () Bool)

(assert (=> b!1525146 (= e!850123 (Intermediate!13113 false (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525147 () Bool)

(assert (=> b!1525147 (and (bvsge (index!54849 lt!660414) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660414) (size!49477 a!2804)))))

(declare-fun res!1043555 () Bool)

(assert (=> b!1525147 (= res!1043555 (= (select (arr!48925 a!2804) (index!54849 lt!660414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525147 (=> res!1043555 e!850125)))

(declare-fun b!1525148 () Bool)

(assert (=> b!1525148 (and (bvsge (index!54849 lt!660414) #b00000000000000000000000000000000) (bvslt (index!54849 lt!660414) (size!49477 a!2804)))))

(assert (=> b!1525148 (= e!850125 (= (select (arr!48925 a!2804) (index!54849 lt!660414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159253 () Bool)

(assert (=> d!159253 e!850126))

(declare-fun c!140348 () Bool)

(assert (=> d!159253 (= c!140348 (and ((_ is Intermediate!13113) lt!660414) (undefined!13925 lt!660414)))))

(assert (=> d!159253 (= lt!660414 e!850122)))

(declare-fun c!140349 () Bool)

(assert (=> d!159253 (= c!140349 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159253 (= lt!660415 (select (arr!48925 a!2804) (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512)))))

(assert (=> d!159253 (validMask!0 mask!2512)))

(assert (=> d!159253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660414)))

(assert (= (and d!159253 c!140349) b!1525141))

(assert (= (and d!159253 (not c!140349)) b!1525140))

(assert (= (and b!1525140 c!140350) b!1525146))

(assert (= (and b!1525140 (not c!140350)) b!1525144))

(assert (= (and d!159253 c!140348) b!1525143))

(assert (= (and d!159253 (not c!140348)) b!1525142))

(assert (= (and b!1525142 res!1043553) b!1525145))

(assert (= (and b!1525145 (not res!1043554)) b!1525147))

(assert (= (and b!1525147 (not res!1043555)) b!1525148))

(assert (=> d!159253 m!1407191))

(declare-fun m!1407403 () Bool)

(assert (=> d!159253 m!1407403))

(assert (=> d!159253 m!1407195))

(assert (=> b!1525144 m!1407191))

(declare-fun m!1407405 () Bool)

(assert (=> b!1525144 m!1407405))

(assert (=> b!1525144 m!1407405))

(assert (=> b!1525144 m!1407173))

(declare-fun m!1407407 () Bool)

(assert (=> b!1525144 m!1407407))

(declare-fun m!1407409 () Bool)

(assert (=> b!1525148 m!1407409))

(assert (=> b!1525147 m!1407409))

(assert (=> b!1525145 m!1407409))

(assert (=> b!1524866 d!159253))

(declare-fun d!159255 () Bool)

(declare-fun lt!660417 () (_ BitVec 32))

(declare-fun lt!660416 () (_ BitVec 32))

(assert (=> d!159255 (= lt!660417 (bvmul (bvxor lt!660416 (bvlshr lt!660416 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159255 (= lt!660416 ((_ extract 31 0) (bvand (bvxor (select (arr!48925 a!2804) j!70) (bvlshr (select (arr!48925 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159255 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043552 (let ((h!36917 ((_ extract 31 0) (bvand (bvxor (select (arr!48925 a!2804) j!70) (bvlshr (select (arr!48925 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136552 (bvmul (bvxor h!36917 (bvlshr h!36917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136552 (bvlshr x!136552 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043552 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043552 #b00000000000000000000000000000000))))))

(assert (=> d!159255 (= (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (bvand (bvxor lt!660417 (bvlshr lt!660417 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524866 d!159255))

(declare-fun b!1525155 () Bool)

(declare-fun e!850131 () SeekEntryResult!13113)

(declare-fun lt!660423 () SeekEntryResult!13113)

(assert (=> b!1525155 (= e!850131 (Found!13113 (index!54849 lt!660423)))))

(declare-fun b!1525156 () Bool)

(declare-fun e!850130 () SeekEntryResult!13113)

(assert (=> b!1525156 (= e!850130 e!850131)))

(declare-fun lt!660424 () (_ BitVec 64))

(assert (=> b!1525156 (= lt!660424 (select (arr!48925 lt!660297) (index!54849 lt!660423)))))

(declare-fun c!140355 () Bool)

(assert (=> b!1525156 (= c!140355 (= lt!660424 lt!660294))))

(declare-fun b!1525157 () Bool)

(assert (=> b!1525157 (= e!850130 Undefined!13113)))

(declare-fun d!159257 () Bool)

(declare-fun lt!660422 () SeekEntryResult!13113)

(assert (=> d!159257 (and (or ((_ is Undefined!13113) lt!660422) (not ((_ is Found!13113) lt!660422)) (and (bvsge (index!54848 lt!660422) #b00000000000000000000000000000000) (bvslt (index!54848 lt!660422) (size!49477 lt!660297)))) (or ((_ is Undefined!13113) lt!660422) ((_ is Found!13113) lt!660422) (not ((_ is MissingZero!13113) lt!660422)) (and (bvsge (index!54847 lt!660422) #b00000000000000000000000000000000) (bvslt (index!54847 lt!660422) (size!49477 lt!660297)))) (or ((_ is Undefined!13113) lt!660422) ((_ is Found!13113) lt!660422) ((_ is MissingZero!13113) lt!660422) (not ((_ is MissingVacant!13113) lt!660422)) (and (bvsge (index!54850 lt!660422) #b00000000000000000000000000000000) (bvslt (index!54850 lt!660422) (size!49477 lt!660297)))) (or ((_ is Undefined!13113) lt!660422) (ite ((_ is Found!13113) lt!660422) (= (select (arr!48925 lt!660297) (index!54848 lt!660422)) lt!660294) (ite ((_ is MissingZero!13113) lt!660422) (= (select (arr!48925 lt!660297) (index!54847 lt!660422)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13113) lt!660422) (= (select (arr!48925 lt!660297) (index!54850 lt!660422)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159257 (= lt!660422 e!850130)))

(declare-fun c!140356 () Bool)

(assert (=> d!159257 (= c!140356 (and ((_ is Intermediate!13113) lt!660423) (undefined!13925 lt!660423)))))

(assert (=> d!159257 (= lt!660423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660294 mask!2512) lt!660294 lt!660297 mask!2512))))

(assert (=> d!159257 (validMask!0 mask!2512)))

(assert (=> d!159257 (= (seekEntryOrOpen!0 lt!660294 lt!660297 mask!2512) lt!660422)))

(declare-fun b!1525158 () Bool)

(declare-fun c!140354 () Bool)

(assert (=> b!1525158 (= c!140354 (= lt!660424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850132 () SeekEntryResult!13113)

(assert (=> b!1525158 (= e!850131 e!850132)))

(declare-fun b!1525159 () Bool)

(assert (=> b!1525159 (= e!850132 (MissingZero!13113 (index!54849 lt!660423)))))

(declare-fun b!1525160 () Bool)

(assert (=> b!1525160 (= e!850132 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!660423) (index!54849 lt!660423) (index!54849 lt!660423) lt!660294 lt!660297 mask!2512))))

(assert (= (and d!159257 c!140356) b!1525157))

(assert (= (and d!159257 (not c!140356)) b!1525156))

(assert (= (and b!1525156 c!140355) b!1525155))

(assert (= (and b!1525156 (not c!140355)) b!1525158))

(assert (= (and b!1525158 c!140354) b!1525159))

(assert (= (and b!1525158 (not c!140354)) b!1525160))

(declare-fun m!1407413 () Bool)

(assert (=> b!1525156 m!1407413))

(declare-fun m!1407417 () Bool)

(assert (=> d!159257 m!1407417))

(declare-fun m!1407419 () Bool)

(assert (=> d!159257 m!1407419))

(assert (=> d!159257 m!1407195))

(assert (=> d!159257 m!1407205))

(declare-fun m!1407423 () Bool)

(assert (=> d!159257 m!1407423))

(assert (=> d!159257 m!1407205))

(assert (=> d!159257 m!1407207))

(declare-fun m!1407425 () Bool)

(assert (=> b!1525160 m!1407425))

(assert (=> b!1524867 d!159257))

(declare-fun b!1525161 () Bool)

(declare-fun e!850133 () SeekEntryResult!13113)

(assert (=> b!1525161 (= e!850133 Undefined!13113)))

(declare-fun b!1525162 () Bool)

(declare-fun e!850135 () SeekEntryResult!13113)

(assert (=> b!1525162 (= e!850133 e!850135)))

(declare-fun c!140359 () Bool)

(declare-fun lt!660426 () (_ BitVec 64))

(assert (=> b!1525162 (= c!140359 (= lt!660426 lt!660294))))

(declare-fun lt!660425 () SeekEntryResult!13113)

(declare-fun d!159261 () Bool)

(assert (=> d!159261 (and (or ((_ is Undefined!13113) lt!660425) (not ((_ is Found!13113) lt!660425)) (and (bvsge (index!54848 lt!660425) #b00000000000000000000000000000000) (bvslt (index!54848 lt!660425) (size!49477 lt!660297)))) (or ((_ is Undefined!13113) lt!660425) ((_ is Found!13113) lt!660425) (not ((_ is MissingVacant!13113) lt!660425)) (not (= (index!54850 lt!660425) index!487)) (and (bvsge (index!54850 lt!660425) #b00000000000000000000000000000000) (bvslt (index!54850 lt!660425) (size!49477 lt!660297)))) (or ((_ is Undefined!13113) lt!660425) (ite ((_ is Found!13113) lt!660425) (= (select (arr!48925 lt!660297) (index!54848 lt!660425)) lt!660294) (and ((_ is MissingVacant!13113) lt!660425) (= (index!54850 lt!660425) index!487) (= (select (arr!48925 lt!660297) (index!54850 lt!660425)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159261 (= lt!660425 e!850133)))

(declare-fun c!140357 () Bool)

(assert (=> d!159261 (= c!140357 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159261 (= lt!660426 (select (arr!48925 lt!660297) index!487))))

(assert (=> d!159261 (validMask!0 mask!2512)))

(assert (=> d!159261 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660294 lt!660297 mask!2512) lt!660425)))

(declare-fun b!1525163 () Bool)

(declare-fun e!850134 () SeekEntryResult!13113)

(assert (=> b!1525163 (= e!850134 (MissingVacant!13113 index!487))))

(declare-fun b!1525164 () Bool)

(assert (=> b!1525164 (= e!850135 (Found!13113 index!487))))

(declare-fun b!1525165 () Bool)

(declare-fun c!140358 () Bool)

(assert (=> b!1525165 (= c!140358 (= lt!660426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525165 (= e!850135 e!850134)))

(declare-fun b!1525166 () Bool)

(assert (=> b!1525166 (= e!850134 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!660294 lt!660297 mask!2512))))

(assert (= (and d!159261 c!140357) b!1525161))

(assert (= (and d!159261 (not c!140357)) b!1525162))

(assert (= (and b!1525162 c!140359) b!1525164))

(assert (= (and b!1525162 (not c!140359)) b!1525165))

(assert (= (and b!1525165 c!140358) b!1525163))

(assert (= (and b!1525165 (not c!140358)) b!1525166))

(declare-fun m!1407427 () Bool)

(assert (=> d!159261 m!1407427))

(declare-fun m!1407429 () Bool)

(assert (=> d!159261 m!1407429))

(declare-fun m!1407431 () Bool)

(assert (=> d!159261 m!1407431))

(assert (=> d!159261 m!1407195))

(assert (=> b!1525166 m!1407325))

(assert (=> b!1525166 m!1407325))

(declare-fun m!1407433 () Bool)

(assert (=> b!1525166 m!1407433))

(assert (=> b!1524867 d!159261))

(declare-fun b!1525167 () Bool)

(declare-fun e!850136 () Bool)

(declare-fun e!850137 () Bool)

(assert (=> b!1525167 (= e!850136 e!850137)))

(declare-fun lt!660429 () (_ BitVec 64))

(assert (=> b!1525167 (= lt!660429 (select (arr!48925 a!2804) j!70))))

(declare-fun lt!660428 () Unit!50849)

(assert (=> b!1525167 (= lt!660428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660429 j!70))))

(assert (=> b!1525167 (arrayContainsKey!0 a!2804 lt!660429 #b00000000000000000000000000000000)))

(declare-fun lt!660427 () Unit!50849)

(assert (=> b!1525167 (= lt!660427 lt!660428)))

(declare-fun res!1043557 () Bool)

(assert (=> b!1525167 (= res!1043557 (= (seekEntryOrOpen!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) (Found!13113 j!70)))))

(assert (=> b!1525167 (=> (not res!1043557) (not e!850137))))

(declare-fun b!1525168 () Bool)

(declare-fun call!68424 () Bool)

(assert (=> b!1525168 (= e!850137 call!68424)))

(declare-fun b!1525169 () Bool)

(declare-fun e!850138 () Bool)

(assert (=> b!1525169 (= e!850138 e!850136)))

(declare-fun c!140360 () Bool)

(assert (=> b!1525169 (= c!140360 (validKeyInArray!0 (select (arr!48925 a!2804) j!70)))))

(declare-fun b!1525170 () Bool)

(assert (=> b!1525170 (= e!850136 call!68424)))

(declare-fun bm!68421 () Bool)

(assert (=> bm!68421 (= call!68424 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159263 () Bool)

(declare-fun res!1043556 () Bool)

(assert (=> d!159263 (=> res!1043556 e!850138)))

(assert (=> d!159263 (= res!1043556 (bvsge j!70 (size!49477 a!2804)))))

(assert (=> d!159263 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850138)))

(assert (= (and d!159263 (not res!1043556)) b!1525169))

(assert (= (and b!1525169 c!140360) b!1525167))

(assert (= (and b!1525169 (not c!140360)) b!1525170))

(assert (= (and b!1525167 res!1043557) b!1525168))

(assert (= (or b!1525168 b!1525170) bm!68421))

(assert (=> b!1525167 m!1407173))

(declare-fun m!1407435 () Bool)

(assert (=> b!1525167 m!1407435))

(declare-fun m!1407437 () Bool)

(assert (=> b!1525167 m!1407437))

(assert (=> b!1525167 m!1407173))

(assert (=> b!1525167 m!1407175))

(assert (=> b!1525169 m!1407173))

(assert (=> b!1525169 m!1407173))

(assert (=> b!1525169 m!1407189))

(declare-fun m!1407439 () Bool)

(assert (=> bm!68421 m!1407439))

(assert (=> b!1524863 d!159263))

(declare-fun d!159265 () Bool)

(assert (=> d!159265 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660438 () Unit!50849)

(declare-fun choose!38 (array!101392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50849)

(assert (=> d!159265 (= lt!660438 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159265 (validMask!0 mask!2512)))

(assert (=> d!159265 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660438)))

(declare-fun bs!43723 () Bool)

(assert (= bs!43723 d!159265))

(assert (=> bs!43723 m!1407215))

(declare-fun m!1407441 () Bool)

(assert (=> bs!43723 m!1407441))

(assert (=> bs!43723 m!1407195))

(assert (=> b!1524863 d!159265))

(declare-fun b!1525228 () Bool)

(declare-fun c!140382 () Bool)

(declare-fun lt!660462 () (_ BitVec 64))

(assert (=> b!1525228 (= c!140382 (= lt!660462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850176 () SeekEntryResult!13113)

(declare-fun e!850175 () SeekEntryResult!13113)

(assert (=> b!1525228 (= e!850176 e!850175)))

(declare-fun d!159267 () Bool)

(declare-fun lt!660459 () SeekEntryResult!13113)

(assert (=> d!159267 (and (or ((_ is MissingVacant!13113) lt!660459) (not ((_ is Found!13113) lt!660459)) (and (bvsge (index!54848 lt!660459) #b00000000000000000000000000000000) (bvslt (index!54848 lt!660459) (size!49477 a!2804)))) (not ((_ is MissingVacant!13113) lt!660459)) (or (not ((_ is Found!13113) lt!660459)) (= (select (arr!48925 a!2804) (index!54848 lt!660459)) (select (arr!48925 a!2804) j!70))))))

(declare-fun e!850177 () SeekEntryResult!13113)

(assert (=> d!159267 (= lt!660459 e!850177)))

(declare-fun c!140383 () Bool)

(declare-fun lt!660461 () SeekEntryResult!13113)

(assert (=> d!159267 (= c!140383 (and ((_ is Intermediate!13113) lt!660461) (undefined!13925 lt!660461)))))

(assert (=> d!159267 (= lt!660461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48925 a!2804) j!70) mask!2512) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159267 (validMask!0 mask!2512)))

(assert (=> d!159267 (= (seekEntry!0 (select (arr!48925 a!2804) j!70) a!2804 mask!2512) lt!660459)))

(declare-fun b!1525229 () Bool)

(assert (=> b!1525229 (= e!850177 Undefined!13113)))

(declare-fun b!1525230 () Bool)

(assert (=> b!1525230 (= e!850175 (MissingZero!13113 (index!54849 lt!660461)))))

(declare-fun b!1525231 () Bool)

(assert (=> b!1525231 (= e!850176 (Found!13113 (index!54849 lt!660461)))))

(declare-fun b!1525232 () Bool)

(declare-fun lt!660460 () SeekEntryResult!13113)

(assert (=> b!1525232 (= e!850175 (ite ((_ is MissingVacant!13113) lt!660460) (MissingZero!13113 (index!54850 lt!660460)) lt!660460))))

(assert (=> b!1525232 (= lt!660460 (seekKeyOrZeroReturnVacant!0 (x!136545 lt!660461) (index!54849 lt!660461) (index!54849 lt!660461) (select (arr!48925 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525233 () Bool)

(assert (=> b!1525233 (= e!850177 e!850176)))

(assert (=> b!1525233 (= lt!660462 (select (arr!48925 a!2804) (index!54849 lt!660461)))))

(declare-fun c!140384 () Bool)

(assert (=> b!1525233 (= c!140384 (= lt!660462 (select (arr!48925 a!2804) j!70)))))

(assert (= (and d!159267 c!140383) b!1525229))

(assert (= (and d!159267 (not c!140383)) b!1525233))

(assert (= (and b!1525233 c!140384) b!1525231))

(assert (= (and b!1525233 (not c!140384)) b!1525228))

(assert (= (and b!1525228 c!140382) b!1525230))

(assert (= (and b!1525228 (not c!140382)) b!1525232))

(declare-fun m!1407469 () Bool)

(assert (=> d!159267 m!1407469))

(assert (=> d!159267 m!1407173))

(assert (=> d!159267 m!1407191))

(assert (=> d!159267 m!1407191))

(assert (=> d!159267 m!1407173))

(assert (=> d!159267 m!1407193))

(assert (=> d!159267 m!1407195))

(assert (=> b!1525232 m!1407173))

(declare-fun m!1407471 () Bool)

(assert (=> b!1525232 m!1407471))

(declare-fun m!1407473 () Bool)

(assert (=> b!1525233 m!1407473))

(assert (=> b!1524865 d!159267))

(check-sat (not bm!68419) (not b!1525169) (not d!159265) (not d!159267) (not b!1525100) (not b!1525232) (not b!1525117) (not b!1525015) (not bm!68416) (not b!1525030) (not d!159201) (not d!159253) (not b!1524976) (not b!1525144) (not b!1525160) (not d!159247) (not b!1525032) (not b!1525166) (not b!1525167) (not d!159257) (not d!159261) (not d!159233) (not d!159203) (not bm!68421) (not b!1525017) (not b!1524994) (not b!1525033))
(check-sat)
