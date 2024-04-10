; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119138 () Bool)

(assert start!119138)

(declare-fun b!1389847 () Bool)

(declare-fun e!787178 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389847 (= e!787178 (not (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95075 0))(
  ( (array!95076 (arr!45903 (Array (_ BitVec 32) (_ BitVec 64))) (size!46453 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95075)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95075 (_ BitVec 32)) Bool)

(assert (=> b!1389847 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46444 0))(
  ( (Unit!46445) )
))
(declare-fun lt!610649 () Unit!46444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46444)

(assert (=> b!1389847 (= lt!610649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10220 0))(
  ( (MissingZero!10220 (index!43251 (_ BitVec 32))) (Found!10220 (index!43252 (_ BitVec 32))) (Intermediate!10220 (undefined!11032 Bool) (index!43253 (_ BitVec 32)) (x!124938 (_ BitVec 32))) (Undefined!10220) (MissingVacant!10220 (index!43254 (_ BitVec 32))) )
))
(declare-fun lt!610650 () SeekEntryResult!10220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95075 (_ BitVec 32)) SeekEntryResult!10220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389847 (= lt!610650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45903 a!2901) j!112) mask!2840) (select (arr!45903 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389849 () Bool)

(declare-fun res!930009 () Bool)

(assert (=> b!1389849 (=> (not res!930009) (not e!787178))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389849 (= res!930009 (and (= (size!46453 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46453 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46453 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389850 () Bool)

(declare-fun res!930011 () Bool)

(assert (=> b!1389850 (=> (not res!930011) (not e!787178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389850 (= res!930011 (validKeyInArray!0 (select (arr!45903 a!2901) j!112)))))

(declare-fun b!1389851 () Bool)

(declare-fun res!930008 () Bool)

(assert (=> b!1389851 (=> (not res!930008) (not e!787178))))

(assert (=> b!1389851 (= res!930008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389852 () Bool)

(declare-fun res!930012 () Bool)

(assert (=> b!1389852 (=> (not res!930012) (not e!787178))))

(declare-datatypes ((List!32422 0))(
  ( (Nil!32419) (Cons!32418 (h!33636 (_ BitVec 64)) (t!47116 List!32422)) )
))
(declare-fun arrayNoDuplicates!0 (array!95075 (_ BitVec 32) List!32422) Bool)

(assert (=> b!1389852 (= res!930012 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32419))))

(declare-fun res!930010 () Bool)

(assert (=> start!119138 (=> (not res!930010) (not e!787178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119138 (= res!930010 (validMask!0 mask!2840))))

(assert (=> start!119138 e!787178))

(assert (=> start!119138 true))

(declare-fun array_inv!34931 (array!95075) Bool)

(assert (=> start!119138 (array_inv!34931 a!2901)))

(declare-fun b!1389848 () Bool)

(declare-fun res!930013 () Bool)

(assert (=> b!1389848 (=> (not res!930013) (not e!787178))))

(assert (=> b!1389848 (= res!930013 (validKeyInArray!0 (select (arr!45903 a!2901) i!1037)))))

(assert (= (and start!119138 res!930010) b!1389849))

(assert (= (and b!1389849 res!930009) b!1389848))

(assert (= (and b!1389848 res!930013) b!1389850))

(assert (= (and b!1389850 res!930011) b!1389851))

(assert (= (and b!1389851 res!930008) b!1389852))

(assert (= (and b!1389852 res!930012) b!1389847))

(declare-fun m!1275543 () Bool)

(assert (=> b!1389851 m!1275543))

(declare-fun m!1275545 () Bool)

(assert (=> b!1389847 m!1275545))

(declare-fun m!1275547 () Bool)

(assert (=> b!1389847 m!1275547))

(assert (=> b!1389847 m!1275545))

(declare-fun m!1275549 () Bool)

(assert (=> b!1389847 m!1275549))

(assert (=> b!1389847 m!1275547))

(assert (=> b!1389847 m!1275545))

(declare-fun m!1275551 () Bool)

(assert (=> b!1389847 m!1275551))

(declare-fun m!1275553 () Bool)

(assert (=> b!1389847 m!1275553))

(assert (=> b!1389850 m!1275545))

(assert (=> b!1389850 m!1275545))

(declare-fun m!1275555 () Bool)

(assert (=> b!1389850 m!1275555))

(declare-fun m!1275557 () Bool)

(assert (=> start!119138 m!1275557))

(declare-fun m!1275559 () Bool)

(assert (=> start!119138 m!1275559))

(declare-fun m!1275561 () Bool)

(assert (=> b!1389848 m!1275561))

(assert (=> b!1389848 m!1275561))

(declare-fun m!1275563 () Bool)

(assert (=> b!1389848 m!1275563))

(declare-fun m!1275565 () Bool)

(assert (=> b!1389852 m!1275565))

(check-sat (not b!1389848) (not b!1389851) (not b!1389852) (not b!1389850) (not b!1389847) (not start!119138))
(check-sat)
