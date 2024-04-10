; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71342 () Bool)

(assert start!71342)

(declare-fun b_free!13441 () Bool)

(declare-fun b_next!13441 () Bool)

(assert (=> start!71342 (= b_free!13441 (not b_next!13441))))

(declare-fun tp!47095 () Bool)

(declare-fun b_and!22411 () Bool)

(assert (=> start!71342 (= tp!47095 b_and!22411)))

(declare-fun b!828547 () Bool)

(declare-fun res!564555 () Bool)

(declare-fun e!461708 () Bool)

(assert (=> b!828547 (=> (not res!564555) (not e!461708))))

(declare-datatypes ((array!46468 0))(
  ( (array!46469 (arr!22275 (Array (_ BitVec 32) (_ BitVec 64))) (size!22696 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46468)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46468 (_ BitVec 32)) Bool)

(assert (=> b!828547 (= res!564555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24364 () Bool)

(declare-fun mapRes!24364 () Bool)

(declare-fun tp!47094 () Bool)

(declare-fun e!461710 () Bool)

(assert (=> mapNonEmpty!24364 (= mapRes!24364 (and tp!47094 e!461710))))

(declare-datatypes ((V!25203 0))(
  ( (V!25204 (val!7623 Int)) )
))
(declare-datatypes ((ValueCell!7160 0))(
  ( (ValueCellFull!7160 (v!10060 V!25203)) (EmptyCell!7160) )
))
(declare-fun mapRest!24364 () (Array (_ BitVec 32) ValueCell!7160))

(declare-fun mapKey!24364 () (_ BitVec 32))

(declare-fun mapValue!24364 () ValueCell!7160)

(declare-datatypes ((array!46470 0))(
  ( (array!46471 (arr!22276 (Array (_ BitVec 32) ValueCell!7160)) (size!22697 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46470)

(assert (=> mapNonEmpty!24364 (= (arr!22276 _values!788) (store mapRest!24364 mapKey!24364 mapValue!24364))))

(declare-fun b!828548 () Bool)

(declare-fun tp_is_empty!15151 () Bool)

(assert (=> b!828548 (= e!461710 tp_is_empty!15151)))

(declare-fun b!828549 () Bool)

(declare-fun e!461707 () Bool)

(assert (=> b!828549 (= e!461707 tp_is_empty!15151)))

(declare-fun b!828550 () Bool)

(declare-fun res!564556 () Bool)

(assert (=> b!828550 (=> (not res!564556) (not e!461708))))

(declare-datatypes ((List!15900 0))(
  ( (Nil!15897) (Cons!15896 (h!17025 (_ BitVec 64)) (t!22255 List!15900)) )
))
(declare-fun arrayNoDuplicates!0 (array!46468 (_ BitVec 32) List!15900) Bool)

(assert (=> b!828550 (= res!564556 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15897))))

(declare-fun b!828551 () Bool)

(declare-fun e!461704 () Bool)

(declare-fun e!461703 () Bool)

(assert (=> b!828551 (= e!461704 e!461703)))

(declare-fun res!564553 () Bool)

(assert (=> b!828551 (=> res!564553 e!461703)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828551 (= res!564553 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!564554 () Bool)

(assert (=> start!71342 (=> (not res!564554) (not e!461708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71342 (= res!564554 (validMask!0 mask!1312))))

(assert (=> start!71342 e!461708))

(assert (=> start!71342 tp_is_empty!15151))

(declare-fun array_inv!17745 (array!46468) Bool)

(assert (=> start!71342 (array_inv!17745 _keys!976)))

(assert (=> start!71342 true))

(declare-fun e!461705 () Bool)

(declare-fun array_inv!17746 (array!46470) Bool)

(assert (=> start!71342 (and (array_inv!17746 _values!788) e!461705)))

(assert (=> start!71342 tp!47095))

(declare-fun zeroValueBefore!34 () V!25203)

(declare-fun defaultEntry!796 () Int)

(declare-fun b!828552 () Bool)

(declare-fun minValue!754 () V!25203)

(declare-datatypes ((tuple2!10108 0))(
  ( (tuple2!10109 (_1!5065 (_ BitVec 64)) (_2!5065 V!25203)) )
))
(declare-datatypes ((List!15901 0))(
  ( (Nil!15898) (Cons!15897 (h!17026 tuple2!10108) (t!22256 List!15901)) )
))
(declare-datatypes ((ListLongMap!8931 0))(
  ( (ListLongMap!8932 (toList!4481 List!15901)) )
))
(declare-fun lt!375461 () ListLongMap!8931)

(declare-fun getCurrentListMap!2582 (array!46468 array!46470 (_ BitVec 32) (_ BitVec 32) V!25203 V!25203 (_ BitVec 32) Int) ListLongMap!8931)

(declare-fun +!1963 (ListLongMap!8931 tuple2!10108) ListLongMap!8931)

(assert (=> b!828552 (= e!461703 (= (getCurrentListMap!2582 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1963 lt!375461 (tuple2!10109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun b!828553 () Bool)

(declare-fun res!564557 () Bool)

(assert (=> b!828553 (=> (not res!564557) (not e!461708))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828553 (= res!564557 (and (= (size!22697 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22696 _keys!976) (size!22697 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24364 () Bool)

(assert (=> mapIsEmpty!24364 mapRes!24364))

(declare-fun e!461706 () Bool)

(declare-fun zeroValueAfter!34 () V!25203)

(declare-fun b!828554 () Bool)

(declare-fun lt!375463 () ListLongMap!8931)

(assert (=> b!828554 (= e!461706 (= (getCurrentListMap!2582 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1963 lt!375463 (tuple2!10109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!828555 () Bool)

(assert (=> b!828555 (= e!461705 (and e!461707 mapRes!24364))))

(declare-fun condMapEmpty!24364 () Bool)

(declare-fun mapDefault!24364 () ValueCell!7160)

