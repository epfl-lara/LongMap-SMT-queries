; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37728 () Bool)

(assert start!37728)

(declare-fun b_free!8831 () Bool)

(declare-fun b_next!8831 () Bool)

(assert (=> start!37728 (= b_free!8831 (not b_next!8831))))

(declare-fun tp!31245 () Bool)

(declare-fun b_and!16073 () Bool)

(assert (=> start!37728 (= tp!31245 b_and!16073)))

(declare-fun res!220975 () Bool)

(declare-fun e!234649 () Bool)

(assert (=> start!37728 (=> (not res!220975) (not e!234649))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37728 (= res!220975 (validMask!0 mask!970))))

(assert (=> start!37728 e!234649))

(declare-datatypes ((V!13775 0))(
  ( (V!13776 (val!4796 Int)) )
))
(declare-datatypes ((ValueCell!4408 0))(
  ( (ValueCellFull!4408 (v!6993 V!13775)) (EmptyCell!4408) )
))
(declare-datatypes ((array!22899 0))(
  ( (array!22900 (arr!10918 (Array (_ BitVec 32) ValueCell!4408)) (size!11270 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22899)

(declare-fun e!234645 () Bool)

(declare-fun array_inv!8032 (array!22899) Bool)

(assert (=> start!37728 (and (array_inv!8032 _values!506) e!234645)))

(assert (=> start!37728 tp!31245))

(assert (=> start!37728 true))

(declare-fun tp_is_empty!9503 () Bool)

(assert (=> start!37728 tp_is_empty!9503))

(declare-datatypes ((array!22901 0))(
  ( (array!22902 (arr!10919 (Array (_ BitVec 32) (_ BitVec 64))) (size!11271 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22901)

(declare-fun array_inv!8033 (array!22901) Bool)

(assert (=> start!37728 (array_inv!8033 _keys!658)))

(declare-fun b!386909 () Bool)

(declare-fun res!220976 () Bool)

(assert (=> b!386909 (=> (not res!220976) (not e!234649))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386909 (= res!220976 (validKeyInArray!0 k!778))))

(declare-fun b!386910 () Bool)

(declare-fun e!234648 () Bool)

(declare-fun mapRes!15819 () Bool)

(assert (=> b!386910 (= e!234645 (and e!234648 mapRes!15819))))

(declare-fun condMapEmpty!15819 () Bool)

(declare-fun mapDefault!15819 () ValueCell!4408)

