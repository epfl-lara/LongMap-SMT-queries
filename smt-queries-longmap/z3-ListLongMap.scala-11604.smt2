; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135432 () Bool)

(assert start!135432)

(declare-fun res!1075287 () Bool)

(declare-fun e!877759 () Bool)

(assert (=> start!135432 (=> (not res!1075287) (not e!877759))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135432 (= res!1075287 (validMask!0 mask!877))))

(assert (=> start!135432 e!877759))

(assert (=> start!135432 true))

(declare-datatypes ((array!105163 0))(
  ( (array!105164 (arr!50732 (Array (_ BitVec 32) (_ BitVec 64))) (size!51282 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105163)

(declare-fun array_inv!39459 (array!105163) Bool)

(assert (=> start!135432 (array_inv!39459 _keys!591)))

(declare-fun b!1573993 () Bool)

(declare-fun res!1075285 () Bool)

(assert (=> b!1573993 (=> (not res!1075285) (not e!877759))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573993 (= res!1075285 (and (= (size!51282 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51282 _keys!591)) (bvslt i!537 (size!51282 _keys!591))))))

(declare-fun b!1573994 () Bool)

(declare-fun res!1075286 () Bool)

(assert (=> b!1573994 (=> (not res!1075286) (not e!877759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573994 (= res!1075286 (validKeyInArray!0 (select (arr!50732 _keys!591) i!537)))))

(declare-fun b!1573995 () Bool)

(assert (=> b!1573995 (= e!877759 (not true))))

(declare-fun arrayContainsKey!0 (array!105163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573995 (arrayContainsKey!0 _keys!591 (select (arr!50732 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52128 0))(
  ( (Unit!52129) )
))
(declare-fun lt!674683 () Unit!52128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105163 (_ BitVec 64) (_ BitVec 32)) Unit!52128)

(assert (=> b!1573995 (= lt!674683 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50732 _keys!591) i!537) i!537))))

(assert (= (and start!135432 res!1075287) b!1573993))

(assert (= (and b!1573993 res!1075285) b!1573994))

(assert (= (and b!1573994 res!1075286) b!1573995))

(declare-fun m!1447189 () Bool)

(assert (=> start!135432 m!1447189))

(declare-fun m!1447191 () Bool)

(assert (=> start!135432 m!1447191))

(declare-fun m!1447193 () Bool)

(assert (=> b!1573994 m!1447193))

(assert (=> b!1573994 m!1447193))

(declare-fun m!1447195 () Bool)

(assert (=> b!1573994 m!1447195))

(assert (=> b!1573995 m!1447193))

(assert (=> b!1573995 m!1447193))

(declare-fun m!1447197 () Bool)

(assert (=> b!1573995 m!1447197))

(assert (=> b!1573995 m!1447193))

(declare-fun m!1447199 () Bool)

(assert (=> b!1573995 m!1447199))

(check-sat (not b!1573994) (not b!1573995) (not start!135432))
