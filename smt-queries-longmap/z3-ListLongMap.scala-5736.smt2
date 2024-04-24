; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74398 () Bool)

(assert start!74398)

(declare-fun mapNonEmpty!27482 () Bool)

(declare-fun mapRes!27482 () Bool)

(declare-fun tp!52709 () Bool)

(declare-fun e!486874 () Bool)

(assert (=> mapNonEmpty!27482 (= mapRes!27482 (and tp!52709 e!486874))))

(declare-datatypes ((V!28049 0))(
  ( (V!28050 (val!8673 Int)) )
))
(declare-datatypes ((ValueCell!8186 0))(
  ( (ValueCellFull!8186 (v!11102 V!28049)) (EmptyCell!8186) )
))
(declare-fun mapValue!27482 () ValueCell!8186)

(declare-fun mapKey!27482 () (_ BitVec 32))

(declare-fun mapRest!27482 () (Array (_ BitVec 32) ValueCell!8186))

(declare-datatypes ((array!50683 0))(
  ( (array!50684 (arr!24366 (Array (_ BitVec 32) ValueCell!8186)) (size!24807 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50683)

(assert (=> mapNonEmpty!27482 (= (arr!24366 _values!688) (store mapRest!27482 mapKey!27482 mapValue!27482))))

(declare-fun mapIsEmpty!27482 () Bool)

(assert (=> mapIsEmpty!27482 mapRes!27482))

(declare-fun b!874145 () Bool)

(declare-fun res!593761 () Bool)

(declare-fun e!486875 () Bool)

(assert (=> b!874145 (=> (not res!593761) (not e!486875))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50685 0))(
  ( (array!50686 (arr!24367 (Array (_ BitVec 32) (_ BitVec 64))) (size!24808 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50685)

(assert (=> b!874145 (= res!593761 (and (= (size!24807 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24808 _keys!868) (size!24807 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874146 () Bool)

(declare-fun res!593764 () Bool)

(assert (=> b!874146 (=> (not res!593764) (not e!486875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874146 (= res!593764 (validMask!0 mask!1196))))

(declare-fun b!874147 () Bool)

(declare-fun tp_is_empty!17251 () Bool)

(assert (=> b!874147 (= e!486874 tp_is_empty!17251)))

(declare-fun res!593762 () Bool)

(assert (=> start!74398 (=> (not res!593762) (not e!486875))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74398 (= res!593762 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24808 _keys!868))))))

(assert (=> start!74398 e!486875))

(assert (=> start!74398 true))

(declare-fun array_inv!19276 (array!50685) Bool)

(assert (=> start!74398 (array_inv!19276 _keys!868)))

(declare-fun e!486877 () Bool)

(declare-fun array_inv!19277 (array!50683) Bool)

(assert (=> start!74398 (and (array_inv!19277 _values!688) e!486877)))

(declare-fun b!874148 () Bool)

(declare-fun e!486873 () Bool)

(assert (=> b!874148 (= e!486877 (and e!486873 mapRes!27482))))

(declare-fun condMapEmpty!27482 () Bool)

(declare-fun mapDefault!27482 () ValueCell!8186)

(assert (=> b!874148 (= condMapEmpty!27482 (= (arr!24366 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8186)) mapDefault!27482)))))

(declare-fun b!874149 () Bool)

(assert (=> b!874149 (= e!486873 tp_is_empty!17251)))

(declare-fun b!874150 () Bool)

(declare-fun res!593763 () Bool)

(assert (=> b!874150 (=> (not res!593763) (not e!486875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50685 (_ BitVec 32)) Bool)

(assert (=> b!874150 (= res!593763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874151 () Bool)

(assert (=> b!874151 (= e!486875 false)))

(declare-fun lt!396110 () Bool)

(declare-datatypes ((List!17236 0))(
  ( (Nil!17233) (Cons!17232 (h!18369 (_ BitVec 64)) (t!24267 List!17236)) )
))
(declare-fun arrayNoDuplicates!0 (array!50685 (_ BitVec 32) List!17236) Bool)

(assert (=> b!874151 (= lt!396110 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17233))))

(assert (= (and start!74398 res!593762) b!874146))

(assert (= (and b!874146 res!593764) b!874145))

(assert (= (and b!874145 res!593761) b!874150))

(assert (= (and b!874150 res!593763) b!874151))

(assert (= (and b!874148 condMapEmpty!27482) mapIsEmpty!27482))

(assert (= (and b!874148 (not condMapEmpty!27482)) mapNonEmpty!27482))

(get-info :version)

(assert (= (and mapNonEmpty!27482 ((_ is ValueCellFull!8186) mapValue!27482)) b!874147))

(assert (= (and b!874148 ((_ is ValueCellFull!8186) mapDefault!27482)) b!874149))

(assert (= start!74398 b!874148))

(declare-fun m!815119 () Bool)

(assert (=> b!874150 m!815119))

(declare-fun m!815121 () Bool)

(assert (=> start!74398 m!815121))

(declare-fun m!815123 () Bool)

(assert (=> start!74398 m!815123))

(declare-fun m!815125 () Bool)

(assert (=> mapNonEmpty!27482 m!815125))

(declare-fun m!815127 () Bool)

(assert (=> b!874146 m!815127))

(declare-fun m!815129 () Bool)

(assert (=> b!874151 m!815129))

(check-sat (not start!74398) (not b!874151) (not b!874146) tp_is_empty!17251 (not mapNonEmpty!27482) (not b!874150))
(check-sat)
