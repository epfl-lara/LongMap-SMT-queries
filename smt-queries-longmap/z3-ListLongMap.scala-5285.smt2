; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70882 () Bool)

(assert start!70882)

(declare-fun b_free!13119 () Bool)

(declare-fun b_next!13119 () Bool)

(assert (=> start!70882 (= b_free!13119 (not b_next!13119))))

(declare-fun tp!46104 () Bool)

(declare-fun b_and!22003 () Bool)

(assert (=> start!70882 (= tp!46104 b_and!22003)))

(declare-fun b!823283 () Bool)

(declare-fun res!561447 () Bool)

(declare-fun e!457874 () Bool)

(assert (=> b!823283 (=> (not res!561447) (not e!457874))))

(declare-datatypes ((array!45850 0))(
  ( (array!45851 (arr!21974 (Array (_ BitVec 32) (_ BitVec 64))) (size!22395 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45850)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45850 (_ BitVec 32)) Bool)

(assert (=> b!823283 (= res!561447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823284 () Bool)

(declare-fun e!457870 () Bool)

(declare-fun tp_is_empty!14829 () Bool)

(assert (=> b!823284 (= e!457870 tp_is_empty!14829)))

(declare-fun b!823285 () Bool)

(declare-fun e!457873 () Bool)

(declare-fun mapRes!23857 () Bool)

(assert (=> b!823285 (= e!457873 (and e!457870 mapRes!23857))))

(declare-fun condMapEmpty!23857 () Bool)

(declare-datatypes ((V!24773 0))(
  ( (V!24774 (val!7462 Int)) )
))
(declare-datatypes ((ValueCell!6999 0))(
  ( (ValueCellFull!6999 (v!9894 V!24773)) (EmptyCell!6999) )
))
(declare-datatypes ((array!45852 0))(
  ( (array!45853 (arr!21975 (Array (_ BitVec 32) ValueCell!6999)) (size!22396 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45852)

(declare-fun mapDefault!23857 () ValueCell!6999)

(assert (=> b!823285 (= condMapEmpty!23857 (= (arr!21975 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6999)) mapDefault!23857)))))

(declare-fun res!561445 () Bool)

(assert (=> start!70882 (=> (not res!561445) (not e!457874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70882 (= res!561445 (validMask!0 mask!1312))))

(assert (=> start!70882 e!457874))

(assert (=> start!70882 tp_is_empty!14829))

(declare-fun array_inv!17547 (array!45850) Bool)

(assert (=> start!70882 (array_inv!17547 _keys!976)))

(assert (=> start!70882 true))

(declare-fun array_inv!17548 (array!45852) Bool)

(assert (=> start!70882 (and (array_inv!17548 _values!788) e!457873)))

(assert (=> start!70882 tp!46104))

(declare-fun b!823286 () Bool)

(declare-fun res!561444 () Bool)

(assert (=> b!823286 (=> (not res!561444) (not e!457874))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823286 (= res!561444 (and (= (size!22396 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22395 _keys!976) (size!22396 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23857 () Bool)

(assert (=> mapIsEmpty!23857 mapRes!23857))

(declare-fun b!823287 () Bool)

(declare-fun e!457871 () Bool)

(assert (=> b!823287 (= e!457871 tp_is_empty!14829)))

(declare-fun b!823288 () Bool)

(declare-fun res!561446 () Bool)

(assert (=> b!823288 (=> (not res!561446) (not e!457874))))

(declare-datatypes ((List!15680 0))(
  ( (Nil!15677) (Cons!15676 (h!16805 (_ BitVec 64)) (t!22019 List!15680)) )
))
(declare-fun arrayNoDuplicates!0 (array!45850 (_ BitVec 32) List!15680) Bool)

(assert (=> b!823288 (= res!561446 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15677))))

(declare-fun b!823289 () Bool)

(declare-fun e!457869 () Bool)

(assert (=> b!823289 (= e!457869 true)))

(declare-datatypes ((tuple2!9868 0))(
  ( (tuple2!9869 (_1!4945 (_ BitVec 64)) (_2!4945 V!24773)) )
))
(declare-datatypes ((List!15681 0))(
  ( (Nil!15678) (Cons!15677 (h!16806 tuple2!9868) (t!22020 List!15681)) )
))
(declare-datatypes ((ListLongMap!8691 0))(
  ( (ListLongMap!8692 (toList!4361 List!15681)) )
))
(declare-fun lt!371094 () ListLongMap!8691)

(declare-fun lt!371102 () ListLongMap!8691)

(declare-fun lt!371093 () tuple2!9868)

(declare-fun +!1910 (ListLongMap!8691 tuple2!9868) ListLongMap!8691)

(assert (=> b!823289 (= lt!371094 (+!1910 lt!371102 lt!371093))))

(declare-fun zeroValueAfter!34 () V!24773)

(declare-fun minValue!754 () V!24773)

(declare-datatypes ((Unit!28188 0))(
  ( (Unit!28189) )
))
(declare-fun lt!371096 () Unit!28188)

(declare-fun lt!371100 () ListLongMap!8691)

(declare-fun addCommutativeForDiffKeys!473 (ListLongMap!8691 (_ BitVec 64) V!24773 (_ BitVec 64) V!24773) Unit!28188)

(assert (=> b!823289 (= lt!371096 (addCommutativeForDiffKeys!473 lt!371100 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371097 () ListLongMap!8691)

(assert (=> b!823289 (= lt!371097 lt!371094)))

(declare-fun lt!371098 () tuple2!9868)

(assert (=> b!823289 (= lt!371094 (+!1910 (+!1910 lt!371100 lt!371093) lt!371098))))

(assert (=> b!823289 (= lt!371093 (tuple2!9869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371101 () ListLongMap!8691)

(assert (=> b!823289 (= lt!371101 lt!371102)))

(assert (=> b!823289 (= lt!371102 (+!1910 lt!371100 lt!371098))))

(assert (=> b!823289 (= lt!371098 (tuple2!9869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2524 (array!45850 array!45852 (_ BitVec 32) (_ BitVec 32) V!24773 V!24773 (_ BitVec 32) Int) ListLongMap!8691)

(assert (=> b!823289 (= lt!371097 (getCurrentListMap!2524 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24773)

(assert (=> b!823289 (= lt!371101 (getCurrentListMap!2524 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823290 () Bool)

(assert (=> b!823290 (= e!457874 (not e!457869))))

(declare-fun res!561448 () Bool)

(assert (=> b!823290 (=> res!561448 e!457869)))

(assert (=> b!823290 (= res!561448 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371099 () ListLongMap!8691)

(assert (=> b!823290 (= lt!371100 lt!371099)))

(declare-fun lt!371095 () Unit!28188)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!486 (array!45850 array!45852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24773 V!24773 V!24773 V!24773 (_ BitVec 32) Int) Unit!28188)

(assert (=> b!823290 (= lt!371095 (lemmaNoChangeToArrayThenSameMapNoExtras!486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2376 (array!45850 array!45852 (_ BitVec 32) (_ BitVec 32) V!24773 V!24773 (_ BitVec 32) Int) ListLongMap!8691)

(assert (=> b!823290 (= lt!371099 (getCurrentListMapNoExtraKeys!2376 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823290 (= lt!371100 (getCurrentListMapNoExtraKeys!2376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23857 () Bool)

(declare-fun tp!46105 () Bool)

(assert (=> mapNonEmpty!23857 (= mapRes!23857 (and tp!46105 e!457871))))

(declare-fun mapValue!23857 () ValueCell!6999)

(declare-fun mapRest!23857 () (Array (_ BitVec 32) ValueCell!6999))

(declare-fun mapKey!23857 () (_ BitVec 32))

(assert (=> mapNonEmpty!23857 (= (arr!21975 _values!788) (store mapRest!23857 mapKey!23857 mapValue!23857))))

(assert (= (and start!70882 res!561445) b!823286))

(assert (= (and b!823286 res!561444) b!823283))

(assert (= (and b!823283 res!561447) b!823288))

(assert (= (and b!823288 res!561446) b!823290))

(assert (= (and b!823290 (not res!561448)) b!823289))

(assert (= (and b!823285 condMapEmpty!23857) mapIsEmpty!23857))

(assert (= (and b!823285 (not condMapEmpty!23857)) mapNonEmpty!23857))

(get-info :version)

(assert (= (and mapNonEmpty!23857 ((_ is ValueCellFull!6999) mapValue!23857)) b!823287))

(assert (= (and b!823285 ((_ is ValueCellFull!6999) mapDefault!23857)) b!823284))

(assert (= start!70882 b!823285))

(declare-fun m!765393 () Bool)

(assert (=> b!823283 m!765393))

(declare-fun m!765395 () Bool)

(assert (=> b!823289 m!765395))

(declare-fun m!765397 () Bool)

(assert (=> b!823289 m!765397))

(declare-fun m!765399 () Bool)

(assert (=> b!823289 m!765399))

(declare-fun m!765401 () Bool)

(assert (=> b!823289 m!765401))

(declare-fun m!765403 () Bool)

(assert (=> b!823289 m!765403))

(assert (=> b!823289 m!765395))

(declare-fun m!765405 () Bool)

(assert (=> b!823289 m!765405))

(declare-fun m!765407 () Bool)

(assert (=> b!823289 m!765407))

(declare-fun m!765409 () Bool)

(assert (=> b!823288 m!765409))

(declare-fun m!765411 () Bool)

(assert (=> b!823290 m!765411))

(declare-fun m!765413 () Bool)

(assert (=> b!823290 m!765413))

(declare-fun m!765415 () Bool)

(assert (=> b!823290 m!765415))

(declare-fun m!765417 () Bool)

(assert (=> mapNonEmpty!23857 m!765417))

(declare-fun m!765419 () Bool)

(assert (=> start!70882 m!765419))

(declare-fun m!765421 () Bool)

(assert (=> start!70882 m!765421))

(declare-fun m!765423 () Bool)

(assert (=> start!70882 m!765423))

(check-sat (not b!823290) (not b!823289) (not mapNonEmpty!23857) (not start!70882) (not b!823288) b_and!22003 tp_is_empty!14829 (not b_next!13119) (not b!823283))
(check-sat b_and!22003 (not b_next!13119))
