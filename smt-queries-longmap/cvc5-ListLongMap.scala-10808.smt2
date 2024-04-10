; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126496 () Bool)

(assert start!126496)

(declare-fun b!1483414 () Bool)

(declare-fun res!1008298 () Bool)

(declare-fun e!831795 () Bool)

(assert (=> b!1483414 (=> (not res!1008298) (not e!831795))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12245 0))(
  ( (MissingZero!12245 (index!51372 (_ BitVec 32))) (Found!12245 (index!51373 (_ BitVec 32))) (Intermediate!12245 (undefined!13057 Bool) (index!51374 (_ BitVec 32)) (x!132961 (_ BitVec 32))) (Undefined!12245) (MissingVacant!12245 (index!51375 (_ BitVec 32))) )
))
(declare-fun lt!647419 () SeekEntryResult!12245)

(declare-datatypes ((array!99458 0))(
  ( (array!99459 (arr!48005 (Array (_ BitVec 32) (_ BitVec 64))) (size!48555 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99458)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99458 (_ BitVec 32)) SeekEntryResult!12245)

(assert (=> b!1483414 (= res!1008298 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48005 a!2862) j!93) a!2862 mask!2687) lt!647419))))

(declare-fun b!1483415 () Bool)

(declare-fun res!1008305 () Bool)

(declare-fun e!831788 () Bool)

(assert (=> b!1483415 (=> (not res!1008305) (not e!831788))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483415 (= res!1008305 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483416 () Bool)

(declare-fun res!1008307 () Bool)

(declare-fun e!831792 () Bool)

(assert (=> b!1483416 (=> (not res!1008307) (not e!831792))))

(assert (=> b!1483416 (= res!1008307 (and (= (size!48555 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48555 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48555 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!647422 () (_ BitVec 64))

(declare-fun e!831790 () Bool)

(declare-fun b!1483417 () Bool)

(declare-fun lt!647418 () array!99458)

(declare-fun lt!647423 () SeekEntryResult!12245)

(assert (=> b!1483417 (= e!831790 (= lt!647423 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647422 lt!647418 mask!2687)))))

(declare-fun b!1483418 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99458 (_ BitVec 32)) SeekEntryResult!12245)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99458 (_ BitVec 32)) SeekEntryResult!12245)

(assert (=> b!1483418 (= e!831790 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647422 lt!647418 mask!2687) (seekEntryOrOpen!0 lt!647422 lt!647418 mask!2687)))))

(declare-fun b!1483419 () Bool)

(declare-fun e!831794 () Bool)

(assert (=> b!1483419 (= e!831794 e!831795)))

(declare-fun res!1008294 () Bool)

(assert (=> b!1483419 (=> (not res!1008294) (not e!831795))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483419 (= res!1008294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48005 a!2862) j!93) mask!2687) (select (arr!48005 a!2862) j!93) a!2862 mask!2687) lt!647419))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483419 (= lt!647419 (Intermediate!12245 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483420 () Bool)

(declare-fun res!1008297 () Bool)

(declare-fun e!831796 () Bool)

(assert (=> b!1483420 (=> (not res!1008297) (not e!831796))))

(assert (=> b!1483420 (= res!1008297 (or (= (select (arr!48005 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48005 a!2862) intermediateBeforeIndex!19) (select (arr!48005 a!2862) j!93))))))

(declare-fun b!1483421 () Bool)

(declare-fun res!1008304 () Bool)

(assert (=> b!1483421 (=> (not res!1008304) (not e!831792))))

(declare-datatypes ((List!34506 0))(
  ( (Nil!34503) (Cons!34502 (h!35876 (_ BitVec 64)) (t!49200 List!34506)) )
))
(declare-fun arrayNoDuplicates!0 (array!99458 (_ BitVec 32) List!34506) Bool)

(assert (=> b!1483421 (= res!1008304 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34503))))

(declare-fun res!1008303 () Bool)

