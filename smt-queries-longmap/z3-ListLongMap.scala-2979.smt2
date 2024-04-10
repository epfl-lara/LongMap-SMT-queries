; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42152 () Bool)

(assert start!42152)

(declare-fun b_free!11685 () Bool)

(declare-fun b_next!11685 () Bool)

(assert (=> start!42152 (= b_free!11685 (not b_next!11685))))

(declare-fun tp!41076 () Bool)

(declare-fun b_and!20107 () Bool)

(assert (=> start!42152 (= tp!41076 b_and!20107)))

(declare-fun b!470573 () Bool)

(declare-fun e!275694 () Bool)

(declare-fun tp_is_empty!13113 () Bool)

(assert (=> b!470573 (= e!275694 tp_is_empty!13113)))

(declare-fun b!470574 () Bool)

(declare-fun res!281177 () Bool)

(declare-fun e!275691 () Bool)

(assert (=> b!470574 (=> (not res!281177) (not e!275691))))

(declare-datatypes ((array!29995 0))(
  ( (array!29996 (arr!14421 (Array (_ BitVec 32) (_ BitVec 64))) (size!14773 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29995)

(declare-datatypes ((List!8776 0))(
  ( (Nil!8773) (Cons!8772 (h!9628 (_ BitVec 64)) (t!14738 List!8776)) )
))
(declare-fun arrayNoDuplicates!0 (array!29995 (_ BitVec 32) List!8776) Bool)

(assert (=> b!470574 (= res!281177 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8773))))

(declare-fun b!470575 () Bool)

(declare-fun e!275695 () Bool)

(assert (=> b!470575 (= e!275695 tp_is_empty!13113)))

(declare-fun b!470577 () Bool)

(declare-fun e!275692 () Bool)

(declare-fun mapRes!21370 () Bool)

(assert (=> b!470577 (= e!275692 (and e!275694 mapRes!21370))))

(declare-fun condMapEmpty!21370 () Bool)

(declare-datatypes ((V!18589 0))(
  ( (V!18590 (val!6601 Int)) )
))
(declare-datatypes ((ValueCell!6213 0))(
  ( (ValueCellFull!6213 (v!8892 V!18589)) (EmptyCell!6213) )
))
(declare-datatypes ((array!29997 0))(
  ( (array!29998 (arr!14422 (Array (_ BitVec 32) ValueCell!6213)) (size!14774 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29997)

(declare-fun mapDefault!21370 () ValueCell!6213)

(assert (=> b!470577 (= condMapEmpty!21370 (= (arr!14422 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6213)) mapDefault!21370)))))

(declare-fun b!470578 () Bool)

(assert (=> b!470578 (= e!275691 (not true))))

(declare-datatypes ((tuple2!8696 0))(
  ( (tuple2!8697 (_1!4359 (_ BitVec 64)) (_2!4359 V!18589)) )
))
(declare-datatypes ((List!8777 0))(
  ( (Nil!8774) (Cons!8773 (h!9629 tuple2!8696) (t!14739 List!8777)) )
))
(declare-datatypes ((ListLongMap!7609 0))(
  ( (ListLongMap!7610 (toList!3820 List!8777)) )
))
(declare-fun lt!213513 () ListLongMap!7609)

(declare-fun lt!213511 () ListLongMap!7609)

(assert (=> b!470578 (= lt!213513 lt!213511)))

(declare-fun zeroValue!794 () V!18589)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18589)

(declare-datatypes ((Unit!13799 0))(
  ( (Unit!13800) )
))
(declare-fun lt!213512 () Unit!13799)

(declare-fun minValueAfter!38 () V!18589)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!163 (array!29995 array!29997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18589 V!18589 V!18589 V!18589 (_ BitVec 32) Int) Unit!13799)

(assert (=> b!470578 (= lt!213512 (lemmaNoChangeToArrayThenSameMapNoExtras!163 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1983 (array!29995 array!29997 (_ BitVec 32) (_ BitVec 32) V!18589 V!18589 (_ BitVec 32) Int) ListLongMap!7609)

(assert (=> b!470578 (= lt!213511 (getCurrentListMapNoExtraKeys!1983 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470578 (= lt!213513 (getCurrentListMapNoExtraKeys!1983 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21370 () Bool)

(declare-fun tp!41077 () Bool)

(assert (=> mapNonEmpty!21370 (= mapRes!21370 (and tp!41077 e!275695))))

(declare-fun mapValue!21370 () ValueCell!6213)

(declare-fun mapKey!21370 () (_ BitVec 32))

(declare-fun mapRest!21370 () (Array (_ BitVec 32) ValueCell!6213))

(assert (=> mapNonEmpty!21370 (= (arr!14422 _values!833) (store mapRest!21370 mapKey!21370 mapValue!21370))))

(declare-fun b!470579 () Bool)

(declare-fun res!281175 () Bool)

(assert (=> b!470579 (=> (not res!281175) (not e!275691))))

(assert (=> b!470579 (= res!281175 (and (= (size!14774 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14773 _keys!1025) (size!14774 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21370 () Bool)

(assert (=> mapIsEmpty!21370 mapRes!21370))

(declare-fun res!281176 () Bool)

(assert (=> start!42152 (=> (not res!281176) (not e!275691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42152 (= res!281176 (validMask!0 mask!1365))))

(assert (=> start!42152 e!275691))

(assert (=> start!42152 tp_is_empty!13113))

(assert (=> start!42152 tp!41076))

(assert (=> start!42152 true))

(declare-fun array_inv!10406 (array!29995) Bool)

(assert (=> start!42152 (array_inv!10406 _keys!1025)))

(declare-fun array_inv!10407 (array!29997) Bool)

(assert (=> start!42152 (and (array_inv!10407 _values!833) e!275692)))

(declare-fun b!470576 () Bool)

(declare-fun res!281178 () Bool)

(assert (=> b!470576 (=> (not res!281178) (not e!275691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29995 (_ BitVec 32)) Bool)

(assert (=> b!470576 (= res!281178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42152 res!281176) b!470579))

(assert (= (and b!470579 res!281175) b!470576))

(assert (= (and b!470576 res!281178) b!470574))

(assert (= (and b!470574 res!281177) b!470578))

(assert (= (and b!470577 condMapEmpty!21370) mapIsEmpty!21370))

(assert (= (and b!470577 (not condMapEmpty!21370)) mapNonEmpty!21370))

(get-info :version)

(assert (= (and mapNonEmpty!21370 ((_ is ValueCellFull!6213) mapValue!21370)) b!470575))

(assert (= (and b!470577 ((_ is ValueCellFull!6213) mapDefault!21370)) b!470573))

(assert (= start!42152 b!470577))

(declare-fun m!452843 () Bool)

(assert (=> b!470576 m!452843))

(declare-fun m!452845 () Bool)

(assert (=> mapNonEmpty!21370 m!452845))

(declare-fun m!452847 () Bool)

(assert (=> b!470578 m!452847))

(declare-fun m!452849 () Bool)

(assert (=> b!470578 m!452849))

(declare-fun m!452851 () Bool)

(assert (=> b!470578 m!452851))

(declare-fun m!452853 () Bool)

(assert (=> start!42152 m!452853))

(declare-fun m!452855 () Bool)

(assert (=> start!42152 m!452855))

(declare-fun m!452857 () Bool)

(assert (=> start!42152 m!452857))

(declare-fun m!452859 () Bool)

(assert (=> b!470574 m!452859))

(check-sat (not mapNonEmpty!21370) tp_is_empty!13113 b_and!20107 (not start!42152) (not b_next!11685) (not b!470574) (not b!470576) (not b!470578))
(check-sat b_and!20107 (not b_next!11685))
