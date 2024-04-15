; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41888 () Bool)

(assert start!41888)

(declare-fun b_free!11491 () Bool)

(declare-fun b_next!11491 () Bool)

(assert (=> start!41888 (= b_free!11491 (not b_next!11491))))

(declare-fun tp!40486 () Bool)

(declare-fun b_and!19853 () Bool)

(assert (=> start!41888 (= tp!40486 b_and!19853)))

(declare-fun res!279439 () Bool)

(declare-fun e!273517 () Bool)

(assert (=> start!41888 (=> (not res!279439) (not e!273517))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41888 (= res!279439 (validMask!0 mask!1365))))

(assert (=> start!41888 e!273517))

(declare-fun tp_is_empty!12919 () Bool)

(assert (=> start!41888 tp_is_empty!12919))

(assert (=> start!41888 tp!40486))

(assert (=> start!41888 true))

(declare-datatypes ((array!29605 0))(
  ( (array!29606 (arr!14229 (Array (_ BitVec 32) (_ BitVec 64))) (size!14582 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29605)

(declare-fun array_inv!10354 (array!29605) Bool)

(assert (=> start!41888 (array_inv!10354 _keys!1025)))

(declare-datatypes ((V!18331 0))(
  ( (V!18332 (val!6504 Int)) )
))
(declare-datatypes ((ValueCell!6116 0))(
  ( (ValueCellFull!6116 (v!8787 V!18331)) (EmptyCell!6116) )
))
(declare-datatypes ((array!29607 0))(
  ( (array!29608 (arr!14230 (Array (_ BitVec 32) ValueCell!6116)) (size!14583 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29607)

(declare-fun e!273512 () Bool)

(declare-fun array_inv!10355 (array!29607) Bool)

(assert (=> start!41888 (and (array_inv!10355 _values!833) e!273512)))

(declare-fun b!467527 () Bool)

(declare-fun e!273516 () Bool)

(assert (=> b!467527 (= e!273517 (not e!273516))))

(declare-fun res!279442 () Bool)

(assert (=> b!467527 (=> res!279442 e!273516)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467527 (= res!279442 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8578 0))(
  ( (tuple2!8579 (_1!4300 (_ BitVec 64)) (_2!4300 V!18331)) )
))
(declare-datatypes ((List!8656 0))(
  ( (Nil!8653) (Cons!8652 (h!9508 tuple2!8578) (t!14603 List!8656)) )
))
(declare-datatypes ((ListLongMap!7481 0))(
  ( (ListLongMap!7482 (toList!3756 List!8656)) )
))
(declare-fun lt!211280 () ListLongMap!7481)

(declare-fun lt!211279 () ListLongMap!7481)

(assert (=> b!467527 (= lt!211280 lt!211279)))

(declare-datatypes ((Unit!13616 0))(
  ( (Unit!13617) )
))
(declare-fun lt!211281 () Unit!13616)

(declare-fun minValueBefore!38 () V!18331)

(declare-fun zeroValue!794 () V!18331)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18331)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!97 (array!29605 array!29607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 V!18331 V!18331 (_ BitVec 32) Int) Unit!13616)

(assert (=> b!467527 (= lt!211281 (lemmaNoChangeToArrayThenSameMapNoExtras!97 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1940 (array!29605 array!29607 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7481)

(assert (=> b!467527 (= lt!211279 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467527 (= lt!211280 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467528 () Bool)

(declare-fun e!273514 () Bool)

(assert (=> b!467528 (= e!273514 tp_is_empty!12919)))

(declare-fun mapIsEmpty!21070 () Bool)

(declare-fun mapRes!21070 () Bool)

(assert (=> mapIsEmpty!21070 mapRes!21070))

(declare-fun b!467529 () Bool)

(declare-fun res!279441 () Bool)

(assert (=> b!467529 (=> (not res!279441) (not e!273517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29605 (_ BitVec 32)) Bool)

(assert (=> b!467529 (= res!279441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467530 () Bool)

(declare-fun res!279440 () Bool)

(assert (=> b!467530 (=> (not res!279440) (not e!273517))))

(assert (=> b!467530 (= res!279440 (and (= (size!14583 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14582 _keys!1025) (size!14583 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467531 () Bool)

(assert (=> b!467531 (= e!273516 true)))

(declare-fun lt!211278 () ListLongMap!7481)

(declare-fun getCurrentListMap!2128 (array!29605 array!29607 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7481)

(assert (=> b!467531 (= lt!211278 (getCurrentListMap!2128 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21070 () Bool)

(declare-fun tp!40485 () Bool)

(assert (=> mapNonEmpty!21070 (= mapRes!21070 (and tp!40485 e!273514))))

(declare-fun mapValue!21070 () ValueCell!6116)

(declare-fun mapKey!21070 () (_ BitVec 32))

(declare-fun mapRest!21070 () (Array (_ BitVec 32) ValueCell!6116))

(assert (=> mapNonEmpty!21070 (= (arr!14230 _values!833) (store mapRest!21070 mapKey!21070 mapValue!21070))))

(declare-fun b!467532 () Bool)

(declare-fun e!273513 () Bool)

(assert (=> b!467532 (= e!273513 tp_is_empty!12919)))

(declare-fun b!467533 () Bool)

(assert (=> b!467533 (= e!273512 (and e!273513 mapRes!21070))))

(declare-fun condMapEmpty!21070 () Bool)

(declare-fun mapDefault!21070 () ValueCell!6116)

(assert (=> b!467533 (= condMapEmpty!21070 (= (arr!14230 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6116)) mapDefault!21070)))))

(declare-fun b!467534 () Bool)

(declare-fun res!279438 () Bool)

(assert (=> b!467534 (=> (not res!279438) (not e!273517))))

(declare-datatypes ((List!8657 0))(
  ( (Nil!8654) (Cons!8653 (h!9509 (_ BitVec 64)) (t!14604 List!8657)) )
))
(declare-fun arrayNoDuplicates!0 (array!29605 (_ BitVec 32) List!8657) Bool)

(assert (=> b!467534 (= res!279438 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8654))))

(assert (= (and start!41888 res!279439) b!467530))

(assert (= (and b!467530 res!279440) b!467529))

(assert (= (and b!467529 res!279441) b!467534))

(assert (= (and b!467534 res!279438) b!467527))

(assert (= (and b!467527 (not res!279442)) b!467531))

(assert (= (and b!467533 condMapEmpty!21070) mapIsEmpty!21070))

(assert (= (and b!467533 (not condMapEmpty!21070)) mapNonEmpty!21070))

(get-info :version)

(assert (= (and mapNonEmpty!21070 ((_ is ValueCellFull!6116) mapValue!21070)) b!467528))

(assert (= (and b!467533 ((_ is ValueCellFull!6116) mapDefault!21070)) b!467532))

(assert (= start!41888 b!467533))

(declare-fun m!449155 () Bool)

(assert (=> b!467527 m!449155))

(declare-fun m!449157 () Bool)

(assert (=> b!467527 m!449157))

(declare-fun m!449159 () Bool)

(assert (=> b!467527 m!449159))

(declare-fun m!449161 () Bool)

(assert (=> mapNonEmpty!21070 m!449161))

(declare-fun m!449163 () Bool)

(assert (=> b!467529 m!449163))

(declare-fun m!449165 () Bool)

(assert (=> b!467534 m!449165))

(declare-fun m!449167 () Bool)

(assert (=> start!41888 m!449167))

(declare-fun m!449169 () Bool)

(assert (=> start!41888 m!449169))

(declare-fun m!449171 () Bool)

(assert (=> start!41888 m!449171))

(declare-fun m!449173 () Bool)

(assert (=> b!467531 m!449173))

(check-sat (not b!467527) (not start!41888) (not b!467529) (not mapNonEmpty!21070) tp_is_empty!12919 (not b!467531) (not b_next!11491) (not b!467534) b_and!19853)
(check-sat b_and!19853 (not b_next!11491))
