; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119148 () Bool)

(assert start!119148)

(declare-fun b!1389937 () Bool)

(declare-fun res!930102 () Bool)

(declare-fun e!787207 () Bool)

(assert (=> b!1389937 (=> (not res!930102) (not e!787207))))

(declare-datatypes ((array!95085 0))(
  ( (array!95086 (arr!45908 (Array (_ BitVec 32) (_ BitVec 64))) (size!46458 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95085)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389937 (= res!930102 (validKeyInArray!0 (select (arr!45908 a!2901) i!1037)))))

(declare-fun b!1389938 () Bool)

(declare-fun res!930098 () Bool)

(assert (=> b!1389938 (=> (not res!930098) (not e!787207))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389938 (= res!930098 (validKeyInArray!0 (select (arr!45908 a!2901) j!112)))))

(declare-fun b!1389939 () Bool)

(declare-fun res!930100 () Bool)

(assert (=> b!1389939 (=> (not res!930100) (not e!787207))))

(declare-datatypes ((List!32427 0))(
  ( (Nil!32424) (Cons!32423 (h!33641 (_ BitVec 64)) (t!47121 List!32427)) )
))
(declare-fun arrayNoDuplicates!0 (array!95085 (_ BitVec 32) List!32427) Bool)

(assert (=> b!1389939 (= res!930100 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32424))))

(declare-fun b!1389940 () Bool)

(assert (=> b!1389940 (= e!787207 (not true))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95085 (_ BitVec 32)) Bool)

(assert (=> b!1389940 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46454 0))(
  ( (Unit!46455) )
))
(declare-fun lt!610679 () Unit!46454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46454)

(assert (=> b!1389940 (= lt!610679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10225 0))(
  ( (MissingZero!10225 (index!43271 (_ BitVec 32))) (Found!10225 (index!43272 (_ BitVec 32))) (Intermediate!10225 (undefined!11037 Bool) (index!43273 (_ BitVec 32)) (x!124959 (_ BitVec 32))) (Undefined!10225) (MissingVacant!10225 (index!43274 (_ BitVec 32))) )
))
(declare-fun lt!610680 () SeekEntryResult!10225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95085 (_ BitVec 32)) SeekEntryResult!10225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389940 (= lt!610680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45908 a!2901) j!112) mask!2840) (select (arr!45908 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389941 () Bool)

(declare-fun res!930103 () Bool)

(assert (=> b!1389941 (=> (not res!930103) (not e!787207))))

(assert (=> b!1389941 (= res!930103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389942 () Bool)

(declare-fun res!930099 () Bool)

(assert (=> b!1389942 (=> (not res!930099) (not e!787207))))

(assert (=> b!1389942 (= res!930099 (and (= (size!46458 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46458 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46458 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930101 () Bool)

(assert (=> start!119148 (=> (not res!930101) (not e!787207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119148 (= res!930101 (validMask!0 mask!2840))))

(assert (=> start!119148 e!787207))

(assert (=> start!119148 true))

(declare-fun array_inv!34936 (array!95085) Bool)

(assert (=> start!119148 (array_inv!34936 a!2901)))

(assert (= (and start!119148 res!930101) b!1389942))

(assert (= (and b!1389942 res!930099) b!1389937))

(assert (= (and b!1389937 res!930102) b!1389938))

(assert (= (and b!1389938 res!930098) b!1389941))

(assert (= (and b!1389941 res!930103) b!1389939))

(assert (= (and b!1389939 res!930100) b!1389940))

(declare-fun m!1275663 () Bool)

(assert (=> b!1389939 m!1275663))

(declare-fun m!1275665 () Bool)

(assert (=> b!1389938 m!1275665))

(assert (=> b!1389938 m!1275665))

(declare-fun m!1275667 () Bool)

(assert (=> b!1389938 m!1275667))

(declare-fun m!1275669 () Bool)

(assert (=> start!119148 m!1275669))

(declare-fun m!1275671 () Bool)

(assert (=> start!119148 m!1275671))

(declare-fun m!1275673 () Bool)

(assert (=> b!1389937 m!1275673))

(assert (=> b!1389937 m!1275673))

(declare-fun m!1275675 () Bool)

(assert (=> b!1389937 m!1275675))

(assert (=> b!1389940 m!1275665))

(declare-fun m!1275677 () Bool)

(assert (=> b!1389940 m!1275677))

(assert (=> b!1389940 m!1275665))

(declare-fun m!1275679 () Bool)

(assert (=> b!1389940 m!1275679))

(assert (=> b!1389940 m!1275677))

(assert (=> b!1389940 m!1275665))

(declare-fun m!1275681 () Bool)

(assert (=> b!1389940 m!1275681))

(declare-fun m!1275683 () Bool)

(assert (=> b!1389940 m!1275683))

(declare-fun m!1275685 () Bool)

(assert (=> b!1389941 m!1275685))

(push 1)

(assert (not b!1389940))

(assert (not b!1389937))

(assert (not b!1389941))

(assert (not start!119148))

(assert (not b!1389939))

(assert (not b!1389938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

