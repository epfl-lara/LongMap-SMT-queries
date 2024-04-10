; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96798 () Bool)

(assert start!96798)

(declare-fun b_free!23167 () Bool)

(declare-fun b_next!23167 () Bool)

(assert (=> start!96798 (= b_free!23167 (not b_next!23167))))

(declare-fun tp!81451 () Bool)

(declare-fun b_and!37109 () Bool)

(assert (=> start!96798 (= tp!81451 b_and!37109)))

(declare-fun b!1101133 () Bool)

(declare-fun res!734773 () Bool)

(declare-fun e!628493 () Bool)

(assert (=> b!1101133 (=> (not res!734773) (not e!628493))))

(declare-datatypes ((array!71353 0))(
  ( (array!71354 (arr!34340 (Array (_ BitVec 32) (_ BitVec 64))) (size!34876 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71353)

(declare-datatypes ((List!23992 0))(
  ( (Nil!23989) (Cons!23988 (h!25197 (_ BitVec 64)) (t!34205 List!23992)) )
))
(declare-fun arrayNoDuplicates!0 (array!71353 (_ BitVec 32) List!23992) Bool)

(assert (=> b!1101133 (= res!734773 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23989))))

(declare-fun mapNonEmpty!42610 () Bool)

(declare-fun mapRes!42610 () Bool)

(declare-fun tp!81452 () Bool)

(declare-fun e!628490 () Bool)

(assert (=> mapNonEmpty!42610 (= mapRes!42610 (and tp!81452 e!628490))))

(declare-datatypes ((V!41417 0))(
  ( (V!41418 (val!13665 Int)) )
))
(declare-datatypes ((ValueCell!12899 0))(
  ( (ValueCellFull!12899 (v!16294 V!41417)) (EmptyCell!12899) )
))
(declare-fun mapValue!42610 () ValueCell!12899)

(declare-fun mapRest!42610 () (Array (_ BitVec 32) ValueCell!12899))

(declare-fun mapKey!42610 () (_ BitVec 32))

(declare-datatypes ((array!71355 0))(
  ( (array!71356 (arr!34341 (Array (_ BitVec 32) ValueCell!12899)) (size!34877 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71355)

(assert (=> mapNonEmpty!42610 (= (arr!34341 _values!874) (store mapRest!42610 mapKey!42610 mapValue!42610))))

(declare-fun b!1101134 () Bool)

(declare-fun res!734772 () Bool)

(assert (=> b!1101134 (=> (not res!734772) (not e!628493))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71353 (_ BitVec 32)) Bool)

(assert (=> b!1101134 (= res!734772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101135 () Bool)

(declare-fun tp_is_empty!27217 () Bool)

(assert (=> b!1101135 (= e!628490 tp_is_empty!27217)))

(declare-fun b!1101136 () Bool)

(declare-datatypes ((tuple2!17376 0))(
  ( (tuple2!17377 (_1!8699 (_ BitVec 64)) (_2!8699 V!41417)) )
))
(declare-datatypes ((List!23993 0))(
  ( (Nil!23990) (Cons!23989 (h!25198 tuple2!17376) (t!34206 List!23993)) )
))
(declare-datatypes ((ListLongMap!15345 0))(
  ( (ListLongMap!15346 (toList!7688 List!23993)) )
))
(declare-fun lt!493594 () ListLongMap!15345)

(declare-fun lt!493598 () tuple2!17376)

(declare-fun e!628492 () Bool)

(declare-fun lt!493600 () ListLongMap!15345)

(declare-fun +!3393 (ListLongMap!15345 tuple2!17376) ListLongMap!15345)

(assert (=> b!1101136 (= e!628492 (= lt!493594 (+!3393 lt!493600 lt!493598)))))

(declare-fun e!628496 () Bool)

(assert (=> b!1101136 e!628496))

(declare-fun res!734769 () Bool)

(assert (=> b!1101136 (=> (not res!734769) (not e!628496))))

(declare-fun lt!493593 () ListLongMap!15345)

(declare-fun lt!493601 () ListLongMap!15345)

(assert (=> b!1101136 (= res!734769 (= lt!493601 (+!3393 lt!493593 lt!493598)))))

(declare-fun minValue!831 () V!41417)

(assert (=> b!1101136 (= lt!493598 (tuple2!17377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101137 () Bool)

(declare-fun e!628497 () Bool)

(declare-fun e!628495 () Bool)

(assert (=> b!1101137 (= e!628497 (and e!628495 mapRes!42610))))

(declare-fun condMapEmpty!42610 () Bool)

(declare-fun mapDefault!42610 () ValueCell!12899)

