; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42026 () Bool)

(assert start!42026)

(declare-fun b_free!11593 () Bool)

(declare-fun b_next!11593 () Bool)

(assert (=> start!42026 (= b_free!11593 (not b_next!11593))))

(declare-fun tp!40798 () Bool)

(declare-fun b_and!19977 () Bool)

(assert (=> start!42026 (= tp!40798 b_and!19977)))

(declare-fun res!280338 () Bool)

(declare-fun e!274638 () Bool)

(assert (=> start!42026 (=> (not res!280338) (not e!274638))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42026 (= res!280338 (validMask!0 mask!1365))))

(assert (=> start!42026 e!274638))

(declare-fun tp_is_empty!13021 () Bool)

(assert (=> start!42026 tp_is_empty!13021))

(assert (=> start!42026 tp!40798))

(assert (=> start!42026 true))

(declare-datatypes ((array!29799 0))(
  ( (array!29800 (arr!14324 (Array (_ BitVec 32) (_ BitVec 64))) (size!14677 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29799)

(declare-fun array_inv!10420 (array!29799) Bool)

(assert (=> start!42026 (array_inv!10420 _keys!1025)))

(declare-datatypes ((V!18467 0))(
  ( (V!18468 (val!6555 Int)) )
))
(declare-datatypes ((ValueCell!6167 0))(
  ( (ValueCellFull!6167 (v!8839 V!18467)) (EmptyCell!6167) )
))
(declare-datatypes ((array!29801 0))(
  ( (array!29802 (arr!14325 (Array (_ BitVec 32) ValueCell!6167)) (size!14678 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29801)

(declare-fun e!274641 () Bool)

(declare-fun array_inv!10421 (array!29801) Bool)

(assert (=> start!42026 (and (array_inv!10421 _values!833) e!274641)))

(declare-fun b!469078 () Bool)

(declare-fun e!274637 () Bool)

(assert (=> b!469078 (= e!274638 (not e!274637))))

(declare-fun res!280340 () Bool)

(assert (=> b!469078 (=> res!280340 e!274637)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469078 (= res!280340 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8662 0))(
  ( (tuple2!8663 (_1!4342 (_ BitVec 64)) (_2!4342 V!18467)) )
))
(declare-datatypes ((List!8734 0))(
  ( (Nil!8731) (Cons!8730 (h!9586 tuple2!8662) (t!14685 List!8734)) )
))
(declare-datatypes ((ListLongMap!7565 0))(
  ( (ListLongMap!7566 (toList!3798 List!8734)) )
))
(declare-fun lt!212402 () ListLongMap!7565)

(declare-fun lt!212397 () ListLongMap!7565)

(assert (=> b!469078 (= lt!212402 lt!212397)))

(declare-datatypes ((Unit!13695 0))(
  ( (Unit!13696) )
))
(declare-fun lt!212400 () Unit!13695)

(declare-fun minValueBefore!38 () V!18467)

(declare-fun zeroValue!794 () V!18467)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18467)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!132 (array!29799 array!29801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 V!18467 V!18467 (_ BitVec 32) Int) Unit!13695)

(assert (=> b!469078 (= lt!212400 (lemmaNoChangeToArrayThenSameMapNoExtras!132 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1975 (array!29799 array!29801 (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 (_ BitVec 32) Int) ListLongMap!7565)

(assert (=> b!469078 (= lt!212397 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469078 (= lt!212402 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469079 () Bool)

(declare-fun e!274639 () Bool)

(declare-fun mapRes!21229 () Bool)

(assert (=> b!469079 (= e!274641 (and e!274639 mapRes!21229))))

(declare-fun condMapEmpty!21229 () Bool)

(declare-fun mapDefault!21229 () ValueCell!6167)

(assert (=> b!469079 (= condMapEmpty!21229 (= (arr!14325 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6167)) mapDefault!21229)))))

(declare-fun b!469080 () Bool)

(declare-fun res!280339 () Bool)

(assert (=> b!469080 (=> (not res!280339) (not e!274638))))

(assert (=> b!469080 (= res!280339 (and (= (size!14678 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14677 _keys!1025) (size!14678 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469081 () Bool)

(declare-fun e!274640 () Bool)

(assert (=> b!469081 (= e!274640 tp_is_empty!13021)))

(declare-fun b!469082 () Bool)

(declare-fun res!280341 () Bool)

(assert (=> b!469082 (=> (not res!280341) (not e!274638))))

(declare-datatypes ((List!8735 0))(
  ( (Nil!8732) (Cons!8731 (h!9587 (_ BitVec 64)) (t!14686 List!8735)) )
))
(declare-fun arrayNoDuplicates!0 (array!29799 (_ BitVec 32) List!8735) Bool)

(assert (=> b!469082 (= res!280341 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8732))))

(declare-fun b!469083 () Bool)

(assert (=> b!469083 (= e!274637 true)))

(declare-fun lt!212399 () tuple2!8662)

(declare-fun +!1727 (ListLongMap!7565 tuple2!8662) ListLongMap!7565)

(assert (=> b!469083 (= (+!1727 lt!212402 lt!212399) (+!1727 (+!1727 lt!212402 (tuple2!8663 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212399))))

(assert (=> b!469083 (= lt!212399 (tuple2!8663 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212401 () Unit!13695)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!110 (ListLongMap!7565 (_ BitVec 64) V!18467 V!18467) Unit!13695)

(assert (=> b!469083 (= lt!212401 (addSameAsAddTwiceSameKeyDiffValues!110 lt!212402 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212398 () ListLongMap!7565)

(declare-fun getCurrentListMap!2163 (array!29799 array!29801 (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 (_ BitVec 32) Int) ListLongMap!7565)

(assert (=> b!469083 (= lt!212398 (getCurrentListMap!2163 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212396 () ListLongMap!7565)

(assert (=> b!469083 (= lt!212396 (getCurrentListMap!2163 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469084 () Bool)

(declare-fun res!280342 () Bool)

(assert (=> b!469084 (=> (not res!280342) (not e!274638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29799 (_ BitVec 32)) Bool)

(assert (=> b!469084 (= res!280342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21229 () Bool)

(declare-fun tp!40797 () Bool)

(assert (=> mapNonEmpty!21229 (= mapRes!21229 (and tp!40797 e!274640))))

(declare-fun mapValue!21229 () ValueCell!6167)

(declare-fun mapKey!21229 () (_ BitVec 32))

(declare-fun mapRest!21229 () (Array (_ BitVec 32) ValueCell!6167))

(assert (=> mapNonEmpty!21229 (= (arr!14325 _values!833) (store mapRest!21229 mapKey!21229 mapValue!21229))))

(declare-fun mapIsEmpty!21229 () Bool)

(assert (=> mapIsEmpty!21229 mapRes!21229))

(declare-fun b!469085 () Bool)

(assert (=> b!469085 (= e!274639 tp_is_empty!13021)))

(assert (= (and start!42026 res!280338) b!469080))

(assert (= (and b!469080 res!280339) b!469084))

(assert (= (and b!469084 res!280342) b!469082))

(assert (= (and b!469082 res!280341) b!469078))

(assert (= (and b!469078 (not res!280340)) b!469083))

(assert (= (and b!469079 condMapEmpty!21229) mapIsEmpty!21229))

(assert (= (and b!469079 (not condMapEmpty!21229)) mapNonEmpty!21229))

(get-info :version)

(assert (= (and mapNonEmpty!21229 ((_ is ValueCellFull!6167) mapValue!21229)) b!469081))

(assert (= (and b!469079 ((_ is ValueCellFull!6167) mapDefault!21229)) b!469085))

(assert (= start!42026 b!469079))

(declare-fun m!450757 () Bool)

(assert (=> b!469083 m!450757))

(declare-fun m!450759 () Bool)

(assert (=> b!469083 m!450759))

(assert (=> b!469083 m!450759))

(declare-fun m!450761 () Bool)

(assert (=> b!469083 m!450761))

(declare-fun m!450763 () Bool)

(assert (=> b!469083 m!450763))

(declare-fun m!450765 () Bool)

(assert (=> b!469083 m!450765))

(declare-fun m!450767 () Bool)

(assert (=> b!469083 m!450767))

(declare-fun m!450769 () Bool)

(assert (=> mapNonEmpty!21229 m!450769))

(declare-fun m!450771 () Bool)

(assert (=> b!469082 m!450771))

(declare-fun m!450773 () Bool)

(assert (=> b!469078 m!450773))

(declare-fun m!450775 () Bool)

(assert (=> b!469078 m!450775))

(declare-fun m!450777 () Bool)

(assert (=> b!469078 m!450777))

(declare-fun m!450779 () Bool)

(assert (=> start!42026 m!450779))

(declare-fun m!450781 () Bool)

(assert (=> start!42026 m!450781))

(declare-fun m!450783 () Bool)

(assert (=> start!42026 m!450783))

(declare-fun m!450785 () Bool)

(assert (=> b!469084 m!450785))

(check-sat (not b!469078) (not b_next!11593) b_and!19977 (not b!469082) (not b!469083) (not start!42026) (not mapNonEmpty!21229) tp_is_empty!13021 (not b!469084))
(check-sat b_and!19977 (not b_next!11593))
