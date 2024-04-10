; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118102 () Bool)

(assert start!118102)

(declare-fun res!924313 () Bool)

(declare-fun e!783692 () Bool)

(assert (=> start!118102 (=> (not res!924313) (not e!783692))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118102 (= res!924313 (validMask!0 mask!2987))))

(assert (=> start!118102 e!783692))

(assert (=> start!118102 true))

(declare-datatypes ((array!94466 0))(
  ( (array!94467 (arr!45614 (Array (_ BitVec 32) (_ BitVec 64))) (size!46164 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94466)

(declare-fun array_inv!34642 (array!94466) Bool)

(assert (=> start!118102 (array_inv!34642 a!2938)))

(declare-fun b!1382719 () Bool)

(declare-fun res!924311 () Bool)

(assert (=> b!1382719 (=> (not res!924311) (not e!783692))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382719 (= res!924311 (and (= (size!46164 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46164 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46164 a!2938))))))

(declare-fun b!1382720 () Bool)

(declare-fun res!924312 () Bool)

(assert (=> b!1382720 (=> (not res!924312) (not e!783692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382720 (= res!924312 (validKeyInArray!0 (select (arr!45614 a!2938) i!1065)))))

(declare-fun b!1382721 () Bool)

(assert (=> b!1382721 (= e!783692 (bvsgt #b00000000000000000000000000000000 (size!46164 a!2938)))))

(assert (= (and start!118102 res!924313) b!1382719))

(assert (= (and b!1382719 res!924311) b!1382720))

(assert (= (and b!1382720 res!924312) b!1382721))

(declare-fun m!1267851 () Bool)

(assert (=> start!118102 m!1267851))

(declare-fun m!1267853 () Bool)

(assert (=> start!118102 m!1267853))

(declare-fun m!1267855 () Bool)

(assert (=> b!1382720 m!1267855))

(assert (=> b!1382720 m!1267855))

(declare-fun m!1267857 () Bool)

(assert (=> b!1382720 m!1267857))

(push 1)

(assert (not start!118102))

(assert (not b!1382720))

(check-sat)

(pop 1)

