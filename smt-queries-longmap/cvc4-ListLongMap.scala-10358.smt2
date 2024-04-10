; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121966 () Bool)

(assert start!121966)

(declare-fun b!1415454 () Bool)

(declare-fun res!951499 () Bool)

(declare-fun e!801106 () Bool)

(assert (=> b!1415454 (=> (not res!951499) (not e!801106))))

(declare-datatypes ((array!96652 0))(
  ( (array!96653 (arr!46657 (Array (_ BitVec 32) (_ BitVec 64))) (size!47207 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96652)

(declare-datatypes ((List!33176 0))(
  ( (Nil!33173) (Cons!33172 (h!34459 (_ BitVec 64)) (t!47870 List!33176)) )
))
(declare-fun arrayNoDuplicates!0 (array!96652 (_ BitVec 32) List!33176) Bool)

(assert (=> b!1415454 (= res!951499 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33173))))

(declare-fun b!1415455 () Bool)

(declare-fun res!951497 () Bool)

(assert (=> b!1415455 (=> (not res!951497) (not e!801106))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415455 (= res!951497 (validKeyInArray!0 (select (arr!46657 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624157 () array!96652)

(declare-fun e!801110 () Bool)

(declare-fun b!1415456 () Bool)

(declare-fun lt!624159 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10968 0))(
  ( (MissingZero!10968 (index!46264 (_ BitVec 32))) (Found!10968 (index!46265 (_ BitVec 32))) (Intermediate!10968 (undefined!11780 Bool) (index!46266 (_ BitVec 32)) (x!127871 (_ BitVec 32))) (Undefined!10968) (MissingVacant!10968 (index!46267 (_ BitVec 32))) )
))
(declare-fun lt!624153 () SeekEntryResult!10968)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96652 (_ BitVec 32)) SeekEntryResult!10968)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96652 (_ BitVec 32)) SeekEntryResult!10968)

(assert (=> b!1415456 (= e!801110 (= (seekEntryOrOpen!0 lt!624159 lt!624157 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127871 lt!624153) (index!46266 lt!624153) (index!46266 lt!624153) (select (arr!46657 a!2901) j!112) lt!624157 mask!2840)))))

(declare-fun b!1415457 () Bool)

(declare-fun res!951505 () Bool)

(assert (=> b!1415457 (=> (not res!951505) (not e!801106))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415457 (= res!951505 (and (= (size!47207 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47207 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47207 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415458 () Bool)

(declare-fun e!801107 () Bool)

(assert (=> b!1415458 (= e!801106 (not e!801107))))

(declare-fun res!951501 () Bool)

(assert (=> b!1415458 (=> res!951501 e!801107)))

(declare-fun lt!624154 () SeekEntryResult!10968)

(assert (=> b!1415458 (= res!951501 (or (not (is-Intermediate!10968 lt!624154)) (undefined!11780 lt!624154)))))

(declare-fun e!801105 () Bool)

(assert (=> b!1415458 e!801105))

(declare-fun res!951503 () Bool)

(assert (=> b!1415458 (=> (not res!951503) (not e!801105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96652 (_ BitVec 32)) Bool)

(assert (=> b!1415458 (= res!951503 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47910 0))(
  ( (Unit!47911) )
))
(declare-fun lt!624156 () Unit!47910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47910)

(assert (=> b!1415458 (= lt!624156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624158 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96652 (_ BitVec 32)) SeekEntryResult!10968)

(assert (=> b!1415458 (= lt!624154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624158 (select (arr!46657 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415458 (= lt!624158 (toIndex!0 (select (arr!46657 a!2901) j!112) mask!2840))))

(declare-fun b!1415459 () Bool)

(declare-fun res!951502 () Bool)

(assert (=> b!1415459 (=> (not res!951502) (not e!801106))))

(assert (=> b!1415459 (= res!951502 (validKeyInArray!0 (select (arr!46657 a!2901) i!1037)))))

(declare-fun res!951500 () Bool)

(assert (=> start!121966 (=> (not res!951500) (not e!801106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121966 (= res!951500 (validMask!0 mask!2840))))

(assert (=> start!121966 e!801106))

(assert (=> start!121966 true))

(declare-fun array_inv!35685 (array!96652) Bool)

(assert (=> start!121966 (array_inv!35685 a!2901)))

(declare-fun b!1415460 () Bool)

(assert (=> b!1415460 (= e!801105 (= (seekEntryOrOpen!0 (select (arr!46657 a!2901) j!112) a!2901 mask!2840) (Found!10968 j!112)))))

(declare-fun b!1415461 () Bool)

(declare-fun e!801109 () Bool)

(assert (=> b!1415461 (= e!801107 e!801109)))

(declare-fun res!951498 () Bool)

(assert (=> b!1415461 (=> res!951498 e!801109)))

(assert (=> b!1415461 (= res!951498 (or (= lt!624154 lt!624153) (not (is-Intermediate!10968 lt!624153))))))

(assert (=> b!1415461 (= lt!624153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624159 mask!2840) lt!624159 lt!624157 mask!2840))))

(assert (=> b!1415461 (= lt!624159 (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415461 (= lt!624157 (array!96653 (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47207 a!2901)))))

(declare-fun b!1415462 () Bool)

(assert (=> b!1415462 (= e!801109 (or (bvslt (x!127871 lt!624154) #b00000000000000000000000000000000) (bvsgt (x!127871 lt!624154) #b01111111111111111111111111111110) (bvslt (x!127871 lt!624153) #b00000000000000000000000000000000) (bvsgt (x!127871 lt!624153) #b01111111111111111111111111111110) (bvslt lt!624158 #b00000000000000000000000000000000) (bvsge lt!624158 (size!47207 a!2901)) (bvslt (index!46266 lt!624154) #b00000000000000000000000000000000) (bvsge (index!46266 lt!624154) (size!47207 a!2901)) (bvslt (index!46266 lt!624153) #b00000000000000000000000000000000) (bvsge (index!46266 lt!624153) (size!47207 a!2901)) (= lt!624154 (Intermediate!10968 false (index!46266 lt!624154) (x!127871 lt!624154)))))))

(assert (=> b!1415462 e!801110))

(declare-fun res!951504 () Bool)

(assert (=> b!1415462 (=> (not res!951504) (not e!801110))))

(assert (=> b!1415462 (= res!951504 (and (not (undefined!11780 lt!624153)) (= (index!46266 lt!624153) i!1037) (bvslt (x!127871 lt!624153) (x!127871 lt!624154)) (= (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46266 lt!624153)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624155 () Unit!47910)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47910)

(assert (=> b!1415462 (= lt!624155 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624158 (x!127871 lt!624154) (index!46266 lt!624154) (x!127871 lt!624153) (index!46266 lt!624153) (undefined!11780 lt!624153) mask!2840))))

(declare-fun b!1415463 () Bool)

(declare-fun res!951496 () Bool)

(assert (=> b!1415463 (=> (not res!951496) (not e!801106))))

(assert (=> b!1415463 (= res!951496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121966 res!951500) b!1415457))

(assert (= (and b!1415457 res!951505) b!1415459))

(assert (= (and b!1415459 res!951502) b!1415455))

(assert (= (and b!1415455 res!951497) b!1415463))

(assert (= (and b!1415463 res!951496) b!1415454))

(assert (= (and b!1415454 res!951499) b!1415458))

(assert (= (and b!1415458 res!951503) b!1415460))

(assert (= (and b!1415458 (not res!951501)) b!1415461))

(assert (= (and b!1415461 (not res!951498)) b!1415462))

(assert (= (and b!1415462 res!951504) b!1415456))

(declare-fun m!1305741 () Bool)

(assert (=> start!121966 m!1305741))

(declare-fun m!1305743 () Bool)

(assert (=> start!121966 m!1305743))

(declare-fun m!1305745 () Bool)

(assert (=> b!1415462 m!1305745))

(declare-fun m!1305747 () Bool)

(assert (=> b!1415462 m!1305747))

(declare-fun m!1305749 () Bool)

(assert (=> b!1415462 m!1305749))

(declare-fun m!1305751 () Bool)

(assert (=> b!1415459 m!1305751))

(assert (=> b!1415459 m!1305751))

(declare-fun m!1305753 () Bool)

(assert (=> b!1415459 m!1305753))

(declare-fun m!1305755 () Bool)

(assert (=> b!1415460 m!1305755))

(assert (=> b!1415460 m!1305755))

(declare-fun m!1305757 () Bool)

(assert (=> b!1415460 m!1305757))

(declare-fun m!1305759 () Bool)

(assert (=> b!1415461 m!1305759))

(assert (=> b!1415461 m!1305759))

(declare-fun m!1305761 () Bool)

(assert (=> b!1415461 m!1305761))

(assert (=> b!1415461 m!1305745))

(declare-fun m!1305763 () Bool)

(assert (=> b!1415461 m!1305763))

(assert (=> b!1415458 m!1305755))

(declare-fun m!1305765 () Bool)

(assert (=> b!1415458 m!1305765))

(assert (=> b!1415458 m!1305755))

(declare-fun m!1305767 () Bool)

(assert (=> b!1415458 m!1305767))

(assert (=> b!1415458 m!1305755))

(declare-fun m!1305769 () Bool)

(assert (=> b!1415458 m!1305769))

(declare-fun m!1305771 () Bool)

(assert (=> b!1415458 m!1305771))

(assert (=> b!1415455 m!1305755))

(assert (=> b!1415455 m!1305755))

(declare-fun m!1305773 () Bool)

(assert (=> b!1415455 m!1305773))

(declare-fun m!1305775 () Bool)

(assert (=> b!1415463 m!1305775))

(declare-fun m!1305777 () Bool)

(assert (=> b!1415456 m!1305777))

(assert (=> b!1415456 m!1305755))

(assert (=> b!1415456 m!1305755))

(declare-fun m!1305779 () Bool)

(assert (=> b!1415456 m!1305779))

(declare-fun m!1305781 () Bool)

(assert (=> b!1415454 m!1305781))

(push 1)

