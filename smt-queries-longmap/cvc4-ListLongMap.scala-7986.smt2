; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98760 () Bool)

(assert start!98760)

(declare-fun b_free!24365 () Bool)

(declare-fun b_next!24365 () Bool)

(assert (=> start!98760 (= b_free!24365 (not b_next!24365))))

(declare-fun tp!85805 () Bool)

(declare-fun b_and!39579 () Bool)

(assert (=> start!98760 (= tp!85805 b_and!39579)))

(declare-fun e!655091 () Bool)

(declare-datatypes ((array!74637 0))(
  ( (array!74638 (arr!35969 (Array (_ BitVec 32) (_ BitVec 64))) (size!36505 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74637)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1151802 () Bool)

(declare-fun arrayContainsKey!0 (array!74637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151802 (= e!655091 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151803 () Bool)

(declare-fun e!655093 () Bool)

(declare-fun e!655104 () Bool)

(declare-fun mapRes!45167 () Bool)

(assert (=> b!1151803 (= e!655093 (and e!655104 mapRes!45167))))

(declare-fun condMapEmpty!45167 () Bool)

(declare-datatypes ((V!43653 0))(
  ( (V!43654 (val!14504 Int)) )
))
(declare-datatypes ((ValueCell!13738 0))(
  ( (ValueCellFull!13738 (v!17141 V!43653)) (EmptyCell!13738) )
))
(declare-datatypes ((array!74639 0))(
  ( (array!74640 (arr!35970 (Array (_ BitVec 32) ValueCell!13738)) (size!36506 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74639)

(declare-fun mapDefault!45167 () ValueCell!13738)

