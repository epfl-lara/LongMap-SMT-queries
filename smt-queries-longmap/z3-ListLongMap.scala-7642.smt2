; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96166 () Bool)

(assert start!96166)

(declare-fun b_free!22825 () Bool)

(declare-fun b_next!22825 () Bool)

(assert (=> start!96166 (= b_free!22825 (not b_next!22825))))

(declare-fun tp!80323 () Bool)

(declare-fun b_and!36299 () Bool)

(assert (=> start!96166 (= tp!80323 b_and!36299)))

(declare-fun res!728487 () Bool)

(declare-fun e!623498 () Bool)

(assert (=> start!96166 (=> (not res!728487) (not e!623498))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96166 (= res!728487 (validMask!0 mask!1414))))

(assert (=> start!96166 e!623498))

(assert (=> start!96166 tp!80323))

(assert (=> start!96166 true))

(declare-fun tp_is_empty!26827 () Bool)

(assert (=> start!96166 tp_is_empty!26827))

(declare-datatypes ((array!70490 0))(
  ( (array!70491 (arr!33919 (Array (_ BitVec 32) (_ BitVec 64))) (size!34457 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70490)

(declare-fun array_inv!26190 (array!70490) Bool)

(assert (=> start!96166 (array_inv!26190 _keys!1070)))

(declare-datatypes ((V!40897 0))(
  ( (V!40898 (val!13470 Int)) )
))
(declare-datatypes ((ValueCell!12704 0))(
  ( (ValueCellFull!12704 (v!16090 V!40897)) (EmptyCell!12704) )
))
(declare-datatypes ((array!70492 0))(
  ( (array!70493 (arr!33920 (Array (_ BitVec 32) ValueCell!12704)) (size!34458 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70492)

(declare-fun e!623500 () Bool)

(declare-fun array_inv!26191 (array!70492) Bool)

(assert (=> start!96166 (and (array_inv!26191 _values!874) e!623500)))

(declare-fun b!1091746 () Bool)

(declare-fun res!728484 () Bool)

(assert (=> b!1091746 (=> (not res!728484) (not e!623498))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091746 (= res!728484 (and (= (size!34458 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34457 _keys!1070) (size!34458 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091747 () Bool)

(declare-fun res!728485 () Bool)

(assert (=> b!1091747 (=> (not res!728485) (not e!623498))))

(declare-datatypes ((List!23751 0))(
  ( (Nil!23748) (Cons!23747 (h!24956 (_ BitVec 64)) (t!33625 List!23751)) )
))
(declare-fun arrayNoDuplicates!0 (array!70490 (_ BitVec 32) List!23751) Bool)

(assert (=> b!1091747 (= res!728485 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23748))))

(declare-fun b!1091748 () Bool)

(declare-fun e!623497 () Bool)

(assert (=> b!1091748 (= e!623497 true)))

(declare-datatypes ((tuple2!17188 0))(
  ( (tuple2!17189 (_1!8605 (_ BitVec 64)) (_2!8605 V!40897)) )
))
(declare-datatypes ((List!23752 0))(
  ( (Nil!23749) (Cons!23748 (h!24957 tuple2!17188) (t!33626 List!23752)) )
))
(declare-datatypes ((ListLongMap!15157 0))(
  ( (ListLongMap!15158 (toList!7594 List!23752)) )
))
(declare-fun lt!487639 () ListLongMap!15157)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!487638 () ListLongMap!15157)

(declare-fun -!866 (ListLongMap!15157 (_ BitVec 64)) ListLongMap!15157)

(assert (=> b!1091748 (= (-!866 lt!487639 k0!904) lt!487638)))

(declare-fun lt!487632 () ListLongMap!15157)

(declare-fun minValue!831 () V!40897)

(declare-datatypes ((Unit!35767 0))(
  ( (Unit!35768) )
))
(declare-fun lt!487630 () Unit!35767)

(declare-fun addRemoveCommutativeForDiffKeys!109 (ListLongMap!15157 (_ BitVec 64) V!40897 (_ BitVec 64)) Unit!35767)

(assert (=> b!1091748 (= lt!487630 (addRemoveCommutativeForDiffKeys!109 lt!487632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091749 () Bool)

(declare-fun res!728482 () Bool)

(declare-fun e!623496 () Bool)

(assert (=> b!1091749 (=> (not res!728482) (not e!623496))))

(declare-fun lt!487633 () array!70490)

(assert (=> b!1091749 (= res!728482 (arrayNoDuplicates!0 lt!487633 #b00000000000000000000000000000000 Nil!23748))))

(declare-fun b!1091750 () Bool)

(declare-fun e!623501 () Bool)

(assert (=> b!1091750 (= e!623501 tp_is_empty!26827)))

(declare-fun mapIsEmpty!41995 () Bool)

(declare-fun mapRes!41995 () Bool)

(assert (=> mapIsEmpty!41995 mapRes!41995))

(declare-fun b!1091751 () Bool)

(declare-fun e!623494 () Bool)

(assert (=> b!1091751 (= e!623496 (not e!623494))))

(declare-fun res!728481 () Bool)

(assert (=> b!1091751 (=> res!728481 e!623494)))

(assert (=> b!1091751 (= res!728481 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!487636 () ListLongMap!15157)

(declare-fun zeroValue!831 () V!40897)

(declare-fun getCurrentListMap!4259 (array!70490 array!70492 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) Int) ListLongMap!15157)

(assert (=> b!1091751 (= lt!487636 (getCurrentListMap!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487629 () ListLongMap!15157)

(declare-fun lt!487631 () array!70492)

(assert (=> b!1091751 (= lt!487629 (getCurrentListMap!4259 lt!487633 lt!487631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487637 () ListLongMap!15157)

(declare-fun lt!487640 () ListLongMap!15157)

(assert (=> b!1091751 (and (= lt!487637 lt!487640) (= lt!487640 lt!487637))))

(assert (=> b!1091751 (= lt!487640 (-!866 lt!487632 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!487634 () Unit!35767)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 (array!70490 array!70492 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35767)

(assert (=> b!1091751 (= lt!487634 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4129 (array!70490 array!70492 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) Int) ListLongMap!15157)

(assert (=> b!1091751 (= lt!487637 (getCurrentListMapNoExtraKeys!4129 lt!487633 lt!487631 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2200 (Int (_ BitVec 64)) V!40897)

(assert (=> b!1091751 (= lt!487631 (array!70493 (store (arr!33920 _values!874) i!650 (ValueCellFull!12704 (dynLambda!2200 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34458 _values!874)))))

(assert (=> b!1091751 (= lt!487632 (getCurrentListMapNoExtraKeys!4129 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091751 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487635 () Unit!35767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70490 (_ BitVec 64) (_ BitVec 32)) Unit!35767)

(assert (=> b!1091751 (= lt!487635 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091752 () Bool)

(declare-fun res!728480 () Bool)

(assert (=> b!1091752 (=> (not res!728480) (not e!623498))))

(assert (=> b!1091752 (= res!728480 (= (select (arr!33919 _keys!1070) i!650) k0!904))))

(declare-fun b!1091753 () Bool)

(declare-fun res!728483 () Bool)

(assert (=> b!1091753 (=> (not res!728483) (not e!623498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091753 (= res!728483 (validKeyInArray!0 k0!904))))

(declare-fun b!1091754 () Bool)

(declare-fun e!623499 () Bool)

(assert (=> b!1091754 (= e!623500 (and e!623499 mapRes!41995))))

(declare-fun condMapEmpty!41995 () Bool)

(declare-fun mapDefault!41995 () ValueCell!12704)

(assert (=> b!1091754 (= condMapEmpty!41995 (= (arr!33920 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12704)) mapDefault!41995)))))

(declare-fun b!1091755 () Bool)

(assert (=> b!1091755 (= e!623499 tp_is_empty!26827)))

(declare-fun b!1091756 () Bool)

(assert (=> b!1091756 (= e!623494 e!623497)))

(declare-fun res!728477 () Bool)

(assert (=> b!1091756 (=> res!728477 e!623497)))

(assert (=> b!1091756 (= res!728477 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091756 (= lt!487636 lt!487639)))

(declare-fun lt!487628 () tuple2!17188)

(declare-fun +!3381 (ListLongMap!15157 tuple2!17188) ListLongMap!15157)

(assert (=> b!1091756 (= lt!487639 (+!3381 lt!487632 lt!487628))))

(assert (=> b!1091756 (= lt!487629 lt!487638)))

(assert (=> b!1091756 (= lt!487638 (+!3381 lt!487640 lt!487628))))

(assert (=> b!1091756 (= lt!487629 (+!3381 lt!487637 lt!487628))))

(assert (=> b!1091756 (= lt!487628 (tuple2!17189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091757 () Bool)

(declare-fun res!728479 () Bool)

(assert (=> b!1091757 (=> (not res!728479) (not e!623498))))

(assert (=> b!1091757 (= res!728479 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34457 _keys!1070))))))

(declare-fun mapNonEmpty!41995 () Bool)

(declare-fun tp!80324 () Bool)

(assert (=> mapNonEmpty!41995 (= mapRes!41995 (and tp!80324 e!623501))))

(declare-fun mapKey!41995 () (_ BitVec 32))

(declare-fun mapValue!41995 () ValueCell!12704)

(declare-fun mapRest!41995 () (Array (_ BitVec 32) ValueCell!12704))

(assert (=> mapNonEmpty!41995 (= (arr!33920 _values!874) (store mapRest!41995 mapKey!41995 mapValue!41995))))

(declare-fun b!1091758 () Bool)

(declare-fun res!728478 () Bool)

(assert (=> b!1091758 (=> (not res!728478) (not e!623498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70490 (_ BitVec 32)) Bool)

(assert (=> b!1091758 (= res!728478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091759 () Bool)

(assert (=> b!1091759 (= e!623498 e!623496)))

(declare-fun res!728486 () Bool)

(assert (=> b!1091759 (=> (not res!728486) (not e!623496))))

(assert (=> b!1091759 (= res!728486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487633 mask!1414))))

(assert (=> b!1091759 (= lt!487633 (array!70491 (store (arr!33919 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34457 _keys!1070)))))

(assert (= (and start!96166 res!728487) b!1091746))

(assert (= (and b!1091746 res!728484) b!1091758))

(assert (= (and b!1091758 res!728478) b!1091747))

(assert (= (and b!1091747 res!728485) b!1091757))

(assert (= (and b!1091757 res!728479) b!1091753))

(assert (= (and b!1091753 res!728483) b!1091752))

(assert (= (and b!1091752 res!728480) b!1091759))

(assert (= (and b!1091759 res!728486) b!1091749))

(assert (= (and b!1091749 res!728482) b!1091751))

(assert (= (and b!1091751 (not res!728481)) b!1091756))

(assert (= (and b!1091756 (not res!728477)) b!1091748))

(assert (= (and b!1091754 condMapEmpty!41995) mapIsEmpty!41995))

(assert (= (and b!1091754 (not condMapEmpty!41995)) mapNonEmpty!41995))

(get-info :version)

(assert (= (and mapNonEmpty!41995 ((_ is ValueCellFull!12704) mapValue!41995)) b!1091750))

(assert (= (and b!1091754 ((_ is ValueCellFull!12704) mapDefault!41995)) b!1091755))

(assert (= start!96166 b!1091754))

(declare-fun b_lambda!17473 () Bool)

(assert (=> (not b_lambda!17473) (not b!1091751)))

(declare-fun t!33624 () Bool)

(declare-fun tb!7695 () Bool)

(assert (=> (and start!96166 (= defaultEntry!882 defaultEntry!882) t!33624) tb!7695))

(declare-fun result!15917 () Bool)

(assert (=> tb!7695 (= result!15917 tp_is_empty!26827)))

(assert (=> b!1091751 t!33624))

(declare-fun b_and!36301 () Bool)

(assert (= b_and!36299 (and (=> t!33624 result!15917) b_and!36301)))

(declare-fun m!1010945 () Bool)

(assert (=> b!1091753 m!1010945))

(declare-fun m!1010947 () Bool)

(assert (=> b!1091758 m!1010947))

(declare-fun m!1010949 () Bool)

(assert (=> start!96166 m!1010949))

(declare-fun m!1010951 () Bool)

(assert (=> start!96166 m!1010951))

(declare-fun m!1010953 () Bool)

(assert (=> start!96166 m!1010953))

(declare-fun m!1010955 () Bool)

(assert (=> b!1091747 m!1010955))

(declare-fun m!1010957 () Bool)

(assert (=> b!1091759 m!1010957))

(declare-fun m!1010959 () Bool)

(assert (=> b!1091759 m!1010959))

(declare-fun m!1010961 () Bool)

(assert (=> mapNonEmpty!41995 m!1010961))

(declare-fun m!1010963 () Bool)

(assert (=> b!1091748 m!1010963))

(declare-fun m!1010965 () Bool)

(assert (=> b!1091748 m!1010965))

(declare-fun m!1010967 () Bool)

(assert (=> b!1091751 m!1010967))

(declare-fun m!1010969 () Bool)

(assert (=> b!1091751 m!1010969))

(declare-fun m!1010971 () Bool)

(assert (=> b!1091751 m!1010971))

(declare-fun m!1010973 () Bool)

(assert (=> b!1091751 m!1010973))

(declare-fun m!1010975 () Bool)

(assert (=> b!1091751 m!1010975))

(declare-fun m!1010977 () Bool)

(assert (=> b!1091751 m!1010977))

(declare-fun m!1010979 () Bool)

(assert (=> b!1091751 m!1010979))

(declare-fun m!1010981 () Bool)

(assert (=> b!1091751 m!1010981))

(declare-fun m!1010983 () Bool)

(assert (=> b!1091751 m!1010983))

(declare-fun m!1010985 () Bool)

(assert (=> b!1091751 m!1010985))

(declare-fun m!1010987 () Bool)

(assert (=> b!1091756 m!1010987))

(declare-fun m!1010989 () Bool)

(assert (=> b!1091756 m!1010989))

(declare-fun m!1010991 () Bool)

(assert (=> b!1091756 m!1010991))

(declare-fun m!1010993 () Bool)

(assert (=> b!1091749 m!1010993))

(declare-fun m!1010995 () Bool)

(assert (=> b!1091752 m!1010995))

(check-sat (not b!1091753) (not b!1091759) (not start!96166) (not b_next!22825) (not b!1091756) (not b_lambda!17473) (not b!1091748) tp_is_empty!26827 (not b!1091749) (not mapNonEmpty!41995) (not b!1091751) b_and!36301 (not b!1091747) (not b!1091758))
(check-sat b_and!36301 (not b_next!22825))
