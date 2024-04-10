; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92294 () Bool)

(assert start!92294)

(declare-fun b!1048938 () Bool)

(declare-fun e!595041 () Bool)

(declare-fun e!595040 () Bool)

(assert (=> b!1048938 (= e!595041 e!595040)))

(declare-fun res!698064 () Bool)

(assert (=> b!1048938 (=> (not res!698064) (not e!595040))))

(declare-fun lt!463335 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048938 (= res!698064 (not (= lt!463335 i!1381)))))

(declare-datatypes ((array!66095 0))(
  ( (array!66096 (arr!31787 (Array (_ BitVec 32) (_ BitVec 64))) (size!32323 (_ BitVec 32))) )
))
(declare-fun lt!463334 () array!66095)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66095 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048938 (= lt!463335 (arrayScanForKey!0 lt!463334 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!698066 () Bool)

(declare-fun e!595045 () Bool)

(assert (=> start!92294 (=> (not res!698066) (not e!595045))))

(declare-fun a!3488 () array!66095)

(assert (=> start!92294 (= res!698066 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32323 a!3488)) (bvslt (size!32323 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92294 e!595045))

(assert (=> start!92294 true))

(declare-fun array_inv!24567 (array!66095) Bool)

(assert (=> start!92294 (array_inv!24567 a!3488)))

(declare-fun e!595043 () Bool)

(declare-fun b!1048939 () Bool)

(declare-fun arrayContainsKey!0 (array!66095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048939 (= e!595043 (arrayContainsKey!0 a!3488 k0!2747 lt!463335))))

(declare-fun b!1048940 () Bool)

(assert (=> b!1048940 (= e!595045 e!595041)))

(declare-fun res!698072 () Bool)

(assert (=> b!1048940 (=> (not res!698072) (not e!595041))))

(assert (=> b!1048940 (= res!698072 (arrayContainsKey!0 lt!463334 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048940 (= lt!463334 (array!66096 (store (arr!31787 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32323 a!3488)))))

(declare-fun b!1048941 () Bool)

(declare-fun res!698065 () Bool)

(assert (=> b!1048941 (=> (not res!698065) (not e!595045))))

(assert (=> b!1048941 (= res!698065 (= (select (arr!31787 a!3488) i!1381) k0!2747))))

(declare-fun b!1048942 () Bool)

(declare-fun e!595044 () Bool)

(assert (=> b!1048942 (= e!595044 e!595043)))

(declare-fun res!698067 () Bool)

(assert (=> b!1048942 (=> res!698067 e!595043)))

(assert (=> b!1048942 (= res!698067 (bvsle lt!463335 i!1381))))

(declare-fun b!1048943 () Bool)

(declare-fun res!698071 () Bool)

(assert (=> b!1048943 (=> (not res!698071) (not e!595045))))

(declare-datatypes ((List!22099 0))(
  ( (Nil!22096) (Cons!22095 (h!23304 (_ BitVec 64)) (t!31406 List!22099)) )
))
(declare-fun arrayNoDuplicates!0 (array!66095 (_ BitVec 32) List!22099) Bool)

(assert (=> b!1048943 (= res!698071 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22096))))

(declare-fun b!1048944 () Bool)

(declare-fun e!595042 () Bool)

(assert (=> b!1048944 (= e!595040 (not e!595042))))

(declare-fun res!698070 () Bool)

(assert (=> b!1048944 (=> res!698070 e!595042)))

(assert (=> b!1048944 (= res!698070 (bvsle lt!463335 i!1381))))

(assert (=> b!1048944 e!595044))

(declare-fun res!698069 () Bool)

(assert (=> b!1048944 (=> (not res!698069) (not e!595044))))

(assert (=> b!1048944 (= res!698069 (= (select (store (arr!31787 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463335) k0!2747))))

(declare-fun b!1048945 () Bool)

(assert (=> b!1048945 (= e!595042 true)))

(assert (=> b!1048945 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22096)))

(declare-datatypes ((Unit!34294 0))(
  ( (Unit!34295) )
))
(declare-fun lt!463333 () Unit!34294)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66095 (_ BitVec 32) (_ BitVec 32)) Unit!34294)

(assert (=> b!1048945 (= lt!463333 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048946 () Bool)

(declare-fun res!698068 () Bool)

(assert (=> b!1048946 (=> (not res!698068) (not e!595045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048946 (= res!698068 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92294 res!698066) b!1048943))

(assert (= (and b!1048943 res!698071) b!1048946))

(assert (= (and b!1048946 res!698068) b!1048941))

(assert (= (and b!1048941 res!698065) b!1048940))

(assert (= (and b!1048940 res!698072) b!1048938))

(assert (= (and b!1048938 res!698064) b!1048944))

(assert (= (and b!1048944 res!698069) b!1048942))

(assert (= (and b!1048942 (not res!698067)) b!1048939))

(assert (= (and b!1048944 (not res!698070)) b!1048945))

(declare-fun m!969789 () Bool)

(assert (=> b!1048940 m!969789))

(declare-fun m!969791 () Bool)

(assert (=> b!1048940 m!969791))

(declare-fun m!969793 () Bool)

(assert (=> b!1048938 m!969793))

(declare-fun m!969795 () Bool)

(assert (=> start!92294 m!969795))

(declare-fun m!969797 () Bool)

(assert (=> b!1048943 m!969797))

(declare-fun m!969799 () Bool)

(assert (=> b!1048945 m!969799))

(declare-fun m!969801 () Bool)

(assert (=> b!1048945 m!969801))

(declare-fun m!969803 () Bool)

(assert (=> b!1048941 m!969803))

(assert (=> b!1048944 m!969791))

(declare-fun m!969805 () Bool)

(assert (=> b!1048944 m!969805))

(declare-fun m!969807 () Bool)

(assert (=> b!1048939 m!969807))

(declare-fun m!969809 () Bool)

(assert (=> b!1048946 m!969809))

(check-sat (not b!1048940) (not b!1048938) (not b!1048939) (not start!92294) (not b!1048945) (not b!1048943) (not b!1048946))
(check-sat)
