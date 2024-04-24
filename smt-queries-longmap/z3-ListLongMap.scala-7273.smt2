; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93090 () Bool)

(assert start!93090)

(declare-fun b!1055842 () Bool)

(declare-fun e!599965 () Bool)

(assert (=> b!1055842 (= e!599965 true)))

(declare-datatypes ((array!66565 0))(
  ( (array!66566 (arr!32008 (Array (_ BitVec 32) (_ BitVec 64))) (size!32545 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66565)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055842 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34543 0))(
  ( (Unit!34544) )
))
(declare-fun lt!465959 () Unit!34543)

(declare-fun lt!465956 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66565 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34543)

(assert (=> b!1055842 (= lt!465959 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465956 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22290 0))(
  ( (Nil!22287) (Cons!22286 (h!23504 (_ BitVec 64)) (t!31589 List!22290)) )
))
(declare-fun arrayNoDuplicates!0 (array!66565 (_ BitVec 32) List!22290) Bool)

(assert (=> b!1055842 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22287)))

(declare-fun lt!465957 () Unit!34543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66565 (_ BitVec 32) (_ BitVec 32)) Unit!34543)

(assert (=> b!1055842 (= lt!465957 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055843 () Bool)

(declare-fun res!703979 () Bool)

(declare-fun e!599966 () Bool)

(assert (=> b!1055843 (=> (not res!703979) (not e!599966))))

(assert (=> b!1055843 (= res!703979 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22287))))

(declare-fun b!1055844 () Bool)

(declare-fun res!703981 () Bool)

(assert (=> b!1055844 (=> (not res!703981) (not e!599966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055844 (= res!703981 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055845 () Bool)

(declare-fun res!703984 () Bool)

(assert (=> b!1055845 (=> (not res!703984) (not e!599966))))

(assert (=> b!1055845 (= res!703984 (= (select (arr!32008 a!3488) i!1381) k0!2747))))

(declare-fun b!1055846 () Bool)

(declare-fun e!599967 () Bool)

(declare-fun e!599962 () Bool)

(assert (=> b!1055846 (= e!599967 e!599962)))

(declare-fun res!703982 () Bool)

(assert (=> b!1055846 (=> res!703982 e!599962)))

(assert (=> b!1055846 (= res!703982 (bvsle lt!465956 i!1381))))

(declare-fun b!1055847 () Bool)

(declare-fun e!599964 () Bool)

(assert (=> b!1055847 (= e!599966 e!599964)))

(declare-fun res!703983 () Bool)

(assert (=> b!1055847 (=> (not res!703983) (not e!599964))))

(declare-fun lt!465958 () array!66565)

(assert (=> b!1055847 (= res!703983 (arrayContainsKey!0 lt!465958 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055847 (= lt!465958 (array!66566 (store (arr!32008 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32545 a!3488)))))

(declare-fun res!703978 () Bool)

(assert (=> start!93090 (=> (not res!703978) (not e!599966))))

(assert (=> start!93090 (= res!703978 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32545 a!3488)) (bvslt (size!32545 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93090 e!599966))

(assert (=> start!93090 true))

(declare-fun array_inv!24790 (array!66565) Bool)

(assert (=> start!93090 (array_inv!24790 a!3488)))

(declare-fun b!1055848 () Bool)

(declare-fun e!599963 () Bool)

(assert (=> b!1055848 (= e!599964 e!599963)))

(declare-fun res!703980 () Bool)

(assert (=> b!1055848 (=> (not res!703980) (not e!599963))))

(assert (=> b!1055848 (= res!703980 (not (= lt!465956 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66565 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055848 (= lt!465956 (arrayScanForKey!0 lt!465958 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055849 () Bool)

(assert (=> b!1055849 (= e!599963 (not e!599965))))

(declare-fun res!703985 () Bool)

(assert (=> b!1055849 (=> res!703985 e!599965)))

(assert (=> b!1055849 (= res!703985 (bvsle lt!465956 i!1381))))

(assert (=> b!1055849 e!599967))

(declare-fun res!703977 () Bool)

(assert (=> b!1055849 (=> (not res!703977) (not e!599967))))

(assert (=> b!1055849 (= res!703977 (= (select (store (arr!32008 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465956) k0!2747))))

(declare-fun b!1055850 () Bool)

(assert (=> b!1055850 (= e!599962 (arrayContainsKey!0 a!3488 k0!2747 lt!465956))))

(assert (= (and start!93090 res!703978) b!1055843))

(assert (= (and b!1055843 res!703979) b!1055844))

(assert (= (and b!1055844 res!703981) b!1055845))

(assert (= (and b!1055845 res!703984) b!1055847))

(assert (= (and b!1055847 res!703983) b!1055848))

(assert (= (and b!1055848 res!703980) b!1055849))

(assert (= (and b!1055849 res!703977) b!1055846))

(assert (= (and b!1055846 (not res!703982)) b!1055850))

(assert (= (and b!1055849 (not res!703985)) b!1055842))

(declare-fun m!976247 () Bool)

(assert (=> start!93090 m!976247))

(declare-fun m!976249 () Bool)

(assert (=> b!1055850 m!976249))

(declare-fun m!976251 () Bool)

(assert (=> b!1055848 m!976251))

(declare-fun m!976253 () Bool)

(assert (=> b!1055847 m!976253))

(declare-fun m!976255 () Bool)

(assert (=> b!1055847 m!976255))

(declare-fun m!976257 () Bool)

(assert (=> b!1055843 m!976257))

(declare-fun m!976259 () Bool)

(assert (=> b!1055845 m!976259))

(assert (=> b!1055849 m!976255))

(declare-fun m!976261 () Bool)

(assert (=> b!1055849 m!976261))

(declare-fun m!976263 () Bool)

(assert (=> b!1055842 m!976263))

(declare-fun m!976265 () Bool)

(assert (=> b!1055842 m!976265))

(declare-fun m!976267 () Bool)

(assert (=> b!1055842 m!976267))

(declare-fun m!976269 () Bool)

(assert (=> b!1055842 m!976269))

(declare-fun m!976271 () Bool)

(assert (=> b!1055844 m!976271))

(check-sat (not b!1055850) (not b!1055843) (not start!93090) (not b!1055844) (not b!1055848) (not b!1055847) (not b!1055842))
(check-sat)
