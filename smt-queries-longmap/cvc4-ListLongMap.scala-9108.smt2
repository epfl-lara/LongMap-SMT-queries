; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109436 () Bool)

(assert start!109436)

(declare-fun b_free!28925 () Bool)

(declare-fun b_next!28925 () Bool)

(assert (=> start!109436 (= b_free!28925 (not b_next!28925))))

(declare-fun tp!101894 () Bool)

(declare-fun b_and!47015 () Bool)

(assert (=> start!109436 (= tp!101894 b_and!47015)))

(declare-fun b!1295771 () Bool)

(declare-fun e!739302 () Bool)

(declare-fun tp_is_empty!34565 () Bool)

(assert (=> b!1295771 (= e!739302 tp_is_empty!34565)))

(declare-fun b!1295772 () Bool)

(declare-fun res!861228 () Bool)

(declare-fun e!739304 () Bool)

(assert (=> b!1295772 (=> (not res!861228) (not e!739304))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86150 0))(
  ( (array!86151 (arr!41576 (Array (_ BitVec 32) (_ BitVec 64))) (size!42126 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86150)

(assert (=> b!1295772 (= res!861228 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42126 _keys!1741))))))

(declare-fun b!1295773 () Bool)

(declare-fun res!861229 () Bool)

(assert (=> b!1295773 (=> (not res!861229) (not e!739304))))

(assert (=> b!1295773 (= res!861229 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42126 _keys!1741))))))

(declare-fun b!1295774 () Bool)

(declare-fun e!739303 () Bool)

(declare-fun mapRes!53408 () Bool)

(assert (=> b!1295774 (= e!739303 (and e!739302 mapRes!53408))))

(declare-fun condMapEmpty!53408 () Bool)

(declare-datatypes ((V!51189 0))(
  ( (V!51190 (val!17357 Int)) )
))
(declare-datatypes ((ValueCell!16384 0))(
  ( (ValueCellFull!16384 (v!19960 V!51189)) (EmptyCell!16384) )
))
(declare-datatypes ((array!86152 0))(
  ( (array!86153 (arr!41577 (Array (_ BitVec 32) ValueCell!16384)) (size!42127 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86152)

(declare-fun mapDefault!53408 () ValueCell!16384)

