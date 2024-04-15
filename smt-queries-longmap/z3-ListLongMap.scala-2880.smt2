; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41386 () Bool)

(assert start!41386)

(declare-fun b!462402 () Bool)

(declare-fun res!276556 () Bool)

(declare-fun e!269866 () Bool)

(assert (=> b!462402 (=> (not res!276556) (not e!269866))))

(declare-datatypes ((array!28827 0))(
  ( (array!28828 (arr!13847 (Array (_ BitVec 32) (_ BitVec 64))) (size!14200 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28827)

(declare-datatypes ((List!8374 0))(
  ( (Nil!8371) (Cons!8370 (h!9226 (_ BitVec 64)) (t!14309 List!8374)) )
))
(declare-fun arrayNoDuplicates!0 (array!28827 (_ BitVec 32) List!8374) Bool)

(assert (=> b!462402 (= res!276556 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8371))))

(declare-fun b!462403 () Bool)

(assert (=> b!462403 (= e!269866 (bvsgt #b00000000000000000000000000000000 (size!14200 _keys!1025)))))

(declare-fun b!462404 () Bool)

(declare-fun res!276557 () Bool)

(assert (=> b!462404 (=> (not res!276557) (not e!269866))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28827 (_ BitVec 32)) Bool)

(assert (=> b!462404 (= res!276557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462405 () Bool)

(declare-fun e!269867 () Bool)

(declare-fun tp_is_empty!12517 () Bool)

(assert (=> b!462405 (= e!269867 tp_is_empty!12517)))

(declare-fun b!462406 () Bool)

(declare-fun res!276554 () Bool)

(assert (=> b!462406 (=> (not res!276554) (not e!269866))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17795 0))(
  ( (V!17796 (val!6303 Int)) )
))
(declare-datatypes ((ValueCell!5915 0))(
  ( (ValueCellFull!5915 (v!8584 V!17795)) (EmptyCell!5915) )
))
(declare-datatypes ((array!28829 0))(
  ( (array!28830 (arr!13848 (Array (_ BitVec 32) ValueCell!5915)) (size!14201 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28829)

(assert (=> b!462406 (= res!276554 (and (= (size!14201 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14200 _keys!1025) (size!14201 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462407 () Bool)

(declare-fun e!269865 () Bool)

(declare-fun e!269868 () Bool)

(declare-fun mapRes!20446 () Bool)

(assert (=> b!462407 (= e!269865 (and e!269868 mapRes!20446))))

(declare-fun condMapEmpty!20446 () Bool)

(declare-fun mapDefault!20446 () ValueCell!5915)

(assert (=> b!462407 (= condMapEmpty!20446 (= (arr!13848 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5915)) mapDefault!20446)))))

(declare-fun mapIsEmpty!20446 () Bool)

(assert (=> mapIsEmpty!20446 mapRes!20446))

(declare-fun res!276555 () Bool)

(assert (=> start!41386 (=> (not res!276555) (not e!269866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41386 (= res!276555 (validMask!0 mask!1365))))

(assert (=> start!41386 e!269866))

(assert (=> start!41386 true))

(declare-fun array_inv!10082 (array!28827) Bool)

(assert (=> start!41386 (array_inv!10082 _keys!1025)))

(declare-fun array_inv!10083 (array!28829) Bool)

(assert (=> start!41386 (and (array_inv!10083 _values!833) e!269865)))

(declare-fun b!462408 () Bool)

(assert (=> b!462408 (= e!269868 tp_is_empty!12517)))

(declare-fun mapNonEmpty!20446 () Bool)

(declare-fun tp!39265 () Bool)

(assert (=> mapNonEmpty!20446 (= mapRes!20446 (and tp!39265 e!269867))))

(declare-fun mapKey!20446 () (_ BitVec 32))

(declare-fun mapValue!20446 () ValueCell!5915)

(declare-fun mapRest!20446 () (Array (_ BitVec 32) ValueCell!5915))

(assert (=> mapNonEmpty!20446 (= (arr!13848 _values!833) (store mapRest!20446 mapKey!20446 mapValue!20446))))

(assert (= (and start!41386 res!276555) b!462406))

(assert (= (and b!462406 res!276554) b!462404))

(assert (= (and b!462404 res!276557) b!462402))

(assert (= (and b!462402 res!276556) b!462403))

(assert (= (and b!462407 condMapEmpty!20446) mapIsEmpty!20446))

(assert (= (and b!462407 (not condMapEmpty!20446)) mapNonEmpty!20446))

(get-info :version)

(assert (= (and mapNonEmpty!20446 ((_ is ValueCellFull!5915) mapValue!20446)) b!462405))

(assert (= (and b!462407 ((_ is ValueCellFull!5915) mapDefault!20446)) b!462408))

(assert (= start!41386 b!462407))

(declare-fun m!444799 () Bool)

(assert (=> b!462402 m!444799))

(declare-fun m!444801 () Bool)

(assert (=> b!462404 m!444801))

(declare-fun m!444803 () Bool)

(assert (=> start!41386 m!444803))

(declare-fun m!444805 () Bool)

(assert (=> start!41386 m!444805))

(declare-fun m!444807 () Bool)

(assert (=> start!41386 m!444807))

(declare-fun m!444809 () Bool)

(assert (=> mapNonEmpty!20446 m!444809))

(check-sat (not b!462402) (not start!41386) (not b!462404) tp_is_empty!12517 (not mapNonEmpty!20446))
(check-sat)
(get-model)

(declare-fun d!74771 () Bool)

(assert (=> d!74771 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41386 d!74771))

(declare-fun d!74773 () Bool)

(assert (=> d!74773 (= (array_inv!10082 _keys!1025) (bvsge (size!14200 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41386 d!74773))

(declare-fun d!74775 () Bool)

(assert (=> d!74775 (= (array_inv!10083 _values!833) (bvsge (size!14201 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41386 d!74775))

(declare-fun b!462461 () Bool)

(declare-fun e!269909 () Bool)

(declare-fun e!269907 () Bool)

(assert (=> b!462461 (= e!269909 e!269907)))

(declare-fun c!56560 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462461 (= c!56560 (validKeyInArray!0 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462462 () Bool)

(declare-fun call!30181 () Bool)

(assert (=> b!462462 (= e!269907 call!30181)))

(declare-fun b!462463 () Bool)

(declare-fun e!269910 () Bool)

(assert (=> b!462463 (= e!269910 e!269909)))

(declare-fun res!276588 () Bool)

(assert (=> b!462463 (=> (not res!276588) (not e!269909))))

(declare-fun e!269908 () Bool)

(assert (=> b!462463 (= res!276588 (not e!269908))))

(declare-fun res!276590 () Bool)

(assert (=> b!462463 (=> (not res!276590) (not e!269908))))

(assert (=> b!462463 (= res!276590 (validKeyInArray!0 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74777 () Bool)

(declare-fun res!276589 () Bool)

(assert (=> d!74777 (=> res!276589 e!269910)))

(assert (=> d!74777 (= res!276589 (bvsge #b00000000000000000000000000000000 (size!14200 _keys!1025)))))

(assert (=> d!74777 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8371) e!269910)))

(declare-fun b!462464 () Bool)

(assert (=> b!462464 (= e!269907 call!30181)))

(declare-fun b!462465 () Bool)

(declare-fun contains!2508 (List!8374 (_ BitVec 64)) Bool)

(assert (=> b!462465 (= e!269908 (contains!2508 Nil!8371 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30178 () Bool)

(assert (=> bm!30178 (= call!30181 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56560 (Cons!8370 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000) Nil!8371) Nil!8371)))))

(assert (= (and d!74777 (not res!276589)) b!462463))

(assert (= (and b!462463 res!276590) b!462465))

(assert (= (and b!462463 res!276588) b!462461))

(assert (= (and b!462461 c!56560) b!462464))

(assert (= (and b!462461 (not c!56560)) b!462462))

(assert (= (or b!462464 b!462462) bm!30178))

(declare-fun m!444835 () Bool)

(assert (=> b!462461 m!444835))

(assert (=> b!462461 m!444835))

(declare-fun m!444837 () Bool)

(assert (=> b!462461 m!444837))

(assert (=> b!462463 m!444835))

(assert (=> b!462463 m!444835))

(assert (=> b!462463 m!444837))

(assert (=> b!462465 m!444835))

(assert (=> b!462465 m!444835))

(declare-fun m!444839 () Bool)

(assert (=> b!462465 m!444839))

(assert (=> bm!30178 m!444835))

(declare-fun m!444841 () Bool)

(assert (=> bm!30178 m!444841))

(assert (=> b!462402 d!74777))

(declare-fun b!462474 () Bool)

(declare-fun e!269918 () Bool)

(declare-fun call!30184 () Bool)

(assert (=> b!462474 (= e!269918 call!30184)))

(declare-fun d!74779 () Bool)

(declare-fun res!276595 () Bool)

(declare-fun e!269919 () Bool)

(assert (=> d!74779 (=> res!276595 e!269919)))

(assert (=> d!74779 (= res!276595 (bvsge #b00000000000000000000000000000000 (size!14200 _keys!1025)))))

(assert (=> d!74779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269919)))

(declare-fun b!462475 () Bool)

(declare-fun e!269917 () Bool)

(assert (=> b!462475 (= e!269919 e!269917)))

(declare-fun c!56563 () Bool)

(assert (=> b!462475 (= c!56563 (validKeyInArray!0 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30181 () Bool)

(assert (=> bm!30181 (= call!30184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!462476 () Bool)

(assert (=> b!462476 (= e!269917 call!30184)))

(declare-fun b!462477 () Bool)

(assert (=> b!462477 (= e!269917 e!269918)))

(declare-fun lt!209020 () (_ BitVec 64))

(assert (=> b!462477 (= lt!209020 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13416 0))(
  ( (Unit!13417) )
))
(declare-fun lt!209021 () Unit!13416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28827 (_ BitVec 64) (_ BitVec 32)) Unit!13416)

(assert (=> b!462477 (= lt!209021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209020 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462477 (arrayContainsKey!0 _keys!1025 lt!209020 #b00000000000000000000000000000000)))

(declare-fun lt!209019 () Unit!13416)

(assert (=> b!462477 (= lt!209019 lt!209021)))

(declare-fun res!276596 () Bool)

(declare-datatypes ((SeekEntryResult!3537 0))(
  ( (MissingZero!3537 (index!16327 (_ BitVec 32))) (Found!3537 (index!16328 (_ BitVec 32))) (Intermediate!3537 (undefined!4349 Bool) (index!16329 (_ BitVec 32)) (x!43150 (_ BitVec 32))) (Undefined!3537) (MissingVacant!3537 (index!16330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28827 (_ BitVec 32)) SeekEntryResult!3537)

(assert (=> b!462477 (= res!276596 (= (seekEntryOrOpen!0 (select (arr!13847 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3537 #b00000000000000000000000000000000)))))

(assert (=> b!462477 (=> (not res!276596) (not e!269918))))

(assert (= (and d!74779 (not res!276595)) b!462475))

(assert (= (and b!462475 c!56563) b!462477))

(assert (= (and b!462475 (not c!56563)) b!462476))

(assert (= (and b!462477 res!276596) b!462474))

(assert (= (or b!462474 b!462476) bm!30181))

(assert (=> b!462475 m!444835))

(assert (=> b!462475 m!444835))

(assert (=> b!462475 m!444837))

(declare-fun m!444843 () Bool)

(assert (=> bm!30181 m!444843))

(assert (=> b!462477 m!444835))

(declare-fun m!444845 () Bool)

(assert (=> b!462477 m!444845))

(declare-fun m!444847 () Bool)

(assert (=> b!462477 m!444847))

(assert (=> b!462477 m!444835))

(declare-fun m!444849 () Bool)

(assert (=> b!462477 m!444849))

(assert (=> b!462404 d!74779))

(declare-fun mapIsEmpty!20455 () Bool)

(declare-fun mapRes!20455 () Bool)

(assert (=> mapIsEmpty!20455 mapRes!20455))

(declare-fun condMapEmpty!20455 () Bool)

(declare-fun mapDefault!20455 () ValueCell!5915)

(assert (=> mapNonEmpty!20446 (= condMapEmpty!20455 (= mapRest!20446 ((as const (Array (_ BitVec 32) ValueCell!5915)) mapDefault!20455)))))

(declare-fun e!269925 () Bool)

(assert (=> mapNonEmpty!20446 (= tp!39265 (and e!269925 mapRes!20455))))

(declare-fun b!462485 () Bool)

(assert (=> b!462485 (= e!269925 tp_is_empty!12517)))

(declare-fun mapNonEmpty!20455 () Bool)

(declare-fun tp!39274 () Bool)

(declare-fun e!269924 () Bool)

(assert (=> mapNonEmpty!20455 (= mapRes!20455 (and tp!39274 e!269924))))

(declare-fun mapRest!20455 () (Array (_ BitVec 32) ValueCell!5915))

(declare-fun mapValue!20455 () ValueCell!5915)

(declare-fun mapKey!20455 () (_ BitVec 32))

(assert (=> mapNonEmpty!20455 (= mapRest!20446 (store mapRest!20455 mapKey!20455 mapValue!20455))))

(declare-fun b!462484 () Bool)

(assert (=> b!462484 (= e!269924 tp_is_empty!12517)))

(assert (= (and mapNonEmpty!20446 condMapEmpty!20455) mapIsEmpty!20455))

(assert (= (and mapNonEmpty!20446 (not condMapEmpty!20455)) mapNonEmpty!20455))

(assert (= (and mapNonEmpty!20455 ((_ is ValueCellFull!5915) mapValue!20455)) b!462484))

(assert (= (and mapNonEmpty!20446 ((_ is ValueCellFull!5915) mapDefault!20455)) b!462485))

(declare-fun m!444851 () Bool)

(assert (=> mapNonEmpty!20455 m!444851))

(check-sat (not b!462475) (not bm!30178) (not b!462477) (not b!462461) tp_is_empty!12517 (not b!462463) (not b!462465) (not mapNonEmpty!20455) (not bm!30181))
(check-sat)
