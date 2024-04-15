; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95962 () Bool)

(assert start!95962)

(declare-fun b_free!22621 () Bool)

(declare-fun b_next!22621 () Bool)

(assert (=> start!95962 (= b_free!22621 (not b_next!22621))))

(declare-fun tp!79712 () Bool)

(declare-fun b_and!35891 () Bool)

(assert (=> start!95962 (= tp!79712 b_and!35891)))

(declare-fun b!1087249 () Bool)

(declare-fun e!621050 () Bool)

(declare-fun e!621052 () Bool)

(declare-fun mapRes!41689 () Bool)

(assert (=> b!1087249 (= e!621050 (and e!621052 mapRes!41689))))

(declare-fun condMapEmpty!41689 () Bool)

(declare-datatypes ((V!40625 0))(
  ( (V!40626 (val!13368 Int)) )
))
(declare-datatypes ((ValueCell!12602 0))(
  ( (ValueCellFull!12602 (v!15988 V!40625)) (EmptyCell!12602) )
))
(declare-datatypes ((array!70096 0))(
  ( (array!70097 (arr!33722 (Array (_ BitVec 32) ValueCell!12602)) (size!34260 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70096)

(declare-fun mapDefault!41689 () ValueCell!12602)

(assert (=> b!1087249 (= condMapEmpty!41689 (= (arr!33722 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12602)) mapDefault!41689)))))

(declare-fun b!1087250 () Bool)

(declare-fun e!621051 () Bool)

(declare-fun e!621046 () Bool)

(assert (=> b!1087250 (= e!621051 e!621046)))

(declare-fun res!725112 () Bool)

(assert (=> b!1087250 (=> (not res!725112) (not e!621046))))

(declare-datatypes ((array!70098 0))(
  ( (array!70099 (arr!33723 (Array (_ BitVec 32) (_ BitVec 64))) (size!34261 (_ BitVec 32))) )
))
(declare-fun lt!483682 () array!70098)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70098 (_ BitVec 32)) Bool)

(assert (=> b!1087250 (= res!725112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483682 mask!1414))))

(declare-fun _keys!1070 () array!70098)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087250 (= lt!483682 (array!70099 (store (arr!33723 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34261 _keys!1070)))))

(declare-fun res!725106 () Bool)

