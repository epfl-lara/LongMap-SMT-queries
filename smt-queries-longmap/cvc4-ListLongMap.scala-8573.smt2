; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104650 () Bool)

(assert start!104650)

(declare-fun b!1247791 () Bool)

(declare-fun e!707960 () Bool)

(declare-fun tp_is_empty!31379 () Bool)

(assert (=> b!1247791 (= e!707960 tp_is_empty!31379)))

(declare-fun mapNonEmpty!48823 () Bool)

(declare-fun mapRes!48823 () Bool)

(declare-fun tp!92924 () Bool)

(declare-fun e!707959 () Bool)

(assert (=> mapNonEmpty!48823 (= mapRes!48823 (and tp!92924 e!707959))))

(declare-datatypes ((V!47203 0))(
  ( (V!47204 (val!15752 Int)) )
))
(declare-datatypes ((ValueCell!14926 0))(
  ( (ValueCellFull!14926 (v!18448 V!47203)) (EmptyCell!14926) )
))
(declare-fun mapRest!48823 () (Array (_ BitVec 32) ValueCell!14926))

(declare-fun mapKey!48823 () (_ BitVec 32))

(declare-fun mapValue!48823 () ValueCell!14926)

(declare-datatypes ((array!80450 0))(
  ( (array!80451 (arr!38794 (Array (_ BitVec 32) ValueCell!14926)) (size!39330 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80450)

(assert (=> mapNonEmpty!48823 (= (arr!38794 _values!914) (store mapRest!48823 mapKey!48823 mapValue!48823))))

(declare-fun b!1247792 () Bool)

(declare-fun res!832544 () Bool)

(declare-fun e!707961 () Bool)

(assert (=> b!1247792 (=> (not res!832544) (not e!707961))))

(declare-datatypes ((array!80452 0))(
  ( (array!80453 (arr!38795 (Array (_ BitVec 32) (_ BitVec 64))) (size!39331 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80452)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80452 (_ BitVec 32)) Bool)

(assert (=> b!1247792 (= res!832544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247793 () Bool)

(declare-fun e!707962 () Bool)

(assert (=> b!1247793 (= e!707962 (and e!707960 mapRes!48823))))

(declare-fun condMapEmpty!48823 () Bool)

(declare-fun mapDefault!48823 () ValueCell!14926)

