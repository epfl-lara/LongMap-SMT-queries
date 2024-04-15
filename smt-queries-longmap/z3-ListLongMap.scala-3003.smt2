; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42322 () Bool)

(assert start!42322)

(declare-fun b_free!11827 () Bool)

(declare-fun b_next!11827 () Bool)

(assert (=> start!42322 (= b_free!11827 (not b_next!11827))))

(declare-fun tp!41512 () Bool)

(declare-fun b_and!20247 () Bool)

(assert (=> start!42322 (= tp!41512 b_and!20247)))

(declare-fun b!472077 () Bool)

(declare-fun e!276778 () Bool)

(declare-fun e!276777 () Bool)

(declare-fun mapRes!21592 () Bool)

(assert (=> b!472077 (= e!276778 (and e!276777 mapRes!21592))))

(declare-fun condMapEmpty!21592 () Bool)

(declare-datatypes ((V!18779 0))(
  ( (V!18780 (val!6672 Int)) )
))
(declare-datatypes ((ValueCell!6284 0))(
  ( (ValueCellFull!6284 (v!8957 V!18779)) (EmptyCell!6284) )
))
(declare-datatypes ((array!30255 0))(
  ( (array!30256 (arr!14548 (Array (_ BitVec 32) ValueCell!6284)) (size!14901 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30255)

(declare-fun mapDefault!21592 () ValueCell!6284)

(assert (=> b!472077 (= condMapEmpty!21592 (= (arr!14548 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6284)) mapDefault!21592)))))

(declare-fun b!472078 () Bool)

(declare-fun res!282021 () Bool)

(declare-fun e!276780 () Bool)

(assert (=> b!472078 (=> (not res!282021) (not e!276780))))

(declare-datatypes ((array!30257 0))(
  ( (array!30258 (arr!14549 (Array (_ BitVec 32) (_ BitVec 64))) (size!14902 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30257)

(declare-datatypes ((List!8899 0))(
  ( (Nil!8896) (Cons!8895 (h!9751 (_ BitVec 64)) (t!14858 List!8899)) )
))
(declare-fun arrayNoDuplicates!0 (array!30257 (_ BitVec 32) List!8899) Bool)

(assert (=> b!472078 (= res!282021 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8896))))

(declare-fun b!472079 () Bool)

(declare-fun e!276781 () Bool)

(assert (=> b!472079 (= e!276780 (not e!276781))))

(declare-fun res!282024 () Bool)

(assert (=> b!472079 (=> res!282024 e!276781)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472079 (= res!282024 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8828 0))(
  ( (tuple2!8829 (_1!4425 (_ BitVec 64)) (_2!4425 V!18779)) )
))
(declare-datatypes ((List!8900 0))(
  ( (Nil!8897) (Cons!8896 (h!9752 tuple2!8828) (t!14859 List!8900)) )
))
(declare-datatypes ((ListLongMap!7731 0))(
  ( (ListLongMap!7732 (toList!3881 List!8900)) )
))
(declare-fun lt!214066 () ListLongMap!7731)

(declare-fun lt!214065 () ListLongMap!7731)

(assert (=> b!472079 (= lt!214066 lt!214065)))

(declare-datatypes ((Unit!13857 0))(
  ( (Unit!13858) )
))
(declare-fun lt!214068 () Unit!13857)

(declare-fun minValueBefore!38 () V!18779)

(declare-fun zeroValue!794 () V!18779)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18779)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!210 (array!30257 array!30255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 V!18779 V!18779 (_ BitVec 32) Int) Unit!13857)

(assert (=> b!472079 (= lt!214068 (lemmaNoChangeToArrayThenSameMapNoExtras!210 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2053 (array!30257 array!30255 (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 (_ BitVec 32) Int) ListLongMap!7731)

(assert (=> b!472079 (= lt!214065 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472079 (= lt!214066 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472080 () Bool)

(assert (=> b!472080 (= e!276781 true)))

(declare-fun lt!214067 () ListLongMap!7731)

(declare-fun getCurrentListMap!2188 (array!30257 array!30255 (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 (_ BitVec 32) Int) ListLongMap!7731)

(assert (=> b!472080 (= lt!214067 (getCurrentListMap!2188 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282023 () Bool)

(assert (=> start!42322 (=> (not res!282023) (not e!276780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42322 (= res!282023 (validMask!0 mask!1365))))

(assert (=> start!42322 e!276780))

(declare-fun tp_is_empty!13255 () Bool)

(assert (=> start!42322 tp_is_empty!13255))

(assert (=> start!42322 tp!41512))

(assert (=> start!42322 true))

(declare-fun array_inv!10578 (array!30257) Bool)

(assert (=> start!42322 (array_inv!10578 _keys!1025)))

(declare-fun array_inv!10579 (array!30255) Bool)

(assert (=> start!42322 (and (array_inv!10579 _values!833) e!276778)))

(declare-fun b!472081 () Bool)

(declare-fun e!276776 () Bool)

(assert (=> b!472081 (= e!276776 tp_is_empty!13255)))

(declare-fun b!472082 () Bool)

(assert (=> b!472082 (= e!276777 tp_is_empty!13255)))

(declare-fun mapNonEmpty!21592 () Bool)

(declare-fun tp!41511 () Bool)

(assert (=> mapNonEmpty!21592 (= mapRes!21592 (and tp!41511 e!276776))))

(declare-fun mapValue!21592 () ValueCell!6284)

(declare-fun mapKey!21592 () (_ BitVec 32))

(declare-fun mapRest!21592 () (Array (_ BitVec 32) ValueCell!6284))

(assert (=> mapNonEmpty!21592 (= (arr!14548 _values!833) (store mapRest!21592 mapKey!21592 mapValue!21592))))

(declare-fun b!472083 () Bool)

(declare-fun res!282020 () Bool)

(assert (=> b!472083 (=> (not res!282020) (not e!276780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30257 (_ BitVec 32)) Bool)

(assert (=> b!472083 (= res!282020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472084 () Bool)

(declare-fun res!282022 () Bool)

(assert (=> b!472084 (=> (not res!282022) (not e!276780))))

(assert (=> b!472084 (= res!282022 (and (= (size!14901 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14902 _keys!1025) (size!14901 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21592 () Bool)

(assert (=> mapIsEmpty!21592 mapRes!21592))

(assert (= (and start!42322 res!282023) b!472084))

(assert (= (and b!472084 res!282022) b!472083))

(assert (= (and b!472083 res!282020) b!472078))

(assert (= (and b!472078 res!282021) b!472079))

(assert (= (and b!472079 (not res!282024)) b!472080))

(assert (= (and b!472077 condMapEmpty!21592) mapIsEmpty!21592))

(assert (= (and b!472077 (not condMapEmpty!21592)) mapNonEmpty!21592))

(get-info :version)

(assert (= (and mapNonEmpty!21592 ((_ is ValueCellFull!6284) mapValue!21592)) b!472081))

(assert (= (and b!472077 ((_ is ValueCellFull!6284) mapDefault!21592)) b!472082))

(assert (= start!42322 b!472077))

(declare-fun m!453603 () Bool)

(assert (=> b!472078 m!453603))

(declare-fun m!453605 () Bool)

(assert (=> b!472083 m!453605))

(declare-fun m!453607 () Bool)

(assert (=> b!472079 m!453607))

(declare-fun m!453609 () Bool)

(assert (=> b!472079 m!453609))

(declare-fun m!453611 () Bool)

(assert (=> b!472079 m!453611))

(declare-fun m!453613 () Bool)

(assert (=> start!42322 m!453613))

(declare-fun m!453615 () Bool)

(assert (=> start!42322 m!453615))

(declare-fun m!453617 () Bool)

(assert (=> start!42322 m!453617))

(declare-fun m!453619 () Bool)

(assert (=> b!472080 m!453619))

(declare-fun m!453621 () Bool)

(assert (=> mapNonEmpty!21592 m!453621))

(check-sat (not start!42322) b_and!20247 (not mapNonEmpty!21592) tp_is_empty!13255 (not b!472080) (not b!472078) (not b!472079) (not b_next!11827) (not b!472083))
(check-sat b_and!20247 (not b_next!11827))
