; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83178 () Bool)

(assert start!83178)

(declare-fun b_free!19171 () Bool)

(declare-fun b_next!19171 () Bool)

(assert (=> start!83178 (= b_free!19171 (not b_next!19171))))

(declare-fun tp!66791 () Bool)

(declare-fun b_and!30659 () Bool)

(assert (=> start!83178 (= tp!66791 b_and!30659)))

(declare-fun b!970412 () Bool)

(declare-fun e!547084 () Bool)

(declare-fun e!547083 () Bool)

(declare-fun mapRes!35113 () Bool)

(assert (=> b!970412 (= e!547084 (and e!547083 mapRes!35113))))

(declare-fun condMapEmpty!35113 () Bool)

(declare-datatypes ((V!34409 0))(
  ( (V!34410 (val!11085 Int)) )
))
(declare-datatypes ((ValueCell!10553 0))(
  ( (ValueCellFull!10553 (v!13644 V!34409)) (EmptyCell!10553) )
))
(declare-datatypes ((array!60195 0))(
  ( (array!60196 (arr!28961 (Array (_ BitVec 32) ValueCell!10553)) (size!29440 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60195)

(declare-fun mapDefault!35113 () ValueCell!10553)

