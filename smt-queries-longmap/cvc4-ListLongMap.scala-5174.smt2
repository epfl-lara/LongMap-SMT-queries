; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70034 () Bool)

(assert start!70034)

(declare-fun b_free!12455 () Bool)

(declare-fun b_next!12455 () Bool)

(assert (=> start!70034 (= b_free!12455 (not b_next!12455))))

(declare-fun tp!44079 () Bool)

(declare-fun b_and!21227 () Bool)

(assert (=> start!70034 (= tp!44079 b_and!21227)))

(declare-fun b!813932 () Bool)

(declare-fun res!555988 () Bool)

(declare-fun e!451095 () Bool)

(assert (=> b!813932 (=> (not res!555988) (not e!451095))))

(declare-datatypes ((array!44536 0))(
  ( (array!44537 (arr!21328 (Array (_ BitVec 32) (_ BitVec 64))) (size!21749 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44536)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44536 (_ BitVec 32)) Bool)

(assert (=> b!813932 (= res!555988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22828 () Bool)

(declare-fun mapRes!22828 () Bool)

(assert (=> mapIsEmpty!22828 mapRes!22828))

(declare-fun b!813933 () Bool)

(declare-fun e!451096 () Bool)

(declare-fun tp_is_empty!14165 () Bool)

(assert (=> b!813933 (= e!451096 tp_is_empty!14165)))

(declare-fun b!813934 () Bool)

(declare-fun e!451098 () Bool)

(assert (=> b!813934 (= e!451098 tp_is_empty!14165)))

(declare-fun b!813935 () Bool)

(declare-fun res!555990 () Bool)

(assert (=> b!813935 (=> (not res!555990) (not e!451095))))

(declare-datatypes ((List!15174 0))(
  ( (Nil!15171) (Cons!15170 (h!16299 (_ BitVec 64)) (t!21491 List!15174)) )
))
(declare-fun arrayNoDuplicates!0 (array!44536 (_ BitVec 32) List!15174) Bool)

(assert (=> b!813935 (= res!555990 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15171))))

(declare-fun b!813936 () Bool)

(assert (=> b!813936 (= e!451095 false)))

(declare-datatypes ((V!23887 0))(
  ( (V!23888 (val!7130 Int)) )
))
(declare-fun minValue!754 () V!23887)

(declare-datatypes ((ValueCell!6667 0))(
  ( (ValueCellFull!6667 (v!9557 V!23887)) (EmptyCell!6667) )
))
(declare-datatypes ((array!44538 0))(
  ( (array!44539 (arr!21329 (Array (_ BitVec 32) ValueCell!6667)) (size!21750 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44538)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9340 0))(
  ( (tuple2!9341 (_1!4681 (_ BitVec 64)) (_2!4681 V!23887)) )
))
(declare-datatypes ((List!15175 0))(
  ( (Nil!15172) (Cons!15171 (h!16300 tuple2!9340) (t!21492 List!15175)) )
))
(declare-datatypes ((ListLongMap!8163 0))(
  ( (ListLongMap!8164 (toList!4097 List!15175)) )
))
(declare-fun lt!364436 () ListLongMap!8163)

(declare-fun zeroValueAfter!34 () V!23887)

(declare-fun getCurrentListMapNoExtraKeys!2147 (array!44536 array!44538 (_ BitVec 32) (_ BitVec 32) V!23887 V!23887 (_ BitVec 32) Int) ListLongMap!8163)

(assert (=> b!813936 (= lt!364436 (getCurrentListMapNoExtraKeys!2147 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23887)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364437 () ListLongMap!8163)

(assert (=> b!813936 (= lt!364437 (getCurrentListMapNoExtraKeys!2147 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813937 () Bool)

(declare-fun e!451094 () Bool)

(assert (=> b!813937 (= e!451094 (and e!451098 mapRes!22828))))

(declare-fun condMapEmpty!22828 () Bool)

(declare-fun mapDefault!22828 () ValueCell!6667)

