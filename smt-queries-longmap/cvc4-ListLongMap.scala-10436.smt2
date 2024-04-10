; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122782 () Bool)

(assert start!122782)

(declare-fun b!1423407 () Bool)

(declare-fun res!958841 () Bool)

(declare-fun e!804565 () Bool)

(assert (=> b!1423407 (=> (not res!958841) (not e!804565))))

(declare-datatypes ((array!97147 0))(
  ( (array!97148 (arr!46891 (Array (_ BitVec 32) (_ BitVec 64))) (size!47441 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97147)

(declare-datatypes ((List!33401 0))(
  ( (Nil!33398) (Cons!33397 (h!34699 (_ BitVec 64)) (t!48095 List!33401)) )
))
(declare-fun arrayNoDuplicates!0 (array!97147 (_ BitVec 32) List!33401) Bool)

(assert (=> b!1423407 (= res!958841 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33398))))

(declare-fun b!1423408 () Bool)

(declare-fun res!958845 () Bool)

(declare-fun e!804567 () Bool)

(assert (=> b!1423408 (=> (not res!958845) (not e!804567))))

(declare-datatypes ((SeekEntryResult!11176 0))(
  ( (MissingZero!11176 (index!47096 (_ BitVec 32))) (Found!11176 (index!47097 (_ BitVec 32))) (Intermediate!11176 (undefined!11988 Bool) (index!47098 (_ BitVec 32)) (x!128730 (_ BitVec 32))) (Undefined!11176) (MissingVacant!11176 (index!47099 (_ BitVec 32))) )
))
(declare-fun lt!627100 () SeekEntryResult!11176)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627104 () (_ BitVec 64))

(declare-fun lt!627103 () array!97147)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97147 (_ BitVec 32)) SeekEntryResult!11176)

(assert (=> b!1423408 (= res!958845 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627104 lt!627103 mask!2608) lt!627100))))

(declare-fun e!804568 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1423409 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97147 (_ BitVec 32)) SeekEntryResult!11176)

(assert (=> b!1423409 (= e!804568 (= (seekEntryOrOpen!0 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) (Found!11176 j!81)))))

(declare-fun b!1423410 () Bool)

(declare-fun res!958840 () Bool)

