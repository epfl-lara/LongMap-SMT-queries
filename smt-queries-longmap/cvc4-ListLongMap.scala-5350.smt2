; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71678 () Bool)

(assert start!71678)

(declare-fun b_free!13511 () Bool)

(declare-fun b_next!13511 () Bool)

(assert (=> start!71678 (= b_free!13511 (not b_next!13511))))

(declare-fun tp!47330 () Bool)

(declare-fun b_and!22597 () Bool)

(assert (=> start!71678 (= tp!47330 b_and!22597)))

(declare-datatypes ((V!25295 0))(
  ( (V!25296 (val!7658 Int)) )
))
(declare-datatypes ((tuple2!10164 0))(
  ( (tuple2!10165 (_1!5093 (_ BitVec 64)) (_2!5093 V!25295)) )
))
(declare-datatypes ((List!15956 0))(
  ( (Nil!15953) (Cons!15952 (h!17083 tuple2!10164) (t!22327 List!15956)) )
))
(declare-datatypes ((ListLongMap!8987 0))(
  ( (ListLongMap!8988 (toList!4509 List!15956)) )
))
(declare-fun lt!378276 () ListLongMap!8987)

(declare-fun lt!378279 () tuple2!10164)

(declare-fun e!464983 () Bool)

(declare-fun lt!378278 () ListLongMap!8987)

(declare-fun b!833555 () Bool)

(declare-fun lt!378275 () tuple2!10164)

(declare-fun +!1987 (ListLongMap!8987 tuple2!10164) ListLongMap!8987)

(assert (=> b!833555 (= e!464983 (= lt!378278 (+!1987 (+!1987 lt!378276 lt!378279) lt!378275)))))

(declare-fun mapIsEmpty!24494 () Bool)

(declare-fun mapRes!24494 () Bool)

(assert (=> mapIsEmpty!24494 mapRes!24494))

(declare-fun b!833556 () Bool)

(declare-fun res!566793 () Bool)

(declare-fun e!464980 () Bool)

(assert (=> b!833556 (=> (not res!566793) (not e!464980))))

