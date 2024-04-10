; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120812 () Bool)

(assert start!120812)

(declare-fun b!1405689 () Bool)

(declare-fun e!795665 () Bool)

(declare-fun e!795668 () Bool)

(assert (=> b!1405689 (= e!795665 (not e!795668))))

(declare-fun res!943906 () Bool)

(assert (=> b!1405689 (=> res!943906 e!795668)))

(declare-datatypes ((SeekEntryResult!10718 0))(
  ( (MissingZero!10718 (index!45249 (_ BitVec 32))) (Found!10718 (index!45250 (_ BitVec 32))) (Intermediate!10718 (undefined!11530 Bool) (index!45251 (_ BitVec 32)) (x!126861 (_ BitVec 32))) (Undefined!10718) (MissingVacant!10718 (index!45252 (_ BitVec 32))) )
))
(declare-fun lt!619103 () SeekEntryResult!10718)

(get-info :version)

(assert (=> b!1405689 (= res!943906 (or (not ((_ is Intermediate!10718) lt!619103)) (undefined!11530 lt!619103)))))

(declare-fun e!795666 () Bool)

(assert (=> b!1405689 e!795666))

(declare-fun res!943909 () Bool)

(assert (=> b!1405689 (=> (not res!943909) (not e!795666))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96119 0))(
  ( (array!96120 (arr!46407 (Array (_ BitVec 32) (_ BitVec 64))) (size!46957 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96119)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96119 (_ BitVec 32)) Bool)

(assert (=> b!1405689 (= res!943909 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47410 0))(
  ( (Unit!47411) )
))
(declare-fun lt!619104 () Unit!47410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47410)

(assert (=> b!1405689 (= lt!619104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96119 (_ BitVec 32)) SeekEntryResult!10718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405689 (= lt!619103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46407 a!2901) j!112) mask!2840) (select (arr!46407 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405690 () Bool)

(declare-fun res!943905 () Bool)

(assert (=> b!1405690 (=> (not res!943905) (not e!795665))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405690 (= res!943905 (and (= (size!46957 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46957 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46957 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405691 () Bool)

(declare-fun res!943907 () Bool)

(assert (=> b!1405691 (=> (not res!943907) (not e!795665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405691 (= res!943907 (validKeyInArray!0 (select (arr!46407 a!2901) i!1037)))))

(declare-fun b!1405692 () Bool)

(assert (=> b!1405692 (= e!795668 true)))

(declare-fun lt!619102 () (_ BitVec 32))

(assert (=> b!1405692 (= lt!619102 (toIndex!0 (select (store (arr!46407 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405693 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96119 (_ BitVec 32)) SeekEntryResult!10718)

(assert (=> b!1405693 (= e!795666 (= (seekEntryOrOpen!0 (select (arr!46407 a!2901) j!112) a!2901 mask!2840) (Found!10718 j!112)))))

(declare-fun b!1405694 () Bool)

(declare-fun res!943908 () Bool)

(assert (=> b!1405694 (=> (not res!943908) (not e!795665))))

(assert (=> b!1405694 (= res!943908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405695 () Bool)

(declare-fun res!943912 () Bool)

(assert (=> b!1405695 (=> (not res!943912) (not e!795665))))

(declare-datatypes ((List!32926 0))(
  ( (Nil!32923) (Cons!32922 (h!34176 (_ BitVec 64)) (t!47620 List!32926)) )
))
(declare-fun arrayNoDuplicates!0 (array!96119 (_ BitVec 32) List!32926) Bool)

(assert (=> b!1405695 (= res!943912 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32923))))

(declare-fun res!943911 () Bool)

(assert (=> start!120812 (=> (not res!943911) (not e!795665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120812 (= res!943911 (validMask!0 mask!2840))))

(assert (=> start!120812 e!795665))

(assert (=> start!120812 true))

(declare-fun array_inv!35435 (array!96119) Bool)

(assert (=> start!120812 (array_inv!35435 a!2901)))

(declare-fun b!1405688 () Bool)

(declare-fun res!943910 () Bool)

(assert (=> b!1405688 (=> (not res!943910) (not e!795665))))

(assert (=> b!1405688 (= res!943910 (validKeyInArray!0 (select (arr!46407 a!2901) j!112)))))

(assert (= (and start!120812 res!943911) b!1405690))

(assert (= (and b!1405690 res!943905) b!1405691))

(assert (= (and b!1405691 res!943907) b!1405688))

(assert (= (and b!1405688 res!943910) b!1405694))

(assert (= (and b!1405694 res!943908) b!1405695))

(assert (= (and b!1405695 res!943912) b!1405689))

(assert (= (and b!1405689 res!943909) b!1405693))

(assert (= (and b!1405689 (not res!943906)) b!1405692))

(declare-fun m!1294529 () Bool)

(assert (=> b!1405688 m!1294529))

(assert (=> b!1405688 m!1294529))

(declare-fun m!1294531 () Bool)

(assert (=> b!1405688 m!1294531))

(assert (=> b!1405693 m!1294529))

(assert (=> b!1405693 m!1294529))

(declare-fun m!1294533 () Bool)

(assert (=> b!1405693 m!1294533))

(assert (=> b!1405689 m!1294529))

(declare-fun m!1294535 () Bool)

(assert (=> b!1405689 m!1294535))

(assert (=> b!1405689 m!1294529))

(declare-fun m!1294537 () Bool)

(assert (=> b!1405689 m!1294537))

(assert (=> b!1405689 m!1294535))

(assert (=> b!1405689 m!1294529))

(declare-fun m!1294539 () Bool)

(assert (=> b!1405689 m!1294539))

(declare-fun m!1294541 () Bool)

(assert (=> b!1405689 m!1294541))

(declare-fun m!1294543 () Bool)

(assert (=> start!120812 m!1294543))

(declare-fun m!1294545 () Bool)

(assert (=> start!120812 m!1294545))

(declare-fun m!1294547 () Bool)

(assert (=> b!1405691 m!1294547))

(assert (=> b!1405691 m!1294547))

(declare-fun m!1294549 () Bool)

(assert (=> b!1405691 m!1294549))

(declare-fun m!1294551 () Bool)

(assert (=> b!1405692 m!1294551))

(declare-fun m!1294553 () Bool)

(assert (=> b!1405692 m!1294553))

(assert (=> b!1405692 m!1294553))

(declare-fun m!1294555 () Bool)

(assert (=> b!1405692 m!1294555))

(declare-fun m!1294557 () Bool)

(assert (=> b!1405694 m!1294557))

(declare-fun m!1294559 () Bool)

(assert (=> b!1405695 m!1294559))

(check-sat (not b!1405692) (not b!1405689) (not b!1405695) (not b!1405693) (not b!1405688) (not b!1405691) (not b!1405694) (not start!120812))
