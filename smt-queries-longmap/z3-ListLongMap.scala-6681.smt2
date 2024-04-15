; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84040 () Bool)

(assert start!84040)

(declare-fun b_free!19813 () Bool)

(declare-fun b_next!19813 () Bool)

(assert (=> start!84040 (= b_free!19813 (not b_next!19813))))

(declare-fun tp!68963 () Bool)

(declare-fun b_and!31683 () Bool)

(assert (=> start!84040 (= tp!68963 b_and!31683)))

(declare-fun b!982530 () Bool)

(declare-fun res!657562 () Bool)

(declare-fun e!553819 () Bool)

(assert (=> b!982530 (=> (not res!657562) (not e!553819))))

(declare-datatypes ((array!61646 0))(
  ( (array!61647 (arr!29681 (Array (_ BitVec 32) (_ BitVec 64))) (size!30162 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61646)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61646 (_ BitVec 32)) Bool)

(assert (=> b!982530 (= res!657562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36320 () Bool)

(declare-fun mapRes!36320 () Bool)

(declare-fun tp!68962 () Bool)

(declare-fun e!553820 () Bool)

(assert (=> mapNonEmpty!36320 (= mapRes!36320 (and tp!68962 e!553820))))

(declare-datatypes ((V!35465 0))(
  ( (V!35466 (val!11481 Int)) )
))
(declare-datatypes ((ValueCell!10949 0))(
  ( (ValueCellFull!10949 (v!14042 V!35465)) (EmptyCell!10949) )
))
(declare-datatypes ((array!61648 0))(
  ( (array!61649 (arr!29682 (Array (_ BitVec 32) ValueCell!10949)) (size!30163 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61648)

(declare-fun mapValue!36320 () ValueCell!10949)

(declare-fun mapRest!36320 () (Array (_ BitVec 32) ValueCell!10949))

(declare-fun mapKey!36320 () (_ BitVec 32))

(assert (=> mapNonEmpty!36320 (= (arr!29682 _values!1278) (store mapRest!36320 mapKey!36320 mapValue!36320))))

(declare-fun mapIsEmpty!36320 () Bool)

(assert (=> mapIsEmpty!36320 mapRes!36320))

(declare-fun b!982531 () Bool)

(declare-fun res!657558 () Bool)

(assert (=> b!982531 (=> (not res!657558) (not e!553819))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982531 (= res!657558 (and (= (size!30163 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30162 _keys!1544) (size!30163 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982532 () Bool)

(declare-fun res!657560 () Bool)

(assert (=> b!982532 (=> (not res!657560) (not e!553819))))

(assert (=> b!982532 (= res!657560 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982533 () Bool)

(declare-fun e!553818 () Bool)

(declare-fun e!553815 () Bool)

(assert (=> b!982533 (= e!553818 (and e!553815 mapRes!36320))))

(declare-fun condMapEmpty!36320 () Bool)

(declare-fun mapDefault!36320 () ValueCell!10949)

(assert (=> b!982533 (= condMapEmpty!36320 (= (arr!29682 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10949)) mapDefault!36320)))))

(declare-fun b!982534 () Bool)

(declare-fun res!657561 () Bool)

(assert (=> b!982534 (=> (not res!657561) (not e!553819))))

(declare-datatypes ((List!20620 0))(
  ( (Nil!20617) (Cons!20616 (h!21778 (_ BitVec 64)) (t!29374 List!20620)) )
))
(declare-fun arrayNoDuplicates!0 (array!61646 (_ BitVec 32) List!20620) Bool)

(assert (=> b!982534 (= res!657561 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20617))))

(declare-fun b!982535 () Bool)

(declare-fun res!657563 () Bool)

(assert (=> b!982535 (=> (not res!657563) (not e!553819))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982535 (= res!657563 (validKeyInArray!0 (select (arr!29681 _keys!1544) from!1932)))))

(declare-fun res!657564 () Bool)

(assert (=> start!84040 (=> (not res!657564) (not e!553819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84040 (= res!657564 (validMask!0 mask!1948))))

(assert (=> start!84040 e!553819))

(assert (=> start!84040 true))

(declare-fun tp_is_empty!22861 () Bool)

(assert (=> start!84040 tp_is_empty!22861))

(declare-fun array_inv!22961 (array!61648) Bool)

(assert (=> start!84040 (and (array_inv!22961 _values!1278) e!553818)))

(assert (=> start!84040 tp!68963))

(declare-fun array_inv!22962 (array!61646) Bool)

(assert (=> start!84040 (array_inv!22962 _keys!1544)))

(declare-fun b!982536 () Bool)

(declare-fun e!553816 () Bool)

(assert (=> b!982536 (= e!553819 e!553816)))

(declare-fun res!657557 () Bool)

(assert (=> b!982536 (=> (not res!657557) (not e!553816))))

(assert (=> b!982536 (= res!657557 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29681 _keys!1544) from!1932))))))

(declare-fun lt!436042 () V!35465)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15409 (ValueCell!10949 V!35465) V!35465)

(declare-fun dynLambda!1789 (Int (_ BitVec 64)) V!35465)

(assert (=> b!982536 (= lt!436042 (get!15409 (select (arr!29682 _values!1278) from!1932) (dynLambda!1789 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35465)

(declare-fun zeroValue!1220 () V!35465)

(declare-datatypes ((tuple2!14782 0))(
  ( (tuple2!14783 (_1!7402 (_ BitVec 64)) (_2!7402 V!35465)) )
))
(declare-datatypes ((List!20621 0))(
  ( (Nil!20618) (Cons!20617 (h!21779 tuple2!14782) (t!29375 List!20621)) )
))
(declare-datatypes ((ListLongMap!13469 0))(
  ( (ListLongMap!13470 (toList!6750 List!20621)) )
))
(declare-fun lt!436040 () ListLongMap!13469)

(declare-fun getCurrentListMapNoExtraKeys!3459 (array!61646 array!61648 (_ BitVec 32) (_ BitVec 32) V!35465 V!35465 (_ BitVec 32) Int) ListLongMap!13469)

(assert (=> b!982536 (= lt!436040 (getCurrentListMapNoExtraKeys!3459 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982537 () Bool)

(assert (=> b!982537 (= e!553820 tp_is_empty!22861)))

(declare-fun b!982538 () Bool)

(declare-fun res!657559 () Bool)

(assert (=> b!982538 (=> (not res!657559) (not e!553819))))

(assert (=> b!982538 (= res!657559 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30162 _keys!1544))))))

(declare-fun b!982539 () Bool)

(assert (=> b!982539 (= e!553816 (not true))))

(declare-fun lt!436043 () tuple2!14782)

(declare-fun lt!436044 () tuple2!14782)

(declare-fun +!3040 (ListLongMap!13469 tuple2!14782) ListLongMap!13469)

(assert (=> b!982539 (= (+!3040 (+!3040 lt!436040 lt!436043) lt!436044) (+!3040 (+!3040 lt!436040 lt!436044) lt!436043))))

(assert (=> b!982539 (= lt!436044 (tuple2!14783 (select (arr!29681 _keys!1544) from!1932) lt!436042))))

(assert (=> b!982539 (= lt!436043 (tuple2!14783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32546 0))(
  ( (Unit!32547) )
))
(declare-fun lt!436041 () Unit!32546)

(declare-fun addCommutativeForDiffKeys!644 (ListLongMap!13469 (_ BitVec 64) V!35465 (_ BitVec 64) V!35465) Unit!32546)

(assert (=> b!982539 (= lt!436041 (addCommutativeForDiffKeys!644 lt!436040 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29681 _keys!1544) from!1932) lt!436042))))

(declare-fun b!982540 () Bool)

(assert (=> b!982540 (= e!553815 tp_is_empty!22861)))

(assert (= (and start!84040 res!657564) b!982531))

(assert (= (and b!982531 res!657558) b!982530))

(assert (= (and b!982530 res!657562) b!982534))

(assert (= (and b!982534 res!657561) b!982538))

(assert (= (and b!982538 res!657559) b!982535))

(assert (= (and b!982535 res!657563) b!982532))

(assert (= (and b!982532 res!657560) b!982536))

(assert (= (and b!982536 res!657557) b!982539))

(assert (= (and b!982533 condMapEmpty!36320) mapIsEmpty!36320))

(assert (= (and b!982533 (not condMapEmpty!36320)) mapNonEmpty!36320))

(get-info :version)

(assert (= (and mapNonEmpty!36320 ((_ is ValueCellFull!10949) mapValue!36320)) b!982537))

(assert (= (and b!982533 ((_ is ValueCellFull!10949) mapDefault!36320)) b!982540))

(assert (= start!84040 b!982533))

(declare-fun b_lambda!14833 () Bool)

(assert (=> (not b_lambda!14833) (not b!982536)))

(declare-fun t!29373 () Bool)

(declare-fun tb!6605 () Bool)

(assert (=> (and start!84040 (= defaultEntry!1281 defaultEntry!1281) t!29373) tb!6605))

(declare-fun result!13207 () Bool)

(assert (=> tb!6605 (= result!13207 tp_is_empty!22861)))

(assert (=> b!982536 t!29373))

(declare-fun b_and!31685 () Bool)

(assert (= b_and!31683 (and (=> t!29373 result!13207) b_and!31685)))

(declare-fun m!909341 () Bool)

(assert (=> b!982536 m!909341))

(declare-fun m!909343 () Bool)

(assert (=> b!982536 m!909343))

(declare-fun m!909345 () Bool)

(assert (=> b!982536 m!909345))

(declare-fun m!909347 () Bool)

(assert (=> b!982536 m!909347))

(assert (=> b!982536 m!909343))

(assert (=> b!982536 m!909347))

(declare-fun m!909349 () Bool)

(assert (=> b!982536 m!909349))

(declare-fun m!909351 () Bool)

(assert (=> start!84040 m!909351))

(declare-fun m!909353 () Bool)

(assert (=> start!84040 m!909353))

(declare-fun m!909355 () Bool)

(assert (=> start!84040 m!909355))

(declare-fun m!909357 () Bool)

(assert (=> mapNonEmpty!36320 m!909357))

(declare-fun m!909359 () Bool)

(assert (=> b!982534 m!909359))

(declare-fun m!909361 () Bool)

(assert (=> b!982530 m!909361))

(assert (=> b!982535 m!909341))

(assert (=> b!982535 m!909341))

(declare-fun m!909363 () Bool)

(assert (=> b!982535 m!909363))

(assert (=> b!982539 m!909341))

(assert (=> b!982539 m!909341))

(declare-fun m!909365 () Bool)

(assert (=> b!982539 m!909365))

(declare-fun m!909367 () Bool)

(assert (=> b!982539 m!909367))

(declare-fun m!909369 () Bool)

(assert (=> b!982539 m!909369))

(declare-fun m!909371 () Bool)

(assert (=> b!982539 m!909371))

(assert (=> b!982539 m!909371))

(declare-fun m!909373 () Bool)

(assert (=> b!982539 m!909373))

(assert (=> b!982539 m!909367))

(check-sat (not b!982530) (not b!982535) (not start!84040) (not b_lambda!14833) tp_is_empty!22861 b_and!31685 (not mapNonEmpty!36320) (not b!982539) (not b!982536) (not b_next!19813) (not b!982534))
(check-sat b_and!31685 (not b_next!19813))
