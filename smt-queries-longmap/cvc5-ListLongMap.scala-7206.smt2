; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92298 () Bool)

(assert start!92298)

(declare-fun b!1048992 () Bool)

(declare-fun res!698126 () Bool)

(declare-fun e!595086 () Bool)

(assert (=> b!1048992 (=> (not res!698126) (not e!595086))))

(declare-datatypes ((array!66099 0))(
  ( (array!66100 (arr!31789 (Array (_ BitVec 32) (_ BitVec 64))) (size!32325 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66099)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048992 (= res!698126 (= (select (arr!31789 a!3488) i!1381) k!2747))))

(declare-fun res!698118 () Bool)

(assert (=> start!92298 (=> (not res!698118) (not e!595086))))

(assert (=> start!92298 (= res!698118 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32325 a!3488)) (bvslt (size!32325 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92298 e!595086))

(assert (=> start!92298 true))

(declare-fun array_inv!24569 (array!66099) Bool)

(assert (=> start!92298 (array_inv!24569 a!3488)))

(declare-fun b!1048993 () Bool)

(declare-fun res!698123 () Bool)

(assert (=> b!1048993 (=> (not res!698123) (not e!595086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048993 (= res!698123 (validKeyInArray!0 k!2747))))

(declare-fun b!1048994 () Bool)

(declare-fun res!698119 () Bool)

(assert (=> b!1048994 (=> (not res!698119) (not e!595086))))

(declare-datatypes ((List!22101 0))(
  ( (Nil!22098) (Cons!22097 (h!23306 (_ BitVec 64)) (t!31408 List!22101)) )
))
(declare-fun arrayNoDuplicates!0 (array!66099 (_ BitVec 32) List!22101) Bool)

(assert (=> b!1048994 (= res!698119 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22098))))

(declare-fun b!1048995 () Bool)

(declare-fun e!595081 () Bool)

(declare-fun e!595085 () Bool)

(assert (=> b!1048995 (= e!595081 e!595085)))

(declare-fun res!698125 () Bool)

(assert (=> b!1048995 (=> (not res!698125) (not e!595085))))

(declare-fun lt!463351 () (_ BitVec 32))

(assert (=> b!1048995 (= res!698125 (not (= lt!463351 i!1381)))))

(declare-fun lt!463353 () array!66099)

(declare-fun arrayScanForKey!0 (array!66099 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048995 (= lt!463351 (arrayScanForKey!0 lt!463353 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048996 () Bool)

(declare-fun e!595083 () Bool)

(assert (=> b!1048996 (= e!595085 (not e!595083))))

(declare-fun res!698124 () Bool)

(assert (=> b!1048996 (=> res!698124 e!595083)))

(assert (=> b!1048996 (= res!698124 (bvsle lt!463351 i!1381))))

(declare-fun e!595082 () Bool)

(assert (=> b!1048996 e!595082))

(declare-fun res!698121 () Bool)

(assert (=> b!1048996 (=> (not res!698121) (not e!595082))))

(assert (=> b!1048996 (= res!698121 (= (select (store (arr!31789 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463351) k!2747))))

(declare-fun b!1048997 () Bool)

(declare-fun e!595084 () Bool)

(declare-fun arrayContainsKey!0 (array!66099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048997 (= e!595084 (arrayContainsKey!0 a!3488 k!2747 lt!463351))))

(declare-fun b!1048998 () Bool)

(assert (=> b!1048998 (= e!595083 true)))

(assert (=> b!1048998 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22098)))

(declare-datatypes ((Unit!34298 0))(
  ( (Unit!34299) )
))
(declare-fun lt!463352 () Unit!34298)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66099 (_ BitVec 32) (_ BitVec 32)) Unit!34298)

(assert (=> b!1048998 (= lt!463352 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048999 () Bool)

(assert (=> b!1048999 (= e!595086 e!595081)))

(declare-fun res!698122 () Bool)

(assert (=> b!1048999 (=> (not res!698122) (not e!595081))))

(assert (=> b!1048999 (= res!698122 (arrayContainsKey!0 lt!463353 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048999 (= lt!463353 (array!66100 (store (arr!31789 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32325 a!3488)))))

(declare-fun b!1049000 () Bool)

(assert (=> b!1049000 (= e!595082 e!595084)))

(declare-fun res!698120 () Bool)

(assert (=> b!1049000 (=> res!698120 e!595084)))

(assert (=> b!1049000 (= res!698120 (bvsle lt!463351 i!1381))))

(assert (= (and start!92298 res!698118) b!1048994))

(assert (= (and b!1048994 res!698119) b!1048993))

(assert (= (and b!1048993 res!698123) b!1048992))

(assert (= (and b!1048992 res!698126) b!1048999))

(assert (= (and b!1048999 res!698122) b!1048995))

(assert (= (and b!1048995 res!698125) b!1048996))

(assert (= (and b!1048996 res!698121) b!1049000))

(assert (= (and b!1049000 (not res!698120)) b!1048997))

(assert (= (and b!1048996 (not res!698124)) b!1048998))

(declare-fun m!969833 () Bool)

(assert (=> b!1048992 m!969833))

(declare-fun m!969835 () Bool)

(assert (=> b!1048997 m!969835))

(declare-fun m!969837 () Bool)

(assert (=> b!1048994 m!969837))

(declare-fun m!969839 () Bool)

(assert (=> b!1048998 m!969839))

(declare-fun m!969841 () Bool)

(assert (=> b!1048998 m!969841))

(declare-fun m!969843 () Bool)

(assert (=> start!92298 m!969843))

(declare-fun m!969845 () Bool)

(assert (=> b!1048999 m!969845))

(declare-fun m!969847 () Bool)

(assert (=> b!1048999 m!969847))

(declare-fun m!969849 () Bool)

(assert (=> b!1048993 m!969849))

(declare-fun m!969851 () Bool)

(assert (=> b!1048995 m!969851))

(assert (=> b!1048996 m!969847))

(declare-fun m!969853 () Bool)

(assert (=> b!1048996 m!969853))

(push 1)

