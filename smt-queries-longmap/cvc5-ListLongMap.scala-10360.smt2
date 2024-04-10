; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121974 () Bool)

(assert start!121974)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96660 0))(
  ( (array!96661 (arr!46661 (Array (_ BitVec 32) (_ BitVec 64))) (size!47211 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96660)

(declare-fun e!801180 () Bool)

(declare-fun b!1415574 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10972 0))(
  ( (MissingZero!10972 (index!46280 (_ BitVec 32))) (Found!10972 (index!46281 (_ BitVec 32))) (Intermediate!10972 (undefined!11784 Bool) (index!46282 (_ BitVec 32)) (x!127891 (_ BitVec 32))) (Undefined!10972) (MissingVacant!10972 (index!46283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96660 (_ BitVec 32)) SeekEntryResult!10972)

(assert (=> b!1415574 (= e!801180 (= (seekEntryOrOpen!0 (select (arr!46661 a!2901) j!112) a!2901 mask!2840) (Found!10972 j!112)))))

(declare-fun b!1415575 () Bool)

(declare-fun res!951618 () Bool)

(declare-fun e!801179 () Bool)

(assert (=> b!1415575 (=> (not res!951618) (not e!801179))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415575 (= res!951618 (validKeyInArray!0 (select (arr!46661 a!2901) i!1037)))))

(declare-fun b!1415576 () Bool)

(declare-fun e!801178 () Bool)

(assert (=> b!1415576 (= e!801179 (not e!801178))))

(declare-fun res!951617 () Bool)

(assert (=> b!1415576 (=> res!951617 e!801178)))

(declare-fun lt!624237 () SeekEntryResult!10972)

(assert (=> b!1415576 (= res!951617 (or (not (is-Intermediate!10972 lt!624237)) (undefined!11784 lt!624237)))))

(assert (=> b!1415576 e!801180))

(declare-fun res!951621 () Bool)

(assert (=> b!1415576 (=> (not res!951621) (not e!801180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96660 (_ BitVec 32)) Bool)

(assert (=> b!1415576 (= res!951621 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47918 0))(
  ( (Unit!47919) )
))
(declare-fun lt!624242 () Unit!47918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47918)

(assert (=> b!1415576 (= lt!624242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624240 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96660 (_ BitVec 32)) SeekEntryResult!10972)

(assert (=> b!1415576 (= lt!624237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624240 (select (arr!46661 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415576 (= lt!624240 (toIndex!0 (select (arr!46661 a!2901) j!112) mask!2840))))

(declare-fun e!801177 () Bool)

(declare-fun lt!624238 () SeekEntryResult!10972)

(declare-fun b!1415577 () Bool)

(assert (=> b!1415577 (= e!801177 (or (bvslt (x!127891 lt!624237) #b00000000000000000000000000000000) (bvsgt (x!127891 lt!624237) #b01111111111111111111111111111110) (bvslt (x!127891 lt!624238) #b00000000000000000000000000000000) (bvsgt (x!127891 lt!624238) #b01111111111111111111111111111110) (bvslt lt!624240 #b00000000000000000000000000000000) (bvsge lt!624240 (size!47211 a!2901)) (bvslt (index!46282 lt!624237) #b00000000000000000000000000000000) (bvsge (index!46282 lt!624237) (size!47211 a!2901)) (bvslt (index!46282 lt!624238) #b00000000000000000000000000000000) (bvsge (index!46282 lt!624238) (size!47211 a!2901)) (not (= lt!624237 (Intermediate!10972 false (index!46282 lt!624237) (x!127891 lt!624237)))) (= lt!624238 (Intermediate!10972 false (index!46282 lt!624238) (x!127891 lt!624238)))))))

(declare-fun e!801182 () Bool)

(assert (=> b!1415577 e!801182))

(declare-fun res!951620 () Bool)

(assert (=> b!1415577 (=> (not res!951620) (not e!801182))))

(assert (=> b!1415577 (= res!951620 (and (not (undefined!11784 lt!624238)) (= (index!46282 lt!624238) i!1037) (bvslt (x!127891 lt!624238) (x!127891 lt!624237)) (= (select (store (arr!46661 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46282 lt!624238)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624243 () Unit!47918)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47918)

(assert (=> b!1415577 (= lt!624243 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624240 (x!127891 lt!624237) (index!46282 lt!624237) (x!127891 lt!624238) (index!46282 lt!624238) (undefined!11784 lt!624238) mask!2840))))

(declare-fun b!1415578 () Bool)

(assert (=> b!1415578 (= e!801178 e!801177)))

(declare-fun res!951616 () Bool)

(assert (=> b!1415578 (=> res!951616 e!801177)))

(assert (=> b!1415578 (= res!951616 (or (= lt!624237 lt!624238) (not (is-Intermediate!10972 lt!624238))))))

(declare-fun lt!624239 () array!96660)

(declare-fun lt!624241 () (_ BitVec 64))

(assert (=> b!1415578 (= lt!624238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624241 mask!2840) lt!624241 lt!624239 mask!2840))))

(assert (=> b!1415578 (= lt!624241 (select (store (arr!46661 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415578 (= lt!624239 (array!96661 (store (arr!46661 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47211 a!2901)))))

(declare-fun res!951624 () Bool)

(assert (=> start!121974 (=> (not res!951624) (not e!801179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121974 (= res!951624 (validMask!0 mask!2840))))

(assert (=> start!121974 e!801179))

(assert (=> start!121974 true))

(declare-fun array_inv!35689 (array!96660) Bool)

(assert (=> start!121974 (array_inv!35689 a!2901)))

(declare-fun b!1415579 () Bool)

(declare-fun res!951622 () Bool)

(assert (=> b!1415579 (=> (not res!951622) (not e!801179))))

(assert (=> b!1415579 (= res!951622 (validKeyInArray!0 (select (arr!46661 a!2901) j!112)))))

(declare-fun b!1415580 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96660 (_ BitVec 32)) SeekEntryResult!10972)

(assert (=> b!1415580 (= e!801182 (= (seekEntryOrOpen!0 lt!624241 lt!624239 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127891 lt!624238) (index!46282 lt!624238) (index!46282 lt!624238) (select (arr!46661 a!2901) j!112) lt!624239 mask!2840)))))

(declare-fun b!1415581 () Bool)

(declare-fun res!951625 () Bool)

(assert (=> b!1415581 (=> (not res!951625) (not e!801179))))

(assert (=> b!1415581 (= res!951625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415582 () Bool)

(declare-fun res!951619 () Bool)

(assert (=> b!1415582 (=> (not res!951619) (not e!801179))))

(assert (=> b!1415582 (= res!951619 (and (= (size!47211 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47211 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47211 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415583 () Bool)

(declare-fun res!951623 () Bool)

(assert (=> b!1415583 (=> (not res!951623) (not e!801179))))

(declare-datatypes ((List!33180 0))(
  ( (Nil!33177) (Cons!33176 (h!34463 (_ BitVec 64)) (t!47874 List!33180)) )
))
(declare-fun arrayNoDuplicates!0 (array!96660 (_ BitVec 32) List!33180) Bool)

(assert (=> b!1415583 (= res!951623 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33177))))

(assert (= (and start!121974 res!951624) b!1415582))

(assert (= (and b!1415582 res!951619) b!1415575))

(assert (= (and b!1415575 res!951618) b!1415579))

(assert (= (and b!1415579 res!951622) b!1415581))

(assert (= (and b!1415581 res!951625) b!1415583))

(assert (= (and b!1415583 res!951623) b!1415576))

(assert (= (and b!1415576 res!951621) b!1415574))

(assert (= (and b!1415576 (not res!951617)) b!1415578))

(assert (= (and b!1415578 (not res!951616)) b!1415577))

(assert (= (and b!1415577 res!951620) b!1415580))

(declare-fun m!1305909 () Bool)

(assert (=> b!1415578 m!1305909))

(assert (=> b!1415578 m!1305909))

(declare-fun m!1305911 () Bool)

(assert (=> b!1415578 m!1305911))

(declare-fun m!1305913 () Bool)

(assert (=> b!1415578 m!1305913))

(declare-fun m!1305915 () Bool)

(assert (=> b!1415578 m!1305915))

(declare-fun m!1305917 () Bool)

(assert (=> b!1415575 m!1305917))

(assert (=> b!1415575 m!1305917))

(declare-fun m!1305919 () Bool)

(assert (=> b!1415575 m!1305919))

(declare-fun m!1305921 () Bool)

(assert (=> b!1415579 m!1305921))

(assert (=> b!1415579 m!1305921))

(declare-fun m!1305923 () Bool)

(assert (=> b!1415579 m!1305923))

(assert (=> b!1415577 m!1305913))

(declare-fun m!1305925 () Bool)

(assert (=> b!1415577 m!1305925))

(declare-fun m!1305927 () Bool)

(assert (=> b!1415577 m!1305927))

(declare-fun m!1305929 () Bool)

(assert (=> b!1415580 m!1305929))

(assert (=> b!1415580 m!1305921))

(assert (=> b!1415580 m!1305921))

(declare-fun m!1305931 () Bool)

(assert (=> b!1415580 m!1305931))

(assert (=> b!1415576 m!1305921))

(declare-fun m!1305933 () Bool)

(assert (=> b!1415576 m!1305933))

(assert (=> b!1415576 m!1305921))

(declare-fun m!1305935 () Bool)

(assert (=> b!1415576 m!1305935))

(assert (=> b!1415576 m!1305921))

(declare-fun m!1305937 () Bool)

(assert (=> b!1415576 m!1305937))

(declare-fun m!1305939 () Bool)

(assert (=> b!1415576 m!1305939))

(declare-fun m!1305941 () Bool)

(assert (=> b!1415581 m!1305941))

(declare-fun m!1305943 () Bool)

(assert (=> b!1415583 m!1305943))

(declare-fun m!1305945 () Bool)

(assert (=> start!121974 m!1305945))

(declare-fun m!1305947 () Bool)

(assert (=> start!121974 m!1305947))

(assert (=> b!1415574 m!1305921))

(assert (=> b!1415574 m!1305921))

(declare-fun m!1305949 () Bool)

(assert (=> b!1415574 m!1305949))

(push 1)

