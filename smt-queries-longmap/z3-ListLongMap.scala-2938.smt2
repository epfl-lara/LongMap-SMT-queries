; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41820 () Bool)

(assert start!41820)

(declare-fun b_free!11437 () Bool)

(declare-fun b_next!11437 () Bool)

(assert (=> start!41820 (= b_free!11437 (not b_next!11437))))

(declare-fun tp!40320 () Bool)

(declare-fun b_and!19827 () Bool)

(assert (=> start!41820 (= tp!40320 b_and!19827)))

(declare-fun mapIsEmpty!20986 () Bool)

(declare-fun mapRes!20986 () Bool)

(assert (=> mapIsEmpty!20986 mapRes!20986))

(declare-fun b!467074 () Bool)

(declare-fun res!279196 () Bool)

(declare-fun e!273177 () Bool)

(assert (=> b!467074 (=> (not res!279196) (not e!273177))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29502 0))(
  ( (array!29503 (arr!14178 (Array (_ BitVec 32) (_ BitVec 64))) (size!14530 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29502)

(declare-datatypes ((V!18259 0))(
  ( (V!18260 (val!6477 Int)) )
))
(declare-datatypes ((ValueCell!6089 0))(
  ( (ValueCellFull!6089 (v!8767 V!18259)) (EmptyCell!6089) )
))
(declare-datatypes ((array!29504 0))(
  ( (array!29505 (arr!14179 (Array (_ BitVec 32) ValueCell!6089)) (size!14531 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29504)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467074 (= res!279196 (and (= (size!14531 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14530 _keys!1025) (size!14531 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467075 () Bool)

(declare-fun e!273176 () Bool)

(declare-fun e!273180 () Bool)

(assert (=> b!467075 (= e!273176 (and e!273180 mapRes!20986))))

(declare-fun condMapEmpty!20986 () Bool)

(declare-fun mapDefault!20986 () ValueCell!6089)

(assert (=> b!467075 (= condMapEmpty!20986 (= (arr!14179 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6089)) mapDefault!20986)))))

(declare-fun b!467076 () Bool)

(assert (=> b!467076 (= e!273177 (not true))))

(declare-datatypes ((tuple2!8434 0))(
  ( (tuple2!8435 (_1!4228 (_ BitVec 64)) (_2!4228 V!18259)) )
))
(declare-datatypes ((List!8514 0))(
  ( (Nil!8511) (Cons!8510 (h!9366 tuple2!8434) (t!14460 List!8514)) )
))
(declare-datatypes ((ListLongMap!7349 0))(
  ( (ListLongMap!7350 (toList!3690 List!8514)) )
))
(declare-fun lt!211230 () ListLongMap!7349)

(declare-fun lt!211232 () ListLongMap!7349)

(assert (=> b!467076 (= lt!211230 lt!211232)))

(declare-fun minValueBefore!38 () V!18259)

(declare-datatypes ((Unit!13592 0))(
  ( (Unit!13593) )
))
(declare-fun lt!211231 () Unit!13592)

(declare-fun zeroValue!794 () V!18259)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18259)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!72 (array!29502 array!29504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 V!18259 V!18259 (_ BitVec 32) Int) Unit!13592)

(assert (=> b!467076 (= lt!211231 (lemmaNoChangeToArrayThenSameMapNoExtras!72 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1912 (array!29502 array!29504 (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 (_ BitVec 32) Int) ListLongMap!7349)

(assert (=> b!467076 (= lt!211232 (getCurrentListMapNoExtraKeys!1912 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467076 (= lt!211230 (getCurrentListMapNoExtraKeys!1912 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467077 () Bool)

(declare-fun res!279195 () Bool)

(assert (=> b!467077 (=> (not res!279195) (not e!273177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29502 (_ BitVec 32)) Bool)

(assert (=> b!467077 (= res!279195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467078 () Bool)

(declare-fun tp_is_empty!12865 () Bool)

(assert (=> b!467078 (= e!273180 tp_is_empty!12865)))

(declare-fun res!279197 () Bool)

(assert (=> start!41820 (=> (not res!279197) (not e!273177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41820 (= res!279197 (validMask!0 mask!1365))))

(assert (=> start!41820 e!273177))

(assert (=> start!41820 tp_is_empty!12865))

(assert (=> start!41820 tp!40320))

(assert (=> start!41820 true))

(declare-fun array_inv!10320 (array!29502) Bool)

(assert (=> start!41820 (array_inv!10320 _keys!1025)))

(declare-fun array_inv!10321 (array!29504) Bool)

(assert (=> start!41820 (and (array_inv!10321 _values!833) e!273176)))

(declare-fun b!467079 () Bool)

(declare-fun res!279194 () Bool)

(assert (=> b!467079 (=> (not res!279194) (not e!273177))))

(declare-datatypes ((List!8515 0))(
  ( (Nil!8512) (Cons!8511 (h!9367 (_ BitVec 64)) (t!14461 List!8515)) )
))
(declare-fun arrayNoDuplicates!0 (array!29502 (_ BitVec 32) List!8515) Bool)

(assert (=> b!467079 (= res!279194 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8512))))

(declare-fun b!467080 () Bool)

(declare-fun e!273179 () Bool)

(assert (=> b!467080 (= e!273179 tp_is_empty!12865)))

(declare-fun mapNonEmpty!20986 () Bool)

(declare-fun tp!40321 () Bool)

(assert (=> mapNonEmpty!20986 (= mapRes!20986 (and tp!40321 e!273179))))

(declare-fun mapValue!20986 () ValueCell!6089)

(declare-fun mapRest!20986 () (Array (_ BitVec 32) ValueCell!6089))

(declare-fun mapKey!20986 () (_ BitVec 32))

(assert (=> mapNonEmpty!20986 (= (arr!14179 _values!833) (store mapRest!20986 mapKey!20986 mapValue!20986))))

(assert (= (and start!41820 res!279197) b!467074))

(assert (= (and b!467074 res!279196) b!467077))

(assert (= (and b!467077 res!279195) b!467079))

(assert (= (and b!467079 res!279194) b!467076))

(assert (= (and b!467075 condMapEmpty!20986) mapIsEmpty!20986))

(assert (= (and b!467075 (not condMapEmpty!20986)) mapNonEmpty!20986))

(get-info :version)

(assert (= (and mapNonEmpty!20986 ((_ is ValueCellFull!6089) mapValue!20986)) b!467080))

(assert (= (and b!467075 ((_ is ValueCellFull!6089) mapDefault!20986)) b!467078))

(assert (= start!41820 b!467075))

(declare-fun m!449513 () Bool)

(assert (=> b!467077 m!449513))

(declare-fun m!449515 () Bool)

(assert (=> start!41820 m!449515))

(declare-fun m!449517 () Bool)

(assert (=> start!41820 m!449517))

(declare-fun m!449519 () Bool)

(assert (=> start!41820 m!449519))

(declare-fun m!449521 () Bool)

(assert (=> mapNonEmpty!20986 m!449521))

(declare-fun m!449523 () Bool)

(assert (=> b!467079 m!449523))

(declare-fun m!449525 () Bool)

(assert (=> b!467076 m!449525))

(declare-fun m!449527 () Bool)

(assert (=> b!467076 m!449527))

(declare-fun m!449529 () Bool)

(assert (=> b!467076 m!449529))

(check-sat b_and!19827 (not start!41820) (not b_next!11437) (not b!467077) tp_is_empty!12865 (not b!467076) (not b!467079) (not mapNonEmpty!20986))
(check-sat b_and!19827 (not b_next!11437))
