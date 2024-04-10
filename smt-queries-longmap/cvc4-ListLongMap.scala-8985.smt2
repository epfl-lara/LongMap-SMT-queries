; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108674 () Bool)

(assert start!108674)

(declare-fun b_free!28187 () Bool)

(declare-fun b_next!28187 () Bool)

(assert (=> start!108674 (= b_free!28187 (not b_next!28187))))

(declare-fun tp!99676 () Bool)

(declare-fun b_and!46253 () Bool)

(assert (=> start!108674 (= tp!99676 b_and!46253)))

(declare-fun mapNonEmpty!52298 () Bool)

(declare-fun mapRes!52298 () Bool)

(declare-fun tp!99677 () Bool)

(declare-fun e!732961 () Bool)

(assert (=> mapNonEmpty!52298 (= mapRes!52298 (and tp!99677 e!732961))))

(declare-fun mapKey!52298 () (_ BitVec 32))

(declare-datatypes ((V!50205 0))(
  ( (V!50206 (val!16988 Int)) )
))
(declare-datatypes ((ValueCell!16015 0))(
  ( (ValueCellFull!16015 (v!19590 V!50205)) (EmptyCell!16015) )
))
(declare-fun mapValue!52298 () ValueCell!16015)

(declare-fun mapRest!52298 () (Array (_ BitVec 32) ValueCell!16015))

(declare-datatypes ((array!84722 0))(
  ( (array!84723 (arr!40863 (Array (_ BitVec 32) ValueCell!16015)) (size!41413 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84722)

(assert (=> mapNonEmpty!52298 (= (arr!40863 _values!1445) (store mapRest!52298 mapKey!52298 mapValue!52298))))

(declare-fun b!1282806 () Bool)

(declare-fun e!732965 () Bool)

(declare-fun tp_is_empty!33827 () Bool)

(assert (=> b!1282806 (= e!732965 tp_is_empty!33827)))

(declare-fun mapIsEmpty!52298 () Bool)

(assert (=> mapIsEmpty!52298 mapRes!52298))

(declare-fun b!1282807 () Bool)

(declare-fun res!852073 () Bool)

(declare-fun e!732963 () Bool)

(assert (=> b!1282807 (=> (not res!852073) (not e!732963))))

(declare-datatypes ((array!84724 0))(
  ( (array!84725 (arr!40864 (Array (_ BitVec 32) (_ BitVec 64))) (size!41414 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84724)

(declare-datatypes ((List!28952 0))(
  ( (Nil!28949) (Cons!28948 (h!30157 (_ BitVec 64)) (t!42496 List!28952)) )
))
(declare-fun arrayNoDuplicates!0 (array!84724 (_ BitVec 32) List!28952) Bool)

(assert (=> b!1282807 (= res!852073 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28949))))

(declare-fun b!1282808 () Bool)

(declare-fun res!852076 () Bool)

(assert (=> b!1282808 (=> (not res!852076) (not e!732963))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282808 (= res!852076 (validKeyInArray!0 (select (arr!40864 _keys!1741) from!2144)))))

(declare-fun b!1282809 () Bool)

(declare-fun e!732962 () Bool)

(assert (=> b!1282809 (= e!732962 (and e!732965 mapRes!52298))))

(declare-fun condMapEmpty!52298 () Bool)

(declare-fun mapDefault!52298 () ValueCell!16015)

