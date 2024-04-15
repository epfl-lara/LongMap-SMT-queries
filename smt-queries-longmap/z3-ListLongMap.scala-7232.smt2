; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92452 () Bool)

(assert start!92452)

(declare-fun b!1051064 () Bool)

(declare-fun res!700274 () Bool)

(declare-fun e!596586 () Bool)

(assert (=> b!1051064 (=> (not res!700274) (not e!596586))))

(declare-datatypes ((array!66194 0))(
  ( (array!66195 (arr!31836 (Array (_ BitVec 32) (_ BitVec 64))) (size!32374 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66194)

(declare-datatypes ((List!22207 0))(
  ( (Nil!22204) (Cons!22203 (h!23412 (_ BitVec 64)) (t!31505 List!22207)) )
))
(declare-fun arrayNoDuplicates!0 (array!66194 (_ BitVec 32) List!22207) Bool)

(assert (=> b!1051064 (= res!700274 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22204))))

(declare-fun b!1051065 () Bool)

(declare-fun res!700276 () Bool)

(assert (=> b!1051065 (=> (not res!700276) (not e!596586))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051065 (= res!700276 (= (select (arr!31836 a!3488) i!1381) k0!2747))))

(declare-fun b!1051066 () Bool)

(declare-fun e!596585 () Bool)

(declare-fun e!596584 () Bool)

(assert (=> b!1051066 (= e!596585 (not e!596584))))

(declare-fun res!700277 () Bool)

(assert (=> b!1051066 (=> res!700277 e!596584)))

(declare-fun lt!463998 () (_ BitVec 32))

(assert (=> b!1051066 (= res!700277 (or (bvsgt lt!463998 i!1381) (bvsle i!1381 lt!463998)))))

(declare-fun e!596588 () Bool)

(assert (=> b!1051066 e!596588))

(declare-fun res!700281 () Bool)

(assert (=> b!1051066 (=> (not res!700281) (not e!596588))))

(assert (=> b!1051066 (= res!700281 (= (select (store (arr!31836 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463998) k0!2747))))

(declare-fun b!1051067 () Bool)

(declare-fun e!596589 () Bool)

(assert (=> b!1051067 (= e!596586 e!596589)))

(declare-fun res!700282 () Bool)

(assert (=> b!1051067 (=> (not res!700282) (not e!596589))))

(declare-fun lt!463999 () array!66194)

(declare-fun arrayContainsKey!0 (array!66194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051067 (= res!700282 (arrayContainsKey!0 lt!463999 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051067 (= lt!463999 (array!66195 (store (arr!31836 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32374 a!3488)))))

(declare-fun b!1051068 () Bool)

(declare-fun res!700280 () Bool)

(assert (=> b!1051068 (=> (not res!700280) (not e!596586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051068 (= res!700280 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051069 () Bool)

(declare-fun e!596583 () Bool)

(assert (=> b!1051069 (= e!596588 e!596583)))

(declare-fun res!700279 () Bool)

(assert (=> b!1051069 (=> res!700279 e!596583)))

(assert (=> b!1051069 (= res!700279 (or (bvsgt lt!463998 i!1381) (bvsle i!1381 lt!463998)))))

(declare-fun res!700275 () Bool)

(assert (=> start!92452 (=> (not res!700275) (not e!596586))))

(assert (=> start!92452 (= res!700275 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32374 a!3488)) (bvslt (size!32374 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92452 e!596586))

(assert (=> start!92452 true))

(declare-fun array_inv!24619 (array!66194) Bool)

(assert (=> start!92452 (array_inv!24619 a!3488)))

(declare-fun b!1051070 () Bool)

(assert (=> b!1051070 (= e!596584 true)))

(assert (=> b!1051070 (arrayNoDuplicates!0 a!3488 lt!463998 Nil!22204)))

(declare-datatypes ((Unit!34277 0))(
  ( (Unit!34278) )
))
(declare-fun lt!463997 () Unit!34277)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66194 (_ BitVec 32) (_ BitVec 32)) Unit!34277)

(assert (=> b!1051070 (= lt!463997 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!463998))))

(declare-fun b!1051071 () Bool)

(assert (=> b!1051071 (= e!596583 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051072 () Bool)

(assert (=> b!1051072 (= e!596589 e!596585)))

(declare-fun res!700278 () Bool)

(assert (=> b!1051072 (=> (not res!700278) (not e!596585))))

(assert (=> b!1051072 (= res!700278 (not (= lt!463998 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66194 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051072 (= lt!463998 (arrayScanForKey!0 lt!463999 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92452 res!700275) b!1051064))

(assert (= (and b!1051064 res!700274) b!1051068))

(assert (= (and b!1051068 res!700280) b!1051065))

(assert (= (and b!1051065 res!700276) b!1051067))

(assert (= (and b!1051067 res!700282) b!1051072))

(assert (= (and b!1051072 res!700278) b!1051066))

(assert (= (and b!1051066 res!700281) b!1051069))

(assert (= (and b!1051069 (not res!700279)) b!1051071))

(assert (= (and b!1051066 (not res!700277)) b!1051070))

(declare-fun m!971143 () Bool)

(assert (=> b!1051070 m!971143))

(declare-fun m!971145 () Bool)

(assert (=> b!1051070 m!971145))

(declare-fun m!971147 () Bool)

(assert (=> b!1051067 m!971147))

(declare-fun m!971149 () Bool)

(assert (=> b!1051067 m!971149))

(declare-fun m!971151 () Bool)

(assert (=> b!1051071 m!971151))

(declare-fun m!971153 () Bool)

(assert (=> b!1051065 m!971153))

(declare-fun m!971155 () Bool)

(assert (=> b!1051068 m!971155))

(assert (=> b!1051066 m!971149))

(declare-fun m!971157 () Bool)

(assert (=> b!1051066 m!971157))

(declare-fun m!971159 () Bool)

(assert (=> b!1051072 m!971159))

(declare-fun m!971161 () Bool)

(assert (=> start!92452 m!971161))

(declare-fun m!971163 () Bool)

(assert (=> b!1051064 m!971163))

(check-sat (not b!1051070) (not b!1051071) (not b!1051067) (not b!1051064) (not start!92452) (not b!1051068) (not b!1051072))
(check-sat)
