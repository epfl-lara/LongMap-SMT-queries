; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120572 () Bool)

(assert start!120572)

(declare-fun b!1403931 () Bool)

(declare-fun res!942445 () Bool)

(declare-fun e!794859 () Bool)

(assert (=> b!1403931 (=> (not res!942445) (not e!794859))))

(declare-datatypes ((array!95981 0))(
  ( (array!95982 (arr!46341 (Array (_ BitVec 32) (_ BitVec 64))) (size!46891 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95981)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403931 (= res!942445 (validKeyInArray!0 (select (arr!46341 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1403932 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!794860 () Bool)

(declare-datatypes ((SeekEntryResult!10658 0))(
  ( (MissingZero!10658 (index!45009 (_ BitVec 32))) (Found!10658 (index!45010 (_ BitVec 32))) (Intermediate!10658 (undefined!11470 Bool) (index!45011 (_ BitVec 32)) (x!126613 (_ BitVec 32))) (Undefined!10658) (MissingVacant!10658 (index!45012 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95981 (_ BitVec 32)) SeekEntryResult!10658)

(assert (=> b!1403932 (= e!794860 (= (seekEntryOrOpen!0 (select (arr!46341 a!2901) j!112) a!2901 mask!2840) (Found!10658 j!112)))))

(declare-fun b!1403933 () Bool)

(declare-fun res!942446 () Bool)

(assert (=> b!1403933 (=> (not res!942446) (not e!794859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95981 (_ BitVec 32)) Bool)

(assert (=> b!1403933 (= res!942446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403934 () Bool)

(assert (=> b!1403934 (= e!794859 (not true))))

(assert (=> b!1403934 e!794860))

(declare-fun res!942444 () Bool)

(assert (=> b!1403934 (=> (not res!942444) (not e!794860))))

(assert (=> b!1403934 (= res!942444 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47320 0))(
  ( (Unit!47321) )
))
(declare-fun lt!618549 () Unit!47320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47320)

(assert (=> b!1403934 (= lt!618549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618548 () SeekEntryResult!10658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95981 (_ BitVec 32)) SeekEntryResult!10658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403934 (= lt!618548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46341 a!2901) j!112) mask!2840) (select (arr!46341 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403936 () Bool)

(declare-fun res!942443 () Bool)

(assert (=> b!1403936 (=> (not res!942443) (not e!794859))))

(assert (=> b!1403936 (= res!942443 (and (= (size!46891 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46891 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46891 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403937 () Bool)

(declare-fun res!942442 () Bool)

(assert (=> b!1403937 (=> (not res!942442) (not e!794859))))

(assert (=> b!1403937 (= res!942442 (validKeyInArray!0 (select (arr!46341 a!2901) j!112)))))

(declare-fun b!1403935 () Bool)

(declare-fun res!942448 () Bool)

(assert (=> b!1403935 (=> (not res!942448) (not e!794859))))

(declare-datatypes ((List!32860 0))(
  ( (Nil!32857) (Cons!32856 (h!34104 (_ BitVec 64)) (t!47554 List!32860)) )
))
(declare-fun arrayNoDuplicates!0 (array!95981 (_ BitVec 32) List!32860) Bool)

(assert (=> b!1403935 (= res!942448 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32857))))

(declare-fun res!942447 () Bool)

(assert (=> start!120572 (=> (not res!942447) (not e!794859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120572 (= res!942447 (validMask!0 mask!2840))))

(assert (=> start!120572 e!794859))

(assert (=> start!120572 true))

(declare-fun array_inv!35369 (array!95981) Bool)

(assert (=> start!120572 (array_inv!35369 a!2901)))

(assert (= (and start!120572 res!942447) b!1403936))

(assert (= (and b!1403936 res!942443) b!1403931))

(assert (= (and b!1403931 res!942445) b!1403937))

(assert (= (and b!1403937 res!942442) b!1403933))

(assert (= (and b!1403933 res!942446) b!1403935))

(assert (= (and b!1403935 res!942448) b!1403934))

(assert (= (and b!1403934 res!942444) b!1403932))

(declare-fun m!1292705 () Bool)

(assert (=> b!1403932 m!1292705))

(assert (=> b!1403932 m!1292705))

(declare-fun m!1292707 () Bool)

(assert (=> b!1403932 m!1292707))

(declare-fun m!1292709 () Bool)

(assert (=> b!1403931 m!1292709))

(assert (=> b!1403931 m!1292709))

(declare-fun m!1292711 () Bool)

(assert (=> b!1403931 m!1292711))

(assert (=> b!1403937 m!1292705))

(assert (=> b!1403937 m!1292705))

(declare-fun m!1292713 () Bool)

(assert (=> b!1403937 m!1292713))

(declare-fun m!1292715 () Bool)

(assert (=> start!120572 m!1292715))

(declare-fun m!1292717 () Bool)

(assert (=> start!120572 m!1292717))

(assert (=> b!1403934 m!1292705))

(declare-fun m!1292719 () Bool)

(assert (=> b!1403934 m!1292719))

(assert (=> b!1403934 m!1292705))

(declare-fun m!1292721 () Bool)

(assert (=> b!1403934 m!1292721))

(assert (=> b!1403934 m!1292719))

(assert (=> b!1403934 m!1292705))

(declare-fun m!1292723 () Bool)

(assert (=> b!1403934 m!1292723))

(declare-fun m!1292725 () Bool)

(assert (=> b!1403934 m!1292725))

(declare-fun m!1292727 () Bool)

(assert (=> b!1403935 m!1292727))

(declare-fun m!1292729 () Bool)

(assert (=> b!1403933 m!1292729))

(check-sat (not b!1403931) (not b!1403934) (not b!1403937) (not b!1403935) (not start!120572) (not b!1403933) (not b!1403932))
