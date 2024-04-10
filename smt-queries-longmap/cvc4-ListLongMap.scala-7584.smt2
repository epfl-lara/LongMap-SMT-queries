; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95828 () Bool)

(assert start!95828)

(declare-fun b_free!22481 () Bool)

(declare-fun b_next!22481 () Bool)

(assert (=> start!95828 (= b_free!22481 (not b_next!22481))))

(declare-fun tp!79291 () Bool)

(declare-fun b_and!35637 () Bool)

(assert (=> start!95828 (= tp!79291 b_and!35637)))

(declare-fun b!1084352 () Bool)

(declare-fun res!722898 () Bool)

(declare-fun e!619510 () Bool)

(assert (=> b!1084352 (=> (not res!722898) (not e!619510))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084352 (= res!722898 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41479 () Bool)

(declare-fun mapRes!41479 () Bool)

(assert (=> mapIsEmpty!41479 mapRes!41479))

(declare-fun b!1084353 () Bool)

(declare-fun res!722891 () Bool)

(declare-fun e!619507 () Bool)

(assert (=> b!1084353 (=> (not res!722891) (not e!619507))))

(declare-datatypes ((array!69905 0))(
  ( (array!69906 (arr!33626 (Array (_ BitVec 32) (_ BitVec 64))) (size!34162 (_ BitVec 32))) )
))
(declare-fun lt!480633 () array!69905)

(declare-datatypes ((List!23443 0))(
  ( (Nil!23440) (Cons!23439 (h!24648 (_ BitVec 64)) (t!32982 List!23443)) )
))
(declare-fun arrayNoDuplicates!0 (array!69905 (_ BitVec 32) List!23443) Bool)

(assert (=> b!1084353 (= res!722891 (arrayNoDuplicates!0 lt!480633 #b00000000000000000000000000000000 Nil!23440))))

(declare-fun b!1084354 () Bool)

(declare-fun res!722896 () Bool)

(assert (=> b!1084354 (=> (not res!722896) (not e!619510))))

(declare-fun _keys!1070 () array!69905)

(assert (=> b!1084354 (= res!722896 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23440))))

(declare-fun b!1084355 () Bool)

(assert (=> b!1084355 (= e!619507 (not true))))

(declare-datatypes ((V!40437 0))(
  ( (V!40438 (val!13298 Int)) )
))
(declare-datatypes ((ValueCell!12532 0))(
  ( (ValueCellFull!12532 (v!15919 V!40437)) (EmptyCell!12532) )
))
(declare-datatypes ((array!69907 0))(
  ( (array!69908 (arr!33627 (Array (_ BitVec 32) ValueCell!12532)) (size!34163 (_ BitVec 32))) )
))
(declare-fun lt!480636 () array!69907)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40437)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16854 0))(
  ( (tuple2!16855 (_1!8438 (_ BitVec 64)) (_2!8438 V!40437)) )
))
(declare-datatypes ((List!23444 0))(
  ( (Nil!23441) (Cons!23440 (h!24649 tuple2!16854) (t!32983 List!23444)) )
))
(declare-datatypes ((ListLongMap!14823 0))(
  ( (ListLongMap!14824 (toList!7427 List!23444)) )
))
(declare-fun lt!480637 () ListLongMap!14823)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40437)

(declare-fun getCurrentListMap!4215 (array!69905 array!69907 (_ BitVec 32) (_ BitVec 32) V!40437 V!40437 (_ BitVec 32) Int) ListLongMap!14823)

