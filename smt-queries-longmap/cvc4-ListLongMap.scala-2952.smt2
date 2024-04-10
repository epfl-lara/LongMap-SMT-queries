; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41936 () Bool)

(assert start!41936)

(declare-fun b_free!11525 () Bool)

(declare-fun b_next!11525 () Bool)

(assert (=> start!41936 (= b_free!11525 (not b_next!11525))))

(declare-fun tp!40588 () Bool)

(declare-fun b_and!19913 () Bool)

(assert (=> start!41936 (= tp!40588 b_and!19913)))

(declare-fun res!279826 () Bool)

(declare-fun e!273997 () Bool)

(assert (=> start!41936 (=> (not res!279826) (not e!273997))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41936 (= res!279826 (validMask!0 mask!1365))))

(assert (=> start!41936 e!273997))

(declare-fun tp_is_empty!12953 () Bool)

(assert (=> start!41936 tp_is_empty!12953))

(assert (=> start!41936 tp!40588))

(assert (=> start!41936 true))

(declare-datatypes ((array!29681 0))(
  ( (array!29682 (arr!14267 (Array (_ BitVec 32) (_ BitVec 64))) (size!14619 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29681)

(declare-fun array_inv!10300 (array!29681) Bool)

(assert (=> start!41936 (array_inv!10300 _keys!1025)))

(declare-datatypes ((V!18375 0))(
  ( (V!18376 (val!6521 Int)) )
))
(declare-datatypes ((ValueCell!6133 0))(
  ( (ValueCellFull!6133 (v!8810 V!18375)) (EmptyCell!6133) )
))
(declare-datatypes ((array!29683 0))(
  ( (array!29684 (arr!14268 (Array (_ BitVec 32) ValueCell!6133)) (size!14620 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29683)

(declare-fun e!273992 () Bool)

(declare-fun array_inv!10301 (array!29683) Bool)

(assert (=> start!41936 (and (array_inv!10301 _values!833) e!273992)))

(declare-fun mapIsEmpty!21121 () Bool)

(declare-fun mapRes!21121 () Bool)

(assert (=> mapIsEmpty!21121 mapRes!21121))

(declare-fun b!468206 () Bool)

(declare-fun e!273995 () Bool)

(assert (=> b!468206 (= e!273995 true)))

(declare-fun minValueBefore!38 () V!18375)

(declare-datatypes ((tuple2!8566 0))(
  ( (tuple2!8567 (_1!4294 (_ BitVec 64)) (_2!4294 V!18375)) )
))
(declare-datatypes ((List!8654 0))(
  ( (Nil!8651) (Cons!8650 (h!9506 tuple2!8566) (t!14610 List!8654)) )
))
(declare-datatypes ((ListLongMap!7479 0))(
  ( (ListLongMap!7480 (toList!3755 List!8654)) )
))
(declare-fun lt!211718 () ListLongMap!7479)

(declare-fun zeroValue!794 () V!18375)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2183 (array!29681 array!29683 (_ BitVec 32) (_ BitVec 32) V!18375 V!18375 (_ BitVec 32) Int) ListLongMap!7479)

(assert (=> b!468206 (= lt!211718 (getCurrentListMap!2183 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21121 () Bool)

(declare-fun tp!40587 () Bool)

(declare-fun e!273994 () Bool)

(assert (=> mapNonEmpty!21121 (= mapRes!21121 (and tp!40587 e!273994))))

(declare-fun mapValue!21121 () ValueCell!6133)

(declare-fun mapKey!21121 () (_ BitVec 32))

(declare-fun mapRest!21121 () (Array (_ BitVec 32) ValueCell!6133))

(assert (=> mapNonEmpty!21121 (= (arr!14268 _values!833) (store mapRest!21121 mapKey!21121 mapValue!21121))))

(declare-fun b!468207 () Bool)

(declare-fun res!279823 () Bool)

(assert (=> b!468207 (=> (not res!279823) (not e!273997))))

(declare-datatypes ((List!8655 0))(
  ( (Nil!8652) (Cons!8651 (h!9507 (_ BitVec 64)) (t!14611 List!8655)) )
))
(declare-fun arrayNoDuplicates!0 (array!29681 (_ BitVec 32) List!8655) Bool)

(assert (=> b!468207 (= res!279823 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8652))))

(declare-fun b!468208 () Bool)

(declare-fun e!273996 () Bool)

(assert (=> b!468208 (= e!273992 (and e!273996 mapRes!21121))))

(declare-fun condMapEmpty!21121 () Bool)

(declare-fun mapDefault!21121 () ValueCell!6133)

