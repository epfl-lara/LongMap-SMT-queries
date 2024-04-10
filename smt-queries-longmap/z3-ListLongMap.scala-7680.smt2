; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96428 () Bool)

(assert start!96428)

(declare-fun b_free!23007 () Bool)

(declare-fun b_next!23007 () Bool)

(assert (=> start!96428 (= b_free!23007 (not b_next!23007))))

(declare-fun tp!80947 () Bool)

(declare-fun b_and!36677 () Bool)

(assert (=> start!96428 (= tp!80947 b_and!36677)))

(declare-fun b!1096218 () Bool)

(declare-fun res!731614 () Bool)

(declare-fun e!625754 () Bool)

(assert (=> b!1096218 (=> (not res!731614) (not e!625754))))

(declare-datatypes ((array!71027 0))(
  ( (array!71028 (arr!34185 (Array (_ BitVec 32) (_ BitVec 64))) (size!34721 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71027)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096218 (= res!731614 (= (select (arr!34185 _keys!1070) i!650) k0!904))))

(declare-fun b!1096219 () Bool)

(declare-fun res!731612 () Bool)

(declare-fun e!625756 () Bool)

(assert (=> b!1096219 (=> (not res!731612) (not e!625756))))

(declare-fun lt!490079 () array!71027)

(declare-datatypes ((List!23872 0))(
  ( (Nil!23869) (Cons!23868 (h!25077 (_ BitVec 64)) (t!33925 List!23872)) )
))
(declare-fun arrayNoDuplicates!0 (array!71027 (_ BitVec 32) List!23872) Bool)

(assert (=> b!1096219 (= res!731612 (arrayNoDuplicates!0 lt!490079 #b00000000000000000000000000000000 Nil!23869))))

(declare-fun b!1096220 () Bool)

(declare-fun res!731613 () Bool)

(assert (=> b!1096220 (=> (not res!731613) (not e!625754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096220 (= res!731613 (validKeyInArray!0 k0!904))))

(declare-fun b!1096221 () Bool)

(declare-fun res!731616 () Bool)

(assert (=> b!1096221 (=> (not res!731616) (not e!625754))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41203 0))(
  ( (V!41204 (val!13585 Int)) )
))
(declare-datatypes ((ValueCell!12819 0))(
  ( (ValueCellFull!12819 (v!16206 V!41203)) (EmptyCell!12819) )
))
(declare-datatypes ((array!71029 0))(
  ( (array!71030 (arr!34186 (Array (_ BitVec 32) ValueCell!12819)) (size!34722 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71029)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1096221 (= res!731616 (and (= (size!34722 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34721 _keys!1070) (size!34722 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42346 () Bool)

(declare-fun mapRes!42346 () Bool)

(assert (=> mapIsEmpty!42346 mapRes!42346))

(declare-fun b!1096222 () Bool)

(declare-fun res!731619 () Bool)

(assert (=> b!1096222 (=> (not res!731619) (not e!625754))))

(assert (=> b!1096222 (= res!731619 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23869))))

(declare-fun mapNonEmpty!42346 () Bool)

(declare-fun tp!80948 () Bool)

(declare-fun e!625758 () Bool)

(assert (=> mapNonEmpty!42346 (= mapRes!42346 (and tp!80948 e!625758))))

(declare-fun mapRest!42346 () (Array (_ BitVec 32) ValueCell!12819))

(declare-fun mapValue!42346 () ValueCell!12819)

(declare-fun mapKey!42346 () (_ BitVec 32))

(assert (=> mapNonEmpty!42346 (= (arr!34186 _values!874) (store mapRest!42346 mapKey!42346 mapValue!42346))))

(declare-fun b!1096223 () Bool)

(declare-fun e!625757 () Bool)

(declare-fun e!625755 () Bool)

(assert (=> b!1096223 (= e!625757 (and e!625755 mapRes!42346))))

(declare-fun condMapEmpty!42346 () Bool)

(declare-fun mapDefault!42346 () ValueCell!12819)

(assert (=> b!1096223 (= condMapEmpty!42346 (= (arr!34186 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12819)) mapDefault!42346)))))

(declare-fun b!1096224 () Bool)

(declare-fun tp_is_empty!27057 () Bool)

(assert (=> b!1096224 (= e!625755 tp_is_empty!27057)))

(declare-fun b!1096225 () Bool)

(assert (=> b!1096225 (= e!625754 e!625756)))

(declare-fun res!731615 () Bool)

(assert (=> b!1096225 (=> (not res!731615) (not e!625756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71027 (_ BitVec 32)) Bool)

(assert (=> b!1096225 (= res!731615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490079 mask!1414))))

(assert (=> b!1096225 (= lt!490079 (array!71028 (store (arr!34185 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34721 _keys!1070)))))

(declare-fun b!1096227 () Bool)

(declare-fun res!731618 () Bool)

(assert (=> b!1096227 (=> (not res!731618) (not e!625754))))

(assert (=> b!1096227 (= res!731618 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34721 _keys!1070))))))

(declare-fun b!1096228 () Bool)

(assert (=> b!1096228 (= e!625758 tp_is_empty!27057)))

(declare-fun b!1096229 () Bool)

(declare-fun res!731620 () Bool)

(assert (=> b!1096229 (=> (not res!731620) (not e!625754))))

(assert (=> b!1096229 (= res!731620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096226 () Bool)

(assert (=> b!1096226 (= e!625756 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41203)

(declare-datatypes ((tuple2!17252 0))(
  ( (tuple2!17253 (_1!8637 (_ BitVec 64)) (_2!8637 V!41203)) )
))
(declare-datatypes ((List!23873 0))(
  ( (Nil!23870) (Cons!23869 (h!25078 tuple2!17252) (t!33926 List!23873)) )
))
(declare-datatypes ((ListLongMap!15221 0))(
  ( (ListLongMap!15222 (toList!7626 List!23873)) )
))
(declare-fun lt!490080 () ListLongMap!15221)

(declare-fun minValue!831 () V!41203)

(declare-fun getCurrentListMapNoExtraKeys!4142 (array!71027 array!71029 (_ BitVec 32) (_ BitVec 32) V!41203 V!41203 (_ BitVec 32) Int) ListLongMap!15221)

(declare-fun dynLambda!2277 (Int (_ BitVec 64)) V!41203)

(assert (=> b!1096226 (= lt!490080 (getCurrentListMapNoExtraKeys!4142 lt!490079 (array!71030 (store (arr!34186 _values!874) i!650 (ValueCellFull!12819 (dynLambda!2277 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34722 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490078 () ListLongMap!15221)

(assert (=> b!1096226 (= lt!490078 (getCurrentListMapNoExtraKeys!4142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096226 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36064 0))(
  ( (Unit!36065) )
))
(declare-fun lt!490081 () Unit!36064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71027 (_ BitVec 64) (_ BitVec 32)) Unit!36064)

(assert (=> b!1096226 (= lt!490081 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!731617 () Bool)

(assert (=> start!96428 (=> (not res!731617) (not e!625754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96428 (= res!731617 (validMask!0 mask!1414))))

(assert (=> start!96428 e!625754))

(assert (=> start!96428 tp!80947))

(assert (=> start!96428 true))

(assert (=> start!96428 tp_is_empty!27057))

(declare-fun array_inv!26340 (array!71027) Bool)

(assert (=> start!96428 (array_inv!26340 _keys!1070)))

(declare-fun array_inv!26341 (array!71029) Bool)

(assert (=> start!96428 (and (array_inv!26341 _values!874) e!625757)))

(assert (= (and start!96428 res!731617) b!1096221))

(assert (= (and b!1096221 res!731616) b!1096229))

(assert (= (and b!1096229 res!731620) b!1096222))

(assert (= (and b!1096222 res!731619) b!1096227))

(assert (= (and b!1096227 res!731618) b!1096220))

(assert (= (and b!1096220 res!731613) b!1096218))

(assert (= (and b!1096218 res!731614) b!1096225))

(assert (= (and b!1096225 res!731615) b!1096219))

(assert (= (and b!1096219 res!731612) b!1096226))

(assert (= (and b!1096223 condMapEmpty!42346) mapIsEmpty!42346))

(assert (= (and b!1096223 (not condMapEmpty!42346)) mapNonEmpty!42346))

(get-info :version)

(assert (= (and mapNonEmpty!42346 ((_ is ValueCellFull!12819) mapValue!42346)) b!1096228))

(assert (= (and b!1096223 ((_ is ValueCellFull!12819) mapDefault!42346)) b!1096224))

(assert (= start!96428 b!1096223))

(declare-fun b_lambda!17665 () Bool)

(assert (=> (not b_lambda!17665) (not b!1096226)))

(declare-fun t!33924 () Bool)

(declare-fun tb!7873 () Bool)

(assert (=> (and start!96428 (= defaultEntry!882 defaultEntry!882) t!33924) tb!7873))

(declare-fun result!16269 () Bool)

(assert (=> tb!7873 (= result!16269 tp_is_empty!27057)))

(assert (=> b!1096226 t!33924))

(declare-fun b_and!36679 () Bool)

(assert (= b_and!36677 (and (=> t!33924 result!16269) b_and!36679)))

(declare-fun m!1015773 () Bool)

(assert (=> b!1096222 m!1015773))

(declare-fun m!1015775 () Bool)

(assert (=> start!96428 m!1015775))

(declare-fun m!1015777 () Bool)

(assert (=> start!96428 m!1015777))

(declare-fun m!1015779 () Bool)

(assert (=> start!96428 m!1015779))

(declare-fun m!1015781 () Bool)

(assert (=> mapNonEmpty!42346 m!1015781))

(declare-fun m!1015783 () Bool)

(assert (=> b!1096219 m!1015783))

(declare-fun m!1015785 () Bool)

(assert (=> b!1096218 m!1015785))

(declare-fun m!1015787 () Bool)

(assert (=> b!1096229 m!1015787))

(declare-fun m!1015789 () Bool)

(assert (=> b!1096220 m!1015789))

(declare-fun m!1015791 () Bool)

(assert (=> b!1096226 m!1015791))

(declare-fun m!1015793 () Bool)

(assert (=> b!1096226 m!1015793))

(declare-fun m!1015795 () Bool)

(assert (=> b!1096226 m!1015795))

(declare-fun m!1015797 () Bool)

(assert (=> b!1096226 m!1015797))

(declare-fun m!1015799 () Bool)

(assert (=> b!1096226 m!1015799))

(declare-fun m!1015801 () Bool)

(assert (=> b!1096226 m!1015801))

(declare-fun m!1015803 () Bool)

(assert (=> b!1096225 m!1015803))

(declare-fun m!1015805 () Bool)

(assert (=> b!1096225 m!1015805))

(check-sat (not b!1096220) (not start!96428) (not b!1096219) tp_is_empty!27057 (not b!1096226) (not b_next!23007) b_and!36679 (not b_lambda!17665) (not b!1096229) (not b!1096225) (not b!1096222) (not mapNonEmpty!42346))
(check-sat b_and!36679 (not b_next!23007))
