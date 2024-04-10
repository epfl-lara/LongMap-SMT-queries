; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74998 () Bool)

(assert start!74998)

(declare-fun b_free!15487 () Bool)

(declare-fun b_next!15487 () Bool)

(assert (=> start!74998 (= b_free!15487 (not b_next!15487))))

(declare-fun tp!54166 () Bool)

(declare-fun b_and!25677 () Bool)

(assert (=> start!74998 (= tp!54166 b_and!25677)))

(declare-fun b!884749 () Bool)

(declare-fun e!492368 () Bool)

(declare-fun tp_is_empty!17731 () Bool)

(assert (=> b!884749 (= e!492368 tp_is_empty!17731)))

(declare-fun res!601039 () Bool)

(declare-fun e!492369 () Bool)

(assert (=> start!74998 (=> (not res!601039) (not e!492369))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51586 0))(
  ( (array!51587 (arr!24811 (Array (_ BitVec 32) (_ BitVec 64))) (size!25251 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51586)

(assert (=> start!74998 (= res!601039 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25251 _keys!868))))))

(assert (=> start!74998 e!492369))

(assert (=> start!74998 tp_is_empty!17731))

(assert (=> start!74998 true))

(assert (=> start!74998 tp!54166))

(declare-fun array_inv!19534 (array!51586) Bool)

(assert (=> start!74998 (array_inv!19534 _keys!868)))

(declare-datatypes ((V!28689 0))(
  ( (V!28690 (val!8913 Int)) )
))
(declare-datatypes ((ValueCell!8426 0))(
  ( (ValueCellFull!8426 (v!11386 V!28689)) (EmptyCell!8426) )
))
(declare-datatypes ((array!51588 0))(
  ( (array!51589 (arr!24812 (Array (_ BitVec 32) ValueCell!8426)) (size!25252 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51588)

(declare-fun e!492372 () Bool)

(declare-fun array_inv!19535 (array!51588) Bool)

(assert (=> start!74998 (and (array_inv!19535 _values!688) e!492372)))

(declare-datatypes ((tuple2!11820 0))(
  ( (tuple2!11821 (_1!5921 (_ BitVec 64)) (_2!5921 V!28689)) )
))
(declare-datatypes ((List!17627 0))(
  ( (Nil!17624) (Cons!17623 (h!18754 tuple2!11820) (t!24902 List!17627)) )
))
(declare-datatypes ((ListLongMap!10589 0))(
  ( (ListLongMap!10590 (toList!5310 List!17627)) )
))
(declare-fun lt!400779 () ListLongMap!10589)

(declare-fun lt!400778 () tuple2!11820)

(declare-fun b!884750 () Bool)

(declare-fun e!492373 () Bool)

(declare-fun lt!400775 () ListLongMap!10589)

(declare-fun +!2578 (ListLongMap!10589 tuple2!11820) ListLongMap!10589)

(assert (=> b!884750 (= e!492373 (= lt!400779 (+!2578 lt!400775 lt!400778)))))

(declare-fun b!884751 () Bool)

(declare-fun mapRes!28236 () Bool)

(assert (=> b!884751 (= e!492372 (and e!492368 mapRes!28236))))

(declare-fun condMapEmpty!28236 () Bool)

(declare-fun mapDefault!28236 () ValueCell!8426)

