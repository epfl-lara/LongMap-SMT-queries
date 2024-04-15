; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96450 () Bool)

(assert start!96450)

(declare-fun b_free!23035 () Bool)

(declare-fun b_next!23035 () Bool)

(assert (=> start!96450 (= b_free!23035 (not b_next!23035))))

(declare-fun tp!81032 () Bool)

(declare-fun b_and!36707 () Bool)

(assert (=> start!96450 (= tp!81032 b_and!36707)))

(declare-fun b!1096597 () Bool)

(declare-fun e!625915 () Bool)

(declare-fun tp_is_empty!27085 () Bool)

(assert (=> b!1096597 (= e!625915 tp_is_empty!27085)))

(declare-fun b!1096598 () Bool)

(declare-fun e!625918 () Bool)

(declare-fun e!625914 () Bool)

(declare-fun mapRes!42388 () Bool)

(assert (=> b!1096598 (= e!625918 (and e!625914 mapRes!42388))))

(declare-fun condMapEmpty!42388 () Bool)

(declare-datatypes ((V!41241 0))(
  ( (V!41242 (val!13599 Int)) )
))
(declare-datatypes ((ValueCell!12833 0))(
  ( (ValueCellFull!12833 (v!16219 V!41241)) (EmptyCell!12833) )
))
(declare-datatypes ((array!70992 0))(
  ( (array!70993 (arr!34168 (Array (_ BitVec 32) ValueCell!12833)) (size!34706 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70992)

(declare-fun mapDefault!42388 () ValueCell!12833)

(assert (=> b!1096598 (= condMapEmpty!42388 (= (arr!34168 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12833)) mapDefault!42388)))))

(declare-fun b!1096599 () Bool)

(declare-fun e!625913 () Bool)

(assert (=> b!1096599 (= e!625913 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41241)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!70994 0))(
  ( (array!70995 (arr!34169 (Array (_ BitVec 32) (_ BitVec 64))) (size!34707 (_ BitVec 32))) )
))
(declare-fun lt!490049 () array!70994)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17332 0))(
  ( (tuple2!17333 (_1!8677 (_ BitVec 64)) (_2!8677 V!41241)) )
))
(declare-datatypes ((List!23924 0))(
  ( (Nil!23921) (Cons!23920 (h!25129 tuple2!17332) (t!33996 List!23924)) )
))
(declare-datatypes ((ListLongMap!15301 0))(
  ( (ListLongMap!15302 (toList!7666 List!23924)) )
))
(declare-fun lt!490048 () ListLongMap!15301)

(declare-fun zeroValue!831 () V!41241)

(declare-fun getCurrentListMapNoExtraKeys!4199 (array!70994 array!70992 (_ BitVec 32) (_ BitVec 32) V!41241 V!41241 (_ BitVec 32) Int) ListLongMap!15301)

(declare-fun dynLambda!2268 (Int (_ BitVec 64)) V!41241)

