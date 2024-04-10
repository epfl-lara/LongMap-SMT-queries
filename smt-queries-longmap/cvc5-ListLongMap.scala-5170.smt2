; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70006 () Bool)

(assert start!70006)

(declare-fun b_free!12427 () Bool)

(declare-fun b_next!12427 () Bool)

(assert (=> start!70006 (= b_free!12427 (not b_next!12427))))

(declare-fun tp!43996 () Bool)

(declare-fun b_and!21199 () Bool)

(assert (=> start!70006 (= tp!43996 b_and!21199)))

(declare-fun b!813638 () Bool)

(declare-fun e!450887 () Bool)

(assert (=> b!813638 (= e!450887 false)))

(declare-datatypes ((array!44482 0))(
  ( (array!44483 (arr!21301 (Array (_ BitVec 32) (_ BitVec 64))) (size!21722 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44482)

(declare-datatypes ((V!23851 0))(
  ( (V!23852 (val!7116 Int)) )
))
(declare-fun minValue!754 () V!23851)

(declare-datatypes ((ValueCell!6653 0))(
  ( (ValueCellFull!6653 (v!9543 V!23851)) (EmptyCell!6653) )
))
(declare-datatypes ((array!44484 0))(
  ( (array!44485 (arr!21302 (Array (_ BitVec 32) ValueCell!6653)) (size!21723 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44484)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!23851)

(declare-datatypes ((tuple2!9320 0))(
  ( (tuple2!9321 (_1!4671 (_ BitVec 64)) (_2!4671 V!23851)) )
))
(declare-datatypes ((List!15152 0))(
  ( (Nil!15149) (Cons!15148 (h!16277 tuple2!9320) (t!21469 List!15152)) )
))
(declare-datatypes ((ListLongMap!8143 0))(
  ( (ListLongMap!8144 (toList!4087 List!15152)) )
))
(declare-fun lt!364353 () ListLongMap!8143)

(declare-fun getCurrentListMapNoExtraKeys!2137 (array!44482 array!44484 (_ BitVec 32) (_ BitVec 32) V!23851 V!23851 (_ BitVec 32) Int) ListLongMap!8143)

(assert (=> b!813638 (= lt!364353 (getCurrentListMapNoExtraKeys!2137 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364352 () ListLongMap!8143)

(declare-fun zeroValueBefore!34 () V!23851)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813638 (= lt!364352 (getCurrentListMapNoExtraKeys!2137 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813639 () Bool)

(declare-fun e!450884 () Bool)

(declare-fun tp_is_empty!14137 () Bool)

(assert (=> b!813639 (= e!450884 tp_is_empty!14137)))

(declare-fun mapNonEmpty!22786 () Bool)

(declare-fun mapRes!22786 () Bool)

(declare-fun tp!43995 () Bool)

(assert (=> mapNonEmpty!22786 (= mapRes!22786 (and tp!43995 e!450884))))

(declare-fun mapValue!22786 () ValueCell!6653)

(declare-fun mapRest!22786 () (Array (_ BitVec 32) ValueCell!6653))

(declare-fun mapKey!22786 () (_ BitVec 32))

(assert (=> mapNonEmpty!22786 (= (arr!21302 _values!788) (store mapRest!22786 mapKey!22786 mapValue!22786))))

(declare-fun b!813640 () Bool)

(declare-fun e!450886 () Bool)

(declare-fun e!450888 () Bool)

(assert (=> b!813640 (= e!450886 (and e!450888 mapRes!22786))))

(declare-fun condMapEmpty!22786 () Bool)

(declare-fun mapDefault!22786 () ValueCell!6653)

