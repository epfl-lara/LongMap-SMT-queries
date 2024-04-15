; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42074 () Bool)

(assert start!42074)

(declare-fun b_free!11641 () Bool)

(declare-fun b_next!11641 () Bool)

(assert (=> start!42074 (= b_free!11641 (not b_next!11641))))

(declare-fun tp!40942 () Bool)

(declare-fun b_and!20025 () Bool)

(assert (=> start!42074 (= tp!40942 b_and!20025)))

(declare-fun b!469654 () Bool)

(declare-fun res!280702 () Bool)

(declare-fun e!275072 () Bool)

(assert (=> b!469654 (=> (not res!280702) (not e!275072))))

(declare-datatypes ((array!29891 0))(
  ( (array!29892 (arr!14370 (Array (_ BitVec 32) (_ BitVec 64))) (size!14723 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29891)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29891 (_ BitVec 32)) Bool)

(assert (=> b!469654 (= res!280702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469655 () Bool)

(declare-fun res!280698 () Bool)

(assert (=> b!469655 (=> (not res!280698) (not e!275072))))

(declare-datatypes ((List!8770 0))(
  ( (Nil!8767) (Cons!8766 (h!9622 (_ BitVec 64)) (t!14721 List!8770)) )
))
(declare-fun arrayNoDuplicates!0 (array!29891 (_ BitVec 32) List!8770) Bool)

(assert (=> b!469655 (= res!280698 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8767))))

(declare-fun res!280700 () Bool)

(assert (=> start!42074 (=> (not res!280700) (not e!275072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42074 (= res!280700 (validMask!0 mask!1365))))

(assert (=> start!42074 e!275072))

(declare-fun tp_is_empty!13069 () Bool)

(assert (=> start!42074 tp_is_empty!13069))

(assert (=> start!42074 tp!40942))

(assert (=> start!42074 true))

(declare-fun array_inv!10454 (array!29891) Bool)

(assert (=> start!42074 (array_inv!10454 _keys!1025)))

(declare-datatypes ((V!18531 0))(
  ( (V!18532 (val!6579 Int)) )
))
(declare-datatypes ((ValueCell!6191 0))(
  ( (ValueCellFull!6191 (v!8863 V!18531)) (EmptyCell!6191) )
))
(declare-datatypes ((array!29893 0))(
  ( (array!29894 (arr!14371 (Array (_ BitVec 32) ValueCell!6191)) (size!14724 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29893)

(declare-fun e!275071 () Bool)

(declare-fun array_inv!10455 (array!29893) Bool)

(assert (=> start!42074 (and (array_inv!10455 _values!833) e!275071)))

(declare-fun b!469656 () Bool)

(declare-fun e!275073 () Bool)

(assert (=> b!469656 (= e!275072 (not e!275073))))

(declare-fun res!280699 () Bool)

(assert (=> b!469656 (=> res!280699 e!275073)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469656 (= res!280699 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8700 0))(
  ( (tuple2!8701 (_1!4361 (_ BitVec 64)) (_2!4361 V!18531)) )
))
(declare-datatypes ((List!8771 0))(
  ( (Nil!8768) (Cons!8767 (h!9623 tuple2!8700) (t!14722 List!8771)) )
))
(declare-datatypes ((ListLongMap!7603 0))(
  ( (ListLongMap!7604 (toList!3817 List!8771)) )
))
(declare-fun lt!212905 () ListLongMap!7603)

(declare-fun lt!212901 () ListLongMap!7603)

(assert (=> b!469656 (= lt!212905 lt!212901)))

(declare-fun minValueBefore!38 () V!18531)

(declare-fun zeroValue!794 () V!18531)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13733 0))(
  ( (Unit!13734) )
))
(declare-fun lt!212902 () Unit!13733)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18531)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!150 (array!29891 array!29893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 V!18531 V!18531 (_ BitVec 32) Int) Unit!13733)

(assert (=> b!469656 (= lt!212902 (lemmaNoChangeToArrayThenSameMapNoExtras!150 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1993 (array!29891 array!29893 (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 (_ BitVec 32) Int) ListLongMap!7603)

(assert (=> b!469656 (= lt!212901 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469656 (= lt!212905 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469657 () Bool)

(declare-fun e!275070 () Bool)

(assert (=> b!469657 (= e!275070 tp_is_empty!13069)))

(declare-fun b!469658 () Bool)

(declare-fun e!275069 () Bool)

(assert (=> b!469658 (= e!275069 tp_is_empty!13069)))

(declare-fun mapNonEmpty!21301 () Bool)

(declare-fun mapRes!21301 () Bool)

(declare-fun tp!40941 () Bool)

(assert (=> mapNonEmpty!21301 (= mapRes!21301 (and tp!40941 e!275069))))

(declare-fun mapRest!21301 () (Array (_ BitVec 32) ValueCell!6191))

(declare-fun mapValue!21301 () ValueCell!6191)

(declare-fun mapKey!21301 () (_ BitVec 32))

(assert (=> mapNonEmpty!21301 (= (arr!14371 _values!833) (store mapRest!21301 mapKey!21301 mapValue!21301))))

(declare-fun mapIsEmpty!21301 () Bool)

(assert (=> mapIsEmpty!21301 mapRes!21301))

(declare-fun b!469659 () Bool)

(assert (=> b!469659 (= e!275073 (bvsle #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun lt!212900 () tuple2!8700)

(declare-fun +!1742 (ListLongMap!7603 tuple2!8700) ListLongMap!7603)

(assert (=> b!469659 (= (+!1742 lt!212905 lt!212900) (+!1742 (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212900))))

(assert (=> b!469659 (= lt!212900 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212906 () Unit!13733)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!125 (ListLongMap!7603 (_ BitVec 64) V!18531 V!18531) Unit!13733)

(assert (=> b!469659 (= lt!212906 (addSameAsAddTwiceSameKeyDiffValues!125 lt!212905 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212904 () ListLongMap!7603)

(declare-fun getCurrentListMap!2178 (array!29891 array!29893 (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 (_ BitVec 32) Int) ListLongMap!7603)

(assert (=> b!469659 (= lt!212904 (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212903 () ListLongMap!7603)

(assert (=> b!469659 (= lt!212903 (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469660 () Bool)

(declare-fun res!280701 () Bool)

(assert (=> b!469660 (=> (not res!280701) (not e!275072))))

(assert (=> b!469660 (= res!280701 (and (= (size!14724 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14723 _keys!1025) (size!14724 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469661 () Bool)

(assert (=> b!469661 (= e!275071 (and e!275070 mapRes!21301))))

(declare-fun condMapEmpty!21301 () Bool)

(declare-fun mapDefault!21301 () ValueCell!6191)

(assert (=> b!469661 (= condMapEmpty!21301 (= (arr!14371 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6191)) mapDefault!21301)))))

(assert (= (and start!42074 res!280700) b!469660))

(assert (= (and b!469660 res!280701) b!469654))

(assert (= (and b!469654 res!280702) b!469655))

(assert (= (and b!469655 res!280698) b!469656))

(assert (= (and b!469656 (not res!280699)) b!469659))

(assert (= (and b!469661 condMapEmpty!21301) mapIsEmpty!21301))

(assert (= (and b!469661 (not condMapEmpty!21301)) mapNonEmpty!21301))

(get-info :version)

(assert (= (and mapNonEmpty!21301 ((_ is ValueCellFull!6191) mapValue!21301)) b!469658))

(assert (= (and b!469661 ((_ is ValueCellFull!6191) mapDefault!21301)) b!469657))

(assert (= start!42074 b!469661))

(declare-fun m!451477 () Bool)

(assert (=> b!469656 m!451477))

(declare-fun m!451479 () Bool)

(assert (=> b!469656 m!451479))

(declare-fun m!451481 () Bool)

(assert (=> b!469656 m!451481))

(declare-fun m!451483 () Bool)

(assert (=> b!469654 m!451483))

(declare-fun m!451485 () Bool)

(assert (=> b!469659 m!451485))

(declare-fun m!451487 () Bool)

(assert (=> b!469659 m!451487))

(declare-fun m!451489 () Bool)

(assert (=> b!469659 m!451489))

(assert (=> b!469659 m!451485))

(declare-fun m!451491 () Bool)

(assert (=> b!469659 m!451491))

(declare-fun m!451493 () Bool)

(assert (=> b!469659 m!451493))

(declare-fun m!451495 () Bool)

(assert (=> b!469659 m!451495))

(declare-fun m!451497 () Bool)

(assert (=> start!42074 m!451497))

(declare-fun m!451499 () Bool)

(assert (=> start!42074 m!451499))

(declare-fun m!451501 () Bool)

(assert (=> start!42074 m!451501))

(declare-fun m!451503 () Bool)

(assert (=> b!469655 m!451503))

(declare-fun m!451505 () Bool)

(assert (=> mapNonEmpty!21301 m!451505))

(check-sat (not mapNonEmpty!21301) (not b!469659) (not b!469654) tp_is_empty!13069 b_and!20025 (not b!469655) (not b!469656) (not start!42074) (not b_next!11641))
(check-sat b_and!20025 (not b_next!11641))
(get-model)

(declare-fun b!469752 () Bool)

(declare-fun e!275146 () ListLongMap!7603)

(declare-fun call!30386 () ListLongMap!7603)

(assert (=> b!469752 (= e!275146 call!30386)))

(declare-fun bm!30380 () Bool)

(declare-fun call!30389 () Bool)

(declare-fun lt!213006 () ListLongMap!7603)

(declare-fun contains!2528 (ListLongMap!7603 (_ BitVec 64)) Bool)

(assert (=> bm!30380 (= call!30389 (contains!2528 lt!213006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469753 () Bool)

(declare-fun e!275143 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!469753 (= e!275143 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun call!30387 () ListLongMap!7603)

(declare-fun c!56843 () Bool)

(declare-fun c!56840 () Bool)

(declare-fun call!30384 () ListLongMap!7603)

(declare-fun call!30383 () ListLongMap!7603)

(declare-fun bm!30381 () Bool)

(declare-fun call!30385 () ListLongMap!7603)

(assert (=> bm!30381 (= call!30385 (+!1742 (ite c!56840 call!30383 (ite c!56843 call!30387 call!30384)) (ite (or c!56840 c!56843) (tuple2!8701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!469754 () Bool)

(declare-fun e!275140 () Bool)

(declare-fun apply!327 (ListLongMap!7603 (_ BitVec 64)) V!18531)

(assert (=> b!469754 (= e!275140 (= (apply!327 lt!213006 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!469755 () Bool)

(declare-fun c!56841 () Bool)

(assert (=> b!469755 (= c!56841 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!275136 () ListLongMap!7603)

(assert (=> b!469755 (= e!275146 e!275136)))

(declare-fun b!469756 () Bool)

(declare-fun e!275148 () Bool)

(declare-fun e!275147 () Bool)

(assert (=> b!469756 (= e!275148 e!275147)))

(declare-fun res!280759 () Bool)

(assert (=> b!469756 (= res!280759 call!30389)))

(assert (=> b!469756 (=> (not res!280759) (not e!275147))))

(declare-fun b!469757 () Bool)

(declare-fun e!275141 () Bool)

(declare-fun call!30388 () Bool)

(assert (=> b!469757 (= e!275141 (not call!30388))))

(declare-fun b!469758 () Bool)

(declare-fun e!275139 () Bool)

(declare-fun e!275137 () Bool)

(assert (=> b!469758 (= e!275139 e!275137)))

(declare-fun res!280756 () Bool)

(assert (=> b!469758 (=> (not res!280756) (not e!275137))))

(assert (=> b!469758 (= res!280756 (contains!2528 lt!213006 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun b!469759 () Bool)

(assert (=> b!469759 (= e!275148 (not call!30389))))

(declare-fun b!469760 () Bool)

(declare-fun e!275144 () Unit!13733)

(declare-fun Unit!13737 () Unit!13733)

(assert (=> b!469760 (= e!275144 Unit!13737)))

(declare-fun bm!30382 () Bool)

(assert (=> bm!30382 (= call!30383 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469761 () Bool)

(declare-fun res!280755 () Bool)

(declare-fun e!275138 () Bool)

(assert (=> b!469761 (=> (not res!280755) (not e!275138))))

(assert (=> b!469761 (= res!280755 e!275148)))

(declare-fun c!56842 () Bool)

(assert (=> b!469761 (= c!56842 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469762 () Bool)

(declare-fun e!275145 () Bool)

(assert (=> b!469762 (= e!275145 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469763 () Bool)

(assert (=> b!469763 (= e!275136 call!30386)))

(declare-fun b!469764 () Bool)

(assert (=> b!469764 (= e!275147 (= (apply!327 lt!213006 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469765 () Bool)

(declare-fun get!7026 (ValueCell!6191 V!18531) V!18531)

(declare-fun dynLambda!923 (Int (_ BitVec 64)) V!18531)

(assert (=> b!469765 (= e!275137 (= (apply!327 lt!213006 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14724 _values!833)))))

(assert (=> b!469765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun d!75115 () Bool)

(assert (=> d!75115 e!275138))

(declare-fun res!280752 () Bool)

(assert (=> d!75115 (=> (not res!280752) (not e!275138))))

(assert (=> d!75115 (= res!280752 (or (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))))

(declare-fun lt!213008 () ListLongMap!7603)

(assert (=> d!75115 (= lt!213006 lt!213008)))

(declare-fun lt!213014 () Unit!13733)

(assert (=> d!75115 (= lt!213014 e!275144)))

(declare-fun c!56839 () Bool)

(assert (=> d!75115 (= c!56839 e!275143)))

(declare-fun res!280751 () Bool)

(assert (=> d!75115 (=> (not res!280751) (not e!275143))))

(assert (=> d!75115 (= res!280751 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun e!275142 () ListLongMap!7603)

(assert (=> d!75115 (= lt!213008 e!275142)))

(assert (=> d!75115 (= c!56840 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75115 (validMask!0 mask!1365)))

(assert (=> d!75115 (= (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213006)))

(declare-fun b!469766 () Bool)

(assert (=> b!469766 (= e!275138 e!275141)))

(declare-fun c!56838 () Bool)

(assert (=> b!469766 (= c!56838 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469767 () Bool)

(assert (=> b!469767 (= e!275136 call!30384)))

(declare-fun b!469768 () Bool)

(assert (=> b!469768 (= e!275142 (+!1742 call!30385 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!469769 () Bool)

(assert (=> b!469769 (= e!275142 e!275146)))

(assert (=> b!469769 (= c!56843 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469770 () Bool)

(declare-fun res!280753 () Bool)

(assert (=> b!469770 (=> (not res!280753) (not e!275138))))

(assert (=> b!469770 (= res!280753 e!275139)))

(declare-fun res!280757 () Bool)

(assert (=> b!469770 (=> res!280757 e!275139)))

(assert (=> b!469770 (= res!280757 (not e!275145))))

(declare-fun res!280754 () Bool)

(assert (=> b!469770 (=> (not res!280754) (not e!275145))))

(assert (=> b!469770 (= res!280754 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun bm!30383 () Bool)

(assert (=> bm!30383 (= call!30384 call!30387)))

(declare-fun b!469771 () Bool)

(assert (=> b!469771 (= e!275141 e!275140)))

(declare-fun res!280758 () Bool)

(assert (=> b!469771 (= res!280758 call!30388)))

(assert (=> b!469771 (=> (not res!280758) (not e!275140))))

(declare-fun b!469772 () Bool)

(declare-fun lt!213012 () Unit!13733)

(assert (=> b!469772 (= e!275144 lt!213012)))

(declare-fun lt!213007 () ListLongMap!7603)

(assert (=> b!469772 (= lt!213007 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213001 () (_ BitVec 64))

(assert (=> b!469772 (= lt!213001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213013 () (_ BitVec 64))

(assert (=> b!469772 (= lt!213013 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213010 () Unit!13733)

(declare-fun addStillContains!289 (ListLongMap!7603 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13733)

(assert (=> b!469772 (= lt!213010 (addStillContains!289 lt!213007 lt!213001 zeroValue!794 lt!213013))))

(assert (=> b!469772 (contains!2528 (+!1742 lt!213007 (tuple2!8701 lt!213001 zeroValue!794)) lt!213013)))

(declare-fun lt!212999 () Unit!13733)

(assert (=> b!469772 (= lt!212999 lt!213010)))

(declare-fun lt!212994 () ListLongMap!7603)

(assert (=> b!469772 (= lt!212994 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212998 () (_ BitVec 64))

(assert (=> b!469772 (= lt!212998 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212997 () (_ BitVec 64))

(assert (=> b!469772 (= lt!212997 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213005 () Unit!13733)

(declare-fun addApplyDifferent!289 (ListLongMap!7603 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13733)

(assert (=> b!469772 (= lt!213005 (addApplyDifferent!289 lt!212994 lt!212998 minValueAfter!38 lt!212997))))

(assert (=> b!469772 (= (apply!327 (+!1742 lt!212994 (tuple2!8701 lt!212998 minValueAfter!38)) lt!212997) (apply!327 lt!212994 lt!212997))))

(declare-fun lt!213003 () Unit!13733)

(assert (=> b!469772 (= lt!213003 lt!213005)))

(declare-fun lt!213011 () ListLongMap!7603)

(assert (=> b!469772 (= lt!213011 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212996 () (_ BitVec 64))

(assert (=> b!469772 (= lt!212996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213009 () (_ BitVec 64))

(assert (=> b!469772 (= lt!213009 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213004 () Unit!13733)

(assert (=> b!469772 (= lt!213004 (addApplyDifferent!289 lt!213011 lt!212996 zeroValue!794 lt!213009))))

(assert (=> b!469772 (= (apply!327 (+!1742 lt!213011 (tuple2!8701 lt!212996 zeroValue!794)) lt!213009) (apply!327 lt!213011 lt!213009))))

(declare-fun lt!213002 () Unit!13733)

(assert (=> b!469772 (= lt!213002 lt!213004)))

(declare-fun lt!213000 () ListLongMap!7603)

(assert (=> b!469772 (= lt!213000 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212995 () (_ BitVec 64))

(assert (=> b!469772 (= lt!212995 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212993 () (_ BitVec 64))

(assert (=> b!469772 (= lt!212993 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469772 (= lt!213012 (addApplyDifferent!289 lt!213000 lt!212995 minValueAfter!38 lt!212993))))

(assert (=> b!469772 (= (apply!327 (+!1742 lt!213000 (tuple2!8701 lt!212995 minValueAfter!38)) lt!212993) (apply!327 lt!213000 lt!212993))))

(declare-fun bm!30384 () Bool)

(assert (=> bm!30384 (= call!30386 call!30385)))

(declare-fun bm!30385 () Bool)

(assert (=> bm!30385 (= call!30388 (contains!2528 lt!213006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30386 () Bool)

(assert (=> bm!30386 (= call!30387 call!30383)))

(assert (= (and d!75115 c!56840) b!469768))

(assert (= (and d!75115 (not c!56840)) b!469769))

(assert (= (and b!469769 c!56843) b!469752))

(assert (= (and b!469769 (not c!56843)) b!469755))

(assert (= (and b!469755 c!56841) b!469763))

(assert (= (and b!469755 (not c!56841)) b!469767))

(assert (= (or b!469763 b!469767) bm!30383))

(assert (= (or b!469752 bm!30383) bm!30386))

(assert (= (or b!469752 b!469763) bm!30384))

(assert (= (or b!469768 bm!30386) bm!30382))

(assert (= (or b!469768 bm!30384) bm!30381))

(assert (= (and d!75115 res!280751) b!469753))

(assert (= (and d!75115 c!56839) b!469772))

(assert (= (and d!75115 (not c!56839)) b!469760))

(assert (= (and d!75115 res!280752) b!469770))

(assert (= (and b!469770 res!280754) b!469762))

(assert (= (and b!469770 (not res!280757)) b!469758))

(assert (= (and b!469758 res!280756) b!469765))

(assert (= (and b!469770 res!280753) b!469761))

(assert (= (and b!469761 c!56842) b!469756))

(assert (= (and b!469761 (not c!56842)) b!469759))

(assert (= (and b!469756 res!280759) b!469764))

(assert (= (or b!469756 b!469759) bm!30380))

(assert (= (and b!469761 res!280755) b!469766))

(assert (= (and b!469766 c!56838) b!469771))

(assert (= (and b!469766 (not c!56838)) b!469757))

(assert (= (and b!469771 res!280758) b!469754))

(assert (= (or b!469771 b!469757) bm!30385))

(declare-fun b_lambda!10095 () Bool)

(assert (=> (not b_lambda!10095) (not b!469765)))

(declare-fun t!14725 () Bool)

(declare-fun tb!3911 () Bool)

(assert (=> (and start!42074 (= defaultEntry!841 defaultEntry!841) t!14725) tb!3911))

(declare-fun result!7407 () Bool)

(assert (=> tb!3911 (= result!7407 tp_is_empty!13069)))

(assert (=> b!469765 t!14725))

(declare-fun b_and!20031 () Bool)

(assert (= b_and!20025 (and (=> t!14725 result!7407) b_and!20031)))

(declare-fun m!451567 () Bool)

(assert (=> b!469753 m!451567))

(assert (=> b!469753 m!451567))

(declare-fun m!451569 () Bool)

(assert (=> b!469753 m!451569))

(declare-fun m!451571 () Bool)

(assert (=> b!469754 m!451571))

(assert (=> b!469765 m!451567))

(declare-fun m!451573 () Bool)

(assert (=> b!469765 m!451573))

(declare-fun m!451575 () Bool)

(assert (=> b!469765 m!451575))

(assert (=> b!469765 m!451575))

(declare-fun m!451577 () Bool)

(assert (=> b!469765 m!451577))

(declare-fun m!451579 () Bool)

(assert (=> b!469765 m!451579))

(assert (=> b!469765 m!451567))

(assert (=> b!469765 m!451577))

(assert (=> d!75115 m!451497))

(declare-fun m!451581 () Bool)

(assert (=> bm!30380 m!451581))

(declare-fun m!451583 () Bool)

(assert (=> bm!30381 m!451583))

(declare-fun m!451585 () Bool)

(assert (=> b!469772 m!451585))

(declare-fun m!451587 () Bool)

(assert (=> b!469772 m!451587))

(declare-fun m!451589 () Bool)

(assert (=> b!469772 m!451589))

(declare-fun m!451591 () Bool)

(assert (=> b!469772 m!451591))

(declare-fun m!451593 () Bool)

(assert (=> b!469772 m!451593))

(declare-fun m!451595 () Bool)

(assert (=> b!469772 m!451595))

(assert (=> b!469772 m!451593))

(declare-fun m!451597 () Bool)

(assert (=> b!469772 m!451597))

(assert (=> b!469772 m!451587))

(assert (=> b!469772 m!451595))

(declare-fun m!451599 () Bool)

(assert (=> b!469772 m!451599))

(declare-fun m!451601 () Bool)

(assert (=> b!469772 m!451601))

(declare-fun m!451603 () Bool)

(assert (=> b!469772 m!451603))

(declare-fun m!451605 () Bool)

(assert (=> b!469772 m!451605))

(declare-fun m!451607 () Bool)

(assert (=> b!469772 m!451607))

(assert (=> b!469772 m!451585))

(declare-fun m!451609 () Bool)

(assert (=> b!469772 m!451609))

(declare-fun m!451611 () Bool)

(assert (=> b!469772 m!451611))

(assert (=> b!469772 m!451567))

(declare-fun m!451613 () Bool)

(assert (=> b!469772 m!451613))

(assert (=> b!469772 m!451479))

(declare-fun m!451615 () Bool)

(assert (=> b!469764 m!451615))

(assert (=> b!469758 m!451567))

(assert (=> b!469758 m!451567))

(declare-fun m!451617 () Bool)

(assert (=> b!469758 m!451617))

(declare-fun m!451619 () Bool)

(assert (=> b!469768 m!451619))

(assert (=> b!469762 m!451567))

(assert (=> b!469762 m!451567))

(assert (=> b!469762 m!451569))

(assert (=> bm!30382 m!451479))

(declare-fun m!451621 () Bool)

(assert (=> bm!30385 m!451621))

(assert (=> b!469659 d!75115))

(declare-fun d!75117 () Bool)

(declare-fun e!275151 () Bool)

(assert (=> d!75117 e!275151))

(declare-fun res!280764 () Bool)

(assert (=> d!75117 (=> (not res!280764) (not e!275151))))

(declare-fun lt!213026 () ListLongMap!7603)

(assert (=> d!75117 (= res!280764 (contains!2528 lt!213026 (_1!4361 lt!212900)))))

(declare-fun lt!213023 () List!8771)

(assert (=> d!75117 (= lt!213026 (ListLongMap!7604 lt!213023))))

(declare-fun lt!213024 () Unit!13733)

(declare-fun lt!213025 () Unit!13733)

(assert (=> d!75117 (= lt!213024 lt!213025)))

(declare-datatypes ((Option!383 0))(
  ( (Some!382 (v!8866 V!18531)) (None!381) )
))
(declare-fun getValueByKey!377 (List!8771 (_ BitVec 64)) Option!383)

(assert (=> d!75117 (= (getValueByKey!377 lt!213023 (_1!4361 lt!212900)) (Some!382 (_2!4361 lt!212900)))))

(declare-fun lemmaContainsTupThenGetReturnValue!202 (List!8771 (_ BitVec 64) V!18531) Unit!13733)

(assert (=> d!75117 (= lt!213025 (lemmaContainsTupThenGetReturnValue!202 lt!213023 (_1!4361 lt!212900) (_2!4361 lt!212900)))))

(declare-fun insertStrictlySorted!205 (List!8771 (_ BitVec 64) V!18531) List!8771)

(assert (=> d!75117 (= lt!213023 (insertStrictlySorted!205 (toList!3817 lt!212905) (_1!4361 lt!212900) (_2!4361 lt!212900)))))

(assert (=> d!75117 (= (+!1742 lt!212905 lt!212900) lt!213026)))

(declare-fun b!469779 () Bool)

(declare-fun res!280765 () Bool)

(assert (=> b!469779 (=> (not res!280765) (not e!275151))))

(assert (=> b!469779 (= res!280765 (= (getValueByKey!377 (toList!3817 lt!213026) (_1!4361 lt!212900)) (Some!382 (_2!4361 lt!212900))))))

(declare-fun b!469780 () Bool)

(declare-fun contains!2529 (List!8771 tuple2!8700) Bool)

(assert (=> b!469780 (= e!275151 (contains!2529 (toList!3817 lt!213026) lt!212900))))

(assert (= (and d!75117 res!280764) b!469779))

(assert (= (and b!469779 res!280765) b!469780))

(declare-fun m!451623 () Bool)

(assert (=> d!75117 m!451623))

(declare-fun m!451625 () Bool)

(assert (=> d!75117 m!451625))

(declare-fun m!451627 () Bool)

(assert (=> d!75117 m!451627))

(declare-fun m!451629 () Bool)

(assert (=> d!75117 m!451629))

(declare-fun m!451631 () Bool)

(assert (=> b!469779 m!451631))

(declare-fun m!451633 () Bool)

(assert (=> b!469780 m!451633))

(assert (=> b!469659 d!75117))

(declare-fun d!75119 () Bool)

(declare-fun e!275152 () Bool)

(assert (=> d!75119 e!275152))

(declare-fun res!280766 () Bool)

(assert (=> d!75119 (=> (not res!280766) (not e!275152))))

(declare-fun lt!213030 () ListLongMap!7603)

(assert (=> d!75119 (= res!280766 (contains!2528 lt!213030 (_1!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!213027 () List!8771)

(assert (=> d!75119 (= lt!213030 (ListLongMap!7604 lt!213027))))

(declare-fun lt!213028 () Unit!13733)

(declare-fun lt!213029 () Unit!13733)

(assert (=> d!75119 (= lt!213028 lt!213029)))

(assert (=> d!75119 (= (getValueByKey!377 lt!213027 (_1!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!382 (_2!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75119 (= lt!213029 (lemmaContainsTupThenGetReturnValue!202 lt!213027 (_1!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75119 (= lt!213027 (insertStrictlySorted!205 (toList!3817 lt!212905) (_1!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75119 (= (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213030)))

(declare-fun b!469781 () Bool)

(declare-fun res!280767 () Bool)

(assert (=> b!469781 (=> (not res!280767) (not e!275152))))

(assert (=> b!469781 (= res!280767 (= (getValueByKey!377 (toList!3817 lt!213030) (_1!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!382 (_2!4361 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!469782 () Bool)

(assert (=> b!469782 (= e!275152 (contains!2529 (toList!3817 lt!213030) (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75119 res!280766) b!469781))

(assert (= (and b!469781 res!280767) b!469782))

(declare-fun m!451635 () Bool)

(assert (=> d!75119 m!451635))

(declare-fun m!451637 () Bool)

(assert (=> d!75119 m!451637))

(declare-fun m!451639 () Bool)

(assert (=> d!75119 m!451639))

(declare-fun m!451641 () Bool)

(assert (=> d!75119 m!451641))

(declare-fun m!451643 () Bool)

(assert (=> b!469781 m!451643))

(declare-fun m!451645 () Bool)

(assert (=> b!469782 m!451645))

(assert (=> b!469659 d!75119))

(declare-fun d!75121 () Bool)

(assert (=> d!75121 (= (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1742 (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!213033 () Unit!13733)

(declare-fun choose!1352 (ListLongMap!7603 (_ BitVec 64) V!18531 V!18531) Unit!13733)

(assert (=> d!75121 (= lt!213033 (choose!1352 lt!212905 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75121 (= (addSameAsAddTwiceSameKeyDiffValues!125 lt!212905 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!213033)))

(declare-fun bs!14861 () Bool)

(assert (= bs!14861 d!75121))

(declare-fun m!451647 () Bool)

(assert (=> bs!14861 m!451647))

(assert (=> bs!14861 m!451485))

(assert (=> bs!14861 m!451485))

(declare-fun m!451649 () Bool)

(assert (=> bs!14861 m!451649))

(declare-fun m!451651 () Bool)

(assert (=> bs!14861 m!451651))

(assert (=> b!469659 d!75121))

(declare-fun b!469783 () Bool)

(declare-fun e!275163 () ListLongMap!7603)

(declare-fun call!30393 () ListLongMap!7603)

(assert (=> b!469783 (= e!275163 call!30393)))

(declare-fun bm!30387 () Bool)

(declare-fun call!30396 () Bool)

(declare-fun lt!213047 () ListLongMap!7603)

(assert (=> bm!30387 (= call!30396 (contains!2528 lt!213047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469784 () Bool)

(declare-fun e!275160 () Bool)

(assert (=> b!469784 (= e!275160 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun c!56846 () Bool)

(declare-fun call!30392 () ListLongMap!7603)

(declare-fun c!56849 () Bool)

(declare-fun bm!30388 () Bool)

(declare-fun call!30394 () ListLongMap!7603)

(declare-fun call!30390 () ListLongMap!7603)

(declare-fun call!30391 () ListLongMap!7603)

(assert (=> bm!30388 (= call!30392 (+!1742 (ite c!56846 call!30390 (ite c!56849 call!30394 call!30391)) (ite (or c!56846 c!56849) (tuple2!8701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!469785 () Bool)

(declare-fun e!275157 () Bool)

(assert (=> b!469785 (= e!275157 (= (apply!327 lt!213047 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!469786 () Bool)

(declare-fun c!56847 () Bool)

(assert (=> b!469786 (= c!56847 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!275153 () ListLongMap!7603)

(assert (=> b!469786 (= e!275163 e!275153)))

(declare-fun b!469787 () Bool)

(declare-fun e!275165 () Bool)

(declare-fun e!275164 () Bool)

(assert (=> b!469787 (= e!275165 e!275164)))

(declare-fun res!280776 () Bool)

(assert (=> b!469787 (= res!280776 call!30396)))

(assert (=> b!469787 (=> (not res!280776) (not e!275164))))

(declare-fun b!469788 () Bool)

(declare-fun e!275158 () Bool)

(declare-fun call!30395 () Bool)

(assert (=> b!469788 (= e!275158 (not call!30395))))

(declare-fun b!469789 () Bool)

(declare-fun e!275156 () Bool)

(declare-fun e!275154 () Bool)

(assert (=> b!469789 (= e!275156 e!275154)))

(declare-fun res!280773 () Bool)

(assert (=> b!469789 (=> (not res!280773) (not e!275154))))

(assert (=> b!469789 (= res!280773 (contains!2528 lt!213047 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun b!469790 () Bool)

(assert (=> b!469790 (= e!275165 (not call!30396))))

(declare-fun b!469791 () Bool)

(declare-fun e!275161 () Unit!13733)

(declare-fun Unit!13738 () Unit!13733)

(assert (=> b!469791 (= e!275161 Unit!13738)))

(declare-fun bm!30389 () Bool)

(assert (=> bm!30389 (= call!30390 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469792 () Bool)

(declare-fun res!280772 () Bool)

(declare-fun e!275155 () Bool)

(assert (=> b!469792 (=> (not res!280772) (not e!275155))))

(assert (=> b!469792 (= res!280772 e!275165)))

(declare-fun c!56848 () Bool)

(assert (=> b!469792 (= c!56848 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469793 () Bool)

(declare-fun e!275162 () Bool)

(assert (=> b!469793 (= e!275162 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469794 () Bool)

(assert (=> b!469794 (= e!275153 call!30393)))

(declare-fun b!469795 () Bool)

(assert (=> b!469795 (= e!275164 (= (apply!327 lt!213047 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469796 () Bool)

(assert (=> b!469796 (= e!275154 (= (apply!327 lt!213047 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14724 _values!833)))))

(assert (=> b!469796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun d!75123 () Bool)

(assert (=> d!75123 e!275155))

(declare-fun res!280769 () Bool)

(assert (=> d!75123 (=> (not res!280769) (not e!275155))))

(assert (=> d!75123 (= res!280769 (or (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))))

(declare-fun lt!213049 () ListLongMap!7603)

(assert (=> d!75123 (= lt!213047 lt!213049)))

(declare-fun lt!213055 () Unit!13733)

(assert (=> d!75123 (= lt!213055 e!275161)))

(declare-fun c!56845 () Bool)

(assert (=> d!75123 (= c!56845 e!275160)))

(declare-fun res!280768 () Bool)

(assert (=> d!75123 (=> (not res!280768) (not e!275160))))

(assert (=> d!75123 (= res!280768 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun e!275159 () ListLongMap!7603)

(assert (=> d!75123 (= lt!213049 e!275159)))

(assert (=> d!75123 (= c!56846 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75123 (validMask!0 mask!1365)))

(assert (=> d!75123 (= (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213047)))

(declare-fun b!469797 () Bool)

(assert (=> b!469797 (= e!275155 e!275158)))

(declare-fun c!56844 () Bool)

(assert (=> b!469797 (= c!56844 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469798 () Bool)

(assert (=> b!469798 (= e!275153 call!30391)))

(declare-fun b!469799 () Bool)

(assert (=> b!469799 (= e!275159 (+!1742 call!30392 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!469800 () Bool)

(assert (=> b!469800 (= e!275159 e!275163)))

(assert (=> b!469800 (= c!56849 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469801 () Bool)

(declare-fun res!280770 () Bool)

(assert (=> b!469801 (=> (not res!280770) (not e!275155))))

(assert (=> b!469801 (= res!280770 e!275156)))

(declare-fun res!280774 () Bool)

(assert (=> b!469801 (=> res!280774 e!275156)))

(assert (=> b!469801 (= res!280774 (not e!275162))))

(declare-fun res!280771 () Bool)

(assert (=> b!469801 (=> (not res!280771) (not e!275162))))

(assert (=> b!469801 (= res!280771 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun bm!30390 () Bool)

(assert (=> bm!30390 (= call!30391 call!30394)))

(declare-fun b!469802 () Bool)

(assert (=> b!469802 (= e!275158 e!275157)))

(declare-fun res!280775 () Bool)

(assert (=> b!469802 (= res!280775 call!30395)))

(assert (=> b!469802 (=> (not res!280775) (not e!275157))))

(declare-fun b!469803 () Bool)

(declare-fun lt!213053 () Unit!13733)

(assert (=> b!469803 (= e!275161 lt!213053)))

(declare-fun lt!213048 () ListLongMap!7603)

(assert (=> b!469803 (= lt!213048 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213042 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213042 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213054 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213054 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213051 () Unit!13733)

(assert (=> b!469803 (= lt!213051 (addStillContains!289 lt!213048 lt!213042 zeroValue!794 lt!213054))))

(assert (=> b!469803 (contains!2528 (+!1742 lt!213048 (tuple2!8701 lt!213042 zeroValue!794)) lt!213054)))

(declare-fun lt!213040 () Unit!13733)

(assert (=> b!469803 (= lt!213040 lt!213051)))

(declare-fun lt!213035 () ListLongMap!7603)

(assert (=> b!469803 (= lt!213035 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213039 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213038 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213038 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213046 () Unit!13733)

(assert (=> b!469803 (= lt!213046 (addApplyDifferent!289 lt!213035 lt!213039 minValueBefore!38 lt!213038))))

(assert (=> b!469803 (= (apply!327 (+!1742 lt!213035 (tuple2!8701 lt!213039 minValueBefore!38)) lt!213038) (apply!327 lt!213035 lt!213038))))

(declare-fun lt!213044 () Unit!13733)

(assert (=> b!469803 (= lt!213044 lt!213046)))

(declare-fun lt!213052 () ListLongMap!7603)

(assert (=> b!469803 (= lt!213052 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213037 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213050 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213050 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213045 () Unit!13733)

(assert (=> b!469803 (= lt!213045 (addApplyDifferent!289 lt!213052 lt!213037 zeroValue!794 lt!213050))))

(assert (=> b!469803 (= (apply!327 (+!1742 lt!213052 (tuple2!8701 lt!213037 zeroValue!794)) lt!213050) (apply!327 lt!213052 lt!213050))))

(declare-fun lt!213043 () Unit!13733)

(assert (=> b!469803 (= lt!213043 lt!213045)))

(declare-fun lt!213041 () ListLongMap!7603)

(assert (=> b!469803 (= lt!213041 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213036 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213034 () (_ BitVec 64))

(assert (=> b!469803 (= lt!213034 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469803 (= lt!213053 (addApplyDifferent!289 lt!213041 lt!213036 minValueBefore!38 lt!213034))))

(assert (=> b!469803 (= (apply!327 (+!1742 lt!213041 (tuple2!8701 lt!213036 minValueBefore!38)) lt!213034) (apply!327 lt!213041 lt!213034))))

(declare-fun bm!30391 () Bool)

(assert (=> bm!30391 (= call!30393 call!30392)))

(declare-fun bm!30392 () Bool)

(assert (=> bm!30392 (= call!30395 (contains!2528 lt!213047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30393 () Bool)

(assert (=> bm!30393 (= call!30394 call!30390)))

(assert (= (and d!75123 c!56846) b!469799))

(assert (= (and d!75123 (not c!56846)) b!469800))

(assert (= (and b!469800 c!56849) b!469783))

(assert (= (and b!469800 (not c!56849)) b!469786))

(assert (= (and b!469786 c!56847) b!469794))

(assert (= (and b!469786 (not c!56847)) b!469798))

(assert (= (or b!469794 b!469798) bm!30390))

(assert (= (or b!469783 bm!30390) bm!30393))

(assert (= (or b!469783 b!469794) bm!30391))

(assert (= (or b!469799 bm!30393) bm!30389))

(assert (= (or b!469799 bm!30391) bm!30388))

(assert (= (and d!75123 res!280768) b!469784))

(assert (= (and d!75123 c!56845) b!469803))

(assert (= (and d!75123 (not c!56845)) b!469791))

(assert (= (and d!75123 res!280769) b!469801))

(assert (= (and b!469801 res!280771) b!469793))

(assert (= (and b!469801 (not res!280774)) b!469789))

(assert (= (and b!469789 res!280773) b!469796))

(assert (= (and b!469801 res!280770) b!469792))

(assert (= (and b!469792 c!56848) b!469787))

(assert (= (and b!469792 (not c!56848)) b!469790))

(assert (= (and b!469787 res!280776) b!469795))

(assert (= (or b!469787 b!469790) bm!30387))

(assert (= (and b!469792 res!280772) b!469797))

(assert (= (and b!469797 c!56844) b!469802))

(assert (= (and b!469797 (not c!56844)) b!469788))

(assert (= (and b!469802 res!280775) b!469785))

(assert (= (or b!469802 b!469788) bm!30392))

(declare-fun b_lambda!10097 () Bool)

(assert (=> (not b_lambda!10097) (not b!469796)))

(assert (=> b!469796 t!14725))

(declare-fun b_and!20033 () Bool)

(assert (= b_and!20031 (and (=> t!14725 result!7407) b_and!20033)))

(assert (=> b!469784 m!451567))

(assert (=> b!469784 m!451567))

(assert (=> b!469784 m!451569))

(declare-fun m!451653 () Bool)

(assert (=> b!469785 m!451653))

(assert (=> b!469796 m!451567))

(declare-fun m!451655 () Bool)

(assert (=> b!469796 m!451655))

(assert (=> b!469796 m!451575))

(assert (=> b!469796 m!451575))

(assert (=> b!469796 m!451577))

(assert (=> b!469796 m!451579))

(assert (=> b!469796 m!451567))

(assert (=> b!469796 m!451577))

(assert (=> d!75123 m!451497))

(declare-fun m!451657 () Bool)

(assert (=> bm!30387 m!451657))

(declare-fun m!451659 () Bool)

(assert (=> bm!30388 m!451659))

(declare-fun m!451661 () Bool)

(assert (=> b!469803 m!451661))

(declare-fun m!451663 () Bool)

(assert (=> b!469803 m!451663))

(declare-fun m!451665 () Bool)

(assert (=> b!469803 m!451665))

(declare-fun m!451667 () Bool)

(assert (=> b!469803 m!451667))

(declare-fun m!451669 () Bool)

(assert (=> b!469803 m!451669))

(declare-fun m!451671 () Bool)

(assert (=> b!469803 m!451671))

(assert (=> b!469803 m!451669))

(declare-fun m!451673 () Bool)

(assert (=> b!469803 m!451673))

(assert (=> b!469803 m!451663))

(assert (=> b!469803 m!451671))

(declare-fun m!451675 () Bool)

(assert (=> b!469803 m!451675))

(declare-fun m!451677 () Bool)

(assert (=> b!469803 m!451677))

(declare-fun m!451679 () Bool)

(assert (=> b!469803 m!451679))

(declare-fun m!451681 () Bool)

(assert (=> b!469803 m!451681))

(declare-fun m!451683 () Bool)

(assert (=> b!469803 m!451683))

(assert (=> b!469803 m!451661))

(declare-fun m!451685 () Bool)

(assert (=> b!469803 m!451685))

(declare-fun m!451687 () Bool)

(assert (=> b!469803 m!451687))

(assert (=> b!469803 m!451567))

(declare-fun m!451689 () Bool)

(assert (=> b!469803 m!451689))

(assert (=> b!469803 m!451481))

(declare-fun m!451691 () Bool)

(assert (=> b!469795 m!451691))

(assert (=> b!469789 m!451567))

(assert (=> b!469789 m!451567))

(declare-fun m!451693 () Bool)

(assert (=> b!469789 m!451693))

(declare-fun m!451695 () Bool)

(assert (=> b!469799 m!451695))

(assert (=> b!469793 m!451567))

(assert (=> b!469793 m!451567))

(assert (=> b!469793 m!451569))

(assert (=> bm!30389 m!451481))

(declare-fun m!451697 () Bool)

(assert (=> bm!30392 m!451697))

(assert (=> b!469659 d!75123))

(declare-fun d!75125 () Bool)

(declare-fun e!275166 () Bool)

(assert (=> d!75125 e!275166))

(declare-fun res!280777 () Bool)

(assert (=> d!75125 (=> (not res!280777) (not e!275166))))

(declare-fun lt!213059 () ListLongMap!7603)

(assert (=> d!75125 (= res!280777 (contains!2528 lt!213059 (_1!4361 lt!212900)))))

(declare-fun lt!213056 () List!8771)

(assert (=> d!75125 (= lt!213059 (ListLongMap!7604 lt!213056))))

(declare-fun lt!213057 () Unit!13733)

(declare-fun lt!213058 () Unit!13733)

(assert (=> d!75125 (= lt!213057 lt!213058)))

(assert (=> d!75125 (= (getValueByKey!377 lt!213056 (_1!4361 lt!212900)) (Some!382 (_2!4361 lt!212900)))))

(assert (=> d!75125 (= lt!213058 (lemmaContainsTupThenGetReturnValue!202 lt!213056 (_1!4361 lt!212900) (_2!4361 lt!212900)))))

(assert (=> d!75125 (= lt!213056 (insertStrictlySorted!205 (toList!3817 (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4361 lt!212900) (_2!4361 lt!212900)))))

(assert (=> d!75125 (= (+!1742 (+!1742 lt!212905 (tuple2!8701 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212900) lt!213059)))

(declare-fun b!469804 () Bool)

(declare-fun res!280778 () Bool)

(assert (=> b!469804 (=> (not res!280778) (not e!275166))))

(assert (=> b!469804 (= res!280778 (= (getValueByKey!377 (toList!3817 lt!213059) (_1!4361 lt!212900)) (Some!382 (_2!4361 lt!212900))))))

(declare-fun b!469805 () Bool)

(assert (=> b!469805 (= e!275166 (contains!2529 (toList!3817 lt!213059) lt!212900))))

(assert (= (and d!75125 res!280777) b!469804))

(assert (= (and b!469804 res!280778) b!469805))

(declare-fun m!451699 () Bool)

(assert (=> d!75125 m!451699))

(declare-fun m!451701 () Bool)

(assert (=> d!75125 m!451701))

(declare-fun m!451703 () Bool)

(assert (=> d!75125 m!451703))

(declare-fun m!451705 () Bool)

(assert (=> d!75125 m!451705))

(declare-fun m!451707 () Bool)

(assert (=> b!469804 m!451707))

(declare-fun m!451709 () Bool)

(assert (=> b!469805 m!451709))

(assert (=> b!469659 d!75125))

(declare-fun d!75127 () Bool)

(assert (=> d!75127 (= (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213062 () Unit!13733)

(declare-fun choose!1353 (array!29891 array!29893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 V!18531 V!18531 (_ BitVec 32) Int) Unit!13733)

(assert (=> d!75127 (= lt!213062 (choose!1353 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75127 (validMask!0 mask!1365)))

(assert (=> d!75127 (= (lemmaNoChangeToArrayThenSameMapNoExtras!150 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213062)))

(declare-fun bs!14862 () Bool)

(assert (= bs!14862 d!75127))

(assert (=> bs!14862 m!451481))

(assert (=> bs!14862 m!451479))

(declare-fun m!451711 () Bool)

(assert (=> bs!14862 m!451711))

(assert (=> bs!14862 m!451497))

(assert (=> b!469656 d!75127))

(declare-fun b!469830 () Bool)

(declare-fun e!275185 () ListLongMap!7603)

(assert (=> b!469830 (= e!275185 (ListLongMap!7604 Nil!8768))))

(declare-fun b!469831 () Bool)

(declare-fun e!275181 () ListLongMap!7603)

(declare-fun call!30399 () ListLongMap!7603)

(assert (=> b!469831 (= e!275181 call!30399)))

(declare-fun b!469832 () Bool)

(assert (=> b!469832 (= e!275185 e!275181)))

(declare-fun c!56858 () Bool)

(assert (=> b!469832 (= c!56858 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469833 () Bool)

(declare-fun e!275184 () Bool)

(declare-fun lt!213082 () ListLongMap!7603)

(declare-fun isEmpty!578 (ListLongMap!7603) Bool)

(assert (=> b!469833 (= e!275184 (isEmpty!578 lt!213082))))

(declare-fun b!469834 () Bool)

(declare-fun e!275182 () Bool)

(declare-fun e!275187 () Bool)

(assert (=> b!469834 (= e!275182 e!275187)))

(assert (=> b!469834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun res!280789 () Bool)

(assert (=> b!469834 (= res!280789 (contains!2528 lt!213082 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469834 (=> (not res!280789) (not e!275187))))

(declare-fun b!469835 () Bool)

(declare-fun e!275186 () Bool)

(assert (=> b!469835 (= e!275186 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469835 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469836 () Bool)

(declare-fun res!280787 () Bool)

(declare-fun e!275183 () Bool)

(assert (=> b!469836 (=> (not res!280787) (not e!275183))))

(assert (=> b!469836 (= res!280787 (not (contains!2528 lt!213082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469837 () Bool)

(declare-fun lt!213081 () Unit!13733)

(declare-fun lt!213080 () Unit!13733)

(assert (=> b!469837 (= lt!213081 lt!213080)))

(declare-fun lt!213077 () (_ BitVec 64))

(declare-fun lt!213083 () (_ BitVec 64))

(declare-fun lt!213078 () V!18531)

(declare-fun lt!213079 () ListLongMap!7603)

(assert (=> b!469837 (not (contains!2528 (+!1742 lt!213079 (tuple2!8701 lt!213077 lt!213078)) lt!213083))))

(declare-fun addStillNotContains!161 (ListLongMap!7603 (_ BitVec 64) V!18531 (_ BitVec 64)) Unit!13733)

(assert (=> b!469837 (= lt!213080 (addStillNotContains!161 lt!213079 lt!213077 lt!213078 lt!213083))))

(assert (=> b!469837 (= lt!213083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469837 (= lt!213078 (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469837 (= lt!213077 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469837 (= lt!213079 call!30399)))

(assert (=> b!469837 (= e!275181 (+!1742 call!30399 (tuple2!8701 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30396 () Bool)

(assert (=> bm!30396 (= call!30399 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469838 () Bool)

(assert (=> b!469838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> b!469838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14724 _values!833)))))

(assert (=> b!469838 (= e!275187 (= (apply!327 lt!213082 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469840 () Bool)

(assert (=> b!469840 (= e!275182 e!275184)))

(declare-fun c!56859 () Bool)

(assert (=> b!469840 (= c!56859 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun b!469841 () Bool)

(assert (=> b!469841 (= e!275184 (= lt!213082 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469839 () Bool)

(assert (=> b!469839 (= e!275183 e!275182)))

(declare-fun c!56860 () Bool)

(assert (=> b!469839 (= c!56860 e!275186)))

(declare-fun res!280788 () Bool)

(assert (=> b!469839 (=> (not res!280788) (not e!275186))))

(assert (=> b!469839 (= res!280788 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun d!75129 () Bool)

(assert (=> d!75129 e!275183))

(declare-fun res!280790 () Bool)

(assert (=> d!75129 (=> (not res!280790) (not e!275183))))

(assert (=> d!75129 (= res!280790 (not (contains!2528 lt!213082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75129 (= lt!213082 e!275185)))

(declare-fun c!56861 () Bool)

(assert (=> d!75129 (= c!56861 (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> d!75129 (validMask!0 mask!1365)))

(assert (=> d!75129 (= (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213082)))

(assert (= (and d!75129 c!56861) b!469830))

(assert (= (and d!75129 (not c!56861)) b!469832))

(assert (= (and b!469832 c!56858) b!469837))

(assert (= (and b!469832 (not c!56858)) b!469831))

(assert (= (or b!469837 b!469831) bm!30396))

(assert (= (and d!75129 res!280790) b!469836))

(assert (= (and b!469836 res!280787) b!469839))

(assert (= (and b!469839 res!280788) b!469835))

(assert (= (and b!469839 c!56860) b!469834))

(assert (= (and b!469839 (not c!56860)) b!469840))

(assert (= (and b!469834 res!280789) b!469838))

(assert (= (and b!469840 c!56859) b!469841))

(assert (= (and b!469840 (not c!56859)) b!469833))

(declare-fun b_lambda!10099 () Bool)

(assert (=> (not b_lambda!10099) (not b!469837)))

(assert (=> b!469837 t!14725))

(declare-fun b_and!20035 () Bool)

(assert (= b_and!20033 (and (=> t!14725 result!7407) b_and!20035)))

(declare-fun b_lambda!10101 () Bool)

(assert (=> (not b_lambda!10101) (not b!469838)))

(assert (=> b!469838 t!14725))

(declare-fun b_and!20037 () Bool)

(assert (= b_and!20035 (and (=> t!14725 result!7407) b_and!20037)))

(assert (=> b!469838 m!451567))

(declare-fun m!451713 () Bool)

(assert (=> b!469838 m!451713))

(assert (=> b!469838 m!451567))

(assert (=> b!469838 m!451575))

(assert (=> b!469838 m!451577))

(assert (=> b!469838 m!451579))

(assert (=> b!469838 m!451575))

(assert (=> b!469838 m!451577))

(assert (=> b!469835 m!451567))

(assert (=> b!469835 m!451567))

(assert (=> b!469835 m!451569))

(declare-fun m!451715 () Bool)

(assert (=> d!75129 m!451715))

(assert (=> d!75129 m!451497))

(declare-fun m!451717 () Bool)

(assert (=> b!469837 m!451717))

(declare-fun m!451719 () Bool)

(assert (=> b!469837 m!451719))

(assert (=> b!469837 m!451717))

(assert (=> b!469837 m!451567))

(declare-fun m!451721 () Bool)

(assert (=> b!469837 m!451721))

(declare-fun m!451723 () Bool)

(assert (=> b!469837 m!451723))

(assert (=> b!469837 m!451575))

(assert (=> b!469837 m!451577))

(assert (=> b!469837 m!451579))

(assert (=> b!469837 m!451575))

(assert (=> b!469837 m!451577))

(declare-fun m!451725 () Bool)

(assert (=> bm!30396 m!451725))

(assert (=> b!469834 m!451567))

(assert (=> b!469834 m!451567))

(declare-fun m!451727 () Bool)

(assert (=> b!469834 m!451727))

(assert (=> b!469832 m!451567))

(assert (=> b!469832 m!451567))

(assert (=> b!469832 m!451569))

(assert (=> b!469841 m!451725))

(declare-fun m!451729 () Bool)

(assert (=> b!469836 m!451729))

(declare-fun m!451731 () Bool)

(assert (=> b!469833 m!451731))

(assert (=> b!469656 d!75129))

(declare-fun b!469842 () Bool)

(declare-fun e!275192 () ListLongMap!7603)

(assert (=> b!469842 (= e!275192 (ListLongMap!7604 Nil!8768))))

(declare-fun b!469843 () Bool)

(declare-fun e!275188 () ListLongMap!7603)

(declare-fun call!30400 () ListLongMap!7603)

(assert (=> b!469843 (= e!275188 call!30400)))

(declare-fun b!469844 () Bool)

(assert (=> b!469844 (= e!275192 e!275188)))

(declare-fun c!56862 () Bool)

(assert (=> b!469844 (= c!56862 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469845 () Bool)

(declare-fun e!275191 () Bool)

(declare-fun lt!213089 () ListLongMap!7603)

(assert (=> b!469845 (= e!275191 (isEmpty!578 lt!213089))))

(declare-fun b!469846 () Bool)

(declare-fun e!275189 () Bool)

(declare-fun e!275194 () Bool)

(assert (=> b!469846 (= e!275189 e!275194)))

(assert (=> b!469846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun res!280793 () Bool)

(assert (=> b!469846 (= res!280793 (contains!2528 lt!213089 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469846 (=> (not res!280793) (not e!275194))))

(declare-fun b!469847 () Bool)

(declare-fun e!275193 () Bool)

(assert (=> b!469847 (= e!275193 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469847 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469848 () Bool)

(declare-fun res!280791 () Bool)

(declare-fun e!275190 () Bool)

(assert (=> b!469848 (=> (not res!280791) (not e!275190))))

(assert (=> b!469848 (= res!280791 (not (contains!2528 lt!213089 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469849 () Bool)

(declare-fun lt!213088 () Unit!13733)

(declare-fun lt!213087 () Unit!13733)

(assert (=> b!469849 (= lt!213088 lt!213087)))

(declare-fun lt!213086 () ListLongMap!7603)

(declare-fun lt!213085 () V!18531)

(declare-fun lt!213084 () (_ BitVec 64))

(declare-fun lt!213090 () (_ BitVec 64))

(assert (=> b!469849 (not (contains!2528 (+!1742 lt!213086 (tuple2!8701 lt!213084 lt!213085)) lt!213090))))

(assert (=> b!469849 (= lt!213087 (addStillNotContains!161 lt!213086 lt!213084 lt!213085 lt!213090))))

(assert (=> b!469849 (= lt!213090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469849 (= lt!213085 (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469849 (= lt!213084 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469849 (= lt!213086 call!30400)))

(assert (=> b!469849 (= e!275188 (+!1742 call!30400 (tuple2!8701 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30397 () Bool)

(assert (=> bm!30397 (= call!30400 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469850 () Bool)

(assert (=> b!469850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> b!469850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14724 _values!833)))))

(assert (=> b!469850 (= e!275194 (= (apply!327 lt!213089 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)) (get!7026 (select (arr!14371 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469852 () Bool)

(assert (=> b!469852 (= e!275189 e!275191)))

(declare-fun c!56863 () Bool)

(assert (=> b!469852 (= c!56863 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun b!469853 () Bool)

(assert (=> b!469853 (= e!275191 (= lt!213089 (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469851 () Bool)

(assert (=> b!469851 (= e!275190 e!275189)))

(declare-fun c!56864 () Bool)

(assert (=> b!469851 (= c!56864 e!275193)))

(declare-fun res!280792 () Bool)

(assert (=> b!469851 (=> (not res!280792) (not e!275193))))

(assert (=> b!469851 (= res!280792 (bvslt #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(declare-fun d!75131 () Bool)

(assert (=> d!75131 e!275190))

(declare-fun res!280794 () Bool)

(assert (=> d!75131 (=> (not res!280794) (not e!275190))))

(assert (=> d!75131 (= res!280794 (not (contains!2528 lt!213089 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75131 (= lt!213089 e!275192)))

(declare-fun c!56865 () Bool)

(assert (=> d!75131 (= c!56865 (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> d!75131 (validMask!0 mask!1365)))

(assert (=> d!75131 (= (getCurrentListMapNoExtraKeys!1993 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213089)))

(assert (= (and d!75131 c!56865) b!469842))

(assert (= (and d!75131 (not c!56865)) b!469844))

(assert (= (and b!469844 c!56862) b!469849))

(assert (= (and b!469844 (not c!56862)) b!469843))

(assert (= (or b!469849 b!469843) bm!30397))

(assert (= (and d!75131 res!280794) b!469848))

(assert (= (and b!469848 res!280791) b!469851))

(assert (= (and b!469851 res!280792) b!469847))

(assert (= (and b!469851 c!56864) b!469846))

(assert (= (and b!469851 (not c!56864)) b!469852))

(assert (= (and b!469846 res!280793) b!469850))

(assert (= (and b!469852 c!56863) b!469853))

(assert (= (and b!469852 (not c!56863)) b!469845))

(declare-fun b_lambda!10103 () Bool)

(assert (=> (not b_lambda!10103) (not b!469849)))

(assert (=> b!469849 t!14725))

(declare-fun b_and!20039 () Bool)

(assert (= b_and!20037 (and (=> t!14725 result!7407) b_and!20039)))

(declare-fun b_lambda!10105 () Bool)

(assert (=> (not b_lambda!10105) (not b!469850)))

(assert (=> b!469850 t!14725))

(declare-fun b_and!20041 () Bool)

(assert (= b_and!20039 (and (=> t!14725 result!7407) b_and!20041)))

(assert (=> b!469850 m!451567))

(declare-fun m!451733 () Bool)

(assert (=> b!469850 m!451733))

(assert (=> b!469850 m!451567))

(assert (=> b!469850 m!451575))

(assert (=> b!469850 m!451577))

(assert (=> b!469850 m!451579))

(assert (=> b!469850 m!451575))

(assert (=> b!469850 m!451577))

(assert (=> b!469847 m!451567))

(assert (=> b!469847 m!451567))

(assert (=> b!469847 m!451569))

(declare-fun m!451735 () Bool)

(assert (=> d!75131 m!451735))

(assert (=> d!75131 m!451497))

(declare-fun m!451737 () Bool)

(assert (=> b!469849 m!451737))

(declare-fun m!451739 () Bool)

(assert (=> b!469849 m!451739))

(assert (=> b!469849 m!451737))

(assert (=> b!469849 m!451567))

(declare-fun m!451741 () Bool)

(assert (=> b!469849 m!451741))

(declare-fun m!451743 () Bool)

(assert (=> b!469849 m!451743))

(assert (=> b!469849 m!451575))

(assert (=> b!469849 m!451577))

(assert (=> b!469849 m!451579))

(assert (=> b!469849 m!451575))

(assert (=> b!469849 m!451577))

(declare-fun m!451745 () Bool)

(assert (=> bm!30397 m!451745))

(assert (=> b!469846 m!451567))

(assert (=> b!469846 m!451567))

(declare-fun m!451747 () Bool)

(assert (=> b!469846 m!451747))

(assert (=> b!469844 m!451567))

(assert (=> b!469844 m!451567))

(assert (=> b!469844 m!451569))

(assert (=> b!469853 m!451745))

(declare-fun m!451749 () Bool)

(assert (=> b!469848 m!451749))

(declare-fun m!451751 () Bool)

(assert (=> b!469845 m!451751))

(assert (=> b!469656 d!75131))

(declare-fun d!75133 () Bool)

(assert (=> d!75133 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42074 d!75133))

(declare-fun d!75135 () Bool)

(assert (=> d!75135 (= (array_inv!10454 _keys!1025) (bvsge (size!14723 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42074 d!75135))

(declare-fun d!75137 () Bool)

(assert (=> d!75137 (= (array_inv!10455 _values!833) (bvsge (size!14724 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42074 d!75137))

(declare-fun b!469864 () Bool)

(declare-fun e!275206 () Bool)

(declare-fun call!30403 () Bool)

(assert (=> b!469864 (= e!275206 call!30403)))

(declare-fun b!469865 () Bool)

(declare-fun e!275205 () Bool)

(assert (=> b!469865 (= e!275205 e!275206)))

(declare-fun c!56868 () Bool)

(assert (=> b!469865 (= c!56868 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469866 () Bool)

(assert (=> b!469866 (= e!275206 call!30403)))

(declare-fun bm!30400 () Bool)

(assert (=> bm!30400 (= call!30403 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56868 (Cons!8766 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000) Nil!8767) Nil!8767)))))

(declare-fun d!75139 () Bool)

(declare-fun res!280803 () Bool)

(declare-fun e!275204 () Bool)

(assert (=> d!75139 (=> res!280803 e!275204)))

(assert (=> d!75139 (= res!280803 (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> d!75139 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8767) e!275204)))

(declare-fun b!469867 () Bool)

(assert (=> b!469867 (= e!275204 e!275205)))

(declare-fun res!280802 () Bool)

(assert (=> b!469867 (=> (not res!280802) (not e!275205))))

(declare-fun e!275203 () Bool)

(assert (=> b!469867 (= res!280802 (not e!275203))))

(declare-fun res!280801 () Bool)

(assert (=> b!469867 (=> (not res!280801) (not e!275203))))

(assert (=> b!469867 (= res!280801 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469868 () Bool)

(declare-fun contains!2530 (List!8770 (_ BitVec 64)) Bool)

(assert (=> b!469868 (= e!275203 (contains!2530 Nil!8767 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75139 (not res!280803)) b!469867))

(assert (= (and b!469867 res!280801) b!469868))

(assert (= (and b!469867 res!280802) b!469865))

(assert (= (and b!469865 c!56868) b!469866))

(assert (= (and b!469865 (not c!56868)) b!469864))

(assert (= (or b!469866 b!469864) bm!30400))

(assert (=> b!469865 m!451567))

(assert (=> b!469865 m!451567))

(assert (=> b!469865 m!451569))

(assert (=> bm!30400 m!451567))

(declare-fun m!451753 () Bool)

(assert (=> bm!30400 m!451753))

(assert (=> b!469867 m!451567))

(assert (=> b!469867 m!451567))

(assert (=> b!469867 m!451569))

(assert (=> b!469868 m!451567))

(assert (=> b!469868 m!451567))

(declare-fun m!451755 () Bool)

(assert (=> b!469868 m!451755))

(assert (=> b!469655 d!75139))

(declare-fun b!469877 () Bool)

(declare-fun e!275214 () Bool)

(declare-fun call!30406 () Bool)

(assert (=> b!469877 (= e!275214 call!30406)))

(declare-fun bm!30403 () Bool)

(assert (=> bm!30403 (= call!30406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!469878 () Bool)

(declare-fun e!275213 () Bool)

(assert (=> b!469878 (= e!275214 e!275213)))

(declare-fun lt!213099 () (_ BitVec 64))

(assert (=> b!469878 (= lt!213099 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213097 () Unit!13733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29891 (_ BitVec 64) (_ BitVec 32)) Unit!13733)

(assert (=> b!469878 (= lt!213097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213099 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!469878 (arrayContainsKey!0 _keys!1025 lt!213099 #b00000000000000000000000000000000)))

(declare-fun lt!213098 () Unit!13733)

(assert (=> b!469878 (= lt!213098 lt!213097)))

(declare-fun res!280809 () Bool)

(declare-datatypes ((SeekEntryResult!3546 0))(
  ( (MissingZero!3546 (index!16363 (_ BitVec 32))) (Found!3546 (index!16364 (_ BitVec 32))) (Intermediate!3546 (undefined!4358 Bool) (index!16365 (_ BitVec 32)) (x!43994 (_ BitVec 32))) (Undefined!3546) (MissingVacant!3546 (index!16366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29891 (_ BitVec 32)) SeekEntryResult!3546)

(assert (=> b!469878 (= res!280809 (= (seekEntryOrOpen!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3546 #b00000000000000000000000000000000)))))

(assert (=> b!469878 (=> (not res!280809) (not e!275213))))

(declare-fun b!469879 () Bool)

(declare-fun e!275215 () Bool)

(assert (=> b!469879 (= e!275215 e!275214)))

(declare-fun c!56871 () Bool)

(assert (=> b!469879 (= c!56871 (validKeyInArray!0 (select (arr!14370 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75141 () Bool)

(declare-fun res!280808 () Bool)

(assert (=> d!75141 (=> res!280808 e!275215)))

(assert (=> d!75141 (= res!280808 (bvsge #b00000000000000000000000000000000 (size!14723 _keys!1025)))))

(assert (=> d!75141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275215)))

(declare-fun b!469880 () Bool)

(assert (=> b!469880 (= e!275213 call!30406)))

(assert (= (and d!75141 (not res!280808)) b!469879))

(assert (= (and b!469879 c!56871) b!469878))

(assert (= (and b!469879 (not c!56871)) b!469877))

(assert (= (and b!469878 res!280809) b!469880))

(assert (= (or b!469880 b!469877) bm!30403))

(declare-fun m!451757 () Bool)

(assert (=> bm!30403 m!451757))

(assert (=> b!469878 m!451567))

(declare-fun m!451759 () Bool)

(assert (=> b!469878 m!451759))

(declare-fun m!451761 () Bool)

(assert (=> b!469878 m!451761))

(assert (=> b!469878 m!451567))

(declare-fun m!451763 () Bool)

(assert (=> b!469878 m!451763))

(assert (=> b!469879 m!451567))

(assert (=> b!469879 m!451567))

(assert (=> b!469879 m!451569))

(assert (=> b!469654 d!75141))

(declare-fun condMapEmpty!21310 () Bool)

(declare-fun mapDefault!21310 () ValueCell!6191)

(assert (=> mapNonEmpty!21301 (= condMapEmpty!21310 (= mapRest!21301 ((as const (Array (_ BitVec 32) ValueCell!6191)) mapDefault!21310)))))

(declare-fun e!275220 () Bool)

(declare-fun mapRes!21310 () Bool)

(assert (=> mapNonEmpty!21301 (= tp!40941 (and e!275220 mapRes!21310))))

(declare-fun b!469887 () Bool)

(declare-fun e!275221 () Bool)

(assert (=> b!469887 (= e!275221 tp_is_empty!13069)))

(declare-fun b!469888 () Bool)

(assert (=> b!469888 (= e!275220 tp_is_empty!13069)))

(declare-fun mapIsEmpty!21310 () Bool)

(assert (=> mapIsEmpty!21310 mapRes!21310))

(declare-fun mapNonEmpty!21310 () Bool)

(declare-fun tp!40957 () Bool)

(assert (=> mapNonEmpty!21310 (= mapRes!21310 (and tp!40957 e!275221))))

(declare-fun mapKey!21310 () (_ BitVec 32))

(declare-fun mapValue!21310 () ValueCell!6191)

(declare-fun mapRest!21310 () (Array (_ BitVec 32) ValueCell!6191))

(assert (=> mapNonEmpty!21310 (= mapRest!21301 (store mapRest!21310 mapKey!21310 mapValue!21310))))

(assert (= (and mapNonEmpty!21301 condMapEmpty!21310) mapIsEmpty!21310))

(assert (= (and mapNonEmpty!21301 (not condMapEmpty!21310)) mapNonEmpty!21310))

(assert (= (and mapNonEmpty!21310 ((_ is ValueCellFull!6191) mapValue!21310)) b!469887))

(assert (= (and mapNonEmpty!21301 ((_ is ValueCellFull!6191) mapDefault!21310)) b!469888))

(declare-fun m!451765 () Bool)

(assert (=> mapNonEmpty!21310 m!451765))

(declare-fun b_lambda!10107 () Bool)

(assert (= b_lambda!10105 (or (and start!42074 b_free!11641) b_lambda!10107)))

(declare-fun b_lambda!10109 () Bool)

(assert (= b_lambda!10095 (or (and start!42074 b_free!11641) b_lambda!10109)))

(declare-fun b_lambda!10111 () Bool)

(assert (= b_lambda!10099 (or (and start!42074 b_free!11641) b_lambda!10111)))

(declare-fun b_lambda!10113 () Bool)

(assert (= b_lambda!10103 (or (and start!42074 b_free!11641) b_lambda!10113)))

(declare-fun b_lambda!10115 () Bool)

(assert (= b_lambda!10101 (or (and start!42074 b_free!11641) b_lambda!10115)))

(declare-fun b_lambda!10117 () Bool)

(assert (= b_lambda!10097 (or (and start!42074 b_free!11641) b_lambda!10117)))

(check-sat (not b!469799) (not bm!30392) (not b!469765) (not bm!30396) (not b!469782) (not b!469878) (not d!75123) (not b!469789) (not d!75127) (not b!469846) b_and!20041 (not b!469754) (not b!469784) (not b!469844) (not b!469838) (not bm!30387) (not b!469781) (not bm!30385) (not b!469845) (not mapNonEmpty!21310) (not bm!30381) (not b!469795) (not b!469847) (not b_lambda!10107) (not b!469848) (not bm!30397) (not b!469837) (not bm!30388) (not b!469753) (not b!469796) (not b!469868) (not b!469764) (not b!469780) (not bm!30403) (not b!469768) (not b!469762) (not bm!30380) (not b!469849) (not b_lambda!10115) (not d!75131) (not b!469834) (not b_lambda!10113) (not d!75125) (not b!469841) (not b!469803) (not b!469867) (not d!75121) (not b!469804) (not b!469779) (not b!469833) (not b_lambda!10109) (not bm!30382) (not bm!30400) (not b!469850) (not b!469793) (not b_next!11641) (not b!469879) (not b!469758) (not d!75119) (not d!75117) (not b!469805) (not b!469865) (not b_lambda!10111) (not d!75129) tp_is_empty!13069 (not b!469772) (not b!469832) (not b_lambda!10117) (not d!75115) (not b!469785) (not b!469853) (not b!469836) (not b!469835) (not bm!30389))
(check-sat b_and!20041 (not b_next!11641))
