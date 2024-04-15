; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41900 () Bool)

(assert start!41900)

(declare-fun b_free!11503 () Bool)

(declare-fun b_next!11503 () Bool)

(assert (=> start!41900 (= b_free!11503 (not b_next!11503))))

(declare-fun tp!40522 () Bool)

(declare-fun b_and!19865 () Bool)

(assert (=> start!41900 (= tp!40522 b_and!19865)))

(declare-fun b!467671 () Bool)

(declare-fun e!273620 () Bool)

(declare-fun tp_is_empty!12931 () Bool)

(assert (=> b!467671 (= e!273620 tp_is_empty!12931)))

(declare-fun b!467672 () Bool)

(declare-fun e!273623 () Bool)

(assert (=> b!467672 (= e!273623 true)))

(declare-datatypes ((V!18347 0))(
  ( (V!18348 (val!6510 Int)) )
))
(declare-fun minValueBefore!38 () V!18347)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29625 0))(
  ( (array!29626 (arr!14239 (Array (_ BitVec 32) (_ BitVec 64))) (size!14592 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29625)

(declare-datatypes ((ValueCell!6122 0))(
  ( (ValueCellFull!6122 (v!8793 V!18347)) (EmptyCell!6122) )
))
(declare-datatypes ((array!29627 0))(
  ( (array!29628 (arr!14240 (Array (_ BitVec 32) ValueCell!6122)) (size!14593 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29627)

(declare-fun zeroValue!794 () V!18347)

(declare-datatypes ((tuple2!8586 0))(
  ( (tuple2!8587 (_1!4304 (_ BitVec 64)) (_2!4304 V!18347)) )
))
(declare-datatypes ((List!8662 0))(
  ( (Nil!8659) (Cons!8658 (h!9514 tuple2!8586) (t!14609 List!8662)) )
))
(declare-datatypes ((ListLongMap!7489 0))(
  ( (ListLongMap!7490 (toList!3760 List!8662)) )
))
(declare-fun lt!211353 () ListLongMap!7489)

(declare-fun getCurrentListMap!2131 (array!29625 array!29627 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7489)

(assert (=> b!467672 (= lt!211353 (getCurrentListMap!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467673 () Bool)

(declare-fun res!279532 () Bool)

(declare-fun e!273625 () Bool)

(assert (=> b!467673 (=> (not res!279532) (not e!273625))))

(declare-datatypes ((List!8663 0))(
  ( (Nil!8660) (Cons!8659 (h!9515 (_ BitVec 64)) (t!14610 List!8663)) )
))
(declare-fun arrayNoDuplicates!0 (array!29625 (_ BitVec 32) List!8663) Bool)

(assert (=> b!467673 (= res!279532 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8660))))

(declare-fun b!467674 () Bool)

(declare-fun e!273624 () Bool)

(assert (=> b!467674 (= e!273624 tp_is_empty!12931)))

(declare-fun res!279528 () Bool)

(assert (=> start!41900 (=> (not res!279528) (not e!273625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41900 (= res!279528 (validMask!0 mask!1365))))

(assert (=> start!41900 e!273625))

(assert (=> start!41900 tp_is_empty!12931))

(assert (=> start!41900 tp!40522))

(assert (=> start!41900 true))

(declare-fun array_inv!10358 (array!29625) Bool)

(assert (=> start!41900 (array_inv!10358 _keys!1025)))

(declare-fun e!273621 () Bool)

(declare-fun array_inv!10359 (array!29627) Bool)

(assert (=> start!41900 (and (array_inv!10359 _values!833) e!273621)))

(declare-fun b!467675 () Bool)

(declare-fun res!279530 () Bool)

(assert (=> b!467675 (=> (not res!279530) (not e!273625))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467675 (= res!279530 (and (= (size!14593 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14592 _keys!1025) (size!14593 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21088 () Bool)

(declare-fun mapRes!21088 () Bool)

(assert (=> mapIsEmpty!21088 mapRes!21088))

(declare-fun mapNonEmpty!21088 () Bool)

(declare-fun tp!40521 () Bool)

(assert (=> mapNonEmpty!21088 (= mapRes!21088 (and tp!40521 e!273620))))

(declare-fun mapRest!21088 () (Array (_ BitVec 32) ValueCell!6122))

(declare-fun mapKey!21088 () (_ BitVec 32))

(declare-fun mapValue!21088 () ValueCell!6122)

(assert (=> mapNonEmpty!21088 (= (arr!14240 _values!833) (store mapRest!21088 mapKey!21088 mapValue!21088))))

(declare-fun b!467676 () Bool)

(assert (=> b!467676 (= e!273625 (not e!273623))))

(declare-fun res!279531 () Bool)

(assert (=> b!467676 (=> res!279531 e!273623)))

(assert (=> b!467676 (= res!279531 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211351 () ListLongMap!7489)

(declare-fun lt!211350 () ListLongMap!7489)

(assert (=> b!467676 (= lt!211351 lt!211350)))

(declare-datatypes ((Unit!13624 0))(
  ( (Unit!13625) )
))
(declare-fun lt!211352 () Unit!13624)

(declare-fun minValueAfter!38 () V!18347)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!101 (array!29625 array!29627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 V!18347 V!18347 (_ BitVec 32) Int) Unit!13624)

(assert (=> b!467676 (= lt!211352 (lemmaNoChangeToArrayThenSameMapNoExtras!101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1944 (array!29625 array!29627 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7489)

(assert (=> b!467676 (= lt!211350 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467676 (= lt!211351 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467677 () Bool)

(declare-fun res!279529 () Bool)

(assert (=> b!467677 (=> (not res!279529) (not e!273625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29625 (_ BitVec 32)) Bool)

(assert (=> b!467677 (= res!279529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467678 () Bool)

(assert (=> b!467678 (= e!273621 (and e!273624 mapRes!21088))))

(declare-fun condMapEmpty!21088 () Bool)

(declare-fun mapDefault!21088 () ValueCell!6122)

(assert (=> b!467678 (= condMapEmpty!21088 (= (arr!14240 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6122)) mapDefault!21088)))))

(assert (= (and start!41900 res!279528) b!467675))

(assert (= (and b!467675 res!279530) b!467677))

(assert (= (and b!467677 res!279529) b!467673))

(assert (= (and b!467673 res!279532) b!467676))

(assert (= (and b!467676 (not res!279531)) b!467672))

(assert (= (and b!467678 condMapEmpty!21088) mapIsEmpty!21088))

(assert (= (and b!467678 (not condMapEmpty!21088)) mapNonEmpty!21088))

(get-info :version)

(assert (= (and mapNonEmpty!21088 ((_ is ValueCellFull!6122) mapValue!21088)) b!467671))

(assert (= (and b!467678 ((_ is ValueCellFull!6122) mapDefault!21088)) b!467674))

(assert (= start!41900 b!467678))

(declare-fun m!449275 () Bool)

(assert (=> b!467673 m!449275))

(declare-fun m!449277 () Bool)

(assert (=> b!467672 m!449277))

(declare-fun m!449279 () Bool)

(assert (=> start!41900 m!449279))

(declare-fun m!449281 () Bool)

(assert (=> start!41900 m!449281))

(declare-fun m!449283 () Bool)

(assert (=> start!41900 m!449283))

(declare-fun m!449285 () Bool)

(assert (=> b!467677 m!449285))

(declare-fun m!449287 () Bool)

(assert (=> b!467676 m!449287))

(declare-fun m!449289 () Bool)

(assert (=> b!467676 m!449289))

(declare-fun m!449291 () Bool)

(assert (=> b!467676 m!449291))

(declare-fun m!449293 () Bool)

(assert (=> mapNonEmpty!21088 m!449293))

(check-sat (not b_next!11503) (not mapNonEmpty!21088) (not b!467672) tp_is_empty!12931 (not b!467676) b_and!19865 (not b!467677) (not start!41900) (not b!467673))
(check-sat b_and!19865 (not b_next!11503))
