; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70238 () Bool)

(assert start!70238)

(declare-fun b_free!12631 () Bool)

(declare-fun b_next!12631 () Bool)

(assert (=> start!70238 (= b_free!12631 (not b_next!12631))))

(declare-fun tp!44613 () Bool)

(declare-fun b_and!21419 () Bool)

(assert (=> start!70238 (= tp!44613 b_and!21419)))

(declare-fun b!816015 () Bool)

(declare-fun e!452589 () Bool)

(assert (=> b!816015 (= e!452589 true)))

(declare-datatypes ((array!44882 0))(
  ( (array!44883 (arr!21499 (Array (_ BitVec 32) (_ BitVec 64))) (size!21920 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44882)

(declare-datatypes ((V!24123 0))(
  ( (V!24124 (val!7218 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24123)

(declare-fun minValue!754 () V!24123)

(declare-datatypes ((ValueCell!6755 0))(
  ( (ValueCellFull!6755 (v!9645 V!24123)) (EmptyCell!6755) )
))
(declare-datatypes ((array!44884 0))(
  ( (array!44885 (arr!21500 (Array (_ BitVec 32) ValueCell!6755)) (size!21921 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44884)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9476 0))(
  ( (tuple2!9477 (_1!4749 (_ BitVec 64)) (_2!4749 V!24123)) )
))
(declare-datatypes ((List!15306 0))(
  ( (Nil!15303) (Cons!15302 (h!16431 tuple2!9476) (t!21627 List!15306)) )
))
(declare-datatypes ((ListLongMap!8299 0))(
  ( (ListLongMap!8300 (toList!4165 List!15306)) )
))
(declare-fun lt!365402 () ListLongMap!8299)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2392 (array!44882 array!44884 (_ BitVec 32) (_ BitVec 32) V!24123 V!24123 (_ BitVec 32) Int) ListLongMap!8299)

(assert (=> b!816015 (= lt!365402 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24123)

(declare-fun lt!365405 () ListLongMap!8299)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1798 (ListLongMap!8299 tuple2!9476) ListLongMap!8299)

(assert (=> b!816015 (= lt!365405 (+!1798 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816016 () Bool)

(declare-fun res!557171 () Bool)

(declare-fun e!452591 () Bool)

(assert (=> b!816016 (=> (not res!557171) (not e!452591))))

(declare-datatypes ((List!15307 0))(
  ( (Nil!15304) (Cons!15303 (h!16432 (_ BitVec 64)) (t!21628 List!15307)) )
))
(declare-fun arrayNoDuplicates!0 (array!44882 (_ BitVec 32) List!15307) Bool)

(assert (=> b!816016 (= res!557171 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15304))))

(declare-fun b!816017 () Bool)

(declare-fun e!452592 () Bool)

(declare-fun tp_is_empty!14341 () Bool)

(assert (=> b!816017 (= e!452592 tp_is_empty!14341)))

(declare-fun b!816018 () Bool)

(declare-fun res!557173 () Bool)

(assert (=> b!816018 (=> (not res!557173) (not e!452591))))

(assert (=> b!816018 (= res!557173 (and (= (size!21921 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21920 _keys!976) (size!21921 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816019 () Bool)

(declare-fun e!452590 () Bool)

(declare-fun mapRes!23098 () Bool)

(assert (=> b!816019 (= e!452590 (and e!452592 mapRes!23098))))

(declare-fun condMapEmpty!23098 () Bool)

(declare-fun mapDefault!23098 () ValueCell!6755)

