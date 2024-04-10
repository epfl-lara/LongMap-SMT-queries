; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119110 () Bool)

(assert start!119110)

(declare-fun b!1389595 () Bool)

(declare-fun res!929756 () Bool)

(declare-fun e!787094 () Bool)

(assert (=> b!1389595 (=> (not res!929756) (not e!787094))))

(declare-datatypes ((array!95047 0))(
  ( (array!95048 (arr!45889 (Array (_ BitVec 32) (_ BitVec 64))) (size!46439 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95047)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389595 (= res!929756 (validKeyInArray!0 (select (arr!45889 a!2901) i!1037)))))

(declare-fun b!1389596 () Bool)

(assert (=> b!1389596 (= e!787094 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10206 0))(
  ( (MissingZero!10206 (index!43195 (_ BitVec 32))) (Found!10206 (index!43196 (_ BitVec 32))) (Intermediate!10206 (undefined!11018 Bool) (index!43197 (_ BitVec 32)) (x!124884 (_ BitVec 32))) (Undefined!10206) (MissingVacant!10206 (index!43198 (_ BitVec 32))) )
))
(declare-fun lt!610593 () SeekEntryResult!10206)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95047 (_ BitVec 32)) SeekEntryResult!10206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389596 (= lt!610593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45889 a!2901) j!112) mask!2840) (select (arr!45889 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!929758 () Bool)

(assert (=> start!119110 (=> (not res!929758) (not e!787094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119110 (= res!929758 (validMask!0 mask!2840))))

(assert (=> start!119110 e!787094))

(assert (=> start!119110 true))

(declare-fun array_inv!34917 (array!95047) Bool)

(assert (=> start!119110 (array_inv!34917 a!2901)))

(declare-fun b!1389597 () Bool)

(declare-fun res!929761 () Bool)

(assert (=> b!1389597 (=> (not res!929761) (not e!787094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95047 (_ BitVec 32)) Bool)

(assert (=> b!1389597 (= res!929761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389598 () Bool)

(declare-fun res!929757 () Bool)

(assert (=> b!1389598 (=> (not res!929757) (not e!787094))))

(assert (=> b!1389598 (= res!929757 (validKeyInArray!0 (select (arr!45889 a!2901) j!112)))))

(declare-fun b!1389599 () Bool)

(declare-fun res!929760 () Bool)

(assert (=> b!1389599 (=> (not res!929760) (not e!787094))))

(assert (=> b!1389599 (= res!929760 (and (= (size!46439 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46439 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46439 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389600 () Bool)

(declare-fun res!929759 () Bool)

(assert (=> b!1389600 (=> (not res!929759) (not e!787094))))

(declare-datatypes ((List!32408 0))(
  ( (Nil!32405) (Cons!32404 (h!33622 (_ BitVec 64)) (t!47102 List!32408)) )
))
(declare-fun arrayNoDuplicates!0 (array!95047 (_ BitVec 32) List!32408) Bool)

(assert (=> b!1389600 (= res!929759 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32405))))

(assert (= (and start!119110 res!929758) b!1389599))

(assert (= (and b!1389599 res!929760) b!1389595))

(assert (= (and b!1389595 res!929756) b!1389598))

(assert (= (and b!1389598 res!929757) b!1389597))

(assert (= (and b!1389597 res!929761) b!1389600))

(assert (= (and b!1389600 res!929759) b!1389596))

(declare-fun m!1275247 () Bool)

(assert (=> b!1389596 m!1275247))

(assert (=> b!1389596 m!1275247))

(declare-fun m!1275249 () Bool)

(assert (=> b!1389596 m!1275249))

(assert (=> b!1389596 m!1275249))

(assert (=> b!1389596 m!1275247))

(declare-fun m!1275251 () Bool)

(assert (=> b!1389596 m!1275251))

(declare-fun m!1275253 () Bool)

(assert (=> start!119110 m!1275253))

(declare-fun m!1275255 () Bool)

(assert (=> start!119110 m!1275255))

(declare-fun m!1275257 () Bool)

(assert (=> b!1389595 m!1275257))

(assert (=> b!1389595 m!1275257))

(declare-fun m!1275259 () Bool)

(assert (=> b!1389595 m!1275259))

(assert (=> b!1389598 m!1275247))

(assert (=> b!1389598 m!1275247))

(declare-fun m!1275261 () Bool)

(assert (=> b!1389598 m!1275261))

(declare-fun m!1275263 () Bool)

(assert (=> b!1389597 m!1275263))

(declare-fun m!1275265 () Bool)

(assert (=> b!1389600 m!1275265))

(push 1)

(assert (not b!1389597))

(assert (not b!1389596))

(assert (not b!1389600))

(assert (not start!119110))

(assert (not b!1389598))

(assert (not b!1389595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

