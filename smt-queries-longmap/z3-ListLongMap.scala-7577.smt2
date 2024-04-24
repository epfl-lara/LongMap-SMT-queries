; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96018 () Bool)

(assert start!96018)

(declare-fun b_free!22435 () Bool)

(declare-fun b_next!22435 () Bool)

(assert (=> start!96018 (= b_free!22435 (not b_next!22435))))

(declare-fun tp!79154 () Bool)

(declare-fun b_and!35555 () Bool)

(assert (=> start!96018 (= tp!79154 b_and!35555)))

(declare-fun b!1084804 () Bool)

(declare-fun e!619947 () Bool)

(declare-fun e!619950 () Bool)

(assert (=> b!1084804 (= e!619947 e!619950)))

(declare-fun res!722794 () Bool)

(assert (=> b!1084804 (=> (not res!722794) (not e!619950))))

(declare-datatypes ((array!69853 0))(
  ( (array!69854 (arr!33594 (Array (_ BitVec 32) (_ BitVec 64))) (size!34131 (_ BitVec 32))) )
))
(declare-fun lt!480612 () array!69853)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69853 (_ BitVec 32)) Bool)

(assert (=> b!1084804 (= res!722794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480612 mask!1414))))

(declare-fun _keys!1070 () array!69853)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084804 (= lt!480612 (array!69854 (store (arr!33594 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34131 _keys!1070)))))

(declare-fun b!1084805 () Bool)

(declare-fun res!722795 () Bool)

(assert (=> b!1084805 (=> (not res!722795) (not e!619947))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084805 (= res!722795 (= (select (arr!33594 _keys!1070) i!650) k0!904))))

(declare-fun b!1084806 () Bool)

(declare-fun e!619948 () Bool)

(declare-fun tp_is_empty!26437 () Bool)

(assert (=> b!1084806 (= e!619948 tp_is_empty!26437)))

(declare-fun b!1084807 () Bool)

