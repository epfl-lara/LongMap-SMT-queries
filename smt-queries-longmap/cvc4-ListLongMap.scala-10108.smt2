; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119146 () Bool)

(assert start!119146)

(declare-fun b!1389919 () Bool)

(declare-fun res!930084 () Bool)

(declare-fun e!787201 () Bool)

(assert (=> b!1389919 (=> (not res!930084) (not e!787201))))

(declare-datatypes ((array!95083 0))(
  ( (array!95084 (arr!45907 (Array (_ BitVec 32) (_ BitVec 64))) (size!46457 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95083)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95083 (_ BitVec 32)) Bool)

(assert (=> b!1389919 (= res!930084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389921 () Bool)

(declare-fun res!930081 () Bool)

(assert (=> b!1389921 (=> (not res!930081) (not e!787201))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389921 (= res!930081 (validKeyInArray!0 (select (arr!45907 a!2901) i!1037)))))

(declare-fun b!1389922 () Bool)

(assert (=> b!1389922 (= e!787201 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389922 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46452 0))(
  ( (Unit!46453) )
))
(declare-fun lt!610673 () Unit!46452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46452)

(assert (=> b!1389922 (= lt!610673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10224 0))(
  ( (MissingZero!10224 (index!43267 (_ BitVec 32))) (Found!10224 (index!43268 (_ BitVec 32))) (Intermediate!10224 (undefined!11036 Bool) (index!43269 (_ BitVec 32)) (x!124950 (_ BitVec 32))) (Undefined!10224) (MissingVacant!10224 (index!43270 (_ BitVec 32))) )
))
(declare-fun lt!610674 () SeekEntryResult!10224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95083 (_ BitVec 32)) SeekEntryResult!10224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389922 (= lt!610674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45907 a!2901) j!112) mask!2840) (select (arr!45907 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389923 () Bool)

(declare-fun res!930080 () Bool)

(assert (=> b!1389923 (=> (not res!930080) (not e!787201))))

(declare-datatypes ((List!32426 0))(
  ( (Nil!32423) (Cons!32422 (h!33640 (_ BitVec 64)) (t!47120 List!32426)) )
))
(declare-fun arrayNoDuplicates!0 (array!95083 (_ BitVec 32) List!32426) Bool)

(assert (=> b!1389923 (= res!930080 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32423))))

(declare-fun b!1389924 () Bool)

(declare-fun res!930082 () Bool)

(assert (=> b!1389924 (=> (not res!930082) (not e!787201))))

(assert (=> b!1389924 (= res!930082 (and (= (size!46457 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46457 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46457 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930083 () Bool)

(assert (=> start!119146 (=> (not res!930083) (not e!787201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119146 (= res!930083 (validMask!0 mask!2840))))

(assert (=> start!119146 e!787201))

(assert (=> start!119146 true))

(declare-fun array_inv!34935 (array!95083) Bool)

(assert (=> start!119146 (array_inv!34935 a!2901)))

(declare-fun b!1389920 () Bool)

(declare-fun res!930085 () Bool)

(assert (=> b!1389920 (=> (not res!930085) (not e!787201))))

(assert (=> b!1389920 (= res!930085 (validKeyInArray!0 (select (arr!45907 a!2901) j!112)))))

(assert (= (and start!119146 res!930083) b!1389924))

(assert (= (and b!1389924 res!930082) b!1389921))

(assert (= (and b!1389921 res!930081) b!1389920))

(assert (= (and b!1389920 res!930085) b!1389919))

(assert (= (and b!1389919 res!930084) b!1389923))

(assert (= (and b!1389923 res!930080) b!1389922))

(declare-fun m!1275639 () Bool)

(assert (=> b!1389921 m!1275639))

(assert (=> b!1389921 m!1275639))

(declare-fun m!1275641 () Bool)

(assert (=> b!1389921 m!1275641))

(declare-fun m!1275643 () Bool)

(assert (=> start!119146 m!1275643))

(declare-fun m!1275645 () Bool)

(assert (=> start!119146 m!1275645))

(declare-fun m!1275647 () Bool)

(assert (=> b!1389923 m!1275647))

(declare-fun m!1275649 () Bool)

(assert (=> b!1389920 m!1275649))

(assert (=> b!1389920 m!1275649))

(declare-fun m!1275651 () Bool)

(assert (=> b!1389920 m!1275651))

(assert (=> b!1389922 m!1275649))

(declare-fun m!1275653 () Bool)

(assert (=> b!1389922 m!1275653))

(assert (=> b!1389922 m!1275649))

(declare-fun m!1275655 () Bool)

(assert (=> b!1389922 m!1275655))

(assert (=> b!1389922 m!1275653))

(assert (=> b!1389922 m!1275649))

(declare-fun m!1275657 () Bool)

(assert (=> b!1389922 m!1275657))

(declare-fun m!1275659 () Bool)

(assert (=> b!1389922 m!1275659))

(declare-fun m!1275661 () Bool)

(assert (=> b!1389919 m!1275661))

(push 1)

(assert (not b!1389923))

(assert (not b!1389920))

(assert (not b!1389921))

(assert (not b!1389919))

(assert (not start!119146))

(assert (not b!1389922))

(check-sat)

