; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83134 () Bool)

(assert start!83134)

(declare-fun b_free!19127 () Bool)

(declare-fun b_next!19127 () Bool)

(assert (=> start!83134 (= b_free!19127 (not b_next!19127))))

(declare-fun tp!66660 () Bool)

(declare-fun b_and!30615 () Bool)

(assert (=> start!83134 (= tp!66660 b_and!30615)))

(declare-fun b!969809 () Bool)

(declare-fun e!546752 () Bool)

(declare-fun e!546753 () Bool)

(declare-fun mapRes!35047 () Bool)

(assert (=> b!969809 (= e!546752 (and e!546753 mapRes!35047))))

(declare-fun condMapEmpty!35047 () Bool)

(declare-datatypes ((V!34349 0))(
  ( (V!34350 (val!11063 Int)) )
))
(declare-datatypes ((ValueCell!10531 0))(
  ( (ValueCellFull!10531 (v!13622 V!34349)) (EmptyCell!10531) )
))
(declare-datatypes ((array!60113 0))(
  ( (array!60114 (arr!28920 (Array (_ BitVec 32) ValueCell!10531)) (size!29399 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60113)

(declare-fun mapDefault!35047 () ValueCell!10531)

