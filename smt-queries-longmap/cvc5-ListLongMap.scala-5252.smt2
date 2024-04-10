; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70632 () Bool)

(assert start!70632)

(declare-fun b_free!12919 () Bool)

(declare-fun b_next!12919 () Bool)

(assert (=> start!70632 (= b_free!12919 (not b_next!12919))))

(declare-fun tp!45495 () Bool)

(declare-fun b_and!21773 () Bool)

(assert (=> start!70632 (= tp!45495 b_and!21773)))

(declare-fun mapIsEmpty!23548 () Bool)

(declare-fun mapRes!23548 () Bool)

(assert (=> mapIsEmpty!23548 mapRes!23548))

(declare-fun res!559838 () Bool)

(declare-fun e!455868 () Bool)

(assert (=> start!70632 (=> (not res!559838) (not e!455868))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70632 (= res!559838 (validMask!0 mask!1312))))

(assert (=> start!70632 e!455868))

(declare-fun tp_is_empty!14629 () Bool)

(assert (=> start!70632 tp_is_empty!14629))

(declare-datatypes ((array!45452 0))(
  ( (array!45453 (arr!21778 (Array (_ BitVec 32) (_ BitVec 64))) (size!22199 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45452)

(declare-fun array_inv!17405 (array!45452) Bool)

(assert (=> start!70632 (array_inv!17405 _keys!976)))

(assert (=> start!70632 true))

(declare-datatypes ((V!24507 0))(
  ( (V!24508 (val!7362 Int)) )
))
(declare-datatypes ((ValueCell!6899 0))(
  ( (ValueCellFull!6899 (v!9793 V!24507)) (EmptyCell!6899) )
))
(declare-datatypes ((array!45454 0))(
  ( (array!45455 (arr!21779 (Array (_ BitVec 32) ValueCell!6899)) (size!22200 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45454)

(declare-fun e!455869 () Bool)

(declare-fun array_inv!17406 (array!45454) Bool)

(assert (=> start!70632 (and (array_inv!17406 _values!788) e!455869)))

(assert (=> start!70632 tp!45495))

(declare-fun b!820530 () Bool)

(assert (=> b!820530 (= e!455868 (not true))))

(declare-datatypes ((tuple2!9698 0))(
  ( (tuple2!9699 (_1!4860 (_ BitVec 64)) (_2!4860 V!24507)) )
))
(declare-datatypes ((List!15519 0))(
  ( (Nil!15516) (Cons!15515 (h!16644 tuple2!9698) (t!21852 List!15519)) )
))
(declare-datatypes ((ListLongMap!8521 0))(
  ( (ListLongMap!8522 (toList!4276 List!15519)) )
))
(declare-fun lt!368806 () ListLongMap!8521)

(declare-fun lt!368804 () ListLongMap!8521)

(assert (=> b!820530 (= lt!368806 lt!368804)))

(declare-fun zeroValueBefore!34 () V!24507)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24507)

(declare-fun minValue!754 () V!24507)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28029 0))(
  ( (Unit!28030) )
))
(declare-fun lt!368805 () Unit!28029)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!412 (array!45452 array!45454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 V!24507 V!24507 (_ BitVec 32) Int) Unit!28029)

(assert (=> b!820530 (= lt!368805 (lemmaNoChangeToArrayThenSameMapNoExtras!412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2302 (array!45452 array!45454 (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 (_ BitVec 32) Int) ListLongMap!8521)

(assert (=> b!820530 (= lt!368804 (getCurrentListMapNoExtraKeys!2302 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820530 (= lt!368806 (getCurrentListMapNoExtraKeys!2302 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820531 () Bool)

(declare-fun e!455871 () Bool)

(assert (=> b!820531 (= e!455871 tp_is_empty!14629)))

(declare-fun mapNonEmpty!23548 () Bool)

(declare-fun tp!45496 () Bool)

(assert (=> mapNonEmpty!23548 (= mapRes!23548 (and tp!45496 e!455871))))

(declare-fun mapValue!23548 () ValueCell!6899)

(declare-fun mapKey!23548 () (_ BitVec 32))

(declare-fun mapRest!23548 () (Array (_ BitVec 32) ValueCell!6899))

(assert (=> mapNonEmpty!23548 (= (arr!21779 _values!788) (store mapRest!23548 mapKey!23548 mapValue!23548))))

(declare-fun b!820532 () Bool)

(declare-fun res!559837 () Bool)

(assert (=> b!820532 (=> (not res!559837) (not e!455868))))

(assert (=> b!820532 (= res!559837 (and (= (size!22200 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22199 _keys!976) (size!22200 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820533 () Bool)

(declare-fun e!455870 () Bool)

(assert (=> b!820533 (= e!455869 (and e!455870 mapRes!23548))))

(declare-fun condMapEmpty!23548 () Bool)

(declare-fun mapDefault!23548 () ValueCell!6899)

