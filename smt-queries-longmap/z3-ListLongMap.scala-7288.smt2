; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93122 () Bool)

(assert start!93122)

(declare-fun b!1056289 () Bool)

(declare-fun e!600483 () Bool)

(declare-fun e!600481 () Bool)

(assert (=> b!1056289 (= e!600483 e!600481)))

(declare-fun res!705067 () Bool)

(assert (=> b!1056289 (=> (not res!705067) (not e!600481))))

(declare-fun lt!466077 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056289 (= res!705067 (not (= lt!466077 i!1381)))))

(declare-datatypes ((array!66620 0))(
  ( (array!66621 (arr!32036 (Array (_ BitVec 32) (_ BitVec 64))) (size!32572 (_ BitVec 32))) )
))
(declare-fun lt!466076 () array!66620)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66620 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056289 (= lt!466077 (arrayScanForKey!0 lt!466076 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056290 () Bool)

(declare-fun e!600482 () Bool)

(assert (=> b!1056290 (= e!600482 e!600483)))

(declare-fun res!705070 () Bool)

(assert (=> b!1056290 (=> (not res!705070) (not e!600483))))

(declare-fun arrayContainsKey!0 (array!66620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056290 (= res!705070 (arrayContainsKey!0 lt!466076 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66620)

(assert (=> b!1056290 (= lt!466076 (array!66621 (store (arr!32036 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32572 a!3488)))))

(declare-fun b!1056291 () Bool)

(declare-fun res!705071 () Bool)

(assert (=> b!1056291 (=> (not res!705071) (not e!600482))))

(assert (=> b!1056291 (= res!705071 (= (select (arr!32036 a!3488) i!1381) k0!2747))))

(declare-fun res!705068 () Bool)

(assert (=> start!93122 (=> (not res!705068) (not e!600482))))

(assert (=> start!93122 (= res!705068 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32572 a!3488)) (bvslt (size!32572 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93122 e!600482))

(assert (=> start!93122 true))

(declare-fun array_inv!24816 (array!66620) Bool)

(assert (=> start!93122 (array_inv!24816 a!3488)))

(declare-fun b!1056292 () Bool)

(declare-fun e!600480 () Bool)

(declare-fun e!600484 () Bool)

(assert (=> b!1056292 (= e!600480 e!600484)))

(declare-fun res!705072 () Bool)

(assert (=> b!1056292 (=> res!705072 e!600484)))

(assert (=> b!1056292 (= res!705072 (or (bvsgt lt!466077 i!1381) (bvsle i!1381 lt!466077)))))

(declare-fun b!1056293 () Bool)

(declare-fun res!705073 () Bool)

(assert (=> b!1056293 (=> (not res!705073) (not e!600482))))

(declare-datatypes ((List!22348 0))(
  ( (Nil!22345) (Cons!22344 (h!23553 (_ BitVec 64)) (t!31655 List!22348)) )
))
(declare-fun arrayNoDuplicates!0 (array!66620 (_ BitVec 32) List!22348) Bool)

(assert (=> b!1056293 (= res!705073 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22345))))

(declare-fun b!1056294 () Bool)

(assert (=> b!1056294 (= e!600481 (not (or (bvsgt lt!466077 i!1381) (bvsle i!1381 lt!466077) (bvsle #b00000000000000000000000000000000 (size!32572 a!3488)))))))

(assert (=> b!1056294 e!600480))

(declare-fun res!705074 () Bool)

(assert (=> b!1056294 (=> (not res!705074) (not e!600480))))

(assert (=> b!1056294 (= res!705074 (= (select (store (arr!32036 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466077) k0!2747))))

(declare-fun b!1056295 () Bool)

(assert (=> b!1056295 (= e!600484 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056296 () Bool)

(declare-fun res!705069 () Bool)

(assert (=> b!1056296 (=> (not res!705069) (not e!600482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056296 (= res!705069 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93122 res!705068) b!1056293))

(assert (= (and b!1056293 res!705073) b!1056296))

(assert (= (and b!1056296 res!705069) b!1056291))

(assert (= (and b!1056291 res!705071) b!1056290))

(assert (= (and b!1056290 res!705070) b!1056289))

(assert (= (and b!1056289 res!705067) b!1056294))

(assert (= (and b!1056294 res!705074) b!1056292))

(assert (= (and b!1056292 (not res!705072)) b!1056295))

(declare-fun m!976187 () Bool)

(assert (=> b!1056296 m!976187))

(declare-fun m!976189 () Bool)

(assert (=> b!1056295 m!976189))

(declare-fun m!976191 () Bool)

(assert (=> b!1056293 m!976191))

(declare-fun m!976193 () Bool)

(assert (=> start!93122 m!976193))

(declare-fun m!976195 () Bool)

(assert (=> b!1056290 m!976195))

(declare-fun m!976197 () Bool)

(assert (=> b!1056290 m!976197))

(assert (=> b!1056294 m!976197))

(declare-fun m!976199 () Bool)

(assert (=> b!1056294 m!976199))

(declare-fun m!976201 () Bool)

(assert (=> b!1056289 m!976201))

(declare-fun m!976203 () Bool)

(assert (=> b!1056291 m!976203))

(check-sat (not b!1056290) (not b!1056296) (not b!1056295) (not b!1056289) (not start!93122) (not b!1056293))
(check-sat)
