; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42050 () Bool)

(assert start!42050)

(declare-fun b_free!11617 () Bool)

(declare-fun b_next!11617 () Bool)

(assert (=> start!42050 (= b_free!11617 (not b_next!11617))))

(declare-fun tp!40870 () Bool)

(declare-fun b_and!20037 () Bool)

(assert (=> start!42050 (= tp!40870 b_and!20037)))

(declare-fun mapIsEmpty!21265 () Bool)

(declare-fun mapRes!21265 () Bool)

(assert (=> mapIsEmpty!21265 mapRes!21265))

(declare-fun b!469576 () Bool)

(declare-fun res!280644 () Bool)

(declare-fun e!274988 () Bool)

(assert (=> b!469576 (=> (not res!280644) (not e!274988))))

(declare-datatypes ((array!29850 0))(
  ( (array!29851 (arr!14349 (Array (_ BitVec 32) (_ BitVec 64))) (size!14701 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29850)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29850 (_ BitVec 32)) Bool)

(assert (=> b!469576 (= res!280644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469577 () Bool)

(declare-fun e!274987 () Bool)

(declare-fun e!274992 () Bool)

(assert (=> b!469577 (= e!274987 (and e!274992 mapRes!21265))))

(declare-fun condMapEmpty!21265 () Bool)

(declare-datatypes ((V!18499 0))(
  ( (V!18500 (val!6567 Int)) )
))
(declare-datatypes ((ValueCell!6179 0))(
  ( (ValueCellFull!6179 (v!8858 V!18499)) (EmptyCell!6179) )
))
(declare-datatypes ((array!29852 0))(
  ( (array!29853 (arr!14350 (Array (_ BitVec 32) ValueCell!6179)) (size!14702 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29852)

(declare-fun mapDefault!21265 () ValueCell!6179)

(assert (=> b!469577 (= condMapEmpty!21265 (= (arr!14350 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6179)) mapDefault!21265)))))

(declare-fun b!469578 () Bool)

(declare-fun e!274989 () Bool)

(assert (=> b!469578 (= e!274988 (not e!274989))))

(declare-fun res!280641 () Bool)

(assert (=> b!469578 (=> res!280641 e!274989)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469578 (= res!280641 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8568 0))(
  ( (tuple2!8569 (_1!4295 (_ BitVec 64)) (_2!4295 V!18499)) )
))
(declare-datatypes ((List!8642 0))(
  ( (Nil!8639) (Cons!8638 (h!9494 tuple2!8568) (t!14594 List!8642)) )
))
(declare-datatypes ((ListLongMap!7483 0))(
  ( (ListLongMap!7484 (toList!3757 List!8642)) )
))
(declare-fun lt!212896 () ListLongMap!7483)

(declare-fun lt!212898 () ListLongMap!7483)

(assert (=> b!469578 (= lt!212896 lt!212898)))

(declare-fun minValueBefore!38 () V!18499)

(declare-fun zeroValue!794 () V!18499)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13725 0))(
  ( (Unit!13726) )
))
(declare-fun lt!212895 () Unit!13725)

(declare-fun minValueAfter!38 () V!18499)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!134 (array!29850 array!29852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 V!18499 V!18499 (_ BitVec 32) Int) Unit!13725)

(assert (=> b!469578 (= lt!212895 (lemmaNoChangeToArrayThenSameMapNoExtras!134 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1974 (array!29850 array!29852 (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 (_ BitVec 32) Int) ListLongMap!7483)

(assert (=> b!469578 (= lt!212898 (getCurrentListMapNoExtraKeys!1974 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469578 (= lt!212896 (getCurrentListMapNoExtraKeys!1974 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469579 () Bool)

(declare-fun e!274991 () Bool)

(declare-fun tp_is_empty!13045 () Bool)

(assert (=> b!469579 (= e!274991 tp_is_empty!13045)))

(declare-fun res!280643 () Bool)

(assert (=> start!42050 (=> (not res!280643) (not e!274988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42050 (= res!280643 (validMask!0 mask!1365))))

(assert (=> start!42050 e!274988))

(assert (=> start!42050 tp_is_empty!13045))

(assert (=> start!42050 tp!40870))

(assert (=> start!42050 true))

(declare-fun array_inv!10450 (array!29850) Bool)

(assert (=> start!42050 (array_inv!10450 _keys!1025)))

(declare-fun array_inv!10451 (array!29852) Bool)

(assert (=> start!42050 (and (array_inv!10451 _values!833) e!274987)))

(declare-fun b!469580 () Bool)

(declare-fun res!280640 () Bool)

(assert (=> b!469580 (=> (not res!280640) (not e!274988))))

(declare-datatypes ((List!8643 0))(
  ( (Nil!8640) (Cons!8639 (h!9495 (_ BitVec 64)) (t!14595 List!8643)) )
))
(declare-fun arrayNoDuplicates!0 (array!29850 (_ BitVec 32) List!8643) Bool)

(assert (=> b!469580 (= res!280640 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8640))))

(declare-fun b!469581 () Bool)

(declare-fun res!280642 () Bool)

(assert (=> b!469581 (=> (not res!280642) (not e!274988))))

(assert (=> b!469581 (= res!280642 (and (= (size!14702 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14701 _keys!1025) (size!14702 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21265 () Bool)

(declare-fun tp!40869 () Bool)

(assert (=> mapNonEmpty!21265 (= mapRes!21265 (and tp!40869 e!274991))))

(declare-fun mapValue!21265 () ValueCell!6179)

(declare-fun mapRest!21265 () (Array (_ BitVec 32) ValueCell!6179))

(declare-fun mapKey!21265 () (_ BitVec 32))

(assert (=> mapNonEmpty!21265 (= (arr!14350 _values!833) (store mapRest!21265 mapKey!21265 mapValue!21265))))

(declare-fun b!469582 () Bool)

(assert (=> b!469582 (= e!274992 tp_is_empty!13045)))

(declare-fun b!469583 () Bool)

(assert (=> b!469583 (= e!274989 true)))

(declare-fun lt!212897 () tuple2!8568)

(declare-fun +!1715 (ListLongMap!7483 tuple2!8568) ListLongMap!7483)

(assert (=> b!469583 (= (+!1715 lt!212896 lt!212897) (+!1715 (+!1715 lt!212896 (tuple2!8569 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212897))))

(assert (=> b!469583 (= lt!212897 (tuple2!8569 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212894 () Unit!13725)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!121 (ListLongMap!7483 (_ BitVec 64) V!18499 V!18499) Unit!13725)

(assert (=> b!469583 (= lt!212894 (addSameAsAddTwiceSameKeyDiffValues!121 lt!212896 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212900 () ListLongMap!7483)

(declare-fun getCurrentListMap!2181 (array!29850 array!29852 (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 (_ BitVec 32) Int) ListLongMap!7483)

(assert (=> b!469583 (= lt!212900 (getCurrentListMap!2181 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212899 () ListLongMap!7483)

(assert (=> b!469583 (= lt!212899 (getCurrentListMap!2181 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42050 res!280643) b!469581))

(assert (= (and b!469581 res!280642) b!469576))

(assert (= (and b!469576 res!280644) b!469580))

(assert (= (and b!469580 res!280640) b!469578))

(assert (= (and b!469578 (not res!280641)) b!469583))

(assert (= (and b!469577 condMapEmpty!21265) mapIsEmpty!21265))

(assert (= (and b!469577 (not condMapEmpty!21265)) mapNonEmpty!21265))

(get-info :version)

(assert (= (and mapNonEmpty!21265 ((_ is ValueCellFull!6179) mapValue!21265)) b!469579))

(assert (= (and b!469577 ((_ is ValueCellFull!6179) mapDefault!21265)) b!469582))

(assert (= start!42050 b!469577))

(declare-fun m!452033 () Bool)

(assert (=> b!469578 m!452033))

(declare-fun m!452035 () Bool)

(assert (=> b!469578 m!452035))

(declare-fun m!452037 () Bool)

(assert (=> b!469578 m!452037))

(declare-fun m!452039 () Bool)

(assert (=> mapNonEmpty!21265 m!452039))

(declare-fun m!452041 () Bool)

(assert (=> b!469576 m!452041))

(declare-fun m!452043 () Bool)

(assert (=> b!469580 m!452043))

(declare-fun m!452045 () Bool)

(assert (=> start!42050 m!452045))

(declare-fun m!452047 () Bool)

(assert (=> start!42050 m!452047))

(declare-fun m!452049 () Bool)

(assert (=> start!42050 m!452049))

(declare-fun m!452051 () Bool)

(assert (=> b!469583 m!452051))

(declare-fun m!452053 () Bool)

(assert (=> b!469583 m!452053))

(declare-fun m!452055 () Bool)

(assert (=> b!469583 m!452055))

(declare-fun m!452057 () Bool)

(assert (=> b!469583 m!452057))

(declare-fun m!452059 () Bool)

(assert (=> b!469583 m!452059))

(assert (=> b!469583 m!452055))

(declare-fun m!452061 () Bool)

(assert (=> b!469583 m!452061))

(check-sat (not b!469583) tp_is_empty!13045 (not mapNonEmpty!21265) b_and!20037 (not b!469576) (not start!42050) (not b_next!11617) (not b!469580) (not b!469578))
(check-sat b_and!20037 (not b_next!11617))
