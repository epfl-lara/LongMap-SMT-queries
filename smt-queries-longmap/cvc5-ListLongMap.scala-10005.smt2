; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118066 () Bool)

(assert start!118066)

(declare-fun b!1382463 () Bool)

(declare-fun res!924054 () Bool)

(declare-fun e!783583 () Bool)

(assert (=> b!1382463 (=> (not res!924054) (not e!783583))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94430 0))(
  ( (array!94431 (arr!45596 (Array (_ BitVec 32) (_ BitVec 64))) (size!46146 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94430)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382463 (= res!924054 (and (= (size!46146 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46146 a!2971))))))

(declare-fun b!1382464 () Bool)

(assert (=> b!1382464 (= e!783583 (and (not (= (select (arr!45596 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45596 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!46146 a!2971))))))

(declare-fun b!1382465 () Bool)

(declare-fun res!924056 () Bool)

(assert (=> b!1382465 (=> (not res!924056) (not e!783583))))

(declare-datatypes ((List!32130 0))(
  ( (Nil!32127) (Cons!32126 (h!33335 (_ BitVec 64)) (t!46824 List!32130)) )
))
(declare-fun arrayNoDuplicates!0 (array!94430 (_ BitVec 32) List!32130) Bool)

(assert (=> b!1382465 (= res!924056 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32127))))

(declare-fun b!1382466 () Bool)

(declare-fun res!924058 () Bool)

(assert (=> b!1382466 (=> (not res!924058) (not e!783583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94430 (_ BitVec 32)) Bool)

(assert (=> b!1382466 (= res!924058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382462 () Bool)

(declare-fun res!924055 () Bool)

(assert (=> b!1382462 (=> (not res!924055) (not e!783583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382462 (= res!924055 (validKeyInArray!0 (select (arr!45596 a!2971) i!1094)))))

(declare-fun res!924057 () Bool)

(assert (=> start!118066 (=> (not res!924057) (not e!783583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118066 (= res!924057 (validMask!0 mask!3034))))

(assert (=> start!118066 e!783583))

(assert (=> start!118066 true))

(declare-fun array_inv!34624 (array!94430) Bool)

(assert (=> start!118066 (array_inv!34624 a!2971)))

(assert (= (and start!118066 res!924057) b!1382463))

(assert (= (and b!1382463 res!924054) b!1382462))

(assert (= (and b!1382462 res!924055) b!1382465))

(assert (= (and b!1382465 res!924056) b!1382466))

(assert (= (and b!1382466 res!924058) b!1382464))

(declare-fun m!1267599 () Bool)

(assert (=> b!1382465 m!1267599))

(declare-fun m!1267601 () Bool)

(assert (=> b!1382464 m!1267601))

(declare-fun m!1267603 () Bool)

(assert (=> start!118066 m!1267603))

(declare-fun m!1267605 () Bool)

(assert (=> start!118066 m!1267605))

(assert (=> b!1382462 m!1267601))

(assert (=> b!1382462 m!1267601))

(declare-fun m!1267607 () Bool)

(assert (=> b!1382462 m!1267607))

(declare-fun m!1267609 () Bool)

(assert (=> b!1382466 m!1267609))

(push 1)

