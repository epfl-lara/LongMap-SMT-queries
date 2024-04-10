; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42158 () Bool)

(assert start!42158)

(declare-fun b_free!11691 () Bool)

(declare-fun b_next!11691 () Bool)

(assert (=> start!42158 (= b_free!11691 (not b_next!11691))))

(declare-fun tp!41095 () Bool)

(declare-fun b_and!20113 () Bool)

(assert (=> start!42158 (= tp!41095 b_and!20113)))

(declare-fun res!281211 () Bool)

(declare-fun e!275739 () Bool)

(assert (=> start!42158 (=> (not res!281211) (not e!275739))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42158 (= res!281211 (validMask!0 mask!1365))))

(assert (=> start!42158 e!275739))

(declare-fun tp_is_empty!13119 () Bool)

(assert (=> start!42158 tp_is_empty!13119))

(assert (=> start!42158 tp!41095))

(assert (=> start!42158 true))

(declare-datatypes ((array!30005 0))(
  ( (array!30006 (arr!14426 (Array (_ BitVec 32) (_ BitVec 64))) (size!14778 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30005)

(declare-fun array_inv!10408 (array!30005) Bool)

(assert (=> start!42158 (array_inv!10408 _keys!1025)))

(declare-datatypes ((V!18597 0))(
  ( (V!18598 (val!6604 Int)) )
))
(declare-datatypes ((ValueCell!6216 0))(
  ( (ValueCellFull!6216 (v!8895 V!18597)) (EmptyCell!6216) )
))
(declare-datatypes ((array!30007 0))(
  ( (array!30008 (arr!14427 (Array (_ BitVec 32) ValueCell!6216)) (size!14779 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30007)

(declare-fun e!275737 () Bool)

(declare-fun array_inv!10409 (array!30007) Bool)

(assert (=> start!42158 (and (array_inv!10409 _values!833) e!275737)))

(declare-fun b!470636 () Bool)

(declare-fun res!281213 () Bool)

(assert (=> b!470636 (=> (not res!281213) (not e!275739))))

(declare-datatypes ((List!8779 0))(
  ( (Nil!8776) (Cons!8775 (h!9631 (_ BitVec 64)) (t!14741 List!8779)) )
))
(declare-fun arrayNoDuplicates!0 (array!30005 (_ BitVec 32) List!8779) Bool)

(assert (=> b!470636 (= res!281213 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8776))))

(declare-fun b!470637 () Bool)

(declare-fun res!281212 () Bool)

(assert (=> b!470637 (=> (not res!281212) (not e!275739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30005 (_ BitVec 32)) Bool)

(assert (=> b!470637 (= res!281212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470638 () Bool)

(declare-fun e!275740 () Bool)

(declare-fun mapRes!21379 () Bool)

(assert (=> b!470638 (= e!275737 (and e!275740 mapRes!21379))))

(declare-fun condMapEmpty!21379 () Bool)

(declare-fun mapDefault!21379 () ValueCell!6216)

(assert (=> b!470638 (= condMapEmpty!21379 (= (arr!14427 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6216)) mapDefault!21379)))))

(declare-fun b!470639 () Bool)

(declare-fun e!275738 () Bool)

(assert (=> b!470639 (= e!275738 tp_is_empty!13119)))

(declare-fun b!470640 () Bool)

(assert (=> b!470640 (= e!275739 (not true))))

(declare-datatypes ((tuple2!8700 0))(
  ( (tuple2!8701 (_1!4361 (_ BitVec 64)) (_2!4361 V!18597)) )
))
(declare-datatypes ((List!8780 0))(
  ( (Nil!8777) (Cons!8776 (h!9632 tuple2!8700) (t!14742 List!8780)) )
))
(declare-datatypes ((ListLongMap!7613 0))(
  ( (ListLongMap!7614 (toList!3822 List!8780)) )
))
(declare-fun lt!213540 () ListLongMap!7613)

(declare-fun lt!213538 () ListLongMap!7613)

(assert (=> b!470640 (= lt!213540 lt!213538)))

(declare-fun minValueBefore!38 () V!18597)

(declare-fun zeroValue!794 () V!18597)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13803 0))(
  ( (Unit!13804) )
))
(declare-fun lt!213539 () Unit!13803)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18597)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!165 (array!30005 array!30007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18597 V!18597 V!18597 V!18597 (_ BitVec 32) Int) Unit!13803)

(assert (=> b!470640 (= lt!213539 (lemmaNoChangeToArrayThenSameMapNoExtras!165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1985 (array!30005 array!30007 (_ BitVec 32) (_ BitVec 32) V!18597 V!18597 (_ BitVec 32) Int) ListLongMap!7613)

(assert (=> b!470640 (= lt!213538 (getCurrentListMapNoExtraKeys!1985 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470640 (= lt!213540 (getCurrentListMapNoExtraKeys!1985 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470641 () Bool)

(assert (=> b!470641 (= e!275740 tp_is_empty!13119)))

(declare-fun mapIsEmpty!21379 () Bool)

(assert (=> mapIsEmpty!21379 mapRes!21379))

(declare-fun mapNonEmpty!21379 () Bool)

(declare-fun tp!41094 () Bool)

(assert (=> mapNonEmpty!21379 (= mapRes!21379 (and tp!41094 e!275738))))

(declare-fun mapValue!21379 () ValueCell!6216)

(declare-fun mapRest!21379 () (Array (_ BitVec 32) ValueCell!6216))

(declare-fun mapKey!21379 () (_ BitVec 32))

(assert (=> mapNonEmpty!21379 (= (arr!14427 _values!833) (store mapRest!21379 mapKey!21379 mapValue!21379))))

(declare-fun b!470642 () Bool)

(declare-fun res!281214 () Bool)

(assert (=> b!470642 (=> (not res!281214) (not e!275739))))

(assert (=> b!470642 (= res!281214 (and (= (size!14779 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14778 _keys!1025) (size!14779 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42158 res!281211) b!470642))

(assert (= (and b!470642 res!281214) b!470637))

(assert (= (and b!470637 res!281212) b!470636))

(assert (= (and b!470636 res!281213) b!470640))

(assert (= (and b!470638 condMapEmpty!21379) mapIsEmpty!21379))

(assert (= (and b!470638 (not condMapEmpty!21379)) mapNonEmpty!21379))

(get-info :version)

(assert (= (and mapNonEmpty!21379 ((_ is ValueCellFull!6216) mapValue!21379)) b!470639))

(assert (= (and b!470638 ((_ is ValueCellFull!6216) mapDefault!21379)) b!470641))

(assert (= start!42158 b!470638))

(declare-fun m!452897 () Bool)

(assert (=> mapNonEmpty!21379 m!452897))

(declare-fun m!452899 () Bool)

(assert (=> b!470637 m!452899))

(declare-fun m!452901 () Bool)

(assert (=> start!42158 m!452901))

(declare-fun m!452903 () Bool)

(assert (=> start!42158 m!452903))

(declare-fun m!452905 () Bool)

(assert (=> start!42158 m!452905))

(declare-fun m!452907 () Bool)

(assert (=> b!470640 m!452907))

(declare-fun m!452909 () Bool)

(assert (=> b!470640 m!452909))

(declare-fun m!452911 () Bool)

(assert (=> b!470640 m!452911))

(declare-fun m!452913 () Bool)

(assert (=> b!470636 m!452913))

(check-sat tp_is_empty!13119 (not mapNonEmpty!21379) (not start!42158) (not b!470636) (not b!470640) (not b_next!11691) b_and!20113 (not b!470637))
(check-sat b_and!20113 (not b_next!11691))
