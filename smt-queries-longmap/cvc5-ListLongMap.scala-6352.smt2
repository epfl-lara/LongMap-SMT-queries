; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81848 () Bool)

(assert start!81848)

(declare-fun b_free!18343 () Bool)

(declare-fun b_next!18343 () Bool)

(assert (=> start!81848 (= b_free!18343 (not b_next!18343))))

(declare-fun tp!63728 () Bool)

(declare-fun b_and!29829 () Bool)

(assert (=> start!81848 (= tp!63728 b_and!29829)))

(declare-fun b!954508 () Bool)

(declare-fun e!537759 () Bool)

(declare-fun e!537762 () Bool)

(declare-fun mapRes!33292 () Bool)

(assert (=> b!954508 (= e!537759 (and e!537762 mapRes!33292))))

(declare-fun condMapEmpty!33292 () Bool)

(declare-datatypes ((V!32833 0))(
  ( (V!32834 (val!10494 Int)) )
))
(declare-datatypes ((ValueCell!9962 0))(
  ( (ValueCellFull!9962 (v!13049 V!32833)) (EmptyCell!9962) )
))
(declare-datatypes ((array!57887 0))(
  ( (array!57888 (arr!27823 (Array (_ BitVec 32) ValueCell!9962)) (size!28302 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57887)

(declare-fun mapDefault!33292 () ValueCell!9962)

