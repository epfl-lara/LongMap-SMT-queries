; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42586 () Bool)

(assert start!42586)

(declare-fun b_free!12021 () Bool)

(declare-fun b_next!12021 () Bool)

(assert (=> start!42586 (= b_free!12021 (not b_next!12021))))

(declare-fun tp!42102 () Bool)

(declare-fun b_and!20501 () Bool)

(assert (=> start!42586 (= tp!42102 b_and!20501)))

(declare-fun res!283745 () Bool)

(declare-fun e!278942 () Bool)

(assert (=> start!42586 (=> (not res!283745) (not e!278942))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42586 (= res!283745 (validMask!0 mask!1365))))

(assert (=> start!42586 e!278942))

(declare-fun tp_is_empty!13449 () Bool)

(assert (=> start!42586 tp_is_empty!13449))

(assert (=> start!42586 tp!42102))

(assert (=> start!42586 true))

(declare-datatypes ((array!30637 0))(
  ( (array!30638 (arr!14736 (Array (_ BitVec 32) (_ BitVec 64))) (size!15088 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30637)

(declare-fun array_inv!10632 (array!30637) Bool)

(assert (=> start!42586 (array_inv!10632 _keys!1025)))

(declare-datatypes ((V!19037 0))(
  ( (V!19038 (val!6769 Int)) )
))
(declare-datatypes ((ValueCell!6381 0))(
  ( (ValueCellFull!6381 (v!9062 V!19037)) (EmptyCell!6381) )
))
(declare-datatypes ((array!30639 0))(
  ( (array!30640 (arr!14737 (Array (_ BitVec 32) ValueCell!6381)) (size!15089 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30639)

(declare-fun e!278943 () Bool)

(declare-fun array_inv!10633 (array!30639) Bool)

(assert (=> start!42586 (and (array_inv!10633 _values!833) e!278943)))

(declare-fun b!475109 () Bool)

(declare-fun e!278941 () Bool)

(assert (=> b!475109 (= e!278941 tp_is_empty!13449)))

(declare-fun b!475110 () Bool)

(declare-fun e!278939 () Bool)

(declare-fun mapRes!21892 () Bool)

(assert (=> b!475110 (= e!278943 (and e!278939 mapRes!21892))))

(declare-fun condMapEmpty!21892 () Bool)

(declare-fun mapDefault!21892 () ValueCell!6381)

(assert (=> b!475110 (= condMapEmpty!21892 (= (arr!14737 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6381)) mapDefault!21892)))))

(declare-fun b!475111 () Bool)

(declare-fun res!283743 () Bool)

(assert (=> b!475111 (=> (not res!283743) (not e!278942))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475111 (= res!283743 (and (= (size!15089 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15088 _keys!1025) (size!15089 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475112 () Bool)

(declare-fun res!283744 () Bool)

(assert (=> b!475112 (=> (not res!283744) (not e!278942))))

(declare-datatypes ((List!9004 0))(
  ( (Nil!9001) (Cons!9000 (h!9856 (_ BitVec 64)) (t!14978 List!9004)) )
))
(declare-fun arrayNoDuplicates!0 (array!30637 (_ BitVec 32) List!9004) Bool)

(assert (=> b!475112 (= res!283744 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9001))))

(declare-fun mapNonEmpty!21892 () Bool)

(declare-fun tp!42103 () Bool)

(assert (=> mapNonEmpty!21892 (= mapRes!21892 (and tp!42103 e!278941))))

(declare-fun mapRest!21892 () (Array (_ BitVec 32) ValueCell!6381))

(declare-fun mapKey!21892 () (_ BitVec 32))

(declare-fun mapValue!21892 () ValueCell!6381)

(assert (=> mapNonEmpty!21892 (= (arr!14737 _values!833) (store mapRest!21892 mapKey!21892 mapValue!21892))))

(declare-fun b!475113 () Bool)

(assert (=> b!475113 (= e!278942 false)))

(declare-fun zeroValue!794 () V!19037)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8926 0))(
  ( (tuple2!8927 (_1!4474 (_ BitVec 64)) (_2!4474 V!19037)) )
))
(declare-datatypes ((List!9005 0))(
  ( (Nil!9002) (Cons!9001 (h!9857 tuple2!8926) (t!14979 List!9005)) )
))
(declare-datatypes ((ListLongMap!7839 0))(
  ( (ListLongMap!7840 (toList!3935 List!9005)) )
))
(declare-fun lt!216383 () ListLongMap!7839)

(declare-fun minValueAfter!38 () V!19037)

(declare-fun getCurrentListMapNoExtraKeys!2092 (array!30637 array!30639 (_ BitVec 32) (_ BitVec 32) V!19037 V!19037 (_ BitVec 32) Int) ListLongMap!7839)

(assert (=> b!475113 (= lt!216383 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19037)

(declare-fun lt!216382 () ListLongMap!7839)

(assert (=> b!475113 (= lt!216382 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475114 () Bool)

(declare-fun res!283746 () Bool)

(assert (=> b!475114 (=> (not res!283746) (not e!278942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30637 (_ BitVec 32)) Bool)

(assert (=> b!475114 (= res!283746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21892 () Bool)

(assert (=> mapIsEmpty!21892 mapRes!21892))

(declare-fun b!475115 () Bool)

(assert (=> b!475115 (= e!278939 tp_is_empty!13449)))

(assert (= (and start!42586 res!283745) b!475111))

(assert (= (and b!475111 res!283743) b!475114))

(assert (= (and b!475114 res!283746) b!475112))

(assert (= (and b!475112 res!283744) b!475113))

(assert (= (and b!475110 condMapEmpty!21892) mapIsEmpty!21892))

(assert (= (and b!475110 (not condMapEmpty!21892)) mapNonEmpty!21892))

(get-info :version)

(assert (= (and mapNonEmpty!21892 ((_ is ValueCellFull!6381) mapValue!21892)) b!475109))

(assert (= (and b!475110 ((_ is ValueCellFull!6381) mapDefault!21892)) b!475115))

(assert (= start!42586 b!475110))

(declare-fun m!457367 () Bool)

(assert (=> b!475113 m!457367))

(declare-fun m!457369 () Bool)

(assert (=> b!475113 m!457369))

(declare-fun m!457371 () Bool)

(assert (=> start!42586 m!457371))

(declare-fun m!457373 () Bool)

(assert (=> start!42586 m!457373))

(declare-fun m!457375 () Bool)

(assert (=> start!42586 m!457375))

(declare-fun m!457377 () Bool)

(assert (=> b!475112 m!457377))

(declare-fun m!457379 () Bool)

(assert (=> b!475114 m!457379))

(declare-fun m!457381 () Bool)

(assert (=> mapNonEmpty!21892 m!457381))

(check-sat (not b!475113) (not mapNonEmpty!21892) (not start!42586) b_and!20501 (not b!475114) tp_is_empty!13449 (not b_next!12021) (not b!475112))
(check-sat b_and!20501 (not b_next!12021))
