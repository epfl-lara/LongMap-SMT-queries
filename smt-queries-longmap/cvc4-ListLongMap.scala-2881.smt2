; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41420 () Bool)

(assert start!41420)

(declare-fun b_free!11099 () Bool)

(declare-fun b_next!11099 () Bool)

(assert (=> start!41420 (= b_free!11099 (not b_next!11099))))

(declare-fun tp!39291 () Bool)

(declare-fun b_and!19435 () Bool)

(assert (=> start!41420 (= tp!39291 b_and!19435)))

(declare-fun mapIsEmpty!20464 () Bool)

(declare-fun mapRes!20464 () Bool)

(assert (=> mapIsEmpty!20464 mapRes!20464))

(declare-fun res!276759 () Bool)

(declare-fun e!270141 () Bool)

(assert (=> start!41420 (=> (not res!276759) (not e!270141))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41420 (= res!276759 (validMask!0 mask!1365))))

(assert (=> start!41420 e!270141))

(declare-fun tp_is_empty!12527 () Bool)

(assert (=> start!41420 tp_is_empty!12527))

(assert (=> start!41420 tp!39291))

(assert (=> start!41420 true))

(declare-datatypes ((array!28855 0))(
  ( (array!28856 (arr!13860 (Array (_ BitVec 32) (_ BitVec 64))) (size!14212 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28855)

(declare-fun array_inv!10022 (array!28855) Bool)

(assert (=> start!41420 (array_inv!10022 _keys!1025)))

(declare-datatypes ((V!17807 0))(
  ( (V!17808 (val!6308 Int)) )
))
(declare-datatypes ((ValueCell!5920 0))(
  ( (ValueCellFull!5920 (v!8595 V!17807)) (EmptyCell!5920) )
))
(declare-datatypes ((array!28857 0))(
  ( (array!28858 (arr!13861 (Array (_ BitVec 32) ValueCell!5920)) (size!14213 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28857)

(declare-fun e!270140 () Bool)

(declare-fun array_inv!10023 (array!28857) Bool)

(assert (=> start!41420 (and (array_inv!10023 _values!833) e!270140)))

(declare-fun b!462813 () Bool)

(declare-fun res!276760 () Bool)

(assert (=> b!462813 (=> (not res!276760) (not e!270141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28855 (_ BitVec 32)) Bool)

(assert (=> b!462813 (= res!276760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462814 () Bool)

(declare-fun res!276758 () Bool)

(assert (=> b!462814 (=> (not res!276758) (not e!270141))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462814 (= res!276758 (and (= (size!14213 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14212 _keys!1025) (size!14213 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20464 () Bool)

(declare-fun tp!39292 () Bool)

(declare-fun e!270144 () Bool)

(assert (=> mapNonEmpty!20464 (= mapRes!20464 (and tp!39292 e!270144))))

(declare-fun mapValue!20464 () ValueCell!5920)

(declare-fun mapKey!20464 () (_ BitVec 32))

(declare-fun mapRest!20464 () (Array (_ BitVec 32) ValueCell!5920))

(assert (=> mapNonEmpty!20464 (= (arr!13861 _values!833) (store mapRest!20464 mapKey!20464 mapValue!20464))))

(declare-fun b!462815 () Bool)

(assert (=> b!462815 (= e!270141 false)))

(declare-datatypes ((tuple2!8264 0))(
  ( (tuple2!8265 (_1!4143 (_ BitVec 64)) (_2!4143 V!17807)) )
))
(declare-datatypes ((List!8357 0))(
  ( (Nil!8354) (Cons!8353 (h!9209 tuple2!8264) (t!14301 List!8357)) )
))
(declare-datatypes ((ListLongMap!7177 0))(
  ( (ListLongMap!7178 (toList!3604 List!8357)) )
))
(declare-fun lt!209264 () ListLongMap!7177)

(declare-fun minValueBefore!38 () V!17807)

(declare-fun zeroValue!794 () V!17807)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1784 (array!28855 array!28857 (_ BitVec 32) (_ BitVec 32) V!17807 V!17807 (_ BitVec 32) Int) ListLongMap!7177)

(assert (=> b!462815 (= lt!209264 (getCurrentListMapNoExtraKeys!1784 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462816 () Bool)

(declare-fun e!270143 () Bool)

(assert (=> b!462816 (= e!270140 (and e!270143 mapRes!20464))))

(declare-fun condMapEmpty!20464 () Bool)

(declare-fun mapDefault!20464 () ValueCell!5920)