(declare-datatypes ((array!46616 0))(
  ( (array!46617 (arr!22342 (Array (_ BitVec 32) (_ BitVec 64))) (size!22763 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46616)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7195 0))(
  ( (ValueCellFull!7195 (v!10106 V!25295)) (EmptyCell!7195) )
))
(declare-datatypes ((array!46618 0))(
  ( (array!46619 (arr!22343 (Array (_ BitVec 32) ValueCell!7195)) (size!22764 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46618)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833556 (= res!566793 (and (= (size!22764 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22763 _keys!976) (size!22764 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833557 () Bool)

(declare-fun res!566796 () Bool)

(assert (=> b!833557 (=> (not res!566796) (not e!464980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46616 (_ BitVec 32)) Bool)

(assert (=> b!833557 (= res!566796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833558 () Bool)

(declare-fun zeroValueAfter!34 () V!25295)

(declare-fun e!464979 () Bool)

(assert (=> b!833558 (= e!464979 (= lt!378278 (+!1987 (+!1987 lt!378276 (tuple2!10165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378279)))))

(declare-fun b!833559 () Bool)

(declare-fun e!464981 () Bool)

(assert (=> b!833559 (= e!464980 (not e!464981))))

(declare-fun res!566792 () Bool)

(assert (=> b!833559 (=> res!566792 e!464981)))

(assert (=> b!833559 (= res!566792 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!378270 () ListLongMap!8987)

(assert (=> b!833559 (= lt!378270 lt!378276)))

(declare-datatypes ((Unit!28561 0))(
  ( (Unit!28562) )
))
(declare-fun lt!378274 () Unit!28561)

(declare-fun minValue!754 () V!25295)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!25295)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!596 (array!46616 array!46618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25295 V!25295 V!25295 V!25295 (_ BitVec 32) Int) Unit!28561)

(assert (=> b!833559 (= lt!378274 (lemmaNoChangeToArrayThenSameMapNoExtras!596 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2508 (array!46616 array!46618 (_ BitVec 32) (_ BitVec 32) V!25295 V!25295 (_ BitVec 32) Int) ListLongMap!8987)

(assert (=> b!833559 (= lt!378276 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833559 (= lt!378270 (getCurrentListMapNoExtraKeys!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!566794 () Bool)

(assert (=> start!71678 (=> (not res!566794) (not e!464980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71678 (= res!566794 (validMask!0 mask!1312))))

(assert (=> start!71678 e!464980))

(declare-fun tp_is_empty!15221 () Bool)

(assert (=> start!71678 tp_is_empty!15221))

(declare-fun array_inv!17795 (array!46616) Bool)

(assert (=> start!71678 (array_inv!17795 _keys!976)))

(assert (=> start!71678 true))

(declare-fun e!464984 () Bool)

(declare-fun array_inv!17796 (array!46618) Bool)

(assert (=> start!71678 (and (array_inv!17796 _values!788) e!464984)))

(assert (=> start!71678 tp!47330))

(declare-fun b!833560 () Bool)

(declare-fun e!464985 () Bool)

(assert (=> b!833560 (= e!464985 tp_is_empty!15221)))

(declare-fun mapNonEmpty!24494 () Bool)

(declare-fun tp!47329 () Bool)

(assert (=> mapNonEmpty!24494 (= mapRes!24494 (and tp!47329 e!464985))))

(declare-fun mapRest!24494 () (Array (_ BitVec 32) ValueCell!7195))

(declare-fun mapKey!24494 () (_ BitVec 32))

(declare-fun mapValue!24494 () ValueCell!7195)

(assert (=> mapNonEmpty!24494 (= (arr!22343 _values!788) (store mapRest!24494 mapKey!24494 mapValue!24494))))

(declare-fun b!833561 () Bool)

(declare-fun lt!378273 () ListLongMap!8987)

(assert (=> b!833561 (= e!464981 (= lt!378278 lt!378273))))

(declare-fun lt!378269 () ListLongMap!8987)

(assert (=> b!833561 (= lt!378269 lt!378273)))

(declare-fun lt!378272 () ListLongMap!8987)

(assert (=> b!833561 (= lt!378273 (+!1987 lt!378272 lt!378275))))

(declare-fun lt!378280 () ListLongMap!8987)

(assert (=> b!833561 (= lt!378269 (+!1987 lt!378280 lt!378275))))

(declare-fun lt!378268 () Unit!28561)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!241 (ListLongMap!8987 (_ BitVec 64) V!25295 V!25295) Unit!28561)

(assert (=> b!833561 (= lt!378268 (addSameAsAddTwiceSameKeyDiffValues!241 lt!378280 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!833561 e!464983))

(declare-fun res!566798 () Bool)

(assert (=> b!833561 (=> (not res!566798) (not e!464983))))

(declare-fun lt!378271 () ListLongMap!8987)

(assert (=> b!833561 (= res!566798 (= lt!378271 lt!378272))))

(declare-fun lt!378277 () tuple2!10164)

(assert (=> b!833561 (= lt!378272 (+!1987 lt!378280 lt!378277))))

(assert (=> b!833561 (= lt!378280 (+!1987 lt!378270 lt!378279))))

(assert (=> b!833561 (= lt!378275 (tuple2!10165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!833561 e!464979))

(declare-fun res!566795 () Bool)

(assert (=> b!833561 (=> (not res!566795) (not e!464979))))

(assert (=> b!833561 (= res!566795 (= lt!378271 (+!1987 (+!1987 lt!378270 lt!378277) lt!378279)))))

(assert (=> b!833561 (= lt!378279 (tuple2!10165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833561 (= lt!378277 (tuple2!10165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2604 (array!46616 array!46618 (_ BitVec 32) (_ BitVec 32) V!25295 V!25295 (_ BitVec 32) Int) ListLongMap!8987)

(assert (=> b!833561 (= lt!378278 (getCurrentListMap!2604 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833561 (= lt!378271 (getCurrentListMap!2604 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833562 () Bool)

(declare-fun res!566797 () Bool)

(assert (=> b!833562 (=> (not res!566797) (not e!464980))))

(declare-datatypes ((List!15957 0))(
  ( (Nil!15954) (Cons!15953 (h!17084 (_ BitVec 64)) (t!22328 List!15957)) )
))
(declare-fun arrayNoDuplicates!0 (array!46616 (_ BitVec 32) List!15957) Bool)

(assert (=> b!833562 (= res!566797 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15954))))

(declare-fun b!833563 () Bool)

(declare-fun e!464978 () Bool)

(assert (=> b!833563 (= e!464984 (and e!464978 mapRes!24494))))

(declare-fun condMapEmpty!24494 () Bool)

(declare-fun mapDefault!24494 () ValueCell!7195)

