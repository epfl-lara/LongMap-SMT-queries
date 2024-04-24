; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96198 () Bool)

(assert start!96198)

(declare-fun b_free!22615 () Bool)

(declare-fun b_next!22615 () Bool)

(assert (=> start!96198 (= b_free!22615 (not b_next!22615))))

(declare-fun tp!79694 () Bool)

(declare-fun b_and!35915 () Bool)

(assert (=> start!96198 (= tp!79694 b_and!35915)))

(declare-fun b!1088590 () Bool)

(declare-fun res!725590 () Bool)

(declare-fun e!621923 () Bool)

(assert (=> b!1088590 (=> (not res!725590) (not e!621923))))

(declare-datatypes ((array!70199 0))(
  ( (array!70200 (arr!33767 (Array (_ BitVec 32) (_ BitVec 64))) (size!34304 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70199)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088590 (= res!725590 (= (select (arr!33767 _keys!1070) i!650) k0!904))))

(declare-fun b!1088591 () Bool)

(declare-fun res!725589 () Bool)

(assert (=> b!1088591 (=> (not res!725589) (not e!621923))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70199 (_ BitVec 32)) Bool)

(assert (=> b!1088591 (= res!725589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088592 () Bool)

(declare-fun res!725598 () Bool)

(assert (=> b!1088592 (=> (not res!725598) (not e!621923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088592 (= res!725598 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41680 () Bool)

(declare-fun mapRes!41680 () Bool)

(assert (=> mapIsEmpty!41680 mapRes!41680))

(declare-fun b!1088593 () Bool)

(declare-fun res!725594 () Bool)

(assert (=> b!1088593 (=> (not res!725594) (not e!621923))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40617 0))(
  ( (V!40618 (val!13365 Int)) )
))
(declare-datatypes ((ValueCell!12599 0))(
  ( (ValueCellFull!12599 (v!15982 V!40617)) (EmptyCell!12599) )
))
(declare-datatypes ((array!70201 0))(
  ( (array!70202 (arr!33768 (Array (_ BitVec 32) ValueCell!12599)) (size!34305 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70201)

(assert (=> b!1088593 (= res!725594 (and (= (size!34305 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34304 _keys!1070) (size!34305 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088594 () Bool)

(declare-fun e!621922 () Bool)

(declare-fun tp_is_empty!26617 () Bool)

(assert (=> b!1088594 (= e!621922 tp_is_empty!26617)))

(declare-fun b!1088595 () Bool)

(declare-fun res!725595 () Bool)

(assert (=> b!1088595 (=> (not res!725595) (not e!621923))))

(declare-datatypes ((List!23564 0))(
  ( (Nil!23561) (Cons!23560 (h!24778 (_ BitVec 64)) (t!33229 List!23564)) )
))
(declare-fun arrayNoDuplicates!0 (array!70199 (_ BitVec 32) List!23564) Bool)

(assert (=> b!1088595 (= res!725595 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23561))))

(declare-fun res!725592 () Bool)

(assert (=> start!96198 (=> (not res!725592) (not e!621923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96198 (= res!725592 (validMask!0 mask!1414))))

(assert (=> start!96198 e!621923))

(assert (=> start!96198 tp!79694))

(assert (=> start!96198 true))

(assert (=> start!96198 tp_is_empty!26617))

(declare-fun array_inv!26100 (array!70199) Bool)

(assert (=> start!96198 (array_inv!26100 _keys!1070)))

(declare-fun e!621927 () Bool)

(declare-fun array_inv!26101 (array!70201) Bool)

(assert (=> start!96198 (and (array_inv!26101 _values!874) e!621927)))

(declare-fun b!1088596 () Bool)

(assert (=> b!1088596 (= e!621927 (and e!621922 mapRes!41680))))

(declare-fun condMapEmpty!41680 () Bool)

(declare-fun mapDefault!41680 () ValueCell!12599)

(assert (=> b!1088596 (= condMapEmpty!41680 (= (arr!33768 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12599)) mapDefault!41680)))))

(declare-fun b!1088597 () Bool)

(declare-fun e!621928 () Bool)

(assert (=> b!1088597 (= e!621928 true)))

(declare-fun e!621926 () Bool)

(assert (=> b!1088597 e!621926))

(declare-fun res!725596 () Bool)

(assert (=> b!1088597 (=> (not res!725596) (not e!621926))))

(declare-datatypes ((tuple2!16970 0))(
  ( (tuple2!16971 (_1!8496 (_ BitVec 64)) (_2!8496 V!40617)) )
))
(declare-datatypes ((List!23565 0))(
  ( (Nil!23562) (Cons!23561 (h!24779 tuple2!16970) (t!33230 List!23565)) )
))
(declare-datatypes ((ListLongMap!14947 0))(
  ( (ListLongMap!14948 (toList!7489 List!23565)) )
))
(declare-fun lt!484301 () ListLongMap!14947)

(declare-fun lt!484298 () ListLongMap!14947)

(declare-fun lt!484302 () tuple2!16970)

(declare-fun +!3312 (ListLongMap!14947 tuple2!16970) ListLongMap!14947)

(assert (=> b!1088597 (= res!725596 (= lt!484301 (+!3312 lt!484298 lt!484302)))))

(declare-fun zeroValue!831 () V!40617)

(assert (=> b!1088597 (= lt!484302 (tuple2!16971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun lt!484303 () ListLongMap!14947)

(declare-fun b!1088598 () Bool)

(assert (=> b!1088598 (= e!621926 (= lt!484301 (+!3312 lt!484303 lt!484302)))))

(declare-fun b!1088599 () Bool)

(declare-fun res!725591 () Bool)

(assert (=> b!1088599 (=> (not res!725591) (not e!621923))))

(assert (=> b!1088599 (= res!725591 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34304 _keys!1070))))))

(declare-fun b!1088600 () Bool)

(declare-fun e!621925 () Bool)

(assert (=> b!1088600 (= e!621925 (not e!621928))))

(declare-fun res!725597 () Bool)

(assert (=> b!1088600 (=> res!725597 e!621928)))

(assert (=> b!1088600 (= res!725597 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40617)

(declare-fun lt!484304 () ListLongMap!14947)

(declare-fun getCurrentListMap!4252 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14947)

(assert (=> b!1088600 (= lt!484304 (getCurrentListMap!4252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484299 () array!70199)

(declare-fun lt!484300 () array!70201)

(assert (=> b!1088600 (= lt!484301 (getCurrentListMap!4252 lt!484299 lt!484300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088600 (and (= lt!484298 lt!484303) (= lt!484303 lt!484298))))

(declare-fun lt!484305 () ListLongMap!14947)

(declare-fun -!801 (ListLongMap!14947 (_ BitVec 64)) ListLongMap!14947)

(assert (=> b!1088600 (= lt!484303 (-!801 lt!484305 k0!904))))

(declare-datatypes ((Unit!35769 0))(
  ( (Unit!35770) )
))
(declare-fun lt!484296 () Unit!35769)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!81 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35769)

(assert (=> b!1088600 (= lt!484296 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!81 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4057 (array!70199 array!70201 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14947)

(assert (=> b!1088600 (= lt!484298 (getCurrentListMapNoExtraKeys!4057 lt!484299 lt!484300 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2178 (Int (_ BitVec 64)) V!40617)

(assert (=> b!1088600 (= lt!484300 (array!70202 (store (arr!33768 _values!874) i!650 (ValueCellFull!12599 (dynLambda!2178 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34305 _values!874)))))

(assert (=> b!1088600 (= lt!484305 (getCurrentListMapNoExtraKeys!4057 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088600 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484297 () Unit!35769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70199 (_ BitVec 64) (_ BitVec 32)) Unit!35769)

(assert (=> b!1088600 (= lt!484297 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41680 () Bool)

(declare-fun tp!79693 () Bool)

(declare-fun e!621924 () Bool)

(assert (=> mapNonEmpty!41680 (= mapRes!41680 (and tp!79693 e!621924))))

(declare-fun mapValue!41680 () ValueCell!12599)

(declare-fun mapRest!41680 () (Array (_ BitVec 32) ValueCell!12599))

(declare-fun mapKey!41680 () (_ BitVec 32))

(assert (=> mapNonEmpty!41680 (= (arr!33768 _values!874) (store mapRest!41680 mapKey!41680 mapValue!41680))))

(declare-fun b!1088601 () Bool)

(declare-fun res!725587 () Bool)

(assert (=> b!1088601 (=> (not res!725587) (not e!621926))))

(assert (=> b!1088601 (= res!725587 (= lt!484304 (+!3312 lt!484305 lt!484302)))))

(declare-fun b!1088602 () Bool)

(assert (=> b!1088602 (= e!621924 tp_is_empty!26617)))

(declare-fun b!1088603 () Bool)

(declare-fun res!725593 () Bool)

(assert (=> b!1088603 (=> (not res!725593) (not e!621925))))

(assert (=> b!1088603 (= res!725593 (arrayNoDuplicates!0 lt!484299 #b00000000000000000000000000000000 Nil!23561))))

(declare-fun b!1088604 () Bool)

(assert (=> b!1088604 (= e!621923 e!621925)))

(declare-fun res!725588 () Bool)

(assert (=> b!1088604 (=> (not res!725588) (not e!621925))))

(assert (=> b!1088604 (= res!725588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484299 mask!1414))))

(assert (=> b!1088604 (= lt!484299 (array!70200 (store (arr!33767 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34304 _keys!1070)))))

(assert (= (and start!96198 res!725592) b!1088593))

(assert (= (and b!1088593 res!725594) b!1088591))

(assert (= (and b!1088591 res!725589) b!1088595))

(assert (= (and b!1088595 res!725595) b!1088599))

(assert (= (and b!1088599 res!725591) b!1088592))

(assert (= (and b!1088592 res!725598) b!1088590))

(assert (= (and b!1088590 res!725590) b!1088604))

(assert (= (and b!1088604 res!725588) b!1088603))

(assert (= (and b!1088603 res!725593) b!1088600))

(assert (= (and b!1088600 (not res!725597)) b!1088597))

(assert (= (and b!1088597 res!725596) b!1088601))

(assert (= (and b!1088601 res!725587) b!1088598))

(assert (= (and b!1088596 condMapEmpty!41680) mapIsEmpty!41680))

(assert (= (and b!1088596 (not condMapEmpty!41680)) mapNonEmpty!41680))

(get-info :version)

(assert (= (and mapNonEmpty!41680 ((_ is ValueCellFull!12599) mapValue!41680)) b!1088602))

(assert (= (and b!1088596 ((_ is ValueCellFull!12599) mapDefault!41680)) b!1088594))

(assert (= start!96198 b!1088596))

(declare-fun b_lambda!17295 () Bool)

(assert (=> (not b_lambda!17295) (not b!1088600)))

(declare-fun t!33228 () Bool)

(declare-fun tb!7485 () Bool)

(assert (=> (and start!96198 (= defaultEntry!882 defaultEntry!882) t!33228) tb!7485))

(declare-fun result!15497 () Bool)

(assert (=> tb!7485 (= result!15497 tp_is_empty!26617)))

(assert (=> b!1088600 t!33228))

(declare-fun b_and!35917 () Bool)

(assert (= b_and!35915 (and (=> t!33228 result!15497) b_and!35917)))

(declare-fun m!1007807 () Bool)

(assert (=> b!1088604 m!1007807))

(declare-fun m!1007809 () Bool)

(assert (=> b!1088604 m!1007809))

(declare-fun m!1007811 () Bool)

(assert (=> b!1088598 m!1007811))

(declare-fun m!1007813 () Bool)

(assert (=> b!1088597 m!1007813))

(declare-fun m!1007815 () Bool)

(assert (=> b!1088595 m!1007815))

(declare-fun m!1007817 () Bool)

(assert (=> b!1088590 m!1007817))

(declare-fun m!1007819 () Bool)

(assert (=> start!96198 m!1007819))

(declare-fun m!1007821 () Bool)

(assert (=> start!96198 m!1007821))

(declare-fun m!1007823 () Bool)

(assert (=> start!96198 m!1007823))

(declare-fun m!1007825 () Bool)

(assert (=> b!1088591 m!1007825))

(declare-fun m!1007827 () Bool)

(assert (=> b!1088601 m!1007827))

(declare-fun m!1007829 () Bool)

(assert (=> b!1088600 m!1007829))

(declare-fun m!1007831 () Bool)

(assert (=> b!1088600 m!1007831))

(declare-fun m!1007833 () Bool)

(assert (=> b!1088600 m!1007833))

(declare-fun m!1007835 () Bool)

(assert (=> b!1088600 m!1007835))

(declare-fun m!1007837 () Bool)

(assert (=> b!1088600 m!1007837))

(declare-fun m!1007839 () Bool)

(assert (=> b!1088600 m!1007839))

(declare-fun m!1007841 () Bool)

(assert (=> b!1088600 m!1007841))

(declare-fun m!1007843 () Bool)

(assert (=> b!1088600 m!1007843))

(declare-fun m!1007845 () Bool)

(assert (=> b!1088600 m!1007845))

(declare-fun m!1007847 () Bool)

(assert (=> b!1088600 m!1007847))

(declare-fun m!1007849 () Bool)

(assert (=> b!1088603 m!1007849))

(declare-fun m!1007851 () Bool)

(assert (=> mapNonEmpty!41680 m!1007851))

(declare-fun m!1007853 () Bool)

(assert (=> b!1088592 m!1007853))

(check-sat b_and!35917 (not b!1088592) (not b!1088598) (not start!96198) (not b!1088600) (not b!1088601) (not mapNonEmpty!41680) (not b!1088591) (not b_next!22615) (not b!1088595) (not b!1088604) (not b!1088597) (not b_lambda!17295) (not b!1088603) tp_is_empty!26617)
(check-sat b_and!35917 (not b_next!22615))
