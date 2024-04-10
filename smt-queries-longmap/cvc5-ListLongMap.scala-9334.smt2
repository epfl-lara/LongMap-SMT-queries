; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111440 () Bool)

(assert start!111440)

(declare-fun b_free!30097 () Bool)

(declare-fun b_next!30097 () Bool)

(assert (=> start!111440 (= b_free!30097 (not b_next!30097))))

(declare-fun tp!105767 () Bool)

(declare-fun b_and!48353 () Bool)

(assert (=> start!111440 (= tp!105767 b_and!48353)))

(declare-fun mapNonEmpty!55523 () Bool)

(declare-fun mapRes!55523 () Bool)

(declare-fun tp!105766 () Bool)

(declare-fun e!752569 () Bool)

(assert (=> mapNonEmpty!55523 (= mapRes!55523 (and tp!105766 e!752569))))

(declare-datatypes ((V!52993 0))(
  ( (V!52994 (val!18033 Int)) )
))
(declare-datatypes ((ValueCell!17060 0))(
  ( (ValueCellFull!17060 (v!20663 V!52993)) (EmptyCell!17060) )
))
(declare-datatypes ((array!88776 0))(
  ( (array!88777 (arr!42862 (Array (_ BitVec 32) ValueCell!17060)) (size!43412 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88776)

(declare-fun mapKey!55523 () (_ BitVec 32))

(declare-fun mapValue!55523 () ValueCell!17060)

(declare-fun mapRest!55523 () (Array (_ BitVec 32) ValueCell!17060))

(assert (=> mapNonEmpty!55523 (= (arr!42862 _values!1337) (store mapRest!55523 mapKey!55523 mapValue!55523))))

(declare-fun b!1318915 () Bool)

(declare-fun e!752568 () Bool)

(declare-fun tp_is_empty!35917 () Bool)

(assert (=> b!1318915 (= e!752568 tp_is_empty!35917)))

(declare-fun b!1318916 () Bool)

(declare-fun e!752567 () Bool)

(assert (=> b!1318916 (= e!752567 (and e!752568 mapRes!55523))))

(declare-fun condMapEmpty!55523 () Bool)

(declare-fun mapDefault!55523 () ValueCell!17060)

