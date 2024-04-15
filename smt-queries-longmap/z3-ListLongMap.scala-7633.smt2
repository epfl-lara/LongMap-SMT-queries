; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96112 () Bool)

(assert start!96112)

(declare-fun b_free!22771 () Bool)

(declare-fun b_next!22771 () Bool)

(assert (=> start!96112 (= b_free!22771 (not b_next!22771))))

(declare-fun tp!80161 () Bool)

(declare-fun b_and!36191 () Bool)

(assert (=> start!96112 (= tp!80161 b_and!36191)))

(declare-fun b!1090558 () Bool)

(declare-fun res!727588 () Bool)

(declare-fun e!622846 () Bool)

(assert (=> b!1090558 (=> (not res!727588) (not e!622846))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70388 0))(
  ( (array!70389 (arr!33868 (Array (_ BitVec 32) (_ BitVec 64))) (size!34406 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70388)

(declare-datatypes ((V!40825 0))(
  ( (V!40826 (val!13443 Int)) )
))
(declare-datatypes ((ValueCell!12677 0))(
  ( (ValueCellFull!12677 (v!16063 V!40825)) (EmptyCell!12677) )
))
(declare-datatypes ((array!70390 0))(
  ( (array!70391 (arr!33869 (Array (_ BitVec 32) ValueCell!12677)) (size!34407 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70390)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1090558 (= res!727588 (and (= (size!34407 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34406 _keys!1070) (size!34407 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090559 () Bool)

(declare-fun e!622853 () Bool)

(declare-fun tp_is_empty!26773 () Bool)

(assert (=> b!1090559 (= e!622853 tp_is_empty!26773)))

(declare-fun b!1090560 () Bool)

(declare-fun res!727587 () Bool)

(assert (=> b!1090560 (=> (not res!727587) (not e!622846))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090560 (= res!727587 (validKeyInArray!0 k0!904))))

(declare-fun b!1090561 () Bool)

(declare-fun e!622851 () Bool)

(assert (=> b!1090561 (= e!622846 e!622851)))

(declare-fun res!727589 () Bool)

(assert (=> b!1090561 (=> (not res!727589) (not e!622851))))

(declare-fun lt!486585 () array!70388)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70388 (_ BitVec 32)) Bool)

(assert (=> b!1090561 (= res!727589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486585 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090561 (= lt!486585 (array!70389 (store (arr!33868 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34406 _keys!1070)))))

(declare-fun b!1090562 () Bool)

(declare-fun res!727596 () Bool)

(assert (=> b!1090562 (=> (not res!727596) (not e!622846))))

(assert (=> b!1090562 (= res!727596 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34406 _keys!1070))))))

(declare-fun b!1090563 () Bool)

(declare-fun res!727595 () Bool)

(assert (=> b!1090563 (=> (not res!727595) (not e!622846))))

(assert (=> b!1090563 (= res!727595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090564 () Bool)

(declare-fun e!622848 () Bool)

(assert (=> b!1090564 (= e!622851 (not e!622848))))

(declare-fun res!727592 () Bool)

(assert (=> b!1090564 (=> res!727592 e!622848)))

(assert (=> b!1090564 (= res!727592 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40825)

(declare-datatypes ((tuple2!17144 0))(
  ( (tuple2!17145 (_1!8583 (_ BitVec 64)) (_2!8583 V!40825)) )
))
(declare-datatypes ((List!23710 0))(
  ( (Nil!23707) (Cons!23706 (h!24915 tuple2!17144) (t!33530 List!23710)) )
))
(declare-datatypes ((ListLongMap!15113 0))(
  ( (ListLongMap!15114 (toList!7572 List!23710)) )
))
(declare-fun lt!486577 () ListLongMap!15113)

(declare-fun zeroValue!831 () V!40825)

(declare-fun getCurrentListMap!4242 (array!70388 array!70390 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15113)

(assert (=> b!1090564 (= lt!486577 (getCurrentListMap!4242 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486580 () ListLongMap!15113)

(declare-fun lt!486578 () array!70390)

(assert (=> b!1090564 (= lt!486580 (getCurrentListMap!4242 lt!486585 lt!486578 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486579 () ListLongMap!15113)

(declare-fun lt!486584 () ListLongMap!15113)

(assert (=> b!1090564 (and (= lt!486579 lt!486584) (= lt!486584 lt!486579))))

(declare-fun lt!486587 () ListLongMap!15113)

(declare-fun -!846 (ListLongMap!15113 (_ BitVec 64)) ListLongMap!15113)

(assert (=> b!1090564 (= lt!486584 (-!846 lt!486587 k0!904))))

(declare-datatypes ((Unit!35727 0))(
  ( (Unit!35728) )
))
(declare-fun lt!486582 () Unit!35727)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!126 (array!70388 array!70390 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35727)

(assert (=> b!1090564 (= lt!486582 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!126 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4112 (array!70388 array!70390 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15113)

(assert (=> b!1090564 (= lt!486579 (getCurrentListMapNoExtraKeys!4112 lt!486585 lt!486578 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2183 (Int (_ BitVec 64)) V!40825)

(assert (=> b!1090564 (= lt!486578 (array!70391 (store (arr!33869 _values!874) i!650 (ValueCellFull!12677 (dynLambda!2183 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34407 _values!874)))))

(assert (=> b!1090564 (= lt!486587 (getCurrentListMapNoExtraKeys!4112 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090564 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486581 () Unit!35727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70388 (_ BitVec 64) (_ BitVec 32)) Unit!35727)

(assert (=> b!1090564 (= lt!486581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090565 () Bool)

(declare-fun e!622852 () Bool)

(assert (=> b!1090565 (= e!622852 true)))

(declare-fun lt!486575 () ListLongMap!15113)

(declare-fun lt!486576 () ListLongMap!15113)

(assert (=> b!1090565 (= (-!846 lt!486575 k0!904) lt!486576)))

(declare-fun lt!486586 () Unit!35727)

(declare-fun addRemoveCommutativeForDiffKeys!92 (ListLongMap!15113 (_ BitVec 64) V!40825 (_ BitVec 64)) Unit!35727)

(assert (=> b!1090565 (= lt!486586 (addRemoveCommutativeForDiffKeys!92 lt!486587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090566 () Bool)

(declare-fun e!622847 () Bool)

(assert (=> b!1090566 (= e!622847 tp_is_empty!26773)))

(declare-fun mapIsEmpty!41914 () Bool)

(declare-fun mapRes!41914 () Bool)

(assert (=> mapIsEmpty!41914 mapRes!41914))

(declare-fun b!1090567 () Bool)

(declare-fun res!727590 () Bool)

(assert (=> b!1090567 (=> (not res!727590) (not e!622846))))

(declare-datatypes ((List!23711 0))(
  ( (Nil!23708) (Cons!23707 (h!24916 (_ BitVec 64)) (t!33531 List!23711)) )
))
(declare-fun arrayNoDuplicates!0 (array!70388 (_ BitVec 32) List!23711) Bool)

(assert (=> b!1090567 (= res!727590 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23708))))

(declare-fun b!1090568 () Bool)

(declare-fun res!727586 () Bool)

(assert (=> b!1090568 (=> (not res!727586) (not e!622846))))

(assert (=> b!1090568 (= res!727586 (= (select (arr!33868 _keys!1070) i!650) k0!904))))

(declare-fun b!1090569 () Bool)

(declare-fun res!727591 () Bool)

(assert (=> b!1090569 (=> (not res!727591) (not e!622851))))

(assert (=> b!1090569 (= res!727591 (arrayNoDuplicates!0 lt!486585 #b00000000000000000000000000000000 Nil!23708))))

(declare-fun b!1090570 () Bool)

(assert (=> b!1090570 (= e!622848 e!622852)))

(declare-fun res!727593 () Bool)

(assert (=> b!1090570 (=> res!727593 e!622852)))

(assert (=> b!1090570 (= res!727593 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090570 (= lt!486577 lt!486575)))

(declare-fun lt!486583 () tuple2!17144)

(declare-fun +!3362 (ListLongMap!15113 tuple2!17144) ListLongMap!15113)

(assert (=> b!1090570 (= lt!486575 (+!3362 lt!486587 lt!486583))))

(assert (=> b!1090570 (= lt!486580 lt!486576)))

(assert (=> b!1090570 (= lt!486576 (+!3362 lt!486584 lt!486583))))

(assert (=> b!1090570 (= lt!486580 (+!3362 lt!486579 lt!486583))))

(assert (=> b!1090570 (= lt!486583 (tuple2!17145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090571 () Bool)

(declare-fun e!622849 () Bool)

(assert (=> b!1090571 (= e!622849 (and e!622853 mapRes!41914))))

(declare-fun condMapEmpty!41914 () Bool)

(declare-fun mapDefault!41914 () ValueCell!12677)

(assert (=> b!1090571 (= condMapEmpty!41914 (= (arr!33869 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12677)) mapDefault!41914)))))

(declare-fun res!727594 () Bool)

(assert (=> start!96112 (=> (not res!727594) (not e!622846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96112 (= res!727594 (validMask!0 mask!1414))))

(assert (=> start!96112 e!622846))

(assert (=> start!96112 tp!80161))

(assert (=> start!96112 true))

(assert (=> start!96112 tp_is_empty!26773))

(declare-fun array_inv!26152 (array!70388) Bool)

(assert (=> start!96112 (array_inv!26152 _keys!1070)))

(declare-fun array_inv!26153 (array!70390) Bool)

(assert (=> start!96112 (and (array_inv!26153 _values!874) e!622849)))

(declare-fun mapNonEmpty!41914 () Bool)

(declare-fun tp!80162 () Bool)

(assert (=> mapNonEmpty!41914 (= mapRes!41914 (and tp!80162 e!622847))))

(declare-fun mapKey!41914 () (_ BitVec 32))

(declare-fun mapValue!41914 () ValueCell!12677)

(declare-fun mapRest!41914 () (Array (_ BitVec 32) ValueCell!12677))

(assert (=> mapNonEmpty!41914 (= (arr!33869 _values!874) (store mapRest!41914 mapKey!41914 mapValue!41914))))

(assert (= (and start!96112 res!727594) b!1090558))

(assert (= (and b!1090558 res!727588) b!1090563))

(assert (= (and b!1090563 res!727595) b!1090567))

(assert (= (and b!1090567 res!727590) b!1090562))

(assert (= (and b!1090562 res!727596) b!1090560))

(assert (= (and b!1090560 res!727587) b!1090568))

(assert (= (and b!1090568 res!727586) b!1090561))

(assert (= (and b!1090561 res!727589) b!1090569))

(assert (= (and b!1090569 res!727591) b!1090564))

(assert (= (and b!1090564 (not res!727592)) b!1090570))

(assert (= (and b!1090570 (not res!727593)) b!1090565))

(assert (= (and b!1090571 condMapEmpty!41914) mapIsEmpty!41914))

(assert (= (and b!1090571 (not condMapEmpty!41914)) mapNonEmpty!41914))

(get-info :version)

(assert (= (and mapNonEmpty!41914 ((_ is ValueCellFull!12677) mapValue!41914)) b!1090566))

(assert (= (and b!1090571 ((_ is ValueCellFull!12677) mapDefault!41914)) b!1090559))

(assert (= start!96112 b!1090571))

(declare-fun b_lambda!17419 () Bool)

(assert (=> (not b_lambda!17419) (not b!1090564)))

(declare-fun t!33529 () Bool)

(declare-fun tb!7641 () Bool)

(assert (=> (and start!96112 (= defaultEntry!882 defaultEntry!882) t!33529) tb!7641))

(declare-fun result!15809 () Bool)

(assert (=> tb!7641 (= result!15809 tp_is_empty!26773)))

(assert (=> b!1090564 t!33529))

(declare-fun b_and!36193 () Bool)

(assert (= b_and!36191 (and (=> t!33529 result!15809) b_and!36193)))

(declare-fun m!1009541 () Bool)

(assert (=> b!1090561 m!1009541))

(declare-fun m!1009543 () Bool)

(assert (=> b!1090561 m!1009543))

(declare-fun m!1009545 () Bool)

(assert (=> b!1090568 m!1009545))

(declare-fun m!1009547 () Bool)

(assert (=> b!1090570 m!1009547))

(declare-fun m!1009549 () Bool)

(assert (=> b!1090570 m!1009549))

(declare-fun m!1009551 () Bool)

(assert (=> b!1090570 m!1009551))

(declare-fun m!1009553 () Bool)

(assert (=> b!1090564 m!1009553))

(declare-fun m!1009555 () Bool)

(assert (=> b!1090564 m!1009555))

(declare-fun m!1009557 () Bool)

(assert (=> b!1090564 m!1009557))

(declare-fun m!1009559 () Bool)

(assert (=> b!1090564 m!1009559))

(declare-fun m!1009561 () Bool)

(assert (=> b!1090564 m!1009561))

(declare-fun m!1009563 () Bool)

(assert (=> b!1090564 m!1009563))

(declare-fun m!1009565 () Bool)

(assert (=> b!1090564 m!1009565))

(declare-fun m!1009567 () Bool)

(assert (=> b!1090564 m!1009567))

(declare-fun m!1009569 () Bool)

(assert (=> b!1090564 m!1009569))

(declare-fun m!1009571 () Bool)

(assert (=> b!1090564 m!1009571))

(declare-fun m!1009573 () Bool)

(assert (=> b!1090569 m!1009573))

(declare-fun m!1009575 () Bool)

(assert (=> b!1090560 m!1009575))

(declare-fun m!1009577 () Bool)

(assert (=> start!96112 m!1009577))

(declare-fun m!1009579 () Bool)

(assert (=> start!96112 m!1009579))

(declare-fun m!1009581 () Bool)

(assert (=> start!96112 m!1009581))

(declare-fun m!1009583 () Bool)

(assert (=> b!1090565 m!1009583))

(declare-fun m!1009585 () Bool)

(assert (=> b!1090565 m!1009585))

(declare-fun m!1009587 () Bool)

(assert (=> mapNonEmpty!41914 m!1009587))

(declare-fun m!1009589 () Bool)

(assert (=> b!1090563 m!1009589))

(declare-fun m!1009591 () Bool)

(assert (=> b!1090567 m!1009591))

(check-sat (not b!1090570) (not b!1090565) (not b!1090560) (not b_lambda!17419) (not b!1090567) tp_is_empty!26773 (not b!1090561) (not mapNonEmpty!41914) (not b!1090563) (not b_next!22771) (not b!1090569) (not start!96112) (not b!1090564) b_and!36193)
(check-sat b_and!36193 (not b_next!22771))
