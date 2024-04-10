; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119096 () Bool)

(assert start!119096)

(declare-fun b!1389469 () Bool)

(declare-fun res!929632 () Bool)

(declare-fun e!787051 () Bool)

(assert (=> b!1389469 (=> (not res!929632) (not e!787051))))

(declare-datatypes ((array!95033 0))(
  ( (array!95034 (arr!45882 (Array (_ BitVec 32) (_ BitVec 64))) (size!46432 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95033)

(declare-datatypes ((List!32401 0))(
  ( (Nil!32398) (Cons!32397 (h!33615 (_ BitVec 64)) (t!47095 List!32401)) )
))
(declare-fun arrayNoDuplicates!0 (array!95033 (_ BitVec 32) List!32401) Bool)

(assert (=> b!1389469 (= res!929632 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32398))))

(declare-fun b!1389471 () Bool)

(assert (=> b!1389471 (= e!787051 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610572 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389471 (= lt!610572 (toIndex!0 (select (arr!45882 a!2901) j!112) mask!2840))))

(declare-fun b!1389472 () Bool)

(declare-fun res!929634 () Bool)

(assert (=> b!1389472 (=> (not res!929634) (not e!787051))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389472 (= res!929634 (validKeyInArray!0 (select (arr!45882 a!2901) i!1037)))))

(declare-fun b!1389473 () Bool)

(declare-fun res!929635 () Bool)

(assert (=> b!1389473 (=> (not res!929635) (not e!787051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95033 (_ BitVec 32)) Bool)

(assert (=> b!1389473 (= res!929635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389474 () Bool)

(declare-fun res!929633 () Bool)

(assert (=> b!1389474 (=> (not res!929633) (not e!787051))))

(assert (=> b!1389474 (= res!929633 (and (= (size!46432 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46432 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46432 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389470 () Bool)

(declare-fun res!929630 () Bool)

(assert (=> b!1389470 (=> (not res!929630) (not e!787051))))

(assert (=> b!1389470 (= res!929630 (validKeyInArray!0 (select (arr!45882 a!2901) j!112)))))

(declare-fun res!929631 () Bool)

(assert (=> start!119096 (=> (not res!929631) (not e!787051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119096 (= res!929631 (validMask!0 mask!2840))))

(assert (=> start!119096 e!787051))

(assert (=> start!119096 true))

(declare-fun array_inv!34910 (array!95033) Bool)

(assert (=> start!119096 (array_inv!34910 a!2901)))

(assert (= (and start!119096 res!929631) b!1389474))

(assert (= (and b!1389474 res!929633) b!1389472))

(assert (= (and b!1389472 res!929634) b!1389470))

(assert (= (and b!1389470 res!929630) b!1389473))

(assert (= (and b!1389473 res!929635) b!1389469))

(assert (= (and b!1389469 res!929632) b!1389471))

(declare-fun m!1275111 () Bool)

(assert (=> b!1389470 m!1275111))

(assert (=> b!1389470 m!1275111))

(declare-fun m!1275113 () Bool)

(assert (=> b!1389470 m!1275113))

(declare-fun m!1275115 () Bool)

(assert (=> b!1389473 m!1275115))

(assert (=> b!1389471 m!1275111))

(assert (=> b!1389471 m!1275111))

(declare-fun m!1275117 () Bool)

(assert (=> b!1389471 m!1275117))

(declare-fun m!1275119 () Bool)

(assert (=> start!119096 m!1275119))

(declare-fun m!1275121 () Bool)

(assert (=> start!119096 m!1275121))

(declare-fun m!1275123 () Bool)

(assert (=> b!1389472 m!1275123))

(assert (=> b!1389472 m!1275123))

(declare-fun m!1275125 () Bool)

(assert (=> b!1389472 m!1275125))

(declare-fun m!1275127 () Bool)

(assert (=> b!1389469 m!1275127))

(check-sat (not b!1389470) (not b!1389472) (not b!1389469) (not b!1389473) (not start!119096) (not b!1389471))
