; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43288 () Bool)

(assert start!43288)

(declare-fun b_free!12169 () Bool)

(declare-fun b_next!12169 () Bool)

(assert (=> start!43288 (= b_free!12169 (not b_next!12169))))

(declare-fun tp!42777 () Bool)

(declare-fun b_and!20931 () Bool)

(assert (=> start!43288 (= tp!42777 b_and!20931)))

(declare-fun b!479688 () Bool)

(declare-fun e!282247 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479688 (= e!282247 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22219 () Bool)

(declare-fun mapRes!22219 () Bool)

(declare-fun tp!42778 () Bool)

(declare-fun e!282249 () Bool)

(assert (=> mapNonEmpty!22219 (= mapRes!22219 (and tp!42778 e!282249))))

(declare-datatypes ((V!19313 0))(
  ( (V!19314 (val!6888 Int)) )
))
(declare-datatypes ((ValueCell!6479 0))(
  ( (ValueCellFull!6479 (v!9178 V!19313)) (EmptyCell!6479) )
))
(declare-fun mapValue!22219 () ValueCell!6479)

(declare-fun mapRest!22219 () (Array (_ BitVec 32) ValueCell!6479))

(declare-datatypes ((array!31014 0))(
  ( (array!31015 (arr!14913 (Array (_ BitVec 32) ValueCell!6479)) (size!15271 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31014)

(declare-fun mapKey!22219 () (_ BitVec 32))

(assert (=> mapNonEmpty!22219 (= (arr!14913 _values!1516) (store mapRest!22219 mapKey!22219 mapValue!22219))))

(declare-fun b!479689 () Bool)

(declare-fun e!282248 () Bool)

(declare-datatypes ((array!31016 0))(
  ( (array!31017 (arr!14914 (Array (_ BitVec 32) (_ BitVec 64))) (size!15272 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31016)

(assert (=> b!479689 (= e!282248 (not (and (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)) (bvslt (size!15272 _keys!1874) #b01111111111111111111111111111111))))))

(assert (=> b!479689 e!282247))

(declare-fun c!57652 () Bool)

(assert (=> b!479689 (= c!57652 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19313)

(declare-fun zeroValue!1458 () V!19313)

(declare-datatypes ((Unit!14039 0))(
  ( (Unit!14040) )
))
(declare-fun lt!217918 () Unit!14039)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!115 (array!31016 array!31014 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 64) Int) Unit!14039)

(assert (=> b!479689 (= lt!217918 (lemmaKeyInListMapIsInArray!115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!479690 () Bool)

(declare-fun res!286158 () Bool)

(assert (=> b!479690 (=> (not res!286158) (not e!282248))))

(declare-datatypes ((List!9027 0))(
  ( (Nil!9024) (Cons!9023 (h!9879 (_ BitVec 64)) (t!15225 List!9027)) )
))
(declare-fun arrayNoDuplicates!0 (array!31016 (_ BitVec 32) List!9027) Bool)

(assert (=> b!479690 (= res!286158 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9024))))

(declare-fun b!479691 () Bool)

(declare-fun e!282246 () Bool)

(declare-fun tp_is_empty!13681 () Bool)

(assert (=> b!479691 (= e!282246 tp_is_empty!13681)))

(declare-fun mapIsEmpty!22219 () Bool)

(assert (=> mapIsEmpty!22219 mapRes!22219))

(declare-fun b!479692 () Bool)

(declare-fun res!286163 () Bool)

(assert (=> b!479692 (=> (not res!286163) (not e!282248))))

(declare-datatypes ((tuple2!8958 0))(
  ( (tuple2!8959 (_1!4490 (_ BitVec 64)) (_2!4490 V!19313)) )
))
(declare-datatypes ((List!9028 0))(
  ( (Nil!9025) (Cons!9024 (h!9880 tuple2!8958) (t!15226 List!9028)) )
))
(declare-datatypes ((ListLongMap!7873 0))(
  ( (ListLongMap!7874 (toList!3952 List!9028)) )
))
(declare-fun contains!2580 (ListLongMap!7873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2266 (array!31016 array!31014 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 32) Int) ListLongMap!7873)

(assert (=> b!479692 (= res!286163 (contains!2580 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479693 () Bool)

(declare-fun arrayContainsKey!0 (array!31016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479693 (= e!282247 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479694 () Bool)

(declare-fun res!286161 () Bool)

(assert (=> b!479694 (=> (not res!286161) (not e!282248))))

(assert (=> b!479694 (= res!286161 (and (= (size!15271 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15272 _keys!1874) (size!15271 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286160 () Bool)

(assert (=> start!43288 (=> (not res!286160) (not e!282248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43288 (= res!286160 (validMask!0 mask!2352))))

(assert (=> start!43288 e!282248))

(assert (=> start!43288 true))

(assert (=> start!43288 tp_is_empty!13681))

(declare-fun e!282245 () Bool)

(declare-fun array_inv!10832 (array!31014) Bool)

(assert (=> start!43288 (and (array_inv!10832 _values!1516) e!282245)))

(assert (=> start!43288 tp!42777))

(declare-fun array_inv!10833 (array!31016) Bool)

(assert (=> start!43288 (array_inv!10833 _keys!1874)))

(declare-fun b!479695 () Bool)

(assert (=> b!479695 (= e!282249 tp_is_empty!13681)))

(declare-fun b!479696 () Bool)

(declare-fun res!286159 () Bool)

(assert (=> b!479696 (=> (not res!286159) (not e!282248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31016 (_ BitVec 32)) Bool)

(assert (=> b!479696 (= res!286159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479697 () Bool)

(assert (=> b!479697 (= e!282245 (and e!282246 mapRes!22219))))

(declare-fun condMapEmpty!22219 () Bool)

(declare-fun mapDefault!22219 () ValueCell!6479)

(assert (=> b!479697 (= condMapEmpty!22219 (= (arr!14913 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6479)) mapDefault!22219)))))

(declare-fun b!479698 () Bool)

(declare-fun res!286162 () Bool)

(assert (=> b!479698 (=> (not res!286162) (not e!282248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479698 (= res!286162 (validKeyInArray!0 k0!1332))))

(assert (= (and start!43288 res!286160) b!479694))

(assert (= (and b!479694 res!286161) b!479696))

(assert (= (and b!479696 res!286159) b!479690))

(assert (= (and b!479690 res!286158) b!479692))

(assert (= (and b!479692 res!286163) b!479698))

(assert (= (and b!479698 res!286162) b!479689))

(assert (= (and b!479689 c!57652) b!479693))

(assert (= (and b!479689 (not c!57652)) b!479688))

(assert (= (and b!479697 condMapEmpty!22219) mapIsEmpty!22219))

(assert (= (and b!479697 (not condMapEmpty!22219)) mapNonEmpty!22219))

(get-info :version)

(assert (= (and mapNonEmpty!22219 ((_ is ValueCellFull!6479) mapValue!22219)) b!479695))

(assert (= (and b!479697 ((_ is ValueCellFull!6479) mapDefault!22219)) b!479691))

(assert (= start!43288 b!479697))

(declare-fun m!461797 () Bool)

(assert (=> b!479696 m!461797))

(declare-fun m!461799 () Bool)

(assert (=> start!43288 m!461799))

(declare-fun m!461801 () Bool)

(assert (=> start!43288 m!461801))

(declare-fun m!461803 () Bool)

(assert (=> start!43288 m!461803))

(declare-fun m!461805 () Bool)

(assert (=> b!479692 m!461805))

(assert (=> b!479692 m!461805))

(declare-fun m!461807 () Bool)

(assert (=> b!479692 m!461807))

(declare-fun m!461809 () Bool)

(assert (=> b!479689 m!461809))

(declare-fun m!461811 () Bool)

(assert (=> b!479690 m!461811))

(declare-fun m!461813 () Bool)

(assert (=> b!479693 m!461813))

(declare-fun m!461815 () Bool)

(assert (=> b!479698 m!461815))

(declare-fun m!461817 () Bool)

(assert (=> mapNonEmpty!22219 m!461817))

(check-sat (not start!43288) (not b!479693) (not b_next!12169) tp_is_empty!13681 b_and!20931 (not b!479690) (not mapNonEmpty!22219) (not b!479698) (not b!479689) (not b!479696) (not b!479692))
(check-sat b_and!20931 (not b_next!12169))
(get-model)

(declare-fun d!76711 () Bool)

(assert (=> d!76711 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479698 d!76711))

(declare-fun d!76713 () Bool)

(declare-fun res!286204 () Bool)

(declare-fun e!282290 () Bool)

(assert (=> d!76713 (=> res!286204 e!282290)))

(assert (=> d!76713 (= res!286204 (= (select (arr!14914 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76713 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282290)))

(declare-fun b!479769 () Bool)

(declare-fun e!282291 () Bool)

(assert (=> b!479769 (= e!282290 e!282291)))

(declare-fun res!286205 () Bool)

(assert (=> b!479769 (=> (not res!286205) (not e!282291))))

(assert (=> b!479769 (= res!286205 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15272 _keys!1874)))))

(declare-fun b!479770 () Bool)

(assert (=> b!479770 (= e!282291 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76713 (not res!286204)) b!479769))

(assert (= (and b!479769 res!286205) b!479770))

(declare-fun m!461863 () Bool)

(assert (=> d!76713 m!461863))

(declare-fun m!461865 () Bool)

(assert (=> b!479770 m!461865))

(assert (=> b!479693 d!76713))

(declare-fun d!76715 () Bool)

(declare-fun e!282296 () Bool)

(assert (=> d!76715 e!282296))

(declare-fun res!286208 () Bool)

(assert (=> d!76715 (=> res!286208 e!282296)))

(declare-fun lt!217934 () Bool)

(assert (=> d!76715 (= res!286208 (not lt!217934))))

(declare-fun lt!217933 () Bool)

(assert (=> d!76715 (= lt!217934 lt!217933)))

(declare-fun lt!217935 () Unit!14039)

(declare-fun e!282297 () Unit!14039)

(assert (=> d!76715 (= lt!217935 e!282297)))

(declare-fun c!57661 () Bool)

(assert (=> d!76715 (= c!57661 lt!217933)))

(declare-fun containsKey!354 (List!9028 (_ BitVec 64)) Bool)

(assert (=> d!76715 (= lt!217933 (containsKey!354 (toList!3952 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76715 (= (contains!2580 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!217934)))

(declare-fun b!479777 () Bool)

(declare-fun lt!217936 () Unit!14039)

(assert (=> b!479777 (= e!282297 lt!217936)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!302 (List!9028 (_ BitVec 64)) Unit!14039)

(assert (=> b!479777 (= lt!217936 (lemmaContainsKeyImpliesGetValueByKeyDefined!302 (toList!3952 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!399 0))(
  ( (Some!398 (v!9181 V!19313)) (None!397) )
))
(declare-fun isDefined!303 (Option!399) Bool)

(declare-fun getValueByKey!393 (List!9028 (_ BitVec 64)) Option!399)

(assert (=> b!479777 (isDefined!303 (getValueByKey!393 (toList!3952 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!479778 () Bool)

(declare-fun Unit!14041 () Unit!14039)

(assert (=> b!479778 (= e!282297 Unit!14041)))

(declare-fun b!479779 () Bool)

(assert (=> b!479779 (= e!282296 (isDefined!303 (getValueByKey!393 (toList!3952 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76715 c!57661) b!479777))

(assert (= (and d!76715 (not c!57661)) b!479778))

(assert (= (and d!76715 (not res!286208)) b!479779))

(declare-fun m!461867 () Bool)

(assert (=> d!76715 m!461867))

(declare-fun m!461869 () Bool)

(assert (=> b!479777 m!461869))

(declare-fun m!461871 () Bool)

(assert (=> b!479777 m!461871))

(assert (=> b!479777 m!461871))

(declare-fun m!461873 () Bool)

(assert (=> b!479777 m!461873))

(assert (=> b!479779 m!461871))

(assert (=> b!479779 m!461871))

(assert (=> b!479779 m!461873))

(assert (=> b!479692 d!76715))

(declare-fun bm!30845 () Bool)

(declare-fun call!30850 () ListLongMap!7873)

(declare-fun call!30851 () ListLongMap!7873)

(assert (=> bm!30845 (= call!30850 call!30851)))

(declare-fun bm!30846 () Bool)

(declare-fun call!30853 () ListLongMap!7873)

(declare-fun getCurrentListMapNoExtraKeys!2123 (array!31016 array!31014 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 32) Int) ListLongMap!7873)

(assert (=> bm!30846 (= call!30853 (getCurrentListMapNoExtraKeys!2123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!479822 () Bool)

(declare-fun e!282325 () Bool)

(declare-fun e!282324 () Bool)

(assert (=> b!479822 (= e!282325 e!282324)))

(declare-fun c!57678 () Bool)

(assert (=> b!479822 (= c!57678 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479823 () Bool)

(declare-fun e!282334 () Bool)

(assert (=> b!479823 (= e!282334 (validKeyInArray!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479824 () Bool)

(declare-fun e!282335 () ListLongMap!7873)

(declare-fun e!282333 () ListLongMap!7873)

(assert (=> b!479824 (= e!282335 e!282333)))

(declare-fun c!57677 () Bool)

(assert (=> b!479824 (= c!57677 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!30849 () ListLongMap!7873)

(declare-fun call!30852 () ListLongMap!7873)

(declare-fun c!57676 () Bool)

(declare-fun bm!30848 () Bool)

(declare-fun +!1778 (ListLongMap!7873 tuple2!8958) ListLongMap!7873)

(assert (=> bm!30848 (= call!30851 (+!1778 (ite c!57676 call!30853 (ite c!57677 call!30849 call!30852)) (ite (or c!57676 c!57677) (tuple2!8959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!479825 () Bool)

(declare-fun e!282330 () Bool)

(declare-fun lt!217989 () ListLongMap!7873)

(declare-fun apply!339 (ListLongMap!7873 (_ BitVec 64)) V!19313)

(assert (=> b!479825 (= e!282330 (= (apply!339 lt!217989 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!479826 () Bool)

(declare-fun e!282336 () ListLongMap!7873)

(assert (=> b!479826 (= e!282336 call!30852)))

(declare-fun b!479827 () Bool)

(declare-fun e!282332 () Bool)

(assert (=> b!479827 (= e!282332 (validKeyInArray!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479828 () Bool)

(declare-fun res!286235 () Bool)

(assert (=> b!479828 (=> (not res!286235) (not e!282325))))

(declare-fun e!282327 () Bool)

(assert (=> b!479828 (= res!286235 e!282327)))

(declare-fun c!57679 () Bool)

(assert (=> b!479828 (= c!57679 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!479829 () Bool)

(assert (=> b!479829 (= e!282335 (+!1778 call!30851 (tuple2!8959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!479830 () Bool)

(declare-fun call!30854 () Bool)

(assert (=> b!479830 (= e!282327 (not call!30854))))

(declare-fun b!479831 () Bool)

(declare-fun e!282329 () Unit!14039)

(declare-fun lt!217995 () Unit!14039)

(assert (=> b!479831 (= e!282329 lt!217995)))

(declare-fun lt!217986 () ListLongMap!7873)

(assert (=> b!479831 (= lt!217986 (getCurrentListMapNoExtraKeys!2123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217997 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217998 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217998 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217982 () Unit!14039)

(declare-fun addStillContains!297 (ListLongMap!7873 (_ BitVec 64) V!19313 (_ BitVec 64)) Unit!14039)

(assert (=> b!479831 (= lt!217982 (addStillContains!297 lt!217986 lt!217997 zeroValue!1458 lt!217998))))

(assert (=> b!479831 (contains!2580 (+!1778 lt!217986 (tuple2!8959 lt!217997 zeroValue!1458)) lt!217998)))

(declare-fun lt!217996 () Unit!14039)

(assert (=> b!479831 (= lt!217996 lt!217982)))

(declare-fun lt!217993 () ListLongMap!7873)

(assert (=> b!479831 (= lt!217993 (getCurrentListMapNoExtraKeys!2123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218000 () (_ BitVec 64))

(assert (=> b!479831 (= lt!218000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217985 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217985 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218002 () Unit!14039)

(declare-fun addApplyDifferent!297 (ListLongMap!7873 (_ BitVec 64) V!19313 (_ BitVec 64)) Unit!14039)

(assert (=> b!479831 (= lt!218002 (addApplyDifferent!297 lt!217993 lt!218000 minValue!1458 lt!217985))))

(assert (=> b!479831 (= (apply!339 (+!1778 lt!217993 (tuple2!8959 lt!218000 minValue!1458)) lt!217985) (apply!339 lt!217993 lt!217985))))

(declare-fun lt!218001 () Unit!14039)

(assert (=> b!479831 (= lt!218001 lt!218002)))

(declare-fun lt!217992 () ListLongMap!7873)

(assert (=> b!479831 (= lt!217992 (getCurrentListMapNoExtraKeys!2123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217999 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217984 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217984 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217981 () Unit!14039)

(assert (=> b!479831 (= lt!217981 (addApplyDifferent!297 lt!217992 lt!217999 zeroValue!1458 lt!217984))))

(assert (=> b!479831 (= (apply!339 (+!1778 lt!217992 (tuple2!8959 lt!217999 zeroValue!1458)) lt!217984) (apply!339 lt!217992 lt!217984))))

(declare-fun lt!217988 () Unit!14039)

(assert (=> b!479831 (= lt!217988 lt!217981)))

(declare-fun lt!217987 () ListLongMap!7873)

(assert (=> b!479831 (= lt!217987 (getCurrentListMapNoExtraKeys!2123 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217991 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217990 () (_ BitVec 64))

(assert (=> b!479831 (= lt!217990 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!479831 (= lt!217995 (addApplyDifferent!297 lt!217987 lt!217991 minValue!1458 lt!217990))))

(assert (=> b!479831 (= (apply!339 (+!1778 lt!217987 (tuple2!8959 lt!217991 minValue!1458)) lt!217990) (apply!339 lt!217987 lt!217990))))

(declare-fun b!479832 () Bool)

(assert (=> b!479832 (= e!282327 e!282330)))

(declare-fun res!286230 () Bool)

(assert (=> b!479832 (= res!286230 call!30854)))

(assert (=> b!479832 (=> (not res!286230) (not e!282330))))

(declare-fun b!479833 () Bool)

(declare-fun Unit!14042 () Unit!14039)

(assert (=> b!479833 (= e!282329 Unit!14042)))

(declare-fun b!479834 () Bool)

(declare-fun e!282328 () Bool)

(assert (=> b!479834 (= e!282328 (= (apply!339 lt!217989 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!479835 () Bool)

(declare-fun e!282331 () Bool)

(declare-fun e!282326 () Bool)

(assert (=> b!479835 (= e!282331 e!282326)))

(declare-fun res!286233 () Bool)

(assert (=> b!479835 (=> (not res!286233) (not e!282326))))

(assert (=> b!479835 (= res!286233 (contains!2580 lt!217989 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!479835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(declare-fun b!479836 () Bool)

(declare-fun call!30848 () Bool)

(assert (=> b!479836 (= e!282324 (not call!30848))))

(declare-fun bm!30849 () Bool)

(assert (=> bm!30849 (= call!30854 (contains!2580 lt!217989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479837 () Bool)

(assert (=> b!479837 (= e!282336 call!30850)))

(declare-fun bm!30850 () Bool)

(assert (=> bm!30850 (= call!30848 (contains!2580 lt!217989 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479838 () Bool)

(declare-fun res!286231 () Bool)

(assert (=> b!479838 (=> (not res!286231) (not e!282325))))

(assert (=> b!479838 (= res!286231 e!282331)))

(declare-fun res!286228 () Bool)

(assert (=> b!479838 (=> res!286228 e!282331)))

(assert (=> b!479838 (= res!286228 (not e!282332))))

(declare-fun res!286229 () Bool)

(assert (=> b!479838 (=> (not res!286229) (not e!282332))))

(assert (=> b!479838 (= res!286229 (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(declare-fun d!76717 () Bool)

(assert (=> d!76717 e!282325))

(declare-fun res!286227 () Bool)

(assert (=> d!76717 (=> (not res!286227) (not e!282325))))

(assert (=> d!76717 (= res!286227 (or (bvsge #b00000000000000000000000000000000 (size!15272 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)))))))

(declare-fun lt!217994 () ListLongMap!7873)

(assert (=> d!76717 (= lt!217989 lt!217994)))

(declare-fun lt!217983 () Unit!14039)

(assert (=> d!76717 (= lt!217983 e!282329)))

(declare-fun c!57674 () Bool)

(assert (=> d!76717 (= c!57674 e!282334)))

(declare-fun res!286232 () Bool)

(assert (=> d!76717 (=> (not res!286232) (not e!282334))))

(assert (=> d!76717 (= res!286232 (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(assert (=> d!76717 (= lt!217994 e!282335)))

(assert (=> d!76717 (= c!57676 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76717 (validMask!0 mask!2352)))

(assert (=> d!76717 (= (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!217989)))

(declare-fun bm!30847 () Bool)

(assert (=> bm!30847 (= call!30852 call!30849)))

(declare-fun b!479839 () Bool)

(assert (=> b!479839 (= e!282324 e!282328)))

(declare-fun res!286234 () Bool)

(assert (=> b!479839 (= res!286234 call!30848)))

(assert (=> b!479839 (=> (not res!286234) (not e!282328))))

(declare-fun b!479840 () Bool)

(assert (=> b!479840 (= e!282333 call!30850)))

(declare-fun b!479841 () Bool)

(declare-fun get!7241 (ValueCell!6479 V!19313) V!19313)

(declare-fun dynLambda!947 (Int (_ BitVec 64)) V!19313)

(assert (=> b!479841 (= e!282326 (= (apply!339 lt!217989 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)) (get!7241 (select (arr!14913 _values!1516) #b00000000000000000000000000000000) (dynLambda!947 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15271 _values!1516)))))

(assert (=> b!479841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(declare-fun bm!30851 () Bool)

(assert (=> bm!30851 (= call!30849 call!30853)))

(declare-fun b!479842 () Bool)

(declare-fun c!57675 () Bool)

(assert (=> b!479842 (= c!57675 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!479842 (= e!282333 e!282336)))

(assert (= (and d!76717 c!57676) b!479829))

(assert (= (and d!76717 (not c!57676)) b!479824))

(assert (= (and b!479824 c!57677) b!479840))

(assert (= (and b!479824 (not c!57677)) b!479842))

(assert (= (and b!479842 c!57675) b!479837))

(assert (= (and b!479842 (not c!57675)) b!479826))

(assert (= (or b!479837 b!479826) bm!30847))

(assert (= (or b!479840 bm!30847) bm!30851))

(assert (= (or b!479840 b!479837) bm!30845))

(assert (= (or b!479829 bm!30851) bm!30846))

(assert (= (or b!479829 bm!30845) bm!30848))

(assert (= (and d!76717 res!286232) b!479823))

(assert (= (and d!76717 c!57674) b!479831))

(assert (= (and d!76717 (not c!57674)) b!479833))

(assert (= (and d!76717 res!286227) b!479838))

(assert (= (and b!479838 res!286229) b!479827))

(assert (= (and b!479838 (not res!286228)) b!479835))

(assert (= (and b!479835 res!286233) b!479841))

(assert (= (and b!479838 res!286231) b!479828))

(assert (= (and b!479828 c!57679) b!479832))

(assert (= (and b!479828 (not c!57679)) b!479830))

(assert (= (and b!479832 res!286230) b!479825))

(assert (= (or b!479832 b!479830) bm!30849))

(assert (= (and b!479828 res!286235) b!479822))

(assert (= (and b!479822 c!57678) b!479839))

(assert (= (and b!479822 (not c!57678)) b!479836))

(assert (= (and b!479839 res!286234) b!479834))

(assert (= (or b!479839 b!479836) bm!30850))

(declare-fun b_lambda!10805 () Bool)

(assert (=> (not b_lambda!10805) (not b!479841)))

(declare-fun t!15229 () Bool)

(declare-fun tb!4151 () Bool)

(assert (=> (and start!43288 (= defaultEntry!1519 defaultEntry!1519) t!15229) tb!4151))

(declare-fun result!7737 () Bool)

(assert (=> tb!4151 (= result!7737 tp_is_empty!13681)))

(assert (=> b!479841 t!15229))

(declare-fun b_and!20937 () Bool)

(assert (= b_and!20931 (and (=> t!15229 result!7737) b_and!20937)))

(declare-fun m!461875 () Bool)

(assert (=> bm!30850 m!461875))

(assert (=> b!479823 m!461863))

(assert (=> b!479823 m!461863))

(declare-fun m!461877 () Bool)

(assert (=> b!479823 m!461877))

(declare-fun m!461879 () Bool)

(assert (=> bm!30848 m!461879))

(declare-fun m!461881 () Bool)

(assert (=> b!479831 m!461881))

(declare-fun m!461883 () Bool)

(assert (=> b!479831 m!461883))

(declare-fun m!461885 () Bool)

(assert (=> b!479831 m!461885))

(declare-fun m!461887 () Bool)

(assert (=> b!479831 m!461887))

(declare-fun m!461889 () Bool)

(assert (=> b!479831 m!461889))

(declare-fun m!461891 () Bool)

(assert (=> b!479831 m!461891))

(assert (=> b!479831 m!461885))

(declare-fun m!461893 () Bool)

(assert (=> b!479831 m!461893))

(declare-fun m!461895 () Bool)

(assert (=> b!479831 m!461895))

(declare-fun m!461897 () Bool)

(assert (=> b!479831 m!461897))

(declare-fun m!461899 () Bool)

(assert (=> b!479831 m!461899))

(assert (=> b!479831 m!461889))

(assert (=> b!479831 m!461863))

(declare-fun m!461901 () Bool)

(assert (=> b!479831 m!461901))

(assert (=> b!479831 m!461897))

(declare-fun m!461903 () Bool)

(assert (=> b!479831 m!461903))

(declare-fun m!461905 () Bool)

(assert (=> b!479831 m!461905))

(declare-fun m!461907 () Bool)

(assert (=> b!479831 m!461907))

(declare-fun m!461909 () Bool)

(assert (=> b!479831 m!461909))

(assert (=> b!479831 m!461903))

(declare-fun m!461911 () Bool)

(assert (=> b!479831 m!461911))

(assert (=> b!479827 m!461863))

(assert (=> b!479827 m!461863))

(assert (=> b!479827 m!461877))

(declare-fun m!461913 () Bool)

(assert (=> b!479841 m!461913))

(assert (=> b!479841 m!461863))

(declare-fun m!461915 () Bool)

(assert (=> b!479841 m!461915))

(assert (=> b!479841 m!461863))

(declare-fun m!461917 () Bool)

(assert (=> b!479841 m!461917))

(assert (=> b!479841 m!461913))

(assert (=> b!479841 m!461915))

(declare-fun m!461919 () Bool)

(assert (=> b!479841 m!461919))

(assert (=> b!479835 m!461863))

(assert (=> b!479835 m!461863))

(declare-fun m!461921 () Bool)

(assert (=> b!479835 m!461921))

(declare-fun m!461923 () Bool)

(assert (=> b!479829 m!461923))

(declare-fun m!461925 () Bool)

(assert (=> b!479825 m!461925))

(assert (=> d!76717 m!461799))

(declare-fun m!461927 () Bool)

(assert (=> bm!30849 m!461927))

(assert (=> bm!30846 m!461893))

(declare-fun m!461929 () Bool)

(assert (=> b!479834 m!461929))

(assert (=> b!479692 d!76717))

(declare-fun d!76719 () Bool)

(assert (=> d!76719 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43288 d!76719))

(declare-fun d!76721 () Bool)

(assert (=> d!76721 (= (array_inv!10832 _values!1516) (bvsge (size!15271 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43288 d!76721))

(declare-fun d!76723 () Bool)

(assert (=> d!76723 (= (array_inv!10833 _keys!1874) (bvsge (size!15272 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43288 d!76723))

(declare-fun bm!30854 () Bool)

(declare-fun call!30857 () Bool)

(declare-fun c!57682 () Bool)

(assert (=> bm!30854 (= call!30857 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57682 (Cons!9023 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000) Nil!9024) Nil!9024)))))

(declare-fun b!479855 () Bool)

(declare-fun e!282347 () Bool)

(declare-fun e!282346 () Bool)

(assert (=> b!479855 (= e!282347 e!282346)))

(assert (=> b!479855 (= c!57682 (validKeyInArray!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479856 () Bool)

(assert (=> b!479856 (= e!282346 call!30857)))

(declare-fun b!479857 () Bool)

(declare-fun e!282348 () Bool)

(assert (=> b!479857 (= e!282348 e!282347)))

(declare-fun res!286243 () Bool)

(assert (=> b!479857 (=> (not res!286243) (not e!282347))))

(declare-fun e!282345 () Bool)

(assert (=> b!479857 (= res!286243 (not e!282345))))

(declare-fun res!286242 () Bool)

(assert (=> b!479857 (=> (not res!286242) (not e!282345))))

(assert (=> b!479857 (= res!286242 (validKeyInArray!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76725 () Bool)

(declare-fun res!286244 () Bool)

(assert (=> d!76725 (=> res!286244 e!282348)))

(assert (=> d!76725 (= res!286244 (bvsge #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(assert (=> d!76725 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9024) e!282348)))

(declare-fun b!479858 () Bool)

(declare-fun contains!2581 (List!9027 (_ BitVec 64)) Bool)

(assert (=> b!479858 (= e!282345 (contains!2581 Nil!9024 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479859 () Bool)

(assert (=> b!479859 (= e!282346 call!30857)))

(assert (= (and d!76725 (not res!286244)) b!479857))

(assert (= (and b!479857 res!286242) b!479858))

(assert (= (and b!479857 res!286243) b!479855))

(assert (= (and b!479855 c!57682) b!479856))

(assert (= (and b!479855 (not c!57682)) b!479859))

(assert (= (or b!479856 b!479859) bm!30854))

(assert (=> bm!30854 m!461863))

(declare-fun m!461931 () Bool)

(assert (=> bm!30854 m!461931))

(assert (=> b!479855 m!461863))

(assert (=> b!479855 m!461863))

(assert (=> b!479855 m!461877))

(assert (=> b!479857 m!461863))

(assert (=> b!479857 m!461863))

(assert (=> b!479857 m!461877))

(assert (=> b!479858 m!461863))

(assert (=> b!479858 m!461863))

(declare-fun m!461933 () Bool)

(assert (=> b!479858 m!461933))

(assert (=> b!479690 d!76725))

(declare-fun d!76727 () Bool)

(declare-fun e!282351 () Bool)

(assert (=> d!76727 e!282351))

(declare-fun c!57685 () Bool)

(assert (=> d!76727 (= c!57685 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218005 () Unit!14039)

(declare-fun choose!1380 (array!31016 array!31014 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 64) Int) Unit!14039)

(assert (=> d!76727 (= lt!218005 (choose!1380 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76727 (validMask!0 mask!2352)))

(assert (=> d!76727 (= (lemmaKeyInListMapIsInArray!115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218005)))

(declare-fun b!479864 () Bool)

(assert (=> b!479864 (= e!282351 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479865 () Bool)

(assert (=> b!479865 (= e!282351 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76727 c!57685) b!479864))

(assert (= (and d!76727 (not c!57685)) b!479865))

(declare-fun m!461935 () Bool)

(assert (=> d!76727 m!461935))

(assert (=> d!76727 m!461799))

(assert (=> b!479864 m!461813))

(assert (=> b!479689 d!76727))

(declare-fun b!479874 () Bool)

(declare-fun e!282359 () Bool)

(declare-fun e!282360 () Bool)

(assert (=> b!479874 (= e!282359 e!282360)))

(declare-fun lt!218012 () (_ BitVec 64))

(assert (=> b!479874 (= lt!218012 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218014 () Unit!14039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31016 (_ BitVec 64) (_ BitVec 32)) Unit!14039)

(assert (=> b!479874 (= lt!218014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218012 #b00000000000000000000000000000000))))

(assert (=> b!479874 (arrayContainsKey!0 _keys!1874 lt!218012 #b00000000000000000000000000000000)))

(declare-fun lt!218013 () Unit!14039)

(assert (=> b!479874 (= lt!218013 lt!218014)))

(declare-fun res!286250 () Bool)

(declare-datatypes ((SeekEntryResult!3517 0))(
  ( (MissingZero!3517 (index!16247 (_ BitVec 32))) (Found!3517 (index!16248 (_ BitVec 32))) (Intermediate!3517 (undefined!4329 Bool) (index!16249 (_ BitVec 32)) (x!45028 (_ BitVec 32))) (Undefined!3517) (MissingVacant!3517 (index!16250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31016 (_ BitVec 32)) SeekEntryResult!3517)

(assert (=> b!479874 (= res!286250 (= (seekEntryOrOpen!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3517 #b00000000000000000000000000000000)))))

(assert (=> b!479874 (=> (not res!286250) (not e!282360))))

(declare-fun b!479875 () Bool)

(declare-fun call!30860 () Bool)

(assert (=> b!479875 (= e!282360 call!30860)))

(declare-fun bm!30857 () Bool)

(assert (=> bm!30857 (= call!30860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun d!76729 () Bool)

(declare-fun res!286249 () Bool)

(declare-fun e!282358 () Bool)

(assert (=> d!76729 (=> res!286249 e!282358)))

(assert (=> d!76729 (= res!286249 (bvsge #b00000000000000000000000000000000 (size!15272 _keys!1874)))))

(assert (=> d!76729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282358)))

(declare-fun b!479876 () Bool)

(assert (=> b!479876 (= e!282358 e!282359)))

(declare-fun c!57688 () Bool)

(assert (=> b!479876 (= c!57688 (validKeyInArray!0 (select (arr!14914 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479877 () Bool)

(assert (=> b!479877 (= e!282359 call!30860)))

(assert (= (and d!76729 (not res!286249)) b!479876))

(assert (= (and b!479876 c!57688) b!479874))

(assert (= (and b!479876 (not c!57688)) b!479877))

(assert (= (and b!479874 res!286250) b!479875))

(assert (= (or b!479875 b!479877) bm!30857))

(assert (=> b!479874 m!461863))

(declare-fun m!461937 () Bool)

(assert (=> b!479874 m!461937))

(declare-fun m!461939 () Bool)

(assert (=> b!479874 m!461939))

(assert (=> b!479874 m!461863))

(declare-fun m!461941 () Bool)

(assert (=> b!479874 m!461941))

(declare-fun m!461943 () Bool)

(assert (=> bm!30857 m!461943))

(assert (=> b!479876 m!461863))

(assert (=> b!479876 m!461863))

(assert (=> b!479876 m!461877))

(assert (=> b!479696 d!76729))

(declare-fun condMapEmpty!22228 () Bool)

(declare-fun mapDefault!22228 () ValueCell!6479)

(assert (=> mapNonEmpty!22219 (= condMapEmpty!22228 (= mapRest!22219 ((as const (Array (_ BitVec 32) ValueCell!6479)) mapDefault!22228)))))

(declare-fun e!282365 () Bool)

(declare-fun mapRes!22228 () Bool)

(assert (=> mapNonEmpty!22219 (= tp!42778 (and e!282365 mapRes!22228))))

(declare-fun mapIsEmpty!22228 () Bool)

(assert (=> mapIsEmpty!22228 mapRes!22228))

(declare-fun b!479884 () Bool)

(declare-fun e!282366 () Bool)

(assert (=> b!479884 (= e!282366 tp_is_empty!13681)))

(declare-fun b!479885 () Bool)

(assert (=> b!479885 (= e!282365 tp_is_empty!13681)))

(declare-fun mapNonEmpty!22228 () Bool)

(declare-fun tp!42793 () Bool)

(assert (=> mapNonEmpty!22228 (= mapRes!22228 (and tp!42793 e!282366))))

(declare-fun mapValue!22228 () ValueCell!6479)

(declare-fun mapKey!22228 () (_ BitVec 32))

(declare-fun mapRest!22228 () (Array (_ BitVec 32) ValueCell!6479))

(assert (=> mapNonEmpty!22228 (= mapRest!22219 (store mapRest!22228 mapKey!22228 mapValue!22228))))

(assert (= (and mapNonEmpty!22219 condMapEmpty!22228) mapIsEmpty!22228))

(assert (= (and mapNonEmpty!22219 (not condMapEmpty!22228)) mapNonEmpty!22228))

(assert (= (and mapNonEmpty!22228 ((_ is ValueCellFull!6479) mapValue!22228)) b!479884))

(assert (= (and mapNonEmpty!22219 ((_ is ValueCellFull!6479) mapDefault!22228)) b!479885))

(declare-fun m!461945 () Bool)

(assert (=> mapNonEmpty!22228 m!461945))

(declare-fun b_lambda!10807 () Bool)

(assert (= b_lambda!10805 (or (and start!43288 b_free!12169) b_lambda!10807)))

(check-sat (not b!479876) (not b!479834) (not b!479829) (not b!479874) (not b!479770) (not b!479841) tp_is_empty!13681 (not b!479825) (not b!479857) (not b!479831) (not b!479779) (not b!479827) (not bm!30857) (not d!76727) (not bm!30854) (not b_lambda!10807) (not b!479864) (not bm!30848) (not b_next!12169) (not bm!30846) (not b!479777) (not b!479855) (not d!76715) b_and!20937 (not b!479823) (not b!479835) (not bm!30849) (not mapNonEmpty!22228) (not d!76717) (not b!479858) (not bm!30850))
(check-sat b_and!20937 (not b_next!12169))
