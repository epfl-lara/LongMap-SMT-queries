; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70488 () Bool)

(assert start!70488)

(declare-fun b_free!12815 () Bool)

(declare-fun b_next!12815 () Bool)

(assert (=> start!70488 (= b_free!12815 (not b_next!12815))))

(declare-fun tp!45177 () Bool)

(declare-fun b_and!21645 () Bool)

(assert (=> start!70488 (= tp!45177 b_and!21645)))

(declare-fun b!818761 () Bool)

(declare-fun e!454551 () Bool)

(declare-fun tp_is_empty!14525 () Bool)

(assert (=> b!818761 (= e!454551 tp_is_empty!14525)))

(declare-fun b!818762 () Bool)

(declare-fun e!454555 () Bool)

(assert (=> b!818762 (= e!454555 true)))

(declare-datatypes ((V!24367 0))(
  ( (V!24368 (val!7310 Int)) )
))
(declare-datatypes ((tuple2!9608 0))(
  ( (tuple2!9609 (_1!4815 (_ BitVec 64)) (_2!4815 V!24367)) )
))
(declare-datatypes ((List!15441 0))(
  ( (Nil!15438) (Cons!15437 (h!16566 tuple2!9608) (t!21770 List!15441)) )
))
(declare-datatypes ((ListLongMap!8431 0))(
  ( (ListLongMap!8432 (toList!4231 List!15441)) )
))
(declare-fun lt!367017 () ListLongMap!8431)

(declare-fun lt!367013 () tuple2!9608)

(declare-fun lt!367021 () tuple2!9608)

(declare-fun lt!367022 () ListLongMap!8431)

(declare-fun +!1828 (ListLongMap!8431 tuple2!9608) ListLongMap!8431)

(assert (=> b!818762 (= lt!367017 (+!1828 (+!1828 lt!367022 lt!367013) lt!367021))))

(declare-fun lt!367019 () ListLongMap!8431)

(declare-fun lt!367016 () ListLongMap!8431)

(assert (=> b!818762 (= (+!1828 lt!367019 lt!367021) (+!1828 lt!367016 lt!367021))))

(declare-datatypes ((Unit!27943 0))(
  ( (Unit!27944) )
))
(declare-fun lt!367014 () Unit!27943)

(declare-fun zeroValueBefore!34 () V!24367)

(declare-fun zeroValueAfter!34 () V!24367)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!169 (ListLongMap!8431 (_ BitVec 64) V!24367 V!24367) Unit!27943)

(assert (=> b!818762 (= lt!367014 (addSameAsAddTwiceSameKeyDiffValues!169 lt!367019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818762 (= lt!367021 (tuple2!9609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454553 () Bool)

(assert (=> b!818762 e!454553))

(declare-fun res!558741 () Bool)

(assert (=> b!818762 (=> (not res!558741) (not e!454553))))

(declare-fun lt!367020 () ListLongMap!8431)

(assert (=> b!818762 (= res!558741 (= lt!367020 lt!367016))))

(assert (=> b!818762 (= lt!367016 (+!1828 lt!367019 lt!367013))))

(assert (=> b!818762 (= lt!367013 (tuple2!9609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45248 0))(
  ( (array!45249 (arr!21678 (Array (_ BitVec 32) (_ BitVec 64))) (size!22099 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45248)

(declare-fun minValue!754 () V!24367)

(declare-datatypes ((ValueCell!6847 0))(
  ( (ValueCellFull!6847 (v!9739 V!24367)) (EmptyCell!6847) )
))
(declare-datatypes ((array!45250 0))(
  ( (array!45251 (arr!21679 (Array (_ BitVec 32) ValueCell!6847)) (size!22100 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45250)

(declare-fun lt!367018 () ListLongMap!8431)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2435 (array!45248 array!45250 (_ BitVec 32) (_ BitVec 32) V!24367 V!24367 (_ BitVec 32) Int) ListLongMap!8431)

(assert (=> b!818762 (= lt!367018 (getCurrentListMap!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818762 (= lt!367020 (getCurrentListMap!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818763 () Bool)

(declare-fun e!454556 () Bool)

(declare-fun mapRes!23386 () Bool)

(assert (=> b!818763 (= e!454556 (and e!454551 mapRes!23386))))

(declare-fun condMapEmpty!23386 () Bool)

(declare-fun mapDefault!23386 () ValueCell!6847)

