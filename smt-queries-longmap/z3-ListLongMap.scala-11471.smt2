; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133574 () Bool)

(assert start!133574)

(declare-fun b_free!32041 () Bool)

(declare-fun b_next!32041 () Bool)

(assert (=> start!133574 (= b_free!32041 (not b_next!32041))))

(declare-fun tp!113248 () Bool)

(declare-fun b_and!51575 () Bool)

(assert (=> start!133574 (= tp!113248 b_and!51575)))

(declare-fun mapIsEmpty!59436 () Bool)

(declare-fun mapRes!59436 () Bool)

(assert (=> mapIsEmpty!59436 mapRes!59436))

(declare-fun res!1068086 () Bool)

(declare-fun e!870444 () Bool)

(assert (=> start!133574 (=> (not res!1068086) (not e!870444))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133574 (= res!1068086 (validMask!0 mask!947))))

(assert (=> start!133574 e!870444))

(assert (=> start!133574 tp!113248))

(declare-fun tp_is_empty!38707 () Bool)

(assert (=> start!133574 tp_is_empty!38707))

(assert (=> start!133574 true))

(declare-datatypes ((array!104042 0))(
  ( (array!104043 (arr!50214 (Array (_ BitVec 32) (_ BitVec 64))) (size!50766 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104042)

(declare-fun array_inv!39219 (array!104042) Bool)

(assert (=> start!133574 (array_inv!39219 _keys!637)))

(declare-datatypes ((V!59817 0))(
  ( (V!59818 (val!19437 Int)) )
))
(declare-datatypes ((ValueCell!18323 0))(
  ( (ValueCellFull!18323 (v!22185 V!59817)) (EmptyCell!18323) )
))
(declare-datatypes ((array!104044 0))(
  ( (array!104045 (arr!50215 (Array (_ BitVec 32) ValueCell!18323)) (size!50767 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104044)

(declare-fun e!870443 () Bool)

(declare-fun array_inv!39220 (array!104044) Bool)

(assert (=> start!133574 (and (array_inv!39220 _values!487) e!870443)))

(declare-fun mapNonEmpty!59436 () Bool)

(declare-fun tp!113247 () Bool)

(declare-fun e!870442 () Bool)

(assert (=> mapNonEmpty!59436 (= mapRes!59436 (and tp!113247 e!870442))))

(declare-fun mapKey!59436 () (_ BitVec 32))

(declare-fun mapValue!59436 () ValueCell!18323)

(declare-fun mapRest!59436 () (Array (_ BitVec 32) ValueCell!18323))

(assert (=> mapNonEmpty!59436 (= (arr!50215 _values!487) (store mapRest!59436 mapKey!59436 mapValue!59436))))

(declare-fun b!1562066 () Bool)

(assert (=> b!1562066 (= e!870444 (not true))))

(declare-fun lt!671344 () Bool)

(declare-datatypes ((tuple2!25184 0))(
  ( (tuple2!25185 (_1!12603 (_ BitVec 64)) (_2!12603 V!59817)) )
))
(declare-datatypes ((List!36524 0))(
  ( (Nil!36521) (Cons!36520 (h!37967 tuple2!25184) (t!51347 List!36524)) )
))
(declare-datatypes ((ListLongMap!22619 0))(
  ( (ListLongMap!22620 (toList!11325 List!36524)) )
))
(declare-fun lt!671346 () ListLongMap!22619)

(declare-fun contains!10235 (ListLongMap!22619 (_ BitVec 64)) Bool)

(assert (=> b!1562066 (= lt!671344 (contains!10235 lt!671346 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562066 (not (contains!10235 lt!671346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671345 () ListLongMap!22619)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671348 () V!59817)

(declare-fun +!5090 (ListLongMap!22619 tuple2!25184) ListLongMap!22619)

(assert (=> b!1562066 (= lt!671346 (+!5090 lt!671345 (tuple2!25185 (select (arr!50214 _keys!637) from!782) lt!671348)))))

(declare-datatypes ((Unit!51788 0))(
  ( (Unit!51789) )
))
(declare-fun lt!671347 () Unit!51788)

(declare-fun addStillNotContains!537 (ListLongMap!22619 (_ BitVec 64) V!59817 (_ BitVec 64)) Unit!51788)

(assert (=> b!1562066 (= lt!671347 (addStillNotContains!537 lt!671345 (select (arr!50214 _keys!637) from!782) lt!671348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26249 (ValueCell!18323 V!59817) V!59817)

(declare-fun dynLambda!3866 (Int (_ BitVec 64)) V!59817)

(assert (=> b!1562066 (= lt!671348 (get!26249 (select (arr!50215 _values!487) from!782) (dynLambda!3866 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59817)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59817)

(declare-fun getCurrentListMapNoExtraKeys!6699 (array!104042 array!104044 (_ BitVec 32) (_ BitVec 32) V!59817 V!59817 (_ BitVec 32) Int) ListLongMap!22619)

(assert (=> b!1562066 (= lt!671345 (getCurrentListMapNoExtraKeys!6699 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562067 () Bool)

(assert (=> b!1562067 (= e!870442 tp_is_empty!38707)))

(declare-fun b!1562068 () Bool)

(declare-fun res!1068087 () Bool)

(assert (=> b!1562068 (=> (not res!1068087) (not e!870444))))

(assert (=> b!1562068 (= res!1068087 (and (= (size!50767 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50766 _keys!637) (size!50767 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562069 () Bool)

(declare-fun res!1068082 () Bool)

(assert (=> b!1562069 (=> (not res!1068082) (not e!870444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104042 (_ BitVec 32)) Bool)

(assert (=> b!1562069 (= res!1068082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562070 () Bool)

(declare-fun e!870445 () Bool)

(assert (=> b!1562070 (= e!870443 (and e!870445 mapRes!59436))))

(declare-fun condMapEmpty!59436 () Bool)

(declare-fun mapDefault!59436 () ValueCell!18323)

(assert (=> b!1562070 (= condMapEmpty!59436 (= (arr!50215 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18323)) mapDefault!59436)))))

(declare-fun b!1562071 () Bool)

(declare-fun res!1068085 () Bool)

(assert (=> b!1562071 (=> (not res!1068085) (not e!870444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562071 (= res!1068085 (validKeyInArray!0 (select (arr!50214 _keys!637) from!782)))))

(declare-fun b!1562072 () Bool)

(declare-fun res!1068084 () Bool)

(assert (=> b!1562072 (=> (not res!1068084) (not e!870444))))

(declare-datatypes ((List!36525 0))(
  ( (Nil!36522) (Cons!36521 (h!37968 (_ BitVec 64)) (t!51348 List!36525)) )
))
(declare-fun arrayNoDuplicates!0 (array!104042 (_ BitVec 32) List!36525) Bool)

(assert (=> b!1562072 (= res!1068084 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36522))))

(declare-fun b!1562073 () Bool)

(declare-fun res!1068083 () Bool)

(assert (=> b!1562073 (=> (not res!1068083) (not e!870444))))

(assert (=> b!1562073 (= res!1068083 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50766 _keys!637)) (bvslt from!782 (size!50766 _keys!637))))))

(declare-fun b!1562074 () Bool)

(assert (=> b!1562074 (= e!870445 tp_is_empty!38707)))

(assert (= (and start!133574 res!1068086) b!1562068))

(assert (= (and b!1562068 res!1068087) b!1562069))

(assert (= (and b!1562069 res!1068082) b!1562072))

(assert (= (and b!1562072 res!1068084) b!1562073))

(assert (= (and b!1562073 res!1068083) b!1562071))

(assert (= (and b!1562071 res!1068085) b!1562066))

(assert (= (and b!1562070 condMapEmpty!59436) mapIsEmpty!59436))

(assert (= (and b!1562070 (not condMapEmpty!59436)) mapNonEmpty!59436))

(get-info :version)

(assert (= (and mapNonEmpty!59436 ((_ is ValueCellFull!18323) mapValue!59436)) b!1562067))

(assert (= (and b!1562070 ((_ is ValueCellFull!18323) mapDefault!59436)) b!1562074))

(assert (= start!133574 b!1562070))

(declare-fun b_lambda!24905 () Bool)

(assert (=> (not b_lambda!24905) (not b!1562066)))

(declare-fun t!51346 () Bool)

(declare-fun tb!12577 () Bool)

(assert (=> (and start!133574 (= defaultEntry!495 defaultEntry!495) t!51346) tb!12577))

(declare-fun result!26443 () Bool)

(assert (=> tb!12577 (= result!26443 tp_is_empty!38707)))

(assert (=> b!1562066 t!51346))

(declare-fun b_and!51577 () Bool)

(assert (= b_and!51575 (and (=> t!51346 result!26443) b_and!51577)))

(declare-fun m!1437237 () Bool)

(assert (=> start!133574 m!1437237))

(declare-fun m!1437239 () Bool)

(assert (=> start!133574 m!1437239))

(declare-fun m!1437241 () Bool)

(assert (=> start!133574 m!1437241))

(declare-fun m!1437243 () Bool)

(assert (=> b!1562066 m!1437243))

(declare-fun m!1437245 () Bool)

(assert (=> b!1562066 m!1437245))

(declare-fun m!1437247 () Bool)

(assert (=> b!1562066 m!1437247))

(declare-fun m!1437249 () Bool)

(assert (=> b!1562066 m!1437249))

(assert (=> b!1562066 m!1437243))

(declare-fun m!1437251 () Bool)

(assert (=> b!1562066 m!1437251))

(declare-fun m!1437253 () Bool)

(assert (=> b!1562066 m!1437253))

(assert (=> b!1562066 m!1437245))

(declare-fun m!1437255 () Bool)

(assert (=> b!1562066 m!1437255))

(declare-fun m!1437257 () Bool)

(assert (=> b!1562066 m!1437257))

(assert (=> b!1562066 m!1437251))

(declare-fun m!1437259 () Bool)

(assert (=> b!1562066 m!1437259))

(declare-fun m!1437261 () Bool)

(assert (=> mapNonEmpty!59436 m!1437261))

(assert (=> b!1562071 m!1437251))

(assert (=> b!1562071 m!1437251))

(declare-fun m!1437263 () Bool)

(assert (=> b!1562071 m!1437263))

(declare-fun m!1437265 () Bool)

(assert (=> b!1562072 m!1437265))

(declare-fun m!1437267 () Bool)

(assert (=> b!1562069 m!1437267))

(check-sat (not b_lambda!24905) (not b!1562069) b_and!51577 (not b!1562072) tp_is_empty!38707 (not mapNonEmpty!59436) (not b!1562066) (not start!133574) (not b!1562071) (not b_next!32041))
(check-sat b_and!51577 (not b_next!32041))
