; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74818 () Bool)

(assert start!74818)

(declare-fun b_free!15395 () Bool)

(declare-fun b_next!15395 () Bool)

(assert (=> start!74818 (= b_free!15395 (not b_next!15395))))

(declare-fun tp!53881 () Bool)

(declare-fun b_and!25457 () Bool)

(assert (=> start!74818 (= tp!53881 b_and!25457)))

(declare-fun b!882128 () Bool)

(declare-fun e!490922 () Bool)

(declare-fun tp_is_empty!17639 () Bool)

(assert (=> b!882128 (= e!490922 tp_is_empty!17639)))

(declare-fun b!882129 () Bool)

(declare-fun e!490928 () Bool)

(declare-fun mapRes!28089 () Bool)

(assert (=> b!882129 (= e!490928 (and e!490922 mapRes!28089))))

(declare-fun condMapEmpty!28089 () Bool)

(declare-datatypes ((V!28565 0))(
  ( (V!28566 (val!8867 Int)) )
))
(declare-datatypes ((ValueCell!8380 0))(
  ( (ValueCellFull!8380 (v!11327 V!28565)) (EmptyCell!8380) )
))
(declare-datatypes ((array!51406 0))(
  ( (array!51407 (arr!24724 (Array (_ BitVec 32) ValueCell!8380)) (size!25164 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51406)

(declare-fun mapDefault!28089 () ValueCell!8380)

