; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3906 () Bool)

(assert start!3906)

(declare-fun b_free!811 () Bool)

(declare-fun b_next!811 () Bool)

(assert (=> start!3906 (= b_free!811 (not b_next!811))))

(declare-fun tp!3853 () Bool)

(declare-fun b_and!1621 () Bool)

(assert (=> start!3906 (= tp!3853 b_and!1621)))

(declare-fun b!27546 () Bool)

(declare-fun e!17931 () Bool)

(declare-fun e!17932 () Bool)

(declare-fun mapRes!1276 () Bool)

(assert (=> b!27546 (= e!17931 (and e!17932 mapRes!1276))))

(declare-fun condMapEmpty!1276 () Bool)

(declare-datatypes ((V!1379 0))(
  ( (V!1380 (val!609 Int)) )
))
(declare-datatypes ((ValueCell!383 0))(
  ( (ValueCellFull!383 (v!1698 V!1379)) (EmptyCell!383) )
))
(declare-datatypes ((array!1573 0))(
  ( (array!1574 (arr!740 (Array (_ BitVec 32) ValueCell!383)) (size!841 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1573)

(declare-fun mapDefault!1276 () ValueCell!383)

