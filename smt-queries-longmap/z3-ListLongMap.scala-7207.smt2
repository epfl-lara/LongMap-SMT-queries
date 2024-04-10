; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92306 () Bool)

(assert start!92306)

(declare-fun b!1049100 () Bool)

(declare-fun res!698233 () Bool)

(declare-fun e!595166 () Bool)

(assert (=> b!1049100 (=> (not res!698233) (not e!595166))))

(declare-datatypes ((array!66107 0))(
  ( (array!66108 (arr!31793 (Array (_ BitVec 32) (_ BitVec 64))) (size!32329 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66107)

(declare-datatypes ((List!22105 0))(
  ( (Nil!22102) (Cons!22101 (h!23310 (_ BitVec 64)) (t!31412 List!22105)) )
))
(declare-fun arrayNoDuplicates!0 (array!66107 (_ BitVec 32) List!22105) Bool)

(assert (=> b!1049100 (= res!698233 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22102))))

(declare-fun b!1049101 () Bool)

(declare-fun e!595165 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!463387 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049101 (= e!595165 (arrayContainsKey!0 a!3488 k0!2747 lt!463387))))

(declare-fun b!1049102 () Bool)

(declare-fun e!595168 () Bool)

(assert (=> b!1049102 (= e!595168 true)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049102 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22102)))

(declare-datatypes ((Unit!34306 0))(
  ( (Unit!34307) )
))
(declare-fun lt!463389 () Unit!34306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66107 (_ BitVec 32) (_ BitVec 32)) Unit!34306)

(assert (=> b!1049102 (= lt!463389 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049103 () Bool)

(declare-fun e!595169 () Bool)

(assert (=> b!1049103 (= e!595169 e!595165)))

(declare-fun res!698227 () Bool)

(assert (=> b!1049103 (=> res!698227 e!595165)))

(assert (=> b!1049103 (= res!698227 (bvsle lt!463387 i!1381))))

(declare-fun b!1049104 () Bool)

(declare-fun res!698232 () Bool)

(assert (=> b!1049104 (=> (not res!698232) (not e!595166))))

(assert (=> b!1049104 (= res!698232 (= (select (arr!31793 a!3488) i!1381) k0!2747))))

(declare-fun res!698229 () Bool)

(assert (=> start!92306 (=> (not res!698229) (not e!595166))))

(assert (=> start!92306 (= res!698229 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32329 a!3488)) (bvslt (size!32329 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92306 e!595166))

(assert (=> start!92306 true))

(declare-fun array_inv!24573 (array!66107) Bool)

(assert (=> start!92306 (array_inv!24573 a!3488)))

(declare-fun b!1049105 () Bool)

(declare-fun e!595170 () Bool)

(assert (=> b!1049105 (= e!595166 e!595170)))

(declare-fun res!698226 () Bool)

(assert (=> b!1049105 (=> (not res!698226) (not e!595170))))

(declare-fun lt!463388 () array!66107)

(assert (=> b!1049105 (= res!698226 (arrayContainsKey!0 lt!463388 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049105 (= lt!463388 (array!66108 (store (arr!31793 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32329 a!3488)))))

(declare-fun b!1049106 () Bool)

(declare-fun res!698231 () Bool)

(assert (=> b!1049106 (=> (not res!698231) (not e!595166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049106 (= res!698231 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049107 () Bool)

(declare-fun e!595167 () Bool)

(assert (=> b!1049107 (= e!595167 (not e!595168))))

(declare-fun res!698230 () Bool)

(assert (=> b!1049107 (=> res!698230 e!595168)))

(assert (=> b!1049107 (= res!698230 (bvsle lt!463387 i!1381))))

(assert (=> b!1049107 e!595169))

(declare-fun res!698234 () Bool)

(assert (=> b!1049107 (=> (not res!698234) (not e!595169))))

(assert (=> b!1049107 (= res!698234 (= (select (store (arr!31793 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463387) k0!2747))))

(declare-fun b!1049108 () Bool)

(assert (=> b!1049108 (= e!595170 e!595167)))

(declare-fun res!698228 () Bool)

(assert (=> b!1049108 (=> (not res!698228) (not e!595167))))

(assert (=> b!1049108 (= res!698228 (not (= lt!463387 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66107 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049108 (= lt!463387 (arrayScanForKey!0 lt!463388 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92306 res!698229) b!1049100))

(assert (= (and b!1049100 res!698233) b!1049106))

(assert (= (and b!1049106 res!698231) b!1049104))

(assert (= (and b!1049104 res!698232) b!1049105))

(assert (= (and b!1049105 res!698226) b!1049108))

(assert (= (and b!1049108 res!698228) b!1049107))

(assert (= (and b!1049107 res!698234) b!1049103))

(assert (= (and b!1049103 (not res!698227)) b!1049101))

(assert (= (and b!1049107 (not res!698230)) b!1049102))

(declare-fun m!969921 () Bool)

(assert (=> b!1049107 m!969921))

(declare-fun m!969923 () Bool)

(assert (=> b!1049107 m!969923))

(declare-fun m!969925 () Bool)

(assert (=> b!1049108 m!969925))

(declare-fun m!969927 () Bool)

(assert (=> b!1049102 m!969927))

(declare-fun m!969929 () Bool)

(assert (=> b!1049102 m!969929))

(declare-fun m!969931 () Bool)

(assert (=> b!1049100 m!969931))

(declare-fun m!969933 () Bool)

(assert (=> b!1049105 m!969933))

(assert (=> b!1049105 m!969921))

(declare-fun m!969935 () Bool)

(assert (=> start!92306 m!969935))

(declare-fun m!969937 () Bool)

(assert (=> b!1049106 m!969937))

(declare-fun m!969939 () Bool)

(assert (=> b!1049101 m!969939))

(declare-fun m!969941 () Bool)

(assert (=> b!1049104 m!969941))

(check-sat (not b!1049105) (not b!1049106) (not b!1049108) (not b!1049100) (not start!92306) (not b!1049101) (not b!1049102))
