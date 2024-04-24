; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118308 () Bool)

(assert start!118308)

(declare-fun b!1383961 () Bool)

(declare-fun res!924768 () Bool)

(declare-fun e!784516 () Bool)

(assert (=> b!1383961 (=> (not res!924768) (not e!784516))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94568 0))(
  ( (array!94569 (arr!45663 (Array (_ BitVec 32) (_ BitVec 64))) (size!46214 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94568)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383961 (= res!924768 (and (= (size!46214 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46214 a!2971))))))

(declare-fun b!1383962 () Bool)

(declare-fun res!924769 () Bool)

(assert (=> b!1383962 (=> (not res!924769) (not e!784516))))

(declare-datatypes ((List!32184 0))(
  ( (Nil!32181) (Cons!32180 (h!33398 (_ BitVec 64)) (t!46870 List!32184)) )
))
(declare-fun arrayNoDuplicates!0 (array!94568 (_ BitVec 32) List!32184) Bool)

(assert (=> b!1383962 (= res!924769 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32181))))

(declare-fun b!1383963 () Bool)

(assert (=> b!1383963 (= e!784516 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94568 (_ BitVec 32)) Bool)

(assert (=> b!1383963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94569 (store (arr!45663 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46214 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45996 0))(
  ( (Unit!45997) )
))
(declare-fun lt!608946 () Unit!45996)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45996)

(assert (=> b!1383963 (= lt!608946 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1383964 () Bool)

(declare-fun res!924767 () Bool)

(assert (=> b!1383964 (=> (not res!924767) (not e!784516))))

(assert (=> b!1383964 (= res!924767 (and (not (= (select (arr!45663 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45663 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46214 a!2971))))))

(declare-fun b!1383966 () Bool)

(declare-fun res!924766 () Bool)

(assert (=> b!1383966 (=> (not res!924766) (not e!784516))))

(assert (=> b!1383966 (= res!924766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924764 () Bool)

(assert (=> start!118308 (=> (not res!924764) (not e!784516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118308 (= res!924764 (validMask!0 mask!3034))))

(assert (=> start!118308 e!784516))

(assert (=> start!118308 true))

(declare-fun array_inv!34944 (array!94568) Bool)

(assert (=> start!118308 (array_inv!34944 a!2971)))

(declare-fun b!1383965 () Bool)

(declare-fun res!924765 () Bool)

(assert (=> b!1383965 (=> (not res!924765) (not e!784516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383965 (= res!924765 (validKeyInArray!0 (select (arr!45663 a!2971) i!1094)))))

(assert (= (and start!118308 res!924764) b!1383961))

(assert (= (and b!1383961 res!924768) b!1383965))

(assert (= (and b!1383965 res!924765) b!1383962))

(assert (= (and b!1383962 res!924769) b!1383966))

(assert (= (and b!1383966 res!924766) b!1383964))

(assert (= (and b!1383964 res!924767) b!1383963))

(declare-fun m!1269411 () Bool)

(assert (=> b!1383963 m!1269411))

(declare-fun m!1269413 () Bool)

(assert (=> b!1383963 m!1269413))

(declare-fun m!1269415 () Bool)

(assert (=> b!1383963 m!1269415))

(declare-fun m!1269417 () Bool)

(assert (=> b!1383966 m!1269417))

(declare-fun m!1269419 () Bool)

(assert (=> start!118308 m!1269419))

(declare-fun m!1269421 () Bool)

(assert (=> start!118308 m!1269421))

(declare-fun m!1269423 () Bool)

(assert (=> b!1383964 m!1269423))

(declare-fun m!1269425 () Bool)

(assert (=> b!1383962 m!1269425))

(assert (=> b!1383965 m!1269423))

(assert (=> b!1383965 m!1269423))

(declare-fun m!1269427 () Bool)

(assert (=> b!1383965 m!1269427))

(push 1)

(assert (not b!1383962))

(assert (not b!1383963))

(assert (not start!118308))

(assert (not b!1383966))

(assert (not b!1383965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

