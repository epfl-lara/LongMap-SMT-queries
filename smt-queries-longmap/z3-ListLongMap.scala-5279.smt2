; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71010 () Bool)

(assert start!71010)

(declare-fun b_free!13081 () Bool)

(declare-fun b_next!13081 () Bool)

(assert (=> start!71010 (= b_free!13081 (not b_next!13081))))

(declare-fun tp!45990 () Bool)

(declare-fun b_and!21975 () Bool)

(assert (=> start!71010 (= tp!45990 b_and!21975)))

(declare-fun res!561507 () Bool)

(declare-fun e!458109 () Bool)

(assert (=> start!71010 (=> (not res!561507) (not e!458109))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71010 (= res!561507 (validMask!0 mask!1312))))

(assert (=> start!71010 e!458109))

(declare-fun tp_is_empty!14791 () Bool)

(assert (=> start!71010 tp_is_empty!14791))

(declare-datatypes ((array!45779 0))(
  ( (array!45780 (arr!21934 (Array (_ BitVec 32) (_ BitVec 64))) (size!22354 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45779)

(declare-fun array_inv!17547 (array!45779) Bool)

(assert (=> start!71010 (array_inv!17547 _keys!976)))

(assert (=> start!71010 true))

(declare-datatypes ((V!24723 0))(
  ( (V!24724 (val!7443 Int)) )
))
(declare-datatypes ((ValueCell!6980 0))(
  ( (ValueCellFull!6980 (v!9875 V!24723)) (EmptyCell!6980) )
))
(declare-datatypes ((array!45781 0))(
  ( (array!45782 (arr!21935 (Array (_ BitVec 32) ValueCell!6980)) (size!22355 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45781)

(declare-fun e!458108 () Bool)

(declare-fun array_inv!17548 (array!45781) Bool)

(assert (=> start!71010 (and (array_inv!17548 _values!788) e!458108)))

(assert (=> start!71010 tp!45990))

(declare-fun mapNonEmpty!23800 () Bool)

(declare-fun mapRes!23800 () Bool)

(declare-fun tp!45991 () Bool)

(declare-fun e!458106 () Bool)

(assert (=> mapNonEmpty!23800 (= mapRes!23800 (and tp!45991 e!458106))))

(declare-fun mapKey!23800 () (_ BitVec 32))

(declare-fun mapRest!23800 () (Array (_ BitVec 32) ValueCell!6980))

(declare-fun mapValue!23800 () ValueCell!6980)

(assert (=> mapNonEmpty!23800 (= (arr!21935 _values!788) (store mapRest!23800 mapKey!23800 mapValue!23800))))

(declare-fun b!823721 () Bool)

(assert (=> b!823721 (= e!458106 tp_is_empty!14791)))

(declare-fun b!823722 () Bool)

(declare-fun res!561509 () Bool)

(assert (=> b!823722 (=> (not res!561509) (not e!458109))))

(declare-datatypes ((List!15539 0))(
  ( (Nil!15536) (Cons!15535 (h!16670 (_ BitVec 64)) (t!21870 List!15539)) )
))
(declare-fun arrayNoDuplicates!0 (array!45779 (_ BitVec 32) List!15539) Bool)

(assert (=> b!823722 (= res!561509 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15536))))

(declare-fun b!823723 () Bool)

(declare-fun e!458107 () Bool)

(assert (=> b!823723 (= e!458108 (and e!458107 mapRes!23800))))

(declare-fun condMapEmpty!23800 () Bool)

(declare-fun mapDefault!23800 () ValueCell!6980)

(assert (=> b!823723 (= condMapEmpty!23800 (= (arr!21935 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6980)) mapDefault!23800)))))

(declare-fun b!823724 () Bool)

(declare-fun res!561508 () Bool)

(assert (=> b!823724 (=> (not res!561508) (not e!458109))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823724 (= res!561508 (and (= (size!22355 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22354 _keys!976) (size!22355 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823725 () Bool)

(declare-fun res!561506 () Bool)

(assert (=> b!823725 (=> (not res!561506) (not e!458109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45779 (_ BitVec 32)) Bool)

(assert (=> b!823725 (= res!561506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23800 () Bool)

(assert (=> mapIsEmpty!23800 mapRes!23800))

(declare-fun b!823726 () Bool)

(declare-fun e!458105 () Bool)

(assert (=> b!823726 (= e!458105 true)))

(declare-datatypes ((tuple2!9752 0))(
  ( (tuple2!9753 (_1!4887 (_ BitVec 64)) (_2!4887 V!24723)) )
))
(declare-datatypes ((List!15540 0))(
  ( (Nil!15537) (Cons!15536 (h!16671 tuple2!9752) (t!21871 List!15540)) )
))
(declare-datatypes ((ListLongMap!8577 0))(
  ( (ListLongMap!8578 (toList!4304 List!15540)) )
))
(declare-fun lt!370878 () ListLongMap!8577)

(declare-fun lt!370886 () ListLongMap!8577)

(declare-fun lt!370885 () tuple2!9752)

(declare-fun +!1893 (ListLongMap!8577 tuple2!9752) ListLongMap!8577)

(assert (=> b!823726 (= lt!370878 (+!1893 lt!370886 lt!370885))))

(declare-fun zeroValueAfter!34 () V!24723)

(declare-fun minValue!754 () V!24723)

(declare-datatypes ((Unit!28159 0))(
  ( (Unit!28160) )
))
(declare-fun lt!370883 () Unit!28159)

(declare-fun lt!370879 () ListLongMap!8577)

(declare-fun addCommutativeForDiffKeys!451 (ListLongMap!8577 (_ BitVec 64) V!24723 (_ BitVec 64) V!24723) Unit!28159)

(assert (=> b!823726 (= lt!370883 (addCommutativeForDiffKeys!451 lt!370879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370884 () ListLongMap!8577)

(assert (=> b!823726 (= lt!370884 lt!370878)))

(declare-fun lt!370882 () tuple2!9752)

(assert (=> b!823726 (= lt!370878 (+!1893 (+!1893 lt!370879 lt!370885) lt!370882))))

(assert (=> b!823726 (= lt!370885 (tuple2!9753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370881 () ListLongMap!8577)

(assert (=> b!823726 (= lt!370881 lt!370886)))

(assert (=> b!823726 (= lt!370886 (+!1893 lt!370879 lt!370882))))

(assert (=> b!823726 (= lt!370882 (tuple2!9753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2457 (array!45779 array!45781 (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 (_ BitVec 32) Int) ListLongMap!8577)

(assert (=> b!823726 (= lt!370884 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24723)

(assert (=> b!823726 (= lt!370881 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823727 () Bool)

(assert (=> b!823727 (= e!458109 (not e!458105))))

(declare-fun res!561505 () Bool)

(assert (=> b!823727 (=> res!561505 e!458105)))

(assert (=> b!823727 (= res!561505 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370880 () ListLongMap!8577)

(assert (=> b!823727 (= lt!370879 lt!370880)))

(declare-fun lt!370877 () Unit!28159)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!477 (array!45779 array!45781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 V!24723 V!24723 (_ BitVec 32) Int) Unit!28159)

(assert (=> b!823727 (= lt!370877 (lemmaNoChangeToArrayThenSameMapNoExtras!477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2389 (array!45779 array!45781 (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 (_ BitVec 32) Int) ListLongMap!8577)

(assert (=> b!823727 (= lt!370880 (getCurrentListMapNoExtraKeys!2389 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823727 (= lt!370879 (getCurrentListMapNoExtraKeys!2389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823728 () Bool)

(assert (=> b!823728 (= e!458107 tp_is_empty!14791)))

(assert (= (and start!71010 res!561507) b!823724))

(assert (= (and b!823724 res!561508) b!823725))

(assert (= (and b!823725 res!561506) b!823722))

(assert (= (and b!823722 res!561509) b!823727))

(assert (= (and b!823727 (not res!561505)) b!823726))

(assert (= (and b!823723 condMapEmpty!23800) mapIsEmpty!23800))

(assert (= (and b!823723 (not condMapEmpty!23800)) mapNonEmpty!23800))

(get-info :version)

(assert (= (and mapNonEmpty!23800 ((_ is ValueCellFull!6980) mapValue!23800)) b!823721))

(assert (= (and b!823723 ((_ is ValueCellFull!6980) mapDefault!23800)) b!823728))

(assert (= start!71010 b!823723))

(declare-fun m!766067 () Bool)

(assert (=> mapNonEmpty!23800 m!766067))

(declare-fun m!766069 () Bool)

(assert (=> start!71010 m!766069))

(declare-fun m!766071 () Bool)

(assert (=> start!71010 m!766071))

(declare-fun m!766073 () Bool)

(assert (=> start!71010 m!766073))

(declare-fun m!766075 () Bool)

(assert (=> b!823727 m!766075))

(declare-fun m!766077 () Bool)

(assert (=> b!823727 m!766077))

(declare-fun m!766079 () Bool)

(assert (=> b!823727 m!766079))

(declare-fun m!766081 () Bool)

(assert (=> b!823722 m!766081))

(declare-fun m!766083 () Bool)

(assert (=> b!823725 m!766083))

(declare-fun m!766085 () Bool)

(assert (=> b!823726 m!766085))

(declare-fun m!766087 () Bool)

(assert (=> b!823726 m!766087))

(assert (=> b!823726 m!766085))

(declare-fun m!766089 () Bool)

(assert (=> b!823726 m!766089))

(declare-fun m!766091 () Bool)

(assert (=> b!823726 m!766091))

(declare-fun m!766093 () Bool)

(assert (=> b!823726 m!766093))

(declare-fun m!766095 () Bool)

(assert (=> b!823726 m!766095))

(declare-fun m!766097 () Bool)

(assert (=> b!823726 m!766097))

(check-sat (not b!823725) (not start!71010) (not b!823726) (not b!823727) (not b_next!13081) (not mapNonEmpty!23800) tp_is_empty!14791 (not b!823722) b_and!21975)
(check-sat b_and!21975 (not b_next!13081))
