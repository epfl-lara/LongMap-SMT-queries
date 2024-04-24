; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93012 () Bool)

(assert start!93012)

(declare-fun res!703362 () Bool)

(declare-fun e!599447 () Bool)

(assert (=> start!93012 (=> (not res!703362) (not e!599447))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66520 0))(
  ( (array!66521 (arr!31987 (Array (_ BitVec 32) (_ BitVec 64))) (size!32524 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66520)

(assert (=> start!93012 (= res!703362 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32524 a!3488)) (bvslt (size!32524 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93012 e!599447))

(assert (=> start!93012 true))

(declare-fun array_inv!24769 (array!66520) Bool)

(assert (=> start!93012 (array_inv!24769 a!3488)))

(declare-fun b!1055180 () Bool)

(declare-fun res!703360 () Bool)

(assert (=> b!1055180 (=> (not res!703360) (not e!599447))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055180 (= res!703360 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055181 () Bool)

(declare-fun e!599451 () Bool)

(declare-fun e!599449 () Bool)

(assert (=> b!1055181 (= e!599451 e!599449)))

(declare-fun res!703359 () Bool)

(assert (=> b!1055181 (=> (not res!703359) (not e!599449))))

(declare-fun lt!465755 () (_ BitVec 32))

(assert (=> b!1055181 (= res!703359 (not (= lt!465755 i!1381)))))

(declare-fun lt!465754 () array!66520)

(declare-fun arrayScanForKey!0 (array!66520 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055181 (= lt!465755 (arrayScanForKey!0 lt!465754 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055182 () Bool)

(assert (=> b!1055182 (= e!599449 (not true))))

(declare-fun e!599452 () Bool)

(assert (=> b!1055182 e!599452))

(declare-fun res!703363 () Bool)

(assert (=> b!1055182 (=> (not res!703363) (not e!599452))))

(assert (=> b!1055182 (= res!703363 (= (select (store (arr!31987 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465755) k0!2747))))

(declare-fun e!599450 () Bool)

(declare-fun b!1055183 () Bool)

(declare-fun arrayContainsKey!0 (array!66520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055183 (= e!599450 (arrayContainsKey!0 a!3488 k0!2747 lt!465755))))

(declare-fun b!1055184 () Bool)

(assert (=> b!1055184 (= e!599447 e!599451)))

(declare-fun res!703361 () Bool)

(assert (=> b!1055184 (=> (not res!703361) (not e!599451))))

(assert (=> b!1055184 (= res!703361 (arrayContainsKey!0 lt!465754 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055184 (= lt!465754 (array!66521 (store (arr!31987 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32524 a!3488)))))

(declare-fun b!1055185 () Bool)

(assert (=> b!1055185 (= e!599452 e!599450)))

(declare-fun res!703364 () Bool)

(assert (=> b!1055185 (=> res!703364 e!599450)))

(assert (=> b!1055185 (= res!703364 (bvsle lt!465755 i!1381))))

(declare-fun b!1055186 () Bool)

(declare-fun res!703357 () Bool)

(assert (=> b!1055186 (=> (not res!703357) (not e!599447))))

(declare-datatypes ((List!22269 0))(
  ( (Nil!22266) (Cons!22265 (h!23483 (_ BitVec 64)) (t!31568 List!22269)) )
))
(declare-fun arrayNoDuplicates!0 (array!66520 (_ BitVec 32) List!22269) Bool)

(assert (=> b!1055186 (= res!703357 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22266))))

(declare-fun b!1055187 () Bool)

(declare-fun res!703358 () Bool)

(assert (=> b!1055187 (=> (not res!703358) (not e!599447))))

(assert (=> b!1055187 (= res!703358 (= (select (arr!31987 a!3488) i!1381) k0!2747))))

(assert (= (and start!93012 res!703362) b!1055186))

(assert (= (and b!1055186 res!703357) b!1055180))

(assert (= (and b!1055180 res!703360) b!1055187))

(assert (= (and b!1055187 res!703358) b!1055184))

(assert (= (and b!1055184 res!703361) b!1055181))

(assert (= (and b!1055181 res!703359) b!1055182))

(assert (= (and b!1055182 res!703363) b!1055185))

(assert (= (and b!1055185 (not res!703364)) b!1055183))

(declare-fun m!975713 () Bool)

(assert (=> b!1055182 m!975713))

(declare-fun m!975715 () Bool)

(assert (=> b!1055182 m!975715))

(declare-fun m!975717 () Bool)

(assert (=> b!1055180 m!975717))

(declare-fun m!975719 () Bool)

(assert (=> b!1055186 m!975719))

(declare-fun m!975721 () Bool)

(assert (=> start!93012 m!975721))

(declare-fun m!975723 () Bool)

(assert (=> b!1055183 m!975723))

(declare-fun m!975725 () Bool)

(assert (=> b!1055184 m!975725))

(assert (=> b!1055184 m!975713))

(declare-fun m!975727 () Bool)

(assert (=> b!1055181 m!975727))

(declare-fun m!975729 () Bool)

(assert (=> b!1055187 m!975729))

(check-sat (not start!93012) (not b!1055181) (not b!1055186) (not b!1055180) (not b!1055183) (not b!1055184))
(check-sat)
