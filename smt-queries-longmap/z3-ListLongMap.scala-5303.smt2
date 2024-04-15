; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71002 () Bool)

(assert start!71002)

(declare-fun b_free!13225 () Bool)

(declare-fun b_next!13225 () Bool)

(assert (=> start!71002 (= b_free!13225 (not b_next!13225))))

(declare-fun tp!46429 () Bool)

(declare-fun b_and!22103 () Bool)

(assert (=> start!71002 (= tp!46429 b_and!22103)))

(declare-fun mapIsEmpty!24022 () Bool)

(declare-fun mapRes!24022 () Bool)

(assert (=> mapIsEmpty!24022 mapRes!24022))

(declare-fun res!562164 () Bool)

(declare-fun e!458761 () Bool)

(assert (=> start!71002 (=> (not res!562164) (not e!458761))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71002 (= res!562164 (validMask!0 mask!1312))))

(assert (=> start!71002 e!458761))

(declare-fun tp_is_empty!14935 () Bool)

(assert (=> start!71002 tp_is_empty!14935))

(declare-datatypes ((array!46025 0))(
  ( (array!46026 (arr!22060 (Array (_ BitVec 32) (_ BitVec 64))) (size!22481 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46025)

(declare-fun array_inv!17667 (array!46025) Bool)

(assert (=> start!71002 (array_inv!17667 _keys!976)))

(assert (=> start!71002 true))

(declare-datatypes ((V!24915 0))(
  ( (V!24916 (val!7515 Int)) )
))
(declare-datatypes ((ValueCell!7052 0))(
  ( (ValueCellFull!7052 (v!9942 V!24915)) (EmptyCell!7052) )
))
(declare-datatypes ((array!46027 0))(
  ( (array!46028 (arr!22061 (Array (_ BitVec 32) ValueCell!7052)) (size!22482 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46027)

(declare-fun e!458760 () Bool)

(declare-fun array_inv!17668 (array!46027) Bool)

(assert (=> start!71002 (and (array_inv!17668 _values!788) e!458760)))

(assert (=> start!71002 tp!46429))

(declare-fun b!824494 () Bool)

(declare-fun res!562166 () Bool)

(assert (=> b!824494 (=> (not res!562166) (not e!458761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46025 (_ BitVec 32)) Bool)

(assert (=> b!824494 (= res!562166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824495 () Bool)

(declare-fun e!458763 () Bool)

(assert (=> b!824495 (= e!458763 tp_is_empty!14935)))

(declare-fun b!824496 () Bool)

(declare-fun res!562162 () Bool)

(assert (=> b!824496 (=> (not res!562162) (not e!458761))))

(declare-datatypes ((List!15749 0))(
  ( (Nil!15746) (Cons!15745 (h!16874 (_ BitVec 64)) (t!22083 List!15749)) )
))
(declare-fun arrayNoDuplicates!0 (array!46025 (_ BitVec 32) List!15749) Bool)

(assert (=> b!824496 (= res!562162 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15746))))

(declare-fun b!824497 () Bool)

(declare-fun res!562165 () Bool)

(assert (=> b!824497 (=> (not res!562165) (not e!458761))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824497 (= res!562165 (and (= (size!22482 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22481 _keys!976) (size!22482 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824498 () Bool)

(declare-fun e!458764 () Bool)

(assert (=> b!824498 (= e!458764 true)))

(declare-fun zeroValueBefore!34 () V!24915)

(declare-fun minValue!754 () V!24915)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9950 0))(
  ( (tuple2!9951 (_1!4986 (_ BitVec 64)) (_2!4986 V!24915)) )
))
(declare-datatypes ((List!15750 0))(
  ( (Nil!15747) (Cons!15746 (h!16875 tuple2!9950) (t!22084 List!15750)) )
))
(declare-datatypes ((ListLongMap!8763 0))(
  ( (ListLongMap!8764 (toList!4397 List!15750)) )
))
(declare-fun lt!371732 () ListLongMap!8763)

(declare-fun getCurrentListMap!2491 (array!46025 array!46027 (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 (_ BitVec 32) Int) ListLongMap!8763)

(assert (=> b!824498 (= lt!371732 (getCurrentListMap!2491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24022 () Bool)

(declare-fun tp!46428 () Bool)

(assert (=> mapNonEmpty!24022 (= mapRes!24022 (and tp!46428 e!458763))))

(declare-fun mapRest!24022 () (Array (_ BitVec 32) ValueCell!7052))

(declare-fun mapValue!24022 () ValueCell!7052)

(declare-fun mapKey!24022 () (_ BitVec 32))

(assert (=> mapNonEmpty!24022 (= (arr!22061 _values!788) (store mapRest!24022 mapKey!24022 mapValue!24022))))

(declare-fun b!824499 () Bool)

(declare-fun e!458765 () Bool)

(assert (=> b!824499 (= e!458765 tp_is_empty!14935)))

(declare-fun b!824500 () Bool)

(assert (=> b!824500 (= e!458760 (and e!458765 mapRes!24022))))

(declare-fun condMapEmpty!24022 () Bool)

(declare-fun mapDefault!24022 () ValueCell!7052)

(assert (=> b!824500 (= condMapEmpty!24022 (= (arr!22061 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7052)) mapDefault!24022)))))

(declare-fun b!824501 () Bool)

(assert (=> b!824501 (= e!458761 (not e!458764))))

(declare-fun res!562163 () Bool)

(assert (=> b!824501 (=> res!562163 e!458764)))

(assert (=> b!824501 (= res!562163 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371735 () ListLongMap!8763)

(declare-fun lt!371733 () ListLongMap!8763)

(assert (=> b!824501 (= lt!371735 lt!371733)))

(declare-fun zeroValueAfter!34 () V!24915)

(declare-datatypes ((Unit!28218 0))(
  ( (Unit!28219) )
))
(declare-fun lt!371734 () Unit!28218)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!534 (array!46025 array!46027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 V!24915 V!24915 (_ BitVec 32) Int) Unit!28218)

(assert (=> b!824501 (= lt!371734 (lemmaNoChangeToArrayThenSameMapNoExtras!534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2441 (array!46025 array!46027 (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 (_ BitVec 32) Int) ListLongMap!8763)

(assert (=> b!824501 (= lt!371733 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824501 (= lt!371735 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71002 res!562164) b!824497))

(assert (= (and b!824497 res!562165) b!824494))

(assert (= (and b!824494 res!562166) b!824496))

(assert (= (and b!824496 res!562162) b!824501))

(assert (= (and b!824501 (not res!562163)) b!824498))

(assert (= (and b!824500 condMapEmpty!24022) mapIsEmpty!24022))

(assert (= (and b!824500 (not condMapEmpty!24022)) mapNonEmpty!24022))

(get-info :version)

(assert (= (and mapNonEmpty!24022 ((_ is ValueCellFull!7052) mapValue!24022)) b!824495))

(assert (= (and b!824500 ((_ is ValueCellFull!7052) mapDefault!24022)) b!824499))

(assert (= start!71002 b!824500))

(declare-fun m!766025 () Bool)

(assert (=> start!71002 m!766025))

(declare-fun m!766027 () Bool)

(assert (=> start!71002 m!766027))

(declare-fun m!766029 () Bool)

(assert (=> start!71002 m!766029))

(declare-fun m!766031 () Bool)

(assert (=> b!824498 m!766031))

(declare-fun m!766033 () Bool)

(assert (=> mapNonEmpty!24022 m!766033))

(declare-fun m!766035 () Bool)

(assert (=> b!824494 m!766035))

(declare-fun m!766037 () Bool)

(assert (=> b!824496 m!766037))

(declare-fun m!766039 () Bool)

(assert (=> b!824501 m!766039))

(declare-fun m!766041 () Bool)

(assert (=> b!824501 m!766041))

(declare-fun m!766043 () Bool)

(assert (=> b!824501 m!766043))

(check-sat (not b!824494) (not mapNonEmpty!24022) (not b_next!13225) (not b!824501) (not b!824496) (not b!824498) (not start!71002) tp_is_empty!14935 b_and!22103)
(check-sat b_and!22103 (not b_next!13225))
