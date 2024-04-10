; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92492 () Bool)

(assert start!92492)

(declare-fun b!1051797 () Bool)

(declare-fun res!700927 () Bool)

(declare-fun e!597100 () Bool)

(assert (=> b!1051797 (=> (not res!700927) (not e!597100))))

(declare-datatypes ((array!66293 0))(
  ( (array!66294 (arr!31886 (Array (_ BitVec 32) (_ BitVec 64))) (size!32422 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66293)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051797 (= res!700927 (= (select (arr!31886 a!3488) i!1381) k0!2747))))

(declare-fun b!1051798 () Bool)

(declare-fun res!700933 () Bool)

(declare-fun e!597102 () Bool)

(assert (=> b!1051798 (=> res!700933 e!597102)))

(declare-datatypes ((List!22198 0))(
  ( (Nil!22195) (Cons!22194 (h!23403 (_ BitVec 64)) (t!31505 List!22198)) )
))
(declare-fun noDuplicate!1525 (List!22198) Bool)

(assert (=> b!1051798 (= res!700933 (not (noDuplicate!1525 Nil!22195)))))

(declare-fun b!1051799 () Bool)

(declare-fun e!597097 () Bool)

(declare-fun e!597096 () Bool)

(assert (=> b!1051799 (= e!597097 e!597096)))

(declare-fun res!700926 () Bool)

(assert (=> b!1051799 (=> res!700926 e!597096)))

(declare-fun lt!464442 () (_ BitVec 32))

(assert (=> b!1051799 (= res!700926 (or (bvsgt lt!464442 i!1381) (bvsle i!1381 lt!464442)))))

(declare-fun res!700924 () Bool)

(assert (=> start!92492 (=> (not res!700924) (not e!597100))))

(assert (=> start!92492 (= res!700924 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32422 a!3488)) (bvslt (size!32422 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92492 e!597100))

(assert (=> start!92492 true))

(declare-fun array_inv!24666 (array!66293) Bool)

(assert (=> start!92492 (array_inv!24666 a!3488)))

(declare-fun b!1051800 () Bool)

(declare-fun res!700928 () Bool)

(assert (=> b!1051800 (=> (not res!700928) (not e!597100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051800 (= res!700928 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051801 () Bool)

(declare-fun e!597101 () Bool)

(assert (=> b!1051801 (= e!597100 e!597101)))

(declare-fun res!700930 () Bool)

(assert (=> b!1051801 (=> (not res!700930) (not e!597101))))

(declare-fun lt!464440 () array!66293)

(declare-fun arrayContainsKey!0 (array!66293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051801 (= res!700930 (arrayContainsKey!0 lt!464440 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051801 (= lt!464440 (array!66294 (store (arr!31886 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32422 a!3488)))))

(declare-fun b!1051802 () Bool)

(declare-fun res!700929 () Bool)

(assert (=> b!1051802 (=> (not res!700929) (not e!597100))))

(declare-fun arrayNoDuplicates!0 (array!66293 (_ BitVec 32) List!22198) Bool)

(assert (=> b!1051802 (= res!700929 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22195))))

(declare-fun b!1051803 () Bool)

(assert (=> b!1051803 (= e!597096 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051804 () Bool)

(assert (=> b!1051804 (= e!597102 true)))

(declare-fun lt!464438 () Bool)

(declare-fun contains!6140 (List!22198 (_ BitVec 64)) Bool)

(assert (=> b!1051804 (= lt!464438 (contains!6140 Nil!22195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051805 () Bool)

(declare-fun e!597103 () Bool)

(declare-fun e!597099 () Bool)

(assert (=> b!1051805 (= e!597103 (not e!597099))))

(declare-fun res!700925 () Bool)

(assert (=> b!1051805 (=> res!700925 e!597099)))

(assert (=> b!1051805 (= res!700925 (or (bvsgt lt!464442 i!1381) (bvsle i!1381 lt!464442)))))

(assert (=> b!1051805 e!597097))

(declare-fun res!700932 () Bool)

(assert (=> b!1051805 (=> (not res!700932) (not e!597097))))

(assert (=> b!1051805 (= res!700932 (= (select (store (arr!31886 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464442) k0!2747))))

(declare-fun b!1051806 () Bool)

(declare-fun res!700934 () Bool)

(assert (=> b!1051806 (=> res!700934 e!597102)))

(assert (=> b!1051806 (= res!700934 (contains!6140 Nil!22195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051807 () Bool)

(assert (=> b!1051807 (= e!597099 e!597102)))

(declare-fun res!700931 () Bool)

(assert (=> b!1051807 (=> res!700931 e!597102)))

(declare-fun lt!464437 () (_ BitVec 32))

(assert (=> b!1051807 (= res!700931 (or (bvslt lt!464442 #b00000000000000000000000000000000) (bvsge lt!464437 (size!32422 a!3488)) (bvsge lt!464442 (size!32422 a!3488))))))

(assert (=> b!1051807 (arrayContainsKey!0 a!3488 k0!2747 lt!464437)))

(declare-datatypes ((Unit!34444 0))(
  ( (Unit!34445) )
))
(declare-fun lt!464441 () Unit!34444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34444)

(assert (=> b!1051807 (= lt!464441 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464437))))

(assert (=> b!1051807 (= lt!464437 (bvadd #b00000000000000000000000000000001 lt!464442))))

(assert (=> b!1051807 (arrayNoDuplicates!0 a!3488 lt!464442 Nil!22195)))

(declare-fun lt!464439 () Unit!34444)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66293 (_ BitVec 32) (_ BitVec 32)) Unit!34444)

(assert (=> b!1051807 (= lt!464439 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464442))))

(declare-fun b!1051808 () Bool)

(assert (=> b!1051808 (= e!597101 e!597103)))

(declare-fun res!700923 () Bool)

(assert (=> b!1051808 (=> (not res!700923) (not e!597103))))

(assert (=> b!1051808 (= res!700923 (not (= lt!464442 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66293 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051808 (= lt!464442 (arrayScanForKey!0 lt!464440 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92492 res!700924) b!1051802))

(assert (= (and b!1051802 res!700929) b!1051800))

(assert (= (and b!1051800 res!700928) b!1051797))

(assert (= (and b!1051797 res!700927) b!1051801))

(assert (= (and b!1051801 res!700930) b!1051808))

(assert (= (and b!1051808 res!700923) b!1051805))

(assert (= (and b!1051805 res!700932) b!1051799))

(assert (= (and b!1051799 (not res!700926)) b!1051803))

(assert (= (and b!1051805 (not res!700925)) b!1051807))

(assert (= (and b!1051807 (not res!700931)) b!1051798))

(assert (= (and b!1051798 (not res!700933)) b!1051806))

(assert (= (and b!1051806 (not res!700934)) b!1051804))

(declare-fun m!972247 () Bool)

(assert (=> b!1051800 m!972247))

(declare-fun m!972249 () Bool)

(assert (=> start!92492 m!972249))

(declare-fun m!972251 () Bool)

(assert (=> b!1051798 m!972251))

(declare-fun m!972253 () Bool)

(assert (=> b!1051806 m!972253))

(declare-fun m!972255 () Bool)

(assert (=> b!1051805 m!972255))

(declare-fun m!972257 () Bool)

(assert (=> b!1051805 m!972257))

(declare-fun m!972259 () Bool)

(assert (=> b!1051804 m!972259))

(declare-fun m!972261 () Bool)

(assert (=> b!1051801 m!972261))

(assert (=> b!1051801 m!972255))

(declare-fun m!972263 () Bool)

(assert (=> b!1051808 m!972263))

(declare-fun m!972265 () Bool)

(assert (=> b!1051797 m!972265))

(declare-fun m!972267 () Bool)

(assert (=> b!1051807 m!972267))

(declare-fun m!972269 () Bool)

(assert (=> b!1051807 m!972269))

(declare-fun m!972271 () Bool)

(assert (=> b!1051807 m!972271))

(declare-fun m!972273 () Bool)

(assert (=> b!1051807 m!972273))

(declare-fun m!972275 () Bool)

(assert (=> b!1051803 m!972275))

(declare-fun m!972277 () Bool)

(assert (=> b!1051802 m!972277))

(check-sat (not start!92492) (not b!1051807) (not b!1051808) (not b!1051801) (not b!1051803) (not b!1051806) (not b!1051802) (not b!1051798) (not b!1051800) (not b!1051804))
(check-sat)
