; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74808 () Bool)

(assert start!74808)

(declare-fun b_free!15385 () Bool)

(declare-fun b_next!15385 () Bool)

(assert (=> start!74808 (= b_free!15385 (not b_next!15385))))

(declare-fun tp!53851 () Bool)

(declare-fun b_and!25437 () Bool)

(assert (=> start!74808 (= tp!53851 b_and!25437)))

(declare-fun mapNonEmpty!28074 () Bool)

(declare-fun mapRes!28074 () Bool)

(declare-fun tp!53852 () Bool)

(declare-fun e!490805 () Bool)

(assert (=> mapNonEmpty!28074 (= mapRes!28074 (and tp!53852 e!490805))))

(declare-fun mapKey!28074 () (_ BitVec 32))

(declare-datatypes ((V!28553 0))(
  ( (V!28554 (val!8862 Int)) )
))
(declare-datatypes ((ValueCell!8375 0))(
  ( (ValueCellFull!8375 (v!11322 V!28553)) (EmptyCell!8375) )
))
(declare-fun mapRest!28074 () (Array (_ BitVec 32) ValueCell!8375))

(declare-fun mapValue!28074 () ValueCell!8375)

(declare-datatypes ((array!51386 0))(
  ( (array!51387 (arr!24714 (Array (_ BitVec 32) ValueCell!8375)) (size!25154 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51386)

(assert (=> mapNonEmpty!28074 (= (arr!24714 _values!688) (store mapRest!28074 mapKey!28074 mapValue!28074))))

(declare-fun b!881908 () Bool)

(declare-fun tp_is_empty!17629 () Bool)

(assert (=> b!881908 (= e!490805 tp_is_empty!17629)))

(declare-fun mapIsEmpty!28074 () Bool)

(assert (=> mapIsEmpty!28074 mapRes!28074))

(declare-fun res!599144 () Bool)

(declare-fun e!490809 () Bool)

(assert (=> start!74808 (=> (not res!599144) (not e!490809))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51388 0))(
  ( (array!51389 (arr!24715 (Array (_ BitVec 32) (_ BitVec 64))) (size!25155 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51388)

(assert (=> start!74808 (= res!599144 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25155 _keys!868))))))

(assert (=> start!74808 e!490809))

(assert (=> start!74808 tp_is_empty!17629))

(assert (=> start!74808 true))

(assert (=> start!74808 tp!53851))

(declare-fun array_inv!19464 (array!51388) Bool)

(assert (=> start!74808 (array_inv!19464 _keys!868)))

(declare-fun e!490806 () Bool)

(declare-fun array_inv!19465 (array!51386) Bool)

(assert (=> start!74808 (and (array_inv!19465 _values!688) e!490806)))

(declare-fun b!881909 () Bool)

(declare-fun e!490803 () Bool)

(declare-fun e!490808 () Bool)

(assert (=> b!881909 (= e!490803 e!490808)))

(declare-fun res!599142 () Bool)

(assert (=> b!881909 (=> res!599142 e!490808)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!881909 (= res!599142 (not (= (select (arr!24715 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11734 0))(
  ( (tuple2!11735 (_1!5878 (_ BitVec 64)) (_2!5878 V!28553)) )
))
(declare-datatypes ((List!17545 0))(
  ( (Nil!17542) (Cons!17541 (h!18672 tuple2!11734) (t!24732 List!17545)) )
))
(declare-datatypes ((ListLongMap!10503 0))(
  ( (ListLongMap!10504 (toList!5267 List!17545)) )
))
(declare-fun lt!398942 () ListLongMap!10503)

(declare-fun lt!398941 () ListLongMap!10503)

(declare-fun +!2538 (ListLongMap!10503 tuple2!11734) ListLongMap!10503)

(declare-fun get!13009 (ValueCell!8375 V!28553) V!28553)

(declare-fun dynLambda!1252 (Int (_ BitVec 64)) V!28553)

(assert (=> b!881909 (= lt!398941 (+!2538 lt!398942 (tuple2!11735 (select (arr!24715 _keys!868) from!1053) (get!13009 (select (arr!24714 _values!688) from!1053) (dynLambda!1252 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881910 () Bool)

(declare-fun res!599138 () Bool)

(assert (=> b!881910 (=> (not res!599138) (not e!490809))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881910 (= res!599138 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25155 _keys!868))))))

(declare-fun b!881911 () Bool)

(declare-fun res!599135 () Bool)

(assert (=> b!881911 (=> (not res!599135) (not e!490809))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51388 (_ BitVec 32)) Bool)

(assert (=> b!881911 (= res!599135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881912 () Bool)

(declare-fun res!599136 () Bool)

(assert (=> b!881912 (=> (not res!599136) (not e!490809))))

(assert (=> b!881912 (= res!599136 (and (= (select (arr!24715 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881913 () Bool)

(declare-fun res!599145 () Bool)

(assert (=> b!881913 (=> (not res!599145) (not e!490809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881913 (= res!599145 (validKeyInArray!0 k!854))))

(declare-fun b!881914 () Bool)

(declare-fun e!490807 () Bool)

(assert (=> b!881914 (= e!490806 (and e!490807 mapRes!28074))))

(declare-fun condMapEmpty!28074 () Bool)

(declare-fun mapDefault!28074 () ValueCell!8375)

