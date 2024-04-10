; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135520 () Bool)

(assert start!135520)

(declare-fun res!1075575 () Bool)

(declare-fun e!877955 () Bool)

(assert (=> start!135520 (=> (not res!1075575) (not e!877955))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135520 (= res!1075575 (validMask!0 mask!877))))

(assert (=> start!135520 e!877955))

(assert (=> start!135520 true))

(declare-datatypes ((array!105223 0))(
  ( (array!105224 (arr!50760 (Array (_ BitVec 32) (_ BitVec 64))) (size!51310 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105223)

(declare-fun array_inv!39487 (array!105223) Bool)

(assert (=> start!135520 (array_inv!39487 _keys!591)))

(declare-fun b!1574281 () Bool)

(declare-fun res!1075574 () Bool)

(assert (=> b!1574281 (=> (not res!1075574) (not e!877955))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574281 (= res!1075574 (and (= (size!51310 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51310 _keys!591)) (bvslt i!537 (size!51310 _keys!591))))))

(declare-fun b!1574282 () Bool)

(declare-fun res!1075573 () Bool)

(assert (=> b!1574282 (=> (not res!1075573) (not e!877955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574282 (= res!1075573 (validKeyInArray!0 (select (arr!50760 _keys!591) i!537)))))

(declare-fun b!1574283 () Bool)

(assert (=> b!1574283 (= e!877955 (not true))))

(declare-fun arrayContainsKey!0 (array!105223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574283 (arrayContainsKey!0 _keys!591 (select (arr!50760 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52166 0))(
  ( (Unit!52167) )
))
(declare-fun lt!674767 () Unit!52166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105223 (_ BitVec 64) (_ BitVec 32)) Unit!52166)

(assert (=> b!1574283 (= lt!674767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50760 _keys!591) i!537) i!537))))

(assert (= (and start!135520 res!1075575) b!1574281))

(assert (= (and b!1574281 res!1075574) b!1574282))

(assert (= (and b!1574282 res!1075573) b!1574283))

(declare-fun m!1447525 () Bool)

(assert (=> start!135520 m!1447525))

(declare-fun m!1447527 () Bool)

(assert (=> start!135520 m!1447527))

(declare-fun m!1447529 () Bool)

(assert (=> b!1574282 m!1447529))

(assert (=> b!1574282 m!1447529))

(declare-fun m!1447531 () Bool)

(assert (=> b!1574282 m!1447531))

(assert (=> b!1574283 m!1447529))

(assert (=> b!1574283 m!1447529))

(declare-fun m!1447533 () Bool)

(assert (=> b!1574283 m!1447533))

(assert (=> b!1574283 m!1447529))

(declare-fun m!1447535 () Bool)

(assert (=> b!1574283 m!1447535))

(push 1)

