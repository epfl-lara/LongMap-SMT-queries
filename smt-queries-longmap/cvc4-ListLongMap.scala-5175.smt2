; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70040 () Bool)

(assert start!70040)

(declare-fun b_free!12461 () Bool)

(declare-fun b_next!12461 () Bool)

(assert (=> start!70040 (= b_free!12461 (not b_next!12461))))

(declare-fun tp!44098 () Bool)

(declare-fun b_and!21233 () Bool)

(assert (=> start!70040 (= tp!44098 b_and!21233)))

(declare-fun b!813995 () Bool)

(declare-fun res!556023 () Bool)

(declare-fun e!451140 () Bool)

(assert (=> b!813995 (=> (not res!556023) (not e!451140))))

(declare-datatypes ((array!44548 0))(
  ( (array!44549 (arr!21334 (Array (_ BitVec 32) (_ BitVec 64))) (size!21755 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44548)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44548 (_ BitVec 32)) Bool)

(assert (=> b!813995 (= res!556023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813996 () Bool)

(declare-fun res!556025 () Bool)

(assert (=> b!813996 (=> (not res!556025) (not e!451140))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23895 0))(
  ( (V!23896 (val!7133 Int)) )
))
(declare-datatypes ((ValueCell!6670 0))(
  ( (ValueCellFull!6670 (v!9560 V!23895)) (EmptyCell!6670) )
))
(declare-datatypes ((array!44550 0))(
  ( (array!44551 (arr!21335 (Array (_ BitVec 32) ValueCell!6670)) (size!21756 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44550)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813996 (= res!556025 (and (= (size!21756 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21755 _keys!976) (size!21756 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813997 () Bool)

(declare-fun e!451141 () Bool)

(declare-fun tp_is_empty!14171 () Bool)

(assert (=> b!813997 (= e!451141 tp_is_empty!14171)))

(declare-fun b!813998 () Bool)

(assert (=> b!813998 (= e!451140 false)))

(declare-fun zeroValueAfter!34 () V!23895)

(declare-fun minValue!754 () V!23895)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9346 0))(
  ( (tuple2!9347 (_1!4684 (_ BitVec 64)) (_2!4684 V!23895)) )
))
(declare-datatypes ((List!15179 0))(
  ( (Nil!15176) (Cons!15175 (h!16304 tuple2!9346) (t!21496 List!15179)) )
))
(declare-datatypes ((ListLongMap!8169 0))(
  ( (ListLongMap!8170 (toList!4100 List!15179)) )
))
(declare-fun lt!364455 () ListLongMap!8169)

(declare-fun getCurrentListMapNoExtraKeys!2150 (array!44548 array!44550 (_ BitVec 32) (_ BitVec 32) V!23895 V!23895 (_ BitVec 32) Int) ListLongMap!8169)

(assert (=> b!813998 (= lt!364455 (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23895)

(declare-fun lt!364454 () ListLongMap!8169)

(assert (=> b!813998 (= lt!364454 (getCurrentListMapNoExtraKeys!2150 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22837 () Bool)

(declare-fun mapRes!22837 () Bool)

(declare-fun tp!44097 () Bool)

(assert (=> mapNonEmpty!22837 (= mapRes!22837 (and tp!44097 e!451141))))

(declare-fun mapValue!22837 () ValueCell!6670)

(declare-fun mapRest!22837 () (Array (_ BitVec 32) ValueCell!6670))

(declare-fun mapKey!22837 () (_ BitVec 32))

(assert (=> mapNonEmpty!22837 (= (arr!21335 _values!788) (store mapRest!22837 mapKey!22837 mapValue!22837))))

(declare-fun b!813999 () Bool)

(declare-fun e!451143 () Bool)

(declare-fun e!451139 () Bool)

(assert (=> b!813999 (= e!451143 (and e!451139 mapRes!22837))))

(declare-fun condMapEmpty!22837 () Bool)

(declare-fun mapDefault!22837 () ValueCell!6670)

