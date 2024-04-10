; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111686 () Bool)

(assert start!111686)

(declare-fun b_free!30343 () Bool)

(declare-fun b_next!30343 () Bool)

(assert (=> start!111686 (= b_free!30343 (not b_next!30343))))

(declare-fun tp!106505 () Bool)

(declare-fun b_and!48845 () Bool)

(assert (=> start!111686 (= tp!106505 b_and!48845)))

(declare-fun b!1323220 () Bool)

(declare-fun e!754413 () Bool)

(declare-fun e!754412 () Bool)

(declare-fun mapRes!55892 () Bool)

(assert (=> b!1323220 (= e!754413 (and e!754412 mapRes!55892))))

(declare-fun condMapEmpty!55892 () Bool)

(declare-datatypes ((V!53321 0))(
  ( (V!53322 (val!18156 Int)) )
))
(declare-datatypes ((ValueCell!17183 0))(
  ( (ValueCellFull!17183 (v!20786 V!53321)) (EmptyCell!17183) )
))
(declare-datatypes ((array!89246 0))(
  ( (array!89247 (arr!43097 (Array (_ BitVec 32) ValueCell!17183)) (size!43647 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89246)

(declare-fun mapDefault!55892 () ValueCell!17183)

