; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92300 () Bool)

(assert start!92300)

(declare-fun b!1049019 () Bool)

(declare-fun e!595103 () Bool)

(declare-fun e!595107 () Bool)

(assert (=> b!1049019 (= e!595103 e!595107)))

(declare-fun res!698151 () Bool)

(assert (=> b!1049019 (=> res!698151 e!595107)))

(declare-fun lt!463361 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049019 (= res!698151 (bvsle lt!463361 i!1381))))

(declare-fun b!1049020 () Bool)

(declare-fun e!595108 () Bool)

(declare-fun e!595104 () Bool)

(assert (=> b!1049020 (= e!595108 (not e!595104))))

(declare-fun res!698149 () Bool)

(assert (=> b!1049020 (=> res!698149 e!595104)))

(assert (=> b!1049020 (= res!698149 (bvsle lt!463361 i!1381))))

(assert (=> b!1049020 e!595103))

(declare-fun res!698150 () Bool)

(assert (=> b!1049020 (=> (not res!698150) (not e!595103))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66101 0))(
  ( (array!66102 (arr!31790 (Array (_ BitVec 32) (_ BitVec 64))) (size!32326 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66101)

(assert (=> b!1049020 (= res!698150 (= (select (store (arr!31790 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463361) k0!2747))))

(declare-fun b!1049021 () Bool)

(declare-fun e!595105 () Bool)

(assert (=> b!1049021 (= e!595105 e!595108)))

(declare-fun res!698148 () Bool)

(assert (=> b!1049021 (=> (not res!698148) (not e!595108))))

(assert (=> b!1049021 (= res!698148 (not (= lt!463361 i!1381)))))

(declare-fun lt!463360 () array!66101)

(declare-fun arrayScanForKey!0 (array!66101 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049021 (= lt!463361 (arrayScanForKey!0 lt!463360 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049022 () Bool)

(declare-fun res!698152 () Bool)

(declare-fun e!595106 () Bool)

(assert (=> b!1049022 (=> (not res!698152) (not e!595106))))

(declare-datatypes ((List!22102 0))(
  ( (Nil!22099) (Cons!22098 (h!23307 (_ BitVec 64)) (t!31409 List!22102)) )
))
(declare-fun arrayNoDuplicates!0 (array!66101 (_ BitVec 32) List!22102) Bool)

(assert (=> b!1049022 (= res!698152 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22099))))

(declare-fun b!1049023 () Bool)

(assert (=> b!1049023 (= e!595106 e!595105)))

(declare-fun res!698145 () Bool)

(assert (=> b!1049023 (=> (not res!698145) (not e!595105))))

(declare-fun arrayContainsKey!0 (array!66101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049023 (= res!698145 (arrayContainsKey!0 lt!463360 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049023 (= lt!463360 (array!66102 (store (arr!31790 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32326 a!3488)))))

(declare-fun res!698146 () Bool)

(assert (=> start!92300 (=> (not res!698146) (not e!595106))))

(assert (=> start!92300 (= res!698146 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32326 a!3488)) (bvslt (size!32326 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92300 e!595106))

(assert (=> start!92300 true))

(declare-fun array_inv!24570 (array!66101) Bool)

(assert (=> start!92300 (array_inv!24570 a!3488)))

(declare-fun b!1049024 () Bool)

(declare-fun res!698153 () Bool)

(assert (=> b!1049024 (=> (not res!698153) (not e!595106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049024 (= res!698153 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049025 () Bool)

(declare-fun res!698147 () Bool)

(assert (=> b!1049025 (=> (not res!698147) (not e!595106))))

(assert (=> b!1049025 (= res!698147 (= (select (arr!31790 a!3488) i!1381) k0!2747))))

(declare-fun b!1049026 () Bool)

(assert (=> b!1049026 (= e!595107 (arrayContainsKey!0 a!3488 k0!2747 lt!463361))))

(declare-fun b!1049027 () Bool)

(assert (=> b!1049027 (= e!595104 true)))

(assert (=> b!1049027 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22099)))

(declare-datatypes ((Unit!34300 0))(
  ( (Unit!34301) )
))
(declare-fun lt!463362 () Unit!34300)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66101 (_ BitVec 32) (_ BitVec 32)) Unit!34300)

(assert (=> b!1049027 (= lt!463362 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92300 res!698146) b!1049022))

(assert (= (and b!1049022 res!698152) b!1049024))

(assert (= (and b!1049024 res!698153) b!1049025))

(assert (= (and b!1049025 res!698147) b!1049023))

(assert (= (and b!1049023 res!698145) b!1049021))

(assert (= (and b!1049021 res!698148) b!1049020))

(assert (= (and b!1049020 res!698150) b!1049019))

(assert (= (and b!1049019 (not res!698151)) b!1049026))

(assert (= (and b!1049020 (not res!698149)) b!1049027))

(declare-fun m!969855 () Bool)

(assert (=> b!1049024 m!969855))

(declare-fun m!969857 () Bool)

(assert (=> b!1049027 m!969857))

(declare-fun m!969859 () Bool)

(assert (=> b!1049027 m!969859))

(declare-fun m!969861 () Bool)

(assert (=> b!1049021 m!969861))

(declare-fun m!969863 () Bool)

(assert (=> start!92300 m!969863))

(declare-fun m!969865 () Bool)

(assert (=> b!1049025 m!969865))

(declare-fun m!969867 () Bool)

(assert (=> b!1049020 m!969867))

(declare-fun m!969869 () Bool)

(assert (=> b!1049020 m!969869))

(declare-fun m!969871 () Bool)

(assert (=> b!1049022 m!969871))

(declare-fun m!969873 () Bool)

(assert (=> b!1049026 m!969873))

(declare-fun m!969875 () Bool)

(assert (=> b!1049023 m!969875))

(assert (=> b!1049023 m!969867))

(check-sat (not b!1049021) (not b!1049023) (not b!1049027) (not b!1049022) (not b!1049026) (not b!1049024) (not start!92300))
(check-sat)
