; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118242 () Bool)

(assert start!118242)

(declare-fun res!924778 () Bool)

(declare-fun e!783977 () Bool)

(assert (=> start!118242 (=> (not res!924778) (not e!783977))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118242 (= res!924778 (validMask!0 mask!2987))))

(assert (=> start!118242 e!783977))

(assert (=> start!118242 true))

(declare-datatypes ((array!94545 0))(
  ( (array!94546 (arr!45650 (Array (_ BitVec 32) (_ BitVec 64))) (size!46200 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94545)

(declare-fun array_inv!34678 (array!94545) Bool)

(assert (=> start!118242 (array_inv!34678 a!2938)))

(declare-fun b!1383186 () Bool)

(declare-fun res!924779 () Bool)

(assert (=> b!1383186 (=> (not res!924779) (not e!783977))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383186 (= res!924779 (and (= (size!46200 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46200 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46200 a!2938))))))

(declare-fun b!1383189 () Bool)

(assert (=> b!1383189 (= e!783977 false)))

(declare-fun lt!608553 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94545 (_ BitVec 32)) Bool)

(assert (=> b!1383189 (= lt!608553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383188 () Bool)

(declare-fun res!924781 () Bool)

(assert (=> b!1383188 (=> (not res!924781) (not e!783977))))

(declare-datatypes ((List!32178 0))(
  ( (Nil!32175) (Cons!32174 (h!33383 (_ BitVec 64)) (t!46872 List!32178)) )
))
(declare-fun arrayNoDuplicates!0 (array!94545 (_ BitVec 32) List!32178) Bool)

(assert (=> b!1383188 (= res!924781 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32175))))

(declare-fun b!1383187 () Bool)

(declare-fun res!924780 () Bool)

(assert (=> b!1383187 (=> (not res!924780) (not e!783977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383187 (= res!924780 (validKeyInArray!0 (select (arr!45650 a!2938) i!1065)))))

(assert (= (and start!118242 res!924778) b!1383186))

(assert (= (and b!1383186 res!924779) b!1383187))

(assert (= (and b!1383187 res!924780) b!1383188))

(assert (= (and b!1383188 res!924781) b!1383189))

(declare-fun m!1268289 () Bool)

(assert (=> start!118242 m!1268289))

(declare-fun m!1268291 () Bool)

(assert (=> start!118242 m!1268291))

(declare-fun m!1268293 () Bool)

(assert (=> b!1383189 m!1268293))

(declare-fun m!1268295 () Bool)

(assert (=> b!1383188 m!1268295))

(declare-fun m!1268297 () Bool)

(assert (=> b!1383187 m!1268297))

(assert (=> b!1383187 m!1268297))

(declare-fun m!1268299 () Bool)

(assert (=> b!1383187 m!1268299))

(push 1)

(assert (not b!1383187))

(assert (not start!118242))

(assert (not b!1383188))

(assert (not b!1383189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

