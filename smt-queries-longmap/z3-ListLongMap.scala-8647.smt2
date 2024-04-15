; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105196 () Bool)

(assert start!105196)

(declare-fun b_free!26917 () Bool)

(declare-fun b_next!26917 () Bool)

(assert (=> start!105196 (= b_free!26917 (not b_next!26917))))

(declare-fun tp!94256 () Bool)

(declare-fun b_and!44713 () Bool)

(assert (=> start!105196 (= tp!94256 b_and!44713)))

(declare-fun mapNonEmpty!49504 () Bool)

(declare-fun mapRes!49504 () Bool)

(declare-fun tp!94255 () Bool)

(declare-fun e!712173 () Bool)

(assert (=> mapNonEmpty!49504 (= mapRes!49504 (and tp!94255 e!712173))))

(declare-datatypes ((V!47791 0))(
  ( (V!47792 (val!15972 Int)) )
))
(declare-datatypes ((ValueCell!15146 0))(
  ( (ValueCellFull!15146 (v!18669 V!47791)) (EmptyCell!15146) )
))
(declare-fun mapValue!49504 () ValueCell!15146)

(declare-datatypes ((array!81223 0))(
  ( (array!81224 (arr!39174 (Array (_ BitVec 32) ValueCell!15146)) (size!39712 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81223)

(declare-fun mapRest!49504 () (Array (_ BitVec 32) ValueCell!15146))

(declare-fun mapKey!49504 () (_ BitVec 32))

(assert (=> mapNonEmpty!49504 (= (arr!39174 _values!914) (store mapRest!49504 mapKey!49504 mapValue!49504))))

(declare-fun b!1253547 () Bool)

(declare-fun tp_is_empty!31819 () Bool)

(assert (=> b!1253547 (= e!712173 tp_is_empty!31819)))

(declare-fun mapIsEmpty!49504 () Bool)

(assert (=> mapIsEmpty!49504 mapRes!49504))

(declare-fun b!1253548 () Bool)

(declare-fun e!712171 () Bool)

(assert (=> b!1253548 (= e!712171 true)))

(declare-datatypes ((tuple2!20702 0))(
  ( (tuple2!20703 (_1!10362 (_ BitVec 64)) (_2!10362 V!47791)) )
))
(declare-datatypes ((List!27914 0))(
  ( (Nil!27911) (Cons!27910 (h!29119 tuple2!20702) (t!41386 List!27914)) )
))
(declare-datatypes ((ListLongMap!18575 0))(
  ( (ListLongMap!18576 (toList!9303 List!27914)) )
))
(declare-fun lt!565986 () ListLongMap!18575)

(declare-fun lt!565985 () ListLongMap!18575)

(declare-fun -!1998 (ListLongMap!18575 (_ BitVec 64)) ListLongMap!18575)

(assert (=> b!1253548 (= lt!565986 (-!1998 lt!565985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565984 () ListLongMap!18575)

(declare-fun lt!565983 () ListLongMap!18575)

(assert (=> b!1253548 (= (-!1998 lt!565984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565983)))

(declare-datatypes ((Unit!41569 0))(
  ( (Unit!41570) )
))
(declare-fun lt!565987 () Unit!41569)

(declare-fun minValueBefore!43 () V!47791)

(declare-fun addThenRemoveForNewKeyIsSame!287 (ListLongMap!18575 (_ BitVec 64) V!47791) Unit!41569)

(assert (=> b!1253548 (= lt!565987 (addThenRemoveForNewKeyIsSame!287 lt!565983 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565981 () ListLongMap!18575)

(declare-fun lt!565982 () ListLongMap!18575)

(assert (=> b!1253548 (and (= lt!565985 lt!565984) (= lt!565981 lt!565982))))

(declare-fun +!4201 (ListLongMap!18575 tuple2!20702) ListLongMap!18575)

(assert (=> b!1253548 (= lt!565984 (+!4201 lt!565983 (tuple2!20703 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47791)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47791)

(declare-datatypes ((array!81225 0))(
  ( (array!81226 (arr!39175 (Array (_ BitVec 32) (_ BitVec 64))) (size!39713 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81225)

(declare-fun getCurrentListMap!4437 (array!81225 array!81223 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18575)

(assert (=> b!1253548 (= lt!565981 (getCurrentListMap!4437 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253548 (= lt!565985 (getCurrentListMap!4437 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253549 () Bool)

(declare-fun res!835906 () Bool)

(declare-fun e!712176 () Bool)

(assert (=> b!1253549 (=> (not res!835906) (not e!712176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81225 (_ BitVec 32)) Bool)

(assert (=> b!1253549 (= res!835906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253550 () Bool)

(declare-fun res!835905 () Bool)

(assert (=> b!1253550 (=> (not res!835905) (not e!712176))))

(assert (=> b!1253550 (= res!835905 (and (= (size!39712 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39713 _keys!1118) (size!39712 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835909 () Bool)

(assert (=> start!105196 (=> (not res!835909) (not e!712176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105196 (= res!835909 (validMask!0 mask!1466))))

(assert (=> start!105196 e!712176))

(assert (=> start!105196 true))

(assert (=> start!105196 tp!94256))

(assert (=> start!105196 tp_is_empty!31819))

(declare-fun array_inv!29993 (array!81225) Bool)

(assert (=> start!105196 (array_inv!29993 _keys!1118)))

(declare-fun e!712175 () Bool)

(declare-fun array_inv!29994 (array!81223) Bool)

(assert (=> start!105196 (and (array_inv!29994 _values!914) e!712175)))

(declare-fun b!1253551 () Bool)

(declare-fun e!712174 () Bool)

(assert (=> b!1253551 (= e!712175 (and e!712174 mapRes!49504))))

(declare-fun condMapEmpty!49504 () Bool)

(declare-fun mapDefault!49504 () ValueCell!15146)

(assert (=> b!1253551 (= condMapEmpty!49504 (= (arr!39174 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15146)) mapDefault!49504)))))

(declare-fun b!1253552 () Bool)

(declare-fun res!835907 () Bool)

(assert (=> b!1253552 (=> (not res!835907) (not e!712176))))

(declare-datatypes ((List!27915 0))(
  ( (Nil!27912) (Cons!27911 (h!29120 (_ BitVec 64)) (t!41387 List!27915)) )
))
(declare-fun arrayNoDuplicates!0 (array!81225 (_ BitVec 32) List!27915) Bool)

(assert (=> b!1253552 (= res!835907 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27912))))

(declare-fun b!1253553 () Bool)

(assert (=> b!1253553 (= e!712174 tp_is_empty!31819)))

(declare-fun b!1253554 () Bool)

(assert (=> b!1253554 (= e!712176 (not e!712171))))

(declare-fun res!835908 () Bool)

(assert (=> b!1253554 (=> res!835908 e!712171)))

(assert (=> b!1253554 (= res!835908 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253554 (= lt!565983 lt!565982)))

(declare-fun lt!565980 () Unit!41569)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1025 (array!81225 array!81223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 V!47791 V!47791 (_ BitVec 32) Int) Unit!41569)

(assert (=> b!1253554 (= lt!565980 (lemmaNoChangeToArrayThenSameMapNoExtras!1025 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5703 (array!81225 array!81223 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18575)

(assert (=> b!1253554 (= lt!565982 (getCurrentListMapNoExtraKeys!5703 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253554 (= lt!565983 (getCurrentListMapNoExtraKeys!5703 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105196 res!835909) b!1253550))

(assert (= (and b!1253550 res!835905) b!1253549))

(assert (= (and b!1253549 res!835906) b!1253552))

(assert (= (and b!1253552 res!835907) b!1253554))

(assert (= (and b!1253554 (not res!835908)) b!1253548))

(assert (= (and b!1253551 condMapEmpty!49504) mapIsEmpty!49504))

(assert (= (and b!1253551 (not condMapEmpty!49504)) mapNonEmpty!49504))

(get-info :version)

(assert (= (and mapNonEmpty!49504 ((_ is ValueCellFull!15146) mapValue!49504)) b!1253547))

(assert (= (and b!1253551 ((_ is ValueCellFull!15146) mapDefault!49504)) b!1253553))

(assert (= start!105196 b!1253551))

(declare-fun m!1153685 () Bool)

(assert (=> start!105196 m!1153685))

(declare-fun m!1153687 () Bool)

(assert (=> start!105196 m!1153687))

(declare-fun m!1153689 () Bool)

(assert (=> start!105196 m!1153689))

(declare-fun m!1153691 () Bool)

(assert (=> b!1253548 m!1153691))

(declare-fun m!1153693 () Bool)

(assert (=> b!1253548 m!1153693))

(declare-fun m!1153695 () Bool)

(assert (=> b!1253548 m!1153695))

(declare-fun m!1153697 () Bool)

(assert (=> b!1253548 m!1153697))

(declare-fun m!1153699 () Bool)

(assert (=> b!1253548 m!1153699))

(declare-fun m!1153701 () Bool)

(assert (=> b!1253548 m!1153701))

(declare-fun m!1153703 () Bool)

(assert (=> b!1253552 m!1153703))

(declare-fun m!1153705 () Bool)

(assert (=> b!1253549 m!1153705))

(declare-fun m!1153707 () Bool)

(assert (=> b!1253554 m!1153707))

(declare-fun m!1153709 () Bool)

(assert (=> b!1253554 m!1153709))

(declare-fun m!1153711 () Bool)

(assert (=> b!1253554 m!1153711))

(declare-fun m!1153713 () Bool)

(assert (=> mapNonEmpty!49504 m!1153713))

(check-sat (not mapNonEmpty!49504) b_and!44713 (not b!1253548) (not b_next!26917) (not start!105196) (not b!1253549) tp_is_empty!31819 (not b!1253552) (not b!1253554))
(check-sat b_and!44713 (not b_next!26917))
