; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42402 () Bool)

(assert start!42402)

(declare-fun b_free!11877 () Bool)

(declare-fun b_next!11877 () Bool)

(assert (=> start!42402 (= b_free!11877 (not b_next!11877))))

(declare-fun tp!41665 () Bool)

(declare-fun b_and!20333 () Bool)

(assert (=> start!42402 (= tp!41665 b_and!20333)))

(declare-fun b!473096 () Bool)

(declare-fun e!277498 () Bool)

(declare-fun tp_is_empty!13305 () Bool)

(assert (=> b!473096 (= e!277498 tp_is_empty!13305)))

(declare-fun res!282582 () Bool)

(declare-fun e!277496 () Bool)

(assert (=> start!42402 (=> (not res!282582) (not e!277496))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42402 (= res!282582 (validMask!0 mask!1365))))

(assert (=> start!42402 e!277496))

(assert (=> start!42402 tp_is_empty!13305))

(assert (=> start!42402 tp!41665))

(assert (=> start!42402 true))

(declare-datatypes ((array!30369 0))(
  ( (array!30370 (arr!14604 (Array (_ BitVec 32) (_ BitVec 64))) (size!14956 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30369)

(declare-fun array_inv!10534 (array!30369) Bool)

(assert (=> start!42402 (array_inv!10534 _keys!1025)))

(declare-datatypes ((V!18845 0))(
  ( (V!18846 (val!6697 Int)) )
))
(declare-datatypes ((ValueCell!6309 0))(
  ( (ValueCellFull!6309 (v!8988 V!18845)) (EmptyCell!6309) )
))
(declare-datatypes ((array!30371 0))(
  ( (array!30372 (arr!14605 (Array (_ BitVec 32) ValueCell!6309)) (size!14957 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30371)

(declare-fun e!277494 () Bool)

(declare-fun array_inv!10535 (array!30371) Bool)

(assert (=> start!42402 (and (array_inv!10535 _values!833) e!277494)))

(declare-fun b!473097 () Bool)

(declare-fun res!282585 () Bool)

(assert (=> b!473097 (=> (not res!282585) (not e!277496))))

(declare-datatypes ((List!8907 0))(
  ( (Nil!8904) (Cons!8903 (h!9759 (_ BitVec 64)) (t!14877 List!8907)) )
))
(declare-fun arrayNoDuplicates!0 (array!30369 (_ BitVec 32) List!8907) Bool)

(assert (=> b!473097 (= res!282585 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8904))))

(declare-fun b!473098 () Bool)

(declare-fun e!277495 () Bool)

(assert (=> b!473098 (= e!277495 tp_is_empty!13305)))

(declare-fun mapNonEmpty!21670 () Bool)

(declare-fun mapRes!21670 () Bool)

(declare-fun tp!41664 () Bool)

(assert (=> mapNonEmpty!21670 (= mapRes!21670 (and tp!41664 e!277495))))

(declare-fun mapKey!21670 () (_ BitVec 32))

(declare-fun mapValue!21670 () ValueCell!6309)

(declare-fun mapRest!21670 () (Array (_ BitVec 32) ValueCell!6309))

(assert (=> mapNonEmpty!21670 (= (arr!14605 _values!833) (store mapRest!21670 mapKey!21670 mapValue!21670))))

(declare-fun mapIsEmpty!21670 () Bool)

(assert (=> mapIsEmpty!21670 mapRes!21670))

(declare-fun b!473099 () Bool)

(declare-fun res!282586 () Bool)

(assert (=> b!473099 (=> (not res!282586) (not e!277496))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473099 (= res!282586 (and (= (size!14957 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14956 _keys!1025) (size!14957 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473100 () Bool)

(declare-fun res!282584 () Bool)

(assert (=> b!473100 (=> (not res!282584) (not e!277496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30369 (_ BitVec 32)) Bool)

(assert (=> b!473100 (= res!282584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473101 () Bool)

(declare-fun e!277497 () Bool)

(assert (=> b!473101 (= e!277496 (not e!277497))))

(declare-fun res!282583 () Bool)

(assert (=> b!473101 (=> res!282583 e!277497)))

(assert (=> b!473101 (= res!282583 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8824 0))(
  ( (tuple2!8825 (_1!4423 (_ BitVec 64)) (_2!4423 V!18845)) )
))
(declare-datatypes ((List!8908 0))(
  ( (Nil!8905) (Cons!8904 (h!9760 tuple2!8824) (t!14878 List!8908)) )
))
(declare-datatypes ((ListLongMap!7737 0))(
  ( (ListLongMap!7738 (toList!3884 List!8908)) )
))
(declare-fun lt!214800 () ListLongMap!7737)

(declare-fun lt!214801 () ListLongMap!7737)

(assert (=> b!473101 (= lt!214800 lt!214801)))

(declare-datatypes ((Unit!13924 0))(
  ( (Unit!13925) )
))
(declare-fun lt!214803 () Unit!13924)

(declare-fun minValueBefore!38 () V!18845)

(declare-fun zeroValue!794 () V!18845)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18845)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!224 (array!30369 array!30371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18845 V!18845 V!18845 V!18845 (_ BitVec 32) Int) Unit!13924)

(assert (=> b!473101 (= lt!214803 (lemmaNoChangeToArrayThenSameMapNoExtras!224 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2044 (array!30369 array!30371 (_ BitVec 32) (_ BitVec 32) V!18845 V!18845 (_ BitVec 32) Int) ListLongMap!7737)

(assert (=> b!473101 (= lt!214801 (getCurrentListMapNoExtraKeys!2044 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473101 (= lt!214800 (getCurrentListMapNoExtraKeys!2044 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473102 () Bool)

(assert (=> b!473102 (= e!277494 (and e!277498 mapRes!21670))))

(declare-fun condMapEmpty!21670 () Bool)

(declare-fun mapDefault!21670 () ValueCell!6309)

(assert (=> b!473102 (= condMapEmpty!21670 (= (arr!14605 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6309)) mapDefault!21670)))))

(declare-fun b!473103 () Bool)

(assert (=> b!473103 (= e!277497 true)))

(declare-fun lt!214797 () ListLongMap!7737)

(declare-fun lt!214798 () tuple2!8824)

(declare-fun +!1723 (ListLongMap!7737 tuple2!8824) ListLongMap!7737)

(assert (=> b!473103 (= (+!1723 lt!214797 lt!214798) (+!1723 (+!1723 lt!214797 (tuple2!8825 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214798))))

(assert (=> b!473103 (= lt!214798 (tuple2!8825 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214799 () Unit!13924)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!132 (ListLongMap!7737 (_ BitVec 64) V!18845 V!18845) Unit!13924)

(assert (=> b!473103 (= lt!214799 (addSameAsAddTwiceSameKeyDiffValues!132 lt!214797 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473103 (= lt!214797 (+!1723 lt!214800 (tuple2!8825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214804 () ListLongMap!7737)

(declare-fun getCurrentListMap!2252 (array!30369 array!30371 (_ BitVec 32) (_ BitVec 32) V!18845 V!18845 (_ BitVec 32) Int) ListLongMap!7737)

(assert (=> b!473103 (= lt!214804 (getCurrentListMap!2252 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214802 () ListLongMap!7737)

(assert (=> b!473103 (= lt!214802 (getCurrentListMap!2252 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42402 res!282582) b!473099))

(assert (= (and b!473099 res!282586) b!473100))

(assert (= (and b!473100 res!282584) b!473097))

(assert (= (and b!473097 res!282585) b!473101))

(assert (= (and b!473101 (not res!282583)) b!473103))

(assert (= (and b!473102 condMapEmpty!21670) mapIsEmpty!21670))

(assert (= (and b!473102 (not condMapEmpty!21670)) mapNonEmpty!21670))

(get-info :version)

(assert (= (and mapNonEmpty!21670 ((_ is ValueCellFull!6309) mapValue!21670)) b!473098))

(assert (= (and b!473102 ((_ is ValueCellFull!6309) mapDefault!21670)) b!473096))

(assert (= start!42402 b!473102))

(declare-fun m!455033 () Bool)

(assert (=> start!42402 m!455033))

(declare-fun m!455035 () Bool)

(assert (=> start!42402 m!455035))

(declare-fun m!455037 () Bool)

(assert (=> start!42402 m!455037))

(declare-fun m!455039 () Bool)

(assert (=> b!473101 m!455039))

(declare-fun m!455041 () Bool)

(assert (=> b!473101 m!455041))

(declare-fun m!455043 () Bool)

(assert (=> b!473101 m!455043))

(declare-fun m!455045 () Bool)

(assert (=> b!473100 m!455045))

(declare-fun m!455047 () Bool)

(assert (=> b!473097 m!455047))

(declare-fun m!455049 () Bool)

(assert (=> mapNonEmpty!21670 m!455049))

(declare-fun m!455051 () Bool)

(assert (=> b!473103 m!455051))

(declare-fun m!455053 () Bool)

(assert (=> b!473103 m!455053))

(declare-fun m!455055 () Bool)

(assert (=> b!473103 m!455055))

(assert (=> b!473103 m!455053))

(declare-fun m!455057 () Bool)

(assert (=> b!473103 m!455057))

(declare-fun m!455059 () Bool)

(assert (=> b!473103 m!455059))

(declare-fun m!455061 () Bool)

(assert (=> b!473103 m!455061))

(declare-fun m!455063 () Bool)

(assert (=> b!473103 m!455063))

(check-sat (not start!42402) (not b!473097) (not b!473100) tp_is_empty!13305 (not b!473103) (not b_next!11877) b_and!20333 (not b!473101) (not mapNonEmpty!21670))
(check-sat b_and!20333 (not b_next!11877))
