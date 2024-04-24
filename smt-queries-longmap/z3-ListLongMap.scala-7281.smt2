; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93282 () Bool)

(assert start!93282)

(declare-fun b!1056943 () Bool)

(declare-fun res!704956 () Bool)

(declare-fun e!600828 () Bool)

(assert (=> b!1056943 (=> (not res!704956) (not e!600828))))

(declare-datatypes ((array!66622 0))(
  ( (array!66623 (arr!32032 (Array (_ BitVec 32) (_ BitVec 64))) (size!32569 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66622)

(declare-datatypes ((List!22314 0))(
  ( (Nil!22311) (Cons!22310 (h!23528 (_ BitVec 64)) (t!31613 List!22314)) )
))
(declare-fun arrayNoDuplicates!0 (array!66622 (_ BitVec 32) List!22314) Bool)

(assert (=> b!1056943 (= res!704956 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22311))))

(declare-fun b!1056944 () Bool)

(declare-fun e!600825 () Bool)

(assert (=> b!1056944 (= e!600825 true)))

(declare-fun lt!466352 () Bool)

(declare-fun contains!6211 (List!22314 (_ BitVec 64)) Bool)

(assert (=> b!1056944 (= lt!466352 (contains!6211 Nil!22311 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056945 () Bool)

(declare-fun e!600827 () Bool)

(assert (=> b!1056945 (= e!600827 e!600825)))

(declare-fun res!704955 () Bool)

(assert (=> b!1056945 (=> res!704955 e!600825)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056945 (= res!704955 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32569 a!3488)))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056945 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34591 0))(
  ( (Unit!34592) )
))
(declare-fun lt!466351 () Unit!34591)

(declare-fun lt!466348 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34591)

(assert (=> b!1056945 (= lt!466351 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466348 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1056945 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22311)))

(declare-fun lt!466349 () Unit!34591)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66622 (_ BitVec 32) (_ BitVec 32)) Unit!34591)

(assert (=> b!1056945 (= lt!466349 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056946 () Bool)

(declare-fun res!704957 () Bool)

(assert (=> b!1056946 (=> res!704957 e!600825)))

(declare-fun noDuplicate!1570 (List!22314) Bool)

(assert (=> b!1056946 (= res!704957 (not (noDuplicate!1570 Nil!22311)))))

(declare-fun b!1056947 () Bool)

(declare-fun e!600829 () Bool)

(declare-fun e!600832 () Bool)

(assert (=> b!1056947 (= e!600829 e!600832)))

(declare-fun res!704958 () Bool)

(assert (=> b!1056947 (=> (not res!704958) (not e!600832))))

(assert (=> b!1056947 (= res!704958 (not (= lt!466348 i!1381)))))

(declare-fun lt!466350 () array!66622)

(declare-fun arrayScanForKey!0 (array!66622 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056947 (= lt!466348 (arrayScanForKey!0 lt!466350 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056948 () Bool)

(assert (=> b!1056948 (= e!600828 e!600829)))

(declare-fun res!704954 () Bool)

(assert (=> b!1056948 (=> (not res!704954) (not e!600829))))

(assert (=> b!1056948 (= res!704954 (arrayContainsKey!0 lt!466350 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056948 (= lt!466350 (array!66623 (store (arr!32032 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32569 a!3488)))))

(declare-fun b!1056949 () Bool)

(declare-fun res!704953 () Bool)

(assert (=> b!1056949 (=> (not res!704953) (not e!600828))))

(assert (=> b!1056949 (= res!704953 (= (select (arr!32032 a!3488) i!1381) k0!2747))))

(declare-fun res!704960 () Bool)

(assert (=> start!93282 (=> (not res!704960) (not e!600828))))

(assert (=> start!93282 (= res!704960 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32569 a!3488)) (bvslt (size!32569 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93282 e!600828))

(assert (=> start!93282 true))

(declare-fun array_inv!24814 (array!66622) Bool)

(assert (=> start!93282 (array_inv!24814 a!3488)))

(declare-fun b!1056950 () Bool)

(declare-fun res!704961 () Bool)

(assert (=> b!1056950 (=> (not res!704961) (not e!600828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056950 (= res!704961 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056951 () Bool)

(declare-fun e!600831 () Bool)

(declare-fun e!600830 () Bool)

(assert (=> b!1056951 (= e!600831 e!600830)))

(declare-fun res!704952 () Bool)

(assert (=> b!1056951 (=> res!704952 e!600830)))

(assert (=> b!1056951 (= res!704952 (bvsle lt!466348 i!1381))))

(declare-fun b!1056952 () Bool)

(declare-fun res!704963 () Bool)

(assert (=> b!1056952 (=> res!704963 e!600825)))

(assert (=> b!1056952 (= res!704963 (contains!6211 Nil!22311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056953 () Bool)

(assert (=> b!1056953 (= e!600830 (arrayContainsKey!0 a!3488 k0!2747 lt!466348))))

(declare-fun b!1056954 () Bool)

(assert (=> b!1056954 (= e!600832 (not e!600827))))

(declare-fun res!704962 () Bool)

(assert (=> b!1056954 (=> res!704962 e!600827)))

(assert (=> b!1056954 (= res!704962 (bvsle lt!466348 i!1381))))

(assert (=> b!1056954 e!600831))

(declare-fun res!704959 () Bool)

(assert (=> b!1056954 (=> (not res!704959) (not e!600831))))

(assert (=> b!1056954 (= res!704959 (= (select (store (arr!32032 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466348) k0!2747))))

(assert (= (and start!93282 res!704960) b!1056943))

(assert (= (and b!1056943 res!704956) b!1056950))

(assert (= (and b!1056950 res!704961) b!1056949))

(assert (= (and b!1056949 res!704953) b!1056948))

(assert (= (and b!1056948 res!704954) b!1056947))

(assert (= (and b!1056947 res!704958) b!1056954))

(assert (= (and b!1056954 res!704959) b!1056951))

(assert (= (and b!1056951 (not res!704952)) b!1056953))

(assert (= (and b!1056954 (not res!704962)) b!1056945))

(assert (= (and b!1056945 (not res!704955)) b!1056946))

(assert (= (and b!1056946 (not res!704957)) b!1056952))

(assert (= (and b!1056952 (not res!704963)) b!1056944))

(declare-fun m!977273 () Bool)

(assert (=> b!1056944 m!977273))

(declare-fun m!977275 () Bool)

(assert (=> start!93282 m!977275))

(declare-fun m!977277 () Bool)

(assert (=> b!1056949 m!977277))

(declare-fun m!977279 () Bool)

(assert (=> b!1056952 m!977279))

(declare-fun m!977281 () Bool)

(assert (=> b!1056945 m!977281))

(declare-fun m!977283 () Bool)

(assert (=> b!1056945 m!977283))

(declare-fun m!977285 () Bool)

(assert (=> b!1056945 m!977285))

(declare-fun m!977287 () Bool)

(assert (=> b!1056945 m!977287))

(declare-fun m!977289 () Bool)

(assert (=> b!1056950 m!977289))

(declare-fun m!977291 () Bool)

(assert (=> b!1056947 m!977291))

(declare-fun m!977293 () Bool)

(assert (=> b!1056953 m!977293))

(declare-fun m!977295 () Bool)

(assert (=> b!1056946 m!977295))

(declare-fun m!977297 () Bool)

(assert (=> b!1056954 m!977297))

(declare-fun m!977299 () Bool)

(assert (=> b!1056954 m!977299))

(declare-fun m!977301 () Bool)

(assert (=> b!1056943 m!977301))

(declare-fun m!977303 () Bool)

(assert (=> b!1056948 m!977303))

(assert (=> b!1056948 m!977297))

(check-sat (not b!1056950) (not b!1056944) (not b!1056953) (not b!1056948) (not b!1056952) (not start!93282) (not b!1056947) (not b!1056945) (not b!1056946) (not b!1056943))
(check-sat)
