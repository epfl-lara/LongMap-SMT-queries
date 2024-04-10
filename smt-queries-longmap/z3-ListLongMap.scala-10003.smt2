; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118056 () Bool)

(assert start!118056)

(declare-fun b!1382401 () Bool)

(declare-fun res!923993 () Bool)

(declare-fun e!783553 () Bool)

(assert (=> b!1382401 (=> (not res!923993) (not e!783553))))

(declare-datatypes ((array!94420 0))(
  ( (array!94421 (arr!45591 (Array (_ BitVec 32) (_ BitVec 64))) (size!46141 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94420)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382401 (= res!923993 (validKeyInArray!0 (select (arr!45591 a!2971) i!1094)))))

(declare-fun res!923995 () Bool)

(assert (=> start!118056 (=> (not res!923995) (not e!783553))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118056 (= res!923995 (validMask!0 mask!3034))))

(assert (=> start!118056 e!783553))

(assert (=> start!118056 true))

(declare-fun array_inv!34619 (array!94420) Bool)

(assert (=> start!118056 (array_inv!34619 a!2971)))

(declare-fun b!1382403 () Bool)

(assert (=> b!1382403 (= e!783553 false)))

(declare-fun lt!608418 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94420 (_ BitVec 32)) Bool)

(assert (=> b!1382403 (= lt!608418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382402 () Bool)

(declare-fun res!923992 () Bool)

(assert (=> b!1382402 (=> (not res!923992) (not e!783553))))

(declare-datatypes ((List!32125 0))(
  ( (Nil!32122) (Cons!32121 (h!33330 (_ BitVec 64)) (t!46819 List!32125)) )
))
(declare-fun arrayNoDuplicates!0 (array!94420 (_ BitVec 32) List!32125) Bool)

(assert (=> b!1382402 (= res!923992 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32122))))

(declare-fun b!1382400 () Bool)

(declare-fun res!923994 () Bool)

(assert (=> b!1382400 (=> (not res!923994) (not e!783553))))

(assert (=> b!1382400 (= res!923994 (and (= (size!46141 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46141 a!2971))))))

(assert (= (and start!118056 res!923995) b!1382400))

(assert (= (and b!1382400 res!923994) b!1382401))

(assert (= (and b!1382401 res!923993) b!1382402))

(assert (= (and b!1382402 res!923992) b!1382403))

(declare-fun m!1267539 () Bool)

(assert (=> b!1382401 m!1267539))

(assert (=> b!1382401 m!1267539))

(declare-fun m!1267541 () Bool)

(assert (=> b!1382401 m!1267541))

(declare-fun m!1267543 () Bool)

(assert (=> start!118056 m!1267543))

(declare-fun m!1267545 () Bool)

(assert (=> start!118056 m!1267545))

(declare-fun m!1267547 () Bool)

(assert (=> b!1382403 m!1267547))

(declare-fun m!1267549 () Bool)

(assert (=> b!1382402 m!1267549))

(check-sat (not b!1382403) (not start!118056) (not b!1382402) (not b!1382401))
