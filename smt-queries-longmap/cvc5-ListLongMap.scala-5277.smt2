; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70812 () Bool)

(assert start!70812)

(declare-fun b_free!13069 () Bool)

(declare-fun b_next!13069 () Bool)

(assert (=> start!70812 (= b_free!13069 (not b_next!13069))))

(declare-fun tp!45951 () Bool)

(declare-fun b_and!21941 () Bool)

(assert (=> start!70812 (= tp!45951 b_and!21941)))

(declare-fun mapIsEmpty!23779 () Bool)

(declare-fun mapRes!23779 () Bool)

(assert (=> mapIsEmpty!23779 mapRes!23779))

(declare-fun b!822502 () Bool)

(declare-fun e!457308 () Bool)

(declare-fun tp_is_empty!14779 () Bool)

(assert (=> b!822502 (= e!457308 tp_is_empty!14779)))

(declare-fun b!822503 () Bool)

(declare-fun e!457309 () Bool)

(declare-fun e!457311 () Bool)

(assert (=> b!822503 (= e!457309 (not e!457311))))

(declare-fun res!560991 () Bool)

(assert (=> b!822503 (=> res!560991 e!457311)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822503 (= res!560991 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24707 0))(
  ( (V!24708 (val!7437 Int)) )
))
(declare-datatypes ((tuple2!9824 0))(
  ( (tuple2!9825 (_1!4923 (_ BitVec 64)) (_2!4923 V!24707)) )
))
(declare-datatypes ((List!15638 0))(
  ( (Nil!15635) (Cons!15634 (h!16763 tuple2!9824) (t!21975 List!15638)) )
))
(declare-datatypes ((ListLongMap!8647 0))(
  ( (ListLongMap!8648 (toList!4339 List!15638)) )
))
(declare-fun lt!370189 () ListLongMap!8647)

(declare-fun lt!370196 () ListLongMap!8647)

(assert (=> b!822503 (= lt!370189 lt!370196)))

(declare-fun zeroValueBefore!34 () V!24707)

(declare-datatypes ((array!45750 0))(
  ( (array!45751 (arr!21925 (Array (_ BitVec 32) (_ BitVec 64))) (size!22346 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45750)

(declare-fun zeroValueAfter!34 () V!24707)

(declare-fun minValue!754 () V!24707)

(declare-datatypes ((ValueCell!6974 0))(
  ( (ValueCellFull!6974 (v!9868 V!24707)) (EmptyCell!6974) )
))
(declare-datatypes ((array!45752 0))(
  ( (array!45753 (arr!21926 (Array (_ BitVec 32) ValueCell!6974)) (size!22347 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45752)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28142 0))(
  ( (Unit!28143) )
))
(declare-fun lt!370192 () Unit!28142)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!468 (array!45750 array!45752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 V!24707 V!24707 (_ BitVec 32) Int) Unit!28142)

(assert (=> b!822503 (= lt!370192 (lemmaNoChangeToArrayThenSameMapNoExtras!468 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2358 (array!45750 array!45752 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8647)

(assert (=> b!822503 (= lt!370196 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822503 (= lt!370189 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23779 () Bool)

(declare-fun tp!45952 () Bool)

(declare-fun e!457306 () Bool)

(assert (=> mapNonEmpty!23779 (= mapRes!23779 (and tp!45952 e!457306))))

(declare-fun mapValue!23779 () ValueCell!6974)

(declare-fun mapRest!23779 () (Array (_ BitVec 32) ValueCell!6974))

(declare-fun mapKey!23779 () (_ BitVec 32))

(assert (=> mapNonEmpty!23779 (= (arr!21926 _values!788) (store mapRest!23779 mapKey!23779 mapValue!23779))))

(declare-fun res!560994 () Bool)

(assert (=> start!70812 (=> (not res!560994) (not e!457309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70812 (= res!560994 (validMask!0 mask!1312))))

(assert (=> start!70812 e!457309))

(assert (=> start!70812 tp_is_empty!14779))

(declare-fun array_inv!17513 (array!45750) Bool)

(assert (=> start!70812 (array_inv!17513 _keys!976)))

(assert (=> start!70812 true))

(declare-fun e!457310 () Bool)

(declare-fun array_inv!17514 (array!45752) Bool)

(assert (=> start!70812 (and (array_inv!17514 _values!788) e!457310)))

(assert (=> start!70812 tp!45951))

(declare-fun b!822504 () Bool)

(assert (=> b!822504 (= e!457311 true)))

(declare-fun lt!370190 () ListLongMap!8647)

(declare-fun lt!370191 () ListLongMap!8647)

(declare-fun lt!370188 () tuple2!9824)

(declare-fun +!1889 (ListLongMap!8647 tuple2!9824) ListLongMap!8647)

(assert (=> b!822504 (= lt!370190 (+!1889 lt!370191 lt!370188))))

(declare-fun lt!370193 () Unit!28142)

(declare-fun addCommutativeForDiffKeys!452 (ListLongMap!8647 (_ BitVec 64) V!24707 (_ BitVec 64) V!24707) Unit!28142)

(assert (=> b!822504 (= lt!370193 (addCommutativeForDiffKeys!452 lt!370189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370194 () ListLongMap!8647)

(assert (=> b!822504 (= lt!370194 lt!370190)))

(declare-fun lt!370197 () tuple2!9824)

(assert (=> b!822504 (= lt!370190 (+!1889 (+!1889 lt!370189 lt!370188) lt!370197))))

(assert (=> b!822504 (= lt!370188 (tuple2!9825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370195 () ListLongMap!8647)

(assert (=> b!822504 (= lt!370195 lt!370191)))

(assert (=> b!822504 (= lt!370191 (+!1889 lt!370189 lt!370197))))

(assert (=> b!822504 (= lt!370197 (tuple2!9825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2503 (array!45750 array!45752 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8647)

(assert (=> b!822504 (= lt!370194 (getCurrentListMap!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822504 (= lt!370195 (getCurrentListMap!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822505 () Bool)

(declare-fun res!560990 () Bool)

(assert (=> b!822505 (=> (not res!560990) (not e!457309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45750 (_ BitVec 32)) Bool)

(assert (=> b!822505 (= res!560990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822506 () Bool)

(assert (=> b!822506 (= e!457306 tp_is_empty!14779)))

(declare-fun b!822507 () Bool)

(declare-fun res!560992 () Bool)

(assert (=> b!822507 (=> (not res!560992) (not e!457309))))

(assert (=> b!822507 (= res!560992 (and (= (size!22347 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22346 _keys!976) (size!22347 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822508 () Bool)

(declare-fun res!560993 () Bool)

(assert (=> b!822508 (=> (not res!560993) (not e!457309))))

(declare-datatypes ((List!15639 0))(
  ( (Nil!15636) (Cons!15635 (h!16764 (_ BitVec 64)) (t!21976 List!15639)) )
))
(declare-fun arrayNoDuplicates!0 (array!45750 (_ BitVec 32) List!15639) Bool)

(assert (=> b!822508 (= res!560993 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15636))))

(declare-fun b!822509 () Bool)

(assert (=> b!822509 (= e!457310 (and e!457308 mapRes!23779))))

(declare-fun condMapEmpty!23779 () Bool)

(declare-fun mapDefault!23779 () ValueCell!6974)

