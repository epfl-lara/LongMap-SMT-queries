; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70200 () Bool)

(assert start!70200)

(declare-fun b_free!12593 () Bool)

(declare-fun b_next!12593 () Bool)

(assert (=> start!70200 (= b_free!12593 (not b_next!12593))))

(declare-fun tp!44499 () Bool)

(declare-fun b_and!21381 () Bool)

(assert (=> start!70200 (= tp!44499 b_and!21381)))

(declare-fun b!815559 () Bool)

(declare-fun e!452252 () Bool)

(declare-fun tp_is_empty!14303 () Bool)

(assert (=> b!815559 (= e!452252 tp_is_empty!14303)))

(declare-fun res!556885 () Bool)

(declare-fun e!452251 () Bool)

(assert (=> start!70200 (=> (not res!556885) (not e!452251))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70200 (= res!556885 (validMask!0 mask!1312))))

(assert (=> start!70200 e!452251))

(assert (=> start!70200 tp_is_empty!14303))

(declare-datatypes ((array!44808 0))(
  ( (array!44809 (arr!21462 (Array (_ BitVec 32) (_ BitVec 64))) (size!21883 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44808)

(declare-fun array_inv!17173 (array!44808) Bool)

(assert (=> start!70200 (array_inv!17173 _keys!976)))

(assert (=> start!70200 true))

(declare-datatypes ((V!24071 0))(
  ( (V!24072 (val!7199 Int)) )
))
(declare-datatypes ((ValueCell!6736 0))(
  ( (ValueCellFull!6736 (v!9626 V!24071)) (EmptyCell!6736) )
))
(declare-datatypes ((array!44810 0))(
  ( (array!44811 (arr!21463 (Array (_ BitVec 32) ValueCell!6736)) (size!21884 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44810)

(declare-fun e!452248 () Bool)

(declare-fun array_inv!17174 (array!44810) Bool)

(assert (=> start!70200 (and (array_inv!17174 _values!788) e!452248)))

(assert (=> start!70200 tp!44499))

(declare-fun b!815560 () Bool)

(declare-fun e!452249 () Bool)

(assert (=> b!815560 (= e!452251 (not e!452249))))

(declare-fun res!556886 () Bool)

(assert (=> b!815560 (=> res!556886 e!452249)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815560 (= res!556886 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9444 0))(
  ( (tuple2!9445 (_1!4733 (_ BitVec 64)) (_2!4733 V!24071)) )
))
(declare-datatypes ((List!15275 0))(
  ( (Nil!15272) (Cons!15271 (h!16400 tuple2!9444) (t!21596 List!15275)) )
))
(declare-datatypes ((ListLongMap!8267 0))(
  ( (ListLongMap!8268 (toList!4149 List!15275)) )
))
(declare-fun lt!365117 () ListLongMap!8267)

(declare-fun lt!365118 () ListLongMap!8267)

(assert (=> b!815560 (= lt!365117 lt!365118)))

(declare-fun zeroValueBefore!34 () V!24071)

(declare-fun zeroValueAfter!34 () V!24071)

(declare-fun minValue!754 () V!24071)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27794 0))(
  ( (Unit!27795) )
))
(declare-fun lt!365116 () Unit!27794)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!308 (array!44808 array!44810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24071 V!24071 V!24071 V!24071 (_ BitVec 32) Int) Unit!27794)

(assert (=> b!815560 (= lt!365116 (lemmaNoChangeToArrayThenSameMapNoExtras!308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2198 (array!44808 array!44810 (_ BitVec 32) (_ BitVec 32) V!24071 V!24071 (_ BitVec 32) Int) ListLongMap!8267)

(assert (=> b!815560 (= lt!365118 (getCurrentListMapNoExtraKeys!2198 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815560 (= lt!365117 (getCurrentListMapNoExtraKeys!2198 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815561 () Bool)

(declare-fun res!556888 () Bool)

(assert (=> b!815561 (=> (not res!556888) (not e!452251))))

(declare-datatypes ((List!15276 0))(
  ( (Nil!15273) (Cons!15272 (h!16401 (_ BitVec 64)) (t!21597 List!15276)) )
))
(declare-fun arrayNoDuplicates!0 (array!44808 (_ BitVec 32) List!15276) Bool)

(assert (=> b!815561 (= res!556888 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15273))))

(declare-fun b!815562 () Bool)

(assert (=> b!815562 (= e!452249 true)))

(declare-fun lt!365120 () ListLongMap!8267)

(declare-fun getCurrentListMap!2378 (array!44808 array!44810 (_ BitVec 32) (_ BitVec 32) V!24071 V!24071 (_ BitVec 32) Int) ListLongMap!8267)

(assert (=> b!815562 (= lt!365120 (getCurrentListMap!2378 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365119 () ListLongMap!8267)

(declare-fun +!1784 (ListLongMap!8267 tuple2!9444) ListLongMap!8267)

(assert (=> b!815562 (= lt!365119 (+!1784 (getCurrentListMap!2378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815563 () Bool)

(declare-fun res!556889 () Bool)

(assert (=> b!815563 (=> (not res!556889) (not e!452251))))

(assert (=> b!815563 (= res!556889 (and (= (size!21884 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21883 _keys!976) (size!21884 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23041 () Bool)

(declare-fun mapRes!23041 () Bool)

(assert (=> mapIsEmpty!23041 mapRes!23041))

(declare-fun b!815564 () Bool)

(assert (=> b!815564 (= e!452248 (and e!452252 mapRes!23041))))

(declare-fun condMapEmpty!23041 () Bool)

(declare-fun mapDefault!23041 () ValueCell!6736)

