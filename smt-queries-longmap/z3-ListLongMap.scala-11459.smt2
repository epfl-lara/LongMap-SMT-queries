; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133554 () Bool)

(assert start!133554)

(declare-fun b_free!31971 () Bool)

(declare-fun b_next!31971 () Bool)

(assert (=> start!133554 (= b_free!31971 (not b_next!31971))))

(declare-fun tp!113036 () Bool)

(declare-fun b_and!51453 () Bool)

(assert (=> start!133554 (= tp!113036 b_and!51453)))

(declare-fun b!1561355 () Bool)

(declare-fun e!870105 () Bool)

(assert (=> b!1561355 (= e!870105 (not true))))

(declare-datatypes ((V!59723 0))(
  ( (V!59724 (val!19402 Int)) )
))
(declare-datatypes ((tuple2!25064 0))(
  ( (tuple2!25065 (_1!12543 (_ BitVec 64)) (_2!12543 V!59723)) )
))
(declare-datatypes ((List!36433 0))(
  ( (Nil!36430) (Cons!36429 (h!37875 tuple2!25064) (t!51194 List!36433)) )
))
(declare-datatypes ((ListLongMap!22499 0))(
  ( (ListLongMap!22500 (toList!11265 List!36433)) )
))
(declare-fun lt!671186 () ListLongMap!22499)

