; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71316 () Bool)

(assert start!71316)

(declare-fun b_free!13433 () Bool)

(declare-fun b_next!13433 () Bool)

(assert (=> start!71316 (= b_free!13433 (not b_next!13433))))

(declare-fun tp!47068 () Bool)

(declare-fun b_and!22391 () Bool)

(assert (=> start!71316 (= tp!47068 b_and!22391)))

(declare-fun b!828272 () Bool)

(declare-fun res!564418 () Bool)

(declare-fun e!461522 () Bool)

(assert (=> b!828272 (=> (not res!564418) (not e!461522))))

(declare-datatypes ((array!46450 0))(
  ( (array!46451 (arr!22267 (Array (_ BitVec 32) (_ BitVec 64))) (size!22688 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46450)

(declare-datatypes ((List!15893 0))(
  ( (Nil!15890) (Cons!15889 (h!17018 (_ BitVec 64)) (t!22246 List!15893)) )
))
(declare-fun arrayNoDuplicates!0 (array!46450 (_ BitVec 32) List!15893) Bool)

(assert (=> b!828272 (= res!564418 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15890))))

(declare-fun b!828273 () Bool)

(declare-fun e!461521 () Bool)

(declare-fun tp_is_empty!15143 () Bool)

(assert (=> b!828273 (= e!461521 tp_is_empty!15143)))

(declare-fun mapNonEmpty!24349 () Bool)

(declare-fun mapRes!24349 () Bool)

(declare-fun tp!47067 () Bool)

(declare-fun e!461519 () Bool)

(assert (=> mapNonEmpty!24349 (= mapRes!24349 (and tp!47067 e!461519))))

(declare-fun mapKey!24349 () (_ BitVec 32))

(declare-datatypes ((V!25191 0))(
  ( (V!25192 (val!7619 Int)) )
))
(declare-datatypes ((ValueCell!7156 0))(
  ( (ValueCellFull!7156 (v!10055 V!25191)) (EmptyCell!7156) )
))
(declare-fun mapRest!24349 () (Array (_ BitVec 32) ValueCell!7156))

(declare-datatypes ((array!46452 0))(
  ( (array!46453 (arr!22268 (Array (_ BitVec 32) ValueCell!7156)) (size!22689 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46452)

(declare-fun mapValue!24349 () ValueCell!7156)

(assert (=> mapNonEmpty!24349 (= (arr!22268 _values!788) (store mapRest!24349 mapKey!24349 mapValue!24349))))

(declare-fun b!828275 () Bool)

(assert (=> b!828275 (= e!461519 tp_is_empty!15143)))

(declare-fun mapIsEmpty!24349 () Bool)

(assert (=> mapIsEmpty!24349 mapRes!24349))

(declare-fun b!828276 () Bool)

(declare-fun e!461518 () Bool)

(assert (=> b!828276 (= e!461518 true)))

(declare-datatypes ((tuple2!10102 0))(
  ( (tuple2!10103 (_1!5062 (_ BitVec 64)) (_2!5062 V!25191)) )
))
(declare-datatypes ((List!15894 0))(
  ( (Nil!15891) (Cons!15890 (h!17019 tuple2!10102) (t!22247 List!15894)) )
))
(declare-datatypes ((ListLongMap!8925 0))(
  ( (ListLongMap!8926 (toList!4478 List!15894)) )
))
(declare-fun lt!375276 () ListLongMap!8925)

(declare-fun zeroValueAfter!34 () V!25191)

(declare-fun minValue!754 () V!25191)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2580 (array!46450 array!46452 (_ BitVec 32) (_ BitVec 32) V!25191 V!25191 (_ BitVec 32) Int) ListLongMap!8925)

(assert (=> b!828276 (= lt!375276 (getCurrentListMap!2580 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25191)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375278 () ListLongMap!8925)

(declare-fun +!1961 (ListLongMap!8925 tuple2!10102) ListLongMap!8925)

(assert (=> b!828276 (= lt!375278 (+!1961 (getCurrentListMap!2580 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!828277 () Bool)

(declare-fun res!564414 () Bool)

(assert (=> b!828277 (=> (not res!564414) (not e!461522))))

(assert (=> b!828277 (= res!564414 (and (= (size!22689 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22688 _keys!976) (size!22689 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828278 () Bool)

(declare-fun res!564416 () Bool)

(assert (=> b!828278 (=> (not res!564416) (not e!461522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46450 (_ BitVec 32)) Bool)

(assert (=> b!828278 (= res!564416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828279 () Bool)

(assert (=> b!828279 (= e!461522 (not e!461518))))

(declare-fun res!564417 () Bool)

(assert (=> b!828279 (=> res!564417 e!461518)))

(assert (=> b!828279 (= res!564417 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375274 () ListLongMap!8925)

(declare-fun lt!375277 () ListLongMap!8925)

(assert (=> b!828279 (= lt!375274 lt!375277)))

(declare-datatypes ((Unit!28375 0))(
  ( (Unit!28376) )
))
(declare-fun lt!375275 () Unit!28375)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!568 (array!46450 array!46452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25191 V!25191 V!25191 V!25191 (_ BitVec 32) Int) Unit!28375)

(assert (=> b!828279 (= lt!375275 (lemmaNoChangeToArrayThenSameMapNoExtras!568 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2480 (array!46450 array!46452 (_ BitVec 32) (_ BitVec 32) V!25191 V!25191 (_ BitVec 32) Int) ListLongMap!8925)

(assert (=> b!828279 (= lt!375277 (getCurrentListMapNoExtraKeys!2480 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828279 (= lt!375274 (getCurrentListMapNoExtraKeys!2480 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828274 () Bool)

(declare-fun e!461520 () Bool)

(assert (=> b!828274 (= e!461520 (and e!461521 mapRes!24349))))

(declare-fun condMapEmpty!24349 () Bool)

(declare-fun mapDefault!24349 () ValueCell!7156)

