; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118266 () Bool)

(assert start!118266)

(declare-fun b!1383288 () Bool)

(declare-fun e!784029 () Bool)

(assert (=> b!1383288 (= e!784029 false)))

(declare-fun lt!608411 () Bool)

(declare-datatypes ((array!94522 0))(
  ( (array!94523 (arr!45639 (Array (_ BitVec 32) (_ BitVec 64))) (size!46191 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94522)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94522 (_ BitVec 32)) Bool)

(assert (=> b!1383288 (= lt!608411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383285 () Bool)

(declare-fun res!924921 () Bool)

(assert (=> b!1383285 (=> (not res!924921) (not e!784029))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383285 (= res!924921 (and (= (size!46191 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46191 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46191 a!2938))))))

(declare-fun b!1383286 () Bool)

(declare-fun res!924922 () Bool)

(assert (=> b!1383286 (=> (not res!924922) (not e!784029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383286 (= res!924922 (validKeyInArray!0 (select (arr!45639 a!2938) i!1065)))))

(declare-fun b!1383287 () Bool)

(declare-fun res!924923 () Bool)

(assert (=> b!1383287 (=> (not res!924923) (not e!784029))))

(declare-datatypes ((List!32245 0))(
  ( (Nil!32242) (Cons!32241 (h!33450 (_ BitVec 64)) (t!46931 List!32245)) )
))
(declare-fun arrayNoDuplicates!0 (array!94522 (_ BitVec 32) List!32245) Bool)

(assert (=> b!1383287 (= res!924923 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32242))))

(declare-fun res!924920 () Bool)

(assert (=> start!118266 (=> (not res!924920) (not e!784029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118266 (= res!924920 (validMask!0 mask!2987))))

(assert (=> start!118266 e!784029))

(assert (=> start!118266 true))

(declare-fun array_inv!34872 (array!94522) Bool)

(assert (=> start!118266 (array_inv!34872 a!2938)))

(assert (= (and start!118266 res!924920) b!1383285))

(assert (= (and b!1383285 res!924921) b!1383286))

(assert (= (and b!1383286 res!924922) b!1383287))

(assert (= (and b!1383287 res!924923) b!1383288))

(declare-fun m!1267953 () Bool)

(assert (=> b!1383288 m!1267953))

(declare-fun m!1267955 () Bool)

(assert (=> b!1383286 m!1267955))

(assert (=> b!1383286 m!1267955))

(declare-fun m!1267957 () Bool)

(assert (=> b!1383286 m!1267957))

(declare-fun m!1267959 () Bool)

(assert (=> b!1383287 m!1267959))

(declare-fun m!1267961 () Bool)

(assert (=> start!118266 m!1267961))

(declare-fun m!1267963 () Bool)

(assert (=> start!118266 m!1267963))

(push 1)

(assert (not b!1383288))

(assert (not b!1383286))

(assert (not start!118266))

(assert (not b!1383287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

