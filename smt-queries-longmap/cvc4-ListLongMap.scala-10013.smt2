; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118132 () Bool)

(assert start!118132)

(declare-fun res!924392 () Bool)

(declare-fun e!783739 () Bool)

(assert (=> start!118132 (=> (not res!924392) (not e!783739))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118132 (= res!924392 (validMask!0 mask!2987))))

(assert (=> start!118132 e!783739))

(assert (=> start!118132 true))

(declare-datatypes ((array!94483 0))(
  ( (array!94484 (arr!45622 (Array (_ BitVec 32) (_ BitVec 64))) (size!46172 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94483)

(declare-fun array_inv!34650 (array!94483) Bool)

(assert (=> start!118132 (array_inv!34650 a!2938)))

(declare-fun b!1382801 () Bool)

(declare-fun res!924394 () Bool)

(assert (=> b!1382801 (=> (not res!924394) (not e!783739))))

(assert (=> b!1382801 (= res!924394 (and (bvsle #b00000000000000000000000000000000 (size!46172 a!2938)) (bvslt (size!46172 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1382802 () Bool)

(declare-datatypes ((List!32150 0))(
  ( (Nil!32147) (Cons!32146 (h!33355 (_ BitVec 64)) (t!46844 List!32150)) )
))
(declare-fun noDuplicate!2596 (List!32150) Bool)

(assert (=> b!1382802 (= e!783739 (not (noDuplicate!2596 Nil!32147)))))

(declare-fun b!1382800 () Bool)

(declare-fun res!924391 () Bool)

(assert (=> b!1382800 (=> (not res!924391) (not e!783739))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382800 (= res!924391 (validKeyInArray!0 (select (arr!45622 a!2938) i!1065)))))

(declare-fun b!1382799 () Bool)

(declare-fun res!924393 () Bool)

(assert (=> b!1382799 (=> (not res!924393) (not e!783739))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382799 (= res!924393 (and (= (size!46172 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46172 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46172 a!2938))))))

(assert (= (and start!118132 res!924392) b!1382799))

(assert (= (and b!1382799 res!924393) b!1382800))

(assert (= (and b!1382800 res!924391) b!1382801))

(assert (= (and b!1382801 res!924394) b!1382802))

(declare-fun m!1267919 () Bool)

(assert (=> start!118132 m!1267919))

(declare-fun m!1267921 () Bool)

(assert (=> start!118132 m!1267921))

(declare-fun m!1267923 () Bool)

(assert (=> b!1382802 m!1267923))

(declare-fun m!1267925 () Bool)

(assert (=> b!1382800 m!1267925))

(assert (=> b!1382800 m!1267925))

(declare-fun m!1267927 () Bool)

(assert (=> b!1382800 m!1267927))

(push 1)

(assert (not start!118132))

(assert (not b!1382802))

(assert (not b!1382800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149223 () Bool)

