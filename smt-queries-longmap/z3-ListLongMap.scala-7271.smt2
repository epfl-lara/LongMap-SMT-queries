; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92842 () Bool)

(assert start!92842)

(declare-fun b!1054214 () Bool)

(declare-fun e!598902 () Bool)

(declare-fun e!598903 () Bool)

(assert (=> b!1054214 (= e!598902 (not e!598903))))

(declare-fun res!703238 () Bool)

(assert (=> b!1054214 (=> res!703238 e!598903)))

(declare-fun lt!465185 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054214 (= res!703238 (bvsle lt!465185 i!1381))))

(declare-fun e!598908 () Bool)

(assert (=> b!1054214 e!598908))

(declare-fun res!703246 () Bool)

(assert (=> b!1054214 (=> (not res!703246) (not e!598908))))

(declare-datatypes ((array!66443 0))(
  ( (array!66444 (arr!31953 (Array (_ BitVec 32) (_ BitVec 64))) (size!32491 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66443)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1054214 (= res!703246 (= (select (store (arr!31953 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465185) k0!2747))))

(declare-fun b!1054215 () Bool)

(declare-fun res!703245 () Bool)

(declare-fun e!598907 () Bool)

(assert (=> b!1054215 (=> (not res!703245) (not e!598907))))

(assert (=> b!1054215 (= res!703245 (= (select (arr!31953 a!3488) i!1381) k0!2747))))

(declare-fun b!1054216 () Bool)

(declare-fun e!598904 () Bool)

(assert (=> b!1054216 (= e!598907 e!598904)))

(declare-fun res!703239 () Bool)

(assert (=> b!1054216 (=> (not res!703239) (not e!598904))))

(declare-fun lt!465186 () array!66443)

(declare-fun arrayContainsKey!0 (array!66443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054216 (= res!703239 (arrayContainsKey!0 lt!465186 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054216 (= lt!465186 (array!66444 (store (arr!31953 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32491 a!3488)))))

(declare-fun b!1054217 () Bool)

(assert (=> b!1054217 (= e!598904 e!598902)))

(declare-fun res!703242 () Bool)

(assert (=> b!1054217 (=> (not res!703242) (not e!598902))))

(assert (=> b!1054217 (= res!703242 (not (= lt!465185 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66443 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054217 (= lt!465185 (arrayScanForKey!0 lt!465186 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054218 () Bool)

(declare-fun res!703243 () Bool)

(assert (=> b!1054218 (=> (not res!703243) (not e!598907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054218 (= res!703243 (validKeyInArray!0 k0!2747))))

(declare-fun res!703244 () Bool)

(assert (=> start!92842 (=> (not res!703244) (not e!598907))))

(assert (=> start!92842 (= res!703244 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32491 a!3488)) (bvslt (size!32491 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92842 e!598907))

(assert (=> start!92842 true))

(declare-fun array_inv!24736 (array!66443) Bool)

(assert (=> start!92842 (array_inv!24736 a!3488)))

(declare-fun b!1054219 () Bool)

(declare-fun res!703240 () Bool)

(assert (=> b!1054219 (=> (not res!703240) (not e!598907))))

(declare-datatypes ((List!22324 0))(
  ( (Nil!22321) (Cons!22320 (h!23529 (_ BitVec 64)) (t!31622 List!22324)) )
))
(declare-fun arrayNoDuplicates!0 (array!66443 (_ BitVec 32) List!22324) Bool)

(assert (=> b!1054219 (= res!703240 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22321))))

(declare-fun b!1054220 () Bool)

(declare-fun e!598906 () Bool)

(assert (=> b!1054220 (= e!598908 e!598906)))

(declare-fun res!703241 () Bool)

(assert (=> b!1054220 (=> res!703241 e!598906)))

(assert (=> b!1054220 (= res!703241 (bvsle lt!465185 i!1381))))

(declare-fun b!1054221 () Bool)

(assert (=> b!1054221 (= e!598906 (arrayContainsKey!0 a!3488 k0!2747 lt!465185))))

(declare-fun b!1054222 () Bool)

(assert (=> b!1054222 (= e!598903 true)))

(assert (=> b!1054222 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22321)))

(declare-datatypes ((Unit!34397 0))(
  ( (Unit!34398) )
))
(declare-fun lt!465187 () Unit!34397)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66443 (_ BitVec 32) (_ BitVec 32)) Unit!34397)

(assert (=> b!1054222 (= lt!465187 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92842 res!703244) b!1054219))

(assert (= (and b!1054219 res!703240) b!1054218))

(assert (= (and b!1054218 res!703243) b!1054215))

(assert (= (and b!1054215 res!703245) b!1054216))

(assert (= (and b!1054216 res!703239) b!1054217))

(assert (= (and b!1054217 res!703242) b!1054214))

(assert (= (and b!1054214 res!703246) b!1054220))

(assert (= (and b!1054220 (not res!703241)) b!1054221))

(assert (= (and b!1054214 (not res!703238)) b!1054222))

(declare-fun m!973831 () Bool)

(assert (=> b!1054217 m!973831))

(declare-fun m!973833 () Bool)

(assert (=> b!1054222 m!973833))

(declare-fun m!973835 () Bool)

(assert (=> b!1054222 m!973835))

(declare-fun m!973837 () Bool)

(assert (=> b!1054216 m!973837))

(declare-fun m!973839 () Bool)

(assert (=> b!1054216 m!973839))

(declare-fun m!973841 () Bool)

(assert (=> start!92842 m!973841))

(assert (=> b!1054214 m!973839))

(declare-fun m!973843 () Bool)

(assert (=> b!1054214 m!973843))

(declare-fun m!973845 () Bool)

(assert (=> b!1054215 m!973845))

(declare-fun m!973847 () Bool)

(assert (=> b!1054219 m!973847))

(declare-fun m!973849 () Bool)

(assert (=> b!1054221 m!973849))

(declare-fun m!973851 () Bool)

(assert (=> b!1054218 m!973851))

(check-sat (not start!92842) (not b!1054218) (not b!1054221) (not b!1054219) (not b!1054217) (not b!1054222) (not b!1054216))
(check-sat)
