; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119386 () Bool)

(assert start!119386)

(declare-fun b!1391595 () Bool)

(declare-fun res!931078 () Bool)

(declare-fun e!788164 () Bool)

(assert (=> b!1391595 (=> (not res!931078) (not e!788164))))

(declare-datatypes ((array!95245 0))(
  ( (array!95246 (arr!45986 (Array (_ BitVec 32) (_ BitVec 64))) (size!46537 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95245)

(declare-datatypes ((List!32492 0))(
  ( (Nil!32489) (Cons!32488 (h!33714 (_ BitVec 64)) (t!47178 List!32492)) )
))
(declare-fun arrayNoDuplicates!0 (array!95245 (_ BitVec 32) List!32492) Bool)

(assert (=> b!1391595 (= res!931078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32489))))

(declare-fun b!1391597 () Bool)

(declare-fun res!931072 () Bool)

(assert (=> b!1391597 (=> (not res!931072) (not e!788164))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391597 (= res!931072 (validKeyInArray!0 (select (arr!45986 a!2901) i!1037)))))

(declare-fun b!1391598 () Bool)

(declare-fun res!931074 () Bool)

(assert (=> b!1391598 (=> (not res!931074) (not e!788164))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391598 (= res!931074 (validKeyInArray!0 (select (arr!45986 a!2901) j!112)))))

(declare-fun b!1391599 () Bool)

(declare-fun res!931073 () Bool)

(assert (=> b!1391599 (=> (not res!931073) (not e!788164))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95245 (_ BitVec 32)) Bool)

(assert (=> b!1391599 (= res!931073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391600 () Bool)

(declare-fun res!931077 () Bool)

(assert (=> b!1391600 (=> (not res!931077) (not e!788164))))

(assert (=> b!1391600 (= res!931077 (and (= (size!46537 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46537 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46537 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391601 () Bool)

(declare-fun e!788165 () Bool)

(declare-datatypes ((SeekEntryResult!10206 0))(
  ( (MissingZero!10206 (index!43195 (_ BitVec 32))) (Found!10206 (index!43196 (_ BitVec 32))) (Intermediate!10206 (undefined!11018 Bool) (index!43197 (_ BitVec 32)) (x!125023 (_ BitVec 32))) (Undefined!10206) (MissingVacant!10206 (index!43198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10206)

(assert (=> b!1391601 (= e!788165 (= (seekEntryOrOpen!0 (select (arr!45986 a!2901) j!112) a!2901 mask!2840) (Found!10206 j!112)))))

(declare-fun res!931076 () Bool)

(assert (=> start!119386 (=> (not res!931076) (not e!788164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119386 (= res!931076 (validMask!0 mask!2840))))

(assert (=> start!119386 e!788164))

(assert (=> start!119386 true))

(declare-fun array_inv!35267 (array!95245) Bool)

(assert (=> start!119386 (array_inv!35267 a!2901)))

(declare-fun b!1391596 () Bool)

(assert (=> b!1391596 (= e!788164 (not true))))

(assert (=> b!1391596 e!788165))

(declare-fun res!931075 () Bool)

(assert (=> b!1391596 (=> (not res!931075) (not e!788165))))

(assert (=> b!1391596 (= res!931075 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46443 0))(
  ( (Unit!46444) )
))
(declare-fun lt!611228 () Unit!46443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46443)

(assert (=> b!1391596 (= lt!611228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611227 () SeekEntryResult!10206)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391596 (= lt!611227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45986 a!2901) j!112) mask!2840) (select (arr!45986 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119386 res!931076) b!1391600))

(assert (= (and b!1391600 res!931077) b!1391597))

(assert (= (and b!1391597 res!931072) b!1391598))

(assert (= (and b!1391598 res!931074) b!1391599))

(assert (= (and b!1391599 res!931073) b!1391595))

(assert (= (and b!1391595 res!931078) b!1391596))

(assert (= (and b!1391596 res!931075) b!1391601))

(declare-fun m!1277679 () Bool)

(assert (=> b!1391595 m!1277679))

(declare-fun m!1277681 () Bool)

(assert (=> b!1391599 m!1277681))

(declare-fun m!1277683 () Bool)

(assert (=> b!1391598 m!1277683))

(assert (=> b!1391598 m!1277683))

(declare-fun m!1277685 () Bool)

(assert (=> b!1391598 m!1277685))

(assert (=> b!1391596 m!1277683))

(declare-fun m!1277687 () Bool)

(assert (=> b!1391596 m!1277687))

(assert (=> b!1391596 m!1277683))

(declare-fun m!1277689 () Bool)

(assert (=> b!1391596 m!1277689))

(assert (=> b!1391596 m!1277687))

(assert (=> b!1391596 m!1277683))

(declare-fun m!1277691 () Bool)

(assert (=> b!1391596 m!1277691))

(declare-fun m!1277693 () Bool)

(assert (=> b!1391596 m!1277693))

(declare-fun m!1277695 () Bool)

(assert (=> start!119386 m!1277695))

(declare-fun m!1277697 () Bool)

(assert (=> start!119386 m!1277697))

(declare-fun m!1277699 () Bool)

(assert (=> b!1391597 m!1277699))

(assert (=> b!1391597 m!1277699))

(declare-fun m!1277701 () Bool)

(assert (=> b!1391597 m!1277701))

(assert (=> b!1391601 m!1277683))

(assert (=> b!1391601 m!1277683))

(declare-fun m!1277703 () Bool)

(assert (=> b!1391601 m!1277703))

(push 1)

(assert (not b!1391599))

(assert (not start!119386))

(assert (not b!1391595))

(assert (not b!1391598))

(assert (not b!1391596))

(assert (not b!1391601))

(assert (not b!1391597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

