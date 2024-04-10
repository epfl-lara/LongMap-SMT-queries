; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117978 () Bool)

(assert start!117978)

(declare-fun b!1381996 () Bool)

(declare-fun e!783346 () Bool)

(assert (=> b!1381996 (= e!783346 (not true))))

(declare-datatypes ((array!94369 0))(
  ( (array!94370 (arr!45567 (Array (_ BitVec 32) (_ BitVec 64))) (size!46117 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94369)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94369 (_ BitVec 32)) Bool)

(assert (=> b!1381996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94370 (store (arr!45567 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46117 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46037 0))(
  ( (Unit!46038) )
))
(declare-fun lt!608328 () Unit!46037)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46037)

(assert (=> b!1381996 (= lt!608328 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381997 () Bool)

(declare-fun res!923629 () Bool)

(assert (=> b!1381997 (=> (not res!923629) (not e!783346))))

(assert (=> b!1381997 (= res!923629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381998 () Bool)

(declare-fun res!923627 () Bool)

(assert (=> b!1381998 (=> (not res!923627) (not e!783346))))

(assert (=> b!1381998 (= res!923627 (and (not (= (select (arr!45567 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45567 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46117 a!2971))))))

(declare-fun res!923628 () Bool)

(assert (=> start!117978 (=> (not res!923628) (not e!783346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117978 (= res!923628 (validMask!0 mask!3034))))

(assert (=> start!117978 e!783346))

(assert (=> start!117978 true))

(declare-fun array_inv!34595 (array!94369) Bool)

(assert (=> start!117978 (array_inv!34595 a!2971)))

(declare-fun b!1381999 () Bool)

(declare-fun res!923626 () Bool)

(assert (=> b!1381999 (=> (not res!923626) (not e!783346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381999 (= res!923626 (validKeyInArray!0 (select (arr!45567 a!2971) i!1094)))))

(declare-fun b!1382000 () Bool)

(declare-fun res!923625 () Bool)

(assert (=> b!1382000 (=> (not res!923625) (not e!783346))))

(assert (=> b!1382000 (= res!923625 (and (= (size!46117 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46117 a!2971))))))

(declare-fun b!1382001 () Bool)

(declare-fun res!923624 () Bool)

(assert (=> b!1382001 (=> (not res!923624) (not e!783346))))

(declare-datatypes ((List!32101 0))(
  ( (Nil!32098) (Cons!32097 (h!33306 (_ BitVec 64)) (t!46795 List!32101)) )
))
(declare-fun arrayNoDuplicates!0 (array!94369 (_ BitVec 32) List!32101) Bool)

(assert (=> b!1382001 (= res!923624 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32098))))

(assert (= (and start!117978 res!923628) b!1382000))

(assert (= (and b!1382000 res!923625) b!1381999))

(assert (= (and b!1381999 res!923626) b!1382001))

(assert (= (and b!1382001 res!923624) b!1381997))

(assert (= (and b!1381997 res!923629) b!1381998))

(assert (= (and b!1381998 res!923627) b!1381996))

(declare-fun m!1267173 () Bool)

(assert (=> b!1382001 m!1267173))

(declare-fun m!1267175 () Bool)

(assert (=> b!1381999 m!1267175))

(assert (=> b!1381999 m!1267175))

(declare-fun m!1267177 () Bool)

(assert (=> b!1381999 m!1267177))

(declare-fun m!1267179 () Bool)

(assert (=> start!117978 m!1267179))

(declare-fun m!1267181 () Bool)

(assert (=> start!117978 m!1267181))

(declare-fun m!1267183 () Bool)

(assert (=> b!1381997 m!1267183))

(declare-fun m!1267185 () Bool)

(assert (=> b!1381996 m!1267185))

(declare-fun m!1267187 () Bool)

(assert (=> b!1381996 m!1267187))

(declare-fun m!1267189 () Bool)

(assert (=> b!1381996 m!1267189))

(assert (=> b!1381998 m!1267175))

(check-sat (not b!1381997) (not b!1382001) (not b!1381996) (not b!1381999) (not start!117978))
(check-sat)
