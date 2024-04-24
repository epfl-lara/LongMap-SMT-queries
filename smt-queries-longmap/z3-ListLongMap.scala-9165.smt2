; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110288 () Bool)

(assert start!110288)

(declare-fun b_free!29263 () Bool)

(declare-fun b_next!29263 () Bool)

(assert (=> start!110288 (= b_free!29263 (not b_next!29263))))

(declare-fun tp!102939 () Bool)

(declare-fun b_and!47429 () Bool)

(assert (=> start!110288 (= tp!102939 b_and!47429)))

(declare-fun b!1304777 () Bool)

(declare-fun res!866273 () Bool)

(declare-fun e!744334 () Bool)

(assert (=> b!1304777 (=> (not res!866273) (not e!744334))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86859 0))(
  ( (array!86860 (arr!41916 (Array (_ BitVec 32) (_ BitVec 64))) (size!42467 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86859)

(assert (=> b!1304777 (= res!866273 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42467 _keys!1741))))))

(declare-fun mapIsEmpty!53947 () Bool)

(declare-fun mapRes!53947 () Bool)

(assert (=> mapIsEmpty!53947 mapRes!53947))

(declare-fun b!1304778 () Bool)

(declare-fun e!744337 () Bool)

(assert (=> b!1304778 (= e!744337 true)))

(assert (=> b!1304778 false))

(declare-datatypes ((V!51641 0))(
  ( (V!51642 (val!17526 Int)) )
))
(declare-fun minValue!1387 () V!51641)

(declare-datatypes ((Unit!43128 0))(
  ( (Unit!43129) )
))
(declare-fun lt!583784 () Unit!43128)

(declare-datatypes ((tuple2!22638 0))(
  ( (tuple2!22639 (_1!11330 (_ BitVec 64)) (_2!11330 V!51641)) )
))
(declare-datatypes ((List!29785 0))(
  ( (Nil!29782) (Cons!29781 (h!30999 tuple2!22638) (t!43371 List!29785)) )
))
(declare-datatypes ((ListLongMap!20303 0))(
  ( (ListLongMap!20304 (toList!10167 List!29785)) )
))
(declare-fun lt!583787 () ListLongMap!20303)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!96 ((_ BitVec 64) (_ BitVec 64) V!51641 ListLongMap!20303) Unit!43128)

(assert (=> b!1304778 (= lt!583784 (lemmaInListMapAfterAddingDiffThenInBefore!96 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!583787))))

(declare-fun lt!583782 () ListLongMap!20303)

(declare-fun contains!8315 (ListLongMap!20303 (_ BitVec 64)) Bool)

(declare-fun +!4527 (ListLongMap!20303 tuple2!22638) ListLongMap!20303)

