; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92498 () Bool)

(assert start!92498)

(declare-fun b!1051905 () Bool)

(declare-fun res!701037 () Bool)

(declare-fun e!597172 () Bool)

(assert (=> b!1051905 (=> (not res!701037) (not e!597172))))

(declare-datatypes ((array!66299 0))(
  ( (array!66300 (arr!31889 (Array (_ BitVec 32) (_ BitVec 64))) (size!32425 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66299)

(declare-datatypes ((List!22201 0))(
  ( (Nil!22198) (Cons!22197 (h!23406 (_ BitVec 64)) (t!31508 List!22201)) )
))
(declare-fun arrayNoDuplicates!0 (array!66299 (_ BitVec 32) List!22201) Bool)

(assert (=> b!1051905 (= res!701037 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22198))))

(declare-fun b!1051906 () Bool)

(declare-fun res!701033 () Bool)

(declare-fun e!597170 () Bool)

(assert (=> b!1051906 (=> res!701033 e!597170)))

(declare-fun noDuplicate!1528 (List!22201) Bool)

(assert (=> b!1051906 (= res!701033 (not (noDuplicate!1528 Nil!22198)))))

(declare-fun b!1051907 () Bool)

(declare-fun res!701038 () Bool)

(assert (=> b!1051907 (=> (not res!701038) (not e!597172))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051907 (= res!701038 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051908 () Bool)

(declare-fun e!597171 () Bool)

(assert (=> b!1051908 (= e!597171 e!597170)))

(declare-fun res!701042 () Bool)

(assert (=> b!1051908 (=> res!701042 e!597170)))

(declare-fun lt!464491 () (_ BitVec 32))

(declare-fun lt!464496 () (_ BitVec 32))

(assert (=> b!1051908 (= res!701042 (or (bvslt lt!464496 #b00000000000000000000000000000000) (bvsge lt!464491 (size!32425 a!3488)) (bvsge lt!464496 (size!32425 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051908 (arrayContainsKey!0 a!3488 k0!2747 lt!464491)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34450 0))(
  ( (Unit!34451) )
))
(declare-fun lt!464495 () Unit!34450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34450)

(assert (=> b!1051908 (= lt!464495 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464491))))

(assert (=> b!1051908 (= lt!464491 (bvadd #b00000000000000000000000000000001 lt!464496))))

(assert (=> b!1051908 (arrayNoDuplicates!0 a!3488 lt!464496 Nil!22198)))

(declare-fun lt!464493 () Unit!34450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66299 (_ BitVec 32) (_ BitVec 32)) Unit!34450)

(assert (=> b!1051908 (= lt!464493 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464496))))

(declare-fun b!1051909 () Bool)

(declare-fun e!597174 () Bool)

(assert (=> b!1051909 (= e!597174 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051910 () Bool)

(declare-fun res!701039 () Bool)

(assert (=> b!1051910 (=> res!701039 e!597170)))

(declare-fun contains!6143 (List!22201 (_ BitVec 64)) Bool)

(assert (=> b!1051910 (= res!701039 (contains!6143 Nil!22198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051911 () Bool)

(declare-fun e!597173 () Bool)

(assert (=> b!1051911 (= e!597173 (not e!597171))))

(declare-fun res!701040 () Bool)

(assert (=> b!1051911 (=> res!701040 e!597171)))

(assert (=> b!1051911 (= res!701040 (or (bvsgt lt!464496 i!1381) (bvsle i!1381 lt!464496)))))

(declare-fun e!597168 () Bool)

(assert (=> b!1051911 e!597168))

(declare-fun res!701032 () Bool)

(assert (=> b!1051911 (=> (not res!701032) (not e!597168))))

(assert (=> b!1051911 (= res!701032 (= (select (store (arr!31889 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464496) k0!2747))))

(declare-fun b!1051912 () Bool)

(assert (=> b!1051912 (= e!597168 e!597174)))

(declare-fun res!701041 () Bool)

(assert (=> b!1051912 (=> res!701041 e!597174)))

(assert (=> b!1051912 (= res!701041 (or (bvsgt lt!464496 i!1381) (bvsle i!1381 lt!464496)))))

(declare-fun b!1051913 () Bool)

(declare-fun res!701035 () Bool)

(assert (=> b!1051913 (=> (not res!701035) (not e!597172))))

(assert (=> b!1051913 (= res!701035 (= (select (arr!31889 a!3488) i!1381) k0!2747))))

(declare-fun res!701036 () Bool)

(assert (=> start!92498 (=> (not res!701036) (not e!597172))))

(assert (=> start!92498 (= res!701036 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32425 a!3488)) (bvslt (size!32425 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92498 e!597172))

(assert (=> start!92498 true))

(declare-fun array_inv!24669 (array!66299) Bool)

(assert (=> start!92498 (array_inv!24669 a!3488)))

(declare-fun b!1051914 () Bool)

(declare-fun e!597169 () Bool)

(assert (=> b!1051914 (= e!597172 e!597169)))

(declare-fun res!701031 () Bool)

(assert (=> b!1051914 (=> (not res!701031) (not e!597169))))

(declare-fun lt!464494 () array!66299)

(assert (=> b!1051914 (= res!701031 (arrayContainsKey!0 lt!464494 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051914 (= lt!464494 (array!66300 (store (arr!31889 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32425 a!3488)))))

(declare-fun b!1051915 () Bool)

(assert (=> b!1051915 (= e!597169 e!597173)))

(declare-fun res!701034 () Bool)

(assert (=> b!1051915 (=> (not res!701034) (not e!597173))))

(assert (=> b!1051915 (= res!701034 (not (= lt!464496 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66299 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051915 (= lt!464496 (arrayScanForKey!0 lt!464494 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051916 () Bool)

(assert (=> b!1051916 (= e!597170 true)))

(declare-fun lt!464492 () Bool)

(assert (=> b!1051916 (= lt!464492 (contains!6143 Nil!22198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92498 res!701036) b!1051905))

(assert (= (and b!1051905 res!701037) b!1051907))

(assert (= (and b!1051907 res!701038) b!1051913))

(assert (= (and b!1051913 res!701035) b!1051914))

(assert (= (and b!1051914 res!701031) b!1051915))

(assert (= (and b!1051915 res!701034) b!1051911))

(assert (= (and b!1051911 res!701032) b!1051912))

(assert (= (and b!1051912 (not res!701041)) b!1051909))

(assert (= (and b!1051911 (not res!701040)) b!1051908))

(assert (= (and b!1051908 (not res!701042)) b!1051906))

(assert (= (and b!1051906 (not res!701033)) b!1051910))

(assert (= (and b!1051910 (not res!701039)) b!1051916))

(declare-fun m!972343 () Bool)

(assert (=> b!1051910 m!972343))

(declare-fun m!972345 () Bool)

(assert (=> b!1051916 m!972345))

(declare-fun m!972347 () Bool)

(assert (=> b!1051907 m!972347))

(declare-fun m!972349 () Bool)

(assert (=> b!1051915 m!972349))

(declare-fun m!972351 () Bool)

(assert (=> b!1051908 m!972351))

(declare-fun m!972353 () Bool)

(assert (=> b!1051908 m!972353))

(declare-fun m!972355 () Bool)

(assert (=> b!1051908 m!972355))

(declare-fun m!972357 () Bool)

(assert (=> b!1051908 m!972357))

(declare-fun m!972359 () Bool)

(assert (=> b!1051905 m!972359))

(declare-fun m!972361 () Bool)

(assert (=> b!1051914 m!972361))

(declare-fun m!972363 () Bool)

(assert (=> b!1051914 m!972363))

(declare-fun m!972365 () Bool)

(assert (=> b!1051913 m!972365))

(declare-fun m!972367 () Bool)

(assert (=> b!1051906 m!972367))

(assert (=> b!1051911 m!972363))

(declare-fun m!972369 () Bool)

(assert (=> b!1051911 m!972369))

(declare-fun m!972371 () Bool)

(assert (=> start!92498 m!972371))

(declare-fun m!972373 () Bool)

(assert (=> b!1051909 m!972373))

(check-sat (not b!1051905) (not b!1051915) (not b!1051906) (not b!1051907) (not b!1051916) (not b!1051910) (not b!1051909) (not start!92498) (not b!1051914) (not b!1051908))
(check-sat)
