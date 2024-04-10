; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95982 () Bool)

(assert start!95982)

(declare-fun b_free!22635 () Bool)

(declare-fun b_next!22635 () Bool)

(assert (=> start!95982 (= b_free!22635 (not b_next!22635))))

(declare-fun tp!79754 () Bool)

(declare-fun b_and!35945 () Bool)

(assert (=> start!95982 (= tp!79754 b_and!35945)))

(declare-fun b!1087710 () Bool)

(declare-fun res!725410 () Bool)

(declare-fun e!621308 () Bool)

(assert (=> b!1087710 (=> (not res!725410) (not e!621308))))

(declare-datatypes ((array!70199 0))(
  ( (array!70200 (arr!33773 (Array (_ BitVec 32) (_ BitVec 64))) (size!34309 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70199)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087710 (= res!725410 (= (select (arr!33773 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41710 () Bool)

(declare-fun mapRes!41710 () Bool)

(declare-fun tp!79753 () Bool)

(declare-fun e!621309 () Bool)

(assert (=> mapNonEmpty!41710 (= mapRes!41710 (and tp!79753 e!621309))))

(declare-datatypes ((V!40643 0))(
  ( (V!40644 (val!13375 Int)) )
))
(declare-datatypes ((ValueCell!12609 0))(
  ( (ValueCellFull!12609 (v!15996 V!40643)) (EmptyCell!12609) )
))
(declare-datatypes ((array!70201 0))(
  ( (array!70202 (arr!33774 (Array (_ BitVec 32) ValueCell!12609)) (size!34310 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70201)

(declare-fun mapValue!41710 () ValueCell!12609)

(declare-fun mapKey!41710 () (_ BitVec 32))

(declare-fun mapRest!41710 () (Array (_ BitVec 32) ValueCell!12609))

(assert (=> mapNonEmpty!41710 (= (arr!33774 _values!874) (store mapRest!41710 mapKey!41710 mapValue!41710))))

(declare-fun b!1087711 () Bool)

(declare-fun e!621307 () Bool)

(declare-fun e!621312 () Bool)

(assert (=> b!1087711 (= e!621307 (not e!621312))))

(declare-fun res!725412 () Bool)

(assert (=> b!1087711 (=> res!725412 e!621312)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087711 (= res!725412 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40643)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16976 0))(
  ( (tuple2!16977 (_1!8499 (_ BitVec 64)) (_2!8499 V!40643)) )
))
(declare-datatypes ((List!23562 0))(
  ( (Nil!23559) (Cons!23558 (h!24767 tuple2!16976) (t!33255 List!23562)) )
))
(declare-datatypes ((ListLongMap!14945 0))(
  ( (ListLongMap!14946 (toList!7488 List!23562)) )
))
(declare-fun lt!484150 () ListLongMap!14945)

(declare-fun zeroValue!831 () V!40643)

(declare-fun getCurrentListMap!4262 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40643 V!40643 (_ BitVec 32) Int) ListLongMap!14945)

(assert (=> b!1087711 (= lt!484150 (getCurrentListMap!4262 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484153 () ListLongMap!14945)

(declare-fun lt!484154 () array!70199)

(declare-fun lt!484155 () array!70201)

(assert (=> b!1087711 (= lt!484153 (getCurrentListMap!4262 lt!484154 lt!484155 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484160 () ListLongMap!14945)

(declare-fun lt!484156 () ListLongMap!14945)

(assert (=> b!1087711 (and (= lt!484160 lt!484156) (= lt!484156 lt!484160))))

(declare-fun lt!484151 () ListLongMap!14945)

(declare-fun -!813 (ListLongMap!14945 (_ BitVec 64)) ListLongMap!14945)

(assert (=> b!1087711 (= lt!484156 (-!813 lt!484151 k0!904))))

(declare-datatypes ((Unit!35792 0))(
  ( (Unit!35793) )
))
(declare-fun lt!484159 () Unit!35792)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!81 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40643 V!40643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35792)

(assert (=> b!1087711 (= lt!484159 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!81 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4022 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40643 V!40643 (_ BitVec 32) Int) ListLongMap!14945)

(assert (=> b!1087711 (= lt!484160 (getCurrentListMapNoExtraKeys!4022 lt!484154 lt!484155 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2159 (Int (_ BitVec 64)) V!40643)

(assert (=> b!1087711 (= lt!484155 (array!70202 (store (arr!33774 _values!874) i!650 (ValueCellFull!12609 (dynLambda!2159 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34310 _values!874)))))

(assert (=> b!1087711 (= lt!484151 (getCurrentListMapNoExtraKeys!4022 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087711 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484161 () Unit!35792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70199 (_ BitVec 64) (_ BitVec 32)) Unit!35792)

(assert (=> b!1087711 (= lt!484161 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087712 () Bool)

(assert (=> b!1087712 (= e!621308 e!621307)))

(declare-fun res!725411 () Bool)

(assert (=> b!1087712 (=> (not res!725411) (not e!621307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70199 (_ BitVec 32)) Bool)

(assert (=> b!1087712 (= res!725411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484154 mask!1414))))

(assert (=> b!1087712 (= lt!484154 (array!70200 (store (arr!33773 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34309 _keys!1070)))))

(declare-fun b!1087713 () Bool)

(declare-fun res!725403 () Bool)

(assert (=> b!1087713 (=> (not res!725403) (not e!621308))))

(assert (=> b!1087713 (= res!725403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087714 () Bool)

(declare-fun res!725407 () Bool)

(assert (=> b!1087714 (=> (not res!725407) (not e!621308))))

(declare-datatypes ((List!23563 0))(
  ( (Nil!23560) (Cons!23559 (h!24768 (_ BitVec 64)) (t!33256 List!23563)) )
))
(declare-fun arrayNoDuplicates!0 (array!70199 (_ BitVec 32) List!23563) Bool)

(assert (=> b!1087714 (= res!725407 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23560))))

(declare-fun b!1087715 () Bool)

(declare-fun e!621313 () Bool)

(assert (=> b!1087715 (= e!621312 e!621313)))

(declare-fun res!725406 () Bool)

(assert (=> b!1087715 (=> res!725406 e!621313)))

(assert (=> b!1087715 (= res!725406 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484157 () ListLongMap!14945)

(assert (=> b!1087715 (= lt!484153 lt!484157)))

(declare-fun lt!484152 () tuple2!16976)

(declare-fun +!3290 (ListLongMap!14945 tuple2!16976) ListLongMap!14945)

(assert (=> b!1087715 (= lt!484157 (+!3290 lt!484156 lt!484152))))

(declare-fun lt!484158 () ListLongMap!14945)

(assert (=> b!1087715 (= lt!484150 lt!484158)))

(assert (=> b!1087715 (= lt!484158 (+!3290 lt!484151 lt!484152))))

(assert (=> b!1087715 (= lt!484153 (+!3290 lt!484160 lt!484152))))

(assert (=> b!1087715 (= lt!484152 (tuple2!16977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087716 () Bool)

(assert (=> b!1087716 (= e!621313 true)))

(assert (=> b!1087716 (= (-!813 lt!484158 k0!904) lt!484157)))

(declare-fun lt!484162 () Unit!35792)

(declare-fun addRemoveCommutativeForDiffKeys!44 (ListLongMap!14945 (_ BitVec 64) V!40643 (_ BitVec 64)) Unit!35792)

(assert (=> b!1087716 (= lt!484162 (addRemoveCommutativeForDiffKeys!44 lt!484151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087717 () Bool)

(declare-fun tp_is_empty!26637 () Bool)

(assert (=> b!1087717 (= e!621309 tp_is_empty!26637)))

(declare-fun b!1087718 () Bool)

(declare-fun e!621311 () Bool)

(declare-fun e!621314 () Bool)

(assert (=> b!1087718 (= e!621311 (and e!621314 mapRes!41710))))

(declare-fun condMapEmpty!41710 () Bool)

(declare-fun mapDefault!41710 () ValueCell!12609)

(assert (=> b!1087718 (= condMapEmpty!41710 (= (arr!33774 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12609)) mapDefault!41710)))))

(declare-fun b!1087719 () Bool)

(declare-fun res!725404 () Bool)

(assert (=> b!1087719 (=> (not res!725404) (not e!621308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087719 (= res!725404 (validKeyInArray!0 k0!904))))

(declare-fun b!1087720 () Bool)

(declare-fun res!725409 () Bool)

(assert (=> b!1087720 (=> (not res!725409) (not e!621308))))

(assert (=> b!1087720 (= res!725409 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34309 _keys!1070))))))

(declare-fun b!1087721 () Bool)

(assert (=> b!1087721 (= e!621314 tp_is_empty!26637)))

(declare-fun res!725402 () Bool)

(assert (=> start!95982 (=> (not res!725402) (not e!621308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95982 (= res!725402 (validMask!0 mask!1414))))

(assert (=> start!95982 e!621308))

(assert (=> start!95982 tp!79754))

(assert (=> start!95982 true))

(assert (=> start!95982 tp_is_empty!26637))

(declare-fun array_inv!26048 (array!70199) Bool)

(assert (=> start!95982 (array_inv!26048 _keys!1070)))

(declare-fun array_inv!26049 (array!70201) Bool)

(assert (=> start!95982 (and (array_inv!26049 _values!874) e!621311)))

(declare-fun b!1087722 () Bool)

(declare-fun res!725405 () Bool)

(assert (=> b!1087722 (=> (not res!725405) (not e!621308))))

(assert (=> b!1087722 (= res!725405 (and (= (size!34310 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34309 _keys!1070) (size!34310 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41710 () Bool)

(assert (=> mapIsEmpty!41710 mapRes!41710))

(declare-fun b!1087723 () Bool)

(declare-fun res!725408 () Bool)

(assert (=> b!1087723 (=> (not res!725408) (not e!621307))))

(assert (=> b!1087723 (= res!725408 (arrayNoDuplicates!0 lt!484154 #b00000000000000000000000000000000 Nil!23560))))

(assert (= (and start!95982 res!725402) b!1087722))

(assert (= (and b!1087722 res!725405) b!1087713))

(assert (= (and b!1087713 res!725403) b!1087714))

(assert (= (and b!1087714 res!725407) b!1087720))

(assert (= (and b!1087720 res!725409) b!1087719))

(assert (= (and b!1087719 res!725404) b!1087710))

(assert (= (and b!1087710 res!725410) b!1087712))

(assert (= (and b!1087712 res!725411) b!1087723))

(assert (= (and b!1087723 res!725408) b!1087711))

(assert (= (and b!1087711 (not res!725412)) b!1087715))

(assert (= (and b!1087715 (not res!725406)) b!1087716))

(assert (= (and b!1087718 condMapEmpty!41710) mapIsEmpty!41710))

(assert (= (and b!1087718 (not condMapEmpty!41710)) mapNonEmpty!41710))

(get-info :version)

(assert (= (and mapNonEmpty!41710 ((_ is ValueCellFull!12609) mapValue!41710)) b!1087717))

(assert (= (and b!1087718 ((_ is ValueCellFull!12609) mapDefault!41710)) b!1087721))

(assert (= start!95982 b!1087718))

(declare-fun b_lambda!17305 () Bool)

(assert (=> (not b_lambda!17305) (not b!1087711)))

(declare-fun t!33254 () Bool)

(declare-fun tb!7513 () Bool)

(assert (=> (and start!95982 (= defaultEntry!882 defaultEntry!882) t!33254) tb!7513))

(declare-fun result!15545 () Bool)

(assert (=> tb!7513 (= result!15545 tp_is_empty!26637)))

(assert (=> b!1087711 t!33254))

(declare-fun b_and!35947 () Bool)

(assert (= b_and!35945 (and (=> t!33254 result!15545) b_and!35947)))

(declare-fun m!1006643 () Bool)

(assert (=> b!1087713 m!1006643))

(declare-fun m!1006645 () Bool)

(assert (=> b!1087719 m!1006645))

(declare-fun m!1006647 () Bool)

(assert (=> b!1087714 m!1006647))

(declare-fun m!1006649 () Bool)

(assert (=> b!1087712 m!1006649))

(declare-fun m!1006651 () Bool)

(assert (=> b!1087712 m!1006651))

(declare-fun m!1006653 () Bool)

(assert (=> mapNonEmpty!41710 m!1006653))

(declare-fun m!1006655 () Bool)

(assert (=> b!1087723 m!1006655))

(declare-fun m!1006657 () Bool)

(assert (=> b!1087711 m!1006657))

(declare-fun m!1006659 () Bool)

(assert (=> b!1087711 m!1006659))

(declare-fun m!1006661 () Bool)

(assert (=> b!1087711 m!1006661))

(declare-fun m!1006663 () Bool)

(assert (=> b!1087711 m!1006663))

(declare-fun m!1006665 () Bool)

(assert (=> b!1087711 m!1006665))

(declare-fun m!1006667 () Bool)

(assert (=> b!1087711 m!1006667))

(declare-fun m!1006669 () Bool)

(assert (=> b!1087711 m!1006669))

(declare-fun m!1006671 () Bool)

(assert (=> b!1087711 m!1006671))

(declare-fun m!1006673 () Bool)

(assert (=> b!1087711 m!1006673))

(declare-fun m!1006675 () Bool)

(assert (=> b!1087711 m!1006675))

(declare-fun m!1006677 () Bool)

(assert (=> b!1087710 m!1006677))

(declare-fun m!1006679 () Bool)

(assert (=> b!1087715 m!1006679))

(declare-fun m!1006681 () Bool)

(assert (=> b!1087715 m!1006681))

(declare-fun m!1006683 () Bool)

(assert (=> b!1087715 m!1006683))

(declare-fun m!1006685 () Bool)

(assert (=> start!95982 m!1006685))

(declare-fun m!1006687 () Bool)

(assert (=> start!95982 m!1006687))

(declare-fun m!1006689 () Bool)

(assert (=> start!95982 m!1006689))

(declare-fun m!1006691 () Bool)

(assert (=> b!1087716 m!1006691))

(declare-fun m!1006693 () Bool)

(assert (=> b!1087716 m!1006693))

(check-sat (not b_next!22635) (not start!95982) (not b!1087716) (not b!1087719) (not b!1087723) (not b!1087715) tp_is_empty!26637 (not b!1087713) (not b!1087712) (not b!1087714) (not b!1087711) b_and!35947 (not mapNonEmpty!41710) (not b_lambda!17305))
(check-sat b_and!35947 (not b_next!22635))
