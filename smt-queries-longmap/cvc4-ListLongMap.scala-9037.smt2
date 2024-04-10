; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109010 () Bool)

(assert start!109010)

(declare-fun b_free!28499 () Bool)

(declare-fun b_next!28499 () Bool)

(assert (=> start!109010 (= b_free!28499 (not b_next!28499))))

(declare-fun tp!100615 () Bool)

(declare-fun b_and!46589 () Bool)

(assert (=> start!109010 (= tp!100615 b_and!46589)))

(declare-fun b!1288265 () Bool)

(declare-fun res!855645 () Bool)

(declare-fun e!735630 () Bool)

(assert (=> b!1288265 (=> (not res!855645) (not e!735630))))

(declare-datatypes ((array!85326 0))(
  ( (array!85327 (arr!41164 (Array (_ BitVec 32) (_ BitVec 64))) (size!41714 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85326)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85326 (_ BitVec 32)) Bool)

(assert (=> b!1288265 (= res!855645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288266 () Bool)

(declare-fun e!735627 () Bool)

(assert (=> b!1288266 (= e!735630 (not e!735627))))

(declare-fun res!855644 () Bool)

(assert (=> b!1288266 (=> res!855644 e!735627)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288266 (= res!855644 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50621 0))(
  ( (V!50622 (val!17144 Int)) )
))
(declare-datatypes ((tuple2!22006 0))(
  ( (tuple2!22007 (_1!11014 (_ BitVec 64)) (_2!11014 V!50621)) )
))
(declare-datatypes ((List!29180 0))(
  ( (Nil!29177) (Cons!29176 (h!30385 tuple2!22006) (t!42744 List!29180)) )
))
(declare-datatypes ((ListLongMap!19663 0))(
  ( (ListLongMap!19664 (toList!9847 List!29180)) )
))
(declare-fun contains!7965 (ListLongMap!19663 (_ BitVec 64)) Bool)

(assert (=> b!1288266 (not (contains!7965 (ListLongMap!19664 Nil!29177) k!1205))))

(declare-datatypes ((Unit!42614 0))(
  ( (Unit!42615) )
))
(declare-fun lt!577948 () Unit!42614)

(declare-fun emptyContainsNothing!36 ((_ BitVec 64)) Unit!42614)

(assert (=> b!1288266 (= lt!577948 (emptyContainsNothing!36 k!1205))))

(declare-fun b!1288267 () Bool)

(declare-fun res!855638 () Bool)

(assert (=> b!1288267 (=> (not res!855638) (not e!735630))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1288267 (= res!855638 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41714 _keys!1741))))))

(declare-fun b!1288268 () Bool)

(declare-fun res!855641 () Bool)

(assert (=> b!1288268 (=> (not res!855641) (not e!735630))))

(declare-datatypes ((List!29181 0))(
  ( (Nil!29178) (Cons!29177 (h!30386 (_ BitVec 64)) (t!42745 List!29181)) )
))
(declare-fun arrayNoDuplicates!0 (array!85326 (_ BitVec 32) List!29181) Bool)

(assert (=> b!1288268 (= res!855641 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29178))))

(declare-fun b!1288269 () Bool)

(declare-fun e!735629 () Bool)

(declare-fun tp_is_empty!34139 () Bool)

(assert (=> b!1288269 (= e!735629 tp_is_empty!34139)))

(declare-fun b!1288270 () Bool)

(declare-fun e!735631 () Bool)

(declare-fun e!735632 () Bool)

(declare-fun mapRes!52769 () Bool)

(assert (=> b!1288270 (= e!735631 (and e!735632 mapRes!52769))))

(declare-fun condMapEmpty!52769 () Bool)

(declare-datatypes ((ValueCell!16171 0))(
  ( (ValueCellFull!16171 (v!19747 V!50621)) (EmptyCell!16171) )
))
(declare-datatypes ((array!85328 0))(
  ( (array!85329 (arr!41165 (Array (_ BitVec 32) ValueCell!16171)) (size!41715 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85328)

(declare-fun mapDefault!52769 () ValueCell!16171)

