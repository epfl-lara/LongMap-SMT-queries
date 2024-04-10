; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105870 () Bool)

(assert start!105870)

(declare-fun b_free!27411 () Bool)

(declare-fun b_next!27411 () Bool)

(assert (=> start!105870 (= b_free!27411 (not b_next!27411))))

(declare-fun tp!95764 () Bool)

(declare-fun b_and!45319 () Bool)

(assert (=> start!105870 (= tp!95764 b_and!45319)))

(declare-fun b!1261063 () Bool)

(declare-fun e!717676 () Bool)

(declare-fun e!717679 () Bool)

(declare-fun mapRes!50272 () Bool)

(assert (=> b!1261063 (= e!717676 (and e!717679 mapRes!50272))))

(declare-fun condMapEmpty!50272 () Bool)

(declare-datatypes ((V!48449 0))(
  ( (V!48450 (val!16219 Int)) )
))
(declare-datatypes ((ValueCell!15393 0))(
  ( (ValueCellFull!15393 (v!18923 V!48449)) (EmptyCell!15393) )
))
(declare-datatypes ((array!82240 0))(
  ( (array!82241 (arr!39673 (Array (_ BitVec 32) ValueCell!15393)) (size!40209 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82240)

(declare-fun mapDefault!50272 () ValueCell!15393)

(assert (=> b!1261063 (= condMapEmpty!50272 (= (arr!39673 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15393)) mapDefault!50272)))))

(declare-fun b!1261064 () Bool)

(declare-fun tp_is_empty!32313 () Bool)

(assert (=> b!1261064 (= e!717679 tp_is_empty!32313)))

(declare-fun b!1261065 () Bool)

(declare-fun e!717680 () Bool)

(assert (=> b!1261065 (= e!717680 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20988 0))(
  ( (tuple2!20989 (_1!10505 (_ BitVec 64)) (_2!10505 V!48449)) )
))
(declare-datatypes ((List!28185 0))(
  ( (Nil!28182) (Cons!28181 (h!29390 tuple2!20988) (t!41684 List!28185)) )
))
(declare-datatypes ((ListLongMap!18861 0))(
  ( (ListLongMap!18862 (toList!9446 List!28185)) )
))
(declare-fun lt!571521 () ListLongMap!18861)

(declare-fun minValueAfter!43 () V!48449)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48449)

(declare-datatypes ((array!82242 0))(
  ( (array!82243 (arr!39674 (Array (_ BitVec 32) (_ BitVec 64))) (size!40210 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82242)

(declare-fun getCurrentListMapNoExtraKeys!5814 (array!82242 array!82240 (_ BitVec 32) (_ BitVec 32) V!48449 V!48449 (_ BitVec 32) Int) ListLongMap!18861)

(assert (=> b!1261065 (= lt!571521 (getCurrentListMapNoExtraKeys!5814 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571520 () ListLongMap!18861)

(declare-fun minValueBefore!43 () V!48449)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261065 (= lt!571520 (getCurrentListMapNoExtraKeys!5814 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261066 () Bool)

(declare-fun res!840361 () Bool)

(assert (=> b!1261066 (=> (not res!840361) (not e!717680))))

(declare-datatypes ((List!28186 0))(
  ( (Nil!28183) (Cons!28182 (h!29391 (_ BitVec 64)) (t!41685 List!28186)) )
))
(declare-fun arrayNoDuplicates!0 (array!82242 (_ BitVec 32) List!28186) Bool)

(assert (=> b!1261066 (= res!840361 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28183))))

(declare-fun mapNonEmpty!50272 () Bool)

(declare-fun tp!95765 () Bool)

(declare-fun e!717677 () Bool)

(assert (=> mapNonEmpty!50272 (= mapRes!50272 (and tp!95765 e!717677))))

(declare-fun mapValue!50272 () ValueCell!15393)

(declare-fun mapKey!50272 () (_ BitVec 32))

(declare-fun mapRest!50272 () (Array (_ BitVec 32) ValueCell!15393))

(assert (=> mapNonEmpty!50272 (= (arr!39673 _values!914) (store mapRest!50272 mapKey!50272 mapValue!50272))))

(declare-fun res!840360 () Bool)

(assert (=> start!105870 (=> (not res!840360) (not e!717680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105870 (= res!840360 (validMask!0 mask!1466))))

(assert (=> start!105870 e!717680))

(assert (=> start!105870 true))

(assert (=> start!105870 tp!95764))

(assert (=> start!105870 tp_is_empty!32313))

(declare-fun array_inv!30203 (array!82242) Bool)

(assert (=> start!105870 (array_inv!30203 _keys!1118)))

(declare-fun array_inv!30204 (array!82240) Bool)

(assert (=> start!105870 (and (array_inv!30204 _values!914) e!717676)))

(declare-fun b!1261067 () Bool)

(declare-fun res!840358 () Bool)

(assert (=> b!1261067 (=> (not res!840358) (not e!717680))))

(assert (=> b!1261067 (= res!840358 (and (= (size!40209 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40210 _keys!1118) (size!40209 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261068 () Bool)

(assert (=> b!1261068 (= e!717677 tp_is_empty!32313)))

(declare-fun mapIsEmpty!50272 () Bool)

(assert (=> mapIsEmpty!50272 mapRes!50272))

(declare-fun b!1261069 () Bool)

(declare-fun res!840359 () Bool)

(assert (=> b!1261069 (=> (not res!840359) (not e!717680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82242 (_ BitVec 32)) Bool)

(assert (=> b!1261069 (= res!840359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105870 res!840360) b!1261067))

(assert (= (and b!1261067 res!840358) b!1261069))

(assert (= (and b!1261069 res!840359) b!1261066))

(assert (= (and b!1261066 res!840361) b!1261065))

(assert (= (and b!1261063 condMapEmpty!50272) mapIsEmpty!50272))

(assert (= (and b!1261063 (not condMapEmpty!50272)) mapNonEmpty!50272))

(get-info :version)

(assert (= (and mapNonEmpty!50272 ((_ is ValueCellFull!15393) mapValue!50272)) b!1261068))

(assert (= (and b!1261063 ((_ is ValueCellFull!15393) mapDefault!50272)) b!1261064))

(assert (= start!105870 b!1261063))

(declare-fun m!1161777 () Bool)

(assert (=> b!1261066 m!1161777))

(declare-fun m!1161779 () Bool)

(assert (=> b!1261065 m!1161779))

(declare-fun m!1161781 () Bool)

(assert (=> b!1261065 m!1161781))

(declare-fun m!1161783 () Bool)

(assert (=> mapNonEmpty!50272 m!1161783))

(declare-fun m!1161785 () Bool)

(assert (=> b!1261069 m!1161785))

(declare-fun m!1161787 () Bool)

(assert (=> start!105870 m!1161787))

(declare-fun m!1161789 () Bool)

(assert (=> start!105870 m!1161789))

(declare-fun m!1161791 () Bool)

(assert (=> start!105870 m!1161791))

(check-sat (not b_next!27411) (not b!1261066) b_and!45319 tp_is_empty!32313 (not mapNonEmpty!50272) (not b!1261065) (not start!105870) (not b!1261069))
(check-sat b_and!45319 (not b_next!27411))
