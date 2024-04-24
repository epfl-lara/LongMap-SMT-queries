; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95904 () Bool)

(assert start!95904)

(declare-fun b_free!22321 () Bool)

(declare-fun b_next!22321 () Bool)

(assert (=> start!95904 (= b_free!22321 (not b_next!22321))))

(declare-fun tp!78812 () Bool)

(declare-fun b_and!35327 () Bool)

(assert (=> start!95904 (= tp!78812 b_and!35327)))

(declare-fun b!1082638 () Bool)

(declare-fun e!618921 () Bool)

(declare-fun tp_is_empty!26323 () Bool)

(assert (=> b!1082638 (= e!618921 tp_is_empty!26323)))

(declare-fun b!1082639 () Bool)

(declare-fun res!721252 () Bool)

(declare-fun e!618923 () Bool)

(assert (=> b!1082639 (=> (not res!721252) (not e!618923))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69631 0))(
  ( (array!69632 (arr!33483 (Array (_ BitVec 32) (_ BitVec 64))) (size!34020 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69631)

(declare-datatypes ((V!40225 0))(
  ( (V!40226 (val!13218 Int)) )
))
(declare-datatypes ((ValueCell!12452 0))(
  ( (ValueCellFull!12452 (v!15835 V!40225)) (EmptyCell!12452) )
))
(declare-datatypes ((array!69633 0))(
  ( (array!69634 (arr!33484 (Array (_ BitVec 32) ValueCell!12452)) (size!34021 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69633)

(assert (=> b!1082639 (= res!721252 (and (= (size!34021 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34020 _keys!1070) (size!34021 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41239 () Bool)

(declare-fun mapRes!41239 () Bool)

(assert (=> mapIsEmpty!41239 mapRes!41239))

(declare-fun mapNonEmpty!41239 () Bool)

(declare-fun tp!78811 () Bool)

(declare-fun e!618925 () Bool)

(assert (=> mapNonEmpty!41239 (= mapRes!41239 (and tp!78811 e!618925))))

(declare-fun mapValue!41239 () ValueCell!12452)

(declare-fun mapRest!41239 () (Array (_ BitVec 32) ValueCell!12452))

(declare-fun mapKey!41239 () (_ BitVec 32))

(assert (=> mapNonEmpty!41239 (= (arr!33484 _values!874) (store mapRest!41239 mapKey!41239 mapValue!41239))))

(declare-fun res!721254 () Bool)

(assert (=> start!95904 (=> (not res!721254) (not e!618923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95904 (= res!721254 (validMask!0 mask!1414))))

(assert (=> start!95904 e!618923))

(assert (=> start!95904 tp!78812))

(assert (=> start!95904 true))

(assert (=> start!95904 tp_is_empty!26323))

(declare-fun array_inv!25886 (array!69631) Bool)

(assert (=> start!95904 (array_inv!25886 _keys!1070)))

(declare-fun e!618922 () Bool)

(declare-fun array_inv!25887 (array!69633) Bool)

(assert (=> start!95904 (and (array_inv!25887 _values!874) e!618922)))

(declare-fun b!1082640 () Bool)

(declare-fun e!618926 () Bool)

(assert (=> b!1082640 (= e!618926 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40225)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!479776 () array!69631)

(declare-fun zeroValue!831 () V!40225)

(declare-datatypes ((tuple2!16746 0))(
  ( (tuple2!16747 (_1!8384 (_ BitVec 64)) (_2!8384 V!40225)) )
))
(declare-datatypes ((List!23334 0))(
  ( (Nil!23331) (Cons!23330 (h!24548 tuple2!16746) (t!32705 List!23334)) )
))
(declare-datatypes ((ListLongMap!14723 0))(
  ( (ListLongMap!14724 (toList!7377 List!23334)) )
))
(declare-fun lt!479775 () ListLongMap!14723)

(declare-fun getCurrentListMapNoExtraKeys!3954 (array!69631 array!69633 (_ BitVec 32) (_ BitVec 32) V!40225 V!40225 (_ BitVec 32) Int) ListLongMap!14723)

(declare-fun dynLambda!2075 (Int (_ BitVec 64)) V!40225)

(assert (=> b!1082640 (= lt!479775 (getCurrentListMapNoExtraKeys!3954 lt!479776 (array!69634 (store (arr!33484 _values!874) i!650 (ValueCellFull!12452 (dynLambda!2075 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34021 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479777 () ListLongMap!14723)

(assert (=> b!1082640 (= lt!479777 (getCurrentListMapNoExtraKeys!3954 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082640 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35545 0))(
  ( (Unit!35546) )
))
(declare-fun lt!479778 () Unit!35545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69631 (_ BitVec 64) (_ BitVec 32)) Unit!35545)

(assert (=> b!1082640 (= lt!479778 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082641 () Bool)

(declare-fun res!721259 () Bool)

(assert (=> b!1082641 (=> (not res!721259) (not e!618923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69631 (_ BitVec 32)) Bool)

(assert (=> b!1082641 (= res!721259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082642 () Bool)

(declare-fun res!721260 () Bool)

(assert (=> b!1082642 (=> (not res!721260) (not e!618923))))

(declare-datatypes ((List!23335 0))(
  ( (Nil!23332) (Cons!23331 (h!24549 (_ BitVec 64)) (t!32706 List!23335)) )
))
(declare-fun arrayNoDuplicates!0 (array!69631 (_ BitVec 32) List!23335) Bool)

(assert (=> b!1082642 (= res!721260 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23332))))

(declare-fun b!1082643 () Bool)

(declare-fun res!721258 () Bool)

(assert (=> b!1082643 (=> (not res!721258) (not e!618923))))

(assert (=> b!1082643 (= res!721258 (= (select (arr!33483 _keys!1070) i!650) k0!904))))

(declare-fun b!1082644 () Bool)

(declare-fun res!721257 () Bool)

(assert (=> b!1082644 (=> (not res!721257) (not e!618923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082644 (= res!721257 (validKeyInArray!0 k0!904))))

(declare-fun b!1082645 () Bool)

(assert (=> b!1082645 (= e!618925 tp_is_empty!26323)))

(declare-fun b!1082646 () Bool)

(declare-fun res!721256 () Bool)

(assert (=> b!1082646 (=> (not res!721256) (not e!618926))))

(assert (=> b!1082646 (= res!721256 (arrayNoDuplicates!0 lt!479776 #b00000000000000000000000000000000 Nil!23332))))

(declare-fun b!1082647 () Bool)

(assert (=> b!1082647 (= e!618922 (and e!618921 mapRes!41239))))

(declare-fun condMapEmpty!41239 () Bool)

(declare-fun mapDefault!41239 () ValueCell!12452)

(assert (=> b!1082647 (= condMapEmpty!41239 (= (arr!33484 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12452)) mapDefault!41239)))))

(declare-fun b!1082648 () Bool)

(assert (=> b!1082648 (= e!618923 e!618926)))

(declare-fun res!721253 () Bool)

(assert (=> b!1082648 (=> (not res!721253) (not e!618926))))

(assert (=> b!1082648 (= res!721253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479776 mask!1414))))

(assert (=> b!1082648 (= lt!479776 (array!69632 (store (arr!33483 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34020 _keys!1070)))))

(declare-fun b!1082649 () Bool)

(declare-fun res!721255 () Bool)

(assert (=> b!1082649 (=> (not res!721255) (not e!618923))))

(assert (=> b!1082649 (= res!721255 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34020 _keys!1070))))))

(assert (= (and start!95904 res!721254) b!1082639))

(assert (= (and b!1082639 res!721252) b!1082641))

(assert (= (and b!1082641 res!721259) b!1082642))

(assert (= (and b!1082642 res!721260) b!1082649))

(assert (= (and b!1082649 res!721255) b!1082644))

(assert (= (and b!1082644 res!721257) b!1082643))

(assert (= (and b!1082643 res!721258) b!1082648))

(assert (= (and b!1082648 res!721253) b!1082646))

(assert (= (and b!1082646 res!721256) b!1082640))

(assert (= (and b!1082647 condMapEmpty!41239) mapIsEmpty!41239))

(assert (= (and b!1082647 (not condMapEmpty!41239)) mapNonEmpty!41239))

(get-info :version)

(assert (= (and mapNonEmpty!41239 ((_ is ValueCellFull!12452) mapValue!41239)) b!1082645))

(assert (= (and b!1082647 ((_ is ValueCellFull!12452) mapDefault!41239)) b!1082638))

(assert (= start!95904 b!1082647))

(declare-fun b_lambda!17001 () Bool)

(assert (=> (not b_lambda!17001) (not b!1082640)))

(declare-fun t!32704 () Bool)

(declare-fun tb!7191 () Bool)

(assert (=> (and start!95904 (= defaultEntry!882 defaultEntry!882) t!32704) tb!7191))

(declare-fun result!14909 () Bool)

(assert (=> tb!7191 (= result!14909 tp_is_empty!26323)))

(assert (=> b!1082640 t!32704))

(declare-fun b_and!35329 () Bool)

(assert (= b_and!35327 (and (=> t!32704 result!14909) b_and!35329)))

(declare-fun m!1000787 () Bool)

(assert (=> b!1082642 m!1000787))

(declare-fun m!1000789 () Bool)

(assert (=> start!95904 m!1000789))

(declare-fun m!1000791 () Bool)

(assert (=> start!95904 m!1000791))

(declare-fun m!1000793 () Bool)

(assert (=> start!95904 m!1000793))

(declare-fun m!1000795 () Bool)

(assert (=> b!1082644 m!1000795))

(declare-fun m!1000797 () Bool)

(assert (=> b!1082643 m!1000797))

(declare-fun m!1000799 () Bool)

(assert (=> b!1082641 m!1000799))

(declare-fun m!1000801 () Bool)

(assert (=> b!1082640 m!1000801))

(declare-fun m!1000803 () Bool)

(assert (=> b!1082640 m!1000803))

(declare-fun m!1000805 () Bool)

(assert (=> b!1082640 m!1000805))

(declare-fun m!1000807 () Bool)

(assert (=> b!1082640 m!1000807))

(declare-fun m!1000809 () Bool)

(assert (=> b!1082640 m!1000809))

(declare-fun m!1000811 () Bool)

(assert (=> b!1082640 m!1000811))

(declare-fun m!1000813 () Bool)

(assert (=> b!1082646 m!1000813))

(declare-fun m!1000815 () Bool)

(assert (=> b!1082648 m!1000815))

(declare-fun m!1000817 () Bool)

(assert (=> b!1082648 m!1000817))

(declare-fun m!1000819 () Bool)

(assert (=> mapNonEmpty!41239 m!1000819))

(check-sat (not b_lambda!17001) (not mapNonEmpty!41239) (not b!1082640) (not b!1082648) (not start!95904) (not b!1082641) b_and!35329 (not b_next!22321) (not b!1082644) (not b!1082642) tp_is_empty!26323 (not b!1082646))
(check-sat b_and!35329 (not b_next!22321))