(assert (=> b!1084807 (= e!619950 (not (bvsle #b00000000000000000000000000000000 (size!34131 _keys!1070))))))

(declare-datatypes ((V!40377 0))(
  ( (V!40378 (val!13275 Int)) )
))
(declare-datatypes ((tuple2!16826 0))(
  ( (tuple2!16827 (_1!8424 (_ BitVec 64)) (_2!8424 V!40377)) )
))
(declare-datatypes ((List!23422 0))(
  ( (Nil!23419) (Cons!23418 (h!24636 tuple2!16826) (t!32907 List!23422)) )
))
(declare-datatypes ((ListLongMap!14803 0))(
  ( (ListLongMap!14804 (toList!7417 List!23422)) )
))
(declare-fun lt!480611 () ListLongMap!14803)

(declare-fun lt!480607 () ListLongMap!14803)

(assert (=> b!1084807 (and (= lt!480611 lt!480607) (= lt!480607 lt!480611))))

(declare-fun lt!480608 () ListLongMap!14803)

(declare-fun -!729 (ListLongMap!14803 (_ BitVec 64)) ListLongMap!14803)

(assert (=> b!1084807 (= lt!480607 (-!729 lt!480608 k0!904))))

(declare-fun minValue!831 () V!40377)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35625 0))(
  ( (Unit!35626) )
))
(declare-fun lt!480610 () Unit!35625)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12509 0))(
  ( (ValueCellFull!12509 (v!15892 V!40377)) (EmptyCell!12509) )
))
(declare-datatypes ((array!69855 0))(
  ( (array!69856 (arr!33595 (Array (_ BitVec 32) ValueCell!12509)) (size!34132 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69855)

(declare-fun zeroValue!831 () V!40377)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!18 (array!69853 array!69855 (_ BitVec 32) (_ BitVec 32) V!40377 V!40377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35625)

(assert (=> b!1084807 (= lt!480610 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!18 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3994 (array!69853 array!69855 (_ BitVec 32) (_ BitVec 32) V!40377 V!40377 (_ BitVec 32) Int) ListLongMap!14803)

(declare-fun dynLambda!2115 (Int (_ BitVec 64)) V!40377)

(assert (=> b!1084807 (= lt!480611 (getCurrentListMapNoExtraKeys!3994 lt!480612 (array!69856 (store (arr!33595 _values!874) i!650 (ValueCellFull!12509 (dynLambda!2115 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34132 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084807 (= lt!480608 (getCurrentListMapNoExtraKeys!3994 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084807 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480609 () Unit!35625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69853 (_ BitVec 64) (_ BitVec 32)) Unit!35625)

(assert (=> b!1084807 (= lt!480609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084808 () Bool)

(declare-fun res!722792 () Bool)

(assert (=> b!1084808 (=> (not res!722792) (not e!619947))))

(assert (=> b!1084808 (= res!722792 (and (= (size!34132 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34131 _keys!1070) (size!34132 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084809 () Bool)

(declare-fun res!722797 () Bool)

(assert (=> b!1084809 (=> (not res!722797) (not e!619947))))

(assert (=> b!1084809 (= res!722797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084810 () Bool)

(declare-fun e!619952 () Bool)

(assert (=> b!1084810 (= e!619952 tp_is_empty!26437)))

(declare-fun res!722796 () Bool)

(assert (=> start!96018 (=> (not res!722796) (not e!619947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96018 (= res!722796 (validMask!0 mask!1414))))

(assert (=> start!96018 e!619947))

(assert (=> start!96018 tp!79154))

(assert (=> start!96018 true))

(assert (=> start!96018 tp_is_empty!26437))

(declare-fun array_inv!25976 (array!69853) Bool)

(assert (=> start!96018 (array_inv!25976 _keys!1070)))

(declare-fun e!619949 () Bool)

(declare-fun array_inv!25977 (array!69855) Bool)

(assert (=> start!96018 (and (array_inv!25977 _values!874) e!619949)))

(declare-fun b!1084811 () Bool)

(declare-fun res!722791 () Bool)

(assert (=> b!1084811 (=> (not res!722791) (not e!619947))))

(assert (=> b!1084811 (= res!722791 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34131 _keys!1070))))))

(declare-fun b!1084812 () Bool)

(declare-fun res!722793 () Bool)

(assert (=> b!1084812 (=> (not res!722793) (not e!619950))))

(declare-datatypes ((List!23423 0))(
  ( (Nil!23420) (Cons!23419 (h!24637 (_ BitVec 64)) (t!32908 List!23423)) )
))
(declare-fun arrayNoDuplicates!0 (array!69853 (_ BitVec 32) List!23423) Bool)

(assert (=> b!1084812 (= res!722793 (arrayNoDuplicates!0 lt!480612 #b00000000000000000000000000000000 Nil!23420))))

(declare-fun b!1084813 () Bool)

(declare-fun res!722798 () Bool)

(assert (=> b!1084813 (=> (not res!722798) (not e!619947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084813 (= res!722798 (validKeyInArray!0 k0!904))))

(declare-fun b!1084814 () Bool)

(declare-fun res!722799 () Bool)

(assert (=> b!1084814 (=> (not res!722799) (not e!619947))))

(assert (=> b!1084814 (= res!722799 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23420))))

(declare-fun mapNonEmpty!41410 () Bool)

(declare-fun mapRes!41410 () Bool)

(declare-fun tp!79153 () Bool)

(assert (=> mapNonEmpty!41410 (= mapRes!41410 (and tp!79153 e!619948))))

(declare-fun mapRest!41410 () (Array (_ BitVec 32) ValueCell!12509))

(declare-fun mapKey!41410 () (_ BitVec 32))

(declare-fun mapValue!41410 () ValueCell!12509)

(assert (=> mapNonEmpty!41410 (= (arr!33595 _values!874) (store mapRest!41410 mapKey!41410 mapValue!41410))))

(declare-fun mapIsEmpty!41410 () Bool)

(assert (=> mapIsEmpty!41410 mapRes!41410))

(declare-fun b!1084815 () Bool)

(assert (=> b!1084815 (= e!619949 (and e!619952 mapRes!41410))))

(declare-fun condMapEmpty!41410 () Bool)

(declare-fun mapDefault!41410 () ValueCell!12509)

(assert (=> b!1084815 (= condMapEmpty!41410 (= (arr!33595 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12509)) mapDefault!41410)))))

(assert (= (and start!96018 res!722796) b!1084808))

(assert (= (and b!1084808 res!722792) b!1084809))

(assert (= (and b!1084809 res!722797) b!1084814))

(assert (= (and b!1084814 res!722799) b!1084811))

(assert (= (and b!1084811 res!722791) b!1084813))

(assert (= (and b!1084813 res!722798) b!1084805))

(assert (= (and b!1084805 res!722795) b!1084804))

(assert (= (and b!1084804 res!722794) b!1084812))

(assert (= (and b!1084812 res!722793) b!1084807))

(assert (= (and b!1084815 condMapEmpty!41410) mapIsEmpty!41410))

(assert (= (and b!1084815 (not condMapEmpty!41410)) mapNonEmpty!41410))

(get-info :version)

(assert (= (and mapNonEmpty!41410 ((_ is ValueCellFull!12509) mapValue!41410)) b!1084806))

(assert (= (and b!1084815 ((_ is ValueCellFull!12509) mapDefault!41410)) b!1084810))

(assert (= start!96018 b!1084815))

(declare-fun b_lambda!17115 () Bool)

(assert (=> (not b_lambda!17115) (not b!1084807)))

(declare-fun t!32906 () Bool)

(declare-fun tb!7305 () Bool)

(assert (=> (and start!96018 (= defaultEntry!882 defaultEntry!882) t!32906) tb!7305))

(declare-fun result!15137 () Bool)

(assert (=> tb!7305 (= result!15137 tp_is_empty!26437)))

(assert (=> b!1084807 t!32906))

(declare-fun b_and!35557 () Bool)

(assert (= b_and!35555 (and (=> t!32906 result!15137) b_and!35557)))

(declare-fun m!1002821 () Bool)

(assert (=> b!1084807 m!1002821))

(declare-fun m!1002823 () Bool)

(assert (=> b!1084807 m!1002823))

(declare-fun m!1002825 () Bool)

(assert (=> b!1084807 m!1002825))

(declare-fun m!1002827 () Bool)

(assert (=> b!1084807 m!1002827))

(declare-fun m!1002829 () Bool)

(assert (=> b!1084807 m!1002829))

(declare-fun m!1002831 () Bool)

(assert (=> b!1084807 m!1002831))

(declare-fun m!1002833 () Bool)

(assert (=> b!1084807 m!1002833))

(declare-fun m!1002835 () Bool)

(assert (=> b!1084807 m!1002835))

(declare-fun m!1002837 () Bool)

(assert (=> mapNonEmpty!41410 m!1002837))

(declare-fun m!1002839 () Bool)

(assert (=> b!1084804 m!1002839))

(declare-fun m!1002841 () Bool)

(assert (=> b!1084804 m!1002841))

(declare-fun m!1002843 () Bool)

(assert (=> b!1084812 m!1002843))

(declare-fun m!1002845 () Bool)

(assert (=> b!1084805 m!1002845))

(declare-fun m!1002847 () Bool)

(assert (=> start!96018 m!1002847))

(declare-fun m!1002849 () Bool)

(assert (=> start!96018 m!1002849))

(declare-fun m!1002851 () Bool)

(assert (=> start!96018 m!1002851))

(declare-fun m!1002853 () Bool)

(assert (=> b!1084813 m!1002853))

(declare-fun m!1002855 () Bool)

(assert (=> b!1084809 m!1002855))

(declare-fun m!1002857 () Bool)

(assert (=> b!1084814 m!1002857))

(check-sat (not b!1084814) (not mapNonEmpty!41410) (not b_next!22435) (not start!96018) tp_is_empty!26437 (not b!1084809) (not b!1084807) (not b!1084813) (not b!1084804) (not b_lambda!17115) b_and!35557 (not b!1084812))
(check-sat b_and!35557 (not b_next!22435))
