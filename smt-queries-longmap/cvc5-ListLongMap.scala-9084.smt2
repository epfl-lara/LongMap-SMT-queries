; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109288 () Bool)

(assert start!109288)

(declare-fun b_free!28777 () Bool)

(declare-fun b_next!28777 () Bool)

(assert (=> start!109288 (= b_free!28777 (not b_next!28777))))

(declare-fun tp!101450 () Bool)

(declare-fun b_and!46867 () Bool)

(assert (=> start!109288 (= tp!101450 b_and!46867)))

(declare-fun b!1293188 () Bool)

(declare-fun res!859312 () Bool)

(declare-fun e!738052 () Bool)

(assert (=> b!1293188 (=> (not res!859312) (not e!738052))))

(declare-datatypes ((array!85864 0))(
  ( (array!85865 (arr!41433 (Array (_ BitVec 32) (_ BitVec 64))) (size!41983 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85864)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293188 (= res!859312 (not (validKeyInArray!0 (select (arr!41433 _keys!1741) from!2144))))))

(declare-fun b!1293189 () Bool)

(declare-fun e!738053 () Bool)

(declare-fun e!738050 () Bool)

(declare-fun mapRes!53186 () Bool)

(assert (=> b!1293189 (= e!738053 (and e!738050 mapRes!53186))))

(declare-fun condMapEmpty!53186 () Bool)

(declare-datatypes ((V!50993 0))(
  ( (V!50994 (val!17283 Int)) )
))
(declare-datatypes ((ValueCell!16310 0))(
  ( (ValueCellFull!16310 (v!19886 V!50993)) (EmptyCell!16310) )
))
(declare-datatypes ((array!85866 0))(
  ( (array!85867 (arr!41434 (Array (_ BitVec 32) ValueCell!16310)) (size!41984 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85866)

(declare-fun mapDefault!53186 () ValueCell!16310)

