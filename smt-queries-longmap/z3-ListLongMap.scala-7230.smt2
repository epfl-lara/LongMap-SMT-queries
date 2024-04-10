; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92444 () Bool)

(assert start!92444)

(declare-fun b!1051080 () Bool)

(declare-fun e!596573 () Bool)

(assert (=> b!1051080 (= e!596573 true)))

(declare-datatypes ((array!66245 0))(
  ( (array!66246 (arr!31862 (Array (_ BitVec 32) (_ BitVec 64))) (size!32398 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66245)

(declare-fun lt!464154 () (_ BitVec 32))

(declare-datatypes ((List!22174 0))(
  ( (Nil!22171) (Cons!22170 (h!23379 (_ BitVec 64)) (t!31481 List!22174)) )
))
(declare-fun arrayNoDuplicates!0 (array!66245 (_ BitVec 32) List!22174) Bool)

(assert (=> b!1051080 (arrayNoDuplicates!0 a!3488 lt!464154 Nil!22171)))

(declare-datatypes ((Unit!34396 0))(
  ( (Unit!34397) )
))
(declare-fun lt!464153 () Unit!34396)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66245 (_ BitVec 32) (_ BitVec 32)) Unit!34396)

(assert (=> b!1051080 (= lt!464153 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464154))))

(declare-fun b!1051081 () Bool)

(declare-fun e!596575 () Bool)

(declare-fun e!596572 () Bool)

(assert (=> b!1051081 (= e!596575 e!596572)))

(declare-fun res!700208 () Bool)

(assert (=> b!1051081 (=> (not res!700208) (not e!596572))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051081 (= res!700208 (not (= lt!464154 i!1381)))))

(declare-fun lt!464152 () array!66245)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66245 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051081 (= lt!464154 (arrayScanForKey!0 lt!464152 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051082 () Bool)

(declare-fun res!700212 () Bool)

(declare-fun e!596574 () Bool)

(assert (=> b!1051082 (=> (not res!700212) (not e!596574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051082 (= res!700212 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051083 () Bool)

(declare-fun e!596570 () Bool)

(declare-fun e!596569 () Bool)

(assert (=> b!1051083 (= e!596570 e!596569)))

(declare-fun res!700207 () Bool)

(assert (=> b!1051083 (=> res!700207 e!596569)))

(assert (=> b!1051083 (= res!700207 (or (bvsgt lt!464154 i!1381) (bvsle i!1381 lt!464154)))))

(declare-fun b!1051084 () Bool)

(assert (=> b!1051084 (= e!596572 (not e!596573))))

(declare-fun res!700206 () Bool)

(assert (=> b!1051084 (=> res!700206 e!596573)))

(assert (=> b!1051084 (= res!700206 (or (bvsgt lt!464154 i!1381) (bvsle i!1381 lt!464154)))))

(assert (=> b!1051084 e!596570))

(declare-fun res!700209 () Bool)

(assert (=> b!1051084 (=> (not res!700209) (not e!596570))))

(assert (=> b!1051084 (= res!700209 (= (select (store (arr!31862 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464154) k0!2747))))

(declare-fun b!1051085 () Bool)

(assert (=> b!1051085 (= e!596574 e!596575)))

(declare-fun res!700213 () Bool)

(assert (=> b!1051085 (=> (not res!700213) (not e!596575))))

(declare-fun arrayContainsKey!0 (array!66245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051085 (= res!700213 (arrayContainsKey!0 lt!464152 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051085 (= lt!464152 (array!66246 (store (arr!31862 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32398 a!3488)))))

(declare-fun res!700214 () Bool)

(assert (=> start!92444 (=> (not res!700214) (not e!596574))))

(assert (=> start!92444 (= res!700214 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32398 a!3488)) (bvslt (size!32398 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92444 e!596574))

(assert (=> start!92444 true))

(declare-fun array_inv!24642 (array!66245) Bool)

(assert (=> start!92444 (array_inv!24642 a!3488)))

(declare-fun b!1051086 () Bool)

(declare-fun res!700211 () Bool)

(assert (=> b!1051086 (=> (not res!700211) (not e!596574))))

(assert (=> b!1051086 (= res!700211 (= (select (arr!31862 a!3488) i!1381) k0!2747))))

(declare-fun b!1051087 () Bool)

(declare-fun res!700210 () Bool)

(assert (=> b!1051087 (=> (not res!700210) (not e!596574))))

(assert (=> b!1051087 (= res!700210 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22171))))

(declare-fun b!1051088 () Bool)

(assert (=> b!1051088 (= e!596569 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92444 res!700214) b!1051087))

(assert (= (and b!1051087 res!700210) b!1051082))

(assert (= (and b!1051082 res!700212) b!1051086))

(assert (= (and b!1051086 res!700211) b!1051085))

(assert (= (and b!1051085 res!700213) b!1051081))

(assert (= (and b!1051081 res!700208) b!1051084))

(assert (= (and b!1051084 res!700209) b!1051083))

(assert (= (and b!1051083 (not res!700207)) b!1051088))

(assert (= (and b!1051084 (not res!700206)) b!1051080))

(declare-fun m!971649 () Bool)

(assert (=> start!92444 m!971649))

(declare-fun m!971651 () Bool)

(assert (=> b!1051082 m!971651))

(declare-fun m!971653 () Bool)

(assert (=> b!1051086 m!971653))

(declare-fun m!971655 () Bool)

(assert (=> b!1051088 m!971655))

(declare-fun m!971657 () Bool)

(assert (=> b!1051084 m!971657))

(declare-fun m!971659 () Bool)

(assert (=> b!1051084 m!971659))

(declare-fun m!971661 () Bool)

(assert (=> b!1051080 m!971661))

(declare-fun m!971663 () Bool)

(assert (=> b!1051080 m!971663))

(declare-fun m!971665 () Bool)

(assert (=> b!1051081 m!971665))

(declare-fun m!971667 () Bool)

(assert (=> b!1051087 m!971667))

(declare-fun m!971669 () Bool)

(assert (=> b!1051085 m!971669))

(assert (=> b!1051085 m!971657))

(check-sat (not start!92444) (not b!1051088) (not b!1051082) (not b!1051087) (not b!1051080) (not b!1051085) (not b!1051081))
