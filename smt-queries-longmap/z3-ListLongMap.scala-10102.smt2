; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119108 () Bool)

(assert start!119108)

(declare-fun res!929739 () Bool)

(declare-fun e!787087 () Bool)

(assert (=> start!119108 (=> (not res!929739) (not e!787087))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119108 (= res!929739 (validMask!0 mask!2840))))

(assert (=> start!119108 e!787087))

(assert (=> start!119108 true))

(declare-datatypes ((array!95045 0))(
  ( (array!95046 (arr!45888 (Array (_ BitVec 32) (_ BitVec 64))) (size!46438 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95045)

(declare-fun array_inv!34916 (array!95045) Bool)

(assert (=> start!119108 (array_inv!34916 a!2901)))

(declare-fun b!1389577 () Bool)

(declare-fun res!929741 () Bool)

(assert (=> b!1389577 (=> (not res!929741) (not e!787087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95045 (_ BitVec 32)) Bool)

(assert (=> b!1389577 (= res!929741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389578 () Bool)

(declare-fun res!929742 () Bool)

(assert (=> b!1389578 (=> (not res!929742) (not e!787087))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389578 (= res!929742 (and (= (size!46438 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46438 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46438 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389579 () Bool)

(declare-fun res!929743 () Bool)

(assert (=> b!1389579 (=> (not res!929743) (not e!787087))))

(declare-datatypes ((List!32407 0))(
  ( (Nil!32404) (Cons!32403 (h!33621 (_ BitVec 64)) (t!47101 List!32407)) )
))
(declare-fun arrayNoDuplicates!0 (array!95045 (_ BitVec 32) List!32407) Bool)

(assert (=> b!1389579 (= res!929743 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32404))))

(declare-fun b!1389580 () Bool)

(declare-fun res!929738 () Bool)

(assert (=> b!1389580 (=> (not res!929738) (not e!787087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389580 (= res!929738 (validKeyInArray!0 (select (arr!45888 a!2901) i!1037)))))

(declare-fun b!1389581 () Bool)

(declare-fun res!929740 () Bool)

(assert (=> b!1389581 (=> (not res!929740) (not e!787087))))

(assert (=> b!1389581 (= res!929740 (validKeyInArray!0 (select (arr!45888 a!2901) j!112)))))

(declare-fun b!1389582 () Bool)

(assert (=> b!1389582 (= e!787087 false)))

(declare-datatypes ((SeekEntryResult!10205 0))(
  ( (MissingZero!10205 (index!43191 (_ BitVec 32))) (Found!10205 (index!43192 (_ BitVec 32))) (Intermediate!10205 (undefined!11017 Bool) (index!43193 (_ BitVec 32)) (x!124883 (_ BitVec 32))) (Undefined!10205) (MissingVacant!10205 (index!43194 (_ BitVec 32))) )
))
(declare-fun lt!610590 () SeekEntryResult!10205)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95045 (_ BitVec 32)) SeekEntryResult!10205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389582 (= lt!610590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45888 a!2901) j!112) mask!2840) (select (arr!45888 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119108 res!929739) b!1389578))

(assert (= (and b!1389578 res!929742) b!1389580))

(assert (= (and b!1389580 res!929738) b!1389581))

(assert (= (and b!1389581 res!929740) b!1389577))

(assert (= (and b!1389577 res!929741) b!1389579))

(assert (= (and b!1389579 res!929743) b!1389582))

(declare-fun m!1275227 () Bool)

(assert (=> b!1389579 m!1275227))

(declare-fun m!1275229 () Bool)

(assert (=> b!1389581 m!1275229))

(assert (=> b!1389581 m!1275229))

(declare-fun m!1275231 () Bool)

(assert (=> b!1389581 m!1275231))

(declare-fun m!1275233 () Bool)

(assert (=> start!119108 m!1275233))

(declare-fun m!1275235 () Bool)

(assert (=> start!119108 m!1275235))

(declare-fun m!1275237 () Bool)

(assert (=> b!1389580 m!1275237))

(assert (=> b!1389580 m!1275237))

(declare-fun m!1275239 () Bool)

(assert (=> b!1389580 m!1275239))

(declare-fun m!1275241 () Bool)

(assert (=> b!1389577 m!1275241))

(assert (=> b!1389582 m!1275229))

(assert (=> b!1389582 m!1275229))

(declare-fun m!1275243 () Bool)

(assert (=> b!1389582 m!1275243))

(assert (=> b!1389582 m!1275243))

(assert (=> b!1389582 m!1275229))

(declare-fun m!1275245 () Bool)

(assert (=> b!1389582 m!1275245))

(check-sat (not b!1389580) (not b!1389579) (not start!119108) (not b!1389582) (not b!1389577) (not b!1389581))
