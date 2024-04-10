; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118086 () Bool)

(assert start!118086)

(declare-fun b!1382590 () Bool)

(declare-fun res!924181 () Bool)

(declare-fun e!783644 () Bool)

(assert (=> b!1382590 (=> (not res!924181) (not e!783644))))

(declare-datatypes ((array!94450 0))(
  ( (array!94451 (arr!45606 (Array (_ BitVec 32) (_ BitVec 64))) (size!46156 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94450)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382590 (= res!924181 (validKeyInArray!0 (select (arr!45606 a!2971) i!1094)))))

(declare-fun b!1382591 () Bool)

(declare-fun res!924183 () Bool)

(assert (=> b!1382591 (=> (not res!924183) (not e!783644))))

(declare-datatypes ((List!32140 0))(
  ( (Nil!32137) (Cons!32136 (h!33345 (_ BitVec 64)) (t!46834 List!32140)) )
))
(declare-fun arrayNoDuplicates!0 (array!94450 (_ BitVec 32) List!32140) Bool)

(assert (=> b!1382591 (= res!924183 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32137))))

(declare-fun b!1382592 () Bool)

(assert (=> b!1382592 (= e!783644 false)))

(declare-fun lt!608454 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94450 (_ BitVec 32)) Bool)

(assert (=> b!1382592 (= lt!608454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924184 () Bool)

(assert (=> start!118086 (=> (not res!924184) (not e!783644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118086 (= res!924184 (validMask!0 mask!3034))))

(assert (=> start!118086 e!783644))

(assert (=> start!118086 true))

(declare-fun array_inv!34634 (array!94450) Bool)

(assert (=> start!118086 (array_inv!34634 a!2971)))

(declare-fun b!1382589 () Bool)

(declare-fun res!924182 () Bool)

(assert (=> b!1382589 (=> (not res!924182) (not e!783644))))

(assert (=> b!1382589 (= res!924182 (and (= (size!46156 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46156 a!2971))))))

(assert (= (and start!118086 res!924184) b!1382589))

(assert (= (and b!1382589 res!924182) b!1382590))

(assert (= (and b!1382590 res!924181) b!1382591))

(assert (= (and b!1382591 res!924183) b!1382592))

(declare-fun m!1267719 () Bool)

(assert (=> b!1382590 m!1267719))

(assert (=> b!1382590 m!1267719))

(declare-fun m!1267721 () Bool)

(assert (=> b!1382590 m!1267721))

(declare-fun m!1267723 () Bool)

(assert (=> b!1382591 m!1267723))

(declare-fun m!1267725 () Bool)

(assert (=> b!1382592 m!1267725))

(declare-fun m!1267727 () Bool)

(assert (=> start!118086 m!1267727))

(declare-fun m!1267729 () Bool)

(assert (=> start!118086 m!1267729))

(check-sat (not start!118086) (not b!1382591) (not b!1382590) (not b!1382592))
(check-sat)
