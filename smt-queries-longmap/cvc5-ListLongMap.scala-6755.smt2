; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84734 () Bool)

(assert start!84734)

(declare-fun b_free!20089 () Bool)

(declare-fun b_next!20089 () Bool)

(assert (=> start!84734 (= b_free!20089 (not b_next!20089))))

(declare-fun tp!70065 () Bool)

(declare-fun b_and!32259 () Bool)

(assert (=> start!84734 (= tp!70065 b_and!32259)))

(declare-fun b!990888 () Bool)

(declare-fun res!662482 () Bool)

(declare-fun e!558753 () Bool)

(assert (=> b!990888 (=> (not res!662482) (not e!558753))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36057 0))(
  ( (V!36058 (val!11703 Int)) )
))
(declare-datatypes ((ValueCell!11171 0))(
  ( (ValueCellFull!11171 (v!14276 V!36057)) (EmptyCell!11171) )
))
(declare-datatypes ((array!62573 0))(
  ( (array!62574 (arr!30137 (Array (_ BitVec 32) ValueCell!11171)) (size!30616 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62573)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62575 0))(
  ( (array!62576 (arr!30138 (Array (_ BitVec 32) (_ BitVec 64))) (size!30617 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62575)

(assert (=> b!990888 (= res!662482 (and (= (size!30616 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30617 _keys!1544) (size!30616 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37010 () Bool)

(declare-fun mapRes!37010 () Bool)

(assert (=> mapIsEmpty!37010 mapRes!37010))

(declare-fun b!990889 () Bool)

(declare-fun e!558754 () Bool)

(declare-fun tp_is_empty!23305 () Bool)

(assert (=> b!990889 (= e!558754 tp_is_empty!23305)))

(declare-fun b!990890 () Bool)

(declare-fun e!558751 () Bool)

(assert (=> b!990890 (= e!558751 (and e!558754 mapRes!37010))))

(declare-fun condMapEmpty!37010 () Bool)

(declare-fun mapDefault!37010 () ValueCell!11171)

