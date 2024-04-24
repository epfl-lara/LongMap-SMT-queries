; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74404 () Bool)

(assert start!74404)

(declare-fun b!874214 () Bool)

(declare-fun res!593805 () Bool)

(declare-fun e!486919 () Bool)

(assert (=> b!874214 (=> (not res!593805) (not e!486919))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50695 0))(
  ( (array!50696 (arr!24372 (Array (_ BitVec 32) (_ BitVec 64))) (size!24813 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50695)

(declare-datatypes ((V!28057 0))(
  ( (V!28058 (val!8676 Int)) )
))
(declare-datatypes ((ValueCell!8189 0))(
  ( (ValueCellFull!8189 (v!11105 V!28057)) (EmptyCell!8189) )
))
(declare-datatypes ((array!50697 0))(
  ( (array!50698 (arr!24373 (Array (_ BitVec 32) ValueCell!8189)) (size!24814 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50697)

(assert (=> b!874214 (= res!593805 (and (= (size!24814 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24813 _keys!868) (size!24814 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27491 () Bool)

(declare-fun mapRes!27491 () Bool)

(declare-fun tp!52718 () Bool)

(declare-fun e!486921 () Bool)

(assert (=> mapNonEmpty!27491 (= mapRes!27491 (and tp!52718 e!486921))))

(declare-fun mapValue!27491 () ValueCell!8189)

(declare-fun mapRest!27491 () (Array (_ BitVec 32) ValueCell!8189))

(declare-fun mapKey!27491 () (_ BitVec 32))

(assert (=> mapNonEmpty!27491 (= (arr!24373 _values!688) (store mapRest!27491 mapKey!27491 mapValue!27491))))

(declare-fun b!874215 () Bool)

(declare-fun tp_is_empty!17257 () Bool)

(assert (=> b!874215 (= e!486921 tp_is_empty!17257)))

(declare-fun b!874216 () Bool)

(declare-fun res!593808 () Bool)

(assert (=> b!874216 (=> (not res!593808) (not e!486919))))

(declare-datatypes ((List!17239 0))(
  ( (Nil!17236) (Cons!17235 (h!18372 (_ BitVec 64)) (t!24270 List!17239)) )
))
(declare-fun arrayNoDuplicates!0 (array!50695 (_ BitVec 32) List!17239) Bool)

(assert (=> b!874216 (= res!593808 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17236))))

(declare-fun b!874217 () Bool)

(declare-fun res!593806 () Bool)

(assert (=> b!874217 (=> (not res!593806) (not e!486919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874217 (= res!593806 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27491 () Bool)

(assert (=> mapIsEmpty!27491 mapRes!27491))

(declare-fun b!874218 () Bool)

(declare-fun e!486918 () Bool)

(assert (=> b!874218 (= e!486918 tp_is_empty!17257)))

(declare-fun b!874219 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874219 (= e!486919 (and (= (select (arr!24372 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24813 _keys!868)) (bvsge i!612 (size!24814 _values!688))))))

(declare-fun b!874221 () Bool)

(declare-fun res!593804 () Bool)

(assert (=> b!874221 (=> (not res!593804) (not e!486919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874221 (= res!593804 (validKeyInArray!0 k0!854))))

(declare-fun b!874222 () Bool)

(declare-fun e!486920 () Bool)

(assert (=> b!874222 (= e!486920 (and e!486918 mapRes!27491))))

(declare-fun condMapEmpty!27491 () Bool)

(declare-fun mapDefault!27491 () ValueCell!8189)

(assert (=> b!874222 (= condMapEmpty!27491 (= (arr!24373 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8189)) mapDefault!27491)))))

(declare-fun b!874223 () Bool)

(declare-fun res!593803 () Bool)

(assert (=> b!874223 (=> (not res!593803) (not e!486919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50695 (_ BitVec 32)) Bool)

(assert (=> b!874223 (= res!593803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874220 () Bool)

(declare-fun res!593807 () Bool)

(assert (=> b!874220 (=> (not res!593807) (not e!486919))))

(assert (=> b!874220 (= res!593807 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24813 _keys!868))))))

(declare-fun res!593809 () Bool)

(assert (=> start!74404 (=> (not res!593809) (not e!486919))))

(assert (=> start!74404 (= res!593809 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24813 _keys!868))))))

(assert (=> start!74404 e!486919))

(assert (=> start!74404 true))

(declare-fun array_inv!19282 (array!50695) Bool)

(assert (=> start!74404 (array_inv!19282 _keys!868)))

(declare-fun array_inv!19283 (array!50697) Bool)

(assert (=> start!74404 (and (array_inv!19283 _values!688) e!486920)))

(assert (= (and start!74404 res!593809) b!874217))

(assert (= (and b!874217 res!593806) b!874214))

(assert (= (and b!874214 res!593805) b!874223))

(assert (= (and b!874223 res!593803) b!874216))

(assert (= (and b!874216 res!593808) b!874220))

(assert (= (and b!874220 res!593807) b!874221))

(assert (= (and b!874221 res!593804) b!874219))

(assert (= (and b!874222 condMapEmpty!27491) mapIsEmpty!27491))

(assert (= (and b!874222 (not condMapEmpty!27491)) mapNonEmpty!27491))

(get-info :version)

(assert (= (and mapNonEmpty!27491 ((_ is ValueCellFull!8189) mapValue!27491)) b!874215))

(assert (= (and b!874222 ((_ is ValueCellFull!8189) mapDefault!27491)) b!874218))

(assert (= start!74404 b!874222))

(declare-fun m!815155 () Bool)

(assert (=> b!874221 m!815155))

(declare-fun m!815157 () Bool)

(assert (=> b!874219 m!815157))

(declare-fun m!815159 () Bool)

(assert (=> b!874223 m!815159))

(declare-fun m!815161 () Bool)

(assert (=> b!874217 m!815161))

(declare-fun m!815163 () Bool)

(assert (=> b!874216 m!815163))

(declare-fun m!815165 () Bool)

(assert (=> mapNonEmpty!27491 m!815165))

(declare-fun m!815167 () Bool)

(assert (=> start!74404 m!815167))

(declare-fun m!815169 () Bool)

(assert (=> start!74404 m!815169))

(check-sat (not b!874223) tp_is_empty!17257 (not start!74404) (not mapNonEmpty!27491) (not b!874221) (not b!874216) (not b!874217))
(check-sat)
