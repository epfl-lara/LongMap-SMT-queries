; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40596 () Bool)

(assert start!40596)

(declare-fun b_free!10607 () Bool)

(declare-fun b_next!10607 () Bool)

(assert (=> start!40596 (= b_free!10607 (not b_next!10607))))

(declare-fun tp!37641 () Bool)

(declare-fun b_and!18615 () Bool)

(assert (=> start!40596 (= tp!37641 b_and!18615)))

(declare-fun b!447827 () Bool)

(declare-fun res!266054 () Bool)

(declare-fun e!262882 () Bool)

(assert (=> b!447827 (=> (not res!266054) (not e!262882))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447827 (= res!266054 (bvsle from!863 i!563))))

(declare-fun b!447828 () Bool)

(declare-fun res!266055 () Bool)

(declare-fun e!262886 () Bool)

(assert (=> b!447828 (=> (not res!266055) (not e!262886))))

(declare-datatypes ((array!27697 0))(
  ( (array!27698 (arr!13294 (Array (_ BitVec 32) (_ BitVec 64))) (size!13646 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27697)

(assert (=> b!447828 (= res!266055 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13646 _keys!709))))))

(declare-fun b!447829 () Bool)

(declare-fun e!262885 () Bool)

(declare-fun e!262884 () Bool)

(declare-fun mapRes!19551 () Bool)

(assert (=> b!447829 (= e!262885 (and e!262884 mapRes!19551))))

(declare-fun condMapEmpty!19551 () Bool)

(declare-datatypes ((V!17031 0))(
  ( (V!17032 (val!6017 Int)) )
))
(declare-datatypes ((ValueCell!5629 0))(
  ( (ValueCellFull!5629 (v!8272 V!17031)) (EmptyCell!5629) )
))
(declare-datatypes ((array!27699 0))(
  ( (array!27700 (arr!13295 (Array (_ BitVec 32) ValueCell!5629)) (size!13647 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27699)

(declare-fun mapDefault!19551 () ValueCell!5629)

