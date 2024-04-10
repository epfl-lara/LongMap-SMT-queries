; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37970 () Bool)

(assert start!37970)

(declare-fun b_free!8961 () Bool)

(declare-fun b_next!8961 () Bool)

(assert (=> start!37970 (= b_free!8961 (not b_next!8961))))

(declare-fun tp!31650 () Bool)

(declare-fun b_and!16263 () Bool)

(assert (=> start!37970 (= tp!31650 b_and!16263)))

(declare-fun b!390619 () Bool)

(declare-fun e!236615 () Bool)

(declare-fun e!236613 () Bool)

(assert (=> b!390619 (= e!236615 e!236613)))

(declare-fun res!223538 () Bool)

(assert (=> b!390619 (=> (not res!223538) (not e!236613))))

(declare-datatypes ((array!23165 0))(
  ( (array!23166 (arr!11046 (Array (_ BitVec 32) (_ BitVec 64))) (size!11398 (_ BitVec 32))) )
))
(declare-fun lt!184145 () array!23165)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23165 (_ BitVec 32)) Bool)

(assert (=> b!390619 (= res!223538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184145 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23165)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390619 (= lt!184145 (array!23166 (store (arr!11046 _keys!658) i!548 k0!778) (size!11398 _keys!658)))))

(declare-fun b!390620 () Bool)

(declare-fun e!236612 () Bool)

(assert (=> b!390620 (= e!236613 (not e!236612))))

(declare-fun res!223534 () Bool)

