; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42136 () Bool)

(assert start!42136)

(declare-fun b_free!11669 () Bool)

(declare-fun b_next!11669 () Bool)

(assert (=> start!42136 (= b_free!11669 (not b_next!11669))))

(declare-fun tp!41029 () Bool)

(declare-fun b_and!20091 () Bool)

(assert (=> start!42136 (= tp!41029 b_and!20091)))

(declare-fun b!470405 () Bool)

(declare-fun e!275572 () Bool)

(assert (=> b!470405 (= e!275572 (not true))))

(declare-datatypes ((V!18567 0))(
  ( (V!18568 (val!6593 Int)) )
))
(declare-datatypes ((tuple2!8684 0))(
  ( (tuple2!8685 (_1!4353 (_ BitVec 64)) (_2!4353 V!18567)) )
))
(declare-datatypes ((List!8764 0))(
  ( (Nil!8761) (Cons!8760 (h!9616 tuple2!8684) (t!14726 List!8764)) )
))
(declare-datatypes ((ListLongMap!7597 0))(
  ( (ListLongMap!7598 (toList!3814 List!8764)) )
))
(declare-fun lt!213440 () ListLongMap!7597)

(declare-fun lt!213439 () ListLongMap!7597)

(assert (=> b!470405 (= lt!213440 lt!213439)))

(declare-fun minValueBefore!38 () V!18567)

(declare-fun zeroValue!794 () V!18567)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13787 0))(
  ( (Unit!13788) )
))
(declare-fun lt!213441 () Unit!13787)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29965 0))(
  ( (array!29966 (arr!14406 (Array (_ BitVec 32) (_ BitVec 64))) (size!14758 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29965)

(declare-datatypes ((ValueCell!6205 0))(
  ( (ValueCellFull!6205 (v!8884 V!18567)) (EmptyCell!6205) )
))
(declare-datatypes ((array!29967 0))(
  ( (array!29968 (arr!14407 (Array (_ BitVec 32) ValueCell!6205)) (size!14759 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29967)

(declare-fun minValueAfter!38 () V!18567)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!157 (array!29965 array!29967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18567 V!18567 V!18567 V!18567 (_ BitVec 32) Int) Unit!13787)

(assert (=> b!470405 (= lt!213441 (lemmaNoChangeToArrayThenSameMapNoExtras!157 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1977 (array!29965 array!29967 (_ BitVec 32) (_ BitVec 32) V!18567 V!18567 (_ BitVec 32) Int) ListLongMap!7597)

(assert (=> b!470405 (= lt!213439 (getCurrentListMapNoExtraKeys!1977 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470405 (= lt!213440 (getCurrentListMapNoExtraKeys!1977 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470406 () Bool)

(declare-fun res!281079 () Bool)

(assert (=> b!470406 (=> (not res!281079) (not e!275572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29965 (_ BitVec 32)) Bool)

(assert (=> b!470406 (= res!281079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21346 () Bool)

(declare-fun mapRes!21346 () Bool)

(assert (=> mapIsEmpty!21346 mapRes!21346))

(declare-fun b!470408 () Bool)

(declare-fun res!281081 () Bool)

(assert (=> b!470408 (=> (not res!281081) (not e!275572))))

(assert (=> b!470408 (= res!281081 (and (= (size!14759 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14758 _keys!1025) (size!14759 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470409 () Bool)

(declare-fun e!275573 () Bool)

(declare-fun e!275575 () Bool)

(assert (=> b!470409 (= e!275573 (and e!275575 mapRes!21346))))

(declare-fun condMapEmpty!21346 () Bool)

(declare-fun mapDefault!21346 () ValueCell!6205)

