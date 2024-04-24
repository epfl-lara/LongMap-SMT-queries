; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109946 () Bool)

(assert start!109946)

(declare-fun b_free!29155 () Bool)

(declare-fun b_next!29155 () Bool)

(assert (=> start!109946 (= b_free!29155 (not b_next!29155))))

(declare-fun tp!102592 () Bool)

(declare-fun b_and!47259 () Bool)

(assert (=> start!109946 (= tp!102592 b_and!47259)))

(declare-fun mapNonEmpty!53762 () Bool)

(declare-fun mapRes!53762 () Bool)

(declare-fun tp!102593 () Bool)

(declare-fun e!742266 () Bool)

(assert (=> mapNonEmpty!53762 (= mapRes!53762 (and tp!102593 e!742266))))

(declare-datatypes ((V!51497 0))(
  ( (V!51498 (val!17472 Int)) )
))
(declare-datatypes ((ValueCell!16499 0))(
  ( (ValueCellFull!16499 (v!20073 V!51497)) (EmptyCell!16499) )
))
(declare-fun mapValue!53762 () ValueCell!16499)

(declare-fun mapKey!53762 () (_ BitVec 32))

(declare-fun mapRest!53762 () (Array (_ BitVec 32) ValueCell!16499))

(declare-datatypes ((array!86639 0))(
  ( (array!86640 (arr!41813 (Array (_ BitVec 32) ValueCell!16499)) (size!42364 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86639)

(assert (=> mapNonEmpty!53762 (= (arr!41813 _values!1445) (store mapRest!53762 mapKey!53762 mapValue!53762))))

(declare-fun b!1300941 () Bool)

(declare-fun res!864178 () Bool)

(declare-fun e!742264 () Bool)

(assert (=> b!1300941 (=> (not res!864178) (not e!742264))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300941 (= res!864178 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300942 () Bool)

(declare-fun res!864179 () Bool)

(assert (=> b!1300942 (=> (not res!864179) (not e!742264))))

(declare-fun minValue!1387 () V!51497)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86641 0))(
  ( (array!86642 (arr!41814 (Array (_ BitVec 32) (_ BitVec 64))) (size!42365 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86641)

(declare-fun zeroValue!1387 () V!51497)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22546 0))(
  ( (tuple2!22547 (_1!11284 (_ BitVec 64)) (_2!11284 V!51497)) )
))
(declare-datatypes ((List!29705 0))(
  ( (Nil!29702) (Cons!29701 (h!30919 tuple2!22546) (t!43267 List!29705)) )
))
(declare-datatypes ((ListLongMap!20211 0))(
  ( (ListLongMap!20212 (toList!10121 List!29705)) )
))
(declare-fun contains!8255 (ListLongMap!20211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5140 (array!86641 array!86639 (_ BitVec 32) (_ BitVec 32) V!51497 V!51497 (_ BitVec 32) Int) ListLongMap!20211)

(assert (=> b!1300942 (= res!864179 (contains!8255 (getCurrentListMap!5140 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300943 () Bool)

(declare-fun res!864182 () Bool)

(assert (=> b!1300943 (=> (not res!864182) (not e!742264))))

(assert (=> b!1300943 (= res!864182 (and (= (size!42364 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42365 _keys!1741) (size!42364 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300944 () Bool)

(declare-fun res!864184 () Bool)

(assert (=> b!1300944 (=> (not res!864184) (not e!742264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86641 (_ BitVec 32)) Bool)

(assert (=> b!1300944 (= res!864184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53762 () Bool)

(assert (=> mapIsEmpty!53762 mapRes!53762))

(declare-fun b!1300945 () Bool)

(assert (=> b!1300945 (= e!742264 (not true))))

(declare-fun lt!581589 () ListLongMap!20211)

(assert (=> b!1300945 (contains!8255 lt!581589 k0!1205)))

(declare-datatypes ((Unit!42988 0))(
  ( (Unit!42989) )
))
(declare-fun lt!581590 () Unit!42988)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!74 ((_ BitVec 64) (_ BitVec 64) V!51497 ListLongMap!20211) Unit!42988)

(assert (=> b!1300945 (= lt!581590 (lemmaInListMapAfterAddingDiffThenInBefore!74 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581589))))

(declare-fun +!4494 (ListLongMap!20211 tuple2!22546) ListLongMap!20211)

(declare-fun getCurrentListMapNoExtraKeys!6134 (array!86641 array!86639 (_ BitVec 32) (_ BitVec 32) V!51497 V!51497 (_ BitVec 32) Int) ListLongMap!20211)

(assert (=> b!1300945 (= lt!581589 (+!4494 (getCurrentListMapNoExtraKeys!6134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1300946 () Bool)

(declare-fun res!864177 () Bool)

(assert (=> b!1300946 (=> (not res!864177) (not e!742264))))

(assert (=> b!1300946 (= res!864177 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42365 _keys!1741))))))

(declare-fun b!1300947 () Bool)

(declare-fun res!864183 () Bool)

(assert (=> b!1300947 (=> (not res!864183) (not e!742264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300947 (= res!864183 (validKeyInArray!0 (select (arr!41814 _keys!1741) from!2144)))))

(declare-fun b!1300948 () Bool)

(declare-fun res!864180 () Bool)

(assert (=> b!1300948 (=> (not res!864180) (not e!742264))))

(declare-datatypes ((List!29706 0))(
  ( (Nil!29703) (Cons!29702 (h!30920 (_ BitVec 64)) (t!43268 List!29706)) )
))
(declare-fun arrayNoDuplicates!0 (array!86641 (_ BitVec 32) List!29706) Bool)

(assert (=> b!1300948 (= res!864180 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29703))))

(declare-fun b!1300949 () Bool)

(declare-fun e!742268 () Bool)

(declare-fun tp_is_empty!34795 () Bool)

(assert (=> b!1300949 (= e!742268 tp_is_empty!34795)))

(declare-fun b!1300950 () Bool)

(declare-fun e!742267 () Bool)

(assert (=> b!1300950 (= e!742267 (and e!742268 mapRes!53762))))

(declare-fun condMapEmpty!53762 () Bool)

(declare-fun mapDefault!53762 () ValueCell!16499)

(assert (=> b!1300950 (= condMapEmpty!53762 (= (arr!41813 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16499)) mapDefault!53762)))))

(declare-fun res!864181 () Bool)

(assert (=> start!109946 (=> (not res!864181) (not e!742264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109946 (= res!864181 (validMask!0 mask!2175))))

(assert (=> start!109946 e!742264))

(assert (=> start!109946 tp_is_empty!34795))

(assert (=> start!109946 true))

(declare-fun array_inv!31881 (array!86639) Bool)

(assert (=> start!109946 (and (array_inv!31881 _values!1445) e!742267)))

(declare-fun array_inv!31882 (array!86641) Bool)

(assert (=> start!109946 (array_inv!31882 _keys!1741)))

(assert (=> start!109946 tp!102592))

(declare-fun b!1300951 () Bool)

(assert (=> b!1300951 (= e!742266 tp_is_empty!34795)))

(declare-fun b!1300952 () Bool)

(declare-fun res!864176 () Bool)

(assert (=> b!1300952 (=> (not res!864176) (not e!742264))))

(assert (=> b!1300952 (= res!864176 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42365 _keys!1741))))))

(assert (= (and start!109946 res!864181) b!1300943))

(assert (= (and b!1300943 res!864182) b!1300944))

(assert (= (and b!1300944 res!864184) b!1300948))

(assert (= (and b!1300948 res!864180) b!1300952))

(assert (= (and b!1300952 res!864176) b!1300942))

(assert (= (and b!1300942 res!864179) b!1300946))

(assert (= (and b!1300946 res!864177) b!1300947))

(assert (= (and b!1300947 res!864183) b!1300941))

(assert (= (and b!1300941 res!864178) b!1300945))

(assert (= (and b!1300950 condMapEmpty!53762) mapIsEmpty!53762))

(assert (= (and b!1300950 (not condMapEmpty!53762)) mapNonEmpty!53762))

(get-info :version)

(assert (= (and mapNonEmpty!53762 ((_ is ValueCellFull!16499) mapValue!53762)) b!1300951))

(assert (= (and b!1300950 ((_ is ValueCellFull!16499) mapDefault!53762)) b!1300949))

(assert (= start!109946 b!1300950))

(declare-fun m!1192383 () Bool)

(assert (=> mapNonEmpty!53762 m!1192383))

(declare-fun m!1192385 () Bool)

(assert (=> b!1300947 m!1192385))

(assert (=> b!1300947 m!1192385))

(declare-fun m!1192387 () Bool)

(assert (=> b!1300947 m!1192387))

(declare-fun m!1192389 () Bool)

(assert (=> b!1300945 m!1192389))

(declare-fun m!1192391 () Bool)

(assert (=> b!1300945 m!1192391))

(declare-fun m!1192393 () Bool)

(assert (=> b!1300945 m!1192393))

(assert (=> b!1300945 m!1192393))

(declare-fun m!1192395 () Bool)

(assert (=> b!1300945 m!1192395))

(declare-fun m!1192397 () Bool)

(assert (=> b!1300944 m!1192397))

(declare-fun m!1192399 () Bool)

(assert (=> b!1300942 m!1192399))

(assert (=> b!1300942 m!1192399))

(declare-fun m!1192401 () Bool)

(assert (=> b!1300942 m!1192401))

(declare-fun m!1192403 () Bool)

(assert (=> b!1300948 m!1192403))

(declare-fun m!1192405 () Bool)

(assert (=> start!109946 m!1192405))

(declare-fun m!1192407 () Bool)

(assert (=> start!109946 m!1192407))

(declare-fun m!1192409 () Bool)

(assert (=> start!109946 m!1192409))

(check-sat (not mapNonEmpty!53762) (not b!1300945) (not b!1300942) tp_is_empty!34795 (not b_next!29155) (not b!1300944) (not b!1300948) (not start!109946) b_and!47259 (not b!1300947))
(check-sat b_and!47259 (not b_next!29155))
