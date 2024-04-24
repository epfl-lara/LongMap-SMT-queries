; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118296 () Bool)

(assert start!118296)

(declare-fun b!1383875 () Bool)

(declare-fun res!924678 () Bool)

(declare-fun e!784479 () Bool)

(assert (=> b!1383875 (=> (not res!924678) (not e!784479))))

(declare-datatypes ((array!94556 0))(
  ( (array!94557 (arr!45657 (Array (_ BitVec 32) (_ BitVec 64))) (size!46208 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94556)

(declare-datatypes ((List!32178 0))(
  ( (Nil!32175) (Cons!32174 (h!33392 (_ BitVec 64)) (t!46864 List!32178)) )
))
(declare-fun arrayNoDuplicates!0 (array!94556 (_ BitVec 32) List!32178) Bool)

(assert (=> b!1383875 (= res!924678 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32175))))

(declare-fun b!1383874 () Bool)

(declare-fun res!924679 () Bool)

(assert (=> b!1383874 (=> (not res!924679) (not e!784479))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383874 (= res!924679 (validKeyInArray!0 (select (arr!45657 a!2971) i!1094)))))

(declare-fun b!1383876 () Bool)

(assert (=> b!1383876 (= e!784479 false)))

(declare-fun lt!608928 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94556 (_ BitVec 32)) Bool)

(assert (=> b!1383876 (= lt!608928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924676 () Bool)

(assert (=> start!118296 (=> (not res!924676) (not e!784479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118296 (= res!924676 (validMask!0 mask!3034))))

(assert (=> start!118296 e!784479))

(assert (=> start!118296 true))

(declare-fun array_inv!34938 (array!94556) Bool)

(assert (=> start!118296 (array_inv!34938 a!2971)))

(declare-fun b!1383873 () Bool)

(declare-fun res!924677 () Bool)

(assert (=> b!1383873 (=> (not res!924677) (not e!784479))))

(assert (=> b!1383873 (= res!924677 (and (= (size!46208 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46208 a!2971))))))

(assert (= (and start!118296 res!924676) b!1383873))

(assert (= (and b!1383873 res!924677) b!1383874))

(assert (= (and b!1383874 res!924679) b!1383875))

(assert (= (and b!1383875 res!924678) b!1383876))

(declare-fun m!1269327 () Bool)

(assert (=> b!1383875 m!1269327))

(declare-fun m!1269329 () Bool)

(assert (=> b!1383874 m!1269329))

(assert (=> b!1383874 m!1269329))

(declare-fun m!1269331 () Bool)

(assert (=> b!1383874 m!1269331))

(declare-fun m!1269333 () Bool)

(assert (=> b!1383876 m!1269333))

(declare-fun m!1269335 () Bool)

(assert (=> start!118296 m!1269335))

(declare-fun m!1269337 () Bool)

(assert (=> start!118296 m!1269337))

(push 1)

(assert (not b!1383876))

(assert (not b!1383874))

(assert (not start!118296))

(assert (not b!1383875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

