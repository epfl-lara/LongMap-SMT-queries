; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118236 () Bool)

(assert start!118236)

(declare-fun b!1383153 () Bool)

(declare-fun e!783959 () Bool)

(assert (=> b!1383153 (= e!783959 false)))

(declare-fun lt!608544 () Bool)

(declare-datatypes ((array!94539 0))(
  ( (array!94540 (arr!45647 (Array (_ BitVec 32) (_ BitVec 64))) (size!46197 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94539)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94539 (_ BitVec 32)) Bool)

(assert (=> b!1383153 (= lt!608544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!924743 () Bool)

(assert (=> start!118236 (=> (not res!924743) (not e!783959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118236 (= res!924743 (validMask!0 mask!2987))))

(assert (=> start!118236 e!783959))

(assert (=> start!118236 true))

(declare-fun array_inv!34675 (array!94539) Bool)

(assert (=> start!118236 (array_inv!34675 a!2938)))

(declare-fun b!1383150 () Bool)

(declare-fun res!924744 () Bool)

(assert (=> b!1383150 (=> (not res!924744) (not e!783959))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383150 (= res!924744 (and (= (size!46197 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46197 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46197 a!2938))))))

(declare-fun b!1383152 () Bool)

(declare-fun res!924742 () Bool)

(assert (=> b!1383152 (=> (not res!924742) (not e!783959))))

(declare-datatypes ((List!32175 0))(
  ( (Nil!32172) (Cons!32171 (h!33380 (_ BitVec 64)) (t!46869 List!32175)) )
))
(declare-fun arrayNoDuplicates!0 (array!94539 (_ BitVec 32) List!32175) Bool)

(assert (=> b!1383152 (= res!924742 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32172))))

(declare-fun b!1383151 () Bool)

(declare-fun res!924745 () Bool)

(assert (=> b!1383151 (=> (not res!924745) (not e!783959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383151 (= res!924745 (validKeyInArray!0 (select (arr!45647 a!2938) i!1065)))))

(assert (= (and start!118236 res!924743) b!1383150))

(assert (= (and b!1383150 res!924744) b!1383151))

(assert (= (and b!1383151 res!924745) b!1383152))

(assert (= (and b!1383152 res!924742) b!1383153))

(declare-fun m!1268253 () Bool)

(assert (=> b!1383153 m!1268253))

(declare-fun m!1268255 () Bool)

(assert (=> start!118236 m!1268255))

(declare-fun m!1268257 () Bool)

(assert (=> start!118236 m!1268257))

(declare-fun m!1268259 () Bool)

(assert (=> b!1383152 m!1268259))

(declare-fun m!1268261 () Bool)

(assert (=> b!1383151 m!1268261))

(assert (=> b!1383151 m!1268261))

(declare-fun m!1268263 () Bool)

(assert (=> b!1383151 m!1268263))

(push 1)

(assert (not b!1383151))

(assert (not start!118236))

(assert (not b!1383152))

(assert (not b!1383153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

