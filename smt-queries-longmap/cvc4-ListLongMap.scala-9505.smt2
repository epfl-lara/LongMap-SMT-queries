; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112726 () Bool)

(assert start!112726)

(declare-fun b_free!31037 () Bool)

(declare-fun b_next!31037 () Bool)

(assert (=> start!112726 (= b_free!31037 (not b_next!31037))))

(declare-fun tp!108754 () Bool)

(declare-fun b_and!50015 () Bool)

(assert (=> start!112726 (= tp!108754 b_and!50015)))

(declare-fun b!1337168 () Bool)

(declare-fun e!761424 () Bool)

(declare-fun e!761422 () Bool)

(declare-fun mapRes!57101 () Bool)

(assert (=> b!1337168 (= e!761424 (and e!761422 mapRes!57101))))

(declare-fun condMapEmpty!57101 () Bool)

(declare-datatypes ((V!54365 0))(
  ( (V!54366 (val!18548 Int)) )
))
(declare-datatypes ((ValueCell!17575 0))(
  ( (ValueCellFull!17575 (v!21189 V!54365)) (EmptyCell!17575) )
))
(declare-datatypes ((array!90754 0))(
  ( (array!90755 (arr!43841 (Array (_ BitVec 32) ValueCell!17575)) (size!44391 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90754)

(declare-fun mapDefault!57101 () ValueCell!17575)

