; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121190 () Bool)

(assert start!121190)

(declare-fun b!1409126 () Bool)

(declare-fun res!946854 () Bool)

(declare-fun e!797438 () Bool)

(assert (=> b!1409126 (=> (not res!946854) (not e!797438))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96344 0))(
  ( (array!96345 (arr!46515 (Array (_ BitVec 32) (_ BitVec 64))) (size!47065 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96344)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409126 (= res!946854 (and (= (size!47065 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47065 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47065 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!797440 () Bool)

(declare-fun b!1409127 () Bool)

(declare-datatypes ((SeekEntryResult!10826 0))(
  ( (MissingZero!10826 (index!45681 (_ BitVec 32))) (Found!10826 (index!45682 (_ BitVec 32))) (Intermediate!10826 (undefined!11638 Bool) (index!45683 (_ BitVec 32)) (x!127275 (_ BitVec 32))) (Undefined!10826) (MissingVacant!10826 (index!45684 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96344 (_ BitVec 32)) SeekEntryResult!10826)

(assert (=> b!1409127 (= e!797440 (= (seekEntryOrOpen!0 (select (arr!46515 a!2901) j!112) a!2901 mask!2840) (Found!10826 j!112)))))

(declare-fun res!946852 () Bool)

(assert (=> start!121190 (=> (not res!946852) (not e!797438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121190 (= res!946852 (validMask!0 mask!2840))))

(assert (=> start!121190 e!797438))

(assert (=> start!121190 true))

(declare-fun array_inv!35543 (array!96344) Bool)

(assert (=> start!121190 (array_inv!35543 a!2901)))

(declare-fun b!1409128 () Bool)

(declare-fun e!797439 () Bool)

(assert (=> b!1409128 (= e!797438 (not e!797439))))

(declare-fun res!946848 () Bool)

(assert (=> b!1409128 (=> res!946848 e!797439)))

(declare-fun lt!620607 () SeekEntryResult!10826)

(get-info :version)

(assert (=> b!1409128 (= res!946848 (or (not ((_ is Intermediate!10826) lt!620607)) (undefined!11638 lt!620607)))))

(assert (=> b!1409128 e!797440))

(declare-fun res!946853 () Bool)

(assert (=> b!1409128 (=> (not res!946853) (not e!797440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96344 (_ BitVec 32)) Bool)

(assert (=> b!1409128 (= res!946853 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47626 0))(
  ( (Unit!47627) )
))
(declare-fun lt!620606 () Unit!47626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47626)

(assert (=> b!1409128 (= lt!620606 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96344 (_ BitVec 32)) SeekEntryResult!10826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409128 (= lt!620607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46515 a!2901) j!112) mask!2840) (select (arr!46515 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409129 () Bool)

(declare-fun res!946849 () Bool)

(assert (=> b!1409129 (=> (not res!946849) (not e!797438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409129 (= res!946849 (validKeyInArray!0 (select (arr!46515 a!2901) i!1037)))))

(declare-fun b!1409130 () Bool)

(assert (=> b!1409130 (= e!797439 true)))

(declare-fun lt!620605 () SeekEntryResult!10826)

(assert (=> b!1409130 (= lt!620605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46515 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46515 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96345 (store (arr!46515 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)) mask!2840))))

(declare-fun b!1409131 () Bool)

(declare-fun res!946850 () Bool)

(assert (=> b!1409131 (=> (not res!946850) (not e!797438))))

(assert (=> b!1409131 (= res!946850 (validKeyInArray!0 (select (arr!46515 a!2901) j!112)))))

(declare-fun b!1409132 () Bool)

(declare-fun res!946851 () Bool)

(assert (=> b!1409132 (=> (not res!946851) (not e!797438))))

(assert (=> b!1409132 (= res!946851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409133 () Bool)

(declare-fun res!946855 () Bool)

(assert (=> b!1409133 (=> (not res!946855) (not e!797438))))

(declare-datatypes ((List!33034 0))(
  ( (Nil!33031) (Cons!33030 (h!34293 (_ BitVec 64)) (t!47728 List!33034)) )
))
(declare-fun arrayNoDuplicates!0 (array!96344 (_ BitVec 32) List!33034) Bool)

(assert (=> b!1409133 (= res!946855 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33031))))

(assert (= (and start!121190 res!946852) b!1409126))

(assert (= (and b!1409126 res!946854) b!1409129))

(assert (= (and b!1409129 res!946849) b!1409131))

(assert (= (and b!1409131 res!946850) b!1409132))

(assert (= (and b!1409132 res!946851) b!1409133))

(assert (= (and b!1409133 res!946855) b!1409128))

(assert (= (and b!1409128 res!946853) b!1409127))

(assert (= (and b!1409128 (not res!946848)) b!1409130))

(declare-fun m!1298713 () Bool)

(assert (=> b!1409127 m!1298713))

(assert (=> b!1409127 m!1298713))

(declare-fun m!1298715 () Bool)

(assert (=> b!1409127 m!1298715))

(declare-fun m!1298717 () Bool)

(assert (=> b!1409133 m!1298717))

(declare-fun m!1298719 () Bool)

(assert (=> start!121190 m!1298719))

(declare-fun m!1298721 () Bool)

(assert (=> start!121190 m!1298721))

(declare-fun m!1298723 () Bool)

(assert (=> b!1409129 m!1298723))

(assert (=> b!1409129 m!1298723))

(declare-fun m!1298725 () Bool)

(assert (=> b!1409129 m!1298725))

(assert (=> b!1409128 m!1298713))

(declare-fun m!1298727 () Bool)

(assert (=> b!1409128 m!1298727))

(assert (=> b!1409128 m!1298713))

(declare-fun m!1298729 () Bool)

(assert (=> b!1409128 m!1298729))

(assert (=> b!1409128 m!1298727))

(assert (=> b!1409128 m!1298713))

(declare-fun m!1298731 () Bool)

(assert (=> b!1409128 m!1298731))

(declare-fun m!1298733 () Bool)

(assert (=> b!1409128 m!1298733))

(declare-fun m!1298735 () Bool)

(assert (=> b!1409130 m!1298735))

(declare-fun m!1298737 () Bool)

(assert (=> b!1409130 m!1298737))

(assert (=> b!1409130 m!1298737))

(declare-fun m!1298739 () Bool)

(assert (=> b!1409130 m!1298739))

(assert (=> b!1409130 m!1298739))

(assert (=> b!1409130 m!1298737))

(declare-fun m!1298741 () Bool)

(assert (=> b!1409130 m!1298741))

(declare-fun m!1298743 () Bool)

(assert (=> b!1409132 m!1298743))

(assert (=> b!1409131 m!1298713))

(assert (=> b!1409131 m!1298713))

(declare-fun m!1298745 () Bool)

(assert (=> b!1409131 m!1298745))

(check-sat (not start!121190) (not b!1409128) (not b!1409131) (not b!1409127) (not b!1409133) (not b!1409132) (not b!1409130) (not b!1409129))
(check-sat)
