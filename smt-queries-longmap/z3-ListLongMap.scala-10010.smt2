; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118098 () Bool)

(assert start!118098)

(declare-fun b!1382689 () Bool)

(declare-fun res!924286 () Bool)

(declare-fun e!783679 () Bool)

(assert (=> b!1382689 (=> (not res!924286) (not e!783679))))

(declare-datatypes ((array!94462 0))(
  ( (array!94463 (arr!45612 (Array (_ BitVec 32) (_ BitVec 64))) (size!46162 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94462)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382689 (= res!924286 (validKeyInArray!0 (select (arr!45612 a!2971) i!1094)))))

(declare-fun res!924283 () Bool)

(assert (=> start!118098 (=> (not res!924283) (not e!783679))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118098 (= res!924283 (validMask!0 mask!3034))))

(assert (=> start!118098 e!783679))

(assert (=> start!118098 true))

(declare-fun array_inv!34640 (array!94462) Bool)

(assert (=> start!118098 (array_inv!34640 a!2971)))

(declare-fun b!1382690 () Bool)

(assert (=> b!1382690 (= e!783679 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94462 (_ BitVec 32)) Bool)

(assert (=> b!1382690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94463 (store (arr!45612 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46162 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46061 0))(
  ( (Unit!46062) )
))
(declare-fun lt!608472 () Unit!46061)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46061)

(assert (=> b!1382690 (= lt!608472 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382691 () Bool)

(declare-fun res!924281 () Bool)

(assert (=> b!1382691 (=> (not res!924281) (not e!783679))))

(declare-datatypes ((List!32146 0))(
  ( (Nil!32143) (Cons!32142 (h!33351 (_ BitVec 64)) (t!46840 List!32146)) )
))
(declare-fun arrayNoDuplicates!0 (array!94462 (_ BitVec 32) List!32146) Bool)

(assert (=> b!1382691 (= res!924281 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32143))))

(declare-fun b!1382692 () Bool)

(declare-fun res!924285 () Bool)

(assert (=> b!1382692 (=> (not res!924285) (not e!783679))))

(assert (=> b!1382692 (= res!924285 (and (= (size!46162 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46162 a!2971))))))

(declare-fun b!1382693 () Bool)

(declare-fun res!924284 () Bool)

(assert (=> b!1382693 (=> (not res!924284) (not e!783679))))

(assert (=> b!1382693 (= res!924284 (and (not (= (select (arr!45612 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45612 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46162 a!2971))))))

(declare-fun b!1382694 () Bool)

(declare-fun res!924282 () Bool)

(assert (=> b!1382694 (=> (not res!924282) (not e!783679))))

(assert (=> b!1382694 (= res!924282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118098 res!924283) b!1382692))

(assert (= (and b!1382692 res!924285) b!1382689))

(assert (= (and b!1382689 res!924286) b!1382691))

(assert (= (and b!1382691 res!924281) b!1382694))

(assert (= (and b!1382694 res!924282) b!1382693))

(assert (= (and b!1382693 res!924284) b!1382690))

(declare-fun m!1267815 () Bool)

(assert (=> start!118098 m!1267815))

(declare-fun m!1267817 () Bool)

(assert (=> start!118098 m!1267817))

(declare-fun m!1267819 () Bool)

(assert (=> b!1382693 m!1267819))

(declare-fun m!1267821 () Bool)

(assert (=> b!1382694 m!1267821))

(declare-fun m!1267823 () Bool)

(assert (=> b!1382691 m!1267823))

(declare-fun m!1267825 () Bool)

(assert (=> b!1382690 m!1267825))

(declare-fun m!1267827 () Bool)

(assert (=> b!1382690 m!1267827))

(declare-fun m!1267829 () Bool)

(assert (=> b!1382690 m!1267829))

(assert (=> b!1382689 m!1267819))

(assert (=> b!1382689 m!1267819))

(declare-fun m!1267831 () Bool)

(assert (=> b!1382689 m!1267831))

(check-sat (not b!1382694) (not start!118098) (not b!1382690) (not b!1382691) (not b!1382689))
