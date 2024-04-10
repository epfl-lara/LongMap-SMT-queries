; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97830 () Bool)

(assert start!97830)

(declare-fun b_free!23531 () Bool)

(declare-fun b_next!23531 () Bool)

(assert (=> start!97830 (= b_free!23531 (not b_next!23531))))

(declare-fun tp!83296 () Bool)

(declare-fun b_and!37845 () Bool)

(assert (=> start!97830 (= tp!83296 b_and!37845)))

(declare-fun mapNonEmpty!43909 () Bool)

(declare-fun mapRes!43909 () Bool)

(declare-fun tp!83297 () Bool)

(declare-fun e!637616 () Bool)

(assert (=> mapNonEmpty!43909 (= mapRes!43909 (and tp!83297 e!637616))))

(declare-datatypes ((V!42541 0))(
  ( (V!42542 (val!14087 Int)) )
))
(declare-datatypes ((ValueCell!13321 0))(
  ( (ValueCellFull!13321 (v!16720 V!42541)) (EmptyCell!13321) )
))
(declare-fun mapRest!43909 () (Array (_ BitVec 32) ValueCell!13321))

(declare-datatypes ((array!73007 0))(
  ( (array!73008 (arr!35156 (Array (_ BitVec 32) ValueCell!13321)) (size!35692 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73007)

(declare-fun mapValue!43909 () ValueCell!13321)

(declare-fun mapKey!43909 () (_ BitVec 32))

(assert (=> mapNonEmpty!43909 (= (arr!35156 _values!996) (store mapRest!43909 mapKey!43909 mapValue!43909))))

(declare-fun mapIsEmpty!43909 () Bool)

(assert (=> mapIsEmpty!43909 mapRes!43909))

(declare-fun b!1119606 () Bool)

(declare-fun e!637611 () Bool)

(declare-fun tp_is_empty!28061 () Bool)

(assert (=> b!1119606 (= e!637611 tp_is_empty!28061)))

(declare-fun b!1119607 () Bool)

(declare-fun e!637617 () Bool)

(assert (=> b!1119607 (= e!637617 (and e!637611 mapRes!43909))))

(declare-fun condMapEmpty!43909 () Bool)

(declare-fun mapDefault!43909 () ValueCell!13321)

