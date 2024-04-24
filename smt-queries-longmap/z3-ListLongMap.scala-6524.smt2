; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83158 () Bool)

(assert start!83158)

(declare-fun res!648734 () Bool)

(declare-fun e!546449 () Bool)

(assert (=> start!83158 (=> (not res!648734) (not e!546449))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83158 (= res!648734 (validMask!0 mask!2147))))

(assert (=> start!83158 e!546449))

(assert (=> start!83158 true))

(declare-datatypes ((V!34209 0))(
  ( (V!34210 (val!11010 Int)) )
))
(declare-datatypes ((ValueCell!10478 0))(
  ( (ValueCellFull!10478 (v!13565 V!34209)) (EmptyCell!10478) )
))
(declare-datatypes ((array!59924 0))(
  ( (array!59925 (arr!28825 (Array (_ BitVec 32) ValueCell!10478)) (size!29305 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59924)

(declare-fun e!546451 () Bool)

(declare-fun array_inv!22375 (array!59924) Bool)

(assert (=> start!83158 (and (array_inv!22375 _values!1425) e!546451)))

(declare-datatypes ((array!59926 0))(
  ( (array!59927 (arr!28826 (Array (_ BitVec 32) (_ BitVec 64))) (size!29306 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59926)

(declare-fun array_inv!22376 (array!59926) Bool)

(assert (=> start!83158 (array_inv!22376 _keys!1717)))

(declare-fun mapNonEmpty!34876 () Bool)

(declare-fun mapRes!34876 () Bool)

(declare-fun tp!66445 () Bool)

(declare-fun e!546450 () Bool)

(assert (=> mapNonEmpty!34876 (= mapRes!34876 (and tp!66445 e!546450))))

(declare-fun mapRest!34876 () (Array (_ BitVec 32) ValueCell!10478))

(declare-fun mapKey!34876 () (_ BitVec 32))

(declare-fun mapValue!34876 () ValueCell!10478)

(assert (=> mapNonEmpty!34876 (= (arr!28825 _values!1425) (store mapRest!34876 mapKey!34876 mapValue!34876))))

(declare-fun b!969463 () Bool)

(declare-fun res!648735 () Bool)

(assert (=> b!969463 (=> (not res!648735) (not e!546449))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969463 (= res!648735 (and (= (size!29305 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29306 _keys!1717) (size!29305 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969464 () Bool)

(declare-fun e!546452 () Bool)

(assert (=> b!969464 (= e!546451 (and e!546452 mapRes!34876))))

(declare-fun condMapEmpty!34876 () Bool)

(declare-fun mapDefault!34876 () ValueCell!10478)

(assert (=> b!969464 (= condMapEmpty!34876 (= (arr!28825 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10478)) mapDefault!34876)))))

(declare-fun b!969465 () Bool)

(declare-fun res!648733 () Bool)

(assert (=> b!969465 (=> (not res!648733) (not e!546449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59926 (_ BitVec 32)) Bool)

(assert (=> b!969465 (= res!648733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969466 () Bool)

(declare-fun tp_is_empty!21919 () Bool)

(assert (=> b!969466 (= e!546450 tp_is_empty!21919)))

(declare-fun mapIsEmpty!34876 () Bool)

(assert (=> mapIsEmpty!34876 mapRes!34876))

(declare-fun b!969467 () Bool)

(assert (=> b!969467 (= e!546449 (bvsgt #b00000000000000000000000000000000 (size!29306 _keys!1717)))))

(declare-fun b!969468 () Bool)

(assert (=> b!969468 (= e!546452 tp_is_empty!21919)))

(assert (= (and start!83158 res!648734) b!969463))

(assert (= (and b!969463 res!648735) b!969465))

(assert (= (and b!969465 res!648733) b!969467))

(assert (= (and b!969464 condMapEmpty!34876) mapIsEmpty!34876))

(assert (= (and b!969464 (not condMapEmpty!34876)) mapNonEmpty!34876))

(get-info :version)

(assert (= (and mapNonEmpty!34876 ((_ is ValueCellFull!10478) mapValue!34876)) b!969466))

(assert (= (and b!969464 ((_ is ValueCellFull!10478) mapDefault!34876)) b!969468))

(assert (= start!83158 b!969464))

(declare-fun m!898167 () Bool)

(assert (=> start!83158 m!898167))

(declare-fun m!898169 () Bool)

(assert (=> start!83158 m!898169))

(declare-fun m!898171 () Bool)

(assert (=> start!83158 m!898171))

(declare-fun m!898173 () Bool)

(assert (=> mapNonEmpty!34876 m!898173))

(declare-fun m!898175 () Bool)

(assert (=> b!969465 m!898175))

(check-sat (not start!83158) (not b!969465) (not mapNonEmpty!34876) tp_is_empty!21919)
(check-sat)
(get-model)

(declare-fun d!116563 () Bool)

(assert (=> d!116563 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83158 d!116563))

(declare-fun d!116565 () Bool)

(assert (=> d!116565 (= (array_inv!22375 _values!1425) (bvsge (size!29305 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83158 d!116565))

(declare-fun d!116567 () Bool)

(assert (=> d!116567 (= (array_inv!22376 _keys!1717) (bvsge (size!29306 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83158 d!116567))

(declare-fun b!969513 () Bool)

(declare-fun e!546491 () Bool)

(declare-fun call!41777 () Bool)

(assert (=> b!969513 (= e!546491 call!41777)))

(declare-fun b!969514 () Bool)

(declare-fun e!546490 () Bool)

(declare-fun e!546489 () Bool)

(assert (=> b!969514 (= e!546490 e!546489)))

(declare-fun c!100202 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969514 (= c!100202 (validKeyInArray!0 (select (arr!28826 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun bm!41774 () Bool)

(assert (=> bm!41774 (= call!41777 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116569 () Bool)

(declare-fun res!648758 () Bool)

(assert (=> d!116569 (=> res!648758 e!546490)))

(assert (=> d!116569 (= res!648758 (bvsge #b00000000000000000000000000000000 (size!29306 _keys!1717)))))

(assert (=> d!116569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546490)))

(declare-fun b!969515 () Bool)

(assert (=> b!969515 (= e!546489 e!546491)))

(declare-fun lt!431891 () (_ BitVec 64))

(assert (=> b!969515 (= lt!431891 (select (arr!28826 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32326 0))(
  ( (Unit!32327) )
))
(declare-fun lt!431889 () Unit!32326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59926 (_ BitVec 64) (_ BitVec 32)) Unit!32326)

(assert (=> b!969515 (= lt!431889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431891 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!969515 (arrayContainsKey!0 _keys!1717 lt!431891 #b00000000000000000000000000000000)))

(declare-fun lt!431890 () Unit!32326)

(assert (=> b!969515 (= lt!431890 lt!431889)))

(declare-fun res!648759 () Bool)

(declare-datatypes ((SeekEntryResult!9152 0))(
  ( (MissingZero!9152 (index!38979 (_ BitVec 32))) (Found!9152 (index!38980 (_ BitVec 32))) (Intermediate!9152 (undefined!9964 Bool) (index!38981 (_ BitVec 32)) (x!83586 (_ BitVec 32))) (Undefined!9152) (MissingVacant!9152 (index!38982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59926 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!969515 (= res!648759 (= (seekEntryOrOpen!0 (select (arr!28826 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9152 #b00000000000000000000000000000000)))))

(assert (=> b!969515 (=> (not res!648759) (not e!546491))))

(declare-fun b!969516 () Bool)

(assert (=> b!969516 (= e!546489 call!41777)))

(assert (= (and d!116569 (not res!648758)) b!969514))

(assert (= (and b!969514 c!100202) b!969515))

(assert (= (and b!969514 (not c!100202)) b!969516))

(assert (= (and b!969515 res!648759) b!969513))

(assert (= (or b!969513 b!969516) bm!41774))

(declare-fun m!898197 () Bool)

(assert (=> b!969514 m!898197))

(assert (=> b!969514 m!898197))

(declare-fun m!898199 () Bool)

(assert (=> b!969514 m!898199))

(declare-fun m!898201 () Bool)

(assert (=> bm!41774 m!898201))

(assert (=> b!969515 m!898197))

(declare-fun m!898203 () Bool)

(assert (=> b!969515 m!898203))

(declare-fun m!898205 () Bool)

(assert (=> b!969515 m!898205))

(assert (=> b!969515 m!898197))

(declare-fun m!898207 () Bool)

(assert (=> b!969515 m!898207))

(assert (=> b!969465 d!116569))

(declare-fun b!969524 () Bool)

(declare-fun e!546496 () Bool)

(assert (=> b!969524 (= e!546496 tp_is_empty!21919)))

(declare-fun mapNonEmpty!34885 () Bool)

(declare-fun mapRes!34885 () Bool)

(declare-fun tp!66454 () Bool)

(declare-fun e!546497 () Bool)

(assert (=> mapNonEmpty!34885 (= mapRes!34885 (and tp!66454 e!546497))))

(declare-fun mapRest!34885 () (Array (_ BitVec 32) ValueCell!10478))

(declare-fun mapKey!34885 () (_ BitVec 32))

(declare-fun mapValue!34885 () ValueCell!10478)

(assert (=> mapNonEmpty!34885 (= mapRest!34876 (store mapRest!34885 mapKey!34885 mapValue!34885))))

(declare-fun condMapEmpty!34885 () Bool)

(declare-fun mapDefault!34885 () ValueCell!10478)

(assert (=> mapNonEmpty!34876 (= condMapEmpty!34885 (= mapRest!34876 ((as const (Array (_ BitVec 32) ValueCell!10478)) mapDefault!34885)))))

(assert (=> mapNonEmpty!34876 (= tp!66445 (and e!546496 mapRes!34885))))

(declare-fun mapIsEmpty!34885 () Bool)

(assert (=> mapIsEmpty!34885 mapRes!34885))

(declare-fun b!969523 () Bool)

(assert (=> b!969523 (= e!546497 tp_is_empty!21919)))

(assert (= (and mapNonEmpty!34876 condMapEmpty!34885) mapIsEmpty!34885))

(assert (= (and mapNonEmpty!34876 (not condMapEmpty!34885)) mapNonEmpty!34885))

(assert (= (and mapNonEmpty!34885 ((_ is ValueCellFull!10478) mapValue!34885)) b!969523))

(assert (= (and mapNonEmpty!34876 ((_ is ValueCellFull!10478) mapDefault!34885)) b!969524))

(declare-fun m!898209 () Bool)

(assert (=> mapNonEmpty!34885 m!898209))

(check-sat tp_is_empty!21919 (not b!969515) (not b!969514) (not bm!41774) (not mapNonEmpty!34885))
(check-sat)
