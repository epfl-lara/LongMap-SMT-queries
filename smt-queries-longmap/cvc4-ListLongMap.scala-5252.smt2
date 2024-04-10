; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70636 () Bool)

(assert start!70636)

(declare-fun b_free!12923 () Bool)

(declare-fun b_next!12923 () Bool)

(assert (=> start!70636 (= b_free!12923 (not b_next!12923))))

(declare-fun tp!45508 () Bool)

(declare-fun b_and!21777 () Bool)

(assert (=> start!70636 (= tp!45508 b_and!21777)))

(declare-fun b!820572 () Bool)

(declare-fun res!559862 () Bool)

(declare-fun e!455898 () Bool)

(assert (=> b!820572 (=> (not res!559862) (not e!455898))))

(declare-datatypes ((array!45460 0))(
  ( (array!45461 (arr!21782 (Array (_ BitVec 32) (_ BitVec 64))) (size!22203 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45460)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24511 0))(
  ( (V!24512 (val!7364 Int)) )
))
(declare-datatypes ((ValueCell!6901 0))(
  ( (ValueCellFull!6901 (v!9795 V!24511)) (EmptyCell!6901) )
))
(declare-datatypes ((array!45462 0))(
  ( (array!45463 (arr!21783 (Array (_ BitVec 32) ValueCell!6901)) (size!22204 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45462)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820572 (= res!559862 (and (= (size!22204 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22203 _keys!976) (size!22204 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820573 () Bool)

(declare-fun e!455902 () Bool)

(declare-fun tp_is_empty!14633 () Bool)

(assert (=> b!820573 (= e!455902 tp_is_empty!14633)))

(declare-fun res!559864 () Bool)

(assert (=> start!70636 (=> (not res!559864) (not e!455898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70636 (= res!559864 (validMask!0 mask!1312))))

(assert (=> start!70636 e!455898))

(assert (=> start!70636 tp_is_empty!14633))

(declare-fun array_inv!17409 (array!45460) Bool)

(assert (=> start!70636 (array_inv!17409 _keys!976)))

(assert (=> start!70636 true))

(declare-fun e!455901 () Bool)

(declare-fun array_inv!17410 (array!45462) Bool)

(assert (=> start!70636 (and (array_inv!17410 _values!788) e!455901)))

(assert (=> start!70636 tp!45508))

(declare-fun mapNonEmpty!23554 () Bool)

(declare-fun mapRes!23554 () Bool)

(declare-fun tp!45507 () Bool)

(assert (=> mapNonEmpty!23554 (= mapRes!23554 (and tp!45507 e!455902))))

(declare-fun mapKey!23554 () (_ BitVec 32))

(declare-fun mapValue!23554 () ValueCell!6901)

(declare-fun mapRest!23554 () (Array (_ BitVec 32) ValueCell!6901))

(assert (=> mapNonEmpty!23554 (= (arr!21783 _values!788) (store mapRest!23554 mapKey!23554 mapValue!23554))))

(declare-fun mapIsEmpty!23554 () Bool)

(assert (=> mapIsEmpty!23554 mapRes!23554))

(declare-fun b!820574 () Bool)

(declare-fun res!559861 () Bool)

(assert (=> b!820574 (=> (not res!559861) (not e!455898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45460 (_ BitVec 32)) Bool)

(assert (=> b!820574 (= res!559861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820575 () Bool)

(declare-fun res!559863 () Bool)

(assert (=> b!820575 (=> (not res!559863) (not e!455898))))

(declare-datatypes ((List!15522 0))(
  ( (Nil!15519) (Cons!15518 (h!16647 (_ BitVec 64)) (t!21855 List!15522)) )
))
(declare-fun arrayNoDuplicates!0 (array!45460 (_ BitVec 32) List!15522) Bool)

(assert (=> b!820575 (= res!559863 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15519))))

(declare-fun b!820576 () Bool)

(assert (=> b!820576 (= e!455898 (not true))))

(declare-datatypes ((tuple2!9702 0))(
  ( (tuple2!9703 (_1!4862 (_ BitVec 64)) (_2!4862 V!24511)) )
))
(declare-datatypes ((List!15523 0))(
  ( (Nil!15520) (Cons!15519 (h!16648 tuple2!9702) (t!21856 List!15523)) )
))
(declare-datatypes ((ListLongMap!8525 0))(
  ( (ListLongMap!8526 (toList!4278 List!15523)) )
))
(declare-fun lt!368822 () ListLongMap!8525)

(declare-fun lt!368823 () ListLongMap!8525)

(assert (=> b!820576 (= lt!368822 lt!368823)))

(declare-fun zeroValueBefore!34 () V!24511)

(declare-fun zeroValueAfter!34 () V!24511)

(declare-fun minValue!754 () V!24511)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28033 0))(
  ( (Unit!28034) )
))
(declare-fun lt!368824 () Unit!28033)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!414 (array!45460 array!45462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24511 V!24511 V!24511 V!24511 (_ BitVec 32) Int) Unit!28033)

(assert (=> b!820576 (= lt!368824 (lemmaNoChangeToArrayThenSameMapNoExtras!414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2304 (array!45460 array!45462 (_ BitVec 32) (_ BitVec 32) V!24511 V!24511 (_ BitVec 32) Int) ListLongMap!8525)

(assert (=> b!820576 (= lt!368823 (getCurrentListMapNoExtraKeys!2304 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820576 (= lt!368822 (getCurrentListMapNoExtraKeys!2304 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820577 () Bool)

(declare-fun e!455900 () Bool)

(assert (=> b!820577 (= e!455901 (and e!455900 mapRes!23554))))

(declare-fun condMapEmpty!23554 () Bool)

(declare-fun mapDefault!23554 () ValueCell!6901)

