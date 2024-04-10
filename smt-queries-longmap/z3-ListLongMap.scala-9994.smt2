; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117972 () Bool)

(assert start!117972)

(declare-fun b!1381942 () Bool)

(declare-fun e!783329 () Bool)

(assert (=> b!1381942 (= e!783329 (not true))))

(declare-datatypes ((array!94363 0))(
  ( (array!94364 (arr!45564 (Array (_ BitVec 32) (_ BitVec 64))) (size!46114 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94363)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94363 (_ BitVec 32)) Bool)

(assert (=> b!1381942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94364 (store (arr!45564 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46114 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46031 0))(
  ( (Unit!46032) )
))
(declare-fun lt!608319 () Unit!46031)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46031)

(assert (=> b!1381942 (= lt!608319 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381943 () Bool)

(declare-fun res!923572 () Bool)

(assert (=> b!1381943 (=> (not res!923572) (not e!783329))))

(declare-datatypes ((List!32098 0))(
  ( (Nil!32095) (Cons!32094 (h!33303 (_ BitVec 64)) (t!46792 List!32098)) )
))
(declare-fun arrayNoDuplicates!0 (array!94363 (_ BitVec 32) List!32098) Bool)

(assert (=> b!1381943 (= res!923572 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32095))))

(declare-fun b!1381944 () Bool)

(declare-fun res!923574 () Bool)

(assert (=> b!1381944 (=> (not res!923574) (not e!783329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381944 (= res!923574 (validKeyInArray!0 (select (arr!45564 a!2971) i!1094)))))

(declare-fun res!923575 () Bool)

(assert (=> start!117972 (=> (not res!923575) (not e!783329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117972 (= res!923575 (validMask!0 mask!3034))))

(assert (=> start!117972 e!783329))

(assert (=> start!117972 true))

(declare-fun array_inv!34592 (array!94363) Bool)

(assert (=> start!117972 (array_inv!34592 a!2971)))

(declare-fun b!1381945 () Bool)

(declare-fun res!923573 () Bool)

(assert (=> b!1381945 (=> (not res!923573) (not e!783329))))

(assert (=> b!1381945 (= res!923573 (and (= (size!46114 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46114 a!2971))))))

(declare-fun b!1381946 () Bool)

(declare-fun res!923571 () Bool)

(assert (=> b!1381946 (=> (not res!923571) (not e!783329))))

(assert (=> b!1381946 (= res!923571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381947 () Bool)

(declare-fun res!923570 () Bool)

(assert (=> b!1381947 (=> (not res!923570) (not e!783329))))

(assert (=> b!1381947 (= res!923570 (and (not (= (select (arr!45564 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45564 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46114 a!2971))))))

(assert (= (and start!117972 res!923575) b!1381945))

(assert (= (and b!1381945 res!923573) b!1381944))

(assert (= (and b!1381944 res!923574) b!1381943))

(assert (= (and b!1381943 res!923572) b!1381946))

(assert (= (and b!1381946 res!923571) b!1381947))

(assert (= (and b!1381947 res!923570) b!1381942))

(declare-fun m!1267119 () Bool)

(assert (=> b!1381944 m!1267119))

(assert (=> b!1381944 m!1267119))

(declare-fun m!1267121 () Bool)

(assert (=> b!1381944 m!1267121))

(declare-fun m!1267123 () Bool)

(assert (=> start!117972 m!1267123))

(declare-fun m!1267125 () Bool)

(assert (=> start!117972 m!1267125))

(declare-fun m!1267127 () Bool)

(assert (=> b!1381943 m!1267127))

(declare-fun m!1267129 () Bool)

(assert (=> b!1381942 m!1267129))

(declare-fun m!1267131 () Bool)

(assert (=> b!1381942 m!1267131))

(declare-fun m!1267133 () Bool)

(assert (=> b!1381942 m!1267133))

(declare-fun m!1267135 () Bool)

(assert (=> b!1381946 m!1267135))

(assert (=> b!1381947 m!1267119))

(check-sat (not b!1381944) (not b!1381943) (not b!1381946) (not b!1381942) (not start!117972))