(assert (=> b!1423410 (=> (not res!958840) (not e!804567))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423410 (= res!958840 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423411 () Bool)

(declare-fun res!958848 () Bool)

(assert (=> b!1423411 (=> (not res!958848) (not e!804565))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423411 (= res!958848 (validKeyInArray!0 (select (arr!46891 a!2831) i!982)))))

(declare-fun b!1423412 () Bool)

(declare-fun e!804563 () Bool)

(assert (=> b!1423412 (= e!804567 (not e!804563))))

(declare-fun res!958851 () Bool)

(assert (=> b!1423412 (=> res!958851 e!804563)))

(assert (=> b!1423412 (= res!958851 (or (= (select (arr!46891 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46891 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46891 a!2831) index!585) (select (arr!46891 a!2831) j!81)) (= (select (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423412 e!804568))

(declare-fun res!958846 () Bool)

(assert (=> b!1423412 (=> (not res!958846) (not e!804568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97147 (_ BitVec 32)) Bool)

(assert (=> b!1423412 (= res!958846 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48188 0))(
  ( (Unit!48189) )
))
(declare-fun lt!627099 () Unit!48188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48188)

(assert (=> b!1423412 (= lt!627099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423413 () Bool)

(declare-fun res!958847 () Bool)

(assert (=> b!1423413 (=> (not res!958847) (not e!804567))))

(declare-fun lt!627102 () SeekEntryResult!11176)

(assert (=> b!1423413 (= res!958847 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627102))))

(declare-fun b!1423415 () Bool)

(declare-fun e!804566 () Bool)

(assert (=> b!1423415 (= e!804566 e!804567)))

(declare-fun res!958852 () Bool)

(assert (=> b!1423415 (=> (not res!958852) (not e!804567))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423415 (= res!958852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627104 mask!2608) lt!627104 lt!627103 mask!2608) lt!627100))))

(assert (=> b!1423415 (= lt!627100 (Intermediate!11176 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423415 (= lt!627104 (select (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423415 (= lt!627103 (array!97148 (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47441 a!2831)))))

(declare-fun b!1423416 () Bool)

(declare-fun res!958854 () Bool)

(assert (=> b!1423416 (=> (not res!958854) (not e!804565))))

(assert (=> b!1423416 (= res!958854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423417 () Bool)

(declare-fun res!958842 () Bool)

(assert (=> b!1423417 (=> (not res!958842) (not e!804565))))

(assert (=> b!1423417 (= res!958842 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47441 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47441 a!2831))))))

(declare-fun b!1423418 () Bool)

(declare-fun e!804564 () Bool)

(assert (=> b!1423418 (= e!804563 e!804564)))

(declare-fun res!958850 () Bool)

(assert (=> b!1423418 (=> res!958850 e!804564)))

(declare-fun lt!627101 () (_ BitVec 32))

(assert (=> b!1423418 (= res!958850 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627101 #b00000000000000000000000000000000) (bvsge lt!627101 (size!47441 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423418 (= lt!627101 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423419 () Bool)

(declare-fun res!958844 () Bool)

(assert (=> b!1423419 (=> (not res!958844) (not e!804565))))

(assert (=> b!1423419 (= res!958844 (validKeyInArray!0 (select (arr!46891 a!2831) j!81)))))

(declare-fun b!1423420 () Bool)

(assert (=> b!1423420 (= e!804565 e!804566)))

(declare-fun res!958843 () Bool)

(assert (=> b!1423420 (=> (not res!958843) (not e!804566))))

(assert (=> b!1423420 (= res!958843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46891 a!2831) j!81) mask!2608) (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627102))))

(assert (=> b!1423420 (= lt!627102 (Intermediate!11176 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423414 () Bool)

(assert (=> b!1423414 (= e!804564 true)))

(declare-fun lt!627105 () SeekEntryResult!11176)

(assert (=> b!1423414 (= lt!627105 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627101 lt!627104 lt!627103 mask!2608))))

(declare-fun res!958855 () Bool)

(assert (=> start!122782 (=> (not res!958855) (not e!804565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122782 (= res!958855 (validMask!0 mask!2608))))

(assert (=> start!122782 e!804565))

(assert (=> start!122782 true))

(declare-fun array_inv!35919 (array!97147) Bool)

(assert (=> start!122782 (array_inv!35919 a!2831)))

(declare-fun b!1423421 () Bool)

(declare-fun res!958853 () Bool)

(assert (=> b!1423421 (=> (not res!958853) (not e!804565))))

(assert (=> b!1423421 (= res!958853 (and (= (size!47441 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47441 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47441 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423422 () Bool)

(declare-fun res!958849 () Bool)

(assert (=> b!1423422 (=> res!958849 e!804564)))

(assert (=> b!1423422 (= res!958849 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627101 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627102)))))

(assert (= (and start!122782 res!958855) b!1423421))

(assert (= (and b!1423421 res!958853) b!1423411))

(assert (= (and b!1423411 res!958848) b!1423419))

(assert (= (and b!1423419 res!958844) b!1423416))

(assert (= (and b!1423416 res!958854) b!1423407))

(assert (= (and b!1423407 res!958841) b!1423417))

(assert (= (and b!1423417 res!958842) b!1423420))

(assert (= (and b!1423420 res!958843) b!1423415))

(assert (= (and b!1423415 res!958852) b!1423413))

(assert (= (and b!1423413 res!958847) b!1423408))

(assert (= (and b!1423408 res!958845) b!1423410))

(assert (= (and b!1423410 res!958840) b!1423412))

(assert (= (and b!1423412 res!958846) b!1423409))

(assert (= (and b!1423412 (not res!958851)) b!1423418))

(assert (= (and b!1423418 (not res!958850)) b!1423422))

(assert (= (and b!1423422 (not res!958849)) b!1423414))

(declare-fun m!1313955 () Bool)

(assert (=> b!1423412 m!1313955))

(declare-fun m!1313957 () Bool)

(assert (=> b!1423412 m!1313957))

(declare-fun m!1313959 () Bool)

(assert (=> b!1423412 m!1313959))

(declare-fun m!1313961 () Bool)

(assert (=> b!1423412 m!1313961))

(declare-fun m!1313963 () Bool)

(assert (=> b!1423412 m!1313963))

(declare-fun m!1313965 () Bool)

(assert (=> b!1423412 m!1313965))

(declare-fun m!1313967 () Bool)

(assert (=> b!1423411 m!1313967))

(assert (=> b!1423411 m!1313967))

(declare-fun m!1313969 () Bool)

(assert (=> b!1423411 m!1313969))

(assert (=> b!1423422 m!1313963))

(assert (=> b!1423422 m!1313963))

(declare-fun m!1313971 () Bool)

(assert (=> b!1423422 m!1313971))

(declare-fun m!1313973 () Bool)

(assert (=> b!1423408 m!1313973))

(declare-fun m!1313975 () Bool)

(assert (=> b!1423407 m!1313975))

(declare-fun m!1313977 () Bool)

(assert (=> b!1423418 m!1313977))

(declare-fun m!1313979 () Bool)

(assert (=> b!1423415 m!1313979))

(assert (=> b!1423415 m!1313979))

(declare-fun m!1313981 () Bool)

(assert (=> b!1423415 m!1313981))

(assert (=> b!1423415 m!1313955))

(declare-fun m!1313983 () Bool)

(assert (=> b!1423415 m!1313983))

(declare-fun m!1313985 () Bool)

(assert (=> b!1423416 m!1313985))

(assert (=> b!1423420 m!1313963))

(assert (=> b!1423420 m!1313963))

(declare-fun m!1313987 () Bool)

(assert (=> b!1423420 m!1313987))

(assert (=> b!1423420 m!1313987))

(assert (=> b!1423420 m!1313963))

(declare-fun m!1313989 () Bool)

(assert (=> b!1423420 m!1313989))

(declare-fun m!1313991 () Bool)

(assert (=> b!1423414 m!1313991))

(assert (=> b!1423409 m!1313963))

(assert (=> b!1423409 m!1313963))

(declare-fun m!1313993 () Bool)

(assert (=> b!1423409 m!1313993))

(declare-fun m!1313995 () Bool)

(assert (=> start!122782 m!1313995))

(declare-fun m!1313997 () Bool)

(assert (=> start!122782 m!1313997))

(assert (=> b!1423413 m!1313963))

(assert (=> b!1423413 m!1313963))

(declare-fun m!1313999 () Bool)

(assert (=> b!1423413 m!1313999))

(assert (=> b!1423419 m!1313963))

(assert (=> b!1423419 m!1313963))

(declare-fun m!1314001 () Bool)

(assert (=> b!1423419 m!1314001))

(push 1)

