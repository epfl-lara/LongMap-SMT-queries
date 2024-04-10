; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96108 () Bool)

(assert start!96108)

(declare-fun b_free!22761 () Bool)

(declare-fun b_next!22761 () Bool)

(assert (=> start!96108 (= b_free!22761 (not b_next!22761))))

(declare-fun tp!80132 () Bool)

(declare-fun b_and!36197 () Bool)

(assert (=> start!96108 (= tp!80132 b_and!36197)))

(declare-fun b!1090491 () Bool)

(declare-fun e!622826 () Bool)

(declare-fun e!622822 () Bool)

(assert (=> b!1090491 (= e!622826 e!622822)))

(declare-fun res!727491 () Bool)

(assert (=> b!1090491 (=> res!727491 e!622822)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1090491 (= res!727491 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40811 0))(
  ( (V!40812 (val!13438 Int)) )
))
(declare-datatypes ((tuple2!17082 0))(
  ( (tuple2!17083 (_1!8552 (_ BitVec 64)) (_2!8552 V!40811)) )
))
(declare-datatypes ((List!23670 0))(
  ( (Nil!23667) (Cons!23666 (h!24875 tuple2!17082) (t!33489 List!23670)) )
))
(declare-datatypes ((ListLongMap!15051 0))(
  ( (ListLongMap!15052 (toList!7541 List!23670)) )
))
(declare-fun lt!486586 () ListLongMap!15051)

(declare-fun lt!486583 () ListLongMap!15051)

(assert (=> b!1090491 (= lt!486586 lt!486583)))

(declare-fun lt!486582 () ListLongMap!15051)

(declare-fun lt!486580 () tuple2!17082)

(declare-fun +!3330 (ListLongMap!15051 tuple2!17082) ListLongMap!15051)

(assert (=> b!1090491 (= lt!486583 (+!3330 lt!486582 lt!486580))))

(declare-fun lt!486589 () ListLongMap!15051)

(declare-fun lt!486588 () ListLongMap!15051)

(assert (=> b!1090491 (= lt!486589 lt!486588)))

(declare-fun lt!486591 () ListLongMap!15051)

(assert (=> b!1090491 (= lt!486588 (+!3330 lt!486591 lt!486580))))

(declare-fun lt!486592 () ListLongMap!15051)

(assert (=> b!1090491 (= lt!486589 (+!3330 lt!486592 lt!486580))))

(declare-fun minValue!831 () V!40811)

