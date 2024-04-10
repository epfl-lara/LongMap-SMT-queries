; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70042 () Bool)

(assert start!70042)

(declare-fun b_free!12463 () Bool)

(declare-fun b_next!12463 () Bool)

(assert (=> start!70042 (= b_free!12463 (not b_next!12463))))

(declare-fun tp!44104 () Bool)

(declare-fun b_and!21235 () Bool)

(assert (=> start!70042 (= tp!44104 b_and!21235)))

(declare-fun mapIsEmpty!22840 () Bool)

(declare-fun mapRes!22840 () Bool)

(assert (=> mapIsEmpty!22840 mapRes!22840))

(declare-fun b!814016 () Bool)

(declare-fun res!556037 () Bool)

(declare-fun e!451155 () Bool)

(assert (=> b!814016 (=> (not res!556037) (not e!451155))))

(declare-datatypes ((array!44552 0))(
  ( (array!44553 (arr!21336 (Array (_ BitVec 32) (_ BitVec 64))) (size!21757 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44552)

(declare-datatypes ((List!15180 0))(
  ( (Nil!15177) (Cons!15176 (h!16305 (_ BitVec 64)) (t!21497 List!15180)) )
))
(declare-fun arrayNoDuplicates!0 (array!44552 (_ BitVec 32) List!15180) Bool)

(assert (=> b!814016 (= res!556037 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15177))))

(declare-fun b!814017 () Bool)

(assert (=> b!814017 (= e!451155 false)))

(declare-datatypes ((V!23899 0))(
  ( (V!23900 (val!7134 Int)) )
))
(declare-datatypes ((tuple2!9348 0))(
  ( (tuple2!9349 (_1!4685 (_ BitVec 64)) (_2!4685 V!23899)) )
))
(declare-datatypes ((List!15181 0))(
  ( (Nil!15178) (Cons!15177 (h!16306 tuple2!9348) (t!21498 List!15181)) )
))
(declare-datatypes ((ListLongMap!8171 0))(
  ( (ListLongMap!8172 (toList!4101 List!15181)) )
))
(declare-fun lt!364460 () ListLongMap!8171)

(declare-fun zeroValueAfter!34 () V!23899)

(declare-fun minValue!754 () V!23899)

(declare-datatypes ((ValueCell!6671 0))(
  ( (ValueCellFull!6671 (v!9561 V!23899)) (EmptyCell!6671) )
))
(declare-datatypes ((array!44554 0))(
  ( (array!44555 (arr!21337 (Array (_ BitVec 32) ValueCell!6671)) (size!21758 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44554)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2151 (array!44552 array!44554 (_ BitVec 32) (_ BitVec 32) V!23899 V!23899 (_ BitVec 32) Int) ListLongMap!8171)

(assert (=> b!814017 (= lt!364460 (getCurrentListMapNoExtraKeys!2151 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23899)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364461 () ListLongMap!8171)

(assert (=> b!814017 (= lt!364461 (getCurrentListMapNoExtraKeys!2151 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814018 () Bool)

(declare-fun e!451157 () Bool)

(declare-fun tp_is_empty!14173 () Bool)

(assert (=> b!814018 (= e!451157 tp_is_empty!14173)))

(declare-fun b!814019 () Bool)

(declare-fun res!556036 () Bool)

(assert (=> b!814019 (=> (not res!556036) (not e!451155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44552 (_ BitVec 32)) Bool)

(assert (=> b!814019 (= res!556036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22840 () Bool)

(declare-fun tp!44103 () Bool)

(declare-fun e!451154 () Bool)

(assert (=> mapNonEmpty!22840 (= mapRes!22840 (and tp!44103 e!451154))))

(declare-fun mapKey!22840 () (_ BitVec 32))

(declare-fun mapRest!22840 () (Array (_ BitVec 32) ValueCell!6671))

(declare-fun mapValue!22840 () ValueCell!6671)

(assert (=> mapNonEmpty!22840 (= (arr!21337 _values!788) (store mapRest!22840 mapKey!22840 mapValue!22840))))

(declare-fun b!814020 () Bool)

(declare-fun e!451156 () Bool)

(assert (=> b!814020 (= e!451156 (and e!451157 mapRes!22840))))

(declare-fun condMapEmpty!22840 () Bool)

(declare-fun mapDefault!22840 () ValueCell!6671)

