; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3694 () Bool)

(assert start!3694)

(declare-fun b!25846 () Bool)

(declare-fun e!16751 () Bool)

(declare-fun tp_is_empty!1053 () Bool)

(assert (=> b!25846 (= e!16751 tp_is_empty!1053)))

(declare-fun b!25847 () Bool)

(declare-fun e!16754 () Bool)

(declare-datatypes ((array!1347 0))(
  ( (array!1348 (arr!635 (Array (_ BitVec 32) (_ BitVec 64))) (size!736 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1347)

(assert (=> b!25847 (= e!16754 (bvsgt #b00000000000000000000000000000000 (size!736 _keys!1833)))))

(declare-fun res!15386 () Bool)

(assert (=> start!3694 (=> (not res!15386) (not e!16754))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3694 (= res!15386 (validMask!0 mask!2294))))

(assert (=> start!3694 e!16754))

(assert (=> start!3694 true))

(declare-datatypes ((V!1229 0))(
  ( (V!1230 (val!553 Int)) )
))
(declare-datatypes ((ValueCell!327 0))(
  ( (ValueCellFull!327 (v!1638 V!1229)) (EmptyCell!327) )
))
(declare-datatypes ((array!1349 0))(
  ( (array!1350 (arr!636 (Array (_ BitVec 32) ValueCell!327)) (size!737 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1349)

(declare-fun e!16752 () Bool)

(declare-fun array_inv!427 (array!1349) Bool)

(assert (=> start!3694 (and (array_inv!427 _values!1501) e!16752)))

(declare-fun array_inv!428 (array!1347) Bool)

(assert (=> start!3694 (array_inv!428 _keys!1833)))

(declare-fun b!25848 () Bool)

(declare-fun e!16753 () Bool)

(declare-fun mapRes!1084 () Bool)

(assert (=> b!25848 (= e!16752 (and e!16753 mapRes!1084))))

(declare-fun condMapEmpty!1084 () Bool)

(declare-fun mapDefault!1084 () ValueCell!327)

(assert (=> b!25848 (= condMapEmpty!1084 (= (arr!636 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!327)) mapDefault!1084)))))

(declare-fun b!25849 () Bool)

(declare-fun res!15387 () Bool)

(assert (=> b!25849 (=> (not res!15387) (not e!16754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1347 (_ BitVec 32)) Bool)

(assert (=> b!25849 (= res!15387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25850 () Bool)

(assert (=> b!25850 (= e!16753 tp_is_empty!1053)))

(declare-fun mapNonEmpty!1084 () Bool)

(declare-fun tp!3604 () Bool)

(assert (=> mapNonEmpty!1084 (= mapRes!1084 (and tp!3604 e!16751))))

(declare-fun mapValue!1084 () ValueCell!327)

(declare-fun mapKey!1084 () (_ BitVec 32))

(declare-fun mapRest!1084 () (Array (_ BitVec 32) ValueCell!327))

(assert (=> mapNonEmpty!1084 (= (arr!636 _values!1501) (store mapRest!1084 mapKey!1084 mapValue!1084))))

(declare-fun b!25851 () Bool)

(declare-fun res!15388 () Bool)

(assert (=> b!25851 (=> (not res!15388) (not e!16754))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25851 (= res!15388 (and (= (size!737 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!736 _keys!1833) (size!737 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1084 () Bool)

(assert (=> mapIsEmpty!1084 mapRes!1084))

(assert (= (and start!3694 res!15386) b!25851))

(assert (= (and b!25851 res!15388) b!25849))

(assert (= (and b!25849 res!15387) b!25847))

(assert (= (and b!25848 condMapEmpty!1084) mapIsEmpty!1084))

(assert (= (and b!25848 (not condMapEmpty!1084)) mapNonEmpty!1084))

(get-info :version)

(assert (= (and mapNonEmpty!1084 ((_ is ValueCellFull!327) mapValue!1084)) b!25846))

(assert (= (and b!25848 ((_ is ValueCellFull!327) mapDefault!1084)) b!25850))

(assert (= start!3694 b!25848))

(declare-fun m!20833 () Bool)

(assert (=> start!3694 m!20833))

(declare-fun m!20835 () Bool)

(assert (=> start!3694 m!20835))

(declare-fun m!20837 () Bool)

(assert (=> start!3694 m!20837))

(declare-fun m!20839 () Bool)

(assert (=> b!25849 m!20839))

(declare-fun m!20841 () Bool)

(assert (=> mapNonEmpty!1084 m!20841))

(check-sat (not start!3694) (not b!25849) (not mapNonEmpty!1084) tp_is_empty!1053)
(check-sat)
(get-model)

(declare-fun d!4831 () Bool)

(assert (=> d!4831 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3694 d!4831))

(declare-fun d!4833 () Bool)

(assert (=> d!4833 (= (array_inv!427 _values!1501) (bvsge (size!737 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3694 d!4833))

(declare-fun d!4835 () Bool)

(assert (=> d!4835 (= (array_inv!428 _keys!1833) (bvsge (size!736 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3694 d!4835))

(declare-fun bm!2489 () Bool)

(declare-fun call!2492 () Bool)

(assert (=> bm!2489 (= call!2492 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25878 () Bool)

(declare-fun e!16779 () Bool)

(declare-fun e!16778 () Bool)

(assert (=> b!25878 (= e!16779 e!16778)))

(declare-fun c!3641 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25878 (= c!3641 (validKeyInArray!0 (select (arr!635 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!25879 () Bool)

(assert (=> b!25879 (= e!16778 call!2492)))

(declare-fun b!25880 () Bool)

(declare-fun e!16777 () Bool)

(assert (=> b!25880 (= e!16778 e!16777)))

(declare-fun lt!10288 () (_ BitVec 64))

(assert (=> b!25880 (= lt!10288 (select (arr!635 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!617 0))(
  ( (Unit!618) )
))
(declare-fun lt!10287 () Unit!617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1347 (_ BitVec 64) (_ BitVec 32)) Unit!617)

(assert (=> b!25880 (= lt!10287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10288 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25880 (arrayContainsKey!0 _keys!1833 lt!10288 #b00000000000000000000000000000000)))

(declare-fun lt!10286 () Unit!617)

(assert (=> b!25880 (= lt!10286 lt!10287)))

(declare-fun res!15403 () Bool)

(declare-datatypes ((SeekEntryResult!57 0))(
  ( (MissingZero!57 (index!2350 (_ BitVec 32))) (Found!57 (index!2351 (_ BitVec 32))) (Intermediate!57 (undefined!869 Bool) (index!2352 (_ BitVec 32)) (x!6041 (_ BitVec 32))) (Undefined!57) (MissingVacant!57 (index!2353 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1347 (_ BitVec 32)) SeekEntryResult!57)

(assert (=> b!25880 (= res!15403 (= (seekEntryOrOpen!0 (select (arr!635 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!57 #b00000000000000000000000000000000)))))

(assert (=> b!25880 (=> (not res!15403) (not e!16777))))

(declare-fun d!4837 () Bool)

(declare-fun res!15402 () Bool)

(assert (=> d!4837 (=> res!15402 e!16779)))

(assert (=> d!4837 (= res!15402 (bvsge #b00000000000000000000000000000000 (size!736 _keys!1833)))))

(assert (=> d!4837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16779)))

(declare-fun b!25881 () Bool)

(assert (=> b!25881 (= e!16777 call!2492)))

(assert (= (and d!4837 (not res!15402)) b!25878))

(assert (= (and b!25878 c!3641) b!25880))

(assert (= (and b!25878 (not c!3641)) b!25879))

(assert (= (and b!25880 res!15403) b!25881))

(assert (= (or b!25881 b!25879) bm!2489))

(declare-fun m!20853 () Bool)

(assert (=> bm!2489 m!20853))

(declare-fun m!20855 () Bool)

(assert (=> b!25878 m!20855))

(assert (=> b!25878 m!20855))

(declare-fun m!20857 () Bool)

(assert (=> b!25878 m!20857))

(assert (=> b!25880 m!20855))

(declare-fun m!20859 () Bool)

(assert (=> b!25880 m!20859))

(declare-fun m!20861 () Bool)

(assert (=> b!25880 m!20861))

(assert (=> b!25880 m!20855))

(declare-fun m!20863 () Bool)

(assert (=> b!25880 m!20863))

(assert (=> b!25849 d!4837))

(declare-fun b!25888 () Bool)

(declare-fun e!16785 () Bool)

(assert (=> b!25888 (= e!16785 tp_is_empty!1053)))

(declare-fun condMapEmpty!1090 () Bool)

(declare-fun mapDefault!1090 () ValueCell!327)

(assert (=> mapNonEmpty!1084 (= condMapEmpty!1090 (= mapRest!1084 ((as const (Array (_ BitVec 32) ValueCell!327)) mapDefault!1090)))))

(declare-fun e!16784 () Bool)

(declare-fun mapRes!1090 () Bool)

(assert (=> mapNonEmpty!1084 (= tp!3604 (and e!16784 mapRes!1090))))

(declare-fun mapIsEmpty!1090 () Bool)

(assert (=> mapIsEmpty!1090 mapRes!1090))

(declare-fun b!25889 () Bool)

(assert (=> b!25889 (= e!16784 tp_is_empty!1053)))

(declare-fun mapNonEmpty!1090 () Bool)

(declare-fun tp!3610 () Bool)

(assert (=> mapNonEmpty!1090 (= mapRes!1090 (and tp!3610 e!16785))))

(declare-fun mapRest!1090 () (Array (_ BitVec 32) ValueCell!327))

(declare-fun mapValue!1090 () ValueCell!327)

(declare-fun mapKey!1090 () (_ BitVec 32))

(assert (=> mapNonEmpty!1090 (= mapRest!1084 (store mapRest!1090 mapKey!1090 mapValue!1090))))

(assert (= (and mapNonEmpty!1084 condMapEmpty!1090) mapIsEmpty!1090))

(assert (= (and mapNonEmpty!1084 (not condMapEmpty!1090)) mapNonEmpty!1090))

(assert (= (and mapNonEmpty!1090 ((_ is ValueCellFull!327) mapValue!1090)) b!25888))

(assert (= (and mapNonEmpty!1084 ((_ is ValueCellFull!327) mapDefault!1090)) b!25889))

(declare-fun m!20865 () Bool)

(assert (=> mapNonEmpty!1090 m!20865))

(check-sat (not b!25878) (not bm!2489) (not mapNonEmpty!1090) (not b!25880) tp_is_empty!1053)
(check-sat)
