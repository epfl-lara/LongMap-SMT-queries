; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92304 () Bool)

(assert start!92304)

(declare-fun b!1049073 () Bool)

(declare-fun e!595145 () Bool)

(assert (=> b!1049073 (= e!595145 true)))

(declare-datatypes ((array!66105 0))(
  ( (array!66106 (arr!31792 (Array (_ BitVec 32) (_ BitVec 64))) (size!32328 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66105)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22104 0))(
  ( (Nil!22101) (Cons!22100 (h!23309 (_ BitVec 64)) (t!31411 List!22104)) )
))
(declare-fun arrayNoDuplicates!0 (array!66105 (_ BitVec 32) List!22104) Bool)

(assert (=> b!1049073 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22101)))

(declare-datatypes ((Unit!34304 0))(
  ( (Unit!34305) )
))
(declare-fun lt!463379 () Unit!34304)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66105 (_ BitVec 32) (_ BitVec 32)) Unit!34304)

(assert (=> b!1049073 (= lt!463379 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049074 () Bool)

(declare-fun lt!463378 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun e!595148 () Bool)

(declare-fun arrayContainsKey!0 (array!66105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049074 (= e!595148 (arrayContainsKey!0 a!3488 k!2747 lt!463378))))

(declare-fun res!698205 () Bool)

(declare-fun e!595150 () Bool)

(assert (=> start!92304 (=> (not res!698205) (not e!595150))))

(assert (=> start!92304 (= res!698205 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32328 a!3488)) (bvslt (size!32328 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92304 e!595150))

(assert (=> start!92304 true))

(declare-fun array_inv!24572 (array!66105) Bool)

(assert (=> start!92304 (array_inv!24572 a!3488)))

(declare-fun b!1049075 () Bool)

(declare-fun e!595146 () Bool)

(assert (=> b!1049075 (= e!595150 e!595146)))

(declare-fun res!698207 () Bool)

(assert (=> b!1049075 (=> (not res!698207) (not e!595146))))

(declare-fun lt!463380 () array!66105)

(assert (=> b!1049075 (= res!698207 (arrayContainsKey!0 lt!463380 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049075 (= lt!463380 (array!66106 (store (arr!31792 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32328 a!3488)))))

(declare-fun b!1049076 () Bool)

(declare-fun e!595147 () Bool)

(assert (=> b!1049076 (= e!595146 e!595147)))

(declare-fun res!698201 () Bool)

(assert (=> b!1049076 (=> (not res!698201) (not e!595147))))

(assert (=> b!1049076 (= res!698201 (not (= lt!463378 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66105 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049076 (= lt!463378 (arrayScanForKey!0 lt!463380 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049077 () Bool)

(declare-fun res!698204 () Bool)

(assert (=> b!1049077 (=> (not res!698204) (not e!595150))))

(assert (=> b!1049077 (= res!698204 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22101))))

(declare-fun b!1049078 () Bool)

(assert (=> b!1049078 (= e!595147 (not e!595145))))

(declare-fun res!698206 () Bool)

(assert (=> b!1049078 (=> res!698206 e!595145)))

(assert (=> b!1049078 (= res!698206 (bvsle lt!463378 i!1381))))

(declare-fun e!595144 () Bool)

(assert (=> b!1049078 e!595144))

(declare-fun res!698203 () Bool)

(assert (=> b!1049078 (=> (not res!698203) (not e!595144))))

(assert (=> b!1049078 (= res!698203 (= (select (store (arr!31792 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463378) k!2747))))

(declare-fun b!1049079 () Bool)

(assert (=> b!1049079 (= e!595144 e!595148)))

(declare-fun res!698199 () Bool)

(assert (=> b!1049079 (=> res!698199 e!595148)))

(assert (=> b!1049079 (= res!698199 (bvsle lt!463378 i!1381))))

(declare-fun b!1049080 () Bool)

(declare-fun res!698200 () Bool)

(assert (=> b!1049080 (=> (not res!698200) (not e!595150))))

(assert (=> b!1049080 (= res!698200 (= (select (arr!31792 a!3488) i!1381) k!2747))))

(declare-fun b!1049081 () Bool)

(declare-fun res!698202 () Bool)

(assert (=> b!1049081 (=> (not res!698202) (not e!595150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049081 (= res!698202 (validKeyInArray!0 k!2747))))

(assert (= (and start!92304 res!698205) b!1049077))

(assert (= (and b!1049077 res!698204) b!1049081))

(assert (= (and b!1049081 res!698202) b!1049080))

(assert (= (and b!1049080 res!698200) b!1049075))

(assert (= (and b!1049075 res!698207) b!1049076))

(assert (= (and b!1049076 res!698201) b!1049078))

(assert (= (and b!1049078 res!698203) b!1049079))

(assert (= (and b!1049079 (not res!698199)) b!1049074))

(assert (= (and b!1049078 (not res!698206)) b!1049073))

(declare-fun m!969899 () Bool)

(assert (=> b!1049075 m!969899))

(declare-fun m!969901 () Bool)

(assert (=> b!1049075 m!969901))

(declare-fun m!969903 () Bool)

(assert (=> b!1049077 m!969903))

(assert (=> b!1049078 m!969901))

(declare-fun m!969905 () Bool)

(assert (=> b!1049078 m!969905))

(declare-fun m!969907 () Bool)

(assert (=> start!92304 m!969907))

(declare-fun m!969909 () Bool)

(assert (=> b!1049076 m!969909))

(declare-fun m!969911 () Bool)

(assert (=> b!1049080 m!969911))

(declare-fun m!969913 () Bool)

(assert (=> b!1049081 m!969913))

(declare-fun m!969915 () Bool)

(assert (=> b!1049073 m!969915))

(declare-fun m!969917 () Bool)

(assert (=> b!1049073 m!969917))

(declare-fun m!969919 () Bool)

(assert (=> b!1049074 m!969919))

(push 1)

(assert (not b!1049075))

(assert (not b!1049076))

(assert (not b!1049074))

(assert (not start!92304))

(assert (not b!1049073))

(assert (not b!1049081))

(assert (not b!1049077))

(check-sat)

