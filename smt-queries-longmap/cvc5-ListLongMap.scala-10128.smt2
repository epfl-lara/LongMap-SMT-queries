; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119424 () Bool)

(assert start!119424)

(declare-fun b!1391780 () Bool)

(declare-fun res!931553 () Bool)

(declare-fun e!788134 () Bool)

(assert (=> b!1391780 (=> (not res!931553) (not e!788134))))

(declare-datatypes ((array!95161 0))(
  ( (array!95162 (arr!45942 (Array (_ BitVec 32) (_ BitVec 64))) (size!46494 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95161)

(declare-datatypes ((List!32539 0))(
  ( (Nil!32536) (Cons!32535 (h!33762 (_ BitVec 64)) (t!47225 List!32539)) )
))
(declare-fun arrayNoDuplicates!0 (array!95161 (_ BitVec 32) List!32539) Bool)

(assert (=> b!1391780 (= res!931553 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32536))))

(declare-fun b!1391781 () Bool)

(declare-fun res!931557 () Bool)

(assert (=> b!1391781 (=> (not res!931557) (not e!788134))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391781 (= res!931557 (and (= (size!46494 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46494 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46494 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391782 () Bool)

(declare-fun e!788132 () Bool)

(assert (=> b!1391782 (= e!788134 (not e!788132))))

(declare-fun res!931555 () Bool)

(assert (=> b!1391782 (=> res!931555 e!788132)))

(declare-datatypes ((SeekEntryResult!10285 0))(
  ( (MissingZero!10285 (index!43511 (_ BitVec 32))) (Found!10285 (index!43512 (_ BitVec 32))) (Intermediate!10285 (undefined!11097 Bool) (index!43513 (_ BitVec 32)) (x!125186 (_ BitVec 32))) (Undefined!10285) (MissingVacant!10285 (index!43514 (_ BitVec 32))) )
))
(declare-fun lt!611186 () SeekEntryResult!10285)

(assert (=> b!1391782 (= res!931555 (or (not (is-Intermediate!10285 lt!611186)) (undefined!11097 lt!611186)))))

(declare-fun e!788133 () Bool)

(assert (=> b!1391782 e!788133))

(declare-fun res!931551 () Bool)

(assert (=> b!1391782 (=> (not res!931551) (not e!788133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95161 (_ BitVec 32)) Bool)

(assert (=> b!1391782 (= res!931551 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46417 0))(
  ( (Unit!46418) )
))
(declare-fun lt!611184 () Unit!46417)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46417)

(assert (=> b!1391782 (= lt!611184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95161 (_ BitVec 32)) SeekEntryResult!10285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391782 (= lt!611186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45942 a!2901) j!112) mask!2840) (select (arr!45942 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391783 () Bool)

(declare-fun res!931556 () Bool)

(assert (=> b!1391783 (=> (not res!931556) (not e!788134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391783 (= res!931556 (validKeyInArray!0 (select (arr!45942 a!2901) j!112)))))

(declare-fun b!1391784 () Bool)

(assert (=> b!1391784 (= e!788132 true)))

(declare-fun lt!611185 () (_ BitVec 32))

(assert (=> b!1391784 (= lt!611185 (toIndex!0 (select (store (arr!45942 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391785 () Bool)

(declare-fun res!931558 () Bool)

(assert (=> b!1391785 (=> (not res!931558) (not e!788134))))

(assert (=> b!1391785 (= res!931558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391786 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95161 (_ BitVec 32)) SeekEntryResult!10285)

(assert (=> b!1391786 (= e!788133 (= (seekEntryOrOpen!0 (select (arr!45942 a!2901) j!112) a!2901 mask!2840) (Found!10285 j!112)))))

(declare-fun res!931554 () Bool)

(assert (=> start!119424 (=> (not res!931554) (not e!788134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119424 (= res!931554 (validMask!0 mask!2840))))

(assert (=> start!119424 e!788134))

(assert (=> start!119424 true))

(declare-fun array_inv!35175 (array!95161) Bool)

(assert (=> start!119424 (array_inv!35175 a!2901)))

(declare-fun b!1391787 () Bool)

(declare-fun res!931552 () Bool)

(assert (=> b!1391787 (=> (not res!931552) (not e!788134))))

(assert (=> b!1391787 (= res!931552 (validKeyInArray!0 (select (arr!45942 a!2901) i!1037)))))

(assert (= (and start!119424 res!931554) b!1391781))

(assert (= (and b!1391781 res!931557) b!1391787))

(assert (= (and b!1391787 res!931552) b!1391783))

(assert (= (and b!1391783 res!931556) b!1391785))

(assert (= (and b!1391785 res!931558) b!1391780))

(assert (= (and b!1391780 res!931553) b!1391782))

(assert (= (and b!1391782 res!931551) b!1391786))

(assert (= (and b!1391782 (not res!931555)) b!1391784))

(declare-fun m!1277051 () Bool)

(assert (=> b!1391783 m!1277051))

(assert (=> b!1391783 m!1277051))

(declare-fun m!1277053 () Bool)

(assert (=> b!1391783 m!1277053))

(declare-fun m!1277055 () Bool)

(assert (=> b!1391787 m!1277055))

(assert (=> b!1391787 m!1277055))

(declare-fun m!1277057 () Bool)

(assert (=> b!1391787 m!1277057))

(declare-fun m!1277059 () Bool)

(assert (=> start!119424 m!1277059))

(declare-fun m!1277061 () Bool)

(assert (=> start!119424 m!1277061))

(declare-fun m!1277063 () Bool)

(assert (=> b!1391784 m!1277063))

(declare-fun m!1277065 () Bool)

(assert (=> b!1391784 m!1277065))

(assert (=> b!1391784 m!1277065))

(declare-fun m!1277067 () Bool)

(assert (=> b!1391784 m!1277067))

(declare-fun m!1277069 () Bool)

(assert (=> b!1391785 m!1277069))

(declare-fun m!1277071 () Bool)

(assert (=> b!1391780 m!1277071))

(assert (=> b!1391782 m!1277051))

(declare-fun m!1277073 () Bool)

(assert (=> b!1391782 m!1277073))

(assert (=> b!1391782 m!1277051))

(declare-fun m!1277075 () Bool)

(assert (=> b!1391782 m!1277075))

(assert (=> b!1391782 m!1277073))

(assert (=> b!1391782 m!1277051))

(declare-fun m!1277077 () Bool)

(assert (=> b!1391782 m!1277077))

(declare-fun m!1277079 () Bool)

(assert (=> b!1391782 m!1277079))

(assert (=> b!1391786 m!1277051))

(assert (=> b!1391786 m!1277051))

(declare-fun m!1277081 () Bool)

(assert (=> b!1391786 m!1277081))

(push 1)

(assert (not b!1391784))

(assert (not start!119424))

(assert (not b!1391782))

(assert (not b!1391786))

(assert (not b!1391787))

(assert (not b!1391783))

(assert (not b!1391785))

(assert (not b!1391780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

