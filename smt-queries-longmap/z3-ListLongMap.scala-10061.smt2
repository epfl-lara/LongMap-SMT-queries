; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118502 () Bool)

(assert start!118502)

(declare-fun res!926854 () Bool)

(declare-fun e!785072 () Bool)

(assert (=> start!118502 (=> (not res!926854) (not e!785072))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118502 (= res!926854 (validMask!0 mask!2987))))

(assert (=> start!118502 e!785072))

(assert (=> start!118502 true))

(declare-datatypes ((array!94778 0))(
  ( (array!94779 (arr!45765 (Array (_ BitVec 32) (_ BitVec 64))) (size!46315 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94778)

(declare-fun array_inv!34793 (array!94778) Bool)

(assert (=> start!118502 (array_inv!34793 a!2938)))

(declare-fun b!1385601 () Bool)

(declare-fun res!926851 () Bool)

(assert (=> b!1385601 (=> (not res!926851) (not e!785072))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385601 (= res!926851 (and (= (size!46315 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46315 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46315 a!2938))))))

(declare-fun b!1385602 () Bool)

(declare-fun res!926853 () Bool)

(assert (=> b!1385602 (=> (not res!926853) (not e!785072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385602 (= res!926853 (validKeyInArray!0 (select (arr!45765 a!2938) i!1065)))))

(declare-fun b!1385604 () Bool)

(assert (=> b!1385604 (= e!785072 false)))

(declare-fun lt!609285 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94778 (_ BitVec 32)) Bool)

(assert (=> b!1385604 (= lt!609285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385603 () Bool)

(declare-fun res!926852 () Bool)

(assert (=> b!1385603 (=> (not res!926852) (not e!785072))))

(declare-datatypes ((List!32293 0))(
  ( (Nil!32290) (Cons!32289 (h!33498 (_ BitVec 64)) (t!46987 List!32293)) )
))
(declare-fun arrayNoDuplicates!0 (array!94778 (_ BitVec 32) List!32293) Bool)

(assert (=> b!1385603 (= res!926852 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32290))))

(assert (= (and start!118502 res!926854) b!1385601))

(assert (= (and b!1385601 res!926851) b!1385602))

(assert (= (and b!1385602 res!926853) b!1385603))

(assert (= (and b!1385603 res!926852) b!1385604))

(declare-fun m!1270893 () Bool)

(assert (=> start!118502 m!1270893))

(declare-fun m!1270895 () Bool)

(assert (=> start!118502 m!1270895))

(declare-fun m!1270897 () Bool)

(assert (=> b!1385602 m!1270897))

(assert (=> b!1385602 m!1270897))

(declare-fun m!1270899 () Bool)

(assert (=> b!1385602 m!1270899))

(declare-fun m!1270901 () Bool)

(assert (=> b!1385604 m!1270901))

(declare-fun m!1270903 () Bool)

(assert (=> b!1385603 m!1270903))

(check-sat (not start!118502) (not b!1385603) (not b!1385604) (not b!1385602))
