; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93112 () Bool)

(assert start!93112)

(declare-fun b!1056169 () Bool)

(declare-fun e!600393 () Bool)

(declare-fun e!600394 () Bool)

(assert (=> b!1056169 (= e!600393 e!600394)))

(declare-fun res!704952 () Bool)

(assert (=> b!1056169 (=> (not res!704952) (not e!600394))))

(declare-datatypes ((array!66610 0))(
  ( (array!66611 (arr!32031 (Array (_ BitVec 32) (_ BitVec 64))) (size!32567 (_ BitVec 32))) )
))
(declare-fun lt!466046 () array!66610)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056169 (= res!704952 (arrayContainsKey!0 lt!466046 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66610)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056169 (= lt!466046 (array!66611 (store (arr!32031 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32567 a!3488)))))

(declare-fun b!1056170 () Bool)

(declare-fun res!704951 () Bool)

(assert (=> b!1056170 (=> (not res!704951) (not e!600393))))

(declare-datatypes ((List!22343 0))(
  ( (Nil!22340) (Cons!22339 (h!23548 (_ BitVec 64)) (t!31650 List!22343)) )
))
(declare-fun arrayNoDuplicates!0 (array!66610 (_ BitVec 32) List!22343) Bool)

(assert (=> b!1056170 (= res!704951 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22340))))

(declare-fun res!704950 () Bool)

(assert (=> start!93112 (=> (not res!704950) (not e!600393))))

(assert (=> start!93112 (= res!704950 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32567 a!3488)) (bvslt (size!32567 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93112 e!600393))

(assert (=> start!93112 true))

(declare-fun array_inv!24811 (array!66610) Bool)

(assert (=> start!93112 (array_inv!24811 a!3488)))

(declare-fun b!1056171 () Bool)

(declare-fun res!704947 () Bool)

(assert (=> b!1056171 (=> (not res!704947) (not e!600393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056171 (= res!704947 (validKeyInArray!0 k!2747))))

(declare-fun e!600390 () Bool)

(declare-fun b!1056172 () Bool)

(assert (=> b!1056172 (= e!600390 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056173 () Bool)

(declare-fun res!704949 () Bool)

(assert (=> b!1056173 (=> (not res!704949) (not e!600393))))

(assert (=> b!1056173 (= res!704949 (= (select (arr!32031 a!3488) i!1381) k!2747))))

(declare-fun b!1056174 () Bool)

(declare-fun e!600389 () Bool)

(assert (=> b!1056174 (= e!600394 e!600389)))

(declare-fun res!704953 () Bool)

(assert (=> b!1056174 (=> (not res!704953) (not e!600389))))

(declare-fun lt!466047 () (_ BitVec 32))

(assert (=> b!1056174 (= res!704953 (not (= lt!466047 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66610 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056174 (= lt!466047 (arrayScanForKey!0 lt!466046 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056175 () Bool)

(declare-fun e!600391 () Bool)

(assert (=> b!1056175 (= e!600391 e!600390)))

(declare-fun res!704954 () Bool)

(assert (=> b!1056175 (=> res!704954 e!600390)))

(assert (=> b!1056175 (= res!704954 (or (bvsgt lt!466047 i!1381) (bvsle i!1381 lt!466047)))))

(declare-fun b!1056176 () Bool)

(assert (=> b!1056176 (= e!600389 (not true))))

(assert (=> b!1056176 e!600391))

(declare-fun res!704948 () Bool)

(assert (=> b!1056176 (=> (not res!704948) (not e!600391))))

(assert (=> b!1056176 (= res!704948 (= (select (store (arr!32031 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466047) k!2747))))

(assert (= (and start!93112 res!704950) b!1056170))

(assert (= (and b!1056170 res!704951) b!1056171))

(assert (= (and b!1056171 res!704947) b!1056173))

(assert (= (and b!1056173 res!704949) b!1056169))

(assert (= (and b!1056169 res!704952) b!1056174))

(assert (= (and b!1056174 res!704953) b!1056176))

(assert (= (and b!1056176 res!704948) b!1056175))

(assert (= (and b!1056175 (not res!704954)) b!1056172))

(declare-fun m!976097 () Bool)

(assert (=> b!1056169 m!976097))

(declare-fun m!976099 () Bool)

(assert (=> b!1056169 m!976099))

(declare-fun m!976101 () Bool)

(assert (=> b!1056174 m!976101))

(declare-fun m!976103 () Bool)

(assert (=> b!1056172 m!976103))

(declare-fun m!976105 () Bool)

(assert (=> b!1056171 m!976105))

(declare-fun m!976107 () Bool)

(assert (=> b!1056170 m!976107))

(declare-fun m!976109 () Bool)

(assert (=> start!93112 m!976109))

(assert (=> b!1056176 m!976099))

(declare-fun m!976111 () Bool)

(assert (=> b!1056176 m!976111))

(declare-fun m!976113 () Bool)

(assert (=> b!1056173 m!976113))

(push 1)

(assert (not b!1056171))

(assert (not b!1056170))

(assert (not b!1056172))

(assert (not b!1056174))

(assert (not b!1056169))

(assert (not start!93112))

(check-sat)

