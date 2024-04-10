; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69934 () Bool)

(assert start!69934)

(declare-fun b_free!12367 () Bool)

(declare-fun b_next!12367 () Bool)

(assert (=> start!69934 (= b_free!12367 (not b_next!12367))))

(declare-fun tp!43813 () Bool)

(declare-fun b_and!21135 () Bool)

(assert (=> start!69934 (= tp!43813 b_and!21135)))

(declare-fun b!812935 () Bool)

(declare-fun e!450390 () Bool)

(assert (=> b!812935 (= e!450390 false)))

(declare-datatypes ((V!23771 0))(
  ( (V!23772 (val!7086 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23771)

(declare-datatypes ((array!44370 0))(
  ( (array!44371 (arr!21246 (Array (_ BitVec 32) (_ BitVec 64))) (size!21667 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44370)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23771)

(declare-datatypes ((ValueCell!6623 0))(
  ( (ValueCellFull!6623 (v!9513 V!23771)) (EmptyCell!6623) )
))
(declare-datatypes ((array!44372 0))(
  ( (array!44373 (arr!21247 (Array (_ BitVec 32) ValueCell!6623)) (size!21668 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44372)

(declare-fun defaultEntry!796 () Int)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9284 0))(
  ( (tuple2!9285 (_1!4653 (_ BitVec 64)) (_2!4653 V!23771)) )
))
(declare-datatypes ((List!15114 0))(
  ( (Nil!15111) (Cons!15110 (h!16239 tuple2!9284) (t!21429 List!15114)) )
))
(declare-datatypes ((ListLongMap!8107 0))(
  ( (ListLongMap!8108 (toList!4069 List!15114)) )
))
(declare-fun lt!364212 () ListLongMap!8107)

(declare-fun getCurrentListMapNoExtraKeys!2119 (array!44370 array!44372 (_ BitVec 32) (_ BitVec 32) V!23771 V!23771 (_ BitVec 32) Int) ListLongMap!8107)

(assert (=> b!812935 (= lt!364212 (getCurrentListMapNoExtraKeys!2119 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812936 () Bool)

(declare-fun res!555433 () Bool)

(assert (=> b!812936 (=> (not res!555433) (not e!450390))))

(declare-datatypes ((List!15115 0))(
  ( (Nil!15112) (Cons!15111 (h!16240 (_ BitVec 64)) (t!21430 List!15115)) )
))
(declare-fun arrayNoDuplicates!0 (array!44370 (_ BitVec 32) List!15115) Bool)

(assert (=> b!812936 (= res!555433 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15112))))

(declare-fun mapNonEmpty!22693 () Bool)

(declare-fun mapRes!22693 () Bool)

(declare-fun tp!43812 () Bool)

(declare-fun e!450386 () Bool)

(assert (=> mapNonEmpty!22693 (= mapRes!22693 (and tp!43812 e!450386))))

(declare-fun mapValue!22693 () ValueCell!6623)

(declare-fun mapRest!22693 () (Array (_ BitVec 32) ValueCell!6623))

(declare-fun mapKey!22693 () (_ BitVec 32))

(assert (=> mapNonEmpty!22693 (= (arr!21247 _values!788) (store mapRest!22693 mapKey!22693 mapValue!22693))))

(declare-fun b!812937 () Bool)

(declare-fun res!555434 () Bool)

(assert (=> b!812937 (=> (not res!555434) (not e!450390))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812937 (= res!555434 (and (= (size!21668 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21667 _keys!976) (size!21668 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812938 () Bool)

(declare-fun e!450388 () Bool)

(declare-fun tp_is_empty!14077 () Bool)

(assert (=> b!812938 (= e!450388 tp_is_empty!14077)))

(declare-fun res!555432 () Bool)

(assert (=> start!69934 (=> (not res!555432) (not e!450390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69934 (= res!555432 (validMask!0 mask!1312))))

(assert (=> start!69934 e!450390))

(assert (=> start!69934 tp_is_empty!14077))

(declare-fun array_inv!17019 (array!44370) Bool)

(assert (=> start!69934 (array_inv!17019 _keys!976)))

(assert (=> start!69934 true))

(declare-fun e!450389 () Bool)

(declare-fun array_inv!17020 (array!44372) Bool)

(assert (=> start!69934 (and (array_inv!17020 _values!788) e!450389)))

(assert (=> start!69934 tp!43813))

(declare-fun b!812939 () Bool)

(assert (=> b!812939 (= e!450389 (and e!450388 mapRes!22693))))

(declare-fun condMapEmpty!22693 () Bool)

(declare-fun mapDefault!22693 () ValueCell!6623)

