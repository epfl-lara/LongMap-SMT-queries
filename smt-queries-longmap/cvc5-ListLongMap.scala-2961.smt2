; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42002 () Bool)

(assert start!42002)

(declare-fun b_free!11575 () Bool)

(declare-fun b_next!11575 () Bool)

(assert (=> start!42002 (= b_free!11575 (not b_next!11575))))

(declare-fun tp!40741 () Bool)

(declare-fun b_and!19973 () Bool)

(assert (=> start!42002 (= tp!40741 b_and!19973)))

(declare-fun b!468954 () Bool)

(declare-fun res!280257 () Bool)

(declare-fun e!274540 () Bool)

(assert (=> b!468954 (=> (not res!280257) (not e!274540))))

(declare-datatypes ((array!29779 0))(
  ( (array!29780 (arr!14315 (Array (_ BitVec 32) (_ BitVec 64))) (size!14667 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29779)

(declare-datatypes ((List!8692 0))(
  ( (Nil!8689) (Cons!8688 (h!9544 (_ BitVec 64)) (t!14650 List!8692)) )
))
(declare-fun arrayNoDuplicates!0 (array!29779 (_ BitVec 32) List!8692) Bool)

(assert (=> b!468954 (= res!280257 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8689))))

(declare-fun b!468955 () Bool)

(declare-fun e!274537 () Bool)

(assert (=> b!468955 (= e!274540 (not e!274537))))

(declare-fun res!280256 () Bool)

(assert (=> b!468955 (=> res!280256 e!274537)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468955 (= res!280256 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18443 0))(
  ( (V!18444 (val!6546 Int)) )
))
(declare-datatypes ((tuple2!8608 0))(
  ( (tuple2!8609 (_1!4315 (_ BitVec 64)) (_2!4315 V!18443)) )
))
(declare-datatypes ((List!8693 0))(
  ( (Nil!8690) (Cons!8689 (h!9545 tuple2!8608) (t!14651 List!8693)) )
))
(declare-datatypes ((ListLongMap!7521 0))(
  ( (ListLongMap!7522 (toList!3776 List!8693)) )
))
(declare-fun lt!212295 () ListLongMap!7521)

(declare-fun lt!212296 () ListLongMap!7521)

(assert (=> b!468955 (= lt!212295 lt!212296)))

(declare-fun minValueBefore!38 () V!18443)

(declare-fun zeroValue!794 () V!18443)

(declare-datatypes ((Unit!13707 0))(
  ( (Unit!13708) )
))
(declare-fun lt!212294 () Unit!13707)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6158 0))(
  ( (ValueCellFull!6158 (v!8835 V!18443)) (EmptyCell!6158) )
))
(declare-datatypes ((array!29781 0))(
  ( (array!29782 (arr!14316 (Array (_ BitVec 32) ValueCell!6158)) (size!14668 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29781)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18443)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!125 (array!29779 array!29781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 V!18443 V!18443 (_ BitVec 32) Int) Unit!13707)

(assert (=> b!468955 (= lt!212294 (lemmaNoChangeToArrayThenSameMapNoExtras!125 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1945 (array!29779 array!29781 (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 (_ BitVec 32) Int) ListLongMap!7521)

(assert (=> b!468955 (= lt!212296 (getCurrentListMapNoExtraKeys!1945 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468955 (= lt!212295 (getCurrentListMapNoExtraKeys!1945 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21199 () Bool)

(declare-fun mapRes!21199 () Bool)

(assert (=> mapIsEmpty!21199 mapRes!21199))

(declare-fun res!280258 () Bool)

(assert (=> start!42002 (=> (not res!280258) (not e!274540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42002 (= res!280258 (validMask!0 mask!1365))))

(assert (=> start!42002 e!274540))

(declare-fun tp_is_empty!13003 () Bool)

(assert (=> start!42002 tp_is_empty!13003))

(assert (=> start!42002 tp!40741))

(assert (=> start!42002 true))

(declare-fun array_inv!10332 (array!29779) Bool)

(assert (=> start!42002 (array_inv!10332 _keys!1025)))

(declare-fun e!274541 () Bool)

(declare-fun array_inv!10333 (array!29781) Bool)

(assert (=> start!42002 (and (array_inv!10333 _values!833) e!274541)))

(declare-fun b!468956 () Bool)

(declare-fun e!274539 () Bool)

(assert (=> b!468956 (= e!274539 tp_is_empty!13003)))

(declare-fun b!468957 () Bool)

(declare-fun res!280255 () Bool)

(assert (=> b!468957 (=> (not res!280255) (not e!274540))))

(assert (=> b!468957 (= res!280255 (and (= (size!14668 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14667 _keys!1025) (size!14668 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468958 () Bool)

(declare-fun e!274536 () Bool)

(assert (=> b!468958 (= e!274541 (and e!274536 mapRes!21199))))

(declare-fun condMapEmpty!21199 () Bool)

(declare-fun mapDefault!21199 () ValueCell!6158)

