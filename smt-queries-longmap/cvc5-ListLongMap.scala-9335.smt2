; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111446 () Bool)

(assert start!111446)

(declare-fun b_free!30103 () Bool)

(declare-fun b_next!30103 () Bool)

(assert (=> start!111446 (= b_free!30103 (not b_next!30103))))

(declare-fun tp!105784 () Bool)

(declare-fun b_and!48365 () Bool)

(assert (=> start!111446 (= tp!105784 b_and!48365)))

(declare-fun mapIsEmpty!55532 () Bool)

(declare-fun mapRes!55532 () Bool)

(assert (=> mapIsEmpty!55532 mapRes!55532))

(declare-fun b!1319020 () Bool)

(declare-fun res!875420 () Bool)

(declare-fun e!752610 () Bool)

(assert (=> b!1319020 (=> (not res!875420) (not e!752610))))

(declare-datatypes ((array!88784 0))(
  ( (array!88785 (arr!42866 (Array (_ BitVec 32) (_ BitVec 64))) (size!43416 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88784)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88784 (_ BitVec 32)) Bool)

(assert (=> b!1319020 (= res!875420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319021 () Bool)

(declare-fun res!875418 () Bool)

(assert (=> b!1319021 (=> (not res!875418) (not e!752610))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319021 (= res!875418 (validKeyInArray!0 (select (arr!42866 _keys!1609) from!2000)))))

(declare-fun b!1319022 () Bool)

(declare-fun e!752612 () Bool)

(declare-fun tp_is_empty!35923 () Bool)

(assert (=> b!1319022 (= e!752612 tp_is_empty!35923)))

(declare-fun b!1319023 () Bool)

(declare-fun e!752613 () Bool)

(declare-fun e!752611 () Bool)

(assert (=> b!1319023 (= e!752613 (and e!752611 mapRes!55532))))

(declare-fun condMapEmpty!55532 () Bool)

(declare-datatypes ((V!53001 0))(
  ( (V!53002 (val!18036 Int)) )
))
(declare-datatypes ((ValueCell!17063 0))(
  ( (ValueCellFull!17063 (v!20666 V!53001)) (EmptyCell!17063) )
))
(declare-datatypes ((array!88786 0))(
  ( (array!88787 (arr!42867 (Array (_ BitVec 32) ValueCell!17063)) (size!43417 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88786)

(declare-fun mapDefault!55532 () ValueCell!17063)

