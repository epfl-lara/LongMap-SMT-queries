; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97432 () Bool)

(assert start!97432)

(declare-fun b!1107163 () Bool)

(declare-fun res!738421 () Bool)

(declare-fun e!631951 () Bool)

(assert (=> b!1107163 (=> (not res!738421) (not e!631951))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107163 (= res!738421 (validKeyInArray!0 k0!934))))

(declare-fun b!1107164 () Bool)

(declare-fun res!738427 () Bool)

(assert (=> b!1107164 (=> (not res!738427) (not e!631951))))

(declare-datatypes ((array!71809 0))(
  ( (array!71810 (arr!34551 (Array (_ BitVec 32) (_ BitVec 64))) (size!35088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71809)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71809 (_ BitVec 32)) Bool)

(assert (=> b!1107164 (= res!738427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107166 () Bool)

(declare-fun res!738422 () Bool)

(assert (=> b!1107166 (=> (not res!738422) (not e!631951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107166 (= res!738422 (validMask!0 mask!1564))))

(declare-fun b!1107167 () Bool)

(declare-fun e!631952 () Bool)

(assert (=> b!1107167 (= e!631951 e!631952)))

(declare-fun res!738428 () Bool)

(assert (=> b!1107167 (=> (not res!738428) (not e!631952))))

(declare-fun lt!495882 () array!71809)

(assert (=> b!1107167 (= res!738428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495882 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107167 (= lt!495882 (array!71810 (store (arr!34551 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35088 _keys!1208)))))

(declare-fun b!1107168 () Bool)

(declare-fun res!738424 () Bool)

(assert (=> b!1107168 (=> (not res!738424) (not e!631951))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41697 0))(
  ( (V!41698 (val!13770 Int)) )
))
(declare-datatypes ((ValueCell!13004 0))(
  ( (ValueCellFull!13004 (v!16399 V!41697)) (EmptyCell!13004) )
))
(declare-datatypes ((array!71811 0))(
  ( (array!71812 (arr!34552 (Array (_ BitVec 32) ValueCell!13004)) (size!35089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71811)

(assert (=> b!1107168 (= res!738424 (and (= (size!35089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35088 _keys!1208) (size!35089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42958 () Bool)

(declare-fun mapRes!42958 () Bool)

(declare-fun tp!81878 () Bool)

(declare-fun e!631956 () Bool)

(assert (=> mapNonEmpty!42958 (= mapRes!42958 (and tp!81878 e!631956))))

(declare-fun mapRest!42958 () (Array (_ BitVec 32) ValueCell!13004))

(declare-fun mapValue!42958 () ValueCell!13004)

(declare-fun mapKey!42958 () (_ BitVec 32))

(assert (=> mapNonEmpty!42958 (= (arr!34552 _values!996) (store mapRest!42958 mapKey!42958 mapValue!42958))))

(declare-fun b!1107169 () Bool)

(declare-fun e!631955 () Bool)

(declare-fun e!631953 () Bool)

(assert (=> b!1107169 (= e!631955 (and e!631953 mapRes!42958))))

(declare-fun condMapEmpty!42958 () Bool)

(declare-fun mapDefault!42958 () ValueCell!13004)

(assert (=> b!1107169 (= condMapEmpty!42958 (= (arr!34552 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13004)) mapDefault!42958)))))

(declare-fun b!1107170 () Bool)

(declare-fun res!738426 () Bool)

(assert (=> b!1107170 (=> (not res!738426) (not e!631951))))

(declare-datatypes ((List!24106 0))(
  ( (Nil!24103) (Cons!24102 (h!25320 (_ BitVec 64)) (t!34363 List!24106)) )
))
(declare-fun arrayNoDuplicates!0 (array!71809 (_ BitVec 32) List!24106) Bool)

(assert (=> b!1107170 (= res!738426 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24103))))

(declare-fun mapIsEmpty!42958 () Bool)

(assert (=> mapIsEmpty!42958 mapRes!42958))

(declare-fun b!1107171 () Bool)

(declare-fun tp_is_empty!27427 () Bool)

(assert (=> b!1107171 (= e!631953 tp_is_empty!27427)))

(declare-fun b!1107172 () Bool)

(declare-fun res!738429 () Bool)

(assert (=> b!1107172 (=> (not res!738429) (not e!631952))))

(assert (=> b!1107172 (= res!738429 (arrayNoDuplicates!0 lt!495882 #b00000000000000000000000000000000 Nil!24103))))

(declare-fun b!1107173 () Bool)

(declare-fun res!738423 () Bool)

(assert (=> b!1107173 (=> (not res!738423) (not e!631951))))

(assert (=> b!1107173 (= res!738423 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35088 _keys!1208))))))

(declare-fun b!1107174 () Bool)

(assert (=> b!1107174 (= e!631952 (not true))))

(declare-fun arrayContainsKey!0 (array!71809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107174 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36279 0))(
  ( (Unit!36280) )
))
(declare-fun lt!495883 () Unit!36279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71809 (_ BitVec 64) (_ BitVec 32)) Unit!36279)

(assert (=> b!1107174 (= lt!495883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107175 () Bool)

(assert (=> b!1107175 (= e!631956 tp_is_empty!27427)))

(declare-fun b!1107165 () Bool)

(declare-fun res!738425 () Bool)

(assert (=> b!1107165 (=> (not res!738425) (not e!631951))))

(assert (=> b!1107165 (= res!738425 (= (select (arr!34551 _keys!1208) i!673) k0!934))))

(declare-fun res!738430 () Bool)

(assert (=> start!97432 (=> (not res!738430) (not e!631951))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97432 (= res!738430 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35088 _keys!1208))))))

(assert (=> start!97432 e!631951))

(declare-fun array_inv!26630 (array!71809) Bool)

(assert (=> start!97432 (array_inv!26630 _keys!1208)))

(assert (=> start!97432 true))

(declare-fun array_inv!26631 (array!71811) Bool)

(assert (=> start!97432 (and (array_inv!26631 _values!996) e!631955)))

(assert (= (and start!97432 res!738430) b!1107166))

(assert (= (and b!1107166 res!738422) b!1107168))

(assert (= (and b!1107168 res!738424) b!1107164))

(assert (= (and b!1107164 res!738427) b!1107170))

(assert (= (and b!1107170 res!738426) b!1107173))

(assert (= (and b!1107173 res!738423) b!1107163))

(assert (= (and b!1107163 res!738421) b!1107165))

(assert (= (and b!1107165 res!738425) b!1107167))

(assert (= (and b!1107167 res!738428) b!1107172))

(assert (= (and b!1107172 res!738429) b!1107174))

(assert (= (and b!1107169 condMapEmpty!42958) mapIsEmpty!42958))

(assert (= (and b!1107169 (not condMapEmpty!42958)) mapNonEmpty!42958))

(get-info :version)

(assert (= (and mapNonEmpty!42958 ((_ is ValueCellFull!13004) mapValue!42958)) b!1107175))

(assert (= (and b!1107169 ((_ is ValueCellFull!13004) mapDefault!42958)) b!1107171))

(assert (= start!97432 b!1107169))

(declare-fun m!1026771 () Bool)

(assert (=> b!1107174 m!1026771))

(declare-fun m!1026773 () Bool)

(assert (=> b!1107174 m!1026773))

(declare-fun m!1026775 () Bool)

(assert (=> b!1107163 m!1026775))

(declare-fun m!1026777 () Bool)

(assert (=> start!97432 m!1026777))

(declare-fun m!1026779 () Bool)

(assert (=> start!97432 m!1026779))

(declare-fun m!1026781 () Bool)

(assert (=> b!1107164 m!1026781))

(declare-fun m!1026783 () Bool)

(assert (=> b!1107165 m!1026783))

(declare-fun m!1026785 () Bool)

(assert (=> b!1107166 m!1026785))

(declare-fun m!1026787 () Bool)

(assert (=> b!1107172 m!1026787))

(declare-fun m!1026789 () Bool)

(assert (=> mapNonEmpty!42958 m!1026789))

(declare-fun m!1026791 () Bool)

(assert (=> b!1107170 m!1026791))

(declare-fun m!1026793 () Bool)

(assert (=> b!1107167 m!1026793))

(declare-fun m!1026795 () Bool)

(assert (=> b!1107167 m!1026795))

(check-sat (not mapNonEmpty!42958) (not b!1107166) tp_is_empty!27427 (not start!97432) (not b!1107174) (not b!1107167) (not b!1107170) (not b!1107164) (not b!1107163) (not b!1107172))
(check-sat)