(assert (=> b!1084355 (= lt!480637 (getCurrentListMap!4215 lt!480633 lt!480636 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480631 () ListLongMap!14823)

(declare-fun lt!480632 () ListLongMap!14823)

(assert (=> b!1084355 (and (= lt!480631 lt!480632) (= lt!480632 lt!480631))))

(declare-fun lt!480635 () ListLongMap!14823)

(declare-fun -!754 (ListLongMap!14823 (_ BitVec 64)) ListLongMap!14823)

(assert (=> b!1084355 (= lt!480632 (-!754 lt!480635 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35674 0))(
  ( (Unit!35675) )
))
(declare-fun lt!480634 () Unit!35674)

(declare-fun _values!874 () array!69907)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 (array!69905 array!69907 (_ BitVec 32) (_ BitVec 32) V!40437 V!40437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35674)

(assert (=> b!1084355 (= lt!480634 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3975 (array!69905 array!69907 (_ BitVec 32) (_ BitVec 32) V!40437 V!40437 (_ BitVec 32) Int) ListLongMap!14823)

(assert (=> b!1084355 (= lt!480631 (getCurrentListMapNoExtraKeys!3975 lt!480633 lt!480636 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2112 (Int (_ BitVec 64)) V!40437)

(assert (=> b!1084355 (= lt!480636 (array!69908 (store (arr!33627 _values!874) i!650 (ValueCellFull!12532 (dynLambda!2112 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34163 _values!874)))))

(assert (=> b!1084355 (= lt!480635 (getCurrentListMapNoExtraKeys!3975 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084355 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480630 () Unit!35674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69905 (_ BitVec 64) (_ BitVec 32)) Unit!35674)

(assert (=> b!1084355 (= lt!480630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084356 () Bool)

(assert (=> b!1084356 (= e!619510 e!619507)))

(declare-fun res!722892 () Bool)

(assert (=> b!1084356 (=> (not res!722892) (not e!619507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69905 (_ BitVec 32)) Bool)

(assert (=> b!1084356 (= res!722892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480633 mask!1414))))

(assert (=> b!1084356 (= lt!480633 (array!69906 (store (arr!33626 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34162 _keys!1070)))))

(declare-fun b!1084357 () Bool)

(declare-fun res!722897 () Bool)

(assert (=> b!1084357 (=> (not res!722897) (not e!619510))))

(assert (=> b!1084357 (= res!722897 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34162 _keys!1070))))))

(declare-fun b!1084351 () Bool)

(declare-fun res!722890 () Bool)

(assert (=> b!1084351 (=> (not res!722890) (not e!619510))))

(assert (=> b!1084351 (= res!722890 (= (select (arr!33626 _keys!1070) i!650) k!904))))

(declare-fun res!722894 () Bool)

(assert (=> start!95828 (=> (not res!722894) (not e!619510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95828 (= res!722894 (validMask!0 mask!1414))))

(assert (=> start!95828 e!619510))

(assert (=> start!95828 tp!79291))

(assert (=> start!95828 true))

(declare-fun tp_is_empty!26483 () Bool)

(assert (=> start!95828 tp_is_empty!26483))

(declare-fun array_inv!25950 (array!69905) Bool)

(assert (=> start!95828 (array_inv!25950 _keys!1070)))

(declare-fun e!619511 () Bool)

(declare-fun array_inv!25951 (array!69907) Bool)

(assert (=> start!95828 (and (array_inv!25951 _values!874) e!619511)))

(declare-fun b!1084358 () Bool)

(declare-fun e!619506 () Bool)

(assert (=> b!1084358 (= e!619506 tp_is_empty!26483)))

(declare-fun b!1084359 () Bool)

(declare-fun res!722895 () Bool)

(assert (=> b!1084359 (=> (not res!722895) (not e!619510))))

(assert (=> b!1084359 (= res!722895 (and (= (size!34163 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34162 _keys!1070) (size!34163 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084360 () Bool)

(declare-fun e!619508 () Bool)

(assert (=> b!1084360 (= e!619508 tp_is_empty!26483)))

(declare-fun b!1084361 () Bool)

(assert (=> b!1084361 (= e!619511 (and e!619506 mapRes!41479))))

(declare-fun condMapEmpty!41479 () Bool)

(declare-fun mapDefault!41479 () ValueCell!12532)