(assert (=> b!1096599 (= lt!490048 (getCurrentListMapNoExtraKeys!4199 lt!490049 (array!70993 (store (arr!34168 _values!874) i!650 (ValueCellFull!12833 (dynLambda!2268 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34706 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490046 () ListLongMap!15301)

(declare-fun _keys!1070 () array!70994)

(assert (=> b!1096599 (= lt!490046 (getCurrentListMapNoExtraKeys!4199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096599 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35919 0))(
  ( (Unit!35920) )
))
(declare-fun lt!490047 () Unit!35919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70994 (_ BitVec 64) (_ BitVec 32)) Unit!35919)

(assert (=> b!1096599 (= lt!490047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096600 () Bool)

(declare-fun res!731928 () Bool)

(declare-fun e!625916 () Bool)

(assert (=> b!1096600 (=> (not res!731928) (not e!625916))))

(assert (=> b!1096600 (= res!731928 (and (= (size!34706 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34707 _keys!1070) (size!34706 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096601 () Bool)

(declare-fun res!731922 () Bool)

(assert (=> b!1096601 (=> (not res!731922) (not e!625916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70994 (_ BitVec 32)) Bool)

(assert (=> b!1096601 (= res!731922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096602 () Bool)

(assert (=> b!1096602 (= e!625914 tp_is_empty!27085)))

(declare-fun b!1096603 () Bool)

(declare-fun res!731923 () Bool)

(assert (=> b!1096603 (=> (not res!731923) (not e!625916))))

(assert (=> b!1096603 (= res!731923 (= (select (arr!34169 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42388 () Bool)

(declare-fun tp!81031 () Bool)

(assert (=> mapNonEmpty!42388 (= mapRes!42388 (and tp!81031 e!625915))))

(declare-fun mapValue!42388 () ValueCell!12833)

(declare-fun mapKey!42388 () (_ BitVec 32))

(declare-fun mapRest!42388 () (Array (_ BitVec 32) ValueCell!12833))

(assert (=> mapNonEmpty!42388 (= (arr!34168 _values!874) (store mapRest!42388 mapKey!42388 mapValue!42388))))

(declare-fun mapIsEmpty!42388 () Bool)

(assert (=> mapIsEmpty!42388 mapRes!42388))

(declare-fun b!1096604 () Bool)

(declare-fun res!731921 () Bool)

(assert (=> b!1096604 (=> (not res!731921) (not e!625916))))

(declare-datatypes ((List!23925 0))(
  ( (Nil!23922) (Cons!23921 (h!25130 (_ BitVec 64)) (t!33997 List!23925)) )
))
(declare-fun arrayNoDuplicates!0 (array!70994 (_ BitVec 32) List!23925) Bool)

(assert (=> b!1096604 (= res!731921 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23922))))

(declare-fun res!731926 () Bool)

(assert (=> start!96450 (=> (not res!731926) (not e!625916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96450 (= res!731926 (validMask!0 mask!1414))))

(assert (=> start!96450 e!625916))

(assert (=> start!96450 tp!81032))

(assert (=> start!96450 true))

(assert (=> start!96450 tp_is_empty!27085))

(declare-fun array_inv!26362 (array!70994) Bool)

(assert (=> start!96450 (array_inv!26362 _keys!1070)))

(declare-fun array_inv!26363 (array!70992) Bool)

(assert (=> start!96450 (and (array_inv!26363 _values!874) e!625918)))

(declare-fun b!1096605 () Bool)

(declare-fun res!731929 () Bool)

(assert (=> b!1096605 (=> (not res!731929) (not e!625916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096605 (= res!731929 (validKeyInArray!0 k0!904))))

(declare-fun b!1096606 () Bool)

(declare-fun res!731927 () Bool)

(assert (=> b!1096606 (=> (not res!731927) (not e!625913))))

(assert (=> b!1096606 (= res!731927 (arrayNoDuplicates!0 lt!490049 #b00000000000000000000000000000000 Nil!23922))))

(declare-fun b!1096607 () Bool)

(assert (=> b!1096607 (= e!625916 e!625913)))

(declare-fun res!731925 () Bool)

(assert (=> b!1096607 (=> (not res!731925) (not e!625913))))

(assert (=> b!1096607 (= res!731925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490049 mask!1414))))

(assert (=> b!1096607 (= lt!490049 (array!70995 (store (arr!34169 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34707 _keys!1070)))))

(declare-fun b!1096608 () Bool)

(declare-fun res!731924 () Bool)

(assert (=> b!1096608 (=> (not res!731924) (not e!625916))))

(assert (=> b!1096608 (= res!731924 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34707 _keys!1070))))))

(assert (= (and start!96450 res!731926) b!1096600))

(assert (= (and b!1096600 res!731928) b!1096601))

(assert (= (and b!1096601 res!731922) b!1096604))

(assert (= (and b!1096604 res!731921) b!1096608))

(assert (= (and b!1096608 res!731924) b!1096605))

(assert (= (and b!1096605 res!731929) b!1096603))

(assert (= (and b!1096603 res!731923) b!1096607))

(assert (= (and b!1096607 res!731925) b!1096606))

(assert (= (and b!1096606 res!731927) b!1096599))

(assert (= (and b!1096598 condMapEmpty!42388) mapIsEmpty!42388))

(assert (= (and b!1096598 (not condMapEmpty!42388)) mapNonEmpty!42388))

(get-info :version)

(assert (= (and mapNonEmpty!42388 ((_ is ValueCellFull!12833) mapValue!42388)) b!1096597))

(assert (= (and b!1096598 ((_ is ValueCellFull!12833) mapDefault!42388)) b!1096602))

(assert (= start!96450 b!1096598))

(declare-fun b_lambda!17671 () Bool)

(assert (=> (not b_lambda!17671) (not b!1096599)))

(declare-fun t!33995 () Bool)

(declare-fun tb!7893 () Bool)

(assert (=> (and start!96450 (= defaultEntry!882 defaultEntry!882) t!33995) tb!7893))

(declare-fun result!16317 () Bool)

(assert (=> tb!7893 (= result!16317 tp_is_empty!27085)))

(assert (=> b!1096599 t!33995))

(declare-fun b_and!36709 () Bool)

(assert (= b_and!36707 (and (=> t!33995 result!16317) b_and!36709)))

(declare-fun m!1015623 () Bool)

(assert (=> mapNonEmpty!42388 m!1015623))

(declare-fun m!1015625 () Bool)

(assert (=> b!1096604 m!1015625))

(declare-fun m!1015627 () Bool)

(assert (=> start!96450 m!1015627))

(declare-fun m!1015629 () Bool)

(assert (=> start!96450 m!1015629))

(declare-fun m!1015631 () Bool)

(assert (=> start!96450 m!1015631))

(declare-fun m!1015633 () Bool)

(assert (=> b!1096605 m!1015633))

(declare-fun m!1015635 () Bool)

(assert (=> b!1096603 m!1015635))

(declare-fun m!1015637 () Bool)

(assert (=> b!1096606 m!1015637))

(declare-fun m!1015639 () Bool)

(assert (=> b!1096601 m!1015639))

(declare-fun m!1015641 () Bool)

(assert (=> b!1096607 m!1015641))

(declare-fun m!1015643 () Bool)

(assert (=> b!1096607 m!1015643))

(declare-fun m!1015645 () Bool)

(assert (=> b!1096599 m!1015645))

(declare-fun m!1015647 () Bool)

(assert (=> b!1096599 m!1015647))

(declare-fun m!1015649 () Bool)

(assert (=> b!1096599 m!1015649))

(declare-fun m!1015651 () Bool)

(assert (=> b!1096599 m!1015651))

(declare-fun m!1015653 () Bool)

(assert (=> b!1096599 m!1015653))

(declare-fun m!1015655 () Bool)

(assert (=> b!1096599 m!1015655))

(check-sat (not b_next!23035) b_and!36709 (not b!1096601) (not b_lambda!17671) (not b!1096599) (not b!1096606) (not mapNonEmpty!42388) (not b!1096604) (not b!1096605) tp_is_empty!27085 (not b!1096607) (not start!96450))
(check-sat b_and!36709 (not b_next!23035))
