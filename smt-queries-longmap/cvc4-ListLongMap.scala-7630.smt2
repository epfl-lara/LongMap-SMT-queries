; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96104 () Bool)

(assert start!96104)

(declare-fun b_free!22757 () Bool)

(declare-fun b_next!22757 () Bool)

(assert (=> start!96104 (= b_free!22757 (not b_next!22757))))

(declare-fun tp!80120 () Bool)

(declare-fun b_and!36189 () Bool)

(assert (=> start!96104 (= tp!80120 b_and!36189)))

(declare-fun b!1090404 () Bool)

(declare-fun res!727425 () Bool)

(declare-fun e!622777 () Bool)

(assert (=> b!1090404 (=> (not res!727425) (not e!622777))))

(declare-datatypes ((array!70441 0))(
  ( (array!70442 (arr!33894 (Array (_ BitVec 32) (_ BitVec 64))) (size!34430 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70441)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090404 (= res!727425 (= (select (arr!33894 _keys!1070) i!650) k!904))))

(declare-fun b!1090405 () Bool)

(declare-fun e!622776 () Bool)

(declare-fun e!622774 () Bool)

(assert (=> b!1090405 (= e!622776 e!622774)))

(declare-fun res!727431 () Bool)

(assert (=> b!1090405 (=> res!727431 e!622774)))

(assert (=> b!1090405 (= res!727431 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40805 0))(
  ( (V!40806 (val!13436 Int)) )
))
(declare-datatypes ((tuple2!17078 0))(
  ( (tuple2!17079 (_1!8550 (_ BitVec 64)) (_2!8550 V!40805)) )
))
(declare-datatypes ((List!23667 0))(
  ( (Nil!23664) (Cons!23663 (h!24872 tuple2!17078) (t!33482 List!23667)) )
))
(declare-datatypes ((ListLongMap!15047 0))(
  ( (ListLongMap!15048 (toList!7539 List!23667)) )
))
(declare-fun lt!486508 () ListLongMap!15047)

(declare-fun lt!486514 () ListLongMap!15047)

(assert (=> b!1090405 (= lt!486508 lt!486514)))

(declare-fun lt!486506 () ListLongMap!15047)

(declare-fun lt!486503 () tuple2!17078)

(declare-fun +!3328 (ListLongMap!15047 tuple2!17078) ListLongMap!15047)

(assert (=> b!1090405 (= lt!486514 (+!3328 lt!486506 lt!486503))))

(declare-fun lt!486507 () ListLongMap!15047)

(declare-fun lt!486513 () ListLongMap!15047)

(assert (=> b!1090405 (= lt!486507 lt!486513)))

(declare-fun lt!486512 () ListLongMap!15047)

(assert (=> b!1090405 (= lt!486513 (+!3328 lt!486512 lt!486503))))

(declare-fun lt!486510 () ListLongMap!15047)

(assert (=> b!1090405 (= lt!486507 (+!3328 lt!486510 lt!486503))))

(declare-fun minValue!831 () V!40805)

(assert (=> b!1090405 (= lt!486503 (tuple2!17079 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!41893 () Bool)

(declare-fun mapRes!41893 () Bool)

(declare-fun tp!80119 () Bool)

(declare-fun e!622771 () Bool)

(assert (=> mapNonEmpty!41893 (= mapRes!41893 (and tp!80119 e!622771))))

(declare-datatypes ((ValueCell!12670 0))(
  ( (ValueCellFull!12670 (v!16057 V!40805)) (EmptyCell!12670) )
))
(declare-datatypes ((array!70443 0))(
  ( (array!70444 (arr!33895 (Array (_ BitVec 32) ValueCell!12670)) (size!34431 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70443)

(declare-fun mapKey!41893 () (_ BitVec 32))

(declare-fun mapRest!41893 () (Array (_ BitVec 32) ValueCell!12670))

(declare-fun mapValue!41893 () ValueCell!12670)

(assert (=> mapNonEmpty!41893 (= (arr!33895 _values!874) (store mapRest!41893 mapKey!41893 mapValue!41893))))

(declare-fun b!1090406 () Bool)

(declare-fun res!727432 () Bool)

(assert (=> b!1090406 (=> (not res!727432) (not e!622777))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70441 (_ BitVec 32)) Bool)

(assert (=> b!1090406 (= res!727432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090407 () Bool)

(declare-fun e!622778 () Bool)

(declare-fun e!622775 () Bool)

(assert (=> b!1090407 (= e!622778 (and e!622775 mapRes!41893))))

(declare-fun condMapEmpty!41893 () Bool)

(declare-fun mapDefault!41893 () ValueCell!12670)

