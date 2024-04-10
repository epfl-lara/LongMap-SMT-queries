; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70206 () Bool)

(assert start!70206)

(declare-fun b_free!12599 () Bool)

(declare-fun b_next!12599 () Bool)

(assert (=> start!70206 (= b_free!12599 (not b_next!12599))))

(declare-fun tp!44518 () Bool)

(declare-fun b_and!21387 () Bool)

(assert (=> start!70206 (= tp!44518 b_and!21387)))

(declare-fun b!815631 () Bool)

(declare-fun res!556930 () Bool)

(declare-fun e!452306 () Bool)

(assert (=> b!815631 (=> (not res!556930) (not e!452306))))

(declare-datatypes ((array!44820 0))(
  ( (array!44821 (arr!21468 (Array (_ BitVec 32) (_ BitVec 64))) (size!21889 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44820)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44820 (_ BitVec 32)) Bool)

(assert (=> b!815631 (= res!556930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23050 () Bool)

(declare-fun mapRes!23050 () Bool)

(declare-fun tp!44517 () Bool)

(declare-fun e!452303 () Bool)

(assert (=> mapNonEmpty!23050 (= mapRes!23050 (and tp!44517 e!452303))))

(declare-datatypes ((V!24079 0))(
  ( (V!24080 (val!7202 Int)) )
))
(declare-datatypes ((ValueCell!6739 0))(
  ( (ValueCellFull!6739 (v!9629 V!24079)) (EmptyCell!6739) )
))
(declare-fun mapRest!23050 () (Array (_ BitVec 32) ValueCell!6739))

(declare-datatypes ((array!44822 0))(
  ( (array!44823 (arr!21469 (Array (_ BitVec 32) ValueCell!6739)) (size!21890 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44822)

(declare-fun mapKey!23050 () (_ BitVec 32))

(declare-fun mapValue!23050 () ValueCell!6739)

(assert (=> mapNonEmpty!23050 (= (arr!21469 _values!788) (store mapRest!23050 mapKey!23050 mapValue!23050))))

(declare-fun b!815632 () Bool)

(declare-fun tp_is_empty!14309 () Bool)

(assert (=> b!815632 (= e!452303 tp_is_empty!14309)))

(declare-fun b!815633 () Bool)

(declare-fun e!452304 () Bool)

(assert (=> b!815633 (= e!452304 tp_is_empty!14309)))

(declare-fun mapIsEmpty!23050 () Bool)

(assert (=> mapIsEmpty!23050 mapRes!23050))

(declare-fun res!556934 () Bool)

(assert (=> start!70206 (=> (not res!556934) (not e!452306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70206 (= res!556934 (validMask!0 mask!1312))))

(assert (=> start!70206 e!452306))

(assert (=> start!70206 tp_is_empty!14309))

(declare-fun array_inv!17179 (array!44820) Bool)

(assert (=> start!70206 (array_inv!17179 _keys!976)))

(assert (=> start!70206 true))

(declare-fun e!452302 () Bool)

(declare-fun array_inv!17180 (array!44822) Bool)

(assert (=> start!70206 (and (array_inv!17180 _values!788) e!452302)))

(assert (=> start!70206 tp!44518))

(declare-fun b!815634 () Bool)

(declare-fun res!556931 () Bool)

(assert (=> b!815634 (=> (not res!556931) (not e!452306))))

(declare-datatypes ((List!15279 0))(
  ( (Nil!15276) (Cons!15275 (h!16404 (_ BitVec 64)) (t!21600 List!15279)) )
))
(declare-fun arrayNoDuplicates!0 (array!44820 (_ BitVec 32) List!15279) Bool)

(assert (=> b!815634 (= res!556931 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15276))))

(declare-fun b!815635 () Bool)

(declare-fun e!452305 () Bool)

(assert (=> b!815635 (= e!452305 true)))

(declare-fun zeroValueAfter!34 () V!24079)

(declare-fun minValue!754 () V!24079)

(declare-datatypes ((tuple2!9448 0))(
  ( (tuple2!9449 (_1!4735 (_ BitVec 64)) (_2!4735 V!24079)) )
))
(declare-datatypes ((List!15280 0))(
  ( (Nil!15277) (Cons!15276 (h!16405 tuple2!9448) (t!21601 List!15280)) )
))
(declare-datatypes ((ListLongMap!8271 0))(
  ( (ListLongMap!8272 (toList!4151 List!15280)) )
))
(declare-fun lt!365164 () ListLongMap!8271)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2380 (array!44820 array!44822 (_ BitVec 32) (_ BitVec 32) V!24079 V!24079 (_ BitVec 32) Int) ListLongMap!8271)

(assert (=> b!815635 (= lt!365164 (getCurrentListMap!2380 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24079)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365161 () ListLongMap!8271)

(declare-fun +!1786 (ListLongMap!8271 tuple2!9448) ListLongMap!8271)

(assert (=> b!815635 (= lt!365161 (+!1786 (getCurrentListMap!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815636 () Bool)

(declare-fun res!556933 () Bool)

(assert (=> b!815636 (=> (not res!556933) (not e!452306))))

(assert (=> b!815636 (= res!556933 (and (= (size!21890 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21889 _keys!976) (size!21890 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815637 () Bool)

(assert (=> b!815637 (= e!452306 (not e!452305))))

(declare-fun res!556932 () Bool)

(assert (=> b!815637 (=> res!556932 e!452305)))

(assert (=> b!815637 (= res!556932 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365163 () ListLongMap!8271)

(declare-fun lt!365165 () ListLongMap!8271)

(assert (=> b!815637 (= lt!365163 lt!365165)))

(declare-datatypes ((Unit!27798 0))(
  ( (Unit!27799) )
))
(declare-fun lt!365162 () Unit!27798)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!310 (array!44820 array!44822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24079 V!24079 V!24079 V!24079 (_ BitVec 32) Int) Unit!27798)

(assert (=> b!815637 (= lt!365162 (lemmaNoChangeToArrayThenSameMapNoExtras!310 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2200 (array!44820 array!44822 (_ BitVec 32) (_ BitVec 32) V!24079 V!24079 (_ BitVec 32) Int) ListLongMap!8271)

(assert (=> b!815637 (= lt!365165 (getCurrentListMapNoExtraKeys!2200 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815637 (= lt!365163 (getCurrentListMapNoExtraKeys!2200 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815638 () Bool)

(assert (=> b!815638 (= e!452302 (and e!452304 mapRes!23050))))

(declare-fun condMapEmpty!23050 () Bool)

(declare-fun mapDefault!23050 () ValueCell!6739)

