; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70582 () Bool)

(assert start!70582)

(declare-fun b_free!12889 () Bool)

(declare-fun b_next!12889 () Bool)

(assert (=> start!70582 (= b_free!12889 (not b_next!12889))))

(declare-fun tp!45403 () Bool)

(declare-fun b_and!21731 () Bool)

(assert (=> start!70582 (= tp!45403 b_and!21731)))

(declare-fun b!819953 () Bool)

(declare-fun e!455452 () Bool)

(declare-fun tp_is_empty!14599 () Bool)

(assert (=> b!819953 (= e!455452 tp_is_empty!14599)))

(declare-datatypes ((V!24467 0))(
  ( (V!24468 (val!7347 Int)) )
))
(declare-datatypes ((tuple2!9674 0))(
  ( (tuple2!9675 (_1!4848 (_ BitVec 64)) (_2!4848 V!24467)) )
))
(declare-datatypes ((List!15497 0))(
  ( (Nil!15494) (Cons!15493 (h!16622 tuple2!9674) (t!21828 List!15497)) )
))
(declare-datatypes ((ListLongMap!8497 0))(
  ( (ListLongMap!8498 (toList!4264 List!15497)) )
))
(declare-fun lt!368283 () ListLongMap!8497)

(declare-fun zeroValueAfter!34 () V!24467)

(declare-fun e!455451 () Bool)

(declare-fun b!819954 () Bool)

(declare-fun lt!368285 () ListLongMap!8497)

(declare-fun +!1859 (ListLongMap!8497 tuple2!9674) ListLongMap!8497)

(assert (=> b!819954 (= e!455451 (= lt!368285 (+!1859 lt!368283 (tuple2!9675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819955 () Bool)

(declare-fun e!455455 () Bool)

(assert (=> b!819955 (= e!455455 true)))

(declare-fun lt!368280 () ListLongMap!8497)

(declare-fun lt!368284 () tuple2!9674)

(declare-fun lt!368277 () tuple2!9674)

(assert (=> b!819955 (= lt!368280 (+!1859 (+!1859 lt!368283 lt!368277) lt!368284))))

(declare-fun lt!368282 () ListLongMap!8497)

(declare-fun lt!368279 () ListLongMap!8497)

(assert (=> b!819955 (= (+!1859 lt!368282 lt!368284) (+!1859 lt!368279 lt!368284))))

(declare-fun zeroValueBefore!34 () V!24467)

(declare-datatypes ((Unit!28007 0))(
  ( (Unit!28008) )
))
(declare-fun lt!368278 () Unit!28007)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!196 (ListLongMap!8497 (_ BitVec 64) V!24467 V!24467) Unit!28007)

(assert (=> b!819955 (= lt!368278 (addSameAsAddTwiceSameKeyDiffValues!196 lt!368282 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819955 (= lt!368284 (tuple2!9675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819955 e!455451))

(declare-fun res!559500 () Bool)

(assert (=> b!819955 (=> (not res!559500) (not e!455451))))

(declare-fun lt!368281 () ListLongMap!8497)

(assert (=> b!819955 (= res!559500 (= lt!368281 lt!368279))))

(assert (=> b!819955 (= lt!368279 (+!1859 lt!368282 lt!368277))))

(assert (=> b!819955 (= lt!368277 (tuple2!9675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45394 0))(
  ( (array!45395 (arr!21750 (Array (_ BitVec 32) (_ BitVec 64))) (size!22171 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45394)

(declare-fun minValue!754 () V!24467)

(declare-datatypes ((ValueCell!6884 0))(
  ( (ValueCellFull!6884 (v!9777 V!24467)) (EmptyCell!6884) )
))
(declare-datatypes ((array!45396 0))(
  ( (array!45397 (arr!21751 (Array (_ BitVec 32) ValueCell!6884)) (size!22172 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45396)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2462 (array!45394 array!45396 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8497)

(assert (=> b!819955 (= lt!368285 (getCurrentListMap!2462 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819955 (= lt!368281 (getCurrentListMap!2462 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819956 () Bool)

(declare-fun res!559501 () Bool)

(declare-fun e!455454 () Bool)

(assert (=> b!819956 (=> (not res!559501) (not e!455454))))

(assert (=> b!819956 (= res!559501 (and (= (size!22172 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22171 _keys!976) (size!22172 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819957 () Bool)

(declare-fun res!559498 () Bool)

(assert (=> b!819957 (=> (not res!559498) (not e!455454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45394 (_ BitVec 32)) Bool)

(assert (=> b!819957 (= res!559498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819958 () Bool)

(declare-fun res!559499 () Bool)

(assert (=> b!819958 (=> (not res!559499) (not e!455454))))

(declare-datatypes ((List!15498 0))(
  ( (Nil!15495) (Cons!15494 (h!16623 (_ BitVec 64)) (t!21829 List!15498)) )
))
(declare-fun arrayNoDuplicates!0 (array!45394 (_ BitVec 32) List!15498) Bool)

(assert (=> b!819958 (= res!559499 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15495))))

(declare-fun mapIsEmpty!23500 () Bool)

(declare-fun mapRes!23500 () Bool)

(assert (=> mapIsEmpty!23500 mapRes!23500))

(declare-fun res!559502 () Bool)

(assert (=> start!70582 (=> (not res!559502) (not e!455454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70582 (= res!559502 (validMask!0 mask!1312))))

(assert (=> start!70582 e!455454))

(assert (=> start!70582 tp_is_empty!14599))

(declare-fun array_inv!17385 (array!45394) Bool)

(assert (=> start!70582 (array_inv!17385 _keys!976)))

(assert (=> start!70582 true))

(declare-fun e!455456 () Bool)

(declare-fun array_inv!17386 (array!45396) Bool)

(assert (=> start!70582 (and (array_inv!17386 _values!788) e!455456)))

(assert (=> start!70582 tp!45403))

(declare-fun b!819959 () Bool)

(assert (=> b!819959 (= e!455454 (not e!455455))))

(declare-fun res!559497 () Bool)

(assert (=> b!819959 (=> res!559497 e!455455)))

(assert (=> b!819959 (= res!559497 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819959 (= lt!368282 lt!368283)))

(declare-fun lt!368286 () Unit!28007)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!403 (array!45394 array!45396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 V!24467 V!24467 (_ BitVec 32) Int) Unit!28007)

(assert (=> b!819959 (= lt!368286 (lemmaNoChangeToArrayThenSameMapNoExtras!403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2293 (array!45394 array!45396 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8497)

(assert (=> b!819959 (= lt!368283 (getCurrentListMapNoExtraKeys!2293 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819959 (= lt!368282 (getCurrentListMapNoExtraKeys!2293 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23500 () Bool)

(declare-fun tp!45402 () Bool)

(declare-fun e!455453 () Bool)

(assert (=> mapNonEmpty!23500 (= mapRes!23500 (and tp!45402 e!455453))))

(declare-fun mapValue!23500 () ValueCell!6884)

(declare-fun mapRest!23500 () (Array (_ BitVec 32) ValueCell!6884))

(declare-fun mapKey!23500 () (_ BitVec 32))

(assert (=> mapNonEmpty!23500 (= (arr!21751 _values!788) (store mapRest!23500 mapKey!23500 mapValue!23500))))

(declare-fun b!819960 () Bool)

(assert (=> b!819960 (= e!455456 (and e!455452 mapRes!23500))))

(declare-fun condMapEmpty!23500 () Bool)

(declare-fun mapDefault!23500 () ValueCell!6884)

