; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92848 () Bool)

(assert start!92848)

(declare-fun b!1054295 () Bool)

(declare-fun res!703319 () Bool)

(declare-fun e!598971 () Bool)

(assert (=> b!1054295 (=> (not res!703319) (not e!598971))))

(declare-datatypes ((array!66449 0))(
  ( (array!66450 (arr!31956 (Array (_ BitVec 32) (_ BitVec 64))) (size!32494 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66449)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054295 (= res!703319 (= (select (arr!31956 a!3488) i!1381) k0!2747))))

(declare-fun b!1054296 () Bool)

(declare-fun res!703321 () Bool)

(assert (=> b!1054296 (=> (not res!703321) (not e!598971))))

(declare-datatypes ((List!22327 0))(
  ( (Nil!22324) (Cons!22323 (h!23532 (_ BitVec 64)) (t!31625 List!22327)) )
))
(declare-fun arrayNoDuplicates!0 (array!66449 (_ BitVec 32) List!22327) Bool)

(assert (=> b!1054296 (= res!703321 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22324))))

(declare-fun b!1054297 () Bool)

(declare-fun e!598965 () Bool)

(assert (=> b!1054297 (= e!598965 true)))

(assert (=> b!1054297 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22324)))

(declare-datatypes ((Unit!34403 0))(
  ( (Unit!34404) )
))
(declare-fun lt!465214 () Unit!34403)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66449 (_ BitVec 32) (_ BitVec 32)) Unit!34403)

(assert (=> b!1054297 (= lt!465214 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054298 () Bool)

(declare-fun e!598966 () Bool)

(assert (=> b!1054298 (= e!598966 (not e!598965))))

(declare-fun res!703320 () Bool)

(assert (=> b!1054298 (=> res!703320 e!598965)))

(declare-fun lt!465212 () (_ BitVec 32))

(assert (=> b!1054298 (= res!703320 (bvsle lt!465212 i!1381))))

(declare-fun e!598968 () Bool)

(assert (=> b!1054298 e!598968))

(declare-fun res!703322 () Bool)

(assert (=> b!1054298 (=> (not res!703322) (not e!598968))))

(assert (=> b!1054298 (= res!703322 (= (select (store (arr!31956 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465212) k0!2747))))

(declare-fun b!1054299 () Bool)

(declare-fun e!598967 () Bool)

(assert (=> b!1054299 (= e!598971 e!598967)))

(declare-fun res!703324 () Bool)

(assert (=> b!1054299 (=> (not res!703324) (not e!598967))))

(declare-fun lt!465213 () array!66449)

(declare-fun arrayContainsKey!0 (array!66449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054299 (= res!703324 (arrayContainsKey!0 lt!465213 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054299 (= lt!465213 (array!66450 (store (arr!31956 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32494 a!3488)))))

(declare-fun b!1054300 () Bool)

(assert (=> b!1054300 (= e!598967 e!598966)))

(declare-fun res!703326 () Bool)

(assert (=> b!1054300 (=> (not res!703326) (not e!598966))))

(assert (=> b!1054300 (= res!703326 (not (= lt!465212 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66449 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054300 (= lt!465212 (arrayScanForKey!0 lt!465213 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054302 () Bool)

(declare-fun e!598969 () Bool)

(assert (=> b!1054302 (= e!598969 (arrayContainsKey!0 a!3488 k0!2747 lt!465212))))

(declare-fun b!1054303 () Bool)

(declare-fun res!703323 () Bool)

(assert (=> b!1054303 (=> (not res!703323) (not e!598971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054303 (= res!703323 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054301 () Bool)

(assert (=> b!1054301 (= e!598968 e!598969)))

(declare-fun res!703327 () Bool)

(assert (=> b!1054301 (=> res!703327 e!598969)))

(assert (=> b!1054301 (= res!703327 (bvsle lt!465212 i!1381))))

(declare-fun res!703325 () Bool)

(assert (=> start!92848 (=> (not res!703325) (not e!598971))))

(assert (=> start!92848 (= res!703325 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32494 a!3488)) (bvslt (size!32494 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92848 e!598971))

(assert (=> start!92848 true))

(declare-fun array_inv!24739 (array!66449) Bool)

(assert (=> start!92848 (array_inv!24739 a!3488)))

(assert (= (and start!92848 res!703325) b!1054296))

(assert (= (and b!1054296 res!703321) b!1054303))

(assert (= (and b!1054303 res!703323) b!1054295))

(assert (= (and b!1054295 res!703319) b!1054299))

(assert (= (and b!1054299 res!703324) b!1054300))

(assert (= (and b!1054300 res!703326) b!1054298))

(assert (= (and b!1054298 res!703322) b!1054301))

(assert (= (and b!1054301 (not res!703327)) b!1054302))

(assert (= (and b!1054298 (not res!703320)) b!1054297))

(declare-fun m!973897 () Bool)

(assert (=> b!1054300 m!973897))

(declare-fun m!973899 () Bool)

(assert (=> b!1054295 m!973899))

(declare-fun m!973901 () Bool)

(assert (=> b!1054297 m!973901))

(declare-fun m!973903 () Bool)

(assert (=> b!1054297 m!973903))

(declare-fun m!973905 () Bool)

(assert (=> b!1054303 m!973905))

(declare-fun m!973907 () Bool)

(assert (=> start!92848 m!973907))

(declare-fun m!973909 () Bool)

(assert (=> b!1054298 m!973909))

(declare-fun m!973911 () Bool)

(assert (=> b!1054298 m!973911))

(declare-fun m!973913 () Bool)

(assert (=> b!1054299 m!973913))

(assert (=> b!1054299 m!973909))

(declare-fun m!973915 () Bool)

(assert (=> b!1054296 m!973915))

(declare-fun m!973917 () Bool)

(assert (=> b!1054302 m!973917))

(check-sat (not start!92848) (not b!1054297) (not b!1054299) (not b!1054302) (not b!1054300) (not b!1054296) (not b!1054303))
(check-sat)
