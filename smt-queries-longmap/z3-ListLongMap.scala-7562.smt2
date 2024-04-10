; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95694 () Bool)

(assert start!95694)

(declare-fun b_free!22347 () Bool)

(declare-fun b_next!22347 () Bool)

(assert (=> start!95694 (= b_free!22347 (not b_next!22347))))

(declare-fun tp!78890 () Bool)

(declare-fun b_and!35369 () Bool)

(assert (=> start!95694 (= tp!78890 b_and!35369)))

(declare-fun mapNonEmpty!41278 () Bool)

(declare-fun mapRes!41278 () Bool)

(declare-fun tp!78889 () Bool)

(declare-fun e!618301 () Bool)

(assert (=> mapNonEmpty!41278 (= mapRes!41278 (and tp!78889 e!618301))))

(declare-datatypes ((V!40259 0))(
  ( (V!40260 (val!13231 Int)) )
))
(declare-datatypes ((ValueCell!12465 0))(
  ( (ValueCellFull!12465 (v!15852 V!40259)) (EmptyCell!12465) )
))
(declare-datatypes ((array!69645 0))(
  ( (array!69646 (arr!33496 (Array (_ BitVec 32) ValueCell!12465)) (size!34032 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69645)

(declare-fun mapValue!41278 () ValueCell!12465)

(declare-fun mapRest!41278 () (Array (_ BitVec 32) ValueCell!12465))

(declare-fun mapKey!41278 () (_ BitVec 32))

(assert (=> mapNonEmpty!41278 (= (arr!33496 _values!874) (store mapRest!41278 mapKey!41278 mapValue!41278))))

(declare-fun b!1081805 () Bool)

(declare-fun e!618305 () Bool)

(declare-fun tp_is_empty!26349 () Bool)

(assert (=> b!1081805 (= e!618305 tp_is_empty!26349)))

(declare-fun b!1081806 () Bool)

(declare-fun res!721081 () Bool)

(declare-fun e!618302 () Bool)

(assert (=> b!1081806 (=> (not res!721081) (not e!618302))))

(declare-datatypes ((array!69647 0))(
  ( (array!69648 (arr!33497 (Array (_ BitVec 32) (_ BitVec 64))) (size!34033 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69647)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69647 (_ BitVec 32)) Bool)

(assert (=> b!1081806 (= res!721081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081807 () Bool)

(declare-fun res!721085 () Bool)

(assert (=> b!1081807 (=> (not res!721085) (not e!618302))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081807 (= res!721085 (and (= (size!34032 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34033 _keys!1070) (size!34032 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081808 () Bool)

(declare-fun res!721088 () Bool)

(assert (=> b!1081808 (=> (not res!721088) (not e!618302))))

(declare-datatypes ((List!23344 0))(
  ( (Nil!23341) (Cons!23340 (h!24549 (_ BitVec 64)) (t!32749 List!23344)) )
))
(declare-fun arrayNoDuplicates!0 (array!69647 (_ BitVec 32) List!23344) Bool)

(assert (=> b!1081808 (= res!721088 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23341))))

(declare-fun b!1081809 () Bool)

(declare-fun e!618300 () Bool)

(assert (=> b!1081809 (= e!618302 e!618300)))

(declare-fun res!721082 () Bool)

(assert (=> b!1081809 (=> (not res!721082) (not e!618300))))

(declare-fun lt!479416 () array!69647)

(assert (=> b!1081809 (= res!721082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479416 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081809 (= lt!479416 (array!69648 (store (arr!33497 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34033 _keys!1070)))))

(declare-fun b!1081811 () Bool)

(assert (=> b!1081811 (= e!618301 tp_is_empty!26349)))

(declare-fun b!1081812 () Bool)

(declare-fun e!618304 () Bool)

(assert (=> b!1081812 (= e!618304 (and e!618305 mapRes!41278))))

(declare-fun condMapEmpty!41278 () Bool)

(declare-fun mapDefault!41278 () ValueCell!12465)

(assert (=> b!1081812 (= condMapEmpty!41278 (= (arr!33496 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12465)) mapDefault!41278)))))

(declare-fun mapIsEmpty!41278 () Bool)

(assert (=> mapIsEmpty!41278 mapRes!41278))

(declare-fun b!1081813 () Bool)

(declare-fun res!721084 () Bool)

(assert (=> b!1081813 (=> (not res!721084) (not e!618300))))

(assert (=> b!1081813 (= res!721084 (arrayNoDuplicates!0 lt!479416 #b00000000000000000000000000000000 Nil!23341))))

(declare-fun b!1081814 () Bool)

(declare-fun res!721083 () Bool)

(assert (=> b!1081814 (=> (not res!721083) (not e!618302))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081814 (= res!721083 (validKeyInArray!0 k0!904))))

(declare-fun res!721086 () Bool)

(assert (=> start!95694 (=> (not res!721086) (not e!618302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95694 (= res!721086 (validMask!0 mask!1414))))

(assert (=> start!95694 e!618302))

(assert (=> start!95694 tp!78890))

(assert (=> start!95694 true))

(assert (=> start!95694 tp_is_empty!26349))

(declare-fun array_inv!25858 (array!69647) Bool)

(assert (=> start!95694 (array_inv!25858 _keys!1070)))

(declare-fun array_inv!25859 (array!69645) Bool)

(assert (=> start!95694 (and (array_inv!25859 _values!874) e!618304)))

(declare-fun b!1081810 () Bool)

(declare-fun res!721089 () Bool)

(assert (=> b!1081810 (=> (not res!721089) (not e!618302))))

(assert (=> b!1081810 (= res!721089 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34033 _keys!1070))))))

(declare-fun b!1081815 () Bool)

(assert (=> b!1081815 (= e!618300 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40259)

(declare-fun zeroValue!831 () V!40259)

(declare-datatypes ((tuple2!16764 0))(
  ( (tuple2!16765 (_1!8393 (_ BitVec 64)) (_2!8393 V!40259)) )
))
(declare-datatypes ((List!23345 0))(
  ( (Nil!23342) (Cons!23341 (h!24550 tuple2!16764) (t!32750 List!23345)) )
))
(declare-datatypes ((ListLongMap!14733 0))(
  ( (ListLongMap!14734 (toList!7382 List!23345)) )
))
(declare-fun lt!479419 () ListLongMap!14733)

(declare-fun getCurrentListMapNoExtraKeys!3930 (array!69647 array!69645 (_ BitVec 32) (_ BitVec 32) V!40259 V!40259 (_ BitVec 32) Int) ListLongMap!14733)

(declare-fun dynLambda!2067 (Int (_ BitVec 64)) V!40259)

(assert (=> b!1081815 (= lt!479419 (getCurrentListMapNoExtraKeys!3930 lt!479416 (array!69646 (store (arr!33496 _values!874) i!650 (ValueCellFull!12465 (dynLambda!2067 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34032 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479418 () ListLongMap!14733)

(assert (=> b!1081815 (= lt!479418 (getCurrentListMapNoExtraKeys!3930 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081815 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35584 0))(
  ( (Unit!35585) )
))
(declare-fun lt!479417 () Unit!35584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69647 (_ BitVec 64) (_ BitVec 32)) Unit!35584)

(assert (=> b!1081815 (= lt!479417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081816 () Bool)

(declare-fun res!721087 () Bool)

(assert (=> b!1081816 (=> (not res!721087) (not e!618302))))

(assert (=> b!1081816 (= res!721087 (= (select (arr!33497 _keys!1070) i!650) k0!904))))

(assert (= (and start!95694 res!721086) b!1081807))

(assert (= (and b!1081807 res!721085) b!1081806))

(assert (= (and b!1081806 res!721081) b!1081808))

(assert (= (and b!1081808 res!721088) b!1081810))

(assert (= (and b!1081810 res!721089) b!1081814))

(assert (= (and b!1081814 res!721083) b!1081816))

(assert (= (and b!1081816 res!721087) b!1081809))

(assert (= (and b!1081809 res!721082) b!1081813))

(assert (= (and b!1081813 res!721084) b!1081815))

(assert (= (and b!1081812 condMapEmpty!41278) mapIsEmpty!41278))

(assert (= (and b!1081812 (not condMapEmpty!41278)) mapNonEmpty!41278))

(get-info :version)

(assert (= (and mapNonEmpty!41278 ((_ is ValueCellFull!12465) mapValue!41278)) b!1081811))

(assert (= (and b!1081812 ((_ is ValueCellFull!12465) mapDefault!41278)) b!1081805))

(assert (= start!95694 b!1081812))

(declare-fun b_lambda!17017 () Bool)

(assert (=> (not b_lambda!17017) (not b!1081815)))

(declare-fun t!32748 () Bool)

(declare-fun tb!7225 () Bool)

(assert (=> (and start!95694 (= defaultEntry!882 defaultEntry!882) t!32748) tb!7225))

(declare-fun result!14969 () Bool)

(assert (=> tb!7225 (= result!14969 tp_is_empty!26349)))

(assert (=> b!1081815 t!32748))

(declare-fun b_and!35371 () Bool)

(assert (= b_and!35369 (and (=> t!32748 result!14969) b_and!35371)))

(declare-fun m!999557 () Bool)

(assert (=> b!1081806 m!999557))

(declare-fun m!999559 () Bool)

(assert (=> b!1081814 m!999559))

(declare-fun m!999561 () Bool)

(assert (=> b!1081808 m!999561))

(declare-fun m!999563 () Bool)

(assert (=> b!1081816 m!999563))

(declare-fun m!999565 () Bool)

(assert (=> b!1081813 m!999565))

(declare-fun m!999567 () Bool)

(assert (=> start!95694 m!999567))

(declare-fun m!999569 () Bool)

(assert (=> start!95694 m!999569))

(declare-fun m!999571 () Bool)

(assert (=> start!95694 m!999571))

(declare-fun m!999573 () Bool)

(assert (=> b!1081815 m!999573))

(declare-fun m!999575 () Bool)

(assert (=> b!1081815 m!999575))

(declare-fun m!999577 () Bool)

(assert (=> b!1081815 m!999577))

(declare-fun m!999579 () Bool)

(assert (=> b!1081815 m!999579))

(declare-fun m!999581 () Bool)

(assert (=> b!1081815 m!999581))

(declare-fun m!999583 () Bool)

(assert (=> b!1081815 m!999583))

(declare-fun m!999585 () Bool)

(assert (=> b!1081809 m!999585))

(declare-fun m!999587 () Bool)

(assert (=> b!1081809 m!999587))

(declare-fun m!999589 () Bool)

(assert (=> mapNonEmpty!41278 m!999589))

(check-sat (not b_lambda!17017) (not b!1081813) (not b_next!22347) b_and!35371 (not b!1081815) (not b!1081808) (not mapNonEmpty!41278) tp_is_empty!26349 (not b!1081809) (not b!1081814) (not b!1081806) (not start!95694))
(check-sat b_and!35371 (not b_next!22347))
