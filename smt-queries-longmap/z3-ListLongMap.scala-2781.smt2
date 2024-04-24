; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40560 () Bool)

(assert start!40560)

(declare-fun b_free!10585 () Bool)

(declare-fun b_next!10585 () Bool)

(assert (=> start!40560 (= b_free!10585 (not b_next!10585))))

(declare-fun tp!37574 () Bool)

(declare-fun b_and!18607 () Bool)

(assert (=> start!40560 (= tp!37574 b_and!18607)))

(declare-fun mapIsEmpty!19518 () Bool)

(declare-fun mapRes!19518 () Bool)

(assert (=> mapIsEmpty!19518 mapRes!19518))

(declare-fun b!447283 () Bool)

(declare-fun res!265645 () Bool)

(declare-fun e!262652 () Bool)

(assert (=> b!447283 (=> (not res!265645) (not e!262652))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447283 (= res!265645 (bvsle from!863 i!563))))

(declare-fun b!447284 () Bool)

(declare-fun res!265656 () Bool)

(declare-fun e!262656 () Bool)

(assert (=> b!447284 (=> (not res!265656) (not e!262656))))

(declare-datatypes ((array!27654 0))(
  ( (array!27655 (arr!13272 (Array (_ BitVec 32) (_ BitVec 64))) (size!13624 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27654)

(assert (=> b!447284 (= res!265656 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13624 _keys!709))))))

(declare-fun b!447285 () Bool)

(declare-fun e!262651 () Bool)

(declare-fun tp_is_empty!11923 () Bool)

(assert (=> b!447285 (= e!262651 tp_is_empty!11923)))

(declare-fun b!447286 () Bool)

(declare-fun res!265648 () Bool)

(assert (=> b!447286 (=> (not res!265648) (not e!262652))))

(declare-fun lt!203963 () array!27654)

(declare-datatypes ((List!7853 0))(
  ( (Nil!7850) (Cons!7849 (h!8705 (_ BitVec 64)) (t!13607 List!7853)) )
))
(declare-fun arrayNoDuplicates!0 (array!27654 (_ BitVec 32) List!7853) Bool)

(assert (=> b!447286 (= res!265648 (arrayNoDuplicates!0 lt!203963 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun b!447287 () Bool)

(declare-fun e!262655 () Bool)

(assert (=> b!447287 (= e!262655 tp_is_empty!11923)))

(declare-fun b!447288 () Bool)

(assert (=> b!447288 (= e!262656 e!262652)))

(declare-fun res!265655 () Bool)

(assert (=> b!447288 (=> (not res!265655) (not e!262652))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27654 (_ BitVec 32)) Bool)

(assert (=> b!447288 (= res!265655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203963 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!447288 (= lt!203963 (array!27655 (store (arr!13272 _keys!709) i!563 k0!794) (size!13624 _keys!709)))))

(declare-fun b!447289 () Bool)

(declare-fun res!265650 () Bool)

(assert (=> b!447289 (=> (not res!265650) (not e!262656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447289 (= res!265650 (validKeyInArray!0 k0!794))))

(declare-fun b!447290 () Bool)

(declare-fun res!265653 () Bool)

(assert (=> b!447290 (=> (not res!265653) (not e!262656))))

(assert (=> b!447290 (= res!265653 (or (= (select (arr!13272 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13272 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19518 () Bool)

(declare-fun tp!37575 () Bool)

(assert (=> mapNonEmpty!19518 (= mapRes!19518 (and tp!37575 e!262655))))

(declare-datatypes ((V!17003 0))(
  ( (V!17004 (val!6006 Int)) )
))
(declare-datatypes ((ValueCell!5618 0))(
  ( (ValueCellFull!5618 (v!8262 V!17003)) (EmptyCell!5618) )
))
(declare-datatypes ((array!27656 0))(
  ( (array!27657 (arr!13273 (Array (_ BitVec 32) ValueCell!5618)) (size!13625 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27656)

(declare-fun mapRest!19518 () (Array (_ BitVec 32) ValueCell!5618))

(declare-fun mapKey!19518 () (_ BitVec 32))

(declare-fun mapValue!19518 () ValueCell!5618)

(assert (=> mapNonEmpty!19518 (= (arr!13273 _values!549) (store mapRest!19518 mapKey!19518 mapValue!19518))))

(declare-fun b!447291 () Bool)

(declare-fun res!265647 () Bool)

(assert (=> b!447291 (=> (not res!265647) (not e!262656))))

(assert (=> b!447291 (= res!265647 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun b!447292 () Bool)

(declare-fun res!265654 () Bool)

(assert (=> b!447292 (=> (not res!265654) (not e!262656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447292 (= res!265654 (validMask!0 mask!1025))))

(declare-fun b!447293 () Bool)

(assert (=> b!447293 (= e!262652 (and (= from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13624 _keys!709)))))))

(declare-fun minValue!515 () V!17003)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7782 0))(
  ( (tuple2!7783 (_1!3902 (_ BitVec 64)) (_2!3902 V!17003)) )
))
(declare-datatypes ((List!7854 0))(
  ( (Nil!7851) (Cons!7850 (h!8706 tuple2!7782) (t!13608 List!7854)) )
))
(declare-datatypes ((ListLongMap!6697 0))(
  ( (ListLongMap!6698 (toList!3364 List!7854)) )
))
(declare-fun lt!203965 () ListLongMap!6697)

(declare-fun zeroValue!515 () V!17003)

(declare-fun v!412 () V!17003)

(declare-fun getCurrentListMapNoExtraKeys!1594 (array!27654 array!27656 (_ BitVec 32) (_ BitVec 32) V!17003 V!17003 (_ BitVec 32) Int) ListLongMap!6697)

(assert (=> b!447293 (= lt!203965 (getCurrentListMapNoExtraKeys!1594 lt!203963 (array!27657 (store (arr!13273 _values!549) i!563 (ValueCellFull!5618 v!412)) (size!13625 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203964 () ListLongMap!6697)

(assert (=> b!447293 (= lt!203964 (getCurrentListMapNoExtraKeys!1594 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447294 () Bool)

(declare-fun res!265651 () Bool)

(assert (=> b!447294 (=> (not res!265651) (not e!262656))))

(assert (=> b!447294 (= res!265651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447295 () Bool)

(declare-fun res!265646 () Bool)

(assert (=> b!447295 (=> (not res!265646) (not e!262656))))

(declare-fun arrayContainsKey!0 (array!27654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447295 (= res!265646 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447296 () Bool)

(declare-fun res!265652 () Bool)

(assert (=> b!447296 (=> (not res!265652) (not e!262656))))

(assert (=> b!447296 (= res!265652 (and (= (size!13625 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13624 _keys!709) (size!13625 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!265649 () Bool)

(assert (=> start!40560 (=> (not res!265649) (not e!262656))))

(assert (=> start!40560 (= res!265649 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13624 _keys!709))))))

(assert (=> start!40560 e!262656))

(assert (=> start!40560 tp_is_empty!11923))

(assert (=> start!40560 tp!37574))

(assert (=> start!40560 true))

(declare-fun e!262654 () Bool)

(declare-fun array_inv!9698 (array!27656) Bool)

(assert (=> start!40560 (and (array_inv!9698 _values!549) e!262654)))

(declare-fun array_inv!9699 (array!27654) Bool)

(assert (=> start!40560 (array_inv!9699 _keys!709)))

(declare-fun b!447297 () Bool)

(assert (=> b!447297 (= e!262654 (and e!262651 mapRes!19518))))

(declare-fun condMapEmpty!19518 () Bool)

(declare-fun mapDefault!19518 () ValueCell!5618)

(assert (=> b!447297 (= condMapEmpty!19518 (= (arr!13273 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5618)) mapDefault!19518)))))

(assert (= (and start!40560 res!265649) b!447292))

(assert (= (and b!447292 res!265654) b!447296))

(assert (= (and b!447296 res!265652) b!447294))

(assert (= (and b!447294 res!265651) b!447291))

(assert (= (and b!447291 res!265647) b!447284))

(assert (= (and b!447284 res!265656) b!447289))

(assert (= (and b!447289 res!265650) b!447290))

(assert (= (and b!447290 res!265653) b!447295))

(assert (= (and b!447295 res!265646) b!447288))

(assert (= (and b!447288 res!265655) b!447286))

(assert (= (and b!447286 res!265648) b!447283))

(assert (= (and b!447283 res!265645) b!447293))

(assert (= (and b!447297 condMapEmpty!19518) mapIsEmpty!19518))

(assert (= (and b!447297 (not condMapEmpty!19518)) mapNonEmpty!19518))

(get-info :version)

(assert (= (and mapNonEmpty!19518 ((_ is ValueCellFull!5618) mapValue!19518)) b!447287))

(assert (= (and b!447297 ((_ is ValueCellFull!5618) mapDefault!19518)) b!447285))

(assert (= start!40560 b!447297))

(declare-fun m!432471 () Bool)

(assert (=> b!447293 m!432471))

(declare-fun m!432473 () Bool)

(assert (=> b!447293 m!432473))

(declare-fun m!432475 () Bool)

(assert (=> b!447293 m!432475))

(declare-fun m!432477 () Bool)

(assert (=> mapNonEmpty!19518 m!432477))

(declare-fun m!432479 () Bool)

(assert (=> b!447294 m!432479))

(declare-fun m!432481 () Bool)

(assert (=> b!447290 m!432481))

(declare-fun m!432483 () Bool)

(assert (=> b!447292 m!432483))

(declare-fun m!432485 () Bool)

(assert (=> start!40560 m!432485))

(declare-fun m!432487 () Bool)

(assert (=> start!40560 m!432487))

(declare-fun m!432489 () Bool)

(assert (=> b!447295 m!432489))

(declare-fun m!432491 () Bool)

(assert (=> b!447288 m!432491))

(declare-fun m!432493 () Bool)

(assert (=> b!447288 m!432493))

(declare-fun m!432495 () Bool)

(assert (=> b!447289 m!432495))

(declare-fun m!432497 () Bool)

(assert (=> b!447286 m!432497))

(declare-fun m!432499 () Bool)

(assert (=> b!447291 m!432499))

(check-sat (not start!40560) (not mapNonEmpty!19518) (not b!447295) (not b!447292) tp_is_empty!11923 (not b!447286) (not b!447289) b_and!18607 (not b!447294) (not b!447291) (not b!447288) (not b_next!10585) (not b!447293))
(check-sat b_and!18607 (not b_next!10585))
