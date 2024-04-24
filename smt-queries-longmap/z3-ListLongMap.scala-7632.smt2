; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96348 () Bool)

(assert start!96348)

(declare-fun b_free!22765 () Bool)

(declare-fun b_next!22765 () Bool)

(assert (=> start!96348 (= b_free!22765 (not b_next!22765))))

(declare-fun tp!80144 () Bool)

(declare-fun b_and!36215 () Bool)

(assert (=> start!96348 (= tp!80144 b_and!36215)))

(declare-fun mapIsEmpty!41905 () Bool)

(declare-fun mapRes!41905 () Bool)

(assert (=> mapIsEmpty!41905 mapRes!41905))

(declare-fun b!1091906 () Bool)

(declare-fun res!728084 () Bool)

(declare-fun e!623723 () Bool)

(assert (=> b!1091906 (=> (not res!728084) (not e!623723))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091906 (= res!728084 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41905 () Bool)

(declare-fun tp!80143 () Bool)

(declare-fun e!623722 () Bool)

(assert (=> mapNonEmpty!41905 (= mapRes!41905 (and tp!80143 e!623722))))

(declare-datatypes ((V!40817 0))(
  ( (V!40818 (val!13440 Int)) )
))
(declare-datatypes ((ValueCell!12674 0))(
  ( (ValueCellFull!12674 (v!16057 V!40817)) (EmptyCell!12674) )
))
(declare-datatypes ((array!70491 0))(
  ( (array!70492 (arr!33913 (Array (_ BitVec 32) ValueCell!12674)) (size!34450 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70491)

(declare-fun mapKey!41905 () (_ BitVec 32))

(declare-fun mapRest!41905 () (Array (_ BitVec 32) ValueCell!12674))

(declare-fun mapValue!41905 () ValueCell!12674)

(assert (=> mapNonEmpty!41905 (= (arr!33913 _values!874) (store mapRest!41905 mapKey!41905 mapValue!41905))))

(declare-fun b!1091907 () Bool)

(declare-fun res!728086 () Bool)

(assert (=> b!1091907 (=> (not res!728086) (not e!623723))))

(declare-datatypes ((array!70493 0))(
  ( (array!70494 (arr!33914 (Array (_ BitVec 32) (_ BitVec 64))) (size!34451 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70493)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70493 (_ BitVec 32)) Bool)

(assert (=> b!1091907 (= res!728086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091908 () Bool)

(declare-fun res!728078 () Bool)

(assert (=> b!1091908 (=> (not res!728078) (not e!623723))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091908 (= res!728078 (and (= (size!34450 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34451 _keys!1070) (size!34450 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091909 () Bool)

(declare-fun e!623728 () Bool)

(declare-fun e!623729 () Bool)

(assert (=> b!1091909 (= e!623728 (and e!623729 mapRes!41905))))

(declare-fun condMapEmpty!41905 () Bool)

(declare-fun mapDefault!41905 () ValueCell!12674)

(assert (=> b!1091909 (= condMapEmpty!41905 (= (arr!33913 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12674)) mapDefault!41905)))))

(declare-fun res!728079 () Bool)

(assert (=> start!96348 (=> (not res!728079) (not e!623723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96348 (= res!728079 (validMask!0 mask!1414))))

(assert (=> start!96348 e!623723))

(assert (=> start!96348 tp!80144))

(assert (=> start!96348 true))

(declare-fun tp_is_empty!26767 () Bool)

(assert (=> start!96348 tp_is_empty!26767))

(declare-fun array_inv!26200 (array!70493) Bool)

(assert (=> start!96348 (array_inv!26200 _keys!1070)))

(declare-fun array_inv!26201 (array!70491) Bool)

(assert (=> start!96348 (and (array_inv!26201 _values!874) e!623728)))

(declare-fun b!1091910 () Bool)

(declare-fun e!623725 () Bool)

(assert (=> b!1091910 (= e!623723 e!623725)))

(declare-fun res!728082 () Bool)

(assert (=> b!1091910 (=> (not res!728082) (not e!623725))))

(declare-fun lt!487184 () array!70493)

(assert (=> b!1091910 (= res!728082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487184 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091910 (= lt!487184 (array!70494 (store (arr!33914 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34451 _keys!1070)))))

(declare-fun b!1091911 () Bool)

(declare-fun res!728081 () Bool)

(assert (=> b!1091911 (=> (not res!728081) (not e!623725))))

(declare-datatypes ((List!23687 0))(
  ( (Nil!23684) (Cons!23683 (h!24901 (_ BitVec 64)) (t!33502 List!23687)) )
))
(declare-fun arrayNoDuplicates!0 (array!70493 (_ BitVec 32) List!23687) Bool)

(assert (=> b!1091911 (= res!728081 (arrayNoDuplicates!0 lt!487184 #b00000000000000000000000000000000 Nil!23684))))

(declare-fun b!1091912 () Bool)

(declare-fun e!623726 () Bool)

(assert (=> b!1091912 (= e!623725 (not e!623726))))

(declare-fun res!728085 () Bool)

(assert (=> b!1091912 (=> res!728085 e!623726)))

(assert (=> b!1091912 (= res!728085 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17096 0))(
  ( (tuple2!17097 (_1!8559 (_ BitVec 64)) (_2!8559 V!40817)) )
))
(declare-datatypes ((List!23688 0))(
  ( (Nil!23685) (Cons!23684 (h!24902 tuple2!17096) (t!33503 List!23688)) )
))
(declare-datatypes ((ListLongMap!15073 0))(
  ( (ListLongMap!15074 (toList!7552 List!23688)) )
))
(declare-fun lt!487185 () ListLongMap!15073)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40817)

(declare-fun zeroValue!831 () V!40817)

(declare-fun getCurrentListMap!4305 (array!70493 array!70491 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) Int) ListLongMap!15073)

(assert (=> b!1091912 (= lt!487185 (getCurrentListMap!4305 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487181 () ListLongMap!15073)

(declare-fun lt!487173 () array!70491)

(assert (=> b!1091912 (= lt!487181 (getCurrentListMap!4305 lt!487184 lt!487173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487176 () ListLongMap!15073)

(declare-fun lt!487177 () ListLongMap!15073)

(assert (=> b!1091912 (and (= lt!487176 lt!487177) (= lt!487177 lt!487176))))

(declare-fun lt!487182 () ListLongMap!15073)

(declare-fun -!859 (ListLongMap!15073 (_ BitVec 64)) ListLongMap!15073)

(assert (=> b!1091912 (= lt!487177 (-!859 lt!487182 k0!904))))

(declare-datatypes ((Unit!35885 0))(
  ( (Unit!35886) )
))
(declare-fun lt!487175 () Unit!35885)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!134 (array!70493 array!70491 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35885)

(assert (=> b!1091912 (= lt!487175 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!134 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4110 (array!70493 array!70491 (_ BitVec 32) (_ BitVec 32) V!40817 V!40817 (_ BitVec 32) Int) ListLongMap!15073)

(assert (=> b!1091912 (= lt!487176 (getCurrentListMapNoExtraKeys!4110 lt!487184 lt!487173 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2231 (Int (_ BitVec 64)) V!40817)

(assert (=> b!1091912 (= lt!487173 (array!70492 (store (arr!33913 _values!874) i!650 (ValueCellFull!12674 (dynLambda!2231 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34450 _values!874)))))

(assert (=> b!1091912 (= lt!487182 (getCurrentListMapNoExtraKeys!4110 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091912 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487178 () Unit!35885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70493 (_ BitVec 64) (_ BitVec 32)) Unit!35885)

(assert (=> b!1091912 (= lt!487178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091913 () Bool)

(assert (=> b!1091913 (= e!623722 tp_is_empty!26767)))

(declare-fun b!1091914 () Bool)

(declare-fun e!623727 () Bool)

(assert (=> b!1091914 (= e!623726 e!623727)))

(declare-fun res!728087 () Bool)

(assert (=> b!1091914 (=> res!728087 e!623727)))

(assert (=> b!1091914 (= res!728087 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487183 () ListLongMap!15073)

(assert (=> b!1091914 (= lt!487185 lt!487183)))

(declare-fun lt!487179 () tuple2!17096)

(declare-fun +!3367 (ListLongMap!15073 tuple2!17096) ListLongMap!15073)

(assert (=> b!1091914 (= lt!487183 (+!3367 lt!487182 lt!487179))))

(declare-fun lt!487174 () ListLongMap!15073)

(assert (=> b!1091914 (= lt!487181 lt!487174)))

(assert (=> b!1091914 (= lt!487174 (+!3367 lt!487177 lt!487179))))

(assert (=> b!1091914 (= lt!487181 (+!3367 lt!487176 lt!487179))))

(assert (=> b!1091914 (= lt!487179 (tuple2!17097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091915 () Bool)

(declare-fun res!728088 () Bool)

(assert (=> b!1091915 (=> (not res!728088) (not e!623723))))

(assert (=> b!1091915 (= res!728088 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34451 _keys!1070))))))

(declare-fun b!1091916 () Bool)

(assert (=> b!1091916 (= e!623729 tp_is_empty!26767)))

(declare-fun b!1091917 () Bool)

(declare-fun res!728083 () Bool)

(assert (=> b!1091917 (=> (not res!728083) (not e!623723))))

(assert (=> b!1091917 (= res!728083 (= (select (arr!33914 _keys!1070) i!650) k0!904))))

(declare-fun b!1091918 () Bool)

(assert (=> b!1091918 (= e!623727 true)))

(assert (=> b!1091918 (= (-!859 lt!487183 k0!904) lt!487174)))

(declare-fun lt!487180 () Unit!35885)

(declare-fun addRemoveCommutativeForDiffKeys!93 (ListLongMap!15073 (_ BitVec 64) V!40817 (_ BitVec 64)) Unit!35885)

(assert (=> b!1091918 (= lt!487180 (addRemoveCommutativeForDiffKeys!93 lt!487182 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091919 () Bool)

(declare-fun res!728080 () Bool)

(assert (=> b!1091919 (=> (not res!728080) (not e!623723))))

(assert (=> b!1091919 (= res!728080 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23684))))

(assert (= (and start!96348 res!728079) b!1091908))

(assert (= (and b!1091908 res!728078) b!1091907))

(assert (= (and b!1091907 res!728086) b!1091919))

(assert (= (and b!1091919 res!728080) b!1091915))

(assert (= (and b!1091915 res!728088) b!1091906))

(assert (= (and b!1091906 res!728084) b!1091917))

(assert (= (and b!1091917 res!728083) b!1091910))

(assert (= (and b!1091910 res!728082) b!1091911))

(assert (= (and b!1091911 res!728081) b!1091912))

(assert (= (and b!1091912 (not res!728085)) b!1091914))

(assert (= (and b!1091914 (not res!728087)) b!1091918))

(assert (= (and b!1091909 condMapEmpty!41905) mapIsEmpty!41905))

(assert (= (and b!1091909 (not condMapEmpty!41905)) mapNonEmpty!41905))

(get-info :version)

(assert (= (and mapNonEmpty!41905 ((_ is ValueCellFull!12674) mapValue!41905)) b!1091913))

(assert (= (and b!1091909 ((_ is ValueCellFull!12674) mapDefault!41905)) b!1091916))

(assert (= start!96348 b!1091909))

(declare-fun b_lambda!17445 () Bool)

(assert (=> (not b_lambda!17445) (not b!1091912)))

(declare-fun t!33501 () Bool)

(declare-fun tb!7635 () Bool)

(assert (=> (and start!96348 (= defaultEntry!882 defaultEntry!882) t!33501) tb!7635))

(declare-fun result!15797 () Bool)

(assert (=> tb!7635 (= result!15797 tp_is_empty!26767)))

(assert (=> b!1091912 t!33501))

(declare-fun b_and!36217 () Bool)

(assert (= b_and!36215 (and (=> t!33501 result!15797) b_and!36217)))

(declare-fun m!1011683 () Bool)

(assert (=> b!1091911 m!1011683))

(declare-fun m!1011685 () Bool)

(assert (=> b!1091906 m!1011685))

(declare-fun m!1011687 () Bool)

(assert (=> b!1091919 m!1011687))

(declare-fun m!1011689 () Bool)

(assert (=> b!1091914 m!1011689))

(declare-fun m!1011691 () Bool)

(assert (=> b!1091914 m!1011691))

(declare-fun m!1011693 () Bool)

(assert (=> b!1091914 m!1011693))

(declare-fun m!1011695 () Bool)

(assert (=> b!1091910 m!1011695))

(declare-fun m!1011697 () Bool)

(assert (=> b!1091910 m!1011697))

(declare-fun m!1011699 () Bool)

(assert (=> mapNonEmpty!41905 m!1011699))

(declare-fun m!1011701 () Bool)

(assert (=> b!1091912 m!1011701))

(declare-fun m!1011703 () Bool)

(assert (=> b!1091912 m!1011703))

(declare-fun m!1011705 () Bool)

(assert (=> b!1091912 m!1011705))

(declare-fun m!1011707 () Bool)

(assert (=> b!1091912 m!1011707))

(declare-fun m!1011709 () Bool)

(assert (=> b!1091912 m!1011709))

(declare-fun m!1011711 () Bool)

(assert (=> b!1091912 m!1011711))

(declare-fun m!1011713 () Bool)

(assert (=> b!1091912 m!1011713))

(declare-fun m!1011715 () Bool)

(assert (=> b!1091912 m!1011715))

(declare-fun m!1011717 () Bool)

(assert (=> b!1091912 m!1011717))

(declare-fun m!1011719 () Bool)

(assert (=> b!1091912 m!1011719))

(declare-fun m!1011721 () Bool)

(assert (=> start!96348 m!1011721))

(declare-fun m!1011723 () Bool)

(assert (=> start!96348 m!1011723))

(declare-fun m!1011725 () Bool)

(assert (=> start!96348 m!1011725))

(declare-fun m!1011727 () Bool)

(assert (=> b!1091918 m!1011727))

(declare-fun m!1011729 () Bool)

(assert (=> b!1091918 m!1011729))

(declare-fun m!1011731 () Bool)

(assert (=> b!1091917 m!1011731))

(declare-fun m!1011733 () Bool)

(assert (=> b!1091907 m!1011733))

(check-sat (not start!96348) (not b!1091918) tp_is_empty!26767 b_and!36217 (not b_next!22765) (not b_lambda!17445) (not b!1091911) (not b!1091914) (not b!1091906) (not mapNonEmpty!41905) (not b!1091907) (not b!1091912) (not b!1091910) (not b!1091919))
(check-sat b_and!36217 (not b_next!22765))
