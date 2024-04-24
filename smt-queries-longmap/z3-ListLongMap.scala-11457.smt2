; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133952 () Bool)

(assert start!133952)

(declare-fun b_free!31957 () Bool)

(declare-fun b_next!31957 () Bool)

(assert (=> start!133952 (= b_free!31957 (not b_next!31957))))

(declare-fun tp!112994 () Bool)

(declare-fun b_and!51427 () Bool)

(assert (=> start!133952 (= tp!112994 b_and!51427)))

(declare-fun b!1563588 () Bool)

(declare-fun res!1068311 () Bool)

(declare-fun e!871512 () Bool)

(assert (=> b!1563588 (=> (not res!1068311) (not e!871512))))

(declare-datatypes ((array!104080 0))(
  ( (array!104081 (arr!50225 (Array (_ BitVec 32) (_ BitVec 64))) (size!50776 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104080)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104080 (_ BitVec 32)) Bool)

(assert (=> b!1563588 (= res!1068311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563589 () Bool)

(declare-fun e!871511 () Bool)

(declare-fun tp_is_empty!38623 () Bool)

(assert (=> b!1563589 (= e!871511 tp_is_empty!38623)))

(declare-fun b!1563590 () Bool)

(declare-fun e!871510 () Bool)

(declare-fun e!871513 () Bool)

(declare-fun mapRes!59310 () Bool)

(assert (=> b!1563590 (= e!871510 (and e!871513 mapRes!59310))))

(declare-fun condMapEmpty!59310 () Bool)

(declare-datatypes ((V!59705 0))(
  ( (V!59706 (val!19395 Int)) )
))
(declare-datatypes ((ValueCell!18281 0))(
  ( (ValueCellFull!18281 (v!22139 V!59705)) (EmptyCell!18281) )
))
(declare-datatypes ((array!104082 0))(
  ( (array!104083 (arr!50226 (Array (_ BitVec 32) ValueCell!18281)) (size!50777 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104082)

(declare-fun mapDefault!59310 () ValueCell!18281)

(assert (=> b!1563590 (= condMapEmpty!59310 (= (arr!50226 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18281)) mapDefault!59310)))))

(declare-fun b!1563592 () Bool)

(assert (=> b!1563592 (= e!871513 tp_is_empty!38623)))

(declare-fun b!1563593 () Bool)

(declare-fun res!1068310 () Bool)

(assert (=> b!1563593 (=> (not res!1068310) (not e!871512))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563593 (= res!1068310 (and (= (size!50777 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50776 _keys!637) (size!50777 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563594 () Bool)

(declare-fun res!1068309 () Bool)

(assert (=> b!1563594 (=> (not res!1068309) (not e!871512))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563594 (= res!1068309 (validKeyInArray!0 (select (arr!50225 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59310 () Bool)

(assert (=> mapIsEmpty!59310 mapRes!59310))

(declare-fun mapNonEmpty!59310 () Bool)

(declare-fun tp!112995 () Bool)

(assert (=> mapNonEmpty!59310 (= mapRes!59310 (and tp!112995 e!871511))))

(declare-fun mapRest!59310 () (Array (_ BitVec 32) ValueCell!18281))

(declare-fun mapKey!59310 () (_ BitVec 32))

(declare-fun mapValue!59310 () ValueCell!18281)

(assert (=> mapNonEmpty!59310 (= (arr!50226 _values!487) (store mapRest!59310 mapKey!59310 mapValue!59310))))

(declare-fun b!1563595 () Bool)

(declare-fun res!1068307 () Bool)

(assert (=> b!1563595 (=> (not res!1068307) (not e!871512))))

(assert (=> b!1563595 (= res!1068307 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50776 _keys!637)) (bvslt from!782 (size!50776 _keys!637))))))

(declare-fun b!1563596 () Bool)

(assert (=> b!1563596 (= e!871512 (not true))))

(declare-fun lt!672030 () V!59705)

(declare-datatypes ((tuple2!25112 0))(
  ( (tuple2!25113 (_1!12567 (_ BitVec 64)) (_2!12567 V!59705)) )
))
(declare-datatypes ((List!36450 0))(
  ( (Nil!36447) (Cons!36446 (h!37910 tuple2!25112) (t!51189 List!36450)) )
))
(declare-datatypes ((ListLongMap!22555 0))(
  ( (ListLongMap!22556 (toList!11293 List!36450)) )
))
(declare-fun lt!672031 () ListLongMap!22555)

(declare-fun contains!10294 (ListLongMap!22555 (_ BitVec 64)) Bool)

(declare-fun +!5069 (ListLongMap!22555 tuple2!25112) ListLongMap!22555)

(assert (=> b!1563596 (not (contains!10294 (+!5069 lt!672031 (tuple2!25113 (select (arr!50225 _keys!637) from!782) lt!672030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51823 0))(
  ( (Unit!51824) )
))
(declare-fun lt!672032 () Unit!51823)

(declare-fun addStillNotContains!520 (ListLongMap!22555 (_ BitVec 64) V!59705 (_ BitVec 64)) Unit!51823)

(assert (=> b!1563596 (= lt!672032 (addStillNotContains!520 lt!672031 (select (arr!50225 _keys!637) from!782) lt!672030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26233 (ValueCell!18281 V!59705) V!59705)

(declare-fun dynLambda!3867 (Int (_ BitVec 64)) V!59705)

(assert (=> b!1563596 (= lt!672030 (get!26233 (select (arr!50226 _values!487) from!782) (dynLambda!3867 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59705)

(declare-fun minValue!453 () V!59705)

(declare-fun getCurrentListMapNoExtraKeys!6692 (array!104080 array!104082 (_ BitVec 32) (_ BitVec 32) V!59705 V!59705 (_ BitVec 32) Int) ListLongMap!22555)

(assert (=> b!1563596 (= lt!672031 (getCurrentListMapNoExtraKeys!6692 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563591 () Bool)

(declare-fun res!1068306 () Bool)

(assert (=> b!1563591 (=> (not res!1068306) (not e!871512))))

(declare-datatypes ((List!36451 0))(
  ( (Nil!36448) (Cons!36447 (h!37911 (_ BitVec 64)) (t!51190 List!36451)) )
))
(declare-fun arrayNoDuplicates!0 (array!104080 (_ BitVec 32) List!36451) Bool)

(assert (=> b!1563591 (= res!1068306 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36448))))

(declare-fun res!1068308 () Bool)

(assert (=> start!133952 (=> (not res!1068308) (not e!871512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133952 (= res!1068308 (validMask!0 mask!947))))

(assert (=> start!133952 e!871512))

(assert (=> start!133952 tp!112994))

(assert (=> start!133952 tp_is_empty!38623))

(assert (=> start!133952 true))

(declare-fun array_inv!39287 (array!104080) Bool)

(assert (=> start!133952 (array_inv!39287 _keys!637)))

(declare-fun array_inv!39288 (array!104082) Bool)

(assert (=> start!133952 (and (array_inv!39288 _values!487) e!871510)))

(assert (= (and start!133952 res!1068308) b!1563593))

(assert (= (and b!1563593 res!1068310) b!1563588))

(assert (= (and b!1563588 res!1068311) b!1563591))

(assert (= (and b!1563591 res!1068306) b!1563595))

(assert (= (and b!1563595 res!1068307) b!1563594))

(assert (= (and b!1563594 res!1068309) b!1563596))

(assert (= (and b!1563590 condMapEmpty!59310) mapIsEmpty!59310))

(assert (= (and b!1563590 (not condMapEmpty!59310)) mapNonEmpty!59310))

(get-info :version)

(assert (= (and mapNonEmpty!59310 ((_ is ValueCellFull!18281) mapValue!59310)) b!1563589))

(assert (= (and b!1563590 ((_ is ValueCellFull!18281) mapDefault!59310)) b!1563592))

(assert (= start!133952 b!1563590))

(declare-fun b_lambda!24825 () Bool)

(assert (=> (not b_lambda!24825) (not b!1563596)))

(declare-fun t!51188 () Bool)

(declare-fun tb!12493 () Bool)

(assert (=> (and start!133952 (= defaultEntry!495 defaultEntry!495) t!51188) tb!12493))

(declare-fun result!26275 () Bool)

(assert (=> tb!12493 (= result!26275 tp_is_empty!38623)))

(assert (=> b!1563596 t!51188))

(declare-fun b_and!51429 () Bool)

(assert (= b_and!51427 (and (=> t!51188 result!26275) b_and!51429)))

(declare-fun m!1439079 () Bool)

(assert (=> b!1563594 m!1439079))

(assert (=> b!1563594 m!1439079))

(declare-fun m!1439081 () Bool)

(assert (=> b!1563594 m!1439081))

(declare-fun m!1439083 () Bool)

(assert (=> b!1563588 m!1439083))

(declare-fun m!1439085 () Bool)

(assert (=> b!1563596 m!1439085))

(declare-fun m!1439087 () Bool)

(assert (=> b!1563596 m!1439087))

(declare-fun m!1439089 () Bool)

(assert (=> b!1563596 m!1439089))

(assert (=> b!1563596 m!1439085))

(declare-fun m!1439091 () Bool)

(assert (=> b!1563596 m!1439091))

(declare-fun m!1439093 () Bool)

(assert (=> b!1563596 m!1439093))

(assert (=> b!1563596 m!1439079))

(declare-fun m!1439095 () Bool)

(assert (=> b!1563596 m!1439095))

(assert (=> b!1563596 m!1439079))

(declare-fun m!1439097 () Bool)

(assert (=> b!1563596 m!1439097))

(assert (=> b!1563596 m!1439091))

(assert (=> b!1563596 m!1439087))

(declare-fun m!1439099 () Bool)

(assert (=> start!133952 m!1439099))

(declare-fun m!1439101 () Bool)

(assert (=> start!133952 m!1439101))

(declare-fun m!1439103 () Bool)

(assert (=> start!133952 m!1439103))

(declare-fun m!1439105 () Bool)

(assert (=> b!1563591 m!1439105))

(declare-fun m!1439107 () Bool)

(assert (=> mapNonEmpty!59310 m!1439107))

(check-sat (not b_lambda!24825) (not b!1563588) tp_is_empty!38623 (not b_next!31957) (not b!1563594) (not b!1563596) (not mapNonEmpty!59310) (not start!133952) (not b!1563591) b_and!51429)
(check-sat b_and!51429 (not b_next!31957))
