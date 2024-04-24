; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93000 () Bool)

(assert start!93000)

(declare-fun b!1055036 () Bool)

(declare-fun e!599339 () Bool)

(declare-fun e!599343 () Bool)

(assert (=> b!1055036 (= e!599339 e!599343)))

(declare-fun res!703218 () Bool)

(assert (=> b!1055036 (=> res!703218 e!599343)))

(declare-fun lt!465719 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055036 (= res!703218 (bvsle lt!465719 i!1381))))

(declare-fun b!1055037 () Bool)

(declare-fun e!599341 () Bool)

(declare-fun e!599344 () Bool)

(assert (=> b!1055037 (= e!599341 e!599344)))

(declare-fun res!703219 () Bool)

(assert (=> b!1055037 (=> (not res!703219) (not e!599344))))

(declare-datatypes ((array!66508 0))(
  ( (array!66509 (arr!31981 (Array (_ BitVec 32) (_ BitVec 64))) (size!32518 (_ BitVec 32))) )
))
(declare-fun lt!465718 () array!66508)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055037 (= res!703219 (arrayContainsKey!0 lt!465718 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66508)

(assert (=> b!1055037 (= lt!465718 (array!66509 (store (arr!31981 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32518 a!3488)))))

(declare-fun b!1055038 () Bool)

(declare-fun res!703220 () Bool)

(assert (=> b!1055038 (=> (not res!703220) (not e!599341))))

(declare-datatypes ((List!22263 0))(
  ( (Nil!22260) (Cons!22259 (h!23477 (_ BitVec 64)) (t!31562 List!22263)) )
))
(declare-fun arrayNoDuplicates!0 (array!66508 (_ BitVec 32) List!22263) Bool)

(assert (=> b!1055038 (= res!703220 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22260))))

(declare-fun res!703217 () Bool)

(assert (=> start!93000 (=> (not res!703217) (not e!599341))))

(assert (=> start!93000 (= res!703217 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32518 a!3488)) (bvslt (size!32518 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93000 e!599341))

(assert (=> start!93000 true))

(declare-fun array_inv!24763 (array!66508) Bool)

(assert (=> start!93000 (array_inv!24763 a!3488)))

(declare-fun b!1055039 () Bool)

(declare-fun res!703215 () Bool)

(assert (=> b!1055039 (=> (not res!703215) (not e!599341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055039 (= res!703215 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055040 () Bool)

(assert (=> b!1055040 (= e!599343 (arrayContainsKey!0 a!3488 k0!2747 lt!465719))))

(declare-fun e!599340 () Bool)

(declare-fun b!1055041 () Bool)

(assert (=> b!1055041 (= e!599340 (not (or (bvsle lt!465719 i!1381) (bvsle #b00000000000000000000000000000000 (size!32518 a!3488)))))))

(assert (=> b!1055041 e!599339))

(declare-fun res!703216 () Bool)

(assert (=> b!1055041 (=> (not res!703216) (not e!599339))))

(assert (=> b!1055041 (= res!703216 (= (select (store (arr!31981 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465719) k0!2747))))

(declare-fun b!1055042 () Bool)

(declare-fun res!703214 () Bool)

(assert (=> b!1055042 (=> (not res!703214) (not e!599341))))

(assert (=> b!1055042 (= res!703214 (= (select (arr!31981 a!3488) i!1381) k0!2747))))

(declare-fun b!1055043 () Bool)

(assert (=> b!1055043 (= e!599344 e!599340)))

(declare-fun res!703213 () Bool)

(assert (=> b!1055043 (=> (not res!703213) (not e!599340))))

(assert (=> b!1055043 (= res!703213 (not (= lt!465719 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66508 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055043 (= lt!465719 (arrayScanForKey!0 lt!465718 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93000 res!703217) b!1055038))

(assert (= (and b!1055038 res!703220) b!1055039))

(assert (= (and b!1055039 res!703215) b!1055042))

(assert (= (and b!1055042 res!703214) b!1055037))

(assert (= (and b!1055037 res!703219) b!1055043))

(assert (= (and b!1055043 res!703213) b!1055041))

(assert (= (and b!1055041 res!703216) b!1055036))

(assert (= (and b!1055036 (not res!703218)) b!1055040))

(declare-fun m!975605 () Bool)

(assert (=> b!1055041 m!975605))

(declare-fun m!975607 () Bool)

(assert (=> b!1055041 m!975607))

(declare-fun m!975609 () Bool)

(assert (=> start!93000 m!975609))

(declare-fun m!975611 () Bool)

(assert (=> b!1055042 m!975611))

(declare-fun m!975613 () Bool)

(assert (=> b!1055038 m!975613))

(declare-fun m!975615 () Bool)

(assert (=> b!1055043 m!975615))

(declare-fun m!975617 () Bool)

(assert (=> b!1055037 m!975617))

(assert (=> b!1055037 m!975605))

(declare-fun m!975619 () Bool)

(assert (=> b!1055039 m!975619))

(declare-fun m!975621 () Bool)

(assert (=> b!1055040 m!975621))

(check-sat (not start!93000) (not b!1055043) (not b!1055039) (not b!1055037) (not b!1055040) (not b!1055038))
(check-sat)
