; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71466 () Bool)

(assert start!71466)

(declare-fun b_free!13495 () Bool)

(declare-fun b_next!13495 () Bool)

(assert (=> start!71466 (= b_free!13495 (not b_next!13495))))

(declare-fun tp!47271 () Bool)

(declare-fun b_and!22499 () Bool)

(assert (=> start!71466 (= tp!47271 b_and!22499)))

(declare-fun mapNonEmpty!24460 () Bool)

(declare-fun mapRes!24460 () Bool)

(declare-fun tp!47272 () Bool)

(declare-fun e!462690 () Bool)

(assert (=> mapNonEmpty!24460 (= mapRes!24460 (and tp!47272 e!462690))))

(declare-fun mapKey!24460 () (_ BitVec 32))

(declare-datatypes ((V!25275 0))(
  ( (V!25276 (val!7650 Int)) )
))
(declare-datatypes ((ValueCell!7187 0))(
  ( (ValueCellFull!7187 (v!10086 V!25275)) (EmptyCell!7187) )
))
(declare-fun mapValue!24460 () ValueCell!7187)

(declare-datatypes ((array!46553 0))(
  ( (array!46554 (arr!22313 (Array (_ BitVec 32) ValueCell!7187)) (size!22734 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46553)

(declare-fun mapRest!24460 () (Array (_ BitVec 32) ValueCell!7187))

(assert (=> mapNonEmpty!24460 (= (arr!22313 _values!788) (store mapRest!24460 mapKey!24460 mapValue!24460))))

(declare-fun b!829926 () Bool)

(declare-fun e!462688 () Bool)

(declare-fun tp_is_empty!15205 () Bool)

(assert (=> b!829926 (= e!462688 tp_is_empty!15205)))

(declare-fun b!829927 () Bool)

(assert (=> b!829927 (= e!462690 tp_is_empty!15205)))

(declare-fun e!462689 () Bool)

(declare-fun b!829928 () Bool)

(declare-fun zeroValueAfter!34 () V!25275)

(declare-datatypes ((tuple2!10160 0))(
  ( (tuple2!10161 (_1!5091 (_ BitVec 64)) (_2!5091 V!25275)) )
))
(declare-datatypes ((List!15944 0))(
  ( (Nil!15941) (Cons!15940 (h!17069 tuple2!10160) (t!22300 List!15944)) )
))
(declare-datatypes ((ListLongMap!8973 0))(
  ( (ListLongMap!8974 (toList!4502 List!15944)) )
))
(declare-fun lt!376415 () ListLongMap!8973)

(declare-fun lt!376419 () ListLongMap!8973)

(declare-fun lt!376416 () tuple2!10160)

(declare-fun +!2010 (ListLongMap!8973 tuple2!10160) ListLongMap!8973)

(assert (=> b!829928 (= e!462689 (= lt!376415 (+!2010 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376416)))))

(declare-fun b!829929 () Bool)

(declare-fun e!462686 () Bool)

(assert (=> b!829929 (= e!462686 (and e!462688 mapRes!24460))))

(declare-fun condMapEmpty!24460 () Bool)

(declare-fun mapDefault!24460 () ValueCell!7187)

(assert (=> b!829929 (= condMapEmpty!24460 (= (arr!22313 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24460)))))

(declare-fun b!829930 () Bool)

(declare-fun res!565321 () Bool)

(declare-fun e!462685 () Bool)

(assert (=> b!829930 (=> (not res!565321) (not e!462685))))

(declare-datatypes ((array!46555 0))(
  ( (array!46556 (arr!22314 (Array (_ BitVec 32) (_ BitVec 64))) (size!22735 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46555)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829930 (= res!565321 (and (= (size!22734 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22735 _keys!976) (size!22734 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!376414 () ListLongMap!8973)

(declare-fun e!462684 () Bool)

(declare-fun lt!376413 () ListLongMap!8973)

(declare-fun lt!376417 () tuple2!10160)

(declare-fun b!829931 () Bool)

(assert (=> b!829931 (= e!462684 (= lt!376413 (+!2010 (+!2010 lt!376414 lt!376416) lt!376417)))))

(assert (=> b!829931 e!462689))

(declare-fun res!565319 () Bool)

(assert (=> b!829931 (=> (not res!565319) (not e!462689))))

(assert (=> b!829931 (= res!565319 (= lt!376413 (+!2010 (+!2010 lt!376414 lt!376417) lt!376416)))))

(declare-fun minValue!754 () V!25275)

(assert (=> b!829931 (= lt!376416 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun zeroValueBefore!34 () V!25275)

(assert (=> b!829931 (= lt!376417 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2553 (array!46555 array!46553 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8973)

(assert (=> b!829931 (= lt!376415 (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829931 (= lt!376413 (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!565317 () Bool)

(assert (=> start!71466 (=> (not res!565317) (not e!462685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71466 (= res!565317 (validMask!0 mask!1312))))

(assert (=> start!71466 e!462685))

(assert (=> start!71466 tp_is_empty!15205))

(declare-fun array_inv!17835 (array!46555) Bool)

(assert (=> start!71466 (array_inv!17835 _keys!976)))

(assert (=> start!71466 true))

(declare-fun array_inv!17836 (array!46553) Bool)

(assert (=> start!71466 (and (array_inv!17836 _values!788) e!462686)))

(assert (=> start!71466 tp!47271))

(declare-fun b!829932 () Bool)

(declare-fun res!565318 () Bool)

(assert (=> b!829932 (=> (not res!565318) (not e!462685))))

(declare-datatypes ((List!15945 0))(
  ( (Nil!15942) (Cons!15941 (h!17070 (_ BitVec 64)) (t!22301 List!15945)) )
))
(declare-fun arrayNoDuplicates!0 (array!46555 (_ BitVec 32) List!15945) Bool)

(assert (=> b!829932 (= res!565318 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15942))))

(declare-fun b!829933 () Bool)

(declare-fun res!565320 () Bool)

(assert (=> b!829933 (=> (not res!565320) (not e!462685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46555 (_ BitVec 32)) Bool)

(assert (=> b!829933 (= res!565320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24460 () Bool)

(assert (=> mapIsEmpty!24460 mapRes!24460))

(declare-fun b!829934 () Bool)

(assert (=> b!829934 (= e!462685 (not e!462684))))

(declare-fun res!565322 () Bool)

(assert (=> b!829934 (=> res!565322 e!462684)))

(assert (=> b!829934 (= res!565322 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829934 (= lt!376414 lt!376419)))

(declare-datatypes ((Unit!28383 0))(
  ( (Unit!28384) )
))
(declare-fun lt!376418 () Unit!28383)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!600 (array!46555 array!46553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 V!25275 V!25275 (_ BitVec 32) Int) Unit!28383)

(assert (=> b!829934 (= lt!376418 (lemmaNoChangeToArrayThenSameMapNoExtras!600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2530 (array!46555 array!46553 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8973)

(assert (=> b!829934 (= lt!376419 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829934 (= lt!376414 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71466 res!565317) b!829930))

(assert (= (and b!829930 res!565321) b!829933))

(assert (= (and b!829933 res!565320) b!829932))

(assert (= (and b!829932 res!565318) b!829934))

(assert (= (and b!829934 (not res!565322)) b!829931))

(assert (= (and b!829931 res!565319) b!829928))

(assert (= (and b!829929 condMapEmpty!24460) mapIsEmpty!24460))

(assert (= (and b!829929 (not condMapEmpty!24460)) mapNonEmpty!24460))

(get-info :version)

(assert (= (and mapNonEmpty!24460 ((_ is ValueCellFull!7187) mapValue!24460)) b!829927))

(assert (= (and b!829929 ((_ is ValueCellFull!7187) mapDefault!24460)) b!829926))

(assert (= start!71466 b!829929))

(declare-fun m!772475 () Bool)

(assert (=> mapNonEmpty!24460 m!772475))

(declare-fun m!772477 () Bool)

(assert (=> b!829932 m!772477))

(declare-fun m!772479 () Bool)

(assert (=> start!71466 m!772479))

(declare-fun m!772481 () Bool)

(assert (=> start!71466 m!772481))

(declare-fun m!772483 () Bool)

(assert (=> start!71466 m!772483))

(declare-fun m!772485 () Bool)

(assert (=> b!829931 m!772485))

(declare-fun m!772487 () Bool)

(assert (=> b!829931 m!772487))

(assert (=> b!829931 m!772485))

(declare-fun m!772489 () Bool)

(assert (=> b!829931 m!772489))

(declare-fun m!772491 () Bool)

(assert (=> b!829931 m!772491))

(declare-fun m!772493 () Bool)

(assert (=> b!829931 m!772493))

(assert (=> b!829931 m!772489))

(declare-fun m!772495 () Bool)

(assert (=> b!829931 m!772495))

(declare-fun m!772497 () Bool)

(assert (=> b!829934 m!772497))

(declare-fun m!772499 () Bool)

(assert (=> b!829934 m!772499))

(declare-fun m!772501 () Bool)

(assert (=> b!829934 m!772501))

(declare-fun m!772503 () Bool)

(assert (=> b!829928 m!772503))

(assert (=> b!829928 m!772503))

(declare-fun m!772505 () Bool)

(assert (=> b!829928 m!772505))

(declare-fun m!772507 () Bool)

(assert (=> b!829933 m!772507))

(check-sat (not b!829931) b_and!22499 (not b!829928) (not b!829933) (not b!829934) (not b_next!13495) (not mapNonEmpty!24460) (not start!71466) tp_is_empty!15205 (not b!829932))
(check-sat b_and!22499 (not b_next!13495))
(get-model)

(declare-fun b!830031 () Bool)

(declare-fun e!462762 () Bool)

(declare-fun call!36213 () Bool)

(assert (=> b!830031 (= e!462762 (not call!36213))))

(declare-fun b!830032 () Bool)

(declare-fun e!462768 () Bool)

(declare-fun e!462761 () Bool)

(assert (=> b!830032 (= e!462768 e!462761)))

(declare-fun c!89812 () Bool)

(assert (=> b!830032 (= c!89812 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830033 () Bool)

(declare-fun call!36217 () Bool)

(assert (=> b!830033 (= e!462761 (not call!36217))))

(declare-fun bm!36208 () Bool)

(declare-fun call!36211 () ListLongMap!8973)

(declare-fun call!36214 () ListLongMap!8973)

(assert (=> bm!36208 (= call!36211 call!36214)))

(declare-fun call!36215 () ListLongMap!8973)

(declare-fun c!89811 () Bool)

(declare-fun c!89810 () Bool)

(declare-fun bm!36209 () Bool)

(declare-fun call!36212 () ListLongMap!8973)

(declare-fun call!36216 () ListLongMap!8973)

(assert (=> bm!36209 (= call!36214 (+!2010 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830034 () Bool)

(declare-fun res!565383 () Bool)

(assert (=> b!830034 (=> (not res!565383) (not e!462768))))

(declare-fun e!462765 () Bool)

(assert (=> b!830034 (= res!565383 e!462765)))

(declare-fun res!565378 () Bool)

(assert (=> b!830034 (=> res!565378 e!462765)))

(declare-fun e!462764 () Bool)

(assert (=> b!830034 (= res!565378 (not e!462764))))

(declare-fun res!565377 () Bool)

(assert (=> b!830034 (=> (not res!565377) (not e!462764))))

(assert (=> b!830034 (= res!565377 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!830035 (= e!462764 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830036 () Bool)

(declare-fun e!462770 () Unit!28383)

(declare-fun Unit!28389 () Unit!28383)

(assert (=> b!830036 (= e!462770 Unit!28389)))

(declare-fun bm!36211 () Bool)

(assert (=> bm!36211 (= call!36216 call!36215)))

(declare-fun bm!36212 () Bool)

(declare-fun lt!376517 () ListLongMap!8973)

(declare-fun contains!4187 (ListLongMap!8973 (_ BitVec 64)) Bool)

(assert (=> bm!36212 (= call!36213 (contains!4187 lt!376517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830037 () Bool)

(declare-fun e!462766 () Bool)

(declare-fun apply!372 (ListLongMap!8973 (_ BitVec 64)) V!25275)

(assert (=> b!830037 (= e!462766 (= (apply!372 lt!376517 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!830038 () Bool)

(declare-fun e!462769 () Bool)

(declare-fun get!11823 (ValueCell!7187 V!25275) V!25275)

(declare-fun dynLambda!986 (Int (_ BitVec 64)) V!25275)

(assert (=> b!830038 (= e!462769 (= (apply!372 lt!376517 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22734 _values!788)))))

(assert (=> b!830038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830039 () Bool)

(declare-fun e!462771 () ListLongMap!8973)

(declare-fun e!462767 () ListLongMap!8973)

(assert (=> b!830039 (= e!462771 e!462767)))

(assert (=> b!830039 (= c!89811 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830040 () Bool)

(declare-fun res!565384 () Bool)

(assert (=> b!830040 (=> (not res!565384) (not e!462768))))

(assert (=> b!830040 (= res!565384 e!462762)))

(declare-fun c!89809 () Bool)

(assert (=> b!830040 (= c!89809 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830041 () Bool)

(declare-fun e!462763 () ListLongMap!8973)

(assert (=> b!830041 (= e!462763 call!36212)))

(declare-fun b!830042 () Bool)

(declare-fun lt!376508 () Unit!28383)

(assert (=> b!830042 (= e!462770 lt!376508)))

(declare-fun lt!376510 () ListLongMap!8973)

(assert (=> b!830042 (= lt!376510 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376524 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376525 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376525 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376527 () Unit!28383)

(declare-fun addStillContains!323 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> b!830042 (= lt!376527 (addStillContains!323 lt!376510 lt!376524 zeroValueAfter!34 lt!376525))))

(assert (=> b!830042 (contains!4187 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376525)))

(declare-fun lt!376515 () Unit!28383)

(assert (=> b!830042 (= lt!376515 lt!376527)))

(declare-fun lt!376514 () ListLongMap!8973)

(assert (=> b!830042 (= lt!376514 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376512 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376512 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376507 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376507 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376516 () Unit!28383)

(declare-fun addApplyDifferent!323 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> b!830042 (= lt!376516 (addApplyDifferent!323 lt!376514 lt!376512 minValue!754 lt!376507))))

(assert (=> b!830042 (= (apply!372 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)) lt!376507) (apply!372 lt!376514 lt!376507))))

(declare-fun lt!376519 () Unit!28383)

(assert (=> b!830042 (= lt!376519 lt!376516)))

(declare-fun lt!376523 () ListLongMap!8973)

(assert (=> b!830042 (= lt!376523 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376509 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376509 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376522 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376522 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376526 () Unit!28383)

(assert (=> b!830042 (= lt!376526 (addApplyDifferent!323 lt!376523 lt!376509 zeroValueAfter!34 lt!376522))))

(assert (=> b!830042 (= (apply!372 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!376522) (apply!372 lt!376523 lt!376522))))

(declare-fun lt!376506 () Unit!28383)

(assert (=> b!830042 (= lt!376506 lt!376526)))

(declare-fun lt!376521 () ListLongMap!8973)

(assert (=> b!830042 (= lt!376521 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376520 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376520 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376513 () (_ BitVec 64))

(assert (=> b!830042 (= lt!376513 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830042 (= lt!376508 (addApplyDifferent!323 lt!376521 lt!376520 minValue!754 lt!376513))))

(assert (=> b!830042 (= (apply!372 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)) lt!376513) (apply!372 lt!376521 lt!376513))))

(declare-fun b!830043 () Bool)

(assert (=> b!830043 (= e!462771 (+!2010 call!36214 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830044 () Bool)

(assert (=> b!830044 (= e!462762 e!462766)))

(declare-fun res!565380 () Bool)

(assert (=> b!830044 (= res!565380 call!36213)))

(assert (=> b!830044 (=> (not res!565380) (not e!462766))))

(declare-fun bm!36213 () Bool)

(assert (=> bm!36213 (= call!36217 (contains!4187 lt!376517 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830045 () Bool)

(declare-fun e!462760 () Bool)

(assert (=> b!830045 (= e!462760 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36214 () Bool)

(assert (=> bm!36214 (= call!36215 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830046 () Bool)

(assert (=> b!830046 (= e!462763 call!36211)))

(declare-fun b!830047 () Bool)

(assert (=> b!830047 (= e!462767 call!36211)))

(declare-fun bm!36210 () Bool)

(assert (=> bm!36210 (= call!36212 call!36216)))

(declare-fun d!105141 () Bool)

(assert (=> d!105141 e!462768))

(declare-fun res!565385 () Bool)

(assert (=> d!105141 (=> (not res!565385) (not e!462768))))

(assert (=> d!105141 (= res!565385 (or (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))))

(declare-fun lt!376511 () ListLongMap!8973)

(assert (=> d!105141 (= lt!376517 lt!376511)))

(declare-fun lt!376518 () Unit!28383)

(assert (=> d!105141 (= lt!376518 e!462770)))

(declare-fun c!89813 () Bool)

(assert (=> d!105141 (= c!89813 e!462760)))

(declare-fun res!565382 () Bool)

(assert (=> d!105141 (=> (not res!565382) (not e!462760))))

(assert (=> d!105141 (= res!565382 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105141 (= lt!376511 e!462771)))

(assert (=> d!105141 (= c!89810 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105141 (validMask!0 mask!1312)))

(assert (=> d!105141 (= (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376517)))

(declare-fun b!830048 () Bool)

(assert (=> b!830048 (= e!462765 e!462769)))

(declare-fun res!565381 () Bool)

(assert (=> b!830048 (=> (not res!565381) (not e!462769))))

(assert (=> b!830048 (= res!565381 (contains!4187 lt!376517 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830049 () Bool)

(declare-fun e!462759 () Bool)

(assert (=> b!830049 (= e!462759 (= (apply!372 lt!376517 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830050 () Bool)

(assert (=> b!830050 (= e!462761 e!462759)))

(declare-fun res!565379 () Bool)

(assert (=> b!830050 (= res!565379 call!36217)))

(assert (=> b!830050 (=> (not res!565379) (not e!462759))))

(declare-fun b!830051 () Bool)

(declare-fun c!89814 () Bool)

(assert (=> b!830051 (= c!89814 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830051 (= e!462767 e!462763)))

(assert (= (and d!105141 c!89810) b!830043))

(assert (= (and d!105141 (not c!89810)) b!830039))

(assert (= (and b!830039 c!89811) b!830047))

(assert (= (and b!830039 (not c!89811)) b!830051))

(assert (= (and b!830051 c!89814) b!830046))

(assert (= (and b!830051 (not c!89814)) b!830041))

(assert (= (or b!830046 b!830041) bm!36210))

(assert (= (or b!830047 bm!36210) bm!36211))

(assert (= (or b!830047 b!830046) bm!36208))

(assert (= (or b!830043 bm!36211) bm!36214))

(assert (= (or b!830043 bm!36208) bm!36209))

(assert (= (and d!105141 res!565382) b!830045))

(assert (= (and d!105141 c!89813) b!830042))

(assert (= (and d!105141 (not c!89813)) b!830036))

(assert (= (and d!105141 res!565385) b!830034))

(assert (= (and b!830034 res!565377) b!830035))

(assert (= (and b!830034 (not res!565378)) b!830048))

(assert (= (and b!830048 res!565381) b!830038))

(assert (= (and b!830034 res!565383) b!830040))

(assert (= (and b!830040 c!89809) b!830044))

(assert (= (and b!830040 (not c!89809)) b!830031))

(assert (= (and b!830044 res!565380) b!830037))

(assert (= (or b!830044 b!830031) bm!36212))

(assert (= (and b!830040 res!565384) b!830032))

(assert (= (and b!830032 c!89812) b!830050))

(assert (= (and b!830032 (not c!89812)) b!830033))

(assert (= (and b!830050 res!565379) b!830049))

(assert (= (or b!830050 b!830033) bm!36213))

(declare-fun b_lambda!11329 () Bool)

(assert (=> (not b_lambda!11329) (not b!830038)))

(declare-fun t!22306 () Bool)

(declare-fun tb!4217 () Bool)

(assert (=> (and start!71466 (= defaultEntry!796 defaultEntry!796) t!22306) tb!4217))

(declare-fun result!8007 () Bool)

(assert (=> tb!4217 (= result!8007 tp_is_empty!15205)))

(assert (=> b!830038 t!22306))

(declare-fun b_and!22505 () Bool)

(assert (= b_and!22499 (and (=> t!22306 result!8007) b_and!22505)))

(declare-fun m!772577 () Bool)

(assert (=> b!830042 m!772577))

(declare-fun m!772579 () Bool)

(assert (=> b!830042 m!772579))

(declare-fun m!772581 () Bool)

(assert (=> b!830042 m!772581))

(declare-fun m!772583 () Bool)

(assert (=> b!830042 m!772583))

(declare-fun m!772585 () Bool)

(assert (=> b!830042 m!772585))

(declare-fun m!772587 () Bool)

(assert (=> b!830042 m!772587))

(declare-fun m!772589 () Bool)

(assert (=> b!830042 m!772589))

(declare-fun m!772591 () Bool)

(assert (=> b!830042 m!772591))

(assert (=> b!830042 m!772589))

(declare-fun m!772593 () Bool)

(assert (=> b!830042 m!772593))

(declare-fun m!772595 () Bool)

(assert (=> b!830042 m!772595))

(declare-fun m!772597 () Bool)

(assert (=> b!830042 m!772597))

(declare-fun m!772599 () Bool)

(assert (=> b!830042 m!772599))

(declare-fun m!772601 () Bool)

(assert (=> b!830042 m!772601))

(assert (=> b!830042 m!772601))

(declare-fun m!772603 () Bool)

(assert (=> b!830042 m!772603))

(declare-fun m!772605 () Bool)

(assert (=> b!830042 m!772605))

(assert (=> b!830042 m!772581))

(declare-fun m!772607 () Bool)

(assert (=> b!830042 m!772607))

(assert (=> b!830042 m!772577))

(assert (=> b!830042 m!772499))

(assert (=> b!830045 m!772595))

(assert (=> b!830045 m!772595))

(declare-fun m!772609 () Bool)

(assert (=> b!830045 m!772609))

(declare-fun m!772611 () Bool)

(assert (=> bm!36209 m!772611))

(declare-fun m!772613 () Bool)

(assert (=> b!830038 m!772613))

(declare-fun m!772615 () Bool)

(assert (=> b!830038 m!772615))

(assert (=> b!830038 m!772613))

(assert (=> b!830038 m!772615))

(declare-fun m!772617 () Bool)

(assert (=> b!830038 m!772617))

(assert (=> b!830038 m!772595))

(declare-fun m!772619 () Bool)

(assert (=> b!830038 m!772619))

(assert (=> b!830038 m!772595))

(declare-fun m!772621 () Bool)

(assert (=> b!830037 m!772621))

(declare-fun m!772623 () Bool)

(assert (=> b!830043 m!772623))

(assert (=> b!830035 m!772595))

(assert (=> b!830035 m!772595))

(assert (=> b!830035 m!772609))

(declare-fun m!772625 () Bool)

(assert (=> b!830049 m!772625))

(assert (=> bm!36214 m!772499))

(declare-fun m!772627 () Bool)

(assert (=> bm!36212 m!772627))

(assert (=> b!830048 m!772595))

(assert (=> b!830048 m!772595))

(declare-fun m!772629 () Bool)

(assert (=> b!830048 m!772629))

(declare-fun m!772631 () Bool)

(assert (=> bm!36213 m!772631))

(assert (=> d!105141 m!772479))

(assert (=> b!829931 d!105141))

(declare-fun d!105143 () Bool)

(declare-fun e!462774 () Bool)

(assert (=> d!105143 e!462774))

(declare-fun res!565391 () Bool)

(assert (=> d!105143 (=> (not res!565391) (not e!462774))))

(declare-fun lt!376538 () ListLongMap!8973)

(assert (=> d!105143 (= res!565391 (contains!4187 lt!376538 (_1!5091 lt!376417)))))

(declare-fun lt!376536 () List!15944)

(assert (=> d!105143 (= lt!376538 (ListLongMap!8974 lt!376536))))

(declare-fun lt!376537 () Unit!28383)

(declare-fun lt!376539 () Unit!28383)

(assert (=> d!105143 (= lt!376537 lt!376539)))

(declare-datatypes ((Option!419 0))(
  ( (Some!418 (v!10089 V!25275)) (None!417) )
))
(declare-fun getValueByKey!413 (List!15944 (_ BitVec 64)) Option!419)

(assert (=> d!105143 (= (getValueByKey!413 lt!376536 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(declare-fun lemmaContainsTupThenGetReturnValue!230 (List!15944 (_ BitVec 64) V!25275) Unit!28383)

(assert (=> d!105143 (= lt!376539 (lemmaContainsTupThenGetReturnValue!230 lt!376536 (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun insertStrictlySorted!269 (List!15944 (_ BitVec 64) V!25275) List!15944)

(assert (=> d!105143 (= lt!376536 (insertStrictlySorted!269 (toList!4502 lt!376414) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(assert (=> d!105143 (= (+!2010 lt!376414 lt!376417) lt!376538)))

(declare-fun b!830058 () Bool)

(declare-fun res!565390 () Bool)

(assert (=> b!830058 (=> (not res!565390) (not e!462774))))

(assert (=> b!830058 (= res!565390 (= (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417))))))

(declare-fun b!830059 () Bool)

(declare-fun contains!4188 (List!15944 tuple2!10160) Bool)

(assert (=> b!830059 (= e!462774 (contains!4188 (toList!4502 lt!376538) lt!376417))))

(assert (= (and d!105143 res!565391) b!830058))

(assert (= (and b!830058 res!565390) b!830059))

(declare-fun m!772633 () Bool)

(assert (=> d!105143 m!772633))

(declare-fun m!772635 () Bool)

(assert (=> d!105143 m!772635))

(declare-fun m!772637 () Bool)

(assert (=> d!105143 m!772637))

(declare-fun m!772639 () Bool)

(assert (=> d!105143 m!772639))

(declare-fun m!772641 () Bool)

(assert (=> b!830058 m!772641))

(declare-fun m!772643 () Bool)

(assert (=> b!830059 m!772643))

(assert (=> b!829931 d!105143))

(declare-fun d!105145 () Bool)

(declare-fun e!462775 () Bool)

(assert (=> d!105145 e!462775))

(declare-fun res!565393 () Bool)

(assert (=> d!105145 (=> (not res!565393) (not e!462775))))

(declare-fun lt!376542 () ListLongMap!8973)

(assert (=> d!105145 (= res!565393 (contains!4187 lt!376542 (_1!5091 lt!376417)))))

(declare-fun lt!376540 () List!15944)

(assert (=> d!105145 (= lt!376542 (ListLongMap!8974 lt!376540))))

(declare-fun lt!376541 () Unit!28383)

(declare-fun lt!376543 () Unit!28383)

(assert (=> d!105145 (= lt!376541 lt!376543)))

(assert (=> d!105145 (= (getValueByKey!413 lt!376540 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(assert (=> d!105145 (= lt!376543 (lemmaContainsTupThenGetReturnValue!230 lt!376540 (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(assert (=> d!105145 (= lt!376540 (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376414 lt!376416)) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(assert (=> d!105145 (= (+!2010 (+!2010 lt!376414 lt!376416) lt!376417) lt!376542)))

(declare-fun b!830060 () Bool)

(declare-fun res!565392 () Bool)

(assert (=> b!830060 (=> (not res!565392) (not e!462775))))

(assert (=> b!830060 (= res!565392 (= (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417))))))

(declare-fun b!830061 () Bool)

(assert (=> b!830061 (= e!462775 (contains!4188 (toList!4502 lt!376542) lt!376417))))

(assert (= (and d!105145 res!565393) b!830060))

(assert (= (and b!830060 res!565392) b!830061))

(declare-fun m!772645 () Bool)

(assert (=> d!105145 m!772645))

(declare-fun m!772647 () Bool)

(assert (=> d!105145 m!772647))

(declare-fun m!772649 () Bool)

(assert (=> d!105145 m!772649))

(declare-fun m!772651 () Bool)

(assert (=> d!105145 m!772651))

(declare-fun m!772653 () Bool)

(assert (=> b!830060 m!772653))

(declare-fun m!772655 () Bool)

(assert (=> b!830061 m!772655))

(assert (=> b!829931 d!105145))

(declare-fun d!105147 () Bool)

(declare-fun e!462776 () Bool)

(assert (=> d!105147 e!462776))

(declare-fun res!565395 () Bool)

(assert (=> d!105147 (=> (not res!565395) (not e!462776))))

(declare-fun lt!376546 () ListLongMap!8973)

(assert (=> d!105147 (= res!565395 (contains!4187 lt!376546 (_1!5091 lt!376416)))))

(declare-fun lt!376544 () List!15944)

(assert (=> d!105147 (= lt!376546 (ListLongMap!8974 lt!376544))))

(declare-fun lt!376545 () Unit!28383)

(declare-fun lt!376547 () Unit!28383)

(assert (=> d!105147 (= lt!376545 lt!376547)))

(assert (=> d!105147 (= (getValueByKey!413 lt!376544 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105147 (= lt!376547 (lemmaContainsTupThenGetReturnValue!230 lt!376544 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105147 (= lt!376544 (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376414 lt!376417)) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105147 (= (+!2010 (+!2010 lt!376414 lt!376417) lt!376416) lt!376546)))

(declare-fun b!830062 () Bool)

(declare-fun res!565394 () Bool)

(assert (=> b!830062 (=> (not res!565394) (not e!462776))))

(assert (=> b!830062 (= res!565394 (= (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416))))))

(declare-fun b!830063 () Bool)

(assert (=> b!830063 (= e!462776 (contains!4188 (toList!4502 lt!376546) lt!376416))))

(assert (= (and d!105147 res!565395) b!830062))

(assert (= (and b!830062 res!565394) b!830063))

(declare-fun m!772657 () Bool)

(assert (=> d!105147 m!772657))

(declare-fun m!772659 () Bool)

(assert (=> d!105147 m!772659))

(declare-fun m!772661 () Bool)

(assert (=> d!105147 m!772661))

(declare-fun m!772663 () Bool)

(assert (=> d!105147 m!772663))

(declare-fun m!772665 () Bool)

(assert (=> b!830062 m!772665))

(declare-fun m!772667 () Bool)

(assert (=> b!830063 m!772667))

(assert (=> b!829931 d!105147))

(declare-fun d!105149 () Bool)

(declare-fun e!462777 () Bool)

(assert (=> d!105149 e!462777))

(declare-fun res!565397 () Bool)

(assert (=> d!105149 (=> (not res!565397) (not e!462777))))

(declare-fun lt!376550 () ListLongMap!8973)

(assert (=> d!105149 (= res!565397 (contains!4187 lt!376550 (_1!5091 lt!376416)))))

(declare-fun lt!376548 () List!15944)

(assert (=> d!105149 (= lt!376550 (ListLongMap!8974 lt!376548))))

(declare-fun lt!376549 () Unit!28383)

(declare-fun lt!376551 () Unit!28383)

(assert (=> d!105149 (= lt!376549 lt!376551)))

(assert (=> d!105149 (= (getValueByKey!413 lt!376548 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105149 (= lt!376551 (lemmaContainsTupThenGetReturnValue!230 lt!376548 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105149 (= lt!376548 (insertStrictlySorted!269 (toList!4502 lt!376414) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105149 (= (+!2010 lt!376414 lt!376416) lt!376550)))

(declare-fun b!830064 () Bool)

(declare-fun res!565396 () Bool)

(assert (=> b!830064 (=> (not res!565396) (not e!462777))))

(assert (=> b!830064 (= res!565396 (= (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416))))))

(declare-fun b!830065 () Bool)

(assert (=> b!830065 (= e!462777 (contains!4188 (toList!4502 lt!376550) lt!376416))))

(assert (= (and d!105149 res!565397) b!830064))

(assert (= (and b!830064 res!565396) b!830065))

(declare-fun m!772669 () Bool)

(assert (=> d!105149 m!772669))

(declare-fun m!772671 () Bool)

(assert (=> d!105149 m!772671))

(declare-fun m!772673 () Bool)

(assert (=> d!105149 m!772673))

(declare-fun m!772675 () Bool)

(assert (=> d!105149 m!772675))

(declare-fun m!772677 () Bool)

(assert (=> b!830064 m!772677))

(declare-fun m!772679 () Bool)

(assert (=> b!830065 m!772679))

(assert (=> b!829931 d!105149))

(declare-fun b!830066 () Bool)

(declare-fun e!462781 () Bool)

(declare-fun call!36220 () Bool)

(assert (=> b!830066 (= e!462781 (not call!36220))))

(declare-fun b!830067 () Bool)

(declare-fun e!462787 () Bool)

(declare-fun e!462780 () Bool)

(assert (=> b!830067 (= e!462787 e!462780)))

(declare-fun c!89818 () Bool)

(assert (=> b!830067 (= c!89818 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830068 () Bool)

(declare-fun call!36224 () Bool)

(assert (=> b!830068 (= e!462780 (not call!36224))))

(declare-fun bm!36215 () Bool)

(declare-fun call!36218 () ListLongMap!8973)

(declare-fun call!36221 () ListLongMap!8973)

(assert (=> bm!36215 (= call!36218 call!36221)))

(declare-fun call!36222 () ListLongMap!8973)

(declare-fun bm!36216 () Bool)

(declare-fun call!36223 () ListLongMap!8973)

(declare-fun call!36219 () ListLongMap!8973)

(declare-fun c!89817 () Bool)

(declare-fun c!89816 () Bool)

(assert (=> bm!36216 (= call!36221 (+!2010 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830069 () Bool)

(declare-fun res!565404 () Bool)

(assert (=> b!830069 (=> (not res!565404) (not e!462787))))

(declare-fun e!462784 () Bool)

(assert (=> b!830069 (= res!565404 e!462784)))

(declare-fun res!565399 () Bool)

(assert (=> b!830069 (=> res!565399 e!462784)))

(declare-fun e!462783 () Bool)

(assert (=> b!830069 (= res!565399 (not e!462783))))

(declare-fun res!565398 () Bool)

(assert (=> b!830069 (=> (not res!565398) (not e!462783))))

(assert (=> b!830069 (= res!565398 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830070 () Bool)

(assert (=> b!830070 (= e!462783 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830071 () Bool)

(declare-fun e!462789 () Unit!28383)

(declare-fun Unit!28390 () Unit!28383)

(assert (=> b!830071 (= e!462789 Unit!28390)))

(declare-fun bm!36218 () Bool)

(assert (=> bm!36218 (= call!36223 call!36222)))

(declare-fun bm!36219 () Bool)

(declare-fun lt!376563 () ListLongMap!8973)

(assert (=> bm!36219 (= call!36220 (contains!4187 lt!376563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830072 () Bool)

(declare-fun e!462785 () Bool)

(assert (=> b!830072 (= e!462785 (= (apply!372 lt!376563 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun e!462788 () Bool)

(declare-fun b!830073 () Bool)

(assert (=> b!830073 (= e!462788 (= (apply!372 lt!376563 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22734 _values!788)))))

(assert (=> b!830073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830074 () Bool)

(declare-fun e!462790 () ListLongMap!8973)

(declare-fun e!462786 () ListLongMap!8973)

(assert (=> b!830074 (= e!462790 e!462786)))

(assert (=> b!830074 (= c!89817 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830075 () Bool)

(declare-fun res!565405 () Bool)

(assert (=> b!830075 (=> (not res!565405) (not e!462787))))

(assert (=> b!830075 (= res!565405 e!462781)))

(declare-fun c!89815 () Bool)

(assert (=> b!830075 (= c!89815 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830076 () Bool)

(declare-fun e!462782 () ListLongMap!8973)

(assert (=> b!830076 (= e!462782 call!36219)))

(declare-fun b!830077 () Bool)

(declare-fun lt!376554 () Unit!28383)

(assert (=> b!830077 (= e!462789 lt!376554)))

(declare-fun lt!376556 () ListLongMap!8973)

(assert (=> b!830077 (= lt!376556 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376570 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376571 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376571 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376573 () Unit!28383)

(assert (=> b!830077 (= lt!376573 (addStillContains!323 lt!376556 lt!376570 zeroValueBefore!34 lt!376571))))

(assert (=> b!830077 (contains!4187 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!376571)))

(declare-fun lt!376561 () Unit!28383)

(assert (=> b!830077 (= lt!376561 lt!376573)))

(declare-fun lt!376560 () ListLongMap!8973)

(assert (=> b!830077 (= lt!376560 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376558 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376553 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376553 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376562 () Unit!28383)

(assert (=> b!830077 (= lt!376562 (addApplyDifferent!323 lt!376560 lt!376558 minValue!754 lt!376553))))

(assert (=> b!830077 (= (apply!372 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)) lt!376553) (apply!372 lt!376560 lt!376553))))

(declare-fun lt!376565 () Unit!28383)

(assert (=> b!830077 (= lt!376565 lt!376562)))

(declare-fun lt!376569 () ListLongMap!8973)

(assert (=> b!830077 (= lt!376569 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376555 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376568 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376568 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376572 () Unit!28383)

(assert (=> b!830077 (= lt!376572 (addApplyDifferent!323 lt!376569 lt!376555 zeroValueBefore!34 lt!376568))))

(assert (=> b!830077 (= (apply!372 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!376568) (apply!372 lt!376569 lt!376568))))

(declare-fun lt!376552 () Unit!28383)

(assert (=> b!830077 (= lt!376552 lt!376572)))

(declare-fun lt!376567 () ListLongMap!8973)

(assert (=> b!830077 (= lt!376567 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376566 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376559 () (_ BitVec 64))

(assert (=> b!830077 (= lt!376559 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830077 (= lt!376554 (addApplyDifferent!323 lt!376567 lt!376566 minValue!754 lt!376559))))

(assert (=> b!830077 (= (apply!372 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)) lt!376559) (apply!372 lt!376567 lt!376559))))

(declare-fun b!830078 () Bool)

(assert (=> b!830078 (= e!462790 (+!2010 call!36221 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830079 () Bool)

(assert (=> b!830079 (= e!462781 e!462785)))

(declare-fun res!565401 () Bool)

(assert (=> b!830079 (= res!565401 call!36220)))

(assert (=> b!830079 (=> (not res!565401) (not e!462785))))

(declare-fun bm!36220 () Bool)

(assert (=> bm!36220 (= call!36224 (contains!4187 lt!376563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830080 () Bool)

(declare-fun e!462779 () Bool)

(assert (=> b!830080 (= e!462779 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36221 () Bool)

(assert (=> bm!36221 (= call!36222 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830081 () Bool)

(assert (=> b!830081 (= e!462782 call!36218)))

(declare-fun b!830082 () Bool)

(assert (=> b!830082 (= e!462786 call!36218)))

(declare-fun bm!36217 () Bool)

(assert (=> bm!36217 (= call!36219 call!36223)))

(declare-fun d!105151 () Bool)

(assert (=> d!105151 e!462787))

(declare-fun res!565406 () Bool)

(assert (=> d!105151 (=> (not res!565406) (not e!462787))))

(assert (=> d!105151 (= res!565406 (or (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))))

(declare-fun lt!376557 () ListLongMap!8973)

(assert (=> d!105151 (= lt!376563 lt!376557)))

(declare-fun lt!376564 () Unit!28383)

(assert (=> d!105151 (= lt!376564 e!462789)))

(declare-fun c!89819 () Bool)

(assert (=> d!105151 (= c!89819 e!462779)))

(declare-fun res!565403 () Bool)

(assert (=> d!105151 (=> (not res!565403) (not e!462779))))

(assert (=> d!105151 (= res!565403 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105151 (= lt!376557 e!462790)))

(assert (=> d!105151 (= c!89816 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105151 (validMask!0 mask!1312)))

(assert (=> d!105151 (= (getCurrentListMap!2553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376563)))

(declare-fun b!830083 () Bool)

(assert (=> b!830083 (= e!462784 e!462788)))

(declare-fun res!565402 () Bool)

(assert (=> b!830083 (=> (not res!565402) (not e!462788))))

(assert (=> b!830083 (= res!565402 (contains!4187 lt!376563 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830084 () Bool)

(declare-fun e!462778 () Bool)

(assert (=> b!830084 (= e!462778 (= (apply!372 lt!376563 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830085 () Bool)

(assert (=> b!830085 (= e!462780 e!462778)))

(declare-fun res!565400 () Bool)

(assert (=> b!830085 (= res!565400 call!36224)))

(assert (=> b!830085 (=> (not res!565400) (not e!462778))))

(declare-fun b!830086 () Bool)

(declare-fun c!89820 () Bool)

(assert (=> b!830086 (= c!89820 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830086 (= e!462786 e!462782)))

(assert (= (and d!105151 c!89816) b!830078))

(assert (= (and d!105151 (not c!89816)) b!830074))

(assert (= (and b!830074 c!89817) b!830082))

(assert (= (and b!830074 (not c!89817)) b!830086))

(assert (= (and b!830086 c!89820) b!830081))

(assert (= (and b!830086 (not c!89820)) b!830076))

(assert (= (or b!830081 b!830076) bm!36217))

(assert (= (or b!830082 bm!36217) bm!36218))

(assert (= (or b!830082 b!830081) bm!36215))

(assert (= (or b!830078 bm!36218) bm!36221))

(assert (= (or b!830078 bm!36215) bm!36216))

(assert (= (and d!105151 res!565403) b!830080))

(assert (= (and d!105151 c!89819) b!830077))

(assert (= (and d!105151 (not c!89819)) b!830071))

(assert (= (and d!105151 res!565406) b!830069))

(assert (= (and b!830069 res!565398) b!830070))

(assert (= (and b!830069 (not res!565399)) b!830083))

(assert (= (and b!830083 res!565402) b!830073))

(assert (= (and b!830069 res!565404) b!830075))

(assert (= (and b!830075 c!89815) b!830079))

(assert (= (and b!830075 (not c!89815)) b!830066))

(assert (= (and b!830079 res!565401) b!830072))

(assert (= (or b!830079 b!830066) bm!36219))

(assert (= (and b!830075 res!565405) b!830067))

(assert (= (and b!830067 c!89818) b!830085))

(assert (= (and b!830067 (not c!89818)) b!830068))

(assert (= (and b!830085 res!565400) b!830084))

(assert (= (or b!830085 b!830068) bm!36220))

(declare-fun b_lambda!11331 () Bool)

(assert (=> (not b_lambda!11331) (not b!830073)))

(assert (=> b!830073 t!22306))

(declare-fun b_and!22507 () Bool)

(assert (= b_and!22505 (and (=> t!22306 result!8007) b_and!22507)))

(declare-fun m!772681 () Bool)

(assert (=> b!830077 m!772681))

(declare-fun m!772683 () Bool)

(assert (=> b!830077 m!772683))

(declare-fun m!772685 () Bool)

(assert (=> b!830077 m!772685))

(declare-fun m!772687 () Bool)

(assert (=> b!830077 m!772687))

(declare-fun m!772689 () Bool)

(assert (=> b!830077 m!772689))

(declare-fun m!772691 () Bool)

(assert (=> b!830077 m!772691))

(declare-fun m!772693 () Bool)

(assert (=> b!830077 m!772693))

(declare-fun m!772695 () Bool)

(assert (=> b!830077 m!772695))

(assert (=> b!830077 m!772693))

(declare-fun m!772697 () Bool)

(assert (=> b!830077 m!772697))

(assert (=> b!830077 m!772595))

(declare-fun m!772699 () Bool)

(assert (=> b!830077 m!772699))

(declare-fun m!772701 () Bool)

(assert (=> b!830077 m!772701))

(declare-fun m!772703 () Bool)

(assert (=> b!830077 m!772703))

(assert (=> b!830077 m!772703))

(declare-fun m!772705 () Bool)

(assert (=> b!830077 m!772705))

(declare-fun m!772707 () Bool)

(assert (=> b!830077 m!772707))

(assert (=> b!830077 m!772685))

(declare-fun m!772709 () Bool)

(assert (=> b!830077 m!772709))

(assert (=> b!830077 m!772681))

(assert (=> b!830077 m!772501))

(assert (=> b!830080 m!772595))

(assert (=> b!830080 m!772595))

(assert (=> b!830080 m!772609))

(declare-fun m!772711 () Bool)

(assert (=> bm!36216 m!772711))

(assert (=> b!830073 m!772613))

(assert (=> b!830073 m!772615))

(assert (=> b!830073 m!772613))

(assert (=> b!830073 m!772615))

(assert (=> b!830073 m!772617))

(assert (=> b!830073 m!772595))

(declare-fun m!772713 () Bool)

(assert (=> b!830073 m!772713))

(assert (=> b!830073 m!772595))

(declare-fun m!772715 () Bool)

(assert (=> b!830072 m!772715))

(declare-fun m!772717 () Bool)

(assert (=> b!830078 m!772717))

(assert (=> b!830070 m!772595))

(assert (=> b!830070 m!772595))

(assert (=> b!830070 m!772609))

(declare-fun m!772719 () Bool)

(assert (=> b!830084 m!772719))

(assert (=> bm!36221 m!772501))

(declare-fun m!772721 () Bool)

(assert (=> bm!36219 m!772721))

(assert (=> b!830083 m!772595))

(assert (=> b!830083 m!772595))

(declare-fun m!772723 () Bool)

(assert (=> b!830083 m!772723))

(declare-fun m!772725 () Bool)

(assert (=> bm!36220 m!772725))

(assert (=> d!105151 m!772479))

(assert (=> b!829931 d!105151))

(declare-fun d!105153 () Bool)

(assert (=> d!105153 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376576 () Unit!28383)

(declare-fun choose!1425 (array!46555 array!46553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 V!25275 V!25275 (_ BitVec 32) Int) Unit!28383)

(assert (=> d!105153 (= lt!376576 (choose!1425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105153 (validMask!0 mask!1312)))

(assert (=> d!105153 (= (lemmaNoChangeToArrayThenSameMapNoExtras!600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376576)))

(declare-fun bs!23152 () Bool)

(assert (= bs!23152 d!105153))

(assert (=> bs!23152 m!772501))

(assert (=> bs!23152 m!772499))

(declare-fun m!772727 () Bool)

(assert (=> bs!23152 m!772727))

(assert (=> bs!23152 m!772479))

(assert (=> b!829934 d!105153))

(declare-fun b!830111 () Bool)

(declare-fun e!462806 () Bool)

(declare-fun e!462811 () Bool)

(assert (=> b!830111 (= e!462806 e!462811)))

(assert (=> b!830111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun res!565417 () Bool)

(declare-fun lt!376595 () ListLongMap!8973)

(assert (=> b!830111 (= res!565417 (contains!4187 lt!376595 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830111 (=> (not res!565417) (not e!462811))))

(declare-fun b!830112 () Bool)

(declare-fun e!462808 () Bool)

(assert (=> b!830112 (= e!462808 (= lt!376595 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830113 () Bool)

(declare-fun isEmpty!659 (ListLongMap!8973) Bool)

(assert (=> b!830113 (= e!462808 (isEmpty!659 lt!376595))))

(declare-fun b!830114 () Bool)

(declare-fun e!462809 () Bool)

(assert (=> b!830114 (= e!462809 e!462806)))

(declare-fun c!89831 () Bool)

(declare-fun e!462805 () Bool)

(assert (=> b!830114 (= c!89831 e!462805)))

(declare-fun res!565415 () Bool)

(assert (=> b!830114 (=> (not res!565415) (not e!462805))))

(assert (=> b!830114 (= res!565415 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830115 () Bool)

(assert (=> b!830115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> b!830115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22734 _values!788)))))

(assert (=> b!830115 (= e!462811 (= (apply!372 lt!376595 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105155 () Bool)

(assert (=> d!105155 e!462809))

(declare-fun res!565416 () Bool)

(assert (=> d!105155 (=> (not res!565416) (not e!462809))))

(assert (=> d!105155 (= res!565416 (not (contains!4187 lt!376595 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462807 () ListLongMap!8973)

(assert (=> d!105155 (= lt!376595 e!462807)))

(declare-fun c!89830 () Bool)

(assert (=> d!105155 (= c!89830 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105155 (validMask!0 mask!1312)))

(assert (=> d!105155 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376595)))

(declare-fun b!830116 () Bool)

(assert (=> b!830116 (= e!462806 e!462808)))

(declare-fun c!89829 () Bool)

(assert (=> b!830116 (= c!89829 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830117 () Bool)

(declare-fun e!462810 () ListLongMap!8973)

(declare-fun call!36227 () ListLongMap!8973)

(assert (=> b!830117 (= e!462810 call!36227)))

(declare-fun b!830118 () Bool)

(assert (=> b!830118 (= e!462805 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830118 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830119 () Bool)

(declare-fun lt!376597 () Unit!28383)

(declare-fun lt!376596 () Unit!28383)

(assert (=> b!830119 (= lt!376597 lt!376596)))

(declare-fun lt!376594 () (_ BitVec 64))

(declare-fun lt!376591 () V!25275)

(declare-fun lt!376593 () (_ BitVec 64))

(declare-fun lt!376592 () ListLongMap!8973)

(assert (=> b!830119 (not (contains!4187 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)) lt!376594))))

(declare-fun addStillNotContains!198 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> b!830119 (= lt!376596 (addStillNotContains!198 lt!376592 lt!376593 lt!376591 lt!376594))))

(assert (=> b!830119 (= lt!376594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830119 (= lt!376591 (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830119 (= lt!376593 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830119 (= lt!376592 call!36227)))

(assert (=> b!830119 (= e!462810 (+!2010 call!36227 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830120 () Bool)

(declare-fun res!565418 () Bool)

(assert (=> b!830120 (=> (not res!565418) (not e!462809))))

(assert (=> b!830120 (= res!565418 (not (contains!4187 lt!376595 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830121 () Bool)

(assert (=> b!830121 (= e!462807 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36224 () Bool)

(assert (=> bm!36224 (= call!36227 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830122 () Bool)

(assert (=> b!830122 (= e!462807 e!462810)))

(declare-fun c!89832 () Bool)

(assert (=> b!830122 (= c!89832 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105155 c!89830) b!830121))

(assert (= (and d!105155 (not c!89830)) b!830122))

(assert (= (and b!830122 c!89832) b!830119))

(assert (= (and b!830122 (not c!89832)) b!830117))

(assert (= (or b!830119 b!830117) bm!36224))

(assert (= (and d!105155 res!565416) b!830120))

(assert (= (and b!830120 res!565418) b!830114))

(assert (= (and b!830114 res!565415) b!830118))

(assert (= (and b!830114 c!89831) b!830111))

(assert (= (and b!830114 (not c!89831)) b!830116))

(assert (= (and b!830111 res!565417) b!830115))

(assert (= (and b!830116 c!89829) b!830112))

(assert (= (and b!830116 (not c!89829)) b!830113))

(declare-fun b_lambda!11333 () Bool)

(assert (=> (not b_lambda!11333) (not b!830115)))

(assert (=> b!830115 t!22306))

(declare-fun b_and!22509 () Bool)

(assert (= b_and!22507 (and (=> t!22306 result!8007) b_and!22509)))

(declare-fun b_lambda!11335 () Bool)

(assert (=> (not b_lambda!11335) (not b!830119)))

(assert (=> b!830119 t!22306))

(declare-fun b_and!22511 () Bool)

(assert (= b_and!22509 (and (=> t!22306 result!8007) b_and!22511)))

(declare-fun m!772729 () Bool)

(assert (=> b!830113 m!772729))

(declare-fun m!772731 () Bool)

(assert (=> bm!36224 m!772731))

(assert (=> b!830112 m!772731))

(assert (=> b!830118 m!772595))

(assert (=> b!830118 m!772595))

(assert (=> b!830118 m!772609))

(declare-fun m!772733 () Bool)

(assert (=> d!105155 m!772733))

(assert (=> d!105155 m!772479))

(assert (=> b!830111 m!772595))

(assert (=> b!830111 m!772595))

(declare-fun m!772735 () Bool)

(assert (=> b!830111 m!772735))

(assert (=> b!830122 m!772595))

(assert (=> b!830122 m!772595))

(assert (=> b!830122 m!772609))

(assert (=> b!830115 m!772595))

(assert (=> b!830115 m!772615))

(assert (=> b!830115 m!772595))

(declare-fun m!772737 () Bool)

(assert (=> b!830115 m!772737))

(assert (=> b!830115 m!772613))

(assert (=> b!830115 m!772615))

(assert (=> b!830115 m!772617))

(assert (=> b!830115 m!772613))

(declare-fun m!772739 () Bool)

(assert (=> b!830120 m!772739))

(assert (=> b!830119 m!772595))

(declare-fun m!772741 () Bool)

(assert (=> b!830119 m!772741))

(assert (=> b!830119 m!772613))

(assert (=> b!830119 m!772615))

(assert (=> b!830119 m!772617))

(assert (=> b!830119 m!772613))

(declare-fun m!772743 () Bool)

(assert (=> b!830119 m!772743))

(assert (=> b!830119 m!772741))

(declare-fun m!772745 () Bool)

(assert (=> b!830119 m!772745))

(assert (=> b!830119 m!772615))

(declare-fun m!772747 () Bool)

(assert (=> b!830119 m!772747))

(assert (=> b!829934 d!105155))

(declare-fun b!830123 () Bool)

(declare-fun e!462813 () Bool)

(declare-fun e!462818 () Bool)

(assert (=> b!830123 (= e!462813 e!462818)))

(assert (=> b!830123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun res!565421 () Bool)

(declare-fun lt!376602 () ListLongMap!8973)

(assert (=> b!830123 (= res!565421 (contains!4187 lt!376602 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830123 (=> (not res!565421) (not e!462818))))

(declare-fun e!462815 () Bool)

(declare-fun b!830124 () Bool)

(assert (=> b!830124 (= e!462815 (= lt!376602 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830125 () Bool)

(assert (=> b!830125 (= e!462815 (isEmpty!659 lt!376602))))

(declare-fun b!830126 () Bool)

(declare-fun e!462816 () Bool)

(assert (=> b!830126 (= e!462816 e!462813)))

(declare-fun c!89835 () Bool)

(declare-fun e!462812 () Bool)

(assert (=> b!830126 (= c!89835 e!462812)))

(declare-fun res!565419 () Bool)

(assert (=> b!830126 (=> (not res!565419) (not e!462812))))

(assert (=> b!830126 (= res!565419 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830127 () Bool)

(assert (=> b!830127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> b!830127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22734 _values!788)))))

(assert (=> b!830127 (= e!462818 (= (apply!372 lt!376602 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105157 () Bool)

(assert (=> d!105157 e!462816))

(declare-fun res!565420 () Bool)

(assert (=> d!105157 (=> (not res!565420) (not e!462816))))

(assert (=> d!105157 (= res!565420 (not (contains!4187 lt!376602 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462814 () ListLongMap!8973)

(assert (=> d!105157 (= lt!376602 e!462814)))

(declare-fun c!89834 () Bool)

(assert (=> d!105157 (= c!89834 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105157 (validMask!0 mask!1312)))

(assert (=> d!105157 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376602)))

(declare-fun b!830128 () Bool)

(assert (=> b!830128 (= e!462813 e!462815)))

(declare-fun c!89833 () Bool)

(assert (=> b!830128 (= c!89833 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830129 () Bool)

(declare-fun e!462817 () ListLongMap!8973)

(declare-fun call!36228 () ListLongMap!8973)

(assert (=> b!830129 (= e!462817 call!36228)))

(declare-fun b!830130 () Bool)

(assert (=> b!830130 (= e!462812 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830130 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830131 () Bool)

(declare-fun lt!376604 () Unit!28383)

(declare-fun lt!376603 () Unit!28383)

(assert (=> b!830131 (= lt!376604 lt!376603)))

(declare-fun lt!376600 () (_ BitVec 64))

(declare-fun lt!376599 () ListLongMap!8973)

(declare-fun lt!376598 () V!25275)

(declare-fun lt!376601 () (_ BitVec 64))

(assert (=> b!830131 (not (contains!4187 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)) lt!376601))))

(assert (=> b!830131 (= lt!376603 (addStillNotContains!198 lt!376599 lt!376600 lt!376598 lt!376601))))

(assert (=> b!830131 (= lt!376601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830131 (= lt!376598 (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830131 (= lt!376600 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830131 (= lt!376599 call!36228)))

(assert (=> b!830131 (= e!462817 (+!2010 call!36228 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830132 () Bool)

(declare-fun res!565422 () Bool)

(assert (=> b!830132 (=> (not res!565422) (not e!462816))))

(assert (=> b!830132 (= res!565422 (not (contains!4187 lt!376602 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830133 () Bool)

(assert (=> b!830133 (= e!462814 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36225 () Bool)

(assert (=> bm!36225 (= call!36228 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830134 () Bool)

(assert (=> b!830134 (= e!462814 e!462817)))

(declare-fun c!89836 () Bool)

(assert (=> b!830134 (= c!89836 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105157 c!89834) b!830133))

(assert (= (and d!105157 (not c!89834)) b!830134))

(assert (= (and b!830134 c!89836) b!830131))

(assert (= (and b!830134 (not c!89836)) b!830129))

(assert (= (or b!830131 b!830129) bm!36225))

(assert (= (and d!105157 res!565420) b!830132))

(assert (= (and b!830132 res!565422) b!830126))

(assert (= (and b!830126 res!565419) b!830130))

(assert (= (and b!830126 c!89835) b!830123))

(assert (= (and b!830126 (not c!89835)) b!830128))

(assert (= (and b!830123 res!565421) b!830127))

(assert (= (and b!830128 c!89833) b!830124))

(assert (= (and b!830128 (not c!89833)) b!830125))

(declare-fun b_lambda!11337 () Bool)

(assert (=> (not b_lambda!11337) (not b!830127)))

(assert (=> b!830127 t!22306))

(declare-fun b_and!22513 () Bool)

(assert (= b_and!22511 (and (=> t!22306 result!8007) b_and!22513)))

(declare-fun b_lambda!11339 () Bool)

(assert (=> (not b_lambda!11339) (not b!830131)))

(assert (=> b!830131 t!22306))

(declare-fun b_and!22515 () Bool)

(assert (= b_and!22513 (and (=> t!22306 result!8007) b_and!22515)))

(declare-fun m!772749 () Bool)

(assert (=> b!830125 m!772749))

(declare-fun m!772751 () Bool)

(assert (=> bm!36225 m!772751))

(assert (=> b!830124 m!772751))

(assert (=> b!830130 m!772595))

(assert (=> b!830130 m!772595))

(assert (=> b!830130 m!772609))

(declare-fun m!772753 () Bool)

(assert (=> d!105157 m!772753))

(assert (=> d!105157 m!772479))

(assert (=> b!830123 m!772595))

(assert (=> b!830123 m!772595))

(declare-fun m!772755 () Bool)

(assert (=> b!830123 m!772755))

(assert (=> b!830134 m!772595))

(assert (=> b!830134 m!772595))

(assert (=> b!830134 m!772609))

(assert (=> b!830127 m!772595))

(assert (=> b!830127 m!772615))

(assert (=> b!830127 m!772595))

(declare-fun m!772757 () Bool)

(assert (=> b!830127 m!772757))

(assert (=> b!830127 m!772613))

(assert (=> b!830127 m!772615))

(assert (=> b!830127 m!772617))

(assert (=> b!830127 m!772613))

(declare-fun m!772759 () Bool)

(assert (=> b!830132 m!772759))

(assert (=> b!830131 m!772595))

(declare-fun m!772761 () Bool)

(assert (=> b!830131 m!772761))

(assert (=> b!830131 m!772613))

(assert (=> b!830131 m!772615))

(assert (=> b!830131 m!772617))

(assert (=> b!830131 m!772613))

(declare-fun m!772763 () Bool)

(assert (=> b!830131 m!772763))

(assert (=> b!830131 m!772761))

(declare-fun m!772765 () Bool)

(assert (=> b!830131 m!772765))

(assert (=> b!830131 m!772615))

(declare-fun m!772767 () Bool)

(assert (=> b!830131 m!772767))

(assert (=> b!829934 d!105157))

(declare-fun d!105159 () Bool)

(declare-fun e!462819 () Bool)

(assert (=> d!105159 e!462819))

(declare-fun res!565424 () Bool)

(assert (=> d!105159 (=> (not res!565424) (not e!462819))))

(declare-fun lt!376607 () ListLongMap!8973)

(assert (=> d!105159 (= res!565424 (contains!4187 lt!376607 (_1!5091 lt!376416)))))

(declare-fun lt!376605 () List!15944)

(assert (=> d!105159 (= lt!376607 (ListLongMap!8974 lt!376605))))

(declare-fun lt!376606 () Unit!28383)

(declare-fun lt!376608 () Unit!28383)

(assert (=> d!105159 (= lt!376606 lt!376608)))

(assert (=> d!105159 (= (getValueByKey!413 lt!376605 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105159 (= lt!376608 (lemmaContainsTupThenGetReturnValue!230 lt!376605 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105159 (= lt!376605 (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(assert (=> d!105159 (= (+!2010 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376416) lt!376607)))

(declare-fun b!830135 () Bool)

(declare-fun res!565423 () Bool)

(assert (=> b!830135 (=> (not res!565423) (not e!462819))))

(assert (=> b!830135 (= res!565423 (= (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416))))))

(declare-fun b!830136 () Bool)

(assert (=> b!830136 (= e!462819 (contains!4188 (toList!4502 lt!376607) lt!376416))))

(assert (= (and d!105159 res!565424) b!830135))

(assert (= (and b!830135 res!565423) b!830136))

(declare-fun m!772769 () Bool)

(assert (=> d!105159 m!772769))

(declare-fun m!772771 () Bool)

(assert (=> d!105159 m!772771))

(declare-fun m!772773 () Bool)

(assert (=> d!105159 m!772773))

(declare-fun m!772775 () Bool)

(assert (=> d!105159 m!772775))

(declare-fun m!772777 () Bool)

(assert (=> b!830135 m!772777))

(declare-fun m!772779 () Bool)

(assert (=> b!830136 m!772779))

(assert (=> b!829928 d!105159))

(declare-fun d!105161 () Bool)

(declare-fun e!462820 () Bool)

(assert (=> d!105161 e!462820))

(declare-fun res!565426 () Bool)

(assert (=> d!105161 (=> (not res!565426) (not e!462820))))

(declare-fun lt!376611 () ListLongMap!8973)

(assert (=> d!105161 (= res!565426 (contains!4187 lt!376611 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376609 () List!15944)

(assert (=> d!105161 (= lt!376611 (ListLongMap!8974 lt!376609))))

(declare-fun lt!376610 () Unit!28383)

(declare-fun lt!376612 () Unit!28383)

(assert (=> d!105161 (= lt!376610 lt!376612)))

(assert (=> d!105161 (= (getValueByKey!413 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105161 (= lt!376612 (lemmaContainsTupThenGetReturnValue!230 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105161 (= lt!376609 (insertStrictlySorted!269 (toList!4502 lt!376419) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105161 (= (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376611)))

(declare-fun b!830137 () Bool)

(declare-fun res!565425 () Bool)

(assert (=> b!830137 (=> (not res!565425) (not e!462820))))

(assert (=> b!830137 (= res!565425 (= (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830138 () Bool)

(assert (=> b!830138 (= e!462820 (contains!4188 (toList!4502 lt!376611) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105161 res!565426) b!830137))

(assert (= (and b!830137 res!565425) b!830138))

(declare-fun m!772781 () Bool)

(assert (=> d!105161 m!772781))

(declare-fun m!772783 () Bool)

(assert (=> d!105161 m!772783))

(declare-fun m!772785 () Bool)

(assert (=> d!105161 m!772785))

(declare-fun m!772787 () Bool)

(assert (=> d!105161 m!772787))

(declare-fun m!772789 () Bool)

(assert (=> b!830137 m!772789))

(declare-fun m!772791 () Bool)

(assert (=> b!830138 m!772791))

(assert (=> b!829928 d!105161))

(declare-fun d!105163 () Bool)

(assert (=> d!105163 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71466 d!105163))

(declare-fun d!105165 () Bool)

(assert (=> d!105165 (= (array_inv!17835 _keys!976) (bvsge (size!22735 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71466 d!105165))

(declare-fun d!105167 () Bool)

(assert (=> d!105167 (= (array_inv!17836 _values!788) (bvsge (size!22734 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71466 d!105167))

(declare-fun b!830149 () Bool)

(declare-fun e!462830 () Bool)

(declare-fun call!36231 () Bool)

(assert (=> b!830149 (= e!462830 call!36231)))

(declare-fun b!830150 () Bool)

(assert (=> b!830150 (= e!462830 call!36231)))

(declare-fun d!105169 () Bool)

(declare-fun res!565435 () Bool)

(declare-fun e!462829 () Bool)

(assert (=> d!105169 (=> res!565435 e!462829)))

(assert (=> d!105169 (= res!565435 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105169 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15942) e!462829)))

(declare-fun b!830151 () Bool)

(declare-fun e!462831 () Bool)

(assert (=> b!830151 (= e!462829 e!462831)))

(declare-fun res!565433 () Bool)

(assert (=> b!830151 (=> (not res!565433) (not e!462831))))

(declare-fun e!462832 () Bool)

(assert (=> b!830151 (= res!565433 (not e!462832))))

(declare-fun res!565434 () Bool)

(assert (=> b!830151 (=> (not res!565434) (not e!462832))))

(assert (=> b!830151 (= res!565434 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830152 () Bool)

(assert (=> b!830152 (= e!462831 e!462830)))

(declare-fun c!89839 () Bool)

(assert (=> b!830152 (= c!89839 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36228 () Bool)

(assert (=> bm!36228 (= call!36231 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)))))

(declare-fun b!830153 () Bool)

(declare-fun contains!4189 (List!15945 (_ BitVec 64)) Bool)

(assert (=> b!830153 (= e!462832 (contains!4189 Nil!15942 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105169 (not res!565435)) b!830151))

(assert (= (and b!830151 res!565434) b!830153))

(assert (= (and b!830151 res!565433) b!830152))

(assert (= (and b!830152 c!89839) b!830150))

(assert (= (and b!830152 (not c!89839)) b!830149))

(assert (= (or b!830150 b!830149) bm!36228))

(assert (=> b!830151 m!772595))

(assert (=> b!830151 m!772595))

(assert (=> b!830151 m!772609))

(assert (=> b!830152 m!772595))

(assert (=> b!830152 m!772595))

(assert (=> b!830152 m!772609))

(assert (=> bm!36228 m!772595))

(declare-fun m!772793 () Bool)

(assert (=> bm!36228 m!772793))

(assert (=> b!830153 m!772595))

(assert (=> b!830153 m!772595))

(declare-fun m!772795 () Bool)

(assert (=> b!830153 m!772795))

(assert (=> b!829932 d!105169))

(declare-fun b!830162 () Bool)

(declare-fun e!462839 () Bool)

(declare-fun e!462841 () Bool)

(assert (=> b!830162 (= e!462839 e!462841)))

(declare-fun c!89842 () Bool)

(assert (=> b!830162 (= c!89842 (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105171 () Bool)

(declare-fun res!565440 () Bool)

(assert (=> d!105171 (=> res!565440 e!462839)))

(assert (=> d!105171 (= res!565440 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462839)))

(declare-fun b!830163 () Bool)

(declare-fun call!36234 () Bool)

(assert (=> b!830163 (= e!462841 call!36234)))

(declare-fun b!830164 () Bool)

(declare-fun e!462840 () Bool)

(assert (=> b!830164 (= e!462841 e!462840)))

(declare-fun lt!376619 () (_ BitVec 64))

(assert (=> b!830164 (= lt!376619 (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376620 () Unit!28383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46555 (_ BitVec 64) (_ BitVec 32)) Unit!28383)

(assert (=> b!830164 (= lt!376620 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376619 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!830164 (arrayContainsKey!0 _keys!976 lt!376619 #b00000000000000000000000000000000)))

(declare-fun lt!376621 () Unit!28383)

(assert (=> b!830164 (= lt!376621 lt!376620)))

(declare-fun res!565441 () Bool)

(declare-datatypes ((SeekEntryResult!8740 0))(
  ( (MissingZero!8740 (index!37331 (_ BitVec 32))) (Found!8740 (index!37332 (_ BitVec 32))) (Intermediate!8740 (undefined!9552 Bool) (index!37333 (_ BitVec 32)) (x!70100 (_ BitVec 32))) (Undefined!8740) (MissingVacant!8740 (index!37334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46555 (_ BitVec 32)) SeekEntryResult!8740)

(assert (=> b!830164 (= res!565441 (= (seekEntryOrOpen!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8740 #b00000000000000000000000000000000)))))

(assert (=> b!830164 (=> (not res!565441) (not e!462840))))

(declare-fun bm!36231 () Bool)

(assert (=> bm!36231 (= call!36234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830165 () Bool)

(assert (=> b!830165 (= e!462840 call!36234)))

(assert (= (and d!105171 (not res!565440)) b!830162))

(assert (= (and b!830162 c!89842) b!830164))

(assert (= (and b!830162 (not c!89842)) b!830163))

(assert (= (and b!830164 res!565441) b!830165))

(assert (= (or b!830165 b!830163) bm!36231))

(assert (=> b!830162 m!772595))

(assert (=> b!830162 m!772595))

(assert (=> b!830162 m!772609))

(assert (=> b!830164 m!772595))

(declare-fun m!772797 () Bool)

(assert (=> b!830164 m!772797))

(declare-fun m!772799 () Bool)

(assert (=> b!830164 m!772799))

(assert (=> b!830164 m!772595))

(declare-fun m!772801 () Bool)

(assert (=> b!830164 m!772801))

(declare-fun m!772803 () Bool)

(assert (=> bm!36231 m!772803))

(assert (=> b!829933 d!105171))

(declare-fun mapIsEmpty!24469 () Bool)

(declare-fun mapRes!24469 () Bool)

(assert (=> mapIsEmpty!24469 mapRes!24469))

(declare-fun b!830173 () Bool)

(declare-fun e!462846 () Bool)

(assert (=> b!830173 (= e!462846 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24469 () Bool)

(declare-fun tp!47287 () Bool)

(declare-fun e!462847 () Bool)

(assert (=> mapNonEmpty!24469 (= mapRes!24469 (and tp!47287 e!462847))))

(declare-fun mapRest!24469 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapKey!24469 () (_ BitVec 32))

(declare-fun mapValue!24469 () ValueCell!7187)

(assert (=> mapNonEmpty!24469 (= mapRest!24460 (store mapRest!24469 mapKey!24469 mapValue!24469))))

(declare-fun b!830172 () Bool)

(assert (=> b!830172 (= e!462847 tp_is_empty!15205)))

(declare-fun condMapEmpty!24469 () Bool)

(declare-fun mapDefault!24469 () ValueCell!7187)

(assert (=> mapNonEmpty!24460 (= condMapEmpty!24469 (= mapRest!24460 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24469)))))

(assert (=> mapNonEmpty!24460 (= tp!47272 (and e!462846 mapRes!24469))))

(assert (= (and mapNonEmpty!24460 condMapEmpty!24469) mapIsEmpty!24469))

(assert (= (and mapNonEmpty!24460 (not condMapEmpty!24469)) mapNonEmpty!24469))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7187) mapValue!24469)) b!830172))

(assert (= (and mapNonEmpty!24460 ((_ is ValueCellFull!7187) mapDefault!24469)) b!830173))

(declare-fun m!772805 () Bool)

(assert (=> mapNonEmpty!24469 m!772805))

(declare-fun b_lambda!11341 () Bool)

(assert (= b_lambda!11329 (or (and start!71466 b_free!13495) b_lambda!11341)))

(declare-fun b_lambda!11343 () Bool)

(assert (= b_lambda!11337 (or (and start!71466 b_free!13495) b_lambda!11343)))

(declare-fun b_lambda!11345 () Bool)

(assert (= b_lambda!11331 (or (and start!71466 b_free!13495) b_lambda!11345)))

(declare-fun b_lambda!11347 () Bool)

(assert (= b_lambda!11339 (or (and start!71466 b_free!13495) b_lambda!11347)))

(declare-fun b_lambda!11349 () Bool)

(assert (= b_lambda!11333 (or (and start!71466 b_free!13495) b_lambda!11349)))

(declare-fun b_lambda!11351 () Bool)

(assert (= b_lambda!11335 (or (and start!71466 b_free!13495) b_lambda!11351)))

(check-sat tp_is_empty!15205 (not d!105143) (not bm!36214) (not mapNonEmpty!24469) (not bm!36219) (not b!830164) (not b!830125) (not b!830130) (not d!105145) (not b!830122) (not b!830153) b_and!22515 (not b!830134) (not b!830062) (not d!105159) (not b!830113) (not b!830061) (not b!830118) (not b!830120) (not d!105157) (not d!105151) (not b!830115) (not b!830135) (not b_lambda!11349) (not b!830078) (not b!830059) (not bm!36228) (not b_lambda!11343) (not bm!36216) (not b!830072) (not b!830119) (not b!830070) (not b_lambda!11347) (not b!830063) (not b!830065) (not bm!36225) (not bm!36220) (not b!830060) (not b!830038) (not b!830152) (not b!830058) (not b_lambda!11341) (not b!830151) (not d!105147) (not bm!36213) (not b_lambda!11351) (not bm!36212) (not b!830077) (not b!830035) (not b!830123) (not b!830127) (not bm!36224) (not b!830138) (not b!830084) (not b_next!13495) (not b_lambda!11345) (not b!830049) (not b!830064) (not b!830112) (not bm!36221) (not b!830111) (not b!830124) (not d!105155) (not b!830162) (not bm!36209) (not b!830037) (not b!830083) (not d!105141) (not b!830073) (not b!830136) (not d!105153) (not bm!36231) (not b!830048) (not b!830137) (not b!830132) (not b!830043) (not d!105161) (not b!830131) (not b!830080) (not d!105149) (not b!830042) (not b!830045))
(check-sat b_and!22515 (not b_next!13495))
(get-model)

(declare-fun d!105173 () Bool)

(declare-fun e!462852 () Bool)

(assert (=> d!105173 e!462852))

(declare-fun res!565444 () Bool)

(assert (=> d!105173 (=> res!565444 e!462852)))

(declare-fun lt!376633 () Bool)

(assert (=> d!105173 (= res!565444 (not lt!376633))))

(declare-fun lt!376632 () Bool)

(assert (=> d!105173 (= lt!376633 lt!376632)))

(declare-fun lt!376631 () Unit!28383)

(declare-fun e!462853 () Unit!28383)

(assert (=> d!105173 (= lt!376631 e!462853)))

(declare-fun c!89845 () Bool)

(assert (=> d!105173 (= c!89845 lt!376632)))

(declare-fun containsKey!399 (List!15944 (_ BitVec 64)) Bool)

(assert (=> d!105173 (= lt!376632 (containsKey!399 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(assert (=> d!105173 (= (contains!4187 lt!376538 (_1!5091 lt!376417)) lt!376633)))

(declare-fun b!830180 () Bool)

(declare-fun lt!376630 () Unit!28383)

(assert (=> b!830180 (= e!462853 lt!376630)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!309 (List!15944 (_ BitVec 64)) Unit!28383)

(assert (=> b!830180 (= lt!376630 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(declare-fun isDefined!310 (Option!419) Bool)

(assert (=> b!830180 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(declare-fun b!830181 () Bool)

(declare-fun Unit!28391 () Unit!28383)

(assert (=> b!830181 (= e!462853 Unit!28391)))

(declare-fun b!830182 () Bool)

(assert (=> b!830182 (= e!462852 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417))))))

(assert (= (and d!105173 c!89845) b!830180))

(assert (= (and d!105173 (not c!89845)) b!830181))

(assert (= (and d!105173 (not res!565444)) b!830182))

(declare-fun m!772807 () Bool)

(assert (=> d!105173 m!772807))

(declare-fun m!772809 () Bool)

(assert (=> b!830180 m!772809))

(assert (=> b!830180 m!772641))

(assert (=> b!830180 m!772641))

(declare-fun m!772811 () Bool)

(assert (=> b!830180 m!772811))

(assert (=> b!830182 m!772641))

(assert (=> b!830182 m!772641))

(assert (=> b!830182 m!772811))

(assert (=> d!105143 d!105173))

(declare-fun b!830191 () Bool)

(declare-fun e!462858 () Option!419)

(assert (=> b!830191 (= e!462858 (Some!418 (_2!5091 (h!17069 lt!376536))))))

(declare-fun b!830192 () Bool)

(declare-fun e!462859 () Option!419)

(assert (=> b!830192 (= e!462858 e!462859)))

(declare-fun c!89851 () Bool)

(assert (=> b!830192 (= c!89851 (and ((_ is Cons!15940) lt!376536) (not (= (_1!5091 (h!17069 lt!376536)) (_1!5091 lt!376417)))))))

(declare-fun b!830194 () Bool)

(assert (=> b!830194 (= e!462859 None!417)))

(declare-fun b!830193 () Bool)

(assert (=> b!830193 (= e!462859 (getValueByKey!413 (t!22300 lt!376536) (_1!5091 lt!376417)))))

(declare-fun d!105175 () Bool)

(declare-fun c!89850 () Bool)

(assert (=> d!105175 (= c!89850 (and ((_ is Cons!15940) lt!376536) (= (_1!5091 (h!17069 lt!376536)) (_1!5091 lt!376417))))))

(assert (=> d!105175 (= (getValueByKey!413 lt!376536 (_1!5091 lt!376417)) e!462858)))

(assert (= (and d!105175 c!89850) b!830191))

(assert (= (and d!105175 (not c!89850)) b!830192))

(assert (= (and b!830192 c!89851) b!830193))

(assert (= (and b!830192 (not c!89851)) b!830194))

(declare-fun m!772813 () Bool)

(assert (=> b!830193 m!772813))

(assert (=> d!105143 d!105175))

(declare-fun d!105177 () Bool)

(assert (=> d!105177 (= (getValueByKey!413 lt!376536 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(declare-fun lt!376636 () Unit!28383)

(declare-fun choose!1426 (List!15944 (_ BitVec 64) V!25275) Unit!28383)

(assert (=> d!105177 (= lt!376636 (choose!1426 lt!376536 (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun e!462862 () Bool)

(assert (=> d!105177 e!462862))

(declare-fun res!565449 () Bool)

(assert (=> d!105177 (=> (not res!565449) (not e!462862))))

(declare-fun isStrictlySorted!437 (List!15944) Bool)

(assert (=> d!105177 (= res!565449 (isStrictlySorted!437 lt!376536))))

(assert (=> d!105177 (= (lemmaContainsTupThenGetReturnValue!230 lt!376536 (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!376636)))

(declare-fun b!830199 () Bool)

(declare-fun res!565450 () Bool)

(assert (=> b!830199 (=> (not res!565450) (not e!462862))))

(assert (=> b!830199 (= res!565450 (containsKey!399 lt!376536 (_1!5091 lt!376417)))))

(declare-fun b!830200 () Bool)

(assert (=> b!830200 (= e!462862 (contains!4188 lt!376536 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105177 res!565449) b!830199))

(assert (= (and b!830199 res!565450) b!830200))

(assert (=> d!105177 m!772635))

(declare-fun m!772815 () Bool)

(assert (=> d!105177 m!772815))

(declare-fun m!772817 () Bool)

(assert (=> d!105177 m!772817))

(declare-fun m!772819 () Bool)

(assert (=> b!830199 m!772819))

(declare-fun m!772821 () Bool)

(assert (=> b!830200 m!772821))

(assert (=> d!105143 d!105177))

(declare-fun b!830221 () Bool)

(declare-fun res!565455 () Bool)

(declare-fun e!462874 () Bool)

(assert (=> b!830221 (=> (not res!565455) (not e!462874))))

(declare-fun lt!376639 () List!15944)

(assert (=> b!830221 (= res!565455 (containsKey!399 lt!376639 (_1!5091 lt!376417)))))

(declare-fun e!462876 () List!15944)

(declare-fun b!830222 () Bool)

(declare-fun c!89860 () Bool)

(declare-fun c!89862 () Bool)

(assert (=> b!830222 (= e!462876 (ite c!89862 (t!22300 (toList!4502 lt!376414)) (ite c!89860 (Cons!15940 (h!17069 (toList!4502 lt!376414)) (t!22300 (toList!4502 lt!376414))) Nil!15941)))))

(declare-fun b!830223 () Bool)

(assert (=> b!830223 (= c!89860 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376417))))))

(declare-fun e!462873 () List!15944)

(declare-fun e!462875 () List!15944)

(assert (=> b!830223 (= e!462873 e!462875)))

(declare-fun b!830224 () Bool)

(assert (=> b!830224 (= e!462876 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376414)) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun b!830225 () Bool)

(declare-fun e!462877 () List!15944)

(declare-fun call!36241 () List!15944)

(assert (=> b!830225 (= e!462877 call!36241)))

(declare-fun b!830226 () Bool)

(declare-fun call!36243 () List!15944)

(assert (=> b!830226 (= e!462873 call!36243)))

(declare-fun b!830227 () Bool)

(declare-fun call!36242 () List!15944)

(assert (=> b!830227 (= e!462875 call!36242)))

(declare-fun bm!36238 () Bool)

(assert (=> bm!36238 (= call!36242 call!36243)))

(declare-fun b!830228 () Bool)

(assert (=> b!830228 (= e!462874 (contains!4188 lt!376639 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun d!105179 () Bool)

(assert (=> d!105179 e!462874))

(declare-fun res!565456 () Bool)

(assert (=> d!105179 (=> (not res!565456) (not e!462874))))

(assert (=> d!105179 (= res!565456 (isStrictlySorted!437 lt!376639))))

(assert (=> d!105179 (= lt!376639 e!462877)))

(declare-fun c!89863 () Bool)

(assert (=> d!105179 (= c!89863 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376417))))))

(assert (=> d!105179 (isStrictlySorted!437 (toList!4502 lt!376414))))

(assert (=> d!105179 (= (insertStrictlySorted!269 (toList!4502 lt!376414) (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!376639)))

(declare-fun bm!36239 () Bool)

(assert (=> bm!36239 (= call!36243 call!36241)))

(declare-fun bm!36240 () Bool)

(declare-fun $colon$colon!535 (List!15944 tuple2!10160) List!15944)

(assert (=> bm!36240 (= call!36241 ($colon$colon!535 e!462876 (ite c!89863 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))))))

(declare-fun c!89861 () Bool)

(assert (=> bm!36240 (= c!89861 c!89863)))

(declare-fun b!830229 () Bool)

(assert (=> b!830229 (= e!462877 e!462873)))

(assert (=> b!830229 (= c!89862 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (= (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376417))))))

(declare-fun b!830230 () Bool)

(assert (=> b!830230 (= e!462875 call!36242)))

(assert (= (and d!105179 c!89863) b!830225))

(assert (= (and d!105179 (not c!89863)) b!830229))

(assert (= (and b!830229 c!89862) b!830226))

(assert (= (and b!830229 (not c!89862)) b!830223))

(assert (= (and b!830223 c!89860) b!830230))

(assert (= (and b!830223 (not c!89860)) b!830227))

(assert (= (or b!830230 b!830227) bm!36238))

(assert (= (or b!830226 bm!36238) bm!36239))

(assert (= (or b!830225 bm!36239) bm!36240))

(assert (= (and bm!36240 c!89861) b!830224))

(assert (= (and bm!36240 (not c!89861)) b!830222))

(assert (= (and d!105179 res!565456) b!830221))

(assert (= (and b!830221 res!565455) b!830228))

(declare-fun m!772823 () Bool)

(assert (=> b!830221 m!772823))

(declare-fun m!772825 () Bool)

(assert (=> b!830228 m!772825))

(declare-fun m!772827 () Bool)

(assert (=> b!830224 m!772827))

(declare-fun m!772829 () Bool)

(assert (=> d!105179 m!772829))

(declare-fun m!772831 () Bool)

(assert (=> d!105179 m!772831))

(declare-fun m!772833 () Bool)

(assert (=> bm!36240 m!772833))

(assert (=> d!105143 d!105179))

(declare-fun d!105181 () Bool)

(declare-fun e!462878 () Bool)

(assert (=> d!105181 e!462878))

(declare-fun res!565457 () Bool)

(assert (=> d!105181 (=> res!565457 e!462878)))

(declare-fun lt!376643 () Bool)

(assert (=> d!105181 (= res!565457 (not lt!376643))))

(declare-fun lt!376642 () Bool)

(assert (=> d!105181 (= lt!376643 lt!376642)))

(declare-fun lt!376641 () Unit!28383)

(declare-fun e!462879 () Unit!28383)

(assert (=> d!105181 (= lt!376641 e!462879)))

(declare-fun c!89864 () Bool)

(assert (=> d!105181 (= c!89864 lt!376642)))

(assert (=> d!105181 (= lt!376642 (containsKey!399 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105181 (= (contains!4187 lt!376611 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!376643)))

(declare-fun b!830231 () Bool)

(declare-fun lt!376640 () Unit!28383)

(assert (=> b!830231 (= e!462879 lt!376640)))

(assert (=> b!830231 (= lt!376640 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!830231 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830232 () Bool)

(declare-fun Unit!28392 () Unit!28383)

(assert (=> b!830232 (= e!462879 Unit!28392)))

(declare-fun b!830233 () Bool)

(assert (=> b!830233 (= e!462878 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105181 c!89864) b!830231))

(assert (= (and d!105181 (not c!89864)) b!830232))

(assert (= (and d!105181 (not res!565457)) b!830233))

(declare-fun m!772835 () Bool)

(assert (=> d!105181 m!772835))

(declare-fun m!772837 () Bool)

(assert (=> b!830231 m!772837))

(assert (=> b!830231 m!772789))

(assert (=> b!830231 m!772789))

(declare-fun m!772839 () Bool)

(assert (=> b!830231 m!772839))

(assert (=> b!830233 m!772789))

(assert (=> b!830233 m!772789))

(assert (=> b!830233 m!772839))

(assert (=> d!105161 d!105181))

(declare-fun b!830234 () Bool)

(declare-fun e!462880 () Option!419)

(assert (=> b!830234 (= e!462880 (Some!418 (_2!5091 (h!17069 lt!376609))))))

(declare-fun b!830235 () Bool)

(declare-fun e!462881 () Option!419)

(assert (=> b!830235 (= e!462880 e!462881)))

(declare-fun c!89866 () Bool)

(assert (=> b!830235 (= c!89866 (and ((_ is Cons!15940) lt!376609) (not (= (_1!5091 (h!17069 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830237 () Bool)

(assert (=> b!830237 (= e!462881 None!417)))

(declare-fun b!830236 () Bool)

(assert (=> b!830236 (= e!462881 (getValueByKey!413 (t!22300 lt!376609) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105183 () Bool)

(declare-fun c!89865 () Bool)

(assert (=> d!105183 (= c!89865 (and ((_ is Cons!15940) lt!376609) (= (_1!5091 (h!17069 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105183 (= (getValueByKey!413 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!462880)))

(assert (= (and d!105183 c!89865) b!830234))

(assert (= (and d!105183 (not c!89865)) b!830235))

(assert (= (and b!830235 c!89866) b!830236))

(assert (= (and b!830235 (not c!89866)) b!830237))

(declare-fun m!772841 () Bool)

(assert (=> b!830236 m!772841))

(assert (=> d!105161 d!105183))

(declare-fun d!105185 () Bool)

(assert (=> d!105185 (= (getValueByKey!413 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376644 () Unit!28383)

(assert (=> d!105185 (= lt!376644 (choose!1426 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!462882 () Bool)

(assert (=> d!105185 e!462882))

(declare-fun res!565458 () Bool)

(assert (=> d!105185 (=> (not res!565458) (not e!462882))))

(assert (=> d!105185 (= res!565458 (isStrictlySorted!437 lt!376609))))

(assert (=> d!105185 (= (lemmaContainsTupThenGetReturnValue!230 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!376644)))

(declare-fun b!830238 () Bool)

(declare-fun res!565459 () Bool)

(assert (=> b!830238 (=> (not res!565459) (not e!462882))))

(assert (=> b!830238 (= res!565459 (containsKey!399 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830239 () Bool)

(assert (=> b!830239 (= e!462882 (contains!4188 lt!376609 (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105185 res!565458) b!830238))

(assert (= (and b!830238 res!565459) b!830239))

(assert (=> d!105185 m!772783))

(declare-fun m!772843 () Bool)

(assert (=> d!105185 m!772843))

(declare-fun m!772845 () Bool)

(assert (=> d!105185 m!772845))

(declare-fun m!772847 () Bool)

(assert (=> b!830238 m!772847))

(declare-fun m!772849 () Bool)

(assert (=> b!830239 m!772849))

(assert (=> d!105161 d!105185))

(declare-fun b!830240 () Bool)

(declare-fun res!565460 () Bool)

(declare-fun e!462884 () Bool)

(assert (=> b!830240 (=> (not res!565460) (not e!462884))))

(declare-fun lt!376645 () List!15944)

(assert (=> b!830240 (= res!565460 (containsKey!399 lt!376645 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!462886 () List!15944)

(declare-fun c!89867 () Bool)

(declare-fun b!830241 () Bool)

(declare-fun c!89869 () Bool)

(assert (=> b!830241 (= e!462886 (ite c!89869 (t!22300 (toList!4502 lt!376419)) (ite c!89867 (Cons!15940 (h!17069 (toList!4502 lt!376419)) (t!22300 (toList!4502 lt!376419))) Nil!15941)))))

(declare-fun b!830242 () Bool)

(assert (=> b!830242 (= c!89867 (and ((_ is Cons!15940) (toList!4502 lt!376419)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376419))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!462883 () List!15944)

(declare-fun e!462885 () List!15944)

(assert (=> b!830242 (= e!462883 e!462885)))

(declare-fun b!830243 () Bool)

(assert (=> b!830243 (= e!462886 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376419)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830244 () Bool)

(declare-fun e!462887 () List!15944)

(declare-fun call!36244 () List!15944)

(assert (=> b!830244 (= e!462887 call!36244)))

(declare-fun b!830245 () Bool)

(declare-fun call!36246 () List!15944)

(assert (=> b!830245 (= e!462883 call!36246)))

(declare-fun b!830246 () Bool)

(declare-fun call!36245 () List!15944)

(assert (=> b!830246 (= e!462885 call!36245)))

(declare-fun bm!36241 () Bool)

(assert (=> bm!36241 (= call!36245 call!36246)))

(declare-fun b!830247 () Bool)

(assert (=> b!830247 (= e!462884 (contains!4188 lt!376645 (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun d!105187 () Bool)

(assert (=> d!105187 e!462884))

(declare-fun res!565461 () Bool)

(assert (=> d!105187 (=> (not res!565461) (not e!462884))))

(assert (=> d!105187 (= res!565461 (isStrictlySorted!437 lt!376645))))

(assert (=> d!105187 (= lt!376645 e!462887)))

(declare-fun c!89870 () Bool)

(assert (=> d!105187 (= c!89870 (and ((_ is Cons!15940) (toList!4502 lt!376419)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376419))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105187 (isStrictlySorted!437 (toList!4502 lt!376419))))

(assert (=> d!105187 (= (insertStrictlySorted!269 (toList!4502 lt!376419) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!376645)))

(declare-fun bm!36242 () Bool)

(assert (=> bm!36242 (= call!36246 call!36244)))

(declare-fun bm!36243 () Bool)

(assert (=> bm!36243 (= call!36244 ($colon$colon!535 e!462886 (ite c!89870 (h!17069 (toList!4502 lt!376419)) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!89868 () Bool)

(assert (=> bm!36243 (= c!89868 c!89870)))

(declare-fun b!830248 () Bool)

(assert (=> b!830248 (= e!462887 e!462883)))

(assert (=> b!830248 (= c!89869 (and ((_ is Cons!15940) (toList!4502 lt!376419)) (= (_1!5091 (h!17069 (toList!4502 lt!376419))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830249 () Bool)

(assert (=> b!830249 (= e!462885 call!36245)))

(assert (= (and d!105187 c!89870) b!830244))

(assert (= (and d!105187 (not c!89870)) b!830248))

(assert (= (and b!830248 c!89869) b!830245))

(assert (= (and b!830248 (not c!89869)) b!830242))

(assert (= (and b!830242 c!89867) b!830249))

(assert (= (and b!830242 (not c!89867)) b!830246))

(assert (= (or b!830249 b!830246) bm!36241))

(assert (= (or b!830245 bm!36241) bm!36242))

(assert (= (or b!830244 bm!36242) bm!36243))

(assert (= (and bm!36243 c!89868) b!830243))

(assert (= (and bm!36243 (not c!89868)) b!830241))

(assert (= (and d!105187 res!565461) b!830240))

(assert (= (and b!830240 res!565460) b!830247))

(declare-fun m!772851 () Bool)

(assert (=> b!830240 m!772851))

(declare-fun m!772853 () Bool)

(assert (=> b!830247 m!772853))

(declare-fun m!772855 () Bool)

(assert (=> b!830243 m!772855))

(declare-fun m!772857 () Bool)

(assert (=> d!105187 m!772857))

(declare-fun m!772859 () Bool)

(assert (=> d!105187 m!772859))

(declare-fun m!772861 () Bool)

(assert (=> bm!36243 m!772861))

(assert (=> d!105161 d!105187))

(declare-fun d!105189 () Bool)

(assert (=> d!105189 (= (validKeyInArray!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22314 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22314 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830152 d!105189))

(declare-fun d!105191 () Bool)

(declare-fun isEmpty!660 (List!15944) Bool)

(assert (=> d!105191 (= (isEmpty!659 lt!376602) (isEmpty!660 (toList!4502 lt!376602)))))

(declare-fun bs!23153 () Bool)

(assert (= bs!23153 d!105191))

(declare-fun m!772863 () Bool)

(assert (=> bs!23153 m!772863))

(assert (=> b!830125 d!105191))

(declare-fun d!105193 () Bool)

(declare-fun e!462888 () Bool)

(assert (=> d!105193 e!462888))

(declare-fun res!565462 () Bool)

(assert (=> d!105193 (=> res!565462 e!462888)))

(declare-fun lt!376649 () Bool)

(assert (=> d!105193 (= res!565462 (not lt!376649))))

(declare-fun lt!376648 () Bool)

(assert (=> d!105193 (= lt!376649 lt!376648)))

(declare-fun lt!376647 () Unit!28383)

(declare-fun e!462889 () Unit!28383)

(assert (=> d!105193 (= lt!376647 e!462889)))

(declare-fun c!89871 () Bool)

(assert (=> d!105193 (= c!89871 lt!376648)))

(assert (=> d!105193 (= lt!376648 (containsKey!399 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105193 (= (contains!4187 lt!376563 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376649)))

(declare-fun b!830250 () Bool)

(declare-fun lt!376646 () Unit!28383)

(assert (=> b!830250 (= e!462889 lt!376646)))

(assert (=> b!830250 (= lt!376646 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830250 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830251 () Bool)

(declare-fun Unit!28393 () Unit!28383)

(assert (=> b!830251 (= e!462889 Unit!28393)))

(declare-fun b!830252 () Bool)

(assert (=> b!830252 (= e!462888 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105193 c!89871) b!830250))

(assert (= (and d!105193 (not c!89871)) b!830251))

(assert (= (and d!105193 (not res!565462)) b!830252))

(declare-fun m!772865 () Bool)

(assert (=> d!105193 m!772865))

(declare-fun m!772867 () Bool)

(assert (=> b!830250 m!772867))

(declare-fun m!772869 () Bool)

(assert (=> b!830250 m!772869))

(assert (=> b!830250 m!772869))

(declare-fun m!772871 () Bool)

(assert (=> b!830250 m!772871))

(assert (=> b!830252 m!772869))

(assert (=> b!830252 m!772869))

(assert (=> b!830252 m!772871))

(assert (=> bm!36220 d!105193))

(assert (=> b!830118 d!105189))

(declare-fun d!105195 () Bool)

(declare-fun lt!376652 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!384 (List!15945) (InoxSet (_ BitVec 64)))

(assert (=> d!105195 (= lt!376652 (select (content!384 Nil!15942) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!462894 () Bool)

(assert (=> d!105195 (= lt!376652 e!462894)))

(declare-fun res!565468 () Bool)

(assert (=> d!105195 (=> (not res!565468) (not e!462894))))

(assert (=> d!105195 (= res!565468 ((_ is Cons!15941) Nil!15942))))

(assert (=> d!105195 (= (contains!4189 Nil!15942 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376652)))

(declare-fun b!830257 () Bool)

(declare-fun e!462895 () Bool)

(assert (=> b!830257 (= e!462894 e!462895)))

(declare-fun res!565467 () Bool)

(assert (=> b!830257 (=> res!565467 e!462895)))

(assert (=> b!830257 (= res!565467 (= (h!17070 Nil!15942) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830258 () Bool)

(assert (=> b!830258 (= e!462895 (contains!4189 (t!22301 Nil!15942) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105195 res!565468) b!830257))

(assert (= (and b!830257 (not res!565467)) b!830258))

(declare-fun m!772873 () Bool)

(assert (=> d!105195 m!772873))

(assert (=> d!105195 m!772595))

(declare-fun m!772875 () Bool)

(assert (=> d!105195 m!772875))

(assert (=> b!830258 m!772595))

(declare-fun m!772877 () Bool)

(assert (=> b!830258 m!772877))

(assert (=> b!830153 d!105195))

(declare-fun d!105197 () Bool)

(declare-fun get!11824 (Option!419) V!25275)

(assert (=> d!105197 (= (apply!372 lt!376602 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23154 () Bool)

(assert (= bs!23154 d!105197))

(assert (=> bs!23154 m!772595))

(declare-fun m!772879 () Bool)

(assert (=> bs!23154 m!772879))

(assert (=> bs!23154 m!772879))

(declare-fun m!772881 () Bool)

(assert (=> bs!23154 m!772881))

(assert (=> b!830127 d!105197))

(declare-fun d!105199 () Bool)

(declare-fun c!89874 () Bool)

(assert (=> d!105199 (= c!89874 ((_ is ValueCellFull!7187) (select (arr!22313 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!462898 () V!25275)

(assert (=> d!105199 (= (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!462898)))

(declare-fun b!830263 () Bool)

(declare-fun get!11825 (ValueCell!7187 V!25275) V!25275)

(assert (=> b!830263 (= e!462898 (get!11825 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830264 () Bool)

(declare-fun get!11826 (ValueCell!7187 V!25275) V!25275)

(assert (=> b!830264 (= e!462898 (get!11826 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105199 c!89874) b!830263))

(assert (= (and d!105199 (not c!89874)) b!830264))

(assert (=> b!830263 m!772613))

(assert (=> b!830263 m!772615))

(declare-fun m!772883 () Bool)

(assert (=> b!830263 m!772883))

(assert (=> b!830264 m!772613))

(assert (=> b!830264 m!772615))

(declare-fun m!772885 () Bool)

(assert (=> b!830264 m!772885))

(assert (=> b!830127 d!105199))

(assert (=> bm!36221 d!105157))

(declare-fun d!105201 () Bool)

(declare-fun e!462899 () Bool)

(assert (=> d!105201 e!462899))

(declare-fun res!565470 () Bool)

(assert (=> d!105201 (=> (not res!565470) (not e!462899))))

(declare-fun lt!376655 () ListLongMap!8973)

(assert (=> d!105201 (= res!565470 (contains!4187 lt!376655 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376653 () List!15944)

(assert (=> d!105201 (= lt!376655 (ListLongMap!8974 lt!376653))))

(declare-fun lt!376654 () Unit!28383)

(declare-fun lt!376656 () Unit!28383)

(assert (=> d!105201 (= lt!376654 lt!376656)))

(assert (=> d!105201 (= (getValueByKey!413 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105201 (= lt!376656 (lemmaContainsTupThenGetReturnValue!230 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105201 (= lt!376653 (insertStrictlySorted!269 (toList!4502 call!36214) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105201 (= (+!2010 call!36214 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376655)))

(declare-fun b!830265 () Bool)

(declare-fun res!565469 () Bool)

(assert (=> b!830265 (=> (not res!565469) (not e!462899))))

(assert (=> b!830265 (= res!565469 (= (getValueByKey!413 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830266 () Bool)

(assert (=> b!830266 (= e!462899 (contains!4188 (toList!4502 lt!376655) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105201 res!565470) b!830265))

(assert (= (and b!830265 res!565469) b!830266))

(declare-fun m!772887 () Bool)

(assert (=> d!105201 m!772887))

(declare-fun m!772889 () Bool)

(assert (=> d!105201 m!772889))

(declare-fun m!772891 () Bool)

(assert (=> d!105201 m!772891))

(declare-fun m!772893 () Bool)

(assert (=> d!105201 m!772893))

(declare-fun m!772895 () Bool)

(assert (=> b!830265 m!772895))

(declare-fun m!772897 () Bool)

(assert (=> b!830266 m!772897))

(assert (=> b!830043 d!105201))

(declare-fun d!105203 () Bool)

(declare-fun e!462900 () Bool)

(assert (=> d!105203 e!462900))

(declare-fun res!565471 () Bool)

(assert (=> d!105203 (=> res!565471 e!462900)))

(declare-fun lt!376660 () Bool)

(assert (=> d!105203 (= res!565471 (not lt!376660))))

(declare-fun lt!376659 () Bool)

(assert (=> d!105203 (= lt!376660 lt!376659)))

(declare-fun lt!376658 () Unit!28383)

(declare-fun e!462901 () Unit!28383)

(assert (=> d!105203 (= lt!376658 e!462901)))

(declare-fun c!89875 () Bool)

(assert (=> d!105203 (= c!89875 lt!376659)))

(assert (=> d!105203 (= lt!376659 (containsKey!399 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105203 (= (contains!4187 lt!376602 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376660)))

(declare-fun b!830267 () Bool)

(declare-fun lt!376657 () Unit!28383)

(assert (=> b!830267 (= e!462901 lt!376657)))

(assert (=> b!830267 (= lt!376657 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830267 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830268 () Bool)

(declare-fun Unit!28394 () Unit!28383)

(assert (=> b!830268 (= e!462901 Unit!28394)))

(declare-fun b!830269 () Bool)

(assert (=> b!830269 (= e!462900 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105203 c!89875) b!830267))

(assert (= (and d!105203 (not c!89875)) b!830268))

(assert (= (and d!105203 (not res!565471)) b!830269))

(assert (=> d!105203 m!772595))

(declare-fun m!772899 () Bool)

(assert (=> d!105203 m!772899))

(assert (=> b!830267 m!772595))

(declare-fun m!772901 () Bool)

(assert (=> b!830267 m!772901))

(assert (=> b!830267 m!772595))

(assert (=> b!830267 m!772879))

(assert (=> b!830267 m!772879))

(declare-fun m!772903 () Bool)

(assert (=> b!830267 m!772903))

(assert (=> b!830269 m!772595))

(assert (=> b!830269 m!772879))

(assert (=> b!830269 m!772879))

(assert (=> b!830269 m!772903))

(assert (=> b!830123 d!105203))

(declare-fun d!105205 () Bool)

(declare-fun e!462902 () Bool)

(assert (=> d!105205 e!462902))

(declare-fun res!565473 () Bool)

(assert (=> d!105205 (=> (not res!565473) (not e!462902))))

(declare-fun lt!376663 () ListLongMap!8973)

(assert (=> d!105205 (= res!565473 (contains!4187 lt!376663 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376661 () List!15944)

(assert (=> d!105205 (= lt!376663 (ListLongMap!8974 lt!376661))))

(declare-fun lt!376662 () Unit!28383)

(declare-fun lt!376664 () Unit!28383)

(assert (=> d!105205 (= lt!376662 lt!376664)))

(assert (=> d!105205 (= (getValueByKey!413 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105205 (= lt!376664 (lemmaContainsTupThenGetReturnValue!230 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105205 (= lt!376661 (insertStrictlySorted!269 (toList!4502 call!36221) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105205 (= (+!2010 call!36221 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376663)))

(declare-fun b!830270 () Bool)

(declare-fun res!565472 () Bool)

(assert (=> b!830270 (=> (not res!565472) (not e!462902))))

(assert (=> b!830270 (= res!565472 (= (getValueByKey!413 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830271 () Bool)

(assert (=> b!830271 (= e!462902 (contains!4188 (toList!4502 lt!376663) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105205 res!565473) b!830270))

(assert (= (and b!830270 res!565472) b!830271))

(declare-fun m!772905 () Bool)

(assert (=> d!105205 m!772905))

(declare-fun m!772907 () Bool)

(assert (=> d!105205 m!772907))

(declare-fun m!772909 () Bool)

(assert (=> d!105205 m!772909))

(declare-fun m!772911 () Bool)

(assert (=> d!105205 m!772911))

(declare-fun m!772913 () Bool)

(assert (=> b!830270 m!772913))

(declare-fun m!772915 () Bool)

(assert (=> b!830271 m!772915))

(assert (=> b!830078 d!105205))

(declare-fun d!105207 () Bool)

(assert (=> d!105207 (= (apply!372 lt!376517 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23155 () Bool)

(assert (= bs!23155 d!105207))

(declare-fun m!772917 () Bool)

(assert (=> bs!23155 m!772917))

(assert (=> bs!23155 m!772917))

(declare-fun m!772919 () Bool)

(assert (=> bs!23155 m!772919))

(assert (=> b!830037 d!105207))

(declare-fun b!830272 () Bool)

(declare-fun e!462904 () Bool)

(declare-fun e!462909 () Bool)

(assert (=> b!830272 (= e!462904 e!462909)))

(assert (=> b!830272 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun res!565476 () Bool)

(declare-fun lt!376669 () ListLongMap!8973)

(assert (=> b!830272 (= res!565476 (contains!4187 lt!376669 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830272 (=> (not res!565476) (not e!462909))))

(declare-fun e!462906 () Bool)

(declare-fun b!830273 () Bool)

(assert (=> b!830273 (= e!462906 (= lt!376669 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830274 () Bool)

(assert (=> b!830274 (= e!462906 (isEmpty!659 lt!376669))))

(declare-fun b!830275 () Bool)

(declare-fun e!462907 () Bool)

(assert (=> b!830275 (= e!462907 e!462904)))

(declare-fun c!89878 () Bool)

(declare-fun e!462903 () Bool)

(assert (=> b!830275 (= c!89878 e!462903)))

(declare-fun res!565474 () Bool)

(assert (=> b!830275 (=> (not res!565474) (not e!462903))))

(assert (=> b!830275 (= res!565474 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830276 () Bool)

(assert (=> b!830276 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> b!830276 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22734 _values!788)))))

(assert (=> b!830276 (= e!462909 (= (apply!372 lt!376669 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105209 () Bool)

(assert (=> d!105209 e!462907))

(declare-fun res!565475 () Bool)

(assert (=> d!105209 (=> (not res!565475) (not e!462907))))

(assert (=> d!105209 (= res!565475 (not (contains!4187 lt!376669 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462905 () ListLongMap!8973)

(assert (=> d!105209 (= lt!376669 e!462905)))

(declare-fun c!89877 () Bool)

(assert (=> d!105209 (= c!89877 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105209 (validMask!0 mask!1312)))

(assert (=> d!105209 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!376669)))

(declare-fun b!830277 () Bool)

(assert (=> b!830277 (= e!462904 e!462906)))

(declare-fun c!89876 () Bool)

(assert (=> b!830277 (= c!89876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830278 () Bool)

(declare-fun e!462908 () ListLongMap!8973)

(declare-fun call!36247 () ListLongMap!8973)

(assert (=> b!830278 (= e!462908 call!36247)))

(declare-fun b!830279 () Bool)

(assert (=> b!830279 (= e!462903 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830279 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830280 () Bool)

(declare-fun lt!376671 () Unit!28383)

(declare-fun lt!376670 () Unit!28383)

(assert (=> b!830280 (= lt!376671 lt!376670)))

(declare-fun lt!376668 () (_ BitVec 64))

(declare-fun lt!376666 () ListLongMap!8973)

(declare-fun lt!376667 () (_ BitVec 64))

(declare-fun lt!376665 () V!25275)

(assert (=> b!830280 (not (contains!4187 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665)) lt!376668))))

(assert (=> b!830280 (= lt!376670 (addStillNotContains!198 lt!376666 lt!376667 lt!376665 lt!376668))))

(assert (=> b!830280 (= lt!376668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830280 (= lt!376665 (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830280 (= lt!376667 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!830280 (= lt!376666 call!36247)))

(assert (=> b!830280 (= e!462908 (+!2010 call!36247 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830281 () Bool)

(declare-fun res!565477 () Bool)

(assert (=> b!830281 (=> (not res!565477) (not e!462907))))

(assert (=> b!830281 (= res!565477 (not (contains!4187 lt!376669 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830282 () Bool)

(assert (=> b!830282 (= e!462905 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36244 () Bool)

(assert (=> bm!36244 (= call!36247 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830283 () Bool)

(assert (=> b!830283 (= e!462905 e!462908)))

(declare-fun c!89879 () Bool)

(assert (=> b!830283 (= c!89879 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!105209 c!89877) b!830282))

(assert (= (and d!105209 (not c!89877)) b!830283))

(assert (= (and b!830283 c!89879) b!830280))

(assert (= (and b!830283 (not c!89879)) b!830278))

(assert (= (or b!830280 b!830278) bm!36244))

(assert (= (and d!105209 res!565475) b!830281))

(assert (= (and b!830281 res!565477) b!830275))

(assert (= (and b!830275 res!565474) b!830279))

(assert (= (and b!830275 c!89878) b!830272))

(assert (= (and b!830275 (not c!89878)) b!830277))

(assert (= (and b!830272 res!565476) b!830276))

(assert (= (and b!830277 c!89876) b!830273))

(assert (= (and b!830277 (not c!89876)) b!830274))

(declare-fun b_lambda!11353 () Bool)

(assert (=> (not b_lambda!11353) (not b!830276)))

(assert (=> b!830276 t!22306))

(declare-fun b_and!22517 () Bool)

(assert (= b_and!22515 (and (=> t!22306 result!8007) b_and!22517)))

(declare-fun b_lambda!11355 () Bool)

(assert (=> (not b_lambda!11355) (not b!830280)))

(assert (=> b!830280 t!22306))

(declare-fun b_and!22519 () Bool)

(assert (= b_and!22517 (and (=> t!22306 result!8007) b_and!22519)))

(declare-fun m!772921 () Bool)

(assert (=> b!830274 m!772921))

(declare-fun m!772923 () Bool)

(assert (=> bm!36244 m!772923))

(assert (=> b!830273 m!772923))

(declare-fun m!772925 () Bool)

(assert (=> b!830279 m!772925))

(assert (=> b!830279 m!772925))

(declare-fun m!772927 () Bool)

(assert (=> b!830279 m!772927))

(declare-fun m!772929 () Bool)

(assert (=> d!105209 m!772929))

(assert (=> d!105209 m!772479))

(assert (=> b!830272 m!772925))

(assert (=> b!830272 m!772925))

(declare-fun m!772931 () Bool)

(assert (=> b!830272 m!772931))

(assert (=> b!830283 m!772925))

(assert (=> b!830283 m!772925))

(assert (=> b!830283 m!772927))

(assert (=> b!830276 m!772925))

(assert (=> b!830276 m!772615))

(assert (=> b!830276 m!772925))

(declare-fun m!772933 () Bool)

(assert (=> b!830276 m!772933))

(declare-fun m!772935 () Bool)

(assert (=> b!830276 m!772935))

(assert (=> b!830276 m!772615))

(declare-fun m!772937 () Bool)

(assert (=> b!830276 m!772937))

(assert (=> b!830276 m!772935))

(declare-fun m!772939 () Bool)

(assert (=> b!830281 m!772939))

(assert (=> b!830280 m!772925))

(declare-fun m!772941 () Bool)

(assert (=> b!830280 m!772941))

(assert (=> b!830280 m!772935))

(assert (=> b!830280 m!772615))

(assert (=> b!830280 m!772937))

(assert (=> b!830280 m!772935))

(declare-fun m!772943 () Bool)

(assert (=> b!830280 m!772943))

(assert (=> b!830280 m!772941))

(declare-fun m!772945 () Bool)

(assert (=> b!830280 m!772945))

(assert (=> b!830280 m!772615))

(declare-fun m!772947 () Bool)

(assert (=> b!830280 m!772947))

(assert (=> b!830112 d!105209))

(declare-fun d!105211 () Bool)

(declare-fun e!462910 () Bool)

(assert (=> d!105211 e!462910))

(declare-fun res!565478 () Bool)

(assert (=> d!105211 (=> res!565478 e!462910)))

(declare-fun lt!376675 () Bool)

(assert (=> d!105211 (= res!565478 (not lt!376675))))

(declare-fun lt!376674 () Bool)

(assert (=> d!105211 (= lt!376675 lt!376674)))

(declare-fun lt!376673 () Unit!28383)

(declare-fun e!462911 () Unit!28383)

(assert (=> d!105211 (= lt!376673 e!462911)))

(declare-fun c!89880 () Bool)

(assert (=> d!105211 (= c!89880 lt!376674)))

(assert (=> d!105211 (= lt!376674 (containsKey!399 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(assert (=> d!105211 (= (contains!4187 lt!376607 (_1!5091 lt!376416)) lt!376675)))

(declare-fun b!830284 () Bool)

(declare-fun lt!376672 () Unit!28383)

(assert (=> b!830284 (= e!462911 lt!376672)))

(assert (=> b!830284 (= lt!376672 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(assert (=> b!830284 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(declare-fun b!830285 () Bool)

(declare-fun Unit!28395 () Unit!28383)

(assert (=> b!830285 (= e!462911 Unit!28395)))

(declare-fun b!830286 () Bool)

(assert (=> b!830286 (= e!462910 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416))))))

(assert (= (and d!105211 c!89880) b!830284))

(assert (= (and d!105211 (not c!89880)) b!830285))

(assert (= (and d!105211 (not res!565478)) b!830286))

(declare-fun m!772949 () Bool)

(assert (=> d!105211 m!772949))

(declare-fun m!772951 () Bool)

(assert (=> b!830284 m!772951))

(assert (=> b!830284 m!772777))

(assert (=> b!830284 m!772777))

(declare-fun m!772953 () Bool)

(assert (=> b!830284 m!772953))

(assert (=> b!830286 m!772777))

(assert (=> b!830286 m!772777))

(assert (=> b!830286 m!772953))

(assert (=> d!105159 d!105211))

(declare-fun b!830287 () Bool)

(declare-fun e!462912 () Option!419)

(assert (=> b!830287 (= e!462912 (Some!418 (_2!5091 (h!17069 lt!376605))))))

(declare-fun b!830288 () Bool)

(declare-fun e!462913 () Option!419)

(assert (=> b!830288 (= e!462912 e!462913)))

(declare-fun c!89882 () Bool)

(assert (=> b!830288 (= c!89882 (and ((_ is Cons!15940) lt!376605) (not (= (_1!5091 (h!17069 lt!376605)) (_1!5091 lt!376416)))))))

(declare-fun b!830290 () Bool)

(assert (=> b!830290 (= e!462913 None!417)))

(declare-fun b!830289 () Bool)

(assert (=> b!830289 (= e!462913 (getValueByKey!413 (t!22300 lt!376605) (_1!5091 lt!376416)))))

(declare-fun d!105213 () Bool)

(declare-fun c!89881 () Bool)

(assert (=> d!105213 (= c!89881 (and ((_ is Cons!15940) lt!376605) (= (_1!5091 (h!17069 lt!376605)) (_1!5091 lt!376416))))))

(assert (=> d!105213 (= (getValueByKey!413 lt!376605 (_1!5091 lt!376416)) e!462912)))

(assert (= (and d!105213 c!89881) b!830287))

(assert (= (and d!105213 (not c!89881)) b!830288))

(assert (= (and b!830288 c!89882) b!830289))

(assert (= (and b!830288 (not c!89882)) b!830290))

(declare-fun m!772955 () Bool)

(assert (=> b!830289 m!772955))

(assert (=> d!105159 d!105213))

(declare-fun d!105215 () Bool)

(assert (=> d!105215 (= (getValueByKey!413 lt!376605 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(declare-fun lt!376676 () Unit!28383)

(assert (=> d!105215 (= lt!376676 (choose!1426 lt!376605 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun e!462914 () Bool)

(assert (=> d!105215 e!462914))

(declare-fun res!565479 () Bool)

(assert (=> d!105215 (=> (not res!565479) (not e!462914))))

(assert (=> d!105215 (= res!565479 (isStrictlySorted!437 lt!376605))))

(assert (=> d!105215 (= (lemmaContainsTupThenGetReturnValue!230 lt!376605 (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376676)))

(declare-fun b!830291 () Bool)

(declare-fun res!565480 () Bool)

(assert (=> b!830291 (=> (not res!565480) (not e!462914))))

(assert (=> b!830291 (= res!565480 (containsKey!399 lt!376605 (_1!5091 lt!376416)))))

(declare-fun b!830292 () Bool)

(assert (=> b!830292 (= e!462914 (contains!4188 lt!376605 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105215 res!565479) b!830291))

(assert (= (and b!830291 res!565480) b!830292))

(assert (=> d!105215 m!772771))

(declare-fun m!772957 () Bool)

(assert (=> d!105215 m!772957))

(declare-fun m!772959 () Bool)

(assert (=> d!105215 m!772959))

(declare-fun m!772961 () Bool)

(assert (=> b!830291 m!772961))

(declare-fun m!772963 () Bool)

(assert (=> b!830292 m!772963))

(assert (=> d!105159 d!105215))

(declare-fun b!830293 () Bool)

(declare-fun res!565481 () Bool)

(declare-fun e!462916 () Bool)

(assert (=> b!830293 (=> (not res!565481) (not e!462916))))

(declare-fun lt!376677 () List!15944)

(assert (=> b!830293 (= res!565481 (containsKey!399 lt!376677 (_1!5091 lt!376416)))))

(declare-fun c!89883 () Bool)

(declare-fun c!89885 () Bool)

(declare-fun e!462918 () List!15944)

(declare-fun b!830294 () Bool)

(assert (=> b!830294 (= e!462918 (ite c!89885 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!89883 (Cons!15940 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15941)))))

(declare-fun b!830295 () Bool)

(assert (=> b!830295 (= c!89883 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5091 lt!376416))))))

(declare-fun e!462915 () List!15944)

(declare-fun e!462917 () List!15944)

(assert (=> b!830295 (= e!462915 e!462917)))

(declare-fun b!830296 () Bool)

(assert (=> b!830296 (= e!462918 (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!830297 () Bool)

(declare-fun e!462919 () List!15944)

(declare-fun call!36248 () List!15944)

(assert (=> b!830297 (= e!462919 call!36248)))

(declare-fun b!830298 () Bool)

(declare-fun call!36250 () List!15944)

(assert (=> b!830298 (= e!462915 call!36250)))

(declare-fun b!830299 () Bool)

(declare-fun call!36249 () List!15944)

(assert (=> b!830299 (= e!462917 call!36249)))

(declare-fun bm!36245 () Bool)

(assert (=> bm!36245 (= call!36249 call!36250)))

(declare-fun b!830300 () Bool)

(assert (=> b!830300 (= e!462916 (contains!4188 lt!376677 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105217 () Bool)

(assert (=> d!105217 e!462916))

(declare-fun res!565482 () Bool)

(assert (=> d!105217 (=> (not res!565482) (not e!462916))))

(assert (=> d!105217 (= res!565482 (isStrictlySorted!437 lt!376677))))

(assert (=> d!105217 (= lt!376677 e!462919)))

(declare-fun c!89886 () Bool)

(assert (=> d!105217 (= c!89886 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5091 lt!376416))))))

(assert (=> d!105217 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105217 (= (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376677)))

(declare-fun bm!36246 () Bool)

(assert (=> bm!36246 (= call!36250 call!36248)))

(declare-fun bm!36247 () Bool)

(assert (=> bm!36247 (= call!36248 ($colon$colon!535 e!462918 (ite c!89886 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!89884 () Bool)

(assert (=> bm!36247 (= c!89884 c!89886)))

(declare-fun b!830301 () Bool)

(assert (=> b!830301 (= e!462919 e!462915)))

(assert (=> b!830301 (= c!89885 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5091 lt!376416))))))

(declare-fun b!830302 () Bool)

(assert (=> b!830302 (= e!462917 call!36249)))

(assert (= (and d!105217 c!89886) b!830297))

(assert (= (and d!105217 (not c!89886)) b!830301))

(assert (= (and b!830301 c!89885) b!830298))

(assert (= (and b!830301 (not c!89885)) b!830295))

(assert (= (and b!830295 c!89883) b!830302))

(assert (= (and b!830295 (not c!89883)) b!830299))

(assert (= (or b!830302 b!830299) bm!36245))

(assert (= (or b!830298 bm!36245) bm!36246))

(assert (= (or b!830297 bm!36246) bm!36247))

(assert (= (and bm!36247 c!89884) b!830296))

(assert (= (and bm!36247 (not c!89884)) b!830294))

(assert (= (and d!105217 res!565482) b!830293))

(assert (= (and b!830293 res!565481) b!830300))

(declare-fun m!772965 () Bool)

(assert (=> b!830293 m!772965))

(declare-fun m!772967 () Bool)

(assert (=> b!830300 m!772967))

(declare-fun m!772969 () Bool)

(assert (=> b!830296 m!772969))

(declare-fun m!772971 () Bool)

(assert (=> d!105217 m!772971))

(declare-fun m!772973 () Bool)

(assert (=> d!105217 m!772973))

(declare-fun m!772975 () Bool)

(assert (=> bm!36247 m!772975))

(assert (=> d!105159 d!105217))

(assert (=> b!830162 d!105189))

(assert (=> b!830134 d!105189))

(declare-fun d!105219 () Bool)

(assert (=> d!105219 (= (apply!372 lt!376517 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23156 () Bool)

(assert (= bs!23156 d!105219))

(declare-fun m!772977 () Bool)

(assert (=> bs!23156 m!772977))

(assert (=> bs!23156 m!772977))

(declare-fun m!772979 () Bool)

(assert (=> bs!23156 m!772979))

(assert (=> b!830049 d!105219))

(declare-fun d!105221 () Bool)

(declare-fun lt!376680 () Bool)

(declare-fun content!385 (List!15944) (InoxSet tuple2!10160))

(assert (=> d!105221 (= lt!376680 (select (content!385 (toList!4502 lt!376538)) lt!376417))))

(declare-fun e!462924 () Bool)

(assert (=> d!105221 (= lt!376680 e!462924)))

(declare-fun res!565487 () Bool)

(assert (=> d!105221 (=> (not res!565487) (not e!462924))))

(assert (=> d!105221 (= res!565487 ((_ is Cons!15940) (toList!4502 lt!376538)))))

(assert (=> d!105221 (= (contains!4188 (toList!4502 lt!376538) lt!376417) lt!376680)))

(declare-fun b!830307 () Bool)

(declare-fun e!462925 () Bool)

(assert (=> b!830307 (= e!462924 e!462925)))

(declare-fun res!565488 () Bool)

(assert (=> b!830307 (=> res!565488 e!462925)))

(assert (=> b!830307 (= res!565488 (= (h!17069 (toList!4502 lt!376538)) lt!376417))))

(declare-fun b!830308 () Bool)

(assert (=> b!830308 (= e!462925 (contains!4188 (t!22300 (toList!4502 lt!376538)) lt!376417))))

(assert (= (and d!105221 res!565487) b!830307))

(assert (= (and b!830307 (not res!565488)) b!830308))

(declare-fun m!772981 () Bool)

(assert (=> d!105221 m!772981))

(declare-fun m!772983 () Bool)

(assert (=> d!105221 m!772983))

(declare-fun m!772985 () Bool)

(assert (=> b!830308 m!772985))

(assert (=> b!830059 d!105221))

(declare-fun d!105223 () Bool)

(declare-fun e!462926 () Bool)

(assert (=> d!105223 e!462926))

(declare-fun res!565490 () Bool)

(assert (=> d!105223 (=> (not res!565490) (not e!462926))))

(declare-fun lt!376683 () ListLongMap!8973)

(assert (=> d!105223 (= res!565490 (contains!4187 lt!376683 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!376681 () List!15944)

(assert (=> d!105223 (= lt!376683 (ListLongMap!8974 lt!376681))))

(declare-fun lt!376682 () Unit!28383)

(declare-fun lt!376684 () Unit!28383)

(assert (=> d!105223 (= lt!376682 lt!376684)))

(assert (=> d!105223 (= (getValueByKey!413 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105223 (= lt!376684 (lemmaContainsTupThenGetReturnValue!230 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105223 (= lt!376681 (insertStrictlySorted!269 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105223 (= (+!2010 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!376683)))

(declare-fun b!830309 () Bool)

(declare-fun res!565489 () Bool)

(assert (=> b!830309 (=> (not res!565489) (not e!462926))))

(assert (=> b!830309 (= res!565489 (= (getValueByKey!413 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!830310 () Bool)

(assert (=> b!830310 (= e!462926 (contains!4188 (toList!4502 lt!376683) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105223 res!565490) b!830309))

(assert (= (and b!830309 res!565489) b!830310))

(declare-fun m!772987 () Bool)

(assert (=> d!105223 m!772987))

(declare-fun m!772989 () Bool)

(assert (=> d!105223 m!772989))

(declare-fun m!772991 () Bool)

(assert (=> d!105223 m!772991))

(declare-fun m!772993 () Bool)

(assert (=> d!105223 m!772993))

(declare-fun m!772995 () Bool)

(assert (=> b!830309 m!772995))

(declare-fun m!772997 () Bool)

(assert (=> b!830310 m!772997))

(assert (=> bm!36209 d!105223))

(declare-fun d!105225 () Bool)

(declare-fun lt!376685 () Bool)

(assert (=> d!105225 (= lt!376685 (select (content!385 (toList!4502 lt!376546)) lt!376416))))

(declare-fun e!462927 () Bool)

(assert (=> d!105225 (= lt!376685 e!462927)))

(declare-fun res!565491 () Bool)

(assert (=> d!105225 (=> (not res!565491) (not e!462927))))

(assert (=> d!105225 (= res!565491 ((_ is Cons!15940) (toList!4502 lt!376546)))))

(assert (=> d!105225 (= (contains!4188 (toList!4502 lt!376546) lt!376416) lt!376685)))

(declare-fun b!830311 () Bool)

(declare-fun e!462928 () Bool)

(assert (=> b!830311 (= e!462927 e!462928)))

(declare-fun res!565492 () Bool)

(assert (=> b!830311 (=> res!565492 e!462928)))

(assert (=> b!830311 (= res!565492 (= (h!17069 (toList!4502 lt!376546)) lt!376416))))

(declare-fun b!830312 () Bool)

(assert (=> b!830312 (= e!462928 (contains!4188 (t!22300 (toList!4502 lt!376546)) lt!376416))))

(assert (= (and d!105225 res!565491) b!830311))

(assert (= (and b!830311 (not res!565492)) b!830312))

(declare-fun m!772999 () Bool)

(assert (=> d!105225 m!772999))

(declare-fun m!773001 () Bool)

(assert (=> d!105225 m!773001))

(declare-fun m!773003 () Bool)

(assert (=> b!830312 m!773003))

(assert (=> b!830063 d!105225))

(declare-fun d!105227 () Bool)

(assert (=> d!105227 (= (apply!372 lt!376563 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23157 () Bool)

(assert (= bs!23157 d!105227))

(assert (=> bs!23157 m!772595))

(declare-fun m!773005 () Bool)

(assert (=> bs!23157 m!773005))

(assert (=> bs!23157 m!773005))

(declare-fun m!773007 () Bool)

(assert (=> bs!23157 m!773007))

(assert (=> b!830073 d!105227))

(assert (=> b!830073 d!105199))

(declare-fun d!105229 () Bool)

(declare-fun e!462929 () Bool)

(assert (=> d!105229 e!462929))

(declare-fun res!565493 () Bool)

(assert (=> d!105229 (=> res!565493 e!462929)))

(declare-fun lt!376689 () Bool)

(assert (=> d!105229 (= res!565493 (not lt!376689))))

(declare-fun lt!376688 () Bool)

(assert (=> d!105229 (= lt!376689 lt!376688)))

(declare-fun lt!376687 () Unit!28383)

(declare-fun e!462930 () Unit!28383)

(assert (=> d!105229 (= lt!376687 e!462930)))

(declare-fun c!89887 () Bool)

(assert (=> d!105229 (= c!89887 lt!376688)))

(assert (=> d!105229 (= lt!376688 (containsKey!399 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105229 (= (contains!4187 lt!376563 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376689)))

(declare-fun b!830313 () Bool)

(declare-fun lt!376686 () Unit!28383)

(assert (=> b!830313 (= e!462930 lt!376686)))

(assert (=> b!830313 (= lt!376686 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830313 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830314 () Bool)

(declare-fun Unit!28396 () Unit!28383)

(assert (=> b!830314 (= e!462930 Unit!28396)))

(declare-fun b!830315 () Bool)

(assert (=> b!830315 (= e!462929 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105229 c!89887) b!830313))

(assert (= (and d!105229 (not c!89887)) b!830314))

(assert (= (and d!105229 (not res!565493)) b!830315))

(declare-fun m!773009 () Bool)

(assert (=> d!105229 m!773009))

(declare-fun m!773011 () Bool)

(assert (=> b!830313 m!773011))

(declare-fun m!773013 () Bool)

(assert (=> b!830313 m!773013))

(assert (=> b!830313 m!773013))

(declare-fun m!773015 () Bool)

(assert (=> b!830313 m!773015))

(assert (=> b!830315 m!773013))

(assert (=> b!830315 m!773013))

(assert (=> b!830315 m!773015))

(assert (=> bm!36219 d!105229))

(declare-fun d!105231 () Bool)

(declare-fun lt!376690 () Bool)

(assert (=> d!105231 (= lt!376690 (select (content!385 (toList!4502 lt!376542)) lt!376417))))

(declare-fun e!462931 () Bool)

(assert (=> d!105231 (= lt!376690 e!462931)))

(declare-fun res!565494 () Bool)

(assert (=> d!105231 (=> (not res!565494) (not e!462931))))

(assert (=> d!105231 (= res!565494 ((_ is Cons!15940) (toList!4502 lt!376542)))))

(assert (=> d!105231 (= (contains!4188 (toList!4502 lt!376542) lt!376417) lt!376690)))

(declare-fun b!830316 () Bool)

(declare-fun e!462932 () Bool)

(assert (=> b!830316 (= e!462931 e!462932)))

(declare-fun res!565495 () Bool)

(assert (=> b!830316 (=> res!565495 e!462932)))

(assert (=> b!830316 (= res!565495 (= (h!17069 (toList!4502 lt!376542)) lt!376417))))

(declare-fun b!830317 () Bool)

(assert (=> b!830317 (= e!462932 (contains!4188 (t!22300 (toList!4502 lt!376542)) lt!376417))))

(assert (= (and d!105231 res!565494) b!830316))

(assert (= (and b!830316 (not res!565495)) b!830317))

(declare-fun m!773017 () Bool)

(assert (=> d!105231 m!773017))

(declare-fun m!773019 () Bool)

(assert (=> d!105231 m!773019))

(declare-fun m!773021 () Bool)

(assert (=> b!830317 m!773021))

(assert (=> b!830061 d!105231))

(declare-fun d!105233 () Bool)

(assert (=> d!105233 (arrayContainsKey!0 _keys!976 lt!376619 #b00000000000000000000000000000000)))

(declare-fun lt!376693 () Unit!28383)

(declare-fun choose!13 (array!46555 (_ BitVec 64) (_ BitVec 32)) Unit!28383)

(assert (=> d!105233 (= lt!376693 (choose!13 _keys!976 lt!376619 #b00000000000000000000000000000000))))

(assert (=> d!105233 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!105233 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376619 #b00000000000000000000000000000000) lt!376693)))

(declare-fun bs!23158 () Bool)

(assert (= bs!23158 d!105233))

(assert (=> bs!23158 m!772799))

(declare-fun m!773023 () Bool)

(assert (=> bs!23158 m!773023))

(assert (=> b!830164 d!105233))

(declare-fun d!105235 () Bool)

(declare-fun res!565500 () Bool)

(declare-fun e!462937 () Bool)

(assert (=> d!105235 (=> res!565500 e!462937)))

(assert (=> d!105235 (= res!565500 (= (select (arr!22314 _keys!976) #b00000000000000000000000000000000) lt!376619))))

(assert (=> d!105235 (= (arrayContainsKey!0 _keys!976 lt!376619 #b00000000000000000000000000000000) e!462937)))

(declare-fun b!830322 () Bool)

(declare-fun e!462938 () Bool)

(assert (=> b!830322 (= e!462937 e!462938)))

(declare-fun res!565501 () Bool)

(assert (=> b!830322 (=> (not res!565501) (not e!462938))))

(assert (=> b!830322 (= res!565501 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830323 () Bool)

(assert (=> b!830323 (= e!462938 (arrayContainsKey!0 _keys!976 lt!376619 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!105235 (not res!565500)) b!830322))

(assert (= (and b!830322 res!565501) b!830323))

(assert (=> d!105235 m!772595))

(declare-fun m!773025 () Bool)

(assert (=> b!830323 m!773025))

(assert (=> b!830164 d!105235))

(declare-fun b!830336 () Bool)

(declare-fun e!462945 () SeekEntryResult!8740)

(assert (=> b!830336 (= e!462945 Undefined!8740)))

(declare-fun b!830337 () Bool)

(declare-fun c!89895 () Bool)

(declare-fun lt!376700 () (_ BitVec 64))

(assert (=> b!830337 (= c!89895 (= lt!376700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!462947 () SeekEntryResult!8740)

(declare-fun e!462946 () SeekEntryResult!8740)

(assert (=> b!830337 (= e!462947 e!462946)))

(declare-fun b!830339 () Bool)

(assert (=> b!830339 (= e!462945 e!462947)))

(declare-fun lt!376701 () SeekEntryResult!8740)

(assert (=> b!830339 (= lt!376700 (select (arr!22314 _keys!976) (index!37333 lt!376701)))))

(declare-fun c!89894 () Bool)

(assert (=> b!830339 (= c!89894 (= lt!376700 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830340 () Bool)

(assert (=> b!830340 (= e!462946 (MissingZero!8740 (index!37333 lt!376701)))))

(declare-fun b!830341 () Bool)

(assert (=> b!830341 (= e!462947 (Found!8740 (index!37333 lt!376701)))))

(declare-fun b!830338 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46555 (_ BitVec 32)) SeekEntryResult!8740)

(assert (=> b!830338 (= e!462946 (seekKeyOrZeroReturnVacant!0 (x!70100 lt!376701) (index!37333 lt!376701) (index!37333 lt!376701) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun d!105237 () Bool)

(declare-fun lt!376702 () SeekEntryResult!8740)

(assert (=> d!105237 (and (or ((_ is Undefined!8740) lt!376702) (not ((_ is Found!8740) lt!376702)) (and (bvsge (index!37332 lt!376702) #b00000000000000000000000000000000) (bvslt (index!37332 lt!376702) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376702) ((_ is Found!8740) lt!376702) (not ((_ is MissingZero!8740) lt!376702)) (and (bvsge (index!37331 lt!376702) #b00000000000000000000000000000000) (bvslt (index!37331 lt!376702) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376702) ((_ is Found!8740) lt!376702) ((_ is MissingZero!8740) lt!376702) (not ((_ is MissingVacant!8740) lt!376702)) (and (bvsge (index!37334 lt!376702) #b00000000000000000000000000000000) (bvslt (index!37334 lt!376702) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376702) (ite ((_ is Found!8740) lt!376702) (= (select (arr!22314 _keys!976) (index!37332 lt!376702)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8740) lt!376702) (= (select (arr!22314 _keys!976) (index!37331 lt!376702)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8740) lt!376702) (= (select (arr!22314 _keys!976) (index!37334 lt!376702)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105237 (= lt!376702 e!462945)))

(declare-fun c!89896 () Bool)

(assert (=> d!105237 (= c!89896 (and ((_ is Intermediate!8740) lt!376701) (undefined!9552 lt!376701)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46555 (_ BitVec 32)) SeekEntryResult!8740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!105237 (= lt!376701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!105237 (validMask!0 mask!1312)))

(assert (=> d!105237 (= (seekEntryOrOpen!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!376702)))

(assert (= (and d!105237 c!89896) b!830336))

(assert (= (and d!105237 (not c!89896)) b!830339))

(assert (= (and b!830339 c!89894) b!830341))

(assert (= (and b!830339 (not c!89894)) b!830337))

(assert (= (and b!830337 c!89895) b!830340))

(assert (= (and b!830337 (not c!89895)) b!830338))

(declare-fun m!773027 () Bool)

(assert (=> b!830339 m!773027))

(assert (=> b!830338 m!772595))

(declare-fun m!773029 () Bool)

(assert (=> b!830338 m!773029))

(declare-fun m!773031 () Bool)

(assert (=> d!105237 m!773031))

(declare-fun m!773033 () Bool)

(assert (=> d!105237 m!773033))

(declare-fun m!773035 () Bool)

(assert (=> d!105237 m!773035))

(declare-fun m!773037 () Bool)

(assert (=> d!105237 m!773037))

(assert (=> d!105237 m!772595))

(declare-fun m!773039 () Bool)

(assert (=> d!105237 m!773039))

(assert (=> d!105237 m!772595))

(assert (=> d!105237 m!773037))

(assert (=> d!105237 m!772479))

(assert (=> b!830164 d!105237))

(declare-fun d!105239 () Bool)

(assert (=> d!105239 (not (contains!4187 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)) lt!376601))))

(declare-fun lt!376705 () Unit!28383)

(declare-fun choose!1427 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> d!105239 (= lt!376705 (choose!1427 lt!376599 lt!376600 lt!376598 lt!376601))))

(declare-fun e!462950 () Bool)

(assert (=> d!105239 e!462950))

(declare-fun res!565504 () Bool)

(assert (=> d!105239 (=> (not res!565504) (not e!462950))))

(assert (=> d!105239 (= res!565504 (not (contains!4187 lt!376599 lt!376601)))))

(assert (=> d!105239 (= (addStillNotContains!198 lt!376599 lt!376600 lt!376598 lt!376601) lt!376705)))

(declare-fun b!830345 () Bool)

(assert (=> b!830345 (= e!462950 (not (= lt!376600 lt!376601)))))

(assert (= (and d!105239 res!565504) b!830345))

(assert (=> d!105239 m!772761))

(assert (=> d!105239 m!772761))

(assert (=> d!105239 m!772765))

(declare-fun m!773041 () Bool)

(assert (=> d!105239 m!773041))

(declare-fun m!773043 () Bool)

(assert (=> d!105239 m!773043))

(assert (=> b!830131 d!105239))

(assert (=> b!830131 d!105199))

(declare-fun d!105241 () Bool)

(declare-fun e!462951 () Bool)

(assert (=> d!105241 e!462951))

(declare-fun res!565506 () Bool)

(assert (=> d!105241 (=> (not res!565506) (not e!462951))))

(declare-fun lt!376708 () ListLongMap!8973)

(assert (=> d!105241 (= res!565506 (contains!4187 lt!376708 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376706 () List!15944)

(assert (=> d!105241 (= lt!376708 (ListLongMap!8974 lt!376706))))

(declare-fun lt!376707 () Unit!28383)

(declare-fun lt!376709 () Unit!28383)

(assert (=> d!105241 (= lt!376707 lt!376709)))

(assert (=> d!105241 (= (getValueByKey!413 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105241 (= lt!376709 (lemmaContainsTupThenGetReturnValue!230 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105241 (= lt!376706 (insertStrictlySorted!269 (toList!4502 call!36228) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105241 (= (+!2010 call!36228 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376708)))

(declare-fun b!830346 () Bool)

(declare-fun res!565505 () Bool)

(assert (=> b!830346 (=> (not res!565505) (not e!462951))))

(assert (=> b!830346 (= res!565505 (= (getValueByKey!413 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830347 () Bool)

(assert (=> b!830347 (= e!462951 (contains!4188 (toList!4502 lt!376708) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105241 res!565506) b!830346))

(assert (= (and b!830346 res!565505) b!830347))

(declare-fun m!773045 () Bool)

(assert (=> d!105241 m!773045))

(declare-fun m!773047 () Bool)

(assert (=> d!105241 m!773047))

(declare-fun m!773049 () Bool)

(assert (=> d!105241 m!773049))

(declare-fun m!773051 () Bool)

(assert (=> d!105241 m!773051))

(declare-fun m!773053 () Bool)

(assert (=> b!830346 m!773053))

(declare-fun m!773055 () Bool)

(assert (=> b!830347 m!773055))

(assert (=> b!830131 d!105241))

(declare-fun d!105243 () Bool)

(declare-fun e!462952 () Bool)

(assert (=> d!105243 e!462952))

(declare-fun res!565508 () Bool)

(assert (=> d!105243 (=> (not res!565508) (not e!462952))))

(declare-fun lt!376712 () ListLongMap!8973)

(assert (=> d!105243 (= res!565508 (contains!4187 lt!376712 (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun lt!376710 () List!15944)

(assert (=> d!105243 (= lt!376712 (ListLongMap!8974 lt!376710))))

(declare-fun lt!376711 () Unit!28383)

(declare-fun lt!376713 () Unit!28383)

(assert (=> d!105243 (= lt!376711 lt!376713)))

(assert (=> d!105243 (= (getValueByKey!413 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598))) (Some!418 (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(assert (=> d!105243 (= lt!376713 (lemmaContainsTupThenGetReturnValue!230 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(assert (=> d!105243 (= lt!376710 (insertStrictlySorted!269 (toList!4502 lt!376599) (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(assert (=> d!105243 (= (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)) lt!376712)))

(declare-fun b!830348 () Bool)

(declare-fun res!565507 () Bool)

(assert (=> b!830348 (=> (not res!565507) (not e!462952))))

(assert (=> b!830348 (= res!565507 (= (getValueByKey!413 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598))) (Some!418 (_2!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(declare-fun b!830349 () Bool)

(assert (=> b!830349 (= e!462952 (contains!4188 (toList!4502 lt!376712) (tuple2!10161 lt!376600 lt!376598)))))

(assert (= (and d!105243 res!565508) b!830348))

(assert (= (and b!830348 res!565507) b!830349))

(declare-fun m!773057 () Bool)

(assert (=> d!105243 m!773057))

(declare-fun m!773059 () Bool)

(assert (=> d!105243 m!773059))

(declare-fun m!773061 () Bool)

(assert (=> d!105243 m!773061))

(declare-fun m!773063 () Bool)

(assert (=> d!105243 m!773063))

(declare-fun m!773065 () Bool)

(assert (=> b!830348 m!773065))

(declare-fun m!773067 () Bool)

(assert (=> b!830349 m!773067))

(assert (=> b!830131 d!105243))

(declare-fun d!105245 () Bool)

(declare-fun e!462953 () Bool)

(assert (=> d!105245 e!462953))

(declare-fun res!565509 () Bool)

(assert (=> d!105245 (=> res!565509 e!462953)))

(declare-fun lt!376717 () Bool)

(assert (=> d!105245 (= res!565509 (not lt!376717))))

(declare-fun lt!376716 () Bool)

(assert (=> d!105245 (= lt!376717 lt!376716)))

(declare-fun lt!376715 () Unit!28383)

(declare-fun e!462954 () Unit!28383)

(assert (=> d!105245 (= lt!376715 e!462954)))

(declare-fun c!89897 () Bool)

(assert (=> d!105245 (= c!89897 lt!376716)))

(assert (=> d!105245 (= lt!376716 (containsKey!399 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(assert (=> d!105245 (= (contains!4187 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)) lt!376601) lt!376717)))

(declare-fun b!830350 () Bool)

(declare-fun lt!376714 () Unit!28383)

(assert (=> b!830350 (= e!462954 lt!376714)))

(assert (=> b!830350 (= lt!376714 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(assert (=> b!830350 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(declare-fun b!830351 () Bool)

(declare-fun Unit!28397 () Unit!28383)

(assert (=> b!830351 (= e!462954 Unit!28397)))

(declare-fun b!830352 () Bool)

(assert (=> b!830352 (= e!462953 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601)))))

(assert (= (and d!105245 c!89897) b!830350))

(assert (= (and d!105245 (not c!89897)) b!830351))

(assert (= (and d!105245 (not res!565509)) b!830352))

(declare-fun m!773069 () Bool)

(assert (=> d!105245 m!773069))

(declare-fun m!773071 () Bool)

(assert (=> b!830350 m!773071))

(declare-fun m!773073 () Bool)

(assert (=> b!830350 m!773073))

(assert (=> b!830350 m!773073))

(declare-fun m!773075 () Bool)

(assert (=> b!830350 m!773075))

(assert (=> b!830352 m!773073))

(assert (=> b!830352 m!773073))

(assert (=> b!830352 m!773075))

(assert (=> b!830131 d!105245))

(declare-fun d!105247 () Bool)

(assert (=> d!105247 (= (apply!372 lt!376563 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23159 () Bool)

(assert (= bs!23159 d!105247))

(assert (=> bs!23159 m!772869))

(assert (=> bs!23159 m!772869))

(declare-fun m!773077 () Bool)

(assert (=> bs!23159 m!773077))

(assert (=> b!830084 d!105247))

(declare-fun d!105249 () Bool)

(declare-fun e!462955 () Bool)

(assert (=> d!105249 e!462955))

(declare-fun res!565511 () Bool)

(assert (=> d!105249 (=> (not res!565511) (not e!462955))))

(declare-fun lt!376720 () ListLongMap!8973)

(assert (=> d!105249 (= res!565511 (contains!4187 lt!376720 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!376718 () List!15944)

(assert (=> d!105249 (= lt!376720 (ListLongMap!8974 lt!376718))))

(declare-fun lt!376719 () Unit!28383)

(declare-fun lt!376721 () Unit!28383)

(assert (=> d!105249 (= lt!376719 lt!376721)))

(assert (=> d!105249 (= (getValueByKey!413 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105249 (= lt!376721 (lemmaContainsTupThenGetReturnValue!230 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105249 (= lt!376718 (insertStrictlySorted!269 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105249 (= (+!2010 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!376720)))

(declare-fun b!830353 () Bool)

(declare-fun res!565510 () Bool)

(assert (=> b!830353 (=> (not res!565510) (not e!462955))))

(assert (=> b!830353 (= res!565510 (= (getValueByKey!413 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!830354 () Bool)

(assert (=> b!830354 (= e!462955 (contains!4188 (toList!4502 lt!376720) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105249 res!565511) b!830353))

(assert (= (and b!830353 res!565510) b!830354))

(declare-fun m!773079 () Bool)

(assert (=> d!105249 m!773079))

(declare-fun m!773081 () Bool)

(assert (=> d!105249 m!773081))

(declare-fun m!773083 () Bool)

(assert (=> d!105249 m!773083))

(declare-fun m!773085 () Bool)

(assert (=> d!105249 m!773085))

(declare-fun m!773087 () Bool)

(assert (=> b!830353 m!773087))

(declare-fun m!773089 () Bool)

(assert (=> b!830354 m!773089))

(assert (=> bm!36216 d!105249))

(assert (=> bm!36214 d!105155))

(declare-fun d!105251 () Bool)

(declare-fun e!462956 () Bool)

(assert (=> d!105251 e!462956))

(declare-fun res!565512 () Bool)

(assert (=> d!105251 (=> res!565512 e!462956)))

(declare-fun lt!376725 () Bool)

(assert (=> d!105251 (= res!565512 (not lt!376725))))

(declare-fun lt!376724 () Bool)

(assert (=> d!105251 (= lt!376725 lt!376724)))

(declare-fun lt!376723 () Unit!28383)

(declare-fun e!462957 () Unit!28383)

(assert (=> d!105251 (= lt!376723 e!462957)))

(declare-fun c!89898 () Bool)

(assert (=> d!105251 (= c!89898 lt!376724)))

(assert (=> d!105251 (= lt!376724 (containsKey!399 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105251 (= (contains!4187 lt!376517 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376725)))

(declare-fun b!830355 () Bool)

(declare-fun lt!376722 () Unit!28383)

(assert (=> b!830355 (= e!462957 lt!376722)))

(assert (=> b!830355 (= lt!376722 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830355 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830356 () Bool)

(declare-fun Unit!28398 () Unit!28383)

(assert (=> b!830356 (= e!462957 Unit!28398)))

(declare-fun b!830357 () Bool)

(assert (=> b!830357 (= e!462956 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105251 c!89898) b!830355))

(assert (= (and d!105251 (not c!89898)) b!830356))

(assert (= (and d!105251 (not res!565512)) b!830357))

(declare-fun m!773091 () Bool)

(assert (=> d!105251 m!773091))

(declare-fun m!773093 () Bool)

(assert (=> b!830355 m!773093))

(assert (=> b!830355 m!772977))

(assert (=> b!830355 m!772977))

(declare-fun m!773095 () Bool)

(assert (=> b!830355 m!773095))

(assert (=> b!830357 m!772977))

(assert (=> b!830357 m!772977))

(assert (=> b!830357 m!773095))

(assert (=> bm!36213 d!105251))

(declare-fun d!105253 () Bool)

(declare-fun e!462958 () Bool)

(assert (=> d!105253 e!462958))

(declare-fun res!565513 () Bool)

(assert (=> d!105253 (=> res!565513 e!462958)))

(declare-fun lt!376729 () Bool)

(assert (=> d!105253 (= res!565513 (not lt!376729))))

(declare-fun lt!376728 () Bool)

(assert (=> d!105253 (= lt!376729 lt!376728)))

(declare-fun lt!376727 () Unit!28383)

(declare-fun e!462959 () Unit!28383)

(assert (=> d!105253 (= lt!376727 e!462959)))

(declare-fun c!89899 () Bool)

(assert (=> d!105253 (= c!89899 lt!376728)))

(assert (=> d!105253 (= lt!376728 (containsKey!399 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105253 (= (contains!4187 lt!376595 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376729)))

(declare-fun b!830358 () Bool)

(declare-fun lt!376726 () Unit!28383)

(assert (=> b!830358 (= e!462959 lt!376726)))

(assert (=> b!830358 (= lt!376726 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830358 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830359 () Bool)

(declare-fun Unit!28399 () Unit!28383)

(assert (=> b!830359 (= e!462959 Unit!28399)))

(declare-fun b!830360 () Bool)

(assert (=> b!830360 (= e!462958 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105253 c!89899) b!830358))

(assert (= (and d!105253 (not c!89899)) b!830359))

(assert (= (and d!105253 (not res!565513)) b!830360))

(declare-fun m!773097 () Bool)

(assert (=> d!105253 m!773097))

(declare-fun m!773099 () Bool)

(assert (=> b!830358 m!773099))

(declare-fun m!773101 () Bool)

(assert (=> b!830358 m!773101))

(assert (=> b!830358 m!773101))

(declare-fun m!773103 () Bool)

(assert (=> b!830358 m!773103))

(assert (=> b!830360 m!773101))

(assert (=> b!830360 m!773101))

(assert (=> b!830360 m!773103))

(assert (=> b!830120 d!105253))

(declare-fun b!830361 () Bool)

(declare-fun e!462960 () Option!419)

(assert (=> b!830361 (= e!462960 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376607)))))))

(declare-fun b!830362 () Bool)

(declare-fun e!462961 () Option!419)

(assert (=> b!830362 (= e!462960 e!462961)))

(declare-fun c!89901 () Bool)

(assert (=> b!830362 (= c!89901 (and ((_ is Cons!15940) (toList!4502 lt!376607)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376607))) (_1!5091 lt!376416)))))))

(declare-fun b!830364 () Bool)

(assert (=> b!830364 (= e!462961 None!417)))

(declare-fun b!830363 () Bool)

(assert (=> b!830363 (= e!462961 (getValueByKey!413 (t!22300 (toList!4502 lt!376607)) (_1!5091 lt!376416)))))

(declare-fun d!105255 () Bool)

(declare-fun c!89900 () Bool)

(assert (=> d!105255 (= c!89900 (and ((_ is Cons!15940) (toList!4502 lt!376607)) (= (_1!5091 (h!17069 (toList!4502 lt!376607))) (_1!5091 lt!376416))))))

(assert (=> d!105255 (= (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416)) e!462960)))

(assert (= (and d!105255 c!89900) b!830361))

(assert (= (and d!105255 (not c!89900)) b!830362))

(assert (= (and b!830362 c!89901) b!830363))

(assert (= (and b!830362 (not c!89901)) b!830364))

(declare-fun m!773105 () Bool)

(assert (=> b!830363 m!773105))

(assert (=> b!830135 d!105255))

(declare-fun b!830365 () Bool)

(declare-fun e!462962 () Option!419)

(assert (=> b!830365 (= e!462962 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376611)))))))

(declare-fun b!830366 () Bool)

(declare-fun e!462963 () Option!419)

(assert (=> b!830366 (= e!462962 e!462963)))

(declare-fun c!89903 () Bool)

(assert (=> b!830366 (= c!89903 (and ((_ is Cons!15940) (toList!4502 lt!376611)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830368 () Bool)

(assert (=> b!830368 (= e!462963 None!417)))

(declare-fun b!830367 () Bool)

(assert (=> b!830367 (= e!462963 (getValueByKey!413 (t!22300 (toList!4502 lt!376611)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105257 () Bool)

(declare-fun c!89902 () Bool)

(assert (=> d!105257 (= c!89902 (and ((_ is Cons!15940) (toList!4502 lt!376611)) (= (_1!5091 (h!17069 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105257 (= (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!462962)))

(assert (= (and d!105257 c!89902) b!830365))

(assert (= (and d!105257 (not c!89902)) b!830366))

(assert (= (and b!830366 c!89903) b!830367))

(assert (= (and b!830366 (not c!89903)) b!830368))

(declare-fun m!773107 () Bool)

(assert (=> b!830367 m!773107))

(assert (=> b!830137 d!105257))

(assert (=> bm!36224 d!105209))

(declare-fun b!830369 () Bool)

(declare-fun e!462965 () Bool)

(declare-fun call!36251 () Bool)

(assert (=> b!830369 (= e!462965 call!36251)))

(declare-fun b!830370 () Bool)

(assert (=> b!830370 (= e!462965 call!36251)))

(declare-fun d!105259 () Bool)

(declare-fun res!565516 () Bool)

(declare-fun e!462964 () Bool)

(assert (=> d!105259 (=> res!565516 e!462964)))

(assert (=> d!105259 (= res!565516 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105259 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) e!462964)))

(declare-fun b!830371 () Bool)

(declare-fun e!462966 () Bool)

(assert (=> b!830371 (= e!462964 e!462966)))

(declare-fun res!565514 () Bool)

(assert (=> b!830371 (=> (not res!565514) (not e!462966))))

(declare-fun e!462967 () Bool)

(assert (=> b!830371 (= res!565514 (not e!462967))))

(declare-fun res!565515 () Bool)

(assert (=> b!830371 (=> (not res!565515) (not e!462967))))

(assert (=> b!830371 (= res!565515 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830372 () Bool)

(assert (=> b!830372 (= e!462966 e!462965)))

(declare-fun c!89904 () Bool)

(assert (=> b!830372 (= c!89904 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!36248 () Bool)

(assert (=> bm!36248 (= call!36251 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!89904 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942))))))

(declare-fun b!830373 () Bool)

(assert (=> b!830373 (= e!462967 (contains!4189 (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!105259 (not res!565516)) b!830371))

(assert (= (and b!830371 res!565515) b!830373))

(assert (= (and b!830371 res!565514) b!830372))

(assert (= (and b!830372 c!89904) b!830370))

(assert (= (and b!830372 (not c!89904)) b!830369))

(assert (= (or b!830370 b!830369) bm!36248))

(assert (=> b!830371 m!772925))

(assert (=> b!830371 m!772925))

(assert (=> b!830371 m!772927))

(assert (=> b!830372 m!772925))

(assert (=> b!830372 m!772925))

(assert (=> b!830372 m!772927))

(assert (=> bm!36248 m!772925))

(declare-fun m!773109 () Bool)

(assert (=> bm!36248 m!773109))

(assert (=> b!830373 m!772925))

(assert (=> b!830373 m!772925))

(declare-fun m!773111 () Bool)

(assert (=> b!830373 m!773111))

(assert (=> bm!36228 d!105259))

(assert (=> b!830080 d!105189))

(declare-fun d!105261 () Bool)

(declare-fun e!462968 () Bool)

(assert (=> d!105261 e!462968))

(declare-fun res!565518 () Bool)

(assert (=> d!105261 (=> (not res!565518) (not e!462968))))

(declare-fun lt!376732 () ListLongMap!8973)

(assert (=> d!105261 (= res!565518 (contains!4187 lt!376732 (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun lt!376730 () List!15944)

(assert (=> d!105261 (= lt!376732 (ListLongMap!8974 lt!376730))))

(declare-fun lt!376731 () Unit!28383)

(declare-fun lt!376733 () Unit!28383)

(assert (=> d!105261 (= lt!376731 lt!376733)))

(assert (=> d!105261 (= (getValueByKey!413 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(assert (=> d!105261 (= lt!376733 (lemmaContainsTupThenGetReturnValue!230 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(assert (=> d!105261 (= lt!376730 (insertStrictlySorted!269 (toList!4502 lt!376514) (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(assert (=> d!105261 (= (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)) lt!376732)))

(declare-fun b!830374 () Bool)

(declare-fun res!565517 () Bool)

(assert (=> b!830374 (=> (not res!565517) (not e!462968))))

(assert (=> b!830374 (= res!565517 (= (getValueByKey!413 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(declare-fun b!830375 () Bool)

(assert (=> b!830375 (= e!462968 (contains!4188 (toList!4502 lt!376732) (tuple2!10161 lt!376512 minValue!754)))))

(assert (= (and d!105261 res!565518) b!830374))

(assert (= (and b!830374 res!565517) b!830375))

(declare-fun m!773113 () Bool)

(assert (=> d!105261 m!773113))

(declare-fun m!773115 () Bool)

(assert (=> d!105261 m!773115))

(declare-fun m!773117 () Bool)

(assert (=> d!105261 m!773117))

(declare-fun m!773119 () Bool)

(assert (=> d!105261 m!773119))

(declare-fun m!773121 () Bool)

(assert (=> b!830374 m!773121))

(declare-fun m!773123 () Bool)

(assert (=> b!830375 m!773123))

(assert (=> b!830042 d!105261))

(declare-fun d!105263 () Bool)

(declare-fun e!462969 () Bool)

(assert (=> d!105263 e!462969))

(declare-fun res!565519 () Bool)

(assert (=> d!105263 (=> res!565519 e!462969)))

(declare-fun lt!376737 () Bool)

(assert (=> d!105263 (= res!565519 (not lt!376737))))

(declare-fun lt!376736 () Bool)

(assert (=> d!105263 (= lt!376737 lt!376736)))

(declare-fun lt!376735 () Unit!28383)

(declare-fun e!462970 () Unit!28383)

(assert (=> d!105263 (= lt!376735 e!462970)))

(declare-fun c!89905 () Bool)

(assert (=> d!105263 (= c!89905 lt!376736)))

(assert (=> d!105263 (= lt!376736 (containsKey!399 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(assert (=> d!105263 (= (contains!4187 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376525) lt!376737)))

(declare-fun b!830376 () Bool)

(declare-fun lt!376734 () Unit!28383)

(assert (=> b!830376 (= e!462970 lt!376734)))

(assert (=> b!830376 (= lt!376734 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(assert (=> b!830376 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(declare-fun b!830377 () Bool)

(declare-fun Unit!28400 () Unit!28383)

(assert (=> b!830377 (= e!462970 Unit!28400)))

(declare-fun b!830378 () Bool)

(assert (=> b!830378 (= e!462969 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525)))))

(assert (= (and d!105263 c!89905) b!830376))

(assert (= (and d!105263 (not c!89905)) b!830377))

(assert (= (and d!105263 (not res!565519)) b!830378))

(declare-fun m!773125 () Bool)

(assert (=> d!105263 m!773125))

(declare-fun m!773127 () Bool)

(assert (=> b!830376 m!773127))

(declare-fun m!773129 () Bool)

(assert (=> b!830376 m!773129))

(assert (=> b!830376 m!773129))

(declare-fun m!773131 () Bool)

(assert (=> b!830376 m!773131))

(assert (=> b!830378 m!773129))

(assert (=> b!830378 m!773129))

(assert (=> b!830378 m!773131))

(assert (=> b!830042 d!105263))

(declare-fun d!105265 () Bool)

(assert (=> d!105265 (contains!4187 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376525)))

(declare-fun lt!376740 () Unit!28383)

(declare-fun choose!1428 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> d!105265 (= lt!376740 (choose!1428 lt!376510 lt!376524 zeroValueAfter!34 lt!376525))))

(assert (=> d!105265 (contains!4187 lt!376510 lt!376525)))

(assert (=> d!105265 (= (addStillContains!323 lt!376510 lt!376524 zeroValueAfter!34 lt!376525) lt!376740)))

(declare-fun bs!23160 () Bool)

(assert (= bs!23160 d!105265))

(assert (=> bs!23160 m!772601))

(assert (=> bs!23160 m!772601))

(assert (=> bs!23160 m!772603))

(declare-fun m!773133 () Bool)

(assert (=> bs!23160 m!773133))

(declare-fun m!773135 () Bool)

(assert (=> bs!23160 m!773135))

(assert (=> b!830042 d!105265))

(declare-fun d!105267 () Bool)

(declare-fun e!462971 () Bool)

(assert (=> d!105267 e!462971))

(declare-fun res!565521 () Bool)

(assert (=> d!105267 (=> (not res!565521) (not e!462971))))

(declare-fun lt!376743 () ListLongMap!8973)

(assert (=> d!105267 (= res!565521 (contains!4187 lt!376743 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun lt!376741 () List!15944)

(assert (=> d!105267 (= lt!376743 (ListLongMap!8974 lt!376741))))

(declare-fun lt!376742 () Unit!28383)

(declare-fun lt!376744 () Unit!28383)

(assert (=> d!105267 (= lt!376742 lt!376744)))

(assert (=> d!105267 (= (getValueByKey!413 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(assert (=> d!105267 (= lt!376744 (lemmaContainsTupThenGetReturnValue!230 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(assert (=> d!105267 (= lt!376741 (insertStrictlySorted!269 (toList!4502 lt!376523) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(assert (=> d!105267 (= (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!376743)))

(declare-fun b!830380 () Bool)

(declare-fun res!565520 () Bool)

(assert (=> b!830380 (=> (not res!565520) (not e!462971))))

(assert (=> b!830380 (= res!565520 (= (getValueByKey!413 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(declare-fun b!830381 () Bool)

(assert (=> b!830381 (= e!462971 (contains!4188 (toList!4502 lt!376743) (tuple2!10161 lt!376509 zeroValueAfter!34)))))

(assert (= (and d!105267 res!565521) b!830380))

(assert (= (and b!830380 res!565520) b!830381))

(declare-fun m!773137 () Bool)

(assert (=> d!105267 m!773137))

(declare-fun m!773139 () Bool)

(assert (=> d!105267 m!773139))

(declare-fun m!773141 () Bool)

(assert (=> d!105267 m!773141))

(declare-fun m!773143 () Bool)

(assert (=> d!105267 m!773143))

(declare-fun m!773145 () Bool)

(assert (=> b!830380 m!773145))

(declare-fun m!773147 () Bool)

(assert (=> b!830381 m!773147))

(assert (=> b!830042 d!105267))

(declare-fun d!105269 () Bool)

(assert (=> d!105269 (= (apply!372 lt!376521 lt!376513) (get!11824 (getValueByKey!413 (toList!4502 lt!376521) lt!376513)))))

(declare-fun bs!23161 () Bool)

(assert (= bs!23161 d!105269))

(declare-fun m!773149 () Bool)

(assert (=> bs!23161 m!773149))

(assert (=> bs!23161 m!773149))

(declare-fun m!773151 () Bool)

(assert (=> bs!23161 m!773151))

(assert (=> b!830042 d!105269))

(declare-fun d!105271 () Bool)

(assert (=> d!105271 (= (apply!372 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)) lt!376513) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))) lt!376513)))))

(declare-fun bs!23162 () Bool)

(assert (= bs!23162 d!105271))

(declare-fun m!773153 () Bool)

(assert (=> bs!23162 m!773153))

(assert (=> bs!23162 m!773153))

(declare-fun m!773155 () Bool)

(assert (=> bs!23162 m!773155))

(assert (=> b!830042 d!105271))

(assert (=> b!830042 d!105155))

(declare-fun d!105273 () Bool)

(assert (=> d!105273 (= (apply!372 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!376522) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!376522)))))

(declare-fun bs!23163 () Bool)

(assert (= bs!23163 d!105273))

(declare-fun m!773157 () Bool)

(assert (=> bs!23163 m!773157))

(assert (=> bs!23163 m!773157))

(declare-fun m!773159 () Bool)

(assert (=> bs!23163 m!773159))

(assert (=> b!830042 d!105273))

(declare-fun d!105275 () Bool)

(declare-fun e!462972 () Bool)

(assert (=> d!105275 e!462972))

(declare-fun res!565523 () Bool)

(assert (=> d!105275 (=> (not res!565523) (not e!462972))))

(declare-fun lt!376747 () ListLongMap!8973)

(assert (=> d!105275 (= res!565523 (contains!4187 lt!376747 (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun lt!376745 () List!15944)

(assert (=> d!105275 (= lt!376747 (ListLongMap!8974 lt!376745))))

(declare-fun lt!376746 () Unit!28383)

(declare-fun lt!376748 () Unit!28383)

(assert (=> d!105275 (= lt!376746 lt!376748)))

(assert (=> d!105275 (= (getValueByKey!413 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(assert (=> d!105275 (= lt!376748 (lemmaContainsTupThenGetReturnValue!230 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(assert (=> d!105275 (= lt!376745 (insertStrictlySorted!269 (toList!4502 lt!376521) (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(assert (=> d!105275 (= (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)) lt!376747)))

(declare-fun b!830382 () Bool)

(declare-fun res!565522 () Bool)

(assert (=> b!830382 (=> (not res!565522) (not e!462972))))

(assert (=> b!830382 (= res!565522 (= (getValueByKey!413 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(declare-fun b!830383 () Bool)

(assert (=> b!830383 (= e!462972 (contains!4188 (toList!4502 lt!376747) (tuple2!10161 lt!376520 minValue!754)))))

(assert (= (and d!105275 res!565523) b!830382))

(assert (= (and b!830382 res!565522) b!830383))

(declare-fun m!773161 () Bool)

(assert (=> d!105275 m!773161))

(declare-fun m!773163 () Bool)

(assert (=> d!105275 m!773163))

(declare-fun m!773165 () Bool)

(assert (=> d!105275 m!773165))

(declare-fun m!773167 () Bool)

(assert (=> d!105275 m!773167))

(declare-fun m!773169 () Bool)

(assert (=> b!830382 m!773169))

(declare-fun m!773171 () Bool)

(assert (=> b!830383 m!773171))

(assert (=> b!830042 d!105275))

(declare-fun d!105277 () Bool)

(assert (=> d!105277 (= (apply!372 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)) lt!376513) (apply!372 lt!376521 lt!376513))))

(declare-fun lt!376751 () Unit!28383)

(declare-fun choose!1429 (ListLongMap!8973 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28383)

(assert (=> d!105277 (= lt!376751 (choose!1429 lt!376521 lt!376520 minValue!754 lt!376513))))

(declare-fun e!462975 () Bool)

(assert (=> d!105277 e!462975))

(declare-fun res!565526 () Bool)

(assert (=> d!105277 (=> (not res!565526) (not e!462975))))

(assert (=> d!105277 (= res!565526 (contains!4187 lt!376521 lt!376513))))

(assert (=> d!105277 (= (addApplyDifferent!323 lt!376521 lt!376520 minValue!754 lt!376513) lt!376751)))

(declare-fun b!830387 () Bool)

(assert (=> b!830387 (= e!462975 (not (= lt!376513 lt!376520)))))

(assert (= (and d!105277 res!565526) b!830387))

(declare-fun m!773173 () Bool)

(assert (=> d!105277 m!773173))

(assert (=> d!105277 m!772577))

(assert (=> d!105277 m!772579))

(assert (=> d!105277 m!772605))

(assert (=> d!105277 m!772577))

(declare-fun m!773175 () Bool)

(assert (=> d!105277 m!773175))

(assert (=> b!830042 d!105277))

(declare-fun d!105279 () Bool)

(assert (=> d!105279 (= (apply!372 lt!376514 lt!376507) (get!11824 (getValueByKey!413 (toList!4502 lt!376514) lt!376507)))))

(declare-fun bs!23164 () Bool)

(assert (= bs!23164 d!105279))

(declare-fun m!773177 () Bool)

(assert (=> bs!23164 m!773177))

(assert (=> bs!23164 m!773177))

(declare-fun m!773179 () Bool)

(assert (=> bs!23164 m!773179))

(assert (=> b!830042 d!105279))

(declare-fun d!105281 () Bool)

(declare-fun e!462976 () Bool)

(assert (=> d!105281 e!462976))

(declare-fun res!565528 () Bool)

(assert (=> d!105281 (=> (not res!565528) (not e!462976))))

(declare-fun lt!376754 () ListLongMap!8973)

(assert (=> d!105281 (= res!565528 (contains!4187 lt!376754 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun lt!376752 () List!15944)

(assert (=> d!105281 (= lt!376754 (ListLongMap!8974 lt!376752))))

(declare-fun lt!376753 () Unit!28383)

(declare-fun lt!376755 () Unit!28383)

(assert (=> d!105281 (= lt!376753 lt!376755)))

(assert (=> d!105281 (= (getValueByKey!413 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(assert (=> d!105281 (= lt!376755 (lemmaContainsTupThenGetReturnValue!230 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(assert (=> d!105281 (= lt!376752 (insertStrictlySorted!269 (toList!4502 lt!376510) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(assert (=> d!105281 (= (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376754)))

(declare-fun b!830388 () Bool)

(declare-fun res!565527 () Bool)

(assert (=> b!830388 (=> (not res!565527) (not e!462976))))

(assert (=> b!830388 (= res!565527 (= (getValueByKey!413 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(declare-fun b!830389 () Bool)

(assert (=> b!830389 (= e!462976 (contains!4188 (toList!4502 lt!376754) (tuple2!10161 lt!376524 zeroValueAfter!34)))))

(assert (= (and d!105281 res!565528) b!830388))

(assert (= (and b!830388 res!565527) b!830389))

(declare-fun m!773181 () Bool)

(assert (=> d!105281 m!773181))

(declare-fun m!773183 () Bool)

(assert (=> d!105281 m!773183))

(declare-fun m!773185 () Bool)

(assert (=> d!105281 m!773185))

(declare-fun m!773187 () Bool)

(assert (=> d!105281 m!773187))

(declare-fun m!773189 () Bool)

(assert (=> b!830388 m!773189))

(declare-fun m!773191 () Bool)

(assert (=> b!830389 m!773191))

(assert (=> b!830042 d!105281))

(declare-fun d!105283 () Bool)

(assert (=> d!105283 (= (apply!372 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)) lt!376507) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))) lt!376507)))))

(declare-fun bs!23165 () Bool)

(assert (= bs!23165 d!105283))

(declare-fun m!773193 () Bool)

(assert (=> bs!23165 m!773193))

(assert (=> bs!23165 m!773193))

(declare-fun m!773195 () Bool)

(assert (=> bs!23165 m!773195))

(assert (=> b!830042 d!105283))

(declare-fun d!105285 () Bool)

(assert (=> d!105285 (= (apply!372 lt!376523 lt!376522) (get!11824 (getValueByKey!413 (toList!4502 lt!376523) lt!376522)))))

(declare-fun bs!23166 () Bool)

(assert (= bs!23166 d!105285))

(declare-fun m!773197 () Bool)

(assert (=> bs!23166 m!773197))

(assert (=> bs!23166 m!773197))

(declare-fun m!773199 () Bool)

(assert (=> bs!23166 m!773199))

(assert (=> b!830042 d!105285))

(declare-fun d!105287 () Bool)

(assert (=> d!105287 (= (apply!372 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)) lt!376507) (apply!372 lt!376514 lt!376507))))

(declare-fun lt!376756 () Unit!28383)

(assert (=> d!105287 (= lt!376756 (choose!1429 lt!376514 lt!376512 minValue!754 lt!376507))))

(declare-fun e!462977 () Bool)

(assert (=> d!105287 e!462977))

(declare-fun res!565529 () Bool)

(assert (=> d!105287 (=> (not res!565529) (not e!462977))))

(assert (=> d!105287 (= res!565529 (contains!4187 lt!376514 lt!376507))))

(assert (=> d!105287 (= (addApplyDifferent!323 lt!376514 lt!376512 minValue!754 lt!376507) lt!376756)))

(declare-fun b!830390 () Bool)

(assert (=> b!830390 (= e!462977 (not (= lt!376507 lt!376512)))))

(assert (= (and d!105287 res!565529) b!830390))

(declare-fun m!773201 () Bool)

(assert (=> d!105287 m!773201))

(assert (=> d!105287 m!772581))

(assert (=> d!105287 m!772583))

(assert (=> d!105287 m!772599))

(assert (=> d!105287 m!772581))

(declare-fun m!773203 () Bool)

(assert (=> d!105287 m!773203))

(assert (=> b!830042 d!105287))

(declare-fun d!105289 () Bool)

(assert (=> d!105289 (= (apply!372 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!376522) (apply!372 lt!376523 lt!376522))))

(declare-fun lt!376757 () Unit!28383)

(assert (=> d!105289 (= lt!376757 (choose!1429 lt!376523 lt!376509 zeroValueAfter!34 lt!376522))))

(declare-fun e!462978 () Bool)

(assert (=> d!105289 e!462978))

(declare-fun res!565530 () Bool)

(assert (=> d!105289 (=> (not res!565530) (not e!462978))))

(assert (=> d!105289 (= res!565530 (contains!4187 lt!376523 lt!376522))))

(assert (=> d!105289 (= (addApplyDifferent!323 lt!376523 lt!376509 zeroValueAfter!34 lt!376522) lt!376757)))

(declare-fun b!830391 () Bool)

(assert (=> b!830391 (= e!462978 (not (= lt!376522 lt!376509)))))

(assert (= (and d!105289 res!565530) b!830391))

(declare-fun m!773205 () Bool)

(assert (=> d!105289 m!773205))

(assert (=> d!105289 m!772589))

(assert (=> d!105289 m!772593))

(assert (=> d!105289 m!772607))

(assert (=> d!105289 m!772589))

(declare-fun m!773207 () Bool)

(assert (=> d!105289 m!773207))

(assert (=> b!830042 d!105289))

(declare-fun b!830392 () Bool)

(declare-fun e!462980 () Bool)

(declare-fun e!462985 () Bool)

(assert (=> b!830392 (= e!462980 e!462985)))

(assert (=> b!830392 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun res!565533 () Bool)

(declare-fun lt!376762 () ListLongMap!8973)

(assert (=> b!830392 (= res!565533 (contains!4187 lt!376762 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830392 (=> (not res!565533) (not e!462985))))

(declare-fun b!830393 () Bool)

(declare-fun e!462982 () Bool)

(assert (=> b!830393 (= e!462982 (= lt!376762 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830394 () Bool)

(assert (=> b!830394 (= e!462982 (isEmpty!659 lt!376762))))

(declare-fun b!830395 () Bool)

(declare-fun e!462983 () Bool)

(assert (=> b!830395 (= e!462983 e!462980)))

(declare-fun c!89908 () Bool)

(declare-fun e!462979 () Bool)

(assert (=> b!830395 (= c!89908 e!462979)))

(declare-fun res!565531 () Bool)

(assert (=> b!830395 (=> (not res!565531) (not e!462979))))

(assert (=> b!830395 (= res!565531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830396 () Bool)

(assert (=> b!830396 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> b!830396 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22734 _values!788)))))

(assert (=> b!830396 (= e!462985 (= (apply!372 lt!376762 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105291 () Bool)

(assert (=> d!105291 e!462983))

(declare-fun res!565532 () Bool)

(assert (=> d!105291 (=> (not res!565532) (not e!462983))))

(assert (=> d!105291 (= res!565532 (not (contains!4187 lt!376762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!462981 () ListLongMap!8973)

(assert (=> d!105291 (= lt!376762 e!462981)))

(declare-fun c!89907 () Bool)

(assert (=> d!105291 (= c!89907 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105291 (validMask!0 mask!1312)))

(assert (=> d!105291 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!376762)))

(declare-fun b!830397 () Bool)

(assert (=> b!830397 (= e!462980 e!462982)))

(declare-fun c!89906 () Bool)

(assert (=> b!830397 (= c!89906 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830398 () Bool)

(declare-fun e!462984 () ListLongMap!8973)

(declare-fun call!36252 () ListLongMap!8973)

(assert (=> b!830398 (= e!462984 call!36252)))

(declare-fun b!830399 () Bool)

(assert (=> b!830399 (= e!462979 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830399 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830400 () Bool)

(declare-fun lt!376764 () Unit!28383)

(declare-fun lt!376763 () Unit!28383)

(assert (=> b!830400 (= lt!376764 lt!376763)))

(declare-fun lt!376761 () (_ BitVec 64))

(declare-fun lt!376760 () (_ BitVec 64))

(declare-fun lt!376758 () V!25275)

(declare-fun lt!376759 () ListLongMap!8973)

(assert (=> b!830400 (not (contains!4187 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758)) lt!376761))))

(assert (=> b!830400 (= lt!376763 (addStillNotContains!198 lt!376759 lt!376760 lt!376758 lt!376761))))

(assert (=> b!830400 (= lt!376761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830400 (= lt!376758 (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830400 (= lt!376760 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!830400 (= lt!376759 call!36252)))

(assert (=> b!830400 (= e!462984 (+!2010 call!36252 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830401 () Bool)

(declare-fun res!565534 () Bool)

(assert (=> b!830401 (=> (not res!565534) (not e!462983))))

(assert (=> b!830401 (= res!565534 (not (contains!4187 lt!376762 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830402 () Bool)

(assert (=> b!830402 (= e!462981 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36249 () Bool)

(assert (=> bm!36249 (= call!36252 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830403 () Bool)

(assert (=> b!830403 (= e!462981 e!462984)))

(declare-fun c!89909 () Bool)

(assert (=> b!830403 (= c!89909 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!105291 c!89907) b!830402))

(assert (= (and d!105291 (not c!89907)) b!830403))

(assert (= (and b!830403 c!89909) b!830400))

(assert (= (and b!830403 (not c!89909)) b!830398))

(assert (= (or b!830400 b!830398) bm!36249))

(assert (= (and d!105291 res!565532) b!830401))

(assert (= (and b!830401 res!565534) b!830395))

(assert (= (and b!830395 res!565531) b!830399))

(assert (= (and b!830395 c!89908) b!830392))

(assert (= (and b!830395 (not c!89908)) b!830397))

(assert (= (and b!830392 res!565533) b!830396))

(assert (= (and b!830397 c!89906) b!830393))

(assert (= (and b!830397 (not c!89906)) b!830394))

(declare-fun b_lambda!11357 () Bool)

(assert (=> (not b_lambda!11357) (not b!830396)))

(assert (=> b!830396 t!22306))

(declare-fun b_and!22521 () Bool)

(assert (= b_and!22519 (and (=> t!22306 result!8007) b_and!22521)))

(declare-fun b_lambda!11359 () Bool)

(assert (=> (not b_lambda!11359) (not b!830400)))

(assert (=> b!830400 t!22306))

(declare-fun b_and!22523 () Bool)

(assert (= b_and!22521 (and (=> t!22306 result!8007) b_and!22523)))

(declare-fun m!773209 () Bool)

(assert (=> b!830394 m!773209))

(declare-fun m!773211 () Bool)

(assert (=> bm!36249 m!773211))

(assert (=> b!830393 m!773211))

(assert (=> b!830399 m!772925))

(assert (=> b!830399 m!772925))

(assert (=> b!830399 m!772927))

(declare-fun m!773213 () Bool)

(assert (=> d!105291 m!773213))

(assert (=> d!105291 m!772479))

(assert (=> b!830392 m!772925))

(assert (=> b!830392 m!772925))

(declare-fun m!773215 () Bool)

(assert (=> b!830392 m!773215))

(assert (=> b!830403 m!772925))

(assert (=> b!830403 m!772925))

(assert (=> b!830403 m!772927))

(assert (=> b!830396 m!772925))

(assert (=> b!830396 m!772615))

(assert (=> b!830396 m!772925))

(declare-fun m!773217 () Bool)

(assert (=> b!830396 m!773217))

(assert (=> b!830396 m!772935))

(assert (=> b!830396 m!772615))

(assert (=> b!830396 m!772937))

(assert (=> b!830396 m!772935))

(declare-fun m!773219 () Bool)

(assert (=> b!830401 m!773219))

(assert (=> b!830400 m!772925))

(declare-fun m!773221 () Bool)

(assert (=> b!830400 m!773221))

(assert (=> b!830400 m!772935))

(assert (=> b!830400 m!772615))

(assert (=> b!830400 m!772937))

(assert (=> b!830400 m!772935))

(declare-fun m!773223 () Bool)

(assert (=> b!830400 m!773223))

(assert (=> b!830400 m!773221))

(declare-fun m!773225 () Bool)

(assert (=> b!830400 m!773225))

(assert (=> b!830400 m!772615))

(declare-fun m!773227 () Bool)

(assert (=> b!830400 m!773227))

(assert (=> b!830124 d!105291))

(declare-fun d!105293 () Bool)

(assert (=> d!105293 (= (apply!372 lt!376595 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23167 () Bool)

(assert (= bs!23167 d!105293))

(assert (=> bs!23167 m!772595))

(declare-fun m!773229 () Bool)

(assert (=> bs!23167 m!773229))

(assert (=> bs!23167 m!773229))

(declare-fun m!773231 () Bool)

(assert (=> bs!23167 m!773231))

(assert (=> b!830115 d!105293))

(assert (=> b!830115 d!105199))

(assert (=> d!105141 d!105163))

(declare-fun d!105295 () Bool)

(declare-fun e!462986 () Bool)

(assert (=> d!105295 e!462986))

(declare-fun res!565535 () Bool)

(assert (=> d!105295 (=> res!565535 e!462986)))

(declare-fun lt!376768 () Bool)

(assert (=> d!105295 (= res!565535 (not lt!376768))))

(declare-fun lt!376767 () Bool)

(assert (=> d!105295 (= lt!376768 lt!376767)))

(declare-fun lt!376766 () Unit!28383)

(declare-fun e!462987 () Unit!28383)

(assert (=> d!105295 (= lt!376766 e!462987)))

(declare-fun c!89910 () Bool)

(assert (=> d!105295 (= c!89910 lt!376767)))

(assert (=> d!105295 (= lt!376767 (containsKey!399 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(assert (=> d!105295 (= (contains!4187 lt!376542 (_1!5091 lt!376417)) lt!376768)))

(declare-fun b!830404 () Bool)

(declare-fun lt!376765 () Unit!28383)

(assert (=> b!830404 (= e!462987 lt!376765)))

(assert (=> b!830404 (= lt!376765 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(assert (=> b!830404 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(declare-fun b!830405 () Bool)

(declare-fun Unit!28401 () Unit!28383)

(assert (=> b!830405 (= e!462987 Unit!28401)))

(declare-fun b!830406 () Bool)

(assert (=> b!830406 (= e!462986 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417))))))

(assert (= (and d!105295 c!89910) b!830404))

(assert (= (and d!105295 (not c!89910)) b!830405))

(assert (= (and d!105295 (not res!565535)) b!830406))

(declare-fun m!773233 () Bool)

(assert (=> d!105295 m!773233))

(declare-fun m!773235 () Bool)

(assert (=> b!830404 m!773235))

(assert (=> b!830404 m!772653))

(assert (=> b!830404 m!772653))

(declare-fun m!773237 () Bool)

(assert (=> b!830404 m!773237))

(assert (=> b!830406 m!772653))

(assert (=> b!830406 m!772653))

(assert (=> b!830406 m!773237))

(assert (=> d!105145 d!105295))

(declare-fun b!830407 () Bool)

(declare-fun e!462988 () Option!419)

(assert (=> b!830407 (= e!462988 (Some!418 (_2!5091 (h!17069 lt!376540))))))

(declare-fun b!830408 () Bool)

(declare-fun e!462989 () Option!419)

(assert (=> b!830408 (= e!462988 e!462989)))

(declare-fun c!89912 () Bool)

(assert (=> b!830408 (= c!89912 (and ((_ is Cons!15940) lt!376540) (not (= (_1!5091 (h!17069 lt!376540)) (_1!5091 lt!376417)))))))

(declare-fun b!830410 () Bool)

(assert (=> b!830410 (= e!462989 None!417)))

(declare-fun b!830409 () Bool)

(assert (=> b!830409 (= e!462989 (getValueByKey!413 (t!22300 lt!376540) (_1!5091 lt!376417)))))

(declare-fun d!105297 () Bool)

(declare-fun c!89911 () Bool)

(assert (=> d!105297 (= c!89911 (and ((_ is Cons!15940) lt!376540) (= (_1!5091 (h!17069 lt!376540)) (_1!5091 lt!376417))))))

(assert (=> d!105297 (= (getValueByKey!413 lt!376540 (_1!5091 lt!376417)) e!462988)))

(assert (= (and d!105297 c!89911) b!830407))

(assert (= (and d!105297 (not c!89911)) b!830408))

(assert (= (and b!830408 c!89912) b!830409))

(assert (= (and b!830408 (not c!89912)) b!830410))

(declare-fun m!773239 () Bool)

(assert (=> b!830409 m!773239))

(assert (=> d!105145 d!105297))

(declare-fun d!105299 () Bool)

(assert (=> d!105299 (= (getValueByKey!413 lt!376540 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(declare-fun lt!376769 () Unit!28383)

(assert (=> d!105299 (= lt!376769 (choose!1426 lt!376540 (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun e!462990 () Bool)

(assert (=> d!105299 e!462990))

(declare-fun res!565536 () Bool)

(assert (=> d!105299 (=> (not res!565536) (not e!462990))))

(assert (=> d!105299 (= res!565536 (isStrictlySorted!437 lt!376540))))

(assert (=> d!105299 (= (lemmaContainsTupThenGetReturnValue!230 lt!376540 (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!376769)))

(declare-fun b!830411 () Bool)

(declare-fun res!565537 () Bool)

(assert (=> b!830411 (=> (not res!565537) (not e!462990))))

(assert (=> b!830411 (= res!565537 (containsKey!399 lt!376540 (_1!5091 lt!376417)))))

(declare-fun b!830412 () Bool)

(assert (=> b!830412 (= e!462990 (contains!4188 lt!376540 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105299 res!565536) b!830411))

(assert (= (and b!830411 res!565537) b!830412))

(assert (=> d!105299 m!772647))

(declare-fun m!773241 () Bool)

(assert (=> d!105299 m!773241))

(declare-fun m!773243 () Bool)

(assert (=> d!105299 m!773243))

(declare-fun m!773245 () Bool)

(assert (=> b!830411 m!773245))

(declare-fun m!773247 () Bool)

(assert (=> b!830412 m!773247))

(assert (=> d!105145 d!105299))

(declare-fun b!830413 () Bool)

(declare-fun res!565538 () Bool)

(declare-fun e!462992 () Bool)

(assert (=> b!830413 (=> (not res!565538) (not e!462992))))

(declare-fun lt!376770 () List!15944)

(assert (=> b!830413 (= res!565538 (containsKey!399 lt!376770 (_1!5091 lt!376417)))))

(declare-fun e!462994 () List!15944)

(declare-fun b!830414 () Bool)

(declare-fun c!89915 () Bool)

(declare-fun c!89913 () Bool)

(assert (=> b!830414 (= e!462994 (ite c!89915 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))) (ite c!89913 (Cons!15940 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416))) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) Nil!15941)))))

(declare-fun b!830415 () Bool)

(assert (=> b!830415 (= c!89913 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376416))) (bvsgt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416)))) (_1!5091 lt!376417))))))

(declare-fun e!462991 () List!15944)

(declare-fun e!462993 () List!15944)

(assert (=> b!830415 (= e!462991 e!462993)))

(declare-fun b!830416 () Bool)

(assert (=> b!830416 (= e!462994 (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun b!830417 () Bool)

(declare-fun e!462995 () List!15944)

(declare-fun call!36253 () List!15944)

(assert (=> b!830417 (= e!462995 call!36253)))

(declare-fun b!830418 () Bool)

(declare-fun call!36255 () List!15944)

(assert (=> b!830418 (= e!462991 call!36255)))

(declare-fun b!830419 () Bool)

(declare-fun call!36254 () List!15944)

(assert (=> b!830419 (= e!462993 call!36254)))

(declare-fun bm!36250 () Bool)

(assert (=> bm!36250 (= call!36254 call!36255)))

(declare-fun b!830420 () Bool)

(assert (=> b!830420 (= e!462992 (contains!4188 lt!376770 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun d!105301 () Bool)

(assert (=> d!105301 e!462992))

(declare-fun res!565539 () Bool)

(assert (=> d!105301 (=> (not res!565539) (not e!462992))))

(assert (=> d!105301 (= res!565539 (isStrictlySorted!437 lt!376770))))

(assert (=> d!105301 (= lt!376770 e!462995)))

(declare-fun c!89916 () Bool)

(assert (=> d!105301 (= c!89916 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376416))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416)))) (_1!5091 lt!376417))))))

(assert (=> d!105301 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376414 lt!376416)))))

(assert (=> d!105301 (= (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376414 lt!376416)) (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!376770)))

(declare-fun bm!36251 () Bool)

(assert (=> bm!36251 (= call!36255 call!36253)))

(declare-fun bm!36252 () Bool)

(assert (=> bm!36252 (= call!36253 ($colon$colon!535 e!462994 (ite c!89916 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416))) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))))))

(declare-fun c!89914 () Bool)

(assert (=> bm!36252 (= c!89914 c!89916)))

(declare-fun b!830421 () Bool)

(assert (=> b!830421 (= e!462995 e!462991)))

(assert (=> b!830421 (= c!89915 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376416))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416)))) (_1!5091 lt!376417))))))

(declare-fun b!830422 () Bool)

(assert (=> b!830422 (= e!462993 call!36254)))

(assert (= (and d!105301 c!89916) b!830417))

(assert (= (and d!105301 (not c!89916)) b!830421))

(assert (= (and b!830421 c!89915) b!830418))

(assert (= (and b!830421 (not c!89915)) b!830415))

(assert (= (and b!830415 c!89913) b!830422))

(assert (= (and b!830415 (not c!89913)) b!830419))

(assert (= (or b!830422 b!830419) bm!36250))

(assert (= (or b!830418 bm!36250) bm!36251))

(assert (= (or b!830417 bm!36251) bm!36252))

(assert (= (and bm!36252 c!89914) b!830416))

(assert (= (and bm!36252 (not c!89914)) b!830414))

(assert (= (and d!105301 res!565539) b!830413))

(assert (= (and b!830413 res!565538) b!830420))

(declare-fun m!773249 () Bool)

(assert (=> b!830413 m!773249))

(declare-fun m!773251 () Bool)

(assert (=> b!830420 m!773251))

(declare-fun m!773253 () Bool)

(assert (=> b!830416 m!773253))

(declare-fun m!773255 () Bool)

(assert (=> d!105301 m!773255))

(declare-fun m!773257 () Bool)

(assert (=> d!105301 m!773257))

(declare-fun m!773259 () Bool)

(assert (=> bm!36252 m!773259))

(assert (=> d!105145 d!105301))

(assert (=> b!830119 d!105199))

(declare-fun d!105303 () Bool)

(declare-fun e!462996 () Bool)

(assert (=> d!105303 e!462996))

(declare-fun res!565541 () Bool)

(assert (=> d!105303 (=> (not res!565541) (not e!462996))))

(declare-fun lt!376773 () ListLongMap!8973)

(assert (=> d!105303 (= res!565541 (contains!4187 lt!376773 (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun lt!376771 () List!15944)

(assert (=> d!105303 (= lt!376773 (ListLongMap!8974 lt!376771))))

(declare-fun lt!376772 () Unit!28383)

(declare-fun lt!376774 () Unit!28383)

(assert (=> d!105303 (= lt!376772 lt!376774)))

(assert (=> d!105303 (= (getValueByKey!413 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591))) (Some!418 (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(assert (=> d!105303 (= lt!376774 (lemmaContainsTupThenGetReturnValue!230 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(assert (=> d!105303 (= lt!376771 (insertStrictlySorted!269 (toList!4502 lt!376592) (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(assert (=> d!105303 (= (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)) lt!376773)))

(declare-fun b!830423 () Bool)

(declare-fun res!565540 () Bool)

(assert (=> b!830423 (=> (not res!565540) (not e!462996))))

(assert (=> b!830423 (= res!565540 (= (getValueByKey!413 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591))) (Some!418 (_2!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(declare-fun b!830424 () Bool)

(assert (=> b!830424 (= e!462996 (contains!4188 (toList!4502 lt!376773) (tuple2!10161 lt!376593 lt!376591)))))

(assert (= (and d!105303 res!565541) b!830423))

(assert (= (and b!830423 res!565540) b!830424))

(declare-fun m!773261 () Bool)

(assert (=> d!105303 m!773261))

(declare-fun m!773263 () Bool)

(assert (=> d!105303 m!773263))

(declare-fun m!773265 () Bool)

(assert (=> d!105303 m!773265))

(declare-fun m!773267 () Bool)

(assert (=> d!105303 m!773267))

(declare-fun m!773269 () Bool)

(assert (=> b!830423 m!773269))

(declare-fun m!773271 () Bool)

(assert (=> b!830424 m!773271))

(assert (=> b!830119 d!105303))

(declare-fun d!105305 () Bool)

(assert (=> d!105305 (not (contains!4187 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)) lt!376594))))

(declare-fun lt!376775 () Unit!28383)

(assert (=> d!105305 (= lt!376775 (choose!1427 lt!376592 lt!376593 lt!376591 lt!376594))))

(declare-fun e!462997 () Bool)

(assert (=> d!105305 e!462997))

(declare-fun res!565542 () Bool)

(assert (=> d!105305 (=> (not res!565542) (not e!462997))))

(assert (=> d!105305 (= res!565542 (not (contains!4187 lt!376592 lt!376594)))))

(assert (=> d!105305 (= (addStillNotContains!198 lt!376592 lt!376593 lt!376591 lt!376594) lt!376775)))

(declare-fun b!830425 () Bool)

(assert (=> b!830425 (= e!462997 (not (= lt!376593 lt!376594)))))

(assert (= (and d!105305 res!565542) b!830425))

(assert (=> d!105305 m!772741))

(assert (=> d!105305 m!772741))

(assert (=> d!105305 m!772745))

(declare-fun m!773273 () Bool)

(assert (=> d!105305 m!773273))

(declare-fun m!773275 () Bool)

(assert (=> d!105305 m!773275))

(assert (=> b!830119 d!105305))

(declare-fun d!105307 () Bool)

(declare-fun e!462998 () Bool)

(assert (=> d!105307 e!462998))

(declare-fun res!565544 () Bool)

(assert (=> d!105307 (=> (not res!565544) (not e!462998))))

(declare-fun lt!376778 () ListLongMap!8973)

(assert (=> d!105307 (= res!565544 (contains!4187 lt!376778 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376776 () List!15944)

(assert (=> d!105307 (= lt!376778 (ListLongMap!8974 lt!376776))))

(declare-fun lt!376777 () Unit!28383)

(declare-fun lt!376779 () Unit!28383)

(assert (=> d!105307 (= lt!376777 lt!376779)))

(assert (=> d!105307 (= (getValueByKey!413 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105307 (= lt!376779 (lemmaContainsTupThenGetReturnValue!230 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105307 (= lt!376776 (insertStrictlySorted!269 (toList!4502 call!36227) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105307 (= (+!2010 call!36227 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376778)))

(declare-fun b!830426 () Bool)

(declare-fun res!565543 () Bool)

(assert (=> b!830426 (=> (not res!565543) (not e!462998))))

(assert (=> b!830426 (= res!565543 (= (getValueByKey!413 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830427 () Bool)

(assert (=> b!830427 (= e!462998 (contains!4188 (toList!4502 lt!376778) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105307 res!565544) b!830426))

(assert (= (and b!830426 res!565543) b!830427))

(declare-fun m!773277 () Bool)

(assert (=> d!105307 m!773277))

(declare-fun m!773279 () Bool)

(assert (=> d!105307 m!773279))

(declare-fun m!773281 () Bool)

(assert (=> d!105307 m!773281))

(declare-fun m!773283 () Bool)

(assert (=> d!105307 m!773283))

(declare-fun m!773285 () Bool)

(assert (=> b!830426 m!773285))

(declare-fun m!773287 () Bool)

(assert (=> b!830427 m!773287))

(assert (=> b!830119 d!105307))

(declare-fun d!105309 () Bool)

(declare-fun e!462999 () Bool)

(assert (=> d!105309 e!462999))

(declare-fun res!565545 () Bool)

(assert (=> d!105309 (=> res!565545 e!462999)))

(declare-fun lt!376783 () Bool)

(assert (=> d!105309 (= res!565545 (not lt!376783))))

(declare-fun lt!376782 () Bool)

(assert (=> d!105309 (= lt!376783 lt!376782)))

(declare-fun lt!376781 () Unit!28383)

(declare-fun e!463000 () Unit!28383)

(assert (=> d!105309 (= lt!376781 e!463000)))

(declare-fun c!89917 () Bool)

(assert (=> d!105309 (= c!89917 lt!376782)))

(assert (=> d!105309 (= lt!376782 (containsKey!399 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(assert (=> d!105309 (= (contains!4187 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)) lt!376594) lt!376783)))

(declare-fun b!830428 () Bool)

(declare-fun lt!376780 () Unit!28383)

(assert (=> b!830428 (= e!463000 lt!376780)))

(assert (=> b!830428 (= lt!376780 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(assert (=> b!830428 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(declare-fun b!830429 () Bool)

(declare-fun Unit!28402 () Unit!28383)

(assert (=> b!830429 (= e!463000 Unit!28402)))

(declare-fun b!830430 () Bool)

(assert (=> b!830430 (= e!462999 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594)))))

(assert (= (and d!105309 c!89917) b!830428))

(assert (= (and d!105309 (not c!89917)) b!830429))

(assert (= (and d!105309 (not res!565545)) b!830430))

(declare-fun m!773289 () Bool)

(assert (=> d!105309 m!773289))

(declare-fun m!773291 () Bool)

(assert (=> b!830428 m!773291))

(declare-fun m!773293 () Bool)

(assert (=> b!830428 m!773293))

(assert (=> b!830428 m!773293))

(declare-fun m!773295 () Bool)

(assert (=> b!830428 m!773295))

(assert (=> b!830430 m!773293))

(assert (=> b!830430 m!773293))

(assert (=> b!830430 m!773295))

(assert (=> b!830119 d!105309))

(declare-fun d!105311 () Bool)

(declare-fun e!463001 () Bool)

(assert (=> d!105311 e!463001))

(declare-fun res!565546 () Bool)

(assert (=> d!105311 (=> res!565546 e!463001)))

(declare-fun lt!376787 () Bool)

(assert (=> d!105311 (= res!565546 (not lt!376787))))

(declare-fun lt!376786 () Bool)

(assert (=> d!105311 (= lt!376787 lt!376786)))

(declare-fun lt!376785 () Unit!28383)

(declare-fun e!463002 () Unit!28383)

(assert (=> d!105311 (= lt!376785 e!463002)))

(declare-fun c!89918 () Bool)

(assert (=> d!105311 (= c!89918 lt!376786)))

(assert (=> d!105311 (= lt!376786 (containsKey!399 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105311 (= (contains!4187 lt!376602 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376787)))

(declare-fun b!830431 () Bool)

(declare-fun lt!376784 () Unit!28383)

(assert (=> b!830431 (= e!463002 lt!376784)))

(assert (=> b!830431 (= lt!376784 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830431 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830432 () Bool)

(declare-fun Unit!28403 () Unit!28383)

(assert (=> b!830432 (= e!463002 Unit!28403)))

(declare-fun b!830433 () Bool)

(assert (=> b!830433 (= e!463001 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105311 c!89918) b!830431))

(assert (= (and d!105311 (not c!89918)) b!830432))

(assert (= (and d!105311 (not res!565546)) b!830433))

(declare-fun m!773297 () Bool)

(assert (=> d!105311 m!773297))

(declare-fun m!773299 () Bool)

(assert (=> b!830431 m!773299))

(declare-fun m!773301 () Bool)

(assert (=> b!830431 m!773301))

(assert (=> b!830431 m!773301))

(declare-fun m!773303 () Bool)

(assert (=> b!830431 m!773303))

(assert (=> b!830433 m!773301))

(assert (=> b!830433 m!773301))

(assert (=> b!830433 m!773303))

(assert (=> d!105157 d!105311))

(assert (=> d!105157 d!105163))

(declare-fun d!105313 () Bool)

(declare-fun e!463003 () Bool)

(assert (=> d!105313 e!463003))

(declare-fun res!565547 () Bool)

(assert (=> d!105313 (=> res!565547 e!463003)))

(declare-fun lt!376791 () Bool)

(assert (=> d!105313 (= res!565547 (not lt!376791))))

(declare-fun lt!376790 () Bool)

(assert (=> d!105313 (= lt!376791 lt!376790)))

(declare-fun lt!376789 () Unit!28383)

(declare-fun e!463004 () Unit!28383)

(assert (=> d!105313 (= lt!376789 e!463004)))

(declare-fun c!89919 () Bool)

(assert (=> d!105313 (= c!89919 lt!376790)))

(assert (=> d!105313 (= lt!376790 (containsKey!399 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105313 (= (contains!4187 lt!376517 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376791)))

(declare-fun b!830434 () Bool)

(declare-fun lt!376788 () Unit!28383)

(assert (=> b!830434 (= e!463004 lt!376788)))

(assert (=> b!830434 (= lt!376788 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830434 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830435 () Bool)

(declare-fun Unit!28404 () Unit!28383)

(assert (=> b!830435 (= e!463004 Unit!28404)))

(declare-fun b!830436 () Bool)

(assert (=> b!830436 (= e!463003 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105313 c!89919) b!830434))

(assert (= (and d!105313 (not c!89919)) b!830435))

(assert (= (and d!105313 (not res!565547)) b!830436))

(declare-fun m!773305 () Bool)

(assert (=> d!105313 m!773305))

(declare-fun m!773307 () Bool)

(assert (=> b!830434 m!773307))

(assert (=> b!830434 m!772917))

(assert (=> b!830434 m!772917))

(declare-fun m!773309 () Bool)

(assert (=> b!830434 m!773309))

(assert (=> b!830436 m!772917))

(assert (=> b!830436 m!772917))

(assert (=> b!830436 m!773309))

(assert (=> bm!36212 d!105313))

(declare-fun d!105315 () Bool)

(declare-fun e!463005 () Bool)

(assert (=> d!105315 e!463005))

(declare-fun res!565548 () Bool)

(assert (=> d!105315 (=> res!565548 e!463005)))

(declare-fun lt!376795 () Bool)

(assert (=> d!105315 (= res!565548 (not lt!376795))))

(declare-fun lt!376794 () Bool)

(assert (=> d!105315 (= lt!376795 lt!376794)))

(declare-fun lt!376793 () Unit!28383)

(declare-fun e!463006 () Unit!28383)

(assert (=> d!105315 (= lt!376793 e!463006)))

(declare-fun c!89920 () Bool)

(assert (=> d!105315 (= c!89920 lt!376794)))

(assert (=> d!105315 (= lt!376794 (containsKey!399 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105315 (= (contains!4187 lt!376595 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376795)))

(declare-fun b!830437 () Bool)

(declare-fun lt!376792 () Unit!28383)

(assert (=> b!830437 (= e!463006 lt!376792)))

(assert (=> b!830437 (= lt!376792 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830437 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830438 () Bool)

(declare-fun Unit!28405 () Unit!28383)

(assert (=> b!830438 (= e!463006 Unit!28405)))

(declare-fun b!830439 () Bool)

(assert (=> b!830439 (= e!463005 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105315 c!89920) b!830437))

(assert (= (and d!105315 (not c!89920)) b!830438))

(assert (= (and d!105315 (not res!565548)) b!830439))

(declare-fun m!773311 () Bool)

(assert (=> d!105315 m!773311))

(declare-fun m!773313 () Bool)

(assert (=> b!830437 m!773313))

(declare-fun m!773315 () Bool)

(assert (=> b!830437 m!773315))

(assert (=> b!830437 m!773315))

(declare-fun m!773317 () Bool)

(assert (=> b!830437 m!773317))

(assert (=> b!830439 m!773315))

(assert (=> b!830439 m!773315))

(assert (=> b!830439 m!773317))

(assert (=> d!105155 d!105315))

(assert (=> d!105155 d!105163))

(declare-fun d!105317 () Bool)

(declare-fun e!463007 () Bool)

(assert (=> d!105317 e!463007))

(declare-fun res!565549 () Bool)

(assert (=> d!105317 (=> res!565549 e!463007)))

(declare-fun lt!376799 () Bool)

(assert (=> d!105317 (= res!565549 (not lt!376799))))

(declare-fun lt!376798 () Bool)

(assert (=> d!105317 (= lt!376799 lt!376798)))

(declare-fun lt!376797 () Unit!28383)

(declare-fun e!463008 () Unit!28383)

(assert (=> d!105317 (= lt!376797 e!463008)))

(declare-fun c!89921 () Bool)

(assert (=> d!105317 (= c!89921 lt!376798)))

(assert (=> d!105317 (= lt!376798 (containsKey!399 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105317 (= (contains!4187 lt!376595 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376799)))

(declare-fun b!830440 () Bool)

(declare-fun lt!376796 () Unit!28383)

(assert (=> b!830440 (= e!463008 lt!376796)))

(assert (=> b!830440 (= lt!376796 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830440 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830441 () Bool)

(declare-fun Unit!28406 () Unit!28383)

(assert (=> b!830441 (= e!463008 Unit!28406)))

(declare-fun b!830442 () Bool)

(assert (=> b!830442 (= e!463007 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105317 c!89921) b!830440))

(assert (= (and d!105317 (not c!89921)) b!830441))

(assert (= (and d!105317 (not res!565549)) b!830442))

(assert (=> d!105317 m!772595))

(declare-fun m!773319 () Bool)

(assert (=> d!105317 m!773319))

(assert (=> b!830440 m!772595))

(declare-fun m!773321 () Bool)

(assert (=> b!830440 m!773321))

(assert (=> b!830440 m!772595))

(assert (=> b!830440 m!773229))

(assert (=> b!830440 m!773229))

(declare-fun m!773323 () Bool)

(assert (=> b!830440 m!773323))

(assert (=> b!830442 m!772595))

(assert (=> b!830442 m!773229))

(assert (=> b!830442 m!773229))

(assert (=> b!830442 m!773323))

(assert (=> b!830111 d!105317))

(assert (=> d!105153 d!105157))

(assert (=> d!105153 d!105155))

(declare-fun d!105319 () Bool)

(assert (=> d!105319 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105319 true))

(declare-fun _$13!46 () Unit!28383)

(assert (=> d!105319 (= (choose!1425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!46)))

(declare-fun bs!23168 () Bool)

(assert (= bs!23168 d!105319))

(assert (=> bs!23168 m!772501))

(assert (=> bs!23168 m!772499))

(assert (=> d!105153 d!105319))

(assert (=> d!105153 d!105163))

(declare-fun d!105321 () Bool)

(declare-fun lt!376800 () Bool)

(assert (=> d!105321 (= lt!376800 (select (content!385 (toList!4502 lt!376550)) lt!376416))))

(declare-fun e!463009 () Bool)

(assert (=> d!105321 (= lt!376800 e!463009)))

(declare-fun res!565550 () Bool)

(assert (=> d!105321 (=> (not res!565550) (not e!463009))))

(assert (=> d!105321 (= res!565550 ((_ is Cons!15940) (toList!4502 lt!376550)))))

(assert (=> d!105321 (= (contains!4188 (toList!4502 lt!376550) lt!376416) lt!376800)))

(declare-fun b!830443 () Bool)

(declare-fun e!463010 () Bool)

(assert (=> b!830443 (= e!463009 e!463010)))

(declare-fun res!565551 () Bool)

(assert (=> b!830443 (=> res!565551 e!463010)))

(assert (=> b!830443 (= res!565551 (= (h!17069 (toList!4502 lt!376550)) lt!376416))))

(declare-fun b!830444 () Bool)

(assert (=> b!830444 (= e!463010 (contains!4188 (t!22300 (toList!4502 lt!376550)) lt!376416))))

(assert (= (and d!105321 res!565550) b!830443))

(assert (= (and b!830443 (not res!565551)) b!830444))

(declare-fun m!773325 () Bool)

(assert (=> d!105321 m!773325))

(declare-fun m!773327 () Bool)

(assert (=> d!105321 m!773327))

(declare-fun m!773329 () Bool)

(assert (=> b!830444 m!773329))

(assert (=> b!830065 d!105321))

(declare-fun d!105323 () Bool)

(assert (=> d!105323 (= (isEmpty!659 lt!376595) (isEmpty!660 (toList!4502 lt!376595)))))

(declare-fun bs!23169 () Bool)

(assert (= bs!23169 d!105323))

(declare-fun m!773331 () Bool)

(assert (=> bs!23169 m!773331))

(assert (=> b!830113 d!105323))

(assert (=> b!830151 d!105189))

(declare-fun d!105325 () Bool)

(declare-fun e!463011 () Bool)

(assert (=> d!105325 e!463011))

(declare-fun res!565553 () Bool)

(assert (=> d!105325 (=> (not res!565553) (not e!463011))))

(declare-fun lt!376803 () ListLongMap!8973)

(assert (=> d!105325 (= res!565553 (contains!4187 lt!376803 (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun lt!376801 () List!15944)

(assert (=> d!105325 (= lt!376803 (ListLongMap!8974 lt!376801))))

(declare-fun lt!376802 () Unit!28383)

(declare-fun lt!376804 () Unit!28383)

(assert (=> d!105325 (= lt!376802 lt!376804)))

(assert (=> d!105325 (= (getValueByKey!413 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(assert (=> d!105325 (= lt!376804 (lemmaContainsTupThenGetReturnValue!230 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(assert (=> d!105325 (= lt!376801 (insertStrictlySorted!269 (toList!4502 lt!376560) (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(assert (=> d!105325 (= (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)) lt!376803)))

(declare-fun b!830445 () Bool)

(declare-fun res!565552 () Bool)

(assert (=> b!830445 (=> (not res!565552) (not e!463011))))

(assert (=> b!830445 (= res!565552 (= (getValueByKey!413 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(declare-fun b!830446 () Bool)

(assert (=> b!830446 (= e!463011 (contains!4188 (toList!4502 lt!376803) (tuple2!10161 lt!376558 minValue!754)))))

(assert (= (and d!105325 res!565553) b!830445))

(assert (= (and b!830445 res!565552) b!830446))

(declare-fun m!773333 () Bool)

(assert (=> d!105325 m!773333))

(declare-fun m!773335 () Bool)

(assert (=> d!105325 m!773335))

(declare-fun m!773337 () Bool)

(assert (=> d!105325 m!773337))

(declare-fun m!773339 () Bool)

(assert (=> d!105325 m!773339))

(declare-fun m!773341 () Bool)

(assert (=> b!830445 m!773341))

(declare-fun m!773343 () Bool)

(assert (=> b!830446 m!773343))

(assert (=> b!830077 d!105325))

(declare-fun d!105327 () Bool)

(assert (=> d!105327 (contains!4187 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!376571)))

(declare-fun lt!376805 () Unit!28383)

(assert (=> d!105327 (= lt!376805 (choose!1428 lt!376556 lt!376570 zeroValueBefore!34 lt!376571))))

(assert (=> d!105327 (contains!4187 lt!376556 lt!376571)))

(assert (=> d!105327 (= (addStillContains!323 lt!376556 lt!376570 zeroValueBefore!34 lt!376571) lt!376805)))

(declare-fun bs!23170 () Bool)

(assert (= bs!23170 d!105327))

(assert (=> bs!23170 m!772703))

(assert (=> bs!23170 m!772703))

(assert (=> bs!23170 m!772705))

(declare-fun m!773345 () Bool)

(assert (=> bs!23170 m!773345))

(declare-fun m!773347 () Bool)

(assert (=> bs!23170 m!773347))

(assert (=> b!830077 d!105327))

(declare-fun d!105329 () Bool)

(assert (=> d!105329 (= (apply!372 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)) lt!376559) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))) lt!376559)))))

(declare-fun bs!23171 () Bool)

(assert (= bs!23171 d!105329))

(declare-fun m!773349 () Bool)

(assert (=> bs!23171 m!773349))

(assert (=> bs!23171 m!773349))

(declare-fun m!773351 () Bool)

(assert (=> bs!23171 m!773351))

(assert (=> b!830077 d!105329))

(declare-fun d!105331 () Bool)

(assert (=> d!105331 (= (apply!372 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)) lt!376559) (apply!372 lt!376567 lt!376559))))

(declare-fun lt!376806 () Unit!28383)

(assert (=> d!105331 (= lt!376806 (choose!1429 lt!376567 lt!376566 minValue!754 lt!376559))))

(declare-fun e!463012 () Bool)

(assert (=> d!105331 e!463012))

(declare-fun res!565554 () Bool)

(assert (=> d!105331 (=> (not res!565554) (not e!463012))))

(assert (=> d!105331 (= res!565554 (contains!4187 lt!376567 lt!376559))))

(assert (=> d!105331 (= (addApplyDifferent!323 lt!376567 lt!376566 minValue!754 lt!376559) lt!376806)))

(declare-fun b!830447 () Bool)

(assert (=> b!830447 (= e!463012 (not (= lt!376559 lt!376566)))))

(assert (= (and d!105331 res!565554) b!830447))

(declare-fun m!773353 () Bool)

(assert (=> d!105331 m!773353))

(assert (=> d!105331 m!772681))

(assert (=> d!105331 m!772683))

(assert (=> d!105331 m!772707))

(assert (=> d!105331 m!772681))

(declare-fun m!773355 () Bool)

(assert (=> d!105331 m!773355))

(assert (=> b!830077 d!105331))

(declare-fun d!105333 () Bool)

(assert (=> d!105333 (= (apply!372 lt!376560 lt!376553) (get!11824 (getValueByKey!413 (toList!4502 lt!376560) lt!376553)))))

(declare-fun bs!23172 () Bool)

(assert (= bs!23172 d!105333))

(declare-fun m!773357 () Bool)

(assert (=> bs!23172 m!773357))

(assert (=> bs!23172 m!773357))

(declare-fun m!773359 () Bool)

(assert (=> bs!23172 m!773359))

(assert (=> b!830077 d!105333))

(declare-fun d!105335 () Bool)

(assert (=> d!105335 (= (apply!372 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!376568) (apply!372 lt!376569 lt!376568))))

(declare-fun lt!376807 () Unit!28383)

(assert (=> d!105335 (= lt!376807 (choose!1429 lt!376569 lt!376555 zeroValueBefore!34 lt!376568))))

(declare-fun e!463013 () Bool)

(assert (=> d!105335 e!463013))

(declare-fun res!565555 () Bool)

(assert (=> d!105335 (=> (not res!565555) (not e!463013))))

(assert (=> d!105335 (= res!565555 (contains!4187 lt!376569 lt!376568))))

(assert (=> d!105335 (= (addApplyDifferent!323 lt!376569 lt!376555 zeroValueBefore!34 lt!376568) lt!376807)))

(declare-fun b!830448 () Bool)

(assert (=> b!830448 (= e!463013 (not (= lt!376568 lt!376555)))))

(assert (= (and d!105335 res!565555) b!830448))

(declare-fun m!773361 () Bool)

(assert (=> d!105335 m!773361))

(assert (=> d!105335 m!772693))

(assert (=> d!105335 m!772697))

(assert (=> d!105335 m!772709))

(assert (=> d!105335 m!772693))

(declare-fun m!773363 () Bool)

(assert (=> d!105335 m!773363))

(assert (=> b!830077 d!105335))

(declare-fun d!105337 () Bool)

(declare-fun e!463014 () Bool)

(assert (=> d!105337 e!463014))

(declare-fun res!565557 () Bool)

(assert (=> d!105337 (=> (not res!565557) (not e!463014))))

(declare-fun lt!376810 () ListLongMap!8973)

(assert (=> d!105337 (= res!565557 (contains!4187 lt!376810 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun lt!376808 () List!15944)

(assert (=> d!105337 (= lt!376810 (ListLongMap!8974 lt!376808))))

(declare-fun lt!376809 () Unit!28383)

(declare-fun lt!376811 () Unit!28383)

(assert (=> d!105337 (= lt!376809 lt!376811)))

(assert (=> d!105337 (= (getValueByKey!413 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(assert (=> d!105337 (= lt!376811 (lemmaContainsTupThenGetReturnValue!230 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(assert (=> d!105337 (= lt!376808 (insertStrictlySorted!269 (toList!4502 lt!376556) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(assert (=> d!105337 (= (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!376810)))

(declare-fun b!830449 () Bool)

(declare-fun res!565556 () Bool)

(assert (=> b!830449 (=> (not res!565556) (not e!463014))))

(assert (=> b!830449 (= res!565556 (= (getValueByKey!413 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(declare-fun b!830450 () Bool)

(assert (=> b!830450 (= e!463014 (contains!4188 (toList!4502 lt!376810) (tuple2!10161 lt!376570 zeroValueBefore!34)))))

(assert (= (and d!105337 res!565557) b!830449))

(assert (= (and b!830449 res!565556) b!830450))

(declare-fun m!773365 () Bool)

(assert (=> d!105337 m!773365))

(declare-fun m!773367 () Bool)

(assert (=> d!105337 m!773367))

(declare-fun m!773369 () Bool)

(assert (=> d!105337 m!773369))

(declare-fun m!773371 () Bool)

(assert (=> d!105337 m!773371))

(declare-fun m!773373 () Bool)

(assert (=> b!830449 m!773373))

(declare-fun m!773375 () Bool)

(assert (=> b!830450 m!773375))

(assert (=> b!830077 d!105337))

(declare-fun d!105339 () Bool)

(assert (=> d!105339 (= (apply!372 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)) lt!376553) (apply!372 lt!376560 lt!376553))))

(declare-fun lt!376812 () Unit!28383)

(assert (=> d!105339 (= lt!376812 (choose!1429 lt!376560 lt!376558 minValue!754 lt!376553))))

(declare-fun e!463015 () Bool)

(assert (=> d!105339 e!463015))

(declare-fun res!565558 () Bool)

(assert (=> d!105339 (=> (not res!565558) (not e!463015))))

(assert (=> d!105339 (= res!565558 (contains!4187 lt!376560 lt!376553))))

(assert (=> d!105339 (= (addApplyDifferent!323 lt!376560 lt!376558 minValue!754 lt!376553) lt!376812)))

(declare-fun b!830451 () Bool)

(assert (=> b!830451 (= e!463015 (not (= lt!376553 lt!376558)))))

(assert (= (and d!105339 res!565558) b!830451))

(declare-fun m!773377 () Bool)

(assert (=> d!105339 m!773377))

(assert (=> d!105339 m!772685))

(assert (=> d!105339 m!772687))

(assert (=> d!105339 m!772701))

(assert (=> d!105339 m!772685))

(declare-fun m!773379 () Bool)

(assert (=> d!105339 m!773379))

(assert (=> b!830077 d!105339))

(declare-fun d!105341 () Bool)

(declare-fun e!463016 () Bool)

(assert (=> d!105341 e!463016))

(declare-fun res!565560 () Bool)

(assert (=> d!105341 (=> (not res!565560) (not e!463016))))

(declare-fun lt!376815 () ListLongMap!8973)

(assert (=> d!105341 (= res!565560 (contains!4187 lt!376815 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun lt!376813 () List!15944)

(assert (=> d!105341 (= lt!376815 (ListLongMap!8974 lt!376813))))

(declare-fun lt!376814 () Unit!28383)

(declare-fun lt!376816 () Unit!28383)

(assert (=> d!105341 (= lt!376814 lt!376816)))

(assert (=> d!105341 (= (getValueByKey!413 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(assert (=> d!105341 (= lt!376816 (lemmaContainsTupThenGetReturnValue!230 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(assert (=> d!105341 (= lt!376813 (insertStrictlySorted!269 (toList!4502 lt!376569) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(assert (=> d!105341 (= (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!376815)))

(declare-fun b!830452 () Bool)

(declare-fun res!565559 () Bool)

(assert (=> b!830452 (=> (not res!565559) (not e!463016))))

(assert (=> b!830452 (= res!565559 (= (getValueByKey!413 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(declare-fun b!830453 () Bool)

(assert (=> b!830453 (= e!463016 (contains!4188 (toList!4502 lt!376815) (tuple2!10161 lt!376555 zeroValueBefore!34)))))

(assert (= (and d!105341 res!565560) b!830452))

(assert (= (and b!830452 res!565559) b!830453))

(declare-fun m!773381 () Bool)

(assert (=> d!105341 m!773381))

(declare-fun m!773383 () Bool)

(assert (=> d!105341 m!773383))

(declare-fun m!773385 () Bool)

(assert (=> d!105341 m!773385))

(declare-fun m!773387 () Bool)

(assert (=> d!105341 m!773387))

(declare-fun m!773389 () Bool)

(assert (=> b!830452 m!773389))

(declare-fun m!773391 () Bool)

(assert (=> b!830453 m!773391))

(assert (=> b!830077 d!105341))

(declare-fun d!105343 () Bool)

(declare-fun e!463017 () Bool)

(assert (=> d!105343 e!463017))

(declare-fun res!565561 () Bool)

(assert (=> d!105343 (=> res!565561 e!463017)))

(declare-fun lt!376820 () Bool)

(assert (=> d!105343 (= res!565561 (not lt!376820))))

(declare-fun lt!376819 () Bool)

(assert (=> d!105343 (= lt!376820 lt!376819)))

(declare-fun lt!376818 () Unit!28383)

(declare-fun e!463018 () Unit!28383)

(assert (=> d!105343 (= lt!376818 e!463018)))

(declare-fun c!89922 () Bool)

(assert (=> d!105343 (= c!89922 lt!376819)))

(assert (=> d!105343 (= lt!376819 (containsKey!399 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(assert (=> d!105343 (= (contains!4187 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!376571) lt!376820)))

(declare-fun b!830454 () Bool)

(declare-fun lt!376817 () Unit!28383)

(assert (=> b!830454 (= e!463018 lt!376817)))

(assert (=> b!830454 (= lt!376817 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(assert (=> b!830454 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(declare-fun b!830455 () Bool)

(declare-fun Unit!28407 () Unit!28383)

(assert (=> b!830455 (= e!463018 Unit!28407)))

(declare-fun b!830456 () Bool)

(assert (=> b!830456 (= e!463017 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571)))))

(assert (= (and d!105343 c!89922) b!830454))

(assert (= (and d!105343 (not c!89922)) b!830455))

(assert (= (and d!105343 (not res!565561)) b!830456))

(declare-fun m!773393 () Bool)

(assert (=> d!105343 m!773393))

(declare-fun m!773395 () Bool)

(assert (=> b!830454 m!773395))

(declare-fun m!773397 () Bool)

(assert (=> b!830454 m!773397))

(assert (=> b!830454 m!773397))

(declare-fun m!773399 () Bool)

(assert (=> b!830454 m!773399))

(assert (=> b!830456 m!773397))

(assert (=> b!830456 m!773397))

(assert (=> b!830456 m!773399))

(assert (=> b!830077 d!105343))

(declare-fun d!105345 () Bool)

(assert (=> d!105345 (= (apply!372 lt!376567 lt!376559) (get!11824 (getValueByKey!413 (toList!4502 lt!376567) lt!376559)))))

(declare-fun bs!23173 () Bool)

(assert (= bs!23173 d!105345))

(declare-fun m!773401 () Bool)

(assert (=> bs!23173 m!773401))

(assert (=> bs!23173 m!773401))

(declare-fun m!773403 () Bool)

(assert (=> bs!23173 m!773403))

(assert (=> b!830077 d!105345))

(declare-fun d!105347 () Bool)

(declare-fun e!463019 () Bool)

(assert (=> d!105347 e!463019))

(declare-fun res!565563 () Bool)

(assert (=> d!105347 (=> (not res!565563) (not e!463019))))

(declare-fun lt!376823 () ListLongMap!8973)

(assert (=> d!105347 (= res!565563 (contains!4187 lt!376823 (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun lt!376821 () List!15944)

(assert (=> d!105347 (= lt!376823 (ListLongMap!8974 lt!376821))))

(declare-fun lt!376822 () Unit!28383)

(declare-fun lt!376824 () Unit!28383)

(assert (=> d!105347 (= lt!376822 lt!376824)))

(assert (=> d!105347 (= (getValueByKey!413 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(assert (=> d!105347 (= lt!376824 (lemmaContainsTupThenGetReturnValue!230 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(assert (=> d!105347 (= lt!376821 (insertStrictlySorted!269 (toList!4502 lt!376567) (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(assert (=> d!105347 (= (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)) lt!376823)))

(declare-fun b!830457 () Bool)

(declare-fun res!565562 () Bool)

(assert (=> b!830457 (=> (not res!565562) (not e!463019))))

(assert (=> b!830457 (= res!565562 (= (getValueByKey!413 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(declare-fun b!830458 () Bool)

(assert (=> b!830458 (= e!463019 (contains!4188 (toList!4502 lt!376823) (tuple2!10161 lt!376566 minValue!754)))))

(assert (= (and d!105347 res!565563) b!830457))

(assert (= (and b!830457 res!565562) b!830458))

(declare-fun m!773405 () Bool)

(assert (=> d!105347 m!773405))

(declare-fun m!773407 () Bool)

(assert (=> d!105347 m!773407))

(declare-fun m!773409 () Bool)

(assert (=> d!105347 m!773409))

(declare-fun m!773411 () Bool)

(assert (=> d!105347 m!773411))

(declare-fun m!773413 () Bool)

(assert (=> b!830457 m!773413))

(declare-fun m!773415 () Bool)

(assert (=> b!830458 m!773415))

(assert (=> b!830077 d!105347))

(declare-fun d!105349 () Bool)

(assert (=> d!105349 (= (apply!372 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!376568) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!376568)))))

(declare-fun bs!23174 () Bool)

(assert (= bs!23174 d!105349))

(declare-fun m!773417 () Bool)

(assert (=> bs!23174 m!773417))

(assert (=> bs!23174 m!773417))

(declare-fun m!773419 () Bool)

(assert (=> bs!23174 m!773419))

(assert (=> b!830077 d!105349))

(declare-fun d!105351 () Bool)

(assert (=> d!105351 (= (apply!372 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)) lt!376553) (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))) lt!376553)))))

(declare-fun bs!23175 () Bool)

(assert (= bs!23175 d!105351))

(declare-fun m!773421 () Bool)

(assert (=> bs!23175 m!773421))

(assert (=> bs!23175 m!773421))

(declare-fun m!773423 () Bool)

(assert (=> bs!23175 m!773423))

(assert (=> b!830077 d!105351))

(assert (=> b!830077 d!105157))

(declare-fun d!105353 () Bool)

(assert (=> d!105353 (= (apply!372 lt!376569 lt!376568) (get!11824 (getValueByKey!413 (toList!4502 lt!376569) lt!376568)))))

(declare-fun bs!23176 () Bool)

(assert (= bs!23176 d!105353))

(declare-fun m!773425 () Bool)

(assert (=> bs!23176 m!773425))

(assert (=> bs!23176 m!773425))

(declare-fun m!773427 () Bool)

(assert (=> bs!23176 m!773427))

(assert (=> b!830077 d!105353))

(declare-fun d!105355 () Bool)

(assert (=> d!105355 (= (apply!372 lt!376517 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (get!11824 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23177 () Bool)

(assert (= bs!23177 d!105355))

(assert (=> bs!23177 m!772595))

(declare-fun m!773429 () Bool)

(assert (=> bs!23177 m!773429))

(assert (=> bs!23177 m!773429))

(declare-fun m!773431 () Bool)

(assert (=> bs!23177 m!773431))

(assert (=> b!830038 d!105355))

(assert (=> b!830038 d!105199))

(declare-fun b!830459 () Bool)

(declare-fun e!463020 () Option!419)

(assert (=> b!830459 (= e!463020 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376542)))))))

(declare-fun b!830460 () Bool)

(declare-fun e!463021 () Option!419)

(assert (=> b!830460 (= e!463020 e!463021)))

(declare-fun c!89924 () Bool)

(assert (=> b!830460 (= c!89924 (and ((_ is Cons!15940) (toList!4502 lt!376542)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376542))) (_1!5091 lt!376417)))))))

(declare-fun b!830462 () Bool)

(assert (=> b!830462 (= e!463021 None!417)))

(declare-fun b!830461 () Bool)

(assert (=> b!830461 (= e!463021 (getValueByKey!413 (t!22300 (toList!4502 lt!376542)) (_1!5091 lt!376417)))))

(declare-fun d!105357 () Bool)

(declare-fun c!89923 () Bool)

(assert (=> d!105357 (= c!89923 (and ((_ is Cons!15940) (toList!4502 lt!376542)) (= (_1!5091 (h!17069 (toList!4502 lt!376542))) (_1!5091 lt!376417))))))

(assert (=> d!105357 (= (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417)) e!463020)))

(assert (= (and d!105357 c!89923) b!830459))

(assert (= (and d!105357 (not c!89923)) b!830460))

(assert (= (and b!830460 c!89924) b!830461))

(assert (= (and b!830460 (not c!89924)) b!830462))

(declare-fun m!773433 () Bool)

(assert (=> b!830461 m!773433))

(assert (=> b!830060 d!105357))

(declare-fun b!830463 () Bool)

(declare-fun e!463022 () Option!419)

(assert (=> b!830463 (= e!463022 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376538)))))))

(declare-fun b!830464 () Bool)

(declare-fun e!463023 () Option!419)

(assert (=> b!830464 (= e!463022 e!463023)))

(declare-fun c!89926 () Bool)

(assert (=> b!830464 (= c!89926 (and ((_ is Cons!15940) (toList!4502 lt!376538)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376538))) (_1!5091 lt!376417)))))))

(declare-fun b!830466 () Bool)

(assert (=> b!830466 (= e!463023 None!417)))

(declare-fun b!830465 () Bool)

(assert (=> b!830465 (= e!463023 (getValueByKey!413 (t!22300 (toList!4502 lt!376538)) (_1!5091 lt!376417)))))

(declare-fun d!105359 () Bool)

(declare-fun c!89925 () Bool)

(assert (=> d!105359 (= c!89925 (and ((_ is Cons!15940) (toList!4502 lt!376538)) (= (_1!5091 (h!17069 (toList!4502 lt!376538))) (_1!5091 lt!376417))))))

(assert (=> d!105359 (= (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417)) e!463022)))

(assert (= (and d!105359 c!89925) b!830463))

(assert (= (and d!105359 (not c!89925)) b!830464))

(assert (= (and b!830464 c!89926) b!830465))

(assert (= (and b!830464 (not c!89926)) b!830466))

(declare-fun m!773435 () Bool)

(assert (=> b!830465 m!773435))

(assert (=> b!830058 d!105359))

(assert (=> b!830035 d!105189))

(declare-fun b!830467 () Bool)

(declare-fun e!463024 () Bool)

(declare-fun e!463026 () Bool)

(assert (=> b!830467 (= e!463024 e!463026)))

(declare-fun c!89927 () Bool)

(assert (=> b!830467 (= c!89927 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!105361 () Bool)

(declare-fun res!565564 () Bool)

(assert (=> d!105361 (=> res!565564 e!463024)))

(assert (=> d!105361 (= res!565564 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105361 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463024)))

(declare-fun b!830468 () Bool)

(declare-fun call!36256 () Bool)

(assert (=> b!830468 (= e!463026 call!36256)))

(declare-fun b!830469 () Bool)

(declare-fun e!463025 () Bool)

(assert (=> b!830469 (= e!463026 e!463025)))

(declare-fun lt!376825 () (_ BitVec 64))

(assert (=> b!830469 (= lt!376825 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!376826 () Unit!28383)

(assert (=> b!830469 (= lt!376826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!830469 (arrayContainsKey!0 _keys!976 lt!376825 #b00000000000000000000000000000000)))

(declare-fun lt!376827 () Unit!28383)

(assert (=> b!830469 (= lt!376827 lt!376826)))

(declare-fun res!565565 () Bool)

(assert (=> b!830469 (= res!565565 (= (seekEntryOrOpen!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8740 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830469 (=> (not res!565565) (not e!463025))))

(declare-fun bm!36253 () Bool)

(assert (=> bm!36253 (= call!36256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830470 () Bool)

(assert (=> b!830470 (= e!463025 call!36256)))

(assert (= (and d!105361 (not res!565564)) b!830467))

(assert (= (and b!830467 c!89927) b!830469))

(assert (= (and b!830467 (not c!89927)) b!830468))

(assert (= (and b!830469 res!565565) b!830470))

(assert (= (or b!830470 b!830468) bm!36253))

(assert (=> b!830467 m!772925))

(assert (=> b!830467 m!772925))

(assert (=> b!830467 m!772927))

(assert (=> b!830469 m!772925))

(declare-fun m!773437 () Bool)

(assert (=> b!830469 m!773437))

(declare-fun m!773439 () Bool)

(assert (=> b!830469 m!773439))

(assert (=> b!830469 m!772925))

(declare-fun m!773441 () Bool)

(assert (=> b!830469 m!773441))

(declare-fun m!773443 () Bool)

(assert (=> bm!36253 m!773443))

(assert (=> bm!36231 d!105361))

(declare-fun b!830471 () Bool)

(declare-fun e!463027 () Option!419)

(assert (=> b!830471 (= e!463027 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376550)))))))

(declare-fun b!830472 () Bool)

(declare-fun e!463028 () Option!419)

(assert (=> b!830472 (= e!463027 e!463028)))

(declare-fun c!89929 () Bool)

(assert (=> b!830472 (= c!89929 (and ((_ is Cons!15940) (toList!4502 lt!376550)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376550))) (_1!5091 lt!376416)))))))

(declare-fun b!830474 () Bool)

(assert (=> b!830474 (= e!463028 None!417)))

(declare-fun b!830473 () Bool)

(assert (=> b!830473 (= e!463028 (getValueByKey!413 (t!22300 (toList!4502 lt!376550)) (_1!5091 lt!376416)))))

(declare-fun d!105363 () Bool)

(declare-fun c!89928 () Bool)

(assert (=> d!105363 (= c!89928 (and ((_ is Cons!15940) (toList!4502 lt!376550)) (= (_1!5091 (h!17069 (toList!4502 lt!376550))) (_1!5091 lt!376416))))))

(assert (=> d!105363 (= (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416)) e!463027)))

(assert (= (and d!105363 c!89928) b!830471))

(assert (= (and d!105363 (not c!89928)) b!830472))

(assert (= (and b!830472 c!89929) b!830473))

(assert (= (and b!830472 (not c!89929)) b!830474))

(declare-fun m!773445 () Bool)

(assert (=> b!830473 m!773445))

(assert (=> b!830064 d!105363))

(declare-fun b!830475 () Bool)

(declare-fun e!463029 () Option!419)

(assert (=> b!830475 (= e!463029 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376546)))))))

(declare-fun b!830476 () Bool)

(declare-fun e!463030 () Option!419)

(assert (=> b!830476 (= e!463029 e!463030)))

(declare-fun c!89931 () Bool)

(assert (=> b!830476 (= c!89931 (and ((_ is Cons!15940) (toList!4502 lt!376546)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376546))) (_1!5091 lt!376416)))))))

(declare-fun b!830478 () Bool)

(assert (=> b!830478 (= e!463030 None!417)))

(declare-fun b!830477 () Bool)

(assert (=> b!830477 (= e!463030 (getValueByKey!413 (t!22300 (toList!4502 lt!376546)) (_1!5091 lt!376416)))))

(declare-fun d!105365 () Bool)

(declare-fun c!89930 () Bool)

(assert (=> d!105365 (= c!89930 (and ((_ is Cons!15940) (toList!4502 lt!376546)) (= (_1!5091 (h!17069 (toList!4502 lt!376546))) (_1!5091 lt!376416))))))

(assert (=> d!105365 (= (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416)) e!463029)))

(assert (= (and d!105365 c!89930) b!830475))

(assert (= (and d!105365 (not c!89930)) b!830476))

(assert (= (and b!830476 c!89931) b!830477))

(assert (= (and b!830476 (not c!89931)) b!830478))

(declare-fun m!773447 () Bool)

(assert (=> b!830477 m!773447))

(assert (=> b!830062 d!105365))

(declare-fun d!105367 () Bool)

(assert (=> d!105367 (= (apply!372 lt!376563 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11824 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23178 () Bool)

(assert (= bs!23178 d!105367))

(assert (=> bs!23178 m!773013))

(assert (=> bs!23178 m!773013))

(declare-fun m!773449 () Bool)

(assert (=> bs!23178 m!773449))

(assert (=> b!830072 d!105367))

(declare-fun d!105369 () Bool)

(declare-fun lt!376828 () Bool)

(assert (=> d!105369 (= lt!376828 (select (content!385 (toList!4502 lt!376607)) lt!376416))))

(declare-fun e!463031 () Bool)

(assert (=> d!105369 (= lt!376828 e!463031)))

(declare-fun res!565566 () Bool)

(assert (=> d!105369 (=> (not res!565566) (not e!463031))))

(assert (=> d!105369 (= res!565566 ((_ is Cons!15940) (toList!4502 lt!376607)))))

(assert (=> d!105369 (= (contains!4188 (toList!4502 lt!376607) lt!376416) lt!376828)))

(declare-fun b!830479 () Bool)

(declare-fun e!463032 () Bool)

(assert (=> b!830479 (= e!463031 e!463032)))

(declare-fun res!565567 () Bool)

(assert (=> b!830479 (=> res!565567 e!463032)))

(assert (=> b!830479 (= res!565567 (= (h!17069 (toList!4502 lt!376607)) lt!376416))))

(declare-fun b!830480 () Bool)

(assert (=> b!830480 (= e!463032 (contains!4188 (t!22300 (toList!4502 lt!376607)) lt!376416))))

(assert (= (and d!105369 res!565566) b!830479))

(assert (= (and b!830479 (not res!565567)) b!830480))

(declare-fun m!773451 () Bool)

(assert (=> d!105369 m!773451))

(declare-fun m!773453 () Bool)

(assert (=> d!105369 m!773453))

(declare-fun m!773455 () Bool)

(assert (=> b!830480 m!773455))

(assert (=> b!830136 d!105369))

(declare-fun d!105371 () Bool)

(declare-fun e!463033 () Bool)

(assert (=> d!105371 e!463033))

(declare-fun res!565568 () Bool)

(assert (=> d!105371 (=> res!565568 e!463033)))

(declare-fun lt!376832 () Bool)

(assert (=> d!105371 (= res!565568 (not lt!376832))))

(declare-fun lt!376831 () Bool)

(assert (=> d!105371 (= lt!376832 lt!376831)))

(declare-fun lt!376830 () Unit!28383)

(declare-fun e!463034 () Unit!28383)

(assert (=> d!105371 (= lt!376830 e!463034)))

(declare-fun c!89932 () Bool)

(assert (=> d!105371 (= c!89932 lt!376831)))

(assert (=> d!105371 (= lt!376831 (containsKey!399 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(assert (=> d!105371 (= (contains!4187 lt!376550 (_1!5091 lt!376416)) lt!376832)))

(declare-fun b!830481 () Bool)

(declare-fun lt!376829 () Unit!28383)

(assert (=> b!830481 (= e!463034 lt!376829)))

(assert (=> b!830481 (= lt!376829 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(assert (=> b!830481 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(declare-fun b!830482 () Bool)

(declare-fun Unit!28408 () Unit!28383)

(assert (=> b!830482 (= e!463034 Unit!28408)))

(declare-fun b!830483 () Bool)

(assert (=> b!830483 (= e!463033 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416))))))

(assert (= (and d!105371 c!89932) b!830481))

(assert (= (and d!105371 (not c!89932)) b!830482))

(assert (= (and d!105371 (not res!565568)) b!830483))

(declare-fun m!773457 () Bool)

(assert (=> d!105371 m!773457))

(declare-fun m!773459 () Bool)

(assert (=> b!830481 m!773459))

(assert (=> b!830481 m!772677))

(assert (=> b!830481 m!772677))

(declare-fun m!773461 () Bool)

(assert (=> b!830481 m!773461))

(assert (=> b!830483 m!772677))

(assert (=> b!830483 m!772677))

(assert (=> b!830483 m!773461))

(assert (=> d!105149 d!105371))

(declare-fun b!830484 () Bool)

(declare-fun e!463035 () Option!419)

(assert (=> b!830484 (= e!463035 (Some!418 (_2!5091 (h!17069 lt!376548))))))

(declare-fun b!830485 () Bool)

(declare-fun e!463036 () Option!419)

(assert (=> b!830485 (= e!463035 e!463036)))

(declare-fun c!89934 () Bool)

(assert (=> b!830485 (= c!89934 (and ((_ is Cons!15940) lt!376548) (not (= (_1!5091 (h!17069 lt!376548)) (_1!5091 lt!376416)))))))

(declare-fun b!830487 () Bool)

(assert (=> b!830487 (= e!463036 None!417)))

(declare-fun b!830486 () Bool)

(assert (=> b!830486 (= e!463036 (getValueByKey!413 (t!22300 lt!376548) (_1!5091 lt!376416)))))

(declare-fun d!105373 () Bool)

(declare-fun c!89933 () Bool)

(assert (=> d!105373 (= c!89933 (and ((_ is Cons!15940) lt!376548) (= (_1!5091 (h!17069 lt!376548)) (_1!5091 lt!376416))))))

(assert (=> d!105373 (= (getValueByKey!413 lt!376548 (_1!5091 lt!376416)) e!463035)))

(assert (= (and d!105373 c!89933) b!830484))

(assert (= (and d!105373 (not c!89933)) b!830485))

(assert (= (and b!830485 c!89934) b!830486))

(assert (= (and b!830485 (not c!89934)) b!830487))

(declare-fun m!773463 () Bool)

(assert (=> b!830486 m!773463))

(assert (=> d!105149 d!105373))

(declare-fun d!105375 () Bool)

(assert (=> d!105375 (= (getValueByKey!413 lt!376548 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(declare-fun lt!376833 () Unit!28383)

(assert (=> d!105375 (= lt!376833 (choose!1426 lt!376548 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun e!463037 () Bool)

(assert (=> d!105375 e!463037))

(declare-fun res!565569 () Bool)

(assert (=> d!105375 (=> (not res!565569) (not e!463037))))

(assert (=> d!105375 (= res!565569 (isStrictlySorted!437 lt!376548))))

(assert (=> d!105375 (= (lemmaContainsTupThenGetReturnValue!230 lt!376548 (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376833)))

(declare-fun b!830488 () Bool)

(declare-fun res!565570 () Bool)

(assert (=> b!830488 (=> (not res!565570) (not e!463037))))

(assert (=> b!830488 (= res!565570 (containsKey!399 lt!376548 (_1!5091 lt!376416)))))

(declare-fun b!830489 () Bool)

(assert (=> b!830489 (= e!463037 (contains!4188 lt!376548 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105375 res!565569) b!830488))

(assert (= (and b!830488 res!565570) b!830489))

(assert (=> d!105375 m!772671))

(declare-fun m!773465 () Bool)

(assert (=> d!105375 m!773465))

(declare-fun m!773467 () Bool)

(assert (=> d!105375 m!773467))

(declare-fun m!773469 () Bool)

(assert (=> b!830488 m!773469))

(declare-fun m!773471 () Bool)

(assert (=> b!830489 m!773471))

(assert (=> d!105149 d!105375))

(declare-fun b!830490 () Bool)

(declare-fun res!565571 () Bool)

(declare-fun e!463039 () Bool)

(assert (=> b!830490 (=> (not res!565571) (not e!463039))))

(declare-fun lt!376834 () List!15944)

(assert (=> b!830490 (= res!565571 (containsKey!399 lt!376834 (_1!5091 lt!376416)))))

(declare-fun e!463041 () List!15944)

(declare-fun c!89937 () Bool)

(declare-fun c!89935 () Bool)

(declare-fun b!830491 () Bool)

(assert (=> b!830491 (= e!463041 (ite c!89937 (t!22300 (toList!4502 lt!376414)) (ite c!89935 (Cons!15940 (h!17069 (toList!4502 lt!376414)) (t!22300 (toList!4502 lt!376414))) Nil!15941)))))

(declare-fun b!830492 () Bool)

(assert (=> b!830492 (= c!89935 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376416))))))

(declare-fun e!463038 () List!15944)

(declare-fun e!463040 () List!15944)

(assert (=> b!830492 (= e!463038 e!463040)))

(declare-fun b!830493 () Bool)

(assert (=> b!830493 (= e!463041 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376414)) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!830494 () Bool)

(declare-fun e!463042 () List!15944)

(declare-fun call!36257 () List!15944)

(assert (=> b!830494 (= e!463042 call!36257)))

(declare-fun b!830495 () Bool)

(declare-fun call!36259 () List!15944)

(assert (=> b!830495 (= e!463038 call!36259)))

(declare-fun b!830496 () Bool)

(declare-fun call!36258 () List!15944)

(assert (=> b!830496 (= e!463040 call!36258)))

(declare-fun bm!36254 () Bool)

(assert (=> bm!36254 (= call!36258 call!36259)))

(declare-fun b!830497 () Bool)

(assert (=> b!830497 (= e!463039 (contains!4188 lt!376834 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105377 () Bool)

(assert (=> d!105377 e!463039))

(declare-fun res!565572 () Bool)

(assert (=> d!105377 (=> (not res!565572) (not e!463039))))

(assert (=> d!105377 (= res!565572 (isStrictlySorted!437 lt!376834))))

(assert (=> d!105377 (= lt!376834 e!463042)))

(declare-fun c!89938 () Bool)

(assert (=> d!105377 (= c!89938 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376416))))))

(assert (=> d!105377 (isStrictlySorted!437 (toList!4502 lt!376414))))

(assert (=> d!105377 (= (insertStrictlySorted!269 (toList!4502 lt!376414) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376834)))

(declare-fun bm!36255 () Bool)

(assert (=> bm!36255 (= call!36259 call!36257)))

(declare-fun bm!36256 () Bool)

(assert (=> bm!36256 (= call!36257 ($colon$colon!535 e!463041 (ite c!89938 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!89936 () Bool)

(assert (=> bm!36256 (= c!89936 c!89938)))

(declare-fun b!830498 () Bool)

(assert (=> b!830498 (= e!463042 e!463038)))

(assert (=> b!830498 (= c!89937 (and ((_ is Cons!15940) (toList!4502 lt!376414)) (= (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 lt!376416))))))

(declare-fun b!830499 () Bool)

(assert (=> b!830499 (= e!463040 call!36258)))

(assert (= (and d!105377 c!89938) b!830494))

(assert (= (and d!105377 (not c!89938)) b!830498))

(assert (= (and b!830498 c!89937) b!830495))

(assert (= (and b!830498 (not c!89937)) b!830492))

(assert (= (and b!830492 c!89935) b!830499))

(assert (= (and b!830492 (not c!89935)) b!830496))

(assert (= (or b!830499 b!830496) bm!36254))

(assert (= (or b!830495 bm!36254) bm!36255))

(assert (= (or b!830494 bm!36255) bm!36256))

(assert (= (and bm!36256 c!89936) b!830493))

(assert (= (and bm!36256 (not c!89936)) b!830491))

(assert (= (and d!105377 res!565572) b!830490))

(assert (= (and b!830490 res!565571) b!830497))

(declare-fun m!773473 () Bool)

(assert (=> b!830490 m!773473))

(declare-fun m!773475 () Bool)

(assert (=> b!830497 m!773475))

(declare-fun m!773477 () Bool)

(assert (=> b!830493 m!773477))

(declare-fun m!773479 () Bool)

(assert (=> d!105377 m!773479))

(assert (=> d!105377 m!772831))

(declare-fun m!773481 () Bool)

(assert (=> bm!36256 m!773481))

(assert (=> d!105149 d!105377))

(assert (=> b!830130 d!105189))

(declare-fun d!105379 () Bool)

(declare-fun e!463043 () Bool)

(assert (=> d!105379 e!463043))

(declare-fun res!565573 () Bool)

(assert (=> d!105379 (=> res!565573 e!463043)))

(declare-fun lt!376838 () Bool)

(assert (=> d!105379 (= res!565573 (not lt!376838))))

(declare-fun lt!376837 () Bool)

(assert (=> d!105379 (= lt!376838 lt!376837)))

(declare-fun lt!376836 () Unit!28383)

(declare-fun e!463044 () Unit!28383)

(assert (=> d!105379 (= lt!376836 e!463044)))

(declare-fun c!89939 () Bool)

(assert (=> d!105379 (= c!89939 lt!376837)))

(assert (=> d!105379 (= lt!376837 (containsKey!399 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105379 (= (contains!4187 lt!376563 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376838)))

(declare-fun b!830500 () Bool)

(declare-fun lt!376835 () Unit!28383)

(assert (=> b!830500 (= e!463044 lt!376835)))

(assert (=> b!830500 (= lt!376835 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830500 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830501 () Bool)

(declare-fun Unit!28409 () Unit!28383)

(assert (=> b!830501 (= e!463044 Unit!28409)))

(declare-fun b!830502 () Bool)

(assert (=> b!830502 (= e!463043 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105379 c!89939) b!830500))

(assert (= (and d!105379 (not c!89939)) b!830501))

(assert (= (and d!105379 (not res!565573)) b!830502))

(assert (=> d!105379 m!772595))

(declare-fun m!773483 () Bool)

(assert (=> d!105379 m!773483))

(assert (=> b!830500 m!772595))

(declare-fun m!773485 () Bool)

(assert (=> b!830500 m!773485))

(assert (=> b!830500 m!772595))

(assert (=> b!830500 m!773005))

(assert (=> b!830500 m!773005))

(declare-fun m!773487 () Bool)

(assert (=> b!830500 m!773487))

(assert (=> b!830502 m!772595))

(assert (=> b!830502 m!773005))

(assert (=> b!830502 m!773005))

(assert (=> b!830502 m!773487))

(assert (=> b!830083 d!105379))

(declare-fun d!105381 () Bool)

(declare-fun e!463045 () Bool)

(assert (=> d!105381 e!463045))

(declare-fun res!565574 () Bool)

(assert (=> d!105381 (=> res!565574 e!463045)))

(declare-fun lt!376842 () Bool)

(assert (=> d!105381 (= res!565574 (not lt!376842))))

(declare-fun lt!376841 () Bool)

(assert (=> d!105381 (= lt!376842 lt!376841)))

(declare-fun lt!376840 () Unit!28383)

(declare-fun e!463046 () Unit!28383)

(assert (=> d!105381 (= lt!376840 e!463046)))

(declare-fun c!89940 () Bool)

(assert (=> d!105381 (= c!89940 lt!376841)))

(assert (=> d!105381 (= lt!376841 (containsKey!399 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(assert (=> d!105381 (= (contains!4187 lt!376546 (_1!5091 lt!376416)) lt!376842)))

(declare-fun b!830503 () Bool)

(declare-fun lt!376839 () Unit!28383)

(assert (=> b!830503 (= e!463046 lt!376839)))

(assert (=> b!830503 (= lt!376839 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(assert (=> b!830503 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(declare-fun b!830504 () Bool)

(declare-fun Unit!28410 () Unit!28383)

(assert (=> b!830504 (= e!463046 Unit!28410)))

(declare-fun b!830505 () Bool)

(assert (=> b!830505 (= e!463045 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416))))))

(assert (= (and d!105381 c!89940) b!830503))

(assert (= (and d!105381 (not c!89940)) b!830504))

(assert (= (and d!105381 (not res!565574)) b!830505))

(declare-fun m!773489 () Bool)

(assert (=> d!105381 m!773489))

(declare-fun m!773491 () Bool)

(assert (=> b!830503 m!773491))

(assert (=> b!830503 m!772665))

(assert (=> b!830503 m!772665))

(declare-fun m!773493 () Bool)

(assert (=> b!830503 m!773493))

(assert (=> b!830505 m!772665))

(assert (=> b!830505 m!772665))

(assert (=> b!830505 m!773493))

(assert (=> d!105147 d!105381))

(declare-fun b!830506 () Bool)

(declare-fun e!463047 () Option!419)

(assert (=> b!830506 (= e!463047 (Some!418 (_2!5091 (h!17069 lt!376544))))))

(declare-fun b!830507 () Bool)

(declare-fun e!463048 () Option!419)

(assert (=> b!830507 (= e!463047 e!463048)))

(declare-fun c!89942 () Bool)

(assert (=> b!830507 (= c!89942 (and ((_ is Cons!15940) lt!376544) (not (= (_1!5091 (h!17069 lt!376544)) (_1!5091 lt!376416)))))))

(declare-fun b!830509 () Bool)

(assert (=> b!830509 (= e!463048 None!417)))

(declare-fun b!830508 () Bool)

(assert (=> b!830508 (= e!463048 (getValueByKey!413 (t!22300 lt!376544) (_1!5091 lt!376416)))))

(declare-fun d!105383 () Bool)

(declare-fun c!89941 () Bool)

(assert (=> d!105383 (= c!89941 (and ((_ is Cons!15940) lt!376544) (= (_1!5091 (h!17069 lt!376544)) (_1!5091 lt!376416))))))

(assert (=> d!105383 (= (getValueByKey!413 lt!376544 (_1!5091 lt!376416)) e!463047)))

(assert (= (and d!105383 c!89941) b!830506))

(assert (= (and d!105383 (not c!89941)) b!830507))

(assert (= (and b!830507 c!89942) b!830508))

(assert (= (and b!830507 (not c!89942)) b!830509))

(declare-fun m!773495 () Bool)

(assert (=> b!830508 m!773495))

(assert (=> d!105147 d!105383))

(declare-fun d!105385 () Bool)

(assert (=> d!105385 (= (getValueByKey!413 lt!376544 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(declare-fun lt!376843 () Unit!28383)

(assert (=> d!105385 (= lt!376843 (choose!1426 lt!376544 (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun e!463049 () Bool)

(assert (=> d!105385 e!463049))

(declare-fun res!565575 () Bool)

(assert (=> d!105385 (=> (not res!565575) (not e!463049))))

(assert (=> d!105385 (= res!565575 (isStrictlySorted!437 lt!376544))))

(assert (=> d!105385 (= (lemmaContainsTupThenGetReturnValue!230 lt!376544 (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376843)))

(declare-fun b!830510 () Bool)

(declare-fun res!565576 () Bool)

(assert (=> b!830510 (=> (not res!565576) (not e!463049))))

(assert (=> b!830510 (= res!565576 (containsKey!399 lt!376544 (_1!5091 lt!376416)))))

(declare-fun b!830511 () Bool)

(assert (=> b!830511 (= e!463049 (contains!4188 lt!376544 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105385 res!565575) b!830510))

(assert (= (and b!830510 res!565576) b!830511))

(assert (=> d!105385 m!772659))

(declare-fun m!773497 () Bool)

(assert (=> d!105385 m!773497))

(declare-fun m!773499 () Bool)

(assert (=> d!105385 m!773499))

(declare-fun m!773501 () Bool)

(assert (=> b!830510 m!773501))

(declare-fun m!773503 () Bool)

(assert (=> b!830511 m!773503))

(assert (=> d!105147 d!105385))

(declare-fun b!830512 () Bool)

(declare-fun res!565577 () Bool)

(declare-fun e!463051 () Bool)

(assert (=> b!830512 (=> (not res!565577) (not e!463051))))

(declare-fun lt!376844 () List!15944)

(assert (=> b!830512 (= res!565577 (containsKey!399 lt!376844 (_1!5091 lt!376416)))))

(declare-fun c!89945 () Bool)

(declare-fun e!463053 () List!15944)

(declare-fun b!830513 () Bool)

(declare-fun c!89943 () Bool)

(assert (=> b!830513 (= e!463053 (ite c!89945 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))) (ite c!89943 (Cons!15940 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417))) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) Nil!15941)))))

(declare-fun b!830514 () Bool)

(assert (=> b!830514 (= c!89943 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376417))) (bvsgt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417)))) (_1!5091 lt!376416))))))

(declare-fun e!463050 () List!15944)

(declare-fun e!463052 () List!15944)

(assert (=> b!830514 (= e!463050 e!463052)))

(declare-fun b!830515 () Bool)

(assert (=> b!830515 (= e!463053 (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!830516 () Bool)

(declare-fun e!463054 () List!15944)

(declare-fun call!36260 () List!15944)

(assert (=> b!830516 (= e!463054 call!36260)))

(declare-fun b!830517 () Bool)

(declare-fun call!36262 () List!15944)

(assert (=> b!830517 (= e!463050 call!36262)))

(declare-fun b!830518 () Bool)

(declare-fun call!36261 () List!15944)

(assert (=> b!830518 (= e!463052 call!36261)))

(declare-fun bm!36257 () Bool)

(assert (=> bm!36257 (= call!36261 call!36262)))

(declare-fun b!830519 () Bool)

(assert (=> b!830519 (= e!463051 (contains!4188 lt!376844 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105387 () Bool)

(assert (=> d!105387 e!463051))

(declare-fun res!565578 () Bool)

(assert (=> d!105387 (=> (not res!565578) (not e!463051))))

(assert (=> d!105387 (= res!565578 (isStrictlySorted!437 lt!376844))))

(assert (=> d!105387 (= lt!376844 e!463054)))

(declare-fun c!89946 () Bool)

(assert (=> d!105387 (= c!89946 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376417))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417)))) (_1!5091 lt!376416))))))

(assert (=> d!105387 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376414 lt!376417)))))

(assert (=> d!105387 (= (insertStrictlySorted!269 (toList!4502 (+!2010 lt!376414 lt!376417)) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376844)))

(declare-fun bm!36258 () Bool)

(assert (=> bm!36258 (= call!36262 call!36260)))

(declare-fun bm!36259 () Bool)

(assert (=> bm!36259 (= call!36260 ($colon$colon!535 e!463053 (ite c!89946 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!89944 () Bool)

(assert (=> bm!36259 (= c!89944 c!89946)))

(declare-fun b!830520 () Bool)

(assert (=> b!830520 (= e!463054 e!463050)))

(assert (=> b!830520 (= c!89945 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376414 lt!376417))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417)))) (_1!5091 lt!376416))))))

(declare-fun b!830521 () Bool)

(assert (=> b!830521 (= e!463052 call!36261)))

(assert (= (and d!105387 c!89946) b!830516))

(assert (= (and d!105387 (not c!89946)) b!830520))

(assert (= (and b!830520 c!89945) b!830517))

(assert (= (and b!830520 (not c!89945)) b!830514))

(assert (= (and b!830514 c!89943) b!830521))

(assert (= (and b!830514 (not c!89943)) b!830518))

(assert (= (or b!830521 b!830518) bm!36257))

(assert (= (or b!830517 bm!36257) bm!36258))

(assert (= (or b!830516 bm!36258) bm!36259))

(assert (= (and bm!36259 c!89944) b!830515))

(assert (= (and bm!36259 (not c!89944)) b!830513))

(assert (= (and d!105387 res!565578) b!830512))

(assert (= (and b!830512 res!565577) b!830519))

(declare-fun m!773505 () Bool)

(assert (=> b!830512 m!773505))

(declare-fun m!773507 () Bool)

(assert (=> b!830519 m!773507))

(declare-fun m!773509 () Bool)

(assert (=> b!830515 m!773509))

(declare-fun m!773511 () Bool)

(assert (=> d!105387 m!773511))

(declare-fun m!773513 () Bool)

(assert (=> d!105387 m!773513))

(declare-fun m!773515 () Bool)

(assert (=> bm!36259 m!773515))

(assert (=> d!105147 d!105387))

(assert (=> b!830045 d!105189))

(assert (=> d!105151 d!105163))

(assert (=> bm!36225 d!105291))

(assert (=> b!830070 d!105189))

(declare-fun d!105389 () Bool)

(declare-fun e!463055 () Bool)

(assert (=> d!105389 e!463055))

(declare-fun res!565579 () Bool)

(assert (=> d!105389 (=> res!565579 e!463055)))

(declare-fun lt!376848 () Bool)

(assert (=> d!105389 (= res!565579 (not lt!376848))))

(declare-fun lt!376847 () Bool)

(assert (=> d!105389 (= lt!376848 lt!376847)))

(declare-fun lt!376846 () Unit!28383)

(declare-fun e!463056 () Unit!28383)

(assert (=> d!105389 (= lt!376846 e!463056)))

(declare-fun c!89947 () Bool)

(assert (=> d!105389 (= c!89947 lt!376847)))

(assert (=> d!105389 (= lt!376847 (containsKey!399 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105389 (= (contains!4187 lt!376517 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376848)))

(declare-fun b!830522 () Bool)

(declare-fun lt!376845 () Unit!28383)

(assert (=> b!830522 (= e!463056 lt!376845)))

(assert (=> b!830522 (= lt!376845 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830522 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830523 () Bool)

(declare-fun Unit!28411 () Unit!28383)

(assert (=> b!830523 (= e!463056 Unit!28411)))

(declare-fun b!830524 () Bool)

(assert (=> b!830524 (= e!463055 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105389 c!89947) b!830522))

(assert (= (and d!105389 (not c!89947)) b!830523))

(assert (= (and d!105389 (not res!565579)) b!830524))

(assert (=> d!105389 m!772595))

(declare-fun m!773517 () Bool)

(assert (=> d!105389 m!773517))

(assert (=> b!830522 m!772595))

(declare-fun m!773519 () Bool)

(assert (=> b!830522 m!773519))

(assert (=> b!830522 m!772595))

(assert (=> b!830522 m!773429))

(assert (=> b!830522 m!773429))

(declare-fun m!773521 () Bool)

(assert (=> b!830522 m!773521))

(assert (=> b!830524 m!772595))

(assert (=> b!830524 m!773429))

(assert (=> b!830524 m!773429))

(assert (=> b!830524 m!773521))

(assert (=> b!830048 d!105389))

(declare-fun d!105391 () Bool)

(declare-fun e!463057 () Bool)

(assert (=> d!105391 e!463057))

(declare-fun res!565580 () Bool)

(assert (=> d!105391 (=> res!565580 e!463057)))

(declare-fun lt!376852 () Bool)

(assert (=> d!105391 (= res!565580 (not lt!376852))))

(declare-fun lt!376851 () Bool)

(assert (=> d!105391 (= lt!376852 lt!376851)))

(declare-fun lt!376850 () Unit!28383)

(declare-fun e!463058 () Unit!28383)

(assert (=> d!105391 (= lt!376850 e!463058)))

(declare-fun c!89948 () Bool)

(assert (=> d!105391 (= c!89948 lt!376851)))

(assert (=> d!105391 (= lt!376851 (containsKey!399 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105391 (= (contains!4187 lt!376602 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376852)))

(declare-fun b!830525 () Bool)

(declare-fun lt!376849 () Unit!28383)

(assert (=> b!830525 (= e!463058 lt!376849)))

(assert (=> b!830525 (= lt!376849 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830525 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830526 () Bool)

(declare-fun Unit!28412 () Unit!28383)

(assert (=> b!830526 (= e!463058 Unit!28412)))

(declare-fun b!830527 () Bool)

(assert (=> b!830527 (= e!463057 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105391 c!89948) b!830525))

(assert (= (and d!105391 (not c!89948)) b!830526))

(assert (= (and d!105391 (not res!565580)) b!830527))

(declare-fun m!773523 () Bool)

(assert (=> d!105391 m!773523))

(declare-fun m!773525 () Bool)

(assert (=> b!830525 m!773525))

(declare-fun m!773527 () Bool)

(assert (=> b!830525 m!773527))

(assert (=> b!830525 m!773527))

(declare-fun m!773529 () Bool)

(assert (=> b!830525 m!773529))

(assert (=> b!830527 m!773527))

(assert (=> b!830527 m!773527))

(assert (=> b!830527 m!773529))

(assert (=> b!830132 d!105391))

(declare-fun d!105393 () Bool)

(declare-fun lt!376853 () Bool)

(assert (=> d!105393 (= lt!376853 (select (content!385 (toList!4502 lt!376611)) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463059 () Bool)

(assert (=> d!105393 (= lt!376853 e!463059)))

(declare-fun res!565581 () Bool)

(assert (=> d!105393 (=> (not res!565581) (not e!463059))))

(assert (=> d!105393 (= res!565581 ((_ is Cons!15940) (toList!4502 lt!376611)))))

(assert (=> d!105393 (= (contains!4188 (toList!4502 lt!376611) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376853)))

(declare-fun b!830528 () Bool)

(declare-fun e!463060 () Bool)

(assert (=> b!830528 (= e!463059 e!463060)))

(declare-fun res!565582 () Bool)

(assert (=> b!830528 (=> res!565582 e!463060)))

(assert (=> b!830528 (= res!565582 (= (h!17069 (toList!4502 lt!376611)) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!830529 () Bool)

(assert (=> b!830529 (= e!463060 (contains!4188 (t!22300 (toList!4502 lt!376611)) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105393 res!565581) b!830528))

(assert (= (and b!830528 (not res!565582)) b!830529))

(declare-fun m!773531 () Bool)

(assert (=> d!105393 m!773531))

(declare-fun m!773533 () Bool)

(assert (=> d!105393 m!773533))

(declare-fun m!773535 () Bool)

(assert (=> b!830529 m!773535))

(assert (=> b!830138 d!105393))

(assert (=> b!830122 d!105189))

(declare-fun mapIsEmpty!24470 () Bool)

(declare-fun mapRes!24470 () Bool)

(assert (=> mapIsEmpty!24470 mapRes!24470))

(declare-fun b!830531 () Bool)

(declare-fun e!463061 () Bool)

(assert (=> b!830531 (= e!463061 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24470 () Bool)

(declare-fun tp!47288 () Bool)

(declare-fun e!463062 () Bool)

(assert (=> mapNonEmpty!24470 (= mapRes!24470 (and tp!47288 e!463062))))

(declare-fun mapRest!24470 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapValue!24470 () ValueCell!7187)

(declare-fun mapKey!24470 () (_ BitVec 32))

(assert (=> mapNonEmpty!24470 (= mapRest!24469 (store mapRest!24470 mapKey!24470 mapValue!24470))))

(declare-fun b!830530 () Bool)

(assert (=> b!830530 (= e!463062 tp_is_empty!15205)))

(declare-fun condMapEmpty!24470 () Bool)

(declare-fun mapDefault!24470 () ValueCell!7187)

(assert (=> mapNonEmpty!24469 (= condMapEmpty!24470 (= mapRest!24469 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24470)))))

(assert (=> mapNonEmpty!24469 (= tp!47287 (and e!463061 mapRes!24470))))

(assert (= (and mapNonEmpty!24469 condMapEmpty!24470) mapIsEmpty!24470))

(assert (= (and mapNonEmpty!24469 (not condMapEmpty!24470)) mapNonEmpty!24470))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7187) mapValue!24470)) b!830530))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7187) mapDefault!24470)) b!830531))

(declare-fun m!773537 () Bool)

(assert (=> mapNonEmpty!24470 m!773537))

(declare-fun b_lambda!11361 () Bool)

(assert (= b_lambda!11353 (or (and start!71466 b_free!13495) b_lambda!11361)))

(declare-fun b_lambda!11363 () Bool)

(assert (= b_lambda!11355 (or (and start!71466 b_free!13495) b_lambda!11363)))

(declare-fun b_lambda!11365 () Bool)

(assert (= b_lambda!11357 (or (and start!71466 b_free!13495) b_lambda!11365)))

(declare-fun b_lambda!11367 () Bool)

(assert (= b_lambda!11359 (or (and start!71466 b_free!13495) b_lambda!11367)))

(check-sat (not d!105355) (not d!105243) (not b!830515) (not d!105201) (not d!105309) (not b!830180) (not b!830489) (not d!105195) (not bm!36259) (not b!830483) (not b!830308) (not b!830458) (not d!105205) (not d!105341) (not b!830420) tp_is_empty!15205 (not b!830338) b_and!22523 (not b!830399) (not b!830228) (not b!830238) (not d!105335) (not b!830473) (not b!830280) (not b!830401) (not d!105267) (not b_lambda!11363) (not b!830323) (not b!830317) (not b!830381) (not d!105339) (not d!105343) (not b!830247) (not b!830353) (not b!830375) (not d!105241) (not d!105251) (not b!830380) (not d!105289) (not b!830416) (not d!105197) (not b!830436) (not b!830363) (not b!830371) (not b_lambda!11349) (not b!830383) (not bm!36243) (not b!830525) (not b!830360) (not b!830450) (not b!830445) (not b!830529) (not b_lambda!11343) (not d!105287) (not d!105187) (not b!830481) (not b!830270) (not d!105217) (not d!105305) (not d!105313) (not b!830493) (not d!105295) (not d!105319) (not d!105353) (not d!105345) (not b!830263) (not b!830266) (not b!830442) (not d!105283) (not b!830404) (not b!830490) (not b!830354) (not b!830512) (not d!105193) (not b!830240) (not b!830378) (not d!105337) (not d!105271) (not d!105323) (not b!830480) (not b!830300) (not b_lambda!11347) (not d!105391) (not b!830430) (not d!105247) (not d!105351) (not b!830444) (not d!105269) (not b!830271) (not b!830193) (not d!105231) (not b!830403) (not b!830357) (not d!105367) (not d!105177) (not b!830293) (not d!105227) (not b!830393) (not b!830283) (not b!830348) (not d!105229) (not d!105253) (not b!830310) (not d!105263) (not d!105173) (not b!830427) (not d!105209) (not b!830446) (not d!105273) (not b!830347) (not d!105393) (not d!105261) (not d!105191) (not d!105285) (not b_lambda!11341) (not b!830372) (not d!105375) (not bm!36252) (not b!830423) (not b!830382) (not b!830431) (not b!830409) (not b!830505) (not b_lambda!11351) (not d!105275) (not b!830274) (not b!830392) (not b!830406) (not b!830449) (not d!105179) (not b_lambda!11365) (not bm!36244) (not b!830522) (not b!830312) (not b!830428) (not d!105381) (not b!830200) (not b!830224) (not d!105311) (not b!830264) (not b!830272) (not d!105377) (not b!830349) (not b!830412) (not d!105279) (not b!830182) (not b!830281) (not bm!36247) (not d!105301) (not b!830502) (not d!105299) (not d!105249) (not b!830434) (not d!105389) (not b!830367) (not b!830313) (not d!105233) (not b!830452) (not d!105387) (not b_next!13495) (not b!830440) (not d!105333) (not b_lambda!11345) (not b!830497) (not b!830453) (not b!830376) (not b!830315) (not d!105185) (not d!105369) (not b!830309) (not d!105371) (not b!830486) (not b!830461) (not b!830199) (not b!830388) (not d!105219) (not b!830488) (not b!830292) (not b!830467) (not b!830291) (not b!830437) (not d!105331) (not d!105307) (not d!105223) (not b!830231) (not bm!36256) (not b!830279) (not d!105385) (not bm!36253) (not b!830267) (not b!830250) (not b!830355) (not b!830400) (not b!830439) (not b!830269) (not b!830527) (not b!830296) (not b!830396) (not d!105327) (not b!830373) (not bm!36248) (not d!105277) (not d!105321) (not d!105291) (not b!830457) (not b!830426) (not b!830243) (not bm!36240) (not d!105221) (not d!105211) (not d!105265) (not b!830465) (not b!830265) (not b!830358) (not b!830394) (not b!830350) (not b!830511) (not b!830503) (not b!830236) (not b!830456) (not b_lambda!11361) (not bm!36249) (not b!830233) (not b!830524) (not b!830346) (not b!830424) (not d!105215) (not b!830454) (not b!830413) (not d!105293) (not d!105379) (not d!105237) (not b!830239) (not b!830276) (not d!105225) (not b!830258) (not b!830510) (not b!830469) (not d!105239) (not b!830273) (not b!830477) (not b!830286) (not b!830389) (not d!105207) (not b!830221) (not b!830500) (not d!105315) (not d!105245) (not d!105281) (not d!105317) (not b!830433) (not b_lambda!11367) (not d!105303) (not b!830252) (not d!105349) (not b!830508) (not d!105203) (not mapNonEmpty!24470) (not d!105325) (not b!830284) (not b!830289) (not b!830374) (not b!830352) (not b!830519) (not d!105347) (not d!105181) (not d!105329) (not b!830411))
(check-sat b_and!22523 (not b_next!13495))
(get-model)

(declare-fun d!105395 () Bool)

(declare-fun lt!376854 () Bool)

(assert (=> d!105395 (= lt!376854 (select (content!385 (t!22300 (toList!4502 lt!376546))) lt!376416))))

(declare-fun e!463063 () Bool)

(assert (=> d!105395 (= lt!376854 e!463063)))

(declare-fun res!565583 () Bool)

(assert (=> d!105395 (=> (not res!565583) (not e!463063))))

(assert (=> d!105395 (= res!565583 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376546))))))

(assert (=> d!105395 (= (contains!4188 (t!22300 (toList!4502 lt!376546)) lt!376416) lt!376854)))

(declare-fun b!830532 () Bool)

(declare-fun e!463064 () Bool)

(assert (=> b!830532 (= e!463063 e!463064)))

(declare-fun res!565584 () Bool)

(assert (=> b!830532 (=> res!565584 e!463064)))

(assert (=> b!830532 (= res!565584 (= (h!17069 (t!22300 (toList!4502 lt!376546))) lt!376416))))

(declare-fun b!830533 () Bool)

(assert (=> b!830533 (= e!463064 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376546))) lt!376416))))

(assert (= (and d!105395 res!565583) b!830532))

(assert (= (and b!830532 (not res!565584)) b!830533))

(declare-fun m!773539 () Bool)

(assert (=> d!105395 m!773539))

(declare-fun m!773541 () Bool)

(assert (=> d!105395 m!773541))

(declare-fun m!773543 () Bool)

(assert (=> b!830533 m!773543))

(assert (=> b!830312 d!105395))

(declare-fun d!105397 () Bool)

(declare-fun lt!376855 () Bool)

(assert (=> d!105397 (= lt!376855 (select (content!385 lt!376639) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun e!463065 () Bool)

(assert (=> d!105397 (= lt!376855 e!463065)))

(declare-fun res!565585 () Bool)

(assert (=> d!105397 (=> (not res!565585) (not e!463065))))

(assert (=> d!105397 (= res!565585 ((_ is Cons!15940) lt!376639))))

(assert (=> d!105397 (= (contains!4188 lt!376639 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) lt!376855)))

(declare-fun b!830534 () Bool)

(declare-fun e!463066 () Bool)

(assert (=> b!830534 (= e!463065 e!463066)))

(declare-fun res!565586 () Bool)

(assert (=> b!830534 (=> res!565586 e!463066)))

(assert (=> b!830534 (= res!565586 (= (h!17069 lt!376639) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun b!830535 () Bool)

(assert (=> b!830535 (= e!463066 (contains!4188 (t!22300 lt!376639) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105397 res!565585) b!830534))

(assert (= (and b!830534 (not res!565586)) b!830535))

(declare-fun m!773545 () Bool)

(assert (=> d!105397 m!773545))

(declare-fun m!773547 () Bool)

(assert (=> d!105397 m!773547))

(declare-fun m!773549 () Bool)

(assert (=> b!830535 m!773549))

(assert (=> b!830228 d!105397))

(declare-fun d!105399 () Bool)

(declare-fun lt!376856 () Bool)

(assert (=> d!105399 (= lt!376856 (select (content!385 lt!376834) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463067 () Bool)

(assert (=> d!105399 (= lt!376856 e!463067)))

(declare-fun res!565587 () Bool)

(assert (=> d!105399 (=> (not res!565587) (not e!463067))))

(assert (=> d!105399 (= res!565587 ((_ is Cons!15940) lt!376834))))

(assert (=> d!105399 (= (contains!4188 lt!376834 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!376856)))

(declare-fun b!830536 () Bool)

(declare-fun e!463068 () Bool)

(assert (=> b!830536 (= e!463067 e!463068)))

(declare-fun res!565588 () Bool)

(assert (=> b!830536 (=> res!565588 e!463068)))

(assert (=> b!830536 (= res!565588 (= (h!17069 lt!376834) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!830537 () Bool)

(assert (=> b!830537 (= e!463068 (contains!4188 (t!22300 lt!376834) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105399 res!565587) b!830536))

(assert (= (and b!830536 (not res!565588)) b!830537))

(declare-fun m!773551 () Bool)

(assert (=> d!105399 m!773551))

(declare-fun m!773553 () Bool)

(assert (=> d!105399 m!773553))

(declare-fun m!773555 () Bool)

(assert (=> b!830537 m!773555))

(assert (=> b!830497 d!105399))

(declare-fun lt!376857 () Bool)

(declare-fun d!105401 () Bool)

(assert (=> d!105401 (= lt!376857 (select (content!385 (toList!4502 lt!376708)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!463069 () Bool)

(assert (=> d!105401 (= lt!376857 e!463069)))

(declare-fun res!565589 () Bool)

(assert (=> d!105401 (=> (not res!565589) (not e!463069))))

(assert (=> d!105401 (= res!565589 ((_ is Cons!15940) (toList!4502 lt!376708)))))

(assert (=> d!105401 (= (contains!4188 (toList!4502 lt!376708) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376857)))

(declare-fun b!830538 () Bool)

(declare-fun e!463070 () Bool)

(assert (=> b!830538 (= e!463069 e!463070)))

(declare-fun res!565590 () Bool)

(assert (=> b!830538 (=> res!565590 e!463070)))

(assert (=> b!830538 (= res!565590 (= (h!17069 (toList!4502 lt!376708)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830539 () Bool)

(assert (=> b!830539 (= e!463070 (contains!4188 (t!22300 (toList!4502 lt!376708)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105401 res!565589) b!830538))

(assert (= (and b!830538 (not res!565590)) b!830539))

(declare-fun m!773557 () Bool)

(assert (=> d!105401 m!773557))

(declare-fun m!773559 () Bool)

(assert (=> d!105401 m!773559))

(declare-fun m!773561 () Bool)

(assert (=> b!830539 m!773561))

(assert (=> b!830347 d!105401))

(declare-fun b!830540 () Bool)

(declare-fun e!463071 () Bool)

(declare-fun e!463073 () Bool)

(assert (=> b!830540 (= e!463071 e!463073)))

(declare-fun c!89949 () Bool)

(assert (=> b!830540 (= c!89949 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!105403 () Bool)

(declare-fun res!565591 () Bool)

(assert (=> d!105403 (=> res!565591 e!463071)))

(assert (=> d!105403 (= res!565591 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105403 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463071)))

(declare-fun b!830541 () Bool)

(declare-fun call!36263 () Bool)

(assert (=> b!830541 (= e!463073 call!36263)))

(declare-fun b!830542 () Bool)

(declare-fun e!463072 () Bool)

(assert (=> b!830542 (= e!463073 e!463072)))

(declare-fun lt!376858 () (_ BitVec 64))

(assert (=> b!830542 (= lt!376858 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!376859 () Unit!28383)

(assert (=> b!830542 (= lt!376859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376858 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!830542 (arrayContainsKey!0 _keys!976 lt!376858 #b00000000000000000000000000000000)))

(declare-fun lt!376860 () Unit!28383)

(assert (=> b!830542 (= lt!376860 lt!376859)))

(declare-fun res!565592 () Bool)

(assert (=> b!830542 (= res!565592 (= (seekEntryOrOpen!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8740 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830542 (=> (not res!565592) (not e!463072))))

(declare-fun bm!36260 () Bool)

(assert (=> bm!36260 (= call!36263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!830543 () Bool)

(assert (=> b!830543 (= e!463072 call!36263)))

(assert (= (and d!105403 (not res!565591)) b!830540))

(assert (= (and b!830540 c!89949) b!830542))

(assert (= (and b!830540 (not c!89949)) b!830541))

(assert (= (and b!830542 res!565592) b!830543))

(assert (= (or b!830543 b!830541) bm!36260))

(declare-fun m!773563 () Bool)

(assert (=> b!830540 m!773563))

(assert (=> b!830540 m!773563))

(declare-fun m!773565 () Bool)

(assert (=> b!830540 m!773565))

(assert (=> b!830542 m!773563))

(declare-fun m!773567 () Bool)

(assert (=> b!830542 m!773567))

(declare-fun m!773569 () Bool)

(assert (=> b!830542 m!773569))

(assert (=> b!830542 m!773563))

(declare-fun m!773571 () Bool)

(assert (=> b!830542 m!773571))

(declare-fun m!773573 () Bool)

(assert (=> bm!36260 m!773573))

(assert (=> bm!36253 d!105403))

(declare-fun d!105405 () Bool)

(declare-fun isEmpty!661 (Option!419) Bool)

(assert (=> d!105405 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417)))))))

(declare-fun bs!23179 () Bool)

(assert (= bs!23179 d!105405))

(assert (=> bs!23179 m!772653))

(declare-fun m!773575 () Bool)

(assert (=> bs!23179 m!773575))

(assert (=> b!830406 d!105405))

(assert (=> b!830406 d!105357))

(assert (=> d!105319 d!105157))

(assert (=> d!105319 d!105155))

(declare-fun d!105407 () Bool)

(declare-fun e!463074 () Bool)

(assert (=> d!105407 e!463074))

(declare-fun res!565593 () Bool)

(assert (=> d!105407 (=> res!565593 e!463074)))

(declare-fun lt!376864 () Bool)

(assert (=> d!105407 (= res!565593 (not lt!376864))))

(declare-fun lt!376863 () Bool)

(assert (=> d!105407 (= lt!376864 lt!376863)))

(declare-fun lt!376862 () Unit!28383)

(declare-fun e!463075 () Unit!28383)

(assert (=> d!105407 (= lt!376862 e!463075)))

(declare-fun c!89950 () Bool)

(assert (=> d!105407 (= c!89950 lt!376863)))

(assert (=> d!105407 (= lt!376863 (containsKey!399 (toList!4502 lt!376762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105407 (= (contains!4187 lt!376762 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376864)))

(declare-fun b!830544 () Bool)

(declare-fun lt!376861 () Unit!28383)

(assert (=> b!830544 (= e!463075 lt!376861)))

(assert (=> b!830544 (= lt!376861 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830544 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830545 () Bool)

(declare-fun Unit!28413 () Unit!28383)

(assert (=> b!830545 (= e!463075 Unit!28413)))

(declare-fun b!830546 () Bool)

(assert (=> b!830546 (= e!463074 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105407 c!89950) b!830544))

(assert (= (and d!105407 (not c!89950)) b!830545))

(assert (= (and d!105407 (not res!565593)) b!830546))

(declare-fun m!773577 () Bool)

(assert (=> d!105407 m!773577))

(declare-fun m!773579 () Bool)

(assert (=> b!830544 m!773579))

(declare-fun m!773581 () Bool)

(assert (=> b!830544 m!773581))

(assert (=> b!830544 m!773581))

(declare-fun m!773583 () Bool)

(assert (=> b!830544 m!773583))

(assert (=> b!830546 m!773581))

(assert (=> b!830546 m!773581))

(assert (=> b!830546 m!773583))

(assert (=> d!105291 d!105407))

(assert (=> d!105291 d!105163))

(declare-fun d!105409 () Bool)

(assert (=> d!105409 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!376867 () Unit!28383)

(declare-fun choose!1430 (List!15944 (_ BitVec 64)) Unit!28383)

(assert (=> d!105409 (= lt!376867 (choose!1430 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463078 () Bool)

(assert (=> d!105409 e!463078))

(declare-fun res!565596 () Bool)

(assert (=> d!105409 (=> (not res!565596) (not e!463078))))

(assert (=> d!105409 (= res!565596 (isStrictlySorted!437 (toList!4502 lt!376563)))))

(assert (=> d!105409 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376867)))

(declare-fun b!830549 () Bool)

(assert (=> b!830549 (= e!463078 (containsKey!399 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105409 res!565596) b!830549))

(assert (=> d!105409 m!772595))

(assert (=> d!105409 m!773005))

(assert (=> d!105409 m!773005))

(assert (=> d!105409 m!773487))

(assert (=> d!105409 m!772595))

(declare-fun m!773585 () Bool)

(assert (=> d!105409 m!773585))

(declare-fun m!773587 () Bool)

(assert (=> d!105409 m!773587))

(assert (=> b!830549 m!772595))

(assert (=> b!830549 m!773483))

(assert (=> b!830500 d!105409))

(declare-fun d!105411 () Bool)

(assert (=> d!105411 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23180 () Bool)

(assert (= bs!23180 d!105411))

(assert (=> bs!23180 m!773005))

(declare-fun m!773589 () Bool)

(assert (=> bs!23180 m!773589))

(assert (=> b!830500 d!105411))

(declare-fun b!830550 () Bool)

(declare-fun e!463079 () Option!419)

(assert (=> b!830550 (= e!463079 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376563)))))))

(declare-fun b!830551 () Bool)

(declare-fun e!463080 () Option!419)

(assert (=> b!830551 (= e!463079 e!463080)))

(declare-fun c!89952 () Bool)

(assert (=> b!830551 (= c!89952 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376563))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!830553 () Bool)

(assert (=> b!830553 (= e!463080 None!417)))

(declare-fun b!830552 () Bool)

(assert (=> b!830552 (= e!463080 (getValueByKey!413 (t!22300 (toList!4502 lt!376563)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105413 () Bool)

(declare-fun c!89951 () Bool)

(assert (=> d!105413 (= c!89951 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105413 (= (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463079)))

(assert (= (and d!105413 c!89951) b!830550))

(assert (= (and d!105413 (not c!89951)) b!830551))

(assert (= (and b!830551 c!89952) b!830552))

(assert (= (and b!830551 (not c!89952)) b!830553))

(assert (=> b!830552 m!772595))

(declare-fun m!773591 () Bool)

(assert (=> b!830552 m!773591))

(assert (=> b!830500 d!105413))

(declare-fun d!105415 () Bool)

(assert (=> d!105415 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376868 () Unit!28383)

(assert (=> d!105415 (= lt!376868 (choose!1430 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463081 () Bool)

(assert (=> d!105415 e!463081))

(declare-fun res!565597 () Bool)

(assert (=> d!105415 (=> (not res!565597) (not e!463081))))

(assert (=> d!105415 (= res!565597 (isStrictlySorted!437 (toList!4502 lt!376517)))))

(assert (=> d!105415 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000) lt!376868)))

(declare-fun b!830554 () Bool)

(assert (=> b!830554 (= e!463081 (containsKey!399 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105415 res!565597) b!830554))

(assert (=> d!105415 m!772917))

(assert (=> d!105415 m!772917))

(assert (=> d!105415 m!773309))

(declare-fun m!773593 () Bool)

(assert (=> d!105415 m!773593))

(declare-fun m!773595 () Bool)

(assert (=> d!105415 m!773595))

(assert (=> b!830554 m!773305))

(assert (=> b!830434 d!105415))

(declare-fun d!105417 () Bool)

(assert (=> d!105417 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23181 () Bool)

(assert (= bs!23181 d!105417))

(assert (=> bs!23181 m!772917))

(declare-fun m!773597 () Bool)

(assert (=> bs!23181 m!773597))

(assert (=> b!830434 d!105417))

(declare-fun b!830555 () Bool)

(declare-fun e!463082 () Option!419)

(assert (=> b!830555 (= e!463082 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376517)))))))

(declare-fun b!830556 () Bool)

(declare-fun e!463083 () Option!419)

(assert (=> b!830556 (= e!463082 e!463083)))

(declare-fun c!89954 () Bool)

(assert (=> b!830556 (= c!89954 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830558 () Bool)

(assert (=> b!830558 (= e!463083 None!417)))

(declare-fun b!830557 () Bool)

(assert (=> b!830557 (= e!463083 (getValueByKey!413 (t!22300 (toList!4502 lt!376517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105419 () Bool)

(declare-fun c!89953 () Bool)

(assert (=> d!105419 (= c!89953 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105419 (= (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000) e!463082)))

(assert (= (and d!105419 c!89953) b!830555))

(assert (= (and d!105419 (not c!89953)) b!830556))

(assert (= (and b!830556 c!89954) b!830557))

(assert (= (and b!830556 (not c!89954)) b!830558))

(declare-fun m!773599 () Bool)

(assert (=> b!830557 m!773599))

(assert (=> b!830434 d!105419))

(declare-fun b!830559 () Bool)

(declare-fun res!565598 () Bool)

(declare-fun e!463085 () Bool)

(assert (=> b!830559 (=> (not res!565598) (not e!463085))))

(declare-fun lt!376869 () List!15944)

(assert (=> b!830559 (= res!565598 (containsKey!399 lt!376869 (_1!5091 lt!376416)))))

(declare-fun e!463087 () List!15944)

(declare-fun b!830560 () Bool)

(declare-fun c!89957 () Bool)

(declare-fun c!89955 () Bool)

(assert (=> b!830560 (= e!463087 (ite c!89957 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (ite c!89955 (Cons!15940 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))) Nil!15941)))))

(declare-fun b!830561 () Bool)

(assert (=> b!830561 (= c!89955 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))) (_1!5091 lt!376416))))))

(declare-fun e!463084 () List!15944)

(declare-fun e!463086 () List!15944)

(assert (=> b!830561 (= e!463084 e!463086)))

(declare-fun b!830562 () Bool)

(assert (=> b!830562 (= e!463087 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!830563 () Bool)

(declare-fun e!463088 () List!15944)

(declare-fun call!36264 () List!15944)

(assert (=> b!830563 (= e!463088 call!36264)))

(declare-fun b!830564 () Bool)

(declare-fun call!36266 () List!15944)

(assert (=> b!830564 (= e!463084 call!36266)))

(declare-fun b!830565 () Bool)

(declare-fun call!36265 () List!15944)

(assert (=> b!830565 (= e!463086 call!36265)))

(declare-fun bm!36261 () Bool)

(assert (=> bm!36261 (= call!36265 call!36266)))

(declare-fun b!830566 () Bool)

(assert (=> b!830566 (= e!463085 (contains!4188 lt!376869 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105421 () Bool)

(assert (=> d!105421 e!463085))

(declare-fun res!565599 () Bool)

(assert (=> d!105421 (=> (not res!565599) (not e!463085))))

(assert (=> d!105421 (= res!565599 (isStrictlySorted!437 lt!376869))))

(assert (=> d!105421 (= lt!376869 e!463088)))

(declare-fun c!89958 () Bool)

(assert (=> d!105421 (= c!89958 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))) (_1!5091 lt!376416))))))

(assert (=> d!105421 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))))

(assert (=> d!105421 (= (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376869)))

(declare-fun bm!36262 () Bool)

(assert (=> bm!36262 (= call!36266 call!36264)))

(declare-fun bm!36263 () Bool)

(assert (=> bm!36263 (= call!36264 ($colon$colon!535 e!463087 (ite c!89958 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!89956 () Bool)

(assert (=> bm!36263 (= c!89956 c!89958)))

(declare-fun b!830567 () Bool)

(assert (=> b!830567 (= e!463088 e!463084)))

(assert (=> b!830567 (= c!89957 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))) (_1!5091 lt!376416))))))

(declare-fun b!830568 () Bool)

(assert (=> b!830568 (= e!463086 call!36265)))

(assert (= (and d!105421 c!89958) b!830563))

(assert (= (and d!105421 (not c!89958)) b!830567))

(assert (= (and b!830567 c!89957) b!830564))

(assert (= (and b!830567 (not c!89957)) b!830561))

(assert (= (and b!830561 c!89955) b!830568))

(assert (= (and b!830561 (not c!89955)) b!830565))

(assert (= (or b!830568 b!830565) bm!36261))

(assert (= (or b!830564 bm!36261) bm!36262))

(assert (= (or b!830563 bm!36262) bm!36263))

(assert (= (and bm!36263 c!89956) b!830562))

(assert (= (and bm!36263 (not c!89956)) b!830560))

(assert (= (and d!105421 res!565599) b!830559))

(assert (= (and b!830559 res!565598) b!830566))

(declare-fun m!773601 () Bool)

(assert (=> b!830559 m!773601))

(declare-fun m!773603 () Bool)

(assert (=> b!830566 m!773603))

(declare-fun m!773605 () Bool)

(assert (=> b!830562 m!773605))

(declare-fun m!773607 () Bool)

(assert (=> d!105421 m!773607))

(declare-fun m!773609 () Bool)

(assert (=> d!105421 m!773609))

(declare-fun m!773611 () Bool)

(assert (=> bm!36263 m!773611))

(assert (=> b!830515 d!105421))

(declare-fun d!105423 () Bool)

(assert (=> d!105423 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23182 () Bool)

(assert (= bs!23182 d!105423))

(assert (=> bs!23182 m!773229))

(declare-fun m!773613 () Bool)

(assert (=> bs!23182 m!773613))

(assert (=> b!830442 d!105423))

(declare-fun b!830569 () Bool)

(declare-fun e!463089 () Option!419)

(assert (=> b!830569 (= e!463089 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376595)))))))

(declare-fun b!830570 () Bool)

(declare-fun e!463090 () Option!419)

(assert (=> b!830570 (= e!463089 e!463090)))

(declare-fun c!89960 () Bool)

(assert (=> b!830570 (= c!89960 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376595))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!830572 () Bool)

(assert (=> b!830572 (= e!463090 None!417)))

(declare-fun b!830571 () Bool)

(assert (=> b!830571 (= e!463090 (getValueByKey!413 (t!22300 (toList!4502 lt!376595)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105425 () Bool)

(declare-fun c!89959 () Bool)

(assert (=> d!105425 (= c!89959 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105425 (= (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463089)))

(assert (= (and d!105425 c!89959) b!830569))

(assert (= (and d!105425 (not c!89959)) b!830570))

(assert (= (and b!830570 c!89960) b!830571))

(assert (= (and b!830570 (not c!89960)) b!830572))

(assert (=> b!830571 m!772595))

(declare-fun m!773615 () Bool)

(assert (=> b!830571 m!773615))

(assert (=> b!830442 d!105425))

(assert (=> d!105305 d!105309))

(assert (=> d!105305 d!105303))

(declare-fun d!105427 () Bool)

(assert (=> d!105427 (not (contains!4187 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)) lt!376594))))

(assert (=> d!105427 true))

(declare-fun _$36!343 () Unit!28383)

(assert (=> d!105427 (= (choose!1427 lt!376592 lt!376593 lt!376591 lt!376594) _$36!343)))

(declare-fun bs!23183 () Bool)

(assert (= bs!23183 d!105427))

(assert (=> bs!23183 m!772741))

(assert (=> bs!23183 m!772741))

(assert (=> bs!23183 m!772745))

(assert (=> d!105305 d!105427))

(declare-fun d!105429 () Bool)

(declare-fun e!463091 () Bool)

(assert (=> d!105429 e!463091))

(declare-fun res!565600 () Bool)

(assert (=> d!105429 (=> res!565600 e!463091)))

(declare-fun lt!376873 () Bool)

(assert (=> d!105429 (= res!565600 (not lt!376873))))

(declare-fun lt!376872 () Bool)

(assert (=> d!105429 (= lt!376873 lt!376872)))

(declare-fun lt!376871 () Unit!28383)

(declare-fun e!463092 () Unit!28383)

(assert (=> d!105429 (= lt!376871 e!463092)))

(declare-fun c!89961 () Bool)

(assert (=> d!105429 (= c!89961 lt!376872)))

(assert (=> d!105429 (= lt!376872 (containsKey!399 (toList!4502 lt!376592) lt!376594))))

(assert (=> d!105429 (= (contains!4187 lt!376592 lt!376594) lt!376873)))

(declare-fun b!830574 () Bool)

(declare-fun lt!376870 () Unit!28383)

(assert (=> b!830574 (= e!463092 lt!376870)))

(assert (=> b!830574 (= lt!376870 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376592) lt!376594))))

(assert (=> b!830574 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376592) lt!376594))))

(declare-fun b!830575 () Bool)

(declare-fun Unit!28414 () Unit!28383)

(assert (=> b!830575 (= e!463092 Unit!28414)))

(declare-fun b!830576 () Bool)

(assert (=> b!830576 (= e!463091 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376592) lt!376594)))))

(assert (= (and d!105429 c!89961) b!830574))

(assert (= (and d!105429 (not c!89961)) b!830575))

(assert (= (and d!105429 (not res!565600)) b!830576))

(declare-fun m!773617 () Bool)

(assert (=> d!105429 m!773617))

(declare-fun m!773619 () Bool)

(assert (=> b!830574 m!773619))

(declare-fun m!773621 () Bool)

(assert (=> b!830574 m!773621))

(assert (=> b!830574 m!773621))

(declare-fun m!773623 () Bool)

(assert (=> b!830574 m!773623))

(assert (=> b!830576 m!773621))

(assert (=> b!830576 m!773621))

(assert (=> b!830576 m!773623))

(assert (=> d!105305 d!105429))

(declare-fun d!105431 () Bool)

(assert (=> d!105431 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(declare-fun lt!376874 () Unit!28383)

(assert (=> d!105431 (= lt!376874 (choose!1430 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(declare-fun e!463093 () Bool)

(assert (=> d!105431 e!463093))

(declare-fun res!565601 () Bool)

(assert (=> d!105431 (=> (not res!565601) (not e!463093))))

(assert (=> d!105431 (= res!565601 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (=> d!105431 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594) lt!376874)))

(declare-fun b!830577 () Bool)

(assert (=> b!830577 (= e!463093 (containsKey!399 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))

(assert (= (and d!105431 res!565601) b!830577))

(assert (=> d!105431 m!773293))

(assert (=> d!105431 m!773293))

(assert (=> d!105431 m!773295))

(declare-fun m!773625 () Bool)

(assert (=> d!105431 m!773625))

(declare-fun m!773627 () Bool)

(assert (=> d!105431 m!773627))

(assert (=> b!830577 m!773289))

(assert (=> b!830428 d!105431))

(declare-fun d!105433 () Bool)

(assert (=> d!105433 (= (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594))))))

(declare-fun bs!23184 () Bool)

(assert (= bs!23184 d!105433))

(assert (=> bs!23184 m!773293))

(declare-fun m!773629 () Bool)

(assert (=> bs!23184 m!773629))

(assert (=> b!830428 d!105433))

(declare-fun e!463094 () Option!419)

(declare-fun b!830578 () Bool)

(assert (=> b!830578 (= e!463094 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))))))))

(declare-fun b!830579 () Bool)

(declare-fun e!463095 () Option!419)

(assert (=> b!830579 (= e!463094 e!463095)))

(declare-fun c!89963 () Bool)

(assert (=> b!830579 (= c!89963 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) lt!376594))))))

(declare-fun b!830581 () Bool)

(assert (=> b!830581 (= e!463095 None!417)))

(declare-fun b!830580 () Bool)

(assert (=> b!830580 (= e!463095 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) lt!376594))))

(declare-fun d!105435 () Bool)

(declare-fun c!89962 () Bool)

(assert (=> d!105435 (= c!89962 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) lt!376594)))))

(assert (=> d!105435 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594) e!463094)))

(assert (= (and d!105435 c!89962) b!830578))

(assert (= (and d!105435 (not c!89962)) b!830579))

(assert (= (and b!830579 c!89963) b!830580))

(assert (= (and b!830579 (not c!89963)) b!830581))

(declare-fun m!773631 () Bool)

(assert (=> b!830580 m!773631))

(assert (=> b!830428 d!105435))

(declare-fun b!830582 () Bool)

(declare-fun res!565602 () Bool)

(declare-fun e!463097 () Bool)

(assert (=> b!830582 (=> (not res!565602) (not e!463097))))

(declare-fun lt!376875 () List!15944)

(assert (=> b!830582 (= res!565602 (containsKey!399 lt!376875 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun c!89966 () Bool)

(declare-fun b!830583 () Bool)

(declare-fun e!463099 () List!15944)

(declare-fun c!89964 () Bool)

(assert (=> b!830583 (= e!463099 (ite c!89966 (t!22300 (t!22300 (toList!4502 lt!376419))) (ite c!89964 (Cons!15940 (h!17069 (t!22300 (toList!4502 lt!376419))) (t!22300 (t!22300 (toList!4502 lt!376419)))) Nil!15941)))))

(declare-fun b!830584 () Bool)

(assert (=> b!830584 (= c!89964 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376419))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376419)))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463096 () List!15944)

(declare-fun e!463098 () List!15944)

(assert (=> b!830584 (= e!463096 e!463098)))

(declare-fun b!830585 () Bool)

(assert (=> b!830585 (= e!463099 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 lt!376419))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!830586 () Bool)

(declare-fun e!463100 () List!15944)

(declare-fun call!36267 () List!15944)

(assert (=> b!830586 (= e!463100 call!36267)))

(declare-fun b!830587 () Bool)

(declare-fun call!36269 () List!15944)

(assert (=> b!830587 (= e!463096 call!36269)))

(declare-fun b!830588 () Bool)

(declare-fun call!36268 () List!15944)

(assert (=> b!830588 (= e!463098 call!36268)))

(declare-fun bm!36264 () Bool)

(assert (=> bm!36264 (= call!36268 call!36269)))

(declare-fun b!830589 () Bool)

(assert (=> b!830589 (= e!463097 (contains!4188 lt!376875 (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun d!105437 () Bool)

(assert (=> d!105437 e!463097))

(declare-fun res!565603 () Bool)

(assert (=> d!105437 (=> (not res!565603) (not e!463097))))

(assert (=> d!105437 (= res!565603 (isStrictlySorted!437 lt!376875))))

(assert (=> d!105437 (= lt!376875 e!463100)))

(declare-fun c!89967 () Bool)

(assert (=> d!105437 (= c!89967 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376419))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376419)))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105437 (isStrictlySorted!437 (t!22300 (toList!4502 lt!376419)))))

(assert (=> d!105437 (= (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376419)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!376875)))

(declare-fun bm!36265 () Bool)

(assert (=> bm!36265 (= call!36269 call!36267)))

(declare-fun bm!36266 () Bool)

(assert (=> bm!36266 (= call!36267 ($colon$colon!535 e!463099 (ite c!89967 (h!17069 (t!22300 (toList!4502 lt!376419))) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!89965 () Bool)

(assert (=> bm!36266 (= c!89965 c!89967)))

(declare-fun b!830590 () Bool)

(assert (=> b!830590 (= e!463100 e!463096)))

(assert (=> b!830590 (= c!89966 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376419))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376419)))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830591 () Bool)

(assert (=> b!830591 (= e!463098 call!36268)))

(assert (= (and d!105437 c!89967) b!830586))

(assert (= (and d!105437 (not c!89967)) b!830590))

(assert (= (and b!830590 c!89966) b!830587))

(assert (= (and b!830590 (not c!89966)) b!830584))

(assert (= (and b!830584 c!89964) b!830591))

(assert (= (and b!830584 (not c!89964)) b!830588))

(assert (= (or b!830591 b!830588) bm!36264))

(assert (= (or b!830587 bm!36264) bm!36265))

(assert (= (or b!830586 bm!36265) bm!36266))

(assert (= (and bm!36266 c!89965) b!830585))

(assert (= (and bm!36266 (not c!89965)) b!830583))

(assert (= (and d!105437 res!565603) b!830582))

(assert (= (and b!830582 res!565602) b!830589))

(declare-fun m!773633 () Bool)

(assert (=> b!830582 m!773633))

(declare-fun m!773635 () Bool)

(assert (=> b!830589 m!773635))

(declare-fun m!773637 () Bool)

(assert (=> b!830585 m!773637))

(declare-fun m!773639 () Bool)

(assert (=> d!105437 m!773639))

(declare-fun m!773641 () Bool)

(assert (=> d!105437 m!773641))

(declare-fun m!773643 () Bool)

(assert (=> bm!36266 m!773643))

(assert (=> b!830243 d!105437))

(assert (=> d!105177 d!105175))

(declare-fun d!105439 () Bool)

(assert (=> d!105439 (= (getValueByKey!413 lt!376536 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(assert (=> d!105439 true))

(declare-fun _$22!568 () Unit!28383)

(assert (=> d!105439 (= (choose!1426 lt!376536 (_1!5091 lt!376417) (_2!5091 lt!376417)) _$22!568)))

(declare-fun bs!23185 () Bool)

(assert (= bs!23185 d!105439))

(assert (=> bs!23185 m!772635))

(assert (=> d!105177 d!105439))

(declare-fun d!105441 () Bool)

(declare-fun res!565608 () Bool)

(declare-fun e!463105 () Bool)

(assert (=> d!105441 (=> res!565608 e!463105)))

(assert (=> d!105441 (= res!565608 (or ((_ is Nil!15941) lt!376536) ((_ is Nil!15941) (t!22300 lt!376536))))))

(assert (=> d!105441 (= (isStrictlySorted!437 lt!376536) e!463105)))

(declare-fun b!830596 () Bool)

(declare-fun e!463106 () Bool)

(assert (=> b!830596 (= e!463105 e!463106)))

(declare-fun res!565609 () Bool)

(assert (=> b!830596 (=> (not res!565609) (not e!463106))))

(assert (=> b!830596 (= res!565609 (bvslt (_1!5091 (h!17069 lt!376536)) (_1!5091 (h!17069 (t!22300 lt!376536)))))))

(declare-fun b!830597 () Bool)

(assert (=> b!830597 (= e!463106 (isStrictlySorted!437 (t!22300 lt!376536)))))

(assert (= (and d!105441 (not res!565608)) b!830596))

(assert (= (and b!830596 res!565609) b!830597))

(declare-fun m!773645 () Bool)

(assert (=> b!830597 m!773645))

(assert (=> d!105177 d!105441))

(declare-fun d!105443 () Bool)

(assert (=> d!105443 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))) lt!376507)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))) lt!376507)))))

(assert (=> d!105283 d!105443))

(declare-fun b!830598 () Bool)

(declare-fun e!463107 () Option!419)

(assert (=> b!830598 (= e!463107 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)))))))))

(declare-fun b!830599 () Bool)

(declare-fun e!463108 () Option!419)

(assert (=> b!830599 (= e!463107 e!463108)))

(declare-fun c!89969 () Bool)

(assert (=> b!830599 (= c!89969 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))))) lt!376507))))))

(declare-fun b!830601 () Bool)

(assert (=> b!830601 (= e!463108 None!417)))

(declare-fun b!830600 () Bool)

(assert (=> b!830600 (= e!463108 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)))) lt!376507))))

(declare-fun d!105445 () Bool)

(declare-fun c!89968 () Bool)

(assert (=> d!105445 (= c!89968 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))))) lt!376507)))))

(assert (=> d!105445 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754))) lt!376507) e!463107)))

(assert (= (and d!105445 c!89968) b!830598))

(assert (= (and d!105445 (not c!89968)) b!830599))

(assert (= (and b!830599 c!89969) b!830600))

(assert (= (and b!830599 (not c!89969)) b!830601))

(declare-fun m!773647 () Bool)

(assert (=> b!830600 m!773647))

(assert (=> d!105283 d!105445))

(declare-fun d!105447 () Bool)

(assert (=> d!105447 (= (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830279 d!105447))

(declare-fun d!105449 () Bool)

(assert (=> d!105449 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(declare-fun lt!376876 () Unit!28383)

(assert (=> d!105449 (= lt!376876 (choose!1430 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(declare-fun e!463109 () Bool)

(assert (=> d!105449 e!463109))

(declare-fun res!565610 () Bool)

(assert (=> d!105449 (=> (not res!565610) (not e!463109))))

(assert (=> d!105449 (= res!565610 (isStrictlySorted!437 (toList!4502 lt!376538)))))

(assert (=> d!105449 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376538) (_1!5091 lt!376417)) lt!376876)))

(declare-fun b!830602 () Bool)

(assert (=> b!830602 (= e!463109 (containsKey!399 (toList!4502 lt!376538) (_1!5091 lt!376417)))))

(assert (= (and d!105449 res!565610) b!830602))

(assert (=> d!105449 m!772641))

(assert (=> d!105449 m!772641))

(assert (=> d!105449 m!772811))

(declare-fun m!773649 () Bool)

(assert (=> d!105449 m!773649))

(declare-fun m!773651 () Bool)

(assert (=> d!105449 m!773651))

(assert (=> b!830602 m!772807))

(assert (=> b!830180 d!105449))

(declare-fun d!105451 () Bool)

(assert (=> d!105451 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376538) (_1!5091 lt!376417)))))))

(declare-fun bs!23186 () Bool)

(assert (= bs!23186 d!105451))

(assert (=> bs!23186 m!772641))

(declare-fun m!773653 () Bool)

(assert (=> bs!23186 m!773653))

(assert (=> b!830180 d!105451))

(assert (=> b!830180 d!105359))

(declare-fun d!105453 () Bool)

(declare-fun e!463110 () Bool)

(assert (=> d!105453 e!463110))

(declare-fun res!565611 () Bool)

(assert (=> d!105453 (=> res!565611 e!463110)))

(declare-fun lt!376880 () Bool)

(assert (=> d!105453 (= res!565611 (not lt!376880))))

(declare-fun lt!376879 () Bool)

(assert (=> d!105453 (= lt!376880 lt!376879)))

(declare-fun lt!376878 () Unit!28383)

(declare-fun e!463111 () Unit!28383)

(assert (=> d!105453 (= lt!376878 e!463111)))

(declare-fun c!89970 () Bool)

(assert (=> d!105453 (= c!89970 lt!376879)))

(assert (=> d!105453 (= lt!376879 (containsKey!399 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105453 (= (contains!4187 lt!376708 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376880)))

(declare-fun b!830603 () Bool)

(declare-fun lt!376877 () Unit!28383)

(assert (=> b!830603 (= e!463111 lt!376877)))

(assert (=> b!830603 (= lt!376877 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!830603 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830604 () Bool)

(declare-fun Unit!28415 () Unit!28383)

(assert (=> b!830604 (= e!463111 Unit!28415)))

(declare-fun b!830605 () Bool)

(assert (=> b!830605 (= e!463110 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105453 c!89970) b!830603))

(assert (= (and d!105453 (not c!89970)) b!830604))

(assert (= (and d!105453 (not res!565611)) b!830605))

(declare-fun m!773655 () Bool)

(assert (=> d!105453 m!773655))

(declare-fun m!773657 () Bool)

(assert (=> b!830603 m!773657))

(assert (=> b!830603 m!773053))

(assert (=> b!830603 m!773053))

(declare-fun m!773659 () Bool)

(assert (=> b!830603 m!773659))

(assert (=> b!830605 m!773053))

(assert (=> b!830605 m!773053))

(assert (=> b!830605 m!773659))

(assert (=> d!105241 d!105453))

(declare-fun b!830606 () Bool)

(declare-fun e!463112 () Option!419)

(assert (=> b!830606 (= e!463112 (Some!418 (_2!5091 (h!17069 lt!376706))))))

(declare-fun b!830607 () Bool)

(declare-fun e!463113 () Option!419)

(assert (=> b!830607 (= e!463112 e!463113)))

(declare-fun c!89972 () Bool)

(assert (=> b!830607 (= c!89972 (and ((_ is Cons!15940) lt!376706) (not (= (_1!5091 (h!17069 lt!376706)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830609 () Bool)

(assert (=> b!830609 (= e!463113 None!417)))

(declare-fun b!830608 () Bool)

(assert (=> b!830608 (= e!463113 (getValueByKey!413 (t!22300 lt!376706) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!89971 () Bool)

(declare-fun d!105455 () Bool)

(assert (=> d!105455 (= c!89971 (and ((_ is Cons!15940) lt!376706) (= (_1!5091 (h!17069 lt!376706)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105455 (= (getValueByKey!413 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463112)))

(assert (= (and d!105455 c!89971) b!830606))

(assert (= (and d!105455 (not c!89971)) b!830607))

(assert (= (and b!830607 c!89972) b!830608))

(assert (= (and b!830607 (not c!89972)) b!830609))

(declare-fun m!773661 () Bool)

(assert (=> b!830608 m!773661))

(assert (=> d!105241 d!105455))

(declare-fun d!105457 () Bool)

(assert (=> d!105457 (= (getValueByKey!413 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376881 () Unit!28383)

(assert (=> d!105457 (= lt!376881 (choose!1426 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463114 () Bool)

(assert (=> d!105457 e!463114))

(declare-fun res!565612 () Bool)

(assert (=> d!105457 (=> (not res!565612) (not e!463114))))

(assert (=> d!105457 (= res!565612 (isStrictlySorted!437 lt!376706))))

(assert (=> d!105457 (= (lemmaContainsTupThenGetReturnValue!230 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376881)))

(declare-fun b!830610 () Bool)

(declare-fun res!565613 () Bool)

(assert (=> b!830610 (=> (not res!565613) (not e!463114))))

(assert (=> b!830610 (= res!565613 (containsKey!399 lt!376706 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830611 () Bool)

(assert (=> b!830611 (= e!463114 (contains!4188 lt!376706 (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105457 res!565612) b!830610))

(assert (= (and b!830610 res!565613) b!830611))

(assert (=> d!105457 m!773047))

(declare-fun m!773663 () Bool)

(assert (=> d!105457 m!773663))

(declare-fun m!773665 () Bool)

(assert (=> d!105457 m!773665))

(declare-fun m!773667 () Bool)

(assert (=> b!830610 m!773667))

(declare-fun m!773669 () Bool)

(assert (=> b!830611 m!773669))

(assert (=> d!105241 d!105457))

(declare-fun b!830612 () Bool)

(declare-fun res!565614 () Bool)

(declare-fun e!463116 () Bool)

(assert (=> b!830612 (=> (not res!565614) (not e!463116))))

(declare-fun lt!376882 () List!15944)

(assert (=> b!830612 (= res!565614 (containsKey!399 lt!376882 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!89975 () Bool)

(declare-fun b!830613 () Bool)

(declare-fun c!89973 () Bool)

(declare-fun e!463118 () List!15944)

(assert (=> b!830613 (= e!463118 (ite c!89975 (t!22300 (toList!4502 call!36228)) (ite c!89973 (Cons!15940 (h!17069 (toList!4502 call!36228)) (t!22300 (toList!4502 call!36228))) Nil!15941)))))

(declare-fun b!830614 () Bool)

(assert (=> b!830614 (= c!89973 (and ((_ is Cons!15940) (toList!4502 call!36228)) (bvsgt (_1!5091 (h!17069 (toList!4502 call!36228))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!463115 () List!15944)

(declare-fun e!463117 () List!15944)

(assert (=> b!830614 (= e!463115 e!463117)))

(declare-fun b!830615 () Bool)

(assert (=> b!830615 (= e!463118 (insertStrictlySorted!269 (t!22300 (toList!4502 call!36228)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830616 () Bool)

(declare-fun e!463119 () List!15944)

(declare-fun call!36270 () List!15944)

(assert (=> b!830616 (= e!463119 call!36270)))

(declare-fun b!830617 () Bool)

(declare-fun call!36272 () List!15944)

(assert (=> b!830617 (= e!463115 call!36272)))

(declare-fun b!830618 () Bool)

(declare-fun call!36271 () List!15944)

(assert (=> b!830618 (= e!463117 call!36271)))

(declare-fun bm!36267 () Bool)

(assert (=> bm!36267 (= call!36271 call!36272)))

(declare-fun b!830619 () Bool)

(assert (=> b!830619 (= e!463116 (contains!4188 lt!376882 (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!105459 () Bool)

(assert (=> d!105459 e!463116))

(declare-fun res!565615 () Bool)

(assert (=> d!105459 (=> (not res!565615) (not e!463116))))

(assert (=> d!105459 (= res!565615 (isStrictlySorted!437 lt!376882))))

(assert (=> d!105459 (= lt!376882 e!463119)))

(declare-fun c!89976 () Bool)

(assert (=> d!105459 (= c!89976 (and ((_ is Cons!15940) (toList!4502 call!36228)) (bvslt (_1!5091 (h!17069 (toList!4502 call!36228))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105459 (isStrictlySorted!437 (toList!4502 call!36228))))

(assert (=> d!105459 (= (insertStrictlySorted!269 (toList!4502 call!36228) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376882)))

(declare-fun bm!36268 () Bool)

(assert (=> bm!36268 (= call!36272 call!36270)))

(declare-fun bm!36269 () Bool)

(assert (=> bm!36269 (= call!36270 ($colon$colon!535 e!463118 (ite c!89976 (h!17069 (toList!4502 call!36228)) (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!89974 () Bool)

(assert (=> bm!36269 (= c!89974 c!89976)))

(declare-fun b!830620 () Bool)

(assert (=> b!830620 (= e!463119 e!463115)))

(assert (=> b!830620 (= c!89975 (and ((_ is Cons!15940) (toList!4502 call!36228)) (= (_1!5091 (h!17069 (toList!4502 call!36228))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830621 () Bool)

(assert (=> b!830621 (= e!463117 call!36271)))

(assert (= (and d!105459 c!89976) b!830616))

(assert (= (and d!105459 (not c!89976)) b!830620))

(assert (= (and b!830620 c!89975) b!830617))

(assert (= (and b!830620 (not c!89975)) b!830614))

(assert (= (and b!830614 c!89973) b!830621))

(assert (= (and b!830614 (not c!89973)) b!830618))

(assert (= (or b!830621 b!830618) bm!36267))

(assert (= (or b!830617 bm!36267) bm!36268))

(assert (= (or b!830616 bm!36268) bm!36269))

(assert (= (and bm!36269 c!89974) b!830615))

(assert (= (and bm!36269 (not c!89974)) b!830613))

(assert (= (and d!105459 res!565615) b!830612))

(assert (= (and b!830612 res!565614) b!830619))

(declare-fun m!773671 () Bool)

(assert (=> b!830612 m!773671))

(declare-fun m!773673 () Bool)

(assert (=> b!830619 m!773673))

(declare-fun m!773675 () Bool)

(assert (=> b!830615 m!773675))

(declare-fun m!773677 () Bool)

(assert (=> d!105459 m!773677))

(declare-fun m!773679 () Bool)

(assert (=> d!105459 m!773679))

(declare-fun m!773681 () Bool)

(assert (=> bm!36269 m!773681))

(assert (=> d!105241 d!105459))

(declare-fun d!105461 () Bool)

(assert (=> d!105461 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!376522)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!376522)))))

(assert (=> d!105273 d!105461))

(declare-fun e!463120 () Option!419)

(declare-fun b!830622 () Bool)

(assert (=> b!830622 (= e!463120 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))))

(declare-fun b!830623 () Bool)

(declare-fun e!463121 () Option!419)

(assert (=> b!830623 (= e!463120 e!463121)))

(declare-fun c!89978 () Bool)

(assert (=> b!830623 (= c!89978 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))))) lt!376522))))))

(declare-fun b!830625 () Bool)

(assert (=> b!830625 (= e!463121 None!417)))

(declare-fun b!830624 () Bool)

(assert (=> b!830624 (= e!463121 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)))) lt!376522))))

(declare-fun c!89977 () Bool)

(declare-fun d!105463 () Bool)

(assert (=> d!105463 (= c!89977 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))))) lt!376522)))))

(assert (=> d!105463 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!376522) e!463120)))

(assert (= (and d!105463 c!89977) b!830622))

(assert (= (and d!105463 (not c!89977)) b!830623))

(assert (= (and b!830623 c!89978) b!830624))

(assert (= (and b!830623 (not c!89978)) b!830625))

(declare-fun m!773683 () Bool)

(assert (=> b!830624 m!773683))

(assert (=> d!105273 d!105463))

(declare-fun d!105465 () Bool)

(declare-fun e!463122 () Bool)

(assert (=> d!105465 e!463122))

(declare-fun res!565616 () Bool)

(assert (=> d!105465 (=> res!565616 e!463122)))

(declare-fun lt!376886 () Bool)

(assert (=> d!105465 (= res!565616 (not lt!376886))))

(declare-fun lt!376885 () Bool)

(assert (=> d!105465 (= lt!376886 lt!376885)))

(declare-fun lt!376884 () Unit!28383)

(declare-fun e!463123 () Unit!28383)

(assert (=> d!105465 (= lt!376884 e!463123)))

(declare-fun c!89979 () Bool)

(assert (=> d!105465 (= c!89979 lt!376885)))

(assert (=> d!105465 (= lt!376885 (containsKey!399 (toList!4502 lt!376762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105465 (= (contains!4187 lt!376762 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376886)))

(declare-fun b!830626 () Bool)

(declare-fun lt!376883 () Unit!28383)

(assert (=> b!830626 (= e!463123 lt!376883)))

(assert (=> b!830626 (= lt!376883 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830626 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830627 () Bool)

(declare-fun Unit!28416 () Unit!28383)

(assert (=> b!830627 (= e!463123 Unit!28416)))

(declare-fun b!830628 () Bool)

(assert (=> b!830628 (= e!463122 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105465 c!89979) b!830626))

(assert (= (and d!105465 (not c!89979)) b!830627))

(assert (= (and d!105465 (not res!565616)) b!830628))

(declare-fun m!773685 () Bool)

(assert (=> d!105465 m!773685))

(declare-fun m!773687 () Bool)

(assert (=> b!830626 m!773687))

(declare-fun m!773689 () Bool)

(assert (=> b!830626 m!773689))

(assert (=> b!830626 m!773689))

(declare-fun m!773691 () Bool)

(assert (=> b!830626 m!773691))

(assert (=> b!830628 m!773689))

(assert (=> b!830628 m!773689))

(assert (=> b!830628 m!773691))

(assert (=> b!830401 d!105465))

(declare-fun b!830629 () Bool)

(declare-fun res!565617 () Bool)

(declare-fun e!463125 () Bool)

(assert (=> b!830629 (=> (not res!565617) (not e!463125))))

(declare-fun lt!376887 () List!15944)

(assert (=> b!830629 (= res!565617 (containsKey!399 lt!376887 (_1!5091 lt!376416)))))

(declare-fun c!89982 () Bool)

(declare-fun e!463127 () List!15944)

(declare-fun b!830630 () Bool)

(declare-fun c!89980 () Bool)

(assert (=> b!830630 (= e!463127 (ite c!89982 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!89980 (Cons!15940 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22300 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15941)))))

(declare-fun b!830631 () Bool)

(assert (=> b!830631 (= c!89980 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5091 lt!376416))))))

(declare-fun e!463124 () List!15944)

(declare-fun e!463126 () List!15944)

(assert (=> b!830631 (= e!463124 e!463126)))

(declare-fun b!830632 () Bool)

(assert (=> b!830632 (= e!463127 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!830633 () Bool)

(declare-fun e!463128 () List!15944)

(declare-fun call!36273 () List!15944)

(assert (=> b!830633 (= e!463128 call!36273)))

(declare-fun b!830634 () Bool)

(declare-fun call!36275 () List!15944)

(assert (=> b!830634 (= e!463124 call!36275)))

(declare-fun b!830635 () Bool)

(declare-fun call!36274 () List!15944)

(assert (=> b!830635 (= e!463126 call!36274)))

(declare-fun bm!36270 () Bool)

(assert (=> bm!36270 (= call!36274 call!36275)))

(declare-fun b!830636 () Bool)

(assert (=> b!830636 (= e!463125 (contains!4188 lt!376887 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105467 () Bool)

(assert (=> d!105467 e!463125))

(declare-fun res!565618 () Bool)

(assert (=> d!105467 (=> (not res!565618) (not e!463125))))

(assert (=> d!105467 (= res!565618 (isStrictlySorted!437 lt!376887))))

(assert (=> d!105467 (= lt!376887 e!463128)))

(declare-fun c!89983 () Bool)

(assert (=> d!105467 (= c!89983 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5091 lt!376416))))))

(assert (=> d!105467 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105467 (= (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!376887)))

(declare-fun bm!36271 () Bool)

(assert (=> bm!36271 (= call!36275 call!36273)))

(declare-fun bm!36272 () Bool)

(assert (=> bm!36272 (= call!36273 ($colon$colon!535 e!463127 (ite c!89983 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!89981 () Bool)

(assert (=> bm!36272 (= c!89981 c!89983)))

(declare-fun b!830637 () Bool)

(assert (=> b!830637 (= e!463128 e!463124)))

(assert (=> b!830637 (= c!89982 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5091 lt!376416))))))

(declare-fun b!830638 () Bool)

(assert (=> b!830638 (= e!463126 call!36274)))

(assert (= (and d!105467 c!89983) b!830633))

(assert (= (and d!105467 (not c!89983)) b!830637))

(assert (= (and b!830637 c!89982) b!830634))

(assert (= (and b!830637 (not c!89982)) b!830631))

(assert (= (and b!830631 c!89980) b!830638))

(assert (= (and b!830631 (not c!89980)) b!830635))

(assert (= (or b!830638 b!830635) bm!36270))

(assert (= (or b!830634 bm!36270) bm!36271))

(assert (= (or b!830633 bm!36271) bm!36272))

(assert (= (and bm!36272 c!89981) b!830632))

(assert (= (and bm!36272 (not c!89981)) b!830630))

(assert (= (and d!105467 res!565618) b!830629))

(assert (= (and b!830629 res!565617) b!830636))

(declare-fun m!773693 () Bool)

(assert (=> b!830629 m!773693))

(declare-fun m!773695 () Bool)

(assert (=> b!830636 m!773695))

(declare-fun m!773697 () Bool)

(assert (=> b!830632 m!773697))

(declare-fun m!773699 () Bool)

(assert (=> d!105467 m!773699))

(declare-fun m!773701 () Bool)

(assert (=> d!105467 m!773701))

(declare-fun m!773703 () Bool)

(assert (=> bm!36272 m!773703))

(assert (=> b!830296 d!105467))

(declare-fun d!105469 () Bool)

(declare-fun res!565623 () Bool)

(declare-fun e!463133 () Bool)

(assert (=> d!105469 (=> res!565623 e!463133)))

(assert (=> d!105469 (= res!565623 (and ((_ is Cons!15940) lt!376540) (= (_1!5091 (h!17069 lt!376540)) (_1!5091 lt!376417))))))

(assert (=> d!105469 (= (containsKey!399 lt!376540 (_1!5091 lt!376417)) e!463133)))

(declare-fun b!830643 () Bool)

(declare-fun e!463134 () Bool)

(assert (=> b!830643 (= e!463133 e!463134)))

(declare-fun res!565624 () Bool)

(assert (=> b!830643 (=> (not res!565624) (not e!463134))))

(assert (=> b!830643 (= res!565624 (and (or (not ((_ is Cons!15940) lt!376540)) (bvsle (_1!5091 (h!17069 lt!376540)) (_1!5091 lt!376417))) ((_ is Cons!15940) lt!376540) (bvslt (_1!5091 (h!17069 lt!376540)) (_1!5091 lt!376417))))))

(declare-fun b!830644 () Bool)

(assert (=> b!830644 (= e!463134 (containsKey!399 (t!22300 lt!376540) (_1!5091 lt!376417)))))

(assert (= (and d!105469 (not res!565623)) b!830643))

(assert (= (and b!830643 res!565624) b!830644))

(declare-fun m!773705 () Bool)

(assert (=> b!830644 m!773705))

(assert (=> b!830411 d!105469))

(declare-fun d!105471 () Bool)

(assert (=> d!105471 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))) lt!376553)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))) lt!376553)))))

(assert (=> d!105351 d!105471))

(declare-fun b!830645 () Bool)

(declare-fun e!463135 () Option!419)

(assert (=> b!830645 (= e!463135 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)))))))))

(declare-fun b!830646 () Bool)

(declare-fun e!463136 () Option!419)

(assert (=> b!830646 (= e!463135 e!463136)))

(declare-fun c!89985 () Bool)

(assert (=> b!830646 (= c!89985 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))))) lt!376553))))))

(declare-fun b!830648 () Bool)

(assert (=> b!830648 (= e!463136 None!417)))

(declare-fun b!830647 () Bool)

(assert (=> b!830647 (= e!463136 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)))) lt!376553))))

(declare-fun c!89984 () Bool)

(declare-fun d!105473 () Bool)

(assert (=> d!105473 (= c!89984 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))))) lt!376553)))))

(assert (=> d!105473 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754))) lt!376553) e!463135)))

(assert (= (and d!105473 c!89984) b!830645))

(assert (= (and d!105473 (not c!89984)) b!830646))

(assert (= (and b!830646 c!89985) b!830647))

(assert (= (and b!830646 (not c!89985)) b!830648))

(declare-fun m!773707 () Bool)

(assert (=> b!830647 m!773707))

(assert (=> d!105351 d!105473))

(declare-fun b!830649 () Bool)

(declare-fun e!463138 () Bool)

(declare-fun e!463143 () Bool)

(assert (=> b!830649 (= e!463138 e!463143)))

(assert (=> b!830649 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun res!565627 () Bool)

(declare-fun lt!376892 () ListLongMap!8973)

(assert (=> b!830649 (= res!565627 (contains!4187 lt!376892 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830649 (=> (not res!565627) (not e!463143))))

(declare-fun e!463140 () Bool)

(declare-fun b!830650 () Bool)

(assert (=> b!830650 (= e!463140 (= lt!376892 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830651 () Bool)

(assert (=> b!830651 (= e!463140 (isEmpty!659 lt!376892))))

(declare-fun b!830652 () Bool)

(declare-fun e!463141 () Bool)

(assert (=> b!830652 (= e!463141 e!463138)))

(declare-fun c!89988 () Bool)

(declare-fun e!463137 () Bool)

(assert (=> b!830652 (= c!89988 e!463137)))

(declare-fun res!565625 () Bool)

(assert (=> b!830652 (=> (not res!565625) (not e!463137))))

(assert (=> b!830652 (= res!565625 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830653 () Bool)

(assert (=> b!830653 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> b!830653 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22734 _values!788)))))

(assert (=> b!830653 (= e!463143 (= (apply!372 lt!376892 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105475 () Bool)

(assert (=> d!105475 e!463141))

(declare-fun res!565626 () Bool)

(assert (=> d!105475 (=> (not res!565626) (not e!463141))))

(assert (=> d!105475 (= res!565626 (not (contains!4187 lt!376892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463139 () ListLongMap!8973)

(assert (=> d!105475 (= lt!376892 e!463139)))

(declare-fun c!89987 () Bool)

(assert (=> d!105475 (= c!89987 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105475 (validMask!0 mask!1312)))

(assert (=> d!105475 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!376892)))

(declare-fun b!830654 () Bool)

(assert (=> b!830654 (= e!463138 e!463140)))

(declare-fun c!89986 () Bool)

(assert (=> b!830654 (= c!89986 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830655 () Bool)

(declare-fun e!463142 () ListLongMap!8973)

(declare-fun call!36276 () ListLongMap!8973)

(assert (=> b!830655 (= e!463142 call!36276)))

(declare-fun b!830656 () Bool)

(assert (=> b!830656 (= e!463137 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830656 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830657 () Bool)

(declare-fun lt!376894 () Unit!28383)

(declare-fun lt!376893 () Unit!28383)

(assert (=> b!830657 (= lt!376894 lt!376893)))

(declare-fun lt!376888 () V!25275)

(declare-fun lt!376890 () (_ BitVec 64))

(declare-fun lt!376891 () (_ BitVec 64))

(declare-fun lt!376889 () ListLongMap!8973)

(assert (=> b!830657 (not (contains!4187 (+!2010 lt!376889 (tuple2!10161 lt!376890 lt!376888)) lt!376891))))

(assert (=> b!830657 (= lt!376893 (addStillNotContains!198 lt!376889 lt!376890 lt!376888 lt!376891))))

(assert (=> b!830657 (= lt!376891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830657 (= lt!376888 (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830657 (= lt!376890 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!830657 (= lt!376889 call!36276)))

(assert (=> b!830657 (= e!463142 (+!2010 call!36276 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830658 () Bool)

(declare-fun res!565628 () Bool)

(assert (=> b!830658 (=> (not res!565628) (not e!463141))))

(assert (=> b!830658 (= res!565628 (not (contains!4187 lt!376892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830659 () Bool)

(assert (=> b!830659 (= e!463139 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36273 () Bool)

(assert (=> bm!36273 (= call!36276 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830660 () Bool)

(assert (=> b!830660 (= e!463139 e!463142)))

(declare-fun c!89989 () Bool)

(assert (=> b!830660 (= c!89989 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!105475 c!89987) b!830659))

(assert (= (and d!105475 (not c!89987)) b!830660))

(assert (= (and b!830660 c!89989) b!830657))

(assert (= (and b!830660 (not c!89989)) b!830655))

(assert (= (or b!830657 b!830655) bm!36273))

(assert (= (and d!105475 res!565626) b!830658))

(assert (= (and b!830658 res!565628) b!830652))

(assert (= (and b!830652 res!565625) b!830656))

(assert (= (and b!830652 c!89988) b!830649))

(assert (= (and b!830652 (not c!89988)) b!830654))

(assert (= (and b!830649 res!565627) b!830653))

(assert (= (and b!830654 c!89986) b!830650))

(assert (= (and b!830654 (not c!89986)) b!830651))

(declare-fun b_lambda!11369 () Bool)

(assert (=> (not b_lambda!11369) (not b!830653)))

(assert (=> b!830653 t!22306))

(declare-fun b_and!22525 () Bool)

(assert (= b_and!22523 (and (=> t!22306 result!8007) b_and!22525)))

(declare-fun b_lambda!11371 () Bool)

(assert (=> (not b_lambda!11371) (not b!830657)))

(assert (=> b!830657 t!22306))

(declare-fun b_and!22527 () Bool)

(assert (= b_and!22525 (and (=> t!22306 result!8007) b_and!22527)))

(declare-fun m!773709 () Bool)

(assert (=> b!830651 m!773709))

(declare-fun m!773711 () Bool)

(assert (=> bm!36273 m!773711))

(assert (=> b!830650 m!773711))

(assert (=> b!830656 m!773563))

(assert (=> b!830656 m!773563))

(assert (=> b!830656 m!773565))

(declare-fun m!773713 () Bool)

(assert (=> d!105475 m!773713))

(assert (=> d!105475 m!772479))

(assert (=> b!830649 m!773563))

(assert (=> b!830649 m!773563))

(declare-fun m!773715 () Bool)

(assert (=> b!830649 m!773715))

(assert (=> b!830660 m!773563))

(assert (=> b!830660 m!773563))

(assert (=> b!830660 m!773565))

(assert (=> b!830653 m!773563))

(assert (=> b!830653 m!772615))

(assert (=> b!830653 m!773563))

(declare-fun m!773717 () Bool)

(assert (=> b!830653 m!773717))

(declare-fun m!773719 () Bool)

(assert (=> b!830653 m!773719))

(assert (=> b!830653 m!772615))

(declare-fun m!773721 () Bool)

(assert (=> b!830653 m!773721))

(assert (=> b!830653 m!773719))

(declare-fun m!773723 () Bool)

(assert (=> b!830658 m!773723))

(assert (=> b!830657 m!773563))

(declare-fun m!773725 () Bool)

(assert (=> b!830657 m!773725))

(assert (=> b!830657 m!773719))

(assert (=> b!830657 m!772615))

(assert (=> b!830657 m!773721))

(assert (=> b!830657 m!773719))

(declare-fun m!773727 () Bool)

(assert (=> b!830657 m!773727))

(assert (=> b!830657 m!773725))

(declare-fun m!773729 () Bool)

(assert (=> b!830657 m!773729))

(assert (=> b!830657 m!772615))

(declare-fun m!773731 () Bool)

(assert (=> b!830657 m!773731))

(assert (=> b!830393 d!105475))

(declare-fun d!105477 () Bool)

(assert (=> d!105477 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (v!10089 (getValueByKey!413 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105227 d!105477))

(assert (=> d!105227 d!105413))

(declare-fun d!105479 () Bool)

(declare-fun res!565629 () Bool)

(declare-fun e!463144 () Bool)

(assert (=> d!105479 (=> res!565629 e!463144)))

(assert (=> d!105479 (= res!565629 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) lt!376594)))))

(assert (=> d!105479 (= (containsKey!399 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))) lt!376594) e!463144)))

(declare-fun b!830661 () Bool)

(declare-fun e!463145 () Bool)

(assert (=> b!830661 (= e!463144 e!463145)))

(declare-fun res!565630 () Bool)

(assert (=> b!830661 (=> (not res!565630) (not e!463145))))

(assert (=> b!830661 (= res!565630 (and (or (not ((_ is Cons!15940) (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) (bvsle (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) lt!376594)) ((_ is Cons!15940) (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591))))) lt!376594)))))

(declare-fun b!830662 () Bool)

(assert (=> b!830662 (= e!463145 (containsKey!399 (t!22300 (toList!4502 (+!2010 lt!376592 (tuple2!10161 lt!376593 lt!376591)))) lt!376594))))

(assert (= (and d!105479 (not res!565629)) b!830661))

(assert (= (and b!830661 res!565630) b!830662))

(declare-fun m!773733 () Bool)

(assert (=> b!830662 m!773733))

(assert (=> d!105309 d!105479))

(declare-fun d!105481 () Bool)

(declare-fun res!565631 () Bool)

(declare-fun e!463146 () Bool)

(assert (=> d!105481 (=> res!565631 e!463146)))

(assert (=> d!105481 (= res!565631 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105481 (= (containsKey!399 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000) e!463146)))

(declare-fun b!830663 () Bool)

(declare-fun e!463147 () Bool)

(assert (=> b!830663 (= e!463146 e!463147)))

(declare-fun res!565632 () Bool)

(assert (=> b!830663 (=> (not res!565632) (not e!463147))))

(assert (=> b!830663 (= res!565632 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376517))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376517))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376517)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376517))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830664 () Bool)

(assert (=> b!830664 (= e!463147 (containsKey!399 (t!22300 (toList!4502 lt!376517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105481 (not res!565631)) b!830663))

(assert (= (and b!830663 res!565632) b!830664))

(declare-fun m!773735 () Bool)

(assert (=> b!830664 m!773735))

(assert (=> d!105313 d!105481))

(declare-fun d!105483 () Bool)

(assert (=> d!105483 (= (get!11826 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830264 d!105483))

(declare-fun d!105485 () Bool)

(declare-fun lt!376895 () Bool)

(assert (=> d!105485 (= lt!376895 (select (content!385 lt!376548) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463148 () Bool)

(assert (=> d!105485 (= lt!376895 e!463148)))

(declare-fun res!565633 () Bool)

(assert (=> d!105485 (=> (not res!565633) (not e!463148))))

(assert (=> d!105485 (= res!565633 ((_ is Cons!15940) lt!376548))))

(assert (=> d!105485 (= (contains!4188 lt!376548 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!376895)))

(declare-fun b!830665 () Bool)

(declare-fun e!463149 () Bool)

(assert (=> b!830665 (= e!463148 e!463149)))

(declare-fun res!565634 () Bool)

(assert (=> b!830665 (=> res!565634 e!463149)))

(assert (=> b!830665 (= res!565634 (= (h!17069 lt!376548) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!830666 () Bool)

(assert (=> b!830666 (= e!463149 (contains!4188 (t!22300 lt!376548) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105485 res!565633) b!830665))

(assert (= (and b!830665 (not res!565634)) b!830666))

(declare-fun m!773737 () Bool)

(assert (=> d!105485 m!773737))

(declare-fun m!773739 () Bool)

(assert (=> d!105485 m!773739))

(declare-fun m!773741 () Bool)

(assert (=> b!830666 m!773741))

(assert (=> b!830489 d!105485))

(declare-fun b!830667 () Bool)

(declare-fun e!463150 () Option!419)

(assert (=> b!830667 (= e!463150 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376708)))))))

(declare-fun b!830668 () Bool)

(declare-fun e!463151 () Option!419)

(assert (=> b!830668 (= e!463150 e!463151)))

(declare-fun c!89991 () Bool)

(assert (=> b!830668 (= c!89991 (and ((_ is Cons!15940) (toList!4502 lt!376708)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376708))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830670 () Bool)

(assert (=> b!830670 (= e!463151 None!417)))

(declare-fun b!830669 () Bool)

(assert (=> b!830669 (= e!463151 (getValueByKey!413 (t!22300 (toList!4502 lt!376708)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!105487 () Bool)

(declare-fun c!89990 () Bool)

(assert (=> d!105487 (= c!89990 (and ((_ is Cons!15940) (toList!4502 lt!376708)) (= (_1!5091 (h!17069 (toList!4502 lt!376708))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105487 (= (getValueByKey!413 (toList!4502 lt!376708) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463150)))

(assert (= (and d!105487 c!89990) b!830667))

(assert (= (and d!105487 (not c!89990)) b!830668))

(assert (= (and b!830668 c!89991) b!830669))

(assert (= (and b!830668 (not c!89991)) b!830670))

(declare-fun m!773743 () Bool)

(assert (=> b!830669 m!773743))

(assert (=> b!830346 d!105487))

(declare-fun d!105489 () Bool)

(assert (=> d!105489 (= ($colon$colon!535 e!463053 (ite c!89946 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))) (Cons!15940 (ite c!89946 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) e!463053))))

(assert (=> bm!36259 d!105489))

(declare-fun d!105491 () Bool)

(declare-fun res!565635 () Bool)

(declare-fun e!463152 () Bool)

(assert (=> d!105491 (=> res!565635 e!463152)))

(assert (=> d!105491 (= res!565635 (or ((_ is Nil!15941) lt!376639) ((_ is Nil!15941) (t!22300 lt!376639))))))

(assert (=> d!105491 (= (isStrictlySorted!437 lt!376639) e!463152)))

(declare-fun b!830671 () Bool)

(declare-fun e!463153 () Bool)

(assert (=> b!830671 (= e!463152 e!463153)))

(declare-fun res!565636 () Bool)

(assert (=> b!830671 (=> (not res!565636) (not e!463153))))

(assert (=> b!830671 (= res!565636 (bvslt (_1!5091 (h!17069 lt!376639)) (_1!5091 (h!17069 (t!22300 lt!376639)))))))

(declare-fun b!830672 () Bool)

(assert (=> b!830672 (= e!463153 (isStrictlySorted!437 (t!22300 lt!376639)))))

(assert (= (and d!105491 (not res!565635)) b!830671))

(assert (= (and b!830671 res!565636) b!830672))

(declare-fun m!773745 () Bool)

(assert (=> b!830672 m!773745))

(assert (=> d!105179 d!105491))

(declare-fun d!105493 () Bool)

(declare-fun res!565637 () Bool)

(declare-fun e!463154 () Bool)

(assert (=> d!105493 (=> res!565637 e!463154)))

(assert (=> d!105493 (= res!565637 (or ((_ is Nil!15941) (toList!4502 lt!376414)) ((_ is Nil!15941) (t!22300 (toList!4502 lt!376414)))))))

(assert (=> d!105493 (= (isStrictlySorted!437 (toList!4502 lt!376414)) e!463154)))

(declare-fun b!830673 () Bool)

(declare-fun e!463155 () Bool)

(assert (=> b!830673 (= e!463154 e!463155)))

(declare-fun res!565638 () Bool)

(assert (=> b!830673 (=> (not res!565638) (not e!463155))))

(assert (=> b!830673 (= res!565638 (bvslt (_1!5091 (h!17069 (toList!4502 lt!376414))) (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414))))))))

(declare-fun b!830674 () Bool)

(assert (=> b!830674 (= e!463155 (isStrictlySorted!437 (t!22300 (toList!4502 lt!376414))))))

(assert (= (and d!105493 (not res!565637)) b!830673))

(assert (= (and b!830673 res!565638) b!830674))

(declare-fun m!773747 () Bool)

(assert (=> b!830674 m!773747))

(assert (=> d!105179 d!105493))

(declare-fun d!105495 () Bool)

(assert (=> d!105495 (arrayContainsKey!0 _keys!976 lt!376825 #b00000000000000000000000000000000)))

(declare-fun lt!376896 () Unit!28383)

(assert (=> d!105495 (= lt!376896 (choose!13 _keys!976 lt!376825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!105495 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!105495 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!376896)))

(declare-fun bs!23187 () Bool)

(assert (= bs!23187 d!105495))

(assert (=> bs!23187 m!773439))

(declare-fun m!773749 () Bool)

(assert (=> bs!23187 m!773749))

(assert (=> b!830469 d!105495))

(declare-fun d!105497 () Bool)

(declare-fun res!565639 () Bool)

(declare-fun e!463156 () Bool)

(assert (=> d!105497 (=> res!565639 e!463156)))

(assert (=> d!105497 (= res!565639 (= (select (arr!22314 _keys!976) #b00000000000000000000000000000000) lt!376825))))

(assert (=> d!105497 (= (arrayContainsKey!0 _keys!976 lt!376825 #b00000000000000000000000000000000) e!463156)))

(declare-fun b!830675 () Bool)

(declare-fun e!463157 () Bool)

(assert (=> b!830675 (= e!463156 e!463157)))

(declare-fun res!565640 () Bool)

(assert (=> b!830675 (=> (not res!565640) (not e!463157))))

(assert (=> b!830675 (= res!565640 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830676 () Bool)

(assert (=> b!830676 (= e!463157 (arrayContainsKey!0 _keys!976 lt!376825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!105497 (not res!565639)) b!830675))

(assert (= (and b!830675 res!565640) b!830676))

(assert (=> d!105497 m!772595))

(declare-fun m!773751 () Bool)

(assert (=> b!830676 m!773751))

(assert (=> b!830469 d!105497))

(declare-fun b!830677 () Bool)

(declare-fun e!463158 () SeekEntryResult!8740)

(assert (=> b!830677 (= e!463158 Undefined!8740)))

(declare-fun b!830678 () Bool)

(declare-fun c!89993 () Bool)

(declare-fun lt!376897 () (_ BitVec 64))

(assert (=> b!830678 (= c!89993 (= lt!376897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463160 () SeekEntryResult!8740)

(declare-fun e!463159 () SeekEntryResult!8740)

(assert (=> b!830678 (= e!463160 e!463159)))

(declare-fun b!830680 () Bool)

(assert (=> b!830680 (= e!463158 e!463160)))

(declare-fun lt!376898 () SeekEntryResult!8740)

(assert (=> b!830680 (= lt!376897 (select (arr!22314 _keys!976) (index!37333 lt!376898)))))

(declare-fun c!89992 () Bool)

(assert (=> b!830680 (= c!89992 (= lt!376897 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830681 () Bool)

(assert (=> b!830681 (= e!463159 (MissingZero!8740 (index!37333 lt!376898)))))

(declare-fun b!830682 () Bool)

(assert (=> b!830682 (= e!463160 (Found!8740 (index!37333 lt!376898)))))

(declare-fun b!830679 () Bool)

(assert (=> b!830679 (= e!463159 (seekKeyOrZeroReturnVacant!0 (x!70100 lt!376898) (index!37333 lt!376898) (index!37333 lt!376898) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(declare-fun d!105499 () Bool)

(declare-fun lt!376899 () SeekEntryResult!8740)

(assert (=> d!105499 (and (or ((_ is Undefined!8740) lt!376899) (not ((_ is Found!8740) lt!376899)) (and (bvsge (index!37332 lt!376899) #b00000000000000000000000000000000) (bvslt (index!37332 lt!376899) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376899) ((_ is Found!8740) lt!376899) (not ((_ is MissingZero!8740) lt!376899)) (and (bvsge (index!37331 lt!376899) #b00000000000000000000000000000000) (bvslt (index!37331 lt!376899) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376899) ((_ is Found!8740) lt!376899) ((_ is MissingZero!8740) lt!376899) (not ((_ is MissingVacant!8740) lt!376899)) (and (bvsge (index!37334 lt!376899) #b00000000000000000000000000000000) (bvslt (index!37334 lt!376899) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376899) (ite ((_ is Found!8740) lt!376899) (= (select (arr!22314 _keys!976) (index!37332 lt!376899)) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8740) lt!376899) (= (select (arr!22314 _keys!976) (index!37331 lt!376899)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8740) lt!376899) (= (select (arr!22314 _keys!976) (index!37334 lt!376899)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105499 (= lt!376899 e!463158)))

(declare-fun c!89994 () Bool)

(assert (=> d!105499 (= c!89994 (and ((_ is Intermediate!8740) lt!376898) (undefined!9552 lt!376898)))))

(assert (=> d!105499 (= lt!376898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!105499 (validMask!0 mask!1312)))

(assert (=> d!105499 (= (seekEntryOrOpen!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!376899)))

(assert (= (and d!105499 c!89994) b!830677))

(assert (= (and d!105499 (not c!89994)) b!830680))

(assert (= (and b!830680 c!89992) b!830682))

(assert (= (and b!830680 (not c!89992)) b!830678))

(assert (= (and b!830678 c!89993) b!830681))

(assert (= (and b!830678 (not c!89993)) b!830679))

(declare-fun m!773753 () Bool)

(assert (=> b!830680 m!773753))

(assert (=> b!830679 m!772925))

(declare-fun m!773755 () Bool)

(assert (=> b!830679 m!773755))

(declare-fun m!773757 () Bool)

(assert (=> d!105499 m!773757))

(declare-fun m!773759 () Bool)

(assert (=> d!105499 m!773759))

(declare-fun m!773761 () Bool)

(assert (=> d!105499 m!773761))

(declare-fun m!773763 () Bool)

(assert (=> d!105499 m!773763))

(assert (=> d!105499 m!772925))

(declare-fun m!773765 () Bool)

(assert (=> d!105499 m!773765))

(assert (=> d!105499 m!772925))

(assert (=> d!105499 m!773763))

(assert (=> d!105499 m!772479))

(assert (=> b!830469 d!105499))

(declare-fun d!105501 () Bool)

(assert (=> d!105501 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376900 () Unit!28383)

(assert (=> d!105501 (= lt!376900 (choose!1430 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463161 () Bool)

(assert (=> d!105501 e!463161))

(declare-fun res!565641 () Bool)

(assert (=> d!105501 (=> (not res!565641) (not e!463161))))

(assert (=> d!105501 (= res!565641 (isStrictlySorted!437 (toList!4502 lt!376563)))))

(assert (=> d!105501 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000) lt!376900)))

(declare-fun b!830683 () Bool)

(assert (=> b!830683 (= e!463161 (containsKey!399 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105501 res!565641) b!830683))

(assert (=> d!105501 m!773013))

(assert (=> d!105501 m!773013))

(assert (=> d!105501 m!773015))

(declare-fun m!773767 () Bool)

(assert (=> d!105501 m!773767))

(assert (=> d!105501 m!773587))

(assert (=> b!830683 m!773009))

(assert (=> b!830313 d!105501))

(declare-fun d!105503 () Bool)

(assert (=> d!105503 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23188 () Bool)

(assert (= bs!23188 d!105503))

(assert (=> bs!23188 m!773013))

(declare-fun m!773769 () Bool)

(assert (=> bs!23188 m!773769))

(assert (=> b!830313 d!105503))

(declare-fun b!830684 () Bool)

(declare-fun e!463162 () Option!419)

(assert (=> b!830684 (= e!463162 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376563)))))))

(declare-fun b!830685 () Bool)

(declare-fun e!463163 () Option!419)

(assert (=> b!830685 (= e!463162 e!463163)))

(declare-fun c!89996 () Bool)

(assert (=> b!830685 (= c!89996 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830687 () Bool)

(assert (=> b!830687 (= e!463163 None!417)))

(declare-fun b!830686 () Bool)

(assert (=> b!830686 (= e!463163 (getValueByKey!413 (t!22300 (toList!4502 lt!376563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105505 () Bool)

(declare-fun c!89995 () Bool)

(assert (=> d!105505 (= c!89995 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105505 (= (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000) e!463162)))

(assert (= (and d!105505 c!89995) b!830684))

(assert (= (and d!105505 (not c!89995)) b!830685))

(assert (= (and b!830685 c!89996) b!830686))

(assert (= (and b!830685 (not c!89996)) b!830687))

(declare-fun m!773771 () Bool)

(assert (=> b!830686 m!773771))

(assert (=> b!830313 d!105505))

(assert (=> d!105385 d!105383))

(declare-fun d!105507 () Bool)

(assert (=> d!105507 (= (getValueByKey!413 lt!376544 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105507 true))

(declare-fun _$22!569 () Unit!28383)

(assert (=> d!105507 (= (choose!1426 lt!376544 (_1!5091 lt!376416) (_2!5091 lt!376416)) _$22!569)))

(declare-fun bs!23189 () Bool)

(assert (= bs!23189 d!105507))

(assert (=> bs!23189 m!772659))

(assert (=> d!105385 d!105507))

(declare-fun d!105509 () Bool)

(declare-fun res!565642 () Bool)

(declare-fun e!463164 () Bool)

(assert (=> d!105509 (=> res!565642 e!463164)))

(assert (=> d!105509 (= res!565642 (or ((_ is Nil!15941) lt!376544) ((_ is Nil!15941) (t!22300 lt!376544))))))

(assert (=> d!105509 (= (isStrictlySorted!437 lt!376544) e!463164)))

(declare-fun b!830688 () Bool)

(declare-fun e!463165 () Bool)

(assert (=> b!830688 (= e!463164 e!463165)))

(declare-fun res!565643 () Bool)

(assert (=> b!830688 (=> (not res!565643) (not e!463165))))

(assert (=> b!830688 (= res!565643 (bvslt (_1!5091 (h!17069 lt!376544)) (_1!5091 (h!17069 (t!22300 lt!376544)))))))

(declare-fun b!830689 () Bool)

(assert (=> b!830689 (= e!463165 (isStrictlySorted!437 (t!22300 lt!376544)))))

(assert (= (and d!105509 (not res!565642)) b!830688))

(assert (= (and b!830688 res!565643) b!830689))

(declare-fun m!773773 () Bool)

(assert (=> b!830689 m!773773))

(assert (=> d!105385 d!105509))

(declare-fun d!105511 () Bool)

(assert (=> d!105511 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416)))))))

(declare-fun bs!23190 () Bool)

(assert (= bs!23190 d!105511))

(assert (=> bs!23190 m!772677))

(declare-fun m!773775 () Bool)

(assert (=> bs!23190 m!773775))

(assert (=> b!830483 d!105511))

(assert (=> b!830483 d!105363))

(declare-fun d!105513 () Bool)

(declare-fun res!565644 () Bool)

(declare-fun e!463166 () Bool)

(assert (=> d!105513 (=> res!565644 e!463166)))

(assert (=> d!105513 (= res!565644 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105513 (= (containsKey!399 (toList!4502 lt!376563) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463166)))

(declare-fun b!830690 () Bool)

(declare-fun e!463167 () Bool)

(assert (=> b!830690 (= e!463166 e!463167)))

(declare-fun res!565645 () Bool)

(assert (=> b!830690 (=> (not res!565645) (not e!463167))))

(assert (=> b!830690 (= res!565645 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376563))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376563))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15940) (toList!4502 lt!376563)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376563))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!830691 () Bool)

(assert (=> b!830691 (= e!463167 (containsKey!399 (t!22300 (toList!4502 lt!376563)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105513 (not res!565644)) b!830690))

(assert (= (and b!830690 res!565645) b!830691))

(assert (=> b!830691 m!772595))

(declare-fun m!773777 () Bool)

(assert (=> b!830691 m!773777))

(assert (=> d!105379 d!105513))

(declare-fun d!105515 () Bool)

(assert (=> d!105515 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10089 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105247 d!105515))

(declare-fun b!830692 () Bool)

(declare-fun e!463168 () Option!419)

(assert (=> b!830692 (= e!463168 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376563)))))))

(declare-fun b!830693 () Bool)

(declare-fun e!463169 () Option!419)

(assert (=> b!830693 (= e!463168 e!463169)))

(declare-fun c!89998 () Bool)

(assert (=> b!830693 (= c!89998 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830695 () Bool)

(assert (=> b!830695 (= e!463169 None!417)))

(declare-fun b!830694 () Bool)

(assert (=> b!830694 (= e!463169 (getValueByKey!413 (t!22300 (toList!4502 lt!376563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105517 () Bool)

(declare-fun c!89997 () Bool)

(assert (=> d!105517 (= c!89997 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105517 (= (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000) e!463168)))

(assert (= (and d!105517 c!89997) b!830692))

(assert (= (and d!105517 (not c!89997)) b!830693))

(assert (= (and b!830693 c!89998) b!830694))

(assert (= (and b!830693 (not c!89998)) b!830695))

(declare-fun m!773779 () Bool)

(assert (=> b!830694 m!773779))

(assert (=> d!105247 d!105517))

(declare-fun d!105519 () Bool)

(assert (=> d!105519 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23191 () Bool)

(assert (= bs!23191 d!105519))

(assert (=> bs!23191 m!773101))

(declare-fun m!773781 () Bool)

(assert (=> bs!23191 m!773781))

(assert (=> b!830360 d!105519))

(declare-fun b!830696 () Bool)

(declare-fun e!463170 () Option!419)

(assert (=> b!830696 (= e!463170 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376595)))))))

(declare-fun b!830697 () Bool)

(declare-fun e!463171 () Option!419)

(assert (=> b!830697 (= e!463170 e!463171)))

(declare-fun c!90000 () Bool)

(assert (=> b!830697 (= c!90000 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830699 () Bool)

(assert (=> b!830699 (= e!463171 None!417)))

(declare-fun b!830698 () Bool)

(assert (=> b!830698 (= e!463171 (getValueByKey!413 (t!22300 (toList!4502 lt!376595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105521 () Bool)

(declare-fun c!89999 () Bool)

(assert (=> d!105521 (= c!89999 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105521 (= (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000) e!463170)))

(assert (= (and d!105521 c!89999) b!830696))

(assert (= (and d!105521 (not c!89999)) b!830697))

(assert (= (and b!830697 c!90000) b!830698))

(assert (= (and b!830697 (not c!90000)) b!830699))

(declare-fun m!773783 () Bool)

(assert (=> b!830698 m!773783))

(assert (=> b!830360 d!105521))

(declare-fun b!830712 () Bool)

(declare-fun e!463178 () SeekEntryResult!8740)

(declare-fun e!463179 () SeekEntryResult!8740)

(assert (=> b!830712 (= e!463178 e!463179)))

(declare-fun c!90007 () Bool)

(declare-fun lt!376905 () (_ BitVec 64))

(assert (=> b!830712 (= c!90007 (= lt!376905 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830713 () Bool)

(declare-fun c!90008 () Bool)

(assert (=> b!830713 (= c!90008 (= lt!376905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463180 () SeekEntryResult!8740)

(assert (=> b!830713 (= e!463179 e!463180)))

(declare-fun b!830714 () Bool)

(assert (=> b!830714 (= e!463180 (MissingVacant!8740 (index!37333 lt!376701)))))

(declare-fun b!830715 () Bool)

(assert (=> b!830715 (= e!463179 (Found!8740 (index!37333 lt!376701)))))

(declare-fun b!830716 () Bool)

(assert (=> b!830716 (= e!463178 Undefined!8740)))

(declare-fun d!105523 () Bool)

(declare-fun lt!376906 () SeekEntryResult!8740)

(assert (=> d!105523 (and (or ((_ is Undefined!8740) lt!376906) (not ((_ is Found!8740) lt!376906)) (and (bvsge (index!37332 lt!376906) #b00000000000000000000000000000000) (bvslt (index!37332 lt!376906) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376906) ((_ is Found!8740) lt!376906) (not ((_ is MissingVacant!8740) lt!376906)) (not (= (index!37334 lt!376906) (index!37333 lt!376701))) (and (bvsge (index!37334 lt!376906) #b00000000000000000000000000000000) (bvslt (index!37334 lt!376906) (size!22735 _keys!976)))) (or ((_ is Undefined!8740) lt!376906) (ite ((_ is Found!8740) lt!376906) (= (select (arr!22314 _keys!976) (index!37332 lt!376906)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8740) lt!376906) (= (index!37334 lt!376906) (index!37333 lt!376701)) (= (select (arr!22314 _keys!976) (index!37334 lt!376906)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!105523 (= lt!376906 e!463178)))

(declare-fun c!90009 () Bool)

(assert (=> d!105523 (= c!90009 (bvsge (x!70100 lt!376701) #b01111111111111111111111111111110))))

(assert (=> d!105523 (= lt!376905 (select (arr!22314 _keys!976) (index!37333 lt!376701)))))

(assert (=> d!105523 (validMask!0 mask!1312)))

(assert (=> d!105523 (= (seekKeyOrZeroReturnVacant!0 (x!70100 lt!376701) (index!37333 lt!376701) (index!37333 lt!376701) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!376906)))

(declare-fun b!830717 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!830717 (= e!463180 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70100 lt!376701) #b00000000000000000000000000000001) (nextIndex!0 (index!37333 lt!376701) (x!70100 lt!376701) mask!1312) (index!37333 lt!376701) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (= (and d!105523 c!90009) b!830716))

(assert (= (and d!105523 (not c!90009)) b!830712))

(assert (= (and b!830712 c!90007) b!830715))

(assert (= (and b!830712 (not c!90007)) b!830713))

(assert (= (and b!830713 c!90008) b!830714))

(assert (= (and b!830713 (not c!90008)) b!830717))

(declare-fun m!773785 () Bool)

(assert (=> d!105523 m!773785))

(declare-fun m!773787 () Bool)

(assert (=> d!105523 m!773787))

(assert (=> d!105523 m!773027))

(assert (=> d!105523 m!772479))

(declare-fun m!773789 () Bool)

(assert (=> b!830717 m!773789))

(assert (=> b!830717 m!773789))

(assert (=> b!830717 m!772595))

(declare-fun m!773791 () Bool)

(assert (=> b!830717 m!773791))

(assert (=> b!830338 d!105523))

(declare-fun d!105525 () Bool)

(assert (=> d!105525 (= (content!384 Nil!15942) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!105195 d!105525))

(declare-fun d!105527 () Bool)

(assert (=> d!105527 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!376907 () Unit!28383)

(assert (=> d!105527 (= lt!376907 (choose!1430 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463181 () Bool)

(assert (=> d!105527 e!463181))

(declare-fun res!565646 () Bool)

(assert (=> d!105527 (=> (not res!565646) (not e!463181))))

(assert (=> d!105527 (= res!565646 (isStrictlySorted!437 (toList!4502 lt!376595)))))

(assert (=> d!105527 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376907)))

(declare-fun b!830718 () Bool)

(assert (=> b!830718 (= e!463181 (containsKey!399 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105527 res!565646) b!830718))

(assert (=> d!105527 m!772595))

(assert (=> d!105527 m!773229))

(assert (=> d!105527 m!773229))

(assert (=> d!105527 m!773323))

(assert (=> d!105527 m!772595))

(declare-fun m!773793 () Bool)

(assert (=> d!105527 m!773793))

(declare-fun m!773795 () Bool)

(assert (=> d!105527 m!773795))

(assert (=> b!830718 m!772595))

(assert (=> b!830718 m!773319))

(assert (=> b!830440 d!105527))

(assert (=> b!830440 d!105423))

(assert (=> b!830440 d!105425))

(assert (=> d!105289 d!105267))

(assert (=> d!105289 d!105273))

(declare-fun d!105529 () Bool)

(declare-fun e!463182 () Bool)

(assert (=> d!105529 e!463182))

(declare-fun res!565647 () Bool)

(assert (=> d!105529 (=> res!565647 e!463182)))

(declare-fun lt!376911 () Bool)

(assert (=> d!105529 (= res!565647 (not lt!376911))))

(declare-fun lt!376910 () Bool)

(assert (=> d!105529 (= lt!376911 lt!376910)))

(declare-fun lt!376909 () Unit!28383)

(declare-fun e!463183 () Unit!28383)

(assert (=> d!105529 (= lt!376909 e!463183)))

(declare-fun c!90010 () Bool)

(assert (=> d!105529 (= c!90010 lt!376910)))

(assert (=> d!105529 (= lt!376910 (containsKey!399 (toList!4502 lt!376523) lt!376522))))

(assert (=> d!105529 (= (contains!4187 lt!376523 lt!376522) lt!376911)))

(declare-fun b!830719 () Bool)

(declare-fun lt!376908 () Unit!28383)

(assert (=> b!830719 (= e!463183 lt!376908)))

(assert (=> b!830719 (= lt!376908 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376523) lt!376522))))

(assert (=> b!830719 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376523) lt!376522))))

(declare-fun b!830720 () Bool)

(declare-fun Unit!28417 () Unit!28383)

(assert (=> b!830720 (= e!463183 Unit!28417)))

(declare-fun b!830721 () Bool)

(assert (=> b!830721 (= e!463182 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376523) lt!376522)))))

(assert (= (and d!105529 c!90010) b!830719))

(assert (= (and d!105529 (not c!90010)) b!830720))

(assert (= (and d!105529 (not res!565647)) b!830721))

(declare-fun m!773797 () Bool)

(assert (=> d!105529 m!773797))

(declare-fun m!773799 () Bool)

(assert (=> b!830719 m!773799))

(assert (=> b!830719 m!773197))

(assert (=> b!830719 m!773197))

(declare-fun m!773801 () Bool)

(assert (=> b!830719 m!773801))

(assert (=> b!830721 m!773197))

(assert (=> b!830721 m!773197))

(assert (=> b!830721 m!773801))

(assert (=> d!105289 d!105529))

(declare-fun d!105531 () Bool)

(assert (=> d!105531 (= (apply!372 (+!2010 lt!376523 (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!376522) (apply!372 lt!376523 lt!376522))))

(assert (=> d!105531 true))

(declare-fun _$34!1142 () Unit!28383)

(assert (=> d!105531 (= (choose!1429 lt!376523 lt!376509 zeroValueAfter!34 lt!376522) _$34!1142)))

(declare-fun bs!23192 () Bool)

(assert (= bs!23192 d!105531))

(assert (=> bs!23192 m!772589))

(assert (=> bs!23192 m!772589))

(assert (=> bs!23192 m!772593))

(assert (=> bs!23192 m!772607))

(assert (=> d!105289 d!105531))

(assert (=> d!105289 d!105285))

(declare-fun d!105533 () Bool)

(assert (=> d!105533 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376569) lt!376568)) (v!10089 (getValueByKey!413 (toList!4502 lt!376569) lt!376568)))))

(assert (=> d!105353 d!105533))

(declare-fun b!830723 () Bool)

(declare-fun e!463184 () Option!419)

(assert (=> b!830723 (= e!463184 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376569)))))))

(declare-fun b!830724 () Bool)

(declare-fun e!463185 () Option!419)

(assert (=> b!830724 (= e!463184 e!463185)))

(declare-fun c!90012 () Bool)

(assert (=> b!830724 (= c!90012 (and ((_ is Cons!15940) (toList!4502 lt!376569)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376569))) lt!376568))))))

(declare-fun b!830726 () Bool)

(assert (=> b!830726 (= e!463185 None!417)))

(declare-fun b!830725 () Bool)

(assert (=> b!830725 (= e!463185 (getValueByKey!413 (t!22300 (toList!4502 lt!376569)) lt!376568))))

(declare-fun d!105535 () Bool)

(declare-fun c!90011 () Bool)

(assert (=> d!105535 (= c!90011 (and ((_ is Cons!15940) (toList!4502 lt!376569)) (= (_1!5091 (h!17069 (toList!4502 lt!376569))) lt!376568)))))

(assert (=> d!105535 (= (getValueByKey!413 (toList!4502 lt!376569) lt!376568) e!463184)))

(assert (= (and d!105535 c!90011) b!830723))

(assert (= (and d!105535 (not c!90011)) b!830724))

(assert (= (and b!830724 c!90012) b!830725))

(assert (= (and b!830724 (not c!90012)) b!830726))

(declare-fun m!773803 () Bool)

(assert (=> b!830725 m!773803))

(assert (=> d!105353 d!105535))

(declare-fun d!105537 () Bool)

(assert (=> d!105537 (not (contains!4187 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758)) lt!376761))))

(declare-fun lt!376912 () Unit!28383)

(assert (=> d!105537 (= lt!376912 (choose!1427 lt!376759 lt!376760 lt!376758 lt!376761))))

(declare-fun e!463186 () Bool)

(assert (=> d!105537 e!463186))

(declare-fun res!565648 () Bool)

(assert (=> d!105537 (=> (not res!565648) (not e!463186))))

(assert (=> d!105537 (= res!565648 (not (contains!4187 lt!376759 lt!376761)))))

(assert (=> d!105537 (= (addStillNotContains!198 lt!376759 lt!376760 lt!376758 lt!376761) lt!376912)))

(declare-fun b!830727 () Bool)

(assert (=> b!830727 (= e!463186 (not (= lt!376760 lt!376761)))))

(assert (= (and d!105537 res!565648) b!830727))

(assert (=> d!105537 m!773221))

(assert (=> d!105537 m!773221))

(assert (=> d!105537 m!773225))

(declare-fun m!773805 () Bool)

(assert (=> d!105537 m!773805))

(declare-fun m!773807 () Bool)

(assert (=> d!105537 m!773807))

(assert (=> b!830400 d!105537))

(declare-fun d!105539 () Bool)

(declare-fun c!90013 () Bool)

(assert (=> d!105539 (= c!90013 ((_ is ValueCellFull!7187) (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463187 () V!25275)

(assert (=> d!105539 (= (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463187)))

(declare-fun b!830728 () Bool)

(assert (=> b!830728 (= e!463187 (get!11825 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830729 () Bool)

(assert (=> b!830729 (= e!463187 (get!11826 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105539 c!90013) b!830728))

(assert (= (and d!105539 (not c!90013)) b!830729))

(assert (=> b!830728 m!772935))

(assert (=> b!830728 m!772615))

(declare-fun m!773809 () Bool)

(assert (=> b!830728 m!773809))

(assert (=> b!830729 m!772935))

(assert (=> b!830729 m!772615))

(declare-fun m!773811 () Bool)

(assert (=> b!830729 m!773811))

(assert (=> b!830400 d!105539))

(declare-fun d!105541 () Bool)

(declare-fun e!463188 () Bool)

(assert (=> d!105541 e!463188))

(declare-fun res!565650 () Bool)

(assert (=> d!105541 (=> (not res!565650) (not e!463188))))

(declare-fun lt!376915 () ListLongMap!8973)

(assert (=> d!105541 (= res!565650 (contains!4187 lt!376915 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376913 () List!15944)

(assert (=> d!105541 (= lt!376915 (ListLongMap!8974 lt!376913))))

(declare-fun lt!376914 () Unit!28383)

(declare-fun lt!376916 () Unit!28383)

(assert (=> d!105541 (= lt!376914 lt!376916)))

(assert (=> d!105541 (= (getValueByKey!413 lt!376913 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105541 (= lt!376916 (lemmaContainsTupThenGetReturnValue!230 lt!376913 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105541 (= lt!376913 (insertStrictlySorted!269 (toList!4502 call!36252) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105541 (= (+!2010 call!36252 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376915)))

(declare-fun b!830730 () Bool)

(declare-fun res!565649 () Bool)

(assert (=> b!830730 (=> (not res!565649) (not e!463188))))

(assert (=> b!830730 (= res!565649 (= (getValueByKey!413 (toList!4502 lt!376915) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830731 () Bool)

(assert (=> b!830731 (= e!463188 (contains!4188 (toList!4502 lt!376915) (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105541 res!565650) b!830730))

(assert (= (and b!830730 res!565649) b!830731))

(declare-fun m!773813 () Bool)

(assert (=> d!105541 m!773813))

(declare-fun m!773815 () Bool)

(assert (=> d!105541 m!773815))

(declare-fun m!773817 () Bool)

(assert (=> d!105541 m!773817))

(declare-fun m!773819 () Bool)

(assert (=> d!105541 m!773819))

(declare-fun m!773821 () Bool)

(assert (=> b!830730 m!773821))

(declare-fun m!773823 () Bool)

(assert (=> b!830731 m!773823))

(assert (=> b!830400 d!105541))

(declare-fun d!105543 () Bool)

(declare-fun e!463189 () Bool)

(assert (=> d!105543 e!463189))

(declare-fun res!565651 () Bool)

(assert (=> d!105543 (=> res!565651 e!463189)))

(declare-fun lt!376920 () Bool)

(assert (=> d!105543 (= res!565651 (not lt!376920))))

(declare-fun lt!376919 () Bool)

(assert (=> d!105543 (= lt!376920 lt!376919)))

(declare-fun lt!376918 () Unit!28383)

(declare-fun e!463190 () Unit!28383)

(assert (=> d!105543 (= lt!376918 e!463190)))

(declare-fun c!90014 () Bool)

(assert (=> d!105543 (= c!90014 lt!376919)))

(assert (=> d!105543 (= lt!376919 (containsKey!399 (toList!4502 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758))) lt!376761))))

(assert (=> d!105543 (= (contains!4187 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758)) lt!376761) lt!376920)))

(declare-fun b!830732 () Bool)

(declare-fun lt!376917 () Unit!28383)

(assert (=> b!830732 (= e!463190 lt!376917)))

(assert (=> b!830732 (= lt!376917 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758))) lt!376761))))

(assert (=> b!830732 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758))) lt!376761))))

(declare-fun b!830733 () Bool)

(declare-fun Unit!28418 () Unit!28383)

(assert (=> b!830733 (= e!463190 Unit!28418)))

(declare-fun b!830734 () Bool)

(assert (=> b!830734 (= e!463189 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758))) lt!376761)))))

(assert (= (and d!105543 c!90014) b!830732))

(assert (= (and d!105543 (not c!90014)) b!830733))

(assert (= (and d!105543 (not res!565651)) b!830734))

(declare-fun m!773825 () Bool)

(assert (=> d!105543 m!773825))

(declare-fun m!773827 () Bool)

(assert (=> b!830732 m!773827))

(declare-fun m!773829 () Bool)

(assert (=> b!830732 m!773829))

(assert (=> b!830732 m!773829))

(declare-fun m!773831 () Bool)

(assert (=> b!830732 m!773831))

(assert (=> b!830734 m!773829))

(assert (=> b!830734 m!773829))

(assert (=> b!830734 m!773831))

(assert (=> b!830400 d!105543))

(declare-fun d!105545 () Bool)

(declare-fun e!463191 () Bool)

(assert (=> d!105545 e!463191))

(declare-fun res!565653 () Bool)

(assert (=> d!105545 (=> (not res!565653) (not e!463191))))

(declare-fun lt!376923 () ListLongMap!8973)

(assert (=> d!105545 (= res!565653 (contains!4187 lt!376923 (_1!5091 (tuple2!10161 lt!376760 lt!376758))))))

(declare-fun lt!376921 () List!15944)

(assert (=> d!105545 (= lt!376923 (ListLongMap!8974 lt!376921))))

(declare-fun lt!376922 () Unit!28383)

(declare-fun lt!376924 () Unit!28383)

(assert (=> d!105545 (= lt!376922 lt!376924)))

(assert (=> d!105545 (= (getValueByKey!413 lt!376921 (_1!5091 (tuple2!10161 lt!376760 lt!376758))) (Some!418 (_2!5091 (tuple2!10161 lt!376760 lt!376758))))))

(assert (=> d!105545 (= lt!376924 (lemmaContainsTupThenGetReturnValue!230 lt!376921 (_1!5091 (tuple2!10161 lt!376760 lt!376758)) (_2!5091 (tuple2!10161 lt!376760 lt!376758))))))

(assert (=> d!105545 (= lt!376921 (insertStrictlySorted!269 (toList!4502 lt!376759) (_1!5091 (tuple2!10161 lt!376760 lt!376758)) (_2!5091 (tuple2!10161 lt!376760 lt!376758))))))

(assert (=> d!105545 (= (+!2010 lt!376759 (tuple2!10161 lt!376760 lt!376758)) lt!376923)))

(declare-fun b!830735 () Bool)

(declare-fun res!565652 () Bool)

(assert (=> b!830735 (=> (not res!565652) (not e!463191))))

(assert (=> b!830735 (= res!565652 (= (getValueByKey!413 (toList!4502 lt!376923) (_1!5091 (tuple2!10161 lt!376760 lt!376758))) (Some!418 (_2!5091 (tuple2!10161 lt!376760 lt!376758)))))))

(declare-fun b!830736 () Bool)

(assert (=> b!830736 (= e!463191 (contains!4188 (toList!4502 lt!376923) (tuple2!10161 lt!376760 lt!376758)))))

(assert (= (and d!105545 res!565653) b!830735))

(assert (= (and b!830735 res!565652) b!830736))

(declare-fun m!773833 () Bool)

(assert (=> d!105545 m!773833))

(declare-fun m!773835 () Bool)

(assert (=> d!105545 m!773835))

(declare-fun m!773837 () Bool)

(assert (=> d!105545 m!773837))

(declare-fun m!773839 () Bool)

(assert (=> d!105545 m!773839))

(declare-fun m!773841 () Bool)

(assert (=> b!830735 m!773841))

(declare-fun m!773843 () Bool)

(assert (=> b!830736 m!773843))

(assert (=> b!830400 d!105545))

(declare-fun d!105547 () Bool)

(assert (=> d!105547 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (v!10089 (getValueByKey!413 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105293 d!105547))

(assert (=> d!105293 d!105425))

(declare-fun d!105549 () Bool)

(assert (=> d!105549 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!376925 () Unit!28383)

(assert (=> d!105549 (= lt!376925 (choose!1430 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463192 () Bool)

(assert (=> d!105549 e!463192))

(declare-fun res!565654 () Bool)

(assert (=> d!105549 (=> (not res!565654) (not e!463192))))

(assert (=> d!105549 (= res!565654 (isStrictlySorted!437 (toList!4502 lt!376517)))))

(assert (=> d!105549 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!376925)))

(declare-fun b!830737 () Bool)

(assert (=> b!830737 (= e!463192 (containsKey!399 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105549 res!565654) b!830737))

(assert (=> d!105549 m!772595))

(assert (=> d!105549 m!773429))

(assert (=> d!105549 m!773429))

(assert (=> d!105549 m!773521))

(assert (=> d!105549 m!772595))

(declare-fun m!773845 () Bool)

(assert (=> d!105549 m!773845))

(assert (=> d!105549 m!773595))

(assert (=> b!830737 m!772595))

(assert (=> b!830737 m!773517))

(assert (=> b!830522 d!105549))

(declare-fun d!105551 () Bool)

(assert (=> d!105551 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23193 () Bool)

(assert (= bs!23193 d!105551))

(assert (=> bs!23193 m!773429))

(declare-fun m!773847 () Bool)

(assert (=> bs!23193 m!773847))

(assert (=> b!830522 d!105551))

(declare-fun b!830738 () Bool)

(declare-fun e!463193 () Option!419)

(assert (=> b!830738 (= e!463193 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376517)))))))

(declare-fun b!830739 () Bool)

(declare-fun e!463194 () Option!419)

(assert (=> b!830739 (= e!463193 e!463194)))

(declare-fun c!90016 () Bool)

(assert (=> b!830739 (= c!90016 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376517))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!830741 () Bool)

(assert (=> b!830741 (= e!463194 None!417)))

(declare-fun b!830740 () Bool)

(assert (=> b!830740 (= e!463194 (getValueByKey!413 (t!22300 (toList!4502 lt!376517)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105553 () Bool)

(declare-fun c!90015 () Bool)

(assert (=> d!105553 (= c!90015 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105553 (= (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463193)))

(assert (= (and d!105553 c!90015) b!830738))

(assert (= (and d!105553 (not c!90015)) b!830739))

(assert (= (and b!830739 c!90016) b!830740))

(assert (= (and b!830739 (not c!90016)) b!830741))

(assert (=> b!830740 m!772595))

(declare-fun m!773849 () Bool)

(assert (=> b!830740 m!773849))

(assert (=> b!830522 d!105553))

(assert (=> d!105185 d!105183))

(declare-fun d!105555 () Bool)

(assert (=> d!105555 (= (getValueByKey!413 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105555 true))

(declare-fun _$22!570 () Unit!28383)

(assert (=> d!105555 (= (choose!1426 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!570)))

(declare-fun bs!23194 () Bool)

(assert (= bs!23194 d!105555))

(assert (=> bs!23194 m!772783))

(assert (=> d!105185 d!105555))

(declare-fun d!105557 () Bool)

(declare-fun res!565655 () Bool)

(declare-fun e!463195 () Bool)

(assert (=> d!105557 (=> res!565655 e!463195)))

(assert (=> d!105557 (= res!565655 (or ((_ is Nil!15941) lt!376609) ((_ is Nil!15941) (t!22300 lt!376609))))))

(assert (=> d!105557 (= (isStrictlySorted!437 lt!376609) e!463195)))

(declare-fun b!830742 () Bool)

(declare-fun e!463196 () Bool)

(assert (=> b!830742 (= e!463195 e!463196)))

(declare-fun res!565656 () Bool)

(assert (=> b!830742 (=> (not res!565656) (not e!463196))))

(assert (=> b!830742 (= res!565656 (bvslt (_1!5091 (h!17069 lt!376609)) (_1!5091 (h!17069 (t!22300 lt!376609)))))))

(declare-fun b!830743 () Bool)

(assert (=> b!830743 (= e!463196 (isStrictlySorted!437 (t!22300 lt!376609)))))

(assert (= (and d!105557 (not res!565655)) b!830742))

(assert (= (and b!830742 res!565656) b!830743))

(declare-fun m!773851 () Bool)

(assert (=> b!830743 m!773851))

(assert (=> d!105185 d!105557))

(declare-fun b!830744 () Bool)

(declare-fun e!463197 () Option!419)

(assert (=> b!830744 (= e!463197 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376607))))))))

(declare-fun b!830745 () Bool)

(declare-fun e!463198 () Option!419)

(assert (=> b!830745 (= e!463197 e!463198)))

(declare-fun c!90018 () Bool)

(assert (=> b!830745 (= c!90018 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376607))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376607)))) (_1!5091 lt!376416)))))))

(declare-fun b!830747 () Bool)

(assert (=> b!830747 (= e!463198 None!417)))

(declare-fun b!830746 () Bool)

(assert (=> b!830746 (= e!463198 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376607))) (_1!5091 lt!376416)))))

(declare-fun d!105559 () Bool)

(declare-fun c!90017 () Bool)

(assert (=> d!105559 (= c!90017 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376607))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376607)))) (_1!5091 lt!376416))))))

(assert (=> d!105559 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376607)) (_1!5091 lt!376416)) e!463197)))

(assert (= (and d!105559 c!90017) b!830744))

(assert (= (and d!105559 (not c!90017)) b!830745))

(assert (= (and b!830745 c!90018) b!830746))

(assert (= (and b!830745 (not c!90018)) b!830747))

(declare-fun m!773853 () Bool)

(assert (=> b!830746 m!773853))

(assert (=> b!830363 d!105559))

(declare-fun d!105561 () Bool)

(declare-fun e!463199 () Bool)

(assert (=> d!105561 e!463199))

(declare-fun res!565657 () Bool)

(assert (=> d!105561 (=> res!565657 e!463199)))

(declare-fun lt!376929 () Bool)

(assert (=> d!105561 (= res!565657 (not lt!376929))))

(declare-fun lt!376928 () Bool)

(assert (=> d!105561 (= lt!376929 lt!376928)))

(declare-fun lt!376927 () Unit!28383)

(declare-fun e!463200 () Unit!28383)

(assert (=> d!105561 (= lt!376927 e!463200)))

(declare-fun c!90019 () Bool)

(assert (=> d!105561 (= c!90019 lt!376928)))

(assert (=> d!105561 (= lt!376928 (containsKey!399 (toList!4502 lt!376762) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!105561 (= (contains!4187 lt!376762 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!376929)))

(declare-fun b!830748 () Bool)

(declare-fun lt!376926 () Unit!28383)

(assert (=> b!830748 (= e!463200 lt!376926)))

(assert (=> b!830748 (= lt!376926 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376762) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830748 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830749 () Bool)

(declare-fun Unit!28419 () Unit!28383)

(assert (=> b!830749 (= e!463200 Unit!28419)))

(declare-fun b!830750 () Bool)

(assert (=> b!830750 (= e!463199 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376762) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!105561 c!90019) b!830748))

(assert (= (and d!105561 (not c!90019)) b!830749))

(assert (= (and d!105561 (not res!565657)) b!830750))

(assert (=> d!105561 m!772925))

(declare-fun m!773855 () Bool)

(assert (=> d!105561 m!773855))

(assert (=> b!830748 m!772925))

(declare-fun m!773857 () Bool)

(assert (=> b!830748 m!773857))

(assert (=> b!830748 m!772925))

(declare-fun m!773859 () Bool)

(assert (=> b!830748 m!773859))

(assert (=> b!830748 m!773859))

(declare-fun m!773861 () Bool)

(assert (=> b!830748 m!773861))

(assert (=> b!830750 m!772925))

(assert (=> b!830750 m!773859))

(assert (=> b!830750 m!773859))

(assert (=> b!830750 m!773861))

(assert (=> b!830392 d!105561))

(declare-fun b!830769 () Bool)

(declare-fun lt!376935 () SeekEntryResult!8740)

(assert (=> b!830769 (and (bvsge (index!37333 lt!376935) #b00000000000000000000000000000000) (bvslt (index!37333 lt!376935) (size!22735 _keys!976)))))

(declare-fun res!565664 () Bool)

(assert (=> b!830769 (= res!565664 (= (select (arr!22314 _keys!976) (index!37333 lt!376935)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463211 () Bool)

(assert (=> b!830769 (=> res!565664 e!463211)))

(declare-fun e!463214 () Bool)

(assert (=> b!830769 (= e!463214 e!463211)))

(declare-fun b!830770 () Bool)

(assert (=> b!830770 (and (bvsge (index!37333 lt!376935) #b00000000000000000000000000000000) (bvslt (index!37333 lt!376935) (size!22735 _keys!976)))))

(declare-fun res!565665 () Bool)

(assert (=> b!830770 (= res!565665 (= (select (arr!22314 _keys!976) (index!37333 lt!376935)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830770 (=> res!565665 e!463211)))

(declare-fun b!830771 () Bool)

(declare-fun e!463215 () SeekEntryResult!8740)

(declare-fun e!463212 () SeekEntryResult!8740)

(assert (=> b!830771 (= e!463215 e!463212)))

(declare-fun c!90028 () Bool)

(declare-fun lt!376934 () (_ BitVec 64))

(assert (=> b!830771 (= c!90028 (or (= lt!376934 (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!376934 lt!376934) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830772 () Bool)

(assert (=> b!830772 (and (bvsge (index!37333 lt!376935) #b00000000000000000000000000000000) (bvslt (index!37333 lt!376935) (size!22735 _keys!976)))))

(assert (=> b!830772 (= e!463211 (= (select (arr!22314 _keys!976) (index!37333 lt!376935)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830773 () Bool)

(assert (=> b!830773 (= e!463215 (Intermediate!8740 true (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!830774 () Bool)

(declare-fun e!463213 () Bool)

(assert (=> b!830774 (= e!463213 (bvsge (x!70100 lt!376935) #b01111111111111111111111111111110))))

(declare-fun b!830775 () Bool)

(assert (=> b!830775 (= e!463212 (Intermediate!8740 false (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!830776 () Bool)

(assert (=> b!830776 (= e!463213 e!463214)))

(declare-fun res!565666 () Bool)

(assert (=> b!830776 (= res!565666 (and ((_ is Intermediate!8740) lt!376935) (not (undefined!9552 lt!376935)) (bvslt (x!70100 lt!376935) #b01111111111111111111111111111110) (bvsge (x!70100 lt!376935) #b00000000000000000000000000000000) (bvsge (x!70100 lt!376935) #b00000000000000000000000000000000)))))

(assert (=> b!830776 (=> (not res!565666) (not e!463214))))

(declare-fun d!105563 () Bool)

(assert (=> d!105563 e!463213))

(declare-fun c!90026 () Bool)

(assert (=> d!105563 (= c!90026 (and ((_ is Intermediate!8740) lt!376935) (undefined!9552 lt!376935)))))

(assert (=> d!105563 (= lt!376935 e!463215)))

(declare-fun c!90027 () Bool)

(assert (=> d!105563 (= c!90027 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!105563 (= lt!376934 (select (arr!22314 _keys!976) (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!105563 (validMask!0 mask!1312)))

(assert (=> d!105563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!376935)))

(declare-fun b!830777 () Bool)

(assert (=> b!830777 (= e!463212 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000 mask!1312) (select (arr!22314 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (= (and d!105563 c!90027) b!830773))

(assert (= (and d!105563 (not c!90027)) b!830771))

(assert (= (and b!830771 c!90028) b!830775))

(assert (= (and b!830771 (not c!90028)) b!830777))

(assert (= (and d!105563 c!90026) b!830774))

(assert (= (and d!105563 (not c!90026)) b!830776))

(assert (= (and b!830776 res!565666) b!830769))

(assert (= (and b!830769 (not res!565664)) b!830770))

(assert (= (and b!830770 (not res!565665)) b!830772))

(assert (=> d!105563 m!773037))

(declare-fun m!773863 () Bool)

(assert (=> d!105563 m!773863))

(assert (=> d!105563 m!772479))

(declare-fun m!773865 () Bool)

(assert (=> b!830769 m!773865))

(assert (=> b!830770 m!773865))

(assert (=> b!830772 m!773865))

(assert (=> b!830777 m!773037))

(declare-fun m!773867 () Bool)

(assert (=> b!830777 m!773867))

(assert (=> b!830777 m!773867))

(assert (=> b!830777 m!772595))

(declare-fun m!773869 () Bool)

(assert (=> b!830777 m!773869))

(assert (=> d!105237 d!105563))

(declare-fun d!105565 () Bool)

(declare-fun lt!376941 () (_ BitVec 32))

(declare-fun lt!376940 () (_ BitVec 32))

(assert (=> d!105565 (= lt!376941 (bvmul (bvxor lt!376940 (bvlshr lt!376940 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!105565 (= lt!376940 ((_ extract 31 0) (bvand (bvxor (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22314 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!105565 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!565667 (let ((h!17074 ((_ extract 31 0) (bvand (bvxor (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22314 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70111 (bvmul (bvxor h!17074 (bvlshr h!17074 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70111 (bvlshr x!70111 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!565667 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!565667 #b00000000000000000000000000000000))))))

(assert (=> d!105565 (= (toIndex!0 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!376941 (bvlshr lt!376941 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!105237 d!105565))

(assert (=> d!105237 d!105163))

(declare-fun d!105567 () Bool)

(assert (=> d!105567 (= ($colon$colon!535 e!462886 (ite c!89870 (h!17069 (toList!4502 lt!376419)) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15940 (ite c!89870 (h!17069 (toList!4502 lt!376419)) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!462886))))

(assert (=> bm!36243 d!105567))

(declare-fun d!105569 () Bool)

(assert (=> d!105569 (= (get!11825 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10086 (select (arr!22313 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!830263 d!105569))

(declare-fun lt!376942 () Bool)

(declare-fun d!105571 () Bool)

(assert (=> d!105571 (= lt!376942 (select (content!385 (toList!4502 lt!376747)) (tuple2!10161 lt!376520 minValue!754)))))

(declare-fun e!463216 () Bool)

(assert (=> d!105571 (= lt!376942 e!463216)))

(declare-fun res!565668 () Bool)

(assert (=> d!105571 (=> (not res!565668) (not e!463216))))

(assert (=> d!105571 (= res!565668 ((_ is Cons!15940) (toList!4502 lt!376747)))))

(assert (=> d!105571 (= (contains!4188 (toList!4502 lt!376747) (tuple2!10161 lt!376520 minValue!754)) lt!376942)))

(declare-fun b!830778 () Bool)

(declare-fun e!463217 () Bool)

(assert (=> b!830778 (= e!463216 e!463217)))

(declare-fun res!565669 () Bool)

(assert (=> b!830778 (=> res!565669 e!463217)))

(assert (=> b!830778 (= res!565669 (= (h!17069 (toList!4502 lt!376747)) (tuple2!10161 lt!376520 minValue!754)))))

(declare-fun b!830779 () Bool)

(assert (=> b!830779 (= e!463217 (contains!4188 (t!22300 (toList!4502 lt!376747)) (tuple2!10161 lt!376520 minValue!754)))))

(assert (= (and d!105571 res!565668) b!830778))

(assert (= (and b!830778 (not res!565669)) b!830779))

(declare-fun m!773871 () Bool)

(assert (=> d!105571 m!773871))

(declare-fun m!773873 () Bool)

(assert (=> d!105571 m!773873))

(declare-fun m!773875 () Bool)

(assert (=> b!830779 m!773875))

(assert (=> b!830383 d!105571))

(declare-fun d!105573 () Bool)

(declare-fun res!565670 () Bool)

(declare-fun e!463218 () Bool)

(assert (=> d!105573 (=> res!565670 e!463218)))

(assert (=> d!105573 (= res!565670 (and ((_ is Cons!15940) lt!376548) (= (_1!5091 (h!17069 lt!376548)) (_1!5091 lt!376416))))))

(assert (=> d!105573 (= (containsKey!399 lt!376548 (_1!5091 lt!376416)) e!463218)))

(declare-fun b!830780 () Bool)

(declare-fun e!463219 () Bool)

(assert (=> b!830780 (= e!463218 e!463219)))

(declare-fun res!565671 () Bool)

(assert (=> b!830780 (=> (not res!565671) (not e!463219))))

(assert (=> b!830780 (= res!565671 (and (or (not ((_ is Cons!15940) lt!376548)) (bvsle (_1!5091 (h!17069 lt!376548)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376548) (bvslt (_1!5091 (h!17069 lt!376548)) (_1!5091 lt!376416))))))

(declare-fun b!830781 () Bool)

(assert (=> b!830781 (= e!463219 (containsKey!399 (t!22300 lt!376548) (_1!5091 lt!376416)))))

(assert (= (and d!105573 (not res!565670)) b!830780))

(assert (= (and b!830780 res!565671) b!830781))

(declare-fun m!773877 () Bool)

(assert (=> b!830781 m!773877))

(assert (=> b!830488 d!105573))

(declare-fun d!105575 () Bool)

(declare-fun c!90031 () Bool)

(assert (=> d!105575 (= c!90031 ((_ is Nil!15941) (toList!4502 lt!376550)))))

(declare-fun e!463222 () (InoxSet tuple2!10160))

(assert (=> d!105575 (= (content!385 (toList!4502 lt!376550)) e!463222)))

(declare-fun b!830786 () Bool)

(assert (=> b!830786 (= e!463222 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!830787 () Bool)

(assert (=> b!830787 (= e!463222 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376550)) true) (content!385 (t!22300 (toList!4502 lt!376550)))))))

(assert (= (and d!105575 c!90031) b!830786))

(assert (= (and d!105575 (not c!90031)) b!830787))

(declare-fun m!773879 () Bool)

(assert (=> b!830787 m!773879))

(declare-fun m!773881 () Bool)

(assert (=> b!830787 m!773881))

(assert (=> d!105321 d!105575))

(declare-fun d!105577 () Bool)

(assert (=> d!105577 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376521) lt!376513)) (v!10089 (getValueByKey!413 (toList!4502 lt!376521) lt!376513)))))

(assert (=> d!105269 d!105577))

(declare-fun b!830788 () Bool)

(declare-fun e!463223 () Option!419)

(assert (=> b!830788 (= e!463223 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376521)))))))

(declare-fun b!830789 () Bool)

(declare-fun e!463224 () Option!419)

(assert (=> b!830789 (= e!463223 e!463224)))

(declare-fun c!90033 () Bool)

(assert (=> b!830789 (= c!90033 (and ((_ is Cons!15940) (toList!4502 lt!376521)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376521))) lt!376513))))))

(declare-fun b!830791 () Bool)

(assert (=> b!830791 (= e!463224 None!417)))

(declare-fun b!830790 () Bool)

(assert (=> b!830790 (= e!463224 (getValueByKey!413 (t!22300 (toList!4502 lt!376521)) lt!376513))))

(declare-fun d!105579 () Bool)

(declare-fun c!90032 () Bool)

(assert (=> d!105579 (= c!90032 (and ((_ is Cons!15940) (toList!4502 lt!376521)) (= (_1!5091 (h!17069 (toList!4502 lt!376521))) lt!376513)))))

(assert (=> d!105579 (= (getValueByKey!413 (toList!4502 lt!376521) lt!376513) e!463223)))

(assert (= (and d!105579 c!90032) b!830788))

(assert (= (and d!105579 (not c!90032)) b!830789))

(assert (= (and b!830789 c!90033) b!830790))

(assert (= (and b!830789 (not c!90033)) b!830791))

(declare-fun m!773883 () Bool)

(assert (=> b!830790 m!773883))

(assert (=> d!105269 d!105579))

(declare-fun b!830792 () Bool)

(declare-fun e!463225 () Option!419)

(assert (=> b!830792 (= e!463225 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376609)))))))

(declare-fun b!830793 () Bool)

(declare-fun e!463226 () Option!419)

(assert (=> b!830793 (= e!463225 e!463226)))

(declare-fun c!90035 () Bool)

(assert (=> b!830793 (= c!90035 (and ((_ is Cons!15940) (t!22300 lt!376609)) (not (= (_1!5091 (h!17069 (t!22300 lt!376609))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830795 () Bool)

(assert (=> b!830795 (= e!463226 None!417)))

(declare-fun b!830794 () Bool)

(assert (=> b!830794 (= e!463226 (getValueByKey!413 (t!22300 (t!22300 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105581 () Bool)

(declare-fun c!90034 () Bool)

(assert (=> d!105581 (= c!90034 (and ((_ is Cons!15940) (t!22300 lt!376609)) (= (_1!5091 (h!17069 (t!22300 lt!376609))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105581 (= (getValueByKey!413 (t!22300 lt!376609) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463225)))

(assert (= (and d!105581 c!90034) b!830792))

(assert (= (and d!105581 (not c!90034)) b!830793))

(assert (= (and b!830793 c!90035) b!830794))

(assert (= (and b!830793 (not c!90035)) b!830795))

(declare-fun m!773885 () Bool)

(assert (=> b!830794 m!773885))

(assert (=> b!830236 d!105581))

(declare-fun d!105583 () Bool)

(assert (=> d!105583 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(declare-fun lt!376943 () Unit!28383)

(assert (=> d!105583 (= lt!376943 (choose!1430 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(declare-fun e!463227 () Bool)

(assert (=> d!105583 e!463227))

(declare-fun res!565672 () Bool)

(assert (=> d!105583 (=> (not res!565672) (not e!463227))))

(assert (=> d!105583 (= res!565672 (isStrictlySorted!437 (toList!4502 lt!376546)))))

(assert (=> d!105583 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376546) (_1!5091 lt!376416)) lt!376943)))

(declare-fun b!830796 () Bool)

(assert (=> b!830796 (= e!463227 (containsKey!399 (toList!4502 lt!376546) (_1!5091 lt!376416)))))

(assert (= (and d!105583 res!565672) b!830796))

(assert (=> d!105583 m!772665))

(assert (=> d!105583 m!772665))

(assert (=> d!105583 m!773493))

(declare-fun m!773887 () Bool)

(assert (=> d!105583 m!773887))

(declare-fun m!773889 () Bool)

(assert (=> d!105583 m!773889))

(assert (=> b!830796 m!773489))

(assert (=> b!830503 d!105583))

(declare-fun d!105585 () Bool)

(assert (=> d!105585 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376546) (_1!5091 lt!376416)))))))

(declare-fun bs!23195 () Bool)

(assert (= bs!23195 d!105585))

(assert (=> bs!23195 m!772665))

(declare-fun m!773891 () Bool)

(assert (=> bs!23195 m!773891))

(assert (=> b!830503 d!105585))

(assert (=> b!830503 d!105365))

(assert (=> d!105375 d!105373))

(declare-fun d!105587 () Bool)

(assert (=> d!105587 (= (getValueByKey!413 lt!376548 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105587 true))

(declare-fun _$22!571 () Unit!28383)

(assert (=> d!105587 (= (choose!1426 lt!376548 (_1!5091 lt!376416) (_2!5091 lt!376416)) _$22!571)))

(declare-fun bs!23196 () Bool)

(assert (= bs!23196 d!105587))

(assert (=> bs!23196 m!772671))

(assert (=> d!105375 d!105587))

(declare-fun d!105589 () Bool)

(declare-fun res!565673 () Bool)

(declare-fun e!463228 () Bool)

(assert (=> d!105589 (=> res!565673 e!463228)))

(assert (=> d!105589 (= res!565673 (or ((_ is Nil!15941) lt!376548) ((_ is Nil!15941) (t!22300 lt!376548))))))

(assert (=> d!105589 (= (isStrictlySorted!437 lt!376548) e!463228)))

(declare-fun b!830797 () Bool)

(declare-fun e!463229 () Bool)

(assert (=> b!830797 (= e!463228 e!463229)))

(declare-fun res!565674 () Bool)

(assert (=> b!830797 (=> (not res!565674) (not e!463229))))

(assert (=> b!830797 (= res!565674 (bvslt (_1!5091 (h!17069 lt!376548)) (_1!5091 (h!17069 (t!22300 lt!376548)))))))

(declare-fun b!830798 () Bool)

(assert (=> b!830798 (= e!463229 (isStrictlySorted!437 (t!22300 lt!376548)))))

(assert (= (and d!105589 (not res!565673)) b!830797))

(assert (= (and b!830797 res!565674) b!830798))

(declare-fun m!773893 () Bool)

(assert (=> b!830798 m!773893))

(assert (=> d!105375 d!105589))

(declare-fun b!830799 () Bool)

(declare-fun e!463230 () Option!419)

(assert (=> b!830799 (= e!463230 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376773)))))))

(declare-fun b!830800 () Bool)

(declare-fun e!463231 () Option!419)

(assert (=> b!830800 (= e!463230 e!463231)))

(declare-fun c!90037 () Bool)

(assert (=> b!830800 (= c!90037 (and ((_ is Cons!15940) (toList!4502 lt!376773)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376773))) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))))

(declare-fun b!830802 () Bool)

(assert (=> b!830802 (= e!463231 None!417)))

(declare-fun b!830801 () Bool)

(assert (=> b!830801 (= e!463231 (getValueByKey!413 (t!22300 (toList!4502 lt!376773)) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun d!105591 () Bool)

(declare-fun c!90036 () Bool)

(assert (=> d!105591 (= c!90036 (and ((_ is Cons!15940) (toList!4502 lt!376773)) (= (_1!5091 (h!17069 (toList!4502 lt!376773))) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (=> d!105591 (= (getValueByKey!413 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591))) e!463230)))

(assert (= (and d!105591 c!90036) b!830799))

(assert (= (and d!105591 (not c!90036)) b!830800))

(assert (= (and b!830800 c!90037) b!830801))

(assert (= (and b!830800 (not c!90037)) b!830802))

(declare-fun m!773895 () Bool)

(assert (=> b!830801 m!773895))

(assert (=> b!830423 d!105591))

(declare-fun d!105593 () Bool)

(assert (=> d!105593 (= ($colon$colon!535 e!462876 (ite c!89863 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))) (Cons!15940 (ite c!89863 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) e!462876))))

(assert (=> bm!36240 d!105593))

(declare-fun d!105595 () Bool)

(assert (=> d!105595 (= ($colon$colon!535 e!463041 (ite c!89938 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))) (Cons!15940 (ite c!89938 (h!17069 (toList!4502 lt!376414)) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) e!463041))))

(assert (=> bm!36256 d!105595))

(declare-fun d!105597 () Bool)

(declare-fun res!565675 () Bool)

(declare-fun e!463232 () Bool)

(assert (=> d!105597 (=> res!565675 e!463232)))

(assert (=> d!105597 (= res!565675 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105597 (= (containsKey!399 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000) e!463232)))

(declare-fun b!830803 () Bool)

(declare-fun e!463233 () Bool)

(assert (=> b!830803 (= e!463232 e!463233)))

(declare-fun res!565676 () Bool)

(assert (=> b!830803 (=> (not res!565676) (not e!463233))))

(assert (=> b!830803 (= res!565676 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376517))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376517))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376517)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376517))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830804 () Bool)

(assert (=> b!830804 (= e!463233 (containsKey!399 (t!22300 (toList!4502 lt!376517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105597 (not res!565675)) b!830803))

(assert (= (and b!830803 res!565676) b!830804))

(declare-fun m!773897 () Bool)

(assert (=> b!830804 m!773897))

(assert (=> d!105251 d!105597))

(declare-fun d!105599 () Bool)

(declare-fun e!463234 () Bool)

(assert (=> d!105599 e!463234))

(declare-fun res!565677 () Bool)

(assert (=> d!105599 (=> res!565677 e!463234)))

(declare-fun lt!376947 () Bool)

(assert (=> d!105599 (= res!565677 (not lt!376947))))

(declare-fun lt!376946 () Bool)

(assert (=> d!105599 (= lt!376947 lt!376946)))

(declare-fun lt!376945 () Unit!28383)

(declare-fun e!463235 () Unit!28383)

(assert (=> d!105599 (= lt!376945 e!463235)))

(declare-fun c!90038 () Bool)

(assert (=> d!105599 (= c!90038 lt!376946)))

(assert (=> d!105599 (= lt!376946 (containsKey!399 (toList!4502 lt!376669) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105599 (= (contains!4187 lt!376669 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376947)))

(declare-fun b!830805 () Bool)

(declare-fun lt!376944 () Unit!28383)

(assert (=> b!830805 (= e!463235 lt!376944)))

(assert (=> b!830805 (= lt!376944 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376669) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830805 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830806 () Bool)

(declare-fun Unit!28420 () Unit!28383)

(assert (=> b!830806 (= e!463235 Unit!28420)))

(declare-fun b!830807 () Bool)

(assert (=> b!830807 (= e!463234 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105599 c!90038) b!830805))

(assert (= (and d!105599 (not c!90038)) b!830806))

(assert (= (and d!105599 (not res!565677)) b!830807))

(declare-fun m!773899 () Bool)

(assert (=> d!105599 m!773899))

(declare-fun m!773901 () Bool)

(assert (=> b!830805 m!773901))

(declare-fun m!773903 () Bool)

(assert (=> b!830805 m!773903))

(assert (=> b!830805 m!773903))

(declare-fun m!773905 () Bool)

(assert (=> b!830805 m!773905))

(assert (=> b!830807 m!773903))

(assert (=> b!830807 m!773903))

(assert (=> b!830807 m!773905))

(assert (=> d!105209 d!105599))

(assert (=> d!105209 d!105163))

(declare-fun d!105601 () Bool)

(declare-fun e!463236 () Bool)

(assert (=> d!105601 e!463236))

(declare-fun res!565678 () Bool)

(assert (=> d!105601 (=> res!565678 e!463236)))

(declare-fun lt!376951 () Bool)

(assert (=> d!105601 (= res!565678 (not lt!376951))))

(declare-fun lt!376950 () Bool)

(assert (=> d!105601 (= lt!376951 lt!376950)))

(declare-fun lt!376949 () Unit!28383)

(declare-fun e!463237 () Unit!28383)

(assert (=> d!105601 (= lt!376949 e!463237)))

(declare-fun c!90039 () Bool)

(assert (=> d!105601 (= c!90039 lt!376950)))

(assert (=> d!105601 (= lt!376950 (containsKey!399 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(assert (=> d!105601 (= (contains!4187 lt!376773 (_1!5091 (tuple2!10161 lt!376593 lt!376591))) lt!376951)))

(declare-fun b!830808 () Bool)

(declare-fun lt!376948 () Unit!28383)

(assert (=> b!830808 (= e!463237 lt!376948)))

(assert (=> b!830808 (= lt!376948 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(assert (=> b!830808 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun b!830809 () Bool)

(declare-fun Unit!28421 () Unit!28383)

(assert (=> b!830809 (= e!463237 Unit!28421)))

(declare-fun b!830810 () Bool)

(assert (=> b!830810 (= e!463236 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376773) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (= (and d!105601 c!90039) b!830808))

(assert (= (and d!105601 (not c!90039)) b!830809))

(assert (= (and d!105601 (not res!565678)) b!830810))

(declare-fun m!773907 () Bool)

(assert (=> d!105601 m!773907))

(declare-fun m!773909 () Bool)

(assert (=> b!830808 m!773909))

(assert (=> b!830808 m!773269))

(assert (=> b!830808 m!773269))

(declare-fun m!773911 () Bool)

(assert (=> b!830808 m!773911))

(assert (=> b!830810 m!773269))

(assert (=> b!830810 m!773269))

(assert (=> b!830810 m!773911))

(assert (=> d!105303 d!105601))

(declare-fun b!830811 () Bool)

(declare-fun e!463238 () Option!419)

(assert (=> b!830811 (= e!463238 (Some!418 (_2!5091 (h!17069 lt!376771))))))

(declare-fun b!830812 () Bool)

(declare-fun e!463239 () Option!419)

(assert (=> b!830812 (= e!463238 e!463239)))

(declare-fun c!90041 () Bool)

(assert (=> b!830812 (= c!90041 (and ((_ is Cons!15940) lt!376771) (not (= (_1!5091 (h!17069 lt!376771)) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))))

(declare-fun b!830814 () Bool)

(assert (=> b!830814 (= e!463239 None!417)))

(declare-fun b!830813 () Bool)

(assert (=> b!830813 (= e!463239 (getValueByKey!413 (t!22300 lt!376771) (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun c!90040 () Bool)

(declare-fun d!105603 () Bool)

(assert (=> d!105603 (= c!90040 (and ((_ is Cons!15940) lt!376771) (= (_1!5091 (h!17069 lt!376771)) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (=> d!105603 (= (getValueByKey!413 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591))) e!463238)))

(assert (= (and d!105603 c!90040) b!830811))

(assert (= (and d!105603 (not c!90040)) b!830812))

(assert (= (and b!830812 c!90041) b!830813))

(assert (= (and b!830812 (not c!90041)) b!830814))

(declare-fun m!773913 () Bool)

(assert (=> b!830813 m!773913))

(assert (=> d!105303 d!105603))

(declare-fun d!105605 () Bool)

(assert (=> d!105605 (= (getValueByKey!413 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591))) (Some!418 (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun lt!376952 () Unit!28383)

(assert (=> d!105605 (= lt!376952 (choose!1426 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun e!463240 () Bool)

(assert (=> d!105605 e!463240))

(declare-fun res!565679 () Bool)

(assert (=> d!105605 (=> (not res!565679) (not e!463240))))

(assert (=> d!105605 (= res!565679 (isStrictlySorted!437 lt!376771))))

(assert (=> d!105605 (= (lemmaContainsTupThenGetReturnValue!230 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))) lt!376952)))

(declare-fun b!830815 () Bool)

(declare-fun res!565680 () Bool)

(assert (=> b!830815 (=> (not res!565680) (not e!463240))))

(assert (=> b!830815 (= res!565680 (containsKey!399 lt!376771 (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun b!830816 () Bool)

(assert (=> b!830816 (= e!463240 (contains!4188 lt!376771 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (= (and d!105605 res!565679) b!830815))

(assert (= (and b!830815 res!565680) b!830816))

(assert (=> d!105605 m!773263))

(declare-fun m!773915 () Bool)

(assert (=> d!105605 m!773915))

(declare-fun m!773917 () Bool)

(assert (=> d!105605 m!773917))

(declare-fun m!773919 () Bool)

(assert (=> b!830815 m!773919))

(declare-fun m!773921 () Bool)

(assert (=> b!830816 m!773921))

(assert (=> d!105303 d!105605))

(declare-fun b!830817 () Bool)

(declare-fun res!565681 () Bool)

(declare-fun e!463242 () Bool)

(assert (=> b!830817 (=> (not res!565681) (not e!463242))))

(declare-fun lt!376953 () List!15944)

(assert (=> b!830817 (= res!565681 (containsKey!399 lt!376953 (_1!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun e!463244 () List!15944)

(declare-fun b!830818 () Bool)

(declare-fun c!90042 () Bool)

(declare-fun c!90044 () Bool)

(assert (=> b!830818 (= e!463244 (ite c!90044 (t!22300 (toList!4502 lt!376592)) (ite c!90042 (Cons!15940 (h!17069 (toList!4502 lt!376592)) (t!22300 (toList!4502 lt!376592))) Nil!15941)))))

(declare-fun b!830819 () Bool)

(assert (=> b!830819 (= c!90042 (and ((_ is Cons!15940) (toList!4502 lt!376592)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376592))) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(declare-fun e!463241 () List!15944)

(declare-fun e!463243 () List!15944)

(assert (=> b!830819 (= e!463241 e!463243)))

(declare-fun b!830820 () Bool)

(assert (=> b!830820 (= e!463244 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376592)) (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))

(declare-fun b!830821 () Bool)

(declare-fun e!463245 () List!15944)

(declare-fun call!36277 () List!15944)

(assert (=> b!830821 (= e!463245 call!36277)))

(declare-fun b!830822 () Bool)

(declare-fun call!36279 () List!15944)

(assert (=> b!830822 (= e!463241 call!36279)))

(declare-fun b!830823 () Bool)

(declare-fun call!36278 () List!15944)

(assert (=> b!830823 (= e!463243 call!36278)))

(declare-fun bm!36274 () Bool)

(assert (=> bm!36274 (= call!36278 call!36279)))

(declare-fun b!830824 () Bool)

(assert (=> b!830824 (= e!463242 (contains!4188 lt!376953 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(declare-fun d!105607 () Bool)

(assert (=> d!105607 e!463242))

(declare-fun res!565682 () Bool)

(assert (=> d!105607 (=> (not res!565682) (not e!463242))))

(assert (=> d!105607 (= res!565682 (isStrictlySorted!437 lt!376953))))

(assert (=> d!105607 (= lt!376953 e!463245)))

(declare-fun c!90045 () Bool)

(assert (=> d!105607 (= c!90045 (and ((_ is Cons!15940) (toList!4502 lt!376592)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376592))) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(assert (=> d!105607 (isStrictlySorted!437 (toList!4502 lt!376592))))

(assert (=> d!105607 (= (insertStrictlySorted!269 (toList!4502 lt!376592) (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))) lt!376953)))

(declare-fun bm!36275 () Bool)

(assert (=> bm!36275 (= call!36279 call!36277)))

(declare-fun bm!36276 () Bool)

(assert (=> bm!36276 (= call!36277 ($colon$colon!535 e!463244 (ite c!90045 (h!17069 (toList!4502 lt!376592)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376593 lt!376591)) (_2!5091 (tuple2!10161 lt!376593 lt!376591))))))))

(declare-fun c!90043 () Bool)

(assert (=> bm!36276 (= c!90043 c!90045)))

(declare-fun b!830825 () Bool)

(assert (=> b!830825 (= e!463245 e!463241)))

(assert (=> b!830825 (= c!90044 (and ((_ is Cons!15940) (toList!4502 lt!376592)) (= (_1!5091 (h!17069 (toList!4502 lt!376592))) (_1!5091 (tuple2!10161 lt!376593 lt!376591)))))))

(declare-fun b!830826 () Bool)

(assert (=> b!830826 (= e!463243 call!36278)))

(assert (= (and d!105607 c!90045) b!830821))

(assert (= (and d!105607 (not c!90045)) b!830825))

(assert (= (and b!830825 c!90044) b!830822))

(assert (= (and b!830825 (not c!90044)) b!830819))

(assert (= (and b!830819 c!90042) b!830826))

(assert (= (and b!830819 (not c!90042)) b!830823))

(assert (= (or b!830826 b!830823) bm!36274))

(assert (= (or b!830822 bm!36274) bm!36275))

(assert (= (or b!830821 bm!36275) bm!36276))

(assert (= (and bm!36276 c!90043) b!830820))

(assert (= (and bm!36276 (not c!90043)) b!830818))

(assert (= (and d!105607 res!565682) b!830817))

(assert (= (and b!830817 res!565681) b!830824))

(declare-fun m!773923 () Bool)

(assert (=> b!830817 m!773923))

(declare-fun m!773925 () Bool)

(assert (=> b!830824 m!773925))

(declare-fun m!773927 () Bool)

(assert (=> b!830820 m!773927))

(declare-fun m!773929 () Bool)

(assert (=> d!105607 m!773929))

(declare-fun m!773931 () Bool)

(assert (=> d!105607 m!773931))

(declare-fun m!773933 () Bool)

(assert (=> bm!36276 m!773933))

(assert (=> d!105303 d!105607))

(declare-fun d!105609 () Bool)

(declare-fun lt!376954 () Bool)

(assert (=> d!105609 (= lt!376954 (select (content!385 (toList!4502 lt!376778)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!463246 () Bool)

(assert (=> d!105609 (= lt!376954 e!463246)))

(declare-fun res!565683 () Bool)

(assert (=> d!105609 (=> (not res!565683) (not e!463246))))

(assert (=> d!105609 (= res!565683 ((_ is Cons!15940) (toList!4502 lt!376778)))))

(assert (=> d!105609 (= (contains!4188 (toList!4502 lt!376778) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!376954)))

(declare-fun b!830827 () Bool)

(declare-fun e!463247 () Bool)

(assert (=> b!830827 (= e!463246 e!463247)))

(declare-fun res!565684 () Bool)

(assert (=> b!830827 (=> res!565684 e!463247)))

(assert (=> b!830827 (= res!565684 (= (h!17069 (toList!4502 lt!376778)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830828 () Bool)

(assert (=> b!830828 (= e!463247 (contains!4188 (t!22300 (toList!4502 lt!376778)) (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105609 res!565683) b!830827))

(assert (= (and b!830827 (not res!565684)) b!830828))

(declare-fun m!773935 () Bool)

(assert (=> d!105609 m!773935))

(declare-fun m!773937 () Bool)

(assert (=> d!105609 m!773937))

(declare-fun m!773939 () Bool)

(assert (=> b!830828 m!773939))

(assert (=> b!830427 d!105609))

(declare-fun d!105611 () Bool)

(declare-fun res!565685 () Bool)

(declare-fun e!463248 () Bool)

(assert (=> d!105611 (=> res!565685 e!463248)))

(assert (=> d!105611 (= res!565685 (or ((_ is Nil!15941) lt!376770) ((_ is Nil!15941) (t!22300 lt!376770))))))

(assert (=> d!105611 (= (isStrictlySorted!437 lt!376770) e!463248)))

(declare-fun b!830829 () Bool)

(declare-fun e!463249 () Bool)

(assert (=> b!830829 (= e!463248 e!463249)))

(declare-fun res!565686 () Bool)

(assert (=> b!830829 (=> (not res!565686) (not e!463249))))

(assert (=> b!830829 (= res!565686 (bvslt (_1!5091 (h!17069 lt!376770)) (_1!5091 (h!17069 (t!22300 lt!376770)))))))

(declare-fun b!830830 () Bool)

(assert (=> b!830830 (= e!463249 (isStrictlySorted!437 (t!22300 lt!376770)))))

(assert (= (and d!105611 (not res!565685)) b!830829))

(assert (= (and b!830829 res!565686) b!830830))

(declare-fun m!773941 () Bool)

(assert (=> b!830830 m!773941))

(assert (=> d!105301 d!105611))

(declare-fun d!105613 () Bool)

(declare-fun res!565687 () Bool)

(declare-fun e!463250 () Bool)

(assert (=> d!105613 (=> res!565687 e!463250)))

(assert (=> d!105613 (= res!565687 (or ((_ is Nil!15941) (toList!4502 (+!2010 lt!376414 lt!376416))) ((_ is Nil!15941) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))))))

(assert (=> d!105613 (= (isStrictlySorted!437 (toList!4502 (+!2010 lt!376414 lt!376416))) e!463250)))

(declare-fun b!830831 () Bool)

(declare-fun e!463251 () Bool)

(assert (=> b!830831 (= e!463250 e!463251)))

(declare-fun res!565688 () Bool)

(assert (=> b!830831 (=> (not res!565688) (not e!463251))))

(assert (=> b!830831 (= res!565688 (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416)))) (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))))))))

(declare-fun b!830832 () Bool)

(assert (=> b!830832 (= e!463251 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))))))

(assert (= (and d!105613 (not res!565687)) b!830831))

(assert (= (and b!830831 res!565688) b!830832))

(declare-fun m!773943 () Bool)

(assert (=> b!830832 m!773943))

(assert (=> d!105301 d!105613))

(assert (=> b!830430 d!105433))

(assert (=> b!830430 d!105435))

(declare-fun b!830833 () Bool)

(declare-fun e!463252 () Option!419)

(assert (=> b!830833 (= e!463252 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376611))))))))

(declare-fun b!830834 () Bool)

(declare-fun e!463253 () Option!419)

(assert (=> b!830834 (= e!463252 e!463253)))

(declare-fun c!90047 () Bool)

(assert (=> b!830834 (= c!90047 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376611))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376611)))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!830836 () Bool)

(assert (=> b!830836 (= e!463253 None!417)))

(declare-fun b!830835 () Bool)

(assert (=> b!830835 (= e!463253 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105615 () Bool)

(declare-fun c!90046 () Bool)

(assert (=> d!105615 (= c!90046 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376611))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376611)))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105615 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376611)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463252)))

(assert (= (and d!105615 c!90046) b!830833))

(assert (= (and d!105615 (not c!90046)) b!830834))

(assert (= (and b!830834 c!90047) b!830835))

(assert (= (and b!830834 (not c!90047)) b!830836))

(declare-fun m!773945 () Bool)

(assert (=> b!830835 m!773945))

(assert (=> b!830367 d!105615))

(assert (=> b!830403 d!105447))

(declare-fun b!830837 () Bool)

(declare-fun e!463254 () Option!419)

(assert (=> b!830837 (= e!463254 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376544)))))))

(declare-fun b!830838 () Bool)

(declare-fun e!463255 () Option!419)

(assert (=> b!830838 (= e!463254 e!463255)))

(declare-fun c!90049 () Bool)

(assert (=> b!830838 (= c!90049 (and ((_ is Cons!15940) (t!22300 lt!376544)) (not (= (_1!5091 (h!17069 (t!22300 lt!376544))) (_1!5091 lt!376416)))))))

(declare-fun b!830840 () Bool)

(assert (=> b!830840 (= e!463255 None!417)))

(declare-fun b!830839 () Bool)

(assert (=> b!830839 (= e!463255 (getValueByKey!413 (t!22300 (t!22300 lt!376544)) (_1!5091 lt!376416)))))

(declare-fun d!105617 () Bool)

(declare-fun c!90048 () Bool)

(assert (=> d!105617 (= c!90048 (and ((_ is Cons!15940) (t!22300 lt!376544)) (= (_1!5091 (h!17069 (t!22300 lt!376544))) (_1!5091 lt!376416))))))

(assert (=> d!105617 (= (getValueByKey!413 (t!22300 lt!376544) (_1!5091 lt!376416)) e!463254)))

(assert (= (and d!105617 c!90048) b!830837))

(assert (= (and d!105617 (not c!90048)) b!830838))

(assert (= (and b!830838 c!90049) b!830839))

(assert (= (and b!830838 (not c!90049)) b!830840))

(declare-fun m!773947 () Bool)

(assert (=> b!830839 m!773947))

(assert (=> b!830508 d!105617))

(assert (=> b!830436 d!105417))

(assert (=> b!830436 d!105419))

(declare-fun b!830841 () Bool)

(declare-fun e!463256 () Option!419)

(assert (=> b!830841 (= e!463256 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376815)))))))

(declare-fun b!830842 () Bool)

(declare-fun e!463257 () Option!419)

(assert (=> b!830842 (= e!463256 e!463257)))

(declare-fun c!90051 () Bool)

(assert (=> b!830842 (= c!90051 (and ((_ is Cons!15940) (toList!4502 lt!376815)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376815))) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))))

(declare-fun b!830844 () Bool)

(assert (=> b!830844 (= e!463257 None!417)))

(declare-fun b!830843 () Bool)

(assert (=> b!830843 (= e!463257 (getValueByKey!413 (t!22300 (toList!4502 lt!376815)) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun d!105619 () Bool)

(declare-fun c!90050 () Bool)

(assert (=> d!105619 (= c!90050 (and ((_ is Cons!15940) (toList!4502 lt!376815)) (= (_1!5091 (h!17069 (toList!4502 lt!376815))) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(assert (=> d!105619 (= (getValueByKey!413 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) e!463256)))

(assert (= (and d!105619 c!90050) b!830841))

(assert (= (and d!105619 (not c!90050)) b!830842))

(assert (= (and b!830842 c!90051) b!830843))

(assert (= (and b!830842 (not c!90051)) b!830844))

(declare-fun m!773949 () Bool)

(assert (=> b!830843 m!773949))

(assert (=> b!830452 d!105619))

(declare-fun lt!376955 () Bool)

(declare-fun d!105621 () Bool)

(assert (=> d!105621 (= lt!376955 (select (content!385 (toList!4502 lt!376754)) (tuple2!10161 lt!376524 zeroValueAfter!34)))))

(declare-fun e!463258 () Bool)

(assert (=> d!105621 (= lt!376955 e!463258)))

(declare-fun res!565689 () Bool)

(assert (=> d!105621 (=> (not res!565689) (not e!463258))))

(assert (=> d!105621 (= res!565689 ((_ is Cons!15940) (toList!4502 lt!376754)))))

(assert (=> d!105621 (= (contains!4188 (toList!4502 lt!376754) (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376955)))

(declare-fun b!830845 () Bool)

(declare-fun e!463259 () Bool)

(assert (=> b!830845 (= e!463258 e!463259)))

(declare-fun res!565690 () Bool)

(assert (=> b!830845 (=> res!565690 e!463259)))

(assert (=> b!830845 (= res!565690 (= (h!17069 (toList!4502 lt!376754)) (tuple2!10161 lt!376524 zeroValueAfter!34)))))

(declare-fun b!830846 () Bool)

(assert (=> b!830846 (= e!463259 (contains!4188 (t!22300 (toList!4502 lt!376754)) (tuple2!10161 lt!376524 zeroValueAfter!34)))))

(assert (= (and d!105621 res!565689) b!830845))

(assert (= (and b!830845 (not res!565690)) b!830846))

(declare-fun m!773951 () Bool)

(assert (=> d!105621 m!773951))

(declare-fun m!773953 () Bool)

(assert (=> d!105621 m!773953))

(declare-fun m!773955 () Bool)

(assert (=> b!830846 m!773955))

(assert (=> b!830389 d!105621))

(assert (=> d!105335 d!105341))

(declare-fun d!105623 () Bool)

(declare-fun e!463260 () Bool)

(assert (=> d!105623 e!463260))

(declare-fun res!565691 () Bool)

(assert (=> d!105623 (=> res!565691 e!463260)))

(declare-fun lt!376959 () Bool)

(assert (=> d!105623 (= res!565691 (not lt!376959))))

(declare-fun lt!376958 () Bool)

(assert (=> d!105623 (= lt!376959 lt!376958)))

(declare-fun lt!376957 () Unit!28383)

(declare-fun e!463261 () Unit!28383)

(assert (=> d!105623 (= lt!376957 e!463261)))

(declare-fun c!90052 () Bool)

(assert (=> d!105623 (= c!90052 lt!376958)))

(assert (=> d!105623 (= lt!376958 (containsKey!399 (toList!4502 lt!376569) lt!376568))))

(assert (=> d!105623 (= (contains!4187 lt!376569 lt!376568) lt!376959)))

(declare-fun b!830847 () Bool)

(declare-fun lt!376956 () Unit!28383)

(assert (=> b!830847 (= e!463261 lt!376956)))

(assert (=> b!830847 (= lt!376956 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376569) lt!376568))))

(assert (=> b!830847 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376569) lt!376568))))

(declare-fun b!830848 () Bool)

(declare-fun Unit!28422 () Unit!28383)

(assert (=> b!830848 (= e!463261 Unit!28422)))

(declare-fun b!830849 () Bool)

(assert (=> b!830849 (= e!463260 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376569) lt!376568)))))

(assert (= (and d!105623 c!90052) b!830847))

(assert (= (and d!105623 (not c!90052)) b!830848))

(assert (= (and d!105623 (not res!565691)) b!830849))

(declare-fun m!773957 () Bool)

(assert (=> d!105623 m!773957))

(declare-fun m!773959 () Bool)

(assert (=> b!830847 m!773959))

(assert (=> b!830847 m!773425))

(assert (=> b!830847 m!773425))

(declare-fun m!773961 () Bool)

(assert (=> b!830847 m!773961))

(assert (=> b!830849 m!773425))

(assert (=> b!830849 m!773425))

(assert (=> b!830849 m!773961))

(assert (=> d!105335 d!105623))

(declare-fun d!105625 () Bool)

(assert (=> d!105625 (= (apply!372 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!376568) (apply!372 lt!376569 lt!376568))))

(assert (=> d!105625 true))

(declare-fun _$34!1143 () Unit!28383)

(assert (=> d!105625 (= (choose!1429 lt!376569 lt!376555 zeroValueBefore!34 lt!376568) _$34!1143)))

(declare-fun bs!23197 () Bool)

(assert (= bs!23197 d!105625))

(assert (=> bs!23197 m!772693))

(assert (=> bs!23197 m!772693))

(assert (=> bs!23197 m!772697))

(assert (=> bs!23197 m!772709))

(assert (=> d!105335 d!105625))

(assert (=> d!105335 d!105349))

(assert (=> d!105335 d!105353))

(declare-fun d!105627 () Bool)

(declare-fun e!463262 () Bool)

(assert (=> d!105627 e!463262))

(declare-fun res!565692 () Bool)

(assert (=> d!105627 (=> res!565692 e!463262)))

(declare-fun lt!376963 () Bool)

(assert (=> d!105627 (= res!565692 (not lt!376963))))

(declare-fun lt!376962 () Bool)

(assert (=> d!105627 (= lt!376963 lt!376962)))

(declare-fun lt!376961 () Unit!28383)

(declare-fun e!463263 () Unit!28383)

(assert (=> d!105627 (= lt!376961 e!463263)))

(declare-fun c!90053 () Bool)

(assert (=> d!105627 (= c!90053 lt!376962)))

(assert (=> d!105627 (= lt!376962 (containsKey!399 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(assert (=> d!105627 (= (contains!4187 lt!376754 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376963)))

(declare-fun b!830850 () Bool)

(declare-fun lt!376960 () Unit!28383)

(assert (=> b!830850 (= e!463263 lt!376960)))

(assert (=> b!830850 (= lt!376960 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(assert (=> b!830850 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun b!830851 () Bool)

(declare-fun Unit!28423 () Unit!28383)

(assert (=> b!830851 (= e!463263 Unit!28423)))

(declare-fun b!830852 () Bool)

(assert (=> b!830852 (= e!463262 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (= (and d!105627 c!90053) b!830850))

(assert (= (and d!105627 (not c!90053)) b!830851))

(assert (= (and d!105627 (not res!565692)) b!830852))

(declare-fun m!773963 () Bool)

(assert (=> d!105627 m!773963))

(declare-fun m!773965 () Bool)

(assert (=> b!830850 m!773965))

(assert (=> b!830850 m!773189))

(assert (=> b!830850 m!773189))

(declare-fun m!773967 () Bool)

(assert (=> b!830850 m!773967))

(assert (=> b!830852 m!773189))

(assert (=> b!830852 m!773189))

(assert (=> b!830852 m!773967))

(assert (=> d!105281 d!105627))

(declare-fun b!830853 () Bool)

(declare-fun e!463264 () Option!419)

(assert (=> b!830853 (= e!463264 (Some!418 (_2!5091 (h!17069 lt!376752))))))

(declare-fun b!830854 () Bool)

(declare-fun e!463265 () Option!419)

(assert (=> b!830854 (= e!463264 e!463265)))

(declare-fun c!90055 () Bool)

(assert (=> b!830854 (= c!90055 (and ((_ is Cons!15940) lt!376752) (not (= (_1!5091 (h!17069 lt!376752)) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))))

(declare-fun b!830856 () Bool)

(assert (=> b!830856 (= e!463265 None!417)))

(declare-fun b!830855 () Bool)

(assert (=> b!830855 (= e!463265 (getValueByKey!413 (t!22300 lt!376752) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun c!90054 () Bool)

(declare-fun d!105629 () Bool)

(assert (=> d!105629 (= c!90054 (and ((_ is Cons!15940) lt!376752) (= (_1!5091 (h!17069 lt!376752)) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (=> d!105629 (= (getValueByKey!413 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) e!463264)))

(assert (= (and d!105629 c!90054) b!830853))

(assert (= (and d!105629 (not c!90054)) b!830854))

(assert (= (and b!830854 c!90055) b!830855))

(assert (= (and b!830854 (not c!90055)) b!830856))

(declare-fun m!773969 () Bool)

(assert (=> b!830855 m!773969))

(assert (=> d!105281 d!105629))

(declare-fun d!105631 () Bool)

(assert (=> d!105631 (= (getValueByKey!413 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun lt!376964 () Unit!28383)

(assert (=> d!105631 (= lt!376964 (choose!1426 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun e!463266 () Bool)

(assert (=> d!105631 e!463266))

(declare-fun res!565693 () Bool)

(assert (=> d!105631 (=> (not res!565693) (not e!463266))))

(assert (=> d!105631 (= res!565693 (isStrictlySorted!437 lt!376752))))

(assert (=> d!105631 (= (lemmaContainsTupThenGetReturnValue!230 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376964)))

(declare-fun b!830857 () Bool)

(declare-fun res!565694 () Bool)

(assert (=> b!830857 (=> (not res!565694) (not e!463266))))

(assert (=> b!830857 (= res!565694 (containsKey!399 lt!376752 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun b!830858 () Bool)

(assert (=> b!830858 (= e!463266 (contains!4188 lt!376752 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (= (and d!105631 res!565693) b!830857))

(assert (= (and b!830857 res!565694) b!830858))

(assert (=> d!105631 m!773183))

(declare-fun m!773971 () Bool)

(assert (=> d!105631 m!773971))

(declare-fun m!773973 () Bool)

(assert (=> d!105631 m!773973))

(declare-fun m!773975 () Bool)

(assert (=> b!830857 m!773975))

(declare-fun m!773977 () Bool)

(assert (=> b!830858 m!773977))

(assert (=> d!105281 d!105631))

(declare-fun b!830859 () Bool)

(declare-fun res!565695 () Bool)

(declare-fun e!463268 () Bool)

(assert (=> b!830859 (=> (not res!565695) (not e!463268))))

(declare-fun lt!376965 () List!15944)

(assert (=> b!830859 (= res!565695 (containsKey!399 lt!376965 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun e!463270 () List!15944)

(declare-fun c!90056 () Bool)

(declare-fun c!90058 () Bool)

(declare-fun b!830860 () Bool)

(assert (=> b!830860 (= e!463270 (ite c!90058 (t!22300 (toList!4502 lt!376510)) (ite c!90056 (Cons!15940 (h!17069 (toList!4502 lt!376510)) (t!22300 (toList!4502 lt!376510))) Nil!15941)))))

(declare-fun b!830861 () Bool)

(assert (=> b!830861 (= c!90056 (and ((_ is Cons!15940) (toList!4502 lt!376510)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376510))) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(declare-fun e!463267 () List!15944)

(declare-fun e!463269 () List!15944)

(assert (=> b!830861 (= e!463267 e!463269)))

(declare-fun b!830862 () Bool)

(assert (=> b!830862 (= e!463270 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376510)) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun b!830863 () Bool)

(declare-fun e!463271 () List!15944)

(declare-fun call!36280 () List!15944)

(assert (=> b!830863 (= e!463271 call!36280)))

(declare-fun b!830864 () Bool)

(declare-fun call!36282 () List!15944)

(assert (=> b!830864 (= e!463267 call!36282)))

(declare-fun b!830865 () Bool)

(declare-fun call!36281 () List!15944)

(assert (=> b!830865 (= e!463269 call!36281)))

(declare-fun bm!36277 () Bool)

(assert (=> bm!36277 (= call!36281 call!36282)))

(declare-fun b!830866 () Bool)

(assert (=> b!830866 (= e!463268 (contains!4188 lt!376965 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(declare-fun d!105633 () Bool)

(assert (=> d!105633 e!463268))

(declare-fun res!565696 () Bool)

(assert (=> d!105633 (=> (not res!565696) (not e!463268))))

(assert (=> d!105633 (= res!565696 (isStrictlySorted!437 lt!376965))))

(assert (=> d!105633 (= lt!376965 e!463271)))

(declare-fun c!90059 () Bool)

(assert (=> d!105633 (= c!90059 (and ((_ is Cons!15940) (toList!4502 lt!376510)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376510))) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (=> d!105633 (isStrictlySorted!437 (toList!4502 lt!376510))))

(assert (=> d!105633 (= (insertStrictlySorted!269 (toList!4502 lt!376510) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376965)))

(declare-fun bm!36278 () Bool)

(assert (=> bm!36278 (= call!36282 call!36280)))

(declare-fun bm!36279 () Bool)

(assert (=> bm!36279 (= call!36280 ($colon$colon!535 e!463270 (ite c!90059 (h!17069 (toList!4502 lt!376510)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))))

(declare-fun c!90057 () Bool)

(assert (=> bm!36279 (= c!90057 c!90059)))

(declare-fun b!830867 () Bool)

(assert (=> b!830867 (= e!463271 e!463267)))

(assert (=> b!830867 (= c!90058 (and ((_ is Cons!15940) (toList!4502 lt!376510)) (= (_1!5091 (h!17069 (toList!4502 lt!376510))) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(declare-fun b!830868 () Bool)

(assert (=> b!830868 (= e!463269 call!36281)))

(assert (= (and d!105633 c!90059) b!830863))

(assert (= (and d!105633 (not c!90059)) b!830867))

(assert (= (and b!830867 c!90058) b!830864))

(assert (= (and b!830867 (not c!90058)) b!830861))

(assert (= (and b!830861 c!90056) b!830868))

(assert (= (and b!830861 (not c!90056)) b!830865))

(assert (= (or b!830868 b!830865) bm!36277))

(assert (= (or b!830864 bm!36277) bm!36278))

(assert (= (or b!830863 bm!36278) bm!36279))

(assert (= (and bm!36279 c!90057) b!830862))

(assert (= (and bm!36279 (not c!90057)) b!830860))

(assert (= (and d!105633 res!565696) b!830859))

(assert (= (and b!830859 res!565695) b!830866))

(declare-fun m!773979 () Bool)

(assert (=> b!830859 m!773979))

(declare-fun m!773981 () Bool)

(assert (=> b!830866 m!773981))

(declare-fun m!773983 () Bool)

(assert (=> b!830862 m!773983))

(declare-fun m!773985 () Bool)

(assert (=> d!105633 m!773985))

(declare-fun m!773987 () Bool)

(assert (=> d!105633 m!773987))

(declare-fun m!773989 () Bool)

(assert (=> bm!36279 m!773989))

(assert (=> d!105281 d!105633))

(declare-fun d!105635 () Bool)

(assert (=> d!105635 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(declare-fun lt!376966 () Unit!28383)

(assert (=> d!105635 (= lt!376966 (choose!1430 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(declare-fun e!463272 () Bool)

(assert (=> d!105635 e!463272))

(declare-fun res!565697 () Bool)

(assert (=> d!105635 (=> (not res!565697) (not e!463272))))

(assert (=> d!105635 (= res!565697 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (=> d!105635 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525) lt!376966)))

(declare-fun b!830869 () Bool)

(assert (=> b!830869 (= e!463272 (containsKey!399 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))

(assert (= (and d!105635 res!565697) b!830869))

(assert (=> d!105635 m!773129))

(assert (=> d!105635 m!773129))

(assert (=> d!105635 m!773131))

(declare-fun m!773991 () Bool)

(assert (=> d!105635 m!773991))

(declare-fun m!773993 () Bool)

(assert (=> d!105635 m!773993))

(assert (=> b!830869 m!773125))

(assert (=> b!830376 d!105635))

(declare-fun d!105637 () Bool)

(assert (=> d!105637 (= (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525))))))

(declare-fun bs!23198 () Bool)

(assert (= bs!23198 d!105637))

(assert (=> bs!23198 m!773129))

(declare-fun m!773995 () Bool)

(assert (=> bs!23198 m!773995))

(assert (=> b!830376 d!105637))

(declare-fun e!463273 () Option!419)

(declare-fun b!830870 () Bool)

(assert (=> b!830870 (= e!463273 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))))

(declare-fun b!830871 () Bool)

(declare-fun e!463274 () Option!419)

(assert (=> b!830871 (= e!463273 e!463274)))

(declare-fun c!90061 () Bool)

(assert (=> b!830871 (= c!90061 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) lt!376525))))))

(declare-fun b!830873 () Bool)

(assert (=> b!830873 (= e!463274 None!417)))

(declare-fun b!830872 () Bool)

(assert (=> b!830872 (= e!463274 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) lt!376525))))

(declare-fun d!105639 () Bool)

(declare-fun c!90060 () Bool)

(assert (=> d!105639 (= c!90060 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) lt!376525)))))

(assert (=> d!105639 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525) e!463273)))

(assert (= (and d!105639 c!90060) b!830870))

(assert (= (and d!105639 (not c!90060)) b!830871))

(assert (= (and b!830871 c!90061) b!830872))

(assert (= (and b!830871 (not c!90061)) b!830873))

(declare-fun m!773997 () Bool)

(assert (=> b!830872 m!773997))

(assert (=> b!830376 d!105639))

(declare-fun d!105641 () Bool)

(declare-fun res!565698 () Bool)

(declare-fun e!463275 () Bool)

(assert (=> d!105641 (=> res!565698 e!463275)))

(assert (=> d!105641 (= res!565698 (and ((_ is Cons!15940) lt!376770) (= (_1!5091 (h!17069 lt!376770)) (_1!5091 lt!376417))))))

(assert (=> d!105641 (= (containsKey!399 lt!376770 (_1!5091 lt!376417)) e!463275)))

(declare-fun b!830874 () Bool)

(declare-fun e!463276 () Bool)

(assert (=> b!830874 (= e!463275 e!463276)))

(declare-fun res!565699 () Bool)

(assert (=> b!830874 (=> (not res!565699) (not e!463276))))

(assert (=> b!830874 (= res!565699 (and (or (not ((_ is Cons!15940) lt!376770)) (bvsle (_1!5091 (h!17069 lt!376770)) (_1!5091 lt!376417))) ((_ is Cons!15940) lt!376770) (bvslt (_1!5091 (h!17069 lt!376770)) (_1!5091 lt!376417))))))

(declare-fun b!830875 () Bool)

(assert (=> b!830875 (= e!463276 (containsKey!399 (t!22300 lt!376770) (_1!5091 lt!376417)))))

(assert (= (and d!105641 (not res!565698)) b!830874))

(assert (= (and b!830874 res!565699) b!830875))

(declare-fun m!773999 () Bool)

(assert (=> b!830875 m!773999))

(assert (=> b!830413 d!105641))

(declare-fun d!105643 () Bool)

(declare-fun e!463277 () Bool)

(assert (=> d!105643 e!463277))

(declare-fun res!565700 () Bool)

(assert (=> d!105643 (=> res!565700 e!463277)))

(declare-fun lt!376970 () Bool)

(assert (=> d!105643 (= res!565700 (not lt!376970))))

(declare-fun lt!376969 () Bool)

(assert (=> d!105643 (= lt!376970 lt!376969)))

(declare-fun lt!376968 () Unit!28383)

(declare-fun e!463278 () Unit!28383)

(assert (=> d!105643 (= lt!376968 e!463278)))

(declare-fun c!90062 () Bool)

(assert (=> d!105643 (= c!90062 lt!376969)))

(assert (=> d!105643 (= lt!376969 (containsKey!399 (toList!4502 lt!376669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105643 (= (contains!4187 lt!376669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!376970)))

(declare-fun b!830876 () Bool)

(declare-fun lt!376967 () Unit!28383)

(assert (=> b!830876 (= e!463278 lt!376967)))

(assert (=> b!830876 (= lt!376967 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!830876 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830877 () Bool)

(declare-fun Unit!28424 () Unit!28383)

(assert (=> b!830877 (= e!463278 Unit!28424)))

(declare-fun b!830878 () Bool)

(assert (=> b!830878 (= e!463277 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105643 c!90062) b!830876))

(assert (= (and d!105643 (not c!90062)) b!830877))

(assert (= (and d!105643 (not res!565700)) b!830878))

(declare-fun m!774001 () Bool)

(assert (=> d!105643 m!774001))

(declare-fun m!774003 () Bool)

(assert (=> b!830876 m!774003))

(declare-fun m!774005 () Bool)

(assert (=> b!830876 m!774005))

(assert (=> b!830876 m!774005))

(declare-fun m!774007 () Bool)

(assert (=> b!830876 m!774007))

(assert (=> b!830878 m!774005))

(assert (=> b!830878 m!774005))

(assert (=> b!830878 m!774007))

(assert (=> b!830281 d!105643))

(declare-fun d!105645 () Bool)

(declare-fun res!565701 () Bool)

(declare-fun e!463279 () Bool)

(assert (=> d!105645 (=> res!565701 e!463279)))

(assert (=> d!105645 (= res!565701 (and ((_ is Cons!15940) (toList!4502 lt!376546)) (= (_1!5091 (h!17069 (toList!4502 lt!376546))) (_1!5091 lt!376416))))))

(assert (=> d!105645 (= (containsKey!399 (toList!4502 lt!376546) (_1!5091 lt!376416)) e!463279)))

(declare-fun b!830879 () Bool)

(declare-fun e!463280 () Bool)

(assert (=> b!830879 (= e!463279 e!463280)))

(declare-fun res!565702 () Bool)

(assert (=> b!830879 (=> (not res!565702) (not e!463280))))

(assert (=> b!830879 (= res!565702 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376546))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376546))) (_1!5091 lt!376416))) ((_ is Cons!15940) (toList!4502 lt!376546)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376546))) (_1!5091 lt!376416))))))

(declare-fun b!830880 () Bool)

(assert (=> b!830880 (= e!463280 (containsKey!399 (t!22300 (toList!4502 lt!376546)) (_1!5091 lt!376416)))))

(assert (= (and d!105645 (not res!565701)) b!830879))

(assert (= (and b!830879 res!565702) b!830880))

(declare-fun m!774009 () Bool)

(assert (=> b!830880 m!774009))

(assert (=> d!105381 d!105645))

(assert (=> b!830182 d!105451))

(assert (=> b!830182 d!105359))

(declare-fun d!105647 () Bool)

(declare-fun c!90063 () Bool)

(assert (=> d!105647 (= c!90063 ((_ is Nil!15941) (toList!4502 lt!376546)))))

(declare-fun e!463281 () (InoxSet tuple2!10160))

(assert (=> d!105647 (= (content!385 (toList!4502 lt!376546)) e!463281)))

(declare-fun b!830881 () Bool)

(assert (=> b!830881 (= e!463281 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!830882 () Bool)

(assert (=> b!830882 (= e!463281 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376546)) true) (content!385 (t!22300 (toList!4502 lt!376546)))))))

(assert (= (and d!105647 c!90063) b!830881))

(assert (= (and d!105647 (not c!90063)) b!830882))

(declare-fun m!774011 () Bool)

(assert (=> b!830882 m!774011))

(assert (=> b!830882 m!773539))

(assert (=> d!105225 d!105647))

(declare-fun b!830883 () Bool)

(declare-fun e!463282 () Option!419)

(assert (=> b!830883 (= e!463282 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376778)))))))

(declare-fun b!830884 () Bool)

(declare-fun e!463283 () Option!419)

(assert (=> b!830884 (= e!463282 e!463283)))

(declare-fun c!90065 () Bool)

(assert (=> b!830884 (= c!90065 (and ((_ is Cons!15940) (toList!4502 lt!376778)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376778))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830886 () Bool)

(assert (=> b!830886 (= e!463283 None!417)))

(declare-fun b!830885 () Bool)

(assert (=> b!830885 (= e!463283 (getValueByKey!413 (t!22300 (toList!4502 lt!376778)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!90064 () Bool)

(declare-fun d!105649 () Bool)

(assert (=> d!105649 (= c!90064 (and ((_ is Cons!15940) (toList!4502 lt!376778)) (= (_1!5091 (h!17069 (toList!4502 lt!376778))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105649 (= (getValueByKey!413 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463282)))

(assert (= (and d!105649 c!90064) b!830883))

(assert (= (and d!105649 (not c!90064)) b!830884))

(assert (= (and b!830884 c!90065) b!830885))

(assert (= (and b!830884 (not c!90065)) b!830886))

(declare-fun m!774013 () Bool)

(assert (=> b!830885 m!774013))

(assert (=> b!830426 d!105649))

(declare-fun b!830887 () Bool)

(declare-fun e!463285 () Bool)

(declare-fun e!463290 () Bool)

(assert (=> b!830887 (= e!463285 e!463290)))

(assert (=> b!830887 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun res!565705 () Bool)

(declare-fun lt!376975 () ListLongMap!8973)

(assert (=> b!830887 (= res!565705 (contains!4187 lt!376975 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830887 (=> (not res!565705) (not e!463290))))

(declare-fun b!830888 () Bool)

(declare-fun e!463287 () Bool)

(assert (=> b!830888 (= e!463287 (= lt!376975 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830889 () Bool)

(assert (=> b!830889 (= e!463287 (isEmpty!659 lt!376975))))

(declare-fun b!830890 () Bool)

(declare-fun e!463288 () Bool)

(assert (=> b!830890 (= e!463288 e!463285)))

(declare-fun c!90068 () Bool)

(declare-fun e!463284 () Bool)

(assert (=> b!830890 (= c!90068 e!463284)))

(declare-fun res!565703 () Bool)

(assert (=> b!830890 (=> (not res!565703) (not e!463284))))

(assert (=> b!830890 (= res!565703 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830891 () Bool)

(assert (=> b!830891 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> b!830891 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22734 _values!788)))))

(assert (=> b!830891 (= e!463290 (= (apply!372 lt!376975 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105651 () Bool)

(assert (=> d!105651 e!463288))

(declare-fun res!565704 () Bool)

(assert (=> d!105651 (=> (not res!565704) (not e!463288))))

(assert (=> d!105651 (= res!565704 (not (contains!4187 lt!376975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463286 () ListLongMap!8973)

(assert (=> d!105651 (= lt!376975 e!463286)))

(declare-fun c!90067 () Bool)

(assert (=> d!105651 (= c!90067 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105651 (validMask!0 mask!1312)))

(assert (=> d!105651 (= (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!376975)))

(declare-fun b!830892 () Bool)

(assert (=> b!830892 (= e!463285 e!463287)))

(declare-fun c!90066 () Bool)

(assert (=> b!830892 (= c!90066 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!830893 () Bool)

(declare-fun e!463289 () ListLongMap!8973)

(declare-fun call!36283 () ListLongMap!8973)

(assert (=> b!830893 (= e!463289 call!36283)))

(declare-fun b!830894 () Bool)

(assert (=> b!830894 (= e!463284 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!830894 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!830895 () Bool)

(declare-fun lt!376977 () Unit!28383)

(declare-fun lt!376976 () Unit!28383)

(assert (=> b!830895 (= lt!376977 lt!376976)))

(declare-fun lt!376973 () (_ BitVec 64))

(declare-fun lt!376974 () (_ BitVec 64))

(declare-fun lt!376971 () V!25275)

(declare-fun lt!376972 () ListLongMap!8973)

(assert (=> b!830895 (not (contains!4187 (+!2010 lt!376972 (tuple2!10161 lt!376973 lt!376971)) lt!376974))))

(assert (=> b!830895 (= lt!376976 (addStillNotContains!198 lt!376972 lt!376973 lt!376971 lt!376974))))

(assert (=> b!830895 (= lt!376974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830895 (= lt!376971 (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830895 (= lt!376973 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!830895 (= lt!376972 call!36283)))

(assert (=> b!830895 (= e!463289 (+!2010 call!36283 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830896 () Bool)

(declare-fun res!565706 () Bool)

(assert (=> b!830896 (=> (not res!565706) (not e!463288))))

(assert (=> b!830896 (= res!565706 (not (contains!4187 lt!376975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830897 () Bool)

(assert (=> b!830897 (= e!463286 (ListLongMap!8974 Nil!15941))))

(declare-fun bm!36280 () Bool)

(assert (=> bm!36280 (= call!36283 (getCurrentListMapNoExtraKeys!2530 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830898 () Bool)

(assert (=> b!830898 (= e!463286 e!463289)))

(declare-fun c!90069 () Bool)

(assert (=> b!830898 (= c!90069 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!105651 c!90067) b!830897))

(assert (= (and d!105651 (not c!90067)) b!830898))

(assert (= (and b!830898 c!90069) b!830895))

(assert (= (and b!830898 (not c!90069)) b!830893))

(assert (= (or b!830895 b!830893) bm!36280))

(assert (= (and d!105651 res!565704) b!830896))

(assert (= (and b!830896 res!565706) b!830890))

(assert (= (and b!830890 res!565703) b!830894))

(assert (= (and b!830890 c!90068) b!830887))

(assert (= (and b!830890 (not c!90068)) b!830892))

(assert (= (and b!830887 res!565705) b!830891))

(assert (= (and b!830892 c!90066) b!830888))

(assert (= (and b!830892 (not c!90066)) b!830889))

(declare-fun b_lambda!11373 () Bool)

(assert (=> (not b_lambda!11373) (not b!830891)))

(assert (=> b!830891 t!22306))

(declare-fun b_and!22529 () Bool)

(assert (= b_and!22527 (and (=> t!22306 result!8007) b_and!22529)))

(declare-fun b_lambda!11375 () Bool)

(assert (=> (not b_lambda!11375) (not b!830895)))

(assert (=> b!830895 t!22306))

(declare-fun b_and!22531 () Bool)

(assert (= b_and!22529 (and (=> t!22306 result!8007) b_and!22531)))

(declare-fun m!774015 () Bool)

(assert (=> b!830889 m!774015))

(declare-fun m!774017 () Bool)

(assert (=> bm!36280 m!774017))

(assert (=> b!830888 m!774017))

(assert (=> b!830894 m!773563))

(assert (=> b!830894 m!773563))

(assert (=> b!830894 m!773565))

(declare-fun m!774019 () Bool)

(assert (=> d!105651 m!774019))

(assert (=> d!105651 m!772479))

(assert (=> b!830887 m!773563))

(assert (=> b!830887 m!773563))

(declare-fun m!774021 () Bool)

(assert (=> b!830887 m!774021))

(assert (=> b!830898 m!773563))

(assert (=> b!830898 m!773563))

(assert (=> b!830898 m!773565))

(assert (=> b!830891 m!773563))

(assert (=> b!830891 m!772615))

(assert (=> b!830891 m!773563))

(declare-fun m!774023 () Bool)

(assert (=> b!830891 m!774023))

(assert (=> b!830891 m!773719))

(assert (=> b!830891 m!772615))

(assert (=> b!830891 m!773721))

(assert (=> b!830891 m!773719))

(declare-fun m!774025 () Bool)

(assert (=> b!830896 m!774025))

(assert (=> b!830895 m!773563))

(declare-fun m!774027 () Bool)

(assert (=> b!830895 m!774027))

(assert (=> b!830895 m!773719))

(assert (=> b!830895 m!772615))

(assert (=> b!830895 m!773721))

(assert (=> b!830895 m!773719))

(declare-fun m!774029 () Bool)

(assert (=> b!830895 m!774029))

(assert (=> b!830895 m!774027))

(declare-fun m!774031 () Bool)

(assert (=> b!830895 m!774031))

(assert (=> b!830895 m!772615))

(declare-fun m!774033 () Bool)

(assert (=> b!830895 m!774033))

(assert (=> b!830273 d!105651))

(assert (=> b!830502 d!105411))

(assert (=> b!830502 d!105413))

(declare-fun d!105653 () Bool)

(declare-fun res!565707 () Bool)

(declare-fun e!463291 () Bool)

(assert (=> d!105653 (=> res!565707 e!463291)))

(assert (=> d!105653 (= res!565707 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105653 (= (containsKey!399 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000) e!463291)))

(declare-fun b!830899 () Bool)

(declare-fun e!463292 () Bool)

(assert (=> b!830899 (= e!463291 e!463292)))

(declare-fun res!565708 () Bool)

(assert (=> b!830899 (=> (not res!565708) (not e!463292))))

(assert (=> b!830899 (= res!565708 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376595))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376595))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376595)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376595))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830900 () Bool)

(assert (=> b!830900 (= e!463292 (containsKey!399 (t!22300 (toList!4502 lt!376595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105653 (not res!565707)) b!830899))

(assert (= (and b!830899 res!565708) b!830900))

(declare-fun m!774035 () Bool)

(assert (=> b!830900 m!774035))

(assert (=> d!105315 d!105653))

(declare-fun d!105655 () Bool)

(assert (=> d!105655 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376978 () Unit!28383)

(assert (=> d!105655 (= lt!376978 (choose!1430 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463293 () Bool)

(assert (=> d!105655 e!463293))

(declare-fun res!565709 () Bool)

(assert (=> d!105655 (=> (not res!565709) (not e!463293))))

(assert (=> d!105655 (= res!565709 (isStrictlySorted!437 (toList!4502 lt!376611)))))

(assert (=> d!105655 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!376978)))

(declare-fun b!830901 () Bool)

(assert (=> b!830901 (= e!463293 (containsKey!399 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!105655 res!565709) b!830901))

(assert (=> d!105655 m!772789))

(assert (=> d!105655 m!772789))

(assert (=> d!105655 m!772839))

(declare-fun m!774037 () Bool)

(assert (=> d!105655 m!774037))

(declare-fun m!774039 () Bool)

(assert (=> d!105655 m!774039))

(assert (=> b!830901 m!772835))

(assert (=> b!830231 d!105655))

(declare-fun d!105657 () Bool)

(assert (=> d!105657 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23199 () Bool)

(assert (= bs!23199 d!105657))

(assert (=> bs!23199 m!772789))

(declare-fun m!774041 () Bool)

(assert (=> bs!23199 m!774041))

(assert (=> b!830231 d!105657))

(assert (=> b!830231 d!105257))

(declare-fun d!105659 () Bool)

(declare-fun e!463294 () Bool)

(assert (=> d!105659 e!463294))

(declare-fun res!565710 () Bool)

(assert (=> d!105659 (=> res!565710 e!463294)))

(declare-fun lt!376982 () Bool)

(assert (=> d!105659 (= res!565710 (not lt!376982))))

(declare-fun lt!376981 () Bool)

(assert (=> d!105659 (= lt!376982 lt!376981)))

(declare-fun lt!376980 () Unit!28383)

(declare-fun e!463295 () Unit!28383)

(assert (=> d!105659 (= lt!376980 e!463295)))

(declare-fun c!90070 () Bool)

(assert (=> d!105659 (= c!90070 lt!376981)))

(assert (=> d!105659 (= lt!376981 (containsKey!399 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105659 (= (contains!4187 lt!376778 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376982)))

(declare-fun b!830902 () Bool)

(declare-fun lt!376979 () Unit!28383)

(assert (=> b!830902 (= e!463295 lt!376979)))

(assert (=> b!830902 (= lt!376979 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!830902 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830903 () Bool)

(declare-fun Unit!28425 () Unit!28383)

(assert (=> b!830903 (= e!463295 Unit!28425)))

(declare-fun b!830904 () Bool)

(assert (=> b!830904 (= e!463294 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376778) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105659 c!90070) b!830902))

(assert (= (and d!105659 (not c!90070)) b!830903))

(assert (= (and d!105659 (not res!565710)) b!830904))

(declare-fun m!774043 () Bool)

(assert (=> d!105659 m!774043))

(declare-fun m!774045 () Bool)

(assert (=> b!830902 m!774045))

(assert (=> b!830902 m!773285))

(assert (=> b!830902 m!773285))

(declare-fun m!774047 () Bool)

(assert (=> b!830902 m!774047))

(assert (=> b!830904 m!773285))

(assert (=> b!830904 m!773285))

(assert (=> b!830904 m!774047))

(assert (=> d!105307 d!105659))

(declare-fun b!830905 () Bool)

(declare-fun e!463296 () Option!419)

(assert (=> b!830905 (= e!463296 (Some!418 (_2!5091 (h!17069 lt!376776))))))

(declare-fun b!830906 () Bool)

(declare-fun e!463297 () Option!419)

(assert (=> b!830906 (= e!463296 e!463297)))

(declare-fun c!90072 () Bool)

(assert (=> b!830906 (= c!90072 (and ((_ is Cons!15940) lt!376776) (not (= (_1!5091 (h!17069 lt!376776)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!830908 () Bool)

(assert (=> b!830908 (= e!463297 None!417)))

(declare-fun b!830907 () Bool)

(assert (=> b!830907 (= e!463297 (getValueByKey!413 (t!22300 lt!376776) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!90071 () Bool)

(declare-fun d!105661 () Bool)

(assert (=> d!105661 (= c!90071 (and ((_ is Cons!15940) lt!376776) (= (_1!5091 (h!17069 lt!376776)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105661 (= (getValueByKey!413 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463296)))

(assert (= (and d!105661 c!90071) b!830905))

(assert (= (and d!105661 (not c!90071)) b!830906))

(assert (= (and b!830906 c!90072) b!830907))

(assert (= (and b!830906 (not c!90072)) b!830908))

(declare-fun m!774049 () Bool)

(assert (=> b!830907 m!774049))

(assert (=> d!105307 d!105661))

(declare-fun d!105663 () Bool)

(assert (=> d!105663 (= (getValueByKey!413 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!376983 () Unit!28383)

(assert (=> d!105663 (= lt!376983 (choose!1426 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463298 () Bool)

(assert (=> d!105663 e!463298))

(declare-fun res!565711 () Bool)

(assert (=> d!105663 (=> (not res!565711) (not e!463298))))

(assert (=> d!105663 (= res!565711 (isStrictlySorted!437 lt!376776))))

(assert (=> d!105663 (= (lemmaContainsTupThenGetReturnValue!230 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376983)))

(declare-fun b!830909 () Bool)

(declare-fun res!565712 () Bool)

(assert (=> b!830909 (=> (not res!565712) (not e!463298))))

(assert (=> b!830909 (= res!565712 (containsKey!399 lt!376776 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830910 () Bool)

(assert (=> b!830910 (= e!463298 (contains!4188 lt!376776 (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105663 res!565711) b!830909))

(assert (= (and b!830909 res!565712) b!830910))

(assert (=> d!105663 m!773279))

(declare-fun m!774051 () Bool)

(assert (=> d!105663 m!774051))

(declare-fun m!774053 () Bool)

(assert (=> d!105663 m!774053))

(declare-fun m!774055 () Bool)

(assert (=> b!830909 m!774055))

(declare-fun m!774057 () Bool)

(assert (=> b!830910 m!774057))

(assert (=> d!105307 d!105663))

(declare-fun b!830911 () Bool)

(declare-fun res!565713 () Bool)

(declare-fun e!463300 () Bool)

(assert (=> b!830911 (=> (not res!565713) (not e!463300))))

(declare-fun lt!376984 () List!15944)

(assert (=> b!830911 (= res!565713 (containsKey!399 lt!376984 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463302 () List!15944)

(declare-fun b!830912 () Bool)

(declare-fun c!90075 () Bool)

(declare-fun c!90073 () Bool)

(assert (=> b!830912 (= e!463302 (ite c!90075 (t!22300 (toList!4502 call!36227)) (ite c!90073 (Cons!15940 (h!17069 (toList!4502 call!36227)) (t!22300 (toList!4502 call!36227))) Nil!15941)))))

(declare-fun b!830913 () Bool)

(assert (=> b!830913 (= c!90073 (and ((_ is Cons!15940) (toList!4502 call!36227)) (bvsgt (_1!5091 (h!17069 (toList!4502 call!36227))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!463299 () List!15944)

(declare-fun e!463301 () List!15944)

(assert (=> b!830913 (= e!463299 e!463301)))

(declare-fun b!830914 () Bool)

(assert (=> b!830914 (= e!463302 (insertStrictlySorted!269 (t!22300 (toList!4502 call!36227)) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!830915 () Bool)

(declare-fun e!463303 () List!15944)

(declare-fun call!36284 () List!15944)

(assert (=> b!830915 (= e!463303 call!36284)))

(declare-fun b!830916 () Bool)

(declare-fun call!36286 () List!15944)

(assert (=> b!830916 (= e!463299 call!36286)))

(declare-fun b!830917 () Bool)

(declare-fun call!36285 () List!15944)

(assert (=> b!830917 (= e!463301 call!36285)))

(declare-fun bm!36281 () Bool)

(assert (=> bm!36281 (= call!36285 call!36286)))

(declare-fun b!830918 () Bool)

(assert (=> b!830918 (= e!463300 (contains!4188 lt!376984 (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!105665 () Bool)

(assert (=> d!105665 e!463300))

(declare-fun res!565714 () Bool)

(assert (=> d!105665 (=> (not res!565714) (not e!463300))))

(assert (=> d!105665 (= res!565714 (isStrictlySorted!437 lt!376984))))

(assert (=> d!105665 (= lt!376984 e!463303)))

(declare-fun c!90076 () Bool)

(assert (=> d!105665 (= c!90076 (and ((_ is Cons!15940) (toList!4502 call!36227)) (bvslt (_1!5091 (h!17069 (toList!4502 call!36227))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105665 (isStrictlySorted!437 (toList!4502 call!36227))))

(assert (=> d!105665 (= (insertStrictlySorted!269 (toList!4502 call!36227) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!376984)))

(declare-fun bm!36282 () Bool)

(assert (=> bm!36282 (= call!36286 call!36284)))

(declare-fun bm!36283 () Bool)

(assert (=> bm!36283 (= call!36284 ($colon$colon!535 e!463302 (ite c!90076 (h!17069 (toList!4502 call!36227)) (tuple2!10161 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90074 () Bool)

(assert (=> bm!36283 (= c!90074 c!90076)))

(declare-fun b!830919 () Bool)

(assert (=> b!830919 (= e!463303 e!463299)))

(assert (=> b!830919 (= c!90075 (and ((_ is Cons!15940) (toList!4502 call!36227)) (= (_1!5091 (h!17069 (toList!4502 call!36227))) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) (get!11823 (select (arr!22313 _values!788) #b00000000000000000000000000000000) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830920 () Bool)

(assert (=> b!830920 (= e!463301 call!36285)))

(assert (= (and d!105665 c!90076) b!830915))

(assert (= (and d!105665 (not c!90076)) b!830919))

(assert (= (and b!830919 c!90075) b!830916))

(assert (= (and b!830919 (not c!90075)) b!830913))

(assert (= (and b!830913 c!90073) b!830920))

(assert (= (and b!830913 (not c!90073)) b!830917))

(assert (= (or b!830920 b!830917) bm!36281))

(assert (= (or b!830916 bm!36281) bm!36282))

(assert (= (or b!830915 bm!36282) bm!36283))

(assert (= (and bm!36283 c!90074) b!830914))

(assert (= (and bm!36283 (not c!90074)) b!830912))

(assert (= (and d!105665 res!565714) b!830911))

(assert (= (and b!830911 res!565713) b!830918))

(declare-fun m!774059 () Bool)

(assert (=> b!830911 m!774059))

(declare-fun m!774061 () Bool)

(assert (=> b!830918 m!774061))

(declare-fun m!774063 () Bool)

(assert (=> b!830914 m!774063))

(declare-fun m!774065 () Bool)

(assert (=> d!105665 m!774065))

(declare-fun m!774067 () Bool)

(assert (=> d!105665 m!774067))

(declare-fun m!774069 () Bool)

(assert (=> bm!36283 m!774069))

(assert (=> d!105307 d!105665))

(declare-fun d!105667 () Bool)

(assert (=> d!105667 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!376568)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!376568)))))

(assert (=> d!105349 d!105667))

(declare-fun e!463304 () Option!419)

(declare-fun b!830921 () Bool)

(assert (=> b!830921 (= e!463304 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))))

(declare-fun b!830922 () Bool)

(declare-fun e!463305 () Option!419)

(assert (=> b!830922 (= e!463304 e!463305)))

(declare-fun c!90078 () Bool)

(assert (=> b!830922 (= c!90078 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))))) lt!376568))))))

(declare-fun b!830924 () Bool)

(assert (=> b!830924 (= e!463305 None!417)))

(declare-fun b!830923 () Bool)

(assert (=> b!830923 (= e!463305 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)))) lt!376568))))

(declare-fun c!90077 () Bool)

(declare-fun d!105669 () Bool)

(assert (=> d!105669 (= c!90077 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))))) lt!376568)))))

(assert (=> d!105669 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376569 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!376568) e!463304)))

(assert (= (and d!105669 c!90077) b!830921))

(assert (= (and d!105669 (not c!90077)) b!830922))

(assert (= (and b!830922 c!90078) b!830923))

(assert (= (and b!830922 (not c!90078)) b!830924))

(declare-fun m!774071 () Bool)

(assert (=> b!830923 m!774071))

(assert (=> d!105349 d!105669))

(declare-fun d!105671 () Bool)

(assert (=> d!105671 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(declare-fun lt!376985 () Unit!28383)

(assert (=> d!105671 (= lt!376985 (choose!1430 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(declare-fun e!463306 () Bool)

(assert (=> d!105671 e!463306))

(declare-fun res!565715 () Bool)

(assert (=> d!105671 (=> (not res!565715) (not e!463306))))

(assert (=> d!105671 (= res!565715 (isStrictlySorted!437 (toList!4502 lt!376607)))))

(assert (=> d!105671 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376607) (_1!5091 lt!376416)) lt!376985)))

(declare-fun b!830925 () Bool)

(assert (=> b!830925 (= e!463306 (containsKey!399 (toList!4502 lt!376607) (_1!5091 lt!376416)))))

(assert (= (and d!105671 res!565715) b!830925))

(assert (=> d!105671 m!772777))

(assert (=> d!105671 m!772777))

(assert (=> d!105671 m!772953))

(declare-fun m!774073 () Bool)

(assert (=> d!105671 m!774073))

(declare-fun m!774075 () Bool)

(assert (=> d!105671 m!774075))

(assert (=> b!830925 m!772949))

(assert (=> b!830284 d!105671))

(declare-fun d!105673 () Bool)

(assert (=> d!105673 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376607) (_1!5091 lt!376416)))))))

(declare-fun bs!23200 () Bool)

(assert (= bs!23200 d!105673))

(assert (=> bs!23200 m!772777))

(declare-fun m!774077 () Bool)

(assert (=> bs!23200 m!774077))

(assert (=> b!830284 d!105673))

(assert (=> b!830284 d!105255))

(assert (=> d!105339 d!105325))

(declare-fun d!105675 () Bool)

(assert (=> d!105675 (= (apply!372 (+!2010 lt!376560 (tuple2!10161 lt!376558 minValue!754)) lt!376553) (apply!372 lt!376560 lt!376553))))

(assert (=> d!105675 true))

(declare-fun _$34!1144 () Unit!28383)

(assert (=> d!105675 (= (choose!1429 lt!376560 lt!376558 minValue!754 lt!376553) _$34!1144)))

(declare-fun bs!23201 () Bool)

(assert (= bs!23201 d!105675))

(assert (=> bs!23201 m!772685))

(assert (=> bs!23201 m!772685))

(assert (=> bs!23201 m!772687))

(assert (=> bs!23201 m!772701))

(assert (=> d!105339 d!105675))

(declare-fun d!105677 () Bool)

(declare-fun e!463307 () Bool)

(assert (=> d!105677 e!463307))

(declare-fun res!565716 () Bool)

(assert (=> d!105677 (=> res!565716 e!463307)))

(declare-fun lt!376989 () Bool)

(assert (=> d!105677 (= res!565716 (not lt!376989))))

(declare-fun lt!376988 () Bool)

(assert (=> d!105677 (= lt!376989 lt!376988)))

(declare-fun lt!376987 () Unit!28383)

(declare-fun e!463308 () Unit!28383)

(assert (=> d!105677 (= lt!376987 e!463308)))

(declare-fun c!90079 () Bool)

(assert (=> d!105677 (= c!90079 lt!376988)))

(assert (=> d!105677 (= lt!376988 (containsKey!399 (toList!4502 lt!376560) lt!376553))))

(assert (=> d!105677 (= (contains!4187 lt!376560 lt!376553) lt!376989)))

(declare-fun b!830926 () Bool)

(declare-fun lt!376986 () Unit!28383)

(assert (=> b!830926 (= e!463308 lt!376986)))

(assert (=> b!830926 (= lt!376986 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376560) lt!376553))))

(assert (=> b!830926 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376560) lt!376553))))

(declare-fun b!830927 () Bool)

(declare-fun Unit!28426 () Unit!28383)

(assert (=> b!830927 (= e!463308 Unit!28426)))

(declare-fun b!830928 () Bool)

(assert (=> b!830928 (= e!463307 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376560) lt!376553)))))

(assert (= (and d!105677 c!90079) b!830926))

(assert (= (and d!105677 (not c!90079)) b!830927))

(assert (= (and d!105677 (not res!565716)) b!830928))

(declare-fun m!774079 () Bool)

(assert (=> d!105677 m!774079))

(declare-fun m!774081 () Bool)

(assert (=> b!830926 m!774081))

(assert (=> b!830926 m!773357))

(assert (=> b!830926 m!773357))

(declare-fun m!774083 () Bool)

(assert (=> b!830926 m!774083))

(assert (=> b!830928 m!773357))

(assert (=> b!830928 m!773357))

(assert (=> b!830928 m!774083))

(assert (=> d!105339 d!105677))

(assert (=> d!105339 d!105333))

(assert (=> d!105339 d!105351))

(declare-fun d!105679 () Bool)

(assert (=> d!105679 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(declare-fun lt!376990 () Unit!28383)

(assert (=> d!105679 (= lt!376990 (choose!1430 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(declare-fun e!463309 () Bool)

(assert (=> d!105679 e!463309))

(declare-fun res!565717 () Bool)

(assert (=> d!105679 (=> (not res!565717) (not e!463309))))

(assert (=> d!105679 (= res!565717 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (=> d!105679 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571) lt!376990)))

(declare-fun b!830929 () Bool)

(assert (=> b!830929 (= e!463309 (containsKey!399 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))

(assert (= (and d!105679 res!565717) b!830929))

(assert (=> d!105679 m!773397))

(assert (=> d!105679 m!773397))

(assert (=> d!105679 m!773399))

(declare-fun m!774085 () Bool)

(assert (=> d!105679 m!774085))

(declare-fun m!774087 () Bool)

(assert (=> d!105679 m!774087))

(assert (=> b!830929 m!773393))

(assert (=> b!830454 d!105679))

(declare-fun d!105681 () Bool)

(assert (=> d!105681 (= (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571))))))

(declare-fun bs!23202 () Bool)

(assert (= bs!23202 d!105681))

(assert (=> bs!23202 m!773397))

(declare-fun m!774089 () Bool)

(assert (=> bs!23202 m!774089))

(assert (=> b!830454 d!105681))

(declare-fun b!830930 () Bool)

(declare-fun e!463310 () Option!419)

(assert (=> b!830930 (= e!463310 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))))

(declare-fun b!830931 () Bool)

(declare-fun e!463311 () Option!419)

(assert (=> b!830931 (= e!463310 e!463311)))

(declare-fun c!90081 () Bool)

(assert (=> b!830931 (= c!90081 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) lt!376571))))))

(declare-fun b!830933 () Bool)

(assert (=> b!830933 (= e!463311 None!417)))

(declare-fun b!830932 () Bool)

(assert (=> b!830932 (= e!463311 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) lt!376571))))

(declare-fun c!90080 () Bool)

(declare-fun d!105683 () Bool)

(assert (=> d!105683 (= c!90080 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) lt!376571)))))

(assert (=> d!105683 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571) e!463310)))

(assert (= (and d!105683 c!90080) b!830930))

(assert (= (and d!105683 (not c!90080)) b!830931))

(assert (= (and b!830931 c!90081) b!830932))

(assert (= (and b!830931 (not c!90081)) b!830933))

(declare-fun m!774091 () Bool)

(assert (=> b!830932 m!774091))

(assert (=> b!830454 d!105683))

(declare-fun d!105685 () Bool)

(declare-fun lt!376991 () Bool)

(assert (=> d!105685 (= lt!376991 (select (content!385 (t!22300 (toList!4502 lt!376542))) lt!376417))))

(declare-fun e!463312 () Bool)

(assert (=> d!105685 (= lt!376991 e!463312)))

(declare-fun res!565718 () Bool)

(assert (=> d!105685 (=> (not res!565718) (not e!463312))))

(assert (=> d!105685 (= res!565718 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376542))))))

(assert (=> d!105685 (= (contains!4188 (t!22300 (toList!4502 lt!376542)) lt!376417) lt!376991)))

(declare-fun b!830934 () Bool)

(declare-fun e!463313 () Bool)

(assert (=> b!830934 (= e!463312 e!463313)))

(declare-fun res!565719 () Bool)

(assert (=> b!830934 (=> res!565719 e!463313)))

(assert (=> b!830934 (= res!565719 (= (h!17069 (t!22300 (toList!4502 lt!376542))) lt!376417))))

(declare-fun b!830935 () Bool)

(assert (=> b!830935 (= e!463313 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376542))) lt!376417))))

(assert (= (and d!105685 res!565718) b!830934))

(assert (= (and b!830934 (not res!565719)) b!830935))

(declare-fun m!774093 () Bool)

(assert (=> d!105685 m!774093))

(declare-fun m!774095 () Bool)

(assert (=> d!105685 m!774095))

(declare-fun m!774097 () Bool)

(assert (=> b!830935 m!774097))

(assert (=> b!830317 d!105685))

(declare-fun d!105687 () Bool)

(assert (=> d!105687 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376992 () Unit!28383)

(assert (=> d!105687 (= lt!376992 (choose!1430 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463314 () Bool)

(assert (=> d!105687 e!463314))

(declare-fun res!565720 () Bool)

(assert (=> d!105687 (=> (not res!565720) (not e!463314))))

(assert (=> d!105687 (= res!565720 (isStrictlySorted!437 (toList!4502 lt!376602)))))

(assert (=> d!105687 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000) lt!376992)))

(declare-fun b!830936 () Bool)

(assert (=> b!830936 (= e!463314 (containsKey!399 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105687 res!565720) b!830936))

(assert (=> d!105687 m!773527))

(assert (=> d!105687 m!773527))

(assert (=> d!105687 m!773529))

(declare-fun m!774099 () Bool)

(assert (=> d!105687 m!774099))

(declare-fun m!774101 () Bool)

(assert (=> d!105687 m!774101))

(assert (=> b!830936 m!773523))

(assert (=> b!830525 d!105687))

(declare-fun d!105689 () Bool)

(assert (=> d!105689 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23203 () Bool)

(assert (= bs!23203 d!105689))

(assert (=> bs!23203 m!773527))

(declare-fun m!774103 () Bool)

(assert (=> bs!23203 m!774103))

(assert (=> b!830525 d!105689))

(declare-fun b!830937 () Bool)

(declare-fun e!463315 () Option!419)

(assert (=> b!830937 (= e!463315 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376602)))))))

(declare-fun b!830938 () Bool)

(declare-fun e!463316 () Option!419)

(assert (=> b!830938 (= e!463315 e!463316)))

(declare-fun c!90083 () Bool)

(assert (=> b!830938 (= c!90083 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830940 () Bool)

(assert (=> b!830940 (= e!463316 None!417)))

(declare-fun b!830939 () Bool)

(assert (=> b!830939 (= e!463316 (getValueByKey!413 (t!22300 (toList!4502 lt!376602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105691 () Bool)

(declare-fun c!90082 () Bool)

(assert (=> d!105691 (= c!90082 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105691 (= (getValueByKey!413 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000) e!463315)))

(assert (= (and d!105691 c!90082) b!830937))

(assert (= (and d!105691 (not c!90082)) b!830938))

(assert (= (and b!830938 c!90083) b!830939))

(assert (= (and b!830938 (not c!90083)) b!830940))

(declare-fun m!774105 () Bool)

(assert (=> b!830939 m!774105))

(assert (=> b!830525 d!105691))

(declare-fun d!105693 () Bool)

(declare-fun res!565721 () Bool)

(declare-fun e!463317 () Bool)

(assert (=> d!105693 (=> res!565721 e!463317)))

(assert (=> d!105693 (= res!565721 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) lt!376525)))))

(assert (=> d!105693 (= (containsKey!399 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))) lt!376525) e!463317)))

(declare-fun b!830941 () Bool)

(declare-fun e!463318 () Bool)

(assert (=> b!830941 (= e!463317 e!463318)))

(declare-fun res!565722 () Bool)

(assert (=> b!830941 (=> (not res!565722) (not e!463318))))

(assert (=> b!830941 (= res!565722 (and (or (not ((_ is Cons!15940) (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) (bvsle (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) lt!376525)) ((_ is Cons!15940) (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34))))) lt!376525)))))

(declare-fun b!830942 () Bool)

(assert (=> b!830942 (= e!463318 (containsKey!399 (t!22300 (toList!4502 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)))) lt!376525))))

(assert (= (and d!105693 (not res!565721)) b!830941))

(assert (= (and b!830941 res!565722) b!830942))

(declare-fun m!774107 () Bool)

(assert (=> b!830942 m!774107))

(assert (=> d!105263 d!105693))

(declare-fun d!105695 () Bool)

(declare-fun e!463319 () Bool)

(assert (=> d!105695 e!463319))

(declare-fun res!565723 () Bool)

(assert (=> d!105695 (=> res!565723 e!463319)))

(declare-fun lt!376996 () Bool)

(assert (=> d!105695 (= res!565723 (not lt!376996))))

(declare-fun lt!376995 () Bool)

(assert (=> d!105695 (= lt!376996 lt!376995)))

(declare-fun lt!376994 () Unit!28383)

(declare-fun e!463320 () Unit!28383)

(assert (=> d!105695 (= lt!376994 e!463320)))

(declare-fun c!90084 () Bool)

(assert (=> d!105695 (= c!90084 lt!376995)))

(assert (=> d!105695 (= lt!376995 (containsKey!399 (toList!4502 lt!376567) lt!376559))))

(assert (=> d!105695 (= (contains!4187 lt!376567 lt!376559) lt!376996)))

(declare-fun b!830943 () Bool)

(declare-fun lt!376993 () Unit!28383)

(assert (=> b!830943 (= e!463320 lt!376993)))

(assert (=> b!830943 (= lt!376993 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376567) lt!376559))))

(assert (=> b!830943 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376567) lt!376559))))

(declare-fun b!830944 () Bool)

(declare-fun Unit!28427 () Unit!28383)

(assert (=> b!830944 (= e!463320 Unit!28427)))

(declare-fun b!830945 () Bool)

(assert (=> b!830945 (= e!463319 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376567) lt!376559)))))

(assert (= (and d!105695 c!90084) b!830943))

(assert (= (and d!105695 (not c!90084)) b!830944))

(assert (= (and d!105695 (not res!565723)) b!830945))

(declare-fun m!774109 () Bool)

(assert (=> d!105695 m!774109))

(declare-fun m!774111 () Bool)

(assert (=> b!830943 m!774111))

(assert (=> b!830943 m!773401))

(assert (=> b!830943 m!773401))

(declare-fun m!774113 () Bool)

(assert (=> b!830943 m!774113))

(assert (=> b!830945 m!773401))

(assert (=> b!830945 m!773401))

(assert (=> b!830945 m!774113))

(assert (=> d!105331 d!105695))

(assert (=> d!105331 d!105329))

(declare-fun d!105697 () Bool)

(assert (=> d!105697 (= (apply!372 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)) lt!376559) (apply!372 lt!376567 lt!376559))))

(assert (=> d!105697 true))

(declare-fun _$34!1145 () Unit!28383)

(assert (=> d!105697 (= (choose!1429 lt!376567 lt!376566 minValue!754 lt!376559) _$34!1145)))

(declare-fun bs!23204 () Bool)

(assert (= bs!23204 d!105697))

(assert (=> bs!23204 m!772681))

(assert (=> bs!23204 m!772681))

(assert (=> bs!23204 m!772683))

(assert (=> bs!23204 m!772707))

(assert (=> d!105331 d!105697))

(assert (=> d!105331 d!105345))

(assert (=> d!105331 d!105347))

(declare-fun d!105699 () Bool)

(assert (=> d!105699 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10089 (getValueByKey!413 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105367 d!105699))

(assert (=> d!105367 d!105505))

(declare-fun b!830946 () Bool)

(declare-fun e!463321 () Option!419)

(assert (=> b!830946 (= e!463321 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376605)))))))

(declare-fun b!830947 () Bool)

(declare-fun e!463322 () Option!419)

(assert (=> b!830947 (= e!463321 e!463322)))

(declare-fun c!90086 () Bool)

(assert (=> b!830947 (= c!90086 (and ((_ is Cons!15940) (t!22300 lt!376605)) (not (= (_1!5091 (h!17069 (t!22300 lt!376605))) (_1!5091 lt!376416)))))))

(declare-fun b!830949 () Bool)

(assert (=> b!830949 (= e!463322 None!417)))

(declare-fun b!830948 () Bool)

(assert (=> b!830948 (= e!463322 (getValueByKey!413 (t!22300 (t!22300 lt!376605)) (_1!5091 lt!376416)))))

(declare-fun d!105701 () Bool)

(declare-fun c!90085 () Bool)

(assert (=> d!105701 (= c!90085 (and ((_ is Cons!15940) (t!22300 lt!376605)) (= (_1!5091 (h!17069 (t!22300 lt!376605))) (_1!5091 lt!376416))))))

(assert (=> d!105701 (= (getValueByKey!413 (t!22300 lt!376605) (_1!5091 lt!376416)) e!463321)))

(assert (= (and d!105701 c!90085) b!830946))

(assert (= (and d!105701 (not c!90085)) b!830947))

(assert (= (and b!830947 c!90086) b!830948))

(assert (= (and b!830947 (not c!90086)) b!830949))

(declare-fun m!774115 () Bool)

(assert (=> b!830948 m!774115))

(assert (=> b!830289 d!105701))

(assert (=> bm!36249 d!105475))

(declare-fun d!105703 () Bool)

(declare-fun res!565724 () Bool)

(declare-fun e!463323 () Bool)

(assert (=> d!105703 (=> res!565724 e!463323)))

(assert (=> d!105703 (= res!565724 (or ((_ is Nil!15941) lt!376834) ((_ is Nil!15941) (t!22300 lt!376834))))))

(assert (=> d!105703 (= (isStrictlySorted!437 lt!376834) e!463323)))

(declare-fun b!830950 () Bool)

(declare-fun e!463324 () Bool)

(assert (=> b!830950 (= e!463323 e!463324)))

(declare-fun res!565725 () Bool)

(assert (=> b!830950 (=> (not res!565725) (not e!463324))))

(assert (=> b!830950 (= res!565725 (bvslt (_1!5091 (h!17069 lt!376834)) (_1!5091 (h!17069 (t!22300 lt!376834)))))))

(declare-fun b!830951 () Bool)

(assert (=> b!830951 (= e!463324 (isStrictlySorted!437 (t!22300 lt!376834)))))

(assert (= (and d!105703 (not res!565724)) b!830950))

(assert (= (and b!830950 res!565725) b!830951))

(declare-fun m!774117 () Bool)

(assert (=> b!830951 m!774117))

(assert (=> d!105377 d!105703))

(assert (=> d!105377 d!105493))

(declare-fun d!105705 () Bool)

(declare-fun res!565726 () Bool)

(declare-fun e!463325 () Bool)

(assert (=> d!105705 (=> res!565726 e!463325)))

(assert (=> d!105705 (= res!565726 (and ((_ is Cons!15940) (toList!4502 lt!376611)) (= (_1!5091 (h!17069 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105705 (= (containsKey!399 (toList!4502 lt!376611) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463325)))

(declare-fun b!830952 () Bool)

(declare-fun e!463326 () Bool)

(assert (=> b!830952 (= e!463325 e!463326)))

(declare-fun res!565727 () Bool)

(assert (=> b!830952 (=> (not res!565727) (not e!463326))))

(assert (=> b!830952 (= res!565727 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376611))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15940) (toList!4502 lt!376611)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376611))) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830953 () Bool)

(assert (=> b!830953 (= e!463326 (containsKey!399 (t!22300 (toList!4502 lt!376611)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!105705 (not res!565726)) b!830952))

(assert (= (and b!830952 res!565727) b!830953))

(declare-fun m!774119 () Bool)

(assert (=> b!830953 m!774119))

(assert (=> d!105181 d!105705))

(declare-fun b!830954 () Bool)

(declare-fun e!463327 () Option!419)

(assert (=> b!830954 (= e!463327 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376754)))))))

(declare-fun b!830955 () Bool)

(declare-fun e!463328 () Option!419)

(assert (=> b!830955 (= e!463327 e!463328)))

(declare-fun c!90088 () Bool)

(assert (=> b!830955 (= c!90088 (and ((_ is Cons!15940) (toList!4502 lt!376754)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376754))) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))))

(declare-fun b!830957 () Bool)

(assert (=> b!830957 (= e!463328 None!417)))

(declare-fun b!830956 () Bool)

(assert (=> b!830956 (= e!463328 (getValueByKey!413 (t!22300 (toList!4502 lt!376754)) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))))))

(declare-fun d!105707 () Bool)

(declare-fun c!90087 () Bool)

(assert (=> d!105707 (= c!90087 (and ((_ is Cons!15940) (toList!4502 lt!376754)) (= (_1!5091 (h!17069 (toList!4502 lt!376754))) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34)))))))

(assert (=> d!105707 (= (getValueByKey!413 (toList!4502 lt!376754) (_1!5091 (tuple2!10161 lt!376524 zeroValueAfter!34))) e!463327)))

(assert (= (and d!105707 c!90087) b!830954))

(assert (= (and d!105707 (not c!90087)) b!830955))

(assert (= (and b!830955 c!90088) b!830956))

(assert (= (and b!830955 (not c!90088)) b!830957))

(declare-fun m!774121 () Bool)

(assert (=> b!830956 m!774121))

(assert (=> b!830388 d!105707))

(declare-fun b!830958 () Bool)

(declare-fun e!463329 () Option!419)

(assert (=> b!830958 (= e!463329 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376550))))))))

(declare-fun b!830959 () Bool)

(declare-fun e!463330 () Option!419)

(assert (=> b!830959 (= e!463329 e!463330)))

(declare-fun c!90090 () Bool)

(assert (=> b!830959 (= c!90090 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376550))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376550)))) (_1!5091 lt!376416)))))))

(declare-fun b!830961 () Bool)

(assert (=> b!830961 (= e!463330 None!417)))

(declare-fun b!830960 () Bool)

(assert (=> b!830960 (= e!463330 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376550))) (_1!5091 lt!376416)))))

(declare-fun d!105709 () Bool)

(declare-fun c!90089 () Bool)

(assert (=> d!105709 (= c!90089 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376550))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376550)))) (_1!5091 lt!376416))))))

(assert (=> d!105709 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376550)) (_1!5091 lt!376416)) e!463329)))

(assert (= (and d!105709 c!90089) b!830958))

(assert (= (and d!105709 (not c!90089)) b!830959))

(assert (= (and b!830959 c!90090) b!830960))

(assert (= (and b!830959 (not c!90090)) b!830961))

(declare-fun m!774123 () Bool)

(assert (=> b!830960 m!774123))

(assert (=> b!830473 d!105709))

(declare-fun d!105711 () Bool)

(declare-fun lt!376997 () Bool)

(assert (=> d!105711 (= lt!376997 (select (content!385 lt!376770) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun e!463331 () Bool)

(assert (=> d!105711 (= lt!376997 e!463331)))

(declare-fun res!565728 () Bool)

(assert (=> d!105711 (=> (not res!565728) (not e!463331))))

(assert (=> d!105711 (= res!565728 ((_ is Cons!15940) lt!376770))))

(assert (=> d!105711 (= (contains!4188 lt!376770 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) lt!376997)))

(declare-fun b!830962 () Bool)

(declare-fun e!463332 () Bool)

(assert (=> b!830962 (= e!463331 e!463332)))

(declare-fun res!565729 () Bool)

(assert (=> b!830962 (=> res!565729 e!463332)))

(assert (=> b!830962 (= res!565729 (= (h!17069 lt!376770) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun b!830963 () Bool)

(assert (=> b!830963 (= e!463332 (contains!4188 (t!22300 lt!376770) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105711 res!565728) b!830962))

(assert (= (and b!830962 (not res!565729)) b!830963))

(declare-fun m!774125 () Bool)

(assert (=> d!105711 m!774125))

(declare-fun m!774127 () Bool)

(assert (=> d!105711 m!774127))

(declare-fun m!774129 () Bool)

(assert (=> b!830963 m!774129))

(assert (=> b!830420 d!105711))

(assert (=> d!105239 d!105245))

(assert (=> d!105239 d!105243))

(declare-fun d!105713 () Bool)

(assert (=> d!105713 (not (contains!4187 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)) lt!376601))))

(assert (=> d!105713 true))

(declare-fun _$36!344 () Unit!28383)

(assert (=> d!105713 (= (choose!1427 lt!376599 lt!376600 lt!376598 lt!376601) _$36!344)))

(declare-fun bs!23205 () Bool)

(assert (= bs!23205 d!105713))

(assert (=> bs!23205 m!772761))

(assert (=> bs!23205 m!772761))

(assert (=> bs!23205 m!772765))

(assert (=> d!105239 d!105713))

(declare-fun d!105715 () Bool)

(declare-fun e!463333 () Bool)

(assert (=> d!105715 e!463333))

(declare-fun res!565730 () Bool)

(assert (=> d!105715 (=> res!565730 e!463333)))

(declare-fun lt!377001 () Bool)

(assert (=> d!105715 (= res!565730 (not lt!377001))))

(declare-fun lt!377000 () Bool)

(assert (=> d!105715 (= lt!377001 lt!377000)))

(declare-fun lt!376999 () Unit!28383)

(declare-fun e!463334 () Unit!28383)

(assert (=> d!105715 (= lt!376999 e!463334)))

(declare-fun c!90091 () Bool)

(assert (=> d!105715 (= c!90091 lt!377000)))

(assert (=> d!105715 (= lt!377000 (containsKey!399 (toList!4502 lt!376599) lt!376601))))

(assert (=> d!105715 (= (contains!4187 lt!376599 lt!376601) lt!377001)))

(declare-fun b!830964 () Bool)

(declare-fun lt!376998 () Unit!28383)

(assert (=> b!830964 (= e!463334 lt!376998)))

(assert (=> b!830964 (= lt!376998 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376599) lt!376601))))

(assert (=> b!830964 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376599) lt!376601))))

(declare-fun b!830965 () Bool)

(declare-fun Unit!28428 () Unit!28383)

(assert (=> b!830965 (= e!463334 Unit!28428)))

(declare-fun b!830966 () Bool)

(assert (=> b!830966 (= e!463333 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376599) lt!376601)))))

(assert (= (and d!105715 c!90091) b!830964))

(assert (= (and d!105715 (not c!90091)) b!830965))

(assert (= (and d!105715 (not res!565730)) b!830966))

(declare-fun m!774131 () Bool)

(assert (=> d!105715 m!774131))

(declare-fun m!774133 () Bool)

(assert (=> b!830964 m!774133))

(declare-fun m!774135 () Bool)

(assert (=> b!830964 m!774135))

(assert (=> b!830964 m!774135))

(declare-fun m!774137 () Bool)

(assert (=> b!830964 m!774137))

(assert (=> b!830966 m!774135))

(assert (=> b!830966 m!774135))

(assert (=> b!830966 m!774137))

(assert (=> d!105239 d!105715))

(declare-fun d!105717 () Bool)

(declare-fun res!565731 () Bool)

(declare-fun e!463335 () Bool)

(assert (=> d!105717 (=> res!565731 e!463335)))

(assert (=> d!105717 (= res!565731 (and ((_ is Cons!15940) (toList!4502 lt!376607)) (= (_1!5091 (h!17069 (toList!4502 lt!376607))) (_1!5091 lt!376416))))))

(assert (=> d!105717 (= (containsKey!399 (toList!4502 lt!376607) (_1!5091 lt!376416)) e!463335)))

(declare-fun b!830967 () Bool)

(declare-fun e!463336 () Bool)

(assert (=> b!830967 (= e!463335 e!463336)))

(declare-fun res!565732 () Bool)

(assert (=> b!830967 (=> (not res!565732) (not e!463336))))

(assert (=> b!830967 (= res!565732 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376607))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376607))) (_1!5091 lt!376416))) ((_ is Cons!15940) (toList!4502 lt!376607)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376607))) (_1!5091 lt!376416))))))

(declare-fun b!830968 () Bool)

(assert (=> b!830968 (= e!463336 (containsKey!399 (t!22300 (toList!4502 lt!376607)) (_1!5091 lt!376416)))))

(assert (= (and d!105717 (not res!565731)) b!830967))

(assert (= (and b!830967 res!565732) b!830968))

(declare-fun m!774139 () Bool)

(assert (=> b!830968 m!774139))

(assert (=> d!105211 d!105717))

(declare-fun d!105719 () Bool)

(declare-fun res!565733 () Bool)

(declare-fun e!463337 () Bool)

(assert (=> d!105719 (=> res!565733 e!463337)))

(assert (=> d!105719 (= res!565733 (and ((_ is Cons!15940) lt!376639) (= (_1!5091 (h!17069 lt!376639)) (_1!5091 lt!376417))))))

(assert (=> d!105719 (= (containsKey!399 lt!376639 (_1!5091 lt!376417)) e!463337)))

(declare-fun b!830969 () Bool)

(declare-fun e!463338 () Bool)

(assert (=> b!830969 (= e!463337 e!463338)))

(declare-fun res!565734 () Bool)

(assert (=> b!830969 (=> (not res!565734) (not e!463338))))

(assert (=> b!830969 (= res!565734 (and (or (not ((_ is Cons!15940) lt!376639)) (bvsle (_1!5091 (h!17069 lt!376639)) (_1!5091 lt!376417))) ((_ is Cons!15940) lt!376639) (bvslt (_1!5091 (h!17069 lt!376639)) (_1!5091 lt!376417))))))

(declare-fun b!830970 () Bool)

(assert (=> b!830970 (= e!463338 (containsKey!399 (t!22300 lt!376639) (_1!5091 lt!376417)))))

(assert (= (and d!105719 (not res!565733)) b!830969))

(assert (= (and b!830969 res!565734) b!830970))

(declare-fun m!774141 () Bool)

(assert (=> b!830970 m!774141))

(assert (=> b!830221 d!105719))

(declare-fun d!105721 () Bool)

(declare-fun res!565735 () Bool)

(declare-fun e!463339 () Bool)

(assert (=> d!105721 (=> res!565735 e!463339)))

(assert (=> d!105721 (= res!565735 (and ((_ is Cons!15940) lt!376834) (= (_1!5091 (h!17069 lt!376834)) (_1!5091 lt!376416))))))

(assert (=> d!105721 (= (containsKey!399 lt!376834 (_1!5091 lt!376416)) e!463339)))

(declare-fun b!830971 () Bool)

(declare-fun e!463340 () Bool)

(assert (=> b!830971 (= e!463339 e!463340)))

(declare-fun res!565736 () Bool)

(assert (=> b!830971 (=> (not res!565736) (not e!463340))))

(assert (=> b!830971 (= res!565736 (and (or (not ((_ is Cons!15940) lt!376834)) (bvsle (_1!5091 (h!17069 lt!376834)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376834) (bvslt (_1!5091 (h!17069 lt!376834)) (_1!5091 lt!376416))))))

(declare-fun b!830972 () Bool)

(assert (=> b!830972 (= e!463340 (containsKey!399 (t!22300 lt!376834) (_1!5091 lt!376416)))))

(assert (= (and d!105721 (not res!565735)) b!830971))

(assert (= (and b!830971 res!565736) b!830972))

(declare-fun m!774143 () Bool)

(assert (=> b!830972 m!774143))

(assert (=> b!830490 d!105721))

(declare-fun d!105723 () Bool)

(declare-fun e!463341 () Bool)

(assert (=> d!105723 e!463341))

(declare-fun res!565738 () Bool)

(assert (=> d!105723 (=> (not res!565738) (not e!463341))))

(declare-fun lt!377004 () ListLongMap!8973)

(assert (=> d!105723 (= res!565738 (contains!4187 lt!377004 (_1!5091 (tuple2!10161 lt!376667 lt!376665))))))

(declare-fun lt!377002 () List!15944)

(assert (=> d!105723 (= lt!377004 (ListLongMap!8974 lt!377002))))

(declare-fun lt!377003 () Unit!28383)

(declare-fun lt!377005 () Unit!28383)

(assert (=> d!105723 (= lt!377003 lt!377005)))

(assert (=> d!105723 (= (getValueByKey!413 lt!377002 (_1!5091 (tuple2!10161 lt!376667 lt!376665))) (Some!418 (_2!5091 (tuple2!10161 lt!376667 lt!376665))))))

(assert (=> d!105723 (= lt!377005 (lemmaContainsTupThenGetReturnValue!230 lt!377002 (_1!5091 (tuple2!10161 lt!376667 lt!376665)) (_2!5091 (tuple2!10161 lt!376667 lt!376665))))))

(assert (=> d!105723 (= lt!377002 (insertStrictlySorted!269 (toList!4502 lt!376666) (_1!5091 (tuple2!10161 lt!376667 lt!376665)) (_2!5091 (tuple2!10161 lt!376667 lt!376665))))))

(assert (=> d!105723 (= (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665)) lt!377004)))

(declare-fun b!830973 () Bool)

(declare-fun res!565737 () Bool)

(assert (=> b!830973 (=> (not res!565737) (not e!463341))))

(assert (=> b!830973 (= res!565737 (= (getValueByKey!413 (toList!4502 lt!377004) (_1!5091 (tuple2!10161 lt!376667 lt!376665))) (Some!418 (_2!5091 (tuple2!10161 lt!376667 lt!376665)))))))

(declare-fun b!830974 () Bool)

(assert (=> b!830974 (= e!463341 (contains!4188 (toList!4502 lt!377004) (tuple2!10161 lt!376667 lt!376665)))))

(assert (= (and d!105723 res!565738) b!830973))

(assert (= (and b!830973 res!565737) b!830974))

(declare-fun m!774145 () Bool)

(assert (=> d!105723 m!774145))

(declare-fun m!774147 () Bool)

(assert (=> d!105723 m!774147))

(declare-fun m!774149 () Bool)

(assert (=> d!105723 m!774149))

(declare-fun m!774151 () Bool)

(assert (=> d!105723 m!774151))

(declare-fun m!774153 () Bool)

(assert (=> b!830973 m!774153))

(declare-fun m!774155 () Bool)

(assert (=> b!830974 m!774155))

(assert (=> b!830280 d!105723))

(declare-fun d!105725 () Bool)

(declare-fun e!463342 () Bool)

(assert (=> d!105725 e!463342))

(declare-fun res!565739 () Bool)

(assert (=> d!105725 (=> res!565739 e!463342)))

(declare-fun lt!377009 () Bool)

(assert (=> d!105725 (= res!565739 (not lt!377009))))

(declare-fun lt!377008 () Bool)

(assert (=> d!105725 (= lt!377009 lt!377008)))

(declare-fun lt!377007 () Unit!28383)

(declare-fun e!463343 () Unit!28383)

(assert (=> d!105725 (= lt!377007 e!463343)))

(declare-fun c!90092 () Bool)

(assert (=> d!105725 (= c!90092 lt!377008)))

(assert (=> d!105725 (= lt!377008 (containsKey!399 (toList!4502 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665))) lt!376668))))

(assert (=> d!105725 (= (contains!4187 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665)) lt!376668) lt!377009)))

(declare-fun b!830975 () Bool)

(declare-fun lt!377006 () Unit!28383)

(assert (=> b!830975 (= e!463343 lt!377006)))

(assert (=> b!830975 (= lt!377006 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665))) lt!376668))))

(assert (=> b!830975 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665))) lt!376668))))

(declare-fun b!830976 () Bool)

(declare-fun Unit!28429 () Unit!28383)

(assert (=> b!830976 (= e!463343 Unit!28429)))

(declare-fun b!830977 () Bool)

(assert (=> b!830977 (= e!463342 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665))) lt!376668)))))

(assert (= (and d!105725 c!90092) b!830975))

(assert (= (and d!105725 (not c!90092)) b!830976))

(assert (= (and d!105725 (not res!565739)) b!830977))

(declare-fun m!774157 () Bool)

(assert (=> d!105725 m!774157))

(declare-fun m!774159 () Bool)

(assert (=> b!830975 m!774159))

(declare-fun m!774161 () Bool)

(assert (=> b!830975 m!774161))

(assert (=> b!830975 m!774161))

(declare-fun m!774163 () Bool)

(assert (=> b!830975 m!774163))

(assert (=> b!830977 m!774161))

(assert (=> b!830977 m!774161))

(assert (=> b!830977 m!774163))

(assert (=> b!830280 d!105725))

(declare-fun d!105727 () Bool)

(assert (=> d!105727 (not (contains!4187 (+!2010 lt!376666 (tuple2!10161 lt!376667 lt!376665)) lt!376668))))

(declare-fun lt!377010 () Unit!28383)

(assert (=> d!105727 (= lt!377010 (choose!1427 lt!376666 lt!376667 lt!376665 lt!376668))))

(declare-fun e!463344 () Bool)

(assert (=> d!105727 e!463344))

(declare-fun res!565740 () Bool)

(assert (=> d!105727 (=> (not res!565740) (not e!463344))))

(assert (=> d!105727 (= res!565740 (not (contains!4187 lt!376666 lt!376668)))))

(assert (=> d!105727 (= (addStillNotContains!198 lt!376666 lt!376667 lt!376665 lt!376668) lt!377010)))

(declare-fun b!830978 () Bool)

(assert (=> b!830978 (= e!463344 (not (= lt!376667 lt!376668)))))

(assert (= (and d!105727 res!565740) b!830978))

(assert (=> d!105727 m!772941))

(assert (=> d!105727 m!772941))

(assert (=> d!105727 m!772945))

(declare-fun m!774165 () Bool)

(assert (=> d!105727 m!774165))

(declare-fun m!774167 () Bool)

(assert (=> d!105727 m!774167))

(assert (=> b!830280 d!105727))

(assert (=> b!830280 d!105539))

(declare-fun d!105729 () Bool)

(declare-fun e!463345 () Bool)

(assert (=> d!105729 e!463345))

(declare-fun res!565742 () Bool)

(assert (=> d!105729 (=> (not res!565742) (not e!463345))))

(declare-fun lt!377013 () ListLongMap!8973)

(assert (=> d!105729 (= res!565742 (contains!4187 lt!377013 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377011 () List!15944)

(assert (=> d!105729 (= lt!377013 (ListLongMap!8974 lt!377011))))

(declare-fun lt!377012 () Unit!28383)

(declare-fun lt!377014 () Unit!28383)

(assert (=> d!105729 (= lt!377012 lt!377014)))

(assert (=> d!105729 (= (getValueByKey!413 lt!377011 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105729 (= lt!377014 (lemmaContainsTupThenGetReturnValue!230 lt!377011 (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105729 (= lt!377011 (insertStrictlySorted!269 (toList!4502 call!36247) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105729 (= (+!2010 call!36247 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377013)))

(declare-fun b!830979 () Bool)

(declare-fun res!565741 () Bool)

(assert (=> b!830979 (=> (not res!565741) (not e!463345))))

(assert (=> b!830979 (= res!565741 (= (getValueByKey!413 (toList!4502 lt!377013) (_1!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!418 (_2!5091 (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!830980 () Bool)

(assert (=> b!830980 (= e!463345 (contains!4188 (toList!4502 lt!377013) (tuple2!10161 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11823 (select (arr!22313 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!986 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105729 res!565742) b!830979))

(assert (= (and b!830979 res!565741) b!830980))

(declare-fun m!774169 () Bool)

(assert (=> d!105729 m!774169))

(declare-fun m!774171 () Bool)

(assert (=> d!105729 m!774171))

(declare-fun m!774173 () Bool)

(assert (=> d!105729 m!774173))

(declare-fun m!774175 () Bool)

(assert (=> d!105729 m!774175))

(declare-fun m!774177 () Bool)

(assert (=> b!830979 m!774177))

(declare-fun m!774179 () Bool)

(assert (=> b!830980 m!774179))

(assert (=> b!830280 d!105729))

(declare-fun d!105731 () Bool)

(declare-fun res!565743 () Bool)

(declare-fun e!463346 () Bool)

(assert (=> d!105731 (=> res!565743 e!463346)))

(assert (=> d!105731 (= res!565743 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) lt!376571)))))

(assert (=> d!105731 (= (containsKey!399 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!376571) e!463346)))

(declare-fun b!830981 () Bool)

(declare-fun e!463347 () Bool)

(assert (=> b!830981 (= e!463346 e!463347)))

(declare-fun res!565744 () Bool)

(assert (=> b!830981 (=> (not res!565744) (not e!463347))))

(assert (=> b!830981 (= res!565744 (and (or (not ((_ is Cons!15940) (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) (bvsle (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) lt!376571)) ((_ is Cons!15940) (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34))))) lt!376571)))))

(declare-fun b!830982 () Bool)

(assert (=> b!830982 (= e!463347 (containsKey!399 (t!22300 (toList!4502 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)))) lt!376571))))

(assert (= (and d!105731 (not res!565743)) b!830981))

(assert (= (and b!830981 res!565744) b!830982))

(declare-fun m!774181 () Bool)

(assert (=> b!830982 m!774181))

(assert (=> d!105343 d!105731))

(declare-fun d!105733 () Bool)

(declare-fun res!565745 () Bool)

(declare-fun e!463348 () Bool)

(assert (=> d!105733 (=> res!565745 e!463348)))

(assert (=> d!105733 (= res!565745 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105733 (= (containsKey!399 (toList!4502 lt!376602) #b1000000000000000000000000000000000000000000000000000000000000000) e!463348)))

(declare-fun b!830983 () Bool)

(declare-fun e!463349 () Bool)

(assert (=> b!830983 (= e!463348 e!463349)))

(declare-fun res!565746 () Bool)

(assert (=> b!830983 (=> (not res!565746) (not e!463349))))

(assert (=> b!830983 (= res!565746 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376602))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376602))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376602)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376602))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830984 () Bool)

(assert (=> b!830984 (= e!463349 (containsKey!399 (t!22300 (toList!4502 lt!376602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105733 (not res!565745)) b!830983))

(assert (= (and b!830983 res!565746) b!830984))

(declare-fun m!774183 () Bool)

(assert (=> b!830984 m!774183))

(assert (=> d!105391 d!105733))

(declare-fun d!105735 () Bool)

(assert (=> d!105735 (= (isEmpty!660 (toList!4502 lt!376595)) ((_ is Nil!15941) (toList!4502 lt!376595)))))

(assert (=> d!105323 d!105735))

(assert (=> b!830315 d!105503))

(assert (=> b!830315 d!105505))

(declare-fun d!105737 () Bool)

(declare-fun e!463350 () Bool)

(assert (=> d!105737 e!463350))

(declare-fun res!565747 () Bool)

(assert (=> d!105737 (=> res!565747 e!463350)))

(declare-fun lt!377018 () Bool)

(assert (=> d!105737 (= res!565747 (not lt!377018))))

(declare-fun lt!377017 () Bool)

(assert (=> d!105737 (= lt!377018 lt!377017)))

(declare-fun lt!377016 () Unit!28383)

(declare-fun e!463351 () Unit!28383)

(assert (=> d!105737 (= lt!377016 e!463351)))

(declare-fun c!90093 () Bool)

(assert (=> d!105737 (= c!90093 lt!377017)))

(assert (=> d!105737 (= lt!377017 (containsKey!399 (toList!4502 lt!376669) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!105737 (= (contains!4187 lt!376669 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377018)))

(declare-fun b!830985 () Bool)

(declare-fun lt!377015 () Unit!28383)

(assert (=> b!830985 (= e!463351 lt!377015)))

(assert (=> b!830985 (= lt!377015 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376669) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!830985 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!830986 () Bool)

(declare-fun Unit!28430 () Unit!28383)

(assert (=> b!830986 (= e!463351 Unit!28430)))

(declare-fun b!830987 () Bool)

(assert (=> b!830987 (= e!463350 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376669) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!105737 c!90093) b!830985))

(assert (= (and d!105737 (not c!90093)) b!830986))

(assert (= (and d!105737 (not res!565747)) b!830987))

(assert (=> d!105737 m!772925))

(declare-fun m!774185 () Bool)

(assert (=> d!105737 m!774185))

(assert (=> b!830985 m!772925))

(declare-fun m!774187 () Bool)

(assert (=> b!830985 m!774187))

(assert (=> b!830985 m!772925))

(declare-fun m!774189 () Bool)

(assert (=> b!830985 m!774189))

(assert (=> b!830985 m!774189))

(declare-fun m!774191 () Bool)

(assert (=> b!830985 m!774191))

(assert (=> b!830987 m!772925))

(assert (=> b!830987 m!774189))

(assert (=> b!830987 m!774189))

(assert (=> b!830987 m!774191))

(assert (=> b!830272 d!105737))

(declare-fun d!105739 () Bool)

(declare-fun lt!377019 () Bool)

(assert (=> d!105739 (= lt!377019 (select (content!385 lt!376540) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun e!463352 () Bool)

(assert (=> d!105739 (= lt!377019 e!463352)))

(declare-fun res!565748 () Bool)

(assert (=> d!105739 (=> (not res!565748) (not e!463352))))

(assert (=> d!105739 (= res!565748 ((_ is Cons!15940) lt!376540))))

(assert (=> d!105739 (= (contains!4188 lt!376540 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) lt!377019)))

(declare-fun b!830988 () Bool)

(declare-fun e!463353 () Bool)

(assert (=> b!830988 (= e!463352 e!463353)))

(declare-fun res!565749 () Bool)

(assert (=> b!830988 (=> res!565749 e!463353)))

(assert (=> b!830988 (= res!565749 (= (h!17069 lt!376540) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun b!830989 () Bool)

(assert (=> b!830989 (= e!463353 (contains!4188 (t!22300 lt!376540) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105739 res!565748) b!830988))

(assert (= (and b!830988 (not res!565749)) b!830989))

(declare-fun m!774193 () Bool)

(assert (=> d!105739 m!774193))

(declare-fun m!774195 () Bool)

(assert (=> d!105739 m!774195))

(declare-fun m!774197 () Bool)

(assert (=> b!830989 m!774197))

(assert (=> b!830412 d!105739))

(assert (=> b!830524 d!105551))

(assert (=> b!830524 d!105553))

(declare-fun d!105741 () Bool)

(declare-fun lt!377020 () Bool)

(assert (=> d!105741 (= lt!377020 (select (content!385 (t!22300 (toList!4502 lt!376550))) lt!376416))))

(declare-fun e!463354 () Bool)

(assert (=> d!105741 (= lt!377020 e!463354)))

(declare-fun res!565750 () Bool)

(assert (=> d!105741 (=> (not res!565750) (not e!463354))))

(assert (=> d!105741 (= res!565750 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376550))))))

(assert (=> d!105741 (= (contains!4188 (t!22300 (toList!4502 lt!376550)) lt!376416) lt!377020)))

(declare-fun b!830990 () Bool)

(declare-fun e!463355 () Bool)

(assert (=> b!830990 (= e!463354 e!463355)))

(declare-fun res!565751 () Bool)

(assert (=> b!830990 (=> res!565751 e!463355)))

(assert (=> b!830990 (= res!565751 (= (h!17069 (t!22300 (toList!4502 lt!376550))) lt!376416))))

(declare-fun b!830991 () Bool)

(assert (=> b!830991 (= e!463355 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376550))) lt!376416))))

(assert (= (and d!105741 res!565750) b!830990))

(assert (= (and b!830990 (not res!565751)) b!830991))

(assert (=> d!105741 m!773881))

(declare-fun m!774199 () Bool)

(assert (=> d!105741 m!774199))

(declare-fun m!774201 () Bool)

(assert (=> b!830991 m!774201))

(assert (=> b!830444 d!105741))

(declare-fun d!105743 () Bool)

(assert (=> d!105743 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))) lt!376513)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))) lt!376513)))))

(assert (=> d!105271 d!105743))

(declare-fun e!463356 () Option!419)

(declare-fun b!830992 () Bool)

(assert (=> b!830992 (= e!463356 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)))))))))

(declare-fun b!830993 () Bool)

(declare-fun e!463357 () Option!419)

(assert (=> b!830993 (= e!463356 e!463357)))

(declare-fun c!90095 () Bool)

(assert (=> b!830993 (= c!90095 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))))) lt!376513))))))

(declare-fun b!830995 () Bool)

(assert (=> b!830995 (= e!463357 None!417)))

(declare-fun b!830994 () Bool)

(assert (=> b!830994 (= e!463357 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)))) lt!376513))))

(declare-fun d!105745 () Bool)

(declare-fun c!90094 () Bool)

(assert (=> d!105745 (= c!90094 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))))) lt!376513)))))

(assert (=> d!105745 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754))) lt!376513) e!463356)))

(assert (= (and d!105745 c!90094) b!830992))

(assert (= (and d!105745 (not c!90094)) b!830993))

(assert (= (and b!830993 c!90095) b!830994))

(assert (= (and b!830993 (not c!90095)) b!830995))

(declare-fun m!774203 () Bool)

(assert (=> b!830994 m!774203))

(assert (=> d!105271 d!105745))

(declare-fun d!105747 () Bool)

(assert (=> d!105747 (= (isEmpty!659 lt!376762) (isEmpty!660 (toList!4502 lt!376762)))))

(declare-fun bs!23206 () Bool)

(assert (= bs!23206 d!105747))

(declare-fun m!774205 () Bool)

(assert (=> bs!23206 m!774205))

(assert (=> b!830394 d!105747))

(assert (=> d!105233 d!105235))

(declare-fun d!105749 () Bool)

(assert (=> d!105749 (arrayContainsKey!0 _keys!976 lt!376619 #b00000000000000000000000000000000)))

(assert (=> d!105749 true))

(declare-fun _$60!391 () Unit!28383)

(assert (=> d!105749 (= (choose!13 _keys!976 lt!376619 #b00000000000000000000000000000000) _$60!391)))

(declare-fun bs!23207 () Bool)

(assert (= bs!23207 d!105749))

(assert (=> bs!23207 m!772799))

(assert (=> d!105233 d!105749))

(declare-fun d!105751 () Bool)

(declare-fun e!463358 () Bool)

(assert (=> d!105751 e!463358))

(declare-fun res!565752 () Bool)

(assert (=> d!105751 (=> res!565752 e!463358)))

(declare-fun lt!377024 () Bool)

(assert (=> d!105751 (= res!565752 (not lt!377024))))

(declare-fun lt!377023 () Bool)

(assert (=> d!105751 (= lt!377024 lt!377023)))

(declare-fun lt!377022 () Unit!28383)

(declare-fun e!463359 () Unit!28383)

(assert (=> d!105751 (= lt!377022 e!463359)))

(declare-fun c!90096 () Bool)

(assert (=> d!105751 (= c!90096 lt!377023)))

(assert (=> d!105751 (= lt!377023 (containsKey!399 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105751 (= (contains!4187 lt!376720 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377024)))

(declare-fun b!830996 () Bool)

(declare-fun lt!377021 () Unit!28383)

(assert (=> b!830996 (= e!463359 lt!377021)))

(assert (=> b!830996 (= lt!377021 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!830996 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830997 () Bool)

(declare-fun Unit!28431 () Unit!28383)

(assert (=> b!830997 (= e!463359 Unit!28431)))

(declare-fun b!830998 () Bool)

(assert (=> b!830998 (= e!463358 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105751 c!90096) b!830996))

(assert (= (and d!105751 (not c!90096)) b!830997))

(assert (= (and d!105751 (not res!565752)) b!830998))

(declare-fun m!774207 () Bool)

(assert (=> d!105751 m!774207))

(declare-fun m!774209 () Bool)

(assert (=> b!830996 m!774209))

(assert (=> b!830996 m!773087))

(assert (=> b!830996 m!773087))

(declare-fun m!774211 () Bool)

(assert (=> b!830996 m!774211))

(assert (=> b!830998 m!773087))

(assert (=> b!830998 m!773087))

(assert (=> b!830998 m!774211))

(assert (=> d!105249 d!105751))

(declare-fun b!830999 () Bool)

(declare-fun e!463360 () Option!419)

(assert (=> b!830999 (= e!463360 (Some!418 (_2!5091 (h!17069 lt!376718))))))

(declare-fun b!831000 () Bool)

(declare-fun e!463361 () Option!419)

(assert (=> b!831000 (= e!463360 e!463361)))

(declare-fun c!90098 () Bool)

(assert (=> b!831000 (= c!90098 (and ((_ is Cons!15940) lt!376718) (not (= (_1!5091 (h!17069 lt!376718)) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831002 () Bool)

(assert (=> b!831002 (= e!463361 None!417)))

(declare-fun b!831001 () Bool)

(assert (=> b!831001 (= e!463361 (getValueByKey!413 (t!22300 lt!376718) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!105753 () Bool)

(declare-fun c!90097 () Bool)

(assert (=> d!105753 (= c!90097 (and ((_ is Cons!15940) lt!376718) (= (_1!5091 (h!17069 lt!376718)) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105753 (= (getValueByKey!413 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463360)))

(assert (= (and d!105753 c!90097) b!830999))

(assert (= (and d!105753 (not c!90097)) b!831000))

(assert (= (and b!831000 c!90098) b!831001))

(assert (= (and b!831000 (not c!90098)) b!831002))

(declare-fun m!774213 () Bool)

(assert (=> b!831001 m!774213))

(assert (=> d!105249 d!105753))

(declare-fun d!105755 () Bool)

(assert (=> d!105755 (= (getValueByKey!413 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377025 () Unit!28383)

(assert (=> d!105755 (= lt!377025 (choose!1426 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463362 () Bool)

(assert (=> d!105755 e!463362))

(declare-fun res!565753 () Bool)

(assert (=> d!105755 (=> (not res!565753) (not e!463362))))

(assert (=> d!105755 (= res!565753 (isStrictlySorted!437 lt!376718))))

(assert (=> d!105755 (= (lemmaContainsTupThenGetReturnValue!230 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377025)))

(declare-fun b!831003 () Bool)

(declare-fun res!565754 () Bool)

(assert (=> b!831003 (=> (not res!565754) (not e!463362))))

(assert (=> b!831003 (= res!565754 (containsKey!399 lt!376718 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831004 () Bool)

(assert (=> b!831004 (= e!463362 (contains!4188 lt!376718 (tuple2!10161 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105755 res!565753) b!831003))

(assert (= (and b!831003 res!565754) b!831004))

(assert (=> d!105755 m!773081))

(declare-fun m!774215 () Bool)

(assert (=> d!105755 m!774215))

(declare-fun m!774217 () Bool)

(assert (=> d!105755 m!774217))

(declare-fun m!774219 () Bool)

(assert (=> b!831003 m!774219))

(declare-fun m!774221 () Bool)

(assert (=> b!831004 m!774221))

(assert (=> d!105249 d!105755))

(declare-fun b!831005 () Bool)

(declare-fun res!565755 () Bool)

(declare-fun e!463364 () Bool)

(assert (=> b!831005 (=> (not res!565755) (not e!463364))))

(declare-fun lt!377026 () List!15944)

(assert (=> b!831005 (= res!565755 (containsKey!399 lt!377026 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90099 () Bool)

(declare-fun e!463366 () List!15944)

(declare-fun b!831006 () Bool)

(declare-fun c!90101 () Bool)

(assert (=> b!831006 (= e!463366 (ite c!90101 (t!22300 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (ite c!90099 (Cons!15940 (h!17069 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (t!22300 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))))) Nil!15941)))))

(declare-fun b!831007 () Bool)

(assert (=> b!831007 (= c!90099 (and ((_ is Cons!15940) (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (bvsgt (_1!5091 (h!17069 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!463363 () List!15944)

(declare-fun e!463365 () List!15944)

(assert (=> b!831007 (= e!463363 e!463365)))

(declare-fun b!831008 () Bool)

(assert (=> b!831008 (= e!463366 (insertStrictlySorted!269 (t!22300 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831009 () Bool)

(declare-fun e!463367 () List!15944)

(declare-fun call!36287 () List!15944)

(assert (=> b!831009 (= e!463367 call!36287)))

(declare-fun b!831010 () Bool)

(declare-fun call!36289 () List!15944)

(assert (=> b!831010 (= e!463363 call!36289)))

(declare-fun b!831011 () Bool)

(declare-fun call!36288 () List!15944)

(assert (=> b!831011 (= e!463365 call!36288)))

(declare-fun bm!36284 () Bool)

(assert (=> bm!36284 (= call!36288 call!36289)))

(declare-fun b!831012 () Bool)

(assert (=> b!831012 (= e!463364 (contains!4188 lt!377026 (tuple2!10161 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun d!105757 () Bool)

(assert (=> d!105757 e!463364))

(declare-fun res!565756 () Bool)

(assert (=> d!105757 (=> (not res!565756) (not e!463364))))

(assert (=> d!105757 (= res!565756 (isStrictlySorted!437 lt!377026))))

(assert (=> d!105757 (= lt!377026 e!463367)))

(declare-fun c!90102 () Bool)

(assert (=> d!105757 (= c!90102 (and ((_ is Cons!15940) (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (bvslt (_1!5091 (h!17069 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105757 (isStrictlySorted!437 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))))))

(assert (=> d!105757 (= (insertStrictlySorted!269 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377026)))

(declare-fun bm!36285 () Bool)

(assert (=> bm!36285 (= call!36289 call!36287)))

(declare-fun bm!36286 () Bool)

(assert (=> bm!36286 (= call!36287 ($colon$colon!535 e!463366 (ite c!90102 (h!17069 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (tuple2!10161 (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90100 () Bool)

(assert (=> bm!36286 (= c!90100 c!90102)))

(declare-fun b!831013 () Bool)

(assert (=> b!831013 (= e!463367 e!463363)))

(assert (=> b!831013 (= c!90101 (and ((_ is Cons!15940) (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219)))) (= (_1!5091 (h!17069 (toList!4502 (ite c!89816 call!36222 (ite c!89817 call!36223 call!36219))))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831014 () Bool)

(assert (=> b!831014 (= e!463365 call!36288)))

(assert (= (and d!105757 c!90102) b!831009))

(assert (= (and d!105757 (not c!90102)) b!831013))

(assert (= (and b!831013 c!90101) b!831010))

(assert (= (and b!831013 (not c!90101)) b!831007))

(assert (= (and b!831007 c!90099) b!831014))

(assert (= (and b!831007 (not c!90099)) b!831011))

(assert (= (or b!831014 b!831011) bm!36284))

(assert (= (or b!831010 bm!36284) bm!36285))

(assert (= (or b!831009 bm!36285) bm!36286))

(assert (= (and bm!36286 c!90100) b!831008))

(assert (= (and bm!36286 (not c!90100)) b!831006))

(assert (= (and d!105757 res!565756) b!831005))

(assert (= (and b!831005 res!565755) b!831012))

(declare-fun m!774223 () Bool)

(assert (=> b!831005 m!774223))

(declare-fun m!774225 () Bool)

(assert (=> b!831012 m!774225))

(declare-fun m!774227 () Bool)

(assert (=> b!831008 m!774227))

(declare-fun m!774229 () Bool)

(assert (=> d!105757 m!774229))

(declare-fun m!774231 () Bool)

(assert (=> d!105757 m!774231))

(declare-fun m!774233 () Bool)

(assert (=> bm!36286 m!774233))

(assert (=> d!105249 d!105757))

(declare-fun d!105759 () Bool)

(declare-fun res!565757 () Bool)

(declare-fun e!463368 () Bool)

(assert (=> d!105759 (=> res!565757 e!463368)))

(assert (=> d!105759 (= res!565757 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105759 (= (containsKey!399 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000) e!463368)))

(declare-fun b!831015 () Bool)

(declare-fun e!463369 () Bool)

(assert (=> b!831015 (= e!463368 e!463369)))

(declare-fun res!565758 () Bool)

(assert (=> b!831015 (=> (not res!565758) (not e!463369))))

(assert (=> b!831015 (= res!565758 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376595))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376595))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376595)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376595))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831016 () Bool)

(assert (=> b!831016 (= e!463369 (containsKey!399 (t!22300 (toList!4502 lt!376595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105759 (not res!565757)) b!831015))

(assert (= (and b!831015 res!565758) b!831016))

(declare-fun m!774235 () Bool)

(assert (=> b!831016 m!774235))

(assert (=> d!105253 d!105759))

(declare-fun d!105761 () Bool)

(declare-fun c!90103 () Bool)

(assert (=> d!105761 (= c!90103 ((_ is Nil!15941) (toList!4502 lt!376538)))))

(declare-fun e!463370 () (InoxSet tuple2!10160))

(assert (=> d!105761 (= (content!385 (toList!4502 lt!376538)) e!463370)))

(declare-fun b!831017 () Bool)

(assert (=> b!831017 (= e!463370 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!831018 () Bool)

(assert (=> b!831018 (= e!463370 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376538)) true) (content!385 (t!22300 (toList!4502 lt!376538)))))))

(assert (= (and d!105761 c!90103) b!831017))

(assert (= (and d!105761 (not c!90103)) b!831018))

(declare-fun m!774237 () Bool)

(assert (=> b!831018 m!774237))

(declare-fun m!774239 () Bool)

(assert (=> b!831018 m!774239))

(assert (=> d!105221 d!105761))

(assert (=> d!105277 d!105269))

(declare-fun d!105763 () Bool)

(assert (=> d!105763 (= (apply!372 (+!2010 lt!376521 (tuple2!10161 lt!376520 minValue!754)) lt!376513) (apply!372 lt!376521 lt!376513))))

(assert (=> d!105763 true))

(declare-fun _$34!1146 () Unit!28383)

(assert (=> d!105763 (= (choose!1429 lt!376521 lt!376520 minValue!754 lt!376513) _$34!1146)))

(declare-fun bs!23208 () Bool)

(assert (= bs!23208 d!105763))

(assert (=> bs!23208 m!772577))

(assert (=> bs!23208 m!772577))

(assert (=> bs!23208 m!772579))

(assert (=> bs!23208 m!772605))

(assert (=> d!105277 d!105763))

(assert (=> d!105277 d!105275))

(declare-fun d!105765 () Bool)

(declare-fun e!463371 () Bool)

(assert (=> d!105765 e!463371))

(declare-fun res!565759 () Bool)

(assert (=> d!105765 (=> res!565759 e!463371)))

(declare-fun lt!377030 () Bool)

(assert (=> d!105765 (= res!565759 (not lt!377030))))

(declare-fun lt!377029 () Bool)

(assert (=> d!105765 (= lt!377030 lt!377029)))

(declare-fun lt!377028 () Unit!28383)

(declare-fun e!463372 () Unit!28383)

(assert (=> d!105765 (= lt!377028 e!463372)))

(declare-fun c!90104 () Bool)

(assert (=> d!105765 (= c!90104 lt!377029)))

(assert (=> d!105765 (= lt!377029 (containsKey!399 (toList!4502 lt!376521) lt!376513))))

(assert (=> d!105765 (= (contains!4187 lt!376521 lt!376513) lt!377030)))

(declare-fun b!831019 () Bool)

(declare-fun lt!377027 () Unit!28383)

(assert (=> b!831019 (= e!463372 lt!377027)))

(assert (=> b!831019 (= lt!377027 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376521) lt!376513))))

(assert (=> b!831019 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376521) lt!376513))))

(declare-fun b!831020 () Bool)

(declare-fun Unit!28432 () Unit!28383)

(assert (=> b!831020 (= e!463372 Unit!28432)))

(declare-fun b!831021 () Bool)

(assert (=> b!831021 (= e!463371 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376521) lt!376513)))))

(assert (= (and d!105765 c!90104) b!831019))

(assert (= (and d!105765 (not c!90104)) b!831020))

(assert (= (and d!105765 (not res!565759)) b!831021))

(declare-fun m!774241 () Bool)

(assert (=> d!105765 m!774241))

(declare-fun m!774243 () Bool)

(assert (=> b!831019 m!774243))

(assert (=> b!831019 m!773149))

(assert (=> b!831019 m!773149))

(declare-fun m!774245 () Bool)

(assert (=> b!831019 m!774245))

(assert (=> b!831021 m!773149))

(assert (=> b!831021 m!773149))

(assert (=> b!831021 m!774245))

(assert (=> d!105277 d!105765))

(assert (=> d!105277 d!105271))

(declare-fun d!105767 () Bool)

(declare-fun lt!377031 () Bool)

(assert (=> d!105767 (= lt!377031 (select (content!385 (toList!4502 lt!376683)) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463373 () Bool)

(assert (=> d!105767 (= lt!377031 e!463373)))

(declare-fun res!565760 () Bool)

(assert (=> d!105767 (=> (not res!565760) (not e!463373))))

(assert (=> d!105767 (= res!565760 ((_ is Cons!15940) (toList!4502 lt!376683)))))

(assert (=> d!105767 (= (contains!4188 (toList!4502 lt!376683) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377031)))

(declare-fun b!831022 () Bool)

(declare-fun e!463374 () Bool)

(assert (=> b!831022 (= e!463373 e!463374)))

(declare-fun res!565761 () Bool)

(assert (=> b!831022 (=> res!565761 e!463374)))

(assert (=> b!831022 (= res!565761 (= (h!17069 (toList!4502 lt!376683)) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831023 () Bool)

(assert (=> b!831023 (= e!463374 (contains!4188 (t!22300 (toList!4502 lt!376683)) (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105767 res!565760) b!831022))

(assert (= (and b!831022 (not res!565761)) b!831023))

(declare-fun m!774247 () Bool)

(assert (=> d!105767 m!774247))

(declare-fun m!774249 () Bool)

(assert (=> d!105767 m!774249))

(declare-fun m!774251 () Bool)

(assert (=> b!831023 m!774251))

(assert (=> b!830310 d!105767))

(assert (=> b!830505 d!105585))

(assert (=> b!830505 d!105365))

(declare-fun d!105769 () Bool)

(assert (=> d!105769 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23209 () Bool)

(assert (= bs!23209 d!105769))

(assert (=> bs!23209 m!773315))

(declare-fun m!774253 () Bool)

(assert (=> bs!23209 m!774253))

(assert (=> b!830439 d!105769))

(declare-fun b!831024 () Bool)

(declare-fun e!463375 () Option!419)

(assert (=> b!831024 (= e!463375 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376595)))))))

(declare-fun b!831025 () Bool)

(declare-fun e!463376 () Option!419)

(assert (=> b!831025 (= e!463375 e!463376)))

(declare-fun c!90106 () Bool)

(assert (=> b!831025 (= c!90106 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831027 () Bool)

(assert (=> b!831027 (= e!463376 None!417)))

(declare-fun b!831026 () Bool)

(assert (=> b!831026 (= e!463376 (getValueByKey!413 (t!22300 (toList!4502 lt!376595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105771 () Bool)

(declare-fun c!90105 () Bool)

(assert (=> d!105771 (= c!90105 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105771 (= (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000) e!463375)))

(assert (= (and d!105771 c!90105) b!831024))

(assert (= (and d!105771 (not c!90105)) b!831025))

(assert (= (and b!831025 c!90106) b!831026))

(assert (= (and b!831025 (not c!90106)) b!831027))

(declare-fun m!774255 () Bool)

(assert (=> b!831026 m!774255))

(assert (=> b!830439 d!105771))

(declare-fun b!831028 () Bool)

(declare-fun e!463378 () Bool)

(declare-fun call!36290 () Bool)

(assert (=> b!831028 (= e!463378 call!36290)))

(declare-fun b!831029 () Bool)

(assert (=> b!831029 (= e!463378 call!36290)))

(declare-fun d!105773 () Bool)

(declare-fun res!565764 () Bool)

(declare-fun e!463377 () Bool)

(assert (=> d!105773 (=> res!565764 e!463377)))

(assert (=> d!105773 (= res!565764 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(assert (=> d!105773 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!89904 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942))) e!463377)))

(declare-fun b!831030 () Bool)

(declare-fun e!463379 () Bool)

(assert (=> b!831030 (= e!463377 e!463379)))

(declare-fun res!565762 () Bool)

(assert (=> b!831030 (=> (not res!565762) (not e!463379))))

(declare-fun e!463380 () Bool)

(assert (=> b!831030 (= res!565762 (not e!463380))))

(declare-fun res!565763 () Bool)

(assert (=> b!831030 (=> (not res!565763) (not e!463380))))

(assert (=> b!831030 (= res!565763 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!831031 () Bool)

(assert (=> b!831031 (= e!463379 e!463378)))

(declare-fun c!90107 () Bool)

(assert (=> b!831031 (= c!90107 (validKeyInArray!0 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!36287 () Bool)

(assert (=> bm!36287 (= call!36290 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90107 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!89904 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942))) (ite c!89904 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)))))))

(declare-fun b!831032 () Bool)

(assert (=> b!831032 (= e!463380 (contains!4189 (ite c!89904 (Cons!15941 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!105773 (not res!565764)) b!831030))

(assert (= (and b!831030 res!565763) b!831032))

(assert (= (and b!831030 res!565762) b!831031))

(assert (= (and b!831031 c!90107) b!831029))

(assert (= (and b!831031 (not c!90107)) b!831028))

(assert (= (or b!831029 b!831028) bm!36287))

(assert (=> b!831030 m!773563))

(assert (=> b!831030 m!773563))

(assert (=> b!831030 m!773565))

(assert (=> b!831031 m!773563))

(assert (=> b!831031 m!773563))

(assert (=> b!831031 m!773565))

(assert (=> bm!36287 m!773563))

(declare-fun m!774257 () Bool)

(assert (=> bm!36287 m!774257))

(assert (=> b!831032 m!773563))

(assert (=> b!831032 m!773563))

(declare-fun m!774259 () Bool)

(assert (=> b!831032 m!774259))

(assert (=> bm!36248 d!105773))

(declare-fun d!105775 () Bool)

(assert (=> d!105775 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377032 () Unit!28383)

(assert (=> d!105775 (= lt!377032 (choose!1430 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463381 () Bool)

(assert (=> d!105775 e!463381))

(declare-fun res!565765 () Bool)

(assert (=> d!105775 (=> (not res!565765) (not e!463381))))

(assert (=> d!105775 (= res!565765 (isStrictlySorted!437 (toList!4502 lt!376602)))))

(assert (=> d!105775 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377032)))

(declare-fun b!831033 () Bool)

(assert (=> b!831033 (= e!463381 (containsKey!399 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105775 res!565765) b!831033))

(assert (=> d!105775 m!773301))

(assert (=> d!105775 m!773301))

(assert (=> d!105775 m!773303))

(declare-fun m!774261 () Bool)

(assert (=> d!105775 m!774261))

(assert (=> d!105775 m!774101))

(assert (=> b!831033 m!773297))

(assert (=> b!830431 d!105775))

(declare-fun d!105777 () Bool)

(assert (=> d!105777 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23210 () Bool)

(assert (= bs!23210 d!105777))

(assert (=> bs!23210 m!773301))

(declare-fun m!774263 () Bool)

(assert (=> bs!23210 m!774263))

(assert (=> b!830431 d!105777))

(declare-fun b!831034 () Bool)

(declare-fun e!463382 () Option!419)

(assert (=> b!831034 (= e!463382 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376602)))))))

(declare-fun b!831035 () Bool)

(declare-fun e!463383 () Option!419)

(assert (=> b!831035 (= e!463382 e!463383)))

(declare-fun c!90109 () Bool)

(assert (=> b!831035 (= c!90109 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831037 () Bool)

(assert (=> b!831037 (= e!463383 None!417)))

(declare-fun b!831036 () Bool)

(assert (=> b!831036 (= e!463383 (getValueByKey!413 (t!22300 (toList!4502 lt!376602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105779 () Bool)

(declare-fun c!90108 () Bool)

(assert (=> d!105779 (= c!90108 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105779 (= (getValueByKey!413 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000) e!463382)))

(assert (= (and d!105779 c!90108) b!831034))

(assert (= (and d!105779 (not c!90108)) b!831035))

(assert (= (and b!831035 c!90109) b!831036))

(assert (= (and b!831035 (not c!90109)) b!831037))

(declare-fun m!774265 () Bool)

(assert (=> b!831036 m!774265))

(assert (=> b!830431 d!105779))

(assert (=> b!830283 d!105447))

(declare-fun d!105781 () Bool)

(declare-fun lt!377033 () Bool)

(assert (=> d!105781 (= lt!377033 (select (content!385 lt!376677) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463384 () Bool)

(assert (=> d!105781 (= lt!377033 e!463384)))

(declare-fun res!565766 () Bool)

(assert (=> d!105781 (=> (not res!565766) (not e!463384))))

(assert (=> d!105781 (= res!565766 ((_ is Cons!15940) lt!376677))))

(assert (=> d!105781 (= (contains!4188 lt!376677 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!377033)))

(declare-fun b!831038 () Bool)

(declare-fun e!463385 () Bool)

(assert (=> b!831038 (= e!463384 e!463385)))

(declare-fun res!565767 () Bool)

(assert (=> b!831038 (=> res!565767 e!463385)))

(assert (=> b!831038 (= res!565767 (= (h!17069 lt!376677) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!831039 () Bool)

(assert (=> b!831039 (= e!463385 (contains!4188 (t!22300 lt!376677) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105781 res!565766) b!831038))

(assert (= (and b!831038 (not res!565767)) b!831039))

(declare-fun m!774267 () Bool)

(assert (=> d!105781 m!774267))

(declare-fun m!774269 () Bool)

(assert (=> d!105781 m!774269))

(declare-fun m!774271 () Bool)

(assert (=> b!831039 m!774271))

(assert (=> b!830300 d!105781))

(declare-fun d!105783 () Bool)

(declare-fun e!463386 () Bool)

(assert (=> d!105783 e!463386))

(declare-fun res!565768 () Bool)

(assert (=> d!105783 (=> res!565768 e!463386)))

(declare-fun lt!377037 () Bool)

(assert (=> d!105783 (= res!565768 (not lt!377037))))

(declare-fun lt!377036 () Bool)

(assert (=> d!105783 (= lt!377037 lt!377036)))

(declare-fun lt!377035 () Unit!28383)

(declare-fun e!463387 () Unit!28383)

(assert (=> d!105783 (= lt!377035 e!463387)))

(declare-fun c!90110 () Bool)

(assert (=> d!105783 (= c!90110 lt!377036)))

(assert (=> d!105783 (= lt!377036 (containsKey!399 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(assert (=> d!105783 (= (contains!4187 lt!376743 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!377037)))

(declare-fun b!831040 () Bool)

(declare-fun lt!377034 () Unit!28383)

(assert (=> b!831040 (= e!463387 lt!377034)))

(assert (=> b!831040 (= lt!377034 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(assert (=> b!831040 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun b!831041 () Bool)

(declare-fun Unit!28433 () Unit!28383)

(assert (=> b!831041 (= e!463387 Unit!28433)))

(declare-fun b!831042 () Bool)

(assert (=> b!831042 (= e!463386 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(assert (= (and d!105783 c!90110) b!831040))

(assert (= (and d!105783 (not c!90110)) b!831041))

(assert (= (and d!105783 (not res!565768)) b!831042))

(declare-fun m!774273 () Bool)

(assert (=> d!105783 m!774273))

(declare-fun m!774275 () Bool)

(assert (=> b!831040 m!774275))

(assert (=> b!831040 m!773145))

(assert (=> b!831040 m!773145))

(declare-fun m!774277 () Bool)

(assert (=> b!831040 m!774277))

(assert (=> b!831042 m!773145))

(assert (=> b!831042 m!773145))

(assert (=> b!831042 m!774277))

(assert (=> d!105267 d!105783))

(declare-fun b!831043 () Bool)

(declare-fun e!463388 () Option!419)

(assert (=> b!831043 (= e!463388 (Some!418 (_2!5091 (h!17069 lt!376741))))))

(declare-fun b!831044 () Bool)

(declare-fun e!463389 () Option!419)

(assert (=> b!831044 (= e!463388 e!463389)))

(declare-fun c!90112 () Bool)

(assert (=> b!831044 (= c!90112 (and ((_ is Cons!15940) lt!376741) (not (= (_1!5091 (h!17069 lt!376741)) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))))

(declare-fun b!831046 () Bool)

(assert (=> b!831046 (= e!463389 None!417)))

(declare-fun b!831045 () Bool)

(assert (=> b!831045 (= e!463389 (getValueByKey!413 (t!22300 lt!376741) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun d!105785 () Bool)

(declare-fun c!90111 () Bool)

(assert (=> d!105785 (= c!90111 (and ((_ is Cons!15940) lt!376741) (= (_1!5091 (h!17069 lt!376741)) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(assert (=> d!105785 (= (getValueByKey!413 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) e!463388)))

(assert (= (and d!105785 c!90111) b!831043))

(assert (= (and d!105785 (not c!90111)) b!831044))

(assert (= (and b!831044 c!90112) b!831045))

(assert (= (and b!831044 (not c!90112)) b!831046))

(declare-fun m!774279 () Bool)

(assert (=> b!831045 m!774279))

(assert (=> d!105267 d!105785))

(declare-fun d!105787 () Bool)

(assert (=> d!105787 (= (getValueByKey!413 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun lt!377038 () Unit!28383)

(assert (=> d!105787 (= lt!377038 (choose!1426 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun e!463390 () Bool)

(assert (=> d!105787 e!463390))

(declare-fun res!565769 () Bool)

(assert (=> d!105787 (=> (not res!565769) (not e!463390))))

(assert (=> d!105787 (= res!565769 (isStrictlySorted!437 lt!376741))))

(assert (=> d!105787 (= (lemmaContainsTupThenGetReturnValue!230 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!377038)))

(declare-fun b!831047 () Bool)

(declare-fun res!565770 () Bool)

(assert (=> b!831047 (=> (not res!565770) (not e!463390))))

(assert (=> b!831047 (= res!565770 (containsKey!399 lt!376741 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun b!831048 () Bool)

(assert (=> b!831048 (= e!463390 (contains!4188 lt!376741 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(assert (= (and d!105787 res!565769) b!831047))

(assert (= (and b!831047 res!565770) b!831048))

(assert (=> d!105787 m!773139))

(declare-fun m!774281 () Bool)

(assert (=> d!105787 m!774281))

(declare-fun m!774283 () Bool)

(assert (=> d!105787 m!774283))

(declare-fun m!774285 () Bool)

(assert (=> b!831047 m!774285))

(declare-fun m!774287 () Bool)

(assert (=> b!831048 m!774287))

(assert (=> d!105267 d!105787))

(declare-fun b!831049 () Bool)

(declare-fun res!565771 () Bool)

(declare-fun e!463392 () Bool)

(assert (=> b!831049 (=> (not res!565771) (not e!463392))))

(declare-fun lt!377039 () List!15944)

(assert (=> b!831049 (= res!565771 (containsKey!399 lt!377039 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun c!90115 () Bool)

(declare-fun e!463394 () List!15944)

(declare-fun b!831050 () Bool)

(declare-fun c!90113 () Bool)

(assert (=> b!831050 (= e!463394 (ite c!90115 (t!22300 (toList!4502 lt!376523)) (ite c!90113 (Cons!15940 (h!17069 (toList!4502 lt!376523)) (t!22300 (toList!4502 lt!376523))) Nil!15941)))))

(declare-fun b!831051 () Bool)

(assert (=> b!831051 (= c!90113 (and ((_ is Cons!15940) (toList!4502 lt!376523)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376523))) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(declare-fun e!463391 () List!15944)

(declare-fun e!463393 () List!15944)

(assert (=> b!831051 (= e!463391 e!463393)))

(declare-fun b!831052 () Bool)

(assert (=> b!831052 (= e!463394 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376523)) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun b!831053 () Bool)

(declare-fun e!463395 () List!15944)

(declare-fun call!36291 () List!15944)

(assert (=> b!831053 (= e!463395 call!36291)))

(declare-fun b!831054 () Bool)

(declare-fun call!36293 () List!15944)

(assert (=> b!831054 (= e!463391 call!36293)))

(declare-fun b!831055 () Bool)

(declare-fun call!36292 () List!15944)

(assert (=> b!831055 (= e!463393 call!36292)))

(declare-fun bm!36288 () Bool)

(assert (=> bm!36288 (= call!36292 call!36293)))

(declare-fun b!831056 () Bool)

(assert (=> b!831056 (= e!463392 (contains!4188 lt!377039 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(declare-fun d!105789 () Bool)

(assert (=> d!105789 e!463392))

(declare-fun res!565772 () Bool)

(assert (=> d!105789 (=> (not res!565772) (not e!463392))))

(assert (=> d!105789 (= res!565772 (isStrictlySorted!437 lt!377039))))

(assert (=> d!105789 (= lt!377039 e!463395)))

(declare-fun c!90116 () Bool)

(assert (=> d!105789 (= c!90116 (and ((_ is Cons!15940) (toList!4502 lt!376523)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376523))) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(assert (=> d!105789 (isStrictlySorted!437 (toList!4502 lt!376523))))

(assert (=> d!105789 (= (insertStrictlySorted!269 (toList!4502 lt!376523) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) lt!377039)))

(declare-fun bm!36289 () Bool)

(assert (=> bm!36289 (= call!36293 call!36291)))

(declare-fun bm!36290 () Bool)

(assert (=> bm!36290 (= call!36291 ($colon$colon!535 e!463394 (ite c!90116 (h!17069 (toList!4502 lt!376523)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)) (_2!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))))

(declare-fun c!90114 () Bool)

(assert (=> bm!36290 (= c!90114 c!90116)))

(declare-fun b!831057 () Bool)

(assert (=> b!831057 (= e!463395 e!463391)))

(assert (=> b!831057 (= c!90115 (and ((_ is Cons!15940) (toList!4502 lt!376523)) (= (_1!5091 (h!17069 (toList!4502 lt!376523))) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(declare-fun b!831058 () Bool)

(assert (=> b!831058 (= e!463393 call!36292)))

(assert (= (and d!105789 c!90116) b!831053))

(assert (= (and d!105789 (not c!90116)) b!831057))

(assert (= (and b!831057 c!90115) b!831054))

(assert (= (and b!831057 (not c!90115)) b!831051))

(assert (= (and b!831051 c!90113) b!831058))

(assert (= (and b!831051 (not c!90113)) b!831055))

(assert (= (or b!831058 b!831055) bm!36288))

(assert (= (or b!831054 bm!36288) bm!36289))

(assert (= (or b!831053 bm!36289) bm!36290))

(assert (= (and bm!36290 c!90114) b!831052))

(assert (= (and bm!36290 (not c!90114)) b!831050))

(assert (= (and d!105789 res!565772) b!831049))

(assert (= (and b!831049 res!565771) b!831056))

(declare-fun m!774289 () Bool)

(assert (=> b!831049 m!774289))

(declare-fun m!774291 () Bool)

(assert (=> b!831056 m!774291))

(declare-fun m!774293 () Bool)

(assert (=> b!831052 m!774293))

(declare-fun m!774295 () Bool)

(assert (=> d!105789 m!774295))

(declare-fun m!774297 () Bool)

(assert (=> d!105789 m!774297))

(declare-fun m!774299 () Bool)

(assert (=> bm!36290 m!774299))

(assert (=> d!105267 d!105789))

(declare-fun d!105791 () Bool)

(declare-fun lt!377040 () Bool)

(assert (=> d!105791 (= lt!377040 (select (content!385 (toList!4502 lt!376732)) (tuple2!10161 lt!376512 minValue!754)))))

(declare-fun e!463396 () Bool)

(assert (=> d!105791 (= lt!377040 e!463396)))

(declare-fun res!565773 () Bool)

(assert (=> d!105791 (=> (not res!565773) (not e!463396))))

(assert (=> d!105791 (= res!565773 ((_ is Cons!15940) (toList!4502 lt!376732)))))

(assert (=> d!105791 (= (contains!4188 (toList!4502 lt!376732) (tuple2!10161 lt!376512 minValue!754)) lt!377040)))

(declare-fun b!831059 () Bool)

(declare-fun e!463397 () Bool)

(assert (=> b!831059 (= e!463396 e!463397)))

(declare-fun res!565774 () Bool)

(assert (=> b!831059 (=> res!565774 e!463397)))

(assert (=> b!831059 (= res!565774 (= (h!17069 (toList!4502 lt!376732)) (tuple2!10161 lt!376512 minValue!754)))))

(declare-fun b!831060 () Bool)

(assert (=> b!831060 (= e!463397 (contains!4188 (t!22300 (toList!4502 lt!376732)) (tuple2!10161 lt!376512 minValue!754)))))

(assert (= (and d!105791 res!565773) b!831059))

(assert (= (and b!831059 (not res!565774)) b!831060))

(declare-fun m!774301 () Bool)

(assert (=> d!105791 m!774301))

(declare-fun m!774303 () Bool)

(assert (=> d!105791 m!774303))

(declare-fun m!774305 () Bool)

(assert (=> b!831060 m!774305))

(assert (=> b!830375 d!105791))

(declare-fun d!105793 () Bool)

(declare-fun res!565775 () Bool)

(declare-fun e!463398 () Bool)

(assert (=> d!105793 (=> res!565775 e!463398)))

(assert (=> d!105793 (= res!565775 (and ((_ is Cons!15940) lt!376609) (= (_1!5091 (h!17069 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105793 (= (containsKey!399 lt!376609 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463398)))

(declare-fun b!831061 () Bool)

(declare-fun e!463399 () Bool)

(assert (=> b!831061 (= e!463398 e!463399)))

(declare-fun res!565776 () Bool)

(assert (=> b!831061 (=> (not res!565776) (not e!463399))))

(assert (=> b!831061 (= res!565776 (and (or (not ((_ is Cons!15940) lt!376609)) (bvsle (_1!5091 (h!17069 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15940) lt!376609) (bvslt (_1!5091 (h!17069 lt!376609)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831062 () Bool)

(assert (=> b!831062 (= e!463399 (containsKey!399 (t!22300 lt!376609) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!105793 (not res!565775)) b!831061))

(assert (= (and b!831061 res!565776) b!831062))

(declare-fun m!774307 () Bool)

(assert (=> b!831062 m!774307))

(assert (=> b!830238 d!105793))

(declare-fun d!105795 () Bool)

(declare-fun e!463400 () Bool)

(assert (=> d!105795 e!463400))

(declare-fun res!565777 () Bool)

(assert (=> d!105795 (=> res!565777 e!463400)))

(declare-fun lt!377044 () Bool)

(assert (=> d!105795 (= res!565777 (not lt!377044))))

(declare-fun lt!377043 () Bool)

(assert (=> d!105795 (= lt!377044 lt!377043)))

(declare-fun lt!377042 () Unit!28383)

(declare-fun e!463401 () Unit!28383)

(assert (=> d!105795 (= lt!377042 e!463401)))

(declare-fun c!90117 () Bool)

(assert (=> d!105795 (= c!90117 lt!377043)))

(assert (=> d!105795 (= lt!377043 (containsKey!399 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105795 (= (contains!4187 lt!376683 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377044)))

(declare-fun b!831063 () Bool)

(declare-fun lt!377041 () Unit!28383)

(assert (=> b!831063 (= e!463401 lt!377041)))

(assert (=> b!831063 (= lt!377041 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!831063 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831064 () Bool)

(declare-fun Unit!28434 () Unit!28383)

(assert (=> b!831064 (= e!463401 Unit!28434)))

(declare-fun b!831065 () Bool)

(assert (=> b!831065 (= e!463400 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105795 c!90117) b!831063))

(assert (= (and d!105795 (not c!90117)) b!831064))

(assert (= (and d!105795 (not res!565777)) b!831065))

(declare-fun m!774309 () Bool)

(assert (=> d!105795 m!774309))

(declare-fun m!774311 () Bool)

(assert (=> b!831063 m!774311))

(assert (=> b!831063 m!772995))

(assert (=> b!831063 m!772995))

(declare-fun m!774313 () Bool)

(assert (=> b!831063 m!774313))

(assert (=> b!831065 m!772995))

(assert (=> b!831065 m!772995))

(assert (=> b!831065 m!774313))

(assert (=> d!105223 d!105795))

(declare-fun b!831066 () Bool)

(declare-fun e!463402 () Option!419)

(assert (=> b!831066 (= e!463402 (Some!418 (_2!5091 (h!17069 lt!376681))))))

(declare-fun b!831067 () Bool)

(declare-fun e!463403 () Option!419)

(assert (=> b!831067 (= e!463402 e!463403)))

(declare-fun c!90119 () Bool)

(assert (=> b!831067 (= c!90119 (and ((_ is Cons!15940) lt!376681) (not (= (_1!5091 (h!17069 lt!376681)) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831069 () Bool)

(assert (=> b!831069 (= e!463403 None!417)))

(declare-fun b!831068 () Bool)

(assert (=> b!831068 (= e!463403 (getValueByKey!413 (t!22300 lt!376681) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!105797 () Bool)

(declare-fun c!90118 () Bool)

(assert (=> d!105797 (= c!90118 (and ((_ is Cons!15940) lt!376681) (= (_1!5091 (h!17069 lt!376681)) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105797 (= (getValueByKey!413 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463402)))

(assert (= (and d!105797 c!90118) b!831066))

(assert (= (and d!105797 (not c!90118)) b!831067))

(assert (= (and b!831067 c!90119) b!831068))

(assert (= (and b!831067 (not c!90119)) b!831069))

(declare-fun m!774315 () Bool)

(assert (=> b!831068 m!774315))

(assert (=> d!105223 d!105797))

(declare-fun d!105799 () Bool)

(assert (=> d!105799 (= (getValueByKey!413 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!418 (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377045 () Unit!28383)

(assert (=> d!105799 (= lt!377045 (choose!1426 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463404 () Bool)

(assert (=> d!105799 e!463404))

(declare-fun res!565778 () Bool)

(assert (=> d!105799 (=> (not res!565778) (not e!463404))))

(assert (=> d!105799 (= res!565778 (isStrictlySorted!437 lt!376681))))

(assert (=> d!105799 (= (lemmaContainsTupThenGetReturnValue!230 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377045)))

(declare-fun b!831070 () Bool)

(declare-fun res!565779 () Bool)

(assert (=> b!831070 (=> (not res!565779) (not e!463404))))

(assert (=> b!831070 (= res!565779 (containsKey!399 lt!376681 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831071 () Bool)

(assert (=> b!831071 (= e!463404 (contains!4188 lt!376681 (tuple2!10161 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!105799 res!565778) b!831070))

(assert (= (and b!831070 res!565779) b!831071))

(assert (=> d!105799 m!772989))

(declare-fun m!774317 () Bool)

(assert (=> d!105799 m!774317))

(declare-fun m!774319 () Bool)

(assert (=> d!105799 m!774319))

(declare-fun m!774321 () Bool)

(assert (=> b!831070 m!774321))

(declare-fun m!774323 () Bool)

(assert (=> b!831071 m!774323))

(assert (=> d!105223 d!105799))

(declare-fun b!831072 () Bool)

(declare-fun res!565780 () Bool)

(declare-fun e!463406 () Bool)

(assert (=> b!831072 (=> (not res!565780) (not e!463406))))

(declare-fun lt!377046 () List!15944)

(assert (=> b!831072 (= res!565780 (containsKey!399 lt!377046 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90120 () Bool)

(declare-fun b!831073 () Bool)

(declare-fun c!90122 () Bool)

(declare-fun e!463408 () List!15944)

(assert (=> b!831073 (= e!463408 (ite c!90122 (t!22300 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (ite c!90120 (Cons!15940 (h!17069 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (t!22300 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))))) Nil!15941)))))

(declare-fun b!831074 () Bool)

(assert (=> b!831074 (= c!90120 (and ((_ is Cons!15940) (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (bvsgt (_1!5091 (h!17069 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun e!463405 () List!15944)

(declare-fun e!463407 () List!15944)

(assert (=> b!831074 (= e!463405 e!463407)))

(declare-fun b!831075 () Bool)

(assert (=> b!831075 (= e!463408 (insertStrictlySorted!269 (t!22300 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831076 () Bool)

(declare-fun e!463409 () List!15944)

(declare-fun call!36294 () List!15944)

(assert (=> b!831076 (= e!463409 call!36294)))

(declare-fun b!831077 () Bool)

(declare-fun call!36296 () List!15944)

(assert (=> b!831077 (= e!463405 call!36296)))

(declare-fun b!831078 () Bool)

(declare-fun call!36295 () List!15944)

(assert (=> b!831078 (= e!463407 call!36295)))

(declare-fun bm!36291 () Bool)

(assert (=> bm!36291 (= call!36295 call!36296)))

(declare-fun b!831079 () Bool)

(assert (=> b!831079 (= e!463406 (contains!4188 lt!377046 (tuple2!10161 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun d!105801 () Bool)

(assert (=> d!105801 e!463406))

(declare-fun res!565781 () Bool)

(assert (=> d!105801 (=> (not res!565781) (not e!463406))))

(assert (=> d!105801 (= res!565781 (isStrictlySorted!437 lt!377046))))

(assert (=> d!105801 (= lt!377046 e!463409)))

(declare-fun c!90123 () Bool)

(assert (=> d!105801 (= c!90123 (and ((_ is Cons!15940) (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (bvslt (_1!5091 (h!17069 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105801 (isStrictlySorted!437 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))))))

(assert (=> d!105801 (= (insertStrictlySorted!269 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377046)))

(declare-fun bm!36292 () Bool)

(assert (=> bm!36292 (= call!36296 call!36294)))

(declare-fun bm!36293 () Bool)

(assert (=> bm!36293 (= call!36294 ($colon$colon!535 e!463408 (ite c!90123 (h!17069 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (tuple2!10161 (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90121 () Bool)

(assert (=> bm!36293 (= c!90121 c!90123)))

(declare-fun b!831080 () Bool)

(assert (=> b!831080 (= e!463409 e!463405)))

(assert (=> b!831080 (= c!90122 (and ((_ is Cons!15940) (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212)))) (= (_1!5091 (h!17069 (toList!4502 (ite c!89810 call!36215 (ite c!89811 call!36216 call!36212))))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831081 () Bool)

(assert (=> b!831081 (= e!463407 call!36295)))

(assert (= (and d!105801 c!90123) b!831076))

(assert (= (and d!105801 (not c!90123)) b!831080))

(assert (= (and b!831080 c!90122) b!831077))

(assert (= (and b!831080 (not c!90122)) b!831074))

(assert (= (and b!831074 c!90120) b!831081))

(assert (= (and b!831074 (not c!90120)) b!831078))

(assert (= (or b!831081 b!831078) bm!36291))

(assert (= (or b!831077 bm!36291) bm!36292))

(assert (= (or b!831076 bm!36292) bm!36293))

(assert (= (and bm!36293 c!90121) b!831075))

(assert (= (and bm!36293 (not c!90121)) b!831073))

(assert (= (and d!105801 res!565781) b!831072))

(assert (= (and b!831072 res!565780) b!831079))

(declare-fun m!774325 () Bool)

(assert (=> b!831072 m!774325))

(declare-fun m!774327 () Bool)

(assert (=> b!831079 m!774327))

(declare-fun m!774329 () Bool)

(assert (=> b!831075 m!774329))

(declare-fun m!774331 () Bool)

(assert (=> d!105801 m!774331))

(declare-fun m!774333 () Bool)

(assert (=> d!105801 m!774333))

(declare-fun m!774335 () Bool)

(assert (=> bm!36293 m!774335))

(assert (=> d!105223 d!105801))

(assert (=> b!830372 d!105447))

(assert (=> b!830378 d!105637))

(assert (=> b!830378 d!105639))

(declare-fun b!831082 () Bool)

(declare-fun e!463410 () Option!419)

(assert (=> b!831082 (= e!463410 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376743)))))))

(declare-fun b!831083 () Bool)

(declare-fun e!463411 () Option!419)

(assert (=> b!831083 (= e!463410 e!463411)))

(declare-fun c!90125 () Bool)

(assert (=> b!831083 (= c!90125 (and ((_ is Cons!15940) (toList!4502 lt!376743)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376743))) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))))

(declare-fun b!831085 () Bool)

(assert (=> b!831085 (= e!463411 None!417)))

(declare-fun b!831084 () Bool)

(assert (=> b!831084 (= e!463411 (getValueByKey!413 (t!22300 (toList!4502 lt!376743)) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))))))

(declare-fun c!90124 () Bool)

(declare-fun d!105803 () Bool)

(assert (=> d!105803 (= c!90124 (and ((_ is Cons!15940) (toList!4502 lt!376743)) (= (_1!5091 (h!17069 (toList!4502 lt!376743))) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34)))))))

(assert (=> d!105803 (= (getValueByKey!413 (toList!4502 lt!376743) (_1!5091 (tuple2!10161 lt!376509 zeroValueAfter!34))) e!463410)))

(assert (= (and d!105803 c!90124) b!831082))

(assert (= (and d!105803 (not c!90124)) b!831083))

(assert (= (and b!831083 c!90125) b!831084))

(assert (= (and b!831083 (not c!90125)) b!831085))

(declare-fun m!774337 () Bool)

(assert (=> b!831084 m!774337))

(assert (=> b!830380 d!105803))

(declare-fun d!105805 () Bool)

(declare-fun lt!377047 () Bool)

(assert (=> d!105805 (= lt!377047 (select (content!385 (t!22300 (toList!4502 lt!376538))) lt!376417))))

(declare-fun e!463412 () Bool)

(assert (=> d!105805 (= lt!377047 e!463412)))

(declare-fun res!565782 () Bool)

(assert (=> d!105805 (=> (not res!565782) (not e!463412))))

(assert (=> d!105805 (= res!565782 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376538))))))

(assert (=> d!105805 (= (contains!4188 (t!22300 (toList!4502 lt!376538)) lt!376417) lt!377047)))

(declare-fun b!831086 () Bool)

(declare-fun e!463413 () Bool)

(assert (=> b!831086 (= e!463412 e!463413)))

(declare-fun res!565783 () Bool)

(assert (=> b!831086 (=> res!565783 e!463413)))

(assert (=> b!831086 (= res!565783 (= (h!17069 (t!22300 (toList!4502 lt!376538))) lt!376417))))

(declare-fun b!831087 () Bool)

(assert (=> b!831087 (= e!463413 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376538))) lt!376417))))

(assert (= (and d!105805 res!565782) b!831086))

(assert (= (and b!831086 (not res!565783)) b!831087))

(assert (=> d!105805 m!774239))

(declare-fun m!774339 () Bool)

(assert (=> d!105805 m!774339))

(declare-fun m!774341 () Bool)

(assert (=> b!831087 m!774341))

(assert (=> b!830308 d!105805))

(declare-fun d!105807 () Bool)

(assert (=> d!105807 (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(declare-fun lt!377048 () Unit!28383)

(assert (=> d!105807 (= lt!377048 (choose!1430 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(declare-fun e!463414 () Bool)

(assert (=> d!105807 e!463414))

(declare-fun res!565784 () Bool)

(assert (=> d!105807 (=> (not res!565784) (not e!463414))))

(assert (=> d!105807 (= res!565784 (isStrictlySorted!437 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (=> d!105807 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601) lt!377048)))

(declare-fun b!831088 () Bool)

(assert (=> b!831088 (= e!463414 (containsKey!399 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))

(assert (= (and d!105807 res!565784) b!831088))

(assert (=> d!105807 m!773073))

(assert (=> d!105807 m!773073))

(assert (=> d!105807 m!773075))

(declare-fun m!774343 () Bool)

(assert (=> d!105807 m!774343))

(declare-fun m!774345 () Bool)

(assert (=> d!105807 m!774345))

(assert (=> b!831088 m!773069))

(assert (=> b!830350 d!105807))

(declare-fun d!105809 () Bool)

(assert (=> d!105809 (= (isDefined!310 (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601))))))

(declare-fun bs!23211 () Bool)

(assert (= bs!23211 d!105809))

(assert (=> bs!23211 m!773073))

(declare-fun m!774347 () Bool)

(assert (=> bs!23211 m!774347))

(assert (=> b!830350 d!105809))

(declare-fun e!463415 () Option!419)

(declare-fun b!831089 () Bool)

(assert (=> b!831089 (= e!463415 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))))))))

(declare-fun b!831090 () Bool)

(declare-fun e!463416 () Option!419)

(assert (=> b!831090 (= e!463415 e!463416)))

(declare-fun c!90127 () Bool)

(assert (=> b!831090 (= c!90127 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) lt!376601))))))

(declare-fun b!831092 () Bool)

(assert (=> b!831092 (= e!463416 None!417)))

(declare-fun b!831091 () Bool)

(assert (=> b!831091 (= e!463416 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) lt!376601))))

(declare-fun d!105811 () Bool)

(declare-fun c!90126 () Bool)

(assert (=> d!105811 (= c!90126 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) lt!376601)))))

(assert (=> d!105811 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601) e!463415)))

(assert (= (and d!105811 c!90126) b!831089))

(assert (= (and d!105811 (not c!90126)) b!831090))

(assert (= (and b!831090 c!90127) b!831091))

(assert (= (and b!831090 (not c!90127)) b!831092))

(declare-fun m!774349 () Bool)

(assert (=> b!831091 m!774349))

(assert (=> b!830350 d!105811))

(declare-fun d!105813 () Bool)

(assert (=> d!105813 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377049 () Unit!28383)

(assert (=> d!105813 (= lt!377049 (choose!1430 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463417 () Bool)

(assert (=> d!105813 e!463417))

(declare-fun res!565785 () Bool)

(assert (=> d!105813 (=> (not res!565785) (not e!463417))))

(assert (=> d!105813 (= res!565785 (isStrictlySorted!437 (toList!4502 lt!376602)))))

(assert (=> d!105813 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) lt!377049)))

(declare-fun b!831093 () Bool)

(assert (=> b!831093 (= e!463417 (containsKey!399 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105813 res!565785) b!831093))

(assert (=> d!105813 m!772595))

(assert (=> d!105813 m!772879))

(assert (=> d!105813 m!772879))

(assert (=> d!105813 m!772903))

(assert (=> d!105813 m!772595))

(declare-fun m!774351 () Bool)

(assert (=> d!105813 m!774351))

(assert (=> d!105813 m!774101))

(assert (=> b!831093 m!772595))

(assert (=> b!831093 m!772899))

(assert (=> b!830267 d!105813))

(declare-fun d!105815 () Bool)

(assert (=> d!105815 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23212 () Bool)

(assert (= bs!23212 d!105815))

(assert (=> bs!23212 m!772879))

(declare-fun m!774353 () Bool)

(assert (=> bs!23212 m!774353))

(assert (=> b!830267 d!105815))

(declare-fun b!831094 () Bool)

(declare-fun e!463418 () Option!419)

(assert (=> b!831094 (= e!463418 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376602)))))))

(declare-fun b!831095 () Bool)

(declare-fun e!463419 () Option!419)

(assert (=> b!831095 (= e!463418 e!463419)))

(declare-fun c!90129 () Bool)

(assert (=> b!831095 (= c!90129 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376602))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!831097 () Bool)

(assert (=> b!831097 (= e!463419 None!417)))

(declare-fun b!831096 () Bool)

(assert (=> b!831096 (= e!463419 (getValueByKey!413 (t!22300 (toList!4502 lt!376602)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105817 () Bool)

(declare-fun c!90128 () Bool)

(assert (=> d!105817 (= c!90128 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105817 (= (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463418)))

(assert (= (and d!105817 c!90128) b!831094))

(assert (= (and d!105817 (not c!90128)) b!831095))

(assert (= (and b!831095 c!90129) b!831096))

(assert (= (and b!831095 (not c!90129)) b!831097))

(assert (=> b!831096 m!772595))

(declare-fun m!774355 () Bool)

(assert (=> b!831096 m!774355))

(assert (=> b!830267 d!105817))

(declare-fun d!105819 () Bool)

(declare-fun res!565786 () Bool)

(declare-fun e!463420 () Bool)

(assert (=> d!105819 (=> res!565786 e!463420)))

(assert (=> d!105819 (= res!565786 (and ((_ is Cons!15940) lt!376544) (= (_1!5091 (h!17069 lt!376544)) (_1!5091 lt!376416))))))

(assert (=> d!105819 (= (containsKey!399 lt!376544 (_1!5091 lt!376416)) e!463420)))

(declare-fun b!831098 () Bool)

(declare-fun e!463421 () Bool)

(assert (=> b!831098 (= e!463420 e!463421)))

(declare-fun res!565787 () Bool)

(assert (=> b!831098 (=> (not res!565787) (not e!463421))))

(assert (=> b!831098 (= res!565787 (and (or (not ((_ is Cons!15940) lt!376544)) (bvsle (_1!5091 (h!17069 lt!376544)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376544) (bvslt (_1!5091 (h!17069 lt!376544)) (_1!5091 lt!376416))))))

(declare-fun b!831099 () Bool)

(assert (=> b!831099 (= e!463421 (containsKey!399 (t!22300 lt!376544) (_1!5091 lt!376416)))))

(assert (= (and d!105819 (not res!565786)) b!831098))

(assert (= (and b!831098 res!565787) b!831099))

(declare-fun m!774357 () Bool)

(assert (=> b!831099 m!774357))

(assert (=> b!830510 d!105819))

(declare-fun d!105821 () Bool)

(declare-fun lt!377050 () Bool)

(assert (=> d!105821 (= lt!377050 (select (content!385 lt!376605) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463422 () Bool)

(assert (=> d!105821 (= lt!377050 e!463422)))

(declare-fun res!565788 () Bool)

(assert (=> d!105821 (=> (not res!565788) (not e!463422))))

(assert (=> d!105821 (= res!565788 ((_ is Cons!15940) lt!376605))))

(assert (=> d!105821 (= (contains!4188 lt!376605 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!377050)))

(declare-fun b!831100 () Bool)

(declare-fun e!463423 () Bool)

(assert (=> b!831100 (= e!463422 e!463423)))

(declare-fun res!565789 () Bool)

(assert (=> b!831100 (=> res!565789 e!463423)))

(assert (=> b!831100 (= res!565789 (= (h!17069 lt!376605) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!831101 () Bool)

(assert (=> b!831101 (= e!463423 (contains!4188 (t!22300 lt!376605) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!105821 res!565788) b!831100))

(assert (= (and b!831100 (not res!565789)) b!831101))

(declare-fun m!774359 () Bool)

(assert (=> d!105821 m!774359))

(declare-fun m!774361 () Bool)

(assert (=> d!105821 m!774361))

(declare-fun m!774363 () Bool)

(assert (=> b!831101 m!774363))

(assert (=> b!830292 d!105821))

(declare-fun b!831102 () Bool)

(declare-fun e!463424 () Option!419)

(assert (=> b!831102 (= e!463424 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376720)))))))

(declare-fun b!831103 () Bool)

(declare-fun e!463425 () Option!419)

(assert (=> b!831103 (= e!463424 e!463425)))

(declare-fun c!90131 () Bool)

(assert (=> b!831103 (= c!90131 (and ((_ is Cons!15940) (toList!4502 lt!376720)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376720))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831105 () Bool)

(assert (=> b!831105 (= e!463425 None!417)))

(declare-fun b!831104 () Bool)

(assert (=> b!831104 (= e!463425 (getValueByKey!413 (t!22300 (toList!4502 lt!376720)) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90130 () Bool)

(declare-fun d!105823 () Bool)

(assert (=> d!105823 (= c!90130 (and ((_ is Cons!15940) (toList!4502 lt!376720)) (= (_1!5091 (h!17069 (toList!4502 lt!376720))) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105823 (= (getValueByKey!413 (toList!4502 lt!376720) (_1!5091 (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463424)))

(assert (= (and d!105823 c!90130) b!831102))

(assert (= (and d!105823 (not c!90130)) b!831103))

(assert (= (and b!831103 c!90131) b!831104))

(assert (= (and b!831103 (not c!90131)) b!831105))

(declare-fun m!774365 () Bool)

(assert (=> b!831104 m!774365))

(assert (=> b!830353 d!105823))

(assert (=> b!830233 d!105657))

(assert (=> b!830233 d!105257))

(declare-fun lt!377051 () Bool)

(declare-fun d!105825 () Bool)

(assert (=> d!105825 (= lt!377051 (select (content!385 (toList!4502 lt!376823)) (tuple2!10161 lt!376566 minValue!754)))))

(declare-fun e!463426 () Bool)

(assert (=> d!105825 (= lt!377051 e!463426)))

(declare-fun res!565790 () Bool)

(assert (=> d!105825 (=> (not res!565790) (not e!463426))))

(assert (=> d!105825 (= res!565790 ((_ is Cons!15940) (toList!4502 lt!376823)))))

(assert (=> d!105825 (= (contains!4188 (toList!4502 lt!376823) (tuple2!10161 lt!376566 minValue!754)) lt!377051)))

(declare-fun b!831106 () Bool)

(declare-fun e!463427 () Bool)

(assert (=> b!831106 (= e!463426 e!463427)))

(declare-fun res!565791 () Bool)

(assert (=> b!831106 (=> res!565791 e!463427)))

(assert (=> b!831106 (= res!565791 (= (h!17069 (toList!4502 lt!376823)) (tuple2!10161 lt!376566 minValue!754)))))

(declare-fun b!831107 () Bool)

(assert (=> b!831107 (= e!463427 (contains!4188 (t!22300 (toList!4502 lt!376823)) (tuple2!10161 lt!376566 minValue!754)))))

(assert (= (and d!105825 res!565790) b!831106))

(assert (= (and b!831106 (not res!565791)) b!831107))

(declare-fun m!774367 () Bool)

(assert (=> d!105825 m!774367))

(declare-fun m!774369 () Bool)

(assert (=> d!105825 m!774369))

(declare-fun m!774371 () Bool)

(assert (=> b!831107 m!774371))

(assert (=> b!830458 d!105825))

(declare-fun d!105827 () Bool)

(declare-fun res!565792 () Bool)

(declare-fun e!463428 () Bool)

(assert (=> d!105827 (=> res!565792 e!463428)))

(assert (=> d!105827 (= res!565792 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105827 (= (containsKey!399 (toList!4502 lt!376602) #b0000000000000000000000000000000000000000000000000000000000000000) e!463428)))

(declare-fun b!831108 () Bool)

(declare-fun e!463429 () Bool)

(assert (=> b!831108 (= e!463428 e!463429)))

(declare-fun res!565793 () Bool)

(assert (=> b!831108 (=> (not res!565793) (not e!463429))))

(assert (=> b!831108 (= res!565793 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376602))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376602))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376602)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376602))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831109 () Bool)

(assert (=> b!831109 (= e!463429 (containsKey!399 (t!22300 (toList!4502 lt!376602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105827 (not res!565792)) b!831108))

(assert (= (and b!831108 res!565793) b!831109))

(declare-fun m!774373 () Bool)

(assert (=> b!831109 m!774373))

(assert (=> d!105311 d!105827))

(declare-fun lt!377052 () Bool)

(declare-fun d!105829 () Bool)

(assert (=> d!105829 (= lt!377052 (select (content!385 (toList!4502 lt!376810)) (tuple2!10161 lt!376570 zeroValueBefore!34)))))

(declare-fun e!463430 () Bool)

(assert (=> d!105829 (= lt!377052 e!463430)))

(declare-fun res!565794 () Bool)

(assert (=> d!105829 (=> (not res!565794) (not e!463430))))

(assert (=> d!105829 (= res!565794 ((_ is Cons!15940) (toList!4502 lt!376810)))))

(assert (=> d!105829 (= (contains!4188 (toList!4502 lt!376810) (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!377052)))

(declare-fun b!831110 () Bool)

(declare-fun e!463431 () Bool)

(assert (=> b!831110 (= e!463430 e!463431)))

(declare-fun res!565795 () Bool)

(assert (=> b!831110 (=> res!565795 e!463431)))

(assert (=> b!831110 (= res!565795 (= (h!17069 (toList!4502 lt!376810)) (tuple2!10161 lt!376570 zeroValueBefore!34)))))

(declare-fun b!831111 () Bool)

(assert (=> b!831111 (= e!463431 (contains!4188 (t!22300 (toList!4502 lt!376810)) (tuple2!10161 lt!376570 zeroValueBefore!34)))))

(assert (= (and d!105829 res!565794) b!831110))

(assert (= (and b!831110 (not res!565795)) b!831111))

(declare-fun m!774375 () Bool)

(assert (=> d!105829 m!774375))

(declare-fun m!774377 () Bool)

(assert (=> d!105829 m!774377))

(declare-fun m!774379 () Bool)

(assert (=> b!831111 m!774379))

(assert (=> b!830450 d!105829))

(declare-fun d!105831 () Bool)

(assert (=> d!105831 (= ($colon$colon!535 e!462994 (ite c!89916 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416))) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))) (Cons!15940 (ite c!89916 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376416))) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) e!462994))))

(assert (=> bm!36252 d!105831))

(declare-fun d!105833 () Bool)

(declare-fun lt!377053 () Bool)

(assert (=> d!105833 (= lt!377053 (select (content!385 (t!22300 (toList!4502 lt!376611))) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463432 () Bool)

(assert (=> d!105833 (= lt!377053 e!463432)))

(declare-fun res!565796 () Bool)

(assert (=> d!105833 (=> (not res!565796) (not e!463432))))

(assert (=> d!105833 (= res!565796 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376611))))))

(assert (=> d!105833 (= (contains!4188 (t!22300 (toList!4502 lt!376611)) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377053)))

(declare-fun b!831112 () Bool)

(declare-fun e!463433 () Bool)

(assert (=> b!831112 (= e!463432 e!463433)))

(declare-fun res!565797 () Bool)

(assert (=> b!831112 (=> res!565797 e!463433)))

(assert (=> b!831112 (= res!565797 (= (h!17069 (t!22300 (toList!4502 lt!376611))) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!831113 () Bool)

(assert (=> b!831113 (= e!463433 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376611))) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105833 res!565796) b!831112))

(assert (= (and b!831112 (not res!565797)) b!831113))

(declare-fun m!774381 () Bool)

(assert (=> d!105833 m!774381))

(declare-fun m!774383 () Bool)

(assert (=> d!105833 m!774383))

(declare-fun m!774385 () Bool)

(assert (=> b!831113 m!774385))

(assert (=> b!830529 d!105833))

(assert (=> d!105327 d!105343))

(assert (=> d!105327 d!105337))

(declare-fun d!105835 () Bool)

(assert (=> d!105835 (contains!4187 (+!2010 lt!376556 (tuple2!10161 lt!376570 zeroValueBefore!34)) lt!376571)))

(assert (=> d!105835 true))

(declare-fun _$35!424 () Unit!28383)

(assert (=> d!105835 (= (choose!1428 lt!376556 lt!376570 zeroValueBefore!34 lt!376571) _$35!424)))

(declare-fun bs!23213 () Bool)

(assert (= bs!23213 d!105835))

(assert (=> bs!23213 m!772703))

(assert (=> bs!23213 m!772703))

(assert (=> bs!23213 m!772705))

(assert (=> d!105327 d!105835))

(declare-fun d!105837 () Bool)

(declare-fun e!463434 () Bool)

(assert (=> d!105837 e!463434))

(declare-fun res!565798 () Bool)

(assert (=> d!105837 (=> res!565798 e!463434)))

(declare-fun lt!377057 () Bool)

(assert (=> d!105837 (= res!565798 (not lt!377057))))

(declare-fun lt!377056 () Bool)

(assert (=> d!105837 (= lt!377057 lt!377056)))

(declare-fun lt!377055 () Unit!28383)

(declare-fun e!463435 () Unit!28383)

(assert (=> d!105837 (= lt!377055 e!463435)))

(declare-fun c!90132 () Bool)

(assert (=> d!105837 (= c!90132 lt!377056)))

(assert (=> d!105837 (= lt!377056 (containsKey!399 (toList!4502 lt!376556) lt!376571))))

(assert (=> d!105837 (= (contains!4187 lt!376556 lt!376571) lt!377057)))

(declare-fun b!831115 () Bool)

(declare-fun lt!377054 () Unit!28383)

(assert (=> b!831115 (= e!463435 lt!377054)))

(assert (=> b!831115 (= lt!377054 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376556) lt!376571))))

(assert (=> b!831115 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376556) lt!376571))))

(declare-fun b!831116 () Bool)

(declare-fun Unit!28435 () Unit!28383)

(assert (=> b!831116 (= e!463435 Unit!28435)))

(declare-fun b!831117 () Bool)

(assert (=> b!831117 (= e!463434 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376556) lt!376571)))))

(assert (= (and d!105837 c!90132) b!831115))

(assert (= (and d!105837 (not c!90132)) b!831116))

(assert (= (and d!105837 (not res!565798)) b!831117))

(declare-fun m!774387 () Bool)

(assert (=> d!105837 m!774387))

(declare-fun m!774389 () Bool)

(assert (=> b!831115 m!774389))

(declare-fun m!774391 () Bool)

(assert (=> b!831115 m!774391))

(assert (=> b!831115 m!774391))

(declare-fun m!774393 () Bool)

(assert (=> b!831115 m!774393))

(assert (=> b!831117 m!774391))

(assert (=> b!831117 m!774391))

(assert (=> b!831117 m!774393))

(assert (=> d!105327 d!105837))

(declare-fun b!831118 () Bool)

(declare-fun e!463436 () Option!419)

(assert (=> b!831118 (= e!463436 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376683)))))))

(declare-fun b!831119 () Bool)

(declare-fun e!463437 () Option!419)

(assert (=> b!831119 (= e!463436 e!463437)))

(declare-fun c!90134 () Bool)

(assert (=> b!831119 (= c!90134 (and ((_ is Cons!15940) (toList!4502 lt!376683)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376683))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!831121 () Bool)

(assert (=> b!831121 (= e!463437 None!417)))

(declare-fun b!831120 () Bool)

(assert (=> b!831120 (= e!463437 (getValueByKey!413 (t!22300 (toList!4502 lt!376683)) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!105839 () Bool)

(declare-fun c!90133 () Bool)

(assert (=> d!105839 (= c!90133 (and ((_ is Cons!15940) (toList!4502 lt!376683)) (= (_1!5091 (h!17069 (toList!4502 lt!376683))) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!105839 (= (getValueByKey!413 (toList!4502 lt!376683) (_1!5091 (ite (or c!89810 c!89811) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!463436)))

(assert (= (and d!105839 c!90133) b!831118))

(assert (= (and d!105839 (not c!90133)) b!831119))

(assert (= (and b!831119 c!90134) b!831120))

(assert (= (and b!831119 (not c!90134)) b!831121))

(declare-fun m!774395 () Bool)

(assert (=> b!831120 m!774395))

(assert (=> b!830309 d!105839))

(declare-fun d!105841 () Bool)

(declare-fun e!463438 () Bool)

(assert (=> d!105841 e!463438))

(declare-fun res!565799 () Bool)

(assert (=> d!105841 (=> res!565799 e!463438)))

(declare-fun lt!377061 () Bool)

(assert (=> d!105841 (= res!565799 (not lt!377061))))

(declare-fun lt!377060 () Bool)

(assert (=> d!105841 (= lt!377061 lt!377060)))

(declare-fun lt!377059 () Unit!28383)

(declare-fun e!463439 () Unit!28383)

(assert (=> d!105841 (= lt!377059 e!463439)))

(declare-fun c!90135 () Bool)

(assert (=> d!105841 (= c!90135 lt!377060)))

(assert (=> d!105841 (= lt!377060 (containsKey!399 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(assert (=> d!105841 (= (contains!4187 lt!376810 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!377061)))

(declare-fun b!831122 () Bool)

(declare-fun lt!377058 () Unit!28383)

(assert (=> b!831122 (= e!463439 lt!377058)))

(assert (=> b!831122 (= lt!377058 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(assert (=> b!831122 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun b!831123 () Bool)

(declare-fun Unit!28436 () Unit!28383)

(assert (=> b!831123 (= e!463439 Unit!28436)))

(declare-fun b!831124 () Bool)

(assert (=> b!831124 (= e!463438 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (= (and d!105841 c!90135) b!831122))

(assert (= (and d!105841 (not c!90135)) b!831123))

(assert (= (and d!105841 (not res!565799)) b!831124))

(declare-fun m!774397 () Bool)

(assert (=> d!105841 m!774397))

(declare-fun m!774399 () Bool)

(assert (=> b!831122 m!774399))

(assert (=> b!831122 m!773373))

(assert (=> b!831122 m!773373))

(declare-fun m!774401 () Bool)

(assert (=> b!831122 m!774401))

(assert (=> b!831124 m!773373))

(assert (=> b!831124 m!773373))

(assert (=> b!831124 m!774401))

(assert (=> d!105337 d!105841))

(declare-fun b!831125 () Bool)

(declare-fun e!463440 () Option!419)

(assert (=> b!831125 (= e!463440 (Some!418 (_2!5091 (h!17069 lt!376808))))))

(declare-fun b!831126 () Bool)

(declare-fun e!463441 () Option!419)

(assert (=> b!831126 (= e!463440 e!463441)))

(declare-fun c!90137 () Bool)

(assert (=> b!831126 (= c!90137 (and ((_ is Cons!15940) lt!376808) (not (= (_1!5091 (h!17069 lt!376808)) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))))

(declare-fun b!831128 () Bool)

(assert (=> b!831128 (= e!463441 None!417)))

(declare-fun b!831127 () Bool)

(assert (=> b!831127 (= e!463441 (getValueByKey!413 (t!22300 lt!376808) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun c!90136 () Bool)

(declare-fun d!105843 () Bool)

(assert (=> d!105843 (= c!90136 (and ((_ is Cons!15940) lt!376808) (= (_1!5091 (h!17069 lt!376808)) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (=> d!105843 (= (getValueByKey!413 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) e!463440)))

(assert (= (and d!105843 c!90136) b!831125))

(assert (= (and d!105843 (not c!90136)) b!831126))

(assert (= (and b!831126 c!90137) b!831127))

(assert (= (and b!831126 (not c!90137)) b!831128))

(declare-fun m!774403 () Bool)

(assert (=> b!831127 m!774403))

(assert (=> d!105337 d!105843))

(declare-fun d!105845 () Bool)

(assert (=> d!105845 (= (getValueByKey!413 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun lt!377062 () Unit!28383)

(assert (=> d!105845 (= lt!377062 (choose!1426 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun e!463442 () Bool)

(assert (=> d!105845 e!463442))

(declare-fun res!565800 () Bool)

(assert (=> d!105845 (=> (not res!565800) (not e!463442))))

(assert (=> d!105845 (= res!565800 (isStrictlySorted!437 lt!376808))))

(assert (=> d!105845 (= (lemmaContainsTupThenGetReturnValue!230 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!377062)))

(declare-fun b!831129 () Bool)

(declare-fun res!565801 () Bool)

(assert (=> b!831129 (=> (not res!565801) (not e!463442))))

(assert (=> b!831129 (= res!565801 (containsKey!399 lt!376808 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun b!831130 () Bool)

(assert (=> b!831130 (= e!463442 (contains!4188 lt!376808 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (= (and d!105845 res!565800) b!831129))

(assert (= (and b!831129 res!565801) b!831130))

(assert (=> d!105845 m!773367))

(declare-fun m!774405 () Bool)

(assert (=> d!105845 m!774405))

(declare-fun m!774407 () Bool)

(assert (=> d!105845 m!774407))

(declare-fun m!774409 () Bool)

(assert (=> b!831129 m!774409))

(declare-fun m!774411 () Bool)

(assert (=> b!831130 m!774411))

(assert (=> d!105337 d!105845))

(declare-fun b!831131 () Bool)

(declare-fun res!565802 () Bool)

(declare-fun e!463444 () Bool)

(assert (=> b!831131 (=> (not res!565802) (not e!463444))))

(declare-fun lt!377063 () List!15944)

(assert (=> b!831131 (= res!565802 (containsKey!399 lt!377063 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun c!90140 () Bool)

(declare-fun e!463446 () List!15944)

(declare-fun b!831132 () Bool)

(declare-fun c!90138 () Bool)

(assert (=> b!831132 (= e!463446 (ite c!90140 (t!22300 (toList!4502 lt!376556)) (ite c!90138 (Cons!15940 (h!17069 (toList!4502 lt!376556)) (t!22300 (toList!4502 lt!376556))) Nil!15941)))))

(declare-fun b!831133 () Bool)

(assert (=> b!831133 (= c!90138 (and ((_ is Cons!15940) (toList!4502 lt!376556)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376556))) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(declare-fun e!463443 () List!15944)

(declare-fun e!463445 () List!15944)

(assert (=> b!831133 (= e!463443 e!463445)))

(declare-fun b!831134 () Bool)

(assert (=> b!831134 (= e!463446 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376556)) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun b!831135 () Bool)

(declare-fun e!463447 () List!15944)

(declare-fun call!36297 () List!15944)

(assert (=> b!831135 (= e!463447 call!36297)))

(declare-fun b!831136 () Bool)

(declare-fun call!36299 () List!15944)

(assert (=> b!831136 (= e!463443 call!36299)))

(declare-fun b!831137 () Bool)

(declare-fun call!36298 () List!15944)

(assert (=> b!831137 (= e!463445 call!36298)))

(declare-fun bm!36294 () Bool)

(assert (=> bm!36294 (= call!36298 call!36299)))

(declare-fun b!831138 () Bool)

(assert (=> b!831138 (= e!463444 (contains!4188 lt!377063 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(declare-fun d!105847 () Bool)

(assert (=> d!105847 e!463444))

(declare-fun res!565803 () Bool)

(assert (=> d!105847 (=> (not res!565803) (not e!463444))))

(assert (=> d!105847 (= res!565803 (isStrictlySorted!437 lt!377063))))

(assert (=> d!105847 (= lt!377063 e!463447)))

(declare-fun c!90141 () Bool)

(assert (=> d!105847 (= c!90141 (and ((_ is Cons!15940) (toList!4502 lt!376556)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376556))) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (=> d!105847 (isStrictlySorted!437 (toList!4502 lt!376556))))

(assert (=> d!105847 (= (insertStrictlySorted!269 (toList!4502 lt!376556) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) lt!377063)))

(declare-fun bm!36295 () Bool)

(assert (=> bm!36295 (= call!36299 call!36297)))

(declare-fun bm!36296 () Bool)

(assert (=> bm!36296 (= call!36297 ($colon$colon!535 e!463446 (ite c!90141 (h!17069 (toList!4502 lt!376556)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))))

(declare-fun c!90139 () Bool)

(assert (=> bm!36296 (= c!90139 c!90141)))

(declare-fun b!831139 () Bool)

(assert (=> b!831139 (= e!463447 e!463443)))

(assert (=> b!831139 (= c!90140 (and ((_ is Cons!15940) (toList!4502 lt!376556)) (= (_1!5091 (h!17069 (toList!4502 lt!376556))) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(declare-fun b!831140 () Bool)

(assert (=> b!831140 (= e!463445 call!36298)))

(assert (= (and d!105847 c!90141) b!831135))

(assert (= (and d!105847 (not c!90141)) b!831139))

(assert (= (and b!831139 c!90140) b!831136))

(assert (= (and b!831139 (not c!90140)) b!831133))

(assert (= (and b!831133 c!90138) b!831140))

(assert (= (and b!831133 (not c!90138)) b!831137))

(assert (= (or b!831140 b!831137) bm!36294))

(assert (= (or b!831136 bm!36294) bm!36295))

(assert (= (or b!831135 bm!36295) bm!36296))

(assert (= (and bm!36296 c!90139) b!831134))

(assert (= (and bm!36296 (not c!90139)) b!831132))

(assert (= (and d!105847 res!565803) b!831131))

(assert (= (and b!831131 res!565802) b!831138))

(declare-fun m!774413 () Bool)

(assert (=> b!831131 m!774413))

(declare-fun m!774415 () Bool)

(assert (=> b!831138 m!774415))

(declare-fun m!774417 () Bool)

(assert (=> b!831134 m!774417))

(declare-fun m!774419 () Bool)

(assert (=> d!105847 m!774419))

(declare-fun m!774421 () Bool)

(assert (=> d!105847 m!774421))

(declare-fun m!774423 () Bool)

(assert (=> bm!36296 m!774423))

(assert (=> d!105337 d!105847))

(declare-fun d!105849 () Bool)

(declare-fun e!463448 () Bool)

(assert (=> d!105849 e!463448))

(declare-fun res!565804 () Bool)

(assert (=> d!105849 (=> res!565804 e!463448)))

(declare-fun lt!377067 () Bool)

(assert (=> d!105849 (= res!565804 (not lt!377067))))

(declare-fun lt!377066 () Bool)

(assert (=> d!105849 (= lt!377067 lt!377066)))

(declare-fun lt!377065 () Unit!28383)

(declare-fun e!463449 () Unit!28383)

(assert (=> d!105849 (= lt!377065 e!463449)))

(declare-fun c!90142 () Bool)

(assert (=> d!105849 (= c!90142 lt!377066)))

(assert (=> d!105849 (= lt!377066 (containsKey!399 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(assert (=> d!105849 (= (contains!4187 lt!376732 (_1!5091 (tuple2!10161 lt!376512 minValue!754))) lt!377067)))

(declare-fun b!831141 () Bool)

(declare-fun lt!377064 () Unit!28383)

(assert (=> b!831141 (= e!463449 lt!377064)))

(assert (=> b!831141 (= lt!377064 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(assert (=> b!831141 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun b!831142 () Bool)

(declare-fun Unit!28437 () Unit!28383)

(assert (=> b!831142 (= e!463449 Unit!28437)))

(declare-fun b!831143 () Bool)

(assert (=> b!831143 (= e!463448 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(assert (= (and d!105849 c!90142) b!831141))

(assert (= (and d!105849 (not c!90142)) b!831142))

(assert (= (and d!105849 (not res!565804)) b!831143))

(declare-fun m!774425 () Bool)

(assert (=> d!105849 m!774425))

(declare-fun m!774427 () Bool)

(assert (=> b!831141 m!774427))

(assert (=> b!831141 m!773121))

(assert (=> b!831141 m!773121))

(declare-fun m!774429 () Bool)

(assert (=> b!831141 m!774429))

(assert (=> b!831143 m!773121))

(assert (=> b!831143 m!773121))

(assert (=> b!831143 m!774429))

(assert (=> d!105261 d!105849))

(declare-fun b!831144 () Bool)

(declare-fun e!463450 () Option!419)

(assert (=> b!831144 (= e!463450 (Some!418 (_2!5091 (h!17069 lt!376730))))))

(declare-fun b!831145 () Bool)

(declare-fun e!463451 () Option!419)

(assert (=> b!831145 (= e!463450 e!463451)))

(declare-fun c!90144 () Bool)

(assert (=> b!831145 (= c!90144 (and ((_ is Cons!15940) lt!376730) (not (= (_1!5091 (h!17069 lt!376730)) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))))

(declare-fun b!831147 () Bool)

(assert (=> b!831147 (= e!463451 None!417)))

(declare-fun b!831146 () Bool)

(assert (=> b!831146 (= e!463451 (getValueByKey!413 (t!22300 lt!376730) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun d!105851 () Bool)

(declare-fun c!90143 () Bool)

(assert (=> d!105851 (= c!90143 (and ((_ is Cons!15940) lt!376730) (= (_1!5091 (h!17069 lt!376730)) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(assert (=> d!105851 (= (getValueByKey!413 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754))) e!463450)))

(assert (= (and d!105851 c!90143) b!831144))

(assert (= (and d!105851 (not c!90143)) b!831145))

(assert (= (and b!831145 c!90144) b!831146))

(assert (= (and b!831145 (not c!90144)) b!831147))

(declare-fun m!774431 () Bool)

(assert (=> b!831146 m!774431))

(assert (=> d!105261 d!105851))

(declare-fun d!105853 () Bool)

(assert (=> d!105853 (= (getValueByKey!413 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun lt!377068 () Unit!28383)

(assert (=> d!105853 (= lt!377068 (choose!1426 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun e!463452 () Bool)

(assert (=> d!105853 e!463452))

(declare-fun res!565805 () Bool)

(assert (=> d!105853 (=> (not res!565805) (not e!463452))))

(assert (=> d!105853 (= res!565805 (isStrictlySorted!437 lt!376730))))

(assert (=> d!105853 (= (lemmaContainsTupThenGetReturnValue!230 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))) lt!377068)))

(declare-fun b!831148 () Bool)

(declare-fun res!565806 () Bool)

(assert (=> b!831148 (=> (not res!565806) (not e!463452))))

(assert (=> b!831148 (= res!565806 (containsKey!399 lt!376730 (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun b!831149 () Bool)

(assert (=> b!831149 (= e!463452 (contains!4188 lt!376730 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(assert (= (and d!105853 res!565805) b!831148))

(assert (= (and b!831148 res!565806) b!831149))

(assert (=> d!105853 m!773115))

(declare-fun m!774433 () Bool)

(assert (=> d!105853 m!774433))

(declare-fun m!774435 () Bool)

(assert (=> d!105853 m!774435))

(declare-fun m!774437 () Bool)

(assert (=> b!831148 m!774437))

(declare-fun m!774439 () Bool)

(assert (=> b!831149 m!774439))

(assert (=> d!105261 d!105853))

(declare-fun b!831150 () Bool)

(declare-fun res!565807 () Bool)

(declare-fun e!463454 () Bool)

(assert (=> b!831150 (=> (not res!565807) (not e!463454))))

(declare-fun lt!377069 () List!15944)

(assert (=> b!831150 (= res!565807 (containsKey!399 lt!377069 (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun c!90147 () Bool)

(declare-fun b!831151 () Bool)

(declare-fun c!90145 () Bool)

(declare-fun e!463456 () List!15944)

(assert (=> b!831151 (= e!463456 (ite c!90147 (t!22300 (toList!4502 lt!376514)) (ite c!90145 (Cons!15940 (h!17069 (toList!4502 lt!376514)) (t!22300 (toList!4502 lt!376514))) Nil!15941)))))

(declare-fun b!831152 () Bool)

(assert (=> b!831152 (= c!90145 (and ((_ is Cons!15940) (toList!4502 lt!376514)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376514))) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(declare-fun e!463453 () List!15944)

(declare-fun e!463455 () List!15944)

(assert (=> b!831152 (= e!463453 e!463455)))

(declare-fun b!831153 () Bool)

(assert (=> b!831153 (= e!463456 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376514)) (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun b!831154 () Bool)

(declare-fun e!463457 () List!15944)

(declare-fun call!36300 () List!15944)

(assert (=> b!831154 (= e!463457 call!36300)))

(declare-fun b!831155 () Bool)

(declare-fun call!36302 () List!15944)

(assert (=> b!831155 (= e!463453 call!36302)))

(declare-fun b!831156 () Bool)

(declare-fun call!36301 () List!15944)

(assert (=> b!831156 (= e!463455 call!36301)))

(declare-fun bm!36297 () Bool)

(assert (=> bm!36297 (= call!36301 call!36302)))

(declare-fun b!831157 () Bool)

(assert (=> b!831157 (= e!463454 (contains!4188 lt!377069 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(declare-fun d!105855 () Bool)

(assert (=> d!105855 e!463454))

(declare-fun res!565808 () Bool)

(assert (=> d!105855 (=> (not res!565808) (not e!463454))))

(assert (=> d!105855 (= res!565808 (isStrictlySorted!437 lt!377069))))

(assert (=> d!105855 (= lt!377069 e!463457)))

(declare-fun c!90148 () Bool)

(assert (=> d!105855 (= c!90148 (and ((_ is Cons!15940) (toList!4502 lt!376514)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376514))) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(assert (=> d!105855 (isStrictlySorted!437 (toList!4502 lt!376514))))

(assert (=> d!105855 (= (insertStrictlySorted!269 (toList!4502 lt!376514) (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))) lt!377069)))

(declare-fun bm!36298 () Bool)

(assert (=> bm!36298 (= call!36302 call!36300)))

(declare-fun bm!36299 () Bool)

(assert (=> bm!36299 (= call!36300 ($colon$colon!535 e!463456 (ite c!90148 (h!17069 (toList!4502 lt!376514)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376512 minValue!754)) (_2!5091 (tuple2!10161 lt!376512 minValue!754))))))))

(declare-fun c!90146 () Bool)

(assert (=> bm!36299 (= c!90146 c!90148)))

(declare-fun b!831158 () Bool)

(assert (=> b!831158 (= e!463457 e!463453)))

(assert (=> b!831158 (= c!90147 (and ((_ is Cons!15940) (toList!4502 lt!376514)) (= (_1!5091 (h!17069 (toList!4502 lt!376514))) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(declare-fun b!831159 () Bool)

(assert (=> b!831159 (= e!463455 call!36301)))

(assert (= (and d!105855 c!90148) b!831154))

(assert (= (and d!105855 (not c!90148)) b!831158))

(assert (= (and b!831158 c!90147) b!831155))

(assert (= (and b!831158 (not c!90147)) b!831152))

(assert (= (and b!831152 c!90145) b!831159))

(assert (= (and b!831152 (not c!90145)) b!831156))

(assert (= (or b!831159 b!831156) bm!36297))

(assert (= (or b!831155 bm!36297) bm!36298))

(assert (= (or b!831154 bm!36298) bm!36299))

(assert (= (and bm!36299 c!90146) b!831153))

(assert (= (and bm!36299 (not c!90146)) b!831151))

(assert (= (and d!105855 res!565808) b!831150))

(assert (= (and b!831150 res!565807) b!831157))

(declare-fun m!774441 () Bool)

(assert (=> b!831150 m!774441))

(declare-fun m!774443 () Bool)

(assert (=> b!831157 m!774443))

(declare-fun m!774445 () Bool)

(assert (=> b!831153 m!774445))

(declare-fun m!774447 () Bool)

(assert (=> d!105855 m!774447))

(declare-fun m!774449 () Bool)

(assert (=> d!105855 m!774449))

(declare-fun m!774451 () Bool)

(assert (=> bm!36299 m!774451))

(assert (=> d!105261 d!105855))

(assert (=> b!830286 d!105673))

(assert (=> b!830286 d!105255))

(declare-fun d!105857 () Bool)

(assert (=> d!105857 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377070 () Unit!28383)

(assert (=> d!105857 (= lt!377070 (choose!1430 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463458 () Bool)

(assert (=> d!105857 e!463458))

(declare-fun res!565809 () Bool)

(assert (=> d!105857 (=> (not res!565809) (not e!463458))))

(assert (=> d!105857 (= res!565809 (isStrictlySorted!437 (toList!4502 lt!376563)))))

(assert (=> d!105857 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377070)))

(declare-fun b!831160 () Bool)

(assert (=> b!831160 (= e!463458 (containsKey!399 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105857 res!565809) b!831160))

(assert (=> d!105857 m!772869))

(assert (=> d!105857 m!772869))

(assert (=> d!105857 m!772871))

(declare-fun m!774453 () Bool)

(assert (=> d!105857 m!774453))

(assert (=> d!105857 m!773587))

(assert (=> b!831160 m!772865))

(assert (=> b!830250 d!105857))

(declare-fun d!105859 () Bool)

(assert (=> d!105859 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23214 () Bool)

(assert (= bs!23214 d!105859))

(assert (=> bs!23214 m!772869))

(declare-fun m!774455 () Bool)

(assert (=> bs!23214 m!774455))

(assert (=> b!830250 d!105859))

(assert (=> b!830250 d!105517))

(assert (=> d!105299 d!105297))

(declare-fun d!105861 () Bool)

(assert (=> d!105861 (= (getValueByKey!413 lt!376540 (_1!5091 lt!376417)) (Some!418 (_2!5091 lt!376417)))))

(assert (=> d!105861 true))

(declare-fun _$22!572 () Unit!28383)

(assert (=> d!105861 (= (choose!1426 lt!376540 (_1!5091 lt!376417) (_2!5091 lt!376417)) _$22!572)))

(declare-fun bs!23215 () Bool)

(assert (= bs!23215 d!105861))

(assert (=> bs!23215 m!772647))

(assert (=> d!105299 d!105861))

(declare-fun d!105863 () Bool)

(declare-fun res!565810 () Bool)

(declare-fun e!463459 () Bool)

(assert (=> d!105863 (=> res!565810 e!463459)))

(assert (=> d!105863 (= res!565810 (or ((_ is Nil!15941) lt!376540) ((_ is Nil!15941) (t!22300 lt!376540))))))

(assert (=> d!105863 (= (isStrictlySorted!437 lt!376540) e!463459)))

(declare-fun b!831161 () Bool)

(declare-fun e!463460 () Bool)

(assert (=> b!831161 (= e!463459 e!463460)))

(declare-fun res!565811 () Bool)

(assert (=> b!831161 (=> (not res!565811) (not e!463460))))

(assert (=> b!831161 (= res!565811 (bvslt (_1!5091 (h!17069 lt!376540)) (_1!5091 (h!17069 (t!22300 lt!376540)))))))

(declare-fun b!831162 () Bool)

(assert (=> b!831162 (= e!463460 (isStrictlySorted!437 (t!22300 lt!376540)))))

(assert (= (and d!105863 (not res!565810)) b!831161))

(assert (= (and b!831161 res!565811) b!831162))

(declare-fun m!774457 () Bool)

(assert (=> b!831162 m!774457))

(assert (=> d!105299 d!105863))

(assert (=> b!830456 d!105681))

(assert (=> b!830456 d!105683))

(declare-fun d!105865 () Bool)

(declare-fun res!565812 () Bool)

(declare-fun e!463461 () Bool)

(assert (=> d!105865 (=> res!565812 e!463461)))

(assert (=> d!105865 (= res!565812 (= (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!376619))))

(assert (=> d!105865 (= (arrayContainsKey!0 _keys!976 lt!376619 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!463461)))

(declare-fun b!831163 () Bool)

(declare-fun e!463462 () Bool)

(assert (=> b!831163 (= e!463461 e!463462)))

(declare-fun res!565813 () Bool)

(assert (=> b!831163 (=> (not res!565813) (not e!463462))))

(assert (=> b!831163 (= res!565813 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22735 _keys!976)))))

(declare-fun b!831164 () Bool)

(assert (=> b!831164 (= e!463462 (arrayContainsKey!0 _keys!976 lt!376619 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!105865 (not res!565812)) b!831163))

(assert (= (and b!831163 res!565813) b!831164))

(assert (=> d!105865 m!772925))

(declare-fun m!774459 () Bool)

(assert (=> b!831164 m!774459))

(assert (=> b!830323 d!105865))

(declare-fun d!105867 () Bool)

(assert (=> d!105867 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376560) lt!376553)) (v!10089 (getValueByKey!413 (toList!4502 lt!376560) lt!376553)))))

(assert (=> d!105333 d!105867))

(declare-fun b!831165 () Bool)

(declare-fun e!463463 () Option!419)

(assert (=> b!831165 (= e!463463 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376560)))))))

(declare-fun b!831166 () Bool)

(declare-fun e!463464 () Option!419)

(assert (=> b!831166 (= e!463463 e!463464)))

(declare-fun c!90150 () Bool)

(assert (=> b!831166 (= c!90150 (and ((_ is Cons!15940) (toList!4502 lt!376560)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376560))) lt!376553))))))

(declare-fun b!831168 () Bool)

(assert (=> b!831168 (= e!463464 None!417)))

(declare-fun b!831167 () Bool)

(assert (=> b!831167 (= e!463464 (getValueByKey!413 (t!22300 (toList!4502 lt!376560)) lt!376553))))

(declare-fun d!105869 () Bool)

(declare-fun c!90149 () Bool)

(assert (=> d!105869 (= c!90149 (and ((_ is Cons!15940) (toList!4502 lt!376560)) (= (_1!5091 (h!17069 (toList!4502 lt!376560))) lt!376553)))))

(assert (=> d!105869 (= (getValueByKey!413 (toList!4502 lt!376560) lt!376553) e!463463)))

(assert (= (and d!105869 c!90149) b!831165))

(assert (= (and d!105869 (not c!90149)) b!831166))

(assert (= (and b!831166 c!90150) b!831167))

(assert (= (and b!831166 (not c!90150)) b!831168))

(declare-fun m!774461 () Bool)

(assert (=> b!831167 m!774461))

(assert (=> d!105333 d!105869))

(declare-fun d!105871 () Bool)

(assert (=> d!105871 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376514) lt!376507)) (v!10089 (getValueByKey!413 (toList!4502 lt!376514) lt!376507)))))

(assert (=> d!105279 d!105871))

(declare-fun b!831169 () Bool)

(declare-fun e!463465 () Option!419)

(assert (=> b!831169 (= e!463465 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376514)))))))

(declare-fun b!831170 () Bool)

(declare-fun e!463466 () Option!419)

(assert (=> b!831170 (= e!463465 e!463466)))

(declare-fun c!90152 () Bool)

(assert (=> b!831170 (= c!90152 (and ((_ is Cons!15940) (toList!4502 lt!376514)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376514))) lt!376507))))))

(declare-fun b!831172 () Bool)

(assert (=> b!831172 (= e!463466 None!417)))

(declare-fun b!831171 () Bool)

(assert (=> b!831171 (= e!463466 (getValueByKey!413 (t!22300 (toList!4502 lt!376514)) lt!376507))))

(declare-fun d!105873 () Bool)

(declare-fun c!90151 () Bool)

(assert (=> d!105873 (= c!90151 (and ((_ is Cons!15940) (toList!4502 lt!376514)) (= (_1!5091 (h!17069 (toList!4502 lt!376514))) lt!376507)))))

(assert (=> d!105873 (= (getValueByKey!413 (toList!4502 lt!376514) lt!376507) e!463465)))

(assert (= (and d!105873 c!90151) b!831169))

(assert (= (and d!105873 (not c!90151)) b!831170))

(assert (= (and b!831170 c!90152) b!831171))

(assert (= (and b!831170 (not c!90152)) b!831172))

(declare-fun m!774463 () Bool)

(assert (=> b!831171 m!774463))

(assert (=> d!105279 d!105873))

(declare-fun d!105875 () Bool)

(declare-fun lt!377071 () Bool)

(assert (=> d!105875 (= lt!377071 (select (content!385 (toList!4502 lt!376773)) (tuple2!10161 lt!376593 lt!376591)))))

(declare-fun e!463467 () Bool)

(assert (=> d!105875 (= lt!377071 e!463467)))

(declare-fun res!565814 () Bool)

(assert (=> d!105875 (=> (not res!565814) (not e!463467))))

(assert (=> d!105875 (= res!565814 ((_ is Cons!15940) (toList!4502 lt!376773)))))

(assert (=> d!105875 (= (contains!4188 (toList!4502 lt!376773) (tuple2!10161 lt!376593 lt!376591)) lt!377071)))

(declare-fun b!831173 () Bool)

(declare-fun e!463468 () Bool)

(assert (=> b!831173 (= e!463467 e!463468)))

(declare-fun res!565815 () Bool)

(assert (=> b!831173 (=> res!565815 e!463468)))

(assert (=> b!831173 (= res!565815 (= (h!17069 (toList!4502 lt!376773)) (tuple2!10161 lt!376593 lt!376591)))))

(declare-fun b!831174 () Bool)

(assert (=> b!831174 (= e!463468 (contains!4188 (t!22300 (toList!4502 lt!376773)) (tuple2!10161 lt!376593 lt!376591)))))

(assert (= (and d!105875 res!565814) b!831173))

(assert (= (and b!831173 (not res!565815)) b!831174))

(declare-fun m!774465 () Bool)

(assert (=> d!105875 m!774465))

(declare-fun m!774467 () Bool)

(assert (=> d!105875 m!774467))

(declare-fun m!774469 () Bool)

(assert (=> b!831174 m!774469))

(assert (=> b!830424 d!105875))

(declare-fun d!105877 () Bool)

(assert (=> d!105877 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10089 (getValueByKey!413 (toList!4502 lt!376517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105207 d!105877))

(assert (=> d!105207 d!105419))

(declare-fun b!831175 () Bool)

(declare-fun res!565816 () Bool)

(declare-fun e!463470 () Bool)

(assert (=> b!831175 (=> (not res!565816) (not e!463470))))

(declare-fun lt!377072 () List!15944)

(assert (=> b!831175 (= res!565816 (containsKey!399 lt!377072 (_1!5091 lt!376416)))))

(declare-fun e!463472 () List!15944)

(declare-fun c!90155 () Bool)

(declare-fun c!90153 () Bool)

(declare-fun b!831176 () Bool)

(assert (=> b!831176 (= e!463472 (ite c!90155 (t!22300 (t!22300 (toList!4502 lt!376414))) (ite c!90153 (Cons!15940 (h!17069 (t!22300 (toList!4502 lt!376414))) (t!22300 (t!22300 (toList!4502 lt!376414)))) Nil!15941)))))

(declare-fun b!831177 () Bool)

(assert (=> b!831177 (= c!90153 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376416))))))

(declare-fun e!463469 () List!15944)

(declare-fun e!463471 () List!15944)

(assert (=> b!831177 (= e!463469 e!463471)))

(declare-fun b!831178 () Bool)

(assert (=> b!831178 (= e!463472 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 lt!376414))) (_1!5091 lt!376416) (_2!5091 lt!376416)))))

(declare-fun b!831179 () Bool)

(declare-fun e!463473 () List!15944)

(declare-fun call!36303 () List!15944)

(assert (=> b!831179 (= e!463473 call!36303)))

(declare-fun b!831180 () Bool)

(declare-fun call!36305 () List!15944)

(assert (=> b!831180 (= e!463469 call!36305)))

(declare-fun b!831181 () Bool)

(declare-fun call!36304 () List!15944)

(assert (=> b!831181 (= e!463471 call!36304)))

(declare-fun bm!36300 () Bool)

(assert (=> bm!36300 (= call!36304 call!36305)))

(declare-fun b!831182 () Bool)

(assert (=> b!831182 (= e!463470 (contains!4188 lt!377072 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun d!105879 () Bool)

(assert (=> d!105879 e!463470))

(declare-fun res!565817 () Bool)

(assert (=> d!105879 (=> (not res!565817) (not e!463470))))

(assert (=> d!105879 (= res!565817 (isStrictlySorted!437 lt!377072))))

(assert (=> d!105879 (= lt!377072 e!463473)))

(declare-fun c!90156 () Bool)

(assert (=> d!105879 (= c!90156 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376416))))))

(assert (=> d!105879 (isStrictlySorted!437 (t!22300 (toList!4502 lt!376414)))))

(assert (=> d!105879 (= (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376414)) (_1!5091 lt!376416) (_2!5091 lt!376416)) lt!377072)))

(declare-fun bm!36301 () Bool)

(assert (=> bm!36301 (= call!36305 call!36303)))

(declare-fun bm!36302 () Bool)

(assert (=> bm!36302 (= call!36303 ($colon$colon!535 e!463472 (ite c!90156 (h!17069 (t!22300 (toList!4502 lt!376414))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))))))

(declare-fun c!90154 () Bool)

(assert (=> bm!36302 (= c!90154 c!90156)))

(declare-fun b!831183 () Bool)

(assert (=> b!831183 (= e!463473 e!463469)))

(assert (=> b!831183 (= c!90155 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376416))))))

(declare-fun b!831184 () Bool)

(assert (=> b!831184 (= e!463471 call!36304)))

(assert (= (and d!105879 c!90156) b!831179))

(assert (= (and d!105879 (not c!90156)) b!831183))

(assert (= (and b!831183 c!90155) b!831180))

(assert (= (and b!831183 (not c!90155)) b!831177))

(assert (= (and b!831177 c!90153) b!831184))

(assert (= (and b!831177 (not c!90153)) b!831181))

(assert (= (or b!831184 b!831181) bm!36300))

(assert (= (or b!831180 bm!36300) bm!36301))

(assert (= (or b!831179 bm!36301) bm!36302))

(assert (= (and bm!36302 c!90154) b!831178))

(assert (= (and bm!36302 (not c!90154)) b!831176))

(assert (= (and d!105879 res!565817) b!831175))

(assert (= (and b!831175 res!565816) b!831182))

(declare-fun m!774471 () Bool)

(assert (=> b!831175 m!774471))

(declare-fun m!774473 () Bool)

(assert (=> b!831182 m!774473))

(declare-fun m!774475 () Bool)

(assert (=> b!831178 m!774475))

(declare-fun m!774477 () Bool)

(assert (=> d!105879 m!774477))

(assert (=> d!105879 m!773747))

(declare-fun m!774479 () Bool)

(assert (=> bm!36302 m!774479))

(assert (=> b!830493 d!105879))

(assert (=> bm!36244 d!105651))

(declare-fun d!105881 () Bool)

(declare-fun res!565818 () Bool)

(declare-fun e!463474 () Bool)

(assert (=> d!105881 (=> res!565818 e!463474)))

(assert (=> d!105881 (= res!565818 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) lt!376601)))))

(assert (=> d!105881 (= (containsKey!399 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))) lt!376601) e!463474)))

(declare-fun b!831185 () Bool)

(declare-fun e!463475 () Bool)

(assert (=> b!831185 (= e!463474 e!463475)))

(declare-fun res!565819 () Bool)

(assert (=> b!831185 (=> (not res!565819) (not e!463475))))

(assert (=> b!831185 (= res!565819 (and (or (not ((_ is Cons!15940) (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) (bvsle (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) lt!376601)) ((_ is Cons!15940) (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598))))) lt!376601)))))

(declare-fun b!831186 () Bool)

(assert (=> b!831186 (= e!463475 (containsKey!399 (t!22300 (toList!4502 (+!2010 lt!376599 (tuple2!10161 lt!376600 lt!376598)))) lt!376601))))

(assert (= (and d!105881 (not res!565818)) b!831185))

(assert (= (and b!831185 res!565819) b!831186))

(declare-fun m!774481 () Bool)

(assert (=> b!831186 m!774481))

(assert (=> d!105245 d!105881))

(declare-fun d!105883 () Bool)

(declare-fun res!565820 () Bool)

(declare-fun e!463476 () Bool)

(assert (=> d!105883 (=> res!565820 e!463476)))

(assert (=> d!105883 (= res!565820 (and ((_ is Cons!15940) (toList!4502 lt!376602)) (= (_1!5091 (h!17069 (toList!4502 lt!376602))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105883 (= (containsKey!399 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463476)))

(declare-fun b!831187 () Bool)

(declare-fun e!463477 () Bool)

(assert (=> b!831187 (= e!463476 e!463477)))

(declare-fun res!565821 () Bool)

(assert (=> b!831187 (=> (not res!565821) (not e!463477))))

(assert (=> b!831187 (= res!565821 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376602))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376602))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15940) (toList!4502 lt!376602)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376602))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831188 () Bool)

(assert (=> b!831188 (= e!463477 (containsKey!399 (t!22300 (toList!4502 lt!376602)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105883 (not res!565820)) b!831187))

(assert (= (and b!831187 res!565821) b!831188))

(assert (=> b!831188 m!772595))

(declare-fun m!774483 () Bool)

(assert (=> b!831188 m!774483))

(assert (=> d!105203 d!105883))

(declare-fun b!831189 () Bool)

(declare-fun res!565822 () Bool)

(declare-fun e!463479 () Bool)

(assert (=> b!831189 (=> (not res!565822) (not e!463479))))

(declare-fun lt!377073 () List!15944)

(assert (=> b!831189 (= res!565822 (containsKey!399 lt!377073 (_1!5091 lt!376417)))))

(declare-fun c!90157 () Bool)

(declare-fun b!831190 () Bool)

(declare-fun c!90159 () Bool)

(declare-fun e!463481 () List!15944)

(assert (=> b!831190 (= e!463481 (ite c!90159 (t!22300 (t!22300 (toList!4502 lt!376414))) (ite c!90157 (Cons!15940 (h!17069 (t!22300 (toList!4502 lt!376414))) (t!22300 (t!22300 (toList!4502 lt!376414)))) Nil!15941)))))

(declare-fun b!831191 () Bool)

(assert (=> b!831191 (= c!90157 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376417))))))

(declare-fun e!463478 () List!15944)

(declare-fun e!463480 () List!15944)

(assert (=> b!831191 (= e!463478 e!463480)))

(declare-fun b!831192 () Bool)

(assert (=> b!831192 (= e!463481 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 lt!376414))) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun b!831193 () Bool)

(declare-fun e!463482 () List!15944)

(declare-fun call!36306 () List!15944)

(assert (=> b!831193 (= e!463482 call!36306)))

(declare-fun b!831194 () Bool)

(declare-fun call!36308 () List!15944)

(assert (=> b!831194 (= e!463478 call!36308)))

(declare-fun b!831195 () Bool)

(declare-fun call!36307 () List!15944)

(assert (=> b!831195 (= e!463480 call!36307)))

(declare-fun bm!36303 () Bool)

(assert (=> bm!36303 (= call!36307 call!36308)))

(declare-fun b!831196 () Bool)

(assert (=> b!831196 (= e!463479 (contains!4188 lt!377073 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun d!105885 () Bool)

(assert (=> d!105885 e!463479))

(declare-fun res!565823 () Bool)

(assert (=> d!105885 (=> (not res!565823) (not e!463479))))

(assert (=> d!105885 (= res!565823 (isStrictlySorted!437 lt!377073))))

(assert (=> d!105885 (= lt!377073 e!463482)))

(declare-fun c!90160 () Bool)

(assert (=> d!105885 (= c!90160 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376417))))))

(assert (=> d!105885 (isStrictlySorted!437 (t!22300 (toList!4502 lt!376414)))))

(assert (=> d!105885 (= (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376414)) (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!377073)))

(declare-fun bm!36304 () Bool)

(assert (=> bm!36304 (= call!36308 call!36306)))

(declare-fun bm!36305 () Bool)

(assert (=> bm!36305 (= call!36306 ($colon$colon!535 e!463481 (ite c!90160 (h!17069 (t!22300 (toList!4502 lt!376414))) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))))))

(declare-fun c!90158 () Bool)

(assert (=> bm!36305 (= c!90158 c!90160)))

(declare-fun b!831197 () Bool)

(assert (=> b!831197 (= e!463482 e!463478)))

(assert (=> b!831197 (= c!90159 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376414))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376414)))) (_1!5091 lt!376417))))))

(declare-fun b!831198 () Bool)

(assert (=> b!831198 (= e!463480 call!36307)))

(assert (= (and d!105885 c!90160) b!831193))

(assert (= (and d!105885 (not c!90160)) b!831197))

(assert (= (and b!831197 c!90159) b!831194))

(assert (= (and b!831197 (not c!90159)) b!831191))

(assert (= (and b!831191 c!90157) b!831198))

(assert (= (and b!831191 (not c!90157)) b!831195))

(assert (= (or b!831198 b!831195) bm!36303))

(assert (= (or b!831194 bm!36303) bm!36304))

(assert (= (or b!831193 bm!36304) bm!36305))

(assert (= (and bm!36305 c!90158) b!831192))

(assert (= (and bm!36305 (not c!90158)) b!831190))

(assert (= (and d!105885 res!565823) b!831189))

(assert (= (and b!831189 res!565822) b!831196))

(declare-fun m!774485 () Bool)

(assert (=> b!831189 m!774485))

(declare-fun m!774487 () Bool)

(assert (=> b!831196 m!774487))

(declare-fun m!774489 () Bool)

(assert (=> b!831192 m!774489))

(declare-fun m!774491 () Bool)

(assert (=> d!105885 m!774491))

(assert (=> d!105885 m!773747))

(declare-fun m!774493 () Bool)

(assert (=> bm!36305 m!774493))

(assert (=> b!830224 d!105885))

(declare-fun lt!377074 () Bool)

(declare-fun d!105887 () Bool)

(assert (=> d!105887 (= lt!377074 (select (content!385 (toList!4502 lt!376815)) (tuple2!10161 lt!376555 zeroValueBefore!34)))))

(declare-fun e!463483 () Bool)

(assert (=> d!105887 (= lt!377074 e!463483)))

(declare-fun res!565824 () Bool)

(assert (=> d!105887 (=> (not res!565824) (not e!463483))))

(assert (=> d!105887 (= res!565824 ((_ is Cons!15940) (toList!4502 lt!376815)))))

(assert (=> d!105887 (= (contains!4188 (toList!4502 lt!376815) (tuple2!10161 lt!376555 zeroValueBefore!34)) lt!377074)))

(declare-fun b!831199 () Bool)

(declare-fun e!463484 () Bool)

(assert (=> b!831199 (= e!463483 e!463484)))

(declare-fun res!565825 () Bool)

(assert (=> b!831199 (=> res!565825 e!463484)))

(assert (=> b!831199 (= res!565825 (= (h!17069 (toList!4502 lt!376815)) (tuple2!10161 lt!376555 zeroValueBefore!34)))))

(declare-fun b!831200 () Bool)

(assert (=> b!831200 (= e!463484 (contains!4188 (t!22300 (toList!4502 lt!376815)) (tuple2!10161 lt!376555 zeroValueBefore!34)))))

(assert (= (and d!105887 res!565824) b!831199))

(assert (= (and b!831199 (not res!565825)) b!831200))

(declare-fun m!774495 () Bool)

(assert (=> d!105887 m!774495))

(declare-fun m!774497 () Bool)

(assert (=> d!105887 m!774497))

(declare-fun m!774499 () Bool)

(assert (=> b!831200 m!774499))

(assert (=> b!830453 d!105887))

(declare-fun d!105889 () Bool)

(declare-fun e!463485 () Bool)

(assert (=> d!105889 e!463485))

(declare-fun res!565826 () Bool)

(assert (=> d!105889 (=> res!565826 e!463485)))

(declare-fun lt!377078 () Bool)

(assert (=> d!105889 (= res!565826 (not lt!377078))))

(declare-fun lt!377077 () Bool)

(assert (=> d!105889 (= lt!377078 lt!377077)))

(declare-fun lt!377076 () Unit!28383)

(declare-fun e!463486 () Unit!28383)

(assert (=> d!105889 (= lt!377076 e!463486)))

(declare-fun c!90161 () Bool)

(assert (=> d!105889 (= c!90161 lt!377077)))

(assert (=> d!105889 (= lt!377077 (containsKey!399 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(assert (=> d!105889 (= (contains!4187 lt!376823 (_1!5091 (tuple2!10161 lt!376566 minValue!754))) lt!377078)))

(declare-fun b!831201 () Bool)

(declare-fun lt!377075 () Unit!28383)

(assert (=> b!831201 (= e!463486 lt!377075)))

(assert (=> b!831201 (= lt!377075 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(assert (=> b!831201 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun b!831202 () Bool)

(declare-fun Unit!28438 () Unit!28383)

(assert (=> b!831202 (= e!463486 Unit!28438)))

(declare-fun b!831203 () Bool)

(assert (=> b!831203 (= e!463485 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(assert (= (and d!105889 c!90161) b!831201))

(assert (= (and d!105889 (not c!90161)) b!831202))

(assert (= (and d!105889 (not res!565826)) b!831203))

(declare-fun m!774501 () Bool)

(assert (=> d!105889 m!774501))

(declare-fun m!774503 () Bool)

(assert (=> b!831201 m!774503))

(assert (=> b!831201 m!773413))

(assert (=> b!831201 m!773413))

(declare-fun m!774505 () Bool)

(assert (=> b!831201 m!774505))

(assert (=> b!831203 m!773413))

(assert (=> b!831203 m!773413))

(assert (=> b!831203 m!774505))

(assert (=> d!105347 d!105889))

(declare-fun b!831204 () Bool)

(declare-fun e!463487 () Option!419)

(assert (=> b!831204 (= e!463487 (Some!418 (_2!5091 (h!17069 lt!376821))))))

(declare-fun b!831205 () Bool)

(declare-fun e!463488 () Option!419)

(assert (=> b!831205 (= e!463487 e!463488)))

(declare-fun c!90163 () Bool)

(assert (=> b!831205 (= c!90163 (and ((_ is Cons!15940) lt!376821) (not (= (_1!5091 (h!17069 lt!376821)) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))))

(declare-fun b!831207 () Bool)

(assert (=> b!831207 (= e!463488 None!417)))

(declare-fun b!831206 () Bool)

(assert (=> b!831206 (= e!463488 (getValueByKey!413 (t!22300 lt!376821) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun d!105891 () Bool)

(declare-fun c!90162 () Bool)

(assert (=> d!105891 (= c!90162 (and ((_ is Cons!15940) lt!376821) (= (_1!5091 (h!17069 lt!376821)) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(assert (=> d!105891 (= (getValueByKey!413 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754))) e!463487)))

(assert (= (and d!105891 c!90162) b!831204))

(assert (= (and d!105891 (not c!90162)) b!831205))

(assert (= (and b!831205 c!90163) b!831206))

(assert (= (and b!831205 (not c!90163)) b!831207))

(declare-fun m!774507 () Bool)

(assert (=> b!831206 m!774507))

(assert (=> d!105347 d!105891))

(declare-fun d!105893 () Bool)

(assert (=> d!105893 (= (getValueByKey!413 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun lt!377079 () Unit!28383)

(assert (=> d!105893 (= lt!377079 (choose!1426 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun e!463489 () Bool)

(assert (=> d!105893 e!463489))

(declare-fun res!565827 () Bool)

(assert (=> d!105893 (=> (not res!565827) (not e!463489))))

(assert (=> d!105893 (= res!565827 (isStrictlySorted!437 lt!376821))))

(assert (=> d!105893 (= (lemmaContainsTupThenGetReturnValue!230 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))) lt!377079)))

(declare-fun b!831208 () Bool)

(declare-fun res!565828 () Bool)

(assert (=> b!831208 (=> (not res!565828) (not e!463489))))

(assert (=> b!831208 (= res!565828 (containsKey!399 lt!376821 (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun b!831209 () Bool)

(assert (=> b!831209 (= e!463489 (contains!4188 lt!376821 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(assert (= (and d!105893 res!565827) b!831208))

(assert (= (and b!831208 res!565828) b!831209))

(assert (=> d!105893 m!773407))

(declare-fun m!774509 () Bool)

(assert (=> d!105893 m!774509))

(declare-fun m!774511 () Bool)

(assert (=> d!105893 m!774511))

(declare-fun m!774513 () Bool)

(assert (=> b!831208 m!774513))

(declare-fun m!774515 () Bool)

(assert (=> b!831209 m!774515))

(assert (=> d!105347 d!105893))

(declare-fun b!831210 () Bool)

(declare-fun res!565829 () Bool)

(declare-fun e!463491 () Bool)

(assert (=> b!831210 (=> (not res!565829) (not e!463491))))

(declare-fun lt!377080 () List!15944)

(assert (=> b!831210 (= res!565829 (containsKey!399 lt!377080 (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun c!90164 () Bool)

(declare-fun e!463493 () List!15944)

(declare-fun c!90166 () Bool)

(declare-fun b!831211 () Bool)

(assert (=> b!831211 (= e!463493 (ite c!90166 (t!22300 (toList!4502 lt!376567)) (ite c!90164 (Cons!15940 (h!17069 (toList!4502 lt!376567)) (t!22300 (toList!4502 lt!376567))) Nil!15941)))))

(declare-fun b!831212 () Bool)

(assert (=> b!831212 (= c!90164 (and ((_ is Cons!15940) (toList!4502 lt!376567)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376567))) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(declare-fun e!463490 () List!15944)

(declare-fun e!463492 () List!15944)

(assert (=> b!831212 (= e!463490 e!463492)))

(declare-fun b!831213 () Bool)

(assert (=> b!831213 (= e!463493 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376567)) (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun b!831214 () Bool)

(declare-fun e!463494 () List!15944)

(declare-fun call!36309 () List!15944)

(assert (=> b!831214 (= e!463494 call!36309)))

(declare-fun b!831215 () Bool)

(declare-fun call!36311 () List!15944)

(assert (=> b!831215 (= e!463490 call!36311)))

(declare-fun b!831216 () Bool)

(declare-fun call!36310 () List!15944)

(assert (=> b!831216 (= e!463492 call!36310)))

(declare-fun bm!36306 () Bool)

(assert (=> bm!36306 (= call!36310 call!36311)))

(declare-fun b!831217 () Bool)

(assert (=> b!831217 (= e!463491 (contains!4188 lt!377080 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(declare-fun d!105895 () Bool)

(assert (=> d!105895 e!463491))

(declare-fun res!565830 () Bool)

(assert (=> d!105895 (=> (not res!565830) (not e!463491))))

(assert (=> d!105895 (= res!565830 (isStrictlySorted!437 lt!377080))))

(assert (=> d!105895 (= lt!377080 e!463494)))

(declare-fun c!90167 () Bool)

(assert (=> d!105895 (= c!90167 (and ((_ is Cons!15940) (toList!4502 lt!376567)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376567))) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(assert (=> d!105895 (isStrictlySorted!437 (toList!4502 lt!376567))))

(assert (=> d!105895 (= (insertStrictlySorted!269 (toList!4502 lt!376567) (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))) lt!377080)))

(declare-fun bm!36307 () Bool)

(assert (=> bm!36307 (= call!36311 call!36309)))

(declare-fun bm!36308 () Bool)

(assert (=> bm!36308 (= call!36309 ($colon$colon!535 e!463493 (ite c!90167 (h!17069 (toList!4502 lt!376567)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376566 minValue!754)) (_2!5091 (tuple2!10161 lt!376566 minValue!754))))))))

(declare-fun c!90165 () Bool)

(assert (=> bm!36308 (= c!90165 c!90167)))

(declare-fun b!831218 () Bool)

(assert (=> b!831218 (= e!463494 e!463490)))

(assert (=> b!831218 (= c!90166 (and ((_ is Cons!15940) (toList!4502 lt!376567)) (= (_1!5091 (h!17069 (toList!4502 lt!376567))) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(declare-fun b!831219 () Bool)

(assert (=> b!831219 (= e!463492 call!36310)))

(assert (= (and d!105895 c!90167) b!831214))

(assert (= (and d!105895 (not c!90167)) b!831218))

(assert (= (and b!831218 c!90166) b!831215))

(assert (= (and b!831218 (not c!90166)) b!831212))

(assert (= (and b!831212 c!90164) b!831219))

(assert (= (and b!831212 (not c!90164)) b!831216))

(assert (= (or b!831219 b!831216) bm!36306))

(assert (= (or b!831215 bm!36306) bm!36307))

(assert (= (or b!831214 bm!36307) bm!36308))

(assert (= (and bm!36308 c!90165) b!831213))

(assert (= (and bm!36308 (not c!90165)) b!831211))

(assert (= (and d!105895 res!565830) b!831210))

(assert (= (and b!831210 res!565829) b!831217))

(declare-fun m!774517 () Bool)

(assert (=> b!831210 m!774517))

(declare-fun m!774519 () Bool)

(assert (=> b!831217 m!774519))

(declare-fun m!774521 () Bool)

(assert (=> b!831213 m!774521))

(declare-fun m!774523 () Bool)

(assert (=> d!105895 m!774523))

(declare-fun m!774525 () Bool)

(assert (=> d!105895 m!774525))

(declare-fun m!774527 () Bool)

(assert (=> bm!36308 m!774527))

(assert (=> d!105347 d!105895))

(declare-fun d!105897 () Bool)

(assert (=> d!105897 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377081 () Unit!28383)

(assert (=> d!105897 (= lt!377081 (choose!1430 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463495 () Bool)

(assert (=> d!105897 e!463495))

(declare-fun res!565831 () Bool)

(assert (=> d!105897 (=> (not res!565831) (not e!463495))))

(assert (=> d!105897 (= res!565831 (isStrictlySorted!437 (toList!4502 lt!376517)))))

(assert (=> d!105897 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377081)))

(declare-fun b!831220 () Bool)

(assert (=> b!831220 (= e!463495 (containsKey!399 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105897 res!565831) b!831220))

(assert (=> d!105897 m!772977))

(assert (=> d!105897 m!772977))

(assert (=> d!105897 m!773095))

(declare-fun m!774529 () Bool)

(assert (=> d!105897 m!774529))

(assert (=> d!105897 m!773595))

(assert (=> b!831220 m!773091))

(assert (=> b!830355 d!105897))

(declare-fun d!105899 () Bool)

(assert (=> d!105899 (= (isDefined!310 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!661 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23216 () Bool)

(assert (= bs!23216 d!105899))

(assert (=> bs!23216 m!772977))

(declare-fun m!774531 () Bool)

(assert (=> bs!23216 m!774531))

(assert (=> b!830355 d!105899))

(declare-fun b!831221 () Bool)

(declare-fun e!463496 () Option!419)

(assert (=> b!831221 (= e!463496 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376517)))))))

(declare-fun b!831222 () Bool)

(declare-fun e!463497 () Option!419)

(assert (=> b!831222 (= e!463496 e!463497)))

(declare-fun c!90169 () Bool)

(assert (=> b!831222 (= c!90169 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831224 () Bool)

(assert (=> b!831224 (= e!463497 None!417)))

(declare-fun b!831223 () Bool)

(assert (=> b!831223 (= e!463497 (getValueByKey!413 (t!22300 (toList!4502 lt!376517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105901 () Bool)

(declare-fun c!90168 () Bool)

(assert (=> d!105901 (= c!90168 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105901 (= (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000) e!463496)))

(assert (= (and d!105901 c!90168) b!831221))

(assert (= (and d!105901 (not c!90168)) b!831222))

(assert (= (and b!831222 c!90169) b!831223))

(assert (= (and b!831222 (not c!90169)) b!831224))

(declare-fun m!774533 () Bool)

(assert (=> b!831223 m!774533))

(assert (=> b!830355 d!105901))

(declare-fun d!105903 () Bool)

(assert (=> d!105903 (= (apply!372 lt!376762 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11824 (getValueByKey!413 (toList!4502 lt!376762) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23217 () Bool)

(assert (= bs!23217 d!105903))

(assert (=> bs!23217 m!772925))

(assert (=> bs!23217 m!773859))

(assert (=> bs!23217 m!773859))

(declare-fun m!774535 () Bool)

(assert (=> bs!23217 m!774535))

(assert (=> b!830396 d!105903))

(assert (=> b!830396 d!105539))

(declare-fun d!105905 () Bool)

(declare-fun e!463498 () Bool)

(assert (=> d!105905 e!463498))

(declare-fun res!565832 () Bool)

(assert (=> d!105905 (=> res!565832 e!463498)))

(declare-fun lt!377085 () Bool)

(assert (=> d!105905 (= res!565832 (not lt!377085))))

(declare-fun lt!377084 () Bool)

(assert (=> d!105905 (= lt!377085 lt!377084)))

(declare-fun lt!377083 () Unit!28383)

(declare-fun e!463499 () Unit!28383)

(assert (=> d!105905 (= lt!377083 e!463499)))

(declare-fun c!90170 () Bool)

(assert (=> d!105905 (= c!90170 lt!377084)))

(assert (=> d!105905 (= lt!377084 (containsKey!399 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(assert (=> d!105905 (= (contains!4187 lt!376815 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!377085)))

(declare-fun b!831225 () Bool)

(declare-fun lt!377082 () Unit!28383)

(assert (=> b!831225 (= e!463499 lt!377082)))

(assert (=> b!831225 (= lt!377082 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(assert (=> b!831225 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun b!831226 () Bool)

(declare-fun Unit!28439 () Unit!28383)

(assert (=> b!831226 (= e!463499 Unit!28439)))

(declare-fun b!831227 () Bool)

(assert (=> b!831227 (= e!463498 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376815) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(assert (= (and d!105905 c!90170) b!831225))

(assert (= (and d!105905 (not c!90170)) b!831226))

(assert (= (and d!105905 (not res!565832)) b!831227))

(declare-fun m!774537 () Bool)

(assert (=> d!105905 m!774537))

(declare-fun m!774539 () Bool)

(assert (=> b!831225 m!774539))

(assert (=> b!831225 m!773389))

(assert (=> b!831225 m!773389))

(declare-fun m!774541 () Bool)

(assert (=> b!831225 m!774541))

(assert (=> b!831227 m!773389))

(assert (=> b!831227 m!773389))

(assert (=> b!831227 m!774541))

(assert (=> d!105341 d!105905))

(declare-fun b!831228 () Bool)

(declare-fun e!463500 () Option!419)

(assert (=> b!831228 (= e!463500 (Some!418 (_2!5091 (h!17069 lt!376813))))))

(declare-fun b!831229 () Bool)

(declare-fun e!463501 () Option!419)

(assert (=> b!831229 (= e!463500 e!463501)))

(declare-fun c!90172 () Bool)

(assert (=> b!831229 (= c!90172 (and ((_ is Cons!15940) lt!376813) (not (= (_1!5091 (h!17069 lt!376813)) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))))

(declare-fun b!831231 () Bool)

(assert (=> b!831231 (= e!463501 None!417)))

(declare-fun b!831230 () Bool)

(assert (=> b!831230 (= e!463501 (getValueByKey!413 (t!22300 lt!376813) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun d!105907 () Bool)

(declare-fun c!90171 () Bool)

(assert (=> d!105907 (= c!90171 (and ((_ is Cons!15940) lt!376813) (= (_1!5091 (h!17069 lt!376813)) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(assert (=> d!105907 (= (getValueByKey!413 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) e!463500)))

(assert (= (and d!105907 c!90171) b!831228))

(assert (= (and d!105907 (not c!90171)) b!831229))

(assert (= (and b!831229 c!90172) b!831230))

(assert (= (and b!831229 (not c!90172)) b!831231))

(declare-fun m!774543 () Bool)

(assert (=> b!831230 m!774543))

(assert (=> d!105341 d!105907))

(declare-fun d!105909 () Bool)

(assert (=> d!105909 (= (getValueByKey!413 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) (Some!418 (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun lt!377086 () Unit!28383)

(assert (=> d!105909 (= lt!377086 (choose!1426 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun e!463502 () Bool)

(assert (=> d!105909 e!463502))

(declare-fun res!565833 () Bool)

(assert (=> d!105909 (=> (not res!565833) (not e!463502))))

(assert (=> d!105909 (= res!565833 (isStrictlySorted!437 lt!376813))))

(assert (=> d!105909 (= (lemmaContainsTupThenGetReturnValue!230 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!377086)))

(declare-fun b!831232 () Bool)

(declare-fun res!565834 () Bool)

(assert (=> b!831232 (=> (not res!565834) (not e!463502))))

(assert (=> b!831232 (= res!565834 (containsKey!399 lt!376813 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun b!831233 () Bool)

(assert (=> b!831233 (= e!463502 (contains!4188 lt!376813 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(assert (= (and d!105909 res!565833) b!831232))

(assert (= (and b!831232 res!565834) b!831233))

(assert (=> d!105909 m!773383))

(declare-fun m!774545 () Bool)

(assert (=> d!105909 m!774545))

(declare-fun m!774547 () Bool)

(assert (=> d!105909 m!774547))

(declare-fun m!774549 () Bool)

(assert (=> b!831232 m!774549))

(declare-fun m!774551 () Bool)

(assert (=> b!831233 m!774551))

(assert (=> d!105341 d!105909))

(declare-fun b!831234 () Bool)

(declare-fun res!565835 () Bool)

(declare-fun e!463504 () Bool)

(assert (=> b!831234 (=> (not res!565835) (not e!463504))))

(declare-fun lt!377087 () List!15944)

(assert (=> b!831234 (= res!565835 (containsKey!399 lt!377087 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun e!463506 () List!15944)

(declare-fun c!90175 () Bool)

(declare-fun c!90173 () Bool)

(declare-fun b!831235 () Bool)

(assert (=> b!831235 (= e!463506 (ite c!90175 (t!22300 (toList!4502 lt!376569)) (ite c!90173 (Cons!15940 (h!17069 (toList!4502 lt!376569)) (t!22300 (toList!4502 lt!376569))) Nil!15941)))))

(declare-fun b!831236 () Bool)

(assert (=> b!831236 (= c!90173 (and ((_ is Cons!15940) (toList!4502 lt!376569)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376569))) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(declare-fun e!463503 () List!15944)

(declare-fun e!463505 () List!15944)

(assert (=> b!831236 (= e!463503 e!463505)))

(declare-fun b!831237 () Bool)

(assert (=> b!831237 (= e!463506 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376569)) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))

(declare-fun b!831238 () Bool)

(declare-fun e!463507 () List!15944)

(declare-fun call!36312 () List!15944)

(assert (=> b!831238 (= e!463507 call!36312)))

(declare-fun b!831239 () Bool)

(declare-fun call!36314 () List!15944)

(assert (=> b!831239 (= e!463503 call!36314)))

(declare-fun b!831240 () Bool)

(declare-fun call!36313 () List!15944)

(assert (=> b!831240 (= e!463505 call!36313)))

(declare-fun bm!36309 () Bool)

(assert (=> bm!36309 (= call!36313 call!36314)))

(declare-fun b!831241 () Bool)

(assert (=> b!831241 (= e!463504 (contains!4188 lt!377087 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(declare-fun d!105911 () Bool)

(assert (=> d!105911 e!463504))

(declare-fun res!565836 () Bool)

(assert (=> d!105911 (=> (not res!565836) (not e!463504))))

(assert (=> d!105911 (= res!565836 (isStrictlySorted!437 lt!377087))))

(assert (=> d!105911 (= lt!377087 e!463507)))

(declare-fun c!90176 () Bool)

(assert (=> d!105911 (= c!90176 (and ((_ is Cons!15940) (toList!4502 lt!376569)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376569))) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(assert (=> d!105911 (isStrictlySorted!437 (toList!4502 lt!376569))))

(assert (=> d!105911 (= (insertStrictlySorted!269 (toList!4502 lt!376569) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))) lt!377087)))

(declare-fun bm!36310 () Bool)

(assert (=> bm!36310 (= call!36314 call!36312)))

(declare-fun bm!36311 () Bool)

(assert (=> bm!36311 (= call!36312 ($colon$colon!535 e!463506 (ite c!90176 (h!17069 (toList!4502 lt!376569)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)) (_2!5091 (tuple2!10161 lt!376555 zeroValueBefore!34))))))))

(declare-fun c!90174 () Bool)

(assert (=> bm!36311 (= c!90174 c!90176)))

(declare-fun b!831242 () Bool)

(assert (=> b!831242 (= e!463507 e!463503)))

(assert (=> b!831242 (= c!90175 (and ((_ is Cons!15940) (toList!4502 lt!376569)) (= (_1!5091 (h!17069 (toList!4502 lt!376569))) (_1!5091 (tuple2!10161 lt!376555 zeroValueBefore!34)))))))

(declare-fun b!831243 () Bool)

(assert (=> b!831243 (= e!463505 call!36313)))

(assert (= (and d!105911 c!90176) b!831238))

(assert (= (and d!105911 (not c!90176)) b!831242))

(assert (= (and b!831242 c!90175) b!831239))

(assert (= (and b!831242 (not c!90175)) b!831236))

(assert (= (and b!831236 c!90173) b!831243))

(assert (= (and b!831236 (not c!90173)) b!831240))

(assert (= (or b!831243 b!831240) bm!36309))

(assert (= (or b!831239 bm!36309) bm!36310))

(assert (= (or b!831238 bm!36310) bm!36311))

(assert (= (and bm!36311 c!90174) b!831237))

(assert (= (and bm!36311 (not c!90174)) b!831235))

(assert (= (and d!105911 res!565836) b!831234))

(assert (= (and b!831234 res!565835) b!831241))

(declare-fun m!774553 () Bool)

(assert (=> b!831234 m!774553))

(declare-fun m!774555 () Bool)

(assert (=> b!831241 m!774555))

(declare-fun m!774557 () Bool)

(assert (=> b!831237 m!774557))

(declare-fun m!774559 () Bool)

(assert (=> d!105911 m!774559))

(declare-fun m!774561 () Bool)

(assert (=> d!105911 m!774561))

(declare-fun m!774563 () Bool)

(assert (=> bm!36311 m!774563))

(assert (=> d!105341 d!105911))

(declare-fun d!105913 () Bool)

(declare-fun res!565837 () Bool)

(declare-fun e!463508 () Bool)

(assert (=> d!105913 (=> res!565837 e!463508)))

(assert (=> d!105913 (= res!565837 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105913 (= (containsKey!399 (toList!4502 lt!376563) #b1000000000000000000000000000000000000000000000000000000000000000) e!463508)))

(declare-fun b!831244 () Bool)

(declare-fun e!463509 () Bool)

(assert (=> b!831244 (= e!463508 e!463509)))

(declare-fun res!565838 () Bool)

(assert (=> b!831244 (=> (not res!565838) (not e!463509))))

(assert (=> b!831244 (= res!565838 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376563))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376563))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376563)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376563))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831245 () Bool)

(assert (=> b!831245 (= e!463509 (containsKey!399 (t!22300 (toList!4502 lt!376563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105913 (not res!565837)) b!831244))

(assert (= (and b!831244 res!565838) b!831245))

(declare-fun m!774565 () Bool)

(assert (=> b!831245 m!774565))

(assert (=> d!105193 d!105913))

(declare-fun b!831246 () Bool)

(declare-fun e!463510 () Option!419)

(assert (=> b!831246 (= e!463510 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376542))))))))

(declare-fun b!831247 () Bool)

(declare-fun e!463511 () Option!419)

(assert (=> b!831247 (= e!463510 e!463511)))

(declare-fun c!90178 () Bool)

(assert (=> b!831247 (= c!90178 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376542))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376542)))) (_1!5091 lt!376417)))))))

(declare-fun b!831249 () Bool)

(assert (=> b!831249 (= e!463511 None!417)))

(declare-fun b!831248 () Bool)

(assert (=> b!831248 (= e!463511 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376542))) (_1!5091 lt!376417)))))

(declare-fun d!105915 () Bool)

(declare-fun c!90177 () Bool)

(assert (=> d!105915 (= c!90177 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376542))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376542)))) (_1!5091 lt!376417))))))

(assert (=> d!105915 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376542)) (_1!5091 lt!376417)) e!463510)))

(assert (= (and d!105915 c!90177) b!831246))

(assert (= (and d!105915 (not c!90177)) b!831247))

(assert (= (and b!831247 c!90178) b!831248))

(assert (= (and b!831247 (not c!90178)) b!831249))

(declare-fun m!774567 () Bool)

(assert (=> b!831248 m!774567))

(assert (=> b!830461 d!105915))

(declare-fun d!105917 () Bool)

(declare-fun c!90179 () Bool)

(assert (=> d!105917 (= c!90179 ((_ is Nil!15941) (toList!4502 lt!376542)))))

(declare-fun e!463512 () (InoxSet tuple2!10160))

(assert (=> d!105917 (= (content!385 (toList!4502 lt!376542)) e!463512)))

(declare-fun b!831250 () Bool)

(assert (=> b!831250 (= e!463512 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!831251 () Bool)

(assert (=> b!831251 (= e!463512 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376542)) true) (content!385 (t!22300 (toList!4502 lt!376542)))))))

(assert (= (and d!105917 c!90179) b!831250))

(assert (= (and d!105917 (not c!90179)) b!831251))

(declare-fun m!774569 () Bool)

(assert (=> b!831251 m!774569))

(assert (=> b!831251 m!774093))

(assert (=> d!105231 d!105917))

(declare-fun d!105919 () Bool)

(assert (=> d!105919 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377088 () Unit!28383)

(assert (=> d!105919 (= lt!377088 (choose!1430 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463513 () Bool)

(assert (=> d!105919 e!463513))

(declare-fun res!565839 () Bool)

(assert (=> d!105919 (=> (not res!565839) (not e!463513))))

(assert (=> d!105919 (= res!565839 (isStrictlySorted!437 (toList!4502 lt!376595)))))

(assert (=> d!105919 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377088)))

(declare-fun b!831252 () Bool)

(assert (=> b!831252 (= e!463513 (containsKey!399 (toList!4502 lt!376595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105919 res!565839) b!831252))

(assert (=> d!105919 m!773315))

(assert (=> d!105919 m!773315))

(assert (=> d!105919 m!773317))

(declare-fun m!774571 () Bool)

(assert (=> d!105919 m!774571))

(assert (=> d!105919 m!773795))

(assert (=> b!831252 m!773311))

(assert (=> b!830437 d!105919))

(assert (=> b!830437 d!105769))

(assert (=> b!830437 d!105771))

(assert (=> b!830371 d!105447))

(declare-fun d!105921 () Bool)

(assert (=> d!105921 (= (isEmpty!660 (toList!4502 lt!376602)) ((_ is Nil!15941) (toList!4502 lt!376602)))))

(assert (=> d!105191 d!105921))

(declare-fun d!105923 () Bool)

(declare-fun res!565840 () Bool)

(declare-fun e!463514 () Bool)

(assert (=> d!105923 (=> res!565840 e!463514)))

(assert (=> d!105923 (= res!565840 (and ((_ is Cons!15940) lt!376605) (= (_1!5091 (h!17069 lt!376605)) (_1!5091 lt!376416))))))

(assert (=> d!105923 (= (containsKey!399 lt!376605 (_1!5091 lt!376416)) e!463514)))

(declare-fun b!831253 () Bool)

(declare-fun e!463515 () Bool)

(assert (=> b!831253 (= e!463514 e!463515)))

(declare-fun res!565841 () Bool)

(assert (=> b!831253 (=> (not res!565841) (not e!463515))))

(assert (=> b!831253 (= res!565841 (and (or (not ((_ is Cons!15940) lt!376605)) (bvsle (_1!5091 (h!17069 lt!376605)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376605) (bvslt (_1!5091 (h!17069 lt!376605)) (_1!5091 lt!376416))))))

(declare-fun b!831254 () Bool)

(assert (=> b!831254 (= e!463515 (containsKey!399 (t!22300 lt!376605) (_1!5091 lt!376416)))))

(assert (= (and d!105923 (not res!565840)) b!831253))

(assert (= (and b!831253 res!565841) b!831254))

(declare-fun m!774573 () Bool)

(assert (=> b!831254 m!774573))

(assert (=> b!830291 d!105923))

(declare-fun b!831255 () Bool)

(declare-fun e!463516 () Option!419)

(assert (=> b!831255 (= e!463516 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376536)))))))

(declare-fun b!831256 () Bool)

(declare-fun e!463517 () Option!419)

(assert (=> b!831256 (= e!463516 e!463517)))

(declare-fun c!90181 () Bool)

(assert (=> b!831256 (= c!90181 (and ((_ is Cons!15940) (t!22300 lt!376536)) (not (= (_1!5091 (h!17069 (t!22300 lt!376536))) (_1!5091 lt!376417)))))))

(declare-fun b!831258 () Bool)

(assert (=> b!831258 (= e!463517 None!417)))

(declare-fun b!831257 () Bool)

(assert (=> b!831257 (= e!463517 (getValueByKey!413 (t!22300 (t!22300 lt!376536)) (_1!5091 lt!376417)))))

(declare-fun d!105925 () Bool)

(declare-fun c!90180 () Bool)

(assert (=> d!105925 (= c!90180 (and ((_ is Cons!15940) (t!22300 lt!376536)) (= (_1!5091 (h!17069 (t!22300 lt!376536))) (_1!5091 lt!376417))))))

(assert (=> d!105925 (= (getValueByKey!413 (t!22300 lt!376536) (_1!5091 lt!376417)) e!463516)))

(assert (= (and d!105925 c!90180) b!831255))

(assert (= (and d!105925 (not c!90180)) b!831256))

(assert (= (and b!831256 c!90181) b!831257))

(assert (= (and b!831256 (not c!90181)) b!831258))

(declare-fun m!774575 () Bool)

(assert (=> b!831257 m!774575))

(assert (=> b!830193 d!105925))

(assert (=> b!830527 d!105689))

(assert (=> b!830527 d!105691))

(declare-fun d!105927 () Bool)

(assert (=> d!105927 (= (isEmpty!659 lt!376669) (isEmpty!660 (toList!4502 lt!376669)))))

(declare-fun bs!23218 () Bool)

(assert (= bs!23218 d!105927))

(declare-fun m!774577 () Bool)

(assert (=> bs!23218 m!774577))

(assert (=> b!830274 d!105927))

(declare-fun b!831259 () Bool)

(declare-fun e!463518 () Option!419)

(assert (=> b!831259 (= e!463518 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376823)))))))

(declare-fun b!831260 () Bool)

(declare-fun e!463519 () Option!419)

(assert (=> b!831260 (= e!463518 e!463519)))

(declare-fun c!90183 () Bool)

(assert (=> b!831260 (= c!90183 (and ((_ is Cons!15940) (toList!4502 lt!376823)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376823))) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))))

(declare-fun b!831262 () Bool)

(assert (=> b!831262 (= e!463519 None!417)))

(declare-fun b!831261 () Bool)

(assert (=> b!831261 (= e!463519 (getValueByKey!413 (t!22300 (toList!4502 lt!376823)) (_1!5091 (tuple2!10161 lt!376566 minValue!754))))))

(declare-fun c!90182 () Bool)

(declare-fun d!105929 () Bool)

(assert (=> d!105929 (= c!90182 (and ((_ is Cons!15940) (toList!4502 lt!376823)) (= (_1!5091 (h!17069 (toList!4502 lt!376823))) (_1!5091 (tuple2!10161 lt!376566 minValue!754)))))))

(assert (=> d!105929 (= (getValueByKey!413 (toList!4502 lt!376823) (_1!5091 (tuple2!10161 lt!376566 minValue!754))) e!463518)))

(assert (= (and d!105929 c!90182) b!831259))

(assert (= (and d!105929 (not c!90182)) b!831260))

(assert (= (and b!831260 c!90183) b!831261))

(assert (= (and b!831260 (not c!90183)) b!831262))

(declare-fun m!774579 () Bool)

(assert (=> b!831261 m!774579))

(assert (=> b!830457 d!105929))

(declare-fun d!105931 () Bool)

(assert (=> d!105931 (= (get!11824 (getValueByKey!413 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))) lt!376559)) (v!10089 (getValueByKey!413 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))) lt!376559)))))

(assert (=> d!105329 d!105931))

(declare-fun b!831263 () Bool)

(declare-fun e!463520 () Option!419)

(assert (=> b!831263 (= e!463520 (Some!418 (_2!5091 (h!17069 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)))))))))

(declare-fun b!831264 () Bool)

(declare-fun e!463521 () Option!419)

(assert (=> b!831264 (= e!463520 e!463521)))

(declare-fun c!90185 () Bool)

(assert (=> b!831264 (= c!90185 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)))) (not (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))))) lt!376559))))))

(declare-fun b!831266 () Bool)

(assert (=> b!831266 (= e!463521 None!417)))

(declare-fun b!831265 () Bool)

(assert (=> b!831265 (= e!463521 (getValueByKey!413 (t!22300 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)))) lt!376559))))

(declare-fun d!105933 () Bool)

(declare-fun c!90184 () Bool)

(assert (=> d!105933 (= c!90184 (and ((_ is Cons!15940) (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754)))) (= (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))))) lt!376559)))))

(assert (=> d!105933 (= (getValueByKey!413 (toList!4502 (+!2010 lt!376567 (tuple2!10161 lt!376566 minValue!754))) lt!376559) e!463520)))

(assert (= (and d!105933 c!90184) b!831263))

(assert (= (and d!105933 (not c!90184)) b!831264))

(assert (= (and b!831264 c!90185) b!831265))

(assert (= (and b!831264 (not c!90185)) b!831266))

(declare-fun m!774581 () Bool)

(assert (=> b!831265 m!774581))

(assert (=> d!105329 d!105933))

(declare-fun b!831267 () Bool)

(declare-fun e!463522 () Option!419)

(assert (=> b!831267 (= e!463522 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376810)))))))

(declare-fun b!831268 () Bool)

(declare-fun e!463523 () Option!419)

(assert (=> b!831268 (= e!463522 e!463523)))

(declare-fun c!90187 () Bool)

(assert (=> b!831268 (= c!90187 (and ((_ is Cons!15940) (toList!4502 lt!376810)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376810))) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))))

(declare-fun b!831270 () Bool)

(assert (=> b!831270 (= e!463523 None!417)))

(declare-fun b!831269 () Bool)

(assert (=> b!831269 (= e!463523 (getValueByKey!413 (t!22300 (toList!4502 lt!376810)) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))))))

(declare-fun c!90186 () Bool)

(declare-fun d!105935 () Bool)

(assert (=> d!105935 (= c!90186 (and ((_ is Cons!15940) (toList!4502 lt!376810)) (= (_1!5091 (h!17069 (toList!4502 lt!376810))) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34)))))))

(assert (=> d!105935 (= (getValueByKey!413 (toList!4502 lt!376810) (_1!5091 (tuple2!10161 lt!376570 zeroValueBefore!34))) e!463522)))

(assert (= (and d!105935 c!90186) b!831267))

(assert (= (and d!105935 (not c!90186)) b!831268))

(assert (= (and b!831268 c!90187) b!831269))

(assert (= (and b!831268 (not c!90187)) b!831270))

(declare-fun m!774583 () Bool)

(assert (=> b!831269 m!774583))

(assert (=> b!830449 d!105935))

(declare-fun b!831271 () Bool)

(declare-fun e!463524 () Option!419)

(assert (=> b!831271 (= e!463524 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376732)))))))

(declare-fun b!831272 () Bool)

(declare-fun e!463525 () Option!419)

(assert (=> b!831272 (= e!463524 e!463525)))

(declare-fun c!90189 () Bool)

(assert (=> b!831272 (= c!90189 (and ((_ is Cons!15940) (toList!4502 lt!376732)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376732))) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))))

(declare-fun b!831274 () Bool)

(assert (=> b!831274 (= e!463525 None!417)))

(declare-fun b!831273 () Bool)

(assert (=> b!831273 (= e!463525 (getValueByKey!413 (t!22300 (toList!4502 lt!376732)) (_1!5091 (tuple2!10161 lt!376512 minValue!754))))))

(declare-fun c!90188 () Bool)

(declare-fun d!105937 () Bool)

(assert (=> d!105937 (= c!90188 (and ((_ is Cons!15940) (toList!4502 lt!376732)) (= (_1!5091 (h!17069 (toList!4502 lt!376732))) (_1!5091 (tuple2!10161 lt!376512 minValue!754)))))))

(assert (=> d!105937 (= (getValueByKey!413 (toList!4502 lt!376732) (_1!5091 (tuple2!10161 lt!376512 minValue!754))) e!463524)))

(assert (= (and d!105937 c!90188) b!831271))

(assert (= (and d!105937 (not c!90188)) b!831272))

(assert (= (and b!831272 c!90189) b!831273))

(assert (= (and b!831272 (not c!90189)) b!831274))

(declare-fun m!774585 () Bool)

(assert (=> b!831273 m!774585))

(assert (=> b!830374 d!105937))

(assert (=> d!105215 d!105213))

(declare-fun d!105939 () Bool)

(assert (=> d!105939 (= (getValueByKey!413 lt!376605 (_1!5091 lt!376416)) (Some!418 (_2!5091 lt!376416)))))

(assert (=> d!105939 true))

(declare-fun _$22!573 () Unit!28383)

(assert (=> d!105939 (= (choose!1426 lt!376605 (_1!5091 lt!376416) (_2!5091 lt!376416)) _$22!573)))

(declare-fun bs!23219 () Bool)

(assert (= bs!23219 d!105939))

(assert (=> bs!23219 m!772771))

(assert (=> d!105215 d!105939))

(declare-fun d!105941 () Bool)

(declare-fun res!565842 () Bool)

(declare-fun e!463526 () Bool)

(assert (=> d!105941 (=> res!565842 e!463526)))

(assert (=> d!105941 (= res!565842 (or ((_ is Nil!15941) lt!376605) ((_ is Nil!15941) (t!22300 lt!376605))))))

(assert (=> d!105941 (= (isStrictlySorted!437 lt!376605) e!463526)))

(declare-fun b!831275 () Bool)

(declare-fun e!463527 () Bool)

(assert (=> b!831275 (= e!463526 e!463527)))

(declare-fun res!565843 () Bool)

(assert (=> b!831275 (=> (not res!565843) (not e!463527))))

(assert (=> b!831275 (= res!565843 (bvslt (_1!5091 (h!17069 lt!376605)) (_1!5091 (h!17069 (t!22300 lt!376605)))))))

(declare-fun b!831276 () Bool)

(assert (=> b!831276 (= e!463527 (isStrictlySorted!437 (t!22300 lt!376605)))))

(assert (= (and d!105941 (not res!565842)) b!831275))

(assert (= (and b!831275 res!565843) b!831276))

(declare-fun m!774587 () Bool)

(assert (=> b!831276 m!774587))

(assert (=> d!105215 d!105941))

(declare-fun d!105943 () Bool)

(assert (=> d!105943 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(declare-fun lt!377089 () Unit!28383)

(assert (=> d!105943 (= lt!377089 (choose!1430 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(declare-fun e!463528 () Bool)

(assert (=> d!105943 e!463528))

(declare-fun res!565844 () Bool)

(assert (=> d!105943 (=> (not res!565844) (not e!463528))))

(assert (=> d!105943 (= res!565844 (isStrictlySorted!437 (toList!4502 lt!376542)))))

(assert (=> d!105943 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376542) (_1!5091 lt!376417)) lt!377089)))

(declare-fun b!831277 () Bool)

(assert (=> b!831277 (= e!463528 (containsKey!399 (toList!4502 lt!376542) (_1!5091 lt!376417)))))

(assert (= (and d!105943 res!565844) b!831277))

(assert (=> d!105943 m!772653))

(assert (=> d!105943 m!772653))

(assert (=> d!105943 m!773237))

(declare-fun m!774589 () Bool)

(assert (=> d!105943 m!774589))

(declare-fun m!774591 () Bool)

(assert (=> d!105943 m!774591))

(assert (=> b!831277 m!773233))

(assert (=> b!830404 d!105943))

(assert (=> b!830404 d!105405))

(assert (=> b!830404 d!105357))

(declare-fun d!105945 () Bool)

(assert (=> d!105945 (= ($colon$colon!535 e!462918 (ite c!89886 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416)))) (Cons!15940 (ite c!89886 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) e!462918))))

(assert (=> bm!36247 d!105945))

(declare-fun d!105947 () Bool)

(declare-fun c!90190 () Bool)

(assert (=> d!105947 (= c!90190 ((_ is Nil!15941) (toList!4502 lt!376607)))))

(declare-fun e!463529 () (InoxSet tuple2!10160))

(assert (=> d!105947 (= (content!385 (toList!4502 lt!376607)) e!463529)))

(declare-fun b!831278 () Bool)

(assert (=> b!831278 (= e!463529 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!831279 () Bool)

(assert (=> b!831279 (= e!463529 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376607)) true) (content!385 (t!22300 (toList!4502 lt!376607)))))))

(assert (= (and d!105947 c!90190) b!831278))

(assert (= (and d!105947 (not c!90190)) b!831279))

(declare-fun m!774593 () Bool)

(assert (=> b!831279 m!774593))

(declare-fun m!774595 () Bool)

(assert (=> b!831279 m!774595))

(assert (=> d!105369 d!105947))

(declare-fun d!105949 () Bool)

(declare-fun res!565845 () Bool)

(declare-fun e!463530 () Bool)

(assert (=> d!105949 (=> res!565845 e!463530)))

(assert (=> d!105949 (= res!565845 (or ((_ is Nil!15941) lt!376645) ((_ is Nil!15941) (t!22300 lt!376645))))))

(assert (=> d!105949 (= (isStrictlySorted!437 lt!376645) e!463530)))

(declare-fun b!831280 () Bool)

(declare-fun e!463531 () Bool)

(assert (=> b!831280 (= e!463530 e!463531)))

(declare-fun res!565846 () Bool)

(assert (=> b!831280 (=> (not res!565846) (not e!463531))))

(assert (=> b!831280 (= res!565846 (bvslt (_1!5091 (h!17069 lt!376645)) (_1!5091 (h!17069 (t!22300 lt!376645)))))))

(declare-fun b!831281 () Bool)

(assert (=> b!831281 (= e!463531 (isStrictlySorted!437 (t!22300 lt!376645)))))

(assert (= (and d!105949 (not res!565845)) b!831280))

(assert (= (and b!831280 res!565846) b!831281))

(declare-fun m!774597 () Bool)

(assert (=> b!831281 m!774597))

(assert (=> d!105187 d!105949))

(declare-fun d!105951 () Bool)

(declare-fun res!565847 () Bool)

(declare-fun e!463532 () Bool)

(assert (=> d!105951 (=> res!565847 e!463532)))

(assert (=> d!105951 (= res!565847 (or ((_ is Nil!15941) (toList!4502 lt!376419)) ((_ is Nil!15941) (t!22300 (toList!4502 lt!376419)))))))

(assert (=> d!105951 (= (isStrictlySorted!437 (toList!4502 lt!376419)) e!463532)))

(declare-fun b!831282 () Bool)

(declare-fun e!463533 () Bool)

(assert (=> b!831282 (= e!463532 e!463533)))

(declare-fun res!565848 () Bool)

(assert (=> b!831282 (=> (not res!565848) (not e!463533))))

(assert (=> b!831282 (= res!565848 (bvslt (_1!5091 (h!17069 (toList!4502 lt!376419))) (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376419))))))))

(declare-fun b!831283 () Bool)

(assert (=> b!831283 (= e!463533 (isStrictlySorted!437 (t!22300 (toList!4502 lt!376419))))))

(assert (= (and d!105951 (not res!565847)) b!831282))

(assert (= (and b!831282 res!565848) b!831283))

(assert (=> b!831283 m!773641))

(assert (=> d!105187 d!105951))

(declare-fun lt!377090 () Bool)

(declare-fun d!105953 () Bool)

(assert (=> d!105953 (= lt!377090 (select (content!385 (toList!4502 lt!376712)) (tuple2!10161 lt!376600 lt!376598)))))

(declare-fun e!463534 () Bool)

(assert (=> d!105953 (= lt!377090 e!463534)))

(declare-fun res!565849 () Bool)

(assert (=> d!105953 (=> (not res!565849) (not e!463534))))

(assert (=> d!105953 (= res!565849 ((_ is Cons!15940) (toList!4502 lt!376712)))))

(assert (=> d!105953 (= (contains!4188 (toList!4502 lt!376712) (tuple2!10161 lt!376600 lt!376598)) lt!377090)))

(declare-fun b!831284 () Bool)

(declare-fun e!463535 () Bool)

(assert (=> b!831284 (= e!463534 e!463535)))

(declare-fun res!565850 () Bool)

(assert (=> b!831284 (=> res!565850 e!463535)))

(assert (=> b!831284 (= res!565850 (= (h!17069 (toList!4502 lt!376712)) (tuple2!10161 lt!376600 lt!376598)))))

(declare-fun b!831285 () Bool)

(assert (=> b!831285 (= e!463535 (contains!4188 (t!22300 (toList!4502 lt!376712)) (tuple2!10161 lt!376600 lt!376598)))))

(assert (= (and d!105953 res!565849) b!831284))

(assert (= (and b!831284 (not res!565850)) b!831285))

(declare-fun m!774599 () Bool)

(assert (=> d!105953 m!774599))

(declare-fun m!774601 () Bool)

(assert (=> d!105953 m!774601))

(declare-fun m!774603 () Bool)

(assert (=> b!831285 m!774603))

(assert (=> b!830349 d!105953))

(declare-fun d!105955 () Bool)

(declare-fun lt!377091 () Bool)

(assert (=> d!105955 (= lt!377091 (select (content!385 (toList!4502 lt!376655)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!463536 () Bool)

(assert (=> d!105955 (= lt!377091 e!463536)))

(declare-fun res!565851 () Bool)

(assert (=> d!105955 (=> (not res!565851) (not e!463536))))

(assert (=> d!105955 (= res!565851 ((_ is Cons!15940) (toList!4502 lt!376655)))))

(assert (=> d!105955 (= (contains!4188 (toList!4502 lt!376655) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377091)))

(declare-fun b!831286 () Bool)

(declare-fun e!463537 () Bool)

(assert (=> b!831286 (= e!463536 e!463537)))

(declare-fun res!565852 () Bool)

(assert (=> b!831286 (=> res!565852 e!463537)))

(assert (=> b!831286 (= res!565852 (= (h!17069 (toList!4502 lt!376655)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831287 () Bool)

(assert (=> b!831287 (= e!463537 (contains!4188 (t!22300 (toList!4502 lt!376655)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105955 res!565851) b!831286))

(assert (= (and b!831286 (not res!565852)) b!831287))

(declare-fun m!774605 () Bool)

(assert (=> d!105955 m!774605))

(declare-fun m!774607 () Bool)

(assert (=> d!105955 m!774607))

(declare-fun m!774609 () Bool)

(assert (=> b!831287 m!774609))

(assert (=> b!830266 d!105955))

(declare-fun d!105957 () Bool)

(declare-fun lt!377092 () Bool)

(assert (=> d!105957 (= lt!377092 (select (content!385 (toList!4502 lt!376663)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!463538 () Bool)

(assert (=> d!105957 (= lt!377092 e!463538)))

(declare-fun res!565853 () Bool)

(assert (=> d!105957 (=> (not res!565853) (not e!463538))))

(assert (=> d!105957 (= res!565853 ((_ is Cons!15940) (toList!4502 lt!376663)))))

(assert (=> d!105957 (= (contains!4188 (toList!4502 lt!376663) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377092)))

(declare-fun b!831288 () Bool)

(declare-fun e!463539 () Bool)

(assert (=> b!831288 (= e!463538 e!463539)))

(declare-fun res!565854 () Bool)

(assert (=> b!831288 (=> res!565854 e!463539)))

(assert (=> b!831288 (= res!565854 (= (h!17069 (toList!4502 lt!376663)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831289 () Bool)

(assert (=> b!831289 (= e!463539 (contains!4188 (t!22300 (toList!4502 lt!376663)) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105957 res!565853) b!831288))

(assert (= (and b!831288 (not res!565854)) b!831289))

(declare-fun m!774611 () Bool)

(assert (=> d!105957 m!774611))

(declare-fun m!774613 () Bool)

(assert (=> d!105957 m!774613))

(declare-fun m!774615 () Bool)

(assert (=> b!831289 m!774615))

(assert (=> b!830271 d!105957))

(declare-fun b!831290 () Bool)

(declare-fun e!463540 () Option!419)

(assert (=> b!831290 (= e!463540 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376538))))))))

(declare-fun b!831291 () Bool)

(declare-fun e!463541 () Option!419)

(assert (=> b!831291 (= e!463540 e!463541)))

(declare-fun c!90192 () Bool)

(assert (=> b!831291 (= c!90192 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376538))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376538)))) (_1!5091 lt!376417)))))))

(declare-fun b!831293 () Bool)

(assert (=> b!831293 (= e!463541 None!417)))

(declare-fun b!831292 () Bool)

(assert (=> b!831292 (= e!463541 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376538))) (_1!5091 lt!376417)))))

(declare-fun d!105959 () Bool)

(declare-fun c!90191 () Bool)

(assert (=> d!105959 (= c!90191 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376538))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376538)))) (_1!5091 lt!376417))))))

(assert (=> d!105959 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376538)) (_1!5091 lt!376417)) e!463540)))

(assert (= (and d!105959 c!90191) b!831290))

(assert (= (and d!105959 (not c!90191)) b!831291))

(assert (= (and b!831291 c!90192) b!831292))

(assert (= (and b!831291 (not c!90192)) b!831293))

(declare-fun m!774617 () Bool)

(assert (=> b!831292 m!774617))

(assert (=> b!830465 d!105959))

(declare-fun d!105961 () Bool)

(assert (=> d!105961 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (v!10089 (getValueByKey!413 (toList!4502 lt!376602) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105197 d!105961))

(assert (=> d!105197 d!105817))

(declare-fun d!105963 () Bool)

(declare-fun res!565855 () Bool)

(declare-fun e!463542 () Bool)

(assert (=> d!105963 (=> res!565855 e!463542)))

(assert (=> d!105963 (= res!565855 (and ((_ is Cons!15940) (toList!4502 lt!376563)) (= (_1!5091 (h!17069 (toList!4502 lt!376563))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105963 (= (containsKey!399 (toList!4502 lt!376563) #b0000000000000000000000000000000000000000000000000000000000000000) e!463542)))

(declare-fun b!831294 () Bool)

(declare-fun e!463543 () Bool)

(assert (=> b!831294 (= e!463542 e!463543)))

(declare-fun res!565856 () Bool)

(assert (=> b!831294 (=> (not res!565856) (not e!463543))))

(assert (=> b!831294 (= res!565856 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376563))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376563))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15940) (toList!4502 lt!376563)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376563))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831295 () Bool)

(assert (=> b!831295 (= e!463543 (containsKey!399 (t!22300 (toList!4502 lt!376563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105963 (not res!565855)) b!831294))

(assert (= (and b!831294 res!565856) b!831295))

(declare-fun m!774619 () Bool)

(assert (=> b!831295 m!774619))

(assert (=> d!105229 d!105963))

(declare-fun d!105965 () Bool)

(declare-fun res!565857 () Bool)

(declare-fun e!463544 () Bool)

(assert (=> d!105965 (=> res!565857 e!463544)))

(assert (=> d!105965 (= res!565857 (and ((_ is Cons!15940) (toList!4502 lt!376517)) (= (_1!5091 (h!17069 (toList!4502 lt!376517))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105965 (= (containsKey!399 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463544)))

(declare-fun b!831296 () Bool)

(declare-fun e!463545 () Bool)

(assert (=> b!831296 (= e!463544 e!463545)))

(declare-fun res!565858 () Bool)

(assert (=> b!831296 (=> (not res!565858) (not e!463545))))

(assert (=> b!831296 (= res!565858 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376517))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376517))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15940) (toList!4502 lt!376517)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376517))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831297 () Bool)

(assert (=> b!831297 (= e!463545 (containsKey!399 (t!22300 (toList!4502 lt!376517)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105965 (not res!565857)) b!831296))

(assert (= (and b!831296 res!565858) b!831297))

(assert (=> b!831297 m!772595))

(declare-fun m!774621 () Bool)

(assert (=> b!831297 m!774621))

(assert (=> d!105389 d!105965))

(declare-fun d!105967 () Bool)

(assert (not d!105967))

(assert (=> b!830258 d!105967))

(declare-fun b!831298 () Bool)

(declare-fun e!463546 () Option!419)

(assert (=> b!831298 (= e!463546 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376540)))))))

(declare-fun b!831299 () Bool)

(declare-fun e!463547 () Option!419)

(assert (=> b!831299 (= e!463546 e!463547)))

(declare-fun c!90194 () Bool)

(assert (=> b!831299 (= c!90194 (and ((_ is Cons!15940) (t!22300 lt!376540)) (not (= (_1!5091 (h!17069 (t!22300 lt!376540))) (_1!5091 lt!376417)))))))

(declare-fun b!831301 () Bool)

(assert (=> b!831301 (= e!463547 None!417)))

(declare-fun b!831300 () Bool)

(assert (=> b!831300 (= e!463547 (getValueByKey!413 (t!22300 (t!22300 lt!376540)) (_1!5091 lt!376417)))))

(declare-fun d!105969 () Bool)

(declare-fun c!90193 () Bool)

(assert (=> d!105969 (= c!90193 (and ((_ is Cons!15940) (t!22300 lt!376540)) (= (_1!5091 (h!17069 (t!22300 lt!376540))) (_1!5091 lt!376417))))))

(assert (=> d!105969 (= (getValueByKey!413 (t!22300 lt!376540) (_1!5091 lt!376417)) e!463546)))

(assert (= (and d!105969 c!90193) b!831298))

(assert (= (and d!105969 (not c!90193)) b!831299))

(assert (= (and b!831299 c!90194) b!831300))

(assert (= (and b!831299 (not c!90194)) b!831301))

(declare-fun m!774623 () Bool)

(assert (=> b!831300 m!774623))

(assert (=> b!830409 d!105969))

(assert (=> b!830433 d!105777))

(assert (=> b!830433 d!105779))

(declare-fun d!105971 () Bool)

(assert (=> d!105971 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376523) lt!376522)) (v!10089 (getValueByKey!413 (toList!4502 lt!376523) lt!376522)))))

(assert (=> d!105285 d!105971))

(declare-fun b!831302 () Bool)

(declare-fun e!463548 () Option!419)

(assert (=> b!831302 (= e!463548 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376523)))))))

(declare-fun b!831303 () Bool)

(declare-fun e!463549 () Option!419)

(assert (=> b!831303 (= e!463548 e!463549)))

(declare-fun c!90196 () Bool)

(assert (=> b!831303 (= c!90196 (and ((_ is Cons!15940) (toList!4502 lt!376523)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376523))) lt!376522))))))

(declare-fun b!831305 () Bool)

(assert (=> b!831305 (= e!463549 None!417)))

(declare-fun b!831304 () Bool)

(assert (=> b!831304 (= e!463549 (getValueByKey!413 (t!22300 (toList!4502 lt!376523)) lt!376522))))

(declare-fun d!105973 () Bool)

(declare-fun c!90195 () Bool)

(assert (=> d!105973 (= c!90195 (and ((_ is Cons!15940) (toList!4502 lt!376523)) (= (_1!5091 (h!17069 (toList!4502 lt!376523))) lt!376522)))))

(assert (=> d!105973 (= (getValueByKey!413 (toList!4502 lt!376523) lt!376522) e!463548)))

(assert (= (and d!105973 c!90195) b!831302))

(assert (= (and d!105973 (not c!90195)) b!831303))

(assert (= (and b!831303 c!90196) b!831304))

(assert (= (and b!831303 (not c!90196)) b!831305))

(declare-fun m!774625 () Bool)

(assert (=> b!831304 m!774625))

(assert (=> d!105285 d!105973))

(declare-fun d!105975 () Bool)

(declare-fun res!565859 () Bool)

(declare-fun e!463550 () Bool)

(assert (=> d!105975 (=> res!565859 e!463550)))

(assert (=> d!105975 (= res!565859 (or ((_ is Nil!15941) lt!376844) ((_ is Nil!15941) (t!22300 lt!376844))))))

(assert (=> d!105975 (= (isStrictlySorted!437 lt!376844) e!463550)))

(declare-fun b!831306 () Bool)

(declare-fun e!463551 () Bool)

(assert (=> b!831306 (= e!463550 e!463551)))

(declare-fun res!565860 () Bool)

(assert (=> b!831306 (=> (not res!565860) (not e!463551))))

(assert (=> b!831306 (= res!565860 (bvslt (_1!5091 (h!17069 lt!376844)) (_1!5091 (h!17069 (t!22300 lt!376844)))))))

(declare-fun b!831307 () Bool)

(assert (=> b!831307 (= e!463551 (isStrictlySorted!437 (t!22300 lt!376844)))))

(assert (= (and d!105975 (not res!565859)) b!831306))

(assert (= (and b!831306 res!565860) b!831307))

(declare-fun m!774627 () Bool)

(assert (=> b!831307 m!774627))

(assert (=> d!105387 d!105975))

(declare-fun d!105977 () Bool)

(declare-fun res!565861 () Bool)

(declare-fun e!463552 () Bool)

(assert (=> d!105977 (=> res!565861 e!463552)))

(assert (=> d!105977 (= res!565861 (or ((_ is Nil!15941) (toList!4502 (+!2010 lt!376414 lt!376417))) ((_ is Nil!15941) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417))))))))

(assert (=> d!105977 (= (isStrictlySorted!437 (toList!4502 (+!2010 lt!376414 lt!376417))) e!463552)))

(declare-fun b!831308 () Bool)

(declare-fun e!463553 () Bool)

(assert (=> b!831308 (= e!463552 e!463553)))

(declare-fun res!565862 () Bool)

(assert (=> b!831308 (=> (not res!565862) (not e!463553))))

(assert (=> b!831308 (= res!565862 (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376414 lt!376417)))) (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))))))))

(declare-fun b!831309 () Bool)

(assert (=> b!831309 (= e!463553 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376417)))))))

(assert (= (and d!105977 (not res!565861)) b!831308))

(assert (= (and b!831308 res!565862) b!831309))

(assert (=> b!831309 m!773609))

(assert (=> d!105387 d!105977))

(declare-fun d!105979 () Bool)

(declare-fun e!463554 () Bool)

(assert (=> d!105979 e!463554))

(declare-fun res!565863 () Bool)

(assert (=> d!105979 (=> res!565863 e!463554)))

(declare-fun lt!377096 () Bool)

(assert (=> d!105979 (= res!565863 (not lt!377096))))

(declare-fun lt!377095 () Bool)

(assert (=> d!105979 (= lt!377096 lt!377095)))

(declare-fun lt!377094 () Unit!28383)

(declare-fun e!463555 () Unit!28383)

(assert (=> d!105979 (= lt!377094 e!463555)))

(declare-fun c!90197 () Bool)

(assert (=> d!105979 (= c!90197 lt!377095)))

(assert (=> d!105979 (= lt!377095 (containsKey!399 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(assert (=> d!105979 (= (contains!4187 lt!376747 (_1!5091 (tuple2!10161 lt!376520 minValue!754))) lt!377096)))

(declare-fun b!831310 () Bool)

(declare-fun lt!377093 () Unit!28383)

(assert (=> b!831310 (= e!463555 lt!377093)))

(assert (=> b!831310 (= lt!377093 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(assert (=> b!831310 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun b!831311 () Bool)

(declare-fun Unit!28440 () Unit!28383)

(assert (=> b!831311 (= e!463555 Unit!28440)))

(declare-fun b!831312 () Bool)

(assert (=> b!831312 (= e!463554 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(assert (= (and d!105979 c!90197) b!831310))

(assert (= (and d!105979 (not c!90197)) b!831311))

(assert (= (and d!105979 (not res!565863)) b!831312))

(declare-fun m!774629 () Bool)

(assert (=> d!105979 m!774629))

(declare-fun m!774631 () Bool)

(assert (=> b!831310 m!774631))

(assert (=> b!831310 m!773169))

(assert (=> b!831310 m!773169))

(declare-fun m!774633 () Bool)

(assert (=> b!831310 m!774633))

(assert (=> b!831312 m!773169))

(assert (=> b!831312 m!773169))

(assert (=> b!831312 m!774633))

(assert (=> d!105275 d!105979))

(declare-fun b!831313 () Bool)

(declare-fun e!463556 () Option!419)

(assert (=> b!831313 (= e!463556 (Some!418 (_2!5091 (h!17069 lt!376745))))))

(declare-fun b!831314 () Bool)

(declare-fun e!463557 () Option!419)

(assert (=> b!831314 (= e!463556 e!463557)))

(declare-fun c!90199 () Bool)

(assert (=> b!831314 (= c!90199 (and ((_ is Cons!15940) lt!376745) (not (= (_1!5091 (h!17069 lt!376745)) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))))

(declare-fun b!831316 () Bool)

(assert (=> b!831316 (= e!463557 None!417)))

(declare-fun b!831315 () Bool)

(assert (=> b!831315 (= e!463557 (getValueByKey!413 (t!22300 lt!376745) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun c!90198 () Bool)

(declare-fun d!105981 () Bool)

(assert (=> d!105981 (= c!90198 (and ((_ is Cons!15940) lt!376745) (= (_1!5091 (h!17069 lt!376745)) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(assert (=> d!105981 (= (getValueByKey!413 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754))) e!463556)))

(assert (= (and d!105981 c!90198) b!831313))

(assert (= (and d!105981 (not c!90198)) b!831314))

(assert (= (and b!831314 c!90199) b!831315))

(assert (= (and b!831314 (not c!90199)) b!831316))

(declare-fun m!774635 () Bool)

(assert (=> b!831315 m!774635))

(assert (=> d!105275 d!105981))

(declare-fun d!105983 () Bool)

(assert (=> d!105983 (= (getValueByKey!413 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun lt!377097 () Unit!28383)

(assert (=> d!105983 (= lt!377097 (choose!1426 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun e!463558 () Bool)

(assert (=> d!105983 e!463558))

(declare-fun res!565864 () Bool)

(assert (=> d!105983 (=> (not res!565864) (not e!463558))))

(assert (=> d!105983 (= res!565864 (isStrictlySorted!437 lt!376745))))

(assert (=> d!105983 (= (lemmaContainsTupThenGetReturnValue!230 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))) lt!377097)))

(declare-fun b!831317 () Bool)

(declare-fun res!565865 () Bool)

(assert (=> b!831317 (=> (not res!565865) (not e!463558))))

(assert (=> b!831317 (= res!565865 (containsKey!399 lt!376745 (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun b!831318 () Bool)

(assert (=> b!831318 (= e!463558 (contains!4188 lt!376745 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(assert (= (and d!105983 res!565864) b!831317))

(assert (= (and b!831317 res!565865) b!831318))

(assert (=> d!105983 m!773163))

(declare-fun m!774637 () Bool)

(assert (=> d!105983 m!774637))

(declare-fun m!774639 () Bool)

(assert (=> d!105983 m!774639))

(declare-fun m!774641 () Bool)

(assert (=> b!831317 m!774641))

(declare-fun m!774643 () Bool)

(assert (=> b!831318 m!774643))

(assert (=> d!105275 d!105983))

(declare-fun b!831319 () Bool)

(declare-fun res!565866 () Bool)

(declare-fun e!463560 () Bool)

(assert (=> b!831319 (=> (not res!565866) (not e!463560))))

(declare-fun lt!377098 () List!15944)

(assert (=> b!831319 (= res!565866 (containsKey!399 lt!377098 (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun c!90200 () Bool)

(declare-fun e!463562 () List!15944)

(declare-fun c!90202 () Bool)

(declare-fun b!831320 () Bool)

(assert (=> b!831320 (= e!463562 (ite c!90202 (t!22300 (toList!4502 lt!376521)) (ite c!90200 (Cons!15940 (h!17069 (toList!4502 lt!376521)) (t!22300 (toList!4502 lt!376521))) Nil!15941)))))

(declare-fun b!831321 () Bool)

(assert (=> b!831321 (= c!90200 (and ((_ is Cons!15940) (toList!4502 lt!376521)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376521))) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(declare-fun e!463559 () List!15944)

(declare-fun e!463561 () List!15944)

(assert (=> b!831321 (= e!463559 e!463561)))

(declare-fun b!831322 () Bool)

(assert (=> b!831322 (= e!463562 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376521)) (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun b!831323 () Bool)

(declare-fun e!463563 () List!15944)

(declare-fun call!36315 () List!15944)

(assert (=> b!831323 (= e!463563 call!36315)))

(declare-fun b!831324 () Bool)

(declare-fun call!36317 () List!15944)

(assert (=> b!831324 (= e!463559 call!36317)))

(declare-fun b!831325 () Bool)

(declare-fun call!36316 () List!15944)

(assert (=> b!831325 (= e!463561 call!36316)))

(declare-fun bm!36312 () Bool)

(assert (=> bm!36312 (= call!36316 call!36317)))

(declare-fun b!831326 () Bool)

(assert (=> b!831326 (= e!463560 (contains!4188 lt!377098 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(declare-fun d!105985 () Bool)

(assert (=> d!105985 e!463560))

(declare-fun res!565867 () Bool)

(assert (=> d!105985 (=> (not res!565867) (not e!463560))))

(assert (=> d!105985 (= res!565867 (isStrictlySorted!437 lt!377098))))

(assert (=> d!105985 (= lt!377098 e!463563)))

(declare-fun c!90203 () Bool)

(assert (=> d!105985 (= c!90203 (and ((_ is Cons!15940) (toList!4502 lt!376521)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376521))) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(assert (=> d!105985 (isStrictlySorted!437 (toList!4502 lt!376521))))

(assert (=> d!105985 (= (insertStrictlySorted!269 (toList!4502 lt!376521) (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))) lt!377098)))

(declare-fun bm!36313 () Bool)

(assert (=> bm!36313 (= call!36317 call!36315)))

(declare-fun bm!36314 () Bool)

(assert (=> bm!36314 (= call!36315 ($colon$colon!535 e!463562 (ite c!90203 (h!17069 (toList!4502 lt!376521)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376520 minValue!754)) (_2!5091 (tuple2!10161 lt!376520 minValue!754))))))))

(declare-fun c!90201 () Bool)

(assert (=> bm!36314 (= c!90201 c!90203)))

(declare-fun b!831327 () Bool)

(assert (=> b!831327 (= e!463563 e!463559)))

(assert (=> b!831327 (= c!90202 (and ((_ is Cons!15940) (toList!4502 lt!376521)) (= (_1!5091 (h!17069 (toList!4502 lt!376521))) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(declare-fun b!831328 () Bool)

(assert (=> b!831328 (= e!463561 call!36316)))

(assert (= (and d!105985 c!90203) b!831323))

(assert (= (and d!105985 (not c!90203)) b!831327))

(assert (= (and b!831327 c!90202) b!831324))

(assert (= (and b!831327 (not c!90202)) b!831321))

(assert (= (and b!831321 c!90200) b!831328))

(assert (= (and b!831321 (not c!90200)) b!831325))

(assert (= (or b!831328 b!831325) bm!36312))

(assert (= (or b!831324 bm!36312) bm!36313))

(assert (= (or b!831323 bm!36313) bm!36314))

(assert (= (and bm!36314 c!90201) b!831322))

(assert (= (and bm!36314 (not c!90201)) b!831320))

(assert (= (and d!105985 res!565867) b!831319))

(assert (= (and b!831319 res!565866) b!831326))

(declare-fun m!774645 () Bool)

(assert (=> b!831319 m!774645))

(declare-fun m!774647 () Bool)

(assert (=> b!831326 m!774647))

(declare-fun m!774649 () Bool)

(assert (=> b!831322 m!774649))

(declare-fun m!774651 () Bool)

(assert (=> d!105985 m!774651))

(declare-fun m!774653 () Bool)

(assert (=> d!105985 m!774653))

(declare-fun m!774655 () Bool)

(assert (=> bm!36314 m!774655))

(assert (=> d!105275 d!105985))

(declare-fun d!105987 () Bool)

(declare-fun res!565868 () Bool)

(declare-fun e!463564 () Bool)

(assert (=> d!105987 (=> res!565868 e!463564)))

(assert (=> d!105987 (= res!565868 (and ((_ is Cons!15940) (toList!4502 lt!376538)) (= (_1!5091 (h!17069 (toList!4502 lt!376538))) (_1!5091 lt!376417))))))

(assert (=> d!105987 (= (containsKey!399 (toList!4502 lt!376538) (_1!5091 lt!376417)) e!463564)))

(declare-fun b!831329 () Bool)

(declare-fun e!463565 () Bool)

(assert (=> b!831329 (= e!463564 e!463565)))

(declare-fun res!565869 () Bool)

(assert (=> b!831329 (=> (not res!565869) (not e!463565))))

(assert (=> b!831329 (= res!565869 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376538))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376538))) (_1!5091 lt!376417))) ((_ is Cons!15940) (toList!4502 lt!376538)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376538))) (_1!5091 lt!376417))))))

(declare-fun b!831330 () Bool)

(assert (=> b!831330 (= e!463565 (containsKey!399 (t!22300 (toList!4502 lt!376538)) (_1!5091 lt!376417)))))

(assert (= (and d!105987 (not res!565868)) b!831329))

(assert (= (and b!831329 res!565869) b!831330))

(declare-fun m!774657 () Bool)

(assert (=> b!831330 m!774657))

(assert (=> d!105173 d!105987))

(declare-fun d!105989 () Bool)

(declare-fun lt!377099 () Bool)

(assert (=> d!105989 (= lt!377099 (select (content!385 lt!376536) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun e!463566 () Bool)

(assert (=> d!105989 (= lt!377099 e!463566)))

(declare-fun res!565870 () Bool)

(assert (=> d!105989 (=> (not res!565870) (not e!463566))))

(assert (=> d!105989 (= res!565870 ((_ is Cons!15940) lt!376536))))

(assert (=> d!105989 (= (contains!4188 lt!376536 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))) lt!377099)))

(declare-fun b!831331 () Bool)

(declare-fun e!463567 () Bool)

(assert (=> b!831331 (= e!463566 e!463567)))

(declare-fun res!565871 () Bool)

(assert (=> b!831331 (=> res!565871 e!463567)))

(assert (=> b!831331 (= res!565871 (= (h!17069 lt!376536) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun b!831332 () Bool)

(assert (=> b!831332 (= e!463567 (contains!4188 (t!22300 lt!376536) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(assert (= (and d!105989 res!565870) b!831331))

(assert (= (and b!831331 (not res!565871)) b!831332))

(declare-fun m!774659 () Bool)

(assert (=> d!105989 m!774659))

(declare-fun m!774661 () Bool)

(assert (=> d!105989 m!774661))

(declare-fun m!774663 () Bool)

(assert (=> b!831332 m!774663))

(assert (=> b!830200 d!105989))

(declare-fun d!105991 () Bool)

(declare-fun res!565872 () Bool)

(declare-fun e!463568 () Bool)

(assert (=> d!105991 (=> res!565872 e!463568)))

(assert (=> d!105991 (= res!565872 (and ((_ is Cons!15940) (toList!4502 lt!376542)) (= (_1!5091 (h!17069 (toList!4502 lt!376542))) (_1!5091 lt!376417))))))

(assert (=> d!105991 (= (containsKey!399 (toList!4502 lt!376542) (_1!5091 lt!376417)) e!463568)))

(declare-fun b!831333 () Bool)

(declare-fun e!463569 () Bool)

(assert (=> b!831333 (= e!463568 e!463569)))

(declare-fun res!565873 () Bool)

(assert (=> b!831333 (=> (not res!565873) (not e!463569))))

(assert (=> b!831333 (= res!565873 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376542))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376542))) (_1!5091 lt!376417))) ((_ is Cons!15940) (toList!4502 lt!376542)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376542))) (_1!5091 lt!376417))))))

(declare-fun b!831334 () Bool)

(assert (=> b!831334 (= e!463569 (containsKey!399 (t!22300 (toList!4502 lt!376542)) (_1!5091 lt!376417)))))

(assert (= (and d!105991 (not res!565872)) b!831333))

(assert (= (and b!831333 res!565873) b!831334))

(declare-fun m!774665 () Bool)

(assert (=> b!831334 m!774665))

(assert (=> d!105295 d!105991))

(declare-fun d!105993 () Bool)

(declare-fun res!565874 () Bool)

(declare-fun e!463570 () Bool)

(assert (=> d!105993 (=> res!565874 e!463570)))

(assert (=> d!105993 (= res!565874 (and ((_ is Cons!15940) lt!376844) (= (_1!5091 (h!17069 lt!376844)) (_1!5091 lt!376416))))))

(assert (=> d!105993 (= (containsKey!399 lt!376844 (_1!5091 lt!376416)) e!463570)))

(declare-fun b!831335 () Bool)

(declare-fun e!463571 () Bool)

(assert (=> b!831335 (= e!463570 e!463571)))

(declare-fun res!565875 () Bool)

(assert (=> b!831335 (=> (not res!565875) (not e!463571))))

(assert (=> b!831335 (= res!565875 (and (or (not ((_ is Cons!15940) lt!376844)) (bvsle (_1!5091 (h!17069 lt!376844)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376844) (bvslt (_1!5091 (h!17069 lt!376844)) (_1!5091 lt!376416))))))

(declare-fun b!831336 () Bool)

(assert (=> b!831336 (= e!463571 (containsKey!399 (t!22300 lt!376844) (_1!5091 lt!376416)))))

(assert (= (and d!105993 (not res!565874)) b!831335))

(assert (= (and b!831335 res!565875) b!831336))

(declare-fun m!774667 () Bool)

(assert (=> b!831336 m!774667))

(assert (=> b!830512 d!105993))

(assert (=> b!830399 d!105447))

(declare-fun d!105995 () Bool)

(declare-fun e!463572 () Bool)

(assert (=> d!105995 e!463572))

(declare-fun res!565876 () Bool)

(assert (=> d!105995 (=> res!565876 e!463572)))

(declare-fun lt!377103 () Bool)

(assert (=> d!105995 (= res!565876 (not lt!377103))))

(declare-fun lt!377102 () Bool)

(assert (=> d!105995 (= lt!377103 lt!377102)))

(declare-fun lt!377101 () Unit!28383)

(declare-fun e!463573 () Unit!28383)

(assert (=> d!105995 (= lt!377101 e!463573)))

(declare-fun c!90204 () Bool)

(assert (=> d!105995 (= c!90204 lt!377102)))

(assert (=> d!105995 (= lt!377102 (containsKey!399 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105995 (= (contains!4187 lt!376663 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377103)))

(declare-fun b!831337 () Bool)

(declare-fun lt!377100 () Unit!28383)

(assert (=> b!831337 (= e!463573 lt!377100)))

(assert (=> b!831337 (= lt!377100 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!831337 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831338 () Bool)

(declare-fun Unit!28441 () Unit!28383)

(assert (=> b!831338 (= e!463573 Unit!28441)))

(declare-fun b!831339 () Bool)

(assert (=> b!831339 (= e!463572 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105995 c!90204) b!831337))

(assert (= (and d!105995 (not c!90204)) b!831338))

(assert (= (and d!105995 (not res!565876)) b!831339))

(declare-fun m!774669 () Bool)

(assert (=> d!105995 m!774669))

(declare-fun m!774671 () Bool)

(assert (=> b!831337 m!774671))

(assert (=> b!831337 m!772913))

(assert (=> b!831337 m!772913))

(declare-fun m!774673 () Bool)

(assert (=> b!831337 m!774673))

(assert (=> b!831339 m!772913))

(assert (=> b!831339 m!772913))

(assert (=> b!831339 m!774673))

(assert (=> d!105205 d!105995))

(declare-fun b!831340 () Bool)

(declare-fun e!463574 () Option!419)

(assert (=> b!831340 (= e!463574 (Some!418 (_2!5091 (h!17069 lt!376661))))))

(declare-fun b!831341 () Bool)

(declare-fun e!463575 () Option!419)

(assert (=> b!831341 (= e!463574 e!463575)))

(declare-fun c!90206 () Bool)

(assert (=> b!831341 (= c!90206 (and ((_ is Cons!15940) lt!376661) (not (= (_1!5091 (h!17069 lt!376661)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831343 () Bool)

(assert (=> b!831343 (= e!463575 None!417)))

(declare-fun b!831342 () Bool)

(assert (=> b!831342 (= e!463575 (getValueByKey!413 (t!22300 lt!376661) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!105997 () Bool)

(declare-fun c!90205 () Bool)

(assert (=> d!105997 (= c!90205 (and ((_ is Cons!15940) lt!376661) (= (_1!5091 (h!17069 lt!376661)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105997 (= (getValueByKey!413 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463574)))

(assert (= (and d!105997 c!90205) b!831340))

(assert (= (and d!105997 (not c!90205)) b!831341))

(assert (= (and b!831341 c!90206) b!831342))

(assert (= (and b!831341 (not c!90206)) b!831343))

(declare-fun m!774675 () Bool)

(assert (=> b!831342 m!774675))

(assert (=> d!105205 d!105997))

(declare-fun d!105999 () Bool)

(assert (=> d!105999 (= (getValueByKey!413 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377104 () Unit!28383)

(assert (=> d!105999 (= lt!377104 (choose!1426 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463576 () Bool)

(assert (=> d!105999 e!463576))

(declare-fun res!565877 () Bool)

(assert (=> d!105999 (=> (not res!565877) (not e!463576))))

(assert (=> d!105999 (= res!565877 (isStrictlySorted!437 lt!376661))))

(assert (=> d!105999 (= (lemmaContainsTupThenGetReturnValue!230 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377104)))

(declare-fun b!831344 () Bool)

(declare-fun res!565878 () Bool)

(assert (=> b!831344 (=> (not res!565878) (not e!463576))))

(assert (=> b!831344 (= res!565878 (containsKey!399 lt!376661 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831345 () Bool)

(assert (=> b!831345 (= e!463576 (contains!4188 lt!376661 (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!105999 res!565877) b!831344))

(assert (= (and b!831344 res!565878) b!831345))

(assert (=> d!105999 m!772907))

(declare-fun m!774677 () Bool)

(assert (=> d!105999 m!774677))

(declare-fun m!774679 () Bool)

(assert (=> d!105999 m!774679))

(declare-fun m!774681 () Bool)

(assert (=> b!831344 m!774681))

(declare-fun m!774683 () Bool)

(assert (=> b!831345 m!774683))

(assert (=> d!105205 d!105999))

(declare-fun b!831346 () Bool)

(declare-fun res!565879 () Bool)

(declare-fun e!463578 () Bool)

(assert (=> b!831346 (=> (not res!565879) (not e!463578))))

(declare-fun lt!377105 () List!15944)

(assert (=> b!831346 (= res!565879 (containsKey!399 lt!377105 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun c!90207 () Bool)

(declare-fun c!90209 () Bool)

(declare-fun b!831347 () Bool)

(declare-fun e!463580 () List!15944)

(assert (=> b!831347 (= e!463580 (ite c!90209 (t!22300 (toList!4502 call!36221)) (ite c!90207 (Cons!15940 (h!17069 (toList!4502 call!36221)) (t!22300 (toList!4502 call!36221))) Nil!15941)))))

(declare-fun b!831348 () Bool)

(assert (=> b!831348 (= c!90207 (and ((_ is Cons!15940) (toList!4502 call!36221)) (bvsgt (_1!5091 (h!17069 (toList!4502 call!36221))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463577 () List!15944)

(declare-fun e!463579 () List!15944)

(assert (=> b!831348 (= e!463577 e!463579)))

(declare-fun b!831349 () Bool)

(assert (=> b!831349 (= e!463580 (insertStrictlySorted!269 (t!22300 (toList!4502 call!36221)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831350 () Bool)

(declare-fun e!463581 () List!15944)

(declare-fun call!36318 () List!15944)

(assert (=> b!831350 (= e!463581 call!36318)))

(declare-fun b!831351 () Bool)

(declare-fun call!36320 () List!15944)

(assert (=> b!831351 (= e!463577 call!36320)))

(declare-fun b!831352 () Bool)

(declare-fun call!36319 () List!15944)

(assert (=> b!831352 (= e!463579 call!36319)))

(declare-fun bm!36315 () Bool)

(assert (=> bm!36315 (= call!36319 call!36320)))

(declare-fun b!831353 () Bool)

(assert (=> b!831353 (= e!463578 (contains!4188 lt!377105 (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!106001 () Bool)

(assert (=> d!106001 e!463578))

(declare-fun res!565880 () Bool)

(assert (=> d!106001 (=> (not res!565880) (not e!463578))))

(assert (=> d!106001 (= res!565880 (isStrictlySorted!437 lt!377105))))

(assert (=> d!106001 (= lt!377105 e!463581)))

(declare-fun c!90210 () Bool)

(assert (=> d!106001 (= c!90210 (and ((_ is Cons!15940) (toList!4502 call!36221)) (bvslt (_1!5091 (h!17069 (toList!4502 call!36221))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106001 (isStrictlySorted!437 (toList!4502 call!36221))))

(assert (=> d!106001 (= (insertStrictlySorted!269 (toList!4502 call!36221) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377105)))

(declare-fun bm!36316 () Bool)

(assert (=> bm!36316 (= call!36320 call!36318)))

(declare-fun bm!36317 () Bool)

(assert (=> bm!36317 (= call!36318 ($colon$colon!535 e!463580 (ite c!90210 (h!17069 (toList!4502 call!36221)) (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90208 () Bool)

(assert (=> bm!36317 (= c!90208 c!90210)))

(declare-fun b!831354 () Bool)

(assert (=> b!831354 (= e!463581 e!463577)))

(assert (=> b!831354 (= c!90209 (and ((_ is Cons!15940) (toList!4502 call!36221)) (= (_1!5091 (h!17069 (toList!4502 call!36221))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831355 () Bool)

(assert (=> b!831355 (= e!463579 call!36319)))

(assert (= (and d!106001 c!90210) b!831350))

(assert (= (and d!106001 (not c!90210)) b!831354))

(assert (= (and b!831354 c!90209) b!831351))

(assert (= (and b!831354 (not c!90209)) b!831348))

(assert (= (and b!831348 c!90207) b!831355))

(assert (= (and b!831348 (not c!90207)) b!831352))

(assert (= (or b!831355 b!831352) bm!36315))

(assert (= (or b!831351 bm!36315) bm!36316))

(assert (= (or b!831350 bm!36316) bm!36317))

(assert (= (and bm!36317 c!90208) b!831349))

(assert (= (and bm!36317 (not c!90208)) b!831347))

(assert (= (and d!106001 res!565880) b!831346))

(assert (= (and b!831346 res!565879) b!831353))

(declare-fun m!774685 () Bool)

(assert (=> b!831346 m!774685))

(declare-fun m!774687 () Bool)

(assert (=> b!831353 m!774687))

(declare-fun m!774689 () Bool)

(assert (=> b!831349 m!774689))

(declare-fun m!774691 () Bool)

(assert (=> d!106001 m!774691))

(declare-fun m!774693 () Bool)

(assert (=> d!106001 m!774693))

(declare-fun m!774695 () Bool)

(assert (=> bm!36317 m!774695))

(assert (=> d!105205 d!106001))

(declare-fun d!106003 () Bool)

(declare-fun res!565881 () Bool)

(declare-fun e!463582 () Bool)

(assert (=> d!106003 (=> res!565881 e!463582)))

(assert (=> d!106003 (= res!565881 (and ((_ is Cons!15940) (toList!4502 lt!376595)) (= (_1!5091 (h!17069 (toList!4502 lt!376595))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106003 (= (containsKey!399 (toList!4502 lt!376595) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)) e!463582)))

(declare-fun b!831356 () Bool)

(declare-fun e!463583 () Bool)

(assert (=> b!831356 (= e!463582 e!463583)))

(declare-fun res!565882 () Bool)

(assert (=> b!831356 (=> (not res!565882) (not e!463583))))

(assert (=> b!831356 (= res!565882 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376595))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376595))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15940) (toList!4502 lt!376595)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376595))) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831357 () Bool)

(assert (=> b!831357 (= e!463583 (containsKey!399 (t!22300 (toList!4502 lt!376595)) (select (arr!22314 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106003 (not res!565881)) b!831356))

(assert (= (and b!831356 res!565882) b!831357))

(assert (=> b!831357 m!772595))

(declare-fun m!774697 () Bool)

(assert (=> b!831357 m!774697))

(assert (=> d!105317 d!106003))

(assert (=> b!830352 d!105809))

(assert (=> b!830352 d!105811))

(assert (=> b!830269 d!105815))

(assert (=> b!830269 d!105817))

(declare-fun b!831358 () Bool)

(declare-fun e!463584 () Option!419)

(assert (=> b!831358 (= e!463584 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376747)))))))

(declare-fun b!831359 () Bool)

(declare-fun e!463585 () Option!419)

(assert (=> b!831359 (= e!463584 e!463585)))

(declare-fun c!90212 () Bool)

(assert (=> b!831359 (= c!90212 (and ((_ is Cons!15940) (toList!4502 lt!376747)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376747))) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))))

(declare-fun b!831361 () Bool)

(assert (=> b!831361 (= e!463585 None!417)))

(declare-fun b!831360 () Bool)

(assert (=> b!831360 (= e!463585 (getValueByKey!413 (t!22300 (toList!4502 lt!376747)) (_1!5091 (tuple2!10161 lt!376520 minValue!754))))))

(declare-fun c!90211 () Bool)

(declare-fun d!106005 () Bool)

(assert (=> d!106005 (= c!90211 (and ((_ is Cons!15940) (toList!4502 lt!376747)) (= (_1!5091 (h!17069 (toList!4502 lt!376747))) (_1!5091 (tuple2!10161 lt!376520 minValue!754)))))))

(assert (=> d!106005 (= (getValueByKey!413 (toList!4502 lt!376747) (_1!5091 (tuple2!10161 lt!376520 minValue!754))) e!463584)))

(assert (= (and d!106005 c!90211) b!831358))

(assert (= (and d!106005 (not c!90211)) b!831359))

(assert (= (and b!831359 c!90212) b!831360))

(assert (= (and b!831359 (not c!90212)) b!831361))

(declare-fun m!774699 () Bool)

(assert (=> b!831360 m!774699))

(assert (=> b!830382 d!106005))

(declare-fun d!106007 () Bool)

(declare-fun lt!377106 () Bool)

(assert (=> d!106007 (= lt!377106 (select (content!385 (toList!4502 lt!376803)) (tuple2!10161 lt!376558 minValue!754)))))

(declare-fun e!463586 () Bool)

(assert (=> d!106007 (= lt!377106 e!463586)))

(declare-fun res!565883 () Bool)

(assert (=> d!106007 (=> (not res!565883) (not e!463586))))

(assert (=> d!106007 (= res!565883 ((_ is Cons!15940) (toList!4502 lt!376803)))))

(assert (=> d!106007 (= (contains!4188 (toList!4502 lt!376803) (tuple2!10161 lt!376558 minValue!754)) lt!377106)))

(declare-fun b!831362 () Bool)

(declare-fun e!463587 () Bool)

(assert (=> b!831362 (= e!463586 e!463587)))

(declare-fun res!565884 () Bool)

(assert (=> b!831362 (=> res!565884 e!463587)))

(assert (=> b!831362 (= res!565884 (= (h!17069 (toList!4502 lt!376803)) (tuple2!10161 lt!376558 minValue!754)))))

(declare-fun b!831363 () Bool)

(assert (=> b!831363 (= e!463587 (contains!4188 (t!22300 (toList!4502 lt!376803)) (tuple2!10161 lt!376558 minValue!754)))))

(assert (= (and d!106007 res!565883) b!831362))

(assert (= (and b!831362 (not res!565884)) b!831363))

(declare-fun m!774701 () Bool)

(assert (=> d!106007 m!774701))

(declare-fun m!774703 () Bool)

(assert (=> d!106007 m!774703))

(declare-fun m!774705 () Bool)

(assert (=> b!831363 m!774705))

(assert (=> b!830446 d!106007))

(declare-fun d!106009 () Bool)

(declare-fun lt!377107 () Bool)

(assert (=> d!106009 (= lt!377107 (select (content!385 lt!376844) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463588 () Bool)

(assert (=> d!106009 (= lt!377107 e!463588)))

(declare-fun res!565885 () Bool)

(assert (=> d!106009 (=> (not res!565885) (not e!463588))))

(assert (=> d!106009 (= res!565885 ((_ is Cons!15940) lt!376844))))

(assert (=> d!106009 (= (contains!4188 lt!376844 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!377107)))

(declare-fun b!831364 () Bool)

(declare-fun e!463589 () Bool)

(assert (=> b!831364 (= e!463588 e!463589)))

(declare-fun res!565886 () Bool)

(assert (=> b!831364 (=> res!565886 e!463589)))

(assert (=> b!831364 (= res!565886 (= (h!17069 lt!376844) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!831365 () Bool)

(assert (=> b!831365 (= e!463589 (contains!4188 (t!22300 lt!376844) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!106009 res!565885) b!831364))

(assert (= (and b!831364 (not res!565886)) b!831365))

(declare-fun m!774707 () Bool)

(assert (=> d!106009 m!774707))

(declare-fun m!774709 () Bool)

(assert (=> d!106009 m!774709))

(declare-fun m!774711 () Bool)

(assert (=> b!831365 m!774711))

(assert (=> b!830519 d!106009))

(declare-fun d!106011 () Bool)

(assert (=> d!106011 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))) (v!10089 (getValueByKey!413 (toList!4502 lt!376517) (select (arr!22314 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105355 d!106011))

(assert (=> d!105355 d!105553))

(declare-fun b!831366 () Bool)

(declare-fun e!463590 () Option!419)

(assert (=> b!831366 (= e!463590 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376663)))))))

(declare-fun b!831367 () Bool)

(declare-fun e!463591 () Option!419)

(assert (=> b!831367 (= e!463590 e!463591)))

(declare-fun c!90214 () Bool)

(assert (=> b!831367 (= c!90214 (and ((_ is Cons!15940) (toList!4502 lt!376663)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376663))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831369 () Bool)

(assert (=> b!831369 (= e!463591 None!417)))

(declare-fun b!831368 () Bool)

(assert (=> b!831368 (= e!463591 (getValueByKey!413 (t!22300 (toList!4502 lt!376663)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106013 () Bool)

(declare-fun c!90213 () Bool)

(assert (=> d!106013 (= c!90213 (and ((_ is Cons!15940) (toList!4502 lt!376663)) (= (_1!5091 (h!17069 (toList!4502 lt!376663))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106013 (= (getValueByKey!413 (toList!4502 lt!376663) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463590)))

(assert (= (and d!106013 c!90213) b!831366))

(assert (= (and d!106013 (not c!90213)) b!831367))

(assert (= (and b!831367 c!90214) b!831368))

(assert (= (and b!831367 (not c!90214)) b!831369))

(declare-fun m!774713 () Bool)

(assert (=> b!831368 m!774713))

(assert (=> b!830270 d!106013))

(assert (=> d!105265 d!105263))

(assert (=> d!105265 d!105281))

(declare-fun d!106015 () Bool)

(assert (=> d!106015 (contains!4187 (+!2010 lt!376510 (tuple2!10161 lt!376524 zeroValueAfter!34)) lt!376525)))

(assert (=> d!106015 true))

(declare-fun _$35!425 () Unit!28383)

(assert (=> d!106015 (= (choose!1428 lt!376510 lt!376524 zeroValueAfter!34 lt!376525) _$35!425)))

(declare-fun bs!23220 () Bool)

(assert (= bs!23220 d!106015))

(assert (=> bs!23220 m!772601))

(assert (=> bs!23220 m!772601))

(assert (=> bs!23220 m!772603))

(assert (=> d!105265 d!106015))

(declare-fun d!106017 () Bool)

(declare-fun e!463592 () Bool)

(assert (=> d!106017 e!463592))

(declare-fun res!565887 () Bool)

(assert (=> d!106017 (=> res!565887 e!463592)))

(declare-fun lt!377111 () Bool)

(assert (=> d!106017 (= res!565887 (not lt!377111))))

(declare-fun lt!377110 () Bool)

(assert (=> d!106017 (= lt!377111 lt!377110)))

(declare-fun lt!377109 () Unit!28383)

(declare-fun e!463593 () Unit!28383)

(assert (=> d!106017 (= lt!377109 e!463593)))

(declare-fun c!90215 () Bool)

(assert (=> d!106017 (= c!90215 lt!377110)))

(assert (=> d!106017 (= lt!377110 (containsKey!399 (toList!4502 lt!376510) lt!376525))))

(assert (=> d!106017 (= (contains!4187 lt!376510 lt!376525) lt!377111)))

(declare-fun b!831370 () Bool)

(declare-fun lt!377108 () Unit!28383)

(assert (=> b!831370 (= e!463593 lt!377108)))

(assert (=> b!831370 (= lt!377108 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376510) lt!376525))))

(assert (=> b!831370 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376510) lt!376525))))

(declare-fun b!831371 () Bool)

(declare-fun Unit!28442 () Unit!28383)

(assert (=> b!831371 (= e!463593 Unit!28442)))

(declare-fun b!831372 () Bool)

(assert (=> b!831372 (= e!463592 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376510) lt!376525)))))

(assert (= (and d!106017 c!90215) b!831370))

(assert (= (and d!106017 (not c!90215)) b!831371))

(assert (= (and d!106017 (not res!565887)) b!831372))

(declare-fun m!774715 () Bool)

(assert (=> d!106017 m!774715))

(declare-fun m!774717 () Bool)

(assert (=> b!831370 m!774717))

(declare-fun m!774719 () Bool)

(assert (=> b!831370 m!774719))

(assert (=> b!831370 m!774719))

(declare-fun m!774721 () Bool)

(assert (=> b!831370 m!774721))

(assert (=> b!831372 m!774719))

(assert (=> b!831372 m!774719))

(assert (=> b!831372 m!774721))

(assert (=> d!105265 d!106017))

(declare-fun d!106019 () Bool)

(assert (=> d!106019 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(declare-fun lt!377112 () Unit!28383)

(assert (=> d!106019 (= lt!377112 (choose!1430 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(declare-fun e!463594 () Bool)

(assert (=> d!106019 e!463594))

(declare-fun res!565888 () Bool)

(assert (=> d!106019 (=> (not res!565888) (not e!463594))))

(assert (=> d!106019 (= res!565888 (isStrictlySorted!437 (toList!4502 lt!376550)))))

(assert (=> d!106019 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376550) (_1!5091 lt!376416)) lt!377112)))

(declare-fun b!831373 () Bool)

(assert (=> b!831373 (= e!463594 (containsKey!399 (toList!4502 lt!376550) (_1!5091 lt!376416)))))

(assert (= (and d!106019 res!565888) b!831373))

(assert (=> d!106019 m!772677))

(assert (=> d!106019 m!772677))

(assert (=> d!106019 m!773461))

(declare-fun m!774723 () Bool)

(assert (=> d!106019 m!774723))

(declare-fun m!774725 () Bool)

(assert (=> d!106019 m!774725))

(assert (=> b!831373 m!773457))

(assert (=> b!830481 d!106019))

(assert (=> b!830481 d!105511))

(assert (=> b!830481 d!105363))

(declare-fun b!831374 () Bool)

(declare-fun e!463595 () Option!419)

(assert (=> b!831374 (= e!463595 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376712)))))))

(declare-fun b!831375 () Bool)

(declare-fun e!463596 () Option!419)

(assert (=> b!831375 (= e!463595 e!463596)))

(declare-fun c!90217 () Bool)

(assert (=> b!831375 (= c!90217 (and ((_ is Cons!15940) (toList!4502 lt!376712)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376712))) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))))

(declare-fun b!831377 () Bool)

(assert (=> b!831377 (= e!463596 None!417)))

(declare-fun b!831376 () Bool)

(assert (=> b!831376 (= e!463596 (getValueByKey!413 (t!22300 (toList!4502 lt!376712)) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun c!90216 () Bool)

(declare-fun d!106021 () Bool)

(assert (=> d!106021 (= c!90216 (and ((_ is Cons!15940) (toList!4502 lt!376712)) (= (_1!5091 (h!17069 (toList!4502 lt!376712))) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (=> d!106021 (= (getValueByKey!413 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598))) e!463595)))

(assert (= (and d!106021 c!90216) b!831374))

(assert (= (and d!106021 (not c!90216)) b!831375))

(assert (= (and b!831375 c!90217) b!831376))

(assert (= (and b!831375 (not c!90217)) b!831377))

(declare-fun m!774727 () Bool)

(assert (=> b!831376 m!774727))

(assert (=> b!830348 d!106021))

(declare-fun b!831378 () Bool)

(declare-fun e!463597 () Option!419)

(assert (=> b!831378 (= e!463597 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376655)))))))

(declare-fun b!831379 () Bool)

(declare-fun e!463598 () Option!419)

(assert (=> b!831379 (= e!463597 e!463598)))

(declare-fun c!90219 () Bool)

(assert (=> b!831379 (= c!90219 (and ((_ is Cons!15940) (toList!4502 lt!376655)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376655))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831381 () Bool)

(assert (=> b!831381 (= e!463598 None!417)))

(declare-fun b!831380 () Bool)

(assert (=> b!831380 (= e!463598 (getValueByKey!413 (t!22300 (toList!4502 lt!376655)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106023 () Bool)

(declare-fun c!90218 () Bool)

(assert (=> d!106023 (= c!90218 (and ((_ is Cons!15940) (toList!4502 lt!376655)) (= (_1!5091 (h!17069 (toList!4502 lt!376655))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106023 (= (getValueByKey!413 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463597)))

(assert (= (and d!106023 c!90218) b!831378))

(assert (= (and d!106023 (not c!90218)) b!831379))

(assert (= (and b!831379 c!90219) b!831380))

(assert (= (and b!831379 (not c!90219)) b!831381))

(declare-fun m!774729 () Bool)

(assert (=> b!831380 m!774729))

(assert (=> b!830265 d!106023))

(declare-fun d!106025 () Bool)

(declare-fun lt!377113 () Bool)

(assert (=> d!106025 (= lt!377113 (select (content!385 lt!376645) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463599 () Bool)

(assert (=> d!106025 (= lt!377113 e!463599)))

(declare-fun res!565889 () Bool)

(assert (=> d!106025 (=> (not res!565889) (not e!463599))))

(assert (=> d!106025 (= res!565889 ((_ is Cons!15940) lt!376645))))

(assert (=> d!106025 (= (contains!4188 lt!376645 (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377113)))

(declare-fun b!831382 () Bool)

(declare-fun e!463600 () Bool)

(assert (=> b!831382 (= e!463599 e!463600)))

(declare-fun res!565890 () Bool)

(assert (=> b!831382 (=> res!565890 e!463600)))

(assert (=> b!831382 (= res!565890 (= (h!17069 lt!376645) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831383 () Bool)

(assert (=> b!831383 (= e!463600 (contains!4188 (t!22300 lt!376645) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106025 res!565889) b!831382))

(assert (= (and b!831382 (not res!565890)) b!831383))

(declare-fun m!774731 () Bool)

(assert (=> d!106025 m!774731))

(declare-fun m!774733 () Bool)

(assert (=> d!106025 m!774733))

(declare-fun m!774735 () Bool)

(assert (=> b!831383 m!774735))

(assert (=> b!830247 d!106025))

(assert (=> b!830252 d!105859))

(assert (=> b!830252 d!105517))

(declare-fun d!106027 () Bool)

(declare-fun res!565891 () Bool)

(declare-fun e!463601 () Bool)

(assert (=> d!106027 (=> res!565891 e!463601)))

(assert (=> d!106027 (= res!565891 (or ((_ is Nil!15941) lt!376677) ((_ is Nil!15941) (t!22300 lt!376677))))))

(assert (=> d!106027 (= (isStrictlySorted!437 lt!376677) e!463601)))

(declare-fun b!831384 () Bool)

(declare-fun e!463602 () Bool)

(assert (=> b!831384 (= e!463601 e!463602)))

(declare-fun res!565892 () Bool)

(assert (=> b!831384 (=> (not res!565892) (not e!463602))))

(assert (=> b!831384 (= res!565892 (bvslt (_1!5091 (h!17069 lt!376677)) (_1!5091 (h!17069 (t!22300 lt!376677)))))))

(declare-fun b!831385 () Bool)

(assert (=> b!831385 (= e!463602 (isStrictlySorted!437 (t!22300 lt!376677)))))

(assert (= (and d!106027 (not res!565891)) b!831384))

(assert (= (and b!831384 res!565892) b!831385))

(declare-fun m!774737 () Bool)

(assert (=> b!831385 m!774737))

(assert (=> d!105217 d!106027))

(declare-fun d!106029 () Bool)

(declare-fun res!565893 () Bool)

(declare-fun e!463603 () Bool)

(assert (=> d!106029 (=> res!565893 e!463603)))

(assert (=> d!106029 (= res!565893 (or ((_ is Nil!15941) (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15941) (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!106029 (= (isStrictlySorted!437 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!463603)))

(declare-fun b!831386 () Bool)

(declare-fun e!463604 () Bool)

(assert (=> b!831386 (= e!463603 e!463604)))

(declare-fun res!565894 () Bool)

(assert (=> b!831386 (=> (not res!565894) (not e!463604))))

(assert (=> b!831386 (= res!565894 (bvslt (_1!5091 (h!17069 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!831387 () Bool)

(assert (=> b!831387 (= e!463604 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376419 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!106029 (not res!565893)) b!831386))

(assert (= (and b!831386 res!565894) b!831387))

(assert (=> b!831387 m!773701))

(assert (=> d!105217 d!106029))

(declare-fun d!106031 () Bool)

(assert (=> d!106031 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10089 (getValueByKey!413 (toList!4502 lt!376517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105219 d!106031))

(assert (=> d!105219 d!105901))

(declare-fun d!106033 () Bool)

(declare-fun e!463605 () Bool)

(assert (=> d!106033 e!463605))

(declare-fun res!565895 () Bool)

(assert (=> d!106033 (=> res!565895 e!463605)))

(declare-fun lt!377117 () Bool)

(assert (=> d!106033 (= res!565895 (not lt!377117))))

(declare-fun lt!377116 () Bool)

(assert (=> d!106033 (= lt!377117 lt!377116)))

(declare-fun lt!377115 () Unit!28383)

(declare-fun e!463606 () Unit!28383)

(assert (=> d!106033 (= lt!377115 e!463606)))

(declare-fun c!90220 () Bool)

(assert (=> d!106033 (= c!90220 lt!377116)))

(assert (=> d!106033 (= lt!377116 (containsKey!399 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(assert (=> d!106033 (= (contains!4187 lt!376712 (_1!5091 (tuple2!10161 lt!376600 lt!376598))) lt!377117)))

(declare-fun b!831388 () Bool)

(declare-fun lt!377114 () Unit!28383)

(assert (=> b!831388 (= e!463606 lt!377114)))

(assert (=> b!831388 (= lt!377114 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(assert (=> b!831388 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun b!831389 () Bool)

(declare-fun Unit!28443 () Unit!28383)

(assert (=> b!831389 (= e!463606 Unit!28443)))

(declare-fun b!831390 () Bool)

(assert (=> b!831390 (= e!463605 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376712) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (= (and d!106033 c!90220) b!831388))

(assert (= (and d!106033 (not c!90220)) b!831389))

(assert (= (and d!106033 (not res!565895)) b!831390))

(declare-fun m!774739 () Bool)

(assert (=> d!106033 m!774739))

(declare-fun m!774741 () Bool)

(assert (=> b!831388 m!774741))

(assert (=> b!831388 m!773065))

(assert (=> b!831388 m!773065))

(declare-fun m!774743 () Bool)

(assert (=> b!831388 m!774743))

(assert (=> b!831390 m!773065))

(assert (=> b!831390 m!773065))

(assert (=> b!831390 m!774743))

(assert (=> d!105243 d!106033))

(declare-fun b!831391 () Bool)

(declare-fun e!463607 () Option!419)

(assert (=> b!831391 (= e!463607 (Some!418 (_2!5091 (h!17069 lt!376710))))))

(declare-fun b!831392 () Bool)

(declare-fun e!463608 () Option!419)

(assert (=> b!831392 (= e!463607 e!463608)))

(declare-fun c!90222 () Bool)

(assert (=> b!831392 (= c!90222 (and ((_ is Cons!15940) lt!376710) (not (= (_1!5091 (h!17069 lt!376710)) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))))

(declare-fun b!831394 () Bool)

(assert (=> b!831394 (= e!463608 None!417)))

(declare-fun b!831393 () Bool)

(assert (=> b!831393 (= e!463608 (getValueByKey!413 (t!22300 lt!376710) (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun d!106035 () Bool)

(declare-fun c!90221 () Bool)

(assert (=> d!106035 (= c!90221 (and ((_ is Cons!15940) lt!376710) (= (_1!5091 (h!17069 lt!376710)) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (=> d!106035 (= (getValueByKey!413 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598))) e!463607)))

(assert (= (and d!106035 c!90221) b!831391))

(assert (= (and d!106035 (not c!90221)) b!831392))

(assert (= (and b!831392 c!90222) b!831393))

(assert (= (and b!831392 (not c!90222)) b!831394))

(declare-fun m!774745 () Bool)

(assert (=> b!831393 m!774745))

(assert (=> d!105243 d!106035))

(declare-fun d!106037 () Bool)

(assert (=> d!106037 (= (getValueByKey!413 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598))) (Some!418 (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun lt!377118 () Unit!28383)

(assert (=> d!106037 (= lt!377118 (choose!1426 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun e!463609 () Bool)

(assert (=> d!106037 e!463609))

(declare-fun res!565896 () Bool)

(assert (=> d!106037 (=> (not res!565896) (not e!463609))))

(assert (=> d!106037 (= res!565896 (isStrictlySorted!437 lt!376710))))

(assert (=> d!106037 (= (lemmaContainsTupThenGetReturnValue!230 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))) lt!377118)))

(declare-fun b!831395 () Bool)

(declare-fun res!565897 () Bool)

(assert (=> b!831395 (=> (not res!565897) (not e!463609))))

(assert (=> b!831395 (= res!565897 (containsKey!399 lt!376710 (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun b!831396 () Bool)

(assert (=> b!831396 (= e!463609 (contains!4188 lt!376710 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (= (and d!106037 res!565896) b!831395))

(assert (= (and b!831395 res!565897) b!831396))

(assert (=> d!106037 m!773059))

(declare-fun m!774747 () Bool)

(assert (=> d!106037 m!774747))

(declare-fun m!774749 () Bool)

(assert (=> d!106037 m!774749))

(declare-fun m!774751 () Bool)

(assert (=> b!831395 m!774751))

(declare-fun m!774753 () Bool)

(assert (=> b!831396 m!774753))

(assert (=> d!105243 d!106037))

(declare-fun b!831397 () Bool)

(declare-fun res!565898 () Bool)

(declare-fun e!463611 () Bool)

(assert (=> b!831397 (=> (not res!565898) (not e!463611))))

(declare-fun lt!377119 () List!15944)

(assert (=> b!831397 (= res!565898 (containsKey!399 lt!377119 (_1!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun e!463613 () List!15944)

(declare-fun c!90225 () Bool)

(declare-fun c!90223 () Bool)

(declare-fun b!831398 () Bool)

(assert (=> b!831398 (= e!463613 (ite c!90225 (t!22300 (toList!4502 lt!376599)) (ite c!90223 (Cons!15940 (h!17069 (toList!4502 lt!376599)) (t!22300 (toList!4502 lt!376599))) Nil!15941)))))

(declare-fun b!831399 () Bool)

(assert (=> b!831399 (= c!90223 (and ((_ is Cons!15940) (toList!4502 lt!376599)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376599))) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(declare-fun e!463610 () List!15944)

(declare-fun e!463612 () List!15944)

(assert (=> b!831399 (= e!463610 e!463612)))

(declare-fun b!831400 () Bool)

(assert (=> b!831400 (= e!463613 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376599)) (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))

(declare-fun b!831401 () Bool)

(declare-fun e!463614 () List!15944)

(declare-fun call!36321 () List!15944)

(assert (=> b!831401 (= e!463614 call!36321)))

(declare-fun b!831402 () Bool)

(declare-fun call!36323 () List!15944)

(assert (=> b!831402 (= e!463610 call!36323)))

(declare-fun b!831403 () Bool)

(declare-fun call!36322 () List!15944)

(assert (=> b!831403 (= e!463612 call!36322)))

(declare-fun bm!36318 () Bool)

(assert (=> bm!36318 (= call!36322 call!36323)))

(declare-fun b!831404 () Bool)

(assert (=> b!831404 (= e!463611 (contains!4188 lt!377119 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(declare-fun d!106039 () Bool)

(assert (=> d!106039 e!463611))

(declare-fun res!565899 () Bool)

(assert (=> d!106039 (=> (not res!565899) (not e!463611))))

(assert (=> d!106039 (= res!565899 (isStrictlySorted!437 lt!377119))))

(assert (=> d!106039 (= lt!377119 e!463614)))

(declare-fun c!90226 () Bool)

(assert (=> d!106039 (= c!90226 (and ((_ is Cons!15940) (toList!4502 lt!376599)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376599))) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(assert (=> d!106039 (isStrictlySorted!437 (toList!4502 lt!376599))))

(assert (=> d!106039 (= (insertStrictlySorted!269 (toList!4502 lt!376599) (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))) lt!377119)))

(declare-fun bm!36319 () Bool)

(assert (=> bm!36319 (= call!36323 call!36321)))

(declare-fun bm!36320 () Bool)

(assert (=> bm!36320 (= call!36321 ($colon$colon!535 e!463613 (ite c!90226 (h!17069 (toList!4502 lt!376599)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376600 lt!376598)) (_2!5091 (tuple2!10161 lt!376600 lt!376598))))))))

(declare-fun c!90224 () Bool)

(assert (=> bm!36320 (= c!90224 c!90226)))

(declare-fun b!831405 () Bool)

(assert (=> b!831405 (= e!463614 e!463610)))

(assert (=> b!831405 (= c!90225 (and ((_ is Cons!15940) (toList!4502 lt!376599)) (= (_1!5091 (h!17069 (toList!4502 lt!376599))) (_1!5091 (tuple2!10161 lt!376600 lt!376598)))))))

(declare-fun b!831406 () Bool)

(assert (=> b!831406 (= e!463612 call!36322)))

(assert (= (and d!106039 c!90226) b!831401))

(assert (= (and d!106039 (not c!90226)) b!831405))

(assert (= (and b!831405 c!90225) b!831402))

(assert (= (and b!831405 (not c!90225)) b!831399))

(assert (= (and b!831399 c!90223) b!831406))

(assert (= (and b!831399 (not c!90223)) b!831403))

(assert (= (or b!831406 b!831403) bm!36318))

(assert (= (or b!831402 bm!36318) bm!36319))

(assert (= (or b!831401 bm!36319) bm!36320))

(assert (= (and bm!36320 c!90224) b!831400))

(assert (= (and bm!36320 (not c!90224)) b!831398))

(assert (= (and d!106039 res!565899) b!831397))

(assert (= (and b!831397 res!565898) b!831404))

(declare-fun m!774755 () Bool)

(assert (=> b!831397 m!774755))

(declare-fun m!774757 () Bool)

(assert (=> b!831404 m!774757))

(declare-fun m!774759 () Bool)

(assert (=> b!831400 m!774759))

(declare-fun m!774761 () Bool)

(assert (=> d!106039 m!774761))

(declare-fun m!774763 () Bool)

(assert (=> d!106039 m!774763))

(declare-fun m!774765 () Bool)

(assert (=> bm!36320 m!774765))

(assert (=> d!105243 d!106039))

(declare-fun d!106041 () Bool)

(declare-fun e!463615 () Bool)

(assert (=> d!106041 e!463615))

(declare-fun res!565900 () Bool)

(assert (=> d!106041 (=> res!565900 e!463615)))

(declare-fun lt!377123 () Bool)

(assert (=> d!106041 (= res!565900 (not lt!377123))))

(declare-fun lt!377122 () Bool)

(assert (=> d!106041 (= lt!377123 lt!377122)))

(declare-fun lt!377121 () Unit!28383)

(declare-fun e!463616 () Unit!28383)

(assert (=> d!106041 (= lt!377121 e!463616)))

(declare-fun c!90227 () Bool)

(assert (=> d!106041 (= c!90227 lt!377122)))

(assert (=> d!106041 (= lt!377122 (containsKey!399 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106041 (= (contains!4187 lt!376655 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377123)))

(declare-fun b!831407 () Bool)

(declare-fun lt!377120 () Unit!28383)

(assert (=> b!831407 (= e!463616 lt!377120)))

(assert (=> b!831407 (= lt!377120 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!831407 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831408 () Bool)

(declare-fun Unit!28444 () Unit!28383)

(assert (=> b!831408 (= e!463616 Unit!28444)))

(declare-fun b!831409 () Bool)

(assert (=> b!831409 (= e!463615 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376655) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106041 c!90227) b!831407))

(assert (= (and d!106041 (not c!90227)) b!831408))

(assert (= (and d!106041 (not res!565900)) b!831409))

(declare-fun m!774767 () Bool)

(assert (=> d!106041 m!774767))

(declare-fun m!774769 () Bool)

(assert (=> b!831407 m!774769))

(assert (=> b!831407 m!772895))

(assert (=> b!831407 m!772895))

(declare-fun m!774771 () Bool)

(assert (=> b!831407 m!774771))

(assert (=> b!831409 m!772895))

(assert (=> b!831409 m!772895))

(assert (=> b!831409 m!774771))

(assert (=> d!105201 d!106041))

(declare-fun b!831410 () Bool)

(declare-fun e!463617 () Option!419)

(assert (=> b!831410 (= e!463617 (Some!418 (_2!5091 (h!17069 lt!376653))))))

(declare-fun b!831411 () Bool)

(declare-fun e!463618 () Option!419)

(assert (=> b!831411 (= e!463617 e!463618)))

(declare-fun c!90229 () Bool)

(assert (=> b!831411 (= c!90229 (and ((_ is Cons!15940) lt!376653) (not (= (_1!5091 (h!17069 lt!376653)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831413 () Bool)

(assert (=> b!831413 (= e!463618 None!417)))

(declare-fun b!831412 () Bool)

(assert (=> b!831412 (= e!463618 (getValueByKey!413 (t!22300 lt!376653) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106043 () Bool)

(declare-fun c!90228 () Bool)

(assert (=> d!106043 (= c!90228 (and ((_ is Cons!15940) lt!376653) (= (_1!5091 (h!17069 lt!376653)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106043 (= (getValueByKey!413 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!463617)))

(assert (= (and d!106043 c!90228) b!831410))

(assert (= (and d!106043 (not c!90228)) b!831411))

(assert (= (and b!831411 c!90229) b!831412))

(assert (= (and b!831411 (not c!90229)) b!831413))

(declare-fun m!774773 () Bool)

(assert (=> b!831412 m!774773))

(assert (=> d!105201 d!106043))

(declare-fun d!106045 () Bool)

(assert (=> d!106045 (= (getValueByKey!413 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377124 () Unit!28383)

(assert (=> d!106045 (= lt!377124 (choose!1426 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463619 () Bool)

(assert (=> d!106045 e!463619))

(declare-fun res!565901 () Bool)

(assert (=> d!106045 (=> (not res!565901) (not e!463619))))

(assert (=> d!106045 (= res!565901 (isStrictlySorted!437 lt!376653))))

(assert (=> d!106045 (= (lemmaContainsTupThenGetReturnValue!230 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377124)))

(declare-fun b!831414 () Bool)

(declare-fun res!565902 () Bool)

(assert (=> b!831414 (=> (not res!565902) (not e!463619))))

(assert (=> b!831414 (= res!565902 (containsKey!399 lt!376653 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831415 () Bool)

(assert (=> b!831415 (= e!463619 (contains!4188 lt!376653 (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106045 res!565901) b!831414))

(assert (= (and b!831414 res!565902) b!831415))

(assert (=> d!106045 m!772889))

(declare-fun m!774775 () Bool)

(assert (=> d!106045 m!774775))

(declare-fun m!774777 () Bool)

(assert (=> d!106045 m!774777))

(declare-fun m!774779 () Bool)

(assert (=> b!831414 m!774779))

(declare-fun m!774781 () Bool)

(assert (=> b!831415 m!774781))

(assert (=> d!105201 d!106045))

(declare-fun b!831416 () Bool)

(declare-fun res!565903 () Bool)

(declare-fun e!463621 () Bool)

(assert (=> b!831416 (=> (not res!565903) (not e!463621))))

(declare-fun lt!377125 () List!15944)

(assert (=> b!831416 (= res!565903 (containsKey!399 lt!377125 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463623 () List!15944)

(declare-fun c!90232 () Bool)

(declare-fun c!90230 () Bool)

(declare-fun b!831417 () Bool)

(assert (=> b!831417 (= e!463623 (ite c!90232 (t!22300 (toList!4502 call!36214)) (ite c!90230 (Cons!15940 (h!17069 (toList!4502 call!36214)) (t!22300 (toList!4502 call!36214))) Nil!15941)))))

(declare-fun b!831418 () Bool)

(assert (=> b!831418 (= c!90230 (and ((_ is Cons!15940) (toList!4502 call!36214)) (bvsgt (_1!5091 (h!17069 (toList!4502 call!36214))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!463620 () List!15944)

(declare-fun e!463622 () List!15944)

(assert (=> b!831418 (= e!463620 e!463622)))

(declare-fun b!831419 () Bool)

(assert (=> b!831419 (= e!463623 (insertStrictlySorted!269 (t!22300 (toList!4502 call!36214)) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831420 () Bool)

(declare-fun e!463624 () List!15944)

(declare-fun call!36324 () List!15944)

(assert (=> b!831420 (= e!463624 call!36324)))

(declare-fun b!831421 () Bool)

(declare-fun call!36326 () List!15944)

(assert (=> b!831421 (= e!463620 call!36326)))

(declare-fun b!831422 () Bool)

(declare-fun call!36325 () List!15944)

(assert (=> b!831422 (= e!463622 call!36325)))

(declare-fun bm!36321 () Bool)

(assert (=> bm!36321 (= call!36325 call!36326)))

(declare-fun b!831423 () Bool)

(assert (=> b!831423 (= e!463621 (contains!4188 lt!377125 (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!106047 () Bool)

(assert (=> d!106047 e!463621))

(declare-fun res!565904 () Bool)

(assert (=> d!106047 (=> (not res!565904) (not e!463621))))

(assert (=> d!106047 (= res!565904 (isStrictlySorted!437 lt!377125))))

(assert (=> d!106047 (= lt!377125 e!463624)))

(declare-fun c!90233 () Bool)

(assert (=> d!106047 (= c!90233 (and ((_ is Cons!15940) (toList!4502 call!36214)) (bvslt (_1!5091 (h!17069 (toList!4502 call!36214))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106047 (isStrictlySorted!437 (toList!4502 call!36214))))

(assert (=> d!106047 (= (insertStrictlySorted!269 (toList!4502 call!36214) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377125)))

(declare-fun bm!36322 () Bool)

(assert (=> bm!36322 (= call!36326 call!36324)))

(declare-fun bm!36323 () Bool)

(assert (=> bm!36323 (= call!36324 ($colon$colon!535 e!463623 (ite c!90233 (h!17069 (toList!4502 call!36214)) (tuple2!10161 (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90231 () Bool)

(assert (=> bm!36323 (= c!90231 c!90233)))

(declare-fun b!831424 () Bool)

(assert (=> b!831424 (= e!463624 e!463620)))

(assert (=> b!831424 (= c!90232 (and ((_ is Cons!15940) (toList!4502 call!36214)) (= (_1!5091 (h!17069 (toList!4502 call!36214))) (_1!5091 (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831425 () Bool)

(assert (=> b!831425 (= e!463622 call!36325)))

(assert (= (and d!106047 c!90233) b!831420))

(assert (= (and d!106047 (not c!90233)) b!831424))

(assert (= (and b!831424 c!90232) b!831421))

(assert (= (and b!831424 (not c!90232)) b!831418))

(assert (= (and b!831418 c!90230) b!831425))

(assert (= (and b!831418 (not c!90230)) b!831422))

(assert (= (or b!831425 b!831422) bm!36321))

(assert (= (or b!831421 bm!36321) bm!36322))

(assert (= (or b!831420 bm!36322) bm!36323))

(assert (= (and bm!36323 c!90231) b!831419))

(assert (= (and bm!36323 (not c!90231)) b!831417))

(assert (= (and d!106047 res!565904) b!831416))

(assert (= (and b!831416 res!565903) b!831423))

(declare-fun m!774783 () Bool)

(assert (=> b!831416 m!774783))

(declare-fun m!774785 () Bool)

(assert (=> b!831423 m!774785))

(declare-fun m!774787 () Bool)

(assert (=> b!831419 m!774787))

(declare-fun m!774789 () Bool)

(assert (=> d!106047 m!774789))

(declare-fun m!774791 () Bool)

(assert (=> d!106047 m!774791))

(declare-fun m!774793 () Bool)

(assert (=> bm!36323 m!774793))

(assert (=> d!105201 d!106047))

(declare-fun d!106049 () Bool)

(declare-fun res!565905 () Bool)

(declare-fun e!463625 () Bool)

(assert (=> d!106049 (=> res!565905 e!463625)))

(assert (=> d!106049 (= res!565905 (and ((_ is Cons!15940) lt!376645) (= (_1!5091 (h!17069 lt!376645)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106049 (= (containsKey!399 lt!376645 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463625)))

(declare-fun b!831426 () Bool)

(declare-fun e!463626 () Bool)

(assert (=> b!831426 (= e!463625 e!463626)))

(declare-fun res!565906 () Bool)

(assert (=> b!831426 (=> (not res!565906) (not e!463626))))

(assert (=> b!831426 (= res!565906 (and (or (not ((_ is Cons!15940) lt!376645)) (bvsle (_1!5091 (h!17069 lt!376645)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15940) lt!376645) (bvslt (_1!5091 (h!17069 lt!376645)) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831427 () Bool)

(assert (=> b!831427 (= e!463626 (containsKey!399 (t!22300 lt!376645) (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106049 (not res!565905)) b!831426))

(assert (= (and b!831426 res!565906) b!831427))

(declare-fun m!774795 () Bool)

(assert (=> b!831427 m!774795))

(assert (=> b!830240 d!106049))

(declare-fun d!106051 () Bool)

(declare-fun lt!377126 () Bool)

(assert (=> d!106051 (= lt!377126 (select (content!384 (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463627 () Bool)

(assert (=> d!106051 (= lt!377126 e!463627)))

(declare-fun res!565908 () Bool)

(assert (=> d!106051 (=> (not res!565908) (not e!463627))))

(assert (=> d!106051 (= res!565908 ((_ is Cons!15941) (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)))))

(assert (=> d!106051 (= (contains!4189 (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377126)))

(declare-fun b!831428 () Bool)

(declare-fun e!463628 () Bool)

(assert (=> b!831428 (= e!463627 e!463628)))

(declare-fun res!565907 () Bool)

(assert (=> b!831428 (=> res!565907 e!463628)))

(assert (=> b!831428 (= res!565907 (= (h!17070 (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831429 () Bool)

(assert (=> b!831429 (= e!463628 (contains!4189 (t!22301 (ite c!89839 (Cons!15941 (select (arr!22314 _keys!976) #b00000000000000000000000000000000) Nil!15942) Nil!15942)) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106051 res!565908) b!831428))

(assert (= (and b!831428 (not res!565907)) b!831429))

(declare-fun m!774797 () Bool)

(assert (=> d!106051 m!774797))

(assert (=> d!106051 m!772925))

(declare-fun m!774799 () Bool)

(assert (=> d!106051 m!774799))

(assert (=> b!831429 m!772925))

(declare-fun m!774801 () Bool)

(assert (=> b!831429 m!774801))

(assert (=> b!830373 d!106051))

(declare-fun b!831430 () Bool)

(declare-fun e!463629 () Option!419)

(assert (=> b!831430 (= e!463629 (Some!418 (_2!5091 (h!17069 (t!22300 lt!376548)))))))

(declare-fun b!831431 () Bool)

(declare-fun e!463630 () Option!419)

(assert (=> b!831431 (= e!463629 e!463630)))

(declare-fun c!90235 () Bool)

(assert (=> b!831431 (= c!90235 (and ((_ is Cons!15940) (t!22300 lt!376548)) (not (= (_1!5091 (h!17069 (t!22300 lt!376548))) (_1!5091 lt!376416)))))))

(declare-fun b!831433 () Bool)

(assert (=> b!831433 (= e!463630 None!417)))

(declare-fun b!831432 () Bool)

(assert (=> b!831432 (= e!463630 (getValueByKey!413 (t!22300 (t!22300 lt!376548)) (_1!5091 lt!376416)))))

(declare-fun d!106053 () Bool)

(declare-fun c!90234 () Bool)

(assert (=> d!106053 (= c!90234 (and ((_ is Cons!15940) (t!22300 lt!376548)) (= (_1!5091 (h!17069 (t!22300 lt!376548))) (_1!5091 lt!376416))))))

(assert (=> d!106053 (= (getValueByKey!413 (t!22300 lt!376548) (_1!5091 lt!376416)) e!463629)))

(assert (= (and d!106053 c!90234) b!831430))

(assert (= (and d!106053 (not c!90234)) b!831431))

(assert (= (and b!831431 c!90235) b!831432))

(assert (= (and b!831431 (not c!90235)) b!831433))

(declare-fun m!774803 () Bool)

(assert (=> b!831432 m!774803))

(assert (=> b!830486 d!106053))

(declare-fun d!106055 () Bool)

(declare-fun e!463631 () Bool)

(assert (=> d!106055 e!463631))

(declare-fun res!565909 () Bool)

(assert (=> d!106055 (=> res!565909 e!463631)))

(declare-fun lt!377130 () Bool)

(assert (=> d!106055 (= res!565909 (not lt!377130))))

(declare-fun lt!377129 () Bool)

(assert (=> d!106055 (= lt!377130 lt!377129)))

(declare-fun lt!377128 () Unit!28383)

(declare-fun e!463632 () Unit!28383)

(assert (=> d!106055 (= lt!377128 e!463632)))

(declare-fun c!90236 () Bool)

(assert (=> d!106055 (= c!90236 lt!377129)))

(assert (=> d!106055 (= lt!377129 (containsKey!399 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(assert (=> d!106055 (= (contains!4187 lt!376803 (_1!5091 (tuple2!10161 lt!376558 minValue!754))) lt!377130)))

(declare-fun b!831434 () Bool)

(declare-fun lt!377127 () Unit!28383)

(assert (=> b!831434 (= e!463632 lt!377127)))

(assert (=> b!831434 (= lt!377127 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(assert (=> b!831434 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun b!831435 () Bool)

(declare-fun Unit!28445 () Unit!28383)

(assert (=> b!831435 (= e!463632 Unit!28445)))

(declare-fun b!831436 () Bool)

(assert (=> b!831436 (= e!463631 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(assert (= (and d!106055 c!90236) b!831434))

(assert (= (and d!106055 (not c!90236)) b!831435))

(assert (= (and d!106055 (not res!565909)) b!831436))

(declare-fun m!774805 () Bool)

(assert (=> d!106055 m!774805))

(declare-fun m!774807 () Bool)

(assert (=> b!831434 m!774807))

(assert (=> b!831434 m!773341))

(assert (=> b!831434 m!773341))

(declare-fun m!774809 () Bool)

(assert (=> b!831434 m!774809))

(assert (=> b!831436 m!773341))

(assert (=> b!831436 m!773341))

(assert (=> b!831436 m!774809))

(assert (=> d!105325 d!106055))

(declare-fun b!831437 () Bool)

(declare-fun e!463633 () Option!419)

(assert (=> b!831437 (= e!463633 (Some!418 (_2!5091 (h!17069 lt!376801))))))

(declare-fun b!831438 () Bool)

(declare-fun e!463634 () Option!419)

(assert (=> b!831438 (= e!463633 e!463634)))

(declare-fun c!90238 () Bool)

(assert (=> b!831438 (= c!90238 (and ((_ is Cons!15940) lt!376801) (not (= (_1!5091 (h!17069 lt!376801)) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))))

(declare-fun b!831440 () Bool)

(assert (=> b!831440 (= e!463634 None!417)))

(declare-fun b!831439 () Bool)

(assert (=> b!831439 (= e!463634 (getValueByKey!413 (t!22300 lt!376801) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun d!106057 () Bool)

(declare-fun c!90237 () Bool)

(assert (=> d!106057 (= c!90237 (and ((_ is Cons!15940) lt!376801) (= (_1!5091 (h!17069 lt!376801)) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(assert (=> d!106057 (= (getValueByKey!413 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754))) e!463633)))

(assert (= (and d!106057 c!90237) b!831437))

(assert (= (and d!106057 (not c!90237)) b!831438))

(assert (= (and b!831438 c!90238) b!831439))

(assert (= (and b!831438 (not c!90238)) b!831440))

(declare-fun m!774811 () Bool)

(assert (=> b!831439 m!774811))

(assert (=> d!105325 d!106057))

(declare-fun d!106059 () Bool)

(assert (=> d!106059 (= (getValueByKey!413 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754))) (Some!418 (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun lt!377131 () Unit!28383)

(assert (=> d!106059 (= lt!377131 (choose!1426 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun e!463635 () Bool)

(assert (=> d!106059 e!463635))

(declare-fun res!565910 () Bool)

(assert (=> d!106059 (=> (not res!565910) (not e!463635))))

(assert (=> d!106059 (= res!565910 (isStrictlySorted!437 lt!376801))))

(assert (=> d!106059 (= (lemmaContainsTupThenGetReturnValue!230 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))) lt!377131)))

(declare-fun b!831441 () Bool)

(declare-fun res!565911 () Bool)

(assert (=> b!831441 (=> (not res!565911) (not e!463635))))

(assert (=> b!831441 (= res!565911 (containsKey!399 lt!376801 (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun b!831442 () Bool)

(assert (=> b!831442 (= e!463635 (contains!4188 lt!376801 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(assert (= (and d!106059 res!565910) b!831441))

(assert (= (and b!831441 res!565911) b!831442))

(assert (=> d!106059 m!773335))

(declare-fun m!774813 () Bool)

(assert (=> d!106059 m!774813))

(declare-fun m!774815 () Bool)

(assert (=> d!106059 m!774815))

(declare-fun m!774817 () Bool)

(assert (=> b!831441 m!774817))

(declare-fun m!774819 () Bool)

(assert (=> b!831442 m!774819))

(assert (=> d!105325 d!106059))

(declare-fun b!831443 () Bool)

(declare-fun res!565912 () Bool)

(declare-fun e!463637 () Bool)

(assert (=> b!831443 (=> (not res!565912) (not e!463637))))

(declare-fun lt!377132 () List!15944)

(assert (=> b!831443 (= res!565912 (containsKey!399 lt!377132 (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun c!90241 () Bool)

(declare-fun b!831444 () Bool)

(declare-fun e!463639 () List!15944)

(declare-fun c!90239 () Bool)

(assert (=> b!831444 (= e!463639 (ite c!90241 (t!22300 (toList!4502 lt!376560)) (ite c!90239 (Cons!15940 (h!17069 (toList!4502 lt!376560)) (t!22300 (toList!4502 lt!376560))) Nil!15941)))))

(declare-fun b!831445 () Bool)

(assert (=> b!831445 (= c!90239 (and ((_ is Cons!15940) (toList!4502 lt!376560)) (bvsgt (_1!5091 (h!17069 (toList!4502 lt!376560))) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(declare-fun e!463636 () List!15944)

(declare-fun e!463638 () List!15944)

(assert (=> b!831445 (= e!463636 e!463638)))

(declare-fun b!831446 () Bool)

(assert (=> b!831446 (= e!463639 (insertStrictlySorted!269 (t!22300 (toList!4502 lt!376560)) (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun b!831447 () Bool)

(declare-fun e!463640 () List!15944)

(declare-fun call!36327 () List!15944)

(assert (=> b!831447 (= e!463640 call!36327)))

(declare-fun b!831448 () Bool)

(declare-fun call!36329 () List!15944)

(assert (=> b!831448 (= e!463636 call!36329)))

(declare-fun b!831449 () Bool)

(declare-fun call!36328 () List!15944)

(assert (=> b!831449 (= e!463638 call!36328)))

(declare-fun bm!36324 () Bool)

(assert (=> bm!36324 (= call!36328 call!36329)))

(declare-fun b!831450 () Bool)

(assert (=> b!831450 (= e!463637 (contains!4188 lt!377132 (tuple2!10161 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(declare-fun d!106061 () Bool)

(assert (=> d!106061 e!463637))

(declare-fun res!565913 () Bool)

(assert (=> d!106061 (=> (not res!565913) (not e!463637))))

(assert (=> d!106061 (= res!565913 (isStrictlySorted!437 lt!377132))))

(assert (=> d!106061 (= lt!377132 e!463640)))

(declare-fun c!90242 () Bool)

(assert (=> d!106061 (= c!90242 (and ((_ is Cons!15940) (toList!4502 lt!376560)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376560))) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(assert (=> d!106061 (isStrictlySorted!437 (toList!4502 lt!376560))))

(assert (=> d!106061 (= (insertStrictlySorted!269 (toList!4502 lt!376560) (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))) lt!377132)))

(declare-fun bm!36325 () Bool)

(assert (=> bm!36325 (= call!36329 call!36327)))

(declare-fun bm!36326 () Bool)

(assert (=> bm!36326 (= call!36327 ($colon$colon!535 e!463639 (ite c!90242 (h!17069 (toList!4502 lt!376560)) (tuple2!10161 (_1!5091 (tuple2!10161 lt!376558 minValue!754)) (_2!5091 (tuple2!10161 lt!376558 minValue!754))))))))

(declare-fun c!90240 () Bool)

(assert (=> bm!36326 (= c!90240 c!90242)))

(declare-fun b!831451 () Bool)

(assert (=> b!831451 (= e!463640 e!463636)))

(assert (=> b!831451 (= c!90241 (and ((_ is Cons!15940) (toList!4502 lt!376560)) (= (_1!5091 (h!17069 (toList!4502 lt!376560))) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(declare-fun b!831452 () Bool)

(assert (=> b!831452 (= e!463638 call!36328)))

(assert (= (and d!106061 c!90242) b!831447))

(assert (= (and d!106061 (not c!90242)) b!831451))

(assert (= (and b!831451 c!90241) b!831448))

(assert (= (and b!831451 (not c!90241)) b!831445))

(assert (= (and b!831445 c!90239) b!831452))

(assert (= (and b!831445 (not c!90239)) b!831449))

(assert (= (or b!831452 b!831449) bm!36324))

(assert (= (or b!831448 bm!36324) bm!36325))

(assert (= (or b!831447 bm!36325) bm!36326))

(assert (= (and bm!36326 c!90240) b!831446))

(assert (= (and bm!36326 (not c!90240)) b!831444))

(assert (= (and d!106061 res!565913) b!831443))

(assert (= (and b!831443 res!565912) b!831450))

(declare-fun m!774821 () Bool)

(assert (=> b!831443 m!774821))

(declare-fun m!774823 () Bool)

(assert (=> b!831450 m!774823))

(declare-fun m!774825 () Bool)

(assert (=> b!831446 m!774825))

(declare-fun m!774827 () Bool)

(assert (=> d!106061 m!774827))

(declare-fun m!774829 () Bool)

(assert (=> d!106061 m!774829))

(declare-fun m!774831 () Bool)

(assert (=> bm!36326 m!774831))

(assert (=> d!105325 d!106061))

(assert (=> b!830467 d!105447))

(declare-fun d!106063 () Bool)

(declare-fun res!565914 () Bool)

(declare-fun e!463641 () Bool)

(assert (=> d!106063 (=> res!565914 e!463641)))

(assert (=> d!106063 (= res!565914 (and ((_ is Cons!15940) lt!376677) (= (_1!5091 (h!17069 lt!376677)) (_1!5091 lt!376416))))))

(assert (=> d!106063 (= (containsKey!399 lt!376677 (_1!5091 lt!376416)) e!463641)))

(declare-fun b!831453 () Bool)

(declare-fun e!463642 () Bool)

(assert (=> b!831453 (= e!463641 e!463642)))

(declare-fun res!565915 () Bool)

(assert (=> b!831453 (=> (not res!565915) (not e!463642))))

(assert (=> b!831453 (= res!565915 (and (or (not ((_ is Cons!15940) lt!376677)) (bvsle (_1!5091 (h!17069 lt!376677)) (_1!5091 lt!376416))) ((_ is Cons!15940) lt!376677) (bvslt (_1!5091 (h!17069 lt!376677)) (_1!5091 lt!376416))))))

(declare-fun b!831454 () Bool)

(assert (=> b!831454 (= e!463642 (containsKey!399 (t!22300 lt!376677) (_1!5091 lt!376416)))))

(assert (= (and d!106063 (not res!565914)) b!831453))

(assert (= (and b!831453 res!565915) b!831454))

(declare-fun m!774833 () Bool)

(assert (=> b!831454 m!774833))

(assert (=> b!830293 d!106063))

(declare-fun d!106065 () Bool)

(declare-fun res!565916 () Bool)

(declare-fun e!463643 () Bool)

(assert (=> d!106065 (=> res!565916 e!463643)))

(assert (=> d!106065 (= res!565916 (and ((_ is Cons!15940) lt!376536) (= (_1!5091 (h!17069 lt!376536)) (_1!5091 lt!376417))))))

(assert (=> d!106065 (= (containsKey!399 lt!376536 (_1!5091 lt!376417)) e!463643)))

(declare-fun b!831455 () Bool)

(declare-fun e!463644 () Bool)

(assert (=> b!831455 (= e!463643 e!463644)))

(declare-fun res!565917 () Bool)

(assert (=> b!831455 (=> (not res!565917) (not e!463644))))

(assert (=> b!831455 (= res!565917 (and (or (not ((_ is Cons!15940) lt!376536)) (bvsle (_1!5091 (h!17069 lt!376536)) (_1!5091 lt!376417))) ((_ is Cons!15940) lt!376536) (bvslt (_1!5091 (h!17069 lt!376536)) (_1!5091 lt!376417))))))

(declare-fun b!831456 () Bool)

(assert (=> b!831456 (= e!463644 (containsKey!399 (t!22300 lt!376536) (_1!5091 lt!376417)))))

(assert (= (and d!106065 (not res!565916)) b!831455))

(assert (= (and b!831455 res!565917) b!831456))

(declare-fun m!774835 () Bool)

(assert (=> b!831456 m!774835))

(assert (=> b!830199 d!106065))

(declare-fun b!831457 () Bool)

(declare-fun e!463645 () Option!419)

(assert (=> b!831457 (= e!463645 (Some!418 (_2!5091 (h!17069 (t!22300 (toList!4502 lt!376546))))))))

(declare-fun b!831458 () Bool)

(declare-fun e!463646 () Option!419)

(assert (=> b!831458 (= e!463645 e!463646)))

(declare-fun c!90244 () Bool)

(assert (=> b!831458 (= c!90244 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376546))) (not (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376546)))) (_1!5091 lt!376416)))))))

(declare-fun b!831460 () Bool)

(assert (=> b!831460 (= e!463646 None!417)))

(declare-fun b!831459 () Bool)

(assert (=> b!831459 (= e!463646 (getValueByKey!413 (t!22300 (t!22300 (toList!4502 lt!376546))) (_1!5091 lt!376416)))))

(declare-fun d!106067 () Bool)

(declare-fun c!90243 () Bool)

(assert (=> d!106067 (= c!90243 (and ((_ is Cons!15940) (t!22300 (toList!4502 lt!376546))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 lt!376546)))) (_1!5091 lt!376416))))))

(assert (=> d!106067 (= (getValueByKey!413 (t!22300 (toList!4502 lt!376546)) (_1!5091 lt!376416)) e!463645)))

(assert (= (and d!106067 c!90243) b!831457))

(assert (= (and d!106067 (not c!90243)) b!831458))

(assert (= (and b!831458 c!90244) b!831459))

(assert (= (and b!831458 (not c!90244)) b!831460))

(declare-fun m!774837 () Bool)

(assert (=> b!831459 m!774837))

(assert (=> b!830477 d!106067))

(assert (=> b!830357 d!105899))

(assert (=> b!830357 d!105901))

(declare-fun d!106069 () Bool)

(assert (=> d!106069 (= (get!11824 (getValueByKey!413 (toList!4502 lt!376567) lt!376559)) (v!10089 (getValueByKey!413 (toList!4502 lt!376567) lt!376559)))))

(assert (=> d!105345 d!106069))

(declare-fun b!831461 () Bool)

(declare-fun e!463647 () Option!419)

(assert (=> b!831461 (= e!463647 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376567)))))))

(declare-fun b!831462 () Bool)

(declare-fun e!463648 () Option!419)

(assert (=> b!831462 (= e!463647 e!463648)))

(declare-fun c!90246 () Bool)

(assert (=> b!831462 (= c!90246 (and ((_ is Cons!15940) (toList!4502 lt!376567)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376567))) lt!376559))))))

(declare-fun b!831464 () Bool)

(assert (=> b!831464 (= e!463648 None!417)))

(declare-fun b!831463 () Bool)

(assert (=> b!831463 (= e!463648 (getValueByKey!413 (t!22300 (toList!4502 lt!376567)) lt!376559))))

(declare-fun d!106071 () Bool)

(declare-fun c!90245 () Bool)

(assert (=> d!106071 (= c!90245 (and ((_ is Cons!15940) (toList!4502 lt!376567)) (= (_1!5091 (h!17069 (toList!4502 lt!376567))) lt!376559)))))

(assert (=> d!106071 (= (getValueByKey!413 (toList!4502 lt!376567) lt!376559) e!463647)))

(assert (= (and d!106071 c!90245) b!831461))

(assert (= (and d!106071 (not c!90245)) b!831462))

(assert (= (and b!831462 c!90246) b!831463))

(assert (= (and b!831462 (not c!90246)) b!831464))

(declare-fun m!774839 () Bool)

(assert (=> b!831463 m!774839))

(assert (=> d!105345 d!106071))

(declare-fun d!106073 () Bool)

(declare-fun lt!377133 () Bool)

(assert (=> d!106073 (= lt!377133 (select (content!385 lt!376609) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463649 () Bool)

(assert (=> d!106073 (= lt!377133 e!463649)))

(declare-fun res!565918 () Bool)

(assert (=> d!106073 (=> (not res!565918) (not e!463649))))

(assert (=> d!106073 (= res!565918 ((_ is Cons!15940) lt!376609))))

(assert (=> d!106073 (= (contains!4188 lt!376609 (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377133)))

(declare-fun b!831465 () Bool)

(declare-fun e!463650 () Bool)

(assert (=> b!831465 (= e!463649 e!463650)))

(declare-fun res!565919 () Bool)

(assert (=> b!831465 (=> res!565919 e!463650)))

(assert (=> b!831465 (= res!565919 (= (h!17069 lt!376609) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831466 () Bool)

(assert (=> b!831466 (= e!463650 (contains!4188 (t!22300 lt!376609) (tuple2!10161 (_1!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5091 (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106073 res!565918) b!831465))

(assert (= (and b!831465 (not res!565919)) b!831466))

(declare-fun m!774841 () Bool)

(assert (=> d!106073 m!774841))

(declare-fun m!774843 () Bool)

(assert (=> d!106073 m!774843))

(declare-fun m!774845 () Bool)

(assert (=> b!831466 m!774845))

(assert (=> b!830239 d!106073))

(declare-fun d!106075 () Bool)

(declare-fun c!90247 () Bool)

(assert (=> d!106075 (= c!90247 ((_ is Nil!15941) (toList!4502 lt!376611)))))

(declare-fun e!463651 () (InoxSet tuple2!10160))

(assert (=> d!106075 (= (content!385 (toList!4502 lt!376611)) e!463651)))

(declare-fun b!831467 () Bool)

(assert (=> b!831467 (= e!463651 ((as const (Array tuple2!10160 Bool)) false))))

(declare-fun b!831468 () Bool)

(assert (=> b!831468 (= e!463651 ((_ map or) (store ((as const (Array tuple2!10160 Bool)) false) (h!17069 (toList!4502 lt!376611)) true) (content!385 (t!22300 (toList!4502 lt!376611)))))))

(assert (= (and d!106075 c!90247) b!831467))

(assert (= (and d!106075 (not c!90247)) b!831468))

(declare-fun m!774847 () Bool)

(assert (=> b!831468 m!774847))

(assert (=> b!831468 m!774381))

(assert (=> d!105393 d!106075))

(declare-fun d!106077 () Bool)

(declare-fun res!565920 () Bool)

(declare-fun e!463652 () Bool)

(assert (=> d!106077 (=> res!565920 e!463652)))

(assert (=> d!106077 (= res!565920 (and ((_ is Cons!15940) (toList!4502 lt!376550)) (= (_1!5091 (h!17069 (toList!4502 lt!376550))) (_1!5091 lt!376416))))))

(assert (=> d!106077 (= (containsKey!399 (toList!4502 lt!376550) (_1!5091 lt!376416)) e!463652)))

(declare-fun b!831469 () Bool)

(declare-fun e!463653 () Bool)

(assert (=> b!831469 (= e!463652 e!463653)))

(declare-fun res!565921 () Bool)

(assert (=> b!831469 (=> (not res!565921) (not e!463653))))

(assert (=> b!831469 (= res!565921 (and (or (not ((_ is Cons!15940) (toList!4502 lt!376550))) (bvsle (_1!5091 (h!17069 (toList!4502 lt!376550))) (_1!5091 lt!376416))) ((_ is Cons!15940) (toList!4502 lt!376550)) (bvslt (_1!5091 (h!17069 (toList!4502 lt!376550))) (_1!5091 lt!376416))))))

(declare-fun b!831470 () Bool)

(assert (=> b!831470 (= e!463653 (containsKey!399 (t!22300 (toList!4502 lt!376550)) (_1!5091 lt!376416)))))

(assert (= (and d!106077 (not res!565920)) b!831469))

(assert (= (and b!831469 res!565921) b!831470))

(declare-fun m!774849 () Bool)

(assert (=> b!831470 m!774849))

(assert (=> d!105371 d!106077))

(declare-fun b!831471 () Bool)

(declare-fun res!565922 () Bool)

(declare-fun e!463655 () Bool)

(assert (=> b!831471 (=> (not res!565922) (not e!463655))))

(declare-fun lt!377134 () List!15944)

(assert (=> b!831471 (= res!565922 (containsKey!399 lt!377134 (_1!5091 lt!376417)))))

(declare-fun b!831472 () Bool)

(declare-fun c!90248 () Bool)

(declare-fun e!463657 () List!15944)

(declare-fun c!90250 () Bool)

(assert (=> b!831472 (= e!463657 (ite c!90250 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (ite c!90248 (Cons!15940 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))) Nil!15941)))))

(declare-fun b!831473 () Bool)

(assert (=> b!831473 (= c!90248 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (bvsgt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))) (_1!5091 lt!376417))))))

(declare-fun e!463654 () List!15944)

(declare-fun e!463656 () List!15944)

(assert (=> b!831473 (= e!463654 e!463656)))

(declare-fun b!831474 () Bool)

(assert (=> b!831474 (= e!463657 (insertStrictlySorted!269 (t!22300 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (_1!5091 lt!376417) (_2!5091 lt!376417)))))

(declare-fun b!831475 () Bool)

(declare-fun e!463658 () List!15944)

(declare-fun call!36330 () List!15944)

(assert (=> b!831475 (= e!463658 call!36330)))

(declare-fun b!831476 () Bool)

(declare-fun call!36332 () List!15944)

(assert (=> b!831476 (= e!463654 call!36332)))

(declare-fun b!831477 () Bool)

(declare-fun call!36331 () List!15944)

(assert (=> b!831477 (= e!463656 call!36331)))

(declare-fun bm!36327 () Bool)

(assert (=> bm!36327 (= call!36331 call!36332)))

(declare-fun b!831478 () Bool)

(assert (=> b!831478 (= e!463655 (contains!4188 lt!377134 (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417))))))

(declare-fun d!106079 () Bool)

(assert (=> d!106079 e!463655))

(declare-fun res!565923 () Bool)

(assert (=> d!106079 (=> (not res!565923) (not e!463655))))

(assert (=> d!106079 (= res!565923 (isStrictlySorted!437 lt!377134))))

(assert (=> d!106079 (= lt!377134 e!463658)))

(declare-fun c!90251 () Bool)

(assert (=> d!106079 (= c!90251 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (bvslt (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))) (_1!5091 lt!376417))))))

(assert (=> d!106079 (isStrictlySorted!437 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))))

(assert (=> d!106079 (= (insertStrictlySorted!269 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))) (_1!5091 lt!376417) (_2!5091 lt!376417)) lt!377134)))

(declare-fun bm!36328 () Bool)

(assert (=> bm!36328 (= call!36332 call!36330)))

(declare-fun bm!36329 () Bool)

(assert (=> bm!36329 (= call!36330 ($colon$colon!535 e!463657 (ite c!90251 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (tuple2!10161 (_1!5091 lt!376417) (_2!5091 lt!376417)))))))

(declare-fun c!90249 () Bool)

(assert (=> bm!36329 (= c!90249 c!90251)))

(declare-fun b!831479 () Bool)

(assert (=> b!831479 (= e!463658 e!463654)))

(assert (=> b!831479 (= c!90250 (and ((_ is Cons!15940) (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416)))) (= (_1!5091 (h!17069 (t!22300 (toList!4502 (+!2010 lt!376414 lt!376416))))) (_1!5091 lt!376417))))))

(declare-fun b!831480 () Bool)

(assert (=> b!831480 (= e!463656 call!36331)))

(assert (= (and d!106079 c!90251) b!831475))

(assert (= (and d!106079 (not c!90251)) b!831479))

(assert (= (and b!831479 c!90250) b!831476))

(assert (= (and b!831479 (not c!90250)) b!831473))

(assert (= (and b!831473 c!90248) b!831480))

(assert (= (and b!831473 (not c!90248)) b!831477))

(assert (= (or b!831480 b!831477) bm!36327))

(assert (= (or b!831476 bm!36327) bm!36328))

(assert (= (or b!831475 bm!36328) bm!36329))

(assert (= (and bm!36329 c!90249) b!831474))

(assert (= (and bm!36329 (not c!90249)) b!831472))

(assert (= (and d!106079 res!565923) b!831471))

(assert (= (and b!831471 res!565922) b!831478))

(declare-fun m!774851 () Bool)

(assert (=> b!831471 m!774851))

(declare-fun m!774853 () Bool)

(assert (=> b!831478 m!774853))

(declare-fun m!774855 () Bool)

(assert (=> b!831474 m!774855))

(declare-fun m!774857 () Bool)

(assert (=> d!106079 m!774857))

(assert (=> d!106079 m!773943))

(declare-fun m!774859 () Bool)

(assert (=> bm!36329 m!774859))

(assert (=> b!830416 d!106079))

(assert (=> d!105287 d!105261))

(declare-fun d!106081 () Bool)

(assert (=> d!106081 (= (apply!372 (+!2010 lt!376514 (tuple2!10161 lt!376512 minValue!754)) lt!376507) (apply!372 lt!376514 lt!376507))))

(assert (=> d!106081 true))

(declare-fun _$34!1147 () Unit!28383)

(assert (=> d!106081 (= (choose!1429 lt!376514 lt!376512 minValue!754 lt!376507) _$34!1147)))

(declare-fun bs!23221 () Bool)

(assert (= bs!23221 d!106081))

(assert (=> bs!23221 m!772581))

(assert (=> bs!23221 m!772581))

(assert (=> bs!23221 m!772583))

(assert (=> bs!23221 m!772599))

(assert (=> d!105287 d!106081))

(declare-fun d!106083 () Bool)

(declare-fun e!463659 () Bool)

(assert (=> d!106083 e!463659))

(declare-fun res!565924 () Bool)

(assert (=> d!106083 (=> res!565924 e!463659)))

(declare-fun lt!377138 () Bool)

(assert (=> d!106083 (= res!565924 (not lt!377138))))

(declare-fun lt!377137 () Bool)

(assert (=> d!106083 (= lt!377138 lt!377137)))

(declare-fun lt!377136 () Unit!28383)

(declare-fun e!463660 () Unit!28383)

(assert (=> d!106083 (= lt!377136 e!463660)))

(declare-fun c!90252 () Bool)

(assert (=> d!106083 (= c!90252 lt!377137)))

(assert (=> d!106083 (= lt!377137 (containsKey!399 (toList!4502 lt!376514) lt!376507))))

(assert (=> d!106083 (= (contains!4187 lt!376514 lt!376507) lt!377138)))

(declare-fun b!831481 () Bool)

(declare-fun lt!377135 () Unit!28383)

(assert (=> b!831481 (= e!463660 lt!377135)))

(assert (=> b!831481 (= lt!377135 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376514) lt!376507))))

(assert (=> b!831481 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376514) lt!376507))))

(declare-fun b!831482 () Bool)

(declare-fun Unit!28446 () Unit!28383)

(assert (=> b!831482 (= e!463660 Unit!28446)))

(declare-fun b!831483 () Bool)

(assert (=> b!831483 (= e!463659 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376514) lt!376507)))))

(assert (= (and d!106083 c!90252) b!831481))

(assert (= (and d!106083 (not c!90252)) b!831482))

(assert (= (and d!106083 (not res!565924)) b!831483))

(declare-fun m!774861 () Bool)

(assert (=> d!106083 m!774861))

(declare-fun m!774863 () Bool)

(assert (=> b!831481 m!774863))

(assert (=> b!831481 m!773177))

(assert (=> b!831481 m!773177))

(declare-fun m!774865 () Bool)

(assert (=> b!831481 m!774865))

(assert (=> b!831483 m!773177))

(assert (=> b!831483 m!773177))

(assert (=> b!831483 m!774865))

(assert (=> d!105287 d!106083))

(assert (=> d!105287 d!105279))

(assert (=> d!105287 d!105283))

(declare-fun b!831484 () Bool)

(declare-fun e!463661 () Option!419)

(assert (=> b!831484 (= e!463661 (Some!418 (_2!5091 (h!17069 (toList!4502 lt!376803)))))))

(declare-fun b!831485 () Bool)

(declare-fun e!463662 () Option!419)

(assert (=> b!831485 (= e!463661 e!463662)))

(declare-fun c!90254 () Bool)

(assert (=> b!831485 (= c!90254 (and ((_ is Cons!15940) (toList!4502 lt!376803)) (not (= (_1!5091 (h!17069 (toList!4502 lt!376803))) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))))

(declare-fun b!831487 () Bool)

(assert (=> b!831487 (= e!463662 None!417)))

(declare-fun b!831486 () Bool)

(assert (=> b!831486 (= e!463662 (getValueByKey!413 (t!22300 (toList!4502 lt!376803)) (_1!5091 (tuple2!10161 lt!376558 minValue!754))))))

(declare-fun c!90253 () Bool)

(declare-fun d!106085 () Bool)

(assert (=> d!106085 (= c!90253 (and ((_ is Cons!15940) (toList!4502 lt!376803)) (= (_1!5091 (h!17069 (toList!4502 lt!376803))) (_1!5091 (tuple2!10161 lt!376558 minValue!754)))))))

(assert (=> d!106085 (= (getValueByKey!413 (toList!4502 lt!376803) (_1!5091 (tuple2!10161 lt!376558 minValue!754))) e!463661)))

(assert (= (and d!106085 c!90253) b!831484))

(assert (= (and d!106085 (not c!90253)) b!831485))

(assert (= (and b!831485 c!90254) b!831486))

(assert (= (and b!831485 (not c!90254)) b!831487))

(declare-fun m!774867 () Bool)

(assert (=> b!831486 m!774867))

(assert (=> b!830445 d!106085))

(declare-fun lt!377139 () Bool)

(declare-fun d!106087 () Bool)

(assert (=> d!106087 (= lt!377139 (select (content!385 (toList!4502 lt!376743)) (tuple2!10161 lt!376509 zeroValueAfter!34)))))

(declare-fun e!463663 () Bool)

(assert (=> d!106087 (= lt!377139 e!463663)))

(declare-fun res!565925 () Bool)

(assert (=> d!106087 (=> (not res!565925) (not e!463663))))

(assert (=> d!106087 (= res!565925 ((_ is Cons!15940) (toList!4502 lt!376743)))))

(assert (=> d!106087 (= (contains!4188 (toList!4502 lt!376743) (tuple2!10161 lt!376509 zeroValueAfter!34)) lt!377139)))

(declare-fun b!831488 () Bool)

(declare-fun e!463664 () Bool)

(assert (=> b!831488 (= e!463663 e!463664)))

(declare-fun res!565926 () Bool)

(assert (=> b!831488 (=> res!565926 e!463664)))

(assert (=> b!831488 (= res!565926 (= (h!17069 (toList!4502 lt!376743)) (tuple2!10161 lt!376509 zeroValueAfter!34)))))

(declare-fun b!831489 () Bool)

(assert (=> b!831489 (= e!463664 (contains!4188 (t!22300 (toList!4502 lt!376743)) (tuple2!10161 lt!376509 zeroValueAfter!34)))))

(assert (= (and d!106087 res!565925) b!831488))

(assert (= (and b!831488 (not res!565926)) b!831489))

(declare-fun m!774869 () Bool)

(assert (=> d!106087 m!774869))

(declare-fun m!774871 () Bool)

(assert (=> d!106087 m!774871))

(declare-fun m!774873 () Bool)

(assert (=> b!831489 m!774873))

(assert (=> b!830381 d!106087))

(declare-fun d!106089 () Bool)

(declare-fun lt!377140 () Bool)

(assert (=> d!106089 (= lt!377140 (select (content!385 (t!22300 (toList!4502 lt!376607))) lt!376416))))

(declare-fun e!463665 () Bool)

(assert (=> d!106089 (= lt!377140 e!463665)))

(declare-fun res!565927 () Bool)

(assert (=> d!106089 (=> (not res!565927) (not e!463665))))

(assert (=> d!106089 (= res!565927 ((_ is Cons!15940) (t!22300 (toList!4502 lt!376607))))))

(assert (=> d!106089 (= (contains!4188 (t!22300 (toList!4502 lt!376607)) lt!376416) lt!377140)))

(declare-fun b!831490 () Bool)

(declare-fun e!463666 () Bool)

(assert (=> b!831490 (= e!463665 e!463666)))

(declare-fun res!565928 () Bool)

(assert (=> b!831490 (=> res!565928 e!463666)))

(assert (=> b!831490 (= res!565928 (= (h!17069 (t!22300 (toList!4502 lt!376607))) lt!376416))))

(declare-fun b!831491 () Bool)

(assert (=> b!831491 (= e!463666 (contains!4188 (t!22300 (t!22300 (toList!4502 lt!376607))) lt!376416))))

(assert (= (and d!106089 res!565927) b!831490))

(assert (= (and b!831490 (not res!565928)) b!831491))

(assert (=> d!106089 m!774595))

(declare-fun m!774875 () Bool)

(assert (=> d!106089 m!774875))

(declare-fun m!774877 () Bool)

(assert (=> b!831491 m!774877))

(assert (=> b!830480 d!106089))

(declare-fun d!106091 () Bool)

(declare-fun lt!377141 () Bool)

(assert (=> d!106091 (= lt!377141 (select (content!385 lt!376544) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun e!463667 () Bool)

(assert (=> d!106091 (= lt!377141 e!463667)))

(declare-fun res!565929 () Bool)

(assert (=> d!106091 (=> (not res!565929) (not e!463667))))

(assert (=> d!106091 (= res!565929 ((_ is Cons!15940) lt!376544))))

(assert (=> d!106091 (= (contains!4188 lt!376544 (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))) lt!377141)))

(declare-fun b!831492 () Bool)

(declare-fun e!463668 () Bool)

(assert (=> b!831492 (= e!463667 e!463668)))

(declare-fun res!565930 () Bool)

(assert (=> b!831492 (=> res!565930 e!463668)))

(assert (=> b!831492 (= res!565930 (= (h!17069 lt!376544) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(declare-fun b!831493 () Bool)

(assert (=> b!831493 (= e!463668 (contains!4188 (t!22300 lt!376544) (tuple2!10161 (_1!5091 lt!376416) (_2!5091 lt!376416))))))

(assert (= (and d!106091 res!565929) b!831492))

(assert (= (and b!831492 (not res!565930)) b!831493))

(declare-fun m!774879 () Bool)

(assert (=> d!106091 m!774879))

(declare-fun m!774881 () Bool)

(assert (=> d!106091 m!774881))

(declare-fun m!774883 () Bool)

(assert (=> b!831493 m!774883))

(assert (=> b!830511 d!106091))

(declare-fun d!106093 () Bool)

(declare-fun lt!377142 () Bool)

(assert (=> d!106093 (= lt!377142 (select (content!385 (toList!4502 lt!376720)) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!463669 () Bool)

(assert (=> d!106093 (= lt!377142 e!463669)))

(declare-fun res!565931 () Bool)

(assert (=> d!106093 (=> (not res!565931) (not e!463669))))

(assert (=> d!106093 (= res!565931 ((_ is Cons!15940) (toList!4502 lt!376720)))))

(assert (=> d!106093 (= (contains!4188 (toList!4502 lt!376720) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377142)))

(declare-fun b!831494 () Bool)

(declare-fun e!463670 () Bool)

(assert (=> b!831494 (= e!463669 e!463670)))

(declare-fun res!565932 () Bool)

(assert (=> b!831494 (=> res!565932 e!463670)))

(assert (=> b!831494 (= res!565932 (= (h!17069 (toList!4502 lt!376720)) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831495 () Bool)

(assert (=> b!831495 (= e!463670 (contains!4188 (t!22300 (toList!4502 lt!376720)) (ite (or c!89816 c!89817) (tuple2!10161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106093 res!565931) b!831494))

(assert (= (and b!831494 (not res!565932)) b!831495))

(declare-fun m!774885 () Bool)

(assert (=> d!106093 m!774885))

(declare-fun m!774887 () Bool)

(assert (=> d!106093 m!774887))

(declare-fun m!774889 () Bool)

(assert (=> b!831495 m!774889))

(assert (=> b!830354 d!106093))

(declare-fun d!106095 () Bool)

(assert (=> d!106095 (isDefined!310 (getValueByKey!413 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377143 () Unit!28383)

(assert (=> d!106095 (= lt!377143 (choose!1430 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463671 () Bool)

(assert (=> d!106095 e!463671))

(declare-fun res!565933 () Bool)

(assert (=> d!106095 (=> (not res!565933) (not e!463671))))

(assert (=> d!106095 (= res!565933 (isStrictlySorted!437 (toList!4502 lt!376595)))))

(assert (=> d!106095 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377143)))

(declare-fun b!831496 () Bool)

(assert (=> b!831496 (= e!463671 (containsKey!399 (toList!4502 lt!376595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106095 res!565933) b!831496))

(assert (=> d!106095 m!773101))

(assert (=> d!106095 m!773101))

(assert (=> d!106095 m!773103))

(declare-fun m!774891 () Bool)

(assert (=> d!106095 m!774891))

(assert (=> d!106095 m!773795))

(assert (=> b!831496 m!773097))

(assert (=> b!830358 d!106095))

(assert (=> b!830358 d!105519))

(assert (=> b!830358 d!105521))

(declare-fun d!106097 () Bool)

(assert (=> d!106097 (= (apply!372 lt!376669 (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11824 (getValueByKey!413 (toList!4502 lt!376669) (select (arr!22314 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23222 () Bool)

(assert (= bs!23222 d!106097))

(assert (=> bs!23222 m!772925))

(assert (=> bs!23222 m!774189))

(assert (=> bs!23222 m!774189))

(declare-fun m!774893 () Bool)

(assert (=> bs!23222 m!774893))

(assert (=> b!830276 d!106097))

(assert (=> b!830276 d!105539))

(declare-fun mapIsEmpty!24471 () Bool)

(declare-fun mapRes!24471 () Bool)

(assert (=> mapIsEmpty!24471 mapRes!24471))

(declare-fun b!831498 () Bool)

(declare-fun e!463672 () Bool)

(assert (=> b!831498 (= e!463672 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24471 () Bool)

(declare-fun tp!47289 () Bool)

(declare-fun e!463673 () Bool)

(assert (=> mapNonEmpty!24471 (= mapRes!24471 (and tp!47289 e!463673))))

(declare-fun mapKey!24471 () (_ BitVec 32))

(declare-fun mapValue!24471 () ValueCell!7187)

(declare-fun mapRest!24471 () (Array (_ BitVec 32) ValueCell!7187))

(assert (=> mapNonEmpty!24471 (= mapRest!24470 (store mapRest!24471 mapKey!24471 mapValue!24471))))

(declare-fun b!831497 () Bool)

(assert (=> b!831497 (= e!463673 tp_is_empty!15205)))

(declare-fun condMapEmpty!24471 () Bool)

(declare-fun mapDefault!24471 () ValueCell!7187)

(assert (=> mapNonEmpty!24470 (= condMapEmpty!24471 (= mapRest!24470 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24471)))))

(assert (=> mapNonEmpty!24470 (= tp!47288 (and e!463672 mapRes!24471))))

(assert (= (and mapNonEmpty!24470 condMapEmpty!24471) mapIsEmpty!24471))

(assert (= (and mapNonEmpty!24470 (not condMapEmpty!24471)) mapNonEmpty!24471))

(assert (= (and mapNonEmpty!24471 ((_ is ValueCellFull!7187) mapValue!24471)) b!831497))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7187) mapDefault!24471)) b!831498))

(declare-fun m!774895 () Bool)

(assert (=> mapNonEmpty!24471 m!774895))

(declare-fun b_lambda!11377 () Bool)

(assert (= b_lambda!11371 (or (and start!71466 b_free!13495) b_lambda!11377)))

(declare-fun b_lambda!11379 () Bool)

(assert (= b_lambda!11375 (or (and start!71466 b_free!13495) b_lambda!11379)))

(declare-fun b_lambda!11381 () Bool)

(assert (= b_lambda!11373 (or (and start!71466 b_free!13495) b_lambda!11381)))

(declare-fun b_lambda!11383 () Bool)

(assert (= b_lambda!11369 (or (and start!71466 b_free!13495) b_lambda!11383)))

(check-sat (not bm!36326) (not b!831322) (not b!831481) (not b!831283) (not d!105583) (not b!831486) (not d!105599) (not d!106045) (not mapNonEmpty!24471) (not b!830562) (not d!106073) (not d!105999) (not b!830683) (not b!831344) (not d!105903) (not b!831196) (not d!105849) (not b!831346) (not b!830691) (not d!105767) (not d!105953) (not d!105675) (not d!106041) (not b!830991) (not b!831383) (not b!830951) (not d!105549) (not b!830589) (not d!105537) (not b!830970) (not d!105813) (not d!105655) (not d!105919) (not b!830603) (not bm!36305) (not b!830537) (not d!105835) (not b!831269) (not b!831186) (not b!830653) (not d!106009) (not b!831456) (not b!830664) (not b!830608) (not d!105587) (not b!830878) tp_is_empty!15205 (not b!831030) (not bm!36263) (not d!105499) (not d!105681) (not b!831099) (not d!105747) (not b!831443) (not b!830651) (not b!830982) (not d!105769) (not b!830966) (not d!105427) (not b!830626) (not b!831107) (not b!831018) (not bm!36269) (not b!831167) (not b!830656) (not d!106015) (not bm!36293) (not d!105545) (not b!831225) (not b!831414) (not b!831307) (not d!105431) (not d!106083) (not b!831363) (not b!831130) (not b!831016) (not b!830611) (not d!105501) (not b!830869) (not d!105995) (not d!105417) (not b_lambda!11363) (not b!830872) b_and!22531 (not b!831189) (not b!830542) (not b!831276) (not d!105633) (not b!830743) (not b!830632) (not b!831019) (not b!831441) (not b!830888) (not b!831075) (not b!831036) (not d!105635) (not d!105853) (not d!105729) (not d!105739) (not d!105755) (not b!831031) (not b!830660) (not b!831157) (not b!831062) (not b_lambda!11383) (not b!830889) (not b!831091) (not b!831337) (not b!831400) (not b!830972) (not b!830847) (not b!831175) (not b_lambda!11349) (not b!830777) (not b!831005) (not b!830894) (not d!105713) (not b!830731) (not d!105465) (not b!830914) (not d!106033) (not d!105671) (not d!105897) (not b!831416) (not b!830975) (not b!830900) (not d!105637) (not b!830571) (not b!831217) (not b_lambda!11377) (not b!831357) (not d!105801) (not b!831279) (not d!105695) (not b!830820) (not b_lambda!11343) (not b!830636) (not b!831122) (not bm!36287) (not d!106091) (not b!830880) (not b!831032) (not b!831104) (not d!105459) (not b!831174) (not d!105687) (not d!106097) (not d!105485) (not b!830987) (not b!831312) (not b!831234) (not b!830544) (not b!831442) (not d!106001) (not b!830945) (not b!830540) (not b!831003) (not b!830576) (not b!831230) (not b!830887) (not b!830862) (not b!831390) (not b_lambda!11381) (not d!105777) (not b!830805) (not d!105679) (not b!831052) (not b!831070) (not d!105523) (not b!831171) (not b!830808) (not bm!36266) (not d!105857) (not d!105519) (not b!830998) (not b!830984) (not b!830719) (not b!830781) (not b!830533) (not b!831342) (not b!831178) (not d!105765) (not b_lambda!11347) (not b!831446) (not b!831109) (not d!105711) (not b!830736) (not b!830994) (not b!830796) (not b!830577) (not b!830935) (not d!105451) (not b!830980) (not b!831148) (not b!831188) (not b!830939) (not b!831143) (not b!831257) (not b!831026) (not d!106039) (not d!106025) (not b!831068) (not d!105689) (not bm!36273) (not b!831404) (not b!831471) (not d!106061) (not d!105475) (not b!831373) (not b!831141) (not b!830953) (not bm!36260) (not b!831223) (not d!105927) (not b!831450) (not b!830679) (not b!830689) (not b!830876) (not b!830843) (not b!831277) (not d!105627) (not b!831387) (not b!830790) (not b!831412) (not b!831491) (not bm!36299) (not b!831117) (not d!105401) (not d!105845) (not b_lambda!11341) (not d!105879) (not b!831292) (not d!105807) (not d!105457) (not b!830810) (not b!831033) (not b!830746) (not b!830674) (not d!105815) (not b!830948) (not b!830849) (not b!830535) (not b!831252) (not b!831496) (not b!830963) (not b!830979) (not d!106089) (not b!831072) (not d!105895) (not b!831071) (not b!830686) (not b!831396) (not b!831129) (not d!105623) (not b_lambda!11351) (not b!830928) (not d!105741) (not d!106051) (not b!831251) (not b_lambda!11379) (not b!831153) (not b!830672) (not bm!36279) (not b!831287) (not b!831289) (not b!830721) (not d!105503) (not b!830779) (not b!831474) (not b!831297) (not b!831463) (not b!830574) (not d!105837) (not b!830694) (not b!831004) (not d!105829) (not b!831203) (not b!831023) (not b_lambda!11365) (not b!831096) (not b!830718) (not d!105899) (not d!105847) (not d!105673) (not b!830973) (not d!106047) (not d!105723) (not b!831419) (not b!830835) (not b!831407) (not d!105783) (not d!106019) (not bm!36329) (not b!831192) (not b!830846) (not b!831134) (not b!830902) (not d!105841) (not b!830857) (not d!106007) (not b!831261) (not b!831213) (not d!105787) (not b!831489) (not b!830943) (not b!831388) (not b!831468) (not b!830559) (not b!830923) (not b!830698) (not b!830748) (not b!830989) (not b!830546) (not d!106079) (not b!831315) (not b!830602) (not b!830582) (not b!830859) (not d!105979) (not b!831150) (not b!831160) (not b!831039) (not d!106087) (not d!105609) (not d!105809) (not b!831111) (not d!105751) (not b!830929) (not b!831376) (not d!105855) (not b!830942) (not d!105665) (not d!105663) (not b!830936) (not b_next!13495) (not b!831210) (not b!831432) (not bm!36276) (not d!105775) (not b!831001) (not b!831365) (not d!105821) (not b!830557) (not d!105983) (not b_lambda!11345) (not bm!36320) (not d!105543) (not b!830666) (not b!830794) (not b!831048) (not b!830815) (not d!105885) (not b!831423) (not b!831220) (not d!105727) (not b!830909) (not b!831138) (not b!831397) (not bm!36286) (not b!831232) (not b!831429) (not d!105651) (not d!106081) (not bm!36280) (not b!830732) (not b!830580) (not d!105555) (not b!830807) (not d!106059) (not b!830828) (not bm!36317) (not d!105571) (not d!105887) (not b!830896) (not b!831478) (not b!831265) (not b!831385) (not d!105601) (not b!831056) (not b!830734) (not d!105395) (not b!831332) (not d!105749) (not d!105449) (not b!830898) (not b!830662) (not b!831209) (not bm!36296) (not b!831395) (not d!105737) (not b!831380) (not bm!36290) (not b!831227) (not b!830728) (not d!105697) (not b!831087) (not d!105453) (not bm!36311) (not d!105715) (not d!105677) (not d!105911) (not b!830926) (not b!830585) (not b!830824) (not d!105725) (not b!831008) (not d!105409) (not b!831370) (not d!105561) (not d!105495) (not d!106095) (not b!830977) (not b!830658) (not b!831466) (not b!830855) (not b!831353) (not b!831101) (not b!830657) (not b!831127) (not b!831093) (not b!831040) (not d!105909) (not d!105407) (not b!831124) (not d!105985) (not b!830911) (not b!831372) (not b!831162) (not b!831326) (not d!105757) (not d!105421) (not b!830850) (not b!830740) (not b!831241) (not d!105781) (not b!830735) (not b!831454) (not b!831439) (not d!105415) (not b!831330) (not b!831336) (not d!105795) (not b!831300) (not b!831206) (not b!830725) (not d!105607) (not b!831318) (not b!830600) (not b!830566) (not b!830901) (not d!105621) (not d!105833) (not b!831415) (not b!831483) (not b!831113) (not b!831281) (not d!105799) (not bm!36314) (not b!830907) (not b!831208) (not d!105875) (not b!830729) (not b!831060) (not d!105541) (not b!831088) (not b!830554) (not d!105939) (not b!831164) (not b!831201) (not b!831237) (not d!105685) (not b!831304) (not b!830910) (not b!830644) (not b!830832) (not b!831427) (not b!831310) (not b!831047) (not b!831254) (not b!830610) (not d!105531) (not b!831393) (not b!831149) (not b!830817) (not b!831493) (not b!830895) (not b_lambda!11361) (not b!830964) (not b!830918) (not b!831012) (not b!831084) (not d!105397) (not d!106055) (not b!831273) (not d!105405) (not b!830619) (not b!830882) (not d!105659) (not d!105437) (not d!105643) (not b!831233) (not d!105527) (not b!831345) (not d!105957) (not b!830866) (not b!831409) (not b!830737) (not b!830925) (not d!105585) (not b!830647) (not b!831049) (not b!831245) (not b!830968) (not bm!36302) (not b!831200) (not b!830717) (not bm!36323) (not d!106017) (not b!830830) (not d!105791) (not b!831360) (not b!830750) (not d!105893) (not d!105423) (not d!105657) (not b!831309) (not b!830539) (not b!830612) (not d!105805) (not d!105625) (not d!105861) (not b!830839) (not d!105889) (not b!830615) (not d!105411) (not b!831045) (not b!830996) (not b!830787) (not b!831042) (not b!830813) (not b!831349) (not b_lambda!11367) (not d!105529) (not b!830552) (not b!830597) (not b!830798) (not b!830852) (not b!830649) (not d!105439) (not d!105429) (not d!105955) (not d!105905) (not b!830624) (not b!831285) (not d!106093) (not b!831334) (not b!830960) (not b!830628) (not b!831065) (not b!831495) (not d!105789) (not d!105551) (not b!830629) (not b!830801) (not b!831146) (not b!830932) (not d!105763) (not b!830985) (not b!831436) (not d!105433) (not d!105507) (not b!831319) (not b!830885) (not b!831079) (not d!105989) (not b!830891) (not b!831368) (not b!831120) (not d!105511) (not b!830605) (not b!830875) (not b!830974) (not b!831063) (not b!831470) (not d!105605) (not bm!36272) (not b!831317) (not b!831115) (not b!831339) (not b!830650) (not b!831131) (not d!105399) (not b!830676) (not b!831021) (not b!830858) (not d!106037) (not b!830816) (not b!830730) (not bm!36283) (not d!105467) (not d!105563) (not b!831295) (not b!831434) (not b!830904) (not b!831248) (not d!105631) (not d!105859) (not b!830956) (not b!830549) (not b!830804) (not b!831459) (not b!831182) (not b!830669) (not d!105825) (not d!105943) (not bm!36308))
(check-sat b_and!22531 (not b_next!13495))
