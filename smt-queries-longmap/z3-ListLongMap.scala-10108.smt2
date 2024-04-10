; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119144 () Bool)

(assert start!119144)

(declare-fun b!1389901 () Bool)

(declare-fun res!930065 () Bool)

(declare-fun e!787196 () Bool)

(assert (=> b!1389901 (=> (not res!930065) (not e!787196))))

(declare-datatypes ((array!95081 0))(
  ( (array!95082 (arr!45906 (Array (_ BitVec 32) (_ BitVec 64))) (size!46456 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95081)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389901 (= res!930065 (validKeyInArray!0 (select (arr!45906 a!2901) i!1037)))))

(declare-fun b!1389902 () Bool)

(declare-fun res!930063 () Bool)

(assert (=> b!1389902 (=> (not res!930063) (not e!787196))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389902 (= res!930063 (validKeyInArray!0 (select (arr!45906 a!2901) j!112)))))

(declare-fun b!1389903 () Bool)

(declare-fun res!930062 () Bool)

(assert (=> b!1389903 (=> (not res!930062) (not e!787196))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389903 (= res!930062 (and (= (size!46456 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46456 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46456 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930066 () Bool)

(assert (=> start!119144 (=> (not res!930066) (not e!787196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119144 (= res!930066 (validMask!0 mask!2840))))

(assert (=> start!119144 e!787196))

(assert (=> start!119144 true))

(declare-fun array_inv!34934 (array!95081) Bool)

(assert (=> start!119144 (array_inv!34934 a!2901)))

(declare-fun b!1389904 () Bool)

(assert (=> b!1389904 (= e!787196 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95081 (_ BitVec 32)) Bool)

(assert (=> b!1389904 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46450 0))(
  ( (Unit!46451) )
))
(declare-fun lt!610668 () Unit!46450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46450)

(assert (=> b!1389904 (= lt!610668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10223 0))(
  ( (MissingZero!10223 (index!43263 (_ BitVec 32))) (Found!10223 (index!43264 (_ BitVec 32))) (Intermediate!10223 (undefined!11035 Bool) (index!43265 (_ BitVec 32)) (x!124949 (_ BitVec 32))) (Undefined!10223) (MissingVacant!10223 (index!43266 (_ BitVec 32))) )
))
(declare-fun lt!610667 () SeekEntryResult!10223)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95081 (_ BitVec 32)) SeekEntryResult!10223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389904 (= lt!610667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45906 a!2901) j!112) mask!2840) (select (arr!45906 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389905 () Bool)

(declare-fun res!930067 () Bool)

(assert (=> b!1389905 (=> (not res!930067) (not e!787196))))

(assert (=> b!1389905 (= res!930067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389906 () Bool)

(declare-fun res!930064 () Bool)

(assert (=> b!1389906 (=> (not res!930064) (not e!787196))))

(declare-datatypes ((List!32425 0))(
  ( (Nil!32422) (Cons!32421 (h!33639 (_ BitVec 64)) (t!47119 List!32425)) )
))
(declare-fun arrayNoDuplicates!0 (array!95081 (_ BitVec 32) List!32425) Bool)

(assert (=> b!1389906 (= res!930064 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32422))))

(assert (= (and start!119144 res!930066) b!1389903))

(assert (= (and b!1389903 res!930062) b!1389901))

(assert (= (and b!1389901 res!930065) b!1389902))

(assert (= (and b!1389902 res!930063) b!1389905))

(assert (= (and b!1389905 res!930067) b!1389906))

(assert (= (and b!1389906 res!930064) b!1389904))

(declare-fun m!1275615 () Bool)

(assert (=> b!1389902 m!1275615))

(assert (=> b!1389902 m!1275615))

(declare-fun m!1275617 () Bool)

(assert (=> b!1389902 m!1275617))

(declare-fun m!1275619 () Bool)

(assert (=> start!119144 m!1275619))

(declare-fun m!1275621 () Bool)

(assert (=> start!119144 m!1275621))

(assert (=> b!1389904 m!1275615))

(declare-fun m!1275623 () Bool)

(assert (=> b!1389904 m!1275623))

(assert (=> b!1389904 m!1275615))

(declare-fun m!1275625 () Bool)

(assert (=> b!1389904 m!1275625))

(assert (=> b!1389904 m!1275623))

(assert (=> b!1389904 m!1275615))

(declare-fun m!1275627 () Bool)

(assert (=> b!1389904 m!1275627))

(declare-fun m!1275629 () Bool)

(assert (=> b!1389904 m!1275629))

(declare-fun m!1275631 () Bool)

(assert (=> b!1389905 m!1275631))

(declare-fun m!1275633 () Bool)

(assert (=> b!1389901 m!1275633))

(assert (=> b!1389901 m!1275633))

(declare-fun m!1275635 () Bool)

(assert (=> b!1389901 m!1275635))

(declare-fun m!1275637 () Bool)

(assert (=> b!1389906 m!1275637))

(check-sat (not start!119144) (not b!1389901) (not b!1389905) (not b!1389902) (not b!1389906) (not b!1389904))
