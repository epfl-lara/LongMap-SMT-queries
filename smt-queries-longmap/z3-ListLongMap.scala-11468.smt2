; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133608 () Bool)

(assert start!133608)

(declare-fun b_free!32025 () Bool)

(declare-fun b_next!32025 () Bool)

(assert (=> start!133608 (= b_free!32025 (not b_next!32025))))

(declare-fun tp!113199 () Bool)

(declare-fun b_and!51561 () Bool)

(assert (=> start!133608 (= tp!113199 b_and!51561)))

(declare-fun b!1562147 () Bool)

(declare-fun res!1068067 () Bool)

(declare-fun e!870520 () Bool)

(assert (=> b!1562147 (=> (not res!1068067) (not e!870520))))

(declare-datatypes ((array!104100 0))(
  ( (array!104101 (arr!50242 (Array (_ BitVec 32) (_ BitVec 64))) (size!50792 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104100)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104100 (_ BitVec 32)) Bool)

(assert (=> b!1562147 (= res!1068067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562148 () Bool)

(declare-fun res!1068070 () Bool)

(assert (=> b!1562148 (=> (not res!1068070) (not e!870520))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562148 (= res!1068070 (validKeyInArray!0 (select (arr!50242 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59412 () Bool)

(declare-fun mapRes!59412 () Bool)

(declare-fun tp!113198 () Bool)

(declare-fun e!870521 () Bool)

(assert (=> mapNonEmpty!59412 (= mapRes!59412 (and tp!113198 e!870521))))

(declare-fun mapKey!59412 () (_ BitVec 32))

(declare-datatypes ((V!59795 0))(
  ( (V!59796 (val!19429 Int)) )
))
(declare-datatypes ((ValueCell!18315 0))(
  ( (ValueCellFull!18315 (v!22181 V!59795)) (EmptyCell!18315) )
))
(declare-fun mapRest!59412 () (Array (_ BitVec 32) ValueCell!18315))

(declare-fun mapValue!59412 () ValueCell!18315)

(declare-datatypes ((array!104102 0))(
  ( (array!104103 (arr!50243 (Array (_ BitVec 32) ValueCell!18315)) (size!50793 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104102)

(assert (=> mapNonEmpty!59412 (= (arr!50243 _values!487) (store mapRest!59412 mapKey!59412 mapValue!59412))))

(declare-fun b!1562149 () Bool)

(declare-fun e!870522 () Bool)

(declare-fun tp_is_empty!38691 () Bool)

(assert (=> b!1562149 (= e!870522 tp_is_empty!38691)))

(declare-fun b!1562150 () Bool)

(declare-fun e!870523 () Bool)

(assert (=> b!1562150 (= e!870523 (and e!870522 mapRes!59412))))

(declare-fun condMapEmpty!59412 () Bool)

(declare-fun mapDefault!59412 () ValueCell!18315)

(assert (=> b!1562150 (= condMapEmpty!59412 (= (arr!50243 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18315)) mapDefault!59412)))))

(declare-fun b!1562151 () Bool)

(declare-fun res!1068068 () Bool)

(assert (=> b!1562151 (=> (not res!1068068) (not e!870520))))

(declare-datatypes ((List!36470 0))(
  ( (Nil!36467) (Cons!36466 (h!37912 (_ BitVec 64)) (t!51285 List!36470)) )
))
(declare-fun arrayNoDuplicates!0 (array!104100 (_ BitVec 32) List!36470) Bool)

(assert (=> b!1562151 (= res!1068068 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36467))))

(declare-fun b!1562152 () Bool)

(declare-fun res!1068072 () Bool)

(assert (=> b!1562152 (=> (not res!1068072) (not e!870520))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562152 (= res!1068072 (and (= (size!50793 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50792 _keys!637) (size!50793 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59412 () Bool)

(assert (=> mapIsEmpty!59412 mapRes!59412))

(declare-fun b!1562154 () Bool)

(assert (=> b!1562154 (= e!870521 tp_is_empty!38691)))

(declare-fun b!1562155 () Bool)

(declare-fun res!1068071 () Bool)

(assert (=> b!1562155 (=> (not res!1068071) (not e!870520))))

(assert (=> b!1562155 (= res!1068071 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50792 _keys!637)) (bvslt from!782 (size!50792 _keys!637))))))

(declare-fun res!1068069 () Bool)

(assert (=> start!133608 (=> (not res!1068069) (not e!870520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133608 (= res!1068069 (validMask!0 mask!947))))

(assert (=> start!133608 e!870520))

(assert (=> start!133608 tp!113199))

(assert (=> start!133608 tp_is_empty!38691))

(assert (=> start!133608 true))

(declare-fun array_inv!39051 (array!104100) Bool)

(assert (=> start!133608 (array_inv!39051 _keys!637)))

(declare-fun array_inv!39052 (array!104102) Bool)

(assert (=> start!133608 (and (array_inv!39052 _values!487) e!870523)))

(declare-fun b!1562153 () Bool)

(assert (=> b!1562153 (= e!870520 (not true))))

(declare-fun lt!671510 () Bool)

(declare-datatypes ((tuple2!25098 0))(
  ( (tuple2!25099 (_1!12560 (_ BitVec 64)) (_2!12560 V!59795)) )
))
(declare-datatypes ((List!36471 0))(
  ( (Nil!36468) (Cons!36467 (h!37913 tuple2!25098) (t!51286 List!36471)) )
))
(declare-datatypes ((ListLongMap!22533 0))(
  ( (ListLongMap!22534 (toList!11282 List!36471)) )
))
(declare-fun lt!671514 () ListLongMap!22533)

(declare-fun contains!10272 (ListLongMap!22533 (_ BitVec 64)) Bool)

(assert (=> b!1562153 (= lt!671510 (contains!10272 lt!671514 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562153 (not (contains!10272 lt!671514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671511 () V!59795)

(declare-fun lt!671513 () ListLongMap!22533)

(declare-fun +!5052 (ListLongMap!22533 tuple2!25098) ListLongMap!22533)

(assert (=> b!1562153 (= lt!671514 (+!5052 lt!671513 (tuple2!25099 (select (arr!50242 _keys!637) from!782) lt!671511)))))

(declare-datatypes ((Unit!51958 0))(
  ( (Unit!51959) )
))
(declare-fun lt!671512 () Unit!51958)

(declare-fun addStillNotContains!542 (ListLongMap!22533 (_ BitVec 64) V!59795 (_ BitVec 64)) Unit!51958)

(assert (=> b!1562153 (= lt!671512 (addStillNotContains!542 lt!671513 (select (arr!50242 _keys!637) from!782) lt!671511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26237 (ValueCell!18315 V!59795) V!59795)

(declare-fun dynLambda!3836 (Int (_ BitVec 64)) V!59795)

(assert (=> b!1562153 (= lt!671511 (get!26237 (select (arr!50243 _values!487) from!782) (dynLambda!3836 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59795)

(declare-fun minValue!453 () V!59795)

(declare-fun getCurrentListMapNoExtraKeys!6666 (array!104100 array!104102 (_ BitVec 32) (_ BitVec 32) V!59795 V!59795 (_ BitVec 32) Int) ListLongMap!22533)

(assert (=> b!1562153 (= lt!671513 (getCurrentListMapNoExtraKeys!6666 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133608 res!1068069) b!1562152))

(assert (= (and b!1562152 res!1068072) b!1562147))

(assert (= (and b!1562147 res!1068067) b!1562151))

(assert (= (and b!1562151 res!1068068) b!1562155))

(assert (= (and b!1562155 res!1068071) b!1562148))

(assert (= (and b!1562148 res!1068070) b!1562153))

(assert (= (and b!1562150 condMapEmpty!59412) mapIsEmpty!59412))

(assert (= (and b!1562150 (not condMapEmpty!59412)) mapNonEmpty!59412))

(get-info :version)

(assert (= (and mapNonEmpty!59412 ((_ is ValueCellFull!18315) mapValue!59412)) b!1562154))

(assert (= (and b!1562150 ((_ is ValueCellFull!18315) mapDefault!59412)) b!1562149))

(assert (= start!133608 b!1562150))

(declare-fun b_lambda!24899 () Bool)

(assert (=> (not b_lambda!24899) (not b!1562153)))

(declare-fun t!51284 () Bool)

(declare-fun tb!12569 () Bool)

(assert (=> (and start!133608 (= defaultEntry!495 defaultEntry!495) t!51284) tb!12569))

(declare-fun result!26419 () Bool)

(assert (=> tb!12569 (= result!26419 tp_is_empty!38691)))

(assert (=> b!1562153 t!51284))

(declare-fun b_and!51563 () Bool)

(assert (= b_and!51561 (and (=> t!51284 result!26419) b_and!51563)))

(declare-fun m!1437873 () Bool)

(assert (=> b!1562151 m!1437873))

(declare-fun m!1437875 () Bool)

(assert (=> mapNonEmpty!59412 m!1437875))

(declare-fun m!1437877 () Bool)

(assert (=> start!133608 m!1437877))

(declare-fun m!1437879 () Bool)

(assert (=> start!133608 m!1437879))

(declare-fun m!1437881 () Bool)

(assert (=> start!133608 m!1437881))

(declare-fun m!1437883 () Bool)

(assert (=> b!1562147 m!1437883))

(declare-fun m!1437885 () Bool)

(assert (=> b!1562148 m!1437885))

(assert (=> b!1562148 m!1437885))

(declare-fun m!1437887 () Bool)

(assert (=> b!1562148 m!1437887))

(declare-fun m!1437889 () Bool)

(assert (=> b!1562153 m!1437889))

(declare-fun m!1437891 () Bool)

(assert (=> b!1562153 m!1437891))

(declare-fun m!1437893 () Bool)

(assert (=> b!1562153 m!1437893))

(assert (=> b!1562153 m!1437889))

(assert (=> b!1562153 m!1437885))

(assert (=> b!1562153 m!1437891))

(declare-fun m!1437895 () Bool)

(assert (=> b!1562153 m!1437895))

(declare-fun m!1437897 () Bool)

(assert (=> b!1562153 m!1437897))

(declare-fun m!1437899 () Bool)

(assert (=> b!1562153 m!1437899))

(declare-fun m!1437901 () Bool)

(assert (=> b!1562153 m!1437901))

(assert (=> b!1562153 m!1437885))

(declare-fun m!1437903 () Bool)

(assert (=> b!1562153 m!1437903))

(check-sat tp_is_empty!38691 (not b!1562148) (not b_lambda!24899) (not b!1562153) (not b!1562151) b_and!51563 (not start!133608) (not mapNonEmpty!59412) (not b_next!32025) (not b!1562147))
(check-sat b_and!51563 (not b_next!32025))
