; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118482 () Bool)

(assert start!118482)

(declare-fun b!1385436 () Bool)

(declare-fun res!926732 () Bool)

(declare-fun e!784992 () Bool)

(assert (=> b!1385436 (=> (not res!926732) (not e!784992))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94711 0))(
  ( (array!94712 (arr!45732 (Array (_ BitVec 32) (_ BitVec 64))) (size!46284 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94711)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385436 (= res!926732 (and (= (size!46284 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46284 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46284 a!2938))))))

(declare-fun b!1385437 () Bool)

(declare-fun res!926731 () Bool)

(assert (=> b!1385437 (=> (not res!926731) (not e!784992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385437 (= res!926731 (validKeyInArray!0 (select (arr!45732 a!2938) i!1065)))))

(declare-fun b!1385438 () Bool)

(declare-fun res!926730 () Bool)

(assert (=> b!1385438 (=> (not res!926730) (not e!784992))))

(declare-datatypes ((List!32338 0))(
  ( (Nil!32335) (Cons!32334 (h!33543 (_ BitVec 64)) (t!47024 List!32338)) )
))
(declare-fun arrayNoDuplicates!0 (array!94711 (_ BitVec 32) List!32338) Bool)

(assert (=> b!1385438 (= res!926730 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32335))))

(declare-fun res!926729 () Bool)

(assert (=> start!118482 (=> (not res!926729) (not e!784992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118482 (= res!926729 (validMask!0 mask!2987))))

(assert (=> start!118482 e!784992))

(assert (=> start!118482 true))

(declare-fun array_inv!34965 (array!94711) Bool)

(assert (=> start!118482 (array_inv!34965 a!2938)))

(declare-fun b!1385439 () Bool)

(assert (=> b!1385439 (= e!784992 false)))

(declare-fun lt!609077 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94711 (_ BitVec 32)) Bool)

(assert (=> b!1385439 (= lt!609077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118482 res!926729) b!1385436))

(assert (= (and b!1385436 res!926732) b!1385437))

(assert (= (and b!1385437 res!926731) b!1385438))

(assert (= (and b!1385438 res!926730) b!1385439))

(declare-fun m!1270293 () Bool)

(assert (=> b!1385437 m!1270293))

(assert (=> b!1385437 m!1270293))

(declare-fun m!1270295 () Bool)

(assert (=> b!1385437 m!1270295))

(declare-fun m!1270297 () Bool)

(assert (=> b!1385438 m!1270297))

(declare-fun m!1270299 () Bool)

(assert (=> start!118482 m!1270299))

(declare-fun m!1270301 () Bool)

(assert (=> start!118482 m!1270301))

(declare-fun m!1270303 () Bool)

(assert (=> b!1385439 m!1270303))

(push 1)

(assert (not b!1385437))

(assert (not b!1385438))

(assert (not start!118482))

(assert (not b!1385439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

