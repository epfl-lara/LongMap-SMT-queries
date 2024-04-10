; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92404 () Bool)

(assert start!92404)

(declare-fun b!1050615 () Bool)

(declare-fun res!699745 () Bool)

(declare-fun e!596226 () Bool)

(assert (=> b!1050615 (=> (not res!699745) (not e!596226))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050615 (= res!699745 (validKeyInArray!0 k!2747))))

(declare-fun b!1050616 () Bool)

(declare-fun e!596224 () Bool)

(declare-fun e!596227 () Bool)

(assert (=> b!1050616 (= e!596224 e!596227)))

(declare-fun res!699746 () Bool)

(assert (=> b!1050616 (=> (not res!699746) (not e!596227))))

(declare-fun lt!464027 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050616 (= res!699746 (not (= lt!464027 i!1381)))))

(declare-datatypes ((array!66205 0))(
  ( (array!66206 (arr!31842 (Array (_ BitVec 32) (_ BitVec 64))) (size!32378 (_ BitVec 32))) )
))
(declare-fun lt!464028 () array!66205)

(declare-fun arrayScanForKey!0 (array!66205 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050616 (= lt!464027 (arrayScanForKey!0 lt!464028 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050617 () Bool)

(declare-fun res!699742 () Bool)

(assert (=> b!1050617 (=> (not res!699742) (not e!596226))))

(declare-fun a!3488 () array!66205)

(declare-datatypes ((List!22154 0))(
  ( (Nil!22151) (Cons!22150 (h!23359 (_ BitVec 64)) (t!31461 List!22154)) )
))
(declare-fun arrayNoDuplicates!0 (array!66205 (_ BitVec 32) List!22154) Bool)

(assert (=> b!1050617 (= res!699742 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22151))))

(declare-fun res!699741 () Bool)

(assert (=> start!92404 (=> (not res!699741) (not e!596226))))

(assert (=> start!92404 (= res!699741 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32378 a!3488)) (bvslt (size!32378 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92404 e!596226))

(assert (=> start!92404 true))

(declare-fun array_inv!24622 (array!66205) Bool)

(assert (=> start!92404 (array_inv!24622 a!3488)))

(declare-fun b!1050618 () Bool)

(assert (=> b!1050618 (= e!596227 (not true))))

(assert (=> b!1050618 (= (select (store (arr!31842 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464027) k!2747)))

(declare-fun b!1050619 () Bool)

(declare-fun res!699743 () Bool)

(assert (=> b!1050619 (=> (not res!699743) (not e!596226))))

(assert (=> b!1050619 (= res!699743 (= (select (arr!31842 a!3488) i!1381) k!2747))))

(declare-fun b!1050620 () Bool)

(assert (=> b!1050620 (= e!596226 e!596224)))

(declare-fun res!699744 () Bool)

(assert (=> b!1050620 (=> (not res!699744) (not e!596224))))

(declare-fun arrayContainsKey!0 (array!66205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050620 (= res!699744 (arrayContainsKey!0 lt!464028 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050620 (= lt!464028 (array!66206 (store (arr!31842 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32378 a!3488)))))

(assert (= (and start!92404 res!699741) b!1050617))

(assert (= (and b!1050617 res!699742) b!1050615))

(assert (= (and b!1050615 res!699745) b!1050619))

(assert (= (and b!1050619 res!699743) b!1050620))

(assert (= (and b!1050620 res!699744) b!1050616))

(assert (= (and b!1050616 res!699746) b!1050618))

(declare-fun m!971293 () Bool)

(assert (=> b!1050617 m!971293))

(declare-fun m!971295 () Bool)

(assert (=> b!1050619 m!971295))

(declare-fun m!971297 () Bool)

(assert (=> b!1050620 m!971297))

(declare-fun m!971299 () Bool)

(assert (=> b!1050620 m!971299))

(declare-fun m!971301 () Bool)

(assert (=> b!1050615 m!971301))

(assert (=> b!1050618 m!971299))

(declare-fun m!971303 () Bool)

(assert (=> b!1050618 m!971303))

(declare-fun m!971305 () Bool)

(assert (=> b!1050616 m!971305))

(declare-fun m!971307 () Bool)

(assert (=> start!92404 m!971307))

(push 1)

(assert (not b!1050616))

(assert (not b!1050620))

