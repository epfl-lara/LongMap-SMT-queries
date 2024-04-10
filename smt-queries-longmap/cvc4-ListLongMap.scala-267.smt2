; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4404 () Bool)

(assert start!4404)

(declare-fun b_free!1193 () Bool)

(declare-fun b_next!1193 () Bool)

(assert (=> start!4404 (= b_free!1193 (not b_next!1193))))

(declare-fun tp!5014 () Bool)

(declare-fun b_and!2013 () Bool)

(assert (=> start!4404 (= tp!5014 b_and!2013)))

(declare-fun mapNonEmpty!1864 () Bool)

(declare-fun mapRes!1864 () Bool)

(declare-fun tp!5013 () Bool)

(declare-fun e!21565 () Bool)

(assert (=> mapNonEmpty!1864 (= mapRes!1864 (and tp!5013 e!21565))))

(declare-datatypes ((V!1887 0))(
  ( (V!1888 (val!800 Int)) )
))
(declare-datatypes ((ValueCell!574 0))(
  ( (ValueCellFull!574 (v!1894 V!1887)) (EmptyCell!574) )
))
(declare-fun mapValue!1864 () ValueCell!574)

(declare-datatypes ((array!2309 0))(
  ( (array!2310 (arr!1103 (Array (_ BitVec 32) ValueCell!574)) (size!1204 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2309)

(declare-fun mapRest!1864 () (Array (_ BitVec 32) ValueCell!574))

(declare-fun mapKey!1864 () (_ BitVec 32))

(assert (=> mapNonEmpty!1864 (= (arr!1103 _values!1501) (store mapRest!1864 mapKey!1864 mapValue!1864))))

(declare-fun b!33962 () Bool)

(declare-fun res!20603 () Bool)

(declare-fun e!21567 () Bool)

(assert (=> b!33962 (=> (not res!20603) (not e!21567))))

(declare-datatypes ((array!2311 0))(
  ( (array!2312 (arr!1104 (Array (_ BitVec 32) (_ BitVec 64))) (size!1205 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2311)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33962 (= res!20603 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33963 () Bool)

(declare-fun e!21569 () Bool)

(declare-fun e!21568 () Bool)

(assert (=> b!33963 (= e!21569 (and e!21568 mapRes!1864))))

(declare-fun condMapEmpty!1864 () Bool)

(declare-fun mapDefault!1864 () ValueCell!574)

