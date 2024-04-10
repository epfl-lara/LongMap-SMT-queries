; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108974 () Bool)

(assert start!108974)

(declare-fun b_free!28463 () Bool)

(declare-fun b_next!28463 () Bool)

(assert (=> start!108974 (= b_free!28463 (not b_next!28463))))

(declare-fun tp!100508 () Bool)

(declare-fun b_and!46553 () Bool)

(assert (=> start!108974 (= tp!100508 b_and!46553)))

(declare-fun b!1287663 () Bool)

(declare-fun res!855203 () Bool)

(declare-fun e!735350 () Bool)

(assert (=> b!1287663 (=> (not res!855203) (not e!735350))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85256 0))(
  ( (array!85257 (arr!41129 (Array (_ BitVec 32) (_ BitVec 64))) (size!41679 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85256)

(assert (=> b!1287663 (= res!855203 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41679 _keys!1741))))))

(declare-fun mapIsEmpty!52715 () Bool)

(declare-fun mapRes!52715 () Bool)

(assert (=> mapIsEmpty!52715 mapRes!52715))

(declare-fun b!1287664 () Bool)

(assert (=> b!1287664 (= e!735350 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50573 0))(
  ( (V!50574 (val!17126 Int)) )
))
(declare-datatypes ((tuple2!21976 0))(
  ( (tuple2!21977 (_1!10999 (_ BitVec 64)) (_2!10999 V!50573)) )
))
(declare-datatypes ((List!29154 0))(
  ( (Nil!29151) (Cons!29150 (h!30359 tuple2!21976) (t!42718 List!29154)) )
))
(declare-datatypes ((ListLongMap!19633 0))(
  ( (ListLongMap!19634 (toList!9832 List!29154)) )
))
(declare-fun contains!7950 (ListLongMap!19633 (_ BitVec 64)) Bool)

(assert (=> b!1287664 (not (contains!7950 (ListLongMap!19634 Nil!29151) k!1205))))

(declare-datatypes ((Unit!42586 0))(
  ( (Unit!42587) )
))
(declare-fun lt!577886 () Unit!42586)

(declare-fun emptyContainsNothing!22 ((_ BitVec 64)) Unit!42586)

(assert (=> b!1287664 (= lt!577886 (emptyContainsNothing!22 k!1205))))

(declare-fun b!1287665 () Bool)

(declare-fun res!855198 () Bool)

(assert (=> b!1287665 (=> (not res!855198) (not e!735350))))

(declare-datatypes ((List!29155 0))(
  ( (Nil!29152) (Cons!29151 (h!30360 (_ BitVec 64)) (t!42719 List!29155)) )
))
(declare-fun arrayNoDuplicates!0 (array!85256 (_ BitVec 32) List!29155) Bool)

(assert (=> b!1287665 (= res!855198 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29152))))

(declare-fun b!1287666 () Bool)

(declare-fun e!735351 () Bool)

(declare-fun tp_is_empty!34103 () Bool)

(assert (=> b!1287666 (= e!735351 tp_is_empty!34103)))

(declare-fun b!1287668 () Bool)

(declare-fun res!855200 () Bool)

(assert (=> b!1287668 (=> (not res!855200) (not e!735350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287668 (= res!855200 (not (validKeyInArray!0 (select (arr!41129 _keys!1741) from!2144))))))

(declare-fun b!1287669 () Bool)

(declare-fun res!855197 () Bool)

(assert (=> b!1287669 (=> (not res!855197) (not e!735350))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85256 (_ BitVec 32)) Bool)

(assert (=> b!1287669 (= res!855197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287670 () Bool)

(declare-fun res!855202 () Bool)

(assert (=> b!1287670 (=> (not res!855202) (not e!735350))))

(declare-datatypes ((ValueCell!16153 0))(
  ( (ValueCellFull!16153 (v!19729 V!50573)) (EmptyCell!16153) )
))
(declare-datatypes ((array!85258 0))(
  ( (array!85259 (arr!41130 (Array (_ BitVec 32) ValueCell!16153)) (size!41680 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85258)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287670 (= res!855202 (and (= (size!41680 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41679 _keys!1741) (size!41680 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287671 () Bool)

(declare-fun e!735352 () Bool)

(assert (=> b!1287671 (= e!735352 tp_is_empty!34103)))

(declare-fun b!1287672 () Bool)

(declare-fun e!735349 () Bool)

(assert (=> b!1287672 (= e!735349 (and e!735352 mapRes!52715))))

(declare-fun condMapEmpty!52715 () Bool)

(declare-fun mapDefault!52715 () ValueCell!16153)