(assert (=> b!1304778 (not (contains!8315 (+!4527 lt!583782 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583783 () Unit!43128)

(declare-fun addStillNotContains!478 (ListLongMap!20303 (_ BitVec 64) V!51641 (_ BitVec 64)) Unit!43128)

(assert (=> b!1304778 (= lt!583783 (addStillNotContains!478 lt!583782 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1304778 (not (contains!8315 lt!583787 k0!1205))))

(declare-fun zeroValue!1387 () V!51641)

(assert (=> b!1304778 (= lt!583787 (+!4527 lt!583782 (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583786 () Unit!43128)

(assert (=> b!1304778 (= lt!583786 (addStillNotContains!478 lt!583782 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16553 0))(
  ( (ValueCellFull!16553 (v!20137 V!51641)) (EmptyCell!16553) )
))
(declare-datatypes ((array!86861 0))(
  ( (array!86862 (arr!41917 (Array (_ BitVec 32) ValueCell!16553)) (size!42468 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86861)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6165 (array!86859 array!86861 (_ BitVec 32) (_ BitVec 32) V!51641 V!51641 (_ BitVec 32) Int) ListLongMap!20303)

(assert (=> b!1304778 (= lt!583782 (getCurrentListMapNoExtraKeys!6165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304779 () Bool)

(declare-fun res!866271 () Bool)

(assert (=> b!1304779 (=> (not res!866271) (not e!744334))))

(assert (=> b!1304779 (= res!866271 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42467 _keys!1741))))))

(declare-fun b!1304780 () Bool)

(declare-fun e!744336 () Bool)

(declare-fun tp_is_empty!34903 () Bool)

(assert (=> b!1304780 (= e!744336 tp_is_empty!34903)))

(declare-fun b!1304781 () Bool)

(declare-fun e!744332 () Bool)

(assert (=> b!1304781 (= e!744332 (and e!744336 mapRes!53947))))

(declare-fun condMapEmpty!53947 () Bool)

(declare-fun mapDefault!53947 () ValueCell!16553)

(assert (=> b!1304781 (= condMapEmpty!53947 (= (arr!41917 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16553)) mapDefault!53947)))))

(declare-fun b!1304782 () Bool)

(declare-fun res!866270 () Bool)

(assert (=> b!1304782 (=> (not res!866270) (not e!744334))))

(declare-fun getCurrentListMap!5178 (array!86859 array!86861 (_ BitVec 32) (_ BitVec 32) V!51641 V!51641 (_ BitVec 32) Int) ListLongMap!20303)

(assert (=> b!1304782 (= res!866270 (contains!8315 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304783 () Bool)

(declare-fun res!866269 () Bool)

(assert (=> b!1304783 (=> (not res!866269) (not e!744334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304783 (= res!866269 (not (validKeyInArray!0 (select (arr!41916 _keys!1741) from!2144))))))

(declare-fun b!1304784 () Bool)

(declare-fun res!866272 () Bool)

(assert (=> b!1304784 (=> (not res!866272) (not e!744334))))

(declare-datatypes ((List!29786 0))(
  ( (Nil!29783) (Cons!29782 (h!31000 (_ BitVec 64)) (t!43372 List!29786)) )
))
(declare-fun arrayNoDuplicates!0 (array!86859 (_ BitVec 32) List!29786) Bool)

(assert (=> b!1304784 (= res!866272 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29783))))

(declare-fun b!1304785 () Bool)

(declare-fun res!866268 () Bool)

(assert (=> b!1304785 (=> (not res!866268) (not e!744334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86859 (_ BitVec 32)) Bool)

(assert (=> b!1304785 (= res!866268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!866265 () Bool)

(assert (=> start!110288 (=> (not res!866265) (not e!744334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110288 (= res!866265 (validMask!0 mask!2175))))

(assert (=> start!110288 e!744334))

(assert (=> start!110288 tp_is_empty!34903))

(assert (=> start!110288 true))

(declare-fun array_inv!31951 (array!86861) Bool)

(assert (=> start!110288 (and (array_inv!31951 _values!1445) e!744332)))

(declare-fun array_inv!31952 (array!86859) Bool)

(assert (=> start!110288 (array_inv!31952 _keys!1741)))

(assert (=> start!110288 tp!102939))

(declare-fun b!1304786 () Bool)

(assert (=> b!1304786 (= e!744334 (not e!744337))))

(declare-fun res!866267 () Bool)

(assert (=> b!1304786 (=> res!866267 e!744337)))

(assert (=> b!1304786 (= res!866267 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304786 (not (contains!8315 (ListLongMap!20304 Nil!29782) k0!1205))))

(declare-fun lt!583785 () Unit!43128)

(declare-fun emptyContainsNothing!220 ((_ BitVec 64)) Unit!43128)

(assert (=> b!1304786 (= lt!583785 (emptyContainsNothing!220 k0!1205))))

(declare-fun mapNonEmpty!53947 () Bool)

(declare-fun tp!102940 () Bool)

(declare-fun e!744335 () Bool)

(assert (=> mapNonEmpty!53947 (= mapRes!53947 (and tp!102940 e!744335))))

(declare-fun mapValue!53947 () ValueCell!16553)

(declare-fun mapKey!53947 () (_ BitVec 32))

(declare-fun mapRest!53947 () (Array (_ BitVec 32) ValueCell!16553))

(assert (=> mapNonEmpty!53947 (= (arr!41917 _values!1445) (store mapRest!53947 mapKey!53947 mapValue!53947))))

(declare-fun b!1304787 () Bool)

(declare-fun res!866266 () Bool)

(assert (=> b!1304787 (=> (not res!866266) (not e!744334))))

(assert (=> b!1304787 (= res!866266 (and (= (size!42468 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42467 _keys!1741) (size!42468 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304788 () Bool)

(assert (=> b!1304788 (= e!744335 tp_is_empty!34903)))

(assert (= (and start!110288 res!866265) b!1304787))

(assert (= (and b!1304787 res!866266) b!1304785))

(assert (= (and b!1304785 res!866268) b!1304784))

(assert (= (and b!1304784 res!866272) b!1304777))

(assert (= (and b!1304777 res!866273) b!1304782))

(assert (= (and b!1304782 res!866270) b!1304779))

(assert (= (and b!1304779 res!866271) b!1304783))

(assert (= (and b!1304783 res!866269) b!1304786))

(assert (= (and b!1304786 (not res!866267)) b!1304778))

(assert (= (and b!1304781 condMapEmpty!53947) mapIsEmpty!53947))

(assert (= (and b!1304781 (not condMapEmpty!53947)) mapNonEmpty!53947))

(get-info :version)

(assert (= (and mapNonEmpty!53947 ((_ is ValueCellFull!16553) mapValue!53947)) b!1304788))

(assert (= (and b!1304781 ((_ is ValueCellFull!16553) mapDefault!53947)) b!1304780))

(assert (= start!110288 b!1304781))

(declare-fun m!1195989 () Bool)

(assert (=> b!1304786 m!1195989))

(declare-fun m!1195991 () Bool)

(assert (=> b!1304786 m!1195991))

(declare-fun m!1195993 () Bool)

(assert (=> b!1304785 m!1195993))

(declare-fun m!1195995 () Bool)

(assert (=> b!1304783 m!1195995))

(assert (=> b!1304783 m!1195995))

(declare-fun m!1195997 () Bool)

(assert (=> b!1304783 m!1195997))

(declare-fun m!1195999 () Bool)

(assert (=> b!1304784 m!1195999))

(declare-fun m!1196001 () Bool)

(assert (=> start!110288 m!1196001))

(declare-fun m!1196003 () Bool)

(assert (=> start!110288 m!1196003))

(declare-fun m!1196005 () Bool)

(assert (=> start!110288 m!1196005))

(declare-fun m!1196007 () Bool)

(assert (=> mapNonEmpty!53947 m!1196007))

(declare-fun m!1196009 () Bool)

(assert (=> b!1304778 m!1196009))

(declare-fun m!1196011 () Bool)

(assert (=> b!1304778 m!1196011))

(declare-fun m!1196013 () Bool)

(assert (=> b!1304778 m!1196013))

(declare-fun m!1196015 () Bool)

(assert (=> b!1304778 m!1196015))

(declare-fun m!1196017 () Bool)

(assert (=> b!1304778 m!1196017))

(declare-fun m!1196019 () Bool)

(assert (=> b!1304778 m!1196019))

(declare-fun m!1196021 () Bool)

(assert (=> b!1304778 m!1196021))

(assert (=> b!1304778 m!1196011))

(declare-fun m!1196023 () Bool)

(assert (=> b!1304778 m!1196023))

(declare-fun m!1196025 () Bool)

(assert (=> b!1304782 m!1196025))

(assert (=> b!1304782 m!1196025))

(declare-fun m!1196027 () Bool)

(assert (=> b!1304782 m!1196027))

(check-sat (not b!1304786) (not start!110288) (not b_next!29263) (not b!1304782) tp_is_empty!34903 (not b!1304784) (not b!1304783) (not b!1304785) b_and!47429 (not mapNonEmpty!53947) (not b!1304778))
(check-sat b_and!47429 (not b_next!29263))
