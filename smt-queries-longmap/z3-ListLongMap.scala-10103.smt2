; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119114 () Bool)

(assert start!119114)

(declare-fun res!929794 () Bool)

(declare-fun e!787105 () Bool)

(assert (=> start!119114 (=> (not res!929794) (not e!787105))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119114 (= res!929794 (validMask!0 mask!2840))))

(assert (=> start!119114 e!787105))

(assert (=> start!119114 true))

(declare-datatypes ((array!95051 0))(
  ( (array!95052 (arr!45891 (Array (_ BitVec 32) (_ BitVec 64))) (size!46441 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95051)

(declare-fun array_inv!34919 (array!95051) Bool)

(assert (=> start!119114 (array_inv!34919 a!2901)))

(declare-fun b!1389631 () Bool)

(declare-fun res!929792 () Bool)

(assert (=> b!1389631 (=> (not res!929792) (not e!787105))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389631 (= res!929792 (validKeyInArray!0 (select (arr!45891 a!2901) i!1037)))))

(declare-fun b!1389632 () Bool)

(declare-fun res!929796 () Bool)

(assert (=> b!1389632 (=> (not res!929796) (not e!787105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95051 (_ BitVec 32)) Bool)

(assert (=> b!1389632 (= res!929796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389633 () Bool)

(declare-fun res!929795 () Bool)

(assert (=> b!1389633 (=> (not res!929795) (not e!787105))))

(declare-datatypes ((List!32410 0))(
  ( (Nil!32407) (Cons!32406 (h!33624 (_ BitVec 64)) (t!47104 List!32410)) )
))
(declare-fun arrayNoDuplicates!0 (array!95051 (_ BitVec 32) List!32410) Bool)

(assert (=> b!1389633 (= res!929795 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32407))))

(declare-fun b!1389634 () Bool)

(assert (=> b!1389634 (= e!787105 false)))

(declare-datatypes ((SeekEntryResult!10208 0))(
  ( (MissingZero!10208 (index!43203 (_ BitVec 32))) (Found!10208 (index!43204 (_ BitVec 32))) (Intermediate!10208 (undefined!11020 Bool) (index!43205 (_ BitVec 32)) (x!124894 (_ BitVec 32))) (Undefined!10208) (MissingVacant!10208 (index!43206 (_ BitVec 32))) )
))
(declare-fun lt!610599 () SeekEntryResult!10208)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95051 (_ BitVec 32)) SeekEntryResult!10208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389634 (= lt!610599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45891 a!2901) j!112) mask!2840) (select (arr!45891 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389635 () Bool)

(declare-fun res!929793 () Bool)

(assert (=> b!1389635 (=> (not res!929793) (not e!787105))))

(assert (=> b!1389635 (= res!929793 (validKeyInArray!0 (select (arr!45891 a!2901) j!112)))))

(declare-fun b!1389636 () Bool)

(declare-fun res!929797 () Bool)

(assert (=> b!1389636 (=> (not res!929797) (not e!787105))))

(assert (=> b!1389636 (= res!929797 (and (= (size!46441 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46441 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46441 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119114 res!929794) b!1389636))

(assert (= (and b!1389636 res!929797) b!1389631))

(assert (= (and b!1389631 res!929792) b!1389635))

(assert (= (and b!1389635 res!929793) b!1389632))

(assert (= (and b!1389632 res!929796) b!1389633))

(assert (= (and b!1389633 res!929795) b!1389634))

(declare-fun m!1275287 () Bool)

(assert (=> b!1389632 m!1275287))

(declare-fun m!1275289 () Bool)

(assert (=> b!1389635 m!1275289))

(assert (=> b!1389635 m!1275289))

(declare-fun m!1275291 () Bool)

(assert (=> b!1389635 m!1275291))

(declare-fun m!1275293 () Bool)

(assert (=> b!1389633 m!1275293))

(declare-fun m!1275295 () Bool)

(assert (=> start!119114 m!1275295))

(declare-fun m!1275297 () Bool)

(assert (=> start!119114 m!1275297))

(assert (=> b!1389634 m!1275289))

(assert (=> b!1389634 m!1275289))

(declare-fun m!1275299 () Bool)

(assert (=> b!1389634 m!1275299))

(assert (=> b!1389634 m!1275299))

(assert (=> b!1389634 m!1275289))

(declare-fun m!1275301 () Bool)

(assert (=> b!1389634 m!1275301))

(declare-fun m!1275303 () Bool)

(assert (=> b!1389631 m!1275303))

(assert (=> b!1389631 m!1275303))

(declare-fun m!1275305 () Bool)

(assert (=> b!1389631 m!1275305))

(check-sat (not b!1389634) (not b!1389631) (not b!1389632) (not b!1389635) (not b!1389633) (not start!119114))
