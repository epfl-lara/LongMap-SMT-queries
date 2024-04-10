; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118280 () Bool)

(assert start!118280)

(declare-fun b!1383414 () Bool)

(declare-fun res!925009 () Bool)

(declare-fun e!784090 () Bool)

(assert (=> b!1383414 (=> (not res!925009) (not e!784090))))

(declare-datatypes ((array!94583 0))(
  ( (array!94584 (arr!45669 (Array (_ BitVec 32) (_ BitVec 64))) (size!46219 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94583)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383414 (= res!925009 (and (= (size!46219 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46219 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46219 a!2938))))))

(declare-fun b!1383416 () Bool)

(declare-fun res!925008 () Bool)

(assert (=> b!1383416 (=> (not res!925008) (not e!784090))))

(declare-datatypes ((List!32197 0))(
  ( (Nil!32194) (Cons!32193 (h!33402 (_ BitVec 64)) (t!46891 List!32197)) )
))
(declare-fun arrayNoDuplicates!0 (array!94583 (_ BitVec 32) List!32197) Bool)

(assert (=> b!1383416 (= res!925008 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32194))))

(declare-fun b!1383415 () Bool)

(declare-fun res!925006 () Bool)

(assert (=> b!1383415 (=> (not res!925006) (not e!784090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383415 (= res!925006 (validKeyInArray!0 (select (arr!45669 a!2938) i!1065)))))

(declare-fun b!1383417 () Bool)

(assert (=> b!1383417 (= e!784090 false)))

(declare-fun lt!608610 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94583 (_ BitVec 32)) Bool)

(assert (=> b!1383417 (= lt!608610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925007 () Bool)

(assert (=> start!118280 (=> (not res!925007) (not e!784090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118280 (= res!925007 (validMask!0 mask!2987))))

(assert (=> start!118280 e!784090))

(assert (=> start!118280 true))

(declare-fun array_inv!34697 (array!94583) Bool)

(assert (=> start!118280 (array_inv!34697 a!2938)))

(assert (= (and start!118280 res!925007) b!1383414))

(assert (= (and b!1383414 res!925009) b!1383415))

(assert (= (and b!1383415 res!925006) b!1383416))

(assert (= (and b!1383416 res!925008) b!1383417))

(declare-fun m!1268517 () Bool)

(assert (=> b!1383416 m!1268517))

(declare-fun m!1268519 () Bool)

(assert (=> b!1383415 m!1268519))

(assert (=> b!1383415 m!1268519))

(declare-fun m!1268521 () Bool)

(assert (=> b!1383415 m!1268521))

(declare-fun m!1268523 () Bool)

(assert (=> b!1383417 m!1268523))

(declare-fun m!1268525 () Bool)

(assert (=> start!118280 m!1268525))

(declare-fun m!1268527 () Bool)

(assert (=> start!118280 m!1268527))

(check-sat (not start!118280) (not b!1383416) (not b!1383417) (not b!1383415))
