; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74806 () Bool)

(assert start!74806)

(declare-fun b_free!15383 () Bool)

(declare-fun b_next!15383 () Bool)

(assert (=> start!74806 (= b_free!15383 (not b_next!15383))))

(declare-fun tp!53846 () Bool)

(declare-fun b_and!25433 () Bool)

(assert (=> start!74806 (= tp!53846 b_and!25433)))

(declare-fun b!881864 () Bool)

(declare-fun e!490779 () Bool)

(declare-fun e!490780 () Bool)

(assert (=> b!881864 (= e!490779 e!490780)))

(declare-fun res!599111 () Bool)

(assert (=> b!881864 (=> (not res!599111) (not e!490780))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881864 (= res!599111 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28549 0))(
  ( (V!28550 (val!8861 Int)) )
))
(declare-datatypes ((ValueCell!8374 0))(
  ( (ValueCellFull!8374 (v!11321 V!28549)) (EmptyCell!8374) )
))
(declare-datatypes ((array!51382 0))(
  ( (array!51383 (arr!24712 (Array (_ BitVec 32) ValueCell!8374)) (size!25152 (_ BitVec 32))) )
))
(declare-fun lt!398919 () array!51382)

(declare-datatypes ((tuple2!11732 0))(
  ( (tuple2!11733 (_1!5877 (_ BitVec 64)) (_2!5877 V!28549)) )
))
(declare-datatypes ((List!17544 0))(
  ( (Nil!17541) (Cons!17540 (h!18671 tuple2!11732) (t!24729 List!17544)) )
))
(declare-datatypes ((ListLongMap!10501 0))(
  ( (ListLongMap!10502 (toList!5266 List!17544)) )
))
(declare-fun lt!398917 () ListLongMap!10501)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51384 0))(
  ( (array!51385 (arr!24713 (Array (_ BitVec 32) (_ BitVec 64))) (size!25153 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51384)

(declare-fun minValue!654 () V!28549)

(declare-fun zeroValue!654 () V!28549)

(declare-fun getCurrentListMapNoExtraKeys!3229 (array!51384 array!51382 (_ BitVec 32) (_ BitVec 32) V!28549 V!28549 (_ BitVec 32) Int) ListLongMap!10501)

(assert (=> b!881864 (= lt!398917 (getCurrentListMapNoExtraKeys!3229 _keys!868 lt!398919 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28549)

(declare-fun _values!688 () array!51382)

(assert (=> b!881864 (= lt!398919 (array!51383 (store (arr!24712 _values!688) i!612 (ValueCellFull!8374 v!557)) (size!25152 _values!688)))))

(declare-fun lt!398921 () ListLongMap!10501)

(assert (=> b!881864 (= lt!398921 (getCurrentListMapNoExtraKeys!3229 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!599108 () Bool)

(assert (=> start!74806 (=> (not res!599108) (not e!490779))))

(assert (=> start!74806 (= res!599108 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25153 _keys!868))))))

(assert (=> start!74806 e!490779))

(declare-fun tp_is_empty!17627 () Bool)

(assert (=> start!74806 tp_is_empty!17627))

(assert (=> start!74806 true))

(assert (=> start!74806 tp!53846))

(declare-fun array_inv!19462 (array!51384) Bool)

(assert (=> start!74806 (array_inv!19462 _keys!868)))

(declare-fun e!490781 () Bool)

(declare-fun array_inv!19463 (array!51382) Bool)

(assert (=> start!74806 (and (array_inv!19463 _values!688) e!490781)))

(declare-fun b!881865 () Bool)

(declare-fun res!599107 () Bool)

(assert (=> b!881865 (=> (not res!599107) (not e!490779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881865 (= res!599107 (validMask!0 mask!1196))))

(declare-fun b!881866 () Bool)

(declare-fun e!490783 () Bool)

(declare-fun mapRes!28071 () Bool)

(assert (=> b!881866 (= e!490781 (and e!490783 mapRes!28071))))

(declare-fun condMapEmpty!28071 () Bool)

(declare-fun mapDefault!28071 () ValueCell!8374)

