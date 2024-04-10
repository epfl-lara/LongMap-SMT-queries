; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70420 () Bool)

(assert start!70420)

(declare-fun b_free!12763 () Bool)

(declare-fun b_next!12763 () Bool)

(assert (=> start!70420 (= b_free!12763 (not b_next!12763))))

(declare-fun tp!45018 () Bool)

(declare-fun b_and!21583 () Bool)

(assert (=> start!70420 (= tp!45018 b_and!21583)))

(declare-fun res!558276 () Bool)

(declare-fun e!453972 () Bool)

(assert (=> start!70420 (=> (not res!558276) (not e!453972))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70420 (= res!558276 (validMask!0 mask!1312))))

(assert (=> start!70420 e!453972))

(declare-fun tp_is_empty!14473 () Bool)

(assert (=> start!70420 tp_is_empty!14473))

(declare-datatypes ((array!45146 0))(
  ( (array!45147 (arr!21628 (Array (_ BitVec 32) (_ BitVec 64))) (size!22049 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45146)

(declare-fun array_inv!17299 (array!45146) Bool)

(assert (=> start!70420 (array_inv!17299 _keys!976)))

(assert (=> start!70420 true))

(declare-datatypes ((V!24299 0))(
  ( (V!24300 (val!7284 Int)) )
))
(declare-datatypes ((ValueCell!6821 0))(
  ( (ValueCellFull!6821 (v!9713 V!24299)) (EmptyCell!6821) )
))
(declare-datatypes ((array!45148 0))(
  ( (array!45149 (arr!21629 (Array (_ BitVec 32) ValueCell!6821)) (size!22050 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45148)

(declare-fun e!453974 () Bool)

(declare-fun array_inv!17300 (array!45148) Bool)

(assert (=> start!70420 (and (array_inv!17300 _values!788) e!453974)))

(assert (=> start!70420 tp!45018))

(declare-fun mapIsEmpty!23305 () Bool)

(declare-fun mapRes!23305 () Bool)

(assert (=> mapIsEmpty!23305 mapRes!23305))

(declare-fun mapNonEmpty!23305 () Bool)

(declare-fun tp!45019 () Bool)

(declare-fun e!453971 () Bool)

(assert (=> mapNonEmpty!23305 (= mapRes!23305 (and tp!45019 e!453971))))

(declare-fun mapRest!23305 () (Array (_ BitVec 32) ValueCell!6821))

(declare-fun mapValue!23305 () ValueCell!6821)

(declare-fun mapKey!23305 () (_ BitVec 32))

(assert (=> mapNonEmpty!23305 (= (arr!21629 _values!788) (store mapRest!23305 mapKey!23305 mapValue!23305))))

(declare-fun b!817971 () Bool)

(assert (=> b!817971 (= e!453971 tp_is_empty!14473)))

(declare-fun b!817972 () Bool)

(declare-fun res!558277 () Bool)

(assert (=> b!817972 (=> (not res!558277) (not e!453972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45146 (_ BitVec 32)) Bool)

(assert (=> b!817972 (= res!558277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817973 () Bool)

(declare-fun res!558275 () Bool)

(assert (=> b!817973 (=> (not res!558275) (not e!453972))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817973 (= res!558275 (and (= (size!22050 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22049 _keys!976) (size!22050 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817974 () Bool)

(declare-fun e!453973 () Bool)

(assert (=> b!817974 (= e!453972 (not e!453973))))

(declare-fun res!558274 () Bool)

(assert (=> b!817974 (=> res!558274 e!453973)))

(assert (=> b!817974 (= res!558274 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9574 0))(
  ( (tuple2!9575 (_1!4798 (_ BitVec 64)) (_2!4798 V!24299)) )
))
(declare-datatypes ((List!15402 0))(
  ( (Nil!15399) (Cons!15398 (h!16527 tuple2!9574) (t!21729 List!15402)) )
))
(declare-datatypes ((ListLongMap!8397 0))(
  ( (ListLongMap!8398 (toList!4214 List!15402)) )
))
(declare-fun lt!366496 () ListLongMap!8397)

(declare-fun lt!366494 () ListLongMap!8397)

(assert (=> b!817974 (= lt!366496 lt!366494)))

(declare-fun zeroValueBefore!34 () V!24299)

(declare-fun zeroValueAfter!34 () V!24299)

(declare-fun minValue!754 () V!24299)

(declare-datatypes ((Unit!27912 0))(
  ( (Unit!27913) )
))
(declare-fun lt!366495 () Unit!27912)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!365 (array!45146 array!45148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 V!24299 V!24299 (_ BitVec 32) Int) Unit!27912)

(assert (=> b!817974 (= lt!366495 (lemmaNoChangeToArrayThenSameMapNoExtras!365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2255 (array!45146 array!45148 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8397)

(assert (=> b!817974 (= lt!366494 (getCurrentListMapNoExtraKeys!2255 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817974 (= lt!366496 (getCurrentListMapNoExtraKeys!2255 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817975 () Bool)

(assert (=> b!817975 (= e!453973 true)))

(declare-fun lt!366493 () ListLongMap!8397)

(declare-fun getCurrentListMap!2420 (array!45146 array!45148 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8397)

(assert (=> b!817975 (= lt!366493 (getCurrentListMap!2420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817976 () Bool)

(declare-fun res!558278 () Bool)

(assert (=> b!817976 (=> (not res!558278) (not e!453972))))

(declare-datatypes ((List!15403 0))(
  ( (Nil!15400) (Cons!15399 (h!16528 (_ BitVec 64)) (t!21730 List!15403)) )
))
(declare-fun arrayNoDuplicates!0 (array!45146 (_ BitVec 32) List!15403) Bool)

(assert (=> b!817976 (= res!558278 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15400))))

(declare-fun b!817977 () Bool)

(declare-fun e!453975 () Bool)

(assert (=> b!817977 (= e!453975 tp_is_empty!14473)))

(declare-fun b!817978 () Bool)

(assert (=> b!817978 (= e!453974 (and e!453975 mapRes!23305))))

(declare-fun condMapEmpty!23305 () Bool)

(declare-fun mapDefault!23305 () ValueCell!6821)

