; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117978 () Bool)

(assert start!117978)

(declare-fun res!923620 () Bool)

(declare-fun e!783321 () Bool)

(assert (=> start!117978 (=> (not res!923620) (not e!783321))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117978 (= res!923620 (validMask!0 mask!3034))))

(assert (=> start!117978 e!783321))

(assert (=> start!117978 true))

(declare-datatypes ((array!94321 0))(
  ( (array!94322 (arr!45543 (Array (_ BitVec 32) (_ BitVec 64))) (size!46095 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94321)

(declare-fun array_inv!34776 (array!94321) Bool)

(assert (=> start!117978 (array_inv!34776 a!2971)))

(declare-fun b!1381945 () Bool)

(declare-fun res!923619 () Bool)

(assert (=> b!1381945 (=> (not res!923619) (not e!783321))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381945 (= res!923619 (and (= (size!46095 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46095 a!2971))))))

(declare-fun b!1381946 () Bool)

(declare-fun res!923617 () Bool)

(assert (=> b!1381946 (=> (not res!923617) (not e!783321))))

(declare-datatypes ((List!32155 0))(
  ( (Nil!32152) (Cons!32151 (h!33360 (_ BitVec 64)) (t!46841 List!32155)) )
))
(declare-fun arrayNoDuplicates!0 (array!94321 (_ BitVec 32) List!32155) Bool)

(assert (=> b!1381946 (= res!923617 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32152))))

(declare-fun b!1381947 () Bool)

(declare-fun res!923616 () Bool)

(assert (=> b!1381947 (=> (not res!923616) (not e!783321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94321 (_ BitVec 32)) Bool)

(assert (=> b!1381947 (= res!923616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381948 () Bool)

(declare-fun res!923621 () Bool)

(assert (=> b!1381948 (=> (not res!923621) (not e!783321))))

(assert (=> b!1381948 (= res!923621 (and (not (= (select (arr!45543 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45543 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46095 a!2971))))))

(declare-fun b!1381949 () Bool)

(assert (=> b!1381949 (= e!783321 (not true))))

(assert (=> b!1381949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94322 (store (arr!45543 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46095 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45880 0))(
  ( (Unit!45881) )
))
(declare-fun lt!608147 () Unit!45880)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45880)

(assert (=> b!1381949 (= lt!608147 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381950 () Bool)

(declare-fun res!923618 () Bool)

(assert (=> b!1381950 (=> (not res!923618) (not e!783321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381950 (= res!923618 (validKeyInArray!0 (select (arr!45543 a!2971) i!1094)))))

(assert (= (and start!117978 res!923620) b!1381945))

(assert (= (and b!1381945 res!923619) b!1381950))

(assert (= (and b!1381950 res!923618) b!1381946))

(assert (= (and b!1381946 res!923617) b!1381947))

(assert (= (and b!1381947 res!923616) b!1381948))

(assert (= (and b!1381948 res!923621) b!1381949))

(declare-fun m!1266687 () Bool)

(assert (=> b!1381947 m!1266687))

(declare-fun m!1266689 () Bool)

(assert (=> b!1381948 m!1266689))

(declare-fun m!1266691 () Bool)

(assert (=> b!1381949 m!1266691))

(declare-fun m!1266693 () Bool)

(assert (=> b!1381949 m!1266693))

(declare-fun m!1266695 () Bool)

(assert (=> b!1381949 m!1266695))

(declare-fun m!1266697 () Bool)

(assert (=> start!117978 m!1266697))

(declare-fun m!1266699 () Bool)

(assert (=> start!117978 m!1266699))

(assert (=> b!1381950 m!1266689))

(assert (=> b!1381950 m!1266689))

(declare-fun m!1266701 () Bool)

(assert (=> b!1381950 m!1266701))

(declare-fun m!1266703 () Bool)

(assert (=> b!1381946 m!1266703))

(push 1)

(assert (not b!1381946))

(assert (not b!1381947))

(assert (not b!1381950))

(assert (not b!1381949))

(assert (not start!117978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

