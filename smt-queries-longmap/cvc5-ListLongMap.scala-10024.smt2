; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118248 () Bool)

(assert start!118248)

(declare-fun res!924815 () Bool)

(declare-fun e!783995 () Bool)

(assert (=> start!118248 (=> (not res!924815) (not e!783995))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118248 (= res!924815 (validMask!0 mask!2987))))

(assert (=> start!118248 e!783995))

(assert (=> start!118248 true))

(declare-datatypes ((array!94551 0))(
  ( (array!94552 (arr!45653 (Array (_ BitVec 32) (_ BitVec 64))) (size!46203 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94551)

(declare-fun array_inv!34681 (array!94551) Bool)

(assert (=> start!118248 (array_inv!34681 a!2938)))

(declare-fun b!1383222 () Bool)

(declare-fun res!924816 () Bool)

(assert (=> b!1383222 (=> (not res!924816) (not e!783995))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383222 (= res!924816 (and (= (size!46203 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46203 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46203 a!2938))))))

(declare-fun b!1383223 () Bool)

(declare-fun res!924817 () Bool)

(assert (=> b!1383223 (=> (not res!924817) (not e!783995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383223 (= res!924817 (validKeyInArray!0 (select (arr!45653 a!2938) i!1065)))))

(declare-fun b!1383225 () Bool)

(assert (=> b!1383225 (= e!783995 false)))

(declare-fun lt!608562 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94551 (_ BitVec 32)) Bool)

(assert (=> b!1383225 (= lt!608562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383224 () Bool)

(declare-fun res!924814 () Bool)

(assert (=> b!1383224 (=> (not res!924814) (not e!783995))))

(declare-datatypes ((List!32181 0))(
  ( (Nil!32178) (Cons!32177 (h!33386 (_ BitVec 64)) (t!46875 List!32181)) )
))
(declare-fun arrayNoDuplicates!0 (array!94551 (_ BitVec 32) List!32181) Bool)

(assert (=> b!1383224 (= res!924814 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32178))))

(assert (= (and start!118248 res!924815) b!1383222))

(assert (= (and b!1383222 res!924816) b!1383223))

(assert (= (and b!1383223 res!924817) b!1383224))

(assert (= (and b!1383224 res!924814) b!1383225))

(declare-fun m!1268325 () Bool)

(assert (=> start!118248 m!1268325))

(declare-fun m!1268327 () Bool)

(assert (=> start!118248 m!1268327))

(declare-fun m!1268329 () Bool)

(assert (=> b!1383223 m!1268329))

(assert (=> b!1383223 m!1268329))

(declare-fun m!1268331 () Bool)

(assert (=> b!1383223 m!1268331))

(declare-fun m!1268333 () Bool)

(assert (=> b!1383225 m!1268333))

(declare-fun m!1268335 () Bool)

(assert (=> b!1383224 m!1268335))

(push 1)

(assert (not b!1383225))

(assert (not b!1383223))

(assert (not start!118248))

(assert (not b!1383224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

