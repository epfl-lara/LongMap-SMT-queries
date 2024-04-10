; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121968 () Bool)

(assert start!121968)

(declare-fun b!1415484 () Bool)

(declare-fun res!951534 () Bool)

(declare-fun e!801128 () Bool)

(assert (=> b!1415484 (=> (not res!951534) (not e!801128))))

(declare-datatypes ((array!96654 0))(
  ( (array!96655 (arr!46658 (Array (_ BitVec 32) (_ BitVec 64))) (size!47208 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96654)

(declare-datatypes ((List!33177 0))(
  ( (Nil!33174) (Cons!33173 (h!34460 (_ BitVec 64)) (t!47871 List!33177)) )
))
(declare-fun arrayNoDuplicates!0 (array!96654 (_ BitVec 32) List!33177) Bool)

(assert (=> b!1415484 (= res!951534 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33174))))

(declare-fun b!1415485 () Bool)

(declare-fun e!801124 () Bool)

(assert (=> b!1415485 (= e!801128 (not e!801124))))

(declare-fun res!951531 () Bool)

(assert (=> b!1415485 (=> res!951531 e!801124)))

(declare-datatypes ((SeekEntryResult!10969 0))(
  ( (MissingZero!10969 (index!46268 (_ BitVec 32))) (Found!10969 (index!46269 (_ BitVec 32))) (Intermediate!10969 (undefined!11781 Bool) (index!46270 (_ BitVec 32)) (x!127880 (_ BitVec 32))) (Undefined!10969) (MissingVacant!10969 (index!46271 (_ BitVec 32))) )
))
(declare-fun lt!624176 () SeekEntryResult!10969)

(assert (=> b!1415485 (= res!951531 (or (not (is-Intermediate!10969 lt!624176)) (undefined!11781 lt!624176)))))

(declare-fun e!801126 () Bool)

(assert (=> b!1415485 e!801126))

(declare-fun res!951526 () Bool)

(assert (=> b!1415485 (=> (not res!951526) (not e!801126))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96654 (_ BitVec 32)) Bool)

(assert (=> b!1415485 (= res!951526 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47912 0))(
  ( (Unit!47913) )
))
(declare-fun lt!624175 () Unit!47912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47912)

(assert (=> b!1415485 (= lt!624175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96654 (_ BitVec 32)) SeekEntryResult!10969)

(assert (=> b!1415485 (= lt!624176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624177 (select (arr!46658 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415485 (= lt!624177 (toIndex!0 (select (arr!46658 a!2901) j!112) mask!2840))))

(declare-fun b!1415486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96654 (_ BitVec 32)) SeekEntryResult!10969)

(assert (=> b!1415486 (= e!801126 (= (seekEntryOrOpen!0 (select (arr!46658 a!2901) j!112) a!2901 mask!2840) (Found!10969 j!112)))))

(declare-fun res!951527 () Bool)

(assert (=> start!121968 (=> (not res!951527) (not e!801128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121968 (= res!951527 (validMask!0 mask!2840))))

(assert (=> start!121968 e!801128))

(assert (=> start!121968 true))

(declare-fun array_inv!35686 (array!96654) Bool)

(assert (=> start!121968 (array_inv!35686 a!2901)))

(declare-fun b!1415487 () Bool)

(declare-fun res!951528 () Bool)

(assert (=> b!1415487 (=> (not res!951528) (not e!801128))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415487 (= res!951528 (and (= (size!47208 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47208 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47208 a!2901)) (not (= i!1037 j!112))))))

(declare-fun lt!624180 () array!96654)

(declare-fun lt!624174 () SeekEntryResult!10969)

(declare-fun e!801125 () Bool)

(declare-fun lt!624179 () (_ BitVec 64))

(declare-fun b!1415488 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96654 (_ BitVec 32)) SeekEntryResult!10969)

(assert (=> b!1415488 (= e!801125 (= (seekEntryOrOpen!0 lt!624179 lt!624180 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127880 lt!624174) (index!46270 lt!624174) (index!46270 lt!624174) (select (arr!46658 a!2901) j!112) lt!624180 mask!2840)))))

(declare-fun b!1415489 () Bool)

(declare-fun e!801123 () Bool)

(assert (=> b!1415489 (= e!801123 true)))

(assert (=> b!1415489 e!801125))

(declare-fun res!951535 () Bool)

(assert (=> b!1415489 (=> (not res!951535) (not e!801125))))

(assert (=> b!1415489 (= res!951535 (and (not (undefined!11781 lt!624174)) (= (index!46270 lt!624174) i!1037) (bvslt (x!127880 lt!624174) (x!127880 lt!624176)) (= (select (store (arr!46658 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46270 lt!624174)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624178 () Unit!47912)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47912)

(assert (=> b!1415489 (= lt!624178 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624177 (x!127880 lt!624176) (index!46270 lt!624176) (x!127880 lt!624174) (index!46270 lt!624174) (undefined!11781 lt!624174) mask!2840))))

(declare-fun b!1415490 () Bool)

(declare-fun res!951529 () Bool)

(assert (=> b!1415490 (=> (not res!951529) (not e!801128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415490 (= res!951529 (validKeyInArray!0 (select (arr!46658 a!2901) i!1037)))))

(declare-fun b!1415491 () Bool)

(declare-fun res!951533 () Bool)

(assert (=> b!1415491 (=> (not res!951533) (not e!801128))))

(assert (=> b!1415491 (= res!951533 (validKeyInArray!0 (select (arr!46658 a!2901) j!112)))))

(declare-fun b!1415492 () Bool)

(declare-fun res!951532 () Bool)

(assert (=> b!1415492 (=> (not res!951532) (not e!801128))))

(assert (=> b!1415492 (= res!951532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415493 () Bool)

(assert (=> b!1415493 (= e!801124 e!801123)))

(declare-fun res!951530 () Bool)

(assert (=> b!1415493 (=> res!951530 e!801123)))

(assert (=> b!1415493 (= res!951530 (or (= lt!624176 lt!624174) (not (is-Intermediate!10969 lt!624174))))))

(assert (=> b!1415493 (= lt!624174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624179 mask!2840) lt!624179 lt!624180 mask!2840))))

(assert (=> b!1415493 (= lt!624179 (select (store (arr!46658 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415493 (= lt!624180 (array!96655 (store (arr!46658 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47208 a!2901)))))

(assert (= (and start!121968 res!951527) b!1415487))

(assert (= (and b!1415487 res!951528) b!1415490))

(assert (= (and b!1415490 res!951529) b!1415491))

(assert (= (and b!1415491 res!951533) b!1415492))

(assert (= (and b!1415492 res!951532) b!1415484))

(assert (= (and b!1415484 res!951534) b!1415485))

(assert (= (and b!1415485 res!951526) b!1415486))

(assert (= (and b!1415485 (not res!951531)) b!1415493))

(assert (= (and b!1415493 (not res!951530)) b!1415489))

(assert (= (and b!1415489 res!951535) b!1415488))

(declare-fun m!1305783 () Bool)

(assert (=> b!1415492 m!1305783))

(declare-fun m!1305785 () Bool)

(assert (=> b!1415484 m!1305785))

(declare-fun m!1305787 () Bool)

(assert (=> b!1415485 m!1305787))

(declare-fun m!1305789 () Bool)

(assert (=> b!1415485 m!1305789))

(assert (=> b!1415485 m!1305787))

(declare-fun m!1305791 () Bool)

(assert (=> b!1415485 m!1305791))

(declare-fun m!1305793 () Bool)

(assert (=> b!1415485 m!1305793))

(assert (=> b!1415485 m!1305787))

(declare-fun m!1305795 () Bool)

(assert (=> b!1415485 m!1305795))

(assert (=> b!1415486 m!1305787))

(assert (=> b!1415486 m!1305787))

(declare-fun m!1305797 () Bool)

(assert (=> b!1415486 m!1305797))

(declare-fun m!1305799 () Bool)

(assert (=> b!1415488 m!1305799))

(assert (=> b!1415488 m!1305787))

(assert (=> b!1415488 m!1305787))

(declare-fun m!1305801 () Bool)

(assert (=> b!1415488 m!1305801))

(declare-fun m!1305803 () Bool)

(assert (=> start!121968 m!1305803))

(declare-fun m!1305805 () Bool)

(assert (=> start!121968 m!1305805))

(declare-fun m!1305807 () Bool)

(assert (=> b!1415489 m!1305807))

(declare-fun m!1305809 () Bool)

(assert (=> b!1415489 m!1305809))

(declare-fun m!1305811 () Bool)

(assert (=> b!1415489 m!1305811))

(assert (=> b!1415491 m!1305787))

(assert (=> b!1415491 m!1305787))

(declare-fun m!1305813 () Bool)

(assert (=> b!1415491 m!1305813))

(declare-fun m!1305815 () Bool)

(assert (=> b!1415493 m!1305815))

(assert (=> b!1415493 m!1305815))

(declare-fun m!1305817 () Bool)

(assert (=> b!1415493 m!1305817))

(assert (=> b!1415493 m!1305807))

(declare-fun m!1305819 () Bool)

(assert (=> b!1415493 m!1305819))

(declare-fun m!1305821 () Bool)

(assert (=> b!1415490 m!1305821))

(assert (=> b!1415490 m!1305821))

(declare-fun m!1305823 () Bool)

(assert (=> b!1415490 m!1305823))

(push 1)

