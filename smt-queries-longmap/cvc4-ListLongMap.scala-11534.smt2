; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134292 () Bool)

(assert start!134292)

(declare-fun b!1568380 () Bool)

(declare-fun e!874323 () Bool)

(assert (=> b!1568380 (= e!874323 false)))

(declare-fun lt!673174 () Bool)

(declare-fun e!874324 () Bool)

(assert (=> b!1568380 (= lt!673174 e!874324)))

(declare-fun res!1072068 () Bool)

(assert (=> b!1568380 (=> res!1072068 e!874324)))

(declare-datatypes ((array!104782 0))(
  ( (array!104783 (arr!50571 (Array (_ BitVec 32) (_ BitVec 64))) (size!51121 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104782)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568380 (= res!1072068 (not (validKeyInArray!0 (select (arr!50571 a!3481) from!2856))))))

(declare-fun b!1568381 () Bool)

(declare-fun res!1072070 () Bool)

(assert (=> b!1568381 (=> (not res!1072070) (not e!874323))))

(declare-datatypes ((List!36703 0))(
  ( (Nil!36700) (Cons!36699 (h!38146 (_ BitVec 64)) (t!51611 List!36703)) )
))
(declare-fun acc!619 () List!36703)

(declare-fun contains!10405 (List!36703 (_ BitVec 64)) Bool)

(assert (=> b!1568381 (= res!1072070 (not (contains!10405 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568382 () Bool)

(declare-fun res!1072071 () Bool)

(assert (=> b!1568382 (=> (not res!1072071) (not e!874323))))

(assert (=> b!1568382 (= res!1072071 (bvslt from!2856 (size!51121 a!3481)))))

(declare-fun b!1568383 () Bool)

(assert (=> b!1568383 (= e!874324 (not (contains!10405 acc!619 (select (arr!50571 a!3481) from!2856))))))

(declare-fun b!1568385 () Bool)

(declare-fun res!1072066 () Bool)

(assert (=> b!1568385 (=> (not res!1072066) (not e!874323))))

(assert (=> b!1568385 (= res!1072066 (not (contains!10405 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568384 () Bool)

(declare-fun res!1072067 () Bool)

(assert (=> b!1568384 (=> (not res!1072067) (not e!874323))))

(declare-fun noDuplicate!2677 (List!36703) Bool)

(assert (=> b!1568384 (= res!1072067 (noDuplicate!2677 acc!619))))

(declare-fun res!1072069 () Bool)

(assert (=> start!134292 (=> (not res!1072069) (not e!874323))))

(assert (=> start!134292 (= res!1072069 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51121 a!3481)) (bvslt (size!51121 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134292 e!874323))

(assert (=> start!134292 true))

(declare-fun array_inv!39298 (array!104782) Bool)

(assert (=> start!134292 (array_inv!39298 a!3481)))

(assert (= (and start!134292 res!1072069) b!1568384))

(assert (= (and b!1568384 res!1072067) b!1568381))

(assert (= (and b!1568381 res!1072070) b!1568385))

(assert (= (and b!1568385 res!1072066) b!1568382))

(assert (= (and b!1568382 res!1072071) b!1568380))

(assert (= (and b!1568380 (not res!1072068)) b!1568383))

(declare-fun m!1443059 () Bool)

(assert (=> b!1568384 m!1443059))

(declare-fun m!1443061 () Bool)

(assert (=> b!1568385 m!1443061))

(declare-fun m!1443063 () Bool)

(assert (=> b!1568381 m!1443063))

(declare-fun m!1443065 () Bool)

(assert (=> b!1568380 m!1443065))

(assert (=> b!1568380 m!1443065))

(declare-fun m!1443067 () Bool)

(assert (=> b!1568380 m!1443067))

(declare-fun m!1443069 () Bool)

(assert (=> start!134292 m!1443069))

(assert (=> b!1568383 m!1443065))

(assert (=> b!1568383 m!1443065))

(declare-fun m!1443071 () Bool)

(assert (=> b!1568383 m!1443071))

(push 1)

(assert (not b!1568384))

(assert (not b!1568383))

(assert (not b!1568380))

(assert (not b!1568385))

(assert (not start!134292))

(assert (not b!1568381))

(check-sat)

