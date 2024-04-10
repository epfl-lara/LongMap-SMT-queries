; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105138 () Bool)

(assert start!105138)

(declare-fun b_free!26871 () Bool)

(declare-fun b_next!26871 () Bool)

(assert (=> start!105138 (= b_free!26871 (not b_next!26871))))

(declare-fun tp!94114 () Bool)

(declare-fun b_and!44675 () Bool)

(assert (=> start!105138 (= tp!94114 b_and!44675)))

(declare-fun b!1252920 () Bool)

(declare-fun res!835537 () Bool)

(declare-fun e!711704 () Bool)

(assert (=> b!1252920 (=> (not res!835537) (not e!711704))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81206 0))(
  ( (array!81207 (arr!39166 (Array (_ BitVec 32) (_ BitVec 64))) (size!39702 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81206)

(declare-datatypes ((V!47729 0))(
  ( (V!47730 (val!15949 Int)) )
))
(declare-datatypes ((ValueCell!15123 0))(
  ( (ValueCellFull!15123 (v!18647 V!47729)) (EmptyCell!15123) )
))
(declare-datatypes ((array!81208 0))(
  ( (array!81209 (arr!39167 (Array (_ BitVec 32) ValueCell!15123)) (size!39703 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81208)

(assert (=> b!1252920 (= res!835537 (and (= (size!39703 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39702 _keys!1118) (size!39703 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252921 () Bool)

(declare-fun e!711700 () Bool)

(declare-fun tp_is_empty!31773 () Bool)

(assert (=> b!1252921 (= e!711700 tp_is_empty!31773)))

(declare-fun mapNonEmpty!49432 () Bool)

(declare-fun mapRes!49432 () Bool)

(declare-fun tp!94115 () Bool)

(assert (=> mapNonEmpty!49432 (= mapRes!49432 (and tp!94115 e!711700))))

(declare-fun mapKey!49432 () (_ BitVec 32))

(declare-fun mapRest!49432 () (Array (_ BitVec 32) ValueCell!15123))

(declare-fun mapValue!49432 () ValueCell!15123)

(assert (=> mapNonEmpty!49432 (= (arr!39167 _values!914) (store mapRest!49432 mapKey!49432 mapValue!49432))))

(declare-fun b!1252922 () Bool)

(declare-fun e!711702 () Bool)

(assert (=> b!1252922 (= e!711702 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47729)

(declare-fun minValueBefore!43 () V!47729)

(declare-datatypes ((tuple2!20578 0))(
  ( (tuple2!20579 (_1!10300 (_ BitVec 64)) (_2!10300 V!47729)) )
))
(declare-datatypes ((List!27809 0))(
  ( (Nil!27806) (Cons!27805 (h!29014 tuple2!20578) (t!41288 List!27809)) )
))
(declare-datatypes ((ListLongMap!18451 0))(
  ( (ListLongMap!18452 (toList!9241 List!27809)) )
))
(declare-fun lt!565571 () ListLongMap!18451)

(declare-fun getCurrentListMap!4487 (array!81206 array!81208 (_ BitVec 32) (_ BitVec 32) V!47729 V!47729 (_ BitVec 32) Int) ListLongMap!18451)

(assert (=> b!1252922 (= lt!565571 (getCurrentListMap!4487 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49432 () Bool)

(assert (=> mapIsEmpty!49432 mapRes!49432))

(declare-fun res!835533 () Bool)

(assert (=> start!105138 (=> (not res!835533) (not e!711704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105138 (= res!835533 (validMask!0 mask!1466))))

(assert (=> start!105138 e!711704))

(assert (=> start!105138 true))

(assert (=> start!105138 tp!94114))

(assert (=> start!105138 tp_is_empty!31773))

(declare-fun array_inv!29867 (array!81206) Bool)

(assert (=> start!105138 (array_inv!29867 _keys!1118)))

(declare-fun e!711699 () Bool)

(declare-fun array_inv!29868 (array!81208) Bool)

(assert (=> start!105138 (and (array_inv!29868 _values!914) e!711699)))

(declare-fun b!1252923 () Bool)

(declare-fun e!711701 () Bool)

(assert (=> b!1252923 (= e!711699 (and e!711701 mapRes!49432))))

(declare-fun condMapEmpty!49432 () Bool)

(declare-fun mapDefault!49432 () ValueCell!15123)

(assert (=> b!1252923 (= condMapEmpty!49432 (= (arr!39167 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15123)) mapDefault!49432)))))

(declare-fun b!1252924 () Bool)

(declare-fun res!835535 () Bool)

(assert (=> b!1252924 (=> (not res!835535) (not e!711704))))

(declare-datatypes ((List!27810 0))(
  ( (Nil!27807) (Cons!27806 (h!29015 (_ BitVec 64)) (t!41289 List!27810)) )
))
(declare-fun arrayNoDuplicates!0 (array!81206 (_ BitVec 32) List!27810) Bool)

(assert (=> b!1252924 (= res!835535 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27807))))

(declare-fun b!1252925 () Bool)

(assert (=> b!1252925 (= e!711701 tp_is_empty!31773)))

(declare-fun b!1252926 () Bool)

(declare-fun res!835534 () Bool)

(assert (=> b!1252926 (=> (not res!835534) (not e!711704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81206 (_ BitVec 32)) Bool)

(assert (=> b!1252926 (= res!835534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252927 () Bool)

(assert (=> b!1252927 (= e!711704 (not e!711702))))

(declare-fun res!835536 () Bool)

(assert (=> b!1252927 (=> res!835536 e!711702)))

(assert (=> b!1252927 (= res!835536 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565574 () ListLongMap!18451)

(declare-fun lt!565572 () ListLongMap!18451)

(assert (=> b!1252927 (= lt!565574 lt!565572)))

(declare-fun minValueAfter!43 () V!47729)

(declare-datatypes ((Unit!41667 0))(
  ( (Unit!41668) )
))
(declare-fun lt!565573 () Unit!41667)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!999 (array!81206 array!81208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47729 V!47729 V!47729 V!47729 (_ BitVec 32) Int) Unit!41667)

(assert (=> b!1252927 (= lt!565573 (lemmaNoChangeToArrayThenSameMapNoExtras!999 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5635 (array!81206 array!81208 (_ BitVec 32) (_ BitVec 32) V!47729 V!47729 (_ BitVec 32) Int) ListLongMap!18451)

(assert (=> b!1252927 (= lt!565572 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252927 (= lt!565574 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105138 res!835533) b!1252920))

(assert (= (and b!1252920 res!835537) b!1252926))

(assert (= (and b!1252926 res!835534) b!1252924))

(assert (= (and b!1252924 res!835535) b!1252927))

(assert (= (and b!1252927 (not res!835536)) b!1252922))

(assert (= (and b!1252923 condMapEmpty!49432) mapIsEmpty!49432))

(assert (= (and b!1252923 (not condMapEmpty!49432)) mapNonEmpty!49432))

(get-info :version)

(assert (= (and mapNonEmpty!49432 ((_ is ValueCellFull!15123) mapValue!49432)) b!1252921))

(assert (= (and b!1252923 ((_ is ValueCellFull!15123) mapDefault!49432)) b!1252925))

(assert (= start!105138 b!1252923))

(declare-fun m!1153465 () Bool)

(assert (=> b!1252924 m!1153465))

(declare-fun m!1153467 () Bool)

(assert (=> mapNonEmpty!49432 m!1153467))

(declare-fun m!1153469 () Bool)

(assert (=> start!105138 m!1153469))

(declare-fun m!1153471 () Bool)

(assert (=> start!105138 m!1153471))

(declare-fun m!1153473 () Bool)

(assert (=> start!105138 m!1153473))

(declare-fun m!1153475 () Bool)

(assert (=> b!1252926 m!1153475))

(declare-fun m!1153477 () Bool)

(assert (=> b!1252927 m!1153477))

(declare-fun m!1153479 () Bool)

(assert (=> b!1252927 m!1153479))

(declare-fun m!1153481 () Bool)

(assert (=> b!1252927 m!1153481))

(declare-fun m!1153483 () Bool)

(assert (=> b!1252922 m!1153483))

(check-sat b_and!44675 (not mapNonEmpty!49432) (not b!1252924) (not b!1252927) tp_is_empty!31773 (not start!105138) (not b!1252922) (not b!1252926) (not b_next!26871))
(check-sat b_and!44675 (not b_next!26871))
