; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118212 () Bool)

(assert start!118212)

(declare-fun res!924600 () Bool)

(declare-fun e!783887 () Bool)

(assert (=> start!118212 (=> (not res!924600) (not e!783887))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118212 (= res!924600 (validMask!0 mask!2987))))

(assert (=> start!118212 e!783887))

(assert (=> start!118212 true))

(declare-datatypes ((array!94515 0))(
  ( (array!94516 (arr!45635 (Array (_ BitVec 32) (_ BitVec 64))) (size!46185 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94515)

(declare-fun array_inv!34663 (array!94515) Bool)

(assert (=> start!118212 (array_inv!34663 a!2938)))

(declare-fun b!1383008 () Bool)

(declare-fun res!924599 () Bool)

(assert (=> b!1383008 (=> (not res!924599) (not e!783887))))

(declare-datatypes ((List!32163 0))(
  ( (Nil!32160) (Cons!32159 (h!33368 (_ BitVec 64)) (t!46857 List!32163)) )
))
(declare-fun arrayNoDuplicates!0 (array!94515 (_ BitVec 32) List!32163) Bool)

(assert (=> b!1383008 (= res!924599 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32160))))

(declare-fun b!1383009 () Bool)

(assert (=> b!1383009 (= e!783887 (bvsgt #b00000000000000000000000000000000 (size!46185 a!2938)))))

(declare-fun b!1383007 () Bool)

(declare-fun res!924598 () Bool)

(assert (=> b!1383007 (=> (not res!924598) (not e!783887))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383007 (= res!924598 (validKeyInArray!0 (select (arr!45635 a!2938) i!1065)))))

(declare-fun b!1383006 () Bool)

(declare-fun res!924601 () Bool)

(assert (=> b!1383006 (=> (not res!924601) (not e!783887))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383006 (= res!924601 (and (= (size!46185 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46185 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46185 a!2938))))))

(assert (= (and start!118212 res!924600) b!1383006))

(assert (= (and b!1383006 res!924601) b!1383007))

(assert (= (and b!1383007 res!924598) b!1383008))

(assert (= (and b!1383008 res!924599) b!1383009))

(declare-fun m!1268115 () Bool)

(assert (=> start!118212 m!1268115))

(declare-fun m!1268117 () Bool)

(assert (=> start!118212 m!1268117))

(declare-fun m!1268119 () Bool)

(assert (=> b!1383008 m!1268119))

(declare-fun m!1268121 () Bool)

(assert (=> b!1383007 m!1268121))

(assert (=> b!1383007 m!1268121))

(declare-fun m!1268123 () Bool)

(assert (=> b!1383007 m!1268123))

(push 1)

(assert (not b!1383007))

(assert (not b!1383008))

(assert (not start!118212))

