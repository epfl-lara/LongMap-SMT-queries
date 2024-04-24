; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96246 () Bool)

(assert start!96246)

(declare-fun b_free!22663 () Bool)

(declare-fun b_next!22663 () Bool)

(assert (=> start!96246 (= b_free!22663 (not b_next!22663))))

(declare-fun tp!79837 () Bool)

(declare-fun b_and!36011 () Bool)

(assert (=> start!96246 (= tp!79837 b_and!36011)))

(declare-fun b!1089653 () Bool)

(declare-fun e!622503 () Bool)

(declare-fun e!622499 () Bool)

(declare-fun mapRes!41752 () Bool)

(assert (=> b!1089653 (= e!622503 (and e!622499 mapRes!41752))))

(declare-fun condMapEmpty!41752 () Bool)

(declare-datatypes ((V!40681 0))(
  ( (V!40682 (val!13389 Int)) )
))
(declare-datatypes ((ValueCell!12623 0))(
  ( (ValueCellFull!12623 (v!16006 V!40681)) (EmptyCell!12623) )
))
(declare-datatypes ((array!70295 0))(
  ( (array!70296 (arr!33815 (Array (_ BitVec 32) ValueCell!12623)) (size!34352 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70295)

(declare-fun mapDefault!41752 () ValueCell!12623)

(assert (=> b!1089653 (= condMapEmpty!41752 (= (arr!33815 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12623)) mapDefault!41752)))))

(declare-fun b!1089654 () Bool)

(declare-fun res!726391 () Bool)

(declare-fun e!622505 () Bool)

(assert (=> b!1089654 (=> (not res!726391) (not e!622505))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70297 0))(
  ( (array!70298 (arr!33816 (Array (_ BitVec 32) (_ BitVec 64))) (size!34353 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70297)

(assert (=> b!1089654 (= res!726391 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34353 _keys!1070))))))

(declare-fun b!1089655 () Bool)

(declare-fun e!622504 () Bool)

(declare-fun e!622502 () Bool)

(assert (=> b!1089655 (= e!622504 (not e!622502))))

(declare-fun res!726392 () Bool)

(assert (=> b!1089655 (=> res!726392 e!622502)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089655 (= res!726392 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40681)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17012 0))(
  ( (tuple2!17013 (_1!8517 (_ BitVec 64)) (_2!8517 V!40681)) )
))
(declare-datatypes ((List!23605 0))(
  ( (Nil!23602) (Cons!23601 (h!24819 tuple2!17012) (t!33318 List!23605)) )
))
(declare-datatypes ((ListLongMap!14989 0))(
  ( (ListLongMap!14990 (toList!7510 List!23605)) )
))
(declare-fun lt!485219 () ListLongMap!14989)

(declare-fun zeroValue!831 () V!40681)

(declare-fun getCurrentListMap!4269 (array!70297 array!70295 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!14989)

(assert (=> b!1089655 (= lt!485219 (getCurrentListMap!4269 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485218 () ListLongMap!14989)

(declare-fun lt!485223 () array!70295)

(declare-fun lt!485217 () array!70297)

(assert (=> b!1089655 (= lt!485218 (getCurrentListMap!4269 lt!485217 lt!485223 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485221 () ListLongMap!14989)

(declare-fun lt!485212 () ListLongMap!14989)

(assert (=> b!1089655 (and (= lt!485221 lt!485212) (= lt!485212 lt!485221))))

(declare-fun lt!485220 () ListLongMap!14989)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!821 (ListLongMap!14989 (_ BitVec 64)) ListLongMap!14989)

(assert (=> b!1089655 (= lt!485212 (-!821 lt!485220 k0!904))))

(declare-datatypes ((Unit!35809 0))(
  ( (Unit!35810) )
))
(declare-fun lt!485213 () Unit!35809)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 (array!70297 array!70295 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35809)

(assert (=> b!1089655 (= lt!485213 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4074 (array!70297 array!70295 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!14989)

(assert (=> b!1089655 (= lt!485221 (getCurrentListMapNoExtraKeys!4074 lt!485217 lt!485223 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2195 (Int (_ BitVec 64)) V!40681)

(assert (=> b!1089655 (= lt!485223 (array!70296 (store (arr!33815 _values!874) i!650 (ValueCellFull!12623 (dynLambda!2195 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34352 _values!874)))))

(assert (=> b!1089655 (= lt!485220 (getCurrentListMapNoExtraKeys!4074 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089655 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485216 () Unit!35809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70297 (_ BitVec 64) (_ BitVec 32)) Unit!35809)

(assert (=> b!1089655 (= lt!485216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089656 () Bool)

(declare-fun res!726389 () Bool)

(assert (=> b!1089656 (=> (not res!726389) (not e!622505))))

(declare-datatypes ((List!23606 0))(
  ( (Nil!23603) (Cons!23602 (h!24820 (_ BitVec 64)) (t!33319 List!23606)) )
))
(declare-fun arrayNoDuplicates!0 (array!70297 (_ BitVec 32) List!23606) Bool)

(assert (=> b!1089656 (= res!726389 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23603))))

(declare-fun b!1089657 () Bool)

(declare-fun e!622498 () Bool)

(declare-fun tp_is_empty!26665 () Bool)

(assert (=> b!1089657 (= e!622498 tp_is_empty!26665)))

(declare-fun res!726387 () Bool)

(assert (=> start!96246 (=> (not res!726387) (not e!622505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96246 (= res!726387 (validMask!0 mask!1414))))

(assert (=> start!96246 e!622505))

(assert (=> start!96246 tp!79837))

(assert (=> start!96246 true))

(assert (=> start!96246 tp_is_empty!26665))

(declare-fun array_inv!26128 (array!70297) Bool)

(assert (=> start!96246 (array_inv!26128 _keys!1070)))

(declare-fun array_inv!26129 (array!70295) Bool)

(assert (=> start!96246 (and (array_inv!26129 _values!874) e!622503)))

(declare-fun b!1089658 () Bool)

(declare-fun res!726390 () Bool)

(assert (=> b!1089658 (=> (not res!726390) (not e!622505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089658 (= res!726390 (validKeyInArray!0 k0!904))))

(declare-fun b!1089659 () Bool)

(declare-fun res!726395 () Bool)

(assert (=> b!1089659 (=> (not res!726395) (not e!622505))))

(assert (=> b!1089659 (= res!726395 (= (select (arr!33816 _keys!1070) i!650) k0!904))))

(declare-fun b!1089660 () Bool)

(declare-fun res!726386 () Bool)

(assert (=> b!1089660 (=> (not res!726386) (not e!622504))))

(assert (=> b!1089660 (= res!726386 (arrayNoDuplicates!0 lt!485217 #b00000000000000000000000000000000 Nil!23603))))

(declare-fun b!1089661 () Bool)

(declare-fun res!726396 () Bool)

(assert (=> b!1089661 (=> (not res!726396) (not e!622505))))

(assert (=> b!1089661 (= res!726396 (and (= (size!34352 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34353 _keys!1070) (size!34352 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089662 () Bool)

(declare-fun e!622500 () Bool)

(assert (=> b!1089662 (= e!622500 true)))

(declare-fun lt!485215 () ListLongMap!14989)

(declare-fun lt!485222 () ListLongMap!14989)

(assert (=> b!1089662 (= (-!821 lt!485215 k0!904) lt!485222)))

(declare-fun lt!485211 () Unit!35809)

(declare-fun addRemoveCommutativeForDiffKeys!61 (ListLongMap!14989 (_ BitVec 64) V!40681 (_ BitVec 64)) Unit!35809)

(assert (=> b!1089662 (= lt!485211 (addRemoveCommutativeForDiffKeys!61 lt!485220 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089663 () Bool)

(declare-fun res!726394 () Bool)

(assert (=> b!1089663 (=> (not res!726394) (not e!622505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70297 (_ BitVec 32)) Bool)

(assert (=> b!1089663 (= res!726394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089664 () Bool)

(assert (=> b!1089664 (= e!622502 e!622500)))

(declare-fun res!726388 () Bool)

(assert (=> b!1089664 (=> res!726388 e!622500)))

(assert (=> b!1089664 (= res!726388 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089664 (= lt!485218 lt!485222)))

(declare-fun lt!485214 () tuple2!17012)

(declare-fun +!3330 (ListLongMap!14989 tuple2!17012) ListLongMap!14989)

(assert (=> b!1089664 (= lt!485222 (+!3330 lt!485212 lt!485214))))

(assert (=> b!1089664 (= lt!485219 lt!485215)))

(assert (=> b!1089664 (= lt!485215 (+!3330 lt!485220 lt!485214))))

(assert (=> b!1089664 (= lt!485218 (+!3330 lt!485221 lt!485214))))

(assert (=> b!1089664 (= lt!485214 (tuple2!17013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41752 () Bool)

(assert (=> mapIsEmpty!41752 mapRes!41752))

(declare-fun mapNonEmpty!41752 () Bool)

(declare-fun tp!79838 () Bool)

(assert (=> mapNonEmpty!41752 (= mapRes!41752 (and tp!79838 e!622498))))

(declare-fun mapKey!41752 () (_ BitVec 32))

(declare-fun mapRest!41752 () (Array (_ BitVec 32) ValueCell!12623))

(declare-fun mapValue!41752 () ValueCell!12623)

(assert (=> mapNonEmpty!41752 (= (arr!33815 _values!874) (store mapRest!41752 mapKey!41752 mapValue!41752))))

(declare-fun b!1089665 () Bool)

(assert (=> b!1089665 (= e!622499 tp_is_empty!26665)))

(declare-fun b!1089666 () Bool)

(assert (=> b!1089666 (= e!622505 e!622504)))

(declare-fun res!726393 () Bool)

(assert (=> b!1089666 (=> (not res!726393) (not e!622504))))

(assert (=> b!1089666 (= res!726393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485217 mask!1414))))

(assert (=> b!1089666 (= lt!485217 (array!70298 (store (arr!33816 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34353 _keys!1070)))))

(assert (= (and start!96246 res!726387) b!1089661))

(assert (= (and b!1089661 res!726396) b!1089663))

(assert (= (and b!1089663 res!726394) b!1089656))

(assert (= (and b!1089656 res!726389) b!1089654))

(assert (= (and b!1089654 res!726391) b!1089658))

(assert (= (and b!1089658 res!726390) b!1089659))

(assert (= (and b!1089659 res!726395) b!1089666))

(assert (= (and b!1089666 res!726393) b!1089660))

(assert (= (and b!1089660 res!726386) b!1089655))

(assert (= (and b!1089655 (not res!726392)) b!1089664))

(assert (= (and b!1089664 (not res!726388)) b!1089662))

(assert (= (and b!1089653 condMapEmpty!41752) mapIsEmpty!41752))

(assert (= (and b!1089653 (not condMapEmpty!41752)) mapNonEmpty!41752))

(get-info :version)

(assert (= (and mapNonEmpty!41752 ((_ is ValueCellFull!12623) mapValue!41752)) b!1089657))

(assert (= (and b!1089653 ((_ is ValueCellFull!12623) mapDefault!41752)) b!1089665))

(assert (= start!96246 b!1089653))

(declare-fun b_lambda!17343 () Bool)

(assert (=> (not b_lambda!17343) (not b!1089655)))

(declare-fun t!33317 () Bool)

(declare-fun tb!7533 () Bool)

(assert (=> (and start!96246 (= defaultEntry!882 defaultEntry!882) t!33317) tb!7533))

(declare-fun result!15593 () Bool)

(assert (=> tb!7533 (= result!15593 tp_is_empty!26665)))

(assert (=> b!1089655 t!33317))

(declare-fun b_and!36013 () Bool)

(assert (= b_and!36011 (and (=> t!33317 result!15593) b_and!36013)))

(declare-fun m!1009043 () Bool)

(assert (=> b!1089658 m!1009043))

(declare-fun m!1009045 () Bool)

(assert (=> b!1089655 m!1009045))

(declare-fun m!1009047 () Bool)

(assert (=> b!1089655 m!1009047))

(declare-fun m!1009049 () Bool)

(assert (=> b!1089655 m!1009049))

(declare-fun m!1009051 () Bool)

(assert (=> b!1089655 m!1009051))

(declare-fun m!1009053 () Bool)

(assert (=> b!1089655 m!1009053))

(declare-fun m!1009055 () Bool)

(assert (=> b!1089655 m!1009055))

(declare-fun m!1009057 () Bool)

(assert (=> b!1089655 m!1009057))

(declare-fun m!1009059 () Bool)

(assert (=> b!1089655 m!1009059))

(declare-fun m!1009061 () Bool)

(assert (=> b!1089655 m!1009061))

(declare-fun m!1009063 () Bool)

(assert (=> b!1089655 m!1009063))

(declare-fun m!1009065 () Bool)

(assert (=> start!96246 m!1009065))

(declare-fun m!1009067 () Bool)

(assert (=> start!96246 m!1009067))

(declare-fun m!1009069 () Bool)

(assert (=> start!96246 m!1009069))

(declare-fun m!1009071 () Bool)

(assert (=> b!1089666 m!1009071))

(declare-fun m!1009073 () Bool)

(assert (=> b!1089666 m!1009073))

(declare-fun m!1009075 () Bool)

(assert (=> b!1089656 m!1009075))

(declare-fun m!1009077 () Bool)

(assert (=> b!1089659 m!1009077))

(declare-fun m!1009079 () Bool)

(assert (=> b!1089662 m!1009079))

(declare-fun m!1009081 () Bool)

(assert (=> b!1089662 m!1009081))

(declare-fun m!1009083 () Bool)

(assert (=> mapNonEmpty!41752 m!1009083))

(declare-fun m!1009085 () Bool)

(assert (=> b!1089664 m!1009085))

(declare-fun m!1009087 () Bool)

(assert (=> b!1089664 m!1009087))

(declare-fun m!1009089 () Bool)

(assert (=> b!1089664 m!1009089))

(declare-fun m!1009091 () Bool)

(assert (=> b!1089660 m!1009091))

(declare-fun m!1009093 () Bool)

(assert (=> b!1089663 m!1009093))

(check-sat (not b!1089663) (not b_next!22663) tp_is_empty!26665 (not b!1089655) (not start!96246) (not b_lambda!17343) (not b!1089658) (not mapNonEmpty!41752) (not b!1089662) (not b!1089666) b_and!36013 (not b!1089660) (not b!1089656) (not b!1089664))
(check-sat b_and!36013 (not b_next!22663))
