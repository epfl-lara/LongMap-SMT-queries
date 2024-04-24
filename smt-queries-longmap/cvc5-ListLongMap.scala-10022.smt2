; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118452 () Bool)

(assert start!118452)

(declare-fun b!1384484 () Bool)

(declare-fun res!925288 () Bool)

(declare-fun e!784818 () Bool)

(assert (=> b!1384484 (=> (not res!925288) (not e!784818))))

(declare-datatypes ((array!94653 0))(
  ( (array!94654 (arr!45702 (Array (_ BitVec 32) (_ BitVec 64))) (size!46253 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94653)

(declare-datatypes ((List!32217 0))(
  ( (Nil!32214) (Cons!32213 (h!33431 (_ BitVec 64)) (t!46903 List!32217)) )
))
(declare-fun arrayNoDuplicates!0 (array!94653 (_ BitVec 32) List!32217) Bool)

(assert (=> b!1384484 (= res!925288 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32214))))

(declare-fun b!1384483 () Bool)

(declare-fun res!925287 () Bool)

(assert (=> b!1384483 (=> (not res!925287) (not e!784818))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384483 (= res!925287 (validKeyInArray!0 (select (arr!45702 a!2938) i!1065)))))

(declare-fun b!1384485 () Bool)

(assert (=> b!1384485 (= e!784818 false)))

(declare-fun lt!609030 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94653 (_ BitVec 32)) Bool)

(assert (=> b!1384485 (= lt!609030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384482 () Bool)

(declare-fun res!925285 () Bool)

(assert (=> b!1384482 (=> (not res!925285) (not e!784818))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384482 (= res!925285 (and (= (size!46253 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46253 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46253 a!2938))))))

(declare-fun res!925286 () Bool)

(assert (=> start!118452 (=> (not res!925286) (not e!784818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118452 (= res!925286 (validMask!0 mask!2987))))

(assert (=> start!118452 e!784818))

(assert (=> start!118452 true))

(declare-fun array_inv!34983 (array!94653) Bool)

(assert (=> start!118452 (array_inv!34983 a!2938)))

(assert (= (and start!118452 res!925286) b!1384482))

(assert (= (and b!1384482 res!925285) b!1384483))

(assert (= (and b!1384483 res!925287) b!1384484))

(assert (= (and b!1384484 res!925288) b!1384485))

(declare-fun m!1269909 () Bool)

(assert (=> b!1384484 m!1269909))

(declare-fun m!1269911 () Bool)

(assert (=> b!1384483 m!1269911))

(assert (=> b!1384483 m!1269911))

(declare-fun m!1269913 () Bool)

(assert (=> b!1384483 m!1269913))

(declare-fun m!1269915 () Bool)

(assert (=> b!1384485 m!1269915))

(declare-fun m!1269917 () Bool)

(assert (=> start!118452 m!1269917))

(declare-fun m!1269919 () Bool)

(assert (=> start!118452 m!1269919))

(push 1)

(assert (not b!1384483))

(assert (not start!118452))

(assert (not b!1384484))

(assert (not b!1384485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

