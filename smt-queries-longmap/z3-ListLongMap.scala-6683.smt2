; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84238 () Bool)

(assert start!84238)

(declare-fun b_free!19825 () Bool)

(declare-fun b_next!19825 () Bool)

(assert (=> start!84238 (= b_free!19825 (not b_next!19825))))

(declare-fun tp!68999 () Bool)

(declare-fun b_and!31743 () Bool)

(assert (=> start!84238 (= tp!68999 b_and!31743)))

(declare-fun b!983882 () Bool)

(declare-fun res!658158 () Bool)

(declare-fun e!554654 () Bool)

(assert (=> b!983882 (=> (not res!658158) (not e!554654))))

(declare-datatypes ((array!61772 0))(
  ( (array!61773 (arr!29739 (Array (_ BitVec 32) (_ BitVec 64))) (size!30219 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61772)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61772 (_ BitVec 32)) Bool)

(assert (=> b!983882 (= res!658158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36338 () Bool)

(declare-fun mapRes!36338 () Bool)

(declare-fun tp!68998 () Bool)

(declare-fun e!554658 () Bool)

(assert (=> mapNonEmpty!36338 (= mapRes!36338 (and tp!68998 e!554658))))

(declare-datatypes ((V!35481 0))(
  ( (V!35482 (val!11487 Int)) )
))
(declare-datatypes ((ValueCell!10955 0))(
  ( (ValueCellFull!10955 (v!14046 V!35481)) (EmptyCell!10955) )
))
(declare-datatypes ((array!61774 0))(
  ( (array!61775 (arr!29740 (Array (_ BitVec 32) ValueCell!10955)) (size!30220 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61774)

(declare-fun mapRest!36338 () (Array (_ BitVec 32) ValueCell!10955))

(declare-fun mapValue!36338 () ValueCell!10955)

(declare-fun mapKey!36338 () (_ BitVec 32))

(assert (=> mapNonEmpty!36338 (= (arr!29740 _values!1278) (store mapRest!36338 mapKey!36338 mapValue!36338))))

(declare-fun b!983883 () Bool)

(declare-fun res!658156 () Bool)

(assert (=> b!983883 (=> (not res!658156) (not e!554654))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983883 (= res!658156 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30219 _keys!1544))))))

(declare-fun b!983884 () Bool)

(declare-fun e!554655 () Bool)

(assert (=> b!983884 (= e!554654 e!554655)))

(declare-fun res!658157 () Bool)

(assert (=> b!983884 (=> (not res!658157) (not e!554655))))

(assert (=> b!983884 (= res!658157 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29739 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436729 () V!35481)

(declare-fun get!15456 (ValueCell!10955 V!35481) V!35481)

(declare-fun dynLambda!1833 (Int (_ BitVec 64)) V!35481)

(assert (=> b!983884 (= lt!436729 (get!15456 (select (arr!29740 _values!1278) from!1932) (dynLambda!1833 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35481)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35481)

(declare-datatypes ((tuple2!14734 0))(
  ( (tuple2!14735 (_1!7378 (_ BitVec 64)) (_2!7378 V!35481)) )
))
(declare-datatypes ((List!20608 0))(
  ( (Nil!20605) (Cons!20604 (h!21772 tuple2!14734) (t!29375 List!20608)) )
))
(declare-datatypes ((ListLongMap!13433 0))(
  ( (ListLongMap!13434 (toList!6732 List!20608)) )
))
(declare-fun lt!436727 () ListLongMap!13433)

(declare-fun getCurrentListMapNoExtraKeys!3474 (array!61772 array!61774 (_ BitVec 32) (_ BitVec 32) V!35481 V!35481 (_ BitVec 32) Int) ListLongMap!13433)

(assert (=> b!983884 (= lt!436727 (getCurrentListMapNoExtraKeys!3474 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983885 () Bool)

(declare-fun e!554656 () Bool)

(declare-fun tp_is_empty!22873 () Bool)

(assert (=> b!983885 (= e!554656 tp_is_empty!22873)))

(declare-fun b!983886 () Bool)

(declare-fun res!658155 () Bool)

(assert (=> b!983886 (=> (not res!658155) (not e!554654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983886 (= res!658155 (validKeyInArray!0 (select (arr!29739 _keys!1544) from!1932)))))

(declare-fun b!983887 () Bool)

(assert (=> b!983887 (= e!554658 tp_is_empty!22873)))

(declare-fun b!983888 () Bool)

(declare-fun res!658159 () Bool)

(assert (=> b!983888 (=> (not res!658159) (not e!554654))))

(declare-datatypes ((List!20609 0))(
  ( (Nil!20606) (Cons!20605 (h!21773 (_ BitVec 64)) (t!29376 List!20609)) )
))
(declare-fun arrayNoDuplicates!0 (array!61772 (_ BitVec 32) List!20609) Bool)

(assert (=> b!983888 (= res!658159 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20606))))

(declare-fun b!983889 () Bool)

(declare-fun res!658160 () Bool)

(assert (=> b!983889 (=> (not res!658160) (not e!554654))))

(assert (=> b!983889 (= res!658160 (and (= (size!30220 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30219 _keys!1544) (size!30220 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!658161 () Bool)

(assert (=> start!84238 (=> (not res!658161) (not e!554654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84238 (= res!658161 (validMask!0 mask!1948))))

(assert (=> start!84238 e!554654))

(assert (=> start!84238 true))

(assert (=> start!84238 tp_is_empty!22873))

(declare-fun e!554653 () Bool)

(declare-fun array_inv!23011 (array!61774) Bool)

(assert (=> start!84238 (and (array_inv!23011 _values!1278) e!554653)))

(assert (=> start!84238 tp!68999))

(declare-fun array_inv!23012 (array!61772) Bool)

(assert (=> start!84238 (array_inv!23012 _keys!1544)))

(declare-fun b!983890 () Bool)

(declare-fun res!658162 () Bool)

(assert (=> b!983890 (=> (not res!658162) (not e!554654))))

(assert (=> b!983890 (= res!658162 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983891 () Bool)

(assert (=> b!983891 (= e!554655 (not true))))

(declare-fun lt!436731 () tuple2!14734)

(declare-fun lt!436728 () tuple2!14734)

(declare-fun +!3038 (ListLongMap!13433 tuple2!14734) ListLongMap!13433)

(assert (=> b!983891 (= (+!3038 (+!3038 lt!436727 lt!436731) lt!436728) (+!3038 (+!3038 lt!436727 lt!436728) lt!436731))))

(assert (=> b!983891 (= lt!436728 (tuple2!14735 (select (arr!29739 _keys!1544) from!1932) lt!436729))))

(assert (=> b!983891 (= lt!436731 (tuple2!14735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32656 0))(
  ( (Unit!32657) )
))
(declare-fun lt!436730 () Unit!32656)

(declare-fun addCommutativeForDiffKeys!645 (ListLongMap!13433 (_ BitVec 64) V!35481 (_ BitVec 64) V!35481) Unit!32656)

(assert (=> b!983891 (= lt!436730 (addCommutativeForDiffKeys!645 lt!436727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29739 _keys!1544) from!1932) lt!436729))))

(declare-fun b!983892 () Bool)

(assert (=> b!983892 (= e!554653 (and e!554656 mapRes!36338))))

(declare-fun condMapEmpty!36338 () Bool)

(declare-fun mapDefault!36338 () ValueCell!10955)

(assert (=> b!983892 (= condMapEmpty!36338 (= (arr!29740 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10955)) mapDefault!36338)))))

(declare-fun mapIsEmpty!36338 () Bool)

(assert (=> mapIsEmpty!36338 mapRes!36338))

(assert (= (and start!84238 res!658161) b!983889))

(assert (= (and b!983889 res!658160) b!983882))

(assert (= (and b!983882 res!658158) b!983888))

(assert (= (and b!983888 res!658159) b!983883))

(assert (= (and b!983883 res!658156) b!983886))

(assert (= (and b!983886 res!658155) b!983890))

(assert (= (and b!983890 res!658162) b!983884))

(assert (= (and b!983884 res!658157) b!983891))

(assert (= (and b!983892 condMapEmpty!36338) mapIsEmpty!36338))

(assert (= (and b!983892 (not condMapEmpty!36338)) mapNonEmpty!36338))

(get-info :version)

(assert (= (and mapNonEmpty!36338 ((_ is ValueCellFull!10955) mapValue!36338)) b!983887))

(assert (= (and b!983892 ((_ is ValueCellFull!10955) mapDefault!36338)) b!983885))

(assert (= start!84238 b!983892))

(declare-fun b_lambda!14877 () Bool)

(assert (=> (not b_lambda!14877) (not b!983884)))

(declare-fun t!29374 () Bool)

(declare-fun tb!6617 () Bool)

(assert (=> (and start!84238 (= defaultEntry!1281 defaultEntry!1281) t!29374) tb!6617))

(declare-fun result!13231 () Bool)

(assert (=> tb!6617 (= result!13231 tp_is_empty!22873)))

(assert (=> b!983884 t!29374))

(declare-fun b_and!31745 () Bool)

(assert (= b_and!31743 (and (=> t!29374 result!13231) b_and!31745)))

(declare-fun m!911597 () Bool)

(assert (=> b!983882 m!911597))

(declare-fun m!911599 () Bool)

(assert (=> b!983884 m!911599))

(declare-fun m!911601 () Bool)

(assert (=> b!983884 m!911601))

(declare-fun m!911603 () Bool)

(assert (=> b!983884 m!911603))

(declare-fun m!911605 () Bool)

(assert (=> b!983884 m!911605))

(assert (=> b!983884 m!911601))

(assert (=> b!983884 m!911605))

(declare-fun m!911607 () Bool)

(assert (=> b!983884 m!911607))

(declare-fun m!911609 () Bool)

(assert (=> mapNonEmpty!36338 m!911609))

(declare-fun m!911611 () Bool)

(assert (=> b!983888 m!911611))

(assert (=> b!983891 m!911599))

(declare-fun m!911613 () Bool)

(assert (=> b!983891 m!911613))

(declare-fun m!911615 () Bool)

(assert (=> b!983891 m!911615))

(assert (=> b!983891 m!911613))

(declare-fun m!911617 () Bool)

(assert (=> b!983891 m!911617))

(assert (=> b!983891 m!911599))

(declare-fun m!911619 () Bool)

(assert (=> b!983891 m!911619))

(assert (=> b!983891 m!911617))

(declare-fun m!911621 () Bool)

(assert (=> b!983891 m!911621))

(declare-fun m!911623 () Bool)

(assert (=> start!84238 m!911623))

(declare-fun m!911625 () Bool)

(assert (=> start!84238 m!911625))

(declare-fun m!911627 () Bool)

(assert (=> start!84238 m!911627))

(assert (=> b!983886 m!911599))

(assert (=> b!983886 m!911599))

(declare-fun m!911629 () Bool)

(assert (=> b!983886 m!911629))

(check-sat (not b!983882) (not b_next!19825) (not b!983888) b_and!31745 tp_is_empty!22873 (not b!983891) (not b!983886) (not b!983884) (not b_lambda!14877) (not mapNonEmpty!36338) (not start!84238))
(check-sat b_and!31745 (not b_next!19825))
