; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113332 () Bool)

(assert start!113332)

(declare-fun b_free!31383 () Bool)

(declare-fun b_next!31383 () Bool)

(assert (=> start!113332 (= b_free!31383 (not b_next!31383))))

(declare-fun tp!109953 () Bool)

(declare-fun b_and!50619 () Bool)

(assert (=> start!113332 (= tp!109953 b_and!50619)))

(declare-fun b!1344830 () Bool)

(declare-fun res!892290 () Bool)

(declare-fun e!765357 () Bool)

(assert (=> b!1344830 (=> (not res!892290) (not e!765357))))

(declare-datatypes ((V!54947 0))(
  ( (V!54948 (val!18766 Int)) )
))
(declare-fun minValue!1245 () V!54947)

(declare-datatypes ((array!91606 0))(
  ( (array!91607 (arr!44259 (Array (_ BitVec 32) (_ BitVec 64))) (size!44809 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91606)

(declare-fun zeroValue!1245 () V!54947)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17793 0))(
  ( (ValueCellFull!17793 (v!21414 V!54947)) (EmptyCell!17793) )
))
(declare-datatypes ((array!91608 0))(
  ( (array!91609 (arr!44260 (Array (_ BitVec 32) ValueCell!17793)) (size!44810 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91608)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24186 0))(
  ( (tuple2!24187 (_1!12104 (_ BitVec 64)) (_2!12104 V!54947)) )
))
(declare-datatypes ((List!31343 0))(
  ( (Nil!31340) (Cons!31339 (h!32548 tuple2!24186) (t!45883 List!31343)) )
))
(declare-datatypes ((ListLongMap!21843 0))(
  ( (ListLongMap!21844 (toList!10937 List!31343)) )
))
(declare-fun contains!9113 (ListLongMap!21843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5893 (array!91606 array!91608 (_ BitVec 32) (_ BitVec 32) V!54947 V!54947 (_ BitVec 32) Int) ListLongMap!21843)

(assert (=> b!1344830 (= res!892290 (contains!9113 (getCurrentListMap!5893 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344831 () Bool)

(declare-fun e!765355 () Bool)

(declare-fun e!765354 () Bool)

(declare-fun mapRes!57781 () Bool)

(assert (=> b!1344831 (= e!765355 (and e!765354 mapRes!57781))))

(declare-fun condMapEmpty!57781 () Bool)

(declare-fun mapDefault!57781 () ValueCell!17793)

(assert (=> b!1344831 (= condMapEmpty!57781 (= (arr!44260 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17793)) mapDefault!57781)))))

(declare-fun b!1344832 () Bool)

(declare-fun e!765358 () Bool)

(declare-fun tp_is_empty!37383 () Bool)

(assert (=> b!1344832 (= e!765358 tp_is_empty!37383)))

(declare-fun b!1344833 () Bool)

(declare-fun res!892281 () Bool)

(assert (=> b!1344833 (=> (not res!892281) (not e!765357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91606 (_ BitVec 32)) Bool)

(assert (=> b!1344833 (= res!892281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344834 () Bool)

(declare-fun res!892287 () Bool)

(assert (=> b!1344834 (=> (not res!892287) (not e!765357))))

(declare-datatypes ((List!31344 0))(
  ( (Nil!31341) (Cons!31340 (h!32549 (_ BitVec 64)) (t!45884 List!31344)) )
))
(declare-fun arrayNoDuplicates!0 (array!91606 (_ BitVec 32) List!31344) Bool)

(assert (=> b!1344834 (= res!892287 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31341))))

(declare-fun res!892285 () Bool)

(assert (=> start!113332 (=> (not res!892285) (not e!765357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113332 (= res!892285 (validMask!0 mask!1977))))

(assert (=> start!113332 e!765357))

(assert (=> start!113332 tp_is_empty!37383))

(assert (=> start!113332 true))

(declare-fun array_inv!33357 (array!91606) Bool)

(assert (=> start!113332 (array_inv!33357 _keys!1571)))

(declare-fun array_inv!33358 (array!91608) Bool)

(assert (=> start!113332 (and (array_inv!33358 _values!1303) e!765355)))

(assert (=> start!113332 tp!109953))

(declare-fun b!1344835 () Bool)

(declare-fun res!892282 () Bool)

(assert (=> b!1344835 (=> (not res!892282) (not e!765357))))

(assert (=> b!1344835 (= res!892282 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344836 () Bool)

(declare-fun e!765359 () Bool)

(assert (=> b!1344836 (= e!765357 e!765359)))

(declare-fun res!892288 () Bool)

(assert (=> b!1344836 (=> (not res!892288) (not e!765359))))

(declare-fun lt!595227 () V!54947)

(declare-fun lt!595226 () ListLongMap!21843)

(declare-fun +!4823 (ListLongMap!21843 tuple2!24186) ListLongMap!21843)

(assert (=> b!1344836 (= res!892288 (contains!9113 (+!4823 lt!595226 (tuple2!24187 (select (arr!44259 _keys!1571) from!1960) lt!595227)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6465 (array!91606 array!91608 (_ BitVec 32) (_ BitVec 32) V!54947 V!54947 (_ BitVec 32) Int) ListLongMap!21843)

(assert (=> b!1344836 (= lt!595226 (getCurrentListMapNoExtraKeys!6465 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22356 (ValueCell!17793 V!54947) V!54947)

(declare-fun dynLambda!3762 (Int (_ BitVec 64)) V!54947)

(assert (=> b!1344836 (= lt!595227 (get!22356 (select (arr!44260 _values!1303) from!1960) (dynLambda!3762 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1344837 () Bool)

(assert (=> b!1344837 (= e!765354 tp_is_empty!37383)))

(declare-fun mapNonEmpty!57781 () Bool)

(declare-fun tp!109954 () Bool)

(assert (=> mapNonEmpty!57781 (= mapRes!57781 (and tp!109954 e!765358))))

(declare-fun mapRest!57781 () (Array (_ BitVec 32) ValueCell!17793))

(declare-fun mapKey!57781 () (_ BitVec 32))

(declare-fun mapValue!57781 () ValueCell!17793)

(assert (=> mapNonEmpty!57781 (= (arr!44260 _values!1303) (store mapRest!57781 mapKey!57781 mapValue!57781))))

(declare-fun mapIsEmpty!57781 () Bool)

(assert (=> mapIsEmpty!57781 mapRes!57781))

(declare-fun b!1344838 () Bool)

(assert (=> b!1344838 (= e!765359 (not true))))

(assert (=> b!1344838 (contains!9113 lt!595226 k0!1142)))

(declare-datatypes ((Unit!44115 0))(
  ( (Unit!44116) )
))
(declare-fun lt!595225 () Unit!44115)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!388 ((_ BitVec 64) (_ BitVec 64) V!54947 ListLongMap!21843) Unit!44115)

(assert (=> b!1344838 (= lt!595225 (lemmaInListMapAfterAddingDiffThenInBefore!388 k0!1142 (select (arr!44259 _keys!1571) from!1960) lt!595227 lt!595226))))

(declare-fun b!1344839 () Bool)

(declare-fun res!892289 () Bool)

(assert (=> b!1344839 (=> (not res!892289) (not e!765357))))

(assert (=> b!1344839 (= res!892289 (not (= (select (arr!44259 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344840 () Bool)

(declare-fun res!892286 () Bool)

(assert (=> b!1344840 (=> (not res!892286) (not e!765357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344840 (= res!892286 (validKeyInArray!0 (select (arr!44259 _keys!1571) from!1960)))))

(declare-fun b!1344841 () Bool)

(declare-fun res!892283 () Bool)

(assert (=> b!1344841 (=> (not res!892283) (not e!765357))))

(assert (=> b!1344841 (= res!892283 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44809 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344842 () Bool)

(declare-fun res!892284 () Bool)

(assert (=> b!1344842 (=> (not res!892284) (not e!765359))))

(assert (=> b!1344842 (= res!892284 (not (= k0!1142 (select (arr!44259 _keys!1571) from!1960))))))

(declare-fun b!1344843 () Bool)

(declare-fun res!892280 () Bool)

(assert (=> b!1344843 (=> (not res!892280) (not e!765357))))

(assert (=> b!1344843 (= res!892280 (and (= (size!44810 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44809 _keys!1571) (size!44810 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113332 res!892285) b!1344843))

(assert (= (and b!1344843 res!892280) b!1344833))

(assert (= (and b!1344833 res!892281) b!1344834))

(assert (= (and b!1344834 res!892287) b!1344841))

(assert (= (and b!1344841 res!892283) b!1344830))

(assert (= (and b!1344830 res!892290) b!1344839))

(assert (= (and b!1344839 res!892289) b!1344840))

(assert (= (and b!1344840 res!892286) b!1344835))

(assert (= (and b!1344835 res!892282) b!1344836))

(assert (= (and b!1344836 res!892288) b!1344842))

(assert (= (and b!1344842 res!892284) b!1344838))

(assert (= (and b!1344831 condMapEmpty!57781) mapIsEmpty!57781))

(assert (= (and b!1344831 (not condMapEmpty!57781)) mapNonEmpty!57781))

(get-info :version)

(assert (= (and mapNonEmpty!57781 ((_ is ValueCellFull!17793) mapValue!57781)) b!1344832))

(assert (= (and b!1344831 ((_ is ValueCellFull!17793) mapDefault!57781)) b!1344837))

(assert (= start!113332 b!1344831))

(declare-fun b_lambda!24505 () Bool)

(assert (=> (not b_lambda!24505) (not b!1344836)))

(declare-fun t!45882 () Bool)

(declare-fun tb!12343 () Bool)

(assert (=> (and start!113332 (= defaultEntry!1306 defaultEntry!1306) t!45882) tb!12343))

(declare-fun result!25777 () Bool)

(assert (=> tb!12343 (= result!25777 tp_is_empty!37383)))

(assert (=> b!1344836 t!45882))

(declare-fun b_and!50621 () Bool)

(assert (= b_and!50619 (and (=> t!45882 result!25777) b_and!50621)))

(declare-fun m!1232335 () Bool)

(assert (=> start!113332 m!1232335))

(declare-fun m!1232337 () Bool)

(assert (=> start!113332 m!1232337))

(declare-fun m!1232339 () Bool)

(assert (=> start!113332 m!1232339))

(declare-fun m!1232341 () Bool)

(assert (=> b!1344839 m!1232341))

(declare-fun m!1232343 () Bool)

(assert (=> mapNonEmpty!57781 m!1232343))

(declare-fun m!1232345 () Bool)

(assert (=> b!1344830 m!1232345))

(assert (=> b!1344830 m!1232345))

(declare-fun m!1232347 () Bool)

(assert (=> b!1344830 m!1232347))

(declare-fun m!1232349 () Bool)

(assert (=> b!1344838 m!1232349))

(assert (=> b!1344838 m!1232341))

(assert (=> b!1344838 m!1232341))

(declare-fun m!1232351 () Bool)

(assert (=> b!1344838 m!1232351))

(assert (=> b!1344840 m!1232341))

(assert (=> b!1344840 m!1232341))

(declare-fun m!1232353 () Bool)

(assert (=> b!1344840 m!1232353))

(declare-fun m!1232355 () Bool)

(assert (=> b!1344836 m!1232355))

(declare-fun m!1232357 () Bool)

(assert (=> b!1344836 m!1232357))

(declare-fun m!1232359 () Bool)

(assert (=> b!1344836 m!1232359))

(assert (=> b!1344836 m!1232355))

(assert (=> b!1344836 m!1232357))

(declare-fun m!1232361 () Bool)

(assert (=> b!1344836 m!1232361))

(assert (=> b!1344836 m!1232341))

(assert (=> b!1344836 m!1232361))

(declare-fun m!1232363 () Bool)

(assert (=> b!1344836 m!1232363))

(declare-fun m!1232365 () Bool)

(assert (=> b!1344836 m!1232365))

(assert (=> b!1344842 m!1232341))

(declare-fun m!1232367 () Bool)

(assert (=> b!1344833 m!1232367))

(declare-fun m!1232369 () Bool)

(assert (=> b!1344834 m!1232369))

(check-sat (not b!1344840) (not b!1344833) (not b!1344838) (not b_next!31383) (not b_lambda!24505) b_and!50621 (not b!1344836) (not b!1344834) (not b!1344830) (not start!113332) tp_is_empty!37383 (not mapNonEmpty!57781))
(check-sat b_and!50621 (not b_next!31383))
