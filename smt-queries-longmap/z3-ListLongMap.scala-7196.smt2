; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92210 () Bool)

(assert start!92210)

(declare-fun b!1048239 () Bool)

(declare-fun res!697402 () Bool)

(declare-fun e!594521 () Bool)

(assert (=> b!1048239 (=> (not res!697402) (not e!594521))))

(declare-datatypes ((array!66038 0))(
  ( (array!66039 (arr!31760 (Array (_ BitVec 32) (_ BitVec 64))) (size!32296 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66038)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048239 (= res!697402 (= (select (arr!31760 a!3488) i!1381) k0!2747))))

(declare-fun b!1048241 () Bool)

(declare-fun e!594522 () Bool)

(declare-fun e!594523 () Bool)

(assert (=> b!1048241 (= e!594522 e!594523)))

(declare-fun res!697403 () Bool)

(assert (=> b!1048241 (=> (not res!697403) (not e!594523))))

(declare-fun lt!463148 () (_ BitVec 32))

(assert (=> b!1048241 (= res!697403 (not (= lt!463148 i!1381)))))

(declare-fun lt!463149 () array!66038)

(declare-fun arrayScanForKey!0 (array!66038 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048241 (= lt!463148 (arrayScanForKey!0 lt!463149 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048242 () Bool)

(assert (=> b!1048242 (= e!594521 e!594522)))

(declare-fun res!697404 () Bool)

(assert (=> b!1048242 (=> (not res!697404) (not e!594522))))

(declare-fun arrayContainsKey!0 (array!66038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048242 (= res!697404 (arrayContainsKey!0 lt!463149 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048242 (= lt!463149 (array!66039 (store (arr!31760 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32296 a!3488)))))

(declare-fun b!1048243 () Bool)

(declare-fun res!697406 () Bool)

(assert (=> b!1048243 (=> (not res!697406) (not e!594521))))

(declare-datatypes ((List!22072 0))(
  ( (Nil!22069) (Cons!22068 (h!23277 (_ BitVec 64)) (t!31379 List!22072)) )
))
(declare-fun arrayNoDuplicates!0 (array!66038 (_ BitVec 32) List!22072) Bool)

(assert (=> b!1048243 (= res!697406 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22069))))

(declare-fun b!1048244 () Bool)

(declare-fun res!697405 () Bool)

(assert (=> b!1048244 (=> (not res!697405) (not e!594521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048244 (= res!697405 (validKeyInArray!0 k0!2747))))

(declare-fun res!697401 () Bool)

(assert (=> start!92210 (=> (not res!697401) (not e!594521))))

(assert (=> start!92210 (= res!697401 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32296 a!3488)) (bvslt (size!32296 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92210 e!594521))

(assert (=> start!92210 true))

(declare-fun array_inv!24540 (array!66038) Bool)

(assert (=> start!92210 (array_inv!24540 a!3488)))

(declare-fun b!1048240 () Bool)

(assert (=> b!1048240 (= e!594523 (not (or (bvsle lt!463148 i!1381) (bvsge lt!463148 #b00000000000000000000000000000000))))))

(assert (=> b!1048240 (= (select (store (arr!31760 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463148) k0!2747)))

(assert (= (and start!92210 res!697401) b!1048243))

(assert (= (and b!1048243 res!697406) b!1048244))

(assert (= (and b!1048244 res!697405) b!1048239))

(assert (= (and b!1048239 res!697402) b!1048242))

(assert (= (and b!1048242 res!697404) b!1048241))

(assert (= (and b!1048241 res!697403) b!1048240))

(declare-fun m!969255 () Bool)

(assert (=> b!1048243 m!969255))

(declare-fun m!969257 () Bool)

(assert (=> start!92210 m!969257))

(declare-fun m!969259 () Bool)

(assert (=> b!1048244 m!969259))

(declare-fun m!969261 () Bool)

(assert (=> b!1048241 m!969261))

(declare-fun m!969263 () Bool)

(assert (=> b!1048240 m!969263))

(declare-fun m!969265 () Bool)

(assert (=> b!1048240 m!969265))

(declare-fun m!969267 () Bool)

(assert (=> b!1048242 m!969267))

(assert (=> b!1048242 m!969263))

(declare-fun m!969269 () Bool)

(assert (=> b!1048239 m!969269))

(check-sat (not start!92210) (not b!1048243) (not b!1048244) (not b!1048242) (not b!1048241))
(check-sat)
