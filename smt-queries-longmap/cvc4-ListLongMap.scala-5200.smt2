; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70218 () Bool)

(assert start!70218)

(declare-fun b_free!12611 () Bool)

(declare-fun b_next!12611 () Bool)

(assert (=> start!70218 (= b_free!12611 (not b_next!12611))))

(declare-fun tp!44554 () Bool)

(declare-fun b_and!21399 () Bool)

(assert (=> start!70218 (= tp!44554 b_and!21399)))

(declare-fun b!815775 () Bool)

(declare-fun e!452413 () Bool)

(declare-fun tp_is_empty!14321 () Bool)

(assert (=> b!815775 (= e!452413 tp_is_empty!14321)))

(declare-fun b!815776 () Bool)

(declare-fun e!452411 () Bool)

(assert (=> b!815776 (= e!452411 tp_is_empty!14321)))

(declare-fun b!815777 () Bool)

(declare-fun res!557020 () Bool)

(declare-fun e!452410 () Bool)

(assert (=> b!815777 (=> (not res!557020) (not e!452410))))

(declare-datatypes ((array!44842 0))(
  ( (array!44843 (arr!21479 (Array (_ BitVec 32) (_ BitVec 64))) (size!21900 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44842)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44842 (_ BitVec 32)) Bool)

(assert (=> b!815777 (= res!557020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815778 () Bool)

(declare-fun res!557022 () Bool)

(assert (=> b!815778 (=> (not res!557022) (not e!452410))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24095 0))(
  ( (V!24096 (val!7208 Int)) )
))
(declare-datatypes ((ValueCell!6745 0))(
  ( (ValueCellFull!6745 (v!9635 V!24095)) (EmptyCell!6745) )
))
(declare-datatypes ((array!44844 0))(
  ( (array!44845 (arr!21480 (Array (_ BitVec 32) ValueCell!6745)) (size!21901 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44844)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815778 (= res!557022 (and (= (size!21901 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21900 _keys!976) (size!21901 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815779 () Bool)

(declare-fun e!452414 () Bool)

(assert (=> b!815779 (= e!452410 (not e!452414))))

(declare-fun res!557024 () Bool)

(assert (=> b!815779 (=> res!557024 e!452414)))

(assert (=> b!815779 (= res!557024 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9458 0))(
  ( (tuple2!9459 (_1!4740 (_ BitVec 64)) (_2!4740 V!24095)) )
))
(declare-datatypes ((List!15289 0))(
  ( (Nil!15286) (Cons!15285 (h!16414 tuple2!9458) (t!21610 List!15289)) )
))
(declare-datatypes ((ListLongMap!8281 0))(
  ( (ListLongMap!8282 (toList!4156 List!15289)) )
))
(declare-fun lt!365252 () ListLongMap!8281)

(declare-fun lt!365255 () ListLongMap!8281)

(assert (=> b!815779 (= lt!365252 lt!365255)))

(declare-fun zeroValueBefore!34 () V!24095)

(declare-datatypes ((Unit!27806 0))(
  ( (Unit!27807) )
))
(declare-fun lt!365251 () Unit!27806)

(declare-fun zeroValueAfter!34 () V!24095)

(declare-fun minValue!754 () V!24095)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!314 (array!44842 array!44844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24095 V!24095 V!24095 V!24095 (_ BitVec 32) Int) Unit!27806)

(assert (=> b!815779 (= lt!365251 (lemmaNoChangeToArrayThenSameMapNoExtras!314 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2204 (array!44842 array!44844 (_ BitVec 32) (_ BitVec 32) V!24095 V!24095 (_ BitVec 32) Int) ListLongMap!8281)

(assert (=> b!815779 (= lt!365255 (getCurrentListMapNoExtraKeys!2204 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815779 (= lt!365252 (getCurrentListMapNoExtraKeys!2204 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23068 () Bool)

(declare-fun mapRes!23068 () Bool)

(assert (=> mapIsEmpty!23068 mapRes!23068))

(declare-fun b!815780 () Bool)

(assert (=> b!815780 (= e!452414 true)))

(declare-fun lt!365254 () ListLongMap!8281)

(declare-fun getCurrentListMap!2384 (array!44842 array!44844 (_ BitVec 32) (_ BitVec 32) V!24095 V!24095 (_ BitVec 32) Int) ListLongMap!8281)

(assert (=> b!815780 (= lt!365254 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365253 () ListLongMap!8281)

(declare-fun +!1790 (ListLongMap!8281 tuple2!9458) ListLongMap!8281)

(assert (=> b!815780 (= lt!365253 (+!1790 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9459 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815781 () Bool)

(declare-fun res!557023 () Bool)

(assert (=> b!815781 (=> (not res!557023) (not e!452410))))

(declare-datatypes ((List!15290 0))(
  ( (Nil!15287) (Cons!15286 (h!16415 (_ BitVec 64)) (t!21611 List!15290)) )
))
(declare-fun arrayNoDuplicates!0 (array!44842 (_ BitVec 32) List!15290) Bool)

(assert (=> b!815781 (= res!557023 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15287))))

(declare-fun b!815782 () Bool)

(declare-fun e!452409 () Bool)

(assert (=> b!815782 (= e!452409 (and e!452413 mapRes!23068))))

(declare-fun condMapEmpty!23068 () Bool)

(declare-fun mapDefault!23068 () ValueCell!6745)

