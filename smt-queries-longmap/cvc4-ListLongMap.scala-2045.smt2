; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35442 () Bool)

(assert start!35442)

(declare-fun b_free!7829 () Bool)

(declare-fun b_next!7829 () Bool)

(assert (=> start!35442 (= b_free!7829 (not b_next!7829))))

(declare-fun tp!27272 () Bool)

(declare-fun b_and!15071 () Bool)

(assert (=> start!35442 (= tp!27272 b_and!15071)))

(declare-fun b!354920 () Bool)

(declare-fun res!196801 () Bool)

(declare-fun e!217510 () Bool)

(assert (=> b!354920 (=> (not res!196801) (not e!217510))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11503 0))(
  ( (V!11504 (val!3992 Int)) )
))
(declare-datatypes ((ValueCell!3604 0))(
  ( (ValueCellFull!3604 (v!6186 V!11503)) (EmptyCell!3604) )
))
(declare-datatypes ((array!19371 0))(
  ( (array!19372 (arr!9179 (Array (_ BitVec 32) ValueCell!3604)) (size!9531 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19371)

(declare-datatypes ((array!19373 0))(
  ( (array!19374 (arr!9180 (Array (_ BitVec 32) (_ BitVec 64))) (size!9532 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19373)

(assert (=> b!354920 (= res!196801 (and (= (size!9531 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9532 _keys!1456) (size!9531 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354921 () Bool)

(declare-fun res!196797 () Bool)

(assert (=> b!354921 (=> (not res!196797) (not e!217510))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!354921 (= res!196797 (= (select (arr!9180 _keys!1456) from!1805) k!1077))))

(declare-fun b!354922 () Bool)

(declare-fun e!217507 () Bool)

(declare-fun e!217509 () Bool)

(declare-fun mapRes!13350 () Bool)

(assert (=> b!354922 (= e!217507 (and e!217509 mapRes!13350))))

(declare-fun condMapEmpty!13350 () Bool)

(declare-fun mapDefault!13350 () ValueCell!3604)

