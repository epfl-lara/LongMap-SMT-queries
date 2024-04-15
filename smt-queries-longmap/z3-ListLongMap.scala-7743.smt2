; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97196 () Bool)

(assert start!97196)

(declare-fun b!1105800 () Bool)

(declare-fun e!631057 () Bool)

(declare-fun e!631059 () Bool)

(declare-fun mapRes!42967 () Bool)

(assert (=> b!1105800 (= e!631057 (and e!631059 mapRes!42967))))

(declare-fun condMapEmpty!42967 () Bool)

(declare-datatypes ((V!41705 0))(
  ( (V!41706 (val!13773 Int)) )
))
(declare-datatypes ((ValueCell!13007 0))(
  ( (ValueCellFull!13007 (v!16405 V!41705)) (EmptyCell!13007) )
))
(declare-datatypes ((array!71698 0))(
  ( (array!71699 (arr!34502 (Array (_ BitVec 32) ValueCell!13007)) (size!35040 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71698)

(declare-fun mapDefault!42967 () ValueCell!13007)

(assert (=> b!1105800 (= condMapEmpty!42967 (= (arr!34502 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13007)) mapDefault!42967)))))

(declare-fun b!1105801 () Bool)

(declare-fun res!737929 () Bool)

(declare-fun e!631060 () Bool)

(assert (=> b!1105801 (=> (not res!737929) (not e!631060))))

(declare-datatypes ((array!71700 0))(
  ( (array!71701 (arr!34503 (Array (_ BitVec 32) (_ BitVec 64))) (size!35041 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71700)

(declare-datatypes ((List!24118 0))(
  ( (Nil!24115) (Cons!24114 (h!25323 (_ BitVec 64)) (t!34374 List!24118)) )
))
(declare-fun arrayNoDuplicates!0 (array!71700 (_ BitVec 32) List!24118) Bool)

(assert (=> b!1105801 (= res!737929 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24115))))

(declare-fun mapIsEmpty!42967 () Bool)

(assert (=> mapIsEmpty!42967 mapRes!42967))

(declare-fun b!1105802 () Bool)

(declare-fun e!631061 () Bool)

(declare-fun tp_is_empty!27433 () Bool)

(assert (=> b!1105802 (= e!631061 tp_is_empty!27433)))

(declare-fun b!1105803 () Bool)

(declare-fun e!631062 () Bool)

(assert (=> b!1105803 (= e!631060 e!631062)))

(declare-fun res!737928 () Bool)

(assert (=> b!1105803 (=> (not res!737928) (not e!631062))))

(declare-fun lt!495186 () array!71700)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71700 (_ BitVec 32)) Bool)

(assert (=> b!1105803 (= res!737928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495186 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105803 (= lt!495186 (array!71701 (store (arr!34503 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35041 _keys!1208)))))

(declare-fun b!1105804 () Bool)

(declare-fun res!737925 () Bool)

(assert (=> b!1105804 (=> (not res!737925) (not e!631060))))

(assert (=> b!1105804 (= res!737925 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35041 _keys!1208))))))

(declare-fun res!737923 () Bool)

(assert (=> start!97196 (=> (not res!737923) (not e!631060))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97196 (= res!737923 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35041 _keys!1208))))))

(assert (=> start!97196 e!631060))

(declare-fun array_inv!26608 (array!71700) Bool)

(assert (=> start!97196 (array_inv!26608 _keys!1208)))

(assert (=> start!97196 true))

(declare-fun array_inv!26609 (array!71698) Bool)

(assert (=> start!97196 (and (array_inv!26609 _values!996) e!631057)))

(declare-fun b!1105805 () Bool)

(declare-fun res!737920 () Bool)

(assert (=> b!1105805 (=> (not res!737920) (not e!631062))))

