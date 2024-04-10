; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92302 () Bool)

(assert start!92302)

(declare-fun b!1049046 () Bool)

(declare-fun e!595126 () Bool)

(declare-fun e!595124 () Bool)

(assert (=> b!1049046 (= e!595126 e!595124)))

(declare-fun res!698175 () Bool)

(assert (=> b!1049046 (=> res!698175 e!595124)))

(declare-fun lt!463371 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049046 (= res!698175 (bvsle lt!463371 i!1381))))

(declare-fun b!1049047 () Bool)

(declare-fun e!595129 () Bool)

(declare-fun e!595125 () Bool)

(assert (=> b!1049047 (= e!595129 e!595125)))

(declare-fun res!698176 () Bool)

(assert (=> b!1049047 (=> (not res!698176) (not e!595125))))

(assert (=> b!1049047 (= res!698176 (not (= lt!463371 i!1381)))))

(declare-datatypes ((array!66103 0))(
  ( (array!66104 (arr!31791 (Array (_ BitVec 32) (_ BitVec 64))) (size!32327 (_ BitVec 32))) )
))
(declare-fun lt!463369 () array!66103)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66103 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049047 (= lt!463371 (arrayScanForKey!0 lt!463369 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049048 () Bool)

(declare-fun a!3488 () array!66103)

(declare-fun arrayContainsKey!0 (array!66103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049048 (= e!595124 (arrayContainsKey!0 a!3488 k!2747 lt!463371))))

(declare-fun b!1049049 () Bool)

(declare-fun e!595127 () Bool)

(assert (=> b!1049049 (= e!595127 e!595129)))

(declare-fun res!698180 () Bool)

(assert (=> b!1049049 (=> (not res!698180) (not e!595129))))

(assert (=> b!1049049 (= res!698180 (arrayContainsKey!0 lt!463369 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049049 (= lt!463369 (array!66104 (store (arr!31791 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32327 a!3488)))))

(declare-fun b!1049050 () Bool)

(declare-fun res!698174 () Bool)

(assert (=> b!1049050 (=> (not res!698174) (not e!595127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049050 (= res!698174 (validKeyInArray!0 k!2747))))

(declare-fun b!1049051 () Bool)

(declare-fun res!698177 () Bool)

(assert (=> b!1049051 (=> (not res!698177) (not e!595127))))

(declare-datatypes ((List!22103 0))(
  ( (Nil!22100) (Cons!22099 (h!23308 (_ BitVec 64)) (t!31410 List!22103)) )
))
(declare-fun arrayNoDuplicates!0 (array!66103 (_ BitVec 32) List!22103) Bool)

(assert (=> b!1049051 (= res!698177 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22100))))

(declare-fun b!1049052 () Bool)

(declare-fun e!595128 () Bool)

(assert (=> b!1049052 (= e!595128 true)))

(assert (=> b!1049052 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22100)))

(declare-datatypes ((Unit!34302 0))(
  ( (Unit!34303) )
))
(declare-fun lt!463370 () Unit!34302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66103 (_ BitVec 32) (_ BitVec 32)) Unit!34302)

(assert (=> b!1049052 (= lt!463370 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049053 () Bool)

(declare-fun res!698172 () Bool)

(assert (=> b!1049053 (=> (not res!698172) (not e!595127))))

(assert (=> b!1049053 (= res!698172 (= (select (arr!31791 a!3488) i!1381) k!2747))))

(declare-fun b!1049054 () Bool)

(assert (=> b!1049054 (= e!595125 (not e!595128))))

(declare-fun res!698173 () Bool)

(assert (=> b!1049054 (=> res!698173 e!595128)))

(assert (=> b!1049054 (= res!698173 (bvsle lt!463371 i!1381))))

(assert (=> b!1049054 e!595126))

(declare-fun res!698179 () Bool)

(assert (=> b!1049054 (=> (not res!698179) (not e!595126))))

(assert (=> b!1049054 (= res!698179 (= (select (store (arr!31791 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463371) k!2747))))

(declare-fun res!698178 () Bool)

(assert (=> start!92302 (=> (not res!698178) (not e!595127))))

(assert (=> start!92302 (= res!698178 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32327 a!3488)) (bvslt (size!32327 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92302 e!595127))

(assert (=> start!92302 true))

(declare-fun array_inv!24571 (array!66103) Bool)

(assert (=> start!92302 (array_inv!24571 a!3488)))

(assert (= (and start!92302 res!698178) b!1049051))

(assert (= (and b!1049051 res!698177) b!1049050))

(assert (= (and b!1049050 res!698174) b!1049053))

(assert (= (and b!1049053 res!698172) b!1049049))

(assert (= (and b!1049049 res!698180) b!1049047))

(assert (= (and b!1049047 res!698176) b!1049054))

(assert (= (and b!1049054 res!698179) b!1049046))

(assert (= (and b!1049046 (not res!698175)) b!1049048))

(assert (= (and b!1049054 (not res!698173)) b!1049052))

(declare-fun m!969877 () Bool)

(assert (=> b!1049047 m!969877))

(declare-fun m!969879 () Bool)

(assert (=> b!1049050 m!969879))

(declare-fun m!969881 () Bool)

(assert (=> b!1049048 m!969881))

(declare-fun m!969883 () Bool)

(assert (=> b!1049053 m!969883))

(declare-fun m!969885 () Bool)

(assert (=> b!1049052 m!969885))

(declare-fun m!969887 () Bool)

(assert (=> b!1049052 m!969887))

(declare-fun m!969889 () Bool)

(assert (=> start!92302 m!969889))

(declare-fun m!969891 () Bool)

(assert (=> b!1049049 m!969891))

(declare-fun m!969893 () Bool)

(assert (=> b!1049049 m!969893))

(assert (=> b!1049054 m!969893))

(declare-fun m!969895 () Bool)

(assert (=> b!1049054 m!969895))

(declare-fun m!969897 () Bool)

(assert (=> b!1049051 m!969897))

(push 1)

