; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118230 () Bool)

(assert start!118230)

(declare-fun b!1383114 () Bool)

(declare-fun res!924706 () Bool)

(declare-fun e!783941 () Bool)

(assert (=> b!1383114 (=> (not res!924706) (not e!783941))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((array!94533 0))(
  ( (array!94534 (arr!45644 (Array (_ BitVec 32) (_ BitVec 64))) (size!46194 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94533)

(assert (=> b!1383114 (= res!924706 (and (= (size!46194 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46194 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46194 a!2938))))))

(declare-fun b!1383115 () Bool)

(declare-fun res!924709 () Bool)

(assert (=> b!1383115 (=> (not res!924709) (not e!783941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383115 (= res!924709 (validKeyInArray!0 (select (arr!45644 a!2938) i!1065)))))

(declare-fun res!924708 () Bool)

(assert (=> start!118230 (=> (not res!924708) (not e!783941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118230 (= res!924708 (validMask!0 mask!2987))))

(assert (=> start!118230 e!783941))

(assert (=> start!118230 true))

(declare-fun array_inv!34672 (array!94533) Bool)

(assert (=> start!118230 (array_inv!34672 a!2938)))

(declare-fun b!1383117 () Bool)

(assert (=> b!1383117 (= e!783941 false)))

(declare-fun lt!608535 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94533 (_ BitVec 32)) Bool)

(assert (=> b!1383117 (= lt!608535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383116 () Bool)

(declare-fun res!924707 () Bool)

(assert (=> b!1383116 (=> (not res!924707) (not e!783941))))

(declare-datatypes ((List!32172 0))(
  ( (Nil!32169) (Cons!32168 (h!33377 (_ BitVec 64)) (t!46866 List!32172)) )
))
(declare-fun arrayNoDuplicates!0 (array!94533 (_ BitVec 32) List!32172) Bool)

(assert (=> b!1383116 (= res!924707 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32169))))

(assert (= (and start!118230 res!924708) b!1383114))

(assert (= (and b!1383114 res!924706) b!1383115))

(assert (= (and b!1383115 res!924709) b!1383116))

(assert (= (and b!1383116 res!924707) b!1383117))

(declare-fun m!1268217 () Bool)

(assert (=> b!1383115 m!1268217))

(assert (=> b!1383115 m!1268217))

(declare-fun m!1268219 () Bool)

(assert (=> b!1383115 m!1268219))

(declare-fun m!1268221 () Bool)

(assert (=> start!118230 m!1268221))

(declare-fun m!1268223 () Bool)

(assert (=> start!118230 m!1268223))

(declare-fun m!1268225 () Bool)

(assert (=> b!1383117 m!1268225))

(declare-fun m!1268227 () Bool)

(assert (=> b!1383116 m!1268227))

(push 1)

(assert (not start!118230))

(assert (not b!1383116))

(assert (not b!1383115))

(assert (not b!1383117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

