; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42454 () Bool)

(assert start!42454)

(declare-fun b_free!11923 () Bool)

(declare-fun b_next!11923 () Bool)

(assert (=> start!42454 (= b_free!11923 (not b_next!11923))))

(declare-fun tp!41805 () Bool)

(declare-fun b_and!20401 () Bool)

(assert (=> start!42454 (= tp!41805 b_and!20401)))

(declare-fun b!473768 () Bool)

(declare-fun e!277986 () Bool)

(assert (=> b!473768 (= e!277986 true)))

(declare-datatypes ((V!18907 0))(
  ( (V!18908 (val!6720 Int)) )
))
(declare-datatypes ((tuple2!8784 0))(
  ( (tuple2!8785 (_1!4403 (_ BitVec 64)) (_2!4403 V!18907)) )
))
(declare-datatypes ((List!8846 0))(
  ( (Nil!8843) (Cons!8842 (h!9698 tuple2!8784) (t!14810 List!8846)) )
))
(declare-datatypes ((ListLongMap!7699 0))(
  ( (ListLongMap!7700 (toList!3865 List!8846)) )
))
(declare-fun lt!215516 () ListLongMap!7699)

(declare-fun lt!215521 () tuple2!8784)

(declare-fun minValueBefore!38 () V!18907)

(declare-fun +!1748 (ListLongMap!7699 tuple2!8784) ListLongMap!7699)