(assert (=> start!126496 (=> (not res!1008303) (not e!831792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126496 (= res!1008303 (validMask!0 mask!2687))))

(assert (=> start!126496 e!831792))

(assert (=> start!126496 true))

(declare-fun array_inv!37033 (array!99458) Bool)

(assert (=> start!126496 (array_inv!37033 a!2862)))

(declare-fun b!1483422 () Bool)

(assert (=> b!1483422 (= e!831795 e!831788)))

(declare-fun res!1008290 () Bool)

(assert (=> b!1483422 (=> (not res!1008290) (not e!831788))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483422 (= res!1008290 (= lt!647423 (Intermediate!12245 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483422 (= lt!647423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647422 mask!2687) lt!647422 lt!647418 mask!2687))))

(assert (=> b!1483422 (= lt!647422 (select (store (arr!48005 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483423 () Bool)

(declare-fun e!831793 () Bool)

(assert (=> b!1483423 (= e!831793 true)))

(declare-fun lt!647421 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483423 (= lt!647421 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483424 () Bool)

(declare-fun res!1008296 () Bool)

(assert (=> b!1483424 (=> (not res!1008296) (not e!831792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483424 (= res!1008296 (validKeyInArray!0 (select (arr!48005 a!2862) i!1006)))))

(declare-fun b!1483425 () Bool)

(assert (=> b!1483425 (= e!831792 e!831794)))

(declare-fun res!1008302 () Bool)

(assert (=> b!1483425 (=> (not res!1008302) (not e!831794))))

(assert (=> b!1483425 (= res!1008302 (= (select (store (arr!48005 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483425 (= lt!647418 (array!99459 (store (arr!48005 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48555 a!2862)))))

(declare-fun b!1483426 () Bool)

(declare-fun res!1008299 () Bool)

(assert (=> b!1483426 (=> (not res!1008299) (not e!831796))))

(assert (=> b!1483426 (= res!1008299 (= (seekEntryOrOpen!0 (select (arr!48005 a!2862) j!93) a!2862 mask!2687) (Found!12245 j!93)))))

(declare-fun b!1483427 () Bool)

(declare-fun e!831791 () Bool)

(assert (=> b!1483427 (= e!831796 e!831791)))

(declare-fun res!1008300 () Bool)

(assert (=> b!1483427 (=> res!1008300 e!831791)))

(declare-fun lt!647420 () (_ BitVec 64))

(assert (=> b!1483427 (= res!1008300 (or (and (= (select (arr!48005 a!2862) index!646) lt!647420) (= (select (arr!48005 a!2862) index!646) (select (arr!48005 a!2862) j!93))) (= (select (arr!48005 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483427 (= lt!647420 (select (store (arr!48005 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483428 () Bool)

(assert (=> b!1483428 (= e!831788 (not e!831793))))

(declare-fun res!1008292 () Bool)

(assert (=> b!1483428 (=> res!1008292 e!831793)))

(assert (=> b!1483428 (= res!1008292 (or (and (= (select (arr!48005 a!2862) index!646) (select (store (arr!48005 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48005 a!2862) index!646) (select (arr!48005 a!2862) j!93))) (= (select (arr!48005 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483428 e!831796))

(declare-fun res!1008291 () Bool)

(assert (=> b!1483428 (=> (not res!1008291) (not e!831796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99458 (_ BitVec 32)) Bool)

(assert (=> b!1483428 (= res!1008291 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49830 0))(
  ( (Unit!49831) )
))
(declare-fun lt!647424 () Unit!49830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49830)

(assert (=> b!1483428 (= lt!647424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483429 () Bool)

(declare-fun e!831789 () Bool)

(assert (=> b!1483429 (= e!831789 (= (seekEntryOrOpen!0 lt!647422 lt!647418 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647422 lt!647418 mask!2687)))))

(declare-fun b!1483430 () Bool)

(declare-fun res!1008293 () Bool)

(assert (=> b!1483430 (=> (not res!1008293) (not e!831792))))

(assert (=> b!1483430 (= res!1008293 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48555 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48555 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48555 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483431 () Bool)

(declare-fun res!1008306 () Bool)

(assert (=> b!1483431 (=> (not res!1008306) (not e!831792))))

(assert (=> b!1483431 (= res!1008306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483432 () Bool)

(declare-fun res!1008301 () Bool)

(assert (=> b!1483432 (=> (not res!1008301) (not e!831788))))

(assert (=> b!1483432 (= res!1008301 e!831790)))

(declare-fun c!137085 () Bool)

(assert (=> b!1483432 (= c!137085 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483433 () Bool)

(assert (=> b!1483433 (= e!831791 e!831789)))

(declare-fun res!1008295 () Bool)

(assert (=> b!1483433 (=> (not res!1008295) (not e!831789))))

(assert (=> b!1483433 (= res!1008295 (and (= index!646 intermediateAfterIndex!19) (= lt!647420 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483434 () Bool)

(declare-fun res!1008289 () Bool)

(assert (=> b!1483434 (=> (not res!1008289) (not e!831792))))

(assert (=> b!1483434 (= res!1008289 (validKeyInArray!0 (select (arr!48005 a!2862) j!93)))))

(assert (= (and start!126496 res!1008303) b!1483416))

(assert (= (and b!1483416 res!1008307) b!1483424))

(assert (= (and b!1483424 res!1008296) b!1483434))

(assert (= (and b!1483434 res!1008289) b!1483431))

(assert (= (and b!1483431 res!1008306) b!1483421))

(assert (= (and b!1483421 res!1008304) b!1483430))

(assert (= (and b!1483430 res!1008293) b!1483425))

(assert (= (and b!1483425 res!1008302) b!1483419))

(assert (= (and b!1483419 res!1008294) b!1483414))

(assert (= (and b!1483414 res!1008298) b!1483422))

(assert (= (and b!1483422 res!1008290) b!1483432))

(assert (= (and b!1483432 c!137085) b!1483417))

(assert (= (and b!1483432 (not c!137085)) b!1483418))

(assert (= (and b!1483432 res!1008301) b!1483415))

(assert (= (and b!1483415 res!1008305) b!1483428))

(assert (= (and b!1483428 res!1008291) b!1483426))

(assert (= (and b!1483426 res!1008299) b!1483420))

(assert (= (and b!1483420 res!1008297) b!1483427))

(assert (= (and b!1483427 (not res!1008300)) b!1483433))

(assert (= (and b!1483433 res!1008295) b!1483429))

(assert (= (and b!1483428 (not res!1008292)) b!1483423))

(declare-fun m!1368901 () Bool)

(assert (=> b!1483414 m!1368901))

(assert (=> b!1483414 m!1368901))

(declare-fun m!1368903 () Bool)

(assert (=> b!1483414 m!1368903))

(declare-fun m!1368905 () Bool)

(assert (=> b!1483423 m!1368905))

(assert (=> b!1483426 m!1368901))

(assert (=> b!1483426 m!1368901))

(declare-fun m!1368907 () Bool)

(assert (=> b!1483426 m!1368907))

(declare-fun m!1368909 () Bool)

(assert (=> b!1483429 m!1368909))

(declare-fun m!1368911 () Bool)

(assert (=> b!1483429 m!1368911))

(declare-fun m!1368913 () Bool)

(assert (=> b!1483422 m!1368913))

(assert (=> b!1483422 m!1368913))

(declare-fun m!1368915 () Bool)

(assert (=> b!1483422 m!1368915))

(declare-fun m!1368917 () Bool)

(assert (=> b!1483422 m!1368917))

(declare-fun m!1368919 () Bool)

(assert (=> b!1483422 m!1368919))

(declare-fun m!1368921 () Bool)

(assert (=> b!1483428 m!1368921))

(assert (=> b!1483428 m!1368917))

(declare-fun m!1368923 () Bool)

(assert (=> b!1483428 m!1368923))

(declare-fun m!1368925 () Bool)

(assert (=> b!1483428 m!1368925))

(declare-fun m!1368927 () Bool)

(assert (=> b!1483428 m!1368927))

(assert (=> b!1483428 m!1368901))

(declare-fun m!1368929 () Bool)

(assert (=> b!1483420 m!1368929))

(assert (=> b!1483420 m!1368901))

(declare-fun m!1368931 () Bool)

(assert (=> b!1483424 m!1368931))

(assert (=> b!1483424 m!1368931))

(declare-fun m!1368933 () Bool)

(assert (=> b!1483424 m!1368933))

(assert (=> b!1483427 m!1368925))

(assert (=> b!1483427 m!1368901))

(assert (=> b!1483427 m!1368917))

(assert (=> b!1483427 m!1368923))

(declare-fun m!1368935 () Bool)

(assert (=> b!1483417 m!1368935))

(declare-fun m!1368937 () Bool)

(assert (=> b!1483431 m!1368937))

(assert (=> b!1483419 m!1368901))

(assert (=> b!1483419 m!1368901))

(declare-fun m!1368939 () Bool)

(assert (=> b!1483419 m!1368939))

(assert (=> b!1483419 m!1368939))

(assert (=> b!1483419 m!1368901))

(declare-fun m!1368941 () Bool)

(assert (=> b!1483419 m!1368941))

(assert (=> b!1483418 m!1368911))

(assert (=> b!1483418 m!1368909))

(assert (=> b!1483434 m!1368901))

(assert (=> b!1483434 m!1368901))

(declare-fun m!1368943 () Bool)

(assert (=> b!1483434 m!1368943))

(declare-fun m!1368945 () Bool)

(assert (=> b!1483421 m!1368945))

(assert (=> b!1483425 m!1368917))

(declare-fun m!1368947 () Bool)

(assert (=> b!1483425 m!1368947))

(declare-fun m!1368949 () Bool)

(assert (=> start!126496 m!1368949))

(declare-fun m!1368951 () Bool)

(assert (=> start!126496 m!1368951))

(push 1)

