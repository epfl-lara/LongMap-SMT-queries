; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118092 () Bool)

(assert start!118092)

(declare-fun b!1382635 () Bool)

(declare-fun e!783661 () Bool)

(assert (=> b!1382635 (= e!783661 (not true))))

(declare-datatypes ((array!94456 0))(
  ( (array!94457 (arr!45609 (Array (_ BitVec 32) (_ BitVec 64))) (size!46159 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94456)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94456 (_ BitVec 32)) Bool)

(assert (=> b!1382635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94457 (store (arr!45609 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46159 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46055 0))(
  ( (Unit!46056) )
))
(declare-fun lt!608463 () Unit!46055)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46055)

(assert (=> b!1382635 (= lt!608463 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382636 () Bool)

(declare-fun res!924230 () Bool)

(assert (=> b!1382636 (=> (not res!924230) (not e!783661))))

(assert (=> b!1382636 (= res!924230 (and (= (size!46159 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46159 a!2971))))))

(declare-fun b!1382637 () Bool)

(declare-fun res!924228 () Bool)

(assert (=> b!1382637 (=> (not res!924228) (not e!783661))))

(assert (=> b!1382637 (= res!924228 (and (not (= (select (arr!45609 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45609 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46159 a!2971))))))

(declare-fun b!1382638 () Bool)

(declare-fun res!924231 () Bool)

(assert (=> b!1382638 (=> (not res!924231) (not e!783661))))

(assert (=> b!1382638 (= res!924231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382639 () Bool)

(declare-fun res!924232 () Bool)

(assert (=> b!1382639 (=> (not res!924232) (not e!783661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382639 (= res!924232 (validKeyInArray!0 (select (arr!45609 a!2971) i!1094)))))

(declare-fun res!924227 () Bool)

(assert (=> start!118092 (=> (not res!924227) (not e!783661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118092 (= res!924227 (validMask!0 mask!3034))))

(assert (=> start!118092 e!783661))

(assert (=> start!118092 true))

(declare-fun array_inv!34637 (array!94456) Bool)

(assert (=> start!118092 (array_inv!34637 a!2971)))

(declare-fun b!1382640 () Bool)

(declare-fun res!924229 () Bool)

(assert (=> b!1382640 (=> (not res!924229) (not e!783661))))

(declare-datatypes ((List!32143 0))(
  ( (Nil!32140) (Cons!32139 (h!33348 (_ BitVec 64)) (t!46837 List!32143)) )
))
(declare-fun arrayNoDuplicates!0 (array!94456 (_ BitVec 32) List!32143) Bool)

(assert (=> b!1382640 (= res!924229 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32140))))

(assert (= (and start!118092 res!924227) b!1382636))

(assert (= (and b!1382636 res!924230) b!1382639))

(assert (= (and b!1382639 res!924232) b!1382640))

(assert (= (and b!1382640 res!924229) b!1382638))

(assert (= (and b!1382638 res!924231) b!1382637))

(assert (= (and b!1382637 res!924228) b!1382635))

(declare-fun m!1267761 () Bool)

(assert (=> b!1382640 m!1267761))

(declare-fun m!1267763 () Bool)

(assert (=> b!1382637 m!1267763))

(declare-fun m!1267765 () Bool)

(assert (=> start!118092 m!1267765))

(declare-fun m!1267767 () Bool)

(assert (=> start!118092 m!1267767))

(declare-fun m!1267769 () Bool)

(assert (=> b!1382638 m!1267769))

(assert (=> b!1382639 m!1267763))

(assert (=> b!1382639 m!1267763))

(declare-fun m!1267771 () Bool)

(assert (=> b!1382639 m!1267771))

(declare-fun m!1267773 () Bool)

(assert (=> b!1382635 m!1267773))

(declare-fun m!1267775 () Bool)

(assert (=> b!1382635 m!1267775))

(declare-fun m!1267777 () Bool)

(assert (=> b!1382635 m!1267777))

(check-sat (not start!118092) (not b!1382640) (not b!1382635) (not b!1382639) (not b!1382638))
