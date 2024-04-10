; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42040 () Bool)

(assert start!42040)

(declare-fun b_free!11593 () Bool)

(declare-fun b_next!11593 () Bool)

(assert (=> start!42040 (= b_free!11593 (not b_next!11593))))

(declare-fun tp!40797 () Bool)

(declare-fun b_and!20003 () Bool)

(assert (=> start!42040 (= tp!40797 b_and!20003)))

(declare-fun mapNonEmpty!21229 () Bool)

(declare-fun mapRes!21229 () Bool)

(declare-fun tp!40798 () Bool)

(declare-fun e!274814 () Bool)

(assert (=> mapNonEmpty!21229 (= mapRes!21229 (and tp!40798 e!274814))))

(declare-datatypes ((V!18467 0))(
  ( (V!18468 (val!6555 Int)) )
))
(declare-datatypes ((ValueCell!6167 0))(
  ( (ValueCellFull!6167 (v!8845 V!18467)) (EmptyCell!6167) )
))
(declare-datatypes ((array!29815 0))(
  ( (array!29816 (arr!14332 (Array (_ BitVec 32) ValueCell!6167)) (size!14684 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29815)

(declare-fun mapKey!21229 () (_ BitVec 32))

(declare-fun mapValue!21229 () ValueCell!6167)

(declare-fun mapRest!21229 () (Array (_ BitVec 32) ValueCell!6167))

(assert (=> mapNonEmpty!21229 (= (arr!14332 _values!833) (store mapRest!21229 mapKey!21229 mapValue!21229))))

(declare-fun res!280470 () Bool)

(declare-fun e!274810 () Bool)

(assert (=> start!42040 (=> (not res!280470) (not e!274810))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42040 (= res!280470 (validMask!0 mask!1365))))

(assert (=> start!42040 e!274810))

(declare-fun tp_is_empty!13021 () Bool)

(assert (=> start!42040 tp_is_empty!13021))

(assert (=> start!42040 tp!40797))

(assert (=> start!42040 true))

(declare-datatypes ((array!29817 0))(
  ( (array!29818 (arr!14333 (Array (_ BitVec 32) (_ BitVec 64))) (size!14685 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29817)

(declare-fun array_inv!10344 (array!29817) Bool)

(assert (=> start!42040 (array_inv!10344 _keys!1025)))

(declare-fun e!274813 () Bool)

(declare-fun array_inv!10345 (array!29815) Bool)

(assert (=> start!42040 (and (array_inv!10345 _values!833) e!274813)))

(declare-fun b!469349 () Bool)

(declare-fun res!280467 () Bool)

(assert (=> b!469349 (=> (not res!280467) (not e!274810))))

(declare-datatypes ((List!8705 0))(
  ( (Nil!8702) (Cons!8701 (h!9557 (_ BitVec 64)) (t!14665 List!8705)) )
))
(declare-fun arrayNoDuplicates!0 (array!29817 (_ BitVec 32) List!8705) Bool)

(assert (=> b!469349 (= res!280467 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8702))))

(declare-fun b!469350 () Bool)

(declare-fun e!274812 () Bool)

(assert (=> b!469350 (= e!274812 true)))

(declare-datatypes ((tuple2!8624 0))(
  ( (tuple2!8625 (_1!4323 (_ BitVec 64)) (_2!4323 V!18467)) )
))
(declare-datatypes ((List!8706 0))(
  ( (Nil!8703) (Cons!8702 (h!9558 tuple2!8624) (t!14666 List!8706)) )
))
(declare-datatypes ((ListLongMap!7537 0))(
  ( (ListLongMap!7538 (toList!3784 List!8706)) )
))
(declare-fun lt!212632 () ListLongMap!7537)

(declare-fun lt!212635 () tuple2!8624)

(declare-fun minValueBefore!38 () V!18467)

(declare-fun +!1693 (ListLongMap!7537 tuple2!8624) ListLongMap!7537)

(assert (=> b!469350 (= (+!1693 lt!212632 lt!212635) (+!1693 (+!1693 lt!212632 (tuple2!8625 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212635))))

(declare-fun minValueAfter!38 () V!18467)

(assert (=> b!469350 (= lt!212635 (tuple2!8625 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13725 0))(
  ( (Unit!13726) )
))
(declare-fun lt!212634 () Unit!13725)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!106 (ListLongMap!7537 (_ BitVec 64) V!18467 V!18467) Unit!13725)

(assert (=> b!469350 (= lt!212634 (addSameAsAddTwiceSameKeyDiffValues!106 lt!212632 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18467)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212630 () ListLongMap!7537)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2207 (array!29817 array!29815 (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 (_ BitVec 32) Int) ListLongMap!7537)

(assert (=> b!469350 (= lt!212630 (getCurrentListMap!2207 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212636 () ListLongMap!7537)

(assert (=> b!469350 (= lt!212636 (getCurrentListMap!2207 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21229 () Bool)

(assert (=> mapIsEmpty!21229 mapRes!21229))

(declare-fun b!469351 () Bool)

(assert (=> b!469351 (= e!274814 tp_is_empty!13021)))

(declare-fun b!469352 () Bool)

(declare-fun e!274815 () Bool)

(assert (=> b!469352 (= e!274813 (and e!274815 mapRes!21229))))

(declare-fun condMapEmpty!21229 () Bool)

(declare-fun mapDefault!21229 () ValueCell!6167)

