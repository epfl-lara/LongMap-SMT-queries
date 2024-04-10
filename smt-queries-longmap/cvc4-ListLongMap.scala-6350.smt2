; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81840 () Bool)

(assert start!81840)

(declare-fun b_free!18335 () Bool)

(declare-fun b_next!18335 () Bool)

(assert (=> start!81840 (= b_free!18335 (not b_next!18335))))

(declare-fun tp!63705 () Bool)

(declare-fun b_and!29821 () Bool)

(assert (=> start!81840 (= tp!63705 b_and!29821)))

(declare-fun b!954400 () Bool)

(declare-fun res!639113 () Bool)

(declare-fun e!537703 () Bool)

(assert (=> b!954400 (=> (not res!639113) (not e!537703))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57871 0))(
  ( (array!57872 (arr!27815 (Array (_ BitVec 32) (_ BitVec 64))) (size!28294 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57871)

(declare-datatypes ((V!32821 0))(
  ( (V!32822 (val!10490 Int)) )
))
(declare-datatypes ((ValueCell!9958 0))(
  ( (ValueCellFull!9958 (v!13045 V!32821)) (EmptyCell!9958) )
))
(declare-datatypes ((array!57873 0))(
  ( (array!57874 (arr!27816 (Array (_ BitVec 32) ValueCell!9958)) (size!28295 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57873)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954400 (= res!639113 (and (= (size!28295 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28294 _keys!1441) (size!28295 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639109 () Bool)

(assert (=> start!81840 (=> (not res!639109) (not e!537703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81840 (= res!639109 (validMask!0 mask!1823))))

(assert (=> start!81840 e!537703))

(assert (=> start!81840 true))

(declare-fun tp_is_empty!20879 () Bool)

(assert (=> start!81840 tp_is_empty!20879))

(declare-fun array_inv!21595 (array!57871) Bool)

(assert (=> start!81840 (array_inv!21595 _keys!1441)))

(declare-fun e!537699 () Bool)

(declare-fun array_inv!21596 (array!57873) Bool)

(assert (=> start!81840 (and (array_inv!21596 _values!1197) e!537699)))

(assert (=> start!81840 tp!63705))

(declare-fun mapNonEmpty!33280 () Bool)

(declare-fun mapRes!33280 () Bool)

(declare-fun tp!63704 () Bool)

(declare-fun e!537701 () Bool)

(assert (=> mapNonEmpty!33280 (= mapRes!33280 (and tp!63704 e!537701))))

(declare-fun mapKey!33280 () (_ BitVec 32))

(declare-fun mapValue!33280 () ValueCell!9958)

(declare-fun mapRest!33280 () (Array (_ BitVec 32) ValueCell!9958))

(assert (=> mapNonEmpty!33280 (= (arr!27816 _values!1197) (store mapRest!33280 mapKey!33280 mapValue!33280))))

(declare-fun b!954401 () Bool)

(declare-fun e!537702 () Bool)

(assert (=> b!954401 (= e!537702 tp_is_empty!20879)))

(declare-fun b!954402 () Bool)

(assert (=> b!954402 (= e!537699 (and e!537702 mapRes!33280))))

(declare-fun condMapEmpty!33280 () Bool)

(declare-fun mapDefault!33280 () ValueCell!9958)

