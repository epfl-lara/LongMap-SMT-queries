; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74520 () Bool)

(assert start!74520)

(declare-fun b_free!15209 () Bool)

(declare-fun b_next!15209 () Bool)

(assert (=> start!74520 (= b_free!15209 (not b_next!15209))))

(declare-fun tp!53308 () Bool)

(declare-fun b_and!25085 () Bool)

(assert (=> start!74520 (= tp!53308 b_and!25085)))

(declare-fun mapIsEmpty!27795 () Bool)

(declare-fun mapRes!27795 () Bool)

(assert (=> mapIsEmpty!27795 mapRes!27795))

(declare-fun b!877784 () Bool)

(declare-fun res!596308 () Bool)

(declare-fun e!488604 () Bool)

(assert (=> b!877784 (=> (not res!596308) (not e!488604))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51034 0))(
  ( (array!51035 (arr!24543 (Array (_ BitVec 32) (_ BitVec 64))) (size!24983 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51034)

(assert (=> b!877784 (= res!596308 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24983 _keys!868))))))

(declare-fun b!877785 () Bool)

(declare-fun res!596309 () Bool)

(assert (=> b!877785 (=> (not res!596309) (not e!488604))))

(declare-datatypes ((List!17417 0))(
  ( (Nil!17414) (Cons!17413 (h!18544 (_ BitVec 64)) (t!24506 List!17417)) )
))
(declare-fun arrayNoDuplicates!0 (array!51034 (_ BitVec 32) List!17417) Bool)

(assert (=> b!877785 (= res!596309 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17414))))

(declare-fun b!877786 () Bool)

(declare-fun res!596305 () Bool)

(assert (=> b!877786 (=> (not res!596305) (not e!488604))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877786 (= res!596305 (validKeyInArray!0 k!854))))

(declare-fun b!877787 () Bool)

(declare-fun res!596306 () Bool)

(assert (=> b!877787 (=> (not res!596306) (not e!488604))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28317 0))(
  ( (V!28318 (val!8774 Int)) )
))
(declare-datatypes ((ValueCell!8287 0))(
  ( (ValueCellFull!8287 (v!11214 V!28317)) (EmptyCell!8287) )
))
(declare-datatypes ((array!51036 0))(
  ( (array!51037 (arr!24544 (Array (_ BitVec 32) ValueCell!8287)) (size!24984 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51036)

(assert (=> b!877787 (= res!596306 (and (= (size!24984 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24983 _keys!868) (size!24984 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877788 () Bool)

(declare-fun e!488601 () Bool)

(declare-fun tp_is_empty!17453 () Bool)

(assert (=> b!877788 (= e!488601 tp_is_empty!17453)))

(declare-fun res!596307 () Bool)

(assert (=> start!74520 (=> (not res!596307) (not e!488604))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74520 (= res!596307 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24983 _keys!868))))))

(assert (=> start!74520 e!488604))

(assert (=> start!74520 tp_is_empty!17453))

(assert (=> start!74520 true))

(assert (=> start!74520 tp!53308))

(declare-fun array_inv!19346 (array!51034) Bool)

(assert (=> start!74520 (array_inv!19346 _keys!868)))

(declare-fun e!488602 () Bool)

(declare-fun array_inv!19347 (array!51036) Bool)

(assert (=> start!74520 (and (array_inv!19347 _values!688) e!488602)))

(declare-fun b!877789 () Bool)

(declare-fun res!596310 () Bool)

(assert (=> b!877789 (=> (not res!596310) (not e!488604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877789 (= res!596310 (validMask!0 mask!1196))))

(declare-fun b!877790 () Bool)

(declare-fun res!596311 () Bool)

(assert (=> b!877790 (=> (not res!596311) (not e!488604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51034 (_ BitVec 32)) Bool)

(assert (=> b!877790 (= res!596311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877791 () Bool)

(assert (=> b!877791 (= e!488604 false)))

(declare-datatypes ((tuple2!11602 0))(
  ( (tuple2!11603 (_1!5812 (_ BitVec 64)) (_2!5812 V!28317)) )
))
(declare-datatypes ((List!17418 0))(
  ( (Nil!17415) (Cons!17414 (h!18545 tuple2!11602) (t!24507 List!17418)) )
))
(declare-datatypes ((ListLongMap!10371 0))(
  ( (ListLongMap!10372 (toList!5201 List!17418)) )
))
(declare-fun lt!397137 () ListLongMap!10371)

(declare-fun v!557 () V!28317)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28317)

(declare-fun zeroValue!654 () V!28317)

(declare-fun getCurrentListMapNoExtraKeys!3168 (array!51034 array!51036 (_ BitVec 32) (_ BitVec 32) V!28317 V!28317 (_ BitVec 32) Int) ListLongMap!10371)

(assert (=> b!877791 (= lt!397137 (getCurrentListMapNoExtraKeys!3168 _keys!868 (array!51037 (store (arr!24544 _values!688) i!612 (ValueCellFull!8287 v!557)) (size!24984 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397136 () ListLongMap!10371)

(assert (=> b!877791 (= lt!397136 (getCurrentListMapNoExtraKeys!3168 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877792 () Bool)

(declare-fun e!488603 () Bool)

(assert (=> b!877792 (= e!488603 tp_is_empty!17453)))

(declare-fun mapNonEmpty!27795 () Bool)

(declare-fun tp!53309 () Bool)

(assert (=> mapNonEmpty!27795 (= mapRes!27795 (and tp!53309 e!488603))))

(declare-fun mapRest!27795 () (Array (_ BitVec 32) ValueCell!8287))

(declare-fun mapKey!27795 () (_ BitVec 32))

(declare-fun mapValue!27795 () ValueCell!8287)

(assert (=> mapNonEmpty!27795 (= (arr!24544 _values!688) (store mapRest!27795 mapKey!27795 mapValue!27795))))

(declare-fun b!877793 () Bool)

(assert (=> b!877793 (= e!488602 (and e!488601 mapRes!27795))))

(declare-fun condMapEmpty!27795 () Bool)

(declare-fun mapDefault!27795 () ValueCell!8287)