(assert (=> start!95962 (=> (not res!725106) (not e!621051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95962 (= res!725106 (validMask!0 mask!1414))))

(assert (=> start!95962 e!621051))

(assert (=> start!95962 tp!79712))

(assert (=> start!95962 true))

(declare-fun tp_is_empty!26623 () Bool)

(assert (=> start!95962 tp_is_empty!26623))

(declare-fun array_inv!26060 (array!70098) Bool)

(assert (=> start!95962 (array_inv!26060 _keys!1070)))

(declare-fun array_inv!26061 (array!70096) Bool)

(assert (=> start!95962 (and (array_inv!26061 _values!874) e!621050)))

(declare-fun b!1087251 () Bool)

(declare-fun res!725105 () Bool)

(assert (=> b!1087251 (=> (not res!725105) (not e!621051))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087251 (= res!725105 (validKeyInArray!0 k0!904))))

(declare-fun b!1087252 () Bool)

(declare-fun res!725108 () Bool)

(assert (=> b!1087252 (=> (not res!725108) (not e!621051))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087252 (= res!725108 (and (= (size!34260 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34261 _keys!1070) (size!34260 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087253 () Bool)

(declare-fun e!621047 () Bool)

(assert (=> b!1087253 (= e!621047 tp_is_empty!26623)))

(declare-fun b!1087254 () Bool)

(declare-fun res!725104 () Bool)

(assert (=> b!1087254 (=> (not res!725104) (not e!621051))))

(assert (=> b!1087254 (= res!725104 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34261 _keys!1070))))))

(declare-fun b!1087255 () Bool)

(declare-fun e!621048 () Bool)

(assert (=> b!1087255 (= e!621048 true)))

(declare-datatypes ((tuple2!17022 0))(
  ( (tuple2!17023 (_1!8522 (_ BitVec 64)) (_2!8522 V!40625)) )
))
(declare-datatypes ((List!23589 0))(
  ( (Nil!23586) (Cons!23585 (h!24794 tuple2!17022) (t!33259 List!23589)) )
))
(declare-datatypes ((ListLongMap!14991 0))(
  ( (ListLongMap!14992 (toList!7511 List!23589)) )
))
(declare-fun lt!483679 () ListLongMap!14991)

(declare-fun lt!483683 () ListLongMap!14991)

(declare-fun -!790 (ListLongMap!14991 (_ BitVec 64)) ListLongMap!14991)

(assert (=> b!1087255 (= (-!790 lt!483679 k0!904) lt!483683)))

(declare-fun lt!483680 () ListLongMap!14991)

(declare-datatypes ((Unit!35615 0))(
  ( (Unit!35616) )
))
(declare-fun lt!483684 () Unit!35615)

(declare-fun zeroValue!831 () V!40625)

(declare-fun addRemoveCommutativeForDiffKeys!44 (ListLongMap!14991 (_ BitVec 64) V!40625 (_ BitVec 64)) Unit!35615)

(assert (=> b!1087255 (= lt!483684 (addRemoveCommutativeForDiffKeys!44 lt!483680 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087256 () Bool)

(declare-fun res!725107 () Bool)

(assert (=> b!1087256 (=> (not res!725107) (not e!621051))))

(assert (=> b!1087256 (= res!725107 (= (select (arr!33723 _keys!1070) i!650) k0!904))))

(declare-fun b!1087257 () Bool)

(assert (=> b!1087257 (= e!621052 tp_is_empty!26623)))

(declare-fun b!1087258 () Bool)

(declare-fun res!725103 () Bool)

(assert (=> b!1087258 (=> (not res!725103) (not e!621051))))

(assert (=> b!1087258 (= res!725103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41689 () Bool)

(assert (=> mapIsEmpty!41689 mapRes!41689))

(declare-fun b!1087259 () Bool)

(declare-fun res!725109 () Bool)

(assert (=> b!1087259 (=> (not res!725109) (not e!621051))))

(declare-datatypes ((List!23590 0))(
  ( (Nil!23587) (Cons!23586 (h!24795 (_ BitVec 64)) (t!33260 List!23590)) )
))
(declare-fun arrayNoDuplicates!0 (array!70098 (_ BitVec 32) List!23590) Bool)

(assert (=> b!1087259 (= res!725109 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23587))))

(declare-fun b!1087260 () Bool)

(declare-fun res!725111 () Bool)

(assert (=> b!1087260 (=> (not res!725111) (not e!621046))))

(assert (=> b!1087260 (= res!725111 (arrayNoDuplicates!0 lt!483682 #b00000000000000000000000000000000 Nil!23587))))

(declare-fun b!1087261 () Bool)

(declare-fun e!621053 () Bool)

(assert (=> b!1087261 (= e!621053 e!621048)))

(declare-fun res!725110 () Bool)

(assert (=> b!1087261 (=> res!725110 e!621048)))

(assert (=> b!1087261 (= res!725110 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483677 () ListLongMap!14991)

(assert (=> b!1087261 (= lt!483677 lt!483683)))

(declare-fun lt!483685 () ListLongMap!14991)

(declare-fun lt!483689 () tuple2!17022)

(declare-fun +!3317 (ListLongMap!14991 tuple2!17022) ListLongMap!14991)

(assert (=> b!1087261 (= lt!483683 (+!3317 lt!483685 lt!483689))))

(declare-fun lt!483688 () ListLongMap!14991)

(assert (=> b!1087261 (= lt!483688 lt!483679)))

(assert (=> b!1087261 (= lt!483679 (+!3317 lt!483680 lt!483689))))

(declare-fun lt!483687 () ListLongMap!14991)

(assert (=> b!1087261 (= lt!483677 (+!3317 lt!483687 lt!483689))))

(assert (=> b!1087261 (= lt!483689 (tuple2!17023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41689 () Bool)

(declare-fun tp!79711 () Bool)

(assert (=> mapNonEmpty!41689 (= mapRes!41689 (and tp!79711 e!621047))))

(declare-fun mapValue!41689 () ValueCell!12602)

(declare-fun mapKey!41689 () (_ BitVec 32))

(declare-fun mapRest!41689 () (Array (_ BitVec 32) ValueCell!12602))

(assert (=> mapNonEmpty!41689 (= (arr!33722 _values!874) (store mapRest!41689 mapKey!41689 mapValue!41689))))

(declare-fun b!1087262 () Bool)

(assert (=> b!1087262 (= e!621046 (not e!621053))))

(declare-fun res!725102 () Bool)

(assert (=> b!1087262 (=> res!725102 e!621053)))

(assert (=> b!1087262 (= res!725102 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40625)

(declare-fun getCurrentListMap!4194 (array!70098 array!70096 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) Int) ListLongMap!14991)

(assert (=> b!1087262 (= lt!483688 (getCurrentListMap!4194 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483678 () array!70096)

(assert (=> b!1087262 (= lt!483677 (getCurrentListMap!4194 lt!483682 lt!483678 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087262 (and (= lt!483687 lt!483685) (= lt!483685 lt!483687))))

(assert (=> b!1087262 (= lt!483685 (-!790 lt!483680 k0!904))))

(declare-fun lt!483686 () Unit!35615)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!78 (array!70098 array!70096 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35615)

(assert (=> b!1087262 (= lt!483686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!78 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4064 (array!70098 array!70096 (_ BitVec 32) (_ BitVec 32) V!40625 V!40625 (_ BitVec 32) Int) ListLongMap!14991)

(assert (=> b!1087262 (= lt!483687 (getCurrentListMapNoExtraKeys!4064 lt!483682 lt!483678 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2135 (Int (_ BitVec 64)) V!40625)

(assert (=> b!1087262 (= lt!483678 (array!70097 (store (arr!33722 _values!874) i!650 (ValueCellFull!12602 (dynLambda!2135 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34260 _values!874)))))

(assert (=> b!1087262 (= lt!483680 (getCurrentListMapNoExtraKeys!4064 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087262 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483681 () Unit!35615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70098 (_ BitVec 64) (_ BitVec 32)) Unit!35615)

(assert (=> b!1087262 (= lt!483681 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95962 res!725106) b!1087252))

(assert (= (and b!1087252 res!725108) b!1087258))

(assert (= (and b!1087258 res!725103) b!1087259))

(assert (= (and b!1087259 res!725109) b!1087254))

(assert (= (and b!1087254 res!725104) b!1087251))

(assert (= (and b!1087251 res!725105) b!1087256))

(assert (= (and b!1087256 res!725107) b!1087250))

(assert (= (and b!1087250 res!725112) b!1087260))

(assert (= (and b!1087260 res!725111) b!1087262))

(assert (= (and b!1087262 (not res!725102)) b!1087261))

(assert (= (and b!1087261 (not res!725110)) b!1087255))

(assert (= (and b!1087249 condMapEmpty!41689) mapIsEmpty!41689))

(assert (= (and b!1087249 (not condMapEmpty!41689)) mapNonEmpty!41689))

(get-info :version)

(assert (= (and mapNonEmpty!41689 ((_ is ValueCellFull!12602) mapValue!41689)) b!1087253))

(assert (= (and b!1087249 ((_ is ValueCellFull!12602) mapDefault!41689)) b!1087257))

(assert (= start!95962 b!1087249))

(declare-fun b_lambda!17269 () Bool)

(assert (=> (not b_lambda!17269) (not b!1087262)))

(declare-fun t!33258 () Bool)

(declare-fun tb!7491 () Bool)

(assert (=> (and start!95962 (= defaultEntry!882 defaultEntry!882) t!33258) tb!7491))

(declare-fun result!15509 () Bool)

(assert (=> tb!7491 (= result!15509 tp_is_empty!26623)))

(assert (=> b!1087262 t!33258))

(declare-fun b_and!35893 () Bool)

(assert (= b_and!35891 (and (=> t!33258 result!15509) b_and!35893)))

(declare-fun m!1005653 () Bool)

(assert (=> b!1087261 m!1005653))

(declare-fun m!1005655 () Bool)

(assert (=> b!1087261 m!1005655))

(declare-fun m!1005657 () Bool)

(assert (=> b!1087261 m!1005657))

(declare-fun m!1005659 () Bool)

(assert (=> b!1087259 m!1005659))

(declare-fun m!1005661 () Bool)

(assert (=> b!1087262 m!1005661))

(declare-fun m!1005663 () Bool)

(assert (=> b!1087262 m!1005663))

(declare-fun m!1005665 () Bool)

(assert (=> b!1087262 m!1005665))

(declare-fun m!1005667 () Bool)

(assert (=> b!1087262 m!1005667))

(declare-fun m!1005669 () Bool)

(assert (=> b!1087262 m!1005669))

(declare-fun m!1005671 () Bool)

(assert (=> b!1087262 m!1005671))

(declare-fun m!1005673 () Bool)

(assert (=> b!1087262 m!1005673))

(declare-fun m!1005675 () Bool)

(assert (=> b!1087262 m!1005675))

(declare-fun m!1005677 () Bool)

(assert (=> b!1087262 m!1005677))

(declare-fun m!1005679 () Bool)

(assert (=> b!1087262 m!1005679))

(declare-fun m!1005681 () Bool)

(assert (=> b!1087251 m!1005681))

(declare-fun m!1005683 () Bool)

(assert (=> b!1087258 m!1005683))

(declare-fun m!1005685 () Bool)

(assert (=> b!1087256 m!1005685))

(declare-fun m!1005687 () Bool)

(assert (=> start!95962 m!1005687))

(declare-fun m!1005689 () Bool)

(assert (=> start!95962 m!1005689))

(declare-fun m!1005691 () Bool)

(assert (=> start!95962 m!1005691))

(declare-fun m!1005693 () Bool)

(assert (=> b!1087255 m!1005693))

(declare-fun m!1005695 () Bool)

(assert (=> b!1087255 m!1005695))

(declare-fun m!1005697 () Bool)

(assert (=> mapNonEmpty!41689 m!1005697))

(declare-fun m!1005699 () Bool)

(assert (=> b!1087250 m!1005699))

(declare-fun m!1005701 () Bool)

(assert (=> b!1087250 m!1005701))

(declare-fun m!1005703 () Bool)

(assert (=> b!1087260 m!1005703))

(check-sat (not b!1087250) (not b!1087260) (not start!95962) b_and!35893 (not b!1087258) (not b!1087255) tp_is_empty!26623 (not b!1087261) (not b_lambda!17269) (not mapNonEmpty!41689) (not b!1087259) (not b!1087262) (not b_next!22621) (not b!1087251))
(check-sat b_and!35893 (not b_next!22621))
