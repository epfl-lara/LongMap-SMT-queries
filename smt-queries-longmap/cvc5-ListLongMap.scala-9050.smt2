; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109084 () Bool)

(assert start!109084)

(declare-fun b_free!28573 () Bool)

(declare-fun b_next!28573 () Bool)

(assert (=> start!109084 (= b_free!28573 (not b_next!28573))))

(declare-fun tp!100838 () Bool)

(declare-fun b_and!46663 () Bool)

(assert (=> start!109084 (= tp!100838 b_and!46663)))

(declare-fun b!1289597 () Bool)

(declare-fun res!856639 () Bool)

(declare-fun e!736293 () Bool)

(assert (=> b!1289597 (=> (not res!856639) (not e!736293))))

(declare-datatypes ((array!85468 0))(
  ( (array!85469 (arr!41235 (Array (_ BitVec 32) (_ BitVec 64))) (size!41785 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85468)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289597 (= res!856639 (not (validKeyInArray!0 (select (arr!41235 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52880 () Bool)

(declare-fun mapRes!52880 () Bool)

(assert (=> mapIsEmpty!52880 mapRes!52880))

(declare-fun b!1289598 () Bool)

(declare-fun e!736295 () Bool)

(declare-fun e!736298 () Bool)

(assert (=> b!1289598 (= e!736295 (and e!736298 mapRes!52880))))

(declare-fun condMapEmpty!52880 () Bool)

(declare-datatypes ((V!50721 0))(
  ( (V!50722 (val!17181 Int)) )
))
(declare-datatypes ((ValueCell!16208 0))(
  ( (ValueCellFull!16208 (v!19784 V!50721)) (EmptyCell!16208) )
))
(declare-datatypes ((array!85470 0))(
  ( (array!85471 (arr!41236 (Array (_ BitVec 32) ValueCell!16208)) (size!41786 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85470)

(declare-fun mapDefault!52880 () ValueCell!16208)

