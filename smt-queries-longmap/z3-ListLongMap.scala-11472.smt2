; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133580 () Bool)

(assert start!133580)

(declare-fun b_free!32047 () Bool)

(declare-fun b_next!32047 () Bool)

(assert (=> start!133580 (= b_free!32047 (not b_next!32047))))

(declare-fun tp!113266 () Bool)

(declare-fun b_and!51587 () Bool)

(assert (=> start!133580 (= tp!113266 b_and!51587)))

(declare-fun b!1562153 () Bool)

(declare-fun res!1068137 () Bool)

(declare-fun e!870487 () Bool)

(assert (=> b!1562153 (=> (not res!1068137) (not e!870487))))

(declare-datatypes ((array!104054 0))(
  ( (array!104055 (arr!50220 (Array (_ BitVec 32) (_ BitVec 64))) (size!50772 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104054)

(declare-datatypes ((List!36526 0))(
  ( (Nil!36523) (Cons!36522 (h!37969 (_ BitVec 64)) (t!51355 List!36526)) )
))
(declare-fun arrayNoDuplicates!0 (array!104054 (_ BitVec 32) List!36526) Bool)

(assert (=> b!1562153 (= res!1068137 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36523))))

(declare-fun b!1562154 () Bool)

(declare-fun res!1068140 () Bool)

(assert (=> b!1562154 (=> (not res!1068140) (not e!870487))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562154 (= res!1068140 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50772 _keys!637)) (bvslt from!782 (size!50772 _keys!637))))))

(declare-fun res!1068139 () Bool)

(assert (=> start!133580 (=> (not res!1068139) (not e!870487))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133580 (= res!1068139 (validMask!0 mask!947))))

(assert (=> start!133580 e!870487))

(assert (=> start!133580 tp!113266))

(declare-fun tp_is_empty!38713 () Bool)

(assert (=> start!133580 tp_is_empty!38713))

(assert (=> start!133580 true))

(declare-fun array_inv!39221 (array!104054) Bool)

(assert (=> start!133580 (array_inv!39221 _keys!637)))