(assert (=> b!390620 (=> res!223534 e!236612)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390620 (= res!223534 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13949 0))(
  ( (V!13950 (val!4861 Int)) )
))
(declare-datatypes ((ValueCell!4473 0))(
  ( (ValueCellFull!4473 (v!7078 V!13949)) (EmptyCell!4473) )
))
(declare-datatypes ((array!23167 0))(
  ( (array!23168 (arr!11047 (Array (_ BitVec 32) ValueCell!4473)) (size!11399 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23167)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6542 0))(
  ( (tuple2!6543 (_1!3282 (_ BitVec 64)) (_2!3282 V!13949)) )
))
(declare-datatypes ((List!6397 0))(
  ( (Nil!6394) (Cons!6393 (h!7249 tuple2!6542) (t!11557 List!6397)) )
))
(declare-datatypes ((ListLongMap!5455 0))(
  ( (ListLongMap!5456 (toList!2743 List!6397)) )
))
(declare-fun lt!184138 () ListLongMap!5455)

(declare-fun zeroValue!472 () V!13949)

(declare-fun minValue!472 () V!13949)

(declare-fun getCurrentListMap!2089 (array!23165 array!23167 (_ BitVec 32) (_ BitVec 32) V!13949 V!13949 (_ BitVec 32) Int) ListLongMap!5455)

(assert (=> b!390620 (= lt!184138 (getCurrentListMap!2089 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184139 () array!23167)

(declare-fun lt!184146 () ListLongMap!5455)

(assert (=> b!390620 (= lt!184146 (getCurrentListMap!2089 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184141 () ListLongMap!5455)

(declare-fun lt!184143 () ListLongMap!5455)

(assert (=> b!390620 (and (= lt!184141 lt!184143) (= lt!184143 lt!184141))))

(declare-fun v!373 () V!13949)

(declare-fun lt!184140 () ListLongMap!5455)

(declare-fun +!1038 (ListLongMap!5455 tuple2!6542) ListLongMap!5455)

(assert (=> b!390620 (= lt!184143 (+!1038 lt!184140 (tuple2!6543 k0!778 v!373)))))

(declare-datatypes ((Unit!11958 0))(
  ( (Unit!11959) )
))
(declare-fun lt!184142 () Unit!11958)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!253 (array!23165 array!23167 (_ BitVec 32) (_ BitVec 32) V!13949 V!13949 (_ BitVec 32) (_ BitVec 64) V!13949 (_ BitVec 32) Int) Unit!11958)

(assert (=> b!390620 (= lt!184142 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!253 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!969 (array!23165 array!23167 (_ BitVec 32) (_ BitVec 32) V!13949 V!13949 (_ BitVec 32) Int) ListLongMap!5455)

(assert (=> b!390620 (= lt!184141 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390620 (= lt!184139 (array!23168 (store (arr!11047 _values!506) i!548 (ValueCellFull!4473 v!373)) (size!11399 _values!506)))))

(assert (=> b!390620 (= lt!184140 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!223542 () Bool)

(assert (=> start!37970 (=> (not res!223542) (not e!236615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37970 (= res!223542 (validMask!0 mask!970))))

(assert (=> start!37970 e!236615))

(declare-fun e!236616 () Bool)

(declare-fun array_inv!8116 (array!23167) Bool)

(assert (=> start!37970 (and (array_inv!8116 _values!506) e!236616)))

(assert (=> start!37970 tp!31650))

(assert (=> start!37970 true))

(declare-fun tp_is_empty!9633 () Bool)

(assert (=> start!37970 tp_is_empty!9633))

(declare-fun array_inv!8117 (array!23165) Bool)

(assert (=> start!37970 (array_inv!8117 _keys!658)))

(declare-fun b!390621 () Bool)

(declare-fun res!223541 () Bool)

(assert (=> b!390621 (=> (not res!223541) (not e!236615))))

(declare-datatypes ((List!6398 0))(
  ( (Nil!6395) (Cons!6394 (h!7250 (_ BitVec 64)) (t!11558 List!6398)) )
))
(declare-fun arrayNoDuplicates!0 (array!23165 (_ BitVec 32) List!6398) Bool)

(assert (=> b!390621 (= res!223541 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6395))))

(declare-fun b!390622 () Bool)

(declare-fun e!236611 () Bool)

(declare-fun mapRes!16029 () Bool)

(assert (=> b!390622 (= e!236616 (and e!236611 mapRes!16029))))

(declare-fun condMapEmpty!16029 () Bool)

(declare-fun mapDefault!16029 () ValueCell!4473)

(assert (=> b!390622 (= condMapEmpty!16029 (= (arr!11047 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4473)) mapDefault!16029)))))

(declare-fun b!390623 () Bool)

(declare-fun res!223532 () Bool)

(assert (=> b!390623 (=> (not res!223532) (not e!236615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390623 (= res!223532 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16029 () Bool)

(declare-fun tp!31649 () Bool)

(declare-fun e!236614 () Bool)

(assert (=> mapNonEmpty!16029 (= mapRes!16029 (and tp!31649 e!236614))))

(declare-fun mapValue!16029 () ValueCell!4473)

(declare-fun mapKey!16029 () (_ BitVec 32))

(declare-fun mapRest!16029 () (Array (_ BitVec 32) ValueCell!4473))

(assert (=> mapNonEmpty!16029 (= (arr!11047 _values!506) (store mapRest!16029 mapKey!16029 mapValue!16029))))

(declare-fun lt!184144 () tuple2!6542)

(declare-fun b!390624 () Bool)

(assert (=> b!390624 (= e!236612 (= lt!184138 (+!1038 lt!184140 lt!184144)))))

(assert (=> b!390624 (= lt!184146 (+!1038 lt!184141 lt!184144))))

(assert (=> b!390624 (= lt!184144 (tuple2!6543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390625 () Bool)

(declare-fun res!223535 () Bool)

(assert (=> b!390625 (=> (not res!223535) (not e!236615))))

(assert (=> b!390625 (= res!223535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390626 () Bool)

(declare-fun res!223533 () Bool)

(assert (=> b!390626 (=> (not res!223533) (not e!236613))))

(assert (=> b!390626 (= res!223533 (arrayNoDuplicates!0 lt!184145 #b00000000000000000000000000000000 Nil!6395))))

(declare-fun mapIsEmpty!16029 () Bool)

(assert (=> mapIsEmpty!16029 mapRes!16029))

(declare-fun b!390627 () Bool)

(declare-fun res!223539 () Bool)

(assert (=> b!390627 (=> (not res!223539) (not e!236615))))

(assert (=> b!390627 (= res!223539 (and (= (size!11399 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11398 _keys!658) (size!11399 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390628 () Bool)

(declare-fun res!223537 () Bool)

(assert (=> b!390628 (=> (not res!223537) (not e!236615))))

(declare-fun arrayContainsKey!0 (array!23165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390628 (= res!223537 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390629 () Bool)

(assert (=> b!390629 (= e!236614 tp_is_empty!9633)))

(declare-fun b!390630 () Bool)

(declare-fun res!223536 () Bool)

(assert (=> b!390630 (=> (not res!223536) (not e!236615))))

(assert (=> b!390630 (= res!223536 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11398 _keys!658))))))

(declare-fun b!390631 () Bool)

(assert (=> b!390631 (= e!236611 tp_is_empty!9633)))

(declare-fun b!390632 () Bool)

(declare-fun res!223540 () Bool)

(assert (=> b!390632 (=> (not res!223540) (not e!236615))))

(assert (=> b!390632 (= res!223540 (or (= (select (arr!11046 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11046 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37970 res!223542) b!390627))

(assert (= (and b!390627 res!223539) b!390625))

(assert (= (and b!390625 res!223535) b!390621))

(assert (= (and b!390621 res!223541) b!390630))

(assert (= (and b!390630 res!223536) b!390623))

(assert (= (and b!390623 res!223532) b!390632))

(assert (= (and b!390632 res!223540) b!390628))

(assert (= (and b!390628 res!223537) b!390619))

(assert (= (and b!390619 res!223538) b!390626))

(assert (= (and b!390626 res!223533) b!390620))

(assert (= (and b!390620 (not res!223534)) b!390624))

(assert (= (and b!390622 condMapEmpty!16029) mapIsEmpty!16029))

(assert (= (and b!390622 (not condMapEmpty!16029)) mapNonEmpty!16029))

(get-info :version)

(assert (= (and mapNonEmpty!16029 ((_ is ValueCellFull!4473) mapValue!16029)) b!390629))

(assert (= (and b!390622 ((_ is ValueCellFull!4473) mapDefault!16029)) b!390631))

(assert (= start!37970 b!390622))

(declare-fun m!386955 () Bool)

(assert (=> b!390625 m!386955))

(declare-fun m!386957 () Bool)

(assert (=> b!390620 m!386957))

(declare-fun m!386959 () Bool)

(assert (=> b!390620 m!386959))

(declare-fun m!386961 () Bool)

(assert (=> b!390620 m!386961))

(declare-fun m!386963 () Bool)

(assert (=> b!390620 m!386963))

(declare-fun m!386965 () Bool)

(assert (=> b!390620 m!386965))

(declare-fun m!386967 () Bool)

(assert (=> b!390620 m!386967))

(declare-fun m!386969 () Bool)

(assert (=> b!390620 m!386969))

(declare-fun m!386971 () Bool)

(assert (=> b!390624 m!386971))

(declare-fun m!386973 () Bool)

(assert (=> b!390624 m!386973))

(declare-fun m!386975 () Bool)

(assert (=> start!37970 m!386975))

(declare-fun m!386977 () Bool)

(assert (=> start!37970 m!386977))

(declare-fun m!386979 () Bool)

(assert (=> start!37970 m!386979))

(declare-fun m!386981 () Bool)

(assert (=> b!390632 m!386981))

(declare-fun m!386983 () Bool)

(assert (=> mapNonEmpty!16029 m!386983))

(declare-fun m!386985 () Bool)

(assert (=> b!390621 m!386985))

(declare-fun m!386987 () Bool)

(assert (=> b!390628 m!386987))

(declare-fun m!386989 () Bool)

(assert (=> b!390619 m!386989))

(declare-fun m!386991 () Bool)

(assert (=> b!390619 m!386991))

(declare-fun m!386993 () Bool)

(assert (=> b!390623 m!386993))

(declare-fun m!386995 () Bool)

(assert (=> b!390626 m!386995))

(check-sat (not b!390619) (not b!390624) (not b!390623) (not mapNonEmpty!16029) tp_is_empty!9633 (not start!37970) (not b!390625) (not b!390626) b_and!16263 (not b!390620) (not b_next!8961) (not b!390621) (not b!390628))
(check-sat b_and!16263 (not b_next!8961))
(get-model)

(declare-fun b!390685 () Bool)

(declare-fun e!236648 () Bool)

(declare-fun e!236649 () Bool)

(assert (=> b!390685 (= e!236648 e!236649)))

(declare-fun res!223583 () Bool)

(assert (=> b!390685 (=> (not res!223583) (not e!236649))))

(declare-fun e!236647 () Bool)

(assert (=> b!390685 (= res!223583 (not e!236647))))

(declare-fun res!223582 () Bool)

(assert (=> b!390685 (=> (not res!223582) (not e!236647))))

(assert (=> b!390685 (= res!223582 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun d!73009 () Bool)

(declare-fun res!223584 () Bool)

(assert (=> d!73009 (=> res!223584 e!236648)))

(assert (=> d!73009 (= res!223584 (bvsge #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(assert (=> d!73009 (= (arrayNoDuplicates!0 lt!184145 #b00000000000000000000000000000000 Nil!6395) e!236648)))

(declare-fun b!390686 () Bool)

(declare-fun e!236650 () Bool)

(declare-fun call!27541 () Bool)

(assert (=> b!390686 (= e!236650 call!27541)))

(declare-fun bm!27538 () Bool)

(declare-fun c!54182 () Bool)

(assert (=> bm!27538 (= call!27541 (arrayNoDuplicates!0 lt!184145 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54182 (Cons!6394 (select (arr!11046 lt!184145) #b00000000000000000000000000000000) Nil!6395) Nil!6395)))))

(declare-fun b!390687 () Bool)

(assert (=> b!390687 (= e!236649 e!236650)))

(assert (=> b!390687 (= c!54182 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun b!390688 () Bool)

(declare-fun contains!2455 (List!6398 (_ BitVec 64)) Bool)

(assert (=> b!390688 (= e!236647 (contains!2455 Nil!6395 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun b!390689 () Bool)

(assert (=> b!390689 (= e!236650 call!27541)))

(assert (= (and d!73009 (not res!223584)) b!390685))

(assert (= (and b!390685 res!223582) b!390688))

(assert (= (and b!390685 res!223583) b!390687))

(assert (= (and b!390687 c!54182) b!390686))

(assert (= (and b!390687 (not c!54182)) b!390689))

(assert (= (or b!390686 b!390689) bm!27538))

(declare-fun m!387039 () Bool)

(assert (=> b!390685 m!387039))

(assert (=> b!390685 m!387039))

(declare-fun m!387041 () Bool)

(assert (=> b!390685 m!387041))

(assert (=> bm!27538 m!387039))

(declare-fun m!387043 () Bool)

(assert (=> bm!27538 m!387043))

(assert (=> b!390687 m!387039))

(assert (=> b!390687 m!387039))

(assert (=> b!390687 m!387041))

(assert (=> b!390688 m!387039))

(assert (=> b!390688 m!387039))

(declare-fun m!387045 () Bool)

(assert (=> b!390688 m!387045))

(assert (=> b!390626 d!73009))

(declare-fun d!73011 () Bool)

(assert (=> d!73011 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390623 d!73011))

(declare-fun d!73013 () Bool)

(assert (=> d!73013 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37970 d!73013))

(declare-fun d!73015 () Bool)

(assert (=> d!73015 (= (array_inv!8116 _values!506) (bvsge (size!11399 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37970 d!73015))

(declare-fun d!73017 () Bool)

(assert (=> d!73017 (= (array_inv!8117 _keys!658) (bvsge (size!11398 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37970 d!73017))

(declare-fun bm!27541 () Bool)

(declare-fun call!27544 () Bool)

(assert (=> bm!27541 (= call!27544 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184145 mask!970))))

(declare-fun b!390698 () Bool)

(declare-fun e!236657 () Bool)

(declare-fun e!236658 () Bool)

(assert (=> b!390698 (= e!236657 e!236658)))

(declare-fun lt!184181 () (_ BitVec 64))

(assert (=> b!390698 (= lt!184181 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(declare-fun lt!184180 () Unit!11958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23165 (_ BitVec 64) (_ BitVec 32)) Unit!11958)

(assert (=> b!390698 (= lt!184180 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184145 lt!184181 #b00000000000000000000000000000000))))

(assert (=> b!390698 (arrayContainsKey!0 lt!184145 lt!184181 #b00000000000000000000000000000000)))

(declare-fun lt!184182 () Unit!11958)

(assert (=> b!390698 (= lt!184182 lt!184180)))

(declare-fun res!223590 () Bool)

(declare-datatypes ((SeekEntryResult!3513 0))(
  ( (MissingZero!3513 (index!16231 (_ BitVec 32))) (Found!3513 (index!16232 (_ BitVec 32))) (Intermediate!3513 (undefined!4325 Bool) (index!16233 (_ BitVec 32)) (x!38313 (_ BitVec 32))) (Undefined!3513) (MissingVacant!3513 (index!16234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23165 (_ BitVec 32)) SeekEntryResult!3513)

(assert (=> b!390698 (= res!223590 (= (seekEntryOrOpen!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000) lt!184145 mask!970) (Found!3513 #b00000000000000000000000000000000)))))

(assert (=> b!390698 (=> (not res!223590) (not e!236658))))

(declare-fun b!390699 () Bool)

(assert (=> b!390699 (= e!236658 call!27544)))

(declare-fun d!73019 () Bool)

(declare-fun res!223589 () Bool)

(declare-fun e!236659 () Bool)

(assert (=> d!73019 (=> res!223589 e!236659)))

(assert (=> d!73019 (= res!223589 (bvsge #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(assert (=> d!73019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184145 mask!970) e!236659)))

(declare-fun b!390700 () Bool)

(assert (=> b!390700 (= e!236657 call!27544)))

(declare-fun b!390701 () Bool)

(assert (=> b!390701 (= e!236659 e!236657)))

(declare-fun c!54185 () Bool)

(assert (=> b!390701 (= c!54185 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(assert (= (and d!73019 (not res!223589)) b!390701))

(assert (= (and b!390701 c!54185) b!390698))

(assert (= (and b!390701 (not c!54185)) b!390700))

(assert (= (and b!390698 res!223590) b!390699))

(assert (= (or b!390699 b!390700) bm!27541))

(declare-fun m!387047 () Bool)

(assert (=> bm!27541 m!387047))

(assert (=> b!390698 m!387039))

(declare-fun m!387049 () Bool)

(assert (=> b!390698 m!387049))

(declare-fun m!387051 () Bool)

(assert (=> b!390698 m!387051))

(assert (=> b!390698 m!387039))

(declare-fun m!387053 () Bool)

(assert (=> b!390698 m!387053))

(assert (=> b!390701 m!387039))

(assert (=> b!390701 m!387039))

(assert (=> b!390701 m!387041))

(assert (=> b!390619 d!73019))

(declare-fun d!73021 () Bool)

(declare-fun e!236662 () Bool)

(assert (=> d!73021 e!236662))

(declare-fun res!223596 () Bool)

(assert (=> d!73021 (=> (not res!223596) (not e!236662))))

(declare-fun lt!184194 () ListLongMap!5455)

(declare-fun contains!2456 (ListLongMap!5455 (_ BitVec 64)) Bool)

(assert (=> d!73021 (= res!223596 (contains!2456 lt!184194 (_1!3282 lt!184144)))))

(declare-fun lt!184192 () List!6397)

(assert (=> d!73021 (= lt!184194 (ListLongMap!5456 lt!184192))))

(declare-fun lt!184193 () Unit!11958)

(declare-fun lt!184191 () Unit!11958)

(assert (=> d!73021 (= lt!184193 lt!184191)))

(declare-datatypes ((Option!366 0))(
  ( (Some!365 (v!7083 V!13949)) (None!364) )
))
(declare-fun getValueByKey!360 (List!6397 (_ BitVec 64)) Option!366)

(assert (=> d!73021 (= (getValueByKey!360 lt!184192 (_1!3282 lt!184144)) (Some!365 (_2!3282 lt!184144)))))

(declare-fun lemmaContainsTupThenGetReturnValue!182 (List!6397 (_ BitVec 64) V!13949) Unit!11958)

(assert (=> d!73021 (= lt!184191 (lemmaContainsTupThenGetReturnValue!182 lt!184192 (_1!3282 lt!184144) (_2!3282 lt!184144)))))

(declare-fun insertStrictlySorted!185 (List!6397 (_ BitVec 64) V!13949) List!6397)

(assert (=> d!73021 (= lt!184192 (insertStrictlySorted!185 (toList!2743 lt!184140) (_1!3282 lt!184144) (_2!3282 lt!184144)))))

(assert (=> d!73021 (= (+!1038 lt!184140 lt!184144) lt!184194)))

(declare-fun b!390706 () Bool)

(declare-fun res!223595 () Bool)

(assert (=> b!390706 (=> (not res!223595) (not e!236662))))

(assert (=> b!390706 (= res!223595 (= (getValueByKey!360 (toList!2743 lt!184194) (_1!3282 lt!184144)) (Some!365 (_2!3282 lt!184144))))))

(declare-fun b!390707 () Bool)

(declare-fun contains!2457 (List!6397 tuple2!6542) Bool)

(assert (=> b!390707 (= e!236662 (contains!2457 (toList!2743 lt!184194) lt!184144))))

(assert (= (and d!73021 res!223596) b!390706))

(assert (= (and b!390706 res!223595) b!390707))

(declare-fun m!387055 () Bool)

(assert (=> d!73021 m!387055))

(declare-fun m!387057 () Bool)

(assert (=> d!73021 m!387057))

(declare-fun m!387059 () Bool)

(assert (=> d!73021 m!387059))

(declare-fun m!387061 () Bool)

(assert (=> d!73021 m!387061))

(declare-fun m!387063 () Bool)

(assert (=> b!390706 m!387063))

(declare-fun m!387065 () Bool)

(assert (=> b!390707 m!387065))

(assert (=> b!390624 d!73021))

(declare-fun d!73023 () Bool)

(declare-fun e!236663 () Bool)

(assert (=> d!73023 e!236663))

(declare-fun res!223598 () Bool)

(assert (=> d!73023 (=> (not res!223598) (not e!236663))))

(declare-fun lt!184198 () ListLongMap!5455)

(assert (=> d!73023 (= res!223598 (contains!2456 lt!184198 (_1!3282 lt!184144)))))

(declare-fun lt!184196 () List!6397)

(assert (=> d!73023 (= lt!184198 (ListLongMap!5456 lt!184196))))

(declare-fun lt!184197 () Unit!11958)

(declare-fun lt!184195 () Unit!11958)

(assert (=> d!73023 (= lt!184197 lt!184195)))

(assert (=> d!73023 (= (getValueByKey!360 lt!184196 (_1!3282 lt!184144)) (Some!365 (_2!3282 lt!184144)))))

(assert (=> d!73023 (= lt!184195 (lemmaContainsTupThenGetReturnValue!182 lt!184196 (_1!3282 lt!184144) (_2!3282 lt!184144)))))

(assert (=> d!73023 (= lt!184196 (insertStrictlySorted!185 (toList!2743 lt!184141) (_1!3282 lt!184144) (_2!3282 lt!184144)))))

(assert (=> d!73023 (= (+!1038 lt!184141 lt!184144) lt!184198)))

(declare-fun b!390708 () Bool)

(declare-fun res!223597 () Bool)

(assert (=> b!390708 (=> (not res!223597) (not e!236663))))

(assert (=> b!390708 (= res!223597 (= (getValueByKey!360 (toList!2743 lt!184198) (_1!3282 lt!184144)) (Some!365 (_2!3282 lt!184144))))))

(declare-fun b!390709 () Bool)

(assert (=> b!390709 (= e!236663 (contains!2457 (toList!2743 lt!184198) lt!184144))))

(assert (= (and d!73023 res!223598) b!390708))

(assert (= (and b!390708 res!223597) b!390709))

(declare-fun m!387067 () Bool)

(assert (=> d!73023 m!387067))

(declare-fun m!387069 () Bool)

(assert (=> d!73023 m!387069))

(declare-fun m!387071 () Bool)

(assert (=> d!73023 m!387071))

(declare-fun m!387073 () Bool)

(assert (=> d!73023 m!387073))

(declare-fun m!387075 () Bool)

(assert (=> b!390708 m!387075))

(declare-fun m!387077 () Bool)

(assert (=> b!390709 m!387077))

(assert (=> b!390624 d!73023))

(declare-fun d!73025 () Bool)

(declare-fun res!223603 () Bool)

(declare-fun e!236668 () Bool)

(assert (=> d!73025 (=> res!223603 e!236668)))

(assert (=> d!73025 (= res!223603 (= (select (arr!11046 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73025 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236668)))

(declare-fun b!390714 () Bool)

(declare-fun e!236669 () Bool)

(assert (=> b!390714 (= e!236668 e!236669)))

(declare-fun res!223604 () Bool)

(assert (=> b!390714 (=> (not res!223604) (not e!236669))))

(assert (=> b!390714 (= res!223604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11398 _keys!658)))))

(declare-fun b!390715 () Bool)

(assert (=> b!390715 (= e!236669 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73025 (not res!223603)) b!390714))

(assert (= (and b!390714 res!223604) b!390715))

(declare-fun m!387079 () Bool)

(assert (=> d!73025 m!387079))

(declare-fun m!387081 () Bool)

(assert (=> b!390715 m!387081))

(assert (=> b!390628 d!73025))

(declare-fun b!390758 () Bool)

(declare-fun e!236705 () ListLongMap!5455)

(declare-fun e!236697 () ListLongMap!5455)

(assert (=> b!390758 (= e!236705 e!236697)))

(declare-fun c!54201 () Bool)

(assert (=> b!390758 (= c!54201 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27556 () Bool)

(declare-fun call!27565 () Bool)

(declare-fun lt!184246 () ListLongMap!5455)

(assert (=> bm!27556 (= call!27565 (contains!2456 lt!184246 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390759 () Bool)

(declare-fun e!236708 () Unit!11958)

(declare-fun lt!184262 () Unit!11958)

(assert (=> b!390759 (= e!236708 lt!184262)))

(declare-fun lt!184258 () ListLongMap!5455)

(assert (=> b!390759 (= lt!184258 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184256 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184256 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184250 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184250 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(declare-fun lt!184251 () Unit!11958)

(declare-fun addStillContains!278 (ListLongMap!5455 (_ BitVec 64) V!13949 (_ BitVec 64)) Unit!11958)

(assert (=> b!390759 (= lt!184251 (addStillContains!278 lt!184258 lt!184256 zeroValue!472 lt!184250))))

(assert (=> b!390759 (contains!2456 (+!1038 lt!184258 (tuple2!6543 lt!184256 zeroValue!472)) lt!184250)))

(declare-fun lt!184264 () Unit!11958)

(assert (=> b!390759 (= lt!184264 lt!184251)))

(declare-fun lt!184253 () ListLongMap!5455)

(assert (=> b!390759 (= lt!184253 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184249 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184261 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184261 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(declare-fun lt!184257 () Unit!11958)

(declare-fun addApplyDifferent!278 (ListLongMap!5455 (_ BitVec 64) V!13949 (_ BitVec 64)) Unit!11958)

(assert (=> b!390759 (= lt!184257 (addApplyDifferent!278 lt!184253 lt!184249 minValue!472 lt!184261))))

(declare-fun apply!302 (ListLongMap!5455 (_ BitVec 64)) V!13949)

(assert (=> b!390759 (= (apply!302 (+!1038 lt!184253 (tuple2!6543 lt!184249 minValue!472)) lt!184261) (apply!302 lt!184253 lt!184261))))

(declare-fun lt!184248 () Unit!11958)

(assert (=> b!390759 (= lt!184248 lt!184257)))

(declare-fun lt!184252 () ListLongMap!5455)

(assert (=> b!390759 (= lt!184252 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184254 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184244 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184244 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(declare-fun lt!184263 () Unit!11958)

(assert (=> b!390759 (= lt!184263 (addApplyDifferent!278 lt!184252 lt!184254 zeroValue!472 lt!184244))))

(assert (=> b!390759 (= (apply!302 (+!1038 lt!184252 (tuple2!6543 lt!184254 zeroValue!472)) lt!184244) (apply!302 lt!184252 lt!184244))))

(declare-fun lt!184255 () Unit!11958)

(assert (=> b!390759 (= lt!184255 lt!184263)))

(declare-fun lt!184247 () ListLongMap!5455)

(assert (=> b!390759 (= lt!184247 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184243 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184245 () (_ BitVec 64))

(assert (=> b!390759 (= lt!184245 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(assert (=> b!390759 (= lt!184262 (addApplyDifferent!278 lt!184247 lt!184243 minValue!472 lt!184245))))

(assert (=> b!390759 (= (apply!302 (+!1038 lt!184247 (tuple2!6543 lt!184243 minValue!472)) lt!184245) (apply!302 lt!184247 lt!184245))))

(declare-fun e!236702 () Bool)

(declare-fun b!390760 () Bool)

(declare-fun get!5586 (ValueCell!4473 V!13949) V!13949)

(declare-fun dynLambda!645 (Int (_ BitVec 64)) V!13949)

(assert (=> b!390760 (= e!236702 (= (apply!302 lt!184246 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)) (get!5586 (select (arr!11047 lt!184139) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11399 lt!184139)))))

(assert (=> b!390760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun bm!27557 () Bool)

(declare-fun call!27560 () ListLongMap!5455)

(declare-fun call!27559 () ListLongMap!5455)

(assert (=> bm!27557 (= call!27560 call!27559)))

(declare-fun d!73027 () Bool)

(declare-fun e!236707 () Bool)

(assert (=> d!73027 e!236707))

(declare-fun res!223624 () Bool)

(assert (=> d!73027 (=> (not res!223624) (not e!236707))))

(assert (=> d!73027 (= res!223624 (or (bvsge #b00000000000000000000000000000000 (size!11398 lt!184145)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))))

(declare-fun lt!184260 () ListLongMap!5455)

(assert (=> d!73027 (= lt!184246 lt!184260)))

(declare-fun lt!184259 () Unit!11958)

(assert (=> d!73027 (= lt!184259 e!236708)))

(declare-fun c!54199 () Bool)

(declare-fun e!236699 () Bool)

(assert (=> d!73027 (= c!54199 e!236699)))

(declare-fun res!223625 () Bool)

(assert (=> d!73027 (=> (not res!223625) (not e!236699))))

(assert (=> d!73027 (= res!223625 (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(assert (=> d!73027 (= lt!184260 e!236705)))

(declare-fun c!54203 () Bool)

(assert (=> d!73027 (= c!54203 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73027 (validMask!0 mask!970)))

(assert (=> d!73027 (= (getCurrentListMap!2089 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184246)))

(declare-fun b!390761 () Bool)

(declare-fun e!236696 () Bool)

(assert (=> b!390761 (= e!236696 (= (apply!302 lt!184246 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390762 () Bool)

(declare-fun e!236703 () Bool)

(assert (=> b!390762 (= e!236703 (= (apply!302 lt!184246 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390763 () Bool)

(declare-fun res!223631 () Bool)

(assert (=> b!390763 (=> (not res!223631) (not e!236707))))

(declare-fun e!236706 () Bool)

(assert (=> b!390763 (= res!223631 e!236706)))

(declare-fun c!54200 () Bool)

(assert (=> b!390763 (= c!54200 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390764 () Bool)

(declare-fun e!236700 () Bool)

(assert (=> b!390764 (= e!236700 (not call!27565))))

(declare-fun bm!27558 () Bool)

(declare-fun call!27563 () Bool)

(assert (=> bm!27558 (= call!27563 (contains!2456 lt!184246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390765 () Bool)

(declare-fun c!54198 () Bool)

(assert (=> b!390765 (= c!54198 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236704 () ListLongMap!5455)

(assert (=> b!390765 (= e!236697 e!236704)))

(declare-fun b!390766 () Bool)

(assert (=> b!390766 (= e!236706 e!236703)))

(declare-fun res!223627 () Bool)

(assert (=> b!390766 (= res!223627 call!27563)))

(assert (=> b!390766 (=> (not res!223627) (not e!236703))))

(declare-fun bm!27559 () Bool)

(declare-fun call!27561 () ListLongMap!5455)

(declare-fun call!27564 () ListLongMap!5455)

(assert (=> bm!27559 (= call!27561 call!27564)))

(declare-fun b!390767 () Bool)

(declare-fun res!223626 () Bool)

(assert (=> b!390767 (=> (not res!223626) (not e!236707))))

(declare-fun e!236701 () Bool)

(assert (=> b!390767 (= res!223626 e!236701)))

(declare-fun res!223623 () Bool)

(assert (=> b!390767 (=> res!223623 e!236701)))

(declare-fun e!236698 () Bool)

(assert (=> b!390767 (= res!223623 (not e!236698))))

(declare-fun res!223628 () Bool)

(assert (=> b!390767 (=> (not res!223628) (not e!236698))))

(assert (=> b!390767 (= res!223628 (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun b!390768 () Bool)

(assert (=> b!390768 (= e!236698 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun b!390769 () Bool)

(declare-fun Unit!11962 () Unit!11958)

(assert (=> b!390769 (= e!236708 Unit!11962)))

(declare-fun b!390770 () Bool)

(assert (=> b!390770 (= e!236701 e!236702)))

(declare-fun res!223629 () Bool)

(assert (=> b!390770 (=> (not res!223629) (not e!236702))))

(assert (=> b!390770 (= res!223629 (contains!2456 lt!184246 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(assert (=> b!390770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun b!390771 () Bool)

(assert (=> b!390771 (= e!236697 call!27560)))

(declare-fun bm!27560 () Bool)

(declare-fun call!27562 () ListLongMap!5455)

(assert (=> bm!27560 (= call!27564 call!27562)))

(declare-fun b!390772 () Bool)

(assert (=> b!390772 (= e!236705 (+!1038 call!27559 (tuple2!6543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390773 () Bool)

(assert (=> b!390773 (= e!236700 e!236696)))

(declare-fun res!223630 () Bool)

(assert (=> b!390773 (= res!223630 call!27565)))

(assert (=> b!390773 (=> (not res!223630) (not e!236696))))

(declare-fun b!390774 () Bool)

(assert (=> b!390774 (= e!236699 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun b!390775 () Bool)

(assert (=> b!390775 (= e!236706 (not call!27563))))

(declare-fun bm!27561 () Bool)

(assert (=> bm!27561 (= call!27562 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390776 () Bool)

(assert (=> b!390776 (= e!236707 e!236700)))

(declare-fun c!54202 () Bool)

(assert (=> b!390776 (= c!54202 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390777 () Bool)

(assert (=> b!390777 (= e!236704 call!27560)))

(declare-fun bm!27562 () Bool)

(assert (=> bm!27562 (= call!27559 (+!1038 (ite c!54203 call!27562 (ite c!54201 call!27564 call!27561)) (ite (or c!54203 c!54201) (tuple2!6543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390778 () Bool)

(assert (=> b!390778 (= e!236704 call!27561)))

(assert (= (and d!73027 c!54203) b!390772))

(assert (= (and d!73027 (not c!54203)) b!390758))

(assert (= (and b!390758 c!54201) b!390771))

(assert (= (and b!390758 (not c!54201)) b!390765))

(assert (= (and b!390765 c!54198) b!390777))

(assert (= (and b!390765 (not c!54198)) b!390778))

(assert (= (or b!390777 b!390778) bm!27559))

(assert (= (or b!390771 bm!27559) bm!27560))

(assert (= (or b!390771 b!390777) bm!27557))

(assert (= (or b!390772 bm!27560) bm!27561))

(assert (= (or b!390772 bm!27557) bm!27562))

(assert (= (and d!73027 res!223625) b!390774))

(assert (= (and d!73027 c!54199) b!390759))

(assert (= (and d!73027 (not c!54199)) b!390769))

(assert (= (and d!73027 res!223624) b!390767))

(assert (= (and b!390767 res!223628) b!390768))

(assert (= (and b!390767 (not res!223623)) b!390770))

(assert (= (and b!390770 res!223629) b!390760))

(assert (= (and b!390767 res!223626) b!390763))

(assert (= (and b!390763 c!54200) b!390766))

(assert (= (and b!390763 (not c!54200)) b!390775))

(assert (= (and b!390766 res!223627) b!390762))

(assert (= (or b!390766 b!390775) bm!27558))

(assert (= (and b!390763 res!223631) b!390776))

(assert (= (and b!390776 c!54202) b!390773))

(assert (= (and b!390776 (not c!54202)) b!390764))

(assert (= (and b!390773 res!223630) b!390761))

(assert (= (or b!390773 b!390764) bm!27556))

(declare-fun b_lambda!8647 () Bool)

(assert (=> (not b_lambda!8647) (not b!390760)))

(declare-fun t!11562 () Bool)

(declare-fun tb!3119 () Bool)

(assert (=> (and start!37970 (= defaultEntry!514 defaultEntry!514) t!11562) tb!3119))

(declare-fun result!5737 () Bool)

(assert (=> tb!3119 (= result!5737 tp_is_empty!9633)))

(assert (=> b!390760 t!11562))

(declare-fun b_and!16267 () Bool)

(assert (= b_and!16263 (and (=> t!11562 result!5737) b_and!16267)))

(declare-fun m!387083 () Bool)

(assert (=> bm!27556 m!387083))

(assert (=> d!73027 m!386975))

(assert (=> bm!27561 m!386963))

(declare-fun m!387085 () Bool)

(assert (=> bm!27562 m!387085))

(declare-fun m!387087 () Bool)

(assert (=> bm!27558 m!387087))

(declare-fun m!387089 () Bool)

(assert (=> b!390761 m!387089))

(assert (=> b!390770 m!387039))

(assert (=> b!390770 m!387039))

(declare-fun m!387091 () Bool)

(assert (=> b!390770 m!387091))

(declare-fun m!387093 () Bool)

(assert (=> b!390762 m!387093))

(declare-fun m!387095 () Bool)

(assert (=> b!390760 m!387095))

(declare-fun m!387097 () Bool)

(assert (=> b!390760 m!387097))

(assert (=> b!390760 m!387039))

(assert (=> b!390760 m!387039))

(declare-fun m!387099 () Bool)

(assert (=> b!390760 m!387099))

(assert (=> b!390760 m!387097))

(assert (=> b!390760 m!387095))

(declare-fun m!387101 () Bool)

(assert (=> b!390760 m!387101))

(declare-fun m!387103 () Bool)

(assert (=> b!390772 m!387103))

(declare-fun m!387105 () Bool)

(assert (=> b!390759 m!387105))

(declare-fun m!387107 () Bool)

(assert (=> b!390759 m!387107))

(declare-fun m!387109 () Bool)

(assert (=> b!390759 m!387109))

(declare-fun m!387111 () Bool)

(assert (=> b!390759 m!387111))

(declare-fun m!387113 () Bool)

(assert (=> b!390759 m!387113))

(declare-fun m!387115 () Bool)

(assert (=> b!390759 m!387115))

(assert (=> b!390759 m!387107))

(assert (=> b!390759 m!387039))

(declare-fun m!387117 () Bool)

(assert (=> b!390759 m!387117))

(declare-fun m!387119 () Bool)

(assert (=> b!390759 m!387119))

(declare-fun m!387121 () Bool)

(assert (=> b!390759 m!387121))

(declare-fun m!387123 () Bool)

(assert (=> b!390759 m!387123))

(declare-fun m!387125 () Bool)

(assert (=> b!390759 m!387125))

(declare-fun m!387127 () Bool)

(assert (=> b!390759 m!387127))

(assert (=> b!390759 m!387111))

(assert (=> b!390759 m!387125))

(assert (=> b!390759 m!386963))

(declare-fun m!387129 () Bool)

(assert (=> b!390759 m!387129))

(declare-fun m!387131 () Bool)

(assert (=> b!390759 m!387131))

(assert (=> b!390759 m!387123))

(declare-fun m!387133 () Bool)

(assert (=> b!390759 m!387133))

(assert (=> b!390768 m!387039))

(assert (=> b!390768 m!387039))

(assert (=> b!390768 m!387041))

(assert (=> b!390774 m!387039))

(assert (=> b!390774 m!387039))

(assert (=> b!390774 m!387041))

(assert (=> b!390620 d!73027))

(declare-fun b!390805 () Bool)

(declare-fun e!236723 () ListLongMap!5455)

(declare-fun call!27568 () ListLongMap!5455)

(assert (=> b!390805 (= e!236723 call!27568)))

(declare-fun b!390806 () Bool)

(declare-fun e!236728 () Bool)

(declare-fun e!236729 () Bool)

(assert (=> b!390806 (= e!236728 e!236729)))

(declare-fun c!54212 () Bool)

(declare-fun e!236724 () Bool)

(assert (=> b!390806 (= c!54212 e!236724)))

(declare-fun res!223640 () Bool)

(assert (=> b!390806 (=> (not res!223640) (not e!236724))))

(assert (=> b!390806 (= res!223640 (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun bm!27565 () Bool)

(assert (=> bm!27565 (= call!27568 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390807 () Bool)

(declare-fun lt!184285 () Unit!11958)

(declare-fun lt!184281 () Unit!11958)

(assert (=> b!390807 (= lt!184285 lt!184281)))

(declare-fun lt!184282 () (_ BitVec 64))

(declare-fun lt!184284 () ListLongMap!5455)

(declare-fun lt!184279 () (_ BitVec 64))

(declare-fun lt!184283 () V!13949)

(assert (=> b!390807 (not (contains!2456 (+!1038 lt!184284 (tuple2!6543 lt!184282 lt!184283)) lt!184279))))

(declare-fun addStillNotContains!135 (ListLongMap!5455 (_ BitVec 64) V!13949 (_ BitVec 64)) Unit!11958)

(assert (=> b!390807 (= lt!184281 (addStillNotContains!135 lt!184284 lt!184282 lt!184283 lt!184279))))

(assert (=> b!390807 (= lt!184279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390807 (= lt!184283 (get!5586 (select (arr!11047 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390807 (= lt!184282 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390807 (= lt!184284 call!27568)))

(assert (=> b!390807 (= e!236723 (+!1038 call!27568 (tuple2!6543 (select (arr!11046 _keys!658) #b00000000000000000000000000000000) (get!5586 (select (arr!11047 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!73029 () Bool)

(assert (=> d!73029 e!236728))

(declare-fun res!223643 () Bool)

(assert (=> d!73029 (=> (not res!223643) (not e!236728))))

(declare-fun lt!184280 () ListLongMap!5455)

(assert (=> d!73029 (= res!223643 (not (contains!2456 lt!184280 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236727 () ListLongMap!5455)

(assert (=> d!73029 (= lt!184280 e!236727)))

(declare-fun c!54214 () Bool)

(assert (=> d!73029 (= c!54214 (bvsge #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> d!73029 (validMask!0 mask!970)))

(assert (=> d!73029 (= (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184280)))

(declare-fun b!390808 () Bool)

(declare-fun e!236725 () Bool)

(assert (=> b!390808 (= e!236729 e!236725)))

(declare-fun c!54215 () Bool)

(assert (=> b!390808 (= c!54215 (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun b!390809 () Bool)

(assert (=> b!390809 (= e!236724 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390809 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390810 () Bool)

(assert (=> b!390810 (= e!236727 e!236723)))

(declare-fun c!54213 () Bool)

(assert (=> b!390810 (= c!54213 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390811 () Bool)

(declare-fun isEmpty!548 (ListLongMap!5455) Bool)

(assert (=> b!390811 (= e!236725 (isEmpty!548 lt!184280))))

(declare-fun b!390812 () Bool)

(declare-fun e!236726 () Bool)

(assert (=> b!390812 (= e!236729 e!236726)))

(assert (=> b!390812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun res!223641 () Bool)

(assert (=> b!390812 (= res!223641 (contains!2456 lt!184280 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390812 (=> (not res!223641) (not e!236726))))

(declare-fun b!390813 () Bool)

(declare-fun res!223642 () Bool)

(assert (=> b!390813 (=> (not res!223642) (not e!236728))))

(assert (=> b!390813 (= res!223642 (not (contains!2456 lt!184280 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390814 () Bool)

(assert (=> b!390814 (= e!236727 (ListLongMap!5456 Nil!6394))))

(declare-fun b!390815 () Bool)

(assert (=> b!390815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> b!390815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11399 _values!506)))))

(assert (=> b!390815 (= e!236726 (= (apply!302 lt!184280 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)) (get!5586 (select (arr!11047 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390816 () Bool)

(assert (=> b!390816 (= e!236725 (= lt!184280 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!73029 c!54214) b!390814))

(assert (= (and d!73029 (not c!54214)) b!390810))

(assert (= (and b!390810 c!54213) b!390807))

(assert (= (and b!390810 (not c!54213)) b!390805))

(assert (= (or b!390807 b!390805) bm!27565))

(assert (= (and d!73029 res!223643) b!390813))

(assert (= (and b!390813 res!223642) b!390806))

(assert (= (and b!390806 res!223640) b!390809))

(assert (= (and b!390806 c!54212) b!390812))

(assert (= (and b!390806 (not c!54212)) b!390808))

(assert (= (and b!390812 res!223641) b!390815))

(assert (= (and b!390808 c!54215) b!390816))

(assert (= (and b!390808 (not c!54215)) b!390811))

(declare-fun b_lambda!8649 () Bool)

(assert (=> (not b_lambda!8649) (not b!390807)))

(assert (=> b!390807 t!11562))

(declare-fun b_and!16269 () Bool)

(assert (= b_and!16267 (and (=> t!11562 result!5737) b_and!16269)))

(declare-fun b_lambda!8651 () Bool)

(assert (=> (not b_lambda!8651) (not b!390815)))

(assert (=> b!390815 t!11562))

(declare-fun b_and!16271 () Bool)

(assert (= b_and!16269 (and (=> t!11562 result!5737) b_and!16271)))

(declare-fun m!387135 () Bool)

(assert (=> b!390815 m!387135))

(assert (=> b!390815 m!387079))

(assert (=> b!390815 m!387079))

(declare-fun m!387137 () Bool)

(assert (=> b!390815 m!387137))

(assert (=> b!390815 m!387135))

(assert (=> b!390815 m!387095))

(declare-fun m!387139 () Bool)

(assert (=> b!390815 m!387139))

(assert (=> b!390815 m!387095))

(declare-fun m!387141 () Bool)

(assert (=> bm!27565 m!387141))

(declare-fun m!387143 () Bool)

(assert (=> b!390813 m!387143))

(assert (=> b!390807 m!387135))

(declare-fun m!387145 () Bool)

(assert (=> b!390807 m!387145))

(declare-fun m!387147 () Bool)

(assert (=> b!390807 m!387147))

(declare-fun m!387149 () Bool)

(assert (=> b!390807 m!387149))

(declare-fun m!387151 () Bool)

(assert (=> b!390807 m!387151))

(assert (=> b!390807 m!387079))

(assert (=> b!390807 m!387149))

(assert (=> b!390807 m!387135))

(assert (=> b!390807 m!387095))

(assert (=> b!390807 m!387139))

(assert (=> b!390807 m!387095))

(assert (=> b!390809 m!387079))

(assert (=> b!390809 m!387079))

(declare-fun m!387153 () Bool)

(assert (=> b!390809 m!387153))

(declare-fun m!387155 () Bool)

(assert (=> d!73029 m!387155))

(assert (=> d!73029 m!386975))

(assert (=> b!390810 m!387079))

(assert (=> b!390810 m!387079))

(assert (=> b!390810 m!387153))

(assert (=> b!390816 m!387141))

(declare-fun m!387157 () Bool)

(assert (=> b!390811 m!387157))

(assert (=> b!390812 m!387079))

(assert (=> b!390812 m!387079))

(declare-fun m!387159 () Bool)

(assert (=> b!390812 m!387159))

(assert (=> b!390620 d!73029))

(declare-fun b!390817 () Bool)

(declare-fun e!236739 () ListLongMap!5455)

(declare-fun e!236731 () ListLongMap!5455)

(assert (=> b!390817 (= e!236739 e!236731)))

(declare-fun c!54219 () Bool)

(assert (=> b!390817 (= c!54219 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27566 () Bool)

(declare-fun call!27575 () Bool)

(declare-fun lt!184289 () ListLongMap!5455)

(assert (=> bm!27566 (= call!27575 (contains!2456 lt!184289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390818 () Bool)

(declare-fun e!236742 () Unit!11958)

(declare-fun lt!184305 () Unit!11958)

(assert (=> b!390818 (= e!236742 lt!184305)))

(declare-fun lt!184301 () ListLongMap!5455)

(assert (=> b!390818 (= lt!184301 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184299 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184293 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184293 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184294 () Unit!11958)

(assert (=> b!390818 (= lt!184294 (addStillContains!278 lt!184301 lt!184299 zeroValue!472 lt!184293))))

(assert (=> b!390818 (contains!2456 (+!1038 lt!184301 (tuple2!6543 lt!184299 zeroValue!472)) lt!184293)))

(declare-fun lt!184307 () Unit!11958)

(assert (=> b!390818 (= lt!184307 lt!184294)))

(declare-fun lt!184296 () ListLongMap!5455)

(assert (=> b!390818 (= lt!184296 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184292 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184292 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184304 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184304 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184300 () Unit!11958)

(assert (=> b!390818 (= lt!184300 (addApplyDifferent!278 lt!184296 lt!184292 minValue!472 lt!184304))))

(assert (=> b!390818 (= (apply!302 (+!1038 lt!184296 (tuple2!6543 lt!184292 minValue!472)) lt!184304) (apply!302 lt!184296 lt!184304))))

(declare-fun lt!184291 () Unit!11958)

(assert (=> b!390818 (= lt!184291 lt!184300)))

(declare-fun lt!184295 () ListLongMap!5455)

(assert (=> b!390818 (= lt!184295 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184297 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184287 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184287 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184306 () Unit!11958)

(assert (=> b!390818 (= lt!184306 (addApplyDifferent!278 lt!184295 lt!184297 zeroValue!472 lt!184287))))

(assert (=> b!390818 (= (apply!302 (+!1038 lt!184295 (tuple2!6543 lt!184297 zeroValue!472)) lt!184287) (apply!302 lt!184295 lt!184287))))

(declare-fun lt!184298 () Unit!11958)

(assert (=> b!390818 (= lt!184298 lt!184306)))

(declare-fun lt!184290 () ListLongMap!5455)

(assert (=> b!390818 (= lt!184290 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184286 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184286 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184288 () (_ BitVec 64))

(assert (=> b!390818 (= lt!184288 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390818 (= lt!184305 (addApplyDifferent!278 lt!184290 lt!184286 minValue!472 lt!184288))))

(assert (=> b!390818 (= (apply!302 (+!1038 lt!184290 (tuple2!6543 lt!184286 minValue!472)) lt!184288) (apply!302 lt!184290 lt!184288))))

(declare-fun e!236736 () Bool)

(declare-fun b!390819 () Bool)

(assert (=> b!390819 (= e!236736 (= (apply!302 lt!184289 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)) (get!5586 (select (arr!11047 _values!506) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11399 _values!506)))))

(assert (=> b!390819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun bm!27567 () Bool)

(declare-fun call!27570 () ListLongMap!5455)

(declare-fun call!27569 () ListLongMap!5455)

(assert (=> bm!27567 (= call!27570 call!27569)))

(declare-fun d!73031 () Bool)

(declare-fun e!236741 () Bool)

(assert (=> d!73031 e!236741))

(declare-fun res!223645 () Bool)

(assert (=> d!73031 (=> (not res!223645) (not e!236741))))

(assert (=> d!73031 (= res!223645 (or (bvsge #b00000000000000000000000000000000 (size!11398 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))))

(declare-fun lt!184303 () ListLongMap!5455)

(assert (=> d!73031 (= lt!184289 lt!184303)))

(declare-fun lt!184302 () Unit!11958)

(assert (=> d!73031 (= lt!184302 e!236742)))

(declare-fun c!54217 () Bool)

(declare-fun e!236733 () Bool)

(assert (=> d!73031 (= c!54217 e!236733)))

(declare-fun res!223646 () Bool)

(assert (=> d!73031 (=> (not res!223646) (not e!236733))))

(assert (=> d!73031 (= res!223646 (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> d!73031 (= lt!184303 e!236739)))

(declare-fun c!54221 () Bool)

(assert (=> d!73031 (= c!54221 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73031 (validMask!0 mask!970)))

(assert (=> d!73031 (= (getCurrentListMap!2089 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184289)))

(declare-fun b!390820 () Bool)

(declare-fun e!236730 () Bool)

(assert (=> b!390820 (= e!236730 (= (apply!302 lt!184289 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390821 () Bool)

(declare-fun e!236737 () Bool)

(assert (=> b!390821 (= e!236737 (= (apply!302 lt!184289 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390822 () Bool)

(declare-fun res!223652 () Bool)

(assert (=> b!390822 (=> (not res!223652) (not e!236741))))

(declare-fun e!236740 () Bool)

(assert (=> b!390822 (= res!223652 e!236740)))

(declare-fun c!54218 () Bool)

(assert (=> b!390822 (= c!54218 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390823 () Bool)

(declare-fun e!236734 () Bool)

(assert (=> b!390823 (= e!236734 (not call!27575))))

(declare-fun bm!27568 () Bool)

(declare-fun call!27573 () Bool)

(assert (=> bm!27568 (= call!27573 (contains!2456 lt!184289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390824 () Bool)

(declare-fun c!54216 () Bool)

(assert (=> b!390824 (= c!54216 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236738 () ListLongMap!5455)

(assert (=> b!390824 (= e!236731 e!236738)))

(declare-fun b!390825 () Bool)

(assert (=> b!390825 (= e!236740 e!236737)))

(declare-fun res!223648 () Bool)

(assert (=> b!390825 (= res!223648 call!27573)))

(assert (=> b!390825 (=> (not res!223648) (not e!236737))))

(declare-fun bm!27569 () Bool)

(declare-fun call!27571 () ListLongMap!5455)

(declare-fun call!27574 () ListLongMap!5455)

(assert (=> bm!27569 (= call!27571 call!27574)))

(declare-fun b!390826 () Bool)

(declare-fun res!223647 () Bool)

(assert (=> b!390826 (=> (not res!223647) (not e!236741))))

(declare-fun e!236735 () Bool)

(assert (=> b!390826 (= res!223647 e!236735)))

(declare-fun res!223644 () Bool)

(assert (=> b!390826 (=> res!223644 e!236735)))

(declare-fun e!236732 () Bool)

(assert (=> b!390826 (= res!223644 (not e!236732))))

(declare-fun res!223649 () Bool)

(assert (=> b!390826 (=> (not res!223649) (not e!236732))))

(assert (=> b!390826 (= res!223649 (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun b!390827 () Bool)

(assert (=> b!390827 (= e!236732 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390828 () Bool)

(declare-fun Unit!11963 () Unit!11958)

(assert (=> b!390828 (= e!236742 Unit!11963)))

(declare-fun b!390829 () Bool)

(assert (=> b!390829 (= e!236735 e!236736)))

(declare-fun res!223650 () Bool)

(assert (=> b!390829 (=> (not res!223650) (not e!236736))))

(assert (=> b!390829 (= res!223650 (contains!2456 lt!184289 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(declare-fun b!390830 () Bool)

(assert (=> b!390830 (= e!236731 call!27570)))

(declare-fun bm!27570 () Bool)

(declare-fun call!27572 () ListLongMap!5455)

(assert (=> bm!27570 (= call!27574 call!27572)))

(declare-fun b!390831 () Bool)

(assert (=> b!390831 (= e!236739 (+!1038 call!27569 (tuple2!6543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!390832 () Bool)

(assert (=> b!390832 (= e!236734 e!236730)))

(declare-fun res!223651 () Bool)

(assert (=> b!390832 (= res!223651 call!27575)))

(assert (=> b!390832 (=> (not res!223651) (not e!236730))))

(declare-fun b!390833 () Bool)

(assert (=> b!390833 (= e!236733 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390834 () Bool)

(assert (=> b!390834 (= e!236740 (not call!27573))))

(declare-fun bm!27571 () Bool)

(assert (=> bm!27571 (= call!27572 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390835 () Bool)

(assert (=> b!390835 (= e!236741 e!236734)))

(declare-fun c!54220 () Bool)

(assert (=> b!390835 (= c!54220 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390836 () Bool)

(assert (=> b!390836 (= e!236738 call!27570)))

(declare-fun bm!27572 () Bool)

(assert (=> bm!27572 (= call!27569 (+!1038 (ite c!54221 call!27572 (ite c!54219 call!27574 call!27571)) (ite (or c!54221 c!54219) (tuple2!6543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390837 () Bool)

(assert (=> b!390837 (= e!236738 call!27571)))

(assert (= (and d!73031 c!54221) b!390831))

(assert (= (and d!73031 (not c!54221)) b!390817))

(assert (= (and b!390817 c!54219) b!390830))

(assert (= (and b!390817 (not c!54219)) b!390824))

(assert (= (and b!390824 c!54216) b!390836))

(assert (= (and b!390824 (not c!54216)) b!390837))

(assert (= (or b!390836 b!390837) bm!27569))

(assert (= (or b!390830 bm!27569) bm!27570))

(assert (= (or b!390830 b!390836) bm!27567))

(assert (= (or b!390831 bm!27570) bm!27571))

(assert (= (or b!390831 bm!27567) bm!27572))

(assert (= (and d!73031 res!223646) b!390833))

(assert (= (and d!73031 c!54217) b!390818))

(assert (= (and d!73031 (not c!54217)) b!390828))

(assert (= (and d!73031 res!223645) b!390826))

(assert (= (and b!390826 res!223649) b!390827))

(assert (= (and b!390826 (not res!223644)) b!390829))

(assert (= (and b!390829 res!223650) b!390819))

(assert (= (and b!390826 res!223647) b!390822))

(assert (= (and b!390822 c!54218) b!390825))

(assert (= (and b!390822 (not c!54218)) b!390834))

(assert (= (and b!390825 res!223648) b!390821))

(assert (= (or b!390825 b!390834) bm!27568))

(assert (= (and b!390822 res!223652) b!390835))

(assert (= (and b!390835 c!54220) b!390832))

(assert (= (and b!390835 (not c!54220)) b!390823))

(assert (= (and b!390832 res!223651) b!390820))

(assert (= (or b!390832 b!390823) bm!27566))

(declare-fun b_lambda!8653 () Bool)

(assert (=> (not b_lambda!8653) (not b!390819)))

(assert (=> b!390819 t!11562))

(declare-fun b_and!16273 () Bool)

(assert (= b_and!16271 (and (=> t!11562 result!5737) b_and!16273)))

(declare-fun m!387161 () Bool)

(assert (=> bm!27566 m!387161))

(assert (=> d!73031 m!386975))

(assert (=> bm!27571 m!386957))

(declare-fun m!387163 () Bool)

(assert (=> bm!27572 m!387163))

(declare-fun m!387165 () Bool)

(assert (=> bm!27568 m!387165))

(declare-fun m!387167 () Bool)

(assert (=> b!390820 m!387167))

(assert (=> b!390829 m!387079))

(assert (=> b!390829 m!387079))

(declare-fun m!387169 () Bool)

(assert (=> b!390829 m!387169))

(declare-fun m!387171 () Bool)

(assert (=> b!390821 m!387171))

(assert (=> b!390819 m!387095))

(assert (=> b!390819 m!387135))

(assert (=> b!390819 m!387079))

(assert (=> b!390819 m!387079))

(declare-fun m!387173 () Bool)

(assert (=> b!390819 m!387173))

(assert (=> b!390819 m!387135))

(assert (=> b!390819 m!387095))

(assert (=> b!390819 m!387139))

(declare-fun m!387175 () Bool)

(assert (=> b!390831 m!387175))

(declare-fun m!387177 () Bool)

(assert (=> b!390818 m!387177))

(declare-fun m!387179 () Bool)

(assert (=> b!390818 m!387179))

(declare-fun m!387181 () Bool)

(assert (=> b!390818 m!387181))

(declare-fun m!387183 () Bool)

(assert (=> b!390818 m!387183))

(declare-fun m!387185 () Bool)

(assert (=> b!390818 m!387185))

(declare-fun m!387187 () Bool)

(assert (=> b!390818 m!387187))

(assert (=> b!390818 m!387179))

(assert (=> b!390818 m!387079))

(declare-fun m!387189 () Bool)

(assert (=> b!390818 m!387189))

(declare-fun m!387191 () Bool)

(assert (=> b!390818 m!387191))

(declare-fun m!387193 () Bool)

(assert (=> b!390818 m!387193))

(declare-fun m!387195 () Bool)

(assert (=> b!390818 m!387195))

(declare-fun m!387197 () Bool)

(assert (=> b!390818 m!387197))

(declare-fun m!387199 () Bool)

(assert (=> b!390818 m!387199))

(assert (=> b!390818 m!387183))

(assert (=> b!390818 m!387197))

(assert (=> b!390818 m!386957))

(declare-fun m!387201 () Bool)

(assert (=> b!390818 m!387201))

(declare-fun m!387203 () Bool)

(assert (=> b!390818 m!387203))

(assert (=> b!390818 m!387195))

(declare-fun m!387205 () Bool)

(assert (=> b!390818 m!387205))

(assert (=> b!390827 m!387079))

(assert (=> b!390827 m!387079))

(assert (=> b!390827 m!387153))

(assert (=> b!390833 m!387079))

(assert (=> b!390833 m!387079))

(assert (=> b!390833 m!387153))

(assert (=> b!390620 d!73031))

(declare-fun call!27580 () ListLongMap!5455)

(declare-fun bm!27577 () Bool)

(assert (=> bm!27577 (= call!27580 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun e!236748 () Bool)

(declare-fun call!27581 () ListLongMap!5455)

(declare-fun b!390844 () Bool)

(assert (=> b!390844 (= e!236748 (= call!27581 (+!1038 call!27580 (tuple2!6543 k0!778 v!373))))))

(declare-fun b!390845 () Bool)

(assert (=> b!390845 (= e!236748 (= call!27581 call!27580))))

(declare-fun b!390846 () Bool)

(declare-fun e!236747 () Bool)

(assert (=> b!390846 (= e!236747 e!236748)))

(declare-fun c!54224 () Bool)

(assert (=> b!390846 (= c!54224 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73033 () Bool)

(assert (=> d!73033 e!236747))

(declare-fun res!223655 () Bool)

(assert (=> d!73033 (=> (not res!223655) (not e!236747))))

(assert (=> d!73033 (= res!223655 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11398 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11399 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11398 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11399 _values!506))))))))

(declare-fun lt!184310 () Unit!11958)

(declare-fun choose!1317 (array!23165 array!23167 (_ BitVec 32) (_ BitVec 32) V!13949 V!13949 (_ BitVec 32) (_ BitVec 64) V!13949 (_ BitVec 32) Int) Unit!11958)

(assert (=> d!73033 (= lt!184310 (choose!1317 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> d!73033 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!253 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184310)))

(declare-fun bm!27578 () Bool)

(assert (=> bm!27578 (= call!27581 (getCurrentListMapNoExtraKeys!969 (array!23166 (store (arr!11046 _keys!658) i!548 k0!778) (size!11398 _keys!658)) (array!23168 (store (arr!11047 _values!506) i!548 (ValueCellFull!4473 v!373)) (size!11399 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73033 res!223655) b!390846))

(assert (= (and b!390846 c!54224) b!390844))

(assert (= (and b!390846 (not c!54224)) b!390845))

(assert (= (or b!390844 b!390845) bm!27577))

(assert (= (or b!390844 b!390845) bm!27578))

(assert (=> bm!27577 m!386957))

(declare-fun m!387207 () Bool)

(assert (=> b!390844 m!387207))

(declare-fun m!387209 () Bool)

(assert (=> d!73033 m!387209))

(assert (=> bm!27578 m!386991))

(assert (=> bm!27578 m!386965))

(declare-fun m!387211 () Bool)

(assert (=> bm!27578 m!387211))

(assert (=> b!390620 d!73033))

(declare-fun d!73035 () Bool)

(declare-fun e!236749 () Bool)

(assert (=> d!73035 e!236749))

(declare-fun res!223657 () Bool)

(assert (=> d!73035 (=> (not res!223657) (not e!236749))))

(declare-fun lt!184314 () ListLongMap!5455)

(assert (=> d!73035 (= res!223657 (contains!2456 lt!184314 (_1!3282 (tuple2!6543 k0!778 v!373))))))

(declare-fun lt!184312 () List!6397)

(assert (=> d!73035 (= lt!184314 (ListLongMap!5456 lt!184312))))

(declare-fun lt!184313 () Unit!11958)

(declare-fun lt!184311 () Unit!11958)

(assert (=> d!73035 (= lt!184313 lt!184311)))

(assert (=> d!73035 (= (getValueByKey!360 lt!184312 (_1!3282 (tuple2!6543 k0!778 v!373))) (Some!365 (_2!3282 (tuple2!6543 k0!778 v!373))))))

(assert (=> d!73035 (= lt!184311 (lemmaContainsTupThenGetReturnValue!182 lt!184312 (_1!3282 (tuple2!6543 k0!778 v!373)) (_2!3282 (tuple2!6543 k0!778 v!373))))))

(assert (=> d!73035 (= lt!184312 (insertStrictlySorted!185 (toList!2743 lt!184140) (_1!3282 (tuple2!6543 k0!778 v!373)) (_2!3282 (tuple2!6543 k0!778 v!373))))))

(assert (=> d!73035 (= (+!1038 lt!184140 (tuple2!6543 k0!778 v!373)) lt!184314)))

(declare-fun b!390847 () Bool)

(declare-fun res!223656 () Bool)

(assert (=> b!390847 (=> (not res!223656) (not e!236749))))

(assert (=> b!390847 (= res!223656 (= (getValueByKey!360 (toList!2743 lt!184314) (_1!3282 (tuple2!6543 k0!778 v!373))) (Some!365 (_2!3282 (tuple2!6543 k0!778 v!373)))))))

(declare-fun b!390848 () Bool)

(assert (=> b!390848 (= e!236749 (contains!2457 (toList!2743 lt!184314) (tuple2!6543 k0!778 v!373)))))

(assert (= (and d!73035 res!223657) b!390847))

(assert (= (and b!390847 res!223656) b!390848))

(declare-fun m!387213 () Bool)

(assert (=> d!73035 m!387213))

(declare-fun m!387215 () Bool)

(assert (=> d!73035 m!387215))

(declare-fun m!387217 () Bool)

(assert (=> d!73035 m!387217))

(declare-fun m!387219 () Bool)

(assert (=> d!73035 m!387219))

(declare-fun m!387221 () Bool)

(assert (=> b!390847 m!387221))

(declare-fun m!387223 () Bool)

(assert (=> b!390848 m!387223))

(assert (=> b!390620 d!73035))

(declare-fun b!390849 () Bool)

(declare-fun e!236750 () ListLongMap!5455)

(declare-fun call!27582 () ListLongMap!5455)

(assert (=> b!390849 (= e!236750 call!27582)))

(declare-fun b!390850 () Bool)

(declare-fun e!236755 () Bool)

(declare-fun e!236756 () Bool)

(assert (=> b!390850 (= e!236755 e!236756)))

(declare-fun c!54225 () Bool)

(declare-fun e!236751 () Bool)

(assert (=> b!390850 (= c!54225 e!236751)))

(declare-fun res!223658 () Bool)

(assert (=> b!390850 (=> (not res!223658) (not e!236751))))

(assert (=> b!390850 (= res!223658 (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun bm!27579 () Bool)

(assert (=> bm!27579 (= call!27582 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390851 () Bool)

(declare-fun lt!184321 () Unit!11958)

(declare-fun lt!184317 () Unit!11958)

(assert (=> b!390851 (= lt!184321 lt!184317)))

(declare-fun lt!184319 () V!13949)

(declare-fun lt!184318 () (_ BitVec 64))

(declare-fun lt!184315 () (_ BitVec 64))

(declare-fun lt!184320 () ListLongMap!5455)

(assert (=> b!390851 (not (contains!2456 (+!1038 lt!184320 (tuple2!6543 lt!184318 lt!184319)) lt!184315))))

(assert (=> b!390851 (= lt!184317 (addStillNotContains!135 lt!184320 lt!184318 lt!184319 lt!184315))))

(assert (=> b!390851 (= lt!184315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390851 (= lt!184319 (get!5586 (select (arr!11047 lt!184139) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390851 (= lt!184318 (select (arr!11046 lt!184145) #b00000000000000000000000000000000))))

(assert (=> b!390851 (= lt!184320 call!27582)))

(assert (=> b!390851 (= e!236750 (+!1038 call!27582 (tuple2!6543 (select (arr!11046 lt!184145) #b00000000000000000000000000000000) (get!5586 (select (arr!11047 lt!184139) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!73037 () Bool)

(assert (=> d!73037 e!236755))

(declare-fun res!223661 () Bool)

(assert (=> d!73037 (=> (not res!223661) (not e!236755))))

(declare-fun lt!184316 () ListLongMap!5455)

(assert (=> d!73037 (= res!223661 (not (contains!2456 lt!184316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236754 () ListLongMap!5455)

(assert (=> d!73037 (= lt!184316 e!236754)))

(declare-fun c!54227 () Bool)

(assert (=> d!73037 (= c!54227 (bvsge #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(assert (=> d!73037 (validMask!0 mask!970)))

(assert (=> d!73037 (= (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184316)))

(declare-fun b!390852 () Bool)

(declare-fun e!236752 () Bool)

(assert (=> b!390852 (= e!236756 e!236752)))

(declare-fun c!54228 () Bool)

(assert (=> b!390852 (= c!54228 (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun b!390853 () Bool)

(assert (=> b!390853 (= e!236751 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(assert (=> b!390853 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390854 () Bool)

(assert (=> b!390854 (= e!236754 e!236750)))

(declare-fun c!54226 () Bool)

(assert (=> b!390854 (= c!54226 (validKeyInArray!0 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(declare-fun b!390855 () Bool)

(assert (=> b!390855 (= e!236752 (isEmpty!548 lt!184316))))

(declare-fun b!390856 () Bool)

(declare-fun e!236753 () Bool)

(assert (=> b!390856 (= e!236756 e!236753)))

(assert (=> b!390856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(declare-fun res!223659 () Bool)

(assert (=> b!390856 (= res!223659 (contains!2456 lt!184316 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)))))

(assert (=> b!390856 (=> (not res!223659) (not e!236753))))

(declare-fun b!390857 () Bool)

(declare-fun res!223660 () Bool)

(assert (=> b!390857 (=> (not res!223660) (not e!236755))))

(assert (=> b!390857 (= res!223660 (not (contains!2456 lt!184316 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390858 () Bool)

(assert (=> b!390858 (= e!236754 (ListLongMap!5456 Nil!6394))))

(declare-fun b!390859 () Bool)

(assert (=> b!390859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11398 lt!184145)))))

(assert (=> b!390859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11399 lt!184139)))))

(assert (=> b!390859 (= e!236753 (= (apply!302 lt!184316 (select (arr!11046 lt!184145) #b00000000000000000000000000000000)) (get!5586 (select (arr!11047 lt!184139) #b00000000000000000000000000000000) (dynLambda!645 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390860 () Bool)

(assert (=> b!390860 (= e!236752 (= lt!184316 (getCurrentListMapNoExtraKeys!969 lt!184145 lt!184139 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!73037 c!54227) b!390858))

(assert (= (and d!73037 (not c!54227)) b!390854))

(assert (= (and b!390854 c!54226) b!390851))

(assert (= (and b!390854 (not c!54226)) b!390849))

(assert (= (or b!390851 b!390849) bm!27579))

(assert (= (and d!73037 res!223661) b!390857))

(assert (= (and b!390857 res!223660) b!390850))

(assert (= (and b!390850 res!223658) b!390853))

(assert (= (and b!390850 c!54225) b!390856))

(assert (= (and b!390850 (not c!54225)) b!390852))

(assert (= (and b!390856 res!223659) b!390859))

(assert (= (and b!390852 c!54228) b!390860))

(assert (= (and b!390852 (not c!54228)) b!390855))

(declare-fun b_lambda!8655 () Bool)

(assert (=> (not b_lambda!8655) (not b!390851)))

(assert (=> b!390851 t!11562))

(declare-fun b_and!16275 () Bool)

(assert (= b_and!16273 (and (=> t!11562 result!5737) b_and!16275)))

(declare-fun b_lambda!8657 () Bool)

(assert (=> (not b_lambda!8657) (not b!390859)))

(assert (=> b!390859 t!11562))

(declare-fun b_and!16277 () Bool)

(assert (= b_and!16275 (and (=> t!11562 result!5737) b_and!16277)))

(assert (=> b!390859 m!387097))

(assert (=> b!390859 m!387039))

(assert (=> b!390859 m!387039))

(declare-fun m!387225 () Bool)

(assert (=> b!390859 m!387225))

(assert (=> b!390859 m!387097))

(assert (=> b!390859 m!387095))

(assert (=> b!390859 m!387101))

(assert (=> b!390859 m!387095))

(declare-fun m!387227 () Bool)

(assert (=> bm!27579 m!387227))

(declare-fun m!387229 () Bool)

(assert (=> b!390857 m!387229))

(assert (=> b!390851 m!387097))

(declare-fun m!387231 () Bool)

(assert (=> b!390851 m!387231))

(declare-fun m!387233 () Bool)

(assert (=> b!390851 m!387233))

(declare-fun m!387235 () Bool)

(assert (=> b!390851 m!387235))

(declare-fun m!387237 () Bool)

(assert (=> b!390851 m!387237))

(assert (=> b!390851 m!387039))

(assert (=> b!390851 m!387235))

(assert (=> b!390851 m!387097))

(assert (=> b!390851 m!387095))

(assert (=> b!390851 m!387101))

(assert (=> b!390851 m!387095))

(assert (=> b!390853 m!387039))

(assert (=> b!390853 m!387039))

(assert (=> b!390853 m!387041))

(declare-fun m!387239 () Bool)

(assert (=> d!73037 m!387239))

(assert (=> d!73037 m!386975))

(assert (=> b!390854 m!387039))

(assert (=> b!390854 m!387039))

(assert (=> b!390854 m!387041))

(assert (=> b!390860 m!387227))

(declare-fun m!387241 () Bool)

(assert (=> b!390855 m!387241))

(assert (=> b!390856 m!387039))

(assert (=> b!390856 m!387039))

(declare-fun m!387243 () Bool)

(assert (=> b!390856 m!387243))

(assert (=> b!390620 d!73037))

(declare-fun b!390861 () Bool)

(declare-fun e!236758 () Bool)

(declare-fun e!236759 () Bool)

(assert (=> b!390861 (= e!236758 e!236759)))

(declare-fun res!223663 () Bool)

(assert (=> b!390861 (=> (not res!223663) (not e!236759))))

(declare-fun e!236757 () Bool)

(assert (=> b!390861 (= res!223663 (not e!236757))))

(declare-fun res!223662 () Bool)

(assert (=> b!390861 (=> (not res!223662) (not e!236757))))

(assert (=> b!390861 (= res!223662 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73039 () Bool)

(declare-fun res!223664 () Bool)

(assert (=> d!73039 (=> res!223664 e!236758)))

(assert (=> d!73039 (= res!223664 (bvsge #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> d!73039 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6395) e!236758)))

(declare-fun b!390862 () Bool)

(declare-fun e!236760 () Bool)

(declare-fun call!27583 () Bool)

(assert (=> b!390862 (= e!236760 call!27583)))

(declare-fun bm!27580 () Bool)

(declare-fun c!54229 () Bool)

(assert (=> bm!27580 (= call!27583 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54229 (Cons!6394 (select (arr!11046 _keys!658) #b00000000000000000000000000000000) Nil!6395) Nil!6395)))))

(declare-fun b!390863 () Bool)

(assert (=> b!390863 (= e!236759 e!236760)))

(assert (=> b!390863 (= c!54229 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390864 () Bool)

(assert (=> b!390864 (= e!236757 (contains!2455 Nil!6395 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390865 () Bool)

(assert (=> b!390865 (= e!236760 call!27583)))

(assert (= (and d!73039 (not res!223664)) b!390861))

(assert (= (and b!390861 res!223662) b!390864))

(assert (= (and b!390861 res!223663) b!390863))

(assert (= (and b!390863 c!54229) b!390862))

(assert (= (and b!390863 (not c!54229)) b!390865))

(assert (= (or b!390862 b!390865) bm!27580))

(assert (=> b!390861 m!387079))

(assert (=> b!390861 m!387079))

(assert (=> b!390861 m!387153))

(assert (=> bm!27580 m!387079))

(declare-fun m!387245 () Bool)

(assert (=> bm!27580 m!387245))

(assert (=> b!390863 m!387079))

(assert (=> b!390863 m!387079))

(assert (=> b!390863 m!387153))

(assert (=> b!390864 m!387079))

(assert (=> b!390864 m!387079))

(declare-fun m!387247 () Bool)

(assert (=> b!390864 m!387247))

(assert (=> b!390621 d!73039))

(declare-fun bm!27581 () Bool)

(declare-fun call!27584 () Bool)

(assert (=> bm!27581 (= call!27584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390866 () Bool)

(declare-fun e!236761 () Bool)

(declare-fun e!236762 () Bool)

(assert (=> b!390866 (= e!236761 e!236762)))

(declare-fun lt!184323 () (_ BitVec 64))

(assert (=> b!390866 (= lt!184323 (select (arr!11046 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184322 () Unit!11958)

(assert (=> b!390866 (= lt!184322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184323 #b00000000000000000000000000000000))))

(assert (=> b!390866 (arrayContainsKey!0 _keys!658 lt!184323 #b00000000000000000000000000000000)))

(declare-fun lt!184324 () Unit!11958)

(assert (=> b!390866 (= lt!184324 lt!184322)))

(declare-fun res!223666 () Bool)

(assert (=> b!390866 (= res!223666 (= (seekEntryOrOpen!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3513 #b00000000000000000000000000000000)))))

(assert (=> b!390866 (=> (not res!223666) (not e!236762))))

(declare-fun b!390867 () Bool)

(assert (=> b!390867 (= e!236762 call!27584)))

(declare-fun d!73041 () Bool)

(declare-fun res!223665 () Bool)

(declare-fun e!236763 () Bool)

(assert (=> d!73041 (=> res!223665 e!236763)))

(assert (=> d!73041 (= res!223665 (bvsge #b00000000000000000000000000000000 (size!11398 _keys!658)))))

(assert (=> d!73041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236763)))

(declare-fun b!390868 () Bool)

(assert (=> b!390868 (= e!236761 call!27584)))

(declare-fun b!390869 () Bool)

(assert (=> b!390869 (= e!236763 e!236761)))

(declare-fun c!54230 () Bool)

(assert (=> b!390869 (= c!54230 (validKeyInArray!0 (select (arr!11046 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73041 (not res!223665)) b!390869))

(assert (= (and b!390869 c!54230) b!390866))

(assert (= (and b!390869 (not c!54230)) b!390868))

(assert (= (and b!390866 res!223666) b!390867))

(assert (= (or b!390867 b!390868) bm!27581))

(declare-fun m!387249 () Bool)

(assert (=> bm!27581 m!387249))

(assert (=> b!390866 m!387079))

(declare-fun m!387251 () Bool)

(assert (=> b!390866 m!387251))

(declare-fun m!387253 () Bool)

(assert (=> b!390866 m!387253))

(assert (=> b!390866 m!387079))

(declare-fun m!387255 () Bool)

(assert (=> b!390866 m!387255))

(assert (=> b!390869 m!387079))

(assert (=> b!390869 m!387079))

(assert (=> b!390869 m!387153))

(assert (=> b!390625 d!73041))

(declare-fun mapNonEmpty!16035 () Bool)

(declare-fun mapRes!16035 () Bool)

(declare-fun tp!31659 () Bool)

(declare-fun e!236769 () Bool)

(assert (=> mapNonEmpty!16035 (= mapRes!16035 (and tp!31659 e!236769))))

(declare-fun mapValue!16035 () ValueCell!4473)

(declare-fun mapKey!16035 () (_ BitVec 32))

(declare-fun mapRest!16035 () (Array (_ BitVec 32) ValueCell!4473))

(assert (=> mapNonEmpty!16035 (= mapRest!16029 (store mapRest!16035 mapKey!16035 mapValue!16035))))

(declare-fun b!390876 () Bool)

(assert (=> b!390876 (= e!236769 tp_is_empty!9633)))

(declare-fun b!390877 () Bool)

(declare-fun e!236768 () Bool)

(assert (=> b!390877 (= e!236768 tp_is_empty!9633)))

(declare-fun condMapEmpty!16035 () Bool)

(declare-fun mapDefault!16035 () ValueCell!4473)

(assert (=> mapNonEmpty!16029 (= condMapEmpty!16035 (= mapRest!16029 ((as const (Array (_ BitVec 32) ValueCell!4473)) mapDefault!16035)))))

(assert (=> mapNonEmpty!16029 (= tp!31649 (and e!236768 mapRes!16035))))

(declare-fun mapIsEmpty!16035 () Bool)

(assert (=> mapIsEmpty!16035 mapRes!16035))

(assert (= (and mapNonEmpty!16029 condMapEmpty!16035) mapIsEmpty!16035))

(assert (= (and mapNonEmpty!16029 (not condMapEmpty!16035)) mapNonEmpty!16035))

(assert (= (and mapNonEmpty!16035 ((_ is ValueCellFull!4473) mapValue!16035)) b!390876))

(assert (= (and mapNonEmpty!16029 ((_ is ValueCellFull!4473) mapDefault!16035)) b!390877))

(declare-fun m!387257 () Bool)

(assert (=> mapNonEmpty!16035 m!387257))

(declare-fun b_lambda!8659 () Bool)

(assert (= b_lambda!8651 (or (and start!37970 b_free!8961) b_lambda!8659)))

(declare-fun b_lambda!8661 () Bool)

(assert (= b_lambda!8657 (or (and start!37970 b_free!8961) b_lambda!8661)))

(declare-fun b_lambda!8663 () Bool)

(assert (= b_lambda!8655 (or (and start!37970 b_free!8961) b_lambda!8663)))

(declare-fun b_lambda!8665 () Bool)

(assert (= b_lambda!8653 (or (and start!37970 b_free!8961) b_lambda!8665)))

(declare-fun b_lambda!8667 () Bool)

(assert (= b_lambda!8649 (or (and start!37970 b_free!8961) b_lambda!8667)))

(declare-fun b_lambda!8669 () Bool)

(assert (= b_lambda!8647 (or (and start!37970 b_free!8961) b_lambda!8669)))

(check-sat (not b!390820) (not b_lambda!8663) (not bm!27578) (not d!73033) (not bm!27561) (not b!390866) (not b!390772) (not b_lambda!8659) (not b!390869) (not b!390855) (not bm!27580) (not bm!27568) (not b!390829) (not b!390860) (not b!390685) (not d!73035) (not bm!27581) (not b!390706) (not b!390857) b_and!16277 (not b!390759) (not bm!27562) (not b!390856) (not b!390853) (not b!390707) (not b!390816) (not b!390864) (not bm!27538) (not bm!27566) (not b!390827) (not b!390861) (not b!390709) (not b!390815) (not bm!27571) (not b!390770) tp_is_empty!9633 (not b!390774) (not b!390698) (not b!390811) (not b!390687) (not b!390760) (not d!73023) (not bm!27572) (not b!390851) (not b!390810) (not b!390831) (not bm!27577) (not b!390859) (not bm!27541) (not d!73031) (not b!390807) (not b_lambda!8661) (not b!390844) (not b!390821) (not b!390701) (not b!390819) (not bm!27558) (not bm!27565) (not d!73037) (not b!390812) (not d!73029) (not b_lambda!8669) (not bm!27556) (not b!390833) (not mapNonEmpty!16035) (not b!390813) (not b_lambda!8667) (not b!390768) (not d!73021) (not b!390762) (not b!390715) (not b!390818) (not b_lambda!8665) (not bm!27579) (not d!73027) (not b!390848) (not b!390863) (not b!390809) (not b!390761) (not b!390708) (not b!390854) (not b!390688) (not b_next!8961) (not b!390847))
(check-sat b_and!16277 (not b_next!8961))
