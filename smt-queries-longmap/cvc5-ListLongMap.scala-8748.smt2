; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106166 () Bool)

(assert start!106166)

(declare-fun b_free!27523 () Bool)

(declare-fun b_next!27523 () Bool)

(assert (=> start!106166 (= b_free!27523 (not b_next!27523))))

(declare-fun tp!96130 () Bool)

(declare-fun b_and!45543 () Bool)

(assert (=> start!106166 (= tp!96130 b_and!45543)))

(declare-fun b!1264050 () Bool)

(declare-fun e!719728 () Bool)

(declare-fun e!719726 () Bool)

(declare-fun mapRes!50470 () Bool)

(assert (=> b!1264050 (= e!719728 (and e!719726 mapRes!50470))))

(declare-fun condMapEmpty!50470 () Bool)

(declare-datatypes ((V!48599 0))(
  ( (V!48600 (val!16275 Int)) )
))
(declare-datatypes ((ValueCell!15449 0))(
  ( (ValueCellFull!15449 (v!18988 V!48599)) (EmptyCell!15449) )
))
(declare-datatypes ((array!82478 0))(
  ( (array!82479 (arr!39782 (Array (_ BitVec 32) ValueCell!15449)) (size!40318 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82478)

(declare-fun mapDefault!50470 () ValueCell!15449)