(assert (=> b!1105805 (= res!737920 (arrayNoDuplicates!0 lt!495186 #b00000000000000000000000000000000 Nil!24115))))

(declare-fun b!1105806 () Bool)

(declare-fun res!737924 () Bool)

(assert (=> b!1105806 (=> (not res!737924) (not e!631060))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105806 (= res!737924 (= (select (arr!34503 _keys!1208) i!673) k0!934))))

(declare-fun b!1105807 () Bool)

(assert (=> b!1105807 (= e!631062 (not true))))

(declare-fun arrayContainsKey!0 (array!71700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105807 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36111 0))(
  ( (Unit!36112) )
))
(declare-fun lt!495185 () Unit!36111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71700 (_ BitVec 64) (_ BitVec 32)) Unit!36111)

(assert (=> b!1105807 (= lt!495185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!42967 () Bool)

(declare-fun tp!81887 () Bool)

(assert (=> mapNonEmpty!42967 (= mapRes!42967 (and tp!81887 e!631061))))

(declare-fun mapRest!42967 () (Array (_ BitVec 32) ValueCell!13007))

(declare-fun mapKey!42967 () (_ BitVec 32))

(declare-fun mapValue!42967 () ValueCell!13007)

(assert (=> mapNonEmpty!42967 (= (arr!34502 _values!996) (store mapRest!42967 mapKey!42967 mapValue!42967))))

(declare-fun b!1105808 () Bool)

(declare-fun res!737926 () Bool)

(assert (=> b!1105808 (=> (not res!737926) (not e!631060))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105808 (= res!737926 (and (= (size!35040 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35041 _keys!1208) (size!35040 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105809 () Bool)

(declare-fun res!737922 () Bool)

(assert (=> b!1105809 (=> (not res!737922) (not e!631060))))

(assert (=> b!1105809 (= res!737922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105810 () Bool)

(assert (=> b!1105810 (= e!631059 tp_is_empty!27433)))

(declare-fun b!1105811 () Bool)

(declare-fun res!737921 () Bool)

(assert (=> b!1105811 (=> (not res!737921) (not e!631060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105811 (= res!737921 (validKeyInArray!0 k0!934))))

(declare-fun b!1105812 () Bool)

(declare-fun res!737927 () Bool)

(assert (=> b!1105812 (=> (not res!737927) (not e!631060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105812 (= res!737927 (validMask!0 mask!1564))))

(assert (= (and start!97196 res!737923) b!1105812))

(assert (= (and b!1105812 res!737927) b!1105808))

(assert (= (and b!1105808 res!737926) b!1105809))

(assert (= (and b!1105809 res!737922) b!1105801))

(assert (= (and b!1105801 res!737929) b!1105804))

(assert (= (and b!1105804 res!737925) b!1105811))

(assert (= (and b!1105811 res!737921) b!1105806))

(assert (= (and b!1105806 res!737924) b!1105803))

(assert (= (and b!1105803 res!737928) b!1105805))

(assert (= (and b!1105805 res!737920) b!1105807))

(assert (= (and b!1105800 condMapEmpty!42967) mapIsEmpty!42967))

(assert (= (and b!1105800 (not condMapEmpty!42967)) mapNonEmpty!42967))

(get-info :version)

(assert (= (and mapNonEmpty!42967 ((_ is ValueCellFull!13007) mapValue!42967)) b!1105802))

(assert (= (and b!1105800 ((_ is ValueCellFull!13007) mapDefault!42967)) b!1105810))

(assert (= start!97196 b!1105800))

(declare-fun m!1024551 () Bool)

(assert (=> b!1105803 m!1024551))

(declare-fun m!1024553 () Bool)

(assert (=> b!1105803 m!1024553))

(declare-fun m!1024555 () Bool)

(assert (=> b!1105812 m!1024555))

(declare-fun m!1024557 () Bool)

(assert (=> b!1105807 m!1024557))

(declare-fun m!1024559 () Bool)

(assert (=> b!1105807 m!1024559))

(declare-fun m!1024561 () Bool)

(assert (=> b!1105806 m!1024561))

(declare-fun m!1024563 () Bool)

(assert (=> b!1105801 m!1024563))

(declare-fun m!1024565 () Bool)

(assert (=> b!1105805 m!1024565))

(declare-fun m!1024567 () Bool)

(assert (=> mapNonEmpty!42967 m!1024567))

(declare-fun m!1024569 () Bool)

(assert (=> b!1105809 m!1024569))

(declare-fun m!1024571 () Bool)

(assert (=> start!97196 m!1024571))

(declare-fun m!1024573 () Bool)

(assert (=> start!97196 m!1024573))

(declare-fun m!1024575 () Bool)

(assert (=> b!1105811 m!1024575))

(check-sat (not b!1105811) (not b!1105812) (not b!1105805) (not b!1105809) tp_is_empty!27433 (not b!1105803) (not b!1105801) (not b!1105807) (not mapNonEmpty!42967) (not start!97196))
(check-sat)
