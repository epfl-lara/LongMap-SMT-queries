; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133578 () Bool)

(assert start!133578)

(declare-fun b_free!31995 () Bool)

(declare-fun b_next!31995 () Bool)

(assert (=> start!133578 (= b_free!31995 (not b_next!31995))))

(declare-fun tp!113108 () Bool)

(declare-fun b_and!51501 () Bool)

(assert (=> start!133578 (= tp!113108 b_and!51501)))

(declare-fun res!1067793 () Bool)

(declare-fun e!870289 () Bool)

(assert (=> start!133578 (=> (not res!1067793) (not e!870289))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133578 (= res!1067793 (validMask!0 mask!947))))

(assert (=> start!133578 e!870289))

(assert (=> start!133578 tp!113108))

(declare-fun tp_is_empty!38661 () Bool)

(assert (=> start!133578 tp_is_empty!38661))

(assert (=> start!133578 true))

(declare-datatypes ((array!104040 0))(
  ( (array!104041 (arr!50212 (Array (_ BitVec 32) (_ BitVec 64))) (size!50762 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104040)

(declare-fun array_inv!39031 (array!104040) Bool)

(assert (=> start!133578 (array_inv!39031 _keys!637)))

(declare-datatypes ((V!59755 0))(
  ( (V!59756 (val!19414 Int)) )
))
(declare-datatypes ((ValueCell!18300 0))(
  ( (ValueCellFull!18300 (v!22166 V!59755)) (EmptyCell!18300) )
))
(declare-datatypes ((array!104042 0))(
  ( (array!104043 (arr!50213 (Array (_ BitVec 32) ValueCell!18300)) (size!50763 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104042)

(declare-fun e!870287 () Bool)

(declare-fun array_inv!39032 (array!104042) Bool)

(assert (=> start!133578 (and (array_inv!39032 _values!487) e!870287)))

(declare-fun b!1561703 () Bool)

(declare-fun e!870286 () Bool)

(assert (=> b!1561703 (= e!870286 tp_is_empty!38661)))

(declare-fun mapNonEmpty!59367 () Bool)

(declare-fun mapRes!59367 () Bool)

(declare-fun tp!113109 () Bool)

(assert (=> mapNonEmpty!59367 (= mapRes!59367 (and tp!113109 e!870286))))

(declare-fun mapValue!59367 () ValueCell!18300)

(declare-fun mapKey!59367 () (_ BitVec 32))

(declare-fun mapRest!59367 () (Array (_ BitVec 32) ValueCell!18300))

(assert (=> mapNonEmpty!59367 (= (arr!50213 _values!487) (store mapRest!59367 mapKey!59367 mapValue!59367))))

(declare-fun mapIsEmpty!59367 () Bool)

(assert (=> mapIsEmpty!59367 mapRes!59367))

(declare-fun b!1561704 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561704 (= e!870289 (not (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))))

(declare-fun lt!671294 () V!59755)

(declare-datatypes ((tuple2!25080 0))(
  ( (tuple2!25081 (_1!12551 (_ BitVec 64)) (_2!12551 V!59755)) )
))
(declare-datatypes ((List!36451 0))(
  ( (Nil!36448) (Cons!36447 (h!37893 tuple2!25080) (t!51236 List!36451)) )
))
(declare-datatypes ((ListLongMap!22515 0))(
  ( (ListLongMap!22516 (toList!11273 List!36451)) )
))
(declare-fun lt!671295 () ListLongMap!22515)

(declare-fun contains!10263 (ListLongMap!22515 (_ BitVec 64)) Bool)

(declare-fun +!5043 (ListLongMap!22515 tuple2!25080) ListLongMap!22515)

(assert (=> b!1561704 (not (contains!10263 (+!5043 lt!671295 (tuple2!25081 (select (arr!50212 _keys!637) from!782) lt!671294)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51940 0))(
  ( (Unit!51941) )
))
(declare-fun lt!671293 () Unit!51940)

(declare-fun addStillNotContains!533 (ListLongMap!22515 (_ BitVec 64) V!59755 (_ BitVec 64)) Unit!51940)

(assert (=> b!1561704 (= lt!671293 (addStillNotContains!533 lt!671295 (select (arr!50212 _keys!637) from!782) lt!671294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26218 (ValueCell!18300 V!59755) V!59755)

(declare-fun dynLambda!3827 (Int (_ BitVec 64)) V!59755)

(assert (=> b!1561704 (= lt!671294 (get!26218 (select (arr!50213 _values!487) from!782) (dynLambda!3827 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59755)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59755)

(declare-fun getCurrentListMapNoExtraKeys!6657 (array!104040 array!104042 (_ BitVec 32) (_ BitVec 32) V!59755 V!59755 (_ BitVec 32) Int) ListLongMap!22515)

(assert (=> b!1561704 (= lt!671295 (getCurrentListMapNoExtraKeys!6657 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561705 () Bool)

(declare-fun e!870288 () Bool)

(assert (=> b!1561705 (= e!870288 tp_is_empty!38661)))

(declare-fun b!1561706 () Bool)

(declare-fun res!1067789 () Bool)

(assert (=> b!1561706 (=> (not res!1067789) (not e!870289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104040 (_ BitVec 32)) Bool)

(assert (=> b!1561706 (= res!1067789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561707 () Bool)

(declare-fun res!1067788 () Bool)

(assert (=> b!1561707 (=> (not res!1067788) (not e!870289))))

(declare-datatypes ((List!36452 0))(
  ( (Nil!36449) (Cons!36448 (h!37894 (_ BitVec 64)) (t!51237 List!36452)) )
))
(declare-fun arrayNoDuplicates!0 (array!104040 (_ BitVec 32) List!36452) Bool)

(assert (=> b!1561707 (= res!1067788 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36449))))

(declare-fun b!1561708 () Bool)

(assert (=> b!1561708 (= e!870287 (and e!870288 mapRes!59367))))

(declare-fun condMapEmpty!59367 () Bool)

(declare-fun mapDefault!59367 () ValueCell!18300)

(assert (=> b!1561708 (= condMapEmpty!59367 (= (arr!50213 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18300)) mapDefault!59367)))))

(declare-fun b!1561709 () Bool)

(declare-fun res!1067792 () Bool)

(assert (=> b!1561709 (=> (not res!1067792) (not e!870289))))

(assert (=> b!1561709 (= res!1067792 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50762 _keys!637)) (bvslt from!782 (size!50762 _keys!637))))))

(declare-fun b!1561710 () Bool)

(declare-fun res!1067790 () Bool)

(assert (=> b!1561710 (=> (not res!1067790) (not e!870289))))

(assert (=> b!1561710 (= res!1067790 (and (= (size!50763 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50762 _keys!637) (size!50763 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561711 () Bool)

(declare-fun res!1067791 () Bool)

(assert (=> b!1561711 (=> (not res!1067791) (not e!870289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561711 (= res!1067791 (validKeyInArray!0 (select (arr!50212 _keys!637) from!782)))))

(assert (= (and start!133578 res!1067793) b!1561710))

(assert (= (and b!1561710 res!1067790) b!1561706))

(assert (= (and b!1561706 res!1067789) b!1561707))

(assert (= (and b!1561707 res!1067788) b!1561709))

(assert (= (and b!1561709 res!1067792) b!1561711))

(assert (= (and b!1561711 res!1067791) b!1561704))

(assert (= (and b!1561708 condMapEmpty!59367) mapIsEmpty!59367))

(assert (= (and b!1561708 (not condMapEmpty!59367)) mapNonEmpty!59367))

(get-info :version)

(assert (= (and mapNonEmpty!59367 ((_ is ValueCellFull!18300) mapValue!59367)) b!1561703))

(assert (= (and b!1561708 ((_ is ValueCellFull!18300) mapDefault!59367)) b!1561705))

(assert (= start!133578 b!1561708))

(declare-fun b_lambda!24869 () Bool)

(assert (=> (not b_lambda!24869) (not b!1561704)))

(declare-fun t!51235 () Bool)

(declare-fun tb!12539 () Bool)

(assert (=> (and start!133578 (= defaultEntry!495 defaultEntry!495) t!51235) tb!12539))

(declare-fun result!26359 () Bool)

(assert (=> tb!12539 (= result!26359 tp_is_empty!38661)))

(assert (=> b!1561704 t!51235))

(declare-fun b_and!51503 () Bool)

(assert (= b_and!51501 (and (=> t!51235 result!26359) b_and!51503)))

(declare-fun m!1437391 () Bool)

(assert (=> mapNonEmpty!59367 m!1437391))

(declare-fun m!1437393 () Bool)

(assert (=> b!1561707 m!1437393))

(declare-fun m!1437395 () Bool)

(assert (=> b!1561704 m!1437395))

(declare-fun m!1437397 () Bool)

(assert (=> b!1561704 m!1437397))

(declare-fun m!1437399 () Bool)

(assert (=> b!1561704 m!1437399))

(declare-fun m!1437401 () Bool)

(assert (=> b!1561704 m!1437401))

(declare-fun m!1437403 () Bool)

(assert (=> b!1561704 m!1437403))

(assert (=> b!1561704 m!1437395))

(declare-fun m!1437405 () Bool)

(assert (=> b!1561704 m!1437405))

(declare-fun m!1437407 () Bool)

(assert (=> b!1561704 m!1437407))

(assert (=> b!1561704 m!1437401))

(assert (=> b!1561704 m!1437405))

(assert (=> b!1561704 m!1437397))

(declare-fun m!1437409 () Bool)

(assert (=> b!1561704 m!1437409))

(assert (=> b!1561711 m!1437401))

(assert (=> b!1561711 m!1437401))

(declare-fun m!1437411 () Bool)

(assert (=> b!1561711 m!1437411))

(declare-fun m!1437413 () Bool)

(assert (=> b!1561706 m!1437413))

(declare-fun m!1437415 () Bool)

(assert (=> start!133578 m!1437415))

(declare-fun m!1437417 () Bool)

(assert (=> start!133578 m!1437417))

(declare-fun m!1437419 () Bool)

(assert (=> start!133578 m!1437419))

(check-sat (not b_lambda!24869) (not b_next!31995) (not start!133578) (not b!1561704) b_and!51503 (not mapNonEmpty!59367) tp_is_empty!38661 (not b!1561711) (not b!1561706) (not b!1561707))
(check-sat b_and!51503 (not b_next!31995))
