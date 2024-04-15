; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118200 () Bool)

(assert start!118200)

(declare-fun res!924536 () Bool)

(declare-fun e!783832 () Bool)

(assert (=> start!118200 (=> (not res!924536) (not e!783832))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118200 (= res!924536 (validMask!0 mask!2987))))

(assert (=> start!118200 e!783832))

(assert (=> start!118200 true))

(declare-datatypes ((array!94456 0))(
  ( (array!94457 (arr!45606 (Array (_ BitVec 32) (_ BitVec 64))) (size!46158 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94456)

(declare-fun array_inv!34839 (array!94456) Bool)

(assert (=> start!118200 (array_inv!34839 a!2938)))

(declare-fun b!1382899 () Bool)

(declare-fun res!924534 () Bool)

(assert (=> b!1382899 (=> (not res!924534) (not e!783832))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382899 (= res!924534 (and (= (size!46158 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46158 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46158 a!2938))))))

(declare-fun b!1382900 () Bool)

(declare-fun res!924535 () Bool)

(assert (=> b!1382900 (=> (not res!924535) (not e!783832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382900 (= res!924535 (validKeyInArray!0 (select (arr!45606 a!2938) i!1065)))))

(declare-fun b!1382901 () Bool)

(assert (=> b!1382901 (= e!783832 false)))

(declare-fun lt!608321 () Bool)

(declare-datatypes ((List!32212 0))(
  ( (Nil!32209) (Cons!32208 (h!33417 (_ BitVec 64)) (t!46898 List!32212)) )
))
(declare-fun arrayNoDuplicates!0 (array!94456 (_ BitVec 32) List!32212) Bool)

(assert (=> b!1382901 (= lt!608321 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32209))))

(assert (= (and start!118200 res!924536) b!1382899))

(assert (= (and b!1382899 res!924534) b!1382900))

(assert (= (and b!1382900 res!924535) b!1382901))

(declare-fun m!1267571 () Bool)

(assert (=> start!118200 m!1267571))

(declare-fun m!1267573 () Bool)

(assert (=> start!118200 m!1267573))

(declare-fun m!1267575 () Bool)

(assert (=> b!1382900 m!1267575))

(assert (=> b!1382900 m!1267575))

(declare-fun m!1267577 () Bool)

(assert (=> b!1382900 m!1267577))

(declare-fun m!1267579 () Bool)

(assert (=> b!1382901 m!1267579))

(push 1)

(assert (not b!1382900))

(assert (not start!118200))

(assert (not b!1382901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