(declare-datatypes ((array!103992 0))(
  ( (array!103993 (arr!50188 (Array (_ BitVec 32) (_ BitVec 64))) (size!50738 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103992)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671187 () V!59723)

(declare-fun contains!10255 (ListLongMap!22499 (_ BitVec 64)) Bool)

(declare-fun +!5035 (ListLongMap!22499 tuple2!25064) ListLongMap!22499)

(assert (=> b!1561355 (not (contains!10255 (+!5035 lt!671186 (tuple2!25065 (select (arr!50188 _keys!637) from!782) lt!671187)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51924 0))(
  ( (Unit!51925) )
))
(declare-fun lt!671185 () Unit!51924)

(declare-fun addStillNotContains!525 (ListLongMap!22499 (_ BitVec 64) V!59723 (_ BitVec 64)) Unit!51924)

(assert (=> b!1561355 (= lt!671185 (addStillNotContains!525 lt!671186 (select (arr!50188 _keys!637) from!782) lt!671187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18288 0))(
  ( (ValueCellFull!18288 (v!22154 V!59723)) (EmptyCell!18288) )
))
(declare-datatypes ((array!103994 0))(
  ( (array!103995 (arr!50189 (Array (_ BitVec 32) ValueCell!18288)) (size!50739 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103994)

(declare-fun get!26202 (ValueCell!18288 V!59723) V!59723)

(declare-fun dynLambda!3819 (Int (_ BitVec 64)) V!59723)

(assert (=> b!1561355 (= lt!671187 (get!26202 (select (arr!50189 _values!487) from!782) (dynLambda!3819 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59723)

(declare-fun zeroValue!453 () V!59723)

(declare-fun getCurrentListMapNoExtraKeys!6649 (array!103992 array!103994 (_ BitVec 32) (_ BitVec 32) V!59723 V!59723 (_ BitVec 32) Int) ListLongMap!22499)

(assert (=> b!1561355 (= lt!671186 (getCurrentListMapNoExtraKeys!6649 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561357 () Bool)

(declare-fun e!870108 () Bool)

(declare-fun e!870106 () Bool)

(declare-fun mapRes!59331 () Bool)

(assert (=> b!1561357 (= e!870108 (and e!870106 mapRes!59331))))

(declare-fun condMapEmpty!59331 () Bool)

(declare-fun mapDefault!59331 () ValueCell!18288)

(assert (=> b!1561357 (= condMapEmpty!59331 (= (arr!50189 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18288)) mapDefault!59331)))))

(declare-fun b!1561358 () Bool)

(declare-fun res!1067575 () Bool)

(assert (=> b!1561358 (=> (not res!1067575) (not e!870105))))

(declare-datatypes ((List!36434 0))(
  ( (Nil!36431) (Cons!36430 (h!37876 (_ BitVec 64)) (t!51195 List!36434)) )
))
(declare-fun arrayNoDuplicates!0 (array!103992 (_ BitVec 32) List!36434) Bool)

(assert (=> b!1561358 (= res!1067575 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36431))))

(declare-fun mapIsEmpty!59331 () Bool)

(assert (=> mapIsEmpty!59331 mapRes!59331))

(declare-fun mapNonEmpty!59331 () Bool)

(declare-fun tp!113037 () Bool)

(declare-fun e!870109 () Bool)

(assert (=> mapNonEmpty!59331 (= mapRes!59331 (and tp!113037 e!870109))))

(declare-fun mapKey!59331 () (_ BitVec 32))

(declare-fun mapRest!59331 () (Array (_ BitVec 32) ValueCell!18288))

(declare-fun mapValue!59331 () ValueCell!18288)

(assert (=> mapNonEmpty!59331 (= (arr!50189 _values!487) (store mapRest!59331 mapKey!59331 mapValue!59331))))

(declare-fun b!1561359 () Bool)

(declare-fun res!1067572 () Bool)

(assert (=> b!1561359 (=> (not res!1067572) (not e!870105))))

(assert (=> b!1561359 (= res!1067572 (and (= (size!50739 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50738 _keys!637) (size!50739 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561360 () Bool)

(declare-fun tp_is_empty!38637 () Bool)

(assert (=> b!1561360 (= e!870106 tp_is_empty!38637)))

(declare-fun b!1561361 () Bool)

(assert (=> b!1561361 (= e!870109 tp_is_empty!38637)))

(declare-fun b!1561362 () Bool)

(declare-fun res!1067574 () Bool)

(assert (=> b!1561362 (=> (not res!1067574) (not e!870105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103992 (_ BitVec 32)) Bool)

(assert (=> b!1561362 (= res!1067574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561363 () Bool)

(declare-fun res!1067573 () Bool)

(assert (=> b!1561363 (=> (not res!1067573) (not e!870105))))

(assert (=> b!1561363 (= res!1067573 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50738 _keys!637)) (bvslt from!782 (size!50738 _keys!637))))))

(declare-fun b!1561356 () Bool)

(declare-fun res!1067576 () Bool)

(assert (=> b!1561356 (=> (not res!1067576) (not e!870105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561356 (= res!1067576 (validKeyInArray!0 (select (arr!50188 _keys!637) from!782)))))

(declare-fun res!1067577 () Bool)

(assert (=> start!133554 (=> (not res!1067577) (not e!870105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133554 (= res!1067577 (validMask!0 mask!947))))

(assert (=> start!133554 e!870105))

(assert (=> start!133554 tp!113036))

(assert (=> start!133554 tp_is_empty!38637))

(assert (=> start!133554 true))

(declare-fun array_inv!39011 (array!103992) Bool)

(assert (=> start!133554 (array_inv!39011 _keys!637)))

(declare-fun array_inv!39012 (array!103994) Bool)

(assert (=> start!133554 (and (array_inv!39012 _values!487) e!870108)))

(assert (= (and start!133554 res!1067577) b!1561359))

(assert (= (and b!1561359 res!1067572) b!1561362))

(assert (= (and b!1561362 res!1067574) b!1561358))

(assert (= (and b!1561358 res!1067575) b!1561363))

(assert (= (and b!1561363 res!1067573) b!1561356))

(assert (= (and b!1561356 res!1067576) b!1561355))

(assert (= (and b!1561357 condMapEmpty!59331) mapIsEmpty!59331))

(assert (= (and b!1561357 (not condMapEmpty!59331)) mapNonEmpty!59331))

(get-info :version)

(assert (= (and mapNonEmpty!59331 ((_ is ValueCellFull!18288) mapValue!59331)) b!1561361))

(assert (= (and b!1561357 ((_ is ValueCellFull!18288) mapDefault!59331)) b!1561360))

(assert (= start!133554 b!1561357))

(declare-fun b_lambda!24845 () Bool)

(assert (=> (not b_lambda!24845) (not b!1561355)))

(declare-fun t!51193 () Bool)

(declare-fun tb!12515 () Bool)

(assert (=> (and start!133554 (= defaultEntry!495 defaultEntry!495) t!51193) tb!12515))

(declare-fun result!26311 () Bool)

(assert (=> tb!12515 (= result!26311 tp_is_empty!38637)))

(assert (=> b!1561355 t!51193))

(declare-fun b_and!51455 () Bool)

(assert (= b_and!51453 (and (=> t!51193 result!26311) b_and!51455)))

(declare-fun m!1437031 () Bool)

(assert (=> b!1561355 m!1437031))

(declare-fun m!1437033 () Bool)

(assert (=> b!1561355 m!1437033))

(declare-fun m!1437035 () Bool)

(assert (=> b!1561355 m!1437035))

(assert (=> b!1561355 m!1437031))

(declare-fun m!1437037 () Bool)

(assert (=> b!1561355 m!1437037))

(assert (=> b!1561355 m!1437033))

(declare-fun m!1437039 () Bool)

(assert (=> b!1561355 m!1437039))

(declare-fun m!1437041 () Bool)

(assert (=> b!1561355 m!1437041))

(assert (=> b!1561355 m!1437039))

(declare-fun m!1437043 () Bool)

(assert (=> b!1561355 m!1437043))

(assert (=> b!1561355 m!1437037))

(declare-fun m!1437045 () Bool)

(assert (=> b!1561355 m!1437045))

(declare-fun m!1437047 () Bool)

(assert (=> b!1561358 m!1437047))

(declare-fun m!1437049 () Bool)

(assert (=> mapNonEmpty!59331 m!1437049))

(declare-fun m!1437051 () Bool)

(assert (=> b!1561362 m!1437051))

(declare-fun m!1437053 () Bool)

(assert (=> start!133554 m!1437053))

(declare-fun m!1437055 () Bool)

(assert (=> start!133554 m!1437055))

(declare-fun m!1437057 () Bool)

(assert (=> start!133554 m!1437057))

(assert (=> b!1561356 m!1437037))

(assert (=> b!1561356 m!1437037))

(declare-fun m!1437059 () Bool)

(assert (=> b!1561356 m!1437059))

(check-sat b_and!51455 (not b!1561358) (not b_next!31971) (not start!133554) tp_is_empty!38637 (not mapNonEmpty!59331) (not b!1561356) (not b_lambda!24845) (not b!1561362) (not b!1561355))
(check-sat b_and!51455 (not b_next!31971))
