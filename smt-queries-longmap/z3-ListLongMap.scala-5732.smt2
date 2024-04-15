; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74170 () Bool)

(assert start!74170)

(declare-fun b!872444 () Bool)

(declare-fun e!485861 () Bool)

(declare-fun tp_is_empty!17227 () Bool)

(assert (=> b!872444 (= e!485861 tp_is_empty!17227)))

(declare-fun b!872445 () Bool)

(declare-fun res!592992 () Bool)

(declare-fun e!485860 () Bool)

(assert (=> b!872445 (=> (not res!592992) (not e!485860))))

(declare-datatypes ((array!50571 0))(
  ( (array!50572 (arr!24316 (Array (_ BitVec 32) (_ BitVec 64))) (size!24758 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50571)

(declare-datatypes ((List!17276 0))(
  ( (Nil!17273) (Cons!17272 (h!18403 (_ BitVec 64)) (t!24304 List!17276)) )
))
(declare-fun arrayNoDuplicates!0 (array!50571 (_ BitVec 32) List!17276) Bool)

(assert (=> b!872445 (= res!592992 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17273))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!872446 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!872446 (= e!485860 (and (= (select (arr!24316 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24758 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (bvsub (size!24758 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24758 _keys!868) from!1053))))))

(declare-fun b!872447 () Bool)

(declare-fun res!592990 () Bool)

(assert (=> b!872447 (=> (not res!592990) (not e!485860))))

(assert (=> b!872447 (= res!592990 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24758 _keys!868))))))

(declare-fun b!872448 () Bool)

(declare-fun res!592988 () Bool)

(assert (=> b!872448 (=> (not res!592988) (not e!485860))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872448 (= res!592988 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27443 () Bool)

(declare-fun mapRes!27443 () Bool)

(declare-fun tp!52643 () Bool)

(declare-fun e!485859 () Bool)

(assert (=> mapNonEmpty!27443 (= mapRes!27443 (and tp!52643 e!485859))))

(declare-datatypes ((V!28017 0))(
  ( (V!28018 (val!8661 Int)) )
))
(declare-datatypes ((ValueCell!8174 0))(
  ( (ValueCellFull!8174 (v!11080 V!28017)) (EmptyCell!8174) )
))
(declare-fun mapRest!27443 () (Array (_ BitVec 32) ValueCell!8174))

(declare-datatypes ((array!50573 0))(
  ( (array!50574 (arr!24317 (Array (_ BitVec 32) ValueCell!8174)) (size!24759 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50573)

(declare-fun mapKey!27443 () (_ BitVec 32))

(declare-fun mapValue!27443 () ValueCell!8174)

(assert (=> mapNonEmpty!27443 (= (arr!24317 _values!688) (store mapRest!27443 mapKey!27443 mapValue!27443))))

(declare-fun b!872449 () Bool)

(declare-fun res!592986 () Bool)

(assert (=> b!872449 (=> (not res!592986) (not e!485860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50571 (_ BitVec 32)) Bool)

(assert (=> b!872449 (= res!592986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872450 () Bool)

(declare-fun e!485858 () Bool)

(assert (=> b!872450 (= e!485858 (and e!485861 mapRes!27443))))

(declare-fun condMapEmpty!27443 () Bool)

(declare-fun mapDefault!27443 () ValueCell!8174)

(assert (=> b!872450 (= condMapEmpty!27443 (= (arr!24317 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8174)) mapDefault!27443)))))

(declare-fun b!872451 () Bool)

(assert (=> b!872451 (= e!485859 tp_is_empty!17227)))

(declare-fun b!872452 () Bool)

(declare-fun res!592989 () Bool)

(assert (=> b!872452 (=> (not res!592989) (not e!485860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872452 (= res!592989 (validKeyInArray!0 k0!854))))

(declare-fun b!872453 () Bool)

(declare-fun res!592991 () Bool)

(assert (=> b!872453 (=> (not res!592991) (not e!485860))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872453 (= res!592991 (and (= (size!24759 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24758 _keys!868) (size!24759 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592987 () Bool)

(assert (=> start!74170 (=> (not res!592987) (not e!485860))))

(assert (=> start!74170 (= res!592987 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24758 _keys!868))))))

(assert (=> start!74170 e!485860))

(assert (=> start!74170 true))

(declare-fun array_inv!19252 (array!50571) Bool)

(assert (=> start!74170 (array_inv!19252 _keys!868)))

(declare-fun array_inv!19253 (array!50573) Bool)

(assert (=> start!74170 (and (array_inv!19253 _values!688) e!485858)))

(declare-fun mapIsEmpty!27443 () Bool)

(assert (=> mapIsEmpty!27443 mapRes!27443))

(assert (= (and start!74170 res!592987) b!872448))

(assert (= (and b!872448 res!592988) b!872453))

(assert (= (and b!872453 res!592991) b!872449))

(assert (= (and b!872449 res!592986) b!872445))

(assert (= (and b!872445 res!592992) b!872447))

(assert (= (and b!872447 res!592990) b!872452))

(assert (= (and b!872452 res!592989) b!872446))

(assert (= (and b!872450 condMapEmpty!27443) mapIsEmpty!27443))

(assert (= (and b!872450 (not condMapEmpty!27443)) mapNonEmpty!27443))

(get-info :version)

(assert (= (and mapNonEmpty!27443 ((_ is ValueCellFull!8174) mapValue!27443)) b!872451))

(assert (= (and b!872450 ((_ is ValueCellFull!8174) mapDefault!27443)) b!872444))

(assert (= start!74170 b!872450))

(declare-fun m!812637 () Bool)

(assert (=> b!872445 m!812637))

(declare-fun m!812639 () Bool)

(assert (=> b!872446 m!812639))

(declare-fun m!812641 () Bool)

(assert (=> b!872452 m!812641))

(declare-fun m!812643 () Bool)

(assert (=> b!872448 m!812643))

(declare-fun m!812645 () Bool)

(assert (=> b!872449 m!812645))

(declare-fun m!812647 () Bool)

(assert (=> mapNonEmpty!27443 m!812647))

(declare-fun m!812649 () Bool)

(assert (=> start!74170 m!812649))

(declare-fun m!812651 () Bool)

(assert (=> start!74170 m!812651))

(check-sat (not start!74170) (not b!872452) (not b!872449) (not b!872448) tp_is_empty!17227 (not mapNonEmpty!27443) (not b!872445))
(check-sat)
