; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70660 () Bool)

(assert start!70660)

(declare-fun b_free!12947 () Bool)

(declare-fun b_next!12947 () Bool)

(assert (=> start!70660 (= b_free!12947 (not b_next!12947))))

(declare-fun tp!45579 () Bool)

(declare-fun b_and!21801 () Bool)

(assert (=> start!70660 (= tp!45579 b_and!21801)))

(declare-fun mapIsEmpty!23590 () Bool)

(declare-fun mapRes!23590 () Bool)

(assert (=> mapIsEmpty!23590 mapRes!23590))

(declare-fun mapNonEmpty!23590 () Bool)

(declare-fun tp!45580 () Bool)

(declare-fun e!456081 () Bool)

(assert (=> mapNonEmpty!23590 (= mapRes!23590 (and tp!45580 e!456081))))

(declare-datatypes ((V!24543 0))(
  ( (V!24544 (val!7376 Int)) )
))
(declare-datatypes ((ValueCell!6913 0))(
  ( (ValueCellFull!6913 (v!9807 V!24543)) (EmptyCell!6913) )
))
(declare-fun mapValue!23590 () ValueCell!6913)

(declare-datatypes ((array!45508 0))(
  ( (array!45509 (arr!21806 (Array (_ BitVec 32) ValueCell!6913)) (size!22227 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45508)

(declare-fun mapRest!23590 () (Array (_ BitVec 32) ValueCell!6913))

(declare-fun mapKey!23590 () (_ BitVec 32))

(assert (=> mapNonEmpty!23590 (= (arr!21806 _values!788) (store mapRest!23590 mapKey!23590 mapValue!23590))))

(declare-fun b!820824 () Bool)

(declare-fun tp_is_empty!14657 () Bool)

(assert (=> b!820824 (= e!456081 tp_is_empty!14657)))

(declare-fun b!820825 () Bool)

(declare-fun res!560007 () Bool)

(declare-fun e!456078 () Bool)

(assert (=> b!820825 (=> (not res!560007) (not e!456078))))

(declare-datatypes ((array!45510 0))(
  ( (array!45511 (arr!21807 (Array (_ BitVec 32) (_ BitVec 64))) (size!22228 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45510)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45510 (_ BitVec 32)) Bool)

(assert (=> b!820825 (= res!560007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560006 () Bool)

(assert (=> start!70660 (=> (not res!560006) (not e!456078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70660 (= res!560006 (validMask!0 mask!1312))))

(assert (=> start!70660 e!456078))

(assert (=> start!70660 tp_is_empty!14657))

(declare-fun array_inv!17429 (array!45510) Bool)

(assert (=> start!70660 (array_inv!17429 _keys!976)))

(assert (=> start!70660 true))

(declare-fun e!456079 () Bool)

(declare-fun array_inv!17430 (array!45508) Bool)

(assert (=> start!70660 (and (array_inv!17430 _values!788) e!456079)))

(assert (=> start!70660 tp!45579))

(declare-fun b!820826 () Bool)

(assert (=> b!820826 (= e!456078 (not true))))

(declare-datatypes ((tuple2!9722 0))(
  ( (tuple2!9723 (_1!4872 (_ BitVec 64)) (_2!4872 V!24543)) )
))
(declare-datatypes ((List!15542 0))(
  ( (Nil!15539) (Cons!15538 (h!16667 tuple2!9722) (t!21875 List!15542)) )
))
(declare-datatypes ((ListLongMap!8545 0))(
  ( (ListLongMap!8546 (toList!4288 List!15542)) )
))
(declare-fun lt!368932 () ListLongMap!8545)

(declare-fun lt!368930 () ListLongMap!8545)

(assert (=> b!820826 (= lt!368932 lt!368930)))

(declare-fun zeroValueBefore!34 () V!24543)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24543)

(declare-fun minValue!754 () V!24543)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28053 0))(
  ( (Unit!28054) )
))
(declare-fun lt!368931 () Unit!28053)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!424 (array!45510 array!45508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24543 V!24543 V!24543 V!24543 (_ BitVec 32) Int) Unit!28053)

(assert (=> b!820826 (= lt!368931 (lemmaNoChangeToArrayThenSameMapNoExtras!424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2314 (array!45510 array!45508 (_ BitVec 32) (_ BitVec 32) V!24543 V!24543 (_ BitVec 32) Int) ListLongMap!8545)

(assert (=> b!820826 (= lt!368930 (getCurrentListMapNoExtraKeys!2314 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820826 (= lt!368932 (getCurrentListMapNoExtraKeys!2314 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820827 () Bool)

(declare-fun e!456080 () Bool)

(assert (=> b!820827 (= e!456080 tp_is_empty!14657)))

(declare-fun b!820828 () Bool)

(declare-fun res!560005 () Bool)

(assert (=> b!820828 (=> (not res!560005) (not e!456078))))

(assert (=> b!820828 (= res!560005 (and (= (size!22227 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22228 _keys!976) (size!22227 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820829 () Bool)

(declare-fun res!560008 () Bool)

(assert (=> b!820829 (=> (not res!560008) (not e!456078))))

(declare-datatypes ((List!15543 0))(
  ( (Nil!15540) (Cons!15539 (h!16668 (_ BitVec 64)) (t!21876 List!15543)) )
))
(declare-fun arrayNoDuplicates!0 (array!45510 (_ BitVec 32) List!15543) Bool)

(assert (=> b!820829 (= res!560008 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15540))))

(declare-fun b!820830 () Bool)

(assert (=> b!820830 (= e!456079 (and e!456080 mapRes!23590))))

(declare-fun condMapEmpty!23590 () Bool)

(declare-fun mapDefault!23590 () ValueCell!6913)

