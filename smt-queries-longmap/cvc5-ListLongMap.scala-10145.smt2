; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119634 () Bool)

(assert start!119634)

(declare-fun b!1393514 () Bool)

(declare-fun res!932974 () Bool)

(declare-fun e!789059 () Bool)

(assert (=> b!1393514 (=> (not res!932974) (not e!789059))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95269 0))(
  ( (array!95270 (arr!45993 (Array (_ BitVec 32) (_ BitVec 64))) (size!46545 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95269)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393514 (= res!932974 (and (= (size!46545 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46545 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46545 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393515 () Bool)

(declare-fun e!789056 () Bool)

(assert (=> b!1393515 (= e!789056 true)))

(declare-datatypes ((SeekEntryResult!10336 0))(
  ( (MissingZero!10336 (index!43715 (_ BitVec 32))) (Found!10336 (index!43716 (_ BitVec 32))) (Intermediate!10336 (undefined!11148 Bool) (index!43717 (_ BitVec 32)) (x!125385 (_ BitVec 32))) (Undefined!10336) (MissingVacant!10336 (index!43718 (_ BitVec 32))) )
))
(declare-fun lt!611860 () SeekEntryResult!10336)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95269 (_ BitVec 32)) SeekEntryResult!10336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393515 (= lt!611860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95270 (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46545 a!2901)) mask!2840))))

(declare-fun b!1393516 () Bool)

(declare-fun e!789057 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95269 (_ BitVec 32)) SeekEntryResult!10336)

(assert (=> b!1393516 (= e!789057 (= (seekEntryOrOpen!0 (select (arr!45993 a!2901) j!112) a!2901 mask!2840) (Found!10336 j!112)))))

(declare-fun b!1393517 () Bool)

(declare-fun res!932977 () Bool)

(assert (=> b!1393517 (=> (not res!932977) (not e!789059))))

(declare-datatypes ((List!32590 0))(
  ( (Nil!32587) (Cons!32586 (h!33819 (_ BitVec 64)) (t!47276 List!32590)) )
))
(declare-fun arrayNoDuplicates!0 (array!95269 (_ BitVec 32) List!32590) Bool)

(assert (=> b!1393517 (= res!932977 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32587))))

(declare-fun res!932979 () Bool)

(assert (=> start!119634 (=> (not res!932979) (not e!789059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119634 (= res!932979 (validMask!0 mask!2840))))

(assert (=> start!119634 e!789059))

(assert (=> start!119634 true))

(declare-fun array_inv!35226 (array!95269) Bool)

(assert (=> start!119634 (array_inv!35226 a!2901)))

(declare-fun b!1393518 () Bool)

(assert (=> b!1393518 (= e!789059 (not e!789056))))

(declare-fun res!932973 () Bool)

(assert (=> b!1393518 (=> res!932973 e!789056)))

(declare-fun lt!611859 () SeekEntryResult!10336)

(assert (=> b!1393518 (= res!932973 (or (not (is-Intermediate!10336 lt!611859)) (undefined!11148 lt!611859)))))

(assert (=> b!1393518 e!789057))

(declare-fun res!932978 () Bool)

(assert (=> b!1393518 (=> (not res!932978) (not e!789057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95269 (_ BitVec 32)) Bool)

(assert (=> b!1393518 (= res!932978 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46519 0))(
  ( (Unit!46520) )
))
(declare-fun lt!611861 () Unit!46519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46519)

(assert (=> b!1393518 (= lt!611861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393518 (= lt!611859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45993 a!2901) j!112) mask!2840) (select (arr!45993 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393519 () Bool)

(declare-fun res!932980 () Bool)

(assert (=> b!1393519 (=> (not res!932980) (not e!789059))))

(assert (=> b!1393519 (= res!932980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393520 () Bool)

(declare-fun res!932976 () Bool)

(assert (=> b!1393520 (=> (not res!932976) (not e!789059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393520 (= res!932976 (validKeyInArray!0 (select (arr!45993 a!2901) j!112)))))

(declare-fun b!1393521 () Bool)

(declare-fun res!932975 () Bool)

(assert (=> b!1393521 (=> (not res!932975) (not e!789059))))

(assert (=> b!1393521 (= res!932975 (validKeyInArray!0 (select (arr!45993 a!2901) i!1037)))))

(assert (= (and start!119634 res!932979) b!1393514))

(assert (= (and b!1393514 res!932974) b!1393521))

(assert (= (and b!1393521 res!932975) b!1393520))

(assert (= (and b!1393520 res!932976) b!1393519))

(assert (= (and b!1393519 res!932980) b!1393517))

(assert (= (and b!1393517 res!932977) b!1393518))

(assert (= (and b!1393518 res!932978) b!1393516))

(assert (= (and b!1393518 (not res!932973)) b!1393515))

(declare-fun m!1279035 () Bool)

(assert (=> b!1393521 m!1279035))

(assert (=> b!1393521 m!1279035))

(declare-fun m!1279037 () Bool)

(assert (=> b!1393521 m!1279037))

(declare-fun m!1279039 () Bool)

(assert (=> b!1393519 m!1279039))

(declare-fun m!1279041 () Bool)

(assert (=> b!1393517 m!1279041))

(declare-fun m!1279043 () Bool)

(assert (=> b!1393520 m!1279043))

(assert (=> b!1393520 m!1279043))

(declare-fun m!1279045 () Bool)

(assert (=> b!1393520 m!1279045))

(declare-fun m!1279047 () Bool)

(assert (=> start!119634 m!1279047))

(declare-fun m!1279049 () Bool)

(assert (=> start!119634 m!1279049))

(assert (=> b!1393518 m!1279043))

(declare-fun m!1279051 () Bool)

(assert (=> b!1393518 m!1279051))

(assert (=> b!1393518 m!1279043))

(declare-fun m!1279053 () Bool)

(assert (=> b!1393518 m!1279053))

(assert (=> b!1393518 m!1279051))

(assert (=> b!1393518 m!1279043))

(declare-fun m!1279055 () Bool)

(assert (=> b!1393518 m!1279055))

(declare-fun m!1279057 () Bool)

(assert (=> b!1393518 m!1279057))

(assert (=> b!1393516 m!1279043))

(assert (=> b!1393516 m!1279043))

(declare-fun m!1279059 () Bool)

(assert (=> b!1393516 m!1279059))

(declare-fun m!1279061 () Bool)

(assert (=> b!1393515 m!1279061))

(declare-fun m!1279063 () Bool)

(assert (=> b!1393515 m!1279063))

(assert (=> b!1393515 m!1279063))

(declare-fun m!1279065 () Bool)

(assert (=> b!1393515 m!1279065))

(assert (=> b!1393515 m!1279065))

(assert (=> b!1393515 m!1279063))

(declare-fun m!1279067 () Bool)

(assert (=> b!1393515 m!1279067))

(push 1)

(assert (not b!1393519))

(assert (not b!1393515))

(assert (not start!119634))

(assert (not b!1393516))

(assert (not b!1393518))

(assert (not b!1393521))

(assert (not b!1393517))

(assert (not b!1393520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

