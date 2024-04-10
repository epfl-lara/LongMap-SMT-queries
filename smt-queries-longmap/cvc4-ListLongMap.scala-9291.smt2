; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111098 () Bool)

(assert start!111098)

(declare-fun b_free!29933 () Bool)

(declare-fun b_next!29933 () Bool)

(assert (=> start!111098 (= b_free!29933 (not b_next!29933))))

(declare-fun tp!105120 () Bool)

(declare-fun b_and!48141 () Bool)

(assert (=> start!111098 (= tp!105120 b_and!48141)))

(declare-fun mapNonEmpty!55123 () Bool)

(declare-fun mapRes!55123 () Bool)

(declare-fun tp!105121 () Bool)

(declare-fun e!750358 () Bool)

(assert (=> mapNonEmpty!55123 (= mapRes!55123 (and tp!105121 e!750358))))

(declare-fun mapKey!55123 () (_ BitVec 32))

(declare-datatypes ((V!52653 0))(
  ( (V!52654 (val!17906 Int)) )
))
(declare-datatypes ((ValueCell!16933 0))(
  ( (ValueCellFull!16933 (v!20533 V!52653)) (EmptyCell!16933) )
))
(declare-fun mapValue!55123 () ValueCell!16933)

(declare-fun mapRest!55123 () (Array (_ BitVec 32) ValueCell!16933))

(declare-datatypes ((array!88290 0))(
  ( (array!88291 (arr!42625 (Array (_ BitVec 32) ValueCell!16933)) (size!43175 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88290)

(assert (=> mapNonEmpty!55123 (= (arr!42625 _values!1354) (store mapRest!55123 mapKey!55123 mapValue!55123))))

(declare-fun b!1315406 () Bool)

(declare-fun e!750360 () Bool)

(declare-fun e!750362 () Bool)

(assert (=> b!1315406 (= e!750360 (and e!750362 mapRes!55123))))

(declare-fun condMapEmpty!55123 () Bool)

(declare-fun mapDefault!55123 () ValueCell!16933)

