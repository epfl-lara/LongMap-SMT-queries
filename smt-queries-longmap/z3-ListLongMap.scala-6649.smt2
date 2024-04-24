; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84034 () Bool)

(assert start!84034)

(declare-fun b_free!19675 () Bool)

(declare-fun b_next!19675 () Bool)

(assert (=> start!84034 (= b_free!19675 (not b_next!19675))))

(declare-fun tp!68467 () Bool)

(declare-fun b_and!31449 () Bool)

(assert (=> start!84034 (= tp!68467 b_and!31449)))

(declare-fun b!980760 () Bool)

(declare-fun res!656095 () Bool)

(declare-fun e!552909 () Bool)

(assert (=> b!980760 (=> (not res!656095) (not e!552909))))

(declare-datatypes ((array!61382 0))(
  ( (array!61383 (arr!29544 (Array (_ BitVec 32) (_ BitVec 64))) (size!30024 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61382)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980760 (= res!656095 (validKeyInArray!0 (select (arr!29544 _keys!1544) from!1932)))))

(declare-fun b!980761 () Bool)

(declare-fun e!552908 () Bool)

(declare-fun e!552907 () Bool)

(declare-fun mapRes!36032 () Bool)

(assert (=> b!980761 (= e!552908 (and e!552907 mapRes!36032))))

(declare-fun condMapEmpty!36032 () Bool)

(declare-datatypes ((V!35209 0))(
  ( (V!35210 (val!11385 Int)) )
))
(declare-datatypes ((ValueCell!10853 0))(
  ( (ValueCellFull!10853 (v!13944 V!35209)) (EmptyCell!10853) )
))
(declare-datatypes ((array!61384 0))(
  ( (array!61385 (arr!29545 (Array (_ BitVec 32) ValueCell!10853)) (size!30025 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61384)

(declare-fun mapDefault!36032 () ValueCell!10853)

(assert (=> b!980761 (= condMapEmpty!36032 (= (arr!29545 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10853)) mapDefault!36032)))))

(declare-fun b!980762 () Bool)

(declare-fun res!656098 () Bool)

(assert (=> b!980762 (=> (not res!656098) (not e!552909))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980762 (= res!656098 (and (= (size!30025 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30024 _keys!1544) (size!30025 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980763 () Bool)

(declare-fun e!552912 () Bool)

(declare-fun tp_is_empty!22669 () Bool)

(assert (=> b!980763 (= e!552912 tp_is_empty!22669)))

(declare-fun b!980764 () Bool)

(declare-fun res!656096 () Bool)

(assert (=> b!980764 (=> (not res!656096) (not e!552909))))

(assert (=> b!980764 (= res!656096 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980765 () Bool)

(declare-fun e!552911 () Bool)

(assert (=> b!980765 (= e!552909 (not e!552911))))

(declare-fun res!656099 () Bool)

(assert (=> b!980765 (=> res!656099 e!552911)))

(assert (=> b!980765 (= res!656099 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29544 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14616 0))(
  ( (tuple2!14617 (_1!7319 (_ BitVec 64)) (_2!7319 V!35209)) )
))
(declare-fun lt!435174 () tuple2!14616)

(declare-datatypes ((List!20475 0))(
  ( (Nil!20472) (Cons!20471 (h!21639 tuple2!14616) (t!29098 List!20475)) )
))
(declare-datatypes ((ListLongMap!13315 0))(
  ( (ListLongMap!13316 (toList!6673 List!20475)) )
))
(declare-fun lt!435173 () ListLongMap!13315)

(declare-fun lt!435176 () tuple2!14616)

(declare-fun lt!435171 () ListLongMap!13315)

(declare-fun +!2988 (ListLongMap!13315 tuple2!14616) ListLongMap!13315)

(assert (=> b!980765 (= (+!2988 lt!435171 lt!435174) (+!2988 lt!435173 lt!435176))))

(declare-fun lt!435178 () ListLongMap!13315)

(assert (=> b!980765 (= lt!435173 (+!2988 lt!435178 lt!435174))))

(declare-fun lt!435179 () V!35209)

(assert (=> b!980765 (= lt!435174 (tuple2!14617 (select (arr!29544 _keys!1544) from!1932) lt!435179))))

(assert (=> b!980765 (= lt!435171 (+!2988 lt!435178 lt!435176))))

(declare-fun minValue!1220 () V!35209)

(assert (=> b!980765 (= lt!435176 (tuple2!14617 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32556 0))(
  ( (Unit!32557) )
))
(declare-fun lt!435175 () Unit!32556)

(declare-fun addCommutativeForDiffKeys!595 (ListLongMap!13315 (_ BitVec 64) V!35209 (_ BitVec 64) V!35209) Unit!32556)

(assert (=> b!980765 (= lt!435175 (addCommutativeForDiffKeys!595 lt!435178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29544 _keys!1544) from!1932) lt!435179))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15338 (ValueCell!10853 V!35209) V!35209)

(declare-fun dynLambda!1783 (Int (_ BitVec 64)) V!35209)

(assert (=> b!980765 (= lt!435179 (get!15338 (select (arr!29545 _values!1278) from!1932) (dynLambda!1783 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435180 () ListLongMap!13315)

(declare-fun lt!435172 () tuple2!14616)

(assert (=> b!980765 (= lt!435178 (+!2988 lt!435180 lt!435172))))

(declare-fun zeroValue!1220 () V!35209)

(assert (=> b!980765 (= lt!435172 (tuple2!14617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3421 (array!61382 array!61384 (_ BitVec 32) (_ BitVec 32) V!35209 V!35209 (_ BitVec 32) Int) ListLongMap!13315)

(assert (=> b!980765 (= lt!435180 (getCurrentListMapNoExtraKeys!3421 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980766 () Bool)

(declare-fun res!656097 () Bool)

(assert (=> b!980766 (=> (not res!656097) (not e!552909))))

(assert (=> b!980766 (= res!656097 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30024 _keys!1544))))))

(declare-fun b!980767 () Bool)

(assert (=> b!980767 (= e!552911 true)))

(assert (=> b!980767 (= lt!435173 (+!2988 (+!2988 lt!435180 lt!435174) lt!435172))))

(declare-fun lt!435177 () Unit!32556)

(assert (=> b!980767 (= lt!435177 (addCommutativeForDiffKeys!595 lt!435180 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29544 _keys!1544) from!1932) lt!435179))))

(declare-fun b!980759 () Bool)

(declare-fun res!656101 () Bool)

(assert (=> b!980759 (=> (not res!656101) (not e!552909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61382 (_ BitVec 32)) Bool)

(assert (=> b!980759 (= res!656101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656094 () Bool)

(assert (=> start!84034 (=> (not res!656094) (not e!552909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84034 (= res!656094 (validMask!0 mask!1948))))

(assert (=> start!84034 e!552909))

(assert (=> start!84034 true))

(assert (=> start!84034 tp_is_empty!22669))

(declare-fun array_inv!22877 (array!61384) Bool)

(assert (=> start!84034 (and (array_inv!22877 _values!1278) e!552908)))

(assert (=> start!84034 tp!68467))

(declare-fun array_inv!22878 (array!61382) Bool)

(assert (=> start!84034 (array_inv!22878 _keys!1544)))

(declare-fun b!980768 () Bool)

(declare-fun res!656100 () Bool)

(assert (=> b!980768 (=> (not res!656100) (not e!552909))))

(declare-datatypes ((List!20476 0))(
  ( (Nil!20473) (Cons!20472 (h!21640 (_ BitVec 64)) (t!29099 List!20476)) )
))
(declare-fun arrayNoDuplicates!0 (array!61382 (_ BitVec 32) List!20476) Bool)

(assert (=> b!980768 (= res!656100 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20473))))

(declare-fun b!980769 () Bool)

(assert (=> b!980769 (= e!552907 tp_is_empty!22669)))

(declare-fun mapIsEmpty!36032 () Bool)

(assert (=> mapIsEmpty!36032 mapRes!36032))

(declare-fun mapNonEmpty!36032 () Bool)

(declare-fun tp!68468 () Bool)

(assert (=> mapNonEmpty!36032 (= mapRes!36032 (and tp!68468 e!552912))))

(declare-fun mapKey!36032 () (_ BitVec 32))

(declare-fun mapRest!36032 () (Array (_ BitVec 32) ValueCell!10853))

(declare-fun mapValue!36032 () ValueCell!10853)

(assert (=> mapNonEmpty!36032 (= (arr!29545 _values!1278) (store mapRest!36032 mapKey!36032 mapValue!36032))))

(assert (= (and start!84034 res!656094) b!980762))

(assert (= (and b!980762 res!656098) b!980759))

(assert (= (and b!980759 res!656101) b!980768))

(assert (= (and b!980768 res!656100) b!980766))

(assert (= (and b!980766 res!656097) b!980760))

(assert (= (and b!980760 res!656095) b!980764))

(assert (= (and b!980764 res!656096) b!980765))

(assert (= (and b!980765 (not res!656099)) b!980767))

(assert (= (and b!980761 condMapEmpty!36032) mapIsEmpty!36032))

(assert (= (and b!980761 (not condMapEmpty!36032)) mapNonEmpty!36032))

(get-info :version)

(assert (= (and mapNonEmpty!36032 ((_ is ValueCellFull!10853) mapValue!36032)) b!980763))

(assert (= (and b!980761 ((_ is ValueCellFull!10853) mapDefault!36032)) b!980769))

(assert (= start!84034 b!980761))

(declare-fun b_lambda!14733 () Bool)

(assert (=> (not b_lambda!14733) (not b!980765)))

(declare-fun t!29097 () Bool)

(declare-fun tb!6473 () Bool)

(assert (=> (and start!84034 (= defaultEntry!1281 defaultEntry!1281) t!29097) tb!6473))

(declare-fun result!12943 () Bool)

(assert (=> tb!6473 (= result!12943 tp_is_empty!22669)))

(assert (=> b!980765 t!29097))

(declare-fun b_and!31451 () Bool)

(assert (= b_and!31449 (and (=> t!29097 result!12943) b_and!31451)))

(declare-fun m!908543 () Bool)

(assert (=> b!980759 m!908543))

(declare-fun m!908545 () Bool)

(assert (=> b!980767 m!908545))

(assert (=> b!980767 m!908545))

(declare-fun m!908547 () Bool)

(assert (=> b!980767 m!908547))

(declare-fun m!908549 () Bool)

(assert (=> b!980767 m!908549))

(assert (=> b!980767 m!908549))

(declare-fun m!908551 () Bool)

(assert (=> b!980767 m!908551))

(declare-fun m!908553 () Bool)

(assert (=> b!980768 m!908553))

(declare-fun m!908555 () Bool)

(assert (=> start!84034 m!908555))

(declare-fun m!908557 () Bool)

(assert (=> start!84034 m!908557))

(declare-fun m!908559 () Bool)

(assert (=> start!84034 m!908559))

(declare-fun m!908561 () Bool)

(assert (=> b!980765 m!908561))

(assert (=> b!980765 m!908549))

(declare-fun m!908563 () Bool)

(assert (=> b!980765 m!908563))

(declare-fun m!908565 () Bool)

(assert (=> b!980765 m!908565))

(declare-fun m!908567 () Bool)

(assert (=> b!980765 m!908567))

(declare-fun m!908569 () Bool)

(assert (=> b!980765 m!908569))

(declare-fun m!908571 () Bool)

(assert (=> b!980765 m!908571))

(assert (=> b!980765 m!908549))

(declare-fun m!908573 () Bool)

(assert (=> b!980765 m!908573))

(declare-fun m!908575 () Bool)

(assert (=> b!980765 m!908575))

(declare-fun m!908577 () Bool)

(assert (=> b!980765 m!908577))

(assert (=> b!980765 m!908563))

(assert (=> b!980765 m!908577))

(declare-fun m!908579 () Bool)

(assert (=> b!980765 m!908579))

(declare-fun m!908581 () Bool)

(assert (=> mapNonEmpty!36032 m!908581))

(assert (=> b!980760 m!908549))

(assert (=> b!980760 m!908549))

(declare-fun m!908583 () Bool)

(assert (=> b!980760 m!908583))

(check-sat (not b_next!19675) (not start!84034) (not b_lambda!14733) (not b!980760) (not b!980768) (not mapNonEmpty!36032) (not b!980767) (not b!980765) tp_is_empty!22669 b_and!31451 (not b!980759))
(check-sat b_and!31451 (not b_next!19675))
