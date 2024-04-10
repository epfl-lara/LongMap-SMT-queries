; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95906 () Bool)

(assert start!95906)

(declare-fun b_free!22559 () Bool)

(declare-fun b_next!22559 () Bool)

(assert (=> start!95906 (= b_free!22559 (not b_next!22559))))

(declare-fun tp!79525 () Bool)

(declare-fun b_and!35793 () Bool)

(assert (=> start!95906 (= tp!79525 b_and!35793)))

(declare-fun b!1086029 () Bool)

(declare-fun res!724149 () Bool)

(declare-fun e!620395 () Bool)

(assert (=> b!1086029 (=> (not res!724149) (not e!620395))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70057 0))(
  ( (array!70058 (arr!33702 (Array (_ BitVec 32) (_ BitVec 64))) (size!34238 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70057)

(assert (=> b!1086029 (= res!724149 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34238 _keys!1070))))))

(declare-fun b!1086030 () Bool)

(declare-fun e!620397 () Bool)

(declare-fun tp_is_empty!26561 () Bool)

(assert (=> b!1086030 (= e!620397 tp_is_empty!26561)))

(declare-fun mapNonEmpty!41596 () Bool)

(declare-fun mapRes!41596 () Bool)

(declare-fun tp!79526 () Bool)

(declare-fun e!620401 () Bool)

(assert (=> mapNonEmpty!41596 (= mapRes!41596 (and tp!79526 e!620401))))

(declare-datatypes ((V!40541 0))(
  ( (V!40542 (val!13337 Int)) )
))
(declare-datatypes ((ValueCell!12571 0))(
  ( (ValueCellFull!12571 (v!15958 V!40541)) (EmptyCell!12571) )
))
(declare-datatypes ((array!70059 0))(
  ( (array!70060 (arr!33703 (Array (_ BitVec 32) ValueCell!12571)) (size!34239 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70059)

(declare-fun mapValue!41596 () ValueCell!12571)

(declare-fun mapKey!41596 () (_ BitVec 32))

(declare-fun mapRest!41596 () (Array (_ BitVec 32) ValueCell!12571))

(assert (=> mapNonEmpty!41596 (= (arr!33703 _values!874) (store mapRest!41596 mapKey!41596 mapValue!41596))))

(declare-fun b!1086032 () Bool)

(assert (=> b!1086032 (= e!620401 tp_is_empty!26561)))

(declare-fun b!1086033 () Bool)

(declare-fun res!724143 () Bool)

(declare-fun e!620400 () Bool)

(assert (=> b!1086033 (=> (not res!724143) (not e!620400))))

(declare-fun lt!482376 () array!70057)

(declare-datatypes ((List!23504 0))(
  ( (Nil!23501) (Cons!23500 (h!24709 (_ BitVec 64)) (t!33121 List!23504)) )
))
(declare-fun arrayNoDuplicates!0 (array!70057 (_ BitVec 32) List!23504) Bool)

(assert (=> b!1086033 (= res!724143 (arrayNoDuplicates!0 lt!482376 #b00000000000000000000000000000000 Nil!23501))))

(declare-fun b!1086034 () Bool)

(declare-fun e!620402 () Bool)

(declare-fun e!620398 () Bool)

(assert (=> b!1086034 (= e!620402 e!620398)))

(declare-fun res!724140 () Bool)

(assert (=> b!1086034 (=> res!724140 e!620398)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1086034 (= res!724140 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16916 0))(
  ( (tuple2!16917 (_1!8469 (_ BitVec 64)) (_2!8469 V!40541)) )
))
(declare-datatypes ((List!23505 0))(
  ( (Nil!23502) (Cons!23501 (h!24710 tuple2!16916) (t!33122 List!23505)) )
))
(declare-datatypes ((ListLongMap!14885 0))(
  ( (ListLongMap!14886 (toList!7458 List!23505)) )
))
(declare-fun lt!482374 () ListLongMap!14885)

(declare-fun lt!482377 () ListLongMap!14885)

(assert (=> b!1086034 (= lt!482374 lt!482377)))

(declare-fun lt!482383 () ListLongMap!14885)

(declare-fun -!784 (ListLongMap!14885 (_ BitVec 64)) ListLongMap!14885)

(assert (=> b!1086034 (= lt!482374 (-!784 lt!482383 k!904))))

(declare-fun lt!482367 () ListLongMap!14885)

(declare-datatypes ((Unit!35734 0))(
  ( (Unit!35735) )
))
(declare-fun lt!482381 () Unit!35734)

(declare-fun zeroValue!831 () V!40541)

(declare-fun addRemoveCommutativeForDiffKeys!22 (ListLongMap!14885 (_ BitVec 64) V!40541 (_ BitVec 64)) Unit!35734)

(assert (=> b!1086034 (= lt!482381 (addRemoveCommutativeForDiffKeys!22 lt!482367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!482372 () ListLongMap!14885)

(declare-fun lt!482371 () tuple2!16916)

(declare-fun +!3266 (ListLongMap!14885 tuple2!16916) ListLongMap!14885)

(assert (=> b!1086034 (= lt!482372 (+!3266 lt!482377 lt!482371))))

(declare-fun lt!482378 () ListLongMap!14885)

(declare-fun lt!482382 () tuple2!16916)

(assert (=> b!1086034 (= lt!482377 (+!3266 lt!482378 lt!482382))))

(declare-fun lt!482380 () ListLongMap!14885)

(declare-fun lt!482373 () ListLongMap!14885)

(assert (=> b!1086034 (= lt!482380 lt!482373)))

(assert (=> b!1086034 (= lt!482373 (+!3266 lt!482383 lt!482371))))

(assert (=> b!1086034 (= lt!482383 (+!3266 lt!482367 lt!482382))))

(declare-fun lt!482379 () ListLongMap!14885)

(assert (=> b!1086034 (= lt!482372 (+!3266 (+!3266 lt!482379 lt!482382) lt!482371))))

(declare-fun minValue!831 () V!40541)

(assert (=> b!1086034 (= lt!482371 (tuple2!16917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086034 (= lt!482382 (tuple2!16917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086035 () Bool)

(declare-fun e!620399 () Bool)

(assert (=> b!1086035 (= e!620399 (and e!620397 mapRes!41596))))

(declare-fun condMapEmpty!41596 () Bool)

(declare-fun mapDefault!41596 () ValueCell!12571)

