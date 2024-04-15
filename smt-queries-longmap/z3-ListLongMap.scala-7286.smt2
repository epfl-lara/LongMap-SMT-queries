; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93106 () Bool)

(assert start!93106)

(declare-fun res!704834 () Bool)

(declare-fun e!600267 () Bool)

(assert (=> start!93106 (=> (not res!704834) (not e!600267))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66545 0))(
  ( (array!66546 (arr!31998 (Array (_ BitVec 32) (_ BitVec 64))) (size!32536 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66545)

(assert (=> start!93106 (= res!704834 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32536 a!3488)) (bvslt (size!32536 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93106 e!600267))

(assert (=> start!93106 true))

(declare-fun array_inv!24781 (array!66545) Bool)

(assert (=> start!93106 (array_inv!24781 a!3488)))

(declare-fun b!1055970 () Bool)

(declare-fun res!704838 () Bool)

(assert (=> b!1055970 (=> (not res!704838) (not e!600267))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055970 (= res!704838 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055971 () Bool)

(declare-fun res!704836 () Bool)

(assert (=> b!1055971 (=> (not res!704836) (not e!600267))))

(assert (=> b!1055971 (= res!704836 (= (select (arr!31998 a!3488) i!1381) k0!2747))))

(declare-fun b!1055972 () Bool)

(declare-fun res!704832 () Bool)

(assert (=> b!1055972 (=> (not res!704832) (not e!600267))))

(declare-datatypes ((List!22369 0))(
  ( (Nil!22366) (Cons!22365 (h!23574 (_ BitVec 64)) (t!31667 List!22369)) )
))
(declare-fun arrayNoDuplicates!0 (array!66545 (_ BitVec 32) List!22369) Bool)

(assert (=> b!1055972 (= res!704832 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22366))))

(declare-fun b!1055973 () Bool)

(declare-fun e!600264 () Bool)

(declare-fun e!600265 () Bool)

(assert (=> b!1055973 (= e!600264 e!600265)))

(declare-fun res!704837 () Bool)

(assert (=> b!1055973 (=> res!704837 e!600265)))

(declare-fun lt!465835 () (_ BitVec 32))

(assert (=> b!1055973 (= res!704837 (or (bvsgt lt!465835 i!1381) (bvsle i!1381 lt!465835)))))

(declare-fun b!1055974 () Bool)

(declare-fun e!600266 () Bool)

(assert (=> b!1055974 (= e!600267 e!600266)))

(declare-fun res!704833 () Bool)

(assert (=> b!1055974 (=> (not res!704833) (not e!600266))))

(declare-fun lt!465834 () array!66545)

(declare-fun arrayContainsKey!0 (array!66545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055974 (= res!704833 (arrayContainsKey!0 lt!465834 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055974 (= lt!465834 (array!66546 (store (arr!31998 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32536 a!3488)))))

(declare-fun b!1055975 () Bool)

(declare-fun e!600263 () Bool)

(assert (=> b!1055975 (= e!600263 (not true))))

(assert (=> b!1055975 e!600264))

(declare-fun res!704839 () Bool)

(assert (=> b!1055975 (=> (not res!704839) (not e!600264))))

(assert (=> b!1055975 (= res!704839 (= (select (store (arr!31998 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465835) k0!2747))))

(declare-fun b!1055976 () Bool)

(assert (=> b!1055976 (= e!600266 e!600263)))

(declare-fun res!704835 () Bool)

(assert (=> b!1055976 (=> (not res!704835) (not e!600263))))

(assert (=> b!1055976 (= res!704835 (not (= lt!465835 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66545 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055976 (= lt!465835 (arrayScanForKey!0 lt!465834 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055977 () Bool)

(assert (=> b!1055977 (= e!600265 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93106 res!704834) b!1055972))

(assert (= (and b!1055972 res!704832) b!1055970))

(assert (= (and b!1055970 res!704838) b!1055971))

(assert (= (and b!1055971 res!704836) b!1055974))

(assert (= (and b!1055974 res!704833) b!1055976))

(assert (= (and b!1055976 res!704835) b!1055975))

(assert (= (and b!1055975 res!704839) b!1055973))

(assert (= (and b!1055973 (not res!704837)) b!1055977))

(declare-fun m!975437 () Bool)

(assert (=> b!1055972 m!975437))

(declare-fun m!975439 () Bool)

(assert (=> b!1055971 m!975439))

(declare-fun m!975441 () Bool)

(assert (=> b!1055977 m!975441))

(declare-fun m!975443 () Bool)

(assert (=> b!1055976 m!975443))

(declare-fun m!975445 () Bool)

(assert (=> b!1055975 m!975445))

(declare-fun m!975447 () Bool)

(assert (=> b!1055975 m!975447))

(declare-fun m!975449 () Bool)

(assert (=> b!1055970 m!975449))

(declare-fun m!975451 () Bool)

(assert (=> b!1055974 m!975451))

(assert (=> b!1055974 m!975445))

(declare-fun m!975453 () Bool)

(assert (=> start!93106 m!975453))

(check-sat (not b!1055974) (not b!1055970) (not b!1055972) (not b!1055976) (not start!93106) (not b!1055977))
(check-sat)
