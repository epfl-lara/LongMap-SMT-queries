; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3792 () Bool)

(assert start!3792)

(declare-fun b!26562 () Bool)

(declare-fun res!15756 () Bool)

(declare-fun e!17325 () Bool)

(assert (=> b!26562 (=> (not res!15756) (not e!17325))))

(declare-datatypes ((array!1463 0))(
  ( (array!1464 (arr!689 (Array (_ BitVec 32) (_ BitVec 64))) (size!790 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1463)

(declare-datatypes ((List!592 0))(
  ( (Nil!589) (Cons!588 (h!1155 (_ BitVec 64)) (t!3272 List!592)) )
))
(declare-fun arrayNoDuplicates!0 (array!1463 (_ BitVec 32) List!592) Bool)

(assert (=> b!26562 (= res!15756 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!589))))

(declare-fun b!26563 () Bool)

(declare-fun res!15753 () Bool)

(assert (=> b!26563 (=> (not res!15753) (not e!17325))))

(declare-datatypes ((V!1323 0))(
  ( (V!1324 (val!588 Int)) )
))
(declare-datatypes ((ValueCell!362 0))(
  ( (ValueCellFull!362 (v!1673 V!1323)) (EmptyCell!362) )
))
(declare-datatypes ((array!1465 0))(
  ( (array!1466 (arr!690 (Array (_ BitVec 32) ValueCell!362)) (size!791 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1465)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26563 (= res!15753 (and (= (size!791 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!790 _keys!1833) (size!791 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26564 () Bool)

(declare-fun e!17326 () Bool)

(declare-fun tp_is_empty!1123 () Bool)

(assert (=> b!26564 (= e!17326 tp_is_empty!1123)))

(declare-fun res!15754 () Bool)

(assert (=> start!3792 (=> (not res!15754) (not e!17325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3792 (= res!15754 (validMask!0 mask!2294))))

(assert (=> start!3792 e!17325))

(assert (=> start!3792 true))

(declare-fun e!17323 () Bool)

(declare-fun array_inv!489 (array!1465) Bool)

(assert (=> start!3792 (and (array_inv!489 _values!1501) e!17323)))

(declare-fun array_inv!490 (array!1463) Bool)

(assert (=> start!3792 (array_inv!490 _keys!1833)))

(declare-fun mapNonEmpty!1201 () Bool)

(declare-fun mapRes!1201 () Bool)

(declare-fun tp!3721 () Bool)

(declare-fun e!17324 () Bool)

(assert (=> mapNonEmpty!1201 (= mapRes!1201 (and tp!3721 e!17324))))

(declare-fun mapValue!1201 () ValueCell!362)

(declare-fun mapRest!1201 () (Array (_ BitVec 32) ValueCell!362))

(declare-fun mapKey!1201 () (_ BitVec 32))

(assert (=> mapNonEmpty!1201 (= (arr!690 _values!1501) (store mapRest!1201 mapKey!1201 mapValue!1201))))

(declare-fun mapIsEmpty!1201 () Bool)

(assert (=> mapIsEmpty!1201 mapRes!1201))

(declare-fun b!26565 () Bool)

(assert (=> b!26565 (= e!17323 (and e!17326 mapRes!1201))))

(declare-fun condMapEmpty!1201 () Bool)

(declare-fun mapDefault!1201 () ValueCell!362)

(assert (=> b!26565 (= condMapEmpty!1201 (= (arr!690 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!362)) mapDefault!1201)))))

(declare-fun b!26566 () Bool)

(declare-fun res!15755 () Bool)

(assert (=> b!26566 (=> (not res!15755) (not e!17325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1463 (_ BitVec 32)) Bool)

(assert (=> b!26566 (= res!15755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26567 () Bool)

(assert (=> b!26567 (= e!17324 tp_is_empty!1123)))

(declare-fun b!26568 () Bool)

(assert (=> b!26568 (= e!17325 (bvsgt #b00000000000000000000000000000000 (size!790 _keys!1833)))))

(declare-fun b!26569 () Bool)

(declare-fun res!15757 () Bool)

(assert (=> b!26569 (=> (not res!15757) (not e!17325))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26569 (= res!15757 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3792 res!15754) b!26563))

(assert (= (and b!26563 res!15753) b!26566))

(assert (= (and b!26566 res!15755) b!26562))

(assert (= (and b!26562 res!15756) b!26569))

(assert (= (and b!26569 res!15757) b!26568))

(assert (= (and b!26565 condMapEmpty!1201) mapIsEmpty!1201))

(assert (= (and b!26565 (not condMapEmpty!1201)) mapNonEmpty!1201))

(get-info :version)

(assert (= (and mapNonEmpty!1201 ((_ is ValueCellFull!362) mapValue!1201)) b!26567))

(assert (= (and b!26565 ((_ is ValueCellFull!362) mapDefault!1201)) b!26564))

(assert (= start!3792 b!26565))

(declare-fun m!21259 () Bool)

(assert (=> b!26569 m!21259))

(declare-fun m!21261 () Bool)

(assert (=> start!3792 m!21261))

(declare-fun m!21263 () Bool)

(assert (=> start!3792 m!21263))

(declare-fun m!21265 () Bool)

(assert (=> start!3792 m!21265))

(declare-fun m!21267 () Bool)

(assert (=> b!26562 m!21267))

(declare-fun m!21269 () Bool)

(assert (=> mapNonEmpty!1201 m!21269))

(declare-fun m!21271 () Bool)

(assert (=> b!26566 m!21271))

(check-sat (not start!3792) tp_is_empty!1123 (not b!26562) (not mapNonEmpty!1201) (not b!26566) (not b!26569))
(check-sat)
(get-model)

(declare-fun b!26628 () Bool)

(declare-fun e!17367 () Bool)

(declare-fun call!2504 () Bool)

(assert (=> b!26628 (= e!17367 call!2504)))

(declare-fun b!26629 () Bool)

(assert (=> b!26629 (= e!17367 call!2504)))

(declare-fun b!26630 () Bool)

(declare-fun e!17366 () Bool)

(declare-fun contains!239 (List!592 (_ BitVec 64)) Bool)

(assert (=> b!26630 (= e!17366 (contains!239 Nil!589 (select (arr!689 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4857 () Bool)

(declare-fun res!15795 () Bool)

(declare-fun e!17368 () Bool)

(assert (=> d!4857 (=> res!15795 e!17368)))

(assert (=> d!4857 (= res!15795 (bvsge #b00000000000000000000000000000000 (size!790 _keys!1833)))))

(assert (=> d!4857 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!589) e!17368)))

(declare-fun b!26631 () Bool)

(declare-fun e!17365 () Bool)

(assert (=> b!26631 (= e!17368 e!17365)))

(declare-fun res!15796 () Bool)

(assert (=> b!26631 (=> (not res!15796) (not e!17365))))

(assert (=> b!26631 (= res!15796 (not e!17366))))

(declare-fun res!15794 () Bool)

(assert (=> b!26631 (=> (not res!15794) (not e!17366))))

(assert (=> b!26631 (= res!15794 (validKeyInArray!0 (select (arr!689 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2501 () Bool)

(declare-fun c!3642 () Bool)

(assert (=> bm!2501 (= call!2504 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3642 (Cons!588 (select (arr!689 _keys!1833) #b00000000000000000000000000000000) Nil!589) Nil!589)))))

(declare-fun b!26632 () Bool)

(assert (=> b!26632 (= e!17365 e!17367)))

(assert (=> b!26632 (= c!3642 (validKeyInArray!0 (select (arr!689 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4857 (not res!15795)) b!26631))

(assert (= (and b!26631 res!15794) b!26630))

(assert (= (and b!26631 res!15796) b!26632))

(assert (= (and b!26632 c!3642) b!26628))

(assert (= (and b!26632 (not c!3642)) b!26629))

(assert (= (or b!26628 b!26629) bm!2501))

(declare-fun m!21301 () Bool)

(assert (=> b!26630 m!21301))

(assert (=> b!26630 m!21301))

(declare-fun m!21303 () Bool)

(assert (=> b!26630 m!21303))

(assert (=> b!26631 m!21301))

(assert (=> b!26631 m!21301))

(declare-fun m!21305 () Bool)

(assert (=> b!26631 m!21305))

(assert (=> bm!2501 m!21301))

(declare-fun m!21307 () Bool)

(assert (=> bm!2501 m!21307))

(assert (=> b!26632 m!21301))

(assert (=> b!26632 m!21301))

(assert (=> b!26632 m!21305))

(assert (=> b!26562 d!4857))

(declare-fun d!4859 () Bool)

(declare-fun res!15801 () Bool)

(declare-fun e!17375 () Bool)

(assert (=> d!4859 (=> res!15801 e!17375)))

(assert (=> d!4859 (= res!15801 (bvsge #b00000000000000000000000000000000 (size!790 _keys!1833)))))

(assert (=> d!4859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17375)))

(declare-fun b!26641 () Bool)

(declare-fun e!17376 () Bool)

(declare-fun call!2507 () Bool)

(assert (=> b!26641 (= e!17376 call!2507)))

(declare-fun bm!2504 () Bool)

(assert (=> bm!2504 (= call!2507 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26642 () Bool)

(declare-fun e!17377 () Bool)

(assert (=> b!26642 (= e!17377 e!17376)))

(declare-fun lt!10394 () (_ BitVec 64))

(assert (=> b!26642 (= lt!10394 (select (arr!689 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!632 0))(
  ( (Unit!633) )
))
(declare-fun lt!10396 () Unit!632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1463 (_ BitVec 64) (_ BitVec 32)) Unit!632)

(assert (=> b!26642 (= lt!10396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10394 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26642 (arrayContainsKey!0 _keys!1833 lt!10394 #b00000000000000000000000000000000)))

(declare-fun lt!10395 () Unit!632)

(assert (=> b!26642 (= lt!10395 lt!10396)))

(declare-fun res!15802 () Bool)

(declare-datatypes ((SeekEntryResult!62 0))(
  ( (MissingZero!62 (index!2370 (_ BitVec 32))) (Found!62 (index!2371 (_ BitVec 32))) (Intermediate!62 (undefined!874 Bool) (index!2372 (_ BitVec 32)) (x!6150 (_ BitVec 32))) (Undefined!62) (MissingVacant!62 (index!2373 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1463 (_ BitVec 32)) SeekEntryResult!62)

(assert (=> b!26642 (= res!15802 (= (seekEntryOrOpen!0 (select (arr!689 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!62 #b00000000000000000000000000000000)))))

(assert (=> b!26642 (=> (not res!15802) (not e!17376))))

(declare-fun b!26643 () Bool)

(assert (=> b!26643 (= e!17377 call!2507)))

(declare-fun b!26644 () Bool)

(assert (=> b!26644 (= e!17375 e!17377)))

(declare-fun c!3645 () Bool)

(assert (=> b!26644 (= c!3645 (validKeyInArray!0 (select (arr!689 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4859 (not res!15801)) b!26644))

(assert (= (and b!26644 c!3645) b!26642))

(assert (= (and b!26644 (not c!3645)) b!26643))

(assert (= (and b!26642 res!15802) b!26641))

(assert (= (or b!26641 b!26643) bm!2504))

(declare-fun m!21309 () Bool)

(assert (=> bm!2504 m!21309))

(assert (=> b!26642 m!21301))

(declare-fun m!21311 () Bool)

(assert (=> b!26642 m!21311))

(declare-fun m!21313 () Bool)

(assert (=> b!26642 m!21313))

(assert (=> b!26642 m!21301))

(declare-fun m!21315 () Bool)

(assert (=> b!26642 m!21315))

(assert (=> b!26644 m!21301))

(assert (=> b!26644 m!21301))

(assert (=> b!26644 m!21305))

(assert (=> b!26566 d!4859))

(declare-fun d!4861 () Bool)

(assert (=> d!4861 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3792 d!4861))

(declare-fun d!4863 () Bool)

(assert (=> d!4863 (= (array_inv!489 _values!1501) (bvsge (size!791 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3792 d!4863))

(declare-fun d!4865 () Bool)

(assert (=> d!4865 (= (array_inv!490 _keys!1833) (bvsge (size!790 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3792 d!4865))

(declare-fun d!4867 () Bool)

(assert (=> d!4867 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26569 d!4867))

(declare-fun b!26651 () Bool)

(declare-fun e!17383 () Bool)

(assert (=> b!26651 (= e!17383 tp_is_empty!1123)))

(declare-fun mapIsEmpty!1210 () Bool)

(declare-fun mapRes!1210 () Bool)

(assert (=> mapIsEmpty!1210 mapRes!1210))

(declare-fun mapNonEmpty!1210 () Bool)

(declare-fun tp!3730 () Bool)

(assert (=> mapNonEmpty!1210 (= mapRes!1210 (and tp!3730 e!17383))))

(declare-fun mapKey!1210 () (_ BitVec 32))

(declare-fun mapValue!1210 () ValueCell!362)

(declare-fun mapRest!1210 () (Array (_ BitVec 32) ValueCell!362))

(assert (=> mapNonEmpty!1210 (= mapRest!1201 (store mapRest!1210 mapKey!1210 mapValue!1210))))

(declare-fun condMapEmpty!1210 () Bool)

(declare-fun mapDefault!1210 () ValueCell!362)

(assert (=> mapNonEmpty!1201 (= condMapEmpty!1210 (= mapRest!1201 ((as const (Array (_ BitVec 32) ValueCell!362)) mapDefault!1210)))))

(declare-fun e!17382 () Bool)

(assert (=> mapNonEmpty!1201 (= tp!3721 (and e!17382 mapRes!1210))))

(declare-fun b!26652 () Bool)

(assert (=> b!26652 (= e!17382 tp_is_empty!1123)))

(assert (= (and mapNonEmpty!1201 condMapEmpty!1210) mapIsEmpty!1210))

(assert (= (and mapNonEmpty!1201 (not condMapEmpty!1210)) mapNonEmpty!1210))

(assert (= (and mapNonEmpty!1210 ((_ is ValueCellFull!362) mapValue!1210)) b!26651))

(assert (= (and mapNonEmpty!1201 ((_ is ValueCellFull!362) mapDefault!1210)) b!26652))

(declare-fun m!21317 () Bool)

(assert (=> mapNonEmpty!1210 m!21317))

(check-sat (not bm!2504) (not b!26644) (not mapNonEmpty!1210) (not b!26642) tp_is_empty!1123 (not b!26632) (not b!26631) (not b!26630) (not bm!2501))
(check-sat)
