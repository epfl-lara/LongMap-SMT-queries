; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70574 () Bool)

(assert start!70574)

(declare-fun b_free!12881 () Bool)

(declare-fun b_next!12881 () Bool)

(assert (=> start!70574 (= b_free!12881 (not b_next!12881))))

(declare-fun tp!45379 () Bool)

(declare-fun b_and!21723 () Bool)

(assert (=> start!70574 (= tp!45379 b_and!21723)))

(declare-fun b!819845 () Bool)

(declare-fun e!455373 () Bool)

(assert (=> b!819845 (= e!455373 true)))

(declare-datatypes ((V!24455 0))(
  ( (V!24456 (val!7343 Int)) )
))
(declare-datatypes ((tuple2!9668 0))(
  ( (tuple2!9669 (_1!4845 (_ BitVec 64)) (_2!4845 V!24455)) )
))
(declare-datatypes ((List!15492 0))(
  ( (Nil!15489) (Cons!15488 (h!16617 tuple2!9668) (t!21823 List!15492)) )
))
(declare-datatypes ((ListLongMap!8491 0))(
  ( (ListLongMap!8492 (toList!4261 List!15492)) )
))
(declare-fun lt!368162 () ListLongMap!8491)

(declare-fun lt!368161 () tuple2!9668)

(declare-fun lt!368160 () tuple2!9668)

(declare-fun lt!368157 () ListLongMap!8491)

(declare-fun +!1856 (ListLongMap!8491 tuple2!9668) ListLongMap!8491)

(assert (=> b!819845 (= lt!368157 (+!1856 (+!1856 lt!368162 lt!368160) lt!368161))))

(declare-fun lt!368165 () ListLongMap!8491)

(declare-fun lt!368166 () ListLongMap!8491)

(assert (=> b!819845 (= (+!1856 lt!368165 lt!368161) (+!1856 lt!368166 lt!368161))))

(declare-fun zeroValueBefore!34 () V!24455)

(declare-fun zeroValueAfter!34 () V!24455)

(declare-datatypes ((Unit!28001 0))(
  ( (Unit!28002) )
))
(declare-fun lt!368159 () Unit!28001)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!194 (ListLongMap!8491 (_ BitVec 64) V!24455 V!24455) Unit!28001)

(assert (=> b!819845 (= lt!368159 (addSameAsAddTwiceSameKeyDiffValues!194 lt!368165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819845 (= lt!368161 (tuple2!9669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455369 () Bool)

(assert (=> b!819845 e!455369))

(declare-fun res!559429 () Bool)

(assert (=> b!819845 (=> (not res!559429) (not e!455369))))

(declare-fun lt!368158 () ListLongMap!8491)

(assert (=> b!819845 (= res!559429 (= lt!368158 lt!368166))))

(assert (=> b!819845 (= lt!368166 (+!1856 lt!368165 lt!368160))))

(assert (=> b!819845 (= lt!368160 (tuple2!9669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45378 0))(
  ( (array!45379 (arr!21742 (Array (_ BitVec 32) (_ BitVec 64))) (size!22163 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45378)

(declare-fun minValue!754 () V!24455)

(declare-datatypes ((ValueCell!6880 0))(
  ( (ValueCellFull!6880 (v!9773 V!24455)) (EmptyCell!6880) )
))
(declare-datatypes ((array!45380 0))(
  ( (array!45381 (arr!21743 (Array (_ BitVec 32) ValueCell!6880)) (size!22164 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45380)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!368163 () ListLongMap!8491)

(declare-fun defaultEntry!796 () Int)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMap!2460 (array!45378 array!45380 (_ BitVec 32) (_ BitVec 32) V!24455 V!24455 (_ BitVec 32) Int) ListLongMap!8491)

(assert (=> b!819845 (= lt!368163 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819845 (= lt!368158 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819846 () Bool)

(declare-fun e!455367 () Bool)

(declare-fun tp_is_empty!14591 () Bool)

(assert (=> b!819846 (= e!455367 tp_is_empty!14591)))

(declare-fun mapNonEmpty!23488 () Bool)

(declare-fun mapRes!23488 () Bool)

(declare-fun tp!45378 () Bool)

(declare-fun e!455370 () Bool)

(assert (=> mapNonEmpty!23488 (= mapRes!23488 (and tp!45378 e!455370))))

(declare-fun mapKey!23488 () (_ BitVec 32))

(declare-fun mapRest!23488 () (Array (_ BitVec 32) ValueCell!6880))

(declare-fun mapValue!23488 () ValueCell!6880)

(assert (=> mapNonEmpty!23488 (= (arr!21743 _values!788) (store mapRest!23488 mapKey!23488 mapValue!23488))))

(declare-fun res!559426 () Bool)

(declare-fun e!455372 () Bool)

(assert (=> start!70574 (=> (not res!559426) (not e!455372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70574 (= res!559426 (validMask!0 mask!1312))))

(assert (=> start!70574 e!455372))

(assert (=> start!70574 tp_is_empty!14591))

(declare-fun array_inv!17379 (array!45378) Bool)

(assert (=> start!70574 (array_inv!17379 _keys!976)))

(assert (=> start!70574 true))

(declare-fun e!455371 () Bool)

(declare-fun array_inv!17380 (array!45380) Bool)

(assert (=> start!70574 (and (array_inv!17380 _values!788) e!455371)))

(assert (=> start!70574 tp!45379))

(declare-fun b!819847 () Bool)

(declare-fun res!559430 () Bool)

(assert (=> b!819847 (=> (not res!559430) (not e!455372))))

(assert (=> b!819847 (= res!559430 (and (= (size!22164 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22163 _keys!976) (size!22164 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819848 () Bool)

(assert (=> b!819848 (= e!455369 (= lt!368163 (+!1856 lt!368162 (tuple2!9669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819849 () Bool)

(assert (=> b!819849 (= e!455371 (and e!455367 mapRes!23488))))

(declare-fun condMapEmpty!23488 () Bool)

(declare-fun mapDefault!23488 () ValueCell!6880)

