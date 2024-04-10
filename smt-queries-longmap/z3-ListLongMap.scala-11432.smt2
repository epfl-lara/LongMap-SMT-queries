; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133362 () Bool)

(assert start!133362)

(declare-fun b!1559308 () Bool)

(declare-fun e!868819 () Bool)

(declare-fun e!868816 () Bool)

(declare-fun mapRes!59079 () Bool)

(assert (=> b!1559308 (= e!868819 (and e!868816 mapRes!59079))))

(declare-fun condMapEmpty!59079 () Bool)

(declare-datatypes ((V!59507 0))(
  ( (V!59508 (val!19321 Int)) )
))
(declare-datatypes ((ValueCell!18207 0))(
  ( (ValueCellFull!18207 (v!22072 V!59507)) (EmptyCell!18207) )
))
(declare-datatypes ((array!103672 0))(
  ( (array!103673 (arr!50031 (Array (_ BitVec 32) ValueCell!18207)) (size!50581 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103672)

(declare-fun mapDefault!59079 () ValueCell!18207)

(assert (=> b!1559308 (= condMapEmpty!59079 (= (arr!50031 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18207)) mapDefault!59079)))))

(declare-fun b!1559309 () Bool)

(declare-fun e!868817 () Bool)

(declare-datatypes ((array!103674 0))(
  ( (array!103675 (arr!50032 (Array (_ BitVec 32) (_ BitVec 64))) (size!50582 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103674)

(assert (=> b!1559309 (= e!868817 (and (bvsle #b00000000000000000000000000000000 (size!50582 _keys!637)) (bvsge (size!50582 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!59079 () Bool)

(declare-fun tp!112734 () Bool)

(declare-fun e!868820 () Bool)

(assert (=> mapNonEmpty!59079 (= mapRes!59079 (and tp!112734 e!868820))))

(declare-fun mapValue!59079 () ValueCell!18207)

(declare-fun mapRest!59079 () (Array (_ BitVec 32) ValueCell!18207))

(declare-fun mapKey!59079 () (_ BitVec 32))

(assert (=> mapNonEmpty!59079 (= (arr!50031 _values!487) (store mapRest!59079 mapKey!59079 mapValue!59079))))

(declare-fun b!1559311 () Bool)

(declare-fun res!1066324 () Bool)

(assert (=> b!1559311 (=> (not res!1066324) (not e!868817))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103674 (_ BitVec 32)) Bool)

(assert (=> b!1559311 (= res!1066324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559312 () Bool)

(declare-fun res!1066323 () Bool)

(assert (=> b!1559312 (=> (not res!1066323) (not e!868817))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559312 (= res!1066323 (and (= (size!50581 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50582 _keys!637) (size!50581 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1066322 () Bool)

(assert (=> start!133362 (=> (not res!1066322) (not e!868817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133362 (= res!1066322 (validMask!0 mask!947))))

(assert (=> start!133362 e!868817))

(assert (=> start!133362 true))

(declare-fun array_inv!38891 (array!103672) Bool)

(assert (=> start!133362 (and (array_inv!38891 _values!487) e!868819)))

(declare-fun array_inv!38892 (array!103674) Bool)

(assert (=> start!133362 (array_inv!38892 _keys!637)))

(declare-fun b!1559310 () Bool)

(declare-fun tp_is_empty!38475 () Bool)

(assert (=> b!1559310 (= e!868816 tp_is_empty!38475)))

(declare-fun mapIsEmpty!59079 () Bool)

(assert (=> mapIsEmpty!59079 mapRes!59079))

(declare-fun b!1559313 () Bool)

(assert (=> b!1559313 (= e!868820 tp_is_empty!38475)))

(assert (= (and start!133362 res!1066322) b!1559312))

(assert (= (and b!1559312 res!1066323) b!1559311))

(assert (= (and b!1559311 res!1066324) b!1559309))

(assert (= (and b!1559308 condMapEmpty!59079) mapIsEmpty!59079))

(assert (= (and b!1559308 (not condMapEmpty!59079)) mapNonEmpty!59079))

(get-info :version)

(assert (= (and mapNonEmpty!59079 ((_ is ValueCellFull!18207) mapValue!59079)) b!1559313))

(assert (= (and b!1559308 ((_ is ValueCellFull!18207) mapDefault!59079)) b!1559310))

(assert (= start!133362 b!1559308))

(declare-fun m!1435601 () Bool)

(assert (=> mapNonEmpty!59079 m!1435601))

(declare-fun m!1435603 () Bool)

(assert (=> b!1559311 m!1435603))

(declare-fun m!1435605 () Bool)

(assert (=> start!133362 m!1435605))

(declare-fun m!1435607 () Bool)

(assert (=> start!133362 m!1435607))

(declare-fun m!1435609 () Bool)

(assert (=> start!133362 m!1435609))

(check-sat (not b!1559311) (not start!133362) (not mapNonEmpty!59079) tp_is_empty!38475)
(check-sat)
(get-model)

(declare-fun bm!71835 () Bool)

(declare-fun call!71838 () Bool)

(assert (=> bm!71835 (= call!71838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559340 () Bool)

(declare-fun e!868844 () Bool)

(declare-fun e!868843 () Bool)

(assert (=> b!1559340 (= e!868844 e!868843)))

(declare-fun lt!670868 () (_ BitVec 64))

(assert (=> b!1559340 (= lt!670868 (select (arr!50032 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51896 0))(
  ( (Unit!51897) )
))
(declare-fun lt!670867 () Unit!51896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103674 (_ BitVec 64) (_ BitVec 32)) Unit!51896)

(assert (=> b!1559340 (= lt!670867 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670868 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559340 (arrayContainsKey!0 _keys!637 lt!670868 #b00000000000000000000000000000000)))

(declare-fun lt!670866 () Unit!51896)

(assert (=> b!1559340 (= lt!670866 lt!670867)))

(declare-fun res!1066339 () Bool)

(declare-datatypes ((SeekEntryResult!13518 0))(
  ( (MissingZero!13518 (index!56470 (_ BitVec 32))) (Found!13518 (index!56471 (_ BitVec 32))) (Intermediate!13518 (undefined!14330 Bool) (index!56472 (_ BitVec 32)) (x!139764 (_ BitVec 32))) (Undefined!13518) (MissingVacant!13518 (index!56473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103674 (_ BitVec 32)) SeekEntryResult!13518)

(assert (=> b!1559340 (= res!1066339 (= (seekEntryOrOpen!0 (select (arr!50032 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13518 #b00000000000000000000000000000000)))))

(assert (=> b!1559340 (=> (not res!1066339) (not e!868843))))

(declare-fun d!162913 () Bool)

(declare-fun res!1066338 () Bool)

(declare-fun e!868842 () Bool)

(assert (=> d!162913 (=> res!1066338 e!868842)))

(assert (=> d!162913 (= res!1066338 (bvsge #b00000000000000000000000000000000 (size!50582 _keys!637)))))

(assert (=> d!162913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868842)))

(declare-fun b!1559341 () Bool)

(assert (=> b!1559341 (= e!868844 call!71838)))

(declare-fun b!1559342 () Bool)

(assert (=> b!1559342 (= e!868842 e!868844)))

(declare-fun c!144218 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559342 (= c!144218 (validKeyInArray!0 (select (arr!50032 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1559343 () Bool)

(assert (=> b!1559343 (= e!868843 call!71838)))

(assert (= (and d!162913 (not res!1066338)) b!1559342))

(assert (= (and b!1559342 c!144218) b!1559340))

(assert (= (and b!1559342 (not c!144218)) b!1559341))

(assert (= (and b!1559340 res!1066339) b!1559343))

(assert (= (or b!1559343 b!1559341) bm!71835))

(declare-fun m!1435621 () Bool)

(assert (=> bm!71835 m!1435621))

(declare-fun m!1435623 () Bool)

(assert (=> b!1559340 m!1435623))

(declare-fun m!1435625 () Bool)

(assert (=> b!1559340 m!1435625))

(declare-fun m!1435627 () Bool)

(assert (=> b!1559340 m!1435627))

(assert (=> b!1559340 m!1435623))

(declare-fun m!1435629 () Bool)

(assert (=> b!1559340 m!1435629))

(assert (=> b!1559342 m!1435623))

(assert (=> b!1559342 m!1435623))

(declare-fun m!1435631 () Bool)

(assert (=> b!1559342 m!1435631))

(assert (=> b!1559311 d!162913))

(declare-fun d!162915 () Bool)

(assert (=> d!162915 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133362 d!162915))

(declare-fun d!162917 () Bool)

(assert (=> d!162917 (= (array_inv!38891 _values!487) (bvsge (size!50581 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133362 d!162917))

(declare-fun d!162919 () Bool)

(assert (=> d!162919 (= (array_inv!38892 _keys!637) (bvsge (size!50582 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133362 d!162919))

(declare-fun condMapEmpty!59085 () Bool)

(declare-fun mapDefault!59085 () ValueCell!18207)

(assert (=> mapNonEmpty!59079 (= condMapEmpty!59085 (= mapRest!59079 ((as const (Array (_ BitVec 32) ValueCell!18207)) mapDefault!59085)))))

(declare-fun e!868849 () Bool)

(declare-fun mapRes!59085 () Bool)

(assert (=> mapNonEmpty!59079 (= tp!112734 (and e!868849 mapRes!59085))))

(declare-fun mapIsEmpty!59085 () Bool)

(assert (=> mapIsEmpty!59085 mapRes!59085))

(declare-fun b!1559351 () Bool)

(assert (=> b!1559351 (= e!868849 tp_is_empty!38475)))

(declare-fun b!1559350 () Bool)

(declare-fun e!868850 () Bool)

(assert (=> b!1559350 (= e!868850 tp_is_empty!38475)))

(declare-fun mapNonEmpty!59085 () Bool)

(declare-fun tp!112740 () Bool)

(assert (=> mapNonEmpty!59085 (= mapRes!59085 (and tp!112740 e!868850))))

(declare-fun mapKey!59085 () (_ BitVec 32))

(declare-fun mapRest!59085 () (Array (_ BitVec 32) ValueCell!18207))

(declare-fun mapValue!59085 () ValueCell!18207)

(assert (=> mapNonEmpty!59085 (= mapRest!59079 (store mapRest!59085 mapKey!59085 mapValue!59085))))

(assert (= (and mapNonEmpty!59079 condMapEmpty!59085) mapIsEmpty!59085))

(assert (= (and mapNonEmpty!59079 (not condMapEmpty!59085)) mapNonEmpty!59085))

(assert (= (and mapNonEmpty!59085 ((_ is ValueCellFull!18207) mapValue!59085)) b!1559350))

(assert (= (and mapNonEmpty!59079 ((_ is ValueCellFull!18207) mapDefault!59085)) b!1559351))

(declare-fun m!1435633 () Bool)

(assert (=> mapNonEmpty!59085 m!1435633))

(check-sat (not bm!71835) (not b!1559342) (not b!1559340) tp_is_empty!38475 (not mapNonEmpty!59085))
(check-sat)
