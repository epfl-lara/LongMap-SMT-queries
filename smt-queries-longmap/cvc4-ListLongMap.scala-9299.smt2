; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111146 () Bool)

(assert start!111146)

(declare-fun b_free!29981 () Bool)

(declare-fun b_next!29981 () Bool)

(assert (=> start!111146 (= b_free!29981 (not b_next!29981))))

(declare-fun tp!105265 () Bool)

(declare-fun b_and!48189 () Bool)

(assert (=> start!111146 (= tp!105265 b_and!48189)))

(declare-fun b!1315982 () Bool)

(declare-fun e!750720 () Bool)

(declare-fun tp_is_empty!35711 () Bool)

(assert (=> b!1315982 (= e!750720 tp_is_empty!35711)))

(declare-fun b!1315983 () Bool)

(declare-fun res!873613 () Bool)

(declare-fun e!750719 () Bool)

(assert (=> b!1315983 (=> (not res!873613) (not e!750719))))

(declare-datatypes ((array!88380 0))(
  ( (array!88381 (arr!42670 (Array (_ BitVec 32) (_ BitVec 64))) (size!43220 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88380)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88380 (_ BitVec 32)) Bool)

(assert (=> b!1315983 (= res!873613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315984 () Bool)

(declare-fun res!873615 () Bool)

(assert (=> b!1315984 (=> (not res!873615) (not e!750719))))

(declare-datatypes ((List!30272 0))(
  ( (Nil!30269) (Cons!30268 (h!31477 (_ BitVec 64)) (t!43878 List!30272)) )
))
(declare-fun arrayNoDuplicates!0 (array!88380 (_ BitVec 32) List!30272) Bool)

(assert (=> b!1315984 (= res!873615 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30269))))

(declare-fun b!1315985 () Bool)

(declare-fun e!750722 () Bool)

(declare-fun e!750718 () Bool)

(declare-fun mapRes!55195 () Bool)

(assert (=> b!1315985 (= e!750722 (and e!750718 mapRes!55195))))

(declare-fun condMapEmpty!55195 () Bool)

(declare-datatypes ((V!52717 0))(
  ( (V!52718 (val!17930 Int)) )
))
(declare-datatypes ((ValueCell!16957 0))(
  ( (ValueCellFull!16957 (v!20557 V!52717)) (EmptyCell!16957) )
))
(declare-datatypes ((array!88382 0))(
  ( (array!88383 (arr!42671 (Array (_ BitVec 32) ValueCell!16957)) (size!43221 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88382)

(declare-fun mapDefault!55195 () ValueCell!16957)

