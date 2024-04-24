; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42552 () Bool)

(assert start!42552)

(declare-fun b_free!12001 () Bool)

(declare-fun b_next!12001 () Bool)

(assert (=> start!42552 (= b_free!12001 (not b_next!12001))))

(declare-fun tp!42042 () Bool)

(declare-fun b_and!20491 () Bool)

(assert (=> start!42552 (= tp!42042 b_and!20491)))

(declare-fun b!474838 () Bool)

(declare-fun e!278753 () Bool)

(assert (=> b!474838 (= e!278753 false)))

(declare-datatypes ((V!19011 0))(
  ( (V!19012 (val!6759 Int)) )
))
(declare-fun zeroValue!794 () V!19011)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8836 0))(
  ( (tuple2!8837 (_1!4429 (_ BitVec 64)) (_2!4429 V!19011)) )
))
(declare-datatypes ((List!8896 0))(
  ( (Nil!8893) (Cons!8892 (h!9748 tuple2!8836) (t!14862 List!8896)) )
))
(declare-datatypes ((ListLongMap!7751 0))(
  ( (ListLongMap!7752 (toList!3891 List!8896)) )
))
(declare-fun lt!216335 () ListLongMap!7751)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30582 0))(
  ( (array!30583 (arr!14708 (Array (_ BitVec 32) (_ BitVec 64))) (size!15060 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30582)

(declare-datatypes ((ValueCell!6371 0))(
  ( (ValueCellFull!6371 (v!9053 V!19011)) (EmptyCell!6371) )
))
(declare-datatypes ((array!30584 0))(
  ( (array!30585 (arr!14709 (Array (_ BitVec 32) ValueCell!6371)) (size!15061 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30584)

(declare-fun minValueAfter!38 () V!19011)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2098 (array!30582 array!30584 (_ BitVec 32) (_ BitVec 32) V!19011 V!19011 (_ BitVec 32) Int) ListLongMap!7751)

(assert (=> b!474838 (= lt!216335 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19011)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216334 () ListLongMap!7751)

(assert (=> b!474838 (= lt!216334 (getCurrentListMapNoExtraKeys!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474839 () Bool)

(declare-fun e!278751 () Bool)

(declare-fun tp_is_empty!13429 () Bool)

(assert (=> b!474839 (= e!278751 tp_is_empty!13429)))

(declare-fun b!474840 () Bool)

(declare-fun res!283619 () Bool)

(assert (=> b!474840 (=> (not res!283619) (not e!278753))))

(declare-datatypes ((List!8897 0))(
  ( (Nil!8894) (Cons!8893 (h!9749 (_ BitVec 64)) (t!14863 List!8897)) )
))
(declare-fun arrayNoDuplicates!0 (array!30582 (_ BitVec 32) List!8897) Bool)

(assert (=> b!474840 (= res!283619 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8894))))

(declare-fun b!474841 () Bool)

(declare-fun res!283616 () Bool)

(assert (=> b!474841 (=> (not res!283616) (not e!278753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30582 (_ BitVec 32)) Bool)

(assert (=> b!474841 (= res!283616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21862 () Bool)

(declare-fun mapRes!21862 () Bool)

(assert (=> mapIsEmpty!21862 mapRes!21862))

(declare-fun mapNonEmpty!21862 () Bool)

(declare-fun tp!42043 () Bool)

(assert (=> mapNonEmpty!21862 (= mapRes!21862 (and tp!42043 e!278751))))

(declare-fun mapRest!21862 () (Array (_ BitVec 32) ValueCell!6371))

(declare-fun mapKey!21862 () (_ BitVec 32))

(declare-fun mapValue!21862 () ValueCell!6371)

(assert (=> mapNonEmpty!21862 (= (arr!14709 _values!833) (store mapRest!21862 mapKey!21862 mapValue!21862))))

(declare-fun b!474842 () Bool)

(declare-fun res!283618 () Bool)

(assert (=> b!474842 (=> (not res!283618) (not e!278753))))

(assert (=> b!474842 (= res!283618 (and (= (size!15061 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15060 _keys!1025) (size!15061 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283617 () Bool)

(assert (=> start!42552 (=> (not res!283617) (not e!278753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42552 (= res!283617 (validMask!0 mask!1365))))

(assert (=> start!42552 e!278753))

(assert (=> start!42552 tp_is_empty!13429))

(assert (=> start!42552 tp!42042))

(assert (=> start!42552 true))

(declare-fun array_inv!10690 (array!30582) Bool)

(assert (=> start!42552 (array_inv!10690 _keys!1025)))

(declare-fun e!278752 () Bool)

(declare-fun array_inv!10691 (array!30584) Bool)

(assert (=> start!42552 (and (array_inv!10691 _values!833) e!278752)))

(declare-fun b!474843 () Bool)

(declare-fun e!278750 () Bool)

(assert (=> b!474843 (= e!278750 tp_is_empty!13429)))

(declare-fun b!474844 () Bool)

(assert (=> b!474844 (= e!278752 (and e!278750 mapRes!21862))))

(declare-fun condMapEmpty!21862 () Bool)

(declare-fun mapDefault!21862 () ValueCell!6371)

(assert (=> b!474844 (= condMapEmpty!21862 (= (arr!14709 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6371)) mapDefault!21862)))))

(assert (= (and start!42552 res!283617) b!474842))

(assert (= (and b!474842 res!283618) b!474841))

(assert (= (and b!474841 res!283616) b!474840))

(assert (= (and b!474840 res!283619) b!474838))

(assert (= (and b!474844 condMapEmpty!21862) mapIsEmpty!21862))

(assert (= (and b!474844 (not condMapEmpty!21862)) mapNonEmpty!21862))

(get-info :version)

(assert (= (and mapNonEmpty!21862 ((_ is ValueCellFull!6371) mapValue!21862)) b!474839))

(assert (= (and b!474844 ((_ is ValueCellFull!6371) mapDefault!21862)) b!474843))

(assert (= start!42552 b!474844))

(declare-fun m!457389 () Bool)

(assert (=> b!474838 m!457389))

(declare-fun m!457391 () Bool)

(assert (=> b!474838 m!457391))

(declare-fun m!457393 () Bool)

(assert (=> b!474841 m!457393))

(declare-fun m!457395 () Bool)

(assert (=> b!474840 m!457395))

(declare-fun m!457397 () Bool)

(assert (=> mapNonEmpty!21862 m!457397))

(declare-fun m!457399 () Bool)

(assert (=> start!42552 m!457399))

(declare-fun m!457401 () Bool)

(assert (=> start!42552 m!457401))

(declare-fun m!457403 () Bool)

(assert (=> start!42552 m!457403))

(check-sat (not b!474840) (not mapNonEmpty!21862) (not b!474841) tp_is_empty!13429 (not b_next!12001) (not start!42552) b_and!20491 (not b!474838))
(check-sat b_and!20491 (not b_next!12001))
