; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105592 () Bool)

(assert start!105592)

(declare-fun b_free!27207 () Bool)

(declare-fun b_next!27207 () Bool)

(assert (=> start!105592 (= b_free!27207 (not b_next!27207))))

(declare-fun tp!95141 () Bool)

(declare-fun b_and!45073 () Bool)

(assert (=> start!105592 (= tp!95141 b_and!45073)))

(declare-fun b!1257889 () Bool)

(declare-fun res!838451 () Bool)

(declare-fun e!715334 () Bool)

(assert (=> b!1257889 (=> (not res!838451) (not e!715334))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81846 0))(
  ( (array!81847 (arr!39480 (Array (_ BitVec 32) (_ BitVec 64))) (size!40016 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81846)

(declare-datatypes ((V!48177 0))(
  ( (V!48178 (val!16117 Int)) )
))
(declare-datatypes ((ValueCell!15291 0))(
  ( (ValueCellFull!15291 (v!18819 V!48177)) (EmptyCell!15291) )
))
(declare-datatypes ((array!81848 0))(
  ( (array!81849 (arr!39481 (Array (_ BitVec 32) ValueCell!15291)) (size!40017 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81848)

(assert (=> b!1257889 (= res!838451 (and (= (size!40017 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40016 _keys!1118) (size!40017 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257890 () Bool)

(declare-fun res!838452 () Bool)

(assert (=> b!1257890 (=> (not res!838452) (not e!715334))))

(declare-datatypes ((List!28036 0))(
  ( (Nil!28033) (Cons!28032 (h!29241 (_ BitVec 64)) (t!41527 List!28036)) )
))
(declare-fun arrayNoDuplicates!0 (array!81846 (_ BitVec 32) List!28036) Bool)

(assert (=> b!1257890 (= res!838452 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28033))))

(declare-fun res!838450 () Bool)

(assert (=> start!105592 (=> (not res!838450) (not e!715334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105592 (= res!838450 (validMask!0 mask!1466))))

(assert (=> start!105592 e!715334))

(assert (=> start!105592 true))

(assert (=> start!105592 tp!95141))

(declare-fun tp_is_empty!32109 () Bool)

(assert (=> start!105592 tp_is_empty!32109))

(declare-fun array_inv!30071 (array!81846) Bool)

(assert (=> start!105592 (array_inv!30071 _keys!1118)))

(declare-fun e!715333 () Bool)

(declare-fun array_inv!30072 (array!81848) Bool)

(assert (=> start!105592 (and (array_inv!30072 _values!914) e!715333)))

(declare-fun b!1257891 () Bool)

(declare-fun e!715336 () Bool)

(assert (=> b!1257891 (= e!715336 tp_is_empty!32109)))

(declare-fun b!1257892 () Bool)

(declare-fun res!838453 () Bool)

(assert (=> b!1257892 (=> (not res!838453) (not e!715334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81846 (_ BitVec 32)) Bool)

(assert (=> b!1257892 (= res!838453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257893 () Bool)

(declare-fun e!715335 () Bool)

(assert (=> b!1257893 (= e!715335 tp_is_empty!32109)))

(declare-fun mapIsEmpty!49954 () Bool)

(declare-fun mapRes!49954 () Bool)

(assert (=> mapIsEmpty!49954 mapRes!49954))

(declare-fun b!1257894 () Bool)

(assert (=> b!1257894 (= e!715334 (not true))))

(declare-datatypes ((tuple2!20822 0))(
  ( (tuple2!20823 (_1!10422 (_ BitVec 64)) (_2!10422 V!48177)) )
))
(declare-datatypes ((List!28037 0))(
  ( (Nil!28034) (Cons!28033 (h!29242 tuple2!20822) (t!41528 List!28037)) )
))
(declare-datatypes ((ListLongMap!18695 0))(
  ( (ListLongMap!18696 (toList!9363 List!28037)) )
))
(declare-fun lt!568936 () ListLongMap!18695)

(declare-fun lt!568938 () ListLongMap!18695)

(assert (=> b!1257894 (= lt!568936 lt!568938)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48177)

(declare-fun zeroValue!871 () V!48177)

(declare-datatypes ((Unit!41910 0))(
  ( (Unit!41911) )
))
(declare-fun lt!568937 () Unit!41910)

(declare-fun minValueBefore!43 () V!48177)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1105 (array!81846 array!81848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48177 V!48177 V!48177 V!48177 (_ BitVec 32) Int) Unit!41910)

(assert (=> b!1257894 (= lt!568937 (lemmaNoChangeToArrayThenSameMapNoExtras!1105 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5741 (array!81846 array!81848 (_ BitVec 32) (_ BitVec 32) V!48177 V!48177 (_ BitVec 32) Int) ListLongMap!18695)

(assert (=> b!1257894 (= lt!568938 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257894 (= lt!568936 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49954 () Bool)

(declare-fun tp!95140 () Bool)

(assert (=> mapNonEmpty!49954 (= mapRes!49954 (and tp!95140 e!715336))))

(declare-fun mapValue!49954 () ValueCell!15291)

(declare-fun mapKey!49954 () (_ BitVec 32))

(declare-fun mapRest!49954 () (Array (_ BitVec 32) ValueCell!15291))

(assert (=> mapNonEmpty!49954 (= (arr!39481 _values!914) (store mapRest!49954 mapKey!49954 mapValue!49954))))

(declare-fun b!1257895 () Bool)

(assert (=> b!1257895 (= e!715333 (and e!715335 mapRes!49954))))

(declare-fun condMapEmpty!49954 () Bool)

(declare-fun mapDefault!49954 () ValueCell!15291)

(assert (=> b!1257895 (= condMapEmpty!49954 (= (arr!39481 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15291)) mapDefault!49954)))))

(assert (= (and start!105592 res!838450) b!1257889))

(assert (= (and b!1257889 res!838451) b!1257892))

(assert (= (and b!1257892 res!838453) b!1257890))

(assert (= (and b!1257890 res!838452) b!1257894))

(assert (= (and b!1257895 condMapEmpty!49954) mapIsEmpty!49954))

(assert (= (and b!1257895 (not condMapEmpty!49954)) mapNonEmpty!49954))

(get-info :version)

(assert (= (and mapNonEmpty!49954 ((_ is ValueCellFull!15291) mapValue!49954)) b!1257891))

(assert (= (and b!1257895 ((_ is ValueCellFull!15291) mapDefault!49954)) b!1257893))

(assert (= start!105592 b!1257895))

(declare-fun m!1158413 () Bool)

(assert (=> b!1257892 m!1158413))

(declare-fun m!1158415 () Bool)

(assert (=> start!105592 m!1158415))

(declare-fun m!1158417 () Bool)

(assert (=> start!105592 m!1158417))

(declare-fun m!1158419 () Bool)

(assert (=> start!105592 m!1158419))

(declare-fun m!1158421 () Bool)

(assert (=> b!1257894 m!1158421))

(declare-fun m!1158423 () Bool)

(assert (=> b!1257894 m!1158423))

(declare-fun m!1158425 () Bool)

(assert (=> b!1257894 m!1158425))

(declare-fun m!1158427 () Bool)

(assert (=> mapNonEmpty!49954 m!1158427))

(declare-fun m!1158429 () Bool)

(assert (=> b!1257890 m!1158429))

(check-sat b_and!45073 (not b!1257890) (not start!105592) (not b!1257892) tp_is_empty!32109 (not b!1257894) (not b_next!27207) (not mapNonEmpty!49954))
(check-sat b_and!45073 (not b_next!27207))
