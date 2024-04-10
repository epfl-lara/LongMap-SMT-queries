; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118206 () Bool)

(assert start!118206)

(declare-fun res!924570 () Bool)

(declare-fun e!783868 () Bool)

(assert (=> start!118206 (=> (not res!924570) (not e!783868))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118206 (= res!924570 (validMask!0 mask!2987))))

(assert (=> start!118206 e!783868))

(assert (=> start!118206 true))

(declare-datatypes ((array!94509 0))(
  ( (array!94510 (arr!45632 (Array (_ BitVec 32) (_ BitVec 64))) (size!46182 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94509)

(declare-fun array_inv!34660 (array!94509) Bool)

(assert (=> start!118206 (array_inv!34660 a!2938)))

(declare-fun b!1382977 () Bool)

(declare-fun res!924571 () Bool)

(assert (=> b!1382977 (=> (not res!924571) (not e!783868))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382977 (= res!924571 (and (= (size!46182 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46182 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46182 a!2938))))))

(declare-fun b!1382978 () Bool)

(declare-fun res!924569 () Bool)

(assert (=> b!1382978 (=> (not res!924569) (not e!783868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382978 (= res!924569 (validKeyInArray!0 (select (arr!45632 a!2938) i!1065)))))

(declare-fun b!1382979 () Bool)

(assert (=> b!1382979 (= e!783868 false)))

(declare-fun lt!608508 () Bool)

(declare-datatypes ((List!32160 0))(
  ( (Nil!32157) (Cons!32156 (h!33365 (_ BitVec 64)) (t!46854 List!32160)) )
))
(declare-fun arrayNoDuplicates!0 (array!94509 (_ BitVec 32) List!32160) Bool)

(assert (=> b!1382979 (= lt!608508 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32157))))

(assert (= (and start!118206 res!924570) b!1382977))

(assert (= (and b!1382977 res!924571) b!1382978))

(assert (= (and b!1382978 res!924569) b!1382979))

(declare-fun m!1268085 () Bool)

(assert (=> start!118206 m!1268085))

(declare-fun m!1268087 () Bool)

(assert (=> start!118206 m!1268087))

(declare-fun m!1268089 () Bool)

(assert (=> b!1382978 m!1268089))

(assert (=> b!1382978 m!1268089))

(declare-fun m!1268091 () Bool)

(assert (=> b!1382978 m!1268091))

(declare-fun m!1268093 () Bool)

(assert (=> b!1382979 m!1268093))

(push 1)

(assert (not start!118206))

(assert (not b!1382978))

(assert (not b!1382979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

