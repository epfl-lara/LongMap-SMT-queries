; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83982 () Bool)

(assert start!83982)

(declare-fun b_free!19737 () Bool)

(declare-fun b_next!19737 () Bool)

(assert (=> start!83982 (= b_free!19737 (not b_next!19737))))

(declare-fun tp!68734 () Bool)

(declare-fun b_and!31557 () Bool)

(assert (=> start!83982 (= tp!68734 b_and!31557)))

(declare-fun mapIsEmpty!36206 () Bool)

(declare-fun mapRes!36206 () Bool)

(assert (=> mapIsEmpty!36206 mapRes!36206))

(declare-fun b!981439 () Bool)

(declare-fun e!553284 () Bool)

(declare-fun tp_is_empty!22785 () Bool)

(assert (=> b!981439 (= e!553284 tp_is_empty!22785)))

(declare-fun b!981440 () Bool)

(declare-fun e!553281 () Bool)

(declare-fun e!553280 () Bool)

(assert (=> b!981440 (= e!553281 e!553280)))

(declare-fun res!656755 () Bool)

(assert (=> b!981440 (=> (not res!656755) (not e!553280))))

(declare-datatypes ((array!61567 0))(
  ( (array!61568 (arr!29641 (Array (_ BitVec 32) (_ BitVec 64))) (size!30120 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61567)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981440 (= res!656755 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29641 _keys!1544) from!1932))))))

