; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41408 () Bool)

(assert start!41408)

(declare-fun b_free!11101 () Bool)

(declare-fun b_next!11101 () Bool)

(assert (=> start!41408 (= b_free!11101 (not b_next!11101))))

(declare-fun tp!39298 () Bool)

(declare-fun b_and!19447 () Bool)

(assert (=> start!41408 (= tp!39298 b_and!19447)))

(declare-fun mapIsEmpty!20467 () Bool)

(declare-fun mapRes!20467 () Bool)

(assert (=> mapIsEmpty!20467 mapRes!20467))

(declare-fun b!462773 () Bool)

(declare-fun e!270116 () Bool)

(declare-fun tp_is_empty!12529 () Bool)

(assert (=> b!462773 (= e!270116 tp_is_empty!12529)))

(declare-fun b!462774 () Bool)

(declare-fun e!270119 () Bool)

(declare-fun e!270117 () Bool)

(assert (=> b!462774 (= e!270119 (and e!270117 mapRes!20467))))

(declare-fun condMapEmpty!20467 () Bool)

(declare-datatypes ((V!17811 0))(
  ( (V!17812 (val!6309 Int)) )
))
(declare-datatypes ((ValueCell!5921 0))(
  ( (ValueCellFull!5921 (v!8597 V!17811)) (EmptyCell!5921) )
))
(declare-datatypes ((array!28854 0))(
  ( (array!28855 (arr!13859 (Array (_ BitVec 32) ValueCell!5921)) (size!14211 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28854)

(declare-fun mapDefault!20467 () ValueCell!5921)

(assert (=> b!462774 (= condMapEmpty!20467 (= (arr!13859 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5921)) mapDefault!20467)))))

(declare-fun b!462775 () Bool)

(declare-fun e!270120 () Bool)

(assert (=> b!462775 (= e!270120 false)))

(declare-fun minValueBefore!38 () V!17811)

(declare-fun zeroValue!794 () V!17811)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8200 0))(
  ( (tuple2!8201 (_1!4111 (_ BitVec 64)) (_2!4111 V!17811)) )
))
(declare-datatypes ((List!8281 0))(
  ( (Nil!8278) (Cons!8277 (h!9133 tuple2!8200) (t!14217 List!8281)) )
))
(declare-datatypes ((ListLongMap!7115 0))(
  ( (ListLongMap!7116 (toList!3573 List!8281)) )
))
(declare-fun lt!209279 () ListLongMap!7115)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!28856 0))(
  ( (array!28857 (arr!13860 (Array (_ BitVec 32) (_ BitVec 64))) (size!14212 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28856)

(declare-fun getCurrentListMapNoExtraKeys!1800 (array!28856 array!28854 (_ BitVec 32) (_ BitVec 32) V!17811 V!17811 (_ BitVec 32) Int) ListLongMap!7115)

(assert (=> b!462775 (= lt!209279 (getCurrentListMapNoExtraKeys!1800 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462776 () Bool)

(declare-fun res!276763 () Bool)

(assert (=> b!462776 (=> (not res!276763) (not e!270120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28856 (_ BitVec 32)) Bool)

(assert (=> b!462776 (= res!276763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276766 () Bool)

(assert (=> start!41408 (=> (not res!276766) (not e!270120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41408 (= res!276766 (validMask!0 mask!1365))))

(assert (=> start!41408 e!270120))

(assert (=> start!41408 tp_is_empty!12529))

(assert (=> start!41408 tp!39298))

(assert (=> start!41408 true))

(declare-fun array_inv!10098 (array!28856) Bool)

(assert (=> start!41408 (array_inv!10098 _keys!1025)))

(declare-fun array_inv!10099 (array!28854) Bool)

(assert (=> start!41408 (and (array_inv!10099 _values!833) e!270119)))

(declare-fun b!462777 () Bool)

(declare-fun res!276765 () Bool)

(assert (=> b!462777 (=> (not res!276765) (not e!270120))))

(declare-datatypes ((List!8282 0))(
  ( (Nil!8279) (Cons!8278 (h!9134 (_ BitVec 64)) (t!14218 List!8282)) )
))
(declare-fun arrayNoDuplicates!0 (array!28856 (_ BitVec 32) List!8282) Bool)

(assert (=> b!462777 (= res!276765 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8279))))

(declare-fun mapNonEmpty!20467 () Bool)

(declare-fun tp!39297 () Bool)

(assert (=> mapNonEmpty!20467 (= mapRes!20467 (and tp!39297 e!270116))))

(declare-fun mapRest!20467 () (Array (_ BitVec 32) ValueCell!5921))

(declare-fun mapKey!20467 () (_ BitVec 32))

(declare-fun mapValue!20467 () ValueCell!5921)

(assert (=> mapNonEmpty!20467 (= (arr!13859 _values!833) (store mapRest!20467 mapKey!20467 mapValue!20467))))

(declare-fun b!462778 () Bool)

(declare-fun res!276764 () Bool)

(assert (=> b!462778 (=> (not res!276764) (not e!270120))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462778 (= res!276764 (and (= (size!14211 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14212 _keys!1025) (size!14211 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462779 () Bool)

(assert (=> b!462779 (= e!270117 tp_is_empty!12529)))

(assert (= (and start!41408 res!276766) b!462778))

(assert (= (and b!462778 res!276764) b!462776))

(assert (= (and b!462776 res!276763) b!462777))

(assert (= (and b!462777 res!276765) b!462775))

(assert (= (and b!462774 condMapEmpty!20467) mapIsEmpty!20467))

(assert (= (and b!462774 (not condMapEmpty!20467)) mapNonEmpty!20467))

(get-info :version)

(assert (= (and mapNonEmpty!20467 ((_ is ValueCellFull!5921) mapValue!20467)) b!462773))

(assert (= (and b!462774 ((_ is ValueCellFull!5921) mapDefault!20467)) b!462779))

(assert (= start!41408 b!462774))

(declare-fun m!445811 () Bool)

(assert (=> b!462776 m!445811))

(declare-fun m!445813 () Bool)

(assert (=> start!41408 m!445813))

(declare-fun m!445815 () Bool)

(assert (=> start!41408 m!445815))

(declare-fun m!445817 () Bool)

(assert (=> start!41408 m!445817))

(declare-fun m!445819 () Bool)

(assert (=> mapNonEmpty!20467 m!445819))

(declare-fun m!445821 () Bool)

(assert (=> b!462777 m!445821))

(declare-fun m!445823 () Bool)

(assert (=> b!462775 m!445823))

(check-sat (not b!462777) (not start!41408) (not b!462776) (not b!462775) tp_is_empty!12529 b_and!19447 (not b_next!11101) (not mapNonEmpty!20467))
(check-sat b_and!19447 (not b_next!11101))
