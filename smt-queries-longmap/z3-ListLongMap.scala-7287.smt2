; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93116 () Bool)

(assert start!93116)

(declare-fun b!1056217 () Bool)

(declare-fun e!600426 () Bool)

(declare-fun e!600430 () Bool)

(assert (=> b!1056217 (= e!600426 e!600430)))

(declare-fun res!704999 () Bool)

(assert (=> b!1056217 (=> (not res!704999) (not e!600430))))

(declare-fun lt!466059 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056217 (= res!704999 (not (= lt!466059 i!1381)))))

(declare-datatypes ((array!66614 0))(
  ( (array!66615 (arr!32033 (Array (_ BitVec 32) (_ BitVec 64))) (size!32569 (_ BitVec 32))) )
))
(declare-fun lt!466058 () array!66614)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66614 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056217 (= lt!466059 (arrayScanForKey!0 lt!466058 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056218 () Bool)

(declare-fun e!600425 () Bool)

(assert (=> b!1056218 (= e!600425 e!600426)))

(declare-fun res!704996 () Bool)

(assert (=> b!1056218 (=> (not res!704996) (not e!600426))))

(declare-fun arrayContainsKey!0 (array!66614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056218 (= res!704996 (arrayContainsKey!0 lt!466058 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66614)

(assert (=> b!1056218 (= lt!466058 (array!66615 (store (arr!32033 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32569 a!3488)))))

(declare-fun b!1056220 () Bool)

(declare-fun res!705001 () Bool)

(assert (=> b!1056220 (=> (not res!705001) (not e!600425))))

(declare-datatypes ((List!22345 0))(
  ( (Nil!22342) (Cons!22341 (h!23550 (_ BitVec 64)) (t!31652 List!22345)) )
))
(declare-fun arrayNoDuplicates!0 (array!66614 (_ BitVec 32) List!22345) Bool)

(assert (=> b!1056220 (= res!705001 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22342))))

(declare-fun b!1056221 () Bool)

(declare-fun res!704998 () Bool)

(assert (=> b!1056221 (=> (not res!704998) (not e!600425))))

(assert (=> b!1056221 (= res!704998 (= (select (arr!32033 a!3488) i!1381) k0!2747))))

(declare-fun b!1056222 () Bool)

(declare-fun e!600428 () Bool)

(assert (=> b!1056222 (= e!600428 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056223 () Bool)

(declare-fun e!600427 () Bool)

(assert (=> b!1056223 (= e!600427 e!600428)))

(declare-fun res!704995 () Bool)

(assert (=> b!1056223 (=> res!704995 e!600428)))

(assert (=> b!1056223 (= res!704995 (or (bvsgt lt!466059 i!1381) (bvsle i!1381 lt!466059)))))

(declare-fun b!1056224 () Bool)

(assert (=> b!1056224 (= e!600430 (not true))))

(assert (=> b!1056224 e!600427))

(declare-fun res!705000 () Bool)

(assert (=> b!1056224 (=> (not res!705000) (not e!600427))))

(assert (=> b!1056224 (= res!705000 (= (select (store (arr!32033 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466059) k0!2747))))

(declare-fun b!1056219 () Bool)

(declare-fun res!705002 () Bool)

(assert (=> b!1056219 (=> (not res!705002) (not e!600425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056219 (= res!705002 (validKeyInArray!0 k0!2747))))

(declare-fun res!704997 () Bool)

(assert (=> start!93116 (=> (not res!704997) (not e!600425))))

(assert (=> start!93116 (= res!704997 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32569 a!3488)) (bvslt (size!32569 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93116 e!600425))

(assert (=> start!93116 true))

(declare-fun array_inv!24813 (array!66614) Bool)

(assert (=> start!93116 (array_inv!24813 a!3488)))

(assert (= (and start!93116 res!704997) b!1056220))

(assert (= (and b!1056220 res!705001) b!1056219))

(assert (= (and b!1056219 res!705002) b!1056221))

(assert (= (and b!1056221 res!704998) b!1056218))

(assert (= (and b!1056218 res!704996) b!1056217))

(assert (= (and b!1056217 res!704999) b!1056224))

(assert (= (and b!1056224 res!705000) b!1056223))

(assert (= (and b!1056223 (not res!704995)) b!1056222))

(declare-fun m!976133 () Bool)

(assert (=> b!1056220 m!976133))

(declare-fun m!976135 () Bool)

(assert (=> b!1056219 m!976135))

(declare-fun m!976137 () Bool)

(assert (=> b!1056218 m!976137))

(declare-fun m!976139 () Bool)

(assert (=> b!1056218 m!976139))

(declare-fun m!976141 () Bool)

(assert (=> b!1056222 m!976141))

(assert (=> b!1056224 m!976139))

(declare-fun m!976143 () Bool)

(assert (=> b!1056224 m!976143))

(declare-fun m!976145 () Bool)

(assert (=> start!93116 m!976145))

(declare-fun m!976147 () Bool)

(assert (=> b!1056217 m!976147))

(declare-fun m!976149 () Bool)

(assert (=> b!1056221 m!976149))

(check-sat (not b!1056217) (not b!1056219) (not start!93116) (not b!1056220) (not b!1056222) (not b!1056218))
(check-sat)
