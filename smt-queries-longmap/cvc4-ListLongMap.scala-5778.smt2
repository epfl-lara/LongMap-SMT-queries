; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74574 () Bool)

(assert start!74574)

(declare-fun b_free!15263 () Bool)

(declare-fun b_next!15263 () Bool)

(assert (=> start!74574 (= b_free!15263 (not b_next!15263))))

(declare-fun tp!53471 () Bool)

(declare-fun b_and!25139 () Bool)

(assert (=> start!74574 (= tp!53471 b_and!25139)))

(declare-fun b!878675 () Bool)

(declare-fun res!596959 () Bool)

(declare-fun e!489007 () Bool)

(assert (=> b!878675 (=> (not res!596959) (not e!489007))))

(declare-datatypes ((array!51140 0))(
  ( (array!51141 (arr!24596 (Array (_ BitVec 32) (_ BitVec 64))) (size!25036 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51140)

(declare-datatypes ((List!17453 0))(
  ( (Nil!17450) (Cons!17449 (h!18580 (_ BitVec 64)) (t!24542 List!17453)) )
))
(declare-fun arrayNoDuplicates!0 (array!51140 (_ BitVec 32) List!17453) Bool)

(assert (=> b!878675 (= res!596959 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17450))))

(declare-fun res!596960 () Bool)

(assert (=> start!74574 (=> (not res!596960) (not e!489007))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74574 (= res!596960 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25036 _keys!868))))))

(assert (=> start!74574 e!489007))

(declare-fun tp_is_empty!17507 () Bool)

(assert (=> start!74574 tp_is_empty!17507))

(assert (=> start!74574 true))

(assert (=> start!74574 tp!53471))

(declare-fun array_inv!19384 (array!51140) Bool)

(assert (=> start!74574 (array_inv!19384 _keys!868)))

(declare-datatypes ((V!28389 0))(
  ( (V!28390 (val!8801 Int)) )
))
(declare-datatypes ((ValueCell!8314 0))(
  ( (ValueCellFull!8314 (v!11241 V!28389)) (EmptyCell!8314) )
))
(declare-datatypes ((array!51142 0))(
  ( (array!51143 (arr!24597 (Array (_ BitVec 32) ValueCell!8314)) (size!25037 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51142)

(declare-fun e!489006 () Bool)

(declare-fun array_inv!19385 (array!51142) Bool)

(assert (=> start!74574 (and (array_inv!19385 _values!688) e!489006)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!878676 () Bool)

(assert (=> b!878676 (= e!489007 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25036 _keys!868)) (bvsge (bvsub (size!25036 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!25036 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11636 0))(
  ( (tuple2!11637 (_1!5829 (_ BitVec 64)) (_2!5829 V!28389)) )
))
(declare-datatypes ((List!17454 0))(
  ( (Nil!17451) (Cons!17450 (h!18581 tuple2!11636) (t!24543 List!17454)) )
))
(declare-datatypes ((ListLongMap!10405 0))(
  ( (ListLongMap!10406 (toList!5218 List!17454)) )
))
(declare-fun lt!397299 () ListLongMap!10405)

(declare-fun v!557 () V!28389)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28389)

(declare-fun zeroValue!654 () V!28389)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3185 (array!51140 array!51142 (_ BitVec 32) (_ BitVec 32) V!28389 V!28389 (_ BitVec 32) Int) ListLongMap!10405)

(assert (=> b!878676 (= lt!397299 (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!51143 (store (arr!24597 _values!688) i!612 (ValueCellFull!8314 v!557)) (size!25037 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397298 () ListLongMap!10405)

(assert (=> b!878676 (= lt!397298 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27876 () Bool)

(declare-fun mapRes!27876 () Bool)

(assert (=> mapIsEmpty!27876 mapRes!27876))

(declare-fun b!878677 () Bool)

(declare-fun e!489009 () Bool)

(assert (=> b!878677 (= e!489009 tp_is_empty!17507)))

(declare-fun b!878678 () Bool)

(declare-fun res!596955 () Bool)

(assert (=> b!878678 (=> (not res!596955) (not e!489007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878678 (= res!596955 (validMask!0 mask!1196))))

(declare-fun b!878679 () Bool)

(declare-fun e!489010 () Bool)

(assert (=> b!878679 (= e!489010 tp_is_empty!17507)))

(declare-fun b!878680 () Bool)

(declare-fun res!596954 () Bool)

(assert (=> b!878680 (=> (not res!596954) (not e!489007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51140 (_ BitVec 32)) Bool)

(assert (=> b!878680 (= res!596954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878681 () Bool)

(declare-fun res!596953 () Bool)

(assert (=> b!878681 (=> (not res!596953) (not e!489007))))

(assert (=> b!878681 (= res!596953 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25036 _keys!868))))))

(declare-fun mapNonEmpty!27876 () Bool)

(declare-fun tp!53470 () Bool)

(assert (=> mapNonEmpty!27876 (= mapRes!27876 (and tp!53470 e!489009))))

(declare-fun mapKey!27876 () (_ BitVec 32))

(declare-fun mapValue!27876 () ValueCell!8314)

(declare-fun mapRest!27876 () (Array (_ BitVec 32) ValueCell!8314))

(assert (=> mapNonEmpty!27876 (= (arr!24597 _values!688) (store mapRest!27876 mapKey!27876 mapValue!27876))))

(declare-fun b!878682 () Bool)

(declare-fun res!596956 () Bool)

(assert (=> b!878682 (=> (not res!596956) (not e!489007))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!878682 (= res!596956 (and (= (select (arr!24596 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878683 () Bool)

(declare-fun res!596958 () Bool)

(assert (=> b!878683 (=> (not res!596958) (not e!489007))))

(assert (=> b!878683 (= res!596958 (and (= (size!25037 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25036 _keys!868) (size!25037 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878684 () Bool)

(assert (=> b!878684 (= e!489006 (and e!489010 mapRes!27876))))

(declare-fun condMapEmpty!27876 () Bool)

(declare-fun mapDefault!27876 () ValueCell!8314)