(declare-datatypes ((V!35363 0))(
  ( (V!35364 (val!11443 Int)) )
))
(declare-datatypes ((ValueCell!10911 0))(
  ( (ValueCellFull!10911 (v!14005 V!35363)) (EmptyCell!10911) )
))
(declare-datatypes ((array!61569 0))(
  ( (array!61570 (arr!29642 (Array (_ BitVec 32) ValueCell!10911)) (size!30121 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61569)

(declare-fun lt!435710 () V!35363)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15361 (ValueCell!10911 V!35363) V!35363)

(declare-fun dynLambda!1772 (Int (_ BitVec 64)) V!35363)

(assert (=> b!981440 (= lt!435710 (get!15361 (select (arr!29642 _values!1278) from!1932) (dynLambda!1772 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35363)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35363)

(declare-datatypes ((tuple2!14646 0))(
  ( (tuple2!14647 (_1!7334 (_ BitVec 64)) (_2!7334 V!35363)) )
))
(declare-datatypes ((List!20530 0))(
  ( (Nil!20527) (Cons!20526 (h!21688 tuple2!14646) (t!29217 List!20530)) )
))
(declare-datatypes ((ListLongMap!13343 0))(
  ( (ListLongMap!13344 (toList!6687 List!20530)) )
))
(declare-fun lt!435706 () ListLongMap!13343)

(declare-fun getCurrentListMapNoExtraKeys!3389 (array!61567 array!61569 (_ BitVec 32) (_ BitVec 32) V!35363 V!35363 (_ BitVec 32) Int) ListLongMap!13343)

(assert (=> b!981440 (= lt!435706 (getCurrentListMapNoExtraKeys!3389 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981441 () Bool)

(declare-fun res!656758 () Bool)

(assert (=> b!981441 (=> (not res!656758) (not e!553281))))

(assert (=> b!981441 (= res!656758 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30120 _keys!1544))))))

(declare-fun b!981442 () Bool)

(declare-fun res!656757 () Bool)

(assert (=> b!981442 (=> (not res!656757) (not e!553281))))

(assert (=> b!981442 (= res!656757 (and (= (size!30121 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30120 _keys!1544) (size!30121 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981444 () Bool)

(declare-fun res!656761 () Bool)

(assert (=> b!981444 (=> (not res!656761) (not e!553281))))

(declare-datatypes ((List!20531 0))(
  ( (Nil!20528) (Cons!20527 (h!21689 (_ BitVec 64)) (t!29218 List!20531)) )
))
(declare-fun arrayNoDuplicates!0 (array!61567 (_ BitVec 32) List!20531) Bool)

(assert (=> b!981444 (= res!656761 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20528))))

(declare-fun mapNonEmpty!36206 () Bool)

(declare-fun tp!68733 () Bool)

(declare-fun e!553283 () Bool)

(assert (=> mapNonEmpty!36206 (= mapRes!36206 (and tp!68733 e!553283))))

(declare-fun mapRest!36206 () (Array (_ BitVec 32) ValueCell!10911))

(declare-fun mapValue!36206 () ValueCell!10911)

(declare-fun mapKey!36206 () (_ BitVec 32))

(assert (=> mapNonEmpty!36206 (= (arr!29642 _values!1278) (store mapRest!36206 mapKey!36206 mapValue!36206))))

(declare-fun b!981445 () Bool)

(declare-fun res!656760 () Bool)

(assert (=> b!981445 (=> (not res!656760) (not e!553281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61567 (_ BitVec 32)) Bool)

(assert (=> b!981445 (= res!656760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981446 () Bool)

(declare-fun e!553282 () Bool)

(assert (=> b!981446 (= e!553282 (and e!553284 mapRes!36206))))

(declare-fun condMapEmpty!36206 () Bool)

(declare-fun mapDefault!36206 () ValueCell!10911)

(assert (=> b!981446 (= condMapEmpty!36206 (= (arr!29642 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10911)) mapDefault!36206)))))

(declare-fun b!981447 () Bool)

(assert (=> b!981447 (= e!553283 tp_is_empty!22785)))

(declare-fun b!981443 () Bool)

(declare-fun res!656762 () Bool)

(assert (=> b!981443 (=> (not res!656762) (not e!553281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981443 (= res!656762 (validKeyInArray!0 (select (arr!29641 _keys!1544) from!1932)))))

(declare-fun res!656756 () Bool)

(assert (=> start!83982 (=> (not res!656756) (not e!553281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83982 (= res!656756 (validMask!0 mask!1948))))

(assert (=> start!83982 e!553281))

(assert (=> start!83982 true))

(assert (=> start!83982 tp_is_empty!22785))

(declare-fun array_inv!22917 (array!61569) Bool)

(assert (=> start!83982 (and (array_inv!22917 _values!1278) e!553282)))

(assert (=> start!83982 tp!68734))

(declare-fun array_inv!22918 (array!61567) Bool)

(assert (=> start!83982 (array_inv!22918 _keys!1544)))

(declare-fun b!981448 () Bool)

(assert (=> b!981448 (= e!553280 (not true))))

(declare-fun lt!435707 () tuple2!14646)

(declare-fun lt!435708 () tuple2!14646)

(declare-fun +!2988 (ListLongMap!13343 tuple2!14646) ListLongMap!13343)

(assert (=> b!981448 (= (+!2988 (+!2988 lt!435706 lt!435707) lt!435708) (+!2988 (+!2988 lt!435706 lt!435708) lt!435707))))

(assert (=> b!981448 (= lt!435708 (tuple2!14647 (select (arr!29641 _keys!1544) from!1932) lt!435710))))

(assert (=> b!981448 (= lt!435707 (tuple2!14647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32615 0))(
  ( (Unit!32616) )
))
(declare-fun lt!435709 () Unit!32615)

(declare-fun addCommutativeForDiffKeys!616 (ListLongMap!13343 (_ BitVec 64) V!35363 (_ BitVec 64) V!35363) Unit!32615)

(assert (=> b!981448 (= lt!435709 (addCommutativeForDiffKeys!616 lt!435706 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29641 _keys!1544) from!1932) lt!435710))))

(declare-fun b!981449 () Bool)

(declare-fun res!656759 () Bool)

(assert (=> b!981449 (=> (not res!656759) (not e!553281))))

(assert (=> b!981449 (= res!656759 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!83982 res!656756) b!981442))

(assert (= (and b!981442 res!656757) b!981445))

(assert (= (and b!981445 res!656760) b!981444))

(assert (= (and b!981444 res!656761) b!981441))

(assert (= (and b!981441 res!656758) b!981443))

(assert (= (and b!981443 res!656762) b!981449))

(assert (= (and b!981449 res!656759) b!981440))

(assert (= (and b!981440 res!656755) b!981448))

(assert (= (and b!981446 condMapEmpty!36206) mapIsEmpty!36206))

(assert (= (and b!981446 (not condMapEmpty!36206)) mapNonEmpty!36206))

(get-info :version)

(assert (= (and mapNonEmpty!36206 ((_ is ValueCellFull!10911) mapValue!36206)) b!981447))

(assert (= (and b!981446 ((_ is ValueCellFull!10911) mapDefault!36206)) b!981439))

(assert (= start!83982 b!981446))

(declare-fun b_lambda!14775 () Bool)

(assert (=> (not b_lambda!14775) (not b!981440)))

(declare-fun t!29216 () Bool)

(declare-fun tb!6537 () Bool)

(assert (=> (and start!83982 (= defaultEntry!1281 defaultEntry!1281) t!29216) tb!6537))

(declare-fun result!13063 () Bool)

(assert (=> tb!6537 (= result!13063 tp_is_empty!22785)))

(assert (=> b!981440 t!29216))

(declare-fun b_and!31559 () Bool)

(assert (= b_and!31557 (and (=> t!29216 result!13063) b_and!31559)))

(declare-fun m!908807 () Bool)

(assert (=> b!981448 m!908807))

(assert (=> b!981448 m!908807))

(declare-fun m!908809 () Bool)

(assert (=> b!981448 m!908809))

(declare-fun m!908811 () Bool)

(assert (=> b!981448 m!908811))

(declare-fun m!908813 () Bool)

(assert (=> b!981448 m!908813))

(assert (=> b!981448 m!908813))

(declare-fun m!908815 () Bool)

(assert (=> b!981448 m!908815))

(assert (=> b!981448 m!908811))

(declare-fun m!908817 () Bool)

(assert (=> b!981448 m!908817))

(declare-fun m!908819 () Bool)

(assert (=> start!83982 m!908819))

(declare-fun m!908821 () Bool)

(assert (=> start!83982 m!908821))

(declare-fun m!908823 () Bool)

(assert (=> start!83982 m!908823))

(assert (=> b!981440 m!908807))

(declare-fun m!908825 () Bool)

(assert (=> b!981440 m!908825))

(declare-fun m!908827 () Bool)

(assert (=> b!981440 m!908827))

(declare-fun m!908829 () Bool)

(assert (=> b!981440 m!908829))

(assert (=> b!981440 m!908825))

(assert (=> b!981440 m!908829))

(declare-fun m!908831 () Bool)

(assert (=> b!981440 m!908831))

(assert (=> b!981443 m!908807))

(assert (=> b!981443 m!908807))

(declare-fun m!908833 () Bool)

(assert (=> b!981443 m!908833))

(declare-fun m!908835 () Bool)

(assert (=> b!981445 m!908835))

(declare-fun m!908837 () Bool)

(assert (=> mapNonEmpty!36206 m!908837))

(declare-fun m!908839 () Bool)

(assert (=> b!981444 m!908839))

(check-sat (not b!981448) tp_is_empty!22785 (not b_next!19737) (not b!981440) (not mapNonEmpty!36206) (not b!981445) (not b_lambda!14775) (not b!981444) b_and!31559 (not start!83982) (not b!981443))
(check-sat b_and!31559 (not b_next!19737))
