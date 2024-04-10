; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96160 () Bool)

(assert start!96160)

(declare-fun b_free!22813 () Bool)

(declare-fun b_next!22813 () Bool)

(assert (=> start!96160 (= b_free!22813 (not b_next!22813))))

(declare-fun tp!80288 () Bool)

(declare-fun b_and!36301 () Bool)

(assert (=> start!96160 (= tp!80288 b_and!36301)))

(declare-fun b!1091635 () Bool)

(declare-fun e!623443 () Bool)

(declare-fun e!623445 () Bool)

(assert (=> b!1091635 (= e!623443 e!623445)))

(declare-fun res!728357 () Bool)

(assert (=> b!1091635 (=> (not res!728357) (not e!623445))))

(declare-datatypes ((array!70549 0))(
  ( (array!70550 (arr!33948 (Array (_ BitVec 32) (_ BitVec 64))) (size!34484 (_ BitVec 32))) )
))
(declare-fun lt!487596 () array!70549)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70549 (_ BitVec 32)) Bool)

(assert (=> b!1091635 (= res!728357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487596 mask!1414))))

(declare-fun _keys!1070 () array!70549)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091635 (= lt!487596 (array!70550 (store (arr!33948 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34484 _keys!1070)))))

(declare-fun b!1091636 () Bool)

(declare-fun res!728355 () Bool)

(assert (=> b!1091636 (=> (not res!728355) (not e!623445))))

(declare-datatypes ((List!23712 0))(
  ( (Nil!23709) (Cons!23708 (h!24917 (_ BitVec 64)) (t!33583 List!23712)) )
))
(declare-fun arrayNoDuplicates!0 (array!70549 (_ BitVec 32) List!23712) Bool)

(assert (=> b!1091636 (= res!728355 (arrayNoDuplicates!0 lt!487596 #b00000000000000000000000000000000 Nil!23709))))

(declare-fun res!728356 () Bool)

(assert (=> start!96160 (=> (not res!728356) (not e!623443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96160 (= res!728356 (validMask!0 mask!1414))))

(assert (=> start!96160 e!623443))

(assert (=> start!96160 tp!80288))

(assert (=> start!96160 true))

(declare-fun tp_is_empty!26815 () Bool)

(assert (=> start!96160 tp_is_empty!26815))

(declare-fun array_inv!26174 (array!70549) Bool)

(assert (=> start!96160 (array_inv!26174 _keys!1070)))

(declare-datatypes ((V!40881 0))(
  ( (V!40882 (val!13464 Int)) )
))
(declare-datatypes ((ValueCell!12698 0))(
  ( (ValueCellFull!12698 (v!16085 V!40881)) (EmptyCell!12698) )
))
(declare-datatypes ((array!70551 0))(
  ( (array!70552 (arr!33949 (Array (_ BitVec 32) ValueCell!12698)) (size!34485 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70551)

(declare-fun e!623447 () Bool)

(declare-fun array_inv!26175 (array!70551) Bool)

(assert (=> start!96160 (and (array_inv!26175 _values!874) e!623447)))

(declare-fun b!1091637 () Bool)

(declare-fun e!623448 () Bool)

(declare-fun e!623450 () Bool)

(assert (=> b!1091637 (= e!623448 e!623450)))

(declare-fun res!728358 () Bool)

(assert (=> b!1091637 (=> res!728358 e!623450)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1091637 (= res!728358 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17128 0))(
  ( (tuple2!17129 (_1!8575 (_ BitVec 64)) (_2!8575 V!40881)) )
))
(declare-datatypes ((List!23713 0))(
  ( (Nil!23710) (Cons!23709 (h!24918 tuple2!17128) (t!33584 List!23713)) )
))
(declare-datatypes ((ListLongMap!15097 0))(
  ( (ListLongMap!15098 (toList!7564 List!23713)) )
))
(declare-fun lt!487595 () ListLongMap!15097)

(declare-fun lt!487605 () ListLongMap!15097)

(assert (=> b!1091637 (= lt!487595 lt!487605)))

(declare-fun lt!487604 () ListLongMap!15097)

(declare-fun lt!487606 () tuple2!17128)

(declare-fun +!3346 (ListLongMap!15097 tuple2!17128) ListLongMap!15097)

(assert (=> b!1091637 (= lt!487605 (+!3346 lt!487604 lt!487606))))

(declare-fun lt!487601 () ListLongMap!15097)

(declare-fun lt!487598 () ListLongMap!15097)

(assert (=> b!1091637 (= lt!487601 lt!487598)))

(declare-fun lt!487594 () ListLongMap!15097)

(assert (=> b!1091637 (= lt!487598 (+!3346 lt!487594 lt!487606))))

(declare-fun lt!487602 () ListLongMap!15097)

(assert (=> b!1091637 (= lt!487601 (+!3346 lt!487602 lt!487606))))

(declare-fun minValue!831 () V!40881)

(assert (=> b!1091637 (= lt!487606 (tuple2!17129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091638 () Bool)

(declare-fun res!728349 () Bool)

(assert (=> b!1091638 (=> (not res!728349) (not e!623443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091638 (= res!728349 (validKeyInArray!0 k!904))))

(declare-fun b!1091639 () Bool)

(declare-fun e!623449 () Bool)

(assert (=> b!1091639 (= e!623449 tp_is_empty!26815)))

(declare-fun b!1091640 () Bool)

(declare-fun mapRes!41977 () Bool)

(assert (=> b!1091640 (= e!623447 (and e!623449 mapRes!41977))))

(declare-fun condMapEmpty!41977 () Bool)

(declare-fun mapDefault!41977 () ValueCell!12698)