(assert (=> b!1090491 (= lt!486580 (tuple2!17083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090492 () Bool)

(declare-fun res!727494 () Bool)

(declare-fun e!622825 () Bool)

(assert (=> b!1090492 (=> (not res!727494) (not e!622825))))

(declare-datatypes ((array!70449 0))(
  ( (array!70450 (arr!33898 (Array (_ BitVec 32) (_ BitVec 64))) (size!34434 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70449)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70449 (_ BitVec 32)) Bool)

(assert (=> b!1090492 (= res!727494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41899 () Bool)

(declare-fun mapRes!41899 () Bool)

(assert (=> mapIsEmpty!41899 mapRes!41899))

(declare-fun b!1090493 () Bool)

(declare-fun res!727492 () Bool)

(assert (=> b!1090493 (=> (not res!727492) (not e!622825))))

(declare-datatypes ((List!23671 0))(
  ( (Nil!23668) (Cons!23667 (h!24876 (_ BitVec 64)) (t!33490 List!23671)) )
))
(declare-fun arrayNoDuplicates!0 (array!70449 (_ BitVec 32) List!23671) Bool)

(assert (=> b!1090493 (= res!727492 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23668))))

(declare-fun b!1090494 () Bool)

(declare-fun e!622824 () Bool)

(declare-fun tp_is_empty!26763 () Bool)

(assert (=> b!1090494 (= e!622824 tp_is_empty!26763)))

(declare-fun b!1090496 () Bool)

(declare-fun res!727495 () Bool)

(declare-fun e!622823 () Bool)

(assert (=> b!1090496 (=> (not res!727495) (not e!622823))))

(declare-fun lt!486581 () array!70449)

(assert (=> b!1090496 (= res!727495 (arrayNoDuplicates!0 lt!486581 #b00000000000000000000000000000000 Nil!23668))))

(declare-fun b!1090497 () Bool)

(declare-fun e!622821 () Bool)

(assert (=> b!1090497 (= e!622821 tp_is_empty!26763)))

(declare-fun b!1090498 () Bool)

(assert (=> b!1090498 (= e!622822 true)))

(declare-fun -!864 (ListLongMap!15051 (_ BitVec 64)) ListLongMap!15051)

(assert (=> b!1090498 (= (-!864 lt!486583 k0!904) lt!486588)))

(declare-datatypes ((Unit!35894 0))(
  ( (Unit!35895) )
))
(declare-fun lt!486587 () Unit!35894)

(declare-fun addRemoveCommutativeForDiffKeys!88 (ListLongMap!15051 (_ BitVec 64) V!40811 (_ BitVec 64)) Unit!35894)

(assert (=> b!1090498 (= lt!486587 (addRemoveCommutativeForDiffKeys!88 lt!486582 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090499 () Bool)

(declare-fun res!727500 () Bool)

(assert (=> b!1090499 (=> (not res!727500) (not e!622825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090499 (= res!727500 (validKeyInArray!0 k0!904))))

(declare-fun b!1090500 () Bool)

(declare-fun e!622819 () Bool)

(assert (=> b!1090500 (= e!622819 (and e!622821 mapRes!41899))))

(declare-fun condMapEmpty!41899 () Bool)

(declare-datatypes ((ValueCell!12672 0))(
  ( (ValueCellFull!12672 (v!16059 V!40811)) (EmptyCell!12672) )
))
(declare-datatypes ((array!70451 0))(
  ( (array!70452 (arr!33899 (Array (_ BitVec 32) ValueCell!12672)) (size!34435 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70451)

(declare-fun mapDefault!41899 () ValueCell!12672)

(assert (=> b!1090500 (= condMapEmpty!41899 (= (arr!33899 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12672)) mapDefault!41899)))))

(declare-fun b!1090501 () Bool)

(assert (=> b!1090501 (= e!622823 (not e!622826))))

(declare-fun res!727490 () Bool)

(assert (=> b!1090501 (=> res!727490 e!622826)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090501 (= res!727490 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40811)

(declare-fun getCurrentListMap!4307 (array!70449 array!70451 (_ BitVec 32) (_ BitVec 32) V!40811 V!40811 (_ BitVec 32) Int) ListLongMap!15051)

(assert (=> b!1090501 (= lt!486586 (getCurrentListMap!4307 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486590 () array!70451)

(assert (=> b!1090501 (= lt!486589 (getCurrentListMap!4307 lt!486581 lt!486590 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090501 (and (= lt!486592 lt!486591) (= lt!486591 lt!486592))))

(assert (=> b!1090501 (= lt!486591 (-!864 lt!486582 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!486585 () Unit!35894)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!126 (array!70449 array!70451 (_ BitVec 32) (_ BitVec 32) V!40811 V!40811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35894)

(assert (=> b!1090501 (= lt!486585 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!126 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4067 (array!70449 array!70451 (_ BitVec 32) (_ BitVec 32) V!40811 V!40811 (_ BitVec 32) Int) ListLongMap!15051)

(assert (=> b!1090501 (= lt!486592 (getCurrentListMapNoExtraKeys!4067 lt!486581 lt!486590 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2204 (Int (_ BitVec 64)) V!40811)

(assert (=> b!1090501 (= lt!486590 (array!70452 (store (arr!33899 _values!874) i!650 (ValueCellFull!12672 (dynLambda!2204 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34435 _values!874)))))

(assert (=> b!1090501 (= lt!486582 (getCurrentListMapNoExtraKeys!4067 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090501 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486584 () Unit!35894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70449 (_ BitVec 64) (_ BitVec 32)) Unit!35894)

(assert (=> b!1090501 (= lt!486584 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090502 () Bool)

(declare-fun res!727493 () Bool)

(assert (=> b!1090502 (=> (not res!727493) (not e!622825))))

(assert (=> b!1090502 (= res!727493 (and (= (size!34435 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34434 _keys!1070) (size!34435 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090503 () Bool)

(declare-fun res!727498 () Bool)

(assert (=> b!1090503 (=> (not res!727498) (not e!622825))))

(assert (=> b!1090503 (= res!727498 (= (select (arr!33898 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41899 () Bool)

(declare-fun tp!80131 () Bool)

(assert (=> mapNonEmpty!41899 (= mapRes!41899 (and tp!80131 e!622824))))

(declare-fun mapValue!41899 () ValueCell!12672)

(declare-fun mapKey!41899 () (_ BitVec 32))

(declare-fun mapRest!41899 () (Array (_ BitVec 32) ValueCell!12672))

(assert (=> mapNonEmpty!41899 (= (arr!33899 _values!874) (store mapRest!41899 mapKey!41899 mapValue!41899))))

(declare-fun b!1090504 () Bool)

(declare-fun res!727497 () Bool)

(assert (=> b!1090504 (=> (not res!727497) (not e!622825))))

(assert (=> b!1090504 (= res!727497 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34434 _keys!1070))))))

(declare-fun res!727496 () Bool)

(assert (=> start!96108 (=> (not res!727496) (not e!622825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96108 (= res!727496 (validMask!0 mask!1414))))

(assert (=> start!96108 e!622825))

(assert (=> start!96108 tp!80132))

(assert (=> start!96108 true))

(assert (=> start!96108 tp_is_empty!26763))

(declare-fun array_inv!26140 (array!70449) Bool)

(assert (=> start!96108 (array_inv!26140 _keys!1070)))

(declare-fun array_inv!26141 (array!70451) Bool)

(assert (=> start!96108 (and (array_inv!26141 _values!874) e!622819)))

(declare-fun b!1090495 () Bool)

(assert (=> b!1090495 (= e!622825 e!622823)))

(declare-fun res!727499 () Bool)

(assert (=> b!1090495 (=> (not res!727499) (not e!622823))))

(assert (=> b!1090495 (= res!727499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486581 mask!1414))))

(assert (=> b!1090495 (= lt!486581 (array!70450 (store (arr!33898 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34434 _keys!1070)))))

(assert (= (and start!96108 res!727496) b!1090502))

(assert (= (and b!1090502 res!727493) b!1090492))

(assert (= (and b!1090492 res!727494) b!1090493))

(assert (= (and b!1090493 res!727492) b!1090504))

(assert (= (and b!1090504 res!727497) b!1090499))

(assert (= (and b!1090499 res!727500) b!1090503))

(assert (= (and b!1090503 res!727498) b!1090495))

(assert (= (and b!1090495 res!727499) b!1090496))

(assert (= (and b!1090496 res!727495) b!1090501))

(assert (= (and b!1090501 (not res!727490)) b!1090491))

(assert (= (and b!1090491 (not res!727491)) b!1090498))

(assert (= (and b!1090500 condMapEmpty!41899) mapIsEmpty!41899))

(assert (= (and b!1090500 (not condMapEmpty!41899)) mapNonEmpty!41899))

(get-info :version)

(assert (= (and mapNonEmpty!41899 ((_ is ValueCellFull!12672) mapValue!41899)) b!1090494))

(assert (= (and b!1090500 ((_ is ValueCellFull!12672) mapDefault!41899)) b!1090497))

(assert (= start!96108 b!1090500))

(declare-fun b_lambda!17431 () Bool)

(assert (=> (not b_lambda!17431) (not b!1090501)))

(declare-fun t!33488 () Bool)

(declare-fun tb!7639 () Bool)

(assert (=> (and start!96108 (= defaultEntry!882 defaultEntry!882) t!33488) tb!7639))

(declare-fun result!15797 () Bool)

(assert (=> tb!7639 (= result!15797 tp_is_empty!26763)))

(assert (=> b!1090501 t!33488))

(declare-fun b_and!36199 () Bool)

(assert (= b_and!36197 (and (=> t!33488 result!15797) b_and!36199)))

(declare-fun m!1009907 () Bool)

(assert (=> b!1090493 m!1009907))

(declare-fun m!1009909 () Bool)

(assert (=> mapNonEmpty!41899 m!1009909))

(declare-fun m!1009911 () Bool)

(assert (=> b!1090499 m!1009911))

(declare-fun m!1009913 () Bool)

(assert (=> b!1090503 m!1009913))

(declare-fun m!1009915 () Bool)

(assert (=> b!1090501 m!1009915))

(declare-fun m!1009917 () Bool)

(assert (=> b!1090501 m!1009917))

(declare-fun m!1009919 () Bool)

(assert (=> b!1090501 m!1009919))

(declare-fun m!1009921 () Bool)

(assert (=> b!1090501 m!1009921))

(declare-fun m!1009923 () Bool)

(assert (=> b!1090501 m!1009923))

(declare-fun m!1009925 () Bool)

(assert (=> b!1090501 m!1009925))

(declare-fun m!1009927 () Bool)

(assert (=> b!1090501 m!1009927))

(declare-fun m!1009929 () Bool)

(assert (=> b!1090501 m!1009929))

(declare-fun m!1009931 () Bool)

(assert (=> b!1090501 m!1009931))

(declare-fun m!1009933 () Bool)

(assert (=> b!1090501 m!1009933))

(declare-fun m!1009935 () Bool)

(assert (=> b!1090492 m!1009935))

(declare-fun m!1009937 () Bool)

(assert (=> b!1090498 m!1009937))

(declare-fun m!1009939 () Bool)

(assert (=> b!1090498 m!1009939))

(declare-fun m!1009941 () Bool)

(assert (=> b!1090491 m!1009941))

(declare-fun m!1009943 () Bool)

(assert (=> b!1090491 m!1009943))

(declare-fun m!1009945 () Bool)

(assert (=> b!1090491 m!1009945))

(declare-fun m!1009947 () Bool)

(assert (=> start!96108 m!1009947))

(declare-fun m!1009949 () Bool)

(assert (=> start!96108 m!1009949))

(declare-fun m!1009951 () Bool)

(assert (=> start!96108 m!1009951))

(declare-fun m!1009953 () Bool)

(assert (=> b!1090496 m!1009953))

(declare-fun m!1009955 () Bool)

(assert (=> b!1090495 m!1009955))

(declare-fun m!1009957 () Bool)

(assert (=> b!1090495 m!1009957))

(check-sat (not b!1090492) (not b!1090496) (not b!1090493) (not b!1090491) (not start!96108) (not b!1090501) tp_is_empty!26763 (not b!1090495) (not b!1090499) (not b!1090498) (not b_lambda!17431) (not b_next!22761) (not mapNonEmpty!41899) b_and!36199)
(check-sat b_and!36199 (not b_next!22761))
