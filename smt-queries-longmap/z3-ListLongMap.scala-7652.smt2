; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96468 () Bool)

(assert start!96468)

(declare-fun b_free!22885 () Bool)

(declare-fun b_next!22885 () Bool)

(assert (=> start!96468 (= b_free!22885 (not b_next!22885))))

(declare-fun tp!80504 () Bool)

(declare-fun b_and!36455 () Bool)

(assert (=> start!96468 (= tp!80504 b_and!36455)))

(declare-fun b!1094416 () Bool)

(declare-fun e!625035 () Bool)

(declare-fun tp_is_empty!26887 () Bool)

(assert (=> b!1094416 (= e!625035 tp_is_empty!26887)))

(declare-fun mapNonEmpty!42085 () Bool)

(declare-fun mapRes!42085 () Bool)

(declare-fun tp!80503 () Bool)

(assert (=> mapNonEmpty!42085 (= mapRes!42085 (and tp!80503 e!625035))))

(declare-datatypes ((V!40977 0))(
  ( (V!40978 (val!13500 Int)) )
))
(declare-datatypes ((ValueCell!12734 0))(
  ( (ValueCellFull!12734 (v!16117 V!40977)) (EmptyCell!12734) )
))
(declare-datatypes ((array!70719 0))(
  ( (array!70720 (arr!34027 (Array (_ BitVec 32) ValueCell!12734)) (size!34564 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70719)

(declare-fun mapKey!42085 () (_ BitVec 32))

(declare-fun mapRest!42085 () (Array (_ BitVec 32) ValueCell!12734))

(declare-fun mapValue!42085 () ValueCell!12734)

(assert (=> mapNonEmpty!42085 (= (arr!34027 _values!874) (store mapRest!42085 mapKey!42085 mapValue!42085))))

(declare-fun b!1094417 () Bool)

(declare-fun res!729931 () Bool)

(declare-fun e!625033 () Bool)

(assert (=> b!1094417 (=> (not res!729931) (not e!625033))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094417 (= res!729931 (validKeyInArray!0 k0!904))))

(declare-fun b!1094418 () Bool)

(declare-fun e!625032 () Bool)

(assert (=> b!1094418 (= e!625032 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40977)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17178 0))(
  ( (tuple2!17179 (_1!8600 (_ BitVec 64)) (_2!8600 V!40977)) )
))
(declare-datatypes ((List!23771 0))(
  ( (Nil!23768) (Cons!23767 (h!24985 tuple2!17178) (t!33706 List!23771)) )
))
(declare-datatypes ((ListLongMap!15155 0))(
  ( (ListLongMap!15156 (toList!7593 List!23771)) )
))
(declare-fun lt!489261 () ListLongMap!15155)

(declare-fun zeroValue!831 () V!40977)

(declare-datatypes ((array!70721 0))(
  ( (array!70722 (arr!34028 (Array (_ BitVec 32) (_ BitVec 64))) (size!34565 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70721)

(declare-fun getCurrentListMap!4341 (array!70721 array!70719 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1094418 (= lt!489261 (getCurrentListMap!4341 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489254 () ListLongMap!15155)

(declare-fun lt!489255 () array!70721)

(declare-fun lt!489260 () array!70719)

(assert (=> b!1094418 (= lt!489254 (getCurrentListMap!4341 lt!489255 lt!489260 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489256 () ListLongMap!15155)

(declare-fun lt!489257 () ListLongMap!15155)

(assert (=> b!1094418 (and (= lt!489256 lt!489257) (= lt!489257 lt!489256))))

(declare-fun lt!489253 () ListLongMap!15155)

(declare-fun -!898 (ListLongMap!15155 (_ BitVec 64)) ListLongMap!15155)

(assert (=> b!1094418 (= lt!489257 (-!898 lt!489253 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35963 0))(
  ( (Unit!35964) )
))
(declare-fun lt!489258 () Unit!35963)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 (array!70721 array!70719 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35963)

(assert (=> b!1094418 (= lt!489258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4146 (array!70721 array!70719 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) Int) ListLongMap!15155)

(assert (=> b!1094418 (= lt!489256 (getCurrentListMapNoExtraKeys!4146 lt!489255 lt!489260 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2267 (Int (_ BitVec 64)) V!40977)

(assert (=> b!1094418 (= lt!489260 (array!70720 (store (arr!34027 _values!874) i!650 (ValueCellFull!12734 (dynLambda!2267 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34564 _values!874)))))

(assert (=> b!1094418 (= lt!489253 (getCurrentListMapNoExtraKeys!4146 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094418 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489259 () Unit!35963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70721 (_ BitVec 64) (_ BitVec 32)) Unit!35963)

(assert (=> b!1094418 (= lt!489259 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094419 () Bool)

(declare-fun res!729928 () Bool)

(assert (=> b!1094419 (=> (not res!729928) (not e!625033))))

(declare-datatypes ((List!23772 0))(
  ( (Nil!23769) (Cons!23768 (h!24986 (_ BitVec 64)) (t!33707 List!23772)) )
))
(declare-fun arrayNoDuplicates!0 (array!70721 (_ BitVec 32) List!23772) Bool)

(assert (=> b!1094419 (= res!729928 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23769))))

(declare-fun b!1094420 () Bool)

(declare-fun res!729934 () Bool)

(assert (=> b!1094420 (=> (not res!729934) (not e!625032))))

(assert (=> b!1094420 (= res!729934 (arrayNoDuplicates!0 lt!489255 #b00000000000000000000000000000000 Nil!23769))))

(declare-fun b!1094421 () Bool)

(declare-fun res!729933 () Bool)

(assert (=> b!1094421 (=> (not res!729933) (not e!625033))))

(assert (=> b!1094421 (= res!729933 (= (select (arr!34028 _keys!1070) i!650) k0!904))))

(declare-fun b!1094422 () Bool)

(declare-fun e!625037 () Bool)

(declare-fun e!625034 () Bool)

(assert (=> b!1094422 (= e!625037 (and e!625034 mapRes!42085))))

(declare-fun condMapEmpty!42085 () Bool)

(declare-fun mapDefault!42085 () ValueCell!12734)

(assert (=> b!1094422 (= condMapEmpty!42085 (= (arr!34027 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12734)) mapDefault!42085)))))

(declare-fun b!1094423 () Bool)

(assert (=> b!1094423 (= e!625034 tp_is_empty!26887)))

(declare-fun b!1094424 () Bool)

(declare-fun res!729932 () Bool)

(assert (=> b!1094424 (=> (not res!729932) (not e!625033))))

(assert (=> b!1094424 (= res!729932 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34565 _keys!1070))))))

(declare-fun b!1094425 () Bool)

(assert (=> b!1094425 (= e!625033 e!625032)))

(declare-fun res!729936 () Bool)

(assert (=> b!1094425 (=> (not res!729936) (not e!625032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70721 (_ BitVec 32)) Bool)

(assert (=> b!1094425 (= res!729936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489255 mask!1414))))

(assert (=> b!1094425 (= lt!489255 (array!70722 (store (arr!34028 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34565 _keys!1070)))))

(declare-fun mapIsEmpty!42085 () Bool)

(assert (=> mapIsEmpty!42085 mapRes!42085))

(declare-fun b!1094426 () Bool)

(declare-fun res!729929 () Bool)

(assert (=> b!1094426 (=> (not res!729929) (not e!625033))))

(assert (=> b!1094426 (= res!729929 (and (= (size!34564 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34565 _keys!1070) (size!34564 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!729930 () Bool)

(assert (=> start!96468 (=> (not res!729930) (not e!625033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96468 (= res!729930 (validMask!0 mask!1414))))

(assert (=> start!96468 e!625033))

(assert (=> start!96468 tp!80504))

(assert (=> start!96468 true))

(assert (=> start!96468 tp_is_empty!26887))

(declare-fun array_inv!26266 (array!70721) Bool)

(assert (=> start!96468 (array_inv!26266 _keys!1070)))

(declare-fun array_inv!26267 (array!70719) Bool)

(assert (=> start!96468 (and (array_inv!26267 _values!874) e!625037)))

(declare-fun b!1094427 () Bool)

(declare-fun res!729935 () Bool)

(assert (=> b!1094427 (=> (not res!729935) (not e!625033))))

(assert (=> b!1094427 (= res!729935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96468 res!729930) b!1094426))

(assert (= (and b!1094426 res!729929) b!1094427))

(assert (= (and b!1094427 res!729935) b!1094419))

(assert (= (and b!1094419 res!729928) b!1094424))

(assert (= (and b!1094424 res!729932) b!1094417))

(assert (= (and b!1094417 res!729931) b!1094421))

(assert (= (and b!1094421 res!729933) b!1094425))

(assert (= (and b!1094425 res!729936) b!1094420))

(assert (= (and b!1094420 res!729934) b!1094418))

(assert (= (and b!1094422 condMapEmpty!42085) mapIsEmpty!42085))

(assert (= (and b!1094422 (not condMapEmpty!42085)) mapNonEmpty!42085))

(get-info :version)

(assert (= (and mapNonEmpty!42085 ((_ is ValueCellFull!12734) mapValue!42085)) b!1094416))

(assert (= (and b!1094422 ((_ is ValueCellFull!12734) mapDefault!42085)) b!1094423))

(assert (= start!96468 b!1094422))

(declare-fun b_lambda!17565 () Bool)

(assert (=> (not b_lambda!17565) (not b!1094418)))

(declare-fun t!33705 () Bool)

(declare-fun tb!7755 () Bool)

(assert (=> (and start!96468 (= defaultEntry!882 defaultEntry!882) t!33705) tb!7755))

(declare-fun result!16037 () Bool)

(assert (=> tb!7755 (= result!16037 tp_is_empty!26887)))

(assert (=> b!1094418 t!33705))

(declare-fun b_and!36457 () Bool)

(assert (= b_and!36455 (and (=> t!33705 result!16037) b_and!36457)))

(declare-fun m!1014593 () Bool)

(assert (=> b!1094417 m!1014593))

(declare-fun m!1014595 () Bool)

(assert (=> b!1094420 m!1014595))

(declare-fun m!1014597 () Bool)

(assert (=> b!1094427 m!1014597))

(declare-fun m!1014599 () Bool)

(assert (=> start!96468 m!1014599))

(declare-fun m!1014601 () Bool)

(assert (=> start!96468 m!1014601))

(declare-fun m!1014603 () Bool)

(assert (=> start!96468 m!1014603))

(declare-fun m!1014605 () Bool)

(assert (=> b!1094425 m!1014605))

(declare-fun m!1014607 () Bool)

(assert (=> b!1094425 m!1014607))

(declare-fun m!1014609 () Bool)

(assert (=> b!1094418 m!1014609))

(declare-fun m!1014611 () Bool)

(assert (=> b!1094418 m!1014611))

(declare-fun m!1014613 () Bool)

(assert (=> b!1094418 m!1014613))

(declare-fun m!1014615 () Bool)

(assert (=> b!1094418 m!1014615))

(declare-fun m!1014617 () Bool)

(assert (=> b!1094418 m!1014617))

(declare-fun m!1014619 () Bool)

(assert (=> b!1094418 m!1014619))

(declare-fun m!1014621 () Bool)

(assert (=> b!1094418 m!1014621))

(declare-fun m!1014623 () Bool)

(assert (=> b!1094418 m!1014623))

(declare-fun m!1014625 () Bool)

(assert (=> b!1094418 m!1014625))

(declare-fun m!1014627 () Bool)

(assert (=> b!1094418 m!1014627))

(declare-fun m!1014629 () Bool)

(assert (=> mapNonEmpty!42085 m!1014629))

(declare-fun m!1014631 () Bool)

(assert (=> b!1094419 m!1014631))

(declare-fun m!1014633 () Bool)

(assert (=> b!1094421 m!1014633))

(check-sat (not b_next!22885) (not b!1094417) (not mapNonEmpty!42085) (not start!96468) (not b!1094425) tp_is_empty!26887 (not b!1094418) (not b!1094427) b_and!36457 (not b_lambda!17565) (not b!1094420) (not b!1094419))
(check-sat b_and!36457 (not b_next!22885))