(declare-datatypes ((V!59825 0))(
  ( (V!59826 (val!19440 Int)) )
))
(declare-datatypes ((ValueCell!18326 0))(
  ( (ValueCellFull!18326 (v!22188 V!59825)) (EmptyCell!18326) )
))
(declare-datatypes ((array!104056 0))(
  ( (array!104057 (arr!50221 (Array (_ BitVec 32) ValueCell!18326)) (size!50773 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104056)

(declare-fun e!870489 () Bool)

(declare-fun array_inv!39222 (array!104056) Bool)

(assert (=> start!133580 (and (array_inv!39222 _values!487) e!870489)))

(declare-fun b!1562155 () Bool)

(declare-fun e!870486 () Bool)

(assert (=> b!1562155 (= e!870486 tp_is_empty!38713)))

(declare-fun b!1562156 () Bool)

(assert (=> b!1562156 (= e!870487 (not true))))

(declare-fun lt!671393 () Bool)

(declare-datatypes ((tuple2!25186 0))(
  ( (tuple2!25187 (_1!12604 (_ BitVec 64)) (_2!12604 V!59825)) )
))
(declare-datatypes ((List!36527 0))(
  ( (Nil!36524) (Cons!36523 (h!37970 tuple2!25186) (t!51356 List!36527)) )
))
(declare-datatypes ((ListLongMap!22621 0))(
  ( (ListLongMap!22622 (toList!11326 List!36527)) )
))
(declare-fun lt!671391 () ListLongMap!22621)

(declare-fun contains!10236 (ListLongMap!22621 (_ BitVec 64)) Bool)

(assert (=> b!1562156 (= lt!671393 (contains!10236 lt!671391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562156 (not (contains!10236 lt!671391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671389 () ListLongMap!22621)

(declare-fun lt!671390 () V!59825)

(declare-fun +!5091 (ListLongMap!22621 tuple2!25186) ListLongMap!22621)

(assert (=> b!1562156 (= lt!671391 (+!5091 lt!671389 (tuple2!25187 (select (arr!50220 _keys!637) from!782) lt!671390)))))

(declare-datatypes ((Unit!51790 0))(
  ( (Unit!51791) )
))
(declare-fun lt!671392 () Unit!51790)

(declare-fun addStillNotContains!538 (ListLongMap!22621 (_ BitVec 64) V!59825 (_ BitVec 64)) Unit!51790)

(assert (=> b!1562156 (= lt!671392 (addStillNotContains!538 lt!671389 (select (arr!50220 _keys!637) from!782) lt!671390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26252 (ValueCell!18326 V!59825) V!59825)

(declare-fun dynLambda!3867 (Int (_ BitVec 64)) V!59825)

(assert (=> b!1562156 (= lt!671390 (get!26252 (select (arr!50221 _values!487) from!782) (dynLambda!3867 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59825)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59825)

(declare-fun getCurrentListMapNoExtraKeys!6700 (array!104054 array!104056 (_ BitVec 32) (_ BitVec 32) V!59825 V!59825 (_ BitVec 32) Int) ListLongMap!22621)

(assert (=> b!1562156 (= lt!671389 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59445 () Bool)

(declare-fun mapRes!59445 () Bool)

(declare-fun tp!113265 () Bool)

(declare-fun e!870488 () Bool)

(assert (=> mapNonEmpty!59445 (= mapRes!59445 (and tp!113265 e!870488))))

(declare-fun mapRest!59445 () (Array (_ BitVec 32) ValueCell!18326))

(declare-fun mapValue!59445 () ValueCell!18326)

(declare-fun mapKey!59445 () (_ BitVec 32))

(assert (=> mapNonEmpty!59445 (= (arr!50221 _values!487) (store mapRest!59445 mapKey!59445 mapValue!59445))))

(declare-fun b!1562157 () Bool)

(declare-fun res!1068141 () Bool)

(assert (=> b!1562157 (=> (not res!1068141) (not e!870487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104054 (_ BitVec 32)) Bool)

(assert (=> b!1562157 (= res!1068141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562158 () Bool)

(assert (=> b!1562158 (= e!870488 tp_is_empty!38713)))

(declare-fun mapIsEmpty!59445 () Bool)

(assert (=> mapIsEmpty!59445 mapRes!59445))

(declare-fun b!1562159 () Bool)

(declare-fun res!1068138 () Bool)

(assert (=> b!1562159 (=> (not res!1068138) (not e!870487))))

(assert (=> b!1562159 (= res!1068138 (and (= (size!50773 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50772 _keys!637) (size!50773 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562160 () Bool)

(assert (=> b!1562160 (= e!870489 (and e!870486 mapRes!59445))))

(declare-fun condMapEmpty!59445 () Bool)

(declare-fun mapDefault!59445 () ValueCell!18326)

(assert (=> b!1562160 (= condMapEmpty!59445 (= (arr!50221 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18326)) mapDefault!59445)))))

(declare-fun b!1562161 () Bool)

(declare-fun res!1068136 () Bool)

(assert (=> b!1562161 (=> (not res!1068136) (not e!870487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562161 (= res!1068136 (validKeyInArray!0 (select (arr!50220 _keys!637) from!782)))))

(assert (= (and start!133580 res!1068139) b!1562159))

(assert (= (and b!1562159 res!1068138) b!1562157))

(assert (= (and b!1562157 res!1068141) b!1562153))

(assert (= (and b!1562153 res!1068137) b!1562154))

(assert (= (and b!1562154 res!1068140) b!1562161))

(assert (= (and b!1562161 res!1068136) b!1562156))

(assert (= (and b!1562160 condMapEmpty!59445) mapIsEmpty!59445))

(assert (= (and b!1562160 (not condMapEmpty!59445)) mapNonEmpty!59445))

(get-info :version)

(assert (= (and mapNonEmpty!59445 ((_ is ValueCellFull!18326) mapValue!59445)) b!1562158))

(assert (= (and b!1562160 ((_ is ValueCellFull!18326) mapDefault!59445)) b!1562155))

(assert (= start!133580 b!1562160))

(declare-fun b_lambda!24911 () Bool)

(assert (=> (not b_lambda!24911) (not b!1562156)))

(declare-fun t!51354 () Bool)

(declare-fun tb!12583 () Bool)

(assert (=> (and start!133580 (= defaultEntry!495 defaultEntry!495) t!51354) tb!12583))

(declare-fun result!26455 () Bool)

(assert (=> tb!12583 (= result!26455 tp_is_empty!38713)))

(assert (=> b!1562156 t!51354))

(declare-fun b_and!51589 () Bool)

(assert (= b_and!51587 (and (=> t!51354 result!26455) b_and!51589)))

(declare-fun m!1437333 () Bool)

(assert (=> b!1562161 m!1437333))

(assert (=> b!1562161 m!1437333))

(declare-fun m!1437335 () Bool)

(assert (=> b!1562161 m!1437335))

(declare-fun m!1437337 () Bool)

(assert (=> b!1562156 m!1437337))

(declare-fun m!1437339 () Bool)

(assert (=> b!1562156 m!1437339))

(declare-fun m!1437341 () Bool)

(assert (=> b!1562156 m!1437341))

(declare-fun m!1437343 () Bool)

(assert (=> b!1562156 m!1437343))

(assert (=> b!1562156 m!1437337))

(assert (=> b!1562156 m!1437333))

(assert (=> b!1562156 m!1437339))

(declare-fun m!1437345 () Bool)

(assert (=> b!1562156 m!1437345))

(declare-fun m!1437347 () Bool)

(assert (=> b!1562156 m!1437347))

(assert (=> b!1562156 m!1437333))

(declare-fun m!1437349 () Bool)

(assert (=> b!1562156 m!1437349))

(declare-fun m!1437351 () Bool)

(assert (=> b!1562156 m!1437351))

(declare-fun m!1437353 () Bool)

(assert (=> b!1562157 m!1437353))

(declare-fun m!1437355 () Bool)

(assert (=> mapNonEmpty!59445 m!1437355))

(declare-fun m!1437357 () Bool)

(assert (=> start!133580 m!1437357))

(declare-fun m!1437359 () Bool)

(assert (=> start!133580 m!1437359))

(declare-fun m!1437361 () Bool)

(assert (=> start!133580 m!1437361))

(declare-fun m!1437363 () Bool)

(assert (=> b!1562153 m!1437363))

(check-sat (not b!1562153) (not b!1562157) tp_is_empty!38713 (not b_next!32047) b_and!51589 (not b!1562156) (not start!133580) (not b!1562161) (not b_lambda!24911) (not mapNonEmpty!59445))
(check-sat b_and!51589 (not b_next!32047))
