; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118182 () Bool)

(assert start!118182)

(declare-fun b!1383214 () Bool)

(declare-fun res!924054 () Bool)

(declare-fun e!784165 () Bool)

(assert (=> b!1383214 (=> (not res!924054) (not e!784165))))

(declare-datatypes ((array!94469 0))(
  ( (array!94470 (arr!45615 (Array (_ BitVec 32) (_ BitVec 64))) (size!46166 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94469)

(declare-datatypes ((List!32136 0))(
  ( (Nil!32133) (Cons!32132 (h!33350 (_ BitVec 64)) (t!46822 List!32136)) )
))
(declare-fun arrayNoDuplicates!0 (array!94469 (_ BitVec 32) List!32136) Bool)

(assert (=> b!1383214 (= res!924054 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32133))))

(declare-fun b!1383215 () Bool)

(declare-fun res!924056 () Bool)

(assert (=> b!1383215 (=> (not res!924056) (not e!784165))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383215 (= res!924056 (and (= (size!46166 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46166 a!2971))))))

(declare-fun b!1383216 () Bool)

(declare-fun res!924055 () Bool)

(assert (=> b!1383216 (=> (not res!924055) (not e!784165))))

(assert (=> b!1383216 (= res!924055 (and (not (= (select (arr!45615 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45615 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46166 a!2971))))))

(declare-fun b!1383217 () Bool)

(declare-fun res!924057 () Bool)

(assert (=> b!1383217 (=> (not res!924057) (not e!784165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94469 (_ BitVec 32)) Bool)

(assert (=> b!1383217 (= res!924057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924058 () Bool)

(assert (=> start!118182 (=> (not res!924058) (not e!784165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118182 (= res!924058 (validMask!0 mask!3034))))

(assert (=> start!118182 e!784165))

(assert (=> start!118182 true))

(declare-fun array_inv!34896 (array!94469) Bool)

(assert (=> start!118182 (array_inv!34896 a!2971)))

(declare-fun b!1383218 () Bool)

(declare-fun res!924053 () Bool)

(assert (=> b!1383218 (=> (not res!924053) (not e!784165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383218 (= res!924053 (validKeyInArray!0 (select (arr!45615 a!2971) i!1094)))))

(declare-fun b!1383219 () Bool)

(assert (=> b!1383219 (= e!784165 (not true))))

(assert (=> b!1383219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94470 (store (arr!45615 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46166 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45966 0))(
  ( (Unit!45967) )
))
(declare-fun lt!608793 () Unit!45966)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45966)

(assert (=> b!1383219 (= lt!608793 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(assert (= (and start!118182 res!924058) b!1383215))

(assert (= (and b!1383215 res!924056) b!1383218))

(assert (= (and b!1383218 res!924053) b!1383214))

(assert (= (and b!1383214 res!924054) b!1383217))

(assert (= (and b!1383217 res!924057) b!1383216))

(assert (= (and b!1383216 res!924055) b!1383219))

(declare-fun m!1268715 () Bool)

(assert (=> b!1383214 m!1268715))

(declare-fun m!1268717 () Bool)

(assert (=> b!1383216 m!1268717))

(declare-fun m!1268719 () Bool)

(assert (=> b!1383217 m!1268719))

(declare-fun m!1268721 () Bool)

(assert (=> start!118182 m!1268721))

(declare-fun m!1268723 () Bool)

(assert (=> start!118182 m!1268723))

(assert (=> b!1383218 m!1268717))

(assert (=> b!1383218 m!1268717))

(declare-fun m!1268725 () Bool)

(assert (=> b!1383218 m!1268725))

(declare-fun m!1268727 () Bool)

(assert (=> b!1383219 m!1268727))

(declare-fun m!1268729 () Bool)

(assert (=> b!1383219 m!1268729))

(declare-fun m!1268731 () Bool)

(assert (=> b!1383219 m!1268731))

(push 1)

(assert (not b!1383217))

(assert (not b!1383214))

(assert (not start!118182))

(assert (not b!1383218))

(assert (not b!1383219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

