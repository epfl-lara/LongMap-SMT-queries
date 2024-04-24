; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35334 () Bool)

(assert start!35334)

(declare-fun b!353924 () Bool)

(declare-fun e!216833 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19204 0))(
  ( (array!19205 (arr!9096 (Array (_ BitVec 32) (_ BitVec 64))) (size!9448 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19204)

(assert (=> b!353924 (= e!216833 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9448 _keys!1456)) (bvsge (size!9448 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353925 () Bool)

(declare-fun e!216835 () Bool)

(declare-fun e!216831 () Bool)

(declare-fun mapRes!13224 () Bool)

(assert (=> b!353925 (= e!216835 (and e!216831 mapRes!13224))))

(declare-fun condMapEmpty!13224 () Bool)

(declare-datatypes ((V!11395 0))(
  ( (V!11396 (val!3951 Int)) )
))
(declare-datatypes ((ValueCell!3563 0))(
  ( (ValueCellFull!3563 (v!6146 V!11395)) (EmptyCell!3563) )
))
(declare-datatypes ((array!19206 0))(
  ( (array!19207 (arr!9097 (Array (_ BitVec 32) ValueCell!3563)) (size!9449 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19206)

(declare-fun mapDefault!13224 () ValueCell!3563)

(assert (=> b!353925 (= condMapEmpty!13224 (= (arr!9097 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3563)) mapDefault!13224)))))

(declare-fun b!353926 () Bool)

(declare-fun e!216834 () Bool)

(declare-fun tp_is_empty!7813 () Bool)

(assert (=> b!353926 (= e!216834 tp_is_empty!7813)))

(declare-fun res!196240 () Bool)

(assert (=> start!35334 (=> (not res!196240) (not e!216833))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35334 (= res!196240 (validMask!0 mask!1842))))

(assert (=> start!35334 e!216833))

(assert (=> start!35334 true))

(declare-fun array_inv!6716 (array!19204) Bool)

(assert (=> start!35334 (array_inv!6716 _keys!1456)))

(declare-fun array_inv!6717 (array!19206) Bool)

(assert (=> start!35334 (and (array_inv!6717 _values!1208) e!216835)))

(declare-fun mapIsEmpty!13224 () Bool)

(assert (=> mapIsEmpty!13224 mapRes!13224))

(declare-fun b!353927 () Bool)

(declare-fun res!196239 () Bool)

(assert (=> b!353927 (=> (not res!196239) (not e!216833))))

(declare-datatypes ((List!5192 0))(
  ( (Nil!5189) (Cons!5188 (h!6044 (_ BitVec 64)) (t!10334 List!5192)) )
))
(declare-fun arrayNoDuplicates!0 (array!19204 (_ BitVec 32) List!5192) Bool)

(assert (=> b!353927 (= res!196239 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5189))))

(declare-fun b!353928 () Bool)

(declare-fun res!196242 () Bool)

(assert (=> b!353928 (=> (not res!196242) (not e!216833))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353928 (= res!196242 (and (= (size!9449 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9448 _keys!1456) (size!9449 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353929 () Bool)

(assert (=> b!353929 (= e!216831 tp_is_empty!7813)))

(declare-fun b!353930 () Bool)

(declare-fun res!196241 () Bool)

(assert (=> b!353930 (=> (not res!196241) (not e!216833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19204 (_ BitVec 32)) Bool)

(assert (=> b!353930 (= res!196241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13224 () Bool)

(declare-fun tp!27120 () Bool)

(assert (=> mapNonEmpty!13224 (= mapRes!13224 (and tp!27120 e!216834))))

(declare-fun mapValue!13224 () ValueCell!3563)

(declare-fun mapRest!13224 () (Array (_ BitVec 32) ValueCell!3563))

(declare-fun mapKey!13224 () (_ BitVec 32))

(assert (=> mapNonEmpty!13224 (= (arr!9097 _values!1208) (store mapRest!13224 mapKey!13224 mapValue!13224))))

(declare-fun b!353931 () Bool)

(declare-fun res!196243 () Bool)

(assert (=> b!353931 (=> (not res!196243) (not e!216833))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353931 (= res!196243 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35334 res!196240) b!353928))

(assert (= (and b!353928 res!196242) b!353930))

(assert (= (and b!353930 res!196241) b!353927))

(assert (= (and b!353927 res!196239) b!353931))

(assert (= (and b!353931 res!196243) b!353924))

(assert (= (and b!353925 condMapEmpty!13224) mapIsEmpty!13224))

(assert (= (and b!353925 (not condMapEmpty!13224)) mapNonEmpty!13224))

(get-info :version)

(assert (= (and mapNonEmpty!13224 ((_ is ValueCellFull!3563) mapValue!13224)) b!353926))

(assert (= (and b!353925 ((_ is ValueCellFull!3563) mapDefault!13224)) b!353929))

(assert (= start!35334 b!353925))

(declare-fun m!353379 () Bool)

(assert (=> start!35334 m!353379))

(declare-fun m!353381 () Bool)

(assert (=> start!35334 m!353381))

(declare-fun m!353383 () Bool)

(assert (=> start!35334 m!353383))

(declare-fun m!353385 () Bool)

(assert (=> b!353930 m!353385))

(declare-fun m!353387 () Bool)

(assert (=> b!353927 m!353387))

(declare-fun m!353389 () Bool)

(assert (=> b!353931 m!353389))

(declare-fun m!353391 () Bool)

(assert (=> mapNonEmpty!13224 m!353391))

(check-sat (not b!353930) (not start!35334) (not b!353927) (not b!353931) tp_is_empty!7813 (not mapNonEmpty!13224))
(check-sat)
(get-model)

(declare-fun d!71701 () Bool)

(assert (=> d!71701 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35334 d!71701))

(declare-fun d!71703 () Bool)

(assert (=> d!71703 (= (array_inv!6716 _keys!1456) (bvsge (size!9448 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35334 d!71703))

(declare-fun d!71705 () Bool)

(assert (=> d!71705 (= (array_inv!6717 _values!1208) (bvsge (size!9449 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35334 d!71705))

(declare-fun d!71707 () Bool)

(assert (=> d!71707 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353931 d!71707))

(declare-fun b!353990 () Bool)

(declare-fun e!216876 () Bool)

(declare-fun call!27143 () Bool)

(assert (=> b!353990 (= e!216876 call!27143)))

(declare-fun bm!27140 () Bool)

(declare-fun c!53681 () Bool)

(assert (=> bm!27140 (= call!27143 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53681 (Cons!5188 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000) Nil!5189) Nil!5189)))))

(declare-fun d!71709 () Bool)

(declare-fun res!196281 () Bool)

(declare-fun e!216877 () Bool)

(assert (=> d!71709 (=> res!196281 e!216877)))

(assert (=> d!71709 (= res!196281 (bvsge #b00000000000000000000000000000000 (size!9448 _keys!1456)))))

(assert (=> d!71709 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5189) e!216877)))

(declare-fun b!353991 () Bool)

(declare-fun e!216875 () Bool)

(assert (=> b!353991 (= e!216875 e!216876)))

(assert (=> b!353991 (= c!53681 (validKeyInArray!0 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353992 () Bool)

(declare-fun e!216874 () Bool)

(declare-fun contains!2358 (List!5192 (_ BitVec 64)) Bool)

(assert (=> b!353992 (= e!216874 (contains!2358 Nil!5189 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353993 () Bool)

(assert (=> b!353993 (= e!216877 e!216875)))

(declare-fun res!196282 () Bool)

(assert (=> b!353993 (=> (not res!196282) (not e!216875))))

(assert (=> b!353993 (= res!196282 (not e!216874))))

(declare-fun res!196280 () Bool)

(assert (=> b!353993 (=> (not res!196280) (not e!216874))))

(assert (=> b!353993 (= res!196280 (validKeyInArray!0 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353994 () Bool)

(assert (=> b!353994 (= e!216876 call!27143)))

(assert (= (and d!71709 (not res!196281)) b!353993))

(assert (= (and b!353993 res!196280) b!353992))

(assert (= (and b!353993 res!196282) b!353991))

(assert (= (and b!353991 c!53681) b!353994))

(assert (= (and b!353991 (not c!53681)) b!353990))

(assert (= (or b!353994 b!353990) bm!27140))

(declare-fun m!353421 () Bool)

(assert (=> bm!27140 m!353421))

(declare-fun m!353423 () Bool)

(assert (=> bm!27140 m!353423))

(assert (=> b!353991 m!353421))

(assert (=> b!353991 m!353421))

(declare-fun m!353425 () Bool)

(assert (=> b!353991 m!353425))

(assert (=> b!353992 m!353421))

(assert (=> b!353992 m!353421))

(declare-fun m!353427 () Bool)

(assert (=> b!353992 m!353427))

(assert (=> b!353993 m!353421))

(assert (=> b!353993 m!353421))

(assert (=> b!353993 m!353425))

(assert (=> b!353927 d!71709))

(declare-fun b!354003 () Bool)

(declare-fun e!216885 () Bool)

(declare-fun e!216886 () Bool)

(assert (=> b!354003 (= e!216885 e!216886)))

(declare-fun c!53684 () Bool)

(assert (=> b!354003 (= c!53684 (validKeyInArray!0 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!354005 () Bool)

(declare-fun e!216884 () Bool)

(assert (=> b!354005 (= e!216886 e!216884)))

(declare-fun lt!165657 () (_ BitVec 64))

(assert (=> b!354005 (= lt!165657 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10903 0))(
  ( (Unit!10904) )
))
(declare-fun lt!165658 () Unit!10903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19204 (_ BitVec 64) (_ BitVec 32)) Unit!10903)

(assert (=> b!354005 (= lt!165658 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165657 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354005 (arrayContainsKey!0 _keys!1456 lt!165657 #b00000000000000000000000000000000)))

(declare-fun lt!165659 () Unit!10903)

(assert (=> b!354005 (= lt!165659 lt!165658)))

(declare-fun res!196287 () Bool)

(declare-datatypes ((SeekEntryResult!3439 0))(
  ( (MissingZero!3439 (index!15935 (_ BitVec 32))) (Found!3439 (index!15936 (_ BitVec 32))) (Intermediate!3439 (undefined!4251 Bool) (index!15937 (_ BitVec 32)) (x!35196 (_ BitVec 32))) (Undefined!3439) (MissingVacant!3439 (index!15938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19204 (_ BitVec 32)) SeekEntryResult!3439)

(assert (=> b!354005 (= res!196287 (= (seekEntryOrOpen!0 (select (arr!9096 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3439 #b00000000000000000000000000000000)))))

(assert (=> b!354005 (=> (not res!196287) (not e!216884))))

(declare-fun b!354006 () Bool)

(declare-fun call!27146 () Bool)

(assert (=> b!354006 (= e!216884 call!27146)))

(declare-fun bm!27143 () Bool)

(assert (=> bm!27143 (= call!27146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!354004 () Bool)

(assert (=> b!354004 (= e!216886 call!27146)))

(declare-fun d!71711 () Bool)

(declare-fun res!196288 () Bool)

(assert (=> d!71711 (=> res!196288 e!216885)))

(assert (=> d!71711 (= res!196288 (bvsge #b00000000000000000000000000000000 (size!9448 _keys!1456)))))

(assert (=> d!71711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216885)))

(assert (= (and d!71711 (not res!196288)) b!354003))

(assert (= (and b!354003 c!53684) b!354005))

(assert (= (and b!354003 (not c!53684)) b!354004))

(assert (= (and b!354005 res!196287) b!354006))

(assert (= (or b!354006 b!354004) bm!27143))

(assert (=> b!354003 m!353421))

(assert (=> b!354003 m!353421))

(assert (=> b!354003 m!353425))

(assert (=> b!354005 m!353421))

(declare-fun m!353429 () Bool)

(assert (=> b!354005 m!353429))

(declare-fun m!353431 () Bool)

(assert (=> b!354005 m!353431))

(assert (=> b!354005 m!353421))

(declare-fun m!353433 () Bool)

(assert (=> b!354005 m!353433))

(declare-fun m!353435 () Bool)

(assert (=> bm!27143 m!353435))

(assert (=> b!353930 d!71711))

(declare-fun mapIsEmpty!13233 () Bool)

(declare-fun mapRes!13233 () Bool)

(assert (=> mapIsEmpty!13233 mapRes!13233))

(declare-fun condMapEmpty!13233 () Bool)

(declare-fun mapDefault!13233 () ValueCell!3563)

(assert (=> mapNonEmpty!13224 (= condMapEmpty!13233 (= mapRest!13224 ((as const (Array (_ BitVec 32) ValueCell!3563)) mapDefault!13233)))))

(declare-fun e!216892 () Bool)

(assert (=> mapNonEmpty!13224 (= tp!27120 (and e!216892 mapRes!13233))))

(declare-fun b!354013 () Bool)

(declare-fun e!216891 () Bool)

(assert (=> b!354013 (= e!216891 tp_is_empty!7813)))

(declare-fun b!354014 () Bool)

(assert (=> b!354014 (= e!216892 tp_is_empty!7813)))

(declare-fun mapNonEmpty!13233 () Bool)

(declare-fun tp!27129 () Bool)

(assert (=> mapNonEmpty!13233 (= mapRes!13233 (and tp!27129 e!216891))))

(declare-fun mapValue!13233 () ValueCell!3563)

(declare-fun mapRest!13233 () (Array (_ BitVec 32) ValueCell!3563))

(declare-fun mapKey!13233 () (_ BitVec 32))

(assert (=> mapNonEmpty!13233 (= mapRest!13224 (store mapRest!13233 mapKey!13233 mapValue!13233))))

(assert (= (and mapNonEmpty!13224 condMapEmpty!13233) mapIsEmpty!13233))

(assert (= (and mapNonEmpty!13224 (not condMapEmpty!13233)) mapNonEmpty!13233))

(assert (= (and mapNonEmpty!13233 ((_ is ValueCellFull!3563) mapValue!13233)) b!354013))

(assert (= (and mapNonEmpty!13224 ((_ is ValueCellFull!3563) mapDefault!13233)) b!354014))

(declare-fun m!353437 () Bool)

(assert (=> mapNonEmpty!13233 m!353437))

(check-sat (not b!354005) (not b!353992) (not bm!27143) (not b!353993) (not b!353991) tp_is_empty!7813 (not b!354003) (not mapNonEmpty!13233) (not bm!27140))
(check-sat)
