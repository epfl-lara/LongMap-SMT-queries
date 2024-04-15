; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70978 () Bool)

(assert start!70978)

(declare-fun b_free!13201 () Bool)

(declare-fun b_next!13201 () Bool)

(assert (=> start!70978 (= b_free!13201 (not b_next!13201))))

(declare-fun tp!46356 () Bool)

(declare-fun b_and!22079 () Bool)

(assert (=> start!70978 (= tp!46356 b_and!22079)))

(declare-fun b!824206 () Bool)

(declare-fun res!561985 () Bool)

(declare-fun e!458545 () Bool)

(assert (=> b!824206 (=> (not res!561985) (not e!458545))))

(declare-datatypes ((array!45979 0))(
  ( (array!45980 (arr!22037 (Array (_ BitVec 32) (_ BitVec 64))) (size!22458 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45979)

(declare-datatypes ((List!15732 0))(
  ( (Nil!15729) (Cons!15728 (h!16857 (_ BitVec 64)) (t!22066 List!15732)) )
))
(declare-fun arrayNoDuplicates!0 (array!45979 (_ BitVec 32) List!15732) Bool)

(assert (=> b!824206 (= res!561985 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15729))))

(declare-fun mapIsEmpty!23986 () Bool)

(declare-fun mapRes!23986 () Bool)

(assert (=> mapIsEmpty!23986 mapRes!23986))

(declare-fun b!824207 () Bool)

(declare-fun e!458548 () Bool)

(declare-fun e!458546 () Bool)

(assert (=> b!824207 (= e!458548 (and e!458546 mapRes!23986))))

(declare-fun condMapEmpty!23986 () Bool)

(declare-datatypes ((V!24883 0))(
  ( (V!24884 (val!7503 Int)) )
))
(declare-datatypes ((ValueCell!7040 0))(
  ( (ValueCellFull!7040 (v!9930 V!24883)) (EmptyCell!7040) )
))
(declare-datatypes ((array!45981 0))(
  ( (array!45982 (arr!22038 (Array (_ BitVec 32) ValueCell!7040)) (size!22459 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45981)

(declare-fun mapDefault!23986 () ValueCell!7040)

(assert (=> b!824207 (= condMapEmpty!23986 (= (arr!22038 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7040)) mapDefault!23986)))))

(declare-fun b!824208 () Bool)

(declare-fun res!561982 () Bool)

(assert (=> b!824208 (=> (not res!561982) (not e!458545))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45979 (_ BitVec 32)) Bool)

(assert (=> b!824208 (= res!561982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23986 () Bool)

(declare-fun tp!46357 () Bool)

(declare-fun e!458549 () Bool)

(assert (=> mapNonEmpty!23986 (= mapRes!23986 (and tp!46357 e!458549))))

(declare-fun mapRest!23986 () (Array (_ BitVec 32) ValueCell!7040))

(declare-fun mapValue!23986 () ValueCell!7040)

(declare-fun mapKey!23986 () (_ BitVec 32))

(assert (=> mapNonEmpty!23986 (= (arr!22038 _values!788) (store mapRest!23986 mapKey!23986 mapValue!23986))))

(declare-fun b!824210 () Bool)

(declare-fun tp_is_empty!14911 () Bool)

(assert (=> b!824210 (= e!458549 tp_is_empty!14911)))

(declare-fun b!824211 () Bool)

(declare-fun res!561984 () Bool)

(assert (=> b!824211 (=> (not res!561984) (not e!458545))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824211 (= res!561984 (and (= (size!22459 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22458 _keys!976) (size!22459 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561983 () Bool)

(assert (=> start!70978 (=> (not res!561983) (not e!458545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70978 (= res!561983 (validMask!0 mask!1312))))

(assert (=> start!70978 e!458545))

(assert (=> start!70978 tp_is_empty!14911))

(declare-fun array_inv!17649 (array!45979) Bool)

(assert (=> start!70978 (array_inv!17649 _keys!976)))

(assert (=> start!70978 true))

(declare-fun array_inv!17650 (array!45981) Bool)

(assert (=> start!70978 (and (array_inv!17650 _values!788) e!458548)))

(assert (=> start!70978 tp!46356))

(declare-fun b!824209 () Bool)

(assert (=> b!824209 (= e!458546 tp_is_empty!14911)))

(declare-fun b!824212 () Bool)

(declare-fun e!458544 () Bool)

(assert (=> b!824212 (= e!458544 true)))

(declare-fun zeroValueBefore!34 () V!24883)

(declare-fun minValue!754 () V!24883)

(declare-datatypes ((tuple2!9932 0))(
  ( (tuple2!9933 (_1!4977 (_ BitVec 64)) (_2!4977 V!24883)) )
))
(declare-datatypes ((List!15733 0))(
  ( (Nil!15730) (Cons!15729 (h!16858 tuple2!9932) (t!22067 List!15733)) )
))
(declare-datatypes ((ListLongMap!8745 0))(
  ( (ListLongMap!8746 (toList!4388 List!15733)) )
))
(declare-fun lt!371589 () ListLongMap!8745)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2484 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!824212 (= lt!371589 (getCurrentListMap!2484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824213 () Bool)

(assert (=> b!824213 (= e!458545 (not e!458544))))

(declare-fun res!561986 () Bool)

(assert (=> b!824213 (=> res!561986 e!458544)))

(assert (=> b!824213 (= res!561986 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371588 () ListLongMap!8745)

(declare-fun lt!371590 () ListLongMap!8745)

(assert (=> b!824213 (= lt!371588 lt!371590)))

(declare-fun zeroValueAfter!34 () V!24883)

(declare-datatypes ((Unit!28200 0))(
  ( (Unit!28201) )
))
(declare-fun lt!371591 () Unit!28200)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!525 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 V!24883 V!24883 (_ BitVec 32) Int) Unit!28200)

(assert (=> b!824213 (= lt!371591 (lemmaNoChangeToArrayThenSameMapNoExtras!525 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2432 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!824213 (= lt!371590 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824213 (= lt!371588 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70978 res!561983) b!824211))

(assert (= (and b!824211 res!561984) b!824208))

(assert (= (and b!824208 res!561982) b!824206))

(assert (= (and b!824206 res!561985) b!824213))

(assert (= (and b!824213 (not res!561986)) b!824212))

(assert (= (and b!824207 condMapEmpty!23986) mapIsEmpty!23986))

(assert (= (and b!824207 (not condMapEmpty!23986)) mapNonEmpty!23986))

(get-info :version)

(assert (= (and mapNonEmpty!23986 ((_ is ValueCellFull!7040) mapValue!23986)) b!824210))

(assert (= (and b!824207 ((_ is ValueCellFull!7040) mapDefault!23986)) b!824209))

(assert (= start!70978 b!824207))

(declare-fun m!765785 () Bool)

(assert (=> b!824213 m!765785))

(declare-fun m!765787 () Bool)

(assert (=> b!824213 m!765787))

(declare-fun m!765789 () Bool)

(assert (=> b!824213 m!765789))

(declare-fun m!765791 () Bool)

(assert (=> b!824212 m!765791))

(declare-fun m!765793 () Bool)

(assert (=> start!70978 m!765793))

(declare-fun m!765795 () Bool)

(assert (=> start!70978 m!765795))

(declare-fun m!765797 () Bool)

(assert (=> start!70978 m!765797))

(declare-fun m!765799 () Bool)

(assert (=> b!824208 m!765799))

(declare-fun m!765801 () Bool)

(assert (=> mapNonEmpty!23986 m!765801))

(declare-fun m!765803 () Bool)

(assert (=> b!824206 m!765803))

(check-sat b_and!22079 (not b!824208) tp_is_empty!14911 (not b!824213) (not mapNonEmpty!23986) (not start!70978) (not b_next!13201) (not b!824206) (not b!824212))
(check-sat b_and!22079 (not b_next!13201))
