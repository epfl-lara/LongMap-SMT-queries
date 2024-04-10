; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69962 () Bool)

(assert start!69962)

(declare-fun b_free!12395 () Bool)

(declare-fun b_next!12395 () Bool)

(assert (=> start!69962 (= b_free!12395 (not b_next!12395))))

(declare-fun tp!43897 () Bool)

(declare-fun b_and!21163 () Bool)

(assert (=> start!69962 (= tp!43897 b_and!21163)))

(declare-fun b!813229 () Bool)

(declare-fun e!450600 () Bool)

(declare-fun tp_is_empty!14105 () Bool)

(assert (=> b!813229 (= e!450600 tp_is_empty!14105)))

(declare-fun b!813230 () Bool)

(declare-fun res!555602 () Bool)

(declare-fun e!450596 () Bool)

(assert (=> b!813230 (=> (not res!555602) (not e!450596))))

(declare-datatypes ((array!44422 0))(
  ( (array!44423 (arr!21272 (Array (_ BitVec 32) (_ BitVec 64))) (size!21693 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44422)

(declare-datatypes ((List!15130 0))(
  ( (Nil!15127) (Cons!15126 (h!16255 (_ BitVec 64)) (t!21445 List!15130)) )
))
(declare-fun arrayNoDuplicates!0 (array!44422 (_ BitVec 32) List!15130) Bool)

(assert (=> b!813230 (= res!555602 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15127))))

(declare-fun b!813231 () Bool)

(assert (=> b!813231 (= e!450596 false)))

(declare-datatypes ((V!23807 0))(
  ( (V!23808 (val!7100 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23807)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23807)

(declare-datatypes ((ValueCell!6637 0))(
  ( (ValueCellFull!6637 (v!9527 V!23807)) (EmptyCell!6637) )
))
(declare-datatypes ((array!44424 0))(
  ( (array!44425 (arr!21273 (Array (_ BitVec 32) ValueCell!6637)) (size!21694 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44424)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9298 0))(
  ( (tuple2!9299 (_1!4660 (_ BitVec 64)) (_2!4660 V!23807)) )
))
(declare-datatypes ((List!15131 0))(
  ( (Nil!15128) (Cons!15127 (h!16256 tuple2!9298) (t!21446 List!15131)) )
))
(declare-datatypes ((ListLongMap!8121 0))(
  ( (ListLongMap!8122 (toList!4076 List!15131)) )
))
(declare-fun lt!364254 () ListLongMap!8121)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2126 (array!44422 array!44424 (_ BitVec 32) (_ BitVec 32) V!23807 V!23807 (_ BitVec 32) Int) ListLongMap!8121)

(assert (=> b!813231 (= lt!364254 (getCurrentListMapNoExtraKeys!2126 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!555603 () Bool)

(assert (=> start!69962 (=> (not res!555603) (not e!450596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69962 (= res!555603 (validMask!0 mask!1312))))

(assert (=> start!69962 e!450596))

(assert (=> start!69962 tp_is_empty!14105))

(declare-fun array_inv!17035 (array!44422) Bool)

(assert (=> start!69962 (array_inv!17035 _keys!976)))

(assert (=> start!69962 true))

(declare-fun e!450597 () Bool)

(declare-fun array_inv!17036 (array!44424) Bool)

(assert (=> start!69962 (and (array_inv!17036 _values!788) e!450597)))

(assert (=> start!69962 tp!43897))

(declare-fun b!813232 () Bool)

(declare-fun res!555601 () Bool)

(assert (=> b!813232 (=> (not res!555601) (not e!450596))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813232 (= res!555601 (and (= (size!21694 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21693 _keys!976) (size!21694 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22735 () Bool)

(declare-fun mapRes!22735 () Bool)

(assert (=> mapIsEmpty!22735 mapRes!22735))

(declare-fun b!813233 () Bool)

(declare-fun e!450599 () Bool)

(assert (=> b!813233 (= e!450597 (and e!450599 mapRes!22735))))

(declare-fun condMapEmpty!22735 () Bool)

(declare-fun mapDefault!22735 () ValueCell!6637)

