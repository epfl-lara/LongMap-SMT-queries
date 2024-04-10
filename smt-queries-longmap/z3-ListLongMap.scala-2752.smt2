; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40366 () Bool)

(assert start!40366)

(declare-fun b!443483 () Bool)

(declare-fun e!260931 () Bool)

(declare-fun tp_is_empty!11751 () Bool)

(assert (=> b!443483 (= e!260931 tp_is_empty!11751)))

(declare-fun b!443484 () Bool)

(declare-fun res!262801 () Bool)

(declare-fun e!260932 () Bool)

(assert (=> b!443484 (=> (not res!262801) (not e!260932))))

(declare-datatypes ((array!27315 0))(
  ( (array!27316 (arr!13105 (Array (_ BitVec 32) (_ BitVec 64))) (size!13457 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27315)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443484 (= res!262801 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19254 () Bool)

(declare-fun mapRes!19254 () Bool)

(declare-fun tp!37236 () Bool)

(assert (=> mapNonEmpty!19254 (= mapRes!19254 (and tp!37236 e!260931))))

(declare-datatypes ((V!16773 0))(
  ( (V!16774 (val!5920 Int)) )
))
(declare-datatypes ((ValueCell!5532 0))(
  ( (ValueCellFull!5532 (v!8171 V!16773)) (EmptyCell!5532) )
))
(declare-datatypes ((array!27317 0))(
  ( (array!27318 (arr!13106 (Array (_ BitVec 32) ValueCell!5532)) (size!13458 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27317)

(declare-fun mapKey!19254 () (_ BitVec 32))

(declare-fun mapRest!19254 () (Array (_ BitVec 32) ValueCell!5532))

(declare-fun mapValue!19254 () ValueCell!5532)

(assert (=> mapNonEmpty!19254 (= (arr!13106 _values!549) (store mapRest!19254 mapKey!19254 mapValue!19254))))

(declare-fun b!443485 () Bool)

(declare-fun res!262803 () Bool)

(assert (=> b!443485 (=> (not res!262803) (not e!260932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443485 (= res!262803 (validKeyInArray!0 k0!794))))

(declare-fun b!443486 () Bool)

(declare-fun e!260934 () Bool)

(assert (=> b!443486 (= e!260934 tp_is_empty!11751)))

(declare-fun b!443487 () Bool)

(declare-fun res!262804 () Bool)

(assert (=> b!443487 (=> (not res!262804) (not e!260932))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27315 (_ BitVec 32)) Bool)

(assert (=> b!443487 (= res!262804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!262805 () Bool)

(assert (=> start!40366 (=> (not res!262805) (not e!260932))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40366 (= res!262805 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13457 _keys!709))))))

(assert (=> start!40366 e!260932))

(assert (=> start!40366 true))

(declare-fun e!260935 () Bool)

(declare-fun array_inv!9508 (array!27317) Bool)

(assert (=> start!40366 (and (array_inv!9508 _values!549) e!260935)))

(declare-fun array_inv!9509 (array!27315) Bool)

(assert (=> start!40366 (array_inv!9509 _keys!709)))

(declare-fun mapIsEmpty!19254 () Bool)

(assert (=> mapIsEmpty!19254 mapRes!19254))

(declare-fun b!443488 () Bool)

(declare-fun e!260933 () Bool)

(assert (=> b!443488 (= e!260932 e!260933)))

(declare-fun res!262810 () Bool)

(assert (=> b!443488 (=> (not res!262810) (not e!260933))))

(declare-fun lt!203344 () array!27315)

(assert (=> b!443488 (= res!262810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203344 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443488 (= lt!203344 (array!27316 (store (arr!13105 _keys!709) i!563 k0!794) (size!13457 _keys!709)))))

(declare-fun b!443489 () Bool)

(declare-fun res!262806 () Bool)

(assert (=> b!443489 (=> (not res!262806) (not e!260932))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443489 (= res!262806 (and (= (size!13458 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13457 _keys!709) (size!13458 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443490 () Bool)

(declare-fun res!262808 () Bool)

(assert (=> b!443490 (=> (not res!262808) (not e!260932))))

(assert (=> b!443490 (= res!262808 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13457 _keys!709))))))

(declare-fun b!443491 () Bool)

(declare-fun res!262802 () Bool)

(assert (=> b!443491 (=> (not res!262802) (not e!260932))))

(assert (=> b!443491 (= res!262802 (or (= (select (arr!13105 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13105 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443492 () Bool)

(assert (=> b!443492 (= e!260933 false)))

(declare-fun lt!203345 () Bool)

(declare-datatypes ((List!7857 0))(
  ( (Nil!7854) (Cons!7853 (h!8709 (_ BitVec 64)) (t!13615 List!7857)) )
))
(declare-fun arrayNoDuplicates!0 (array!27315 (_ BitVec 32) List!7857) Bool)

(assert (=> b!443492 (= lt!203345 (arrayNoDuplicates!0 lt!203344 #b00000000000000000000000000000000 Nil!7854))))

(declare-fun b!443493 () Bool)

(declare-fun res!262807 () Bool)

(assert (=> b!443493 (=> (not res!262807) (not e!260932))))

(assert (=> b!443493 (= res!262807 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7854))))

(declare-fun b!443494 () Bool)

(assert (=> b!443494 (= e!260935 (and e!260934 mapRes!19254))))

(declare-fun condMapEmpty!19254 () Bool)

(declare-fun mapDefault!19254 () ValueCell!5532)

(assert (=> b!443494 (= condMapEmpty!19254 (= (arr!13106 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5532)) mapDefault!19254)))))

(declare-fun b!443495 () Bool)

(declare-fun res!262809 () Bool)

(assert (=> b!443495 (=> (not res!262809) (not e!260932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443495 (= res!262809 (validMask!0 mask!1025))))

(assert (= (and start!40366 res!262805) b!443495))

(assert (= (and b!443495 res!262809) b!443489))

(assert (= (and b!443489 res!262806) b!443487))

(assert (= (and b!443487 res!262804) b!443493))

(assert (= (and b!443493 res!262807) b!443490))

(assert (= (and b!443490 res!262808) b!443485))

(assert (= (and b!443485 res!262803) b!443491))

(assert (= (and b!443491 res!262802) b!443484))

(assert (= (and b!443484 res!262801) b!443488))

(assert (= (and b!443488 res!262810) b!443492))

(assert (= (and b!443494 condMapEmpty!19254) mapIsEmpty!19254))

(assert (= (and b!443494 (not condMapEmpty!19254)) mapNonEmpty!19254))

(get-info :version)

(assert (= (and mapNonEmpty!19254 ((_ is ValueCellFull!5532) mapValue!19254)) b!443483))

(assert (= (and b!443494 ((_ is ValueCellFull!5532) mapDefault!19254)) b!443486))

(assert (= start!40366 b!443494))

(declare-fun m!429733 () Bool)

(assert (=> b!443492 m!429733))

(declare-fun m!429735 () Bool)

(assert (=> mapNonEmpty!19254 m!429735))

(declare-fun m!429737 () Bool)

(assert (=> b!443485 m!429737))

(declare-fun m!429739 () Bool)

(assert (=> b!443493 m!429739))

(declare-fun m!429741 () Bool)

(assert (=> start!40366 m!429741))

(declare-fun m!429743 () Bool)

(assert (=> start!40366 m!429743))

(declare-fun m!429745 () Bool)

(assert (=> b!443495 m!429745))

(declare-fun m!429747 () Bool)

(assert (=> b!443491 m!429747))

(declare-fun m!429749 () Bool)

(assert (=> b!443484 m!429749))

(declare-fun m!429751 () Bool)

(assert (=> b!443488 m!429751))

(declare-fun m!429753 () Bool)

(assert (=> b!443488 m!429753))

(declare-fun m!429755 () Bool)

(assert (=> b!443487 m!429755))

(check-sat (not b!443484) (not b!443485) (not b!443487) (not b!443493) tp_is_empty!11751 (not b!443488) (not start!40366) (not b!443492) (not mapNonEmpty!19254) (not b!443495))
(check-sat)
