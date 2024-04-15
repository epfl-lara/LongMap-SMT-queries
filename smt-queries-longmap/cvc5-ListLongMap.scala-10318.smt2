; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121230 () Bool)

(assert start!121230)

(declare-fun b!1409573 () Bool)

(declare-fun res!947352 () Bool)

(declare-fun e!797665 () Bool)

(assert (=> b!1409573 (=> (not res!947352) (not e!797665))))

(declare-datatypes ((array!96337 0))(
  ( (array!96338 (arr!46512 (Array (_ BitVec 32) (_ BitVec 64))) (size!47064 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96337)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96337 (_ BitVec 32)) Bool)

(assert (=> b!1409573 (= res!947352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409574 () Bool)

(declare-fun res!947348 () Bool)

(assert (=> b!1409574 (=> (not res!947348) (not e!797665))))

(declare-datatypes ((List!33109 0))(
  ( (Nil!33106) (Cons!33105 (h!34368 (_ BitVec 64)) (t!47795 List!33109)) )
))
(declare-fun arrayNoDuplicates!0 (array!96337 (_ BitVec 32) List!33109) Bool)

(assert (=> b!1409574 (= res!947348 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33106))))

(declare-fun b!1409575 () Bool)

(declare-fun res!947351 () Bool)

(assert (=> b!1409575 (=> (not res!947351) (not e!797665))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409575 (= res!947351 (validKeyInArray!0 (select (arr!46512 a!2901) i!1037)))))

(declare-fun b!1409576 () Bool)

(declare-fun e!797664 () Bool)

(assert (=> b!1409576 (= e!797664 true)))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10849 0))(
  ( (MissingZero!10849 (index!45773 (_ BitVec 32))) (Found!10849 (index!45774 (_ BitVec 32))) (Intermediate!10849 (undefined!11661 Bool) (index!45775 (_ BitVec 32)) (x!127351 (_ BitVec 32))) (Undefined!10849) (MissingVacant!10849 (index!45776 (_ BitVec 32))) )
))
(declare-fun lt!620613 () SeekEntryResult!10849)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96337 (_ BitVec 32)) SeekEntryResult!10849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409576 (= lt!620613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96338 (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47064 a!2901)) mask!2840))))

(declare-fun b!1409577 () Bool)

(declare-fun res!947353 () Bool)

(assert (=> b!1409577 (=> (not res!947353) (not e!797665))))

(assert (=> b!1409577 (= res!947353 (and (= (size!47064 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47064 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47064 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!797666 () Bool)

(declare-fun b!1409578 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96337 (_ BitVec 32)) SeekEntryResult!10849)

(assert (=> b!1409578 (= e!797666 (= (seekEntryOrOpen!0 (select (arr!46512 a!2901) j!112) a!2901 mask!2840) (Found!10849 j!112)))))

(declare-fun b!1409579 () Bool)

(assert (=> b!1409579 (= e!797665 (not e!797664))))

(declare-fun res!947349 () Bool)

(assert (=> b!1409579 (=> res!947349 e!797664)))

(declare-fun lt!620614 () SeekEntryResult!10849)

(assert (=> b!1409579 (= res!947349 (or (not (is-Intermediate!10849 lt!620614)) (undefined!11661 lt!620614)))))

(assert (=> b!1409579 e!797666))

(declare-fun res!947350 () Bool)

(assert (=> b!1409579 (=> (not res!947350) (not e!797666))))

(assert (=> b!1409579 (= res!947350 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47515 0))(
  ( (Unit!47516) )
))
(declare-fun lt!620615 () Unit!47515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47515)

(assert (=> b!1409579 (= lt!620615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409579 (= lt!620614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46512 a!2901) j!112) mask!2840) (select (arr!46512 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!947346 () Bool)

(assert (=> start!121230 (=> (not res!947346) (not e!797665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121230 (= res!947346 (validMask!0 mask!2840))))

(assert (=> start!121230 e!797665))

(assert (=> start!121230 true))

(declare-fun array_inv!35745 (array!96337) Bool)

(assert (=> start!121230 (array_inv!35745 a!2901)))

(declare-fun b!1409580 () Bool)

(declare-fun res!947347 () Bool)

(assert (=> b!1409580 (=> (not res!947347) (not e!797665))))

(assert (=> b!1409580 (= res!947347 (validKeyInArray!0 (select (arr!46512 a!2901) j!112)))))

(assert (= (and start!121230 res!947346) b!1409577))

(assert (= (and b!1409577 res!947353) b!1409575))

(assert (= (and b!1409575 res!947351) b!1409580))

(assert (= (and b!1409580 res!947347) b!1409573))

(assert (= (and b!1409573 res!947352) b!1409574))

(assert (= (and b!1409574 res!947348) b!1409579))

(assert (= (and b!1409579 res!947350) b!1409578))

(assert (= (and b!1409579 (not res!947349)) b!1409576))

(declare-fun m!1298925 () Bool)

(assert (=> b!1409580 m!1298925))

(assert (=> b!1409580 m!1298925))

(declare-fun m!1298927 () Bool)

(assert (=> b!1409580 m!1298927))

(declare-fun m!1298929 () Bool)

(assert (=> b!1409573 m!1298929))

(declare-fun m!1298931 () Bool)

(assert (=> b!1409575 m!1298931))

(assert (=> b!1409575 m!1298931))

(declare-fun m!1298933 () Bool)

(assert (=> b!1409575 m!1298933))

(declare-fun m!1298935 () Bool)

(assert (=> b!1409576 m!1298935))

(declare-fun m!1298937 () Bool)

(assert (=> b!1409576 m!1298937))

(assert (=> b!1409576 m!1298937))

(declare-fun m!1298939 () Bool)

(assert (=> b!1409576 m!1298939))

(assert (=> b!1409576 m!1298939))

(assert (=> b!1409576 m!1298937))

(declare-fun m!1298941 () Bool)

(assert (=> b!1409576 m!1298941))

(assert (=> b!1409579 m!1298925))

(declare-fun m!1298943 () Bool)

(assert (=> b!1409579 m!1298943))

(assert (=> b!1409579 m!1298925))

(declare-fun m!1298945 () Bool)

(assert (=> b!1409579 m!1298945))

(assert (=> b!1409579 m!1298943))

(assert (=> b!1409579 m!1298925))

(declare-fun m!1298947 () Bool)

(assert (=> b!1409579 m!1298947))

(declare-fun m!1298949 () Bool)

(assert (=> b!1409579 m!1298949))

(declare-fun m!1298951 () Bool)

(assert (=> b!1409574 m!1298951))

(declare-fun m!1298953 () Bool)

(assert (=> start!121230 m!1298953))

(declare-fun m!1298955 () Bool)

(assert (=> start!121230 m!1298955))

(assert (=> b!1409578 m!1298925))

(assert (=> b!1409578 m!1298925))

(declare-fun m!1298957 () Bool)

(assert (=> b!1409578 m!1298957))

(push 1)

(assert (not b!1409578))

(assert (not b!1409579))

(assert (not b!1409575))

(assert (not b!1409574))

(assert (not start!121230))

(assert (not b!1409576))

(assert (not b!1409573))

(assert (not b!1409580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

