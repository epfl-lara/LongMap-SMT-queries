; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96330 () Bool)

(assert start!96330)

(declare-fun b_free!22747 () Bool)

(declare-fun b_next!22747 () Bool)

(assert (=> start!96330 (= b_free!22747 (not b_next!22747))))

(declare-fun tp!80089 () Bool)

(declare-fun b_and!36179 () Bool)

(assert (=> start!96330 (= tp!80089 b_and!36179)))

(declare-fun b!1091510 () Bool)

(declare-fun e!623510 () Bool)

(declare-fun tp_is_empty!26749 () Bool)

(assert (=> b!1091510 (= e!623510 tp_is_empty!26749)))

(declare-fun b!1091511 () Bool)

(declare-fun e!623507 () Bool)

(assert (=> b!1091511 (= e!623507 tp_is_empty!26749)))

(declare-fun b!1091512 () Bool)

(declare-fun e!623508 () Bool)

(declare-fun e!623509 () Bool)

(assert (=> b!1091512 (= e!623508 (not e!623509))))

(declare-fun res!727790 () Bool)

(assert (=> b!1091512 (=> res!727790 e!623509)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091512 (= res!727790 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!40793 0))(
  ( (V!40794 (val!13431 Int)) )
))
(declare-fun minValue!831 () V!40793)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17082 0))(
  ( (tuple2!17083 (_1!8552 (_ BitVec 64)) (_2!8552 V!40793)) )
))
(declare-datatypes ((List!23672 0))(
  ( (Nil!23669) (Cons!23668 (h!24886 tuple2!17082) (t!33469 List!23672)) )
))
(declare-datatypes ((ListLongMap!15059 0))(
  ( (ListLongMap!15060 (toList!7545 List!23672)) )
))
(declare-fun lt!486823 () ListLongMap!15059)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((array!70457 0))(
  ( (array!70458 (arr!33896 (Array (_ BitVec 32) (_ BitVec 64))) (size!34433 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70457)

(declare-datatypes ((ValueCell!12665 0))(
  ( (ValueCellFull!12665 (v!16048 V!40793)) (EmptyCell!12665) )
))
(declare-datatypes ((array!70459 0))(
  ( (array!70460 (arr!33897 (Array (_ BitVec 32) ValueCell!12665)) (size!34434 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70459)

(declare-fun zeroValue!831 () V!40793)

(declare-fun getCurrentListMap!4298 (array!70457 array!70459 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) Int) ListLongMap!15059)

(assert (=> b!1091512 (= lt!486823 (getCurrentListMap!4298 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486833 () ListLongMap!15059)

(declare-fun lt!486826 () array!70457)

(declare-fun lt!486822 () array!70459)

(assert (=> b!1091512 (= lt!486833 (getCurrentListMap!4298 lt!486826 lt!486822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486824 () ListLongMap!15059)

(declare-fun lt!486829 () ListLongMap!15059)

(assert (=> b!1091512 (and (= lt!486824 lt!486829) (= lt!486829 lt!486824))))

(declare-fun lt!486828 () ListLongMap!15059)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!852 (ListLongMap!15059 (_ BitVec 64)) ListLongMap!15059)

(assert (=> b!1091512 (= lt!486829 (-!852 lt!486828 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35871 0))(
  ( (Unit!35872) )
))
(declare-fun lt!486825 () Unit!35871)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!127 (array!70457 array!70459 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35871)

(assert (=> b!1091512 (= lt!486825 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!127 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4103 (array!70457 array!70459 (_ BitVec 32) (_ BitVec 32) V!40793 V!40793 (_ BitVec 32) Int) ListLongMap!15059)

(assert (=> b!1091512 (= lt!486824 (getCurrentListMapNoExtraKeys!4103 lt!486826 lt!486822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2224 (Int (_ BitVec 64)) V!40793)

(assert (=> b!1091512 (= lt!486822 (array!70460 (store (arr!33897 _values!874) i!650 (ValueCellFull!12665 (dynLambda!2224 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34434 _values!874)))))

(assert (=> b!1091512 (= lt!486828 (getCurrentListMapNoExtraKeys!4103 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091512 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486831 () Unit!35871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70457 (_ BitVec 64) (_ BitVec 32)) Unit!35871)

(assert (=> b!1091512 (= lt!486831 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091513 () Bool)

(declare-fun res!727785 () Bool)

(declare-fun e!623511 () Bool)

(assert (=> b!1091513 (=> (not res!727785) (not e!623511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70457 (_ BitVec 32)) Bool)

(assert (=> b!1091513 (= res!727785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!727786 () Bool)

(assert (=> start!96330 (=> (not res!727786) (not e!623511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96330 (= res!727786 (validMask!0 mask!1414))))

(assert (=> start!96330 e!623511))

(assert (=> start!96330 tp!80089))

(assert (=> start!96330 true))

(assert (=> start!96330 tp_is_empty!26749))

(declare-fun array_inv!26190 (array!70457) Bool)

(assert (=> start!96330 (array_inv!26190 _keys!1070)))

(declare-fun e!623506 () Bool)

(declare-fun array_inv!26191 (array!70459) Bool)

(assert (=> start!96330 (and (array_inv!26191 _values!874) e!623506)))

(declare-fun b!1091514 () Bool)

(declare-fun res!727791 () Bool)

(assert (=> b!1091514 (=> (not res!727791) (not e!623511))))

(assert (=> b!1091514 (= res!727791 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34433 _keys!1070))))))

(declare-fun mapNonEmpty!41878 () Bool)

(declare-fun mapRes!41878 () Bool)

(declare-fun tp!80090 () Bool)

(assert (=> mapNonEmpty!41878 (= mapRes!41878 (and tp!80090 e!623510))))

(declare-fun mapValue!41878 () ValueCell!12665)

(declare-fun mapKey!41878 () (_ BitVec 32))

(declare-fun mapRest!41878 () (Array (_ BitVec 32) ValueCell!12665))

(assert (=> mapNonEmpty!41878 (= (arr!33897 _values!874) (store mapRest!41878 mapKey!41878 mapValue!41878))))

(declare-fun b!1091515 () Bool)

(declare-fun e!623512 () Bool)

(assert (=> b!1091515 (= e!623512 true)))

(declare-fun lt!486834 () ListLongMap!15059)

(declare-fun lt!486830 () ListLongMap!15059)

(assert (=> b!1091515 (= (-!852 lt!486834 k0!904) lt!486830)))

(declare-fun lt!486832 () Unit!35871)

(declare-fun addRemoveCommutativeForDiffKeys!87 (ListLongMap!15059 (_ BitVec 64) V!40793 (_ BitVec 64)) Unit!35871)

(assert (=> b!1091515 (= lt!486832 (addRemoveCommutativeForDiffKeys!87 lt!486828 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41878 () Bool)

(assert (=> mapIsEmpty!41878 mapRes!41878))

(declare-fun b!1091516 () Bool)

(declare-fun res!727788 () Bool)

(assert (=> b!1091516 (=> (not res!727788) (not e!623511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091516 (= res!727788 (validKeyInArray!0 k0!904))))

(declare-fun b!1091517 () Bool)

(assert (=> b!1091517 (= e!623511 e!623508)))

(declare-fun res!727787 () Bool)

(assert (=> b!1091517 (=> (not res!727787) (not e!623508))))

(assert (=> b!1091517 (= res!727787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486826 mask!1414))))

(assert (=> b!1091517 (= lt!486826 (array!70458 (store (arr!33896 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34433 _keys!1070)))))

(declare-fun b!1091518 () Bool)

(assert (=> b!1091518 (= e!623506 (and e!623507 mapRes!41878))))

(declare-fun condMapEmpty!41878 () Bool)

(declare-fun mapDefault!41878 () ValueCell!12665)

(assert (=> b!1091518 (= condMapEmpty!41878 (= (arr!33897 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12665)) mapDefault!41878)))))

(declare-fun b!1091519 () Bool)

(declare-fun res!727789 () Bool)

(assert (=> b!1091519 (=> (not res!727789) (not e!623511))))

(declare-datatypes ((List!23673 0))(
  ( (Nil!23670) (Cons!23669 (h!24887 (_ BitVec 64)) (t!33470 List!23673)) )
))
(declare-fun arrayNoDuplicates!0 (array!70457 (_ BitVec 32) List!23673) Bool)

(assert (=> b!1091519 (= res!727789 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23670))))

(declare-fun b!1091520 () Bool)

(declare-fun res!727784 () Bool)

(assert (=> b!1091520 (=> (not res!727784) (not e!623511))))

(assert (=> b!1091520 (= res!727784 (= (select (arr!33896 _keys!1070) i!650) k0!904))))

(declare-fun b!1091521 () Bool)

(assert (=> b!1091521 (= e!623509 e!623512)))

(declare-fun res!727782 () Bool)

(assert (=> b!1091521 (=> res!727782 e!623512)))

(assert (=> b!1091521 (= res!727782 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091521 (= lt!486823 lt!486834)))

(declare-fun lt!486827 () tuple2!17082)

(declare-fun +!3362 (ListLongMap!15059 tuple2!17082) ListLongMap!15059)

(assert (=> b!1091521 (= lt!486834 (+!3362 lt!486828 lt!486827))))

(assert (=> b!1091521 (= lt!486833 lt!486830)))

(assert (=> b!1091521 (= lt!486830 (+!3362 lt!486829 lt!486827))))

(assert (=> b!1091521 (= lt!486833 (+!3362 lt!486824 lt!486827))))

(assert (=> b!1091521 (= lt!486827 (tuple2!17083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091522 () Bool)

(declare-fun res!727781 () Bool)

(assert (=> b!1091522 (=> (not res!727781) (not e!623511))))

(assert (=> b!1091522 (= res!727781 (and (= (size!34434 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34433 _keys!1070) (size!34434 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091523 () Bool)

(declare-fun res!727783 () Bool)

(assert (=> b!1091523 (=> (not res!727783) (not e!623508))))

(assert (=> b!1091523 (= res!727783 (arrayNoDuplicates!0 lt!486826 #b00000000000000000000000000000000 Nil!23670))))

(assert (= (and start!96330 res!727786) b!1091522))

(assert (= (and b!1091522 res!727781) b!1091513))

(assert (= (and b!1091513 res!727785) b!1091519))

(assert (= (and b!1091519 res!727789) b!1091514))

(assert (= (and b!1091514 res!727791) b!1091516))

(assert (= (and b!1091516 res!727788) b!1091520))

(assert (= (and b!1091520 res!727784) b!1091517))

(assert (= (and b!1091517 res!727787) b!1091523))

(assert (= (and b!1091523 res!727783) b!1091512))

(assert (= (and b!1091512 (not res!727790)) b!1091521))

(assert (= (and b!1091521 (not res!727782)) b!1091515))

(assert (= (and b!1091518 condMapEmpty!41878) mapIsEmpty!41878))

(assert (= (and b!1091518 (not condMapEmpty!41878)) mapNonEmpty!41878))

(get-info :version)

(assert (= (and mapNonEmpty!41878 ((_ is ValueCellFull!12665) mapValue!41878)) b!1091510))

(assert (= (and b!1091518 ((_ is ValueCellFull!12665) mapDefault!41878)) b!1091511))

(assert (= start!96330 b!1091518))

(declare-fun b_lambda!17427 () Bool)

(assert (=> (not b_lambda!17427) (not b!1091512)))

(declare-fun t!33468 () Bool)

(declare-fun tb!7617 () Bool)

(assert (=> (and start!96330 (= defaultEntry!882 defaultEntry!882) t!33468) tb!7617))

(declare-fun result!15761 () Bool)

(assert (=> tb!7617 (= result!15761 tp_is_empty!26749)))

(assert (=> b!1091512 t!33468))

(declare-fun b_and!36181 () Bool)

(assert (= b_and!36179 (and (=> t!33468 result!15761) b_and!36181)))

(declare-fun m!1011215 () Bool)

(assert (=> b!1091517 m!1011215))

(declare-fun m!1011217 () Bool)

(assert (=> b!1091517 m!1011217))

(declare-fun m!1011219 () Bool)

(assert (=> b!1091515 m!1011219))

(declare-fun m!1011221 () Bool)

(assert (=> b!1091515 m!1011221))

(declare-fun m!1011223 () Bool)

(assert (=> start!96330 m!1011223))

(declare-fun m!1011225 () Bool)

(assert (=> start!96330 m!1011225))

(declare-fun m!1011227 () Bool)

(assert (=> start!96330 m!1011227))

(declare-fun m!1011229 () Bool)

(assert (=> b!1091512 m!1011229))

(declare-fun m!1011231 () Bool)

(assert (=> b!1091512 m!1011231))

(declare-fun m!1011233 () Bool)

(assert (=> b!1091512 m!1011233))

(declare-fun m!1011235 () Bool)

(assert (=> b!1091512 m!1011235))

(declare-fun m!1011237 () Bool)

(assert (=> b!1091512 m!1011237))

(declare-fun m!1011239 () Bool)

(assert (=> b!1091512 m!1011239))

(declare-fun m!1011241 () Bool)

(assert (=> b!1091512 m!1011241))

(declare-fun m!1011243 () Bool)

(assert (=> b!1091512 m!1011243))

(declare-fun m!1011245 () Bool)

(assert (=> b!1091512 m!1011245))

(declare-fun m!1011247 () Bool)

(assert (=> b!1091512 m!1011247))

(declare-fun m!1011249 () Bool)

(assert (=> b!1091519 m!1011249))

(declare-fun m!1011251 () Bool)

(assert (=> b!1091513 m!1011251))

(declare-fun m!1011253 () Bool)

(assert (=> b!1091516 m!1011253))

(declare-fun m!1011255 () Bool)

(assert (=> mapNonEmpty!41878 m!1011255))

(declare-fun m!1011257 () Bool)

(assert (=> b!1091521 m!1011257))

(declare-fun m!1011259 () Bool)

(assert (=> b!1091521 m!1011259))

(declare-fun m!1011261 () Bool)

(assert (=> b!1091521 m!1011261))

(declare-fun m!1011263 () Bool)

(assert (=> b!1091523 m!1011263))

(declare-fun m!1011265 () Bool)

(assert (=> b!1091520 m!1011265))

(check-sat (not b!1091523) (not b!1091516) (not b_next!22747) tp_is_empty!26749 (not b!1091519) (not b!1091513) (not b!1091515) (not b!1091512) b_and!36181 (not mapNonEmpty!41878) (not start!96330) (not b_lambda!17427) (not b!1091517) (not b!1091521))
(check-sat b_and!36181 (not b_next!22747))