(assert (=> b!473768 (= (+!1748 lt!215516 lt!215521) (+!1748 (+!1748 lt!215516 (tuple2!8785 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215521))))

(declare-fun minValueAfter!38 () V!18907)

(assert (=> b!473768 (= lt!215521 (tuple2!8785 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13936 0))(
  ( (Unit!13937) )
))
(declare-fun lt!215519 () Unit!13936)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!150 (ListLongMap!7699 (_ BitVec 64) V!18907 V!18907) Unit!13936)

(assert (=> b!473768 (= lt!215519 (addSameAsAddTwiceSameKeyDiffValues!150 lt!215516 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215518 () ListLongMap!7699)

(declare-fun zeroValue!794 () V!18907)

(assert (=> b!473768 (= lt!215516 (+!1748 lt!215518 (tuple2!8785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215520 () ListLongMap!7699)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30436 0))(
  ( (array!30437 (arr!14636 (Array (_ BitVec 32) (_ BitVec 64))) (size!14988 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30436)

(declare-datatypes ((ValueCell!6332 0))(
  ( (ValueCellFull!6332 (v!9013 V!18907)) (EmptyCell!6332) )
))
(declare-datatypes ((array!30438 0))(
  ( (array!30439 (arr!14637 (Array (_ BitVec 32) ValueCell!6332)) (size!14989 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30438)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2228 (array!30436 array!30438 (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 (_ BitVec 32) Int) ListLongMap!7699)

(assert (=> b!473768 (= lt!215520 (getCurrentListMap!2228 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215522 () ListLongMap!7699)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473768 (= lt!215522 (getCurrentListMap!2228 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473769 () Bool)

(declare-fun res!282999 () Bool)

(declare-fun e!277982 () Bool)

(assert (=> b!473769 (=> (not res!282999) (not e!277982))))

(declare-datatypes ((List!8847 0))(
  ( (Nil!8844) (Cons!8843 (h!9699 (_ BitVec 64)) (t!14811 List!8847)) )
))
(declare-fun arrayNoDuplicates!0 (array!30436 (_ BitVec 32) List!8847) Bool)

(assert (=> b!473769 (= res!282999 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8844))))

(declare-fun b!473770 () Bool)

(declare-fun e!277987 () Bool)

(declare-fun tp_is_empty!13351 () Bool)

(assert (=> b!473770 (= e!277987 tp_is_empty!13351)))

(declare-fun b!473771 () Bool)

(declare-fun res!283003 () Bool)

(assert (=> b!473771 (=> (not res!283003) (not e!277982))))

(assert (=> b!473771 (= res!283003 (and (= (size!14989 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14988 _keys!1025) (size!14989 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473772 () Bool)

(declare-fun res!283002 () Bool)

(assert (=> b!473772 (=> (not res!283002) (not e!277982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30436 (_ BitVec 32)) Bool)

(assert (=> b!473772 (= res!283002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473773 () Bool)

(assert (=> b!473773 (= e!277982 (not e!277986))))

(declare-fun res!283000 () Bool)

(assert (=> b!473773 (=> res!283000 e!277986)))

(assert (=> b!473773 (= res!283000 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215523 () ListLongMap!7699)

(assert (=> b!473773 (= lt!215518 lt!215523)))

(declare-fun lt!215517 () Unit!13936)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!234 (array!30436 array!30438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 V!18907 V!18907 (_ BitVec 32) Int) Unit!13936)

(assert (=> b!473773 (= lt!215517 (lemmaNoChangeToArrayThenSameMapNoExtras!234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2074 (array!30436 array!30438 (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 (_ BitVec 32) Int) ListLongMap!7699)

(assert (=> b!473773 (= lt!215523 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473773 (= lt!215518 (getCurrentListMapNoExtraKeys!2074 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283001 () Bool)

(assert (=> start!42454 (=> (not res!283001) (not e!277982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42454 (= res!283001 (validMask!0 mask!1365))))

(assert (=> start!42454 e!277982))

(assert (=> start!42454 tp_is_empty!13351))

(assert (=> start!42454 tp!41805))

(assert (=> start!42454 true))

(declare-fun array_inv!10642 (array!30436) Bool)

(assert (=> start!42454 (array_inv!10642 _keys!1025)))

(declare-fun e!277983 () Bool)

(declare-fun array_inv!10643 (array!30438) Bool)

(assert (=> start!42454 (and (array_inv!10643 _values!833) e!277983)))

(declare-fun mapNonEmpty!21742 () Bool)

(declare-fun mapRes!21742 () Bool)

(declare-fun tp!41806 () Bool)

(declare-fun e!277985 () Bool)

(assert (=> mapNonEmpty!21742 (= mapRes!21742 (and tp!41806 e!277985))))

(declare-fun mapValue!21742 () ValueCell!6332)

(declare-fun mapRest!21742 () (Array (_ BitVec 32) ValueCell!6332))

(declare-fun mapKey!21742 () (_ BitVec 32))

(assert (=> mapNonEmpty!21742 (= (arr!14637 _values!833) (store mapRest!21742 mapKey!21742 mapValue!21742))))

(declare-fun b!473774 () Bool)

(assert (=> b!473774 (= e!277983 (and e!277987 mapRes!21742))))

(declare-fun condMapEmpty!21742 () Bool)

(declare-fun mapDefault!21742 () ValueCell!6332)

(assert (=> b!473774 (= condMapEmpty!21742 (= (arr!14637 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6332)) mapDefault!21742)))))

(declare-fun mapIsEmpty!21742 () Bool)

(assert (=> mapIsEmpty!21742 mapRes!21742))

(declare-fun b!473775 () Bool)

(assert (=> b!473775 (= e!277985 tp_is_empty!13351)))

(assert (= (and start!42454 res!283001) b!473771))

(assert (= (and b!473771 res!283003) b!473772))

(assert (= (and b!473772 res!283002) b!473769))

(assert (= (and b!473769 res!282999) b!473773))

(assert (= (and b!473773 (not res!283000)) b!473768))

(assert (= (and b!473774 condMapEmpty!21742) mapIsEmpty!21742))

(assert (= (and b!473774 (not condMapEmpty!21742)) mapNonEmpty!21742))

(get-info :version)

(assert (= (and mapNonEmpty!21742 ((_ is ValueCellFull!6332) mapValue!21742)) b!473775))

(assert (= (and b!473774 ((_ is ValueCellFull!6332) mapDefault!21742)) b!473770))

(assert (= start!42454 b!473774))

(declare-fun m!456163 () Bool)

(assert (=> b!473768 m!456163))

(assert (=> b!473768 m!456163))

(declare-fun m!456165 () Bool)

(assert (=> b!473768 m!456165))

(declare-fun m!456167 () Bool)

(assert (=> b!473768 m!456167))

(declare-fun m!456169 () Bool)

(assert (=> b!473768 m!456169))

(declare-fun m!456171 () Bool)

(assert (=> b!473768 m!456171))

(declare-fun m!456173 () Bool)

(assert (=> b!473768 m!456173))

(declare-fun m!456175 () Bool)

(assert (=> b!473768 m!456175))

(declare-fun m!456177 () Bool)

(assert (=> b!473772 m!456177))

(declare-fun m!456179 () Bool)

(assert (=> start!42454 m!456179))

(declare-fun m!456181 () Bool)

(assert (=> start!42454 m!456181))

(declare-fun m!456183 () Bool)

(assert (=> start!42454 m!456183))

(declare-fun m!456185 () Bool)

(assert (=> mapNonEmpty!21742 m!456185))

(declare-fun m!456187 () Bool)

(assert (=> b!473769 m!456187))

(declare-fun m!456189 () Bool)

(assert (=> b!473773 m!456189))

(declare-fun m!456191 () Bool)

(assert (=> b!473773 m!456191))

(declare-fun m!456193 () Bool)

(assert (=> b!473773 m!456193))

(check-sat (not start!42454) (not b_next!11923) (not b!473772) (not b!473769) (not b!473768) (not mapNonEmpty!21742) tp_is_empty!13351 (not b!473773) b_and!20401)
(check-sat b_and!20401 (not b_next!11923))
