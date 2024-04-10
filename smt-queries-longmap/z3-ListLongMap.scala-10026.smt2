; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118262 () Bool)

(assert start!118262)

(declare-fun res!924901 () Bool)

(declare-fun e!784036 () Bool)

(assert (=> start!118262 (=> (not res!924901) (not e!784036))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118262 (= res!924901 (validMask!0 mask!2987))))

(assert (=> start!118262 e!784036))

(assert (=> start!118262 true))

(declare-datatypes ((array!94565 0))(
  ( (array!94566 (arr!45660 (Array (_ BitVec 32) (_ BitVec 64))) (size!46210 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94565)

(declare-fun array_inv!34688 (array!94565) Bool)

(assert (=> start!118262 (array_inv!34688 a!2938)))

(declare-fun b!1383309 () Bool)

(assert (=> b!1383309 (= e!784036 false)))

(declare-fun lt!608583 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94565 (_ BitVec 32)) Bool)

(assert (=> b!1383309 (= lt!608583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383306 () Bool)

(declare-fun res!924898 () Bool)

(assert (=> b!1383306 (=> (not res!924898) (not e!784036))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383306 (= res!924898 (and (= (size!46210 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46210 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46210 a!2938))))))

(declare-fun b!1383308 () Bool)

(declare-fun res!924900 () Bool)

(assert (=> b!1383308 (=> (not res!924900) (not e!784036))))

(declare-datatypes ((List!32188 0))(
  ( (Nil!32185) (Cons!32184 (h!33393 (_ BitVec 64)) (t!46882 List!32188)) )
))
(declare-fun arrayNoDuplicates!0 (array!94565 (_ BitVec 32) List!32188) Bool)

(assert (=> b!1383308 (= res!924900 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32185))))

(declare-fun b!1383307 () Bool)

(declare-fun res!924899 () Bool)

(assert (=> b!1383307 (=> (not res!924899) (not e!784036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383307 (= res!924899 (validKeyInArray!0 (select (arr!45660 a!2938) i!1065)))))

(assert (= (and start!118262 res!924901) b!1383306))

(assert (= (and b!1383306 res!924898) b!1383307))

(assert (= (and b!1383307 res!924899) b!1383308))

(assert (= (and b!1383308 res!924900) b!1383309))

(declare-fun m!1268409 () Bool)

(assert (=> start!118262 m!1268409))

(declare-fun m!1268411 () Bool)

(assert (=> start!118262 m!1268411))

(declare-fun m!1268413 () Bool)

(assert (=> b!1383309 m!1268413))

(declare-fun m!1268415 () Bool)

(assert (=> b!1383308 m!1268415))

(declare-fun m!1268417 () Bool)

(assert (=> b!1383307 m!1268417))

(assert (=> b!1383307 m!1268417))

(declare-fun m!1268419 () Bool)

(assert (=> b!1383307 m!1268419))

(check-sat (not b!1383307) (not start!118262) (not b!1383308) (not b!1383309))
