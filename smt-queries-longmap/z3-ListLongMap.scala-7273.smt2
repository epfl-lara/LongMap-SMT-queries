; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92854 () Bool)

(assert start!92854)

(declare-fun b!1054376 () Bool)

(declare-fun res!703408 () Bool)

(declare-fun e!599032 () Bool)

(assert (=> b!1054376 (=> (not res!703408) (not e!599032))))

(declare-datatypes ((array!66455 0))(
  ( (array!66456 (arr!31959 (Array (_ BitVec 32) (_ BitVec 64))) (size!32497 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66455)

(declare-datatypes ((List!22330 0))(
  ( (Nil!22327) (Cons!22326 (h!23535 (_ BitVec 64)) (t!31628 List!22330)) )
))
(declare-fun arrayNoDuplicates!0 (array!66455 (_ BitVec 32) List!22330) Bool)

(assert (=> b!1054376 (= res!703408 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22327))))

(declare-fun b!1054377 () Bool)

(declare-fun e!599030 () Bool)

(declare-fun e!599034 () Bool)

(assert (=> b!1054377 (= e!599030 e!599034)))

(declare-fun res!703403 () Bool)

(assert (=> b!1054377 (=> res!703403 e!599034)))

(declare-fun lt!465241 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054377 (= res!703403 (bvsle lt!465241 i!1381))))

(declare-fun b!1054378 () Bool)

(declare-fun e!599029 () Bool)

(assert (=> b!1054378 (= e!599029 true)))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054378 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34409 0))(
  ( (Unit!34410) )
))
(declare-fun lt!465243 () Unit!34409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34409)

(assert (=> b!1054378 (= lt!465243 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465241 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054378 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22327)))

(declare-fun lt!465242 () Unit!34409)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66455 (_ BitVec 32) (_ BitVec 32)) Unit!34409)

(assert (=> b!1054378 (= lt!465242 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!703402 () Bool)

(assert (=> start!92854 (=> (not res!703402) (not e!599032))))

(assert (=> start!92854 (= res!703402 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32497 a!3488)) (bvslt (size!32497 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92854 e!599032))

(assert (=> start!92854 true))

(declare-fun array_inv!24742 (array!66455) Bool)

(assert (=> start!92854 (array_inv!24742 a!3488)))

(declare-fun b!1054379 () Bool)

(declare-fun res!703401 () Bool)

(assert (=> b!1054379 (=> (not res!703401) (not e!599032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054379 (= res!703401 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054380 () Bool)

(declare-fun e!599028 () Bool)

(assert (=> b!1054380 (= e!599032 e!599028)))

(declare-fun res!703404 () Bool)

(assert (=> b!1054380 (=> (not res!703404) (not e!599028))))

(declare-fun lt!465244 () array!66455)

(assert (=> b!1054380 (= res!703404 (arrayContainsKey!0 lt!465244 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054380 (= lt!465244 (array!66456 (store (arr!31959 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32497 a!3488)))))

(declare-fun b!1054381 () Bool)

(assert (=> b!1054381 (= e!599034 (arrayContainsKey!0 a!3488 k0!2747 lt!465241))))

(declare-fun b!1054382 () Bool)

(declare-fun res!703400 () Bool)

(assert (=> b!1054382 (=> (not res!703400) (not e!599032))))

(assert (=> b!1054382 (= res!703400 (= (select (arr!31959 a!3488) i!1381) k0!2747))))

(declare-fun b!1054383 () Bool)

(declare-fun e!599033 () Bool)

(assert (=> b!1054383 (= e!599033 (not e!599029))))

(declare-fun res!703407 () Bool)

(assert (=> b!1054383 (=> res!703407 e!599029)))

(assert (=> b!1054383 (= res!703407 (bvsle lt!465241 i!1381))))

(assert (=> b!1054383 e!599030))

(declare-fun res!703406 () Bool)

(assert (=> b!1054383 (=> (not res!703406) (not e!599030))))

(assert (=> b!1054383 (= res!703406 (= (select (store (arr!31959 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465241) k0!2747))))

(declare-fun b!1054384 () Bool)

(assert (=> b!1054384 (= e!599028 e!599033)))

(declare-fun res!703405 () Bool)

(assert (=> b!1054384 (=> (not res!703405) (not e!599033))))

(assert (=> b!1054384 (= res!703405 (not (= lt!465241 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66455 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054384 (= lt!465241 (arrayScanForKey!0 lt!465244 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92854 res!703402) b!1054376))

(assert (= (and b!1054376 res!703408) b!1054379))

(assert (= (and b!1054379 res!703401) b!1054382))

(assert (= (and b!1054382 res!703400) b!1054380))

(assert (= (and b!1054380 res!703404) b!1054384))

(assert (= (and b!1054384 res!703405) b!1054383))

(assert (= (and b!1054383 res!703406) b!1054377))

(assert (= (and b!1054377 (not res!703403)) b!1054381))

(assert (= (and b!1054383 (not res!703407)) b!1054378))

(declare-fun m!973963 () Bool)

(assert (=> b!1054384 m!973963))

(declare-fun m!973965 () Bool)

(assert (=> b!1054380 m!973965))

(declare-fun m!973967 () Bool)

(assert (=> b!1054380 m!973967))

(declare-fun m!973969 () Bool)

(assert (=> b!1054376 m!973969))

(declare-fun m!973971 () Bool)

(assert (=> b!1054378 m!973971))

(declare-fun m!973973 () Bool)

(assert (=> b!1054378 m!973973))

(declare-fun m!973975 () Bool)

(assert (=> b!1054378 m!973975))

(declare-fun m!973977 () Bool)

(assert (=> b!1054378 m!973977))

(declare-fun m!973979 () Bool)

(assert (=> start!92854 m!973979))

(assert (=> b!1054383 m!973967))

(declare-fun m!973981 () Bool)

(assert (=> b!1054383 m!973981))

(declare-fun m!973983 () Bool)

(assert (=> b!1054381 m!973983))

(declare-fun m!973985 () Bool)

(assert (=> b!1054379 m!973985))

(declare-fun m!973987 () Bool)

(assert (=> b!1054382 m!973987))

(check-sat (not b!1054381) (not start!92854) (not b!1054384) (not b!1054380) (not b!1054378) (not b!1054376) (not b!1054379))
(check-sat)
