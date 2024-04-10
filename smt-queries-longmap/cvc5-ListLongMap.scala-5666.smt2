; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73780 () Bool)

(assert start!73780)

(declare-fun b_free!14695 () Bool)

(declare-fun b_next!14695 () Bool)

(assert (=> start!73780 (= b_free!14695 (not b_next!14695))))

(declare-fun tp!51589 () Bool)

(declare-fun b_and!24369 () Bool)

(assert (=> start!73780 (= tp!51589 b_and!24369)))

(declare-fun res!588167 () Bool)

(declare-fun e!482210 () Bool)

(assert (=> start!73780 (=> (not res!588167) (not e!482210))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49822 0))(
  ( (array!49823 (arr!23942 (Array (_ BitVec 32) (_ BitVec 64))) (size!24382 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49822)

(assert (=> start!73780 (= res!588167 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24382 _keys!868))))))

(assert (=> start!73780 e!482210))

(declare-fun tp_is_empty!16831 () Bool)

(assert (=> start!73780 tp_is_empty!16831))

(assert (=> start!73780 true))

(assert (=> start!73780 tp!51589))

(declare-fun array_inv!18928 (array!49822) Bool)

(assert (=> start!73780 (array_inv!18928 _keys!868)))

(declare-datatypes ((V!27489 0))(
  ( (V!27490 (val!8463 Int)) )
))
(declare-datatypes ((ValueCell!7976 0))(
  ( (ValueCellFull!7976 (v!10888 V!27489)) (EmptyCell!7976) )
))
(declare-datatypes ((array!49824 0))(
  ( (array!49825 (arr!23943 (Array (_ BitVec 32) ValueCell!7976)) (size!24383 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49824)

(declare-fun e!482213 () Bool)

(declare-fun array_inv!18929 (array!49824) Bool)

(assert (=> start!73780 (and (array_inv!18929 _values!688) e!482213)))

(declare-fun b!865625 () Bool)

(declare-fun e!482214 () Bool)

(declare-fun mapRes!26846 () Bool)

(assert (=> b!865625 (= e!482213 (and e!482214 mapRes!26846))))

(declare-fun condMapEmpty!26846 () Bool)

(declare-fun mapDefault!26846 () ValueCell!7976)

