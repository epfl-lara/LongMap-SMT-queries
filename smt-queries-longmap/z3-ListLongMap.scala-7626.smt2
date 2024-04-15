; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96070 () Bool)

(assert start!96070)

(declare-fun b_free!22729 () Bool)

(declare-fun b_next!22729 () Bool)

(assert (=> start!96070 (= b_free!22729 (not b_next!22729))))

(declare-fun tp!80035 () Bool)

(declare-fun b_and!36107 () Bool)

(assert (=> start!96070 (= tp!80035 b_and!36107)))

(declare-fun b!1089627 () Bool)

(declare-fun res!726892 () Bool)

(declare-fun e!622345 () Bool)

(assert (=> b!1089627 (=> (not res!726892) (not e!622345))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089627 (= res!726892 (validKeyInArray!0 k0!904))))

(declare-fun b!1089628 () Bool)

(declare-fun res!726893 () Bool)

(assert (=> b!1089628 (=> (not res!726893) (not e!622345))))

(declare-datatypes ((array!70306 0))(
  ( (array!70307 (arr!33827 (Array (_ BitVec 32) (_ BitVec 64))) (size!34365 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70306)

(declare-datatypes ((List!23673 0))(
  ( (Nil!23670) (Cons!23669 (h!24878 (_ BitVec 64)) (t!33451 List!23673)) )
))
(declare-fun arrayNoDuplicates!0 (array!70306 (_ BitVec 32) List!23673) Bool)

(assert (=> b!1089628 (= res!726893 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23670))))

(declare-fun b!1089629 () Bool)

(declare-fun res!726886 () Bool)

(assert (=> b!1089629 (=> (not res!726886) (not e!622345))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70306 (_ BitVec 32)) Bool)

(assert (=> b!1089629 (= res!726886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089630 () Bool)

(declare-fun res!726889 () Bool)

(declare-fun e!622346 () Bool)

(assert (=> b!1089630 (=> (not res!726889) (not e!622346))))

(declare-datatypes ((V!40769 0))(
  ( (V!40770 (val!13422 Int)) )
))
(declare-datatypes ((tuple2!17106 0))(
  ( (tuple2!17107 (_1!8564 (_ BitVec 64)) (_2!8564 V!40769)) )
))
(declare-datatypes ((List!23674 0))(
  ( (Nil!23671) (Cons!23670 (h!24879 tuple2!17106) (t!33452 List!23674)) )
))
(declare-datatypes ((ListLongMap!15075 0))(
  ( (ListLongMap!15076 (toList!7553 List!23674)) )
))
(declare-fun lt!485781 () ListLongMap!15075)

(declare-fun lt!485780 () tuple2!17106)

(declare-fun lt!485778 () ListLongMap!15075)

(declare-fun +!3350 (ListLongMap!15075 tuple2!17106) ListLongMap!15075)

(assert (=> b!1089630 (= res!726889 (= lt!485778 (+!3350 lt!485781 lt!485780)))))

(declare-fun b!1089631 () Bool)

(declare-fun e!622343 () Bool)

(assert (=> b!1089631 (= e!622345 e!622343)))

(declare-fun res!726888 () Bool)

(assert (=> b!1089631 (=> (not res!726888) (not e!622343))))

(declare-fun lt!485779 () array!70306)

(assert (=> b!1089631 (= res!726888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485779 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089631 (= lt!485779 (array!70307 (store (arr!33827 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34365 _keys!1070)))))

(declare-fun mapIsEmpty!41851 () Bool)

(declare-fun mapRes!41851 () Bool)

(assert (=> mapIsEmpty!41851 mapRes!41851))

(declare-fun b!1089632 () Bool)

(declare-fun e!622349 () Bool)

(assert (=> b!1089632 (= e!622343 (not e!622349))))

(declare-fun res!726895 () Bool)

(assert (=> b!1089632 (=> res!726895 e!622349)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089632 (= res!726895 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40769)

(declare-fun lt!485777 () ListLongMap!15075)

(declare-datatypes ((ValueCell!12656 0))(
  ( (ValueCellFull!12656 (v!16042 V!40769)) (EmptyCell!12656) )
))
(declare-datatypes ((array!70308 0))(
  ( (array!70309 (arr!33828 (Array (_ BitVec 32) ValueCell!12656)) (size!34366 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70308)

(declare-fun zeroValue!831 () V!40769)

(declare-fun getCurrentListMap!4228 (array!70306 array!70308 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) Int) ListLongMap!15075)

(assert (=> b!1089632 (= lt!485777 (getCurrentListMap!4228 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485782 () array!70308)

(assert (=> b!1089632 (= lt!485778 (getCurrentListMap!4228 lt!485779 lt!485782 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485786 () ListLongMap!15075)

(assert (=> b!1089632 (and (= lt!485786 lt!485781) (= lt!485781 lt!485786))))

(declare-fun lt!485783 () ListLongMap!15075)

(declare-fun -!829 (ListLongMap!15075 (_ BitVec 64)) ListLongMap!15075)

(assert (=> b!1089632 (= lt!485781 (-!829 lt!485783 k0!904))))

(declare-datatypes ((Unit!35693 0))(
  ( (Unit!35694) )
))
(declare-fun lt!485785 () Unit!35693)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!112 (array!70306 array!70308 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35693)

(assert (=> b!1089632 (= lt!485785 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!112 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4098 (array!70306 array!70308 (_ BitVec 32) (_ BitVec 32) V!40769 V!40769 (_ BitVec 32) Int) ListLongMap!15075)

(assert (=> b!1089632 (= lt!485786 (getCurrentListMapNoExtraKeys!4098 lt!485779 lt!485782 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2169 (Int (_ BitVec 64)) V!40769)

(assert (=> b!1089632 (= lt!485782 (array!70309 (store (arr!33828 _values!874) i!650 (ValueCellFull!12656 (dynLambda!2169 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34366 _values!874)))))

(assert (=> b!1089632 (= lt!485783 (getCurrentListMapNoExtraKeys!4098 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089632 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485784 () Unit!35693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70306 (_ BitVec 64) (_ BitVec 32)) Unit!35693)

(assert (=> b!1089632 (= lt!485784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089633 () Bool)

(declare-fun res!726896 () Bool)

(assert (=> b!1089633 (=> (not res!726896) (not e!622345))))

(assert (=> b!1089633 (= res!726896 (and (= (size!34366 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34365 _keys!1070) (size!34366 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089635 () Bool)

(declare-fun e!622348 () Bool)

(declare-fun tp_is_empty!26731 () Bool)

(assert (=> b!1089635 (= e!622348 tp_is_empty!26731)))

(declare-fun b!1089636 () Bool)

(declare-fun e!622344 () Bool)

(assert (=> b!1089636 (= e!622344 (and e!622348 mapRes!41851))))

(declare-fun condMapEmpty!41851 () Bool)

(declare-fun mapDefault!41851 () ValueCell!12656)

(assert (=> b!1089636 (= condMapEmpty!41851 (= (arr!33828 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12656)) mapDefault!41851)))))

(declare-fun b!1089637 () Bool)

(declare-fun res!726894 () Bool)

(assert (=> b!1089637 (=> (not res!726894) (not e!622345))))

(assert (=> b!1089637 (= res!726894 (= (select (arr!33827 _keys!1070) i!650) k0!904))))

(declare-fun b!1089638 () Bool)

(assert (=> b!1089638 (= e!622349 true)))

(assert (=> b!1089638 e!622346))

(declare-fun res!726897 () Bool)

(assert (=> b!1089638 (=> (not res!726897) (not e!622346))))

(assert (=> b!1089638 (= res!726897 (= lt!485778 (+!3350 lt!485786 lt!485780)))))

(assert (=> b!1089638 (= lt!485780 (tuple2!17107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089639 () Bool)

(declare-fun res!726891 () Bool)

(assert (=> b!1089639 (=> (not res!726891) (not e!622343))))

(assert (=> b!1089639 (= res!726891 (arrayNoDuplicates!0 lt!485779 #b00000000000000000000000000000000 Nil!23670))))

(declare-fun b!1089640 () Bool)

(declare-fun res!726887 () Bool)

(assert (=> b!1089640 (=> (not res!726887) (not e!622345))))

(assert (=> b!1089640 (= res!726887 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34365 _keys!1070))))))

(declare-fun b!1089641 () Bool)

(declare-fun e!622347 () Bool)

(assert (=> b!1089641 (= e!622347 tp_is_empty!26731)))

(declare-fun mapNonEmpty!41851 () Bool)

(declare-fun tp!80036 () Bool)

(assert (=> mapNonEmpty!41851 (= mapRes!41851 (and tp!80036 e!622347))))

(declare-fun mapKey!41851 () (_ BitVec 32))

(declare-fun mapValue!41851 () ValueCell!12656)

(declare-fun mapRest!41851 () (Array (_ BitVec 32) ValueCell!12656))

(assert (=> mapNonEmpty!41851 (= (arr!33828 _values!874) (store mapRest!41851 mapKey!41851 mapValue!41851))))

(declare-fun b!1089634 () Bool)

(assert (=> b!1089634 (= e!622346 (= lt!485777 (+!3350 lt!485783 lt!485780)))))

(declare-fun res!726890 () Bool)

(assert (=> start!96070 (=> (not res!726890) (not e!622345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96070 (= res!726890 (validMask!0 mask!1414))))

(assert (=> start!96070 e!622345))

(assert (=> start!96070 tp!80035))

(assert (=> start!96070 true))

(assert (=> start!96070 tp_is_empty!26731))

(declare-fun array_inv!26128 (array!70306) Bool)

(assert (=> start!96070 (array_inv!26128 _keys!1070)))

(declare-fun array_inv!26129 (array!70308) Bool)

(assert (=> start!96070 (and (array_inv!26129 _values!874) e!622344)))

(assert (= (and start!96070 res!726890) b!1089633))

(assert (= (and b!1089633 res!726896) b!1089629))

(assert (= (and b!1089629 res!726886) b!1089628))

(assert (= (and b!1089628 res!726893) b!1089640))

(assert (= (and b!1089640 res!726887) b!1089627))

(assert (= (and b!1089627 res!726892) b!1089637))

(assert (= (and b!1089637 res!726894) b!1089631))

(assert (= (and b!1089631 res!726888) b!1089639))

(assert (= (and b!1089639 res!726891) b!1089632))

(assert (= (and b!1089632 (not res!726895)) b!1089638))

(assert (= (and b!1089638 res!726897) b!1089630))

(assert (= (and b!1089630 res!726889) b!1089634))

(assert (= (and b!1089636 condMapEmpty!41851) mapIsEmpty!41851))

(assert (= (and b!1089636 (not condMapEmpty!41851)) mapNonEmpty!41851))

(get-info :version)

(assert (= (and mapNonEmpty!41851 ((_ is ValueCellFull!12656) mapValue!41851)) b!1089641))

(assert (= (and b!1089636 ((_ is ValueCellFull!12656) mapDefault!41851)) b!1089635))

(assert (= start!96070 b!1089636))

(declare-fun b_lambda!17377 () Bool)

(assert (=> (not b_lambda!17377) (not b!1089632)))

(declare-fun t!33450 () Bool)

(declare-fun tb!7599 () Bool)

(assert (=> (and start!96070 (= defaultEntry!882 defaultEntry!882) t!33450) tb!7599))

(declare-fun result!15725 () Bool)

(assert (=> tb!7599 (= result!15725 tp_is_empty!26731)))

(assert (=> b!1089632 t!33450))

(declare-fun b_and!36109 () Bool)

(assert (= b_and!36107 (and (=> t!33450 result!15725) b_and!36109)))

(declare-fun m!1008461 () Bool)

(assert (=> b!1089629 m!1008461))

(declare-fun m!1008463 () Bool)

(assert (=> b!1089634 m!1008463))

(declare-fun m!1008465 () Bool)

(assert (=> start!96070 m!1008465))

(declare-fun m!1008467 () Bool)

(assert (=> start!96070 m!1008467))

(declare-fun m!1008469 () Bool)

(assert (=> start!96070 m!1008469))

(declare-fun m!1008471 () Bool)

(assert (=> b!1089628 m!1008471))

(declare-fun m!1008473 () Bool)

(assert (=> b!1089637 m!1008473))

(declare-fun m!1008475 () Bool)

(assert (=> b!1089639 m!1008475))

(declare-fun m!1008477 () Bool)

(assert (=> b!1089631 m!1008477))

(declare-fun m!1008479 () Bool)

(assert (=> b!1089631 m!1008479))

(declare-fun m!1008481 () Bool)

(assert (=> mapNonEmpty!41851 m!1008481))

(declare-fun m!1008483 () Bool)

(assert (=> b!1089632 m!1008483))

(declare-fun m!1008485 () Bool)

(assert (=> b!1089632 m!1008485))

(declare-fun m!1008487 () Bool)

(assert (=> b!1089632 m!1008487))

(declare-fun m!1008489 () Bool)

(assert (=> b!1089632 m!1008489))

(declare-fun m!1008491 () Bool)

(assert (=> b!1089632 m!1008491))

(declare-fun m!1008493 () Bool)

(assert (=> b!1089632 m!1008493))

(declare-fun m!1008495 () Bool)

(assert (=> b!1089632 m!1008495))

(declare-fun m!1008497 () Bool)

(assert (=> b!1089632 m!1008497))

(declare-fun m!1008499 () Bool)

(assert (=> b!1089632 m!1008499))

(declare-fun m!1008501 () Bool)

(assert (=> b!1089632 m!1008501))

(declare-fun m!1008503 () Bool)

(assert (=> b!1089630 m!1008503))

(declare-fun m!1008505 () Bool)

(assert (=> b!1089627 m!1008505))

(declare-fun m!1008507 () Bool)

(assert (=> b!1089638 m!1008507))

(check-sat (not b!1089639) (not b!1089634) b_and!36109 (not b!1089638) (not b!1089630) (not b!1089628) (not b!1089629) (not mapNonEmpty!41851) (not b!1089627) tp_is_empty!26731 (not b_next!22729) (not b_lambda!17377) (not start!96070) (not b!1089631) (not b!1089632))
(check-sat b_and!36109 (not b_next!22729))
