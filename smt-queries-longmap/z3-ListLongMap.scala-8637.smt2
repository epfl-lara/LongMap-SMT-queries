; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105348 () Bool)

(assert start!105348)

(declare-fun b_free!26857 () Bool)

(declare-fun b_next!26857 () Bool)

(assert (=> start!105348 (= b_free!26857 (not b_next!26857))))

(declare-fun tp!94072 () Bool)

(declare-fun b_and!44663 () Bool)

(assert (=> start!105348 (= tp!94072 b_and!44663)))

(declare-fun b!1254057 () Bool)

(declare-fun e!712424 () Bool)

(declare-fun tp_is_empty!31759 () Bool)

(assert (=> b!1254057 (= e!712424 tp_is_empty!31759)))

(declare-fun b!1254058 () Bool)

(declare-fun res!835951 () Bool)

(declare-fun e!712421 () Bool)

(assert (=> b!1254058 (=> (not res!835951) (not e!712421))))

(declare-datatypes ((array!81225 0))(
  ( (array!81226 (arr!39171 (Array (_ BitVec 32) (_ BitVec 64))) (size!39708 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81225)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81225 (_ BitVec 32)) Bool)

(assert (=> b!1254058 (= res!835951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254059 () Bool)

(declare-fun res!835950 () Bool)

(assert (=> b!1254059 (=> (not res!835950) (not e!712421))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47711 0))(
  ( (V!47712 (val!15942 Int)) )
))
(declare-datatypes ((ValueCell!15116 0))(
  ( (ValueCellFull!15116 (v!18636 V!47711)) (EmptyCell!15116) )
))
(declare-datatypes ((array!81227 0))(
  ( (array!81228 (arr!39172 (Array (_ BitVec 32) ValueCell!15116)) (size!39709 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81227)

(assert (=> b!1254059 (= res!835950 (and (= (size!39709 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39708 _keys!1118) (size!39709 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254060 () Bool)

(declare-fun e!712425 () Bool)

(assert (=> b!1254060 (= e!712421 (not e!712425))))

(declare-fun res!835948 () Bool)

(assert (=> b!1254060 (=> res!835948 e!712425)))

(assert (=> b!1254060 (= res!835948 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20588 0))(
  ( (tuple2!20589 (_1!10305 (_ BitVec 64)) (_2!10305 V!47711)) )
))
(declare-datatypes ((List!27829 0))(
  ( (Nil!27826) (Cons!27825 (h!29043 tuple2!20588) (t!41300 List!27829)) )
))
(declare-datatypes ((ListLongMap!18469 0))(
  ( (ListLongMap!18470 (toList!9250 List!27829)) )
))
(declare-fun lt!565972 () ListLongMap!18469)

(declare-fun lt!565974 () ListLongMap!18469)

(assert (=> b!1254060 (= lt!565972 lt!565974)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47711)

(declare-fun zeroValue!871 () V!47711)

(declare-fun minValueBefore!43 () V!47711)

(declare-datatypes ((Unit!41636 0))(
  ( (Unit!41637) )
))
(declare-fun lt!565971 () Unit!41636)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!990 (array!81225 array!81227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 V!47711 V!47711 (_ BitVec 32) Int) Unit!41636)

(assert (=> b!1254060 (= lt!565971 (lemmaNoChangeToArrayThenSameMapNoExtras!990 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5676 (array!81225 array!81227 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18469)

(assert (=> b!1254060 (= lt!565974 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254060 (= lt!565972 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49411 () Bool)

(declare-fun mapRes!49411 () Bool)

(assert (=> mapIsEmpty!49411 mapRes!49411))

(declare-fun b!1254061 () Bool)

(declare-fun e!712420 () Bool)

(assert (=> b!1254061 (= e!712420 (and e!712424 mapRes!49411))))

(declare-fun condMapEmpty!49411 () Bool)

(declare-fun mapDefault!49411 () ValueCell!15116)

(assert (=> b!1254061 (= condMapEmpty!49411 (= (arr!39172 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15116)) mapDefault!49411)))))

(declare-fun b!1254062 () Bool)

(declare-fun e!712422 () Bool)

(assert (=> b!1254062 (= e!712422 tp_is_empty!31759)))

(declare-fun b!1254063 () Bool)

(declare-fun res!835952 () Bool)

(assert (=> b!1254063 (=> (not res!835952) (not e!712421))))

(declare-datatypes ((List!27830 0))(
  ( (Nil!27827) (Cons!27826 (h!29044 (_ BitVec 64)) (t!41301 List!27830)) )
))
(declare-fun arrayNoDuplicates!0 (array!81225 (_ BitVec 32) List!27830) Bool)

(assert (=> b!1254063 (= res!835952 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27827))))

(declare-fun mapNonEmpty!49411 () Bool)

(declare-fun tp!94073 () Bool)

(assert (=> mapNonEmpty!49411 (= mapRes!49411 (and tp!94073 e!712422))))

(declare-fun mapKey!49411 () (_ BitVec 32))

(declare-fun mapRest!49411 () (Array (_ BitVec 32) ValueCell!15116))

(declare-fun mapValue!49411 () ValueCell!15116)

(assert (=> mapNonEmpty!49411 (= (arr!39172 _values!914) (store mapRest!49411 mapKey!49411 mapValue!49411))))

(declare-fun res!835949 () Bool)

(assert (=> start!105348 (=> (not res!835949) (not e!712421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105348 (= res!835949 (validMask!0 mask!1466))))

(assert (=> start!105348 e!712421))

(assert (=> start!105348 true))

(assert (=> start!105348 tp!94072))

(assert (=> start!105348 tp_is_empty!31759))

(declare-fun array_inv!29981 (array!81225) Bool)

(assert (=> start!105348 (array_inv!29981 _keys!1118)))

(declare-fun array_inv!29982 (array!81227) Bool)

(assert (=> start!105348 (and (array_inv!29982 _values!914) e!712420)))

(declare-fun b!1254064 () Bool)

(assert (=> b!1254064 (= e!712425 true)))

(declare-fun lt!565973 () ListLongMap!18469)

(declare-fun getCurrentListMap!4489 (array!81225 array!81227 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18469)

(assert (=> b!1254064 (= lt!565973 (getCurrentListMap!4489 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105348 res!835949) b!1254059))

(assert (= (and b!1254059 res!835950) b!1254058))

(assert (= (and b!1254058 res!835951) b!1254063))

(assert (= (and b!1254063 res!835952) b!1254060))

(assert (= (and b!1254060 (not res!835948)) b!1254064))

(assert (= (and b!1254061 condMapEmpty!49411) mapIsEmpty!49411))

(assert (= (and b!1254061 (not condMapEmpty!49411)) mapNonEmpty!49411))

(get-info :version)

(assert (= (and mapNonEmpty!49411 ((_ is ValueCellFull!15116) mapValue!49411)) b!1254062))

(assert (= (and b!1254061 ((_ is ValueCellFull!15116) mapDefault!49411)) b!1254057))

(assert (= start!105348 b!1254061))

(declare-fun m!1154937 () Bool)

(assert (=> b!1254064 m!1154937))

(declare-fun m!1154939 () Bool)

(assert (=> b!1254060 m!1154939))

(declare-fun m!1154941 () Bool)

(assert (=> b!1254060 m!1154941))

(declare-fun m!1154943 () Bool)

(assert (=> b!1254060 m!1154943))

(declare-fun m!1154945 () Bool)

(assert (=> start!105348 m!1154945))

(declare-fun m!1154947 () Bool)

(assert (=> start!105348 m!1154947))

(declare-fun m!1154949 () Bool)

(assert (=> start!105348 m!1154949))

(declare-fun m!1154951 () Bool)

(assert (=> b!1254058 m!1154951))

(declare-fun m!1154953 () Bool)

(assert (=> mapNonEmpty!49411 m!1154953))

(declare-fun m!1154955 () Bool)

(assert (=> b!1254063 m!1154955))

(check-sat (not mapNonEmpty!49411) (not start!105348) (not b!1254064) (not b!1254063) b_and!44663 (not b_next!26857) (not b!1254060) (not b!1254058) tp_is_empty!31759)
(check-sat b_and!44663 (not b_next!26857))
