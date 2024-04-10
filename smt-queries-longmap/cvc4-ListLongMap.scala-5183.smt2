; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70088 () Bool)

(assert start!70088)

(declare-fun b_free!12509 () Bool)

(declare-fun b_next!12509 () Bool)

(assert (=> start!70088 (= b_free!12509 (not b_next!12509))))

(declare-fun tp!44241 () Bool)

(declare-fun b_and!21281 () Bool)

(assert (=> start!70088 (= tp!44241 b_and!21281)))

(declare-fun mapNonEmpty!22909 () Bool)

(declare-fun mapRes!22909 () Bool)

(declare-fun tp!44242 () Bool)

(declare-fun e!451503 () Bool)

(assert (=> mapNonEmpty!22909 (= mapRes!22909 (and tp!44242 e!451503))))

(declare-datatypes ((V!23959 0))(
  ( (V!23960 (val!7157 Int)) )
))
(declare-datatypes ((ValueCell!6694 0))(
  ( (ValueCellFull!6694 (v!9584 V!23959)) (EmptyCell!6694) )
))
(declare-fun mapRest!22909 () (Array (_ BitVec 32) ValueCell!6694))

(declare-datatypes ((array!44640 0))(
  ( (array!44641 (arr!21380 (Array (_ BitVec 32) ValueCell!6694)) (size!21801 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44640)

(declare-fun mapKey!22909 () (_ BitVec 32))

(declare-fun mapValue!22909 () ValueCell!6694)

(assert (=> mapNonEmpty!22909 (= (arr!21380 _values!788) (store mapRest!22909 mapKey!22909 mapValue!22909))))

(declare-fun b!814499 () Bool)

(declare-fun e!451501 () Bool)

(assert (=> b!814499 (= e!451501 (not true))))

(declare-datatypes ((tuple2!9380 0))(
  ( (tuple2!9381 (_1!4701 (_ BitVec 64)) (_2!4701 V!23959)) )
))
(declare-datatypes ((List!15213 0))(
  ( (Nil!15210) (Cons!15209 (h!16338 tuple2!9380) (t!21530 List!15213)) )
))
(declare-datatypes ((ListLongMap!8203 0))(
  ( (ListLongMap!8204 (toList!4117 List!15213)) )
))
(declare-fun lt!364642 () ListLongMap!8203)

(declare-fun lt!364643 () ListLongMap!8203)

(assert (=> b!814499 (= lt!364642 lt!364643)))

(declare-fun zeroValueBefore!34 () V!23959)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23959)

(declare-fun minValue!754 () V!23959)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27732 0))(
  ( (Unit!27733) )
))
(declare-fun lt!364644 () Unit!27732)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!44642 0))(
  ( (array!44643 (arr!21381 (Array (_ BitVec 32) (_ BitVec 64))) (size!21802 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44642)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!277 (array!44642 array!44640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23959 V!23959 V!23959 V!23959 (_ BitVec 32) Int) Unit!27732)

(assert (=> b!814499 (= lt!364644 (lemmaNoChangeToArrayThenSameMapNoExtras!277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2167 (array!44642 array!44640 (_ BitVec 32) (_ BitVec 32) V!23959 V!23959 (_ BitVec 32) Int) ListLongMap!8203)

(assert (=> b!814499 (= lt!364643 (getCurrentListMapNoExtraKeys!2167 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814499 (= lt!364642 (getCurrentListMapNoExtraKeys!2167 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814500 () Bool)

(declare-fun res!556312 () Bool)

(assert (=> b!814500 (=> (not res!556312) (not e!451501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44642 (_ BitVec 32)) Bool)

(assert (=> b!814500 (= res!556312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814501 () Bool)

(declare-fun res!556311 () Bool)

(assert (=> b!814501 (=> (not res!556311) (not e!451501))))

(assert (=> b!814501 (= res!556311 (and (= (size!21801 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21802 _keys!976) (size!21801 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814502 () Bool)

(declare-fun tp_is_empty!14219 () Bool)

(assert (=> b!814502 (= e!451503 tp_is_empty!14219)))

(declare-fun res!556314 () Bool)

(assert (=> start!70088 (=> (not res!556314) (not e!451501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70088 (= res!556314 (validMask!0 mask!1312))))

(assert (=> start!70088 e!451501))

(assert (=> start!70088 tp_is_empty!14219))

(declare-fun array_inv!17109 (array!44642) Bool)

(assert (=> start!70088 (array_inv!17109 _keys!976)))

(assert (=> start!70088 true))

(declare-fun e!451502 () Bool)

(declare-fun array_inv!17110 (array!44640) Bool)

(assert (=> start!70088 (and (array_inv!17110 _values!788) e!451502)))

(assert (=> start!70088 tp!44241))

(declare-fun b!814503 () Bool)

(declare-fun e!451500 () Bool)

(assert (=> b!814503 (= e!451502 (and e!451500 mapRes!22909))))

(declare-fun condMapEmpty!22909 () Bool)

(declare-fun mapDefault!22909 () ValueCell!6694)

