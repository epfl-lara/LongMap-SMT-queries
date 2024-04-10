; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109058 () Bool)

(assert start!109058)

(declare-fun b_free!28547 () Bool)

(declare-fun b_next!28547 () Bool)

(assert (=> start!109058 (= b_free!28547 (not b_next!28547))))

(declare-fun tp!100759 () Bool)

(declare-fun b_and!46637 () Bool)

(assert (=> start!109058 (= tp!100759 b_and!46637)))

(declare-fun mapIsEmpty!52841 () Bool)

(declare-fun mapRes!52841 () Bool)

(assert (=> mapIsEmpty!52841 mapRes!52841))

(declare-fun mapNonEmpty!52841 () Bool)

(declare-fun tp!100760 () Bool)

(declare-fun e!736060 () Bool)

(assert (=> mapNonEmpty!52841 (= mapRes!52841 (and tp!100760 e!736060))))

(declare-fun mapKey!52841 () (_ BitVec 32))

(declare-datatypes ((V!50685 0))(
  ( (V!50686 (val!17168 Int)) )
))
(declare-datatypes ((ValueCell!16195 0))(
  ( (ValueCellFull!16195 (v!19771 V!50685)) (EmptyCell!16195) )
))
(declare-datatypes ((array!85416 0))(
  ( (array!85417 (arr!41209 (Array (_ BitVec 32) ValueCell!16195)) (size!41759 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85416)

(declare-fun mapRest!52841 () (Array (_ BitVec 32) ValueCell!16195))

(declare-fun mapValue!52841 () ValueCell!16195)

(assert (=> mapNonEmpty!52841 (= (arr!41209 _values!1445) (store mapRest!52841 mapKey!52841 mapValue!52841))))

(declare-fun b!1289129 () Bool)

(declare-fun res!856289 () Bool)

(declare-fun e!736059 () Bool)

(assert (=> b!1289129 (=> (not res!856289) (not e!736059))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85418 0))(
  ( (array!85419 (arr!41210 (Array (_ BitVec 32) (_ BitVec 64))) (size!41760 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85418)

(assert (=> b!1289129 (= res!856289 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41760 _keys!1741))))))

(declare-fun b!1289130 () Bool)

(declare-fun e!736062 () Bool)

(declare-fun e!736064 () Bool)

(assert (=> b!1289130 (= e!736062 (and e!736064 mapRes!52841))))

(declare-fun condMapEmpty!52841 () Bool)

(declare-fun mapDefault!52841 () ValueCell!16195)

