; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133982 () Bool)

(assert start!133982)

(declare-fun b_free!31987 () Bool)

(declare-fun b_next!31987 () Bool)

(assert (=> start!133982 (= b_free!31987 (not b_next!31987))))

(declare-fun tp!113085 () Bool)

(declare-fun b_and!51487 () Bool)

(assert (=> start!133982 (= tp!113085 b_and!51487)))

(declare-fun b!1564023 () Bool)

(declare-fun res!1068577 () Bool)

(declare-fun e!871738 () Bool)

(assert (=> b!1564023 (=> (not res!1068577) (not e!871738))))

(declare-datatypes ((array!104140 0))(
  ( (array!104141 (arr!50255 (Array (_ BitVec 32) (_ BitVec 64))) (size!50806 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104140)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104140 (_ BitVec 32)) Bool)

(assert (=> b!1564023 (= res!1068577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564024 () Bool)

(declare-fun res!1068576 () Bool)

(assert (=> b!1564024 (=> (not res!1068576) (not e!871738))))

(declare-datatypes ((List!36473 0))(
  ( (Nil!36470) (Cons!36469 (h!37933 (_ BitVec 64)) (t!51242 List!36473)) )
))
(declare-fun arrayNoDuplicates!0 (array!104140 (_ BitVec 32) List!36473) Bool)

(assert (=> b!1564024 (= res!1068576 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36470))))

(declare-fun b!1564025 () Bool)

(declare-fun res!1068579 () Bool)

(assert (=> b!1564025 (=> (not res!1068579) (not e!871738))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564025 (= res!1068579 (validKeyInArray!0 (select (arr!50255 _keys!637) from!782)))))

(declare-fun b!1564026 () Bool)

(declare-fun res!1068578 () Bool)

(assert (=> b!1564026 (=> (not res!1068578) (not e!871738))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59745 0))(
  ( (V!59746 (val!19410 Int)) )
))
(declare-datatypes ((ValueCell!18296 0))(
  ( (ValueCellFull!18296 (v!22154 V!59745)) (EmptyCell!18296) )
))
(declare-datatypes ((array!104142 0))(
  ( (array!104143 (arr!50256 (Array (_ BitVec 32) ValueCell!18296)) (size!50807 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104142)

(assert (=> b!1564026 (= res!1068578 (and (= (size!50807 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50806 _keys!637) (size!50807 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564027 () Bool)

(declare-fun e!871737 () Bool)

(declare-fun tp_is_empty!38653 () Bool)

(assert (=> b!1564027 (= e!871737 tp_is_empty!38653)))

(declare-fun res!1068581 () Bool)

(assert (=> start!133982 (=> (not res!1068581) (not e!871738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133982 (= res!1068581 (validMask!0 mask!947))))

(assert (=> start!133982 e!871738))

(assert (=> start!133982 tp!113085))

(assert (=> start!133982 tp_is_empty!38653))

(assert (=> start!133982 true))

(declare-fun array_inv!39309 (array!104140) Bool)

(assert (=> start!133982 (array_inv!39309 _keys!637)))

(declare-fun e!871736 () Bool)

(declare-fun array_inv!39310 (array!104142) Bool)

(assert (=> start!133982 (and (array_inv!39310 _values!487) e!871736)))

(declare-fun b!1564028 () Bool)

(declare-fun mapRes!59355 () Bool)

(assert (=> b!1564028 (= e!871736 (and e!871737 mapRes!59355))))

(declare-fun condMapEmpty!59355 () Bool)

(declare-fun mapDefault!59355 () ValueCell!18296)

(assert (=> b!1564028 (= condMapEmpty!59355 (= (arr!50256 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18296)) mapDefault!59355)))))

(declare-fun b!1564029 () Bool)

(declare-fun e!871735 () Bool)

(assert (=> b!1564029 (= e!871735 tp_is_empty!38653)))

(declare-fun mapNonEmpty!59355 () Bool)

(declare-fun tp!113084 () Bool)

(assert (=> mapNonEmpty!59355 (= mapRes!59355 (and tp!113084 e!871735))))

(declare-fun mapKey!59355 () (_ BitVec 32))

(declare-fun mapRest!59355 () (Array (_ BitVec 32) ValueCell!18296))

(declare-fun mapValue!59355 () ValueCell!18296)

(assert (=> mapNonEmpty!59355 (= (arr!50256 _values!487) (store mapRest!59355 mapKey!59355 mapValue!59355))))

(declare-fun b!1564030 () Bool)

(assert (=> b!1564030 (= e!871738 (not true))))

(declare-fun lt!672166 () V!59745)

(declare-datatypes ((tuple2!25134 0))(
  ( (tuple2!25135 (_1!12578 (_ BitVec 64)) (_2!12578 V!59745)) )
))
(declare-datatypes ((List!36474 0))(
  ( (Nil!36471) (Cons!36470 (h!37934 tuple2!25134) (t!51243 List!36474)) )
))
(declare-datatypes ((ListLongMap!22577 0))(
  ( (ListLongMap!22578 (toList!11304 List!36474)) )
))
(declare-fun lt!672165 () ListLongMap!22577)

(declare-fun contains!10305 (ListLongMap!22577 (_ BitVec 64)) Bool)

(declare-fun +!5080 (ListLongMap!22577 tuple2!25134) ListLongMap!22577)

(assert (=> b!1564030 (not (contains!10305 (+!5080 lt!672165 (tuple2!25135 (select (arr!50255 _keys!637) from!782) lt!672166)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51845 0))(
  ( (Unit!51846) )
))
(declare-fun lt!672167 () Unit!51845)

(declare-fun addStillNotContains!531 (ListLongMap!22577 (_ BitVec 64) V!59745 (_ BitVec 64)) Unit!51845)

(assert (=> b!1564030 (= lt!672167 (addStillNotContains!531 lt!672165 (select (arr!50255 _keys!637) from!782) lt!672166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26254 (ValueCell!18296 V!59745) V!59745)

(declare-fun dynLambda!3878 (Int (_ BitVec 64)) V!59745)

(assert (=> b!1564030 (= lt!672166 (get!26254 (select (arr!50256 _values!487) from!782) (dynLambda!3878 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59745)

(declare-fun minValue!453 () V!59745)

(declare-fun getCurrentListMapNoExtraKeys!6703 (array!104140 array!104142 (_ BitVec 32) (_ BitVec 32) V!59745 V!59745 (_ BitVec 32) Int) ListLongMap!22577)

(assert (=> b!1564030 (= lt!672165 (getCurrentListMapNoExtraKeys!6703 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564031 () Bool)

(declare-fun res!1068580 () Bool)

(assert (=> b!1564031 (=> (not res!1068580) (not e!871738))))

(assert (=> b!1564031 (= res!1068580 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50806 _keys!637)) (bvslt from!782 (size!50806 _keys!637))))))

(declare-fun mapIsEmpty!59355 () Bool)

(assert (=> mapIsEmpty!59355 mapRes!59355))

(assert (= (and start!133982 res!1068581) b!1564026))

(assert (= (and b!1564026 res!1068578) b!1564023))

(assert (= (and b!1564023 res!1068577) b!1564024))

(assert (= (and b!1564024 res!1068576) b!1564031))

(assert (= (and b!1564031 res!1068580) b!1564025))

(assert (= (and b!1564025 res!1068579) b!1564030))

(assert (= (and b!1564028 condMapEmpty!59355) mapIsEmpty!59355))

(assert (= (and b!1564028 (not condMapEmpty!59355)) mapNonEmpty!59355))

(get-info :version)

(assert (= (and mapNonEmpty!59355 ((_ is ValueCellFull!18296) mapValue!59355)) b!1564029))

(assert (= (and b!1564028 ((_ is ValueCellFull!18296) mapDefault!59355)) b!1564027))

(assert (= start!133982 b!1564028))

(declare-fun b_lambda!24855 () Bool)

(assert (=> (not b_lambda!24855) (not b!1564030)))

(declare-fun t!51241 () Bool)

(declare-fun tb!12523 () Bool)

(assert (=> (and start!133982 (= defaultEntry!495 defaultEntry!495) t!51241) tb!12523))

(declare-fun result!26335 () Bool)

(assert (=> tb!12523 (= result!26335 tp_is_empty!38653)))

(assert (=> b!1564030 t!51241))

(declare-fun b_and!51489 () Bool)

(assert (= b_and!51487 (and (=> t!51241 result!26335) b_and!51489)))

(declare-fun m!1439529 () Bool)

(assert (=> mapNonEmpty!59355 m!1439529))

(declare-fun m!1439531 () Bool)

(assert (=> start!133982 m!1439531))

(declare-fun m!1439533 () Bool)

(assert (=> start!133982 m!1439533))

(declare-fun m!1439535 () Bool)

(assert (=> start!133982 m!1439535))

(declare-fun m!1439537 () Bool)

(assert (=> b!1564030 m!1439537))

(declare-fun m!1439539 () Bool)

(assert (=> b!1564030 m!1439539))

(declare-fun m!1439541 () Bool)

(assert (=> b!1564030 m!1439541))

(assert (=> b!1564030 m!1439537))

(declare-fun m!1439543 () Bool)

(assert (=> b!1564030 m!1439543))

(assert (=> b!1564030 m!1439539))

(declare-fun m!1439545 () Bool)

(assert (=> b!1564030 m!1439545))

(declare-fun m!1439547 () Bool)

(assert (=> b!1564030 m!1439547))

(declare-fun m!1439549 () Bool)

(assert (=> b!1564030 m!1439549))

(assert (=> b!1564030 m!1439543))

(declare-fun m!1439551 () Bool)

(assert (=> b!1564030 m!1439551))

(assert (=> b!1564030 m!1439545))

(declare-fun m!1439553 () Bool)

(assert (=> b!1564024 m!1439553))

(assert (=> b!1564025 m!1439543))

(assert (=> b!1564025 m!1439543))

(declare-fun m!1439555 () Bool)

(assert (=> b!1564025 m!1439555))

(declare-fun m!1439557 () Bool)

(assert (=> b!1564023 m!1439557))

(check-sat (not b_lambda!24855) (not mapNonEmpty!59355) b_and!51489 (not b_next!31987) (not b!1564024) (not b!1564030) tp_is_empty!38653 (not b!1564023) (not start!133982) (not b!1564025))
(check-sat b_and!51489 (not b_next!31987))
