; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84016 () Bool)

(assert start!84016)

(declare-fun b_free!19789 () Bool)

(declare-fun b_next!19789 () Bool)

(assert (=> start!84016 (= b_free!19789 (not b_next!19789))))

(declare-fun tp!68890 () Bool)

(declare-fun b_and!31635 () Bool)

(assert (=> start!84016 (= tp!68890 b_and!31635)))

(declare-fun b!982110 () Bool)

(declare-fun e!553603 () Bool)

(declare-fun e!553600 () Bool)

(assert (=> b!982110 (= e!553603 e!553600)))

(declare-fun res!657271 () Bool)

(assert (=> b!982110 (=> (not res!657271) (not e!553600))))

(declare-datatypes ((array!61602 0))(
  ( (array!61603 (arr!29659 (Array (_ BitVec 32) (_ BitVec 64))) (size!30140 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61602)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982110 (= res!657271 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29659 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((V!35433 0))(
  ( (V!35434 (val!11469 Int)) )
))
(declare-datatypes ((ValueCell!10937 0))(
  ( (ValueCellFull!10937 (v!14030 V!35433)) (EmptyCell!10937) )
))
(declare-datatypes ((array!61604 0))(
  ( (array!61605 (arr!29660 (Array (_ BitVec 32) ValueCell!10937)) (size!30141 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61604)

(declare-fun lt!435864 () V!35433)

(declare-fun get!15394 (ValueCell!10937 V!35433) V!35433)

(declare-fun dynLambda!1782 (Int (_ BitVec 64)) V!35433)

(assert (=> b!982110 (= lt!435864 (get!15394 (select (arr!29660 _values!1278) from!1932) (dynLambda!1782 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35433)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14764 0))(
  ( (tuple2!14765 (_1!7393 (_ BitVec 64)) (_2!7393 V!35433)) )
))
(declare-datatypes ((List!20604 0))(
  ( (Nil!20601) (Cons!20600 (h!21762 tuple2!14764) (t!29334 List!20604)) )
))
(declare-datatypes ((ListLongMap!13451 0))(
  ( (ListLongMap!13452 (toList!6741 List!20604)) )
))
(declare-fun lt!435862 () ListLongMap!13451)

(declare-fun zeroValue!1220 () V!35433)

(declare-fun getCurrentListMapNoExtraKeys!3452 (array!61602 array!61604 (_ BitVec 32) (_ BitVec 32) V!35433 V!35433 (_ BitVec 32) Int) ListLongMap!13451)

(assert (=> b!982110 (= lt!435862 (getCurrentListMapNoExtraKeys!3452 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982111 () Bool)

(declare-fun e!553602 () Bool)

(declare-fun tp_is_empty!22837 () Bool)

(assert (=> b!982111 (= e!553602 tp_is_empty!22837)))

(declare-fun b!982112 () Bool)

(assert (=> b!982112 (= e!553600 (not true))))

(declare-fun lt!435860 () tuple2!14764)

(declare-fun lt!435863 () tuple2!14764)

(declare-fun +!3033 (ListLongMap!13451 tuple2!14764) ListLongMap!13451)

(assert (=> b!982112 (= (+!3033 (+!3033 lt!435862 lt!435860) lt!435863) (+!3033 (+!3033 lt!435862 lt!435863) lt!435860))))

(assert (=> b!982112 (= lt!435863 (tuple2!14765 (select (arr!29659 _keys!1544) from!1932) lt!435864))))

(assert (=> b!982112 (= lt!435860 (tuple2!14765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32532 0))(
  ( (Unit!32533) )
))
(declare-fun lt!435861 () Unit!32532)

(declare-fun addCommutativeForDiffKeys!637 (ListLongMap!13451 (_ BitVec 64) V!35433 (_ BitVec 64) V!35433) Unit!32532)

(assert (=> b!982112 (= lt!435861 (addCommutativeForDiffKeys!637 lt!435862 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29659 _keys!1544) from!1932) lt!435864))))

(declare-fun b!982113 () Bool)

(declare-fun res!657270 () Bool)

(assert (=> b!982113 (=> (not res!657270) (not e!553603))))

(declare-datatypes ((List!20605 0))(
  ( (Nil!20602) (Cons!20601 (h!21763 (_ BitVec 64)) (t!29335 List!20605)) )
))
(declare-fun arrayNoDuplicates!0 (array!61602 (_ BitVec 32) List!20605) Bool)

(assert (=> b!982113 (= res!657270 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20602))))

(declare-fun mapNonEmpty!36284 () Bool)

(declare-fun mapRes!36284 () Bool)

(declare-fun tp!68891 () Bool)

(declare-fun e!553599 () Bool)

(assert (=> mapNonEmpty!36284 (= mapRes!36284 (and tp!68891 e!553599))))

(declare-fun mapRest!36284 () (Array (_ BitVec 32) ValueCell!10937))

(declare-fun mapValue!36284 () ValueCell!10937)

(declare-fun mapKey!36284 () (_ BitVec 32))

(assert (=> mapNonEmpty!36284 (= (arr!29660 _values!1278) (store mapRest!36284 mapKey!36284 mapValue!36284))))

(declare-fun b!982114 () Bool)

(declare-fun res!657276 () Bool)

(assert (=> b!982114 (=> (not res!657276) (not e!553603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61602 (_ BitVec 32)) Bool)

(assert (=> b!982114 (= res!657276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982115 () Bool)

(assert (=> b!982115 (= e!553599 tp_is_empty!22837)))

(declare-fun res!657272 () Bool)

(assert (=> start!84016 (=> (not res!657272) (not e!553603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84016 (= res!657272 (validMask!0 mask!1948))))

(assert (=> start!84016 e!553603))

(assert (=> start!84016 true))

(assert (=> start!84016 tp_is_empty!22837))

(declare-fun e!553604 () Bool)

(declare-fun array_inv!22947 (array!61604) Bool)

(assert (=> start!84016 (and (array_inv!22947 _values!1278) e!553604)))

(assert (=> start!84016 tp!68890))

(declare-fun array_inv!22948 (array!61602) Bool)

(assert (=> start!84016 (array_inv!22948 _keys!1544)))

(declare-fun b!982116 () Bool)

(declare-fun res!657273 () Bool)

(assert (=> b!982116 (=> (not res!657273) (not e!553603))))

(assert (=> b!982116 (= res!657273 (and (= (size!30141 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30140 _keys!1544) (size!30141 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982117 () Bool)

(declare-fun res!657269 () Bool)

(assert (=> b!982117 (=> (not res!657269) (not e!553603))))

(assert (=> b!982117 (= res!657269 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30140 _keys!1544))))))

(declare-fun b!982118 () Bool)

(declare-fun res!657274 () Bool)

(assert (=> b!982118 (=> (not res!657274) (not e!553603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982118 (= res!657274 (validKeyInArray!0 (select (arr!29659 _keys!1544) from!1932)))))

(declare-fun b!982119 () Bool)

(declare-fun res!657275 () Bool)

(assert (=> b!982119 (=> (not res!657275) (not e!553603))))

(assert (=> b!982119 (= res!657275 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36284 () Bool)

(assert (=> mapIsEmpty!36284 mapRes!36284))

(declare-fun b!982120 () Bool)

(assert (=> b!982120 (= e!553604 (and e!553602 mapRes!36284))))

(declare-fun condMapEmpty!36284 () Bool)

(declare-fun mapDefault!36284 () ValueCell!10937)

(assert (=> b!982120 (= condMapEmpty!36284 (= (arr!29660 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10937)) mapDefault!36284)))))

(assert (= (and start!84016 res!657272) b!982116))

(assert (= (and b!982116 res!657273) b!982114))

(assert (= (and b!982114 res!657276) b!982113))

(assert (= (and b!982113 res!657270) b!982117))

(assert (= (and b!982117 res!657269) b!982118))

(assert (= (and b!982118 res!657274) b!982119))

(assert (= (and b!982119 res!657275) b!982110))

(assert (= (and b!982110 res!657271) b!982112))

(assert (= (and b!982120 condMapEmpty!36284) mapIsEmpty!36284))

(assert (= (and b!982120 (not condMapEmpty!36284)) mapNonEmpty!36284))

(get-info :version)

(assert (= (and mapNonEmpty!36284 ((_ is ValueCellFull!10937) mapValue!36284)) b!982115))

(assert (= (and b!982120 ((_ is ValueCellFull!10937) mapDefault!36284)) b!982111))

(assert (= start!84016 b!982120))

(declare-fun b_lambda!14809 () Bool)

(assert (=> (not b_lambda!14809) (not b!982110)))

(declare-fun t!29333 () Bool)

(declare-fun tb!6581 () Bool)

(assert (=> (and start!84016 (= defaultEntry!1281 defaultEntry!1281) t!29333) tb!6581))

(declare-fun result!13159 () Bool)

(assert (=> tb!6581 (= result!13159 tp_is_empty!22837)))

(assert (=> b!982110 t!29333))

(declare-fun b_and!31637 () Bool)

(assert (= b_and!31635 (and (=> t!29333 result!13159) b_and!31637)))

(declare-fun m!908933 () Bool)

(assert (=> start!84016 m!908933))

(declare-fun m!908935 () Bool)

(assert (=> start!84016 m!908935))

(declare-fun m!908937 () Bool)

(assert (=> start!84016 m!908937))

(declare-fun m!908939 () Bool)

(assert (=> b!982114 m!908939))

(declare-fun m!908941 () Bool)

(assert (=> b!982118 m!908941))

(assert (=> b!982118 m!908941))

(declare-fun m!908943 () Bool)

(assert (=> b!982118 m!908943))

(declare-fun m!908945 () Bool)

(assert (=> b!982113 m!908945))

(declare-fun m!908947 () Bool)

(assert (=> b!982112 m!908947))

(declare-fun m!908949 () Bool)

(assert (=> b!982112 m!908949))

(assert (=> b!982112 m!908947))

(declare-fun m!908951 () Bool)

(assert (=> b!982112 m!908951))

(declare-fun m!908953 () Bool)

(assert (=> b!982112 m!908953))

(assert (=> b!982112 m!908941))

(declare-fun m!908955 () Bool)

(assert (=> b!982112 m!908955))

(assert (=> b!982112 m!908941))

(assert (=> b!982112 m!908951))

(declare-fun m!908957 () Bool)

(assert (=> mapNonEmpty!36284 m!908957))

(assert (=> b!982110 m!908941))

(declare-fun m!908959 () Bool)

(assert (=> b!982110 m!908959))

(declare-fun m!908961 () Bool)

(assert (=> b!982110 m!908961))

(declare-fun m!908963 () Bool)

(assert (=> b!982110 m!908963))

(assert (=> b!982110 m!908959))

(assert (=> b!982110 m!908963))

(declare-fun m!908965 () Bool)

(assert (=> b!982110 m!908965))

(check-sat (not b!982110) (not b_next!19789) (not b_lambda!14809) (not mapNonEmpty!36284) tp_is_empty!22837 (not b!982113) (not b!982114) (not start!84016) b_and!31637 (not b!982112) (not b!982118))
(check-sat b_and!31637 (not b_next!19789))
