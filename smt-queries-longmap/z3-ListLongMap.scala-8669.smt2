; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105386 () Bool)

(assert start!105386)

(declare-fun b_free!27049 () Bool)

(declare-fun b_next!27049 () Bool)

(assert (=> start!105386 (= b_free!27049 (not b_next!27049))))

(declare-fun tp!94660 () Bool)

(declare-fun b_and!44877 () Bool)

(assert (=> start!105386 (= tp!94660 b_and!44877)))

(declare-fun b!1255503 () Bool)

(declare-fun res!837010 () Bool)

(declare-fun e!713571 () Bool)

(assert (=> b!1255503 (=> (not res!837010) (not e!713571))))

(declare-datatypes ((array!81473 0))(
  ( (array!81474 (arr!39296 (Array (_ BitVec 32) (_ BitVec 64))) (size!39834 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81473)

(declare-datatypes ((List!28001 0))(
  ( (Nil!27998) (Cons!27997 (h!29206 (_ BitVec 64)) (t!41479 List!28001)) )
))
(declare-fun arrayNoDuplicates!0 (array!81473 (_ BitVec 32) List!28001) Bool)

(assert (=> b!1255503 (= res!837010 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27998))))

(declare-fun b!1255504 () Bool)

(declare-fun e!713575 () Bool)

(assert (=> b!1255504 (= e!713575 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47967 0))(
  ( (V!47968 (val!16038 Int)) )
))
(declare-fun zeroValue!871 () V!47967)

(declare-fun lt!567467 () Bool)

(declare-datatypes ((ValueCell!15212 0))(
  ( (ValueCellFull!15212 (v!18737 V!47967)) (EmptyCell!15212) )
))
(declare-datatypes ((array!81475 0))(
  ( (array!81476 (arr!39297 (Array (_ BitVec 32) ValueCell!15212)) (size!39835 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81475)

(declare-fun minValueBefore!43 () V!47967)

(declare-datatypes ((tuple2!20790 0))(
  ( (tuple2!20791 (_1!10406 (_ BitVec 64)) (_2!10406 V!47967)) )
))
(declare-datatypes ((List!28002 0))(
  ( (Nil!27999) (Cons!27998 (h!29207 tuple2!20790) (t!41480 List!28002)) )
))
(declare-datatypes ((ListLongMap!18663 0))(
  ( (ListLongMap!18664 (toList!9347 List!28002)) )
))
(declare-fun contains!7501 (ListLongMap!18663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4461 (array!81473 array!81475 (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 (_ BitVec 32) Int) ListLongMap!18663)

(assert (=> b!1255504 (= lt!567467 (contains!7501 (getCurrentListMap!4461 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255505 () Bool)

(declare-fun e!713572 () Bool)

(declare-fun e!713574 () Bool)

(declare-fun mapRes!49711 () Bool)

(assert (=> b!1255505 (= e!713572 (and e!713574 mapRes!49711))))

(declare-fun condMapEmpty!49711 () Bool)

(declare-fun mapDefault!49711 () ValueCell!15212)

(assert (=> b!1255505 (= condMapEmpty!49711 (= (arr!39297 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15212)) mapDefault!49711)))))

(declare-fun b!1255506 () Bool)

(declare-fun res!837009 () Bool)

(assert (=> b!1255506 (=> (not res!837009) (not e!713571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81473 (_ BitVec 32)) Bool)

(assert (=> b!1255506 (= res!837009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49711 () Bool)

(assert (=> mapIsEmpty!49711 mapRes!49711))

(declare-fun res!837013 () Bool)

(assert (=> start!105386 (=> (not res!837013) (not e!713571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105386 (= res!837013 (validMask!0 mask!1466))))

(assert (=> start!105386 e!713571))

(assert (=> start!105386 true))

(assert (=> start!105386 tp!94660))

(declare-fun tp_is_empty!31951 () Bool)

(assert (=> start!105386 tp_is_empty!31951))

(declare-fun array_inv!30083 (array!81473) Bool)

(assert (=> start!105386 (array_inv!30083 _keys!1118)))

(declare-fun array_inv!30084 (array!81475) Bool)

(assert (=> start!105386 (and (array_inv!30084 _values!914) e!713572)))

(declare-fun b!1255507 () Bool)

(declare-fun e!713576 () Bool)

(assert (=> b!1255507 (= e!713576 tp_is_empty!31951)))

(declare-fun mapNonEmpty!49711 () Bool)

(declare-fun tp!94661 () Bool)

(assert (=> mapNonEmpty!49711 (= mapRes!49711 (and tp!94661 e!713576))))

(declare-fun mapKey!49711 () (_ BitVec 32))

(declare-fun mapRest!49711 () (Array (_ BitVec 32) ValueCell!15212))

(declare-fun mapValue!49711 () ValueCell!15212)

(assert (=> mapNonEmpty!49711 (= (arr!39297 _values!914) (store mapRest!49711 mapKey!49711 mapValue!49711))))

(declare-fun b!1255508 () Bool)

(assert (=> b!1255508 (= e!713571 (not e!713575))))

(declare-fun res!837012 () Bool)

(assert (=> b!1255508 (=> res!837012 e!713575)))

(assert (=> b!1255508 (= res!837012 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567468 () ListLongMap!18663)

(declare-fun lt!567470 () ListLongMap!18663)

(assert (=> b!1255508 (= lt!567468 lt!567470)))

(declare-fun minValueAfter!43 () V!47967)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41661 0))(
  ( (Unit!41662) )
))
(declare-fun lt!567469 () Unit!41661)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1064 (array!81473 array!81475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 V!47967 V!47967 (_ BitVec 32) Int) Unit!41661)

(assert (=> b!1255508 (= lt!567469 (lemmaNoChangeToArrayThenSameMapNoExtras!1064 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5742 (array!81473 array!81475 (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 (_ BitVec 32) Int) ListLongMap!18663)

(assert (=> b!1255508 (= lt!567470 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255508 (= lt!567468 (getCurrentListMapNoExtraKeys!5742 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255509 () Bool)

(assert (=> b!1255509 (= e!713574 tp_is_empty!31951)))

(declare-fun b!1255510 () Bool)

(declare-fun res!837011 () Bool)

(assert (=> b!1255510 (=> (not res!837011) (not e!713571))))

(assert (=> b!1255510 (= res!837011 (and (= (size!39835 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39834 _keys!1118) (size!39835 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105386 res!837013) b!1255510))

(assert (= (and b!1255510 res!837011) b!1255506))

(assert (= (and b!1255506 res!837009) b!1255503))

(assert (= (and b!1255503 res!837010) b!1255508))

(assert (= (and b!1255508 (not res!837012)) b!1255504))

(assert (= (and b!1255505 condMapEmpty!49711) mapIsEmpty!49711))

(assert (= (and b!1255505 (not condMapEmpty!49711)) mapNonEmpty!49711))

(get-info :version)

(assert (= (and mapNonEmpty!49711 ((_ is ValueCellFull!15212) mapValue!49711)) b!1255507))

(assert (= (and b!1255505 ((_ is ValueCellFull!15212) mapDefault!49711)) b!1255509))

(assert (= start!105386 b!1255505))

(declare-fun m!1155775 () Bool)

(assert (=> start!105386 m!1155775))

(declare-fun m!1155777 () Bool)

(assert (=> start!105386 m!1155777))

(declare-fun m!1155779 () Bool)

(assert (=> start!105386 m!1155779))

(declare-fun m!1155781 () Bool)

(assert (=> b!1255506 m!1155781))

(declare-fun m!1155783 () Bool)

(assert (=> b!1255504 m!1155783))

(assert (=> b!1255504 m!1155783))

(declare-fun m!1155785 () Bool)

(assert (=> b!1255504 m!1155785))

(declare-fun m!1155787 () Bool)

(assert (=> b!1255503 m!1155787))

(declare-fun m!1155789 () Bool)

(assert (=> b!1255508 m!1155789))

(declare-fun m!1155791 () Bool)

(assert (=> b!1255508 m!1155791))

(declare-fun m!1155793 () Bool)

(assert (=> b!1255508 m!1155793))

(declare-fun m!1155795 () Bool)

(assert (=> mapNonEmpty!49711 m!1155795))

(check-sat (not b!1255503) (not b!1255508) (not start!105386) (not mapNonEmpty!49711) tp_is_empty!31951 (not b!1255504) b_and!44877 (not b!1255506) (not b_next!27049))
(check-sat b_and!44877 (not b_next!27049))
