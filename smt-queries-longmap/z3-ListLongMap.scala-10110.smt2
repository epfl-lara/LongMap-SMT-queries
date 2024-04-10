; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119156 () Bool)

(assert start!119156)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95093 0))(
  ( (array!95094 (arr!45912 (Array (_ BitVec 32) (_ BitVec 64))) (size!46462 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95093)

(declare-fun b!1390014 () Bool)

(declare-fun e!787236 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10229 0))(
  ( (MissingZero!10229 (index!43287 (_ BitVec 32))) (Found!10229 (index!43288 (_ BitVec 32))) (Intermediate!10229 (undefined!11041 Bool) (index!43289 (_ BitVec 32)) (x!124971 (_ BitVec 32))) (Undefined!10229) (MissingVacant!10229 (index!43290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95093 (_ BitVec 32)) SeekEntryResult!10229)

(assert (=> b!1390014 (= e!787236 (= (seekEntryOrOpen!0 (select (arr!45912 a!2901) j!112) a!2901 mask!2840) (Found!10229 j!112)))))

(declare-fun b!1390015 () Bool)

(declare-fun res!930181 () Bool)

(declare-fun e!787237 () Bool)

(assert (=> b!1390015 (=> (not res!930181) (not e!787237))))

(declare-datatypes ((List!32431 0))(
  ( (Nil!32428) (Cons!32427 (h!33645 (_ BitVec 64)) (t!47125 List!32431)) )
))
(declare-fun arrayNoDuplicates!0 (array!95093 (_ BitVec 32) List!32431) Bool)

(assert (=> b!1390015 (= res!930181 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32428))))

(declare-fun res!930178 () Bool)

(assert (=> start!119156 (=> (not res!930178) (not e!787237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119156 (= res!930178 (validMask!0 mask!2840))))

(assert (=> start!119156 e!787237))

(assert (=> start!119156 true))

(declare-fun array_inv!34940 (array!95093) Bool)

(assert (=> start!119156 (array_inv!34940 a!2901)))

(declare-fun b!1390016 () Bool)

(declare-fun res!930179 () Bool)

(assert (=> b!1390016 (=> (not res!930179) (not e!787237))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390016 (= res!930179 (and (= (size!46462 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46462 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46462 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390017 () Bool)

(declare-fun res!930176 () Bool)

(assert (=> b!1390017 (=> (not res!930176) (not e!787237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390017 (= res!930176 (validKeyInArray!0 (select (arr!45912 a!2901) j!112)))))

(declare-fun b!1390018 () Bool)

(assert (=> b!1390018 (= e!787237 (not true))))

(assert (=> b!1390018 e!787236))

(declare-fun res!930177 () Bool)

(assert (=> b!1390018 (=> (not res!930177) (not e!787236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95093 (_ BitVec 32)) Bool)

(assert (=> b!1390018 (= res!930177 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46462 0))(
  ( (Unit!46463) )
))
(declare-fun lt!610703 () Unit!46462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46462)

(assert (=> b!1390018 (= lt!610703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610704 () SeekEntryResult!10229)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95093 (_ BitVec 32)) SeekEntryResult!10229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390018 (= lt!610704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45912 a!2901) j!112) mask!2840) (select (arr!45912 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390019 () Bool)

(declare-fun res!930180 () Bool)

(assert (=> b!1390019 (=> (not res!930180) (not e!787237))))

(assert (=> b!1390019 (= res!930180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390020 () Bool)

(declare-fun res!930175 () Bool)

(assert (=> b!1390020 (=> (not res!930175) (not e!787237))))

(assert (=> b!1390020 (= res!930175 (validKeyInArray!0 (select (arr!45912 a!2901) i!1037)))))

(assert (= (and start!119156 res!930178) b!1390016))

(assert (= (and b!1390016 res!930179) b!1390020))

(assert (= (and b!1390020 res!930175) b!1390017))

(assert (= (and b!1390017 res!930176) b!1390019))

(assert (= (and b!1390019 res!930180) b!1390015))

(assert (= (and b!1390015 res!930181) b!1390018))

(assert (= (and b!1390018 res!930177) b!1390014))

(declare-fun m!1275761 () Bool)

(assert (=> b!1390018 m!1275761))

(declare-fun m!1275763 () Bool)

(assert (=> b!1390018 m!1275763))

(assert (=> b!1390018 m!1275761))

(declare-fun m!1275765 () Bool)

(assert (=> b!1390018 m!1275765))

(assert (=> b!1390018 m!1275763))

(assert (=> b!1390018 m!1275761))

(declare-fun m!1275767 () Bool)

(assert (=> b!1390018 m!1275767))

(declare-fun m!1275769 () Bool)

(assert (=> b!1390018 m!1275769))

(declare-fun m!1275771 () Bool)

(assert (=> b!1390020 m!1275771))

(assert (=> b!1390020 m!1275771))

(declare-fun m!1275773 () Bool)

(assert (=> b!1390020 m!1275773))

(declare-fun m!1275775 () Bool)

(assert (=> b!1390015 m!1275775))

(declare-fun m!1275777 () Bool)

(assert (=> start!119156 m!1275777))

(declare-fun m!1275779 () Bool)

(assert (=> start!119156 m!1275779))

(declare-fun m!1275781 () Bool)

(assert (=> b!1390019 m!1275781))

(assert (=> b!1390017 m!1275761))

(assert (=> b!1390017 m!1275761))

(declare-fun m!1275783 () Bool)

(assert (=> b!1390017 m!1275783))

(assert (=> b!1390014 m!1275761))

(assert (=> b!1390014 m!1275761))

(declare-fun m!1275785 () Bool)

(assert (=> b!1390014 m!1275785))

(check-sat (not b!1390017) (not b!1390018) (not b!1390015) (not b!1390020) (not start!119156) (not b!1390014) (not b!1390019))
