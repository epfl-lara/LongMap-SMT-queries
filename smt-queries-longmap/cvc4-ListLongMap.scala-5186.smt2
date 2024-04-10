; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70106 () Bool)

(assert start!70106)

(declare-fun b_free!12527 () Bool)

(declare-fun b_next!12527 () Bool)

(assert (=> start!70106 (= b_free!12527 (not b_next!12527))))

(declare-fun tp!44295 () Bool)

(declare-fun b_and!21299 () Bool)

(assert (=> start!70106 (= tp!44295 b_and!21299)))

(declare-fun b!814688 () Bool)

(declare-fun res!556419 () Bool)

(declare-fun e!451636 () Bool)

(assert (=> b!814688 (=> (not res!556419) (not e!451636))))

(declare-datatypes ((array!44676 0))(
  ( (array!44677 (arr!21398 (Array (_ BitVec 32) (_ BitVec 64))) (size!21819 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44676)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44676 (_ BitVec 32)) Bool)

(assert (=> b!814688 (= res!556419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814689 () Bool)

(assert (=> b!814689 (= e!451636 (not true))))

(declare-datatypes ((V!23983 0))(
  ( (V!23984 (val!7166 Int)) )
))
(declare-datatypes ((tuple2!9392 0))(
  ( (tuple2!9393 (_1!4707 (_ BitVec 64)) (_2!4707 V!23983)) )
))
(declare-datatypes ((List!15224 0))(
  ( (Nil!15221) (Cons!15220 (h!16349 tuple2!9392) (t!21541 List!15224)) )
))
(declare-datatypes ((ListLongMap!8215 0))(
  ( (ListLongMap!8216 (toList!4123 List!15224)) )
))
(declare-fun lt!364725 () ListLongMap!8215)

(declare-fun lt!364724 () ListLongMap!8215)

(assert (=> b!814689 (= lt!364725 lt!364724)))

(declare-fun zeroValueBefore!34 () V!23983)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23983)

(declare-fun minValue!754 () V!23983)

(declare-datatypes ((ValueCell!6703 0))(
  ( (ValueCellFull!6703 (v!9593 V!23983)) (EmptyCell!6703) )
))
(declare-datatypes ((array!44678 0))(
  ( (array!44679 (arr!21399 (Array (_ BitVec 32) ValueCell!6703)) (size!21820 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44678)

(declare-datatypes ((Unit!27744 0))(
  ( (Unit!27745) )
))
(declare-fun lt!364723 () Unit!27744)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!283 (array!44676 array!44678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23983 V!23983 V!23983 V!23983 (_ BitVec 32) Int) Unit!27744)

(assert (=> b!814689 (= lt!364723 (lemmaNoChangeToArrayThenSameMapNoExtras!283 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2173 (array!44676 array!44678 (_ BitVec 32) (_ BitVec 32) V!23983 V!23983 (_ BitVec 32) Int) ListLongMap!8215)

(assert (=> b!814689 (= lt!364724 (getCurrentListMapNoExtraKeys!2173 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814689 (= lt!364725 (getCurrentListMapNoExtraKeys!2173 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22936 () Bool)

(declare-fun mapRes!22936 () Bool)

(assert (=> mapIsEmpty!22936 mapRes!22936))

(declare-fun b!814690 () Bool)

(declare-fun res!556421 () Bool)

(assert (=> b!814690 (=> (not res!556421) (not e!451636))))

(declare-datatypes ((List!15225 0))(
  ( (Nil!15222) (Cons!15221 (h!16350 (_ BitVec 64)) (t!21542 List!15225)) )
))
(declare-fun arrayNoDuplicates!0 (array!44676 (_ BitVec 32) List!15225) Bool)

(assert (=> b!814690 (= res!556421 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15222))))

(declare-fun b!814691 () Bool)

(declare-fun e!451637 () Bool)

(declare-fun tp_is_empty!14237 () Bool)

(assert (=> b!814691 (= e!451637 tp_is_empty!14237)))

(declare-fun b!814692 () Bool)

(declare-fun e!451635 () Bool)

(assert (=> b!814692 (= e!451635 (and e!451637 mapRes!22936))))

(declare-fun condMapEmpty!22936 () Bool)

(declare-fun mapDefault!22936 () ValueCell!6703)

