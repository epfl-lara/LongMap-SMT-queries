; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119278 () Bool)

(assert start!119278)

(declare-fun b!1390956 () Bool)

(declare-fun res!930976 () Bool)

(declare-fun e!787688 () Bool)

(assert (=> b!1390956 (=> (not res!930976) (not e!787688))))

(declare-datatypes ((array!95164 0))(
  ( (array!95165 (arr!45946 (Array (_ BitVec 32) (_ BitVec 64))) (size!46496 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95164)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390956 (= res!930976 (validKeyInArray!0 (select (arr!45946 a!2901) j!112)))))

(declare-fun b!1390957 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!787687 () Bool)

(declare-datatypes ((SeekEntryResult!10263 0))(
  ( (MissingZero!10263 (index!43423 (_ BitVec 32))) (Found!10263 (index!43424 (_ BitVec 32))) (Intermediate!10263 (undefined!11075 Bool) (index!43425 (_ BitVec 32)) (x!125099 (_ BitVec 32))) (Undefined!10263) (MissingVacant!10263 (index!43426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95164 (_ BitVec 32)) SeekEntryResult!10263)

(assert (=> b!1390957 (= e!787687 (= (seekEntryOrOpen!0 (select (arr!45946 a!2901) j!112) a!2901 mask!2840) (Found!10263 j!112)))))

(declare-fun b!1390958 () Bool)

(declare-fun lt!611016 () SeekEntryResult!10263)

(assert (=> b!1390958 (= e!787688 (not (or (not (is-Intermediate!10263 lt!611016)) (undefined!11075 lt!611016) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1390958 e!787687))

(declare-fun res!930975 () Bool)

(assert (=> b!1390958 (=> (not res!930975) (not e!787687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95164 (_ BitVec 32)) Bool)

(assert (=> b!1390958 (= res!930975 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46530 0))(
  ( (Unit!46531) )
))
(declare-fun lt!611015 () Unit!46530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46530)

(assert (=> b!1390958 (= lt!611015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95164 (_ BitVec 32)) SeekEntryResult!10263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390958 (= lt!611016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45946 a!2901) j!112) mask!2840) (select (arr!45946 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930972 () Bool)

(assert (=> start!119278 (=> (not res!930972) (not e!787688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119278 (= res!930972 (validMask!0 mask!2840))))

(assert (=> start!119278 e!787688))

(assert (=> start!119278 true))

(declare-fun array_inv!34974 (array!95164) Bool)

(assert (=> start!119278 (array_inv!34974 a!2901)))

(declare-fun b!1390959 () Bool)

(declare-fun res!930970 () Bool)

(assert (=> b!1390959 (=> (not res!930970) (not e!787688))))

(assert (=> b!1390959 (= res!930970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390960 () Bool)

(declare-fun res!930973 () Bool)

(assert (=> b!1390960 (=> (not res!930973) (not e!787688))))

(declare-datatypes ((List!32465 0))(
  ( (Nil!32462) (Cons!32461 (h!33682 (_ BitVec 64)) (t!47159 List!32465)) )
))
(declare-fun arrayNoDuplicates!0 (array!95164 (_ BitVec 32) List!32465) Bool)

(assert (=> b!1390960 (= res!930973 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32462))))

(declare-fun b!1390961 () Bool)

(declare-fun res!930974 () Bool)

(assert (=> b!1390961 (=> (not res!930974) (not e!787688))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390961 (= res!930974 (and (= (size!46496 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46496 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46496 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390962 () Bool)

(declare-fun res!930971 () Bool)

(assert (=> b!1390962 (=> (not res!930971) (not e!787688))))

(assert (=> b!1390962 (= res!930971 (validKeyInArray!0 (select (arr!45946 a!2901) i!1037)))))

(assert (= (and start!119278 res!930972) b!1390961))

(assert (= (and b!1390961 res!930974) b!1390962))

(assert (= (and b!1390962 res!930971) b!1390956))

(assert (= (and b!1390956 res!930976) b!1390959))

(assert (= (and b!1390959 res!930970) b!1390960))

(assert (= (and b!1390960 res!930973) b!1390958))

(assert (= (and b!1390958 res!930975) b!1390957))

(declare-fun m!1276771 () Bool)

(assert (=> b!1390957 m!1276771))

(assert (=> b!1390957 m!1276771))

(declare-fun m!1276773 () Bool)

(assert (=> b!1390957 m!1276773))

(declare-fun m!1276775 () Bool)

(assert (=> start!119278 m!1276775))

(declare-fun m!1276777 () Bool)

(assert (=> start!119278 m!1276777))

(declare-fun m!1276779 () Bool)

(assert (=> b!1390960 m!1276779))

(assert (=> b!1390958 m!1276771))

(declare-fun m!1276781 () Bool)

(assert (=> b!1390958 m!1276781))

(assert (=> b!1390958 m!1276771))

(declare-fun m!1276783 () Bool)

(assert (=> b!1390958 m!1276783))

(assert (=> b!1390958 m!1276781))

(assert (=> b!1390958 m!1276771))

(declare-fun m!1276785 () Bool)

(assert (=> b!1390958 m!1276785))

(declare-fun m!1276787 () Bool)

(assert (=> b!1390958 m!1276787))

(declare-fun m!1276789 () Bool)

(assert (=> b!1390959 m!1276789))

(declare-fun m!1276791 () Bool)

(assert (=> b!1390962 m!1276791))

(assert (=> b!1390962 m!1276791))

(declare-fun m!1276793 () Bool)

(assert (=> b!1390962 m!1276793))

(assert (=> b!1390956 m!1276771))

(assert (=> b!1390956 m!1276771))

(declare-fun m!1276795 () Bool)

(assert (=> b!1390956 m!1276795))

(push 1)

(assert (not b!1390960))

(assert (not b!1390957))

(assert (not b!1390956))

(assert (not b!1390962))

(assert (not start!119278))

(assert (not b!1390959))

(assert (not b!1390958))

