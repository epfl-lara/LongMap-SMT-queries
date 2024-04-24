; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119220 () Bool)

(assert start!119220)

(declare-fun b!1390276 () Bool)

(declare-fun res!929791 () Bool)

(declare-fun e!787643 () Bool)

(assert (=> b!1390276 (=> (not res!929791) (not e!787643))))

(declare-datatypes ((array!95112 0))(
  ( (array!95113 (arr!45921 (Array (_ BitVec 32) (_ BitVec 64))) (size!46472 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95112)

(declare-datatypes ((List!32427 0))(
  ( (Nil!32424) (Cons!32423 (h!33646 (_ BitVec 64)) (t!47113 List!32427)) )
))
(declare-fun arrayNoDuplicates!0 (array!95112 (_ BitVec 32) List!32427) Bool)

(assert (=> b!1390276 (= res!929791 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32424))))

(declare-fun b!1390277 () Bool)

(declare-fun res!929786 () Bool)

(assert (=> b!1390277 (=> (not res!929786) (not e!787643))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390277 (= res!929786 (validKeyInArray!0 (select (arr!45921 a!2901) j!112)))))

(declare-fun b!1390278 () Bool)

(declare-fun res!929788 () Bool)

(assert (=> b!1390278 (=> (not res!929788) (not e!787643))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390278 (= res!929788 (validKeyInArray!0 (select (arr!45921 a!2901) i!1037)))))

(declare-fun b!1390279 () Bool)

(declare-fun res!929789 () Bool)

(assert (=> b!1390279 (=> (not res!929789) (not e!787643))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1390279 (= res!929789 (and (= (size!46472 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46472 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46472 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390280 () Bool)

(declare-fun res!929787 () Bool)

(assert (=> b!1390280 (=> (not res!929787) (not e!787643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95112 (_ BitVec 32)) Bool)

(assert (=> b!1390280 (= res!929787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929790 () Bool)

(assert (=> start!119220 (=> (not res!929790) (not e!787643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119220 (= res!929790 (validMask!0 mask!2840))))

(assert (=> start!119220 e!787643))

(assert (=> start!119220 true))

(declare-fun array_inv!35202 (array!95112) Bool)

(assert (=> start!119220 (array_inv!35202 a!2901)))

(declare-fun b!1390281 () Bool)

(assert (=> b!1390281 (= e!787643 false)))

(declare-fun lt!610883 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390281 (= lt!610883 (toIndex!0 (select (arr!45921 a!2901) j!112) mask!2840))))

(assert (= (and start!119220 res!929790) b!1390279))

(assert (= (and b!1390279 res!929789) b!1390278))

(assert (= (and b!1390278 res!929788) b!1390277))

(assert (= (and b!1390277 res!929786) b!1390280))

(assert (= (and b!1390280 res!929787) b!1390276))

(assert (= (and b!1390276 res!929791) b!1390281))

(declare-fun m!1276183 () Bool)

(assert (=> b!1390276 m!1276183))

(declare-fun m!1276185 () Bool)

(assert (=> b!1390280 m!1276185))

(declare-fun m!1276187 () Bool)

(assert (=> b!1390277 m!1276187))

(assert (=> b!1390277 m!1276187))

(declare-fun m!1276189 () Bool)

(assert (=> b!1390277 m!1276189))

(assert (=> b!1390281 m!1276187))

(assert (=> b!1390281 m!1276187))

(declare-fun m!1276191 () Bool)

(assert (=> b!1390281 m!1276191))

(declare-fun m!1276193 () Bool)

(assert (=> b!1390278 m!1276193))

(assert (=> b!1390278 m!1276193))

(declare-fun m!1276195 () Bool)

(assert (=> b!1390278 m!1276195))

(declare-fun m!1276197 () Bool)

(assert (=> start!119220 m!1276197))

(declare-fun m!1276199 () Bool)

(assert (=> start!119220 m!1276199))

(push 1)

(assert (not b!1390277))

(assert (not start!119220))

(assert (not b!1390276))

(assert (not b!1390278))

(assert (not b!1390280))

(assert (not b!1390281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

