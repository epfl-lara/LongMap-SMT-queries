; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105120 () Bool)

(assert start!105120)

(declare-fun b_free!26857 () Bool)

(declare-fun b_next!26857 () Bool)

(assert (=> start!105120 (= b_free!26857 (not b_next!26857))))

(declare-fun tp!94072 () Bool)

(declare-fun b_and!44643 () Bool)

(assert (=> start!105120 (= tp!94072 b_and!44643)))

(declare-fun b!1252670 () Bool)

(declare-fun res!835392 () Bool)

(declare-fun e!711529 () Bool)

(assert (=> b!1252670 (=> (not res!835392) (not e!711529))))

(declare-datatypes ((array!81103 0))(
  ( (array!81104 (arr!39115 (Array (_ BitVec 32) (_ BitVec 64))) (size!39653 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81103)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81103 (_ BitVec 32)) Bool)

(assert (=> b!1252670 (= res!835392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835391 () Bool)

(assert (=> start!105120 (=> (not res!835391) (not e!711529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105120 (= res!835391 (validMask!0 mask!1466))))

(assert (=> start!105120 e!711529))

(assert (=> start!105120 true))

(assert (=> start!105120 tp!94072))

(declare-fun tp_is_empty!31759 () Bool)

(assert (=> start!105120 tp_is_empty!31759))

(declare-fun array_inv!29951 (array!81103) Bool)

(assert (=> start!105120 (array_inv!29951 _keys!1118)))

(declare-datatypes ((V!47711 0))(
  ( (V!47712 (val!15942 Int)) )
))
(declare-datatypes ((ValueCell!15116 0))(
  ( (ValueCellFull!15116 (v!18639 V!47711)) (EmptyCell!15116) )
))
(declare-datatypes ((array!81105 0))(
  ( (array!81106 (arr!39116 (Array (_ BitVec 32) ValueCell!15116)) (size!39654 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81105)

(declare-fun e!711530 () Bool)

(declare-fun array_inv!29952 (array!81105) Bool)

(assert (=> start!105120 (and (array_inv!29952 _values!914) e!711530)))

(declare-fun b!1252671 () Bool)

(declare-fun e!711528 () Bool)

(assert (=> b!1252671 (= e!711529 (not e!711528))))

(declare-fun res!835389 () Bool)

(assert (=> b!1252671 (=> res!835389 e!711528)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252671 (= res!835389 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20656 0))(
  ( (tuple2!20657 (_1!10339 (_ BitVec 64)) (_2!10339 V!47711)) )
))
(declare-datatypes ((List!27870 0))(
  ( (Nil!27867) (Cons!27866 (h!29075 tuple2!20656) (t!41340 List!27870)) )
))
(declare-datatypes ((ListLongMap!18529 0))(
  ( (ListLongMap!18530 (toList!9280 List!27870)) )
))
(declare-fun lt!565308 () ListLongMap!18529)

(declare-fun lt!565310 () ListLongMap!18529)

(assert (=> b!1252671 (= lt!565308 lt!565310)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47711)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47711)

(declare-datatypes ((Unit!41524 0))(
  ( (Unit!41525) )
))
(declare-fun lt!565309 () Unit!41524)

(declare-fun minValueBefore!43 () V!47711)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1005 (array!81103 array!81105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 V!47711 V!47711 (_ BitVec 32) Int) Unit!41524)

(assert (=> b!1252671 (= lt!565309 (lemmaNoChangeToArrayThenSameMapNoExtras!1005 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5683 (array!81103 array!81105 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1252671 (= lt!565310 (getCurrentListMapNoExtraKeys!5683 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252671 (= lt!565308 (getCurrentListMapNoExtraKeys!5683 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252672 () Bool)

(declare-fun res!835390 () Bool)

(assert (=> b!1252672 (=> (not res!835390) (not e!711529))))

(assert (=> b!1252672 (= res!835390 (and (= (size!39654 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39653 _keys!1118) (size!39654 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49411 () Bool)

(declare-fun mapRes!49411 () Bool)

(declare-fun tp!94073 () Bool)

(declare-fun e!711532 () Bool)

(assert (=> mapNonEmpty!49411 (= mapRes!49411 (and tp!94073 e!711532))))

(declare-fun mapKey!49411 () (_ BitVec 32))

(declare-fun mapRest!49411 () (Array (_ BitVec 32) ValueCell!15116))

(declare-fun mapValue!49411 () ValueCell!15116)

(assert (=> mapNonEmpty!49411 (= (arr!39116 _values!914) (store mapRest!49411 mapKey!49411 mapValue!49411))))

(declare-fun b!1252673 () Bool)

(assert (=> b!1252673 (= e!711532 tp_is_empty!31759)))

(declare-fun mapIsEmpty!49411 () Bool)

(assert (=> mapIsEmpty!49411 mapRes!49411))

(declare-fun b!1252674 () Bool)

(assert (=> b!1252674 (= e!711528 true)))

(declare-fun lt!565311 () ListLongMap!18529)

(declare-fun getCurrentListMap!4419 (array!81103 array!81105 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1252674 (= lt!565311 (getCurrentListMap!4419 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252675 () Bool)

(declare-fun res!835388 () Bool)

(assert (=> b!1252675 (=> (not res!835388) (not e!711529))))

(declare-datatypes ((List!27871 0))(
  ( (Nil!27868) (Cons!27867 (h!29076 (_ BitVec 64)) (t!41341 List!27871)) )
))
(declare-fun arrayNoDuplicates!0 (array!81103 (_ BitVec 32) List!27871) Bool)

(assert (=> b!1252675 (= res!835388 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27868))))

(declare-fun b!1252676 () Bool)

(declare-fun e!711531 () Bool)

(assert (=> b!1252676 (= e!711531 tp_is_empty!31759)))

(declare-fun b!1252677 () Bool)

(assert (=> b!1252677 (= e!711530 (and e!711531 mapRes!49411))))

(declare-fun condMapEmpty!49411 () Bool)

(declare-fun mapDefault!49411 () ValueCell!15116)

(assert (=> b!1252677 (= condMapEmpty!49411 (= (arr!39116 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15116)) mapDefault!49411)))))

(assert (= (and start!105120 res!835391) b!1252672))

(assert (= (and b!1252672 res!835390) b!1252670))

(assert (= (and b!1252670 res!835392) b!1252675))

(assert (= (and b!1252675 res!835388) b!1252671))

(assert (= (and b!1252671 (not res!835389)) b!1252674))

(assert (= (and b!1252677 condMapEmpty!49411) mapIsEmpty!49411))

(assert (= (and b!1252677 (not condMapEmpty!49411)) mapNonEmpty!49411))

(get-info :version)

(assert (= (and mapNonEmpty!49411 ((_ is ValueCellFull!15116) mapValue!49411)) b!1252673))

(assert (= (and b!1252677 ((_ is ValueCellFull!15116) mapDefault!49411)) b!1252676))

(assert (= start!105120 b!1252677))

(declare-fun m!1152805 () Bool)

(assert (=> start!105120 m!1152805))

(declare-fun m!1152807 () Bool)

(assert (=> start!105120 m!1152807))

(declare-fun m!1152809 () Bool)

(assert (=> start!105120 m!1152809))

(declare-fun m!1152811 () Bool)

(assert (=> b!1252670 m!1152811))

(declare-fun m!1152813 () Bool)

(assert (=> b!1252671 m!1152813))

(declare-fun m!1152815 () Bool)

(assert (=> b!1252671 m!1152815))

(declare-fun m!1152817 () Bool)

(assert (=> b!1252671 m!1152817))

(declare-fun m!1152819 () Bool)

(assert (=> b!1252675 m!1152819))

(declare-fun m!1152821 () Bool)

(assert (=> b!1252674 m!1152821))

(declare-fun m!1152823 () Bool)

(assert (=> mapNonEmpty!49411 m!1152823))

(check-sat (not b!1252671) (not b!1252674) tp_is_empty!31759 (not mapNonEmpty!49411) b_and!44643 (not b_next!26857) (not b!1252670) (not b!1252675) (not start!105120))
(check-sat b_and!44643 (not b_next!26857))
