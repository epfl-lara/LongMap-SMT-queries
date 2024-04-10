; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118224 () Bool)

(assert start!118224)

(declare-fun b!1383081 () Bool)

(declare-fun e!783923 () Bool)

(assert (=> b!1383081 (= e!783923 false)))

(declare-fun lt!608526 () Bool)

(declare-datatypes ((array!94527 0))(
  ( (array!94528 (arr!45641 (Array (_ BitVec 32) (_ BitVec 64))) (size!46191 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94527)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94527 (_ BitVec 32)) Bool)

(assert (=> b!1383081 (= lt!608526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383079 () Bool)

(declare-fun res!924673 () Bool)

(assert (=> b!1383079 (=> (not res!924673) (not e!783923))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383079 (= res!924673 (validKeyInArray!0 (select (arr!45641 a!2938) i!1065)))))

(declare-fun b!1383078 () Bool)

(declare-fun res!924672 () Bool)

(assert (=> b!1383078 (=> (not res!924672) (not e!783923))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383078 (= res!924672 (and (= (size!46191 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46191 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46191 a!2938))))))

(declare-fun b!1383080 () Bool)

(declare-fun res!924670 () Bool)

(assert (=> b!1383080 (=> (not res!924670) (not e!783923))))

(declare-datatypes ((List!32169 0))(
  ( (Nil!32166) (Cons!32165 (h!33374 (_ BitVec 64)) (t!46863 List!32169)) )
))
(declare-fun arrayNoDuplicates!0 (array!94527 (_ BitVec 32) List!32169) Bool)

(assert (=> b!1383080 (= res!924670 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32166))))

(declare-fun res!924671 () Bool)

(assert (=> start!118224 (=> (not res!924671) (not e!783923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118224 (= res!924671 (validMask!0 mask!2987))))

(assert (=> start!118224 e!783923))

(assert (=> start!118224 true))

(declare-fun array_inv!34669 (array!94527) Bool)

(assert (=> start!118224 (array_inv!34669 a!2938)))

(assert (= (and start!118224 res!924671) b!1383078))

(assert (= (and b!1383078 res!924672) b!1383079))

(assert (= (and b!1383079 res!924673) b!1383080))

(assert (= (and b!1383080 res!924670) b!1383081))

(declare-fun m!1268181 () Bool)

(assert (=> b!1383081 m!1268181))

(declare-fun m!1268183 () Bool)

(assert (=> b!1383079 m!1268183))

(assert (=> b!1383079 m!1268183))

(declare-fun m!1268185 () Bool)

(assert (=> b!1383079 m!1268185))

(declare-fun m!1268187 () Bool)

(assert (=> b!1383080 m!1268187))

(declare-fun m!1268189 () Bool)

(assert (=> start!118224 m!1268189))

(declare-fun m!1268191 () Bool)

(assert (=> start!118224 m!1268191))

(push 1)

(assert (not b!1383079))

(assert (not start!118224))

(assert (not b!1383080))

(assert (not b!1383081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

