; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73594 () Bool)

(assert start!73594)

(declare-fun b_free!14509 () Bool)

(declare-fun b_next!14509 () Bool)

(assert (=> start!73594 (= b_free!14509 (not b_next!14509))))

(declare-fun tp!51031 () Bool)

(declare-fun b_and!23997 () Bool)

(assert (=> start!73594 (= tp!51031 b_and!23997)))

(declare-fun mapNonEmpty!26567 () Bool)

(declare-fun mapRes!26567 () Bool)

(declare-fun tp!51030 () Bool)

(declare-fun e!479766 () Bool)

(assert (=> mapNonEmpty!26567 (= mapRes!26567 (and tp!51030 e!479766))))

(declare-datatypes ((V!27241 0))(
  ( (V!27242 (val!8370 Int)) )
))
(declare-datatypes ((ValueCell!7883 0))(
  ( (ValueCellFull!7883 (v!10795 V!27241)) (EmptyCell!7883) )
))
(declare-fun mapValue!26567 () ValueCell!7883)

(declare-fun mapKey!26567 () (_ BitVec 32))

(declare-fun mapRest!26567 () (Array (_ BitVec 32) ValueCell!7883))

(declare-datatypes ((array!49462 0))(
  ( (array!49463 (arr!23762 (Array (_ BitVec 32) ValueCell!7883)) (size!24202 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49462)

(assert (=> mapNonEmpty!26567 (= (arr!23762 _values!688) (store mapRest!26567 mapKey!26567 mapValue!26567))))

(declare-fun b!861045 () Bool)

(declare-fun e!479773 () Bool)

(declare-fun tp_is_empty!16645 () Bool)

(assert (=> b!861045 (= e!479773 tp_is_empty!16645)))

(declare-fun b!861046 () Bool)

(declare-fun e!479770 () Bool)

(assert (=> b!861046 (= e!479770 (and e!479773 mapRes!26567))))

(declare-fun condMapEmpty!26567 () Bool)

(declare-fun mapDefault!26567 () ValueCell!7883)

