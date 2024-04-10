; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69956 () Bool)

(assert start!69956)

(declare-fun b_free!12389 () Bool)

(declare-fun b_next!12389 () Bool)

(assert (=> start!69956 (= b_free!12389 (not b_next!12389))))

(declare-fun tp!43878 () Bool)

(declare-fun b_and!21157 () Bool)

(assert (=> start!69956 (= tp!43878 b_and!21157)))

(declare-fun mapNonEmpty!22726 () Bool)

(declare-fun mapRes!22726 () Bool)

(declare-fun tp!43879 () Bool)

(declare-fun e!450555 () Bool)

(assert (=> mapNonEmpty!22726 (= mapRes!22726 (and tp!43879 e!450555))))

(declare-fun mapKey!22726 () (_ BitVec 32))

(declare-datatypes ((V!23799 0))(
  ( (V!23800 (val!7097 Int)) )
))
(declare-datatypes ((ValueCell!6634 0))(
  ( (ValueCellFull!6634 (v!9524 V!23799)) (EmptyCell!6634) )
))
(declare-fun mapValue!22726 () ValueCell!6634)

(declare-datatypes ((array!44410 0))(
  ( (array!44411 (arr!21266 (Array (_ BitVec 32) ValueCell!6634)) (size!21687 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44410)

(declare-fun mapRest!22726 () (Array (_ BitVec 32) ValueCell!6634))

(assert (=> mapNonEmpty!22726 (= (arr!21266 _values!788) (store mapRest!22726 mapKey!22726 mapValue!22726))))

(declare-fun b!813166 () Bool)

(declare-fun res!555564 () Bool)

(declare-fun e!450553 () Bool)

(assert (=> b!813166 (=> (not res!555564) (not e!450553))))

(declare-datatypes ((array!44412 0))(
  ( (array!44413 (arr!21267 (Array (_ BitVec 32) (_ BitVec 64))) (size!21688 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44412)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44412 (_ BitVec 32)) Bool)

(assert (=> b!813166 (= res!555564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813167 () Bool)

(declare-fun res!555567 () Bool)

(assert (=> b!813167 (=> (not res!555567) (not e!450553))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813167 (= res!555567 (and (= (size!21687 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21688 _keys!976) (size!21687 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813168 () Bool)

(declare-fun res!555565 () Bool)

(assert (=> b!813168 (=> (not res!555565) (not e!450553))))

(declare-datatypes ((List!15126 0))(
  ( (Nil!15123) (Cons!15122 (h!16251 (_ BitVec 64)) (t!21441 List!15126)) )
))
(declare-fun arrayNoDuplicates!0 (array!44412 (_ BitVec 32) List!15126) Bool)

(assert (=> b!813168 (= res!555565 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15123))))

(declare-fun b!813169 () Bool)

(assert (=> b!813169 (= e!450553 false)))

(declare-fun zeroValueBefore!34 () V!23799)

(declare-datatypes ((tuple2!9294 0))(
  ( (tuple2!9295 (_1!4658 (_ BitVec 64)) (_2!4658 V!23799)) )
))
(declare-datatypes ((List!15127 0))(
  ( (Nil!15124) (Cons!15123 (h!16252 tuple2!9294) (t!21442 List!15127)) )
))
(declare-datatypes ((ListLongMap!8117 0))(
  ( (ListLongMap!8118 (toList!4074 List!15127)) )
))
(declare-fun lt!364245 () ListLongMap!8117)

(declare-fun minValue!754 () V!23799)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2124 (array!44412 array!44410 (_ BitVec 32) (_ BitVec 32) V!23799 V!23799 (_ BitVec 32) Int) ListLongMap!8117)

(assert (=> b!813169 (= lt!364245 (getCurrentListMapNoExtraKeys!2124 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!555566 () Bool)

(assert (=> start!69956 (=> (not res!555566) (not e!450553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69956 (= res!555566 (validMask!0 mask!1312))))

(assert (=> start!69956 e!450553))

(declare-fun tp_is_empty!14099 () Bool)

(assert (=> start!69956 tp_is_empty!14099))

(declare-fun array_inv!17029 (array!44412) Bool)

(assert (=> start!69956 (array_inv!17029 _keys!976)))

(assert (=> start!69956 true))

(declare-fun e!450554 () Bool)

(declare-fun array_inv!17030 (array!44410) Bool)

(assert (=> start!69956 (and (array_inv!17030 _values!788) e!450554)))

(assert (=> start!69956 tp!43878))

(declare-fun b!813170 () Bool)

(assert (=> b!813170 (= e!450555 tp_is_empty!14099)))

(declare-fun b!813171 () Bool)

(declare-fun e!450551 () Bool)

(assert (=> b!813171 (= e!450554 (and e!450551 mapRes!22726))))

(declare-fun condMapEmpty!22726 () Bool)

(declare-fun mapDefault!22726 () ValueCell!6634)

