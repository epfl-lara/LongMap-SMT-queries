; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74356 () Bool)

(assert start!74356)

(declare-fun b!873586 () Bool)

(declare-fun e!486588 () Bool)

(declare-fun e!486589 () Bool)

(declare-fun mapRes!27443 () Bool)

(assert (=> b!873586 (= e!486588 (and e!486589 mapRes!27443))))

(declare-fun condMapEmpty!27443 () Bool)

(declare-datatypes ((V!28017 0))(
  ( (V!28018 (val!8661 Int)) )
))
(declare-datatypes ((ValueCell!8174 0))(
  ( (ValueCellFull!8174 (v!11086 V!28017)) (EmptyCell!8174) )
))
(declare-datatypes ((array!50641 0))(
  ( (array!50642 (arr!24346 (Array (_ BitVec 32) ValueCell!8174)) (size!24787 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50641)

(declare-fun mapDefault!27443 () ValueCell!8174)

(assert (=> b!873586 (= condMapEmpty!27443 (= (arr!24346 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8174)) mapDefault!27443)))))

(declare-fun b!873587 () Bool)

(declare-fun res!593440 () Bool)

(declare-fun e!486591 () Bool)

(assert (=> b!873587 (=> (not res!593440) (not e!486591))))

(declare-datatypes ((array!50643 0))(
  ( (array!50644 (arr!24347 (Array (_ BitVec 32) (_ BitVec 64))) (size!24788 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50643)

(declare-datatypes ((List!17223 0))(
  ( (Nil!17220) (Cons!17219 (h!18356 (_ BitVec 64)) (t!24252 List!17223)) )
))
(declare-fun arrayNoDuplicates!0 (array!50643 (_ BitVec 32) List!17223) Bool)

(assert (=> b!873587 (= res!593440 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17220))))

(declare-fun res!593442 () Bool)

(assert (=> start!74356 (=> (not res!593442) (not e!486591))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74356 (= res!593442 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24788 _keys!868))))))

(assert (=> start!74356 e!486591))

(assert (=> start!74356 true))

(declare-fun array_inv!19264 (array!50643) Bool)

(assert (=> start!74356 (array_inv!19264 _keys!868)))

(declare-fun array_inv!19265 (array!50641) Bool)

(assert (=> start!74356 (and (array_inv!19265 _values!688) e!486588)))

(declare-fun b!873588 () Bool)

(declare-fun res!593446 () Bool)

(assert (=> b!873588 (=> (not res!593446) (not e!486591))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873588 (= res!593446 (validKeyInArray!0 k0!854))))

(declare-fun b!873589 () Bool)

(declare-fun res!593445 () Bool)

(assert (=> b!873589 (=> (not res!593445) (not e!486591))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!873589 (= res!593445 (and (= (size!24787 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24788 _keys!868) (size!24787 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27443 () Bool)

(assert (=> mapIsEmpty!27443 mapRes!27443))

(declare-fun b!873590 () Bool)

(declare-fun res!593444 () Bool)

(assert (=> b!873590 (=> (not res!593444) (not e!486591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50643 (_ BitVec 32)) Bool)

(assert (=> b!873590 (= res!593444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873591 () Bool)

(declare-fun tp_is_empty!17227 () Bool)

(assert (=> b!873591 (= e!486589 tp_is_empty!17227)))

(declare-fun b!873592 () Bool)

(declare-fun res!593441 () Bool)

(assert (=> b!873592 (=> (not res!593441) (not e!486591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873592 (= res!593441 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27443 () Bool)

(declare-fun tp!52643 () Bool)

(declare-fun e!486590 () Bool)

(assert (=> mapNonEmpty!27443 (= mapRes!27443 (and tp!52643 e!486590))))

(declare-fun mapValue!27443 () ValueCell!8174)

(declare-fun mapKey!27443 () (_ BitVec 32))

(declare-fun mapRest!27443 () (Array (_ BitVec 32) ValueCell!8174))

(assert (=> mapNonEmpty!27443 (= (arr!24346 _values!688) (store mapRest!27443 mapKey!27443 mapValue!27443))))

(declare-fun b!873593 () Bool)

(declare-fun res!593443 () Bool)

(assert (=> b!873593 (=> (not res!593443) (not e!486591))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873593 (= res!593443 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24788 _keys!868))))))

(declare-fun b!873594 () Bool)

(assert (=> b!873594 (= e!486590 tp_is_empty!17227)))

(declare-fun b!873595 () Bool)

(assert (=> b!873595 (= e!486591 (and (= (select (arr!24347 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24788 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (bvsub (size!24788 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24788 _keys!868) from!1053))))))

(assert (= (and start!74356 res!593442) b!873592))

(assert (= (and b!873592 res!593441) b!873589))

(assert (= (and b!873589 res!593445) b!873590))

(assert (= (and b!873590 res!593444) b!873587))

(assert (= (and b!873587 res!593440) b!873593))

(assert (= (and b!873593 res!593443) b!873588))

(assert (= (and b!873588 res!593446) b!873595))

(assert (= (and b!873586 condMapEmpty!27443) mapIsEmpty!27443))

(assert (= (and b!873586 (not condMapEmpty!27443)) mapNonEmpty!27443))

(get-info :version)

(assert (= (and mapNonEmpty!27443 ((_ is ValueCellFull!8174) mapValue!27443)) b!873594))

(assert (= (and b!873586 ((_ is ValueCellFull!8174) mapDefault!27443)) b!873591))

(assert (= start!74356 b!873586))

(declare-fun m!814685 () Bool)

(assert (=> mapNonEmpty!27443 m!814685))

(declare-fun m!814687 () Bool)

(assert (=> b!873587 m!814687))

(declare-fun m!814689 () Bool)

(assert (=> start!74356 m!814689))

(declare-fun m!814691 () Bool)

(assert (=> start!74356 m!814691))

(declare-fun m!814693 () Bool)

(assert (=> b!873588 m!814693))

(declare-fun m!814695 () Bool)

(assert (=> b!873590 m!814695))

(declare-fun m!814697 () Bool)

(assert (=> b!873592 m!814697))

(declare-fun m!814699 () Bool)

(assert (=> b!873595 m!814699))

(check-sat (not b!873587) (not b!873588) (not start!74356) tp_is_empty!17227 (not b!873592) (not mapNonEmpty!27443) (not b!873590))
(check-sat)
