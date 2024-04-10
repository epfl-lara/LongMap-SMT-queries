; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96126 () Bool)

(assert start!96126)

(declare-fun b_free!22779 () Bool)

(declare-fun b_next!22779 () Bool)

(assert (=> start!96126 (= b_free!22779 (not b_next!22779))))

(declare-fun tp!80186 () Bool)

(declare-fun b_and!36233 () Bool)

(assert (=> start!96126 (= tp!80186 b_and!36233)))

(declare-fun mapNonEmpty!41926 () Bool)

(declare-fun mapRes!41926 () Bool)

(declare-fun tp!80185 () Bool)

(declare-fun e!623038 () Bool)

(assert (=> mapNonEmpty!41926 (= mapRes!41926 (and tp!80185 e!623038))))

(declare-datatypes ((V!40835 0))(
  ( (V!40836 (val!13447 Int)) )
))
(declare-datatypes ((ValueCell!12681 0))(
  ( (ValueCellFull!12681 (v!16068 V!40835)) (EmptyCell!12681) )
))
(declare-datatypes ((array!70483 0))(
  ( (array!70484 (arr!33915 (Array (_ BitVec 32) ValueCell!12681)) (size!34451 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70483)

(declare-fun mapValue!41926 () ValueCell!12681)

(declare-fun mapRest!41926 () (Array (_ BitVec 32) ValueCell!12681))

(declare-fun mapKey!41926 () (_ BitVec 32))

(assert (=> mapNonEmpty!41926 (= (arr!33915 _values!874) (store mapRest!41926 mapKey!41926 mapValue!41926))))

(declare-fun b!1090887 () Bool)

(declare-fun e!623039 () Bool)

(declare-fun e!623040 () Bool)

(assert (=> b!1090887 (= e!623039 e!623040)))

(declare-fun res!727793 () Bool)

(assert (=> b!1090887 (=> res!727793 e!623040)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1090887 (= res!727793 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17098 0))(
  ( (tuple2!17099 (_1!8560 (_ BitVec 64)) (_2!8560 V!40835)) )
))
(declare-datatypes ((List!23685 0))(
  ( (Nil!23682) (Cons!23681 (h!24890 tuple2!17098) (t!33522 List!23685)) )
))
(declare-datatypes ((ListLongMap!15067 0))(
  ( (ListLongMap!15068 (toList!7549 List!23685)) )
))
(declare-fun lt!486934 () ListLongMap!15067)

(declare-fun lt!486935 () ListLongMap!15067)

(assert (=> b!1090887 (= lt!486934 lt!486935)))

(declare-fun lt!486932 () ListLongMap!15067)

(declare-fun lt!486937 () tuple2!17098)

(declare-fun +!3336 (ListLongMap!15067 tuple2!17098) ListLongMap!15067)

(assert (=> b!1090887 (= lt!486935 (+!3336 lt!486932 lt!486937))))

(declare-fun lt!486936 () ListLongMap!15067)

(declare-fun lt!486940 () ListLongMap!15067)

(assert (=> b!1090887 (= lt!486936 lt!486940)))

(declare-fun lt!486939 () ListLongMap!15067)

(assert (=> b!1090887 (= lt!486940 (+!3336 lt!486939 lt!486937))))

(declare-fun lt!486943 () ListLongMap!15067)

(assert (=> b!1090887 (= lt!486936 (+!3336 lt!486943 lt!486937))))

(declare-fun minValue!831 () V!40835)

(assert (=> b!1090887 (= lt!486937 (tuple2!17099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090888 () Bool)

(declare-fun tp_is_empty!26781 () Bool)

(assert (=> b!1090888 (= e!623038 tp_is_empty!26781)))

(declare-fun b!1090889 () Bool)

(declare-fun res!727796 () Bool)

(declare-fun e!623041 () Bool)

(assert (=> b!1090889 (=> (not res!727796) (not e!623041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090889 (= res!727796 (validKeyInArray!0 k0!904))))

(declare-fun b!1090890 () Bool)

(declare-fun res!727791 () Bool)

(assert (=> b!1090890 (=> (not res!727791) (not e!623041))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70485 0))(
  ( (array!70486 (arr!33916 (Array (_ BitVec 32) (_ BitVec 64))) (size!34452 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70485)

(assert (=> b!1090890 (= res!727791 (and (= (size!34451 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34452 _keys!1070) (size!34451 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090891 () Bool)

(declare-fun e!623042 () Bool)

(declare-fun e!623035 () Bool)

(assert (=> b!1090891 (= e!623042 (and e!623035 mapRes!41926))))

(declare-fun condMapEmpty!41926 () Bool)

(declare-fun mapDefault!41926 () ValueCell!12681)

(assert (=> b!1090891 (= condMapEmpty!41926 (= (arr!33915 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12681)) mapDefault!41926)))))

(declare-fun b!1090892 () Bool)

(declare-fun res!727792 () Bool)

(assert (=> b!1090892 (=> (not res!727792) (not e!623041))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090892 (= res!727792 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34452 _keys!1070))))))

(declare-fun b!1090893 () Bool)

(declare-fun res!727787 () Bool)

(declare-fun e!623036 () Bool)

(assert (=> b!1090893 (=> (not res!727787) (not e!623036))))

(declare-fun lt!486941 () array!70485)

(declare-datatypes ((List!23686 0))(
  ( (Nil!23683) (Cons!23682 (h!24891 (_ BitVec 64)) (t!33523 List!23686)) )
))
(declare-fun arrayNoDuplicates!0 (array!70485 (_ BitVec 32) List!23686) Bool)

(assert (=> b!1090893 (= res!727787 (arrayNoDuplicates!0 lt!486941 #b00000000000000000000000000000000 Nil!23683))))

(declare-fun res!727789 () Bool)

(assert (=> start!96126 (=> (not res!727789) (not e!623041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96126 (= res!727789 (validMask!0 mask!1414))))

(assert (=> start!96126 e!623041))

(assert (=> start!96126 tp!80186))

(assert (=> start!96126 true))

(assert (=> start!96126 tp_is_empty!26781))

(declare-fun array_inv!26152 (array!70485) Bool)

(assert (=> start!96126 (array_inv!26152 _keys!1070)))

(declare-fun array_inv!26153 (array!70483) Bool)

(assert (=> start!96126 (and (array_inv!26153 _values!874) e!623042)))

(declare-fun b!1090894 () Bool)

(assert (=> b!1090894 (= e!623040 true)))

(declare-fun -!871 (ListLongMap!15067 (_ BitVec 64)) ListLongMap!15067)

(assert (=> b!1090894 (= (-!871 lt!486935 k0!904) lt!486940)))

(declare-datatypes ((Unit!35908 0))(
  ( (Unit!35909) )
))
(declare-fun lt!486938 () Unit!35908)

(declare-fun addRemoveCommutativeForDiffKeys!95 (ListLongMap!15067 (_ BitVec 64) V!40835 (_ BitVec 64)) Unit!35908)

(assert (=> b!1090894 (= lt!486938 (addRemoveCommutativeForDiffKeys!95 lt!486932 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41926 () Bool)

(assert (=> mapIsEmpty!41926 mapRes!41926))

(declare-fun b!1090895 () Bool)

(declare-fun res!727795 () Bool)

(assert (=> b!1090895 (=> (not res!727795) (not e!623041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70485 (_ BitVec 32)) Bool)

(assert (=> b!1090895 (= res!727795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090896 () Bool)

(assert (=> b!1090896 (= e!623036 (not e!623039))))

(declare-fun res!727797 () Bool)

(assert (=> b!1090896 (=> res!727797 e!623039)))

(assert (=> b!1090896 (= res!727797 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40835)

(declare-fun getCurrentListMap!4313 (array!70485 array!70483 (_ BitVec 32) (_ BitVec 32) V!40835 V!40835 (_ BitVec 32) Int) ListLongMap!15067)

(assert (=> b!1090896 (= lt!486934 (getCurrentListMap!4313 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486933 () array!70483)

(assert (=> b!1090896 (= lt!486936 (getCurrentListMap!4313 lt!486941 lt!486933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090896 (and (= lt!486943 lt!486939) (= lt!486939 lt!486943))))

(assert (=> b!1090896 (= lt!486939 (-!871 lt!486932 k0!904))))

(declare-fun lt!486942 () Unit!35908)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!132 (array!70485 array!70483 (_ BitVec 32) (_ BitVec 32) V!40835 V!40835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35908)

(assert (=> b!1090896 (= lt!486942 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!132 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4073 (array!70485 array!70483 (_ BitVec 32) (_ BitVec 32) V!40835 V!40835 (_ BitVec 32) Int) ListLongMap!15067)

(assert (=> b!1090896 (= lt!486943 (getCurrentListMapNoExtraKeys!4073 lt!486941 lt!486933 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2210 (Int (_ BitVec 64)) V!40835)

(assert (=> b!1090896 (= lt!486933 (array!70484 (store (arr!33915 _values!874) i!650 (ValueCellFull!12681 (dynLambda!2210 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34451 _values!874)))))

(assert (=> b!1090896 (= lt!486932 (getCurrentListMapNoExtraKeys!4073 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090896 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486931 () Unit!35908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70485 (_ BitVec 64) (_ BitVec 32)) Unit!35908)

(assert (=> b!1090896 (= lt!486931 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090897 () Bool)

(declare-fun res!727794 () Bool)

(assert (=> b!1090897 (=> (not res!727794) (not e!623041))))

(assert (=> b!1090897 (= res!727794 (= (select (arr!33916 _keys!1070) i!650) k0!904))))

(declare-fun b!1090898 () Bool)

(assert (=> b!1090898 (= e!623041 e!623036)))

(declare-fun res!727788 () Bool)

(assert (=> b!1090898 (=> (not res!727788) (not e!623036))))

(assert (=> b!1090898 (= res!727788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486941 mask!1414))))

(assert (=> b!1090898 (= lt!486941 (array!70486 (store (arr!33916 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34452 _keys!1070)))))

(declare-fun b!1090899 () Bool)

(declare-fun res!727790 () Bool)

(assert (=> b!1090899 (=> (not res!727790) (not e!623041))))

(assert (=> b!1090899 (= res!727790 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23683))))

(declare-fun b!1090900 () Bool)

(assert (=> b!1090900 (= e!623035 tp_is_empty!26781)))

(assert (= (and start!96126 res!727789) b!1090890))

(assert (= (and b!1090890 res!727791) b!1090895))

(assert (= (and b!1090895 res!727795) b!1090899))

(assert (= (and b!1090899 res!727790) b!1090892))

(assert (= (and b!1090892 res!727792) b!1090889))

(assert (= (and b!1090889 res!727796) b!1090897))

(assert (= (and b!1090897 res!727794) b!1090898))

(assert (= (and b!1090898 res!727788) b!1090893))

(assert (= (and b!1090893 res!727787) b!1090896))

(assert (= (and b!1090896 (not res!727797)) b!1090887))

(assert (= (and b!1090887 (not res!727793)) b!1090894))

(assert (= (and b!1090891 condMapEmpty!41926) mapIsEmpty!41926))

(assert (= (and b!1090891 (not condMapEmpty!41926)) mapNonEmpty!41926))

(get-info :version)

(assert (= (and mapNonEmpty!41926 ((_ is ValueCellFull!12681) mapValue!41926)) b!1090888))

(assert (= (and b!1090891 ((_ is ValueCellFull!12681) mapDefault!41926)) b!1090900))

(assert (= start!96126 b!1090891))

(declare-fun b_lambda!17449 () Bool)

(assert (=> (not b_lambda!17449) (not b!1090896)))

(declare-fun t!33521 () Bool)

(declare-fun tb!7657 () Bool)

(assert (=> (and start!96126 (= defaultEntry!882 defaultEntry!882) t!33521) tb!7657))

(declare-fun result!15833 () Bool)

(assert (=> tb!7657 (= result!15833 tp_is_empty!26781)))

(assert (=> b!1090896 t!33521))

(declare-fun b_and!36235 () Bool)

(assert (= b_and!36233 (and (=> t!33521 result!15833) b_and!36235)))

(declare-fun m!1010375 () Bool)

(assert (=> b!1090896 m!1010375))

(declare-fun m!1010377 () Bool)

(assert (=> b!1090896 m!1010377))

(declare-fun m!1010379 () Bool)

(assert (=> b!1090896 m!1010379))

(declare-fun m!1010381 () Bool)

(assert (=> b!1090896 m!1010381))

(declare-fun m!1010383 () Bool)

(assert (=> b!1090896 m!1010383))

(declare-fun m!1010385 () Bool)

(assert (=> b!1090896 m!1010385))

(declare-fun m!1010387 () Bool)

(assert (=> b!1090896 m!1010387))

(declare-fun m!1010389 () Bool)

(assert (=> b!1090896 m!1010389))

(declare-fun m!1010391 () Bool)

(assert (=> b!1090896 m!1010391))

(declare-fun m!1010393 () Bool)

(assert (=> b!1090896 m!1010393))

(declare-fun m!1010395 () Bool)

(assert (=> mapNonEmpty!41926 m!1010395))

(declare-fun m!1010397 () Bool)

(assert (=> b!1090895 m!1010397))

(declare-fun m!1010399 () Bool)

(assert (=> b!1090897 m!1010399))

(declare-fun m!1010401 () Bool)

(assert (=> b!1090893 m!1010401))

(declare-fun m!1010403 () Bool)

(assert (=> b!1090898 m!1010403))

(declare-fun m!1010405 () Bool)

(assert (=> b!1090898 m!1010405))

(declare-fun m!1010407 () Bool)

(assert (=> b!1090899 m!1010407))

(declare-fun m!1010409 () Bool)

(assert (=> b!1090887 m!1010409))

(declare-fun m!1010411 () Bool)

(assert (=> b!1090887 m!1010411))

(declare-fun m!1010413 () Bool)

(assert (=> b!1090887 m!1010413))

(declare-fun m!1010415 () Bool)

(assert (=> b!1090889 m!1010415))

(declare-fun m!1010417 () Bool)

(assert (=> start!96126 m!1010417))

(declare-fun m!1010419 () Bool)

(assert (=> start!96126 m!1010419))

(declare-fun m!1010421 () Bool)

(assert (=> start!96126 m!1010421))

(declare-fun m!1010423 () Bool)

(assert (=> b!1090894 m!1010423))

(declare-fun m!1010425 () Bool)

(assert (=> b!1090894 m!1010425))

(check-sat (not b!1090894) (not b!1090889) (not start!96126) tp_is_empty!26781 (not mapNonEmpty!41926) b_and!36235 (not b_next!22779) (not b!1090895) (not b!1090896) (not b!1090899) (not b!1090887) (not b_lambda!17449) (not b!1090893) (not b!1090898))
(check-sat b_and!36235 (not b_next!22779))
