; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113036 () Bool)

(assert start!113036)

(declare-fun b_free!31087 () Bool)

(declare-fun b_next!31087 () Bool)

(assert (=> start!113036 (= b_free!31087 (not b_next!31087))))

(declare-fun tp!109065 () Bool)

(declare-fun b_and!50117 () Bool)

(assert (=> start!113036 (= tp!109065 b_and!50117)))

(declare-fun mapIsEmpty!57337 () Bool)

(declare-fun mapRes!57337 () Bool)

(assert (=> mapIsEmpty!57337 mapRes!57337))

(declare-fun b!1339764 () Bool)

(declare-fun e!763132 () Bool)

(declare-fun e!763131 () Bool)

(assert (=> b!1339764 (= e!763132 (and e!763131 mapRes!57337))))

(declare-fun condMapEmpty!57337 () Bool)

(declare-datatypes ((V!54553 0))(
  ( (V!54554 (val!18618 Int)) )
))
(declare-datatypes ((ValueCell!17645 0))(
  ( (ValueCellFull!17645 (v!21266 V!54553)) (EmptyCell!17645) )
))
(declare-datatypes ((array!91030 0))(
  ( (array!91031 (arr!43971 (Array (_ BitVec 32) ValueCell!17645)) (size!44521 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91030)

(declare-fun mapDefault!57337 () ValueCell!17645)

