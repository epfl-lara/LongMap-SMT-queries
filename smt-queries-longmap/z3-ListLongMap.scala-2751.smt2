; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40360 () Bool)

(assert start!40360)

(declare-fun b!443366 () Bool)

(declare-fun res!262713 () Bool)

(declare-fun e!260879 () Bool)

(assert (=> b!443366 (=> (not res!262713) (not e!260879))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27303 0))(
  ( (array!27304 (arr!13099 (Array (_ BitVec 32) (_ BitVec 64))) (size!13451 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27303)

(assert (=> b!443366 (= res!262713 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13451 _keys!709))))))

(declare-fun b!443367 () Bool)

(declare-fun res!262717 () Bool)

(assert (=> b!443367 (=> (not res!262717) (not e!260879))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443367 (= res!262717 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443368 () Bool)

(declare-fun res!262719 () Bool)

(assert (=> b!443368 (=> (not res!262719) (not e!260879))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443368 (= res!262719 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19245 () Bool)

(declare-fun mapRes!19245 () Bool)

(declare-fun tp!37227 () Bool)

(declare-fun e!260881 () Bool)

(assert (=> mapNonEmpty!19245 (= mapRes!19245 (and tp!37227 e!260881))))

(declare-datatypes ((V!16765 0))(
  ( (V!16766 (val!5917 Int)) )
))
(declare-datatypes ((ValueCell!5529 0))(
  ( (ValueCellFull!5529 (v!8168 V!16765)) (EmptyCell!5529) )
))
(declare-fun mapRest!19245 () (Array (_ BitVec 32) ValueCell!5529))

(declare-datatypes ((array!27305 0))(
  ( (array!27306 (arr!13100 (Array (_ BitVec 32) ValueCell!5529)) (size!13452 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27305)

(declare-fun mapKey!19245 () (_ BitVec 32))

(declare-fun mapValue!19245 () ValueCell!5529)

(assert (=> mapNonEmpty!19245 (= (arr!13100 _values!549) (store mapRest!19245 mapKey!19245 mapValue!19245))))

(declare-fun b!443369 () Bool)

(declare-fun res!262718 () Bool)

(assert (=> b!443369 (=> (not res!262718) (not e!260879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443369 (= res!262718 (validKeyInArray!0 k0!794))))

(declare-fun b!443370 () Bool)

(declare-fun e!260878 () Bool)

(assert (=> b!443370 (= e!260879 e!260878)))

(declare-fun res!262715 () Bool)

(assert (=> b!443370 (=> (not res!262715) (not e!260878))))

(declare-fun lt!203327 () array!27303)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27303 (_ BitVec 32)) Bool)

(assert (=> b!443370 (= res!262715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203327 mask!1025))))

(assert (=> b!443370 (= lt!203327 (array!27304 (store (arr!13099 _keys!709) i!563 k0!794) (size!13451 _keys!709)))))

(declare-fun b!443371 () Bool)

(declare-fun res!262711 () Bool)

(assert (=> b!443371 (=> (not res!262711) (not e!260879))))

(declare-datatypes ((List!7854 0))(
  ( (Nil!7851) (Cons!7850 (h!8706 (_ BitVec 64)) (t!13612 List!7854)) )
))
(declare-fun arrayNoDuplicates!0 (array!27303 (_ BitVec 32) List!7854) Bool)

(assert (=> b!443371 (= res!262711 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7851))))

(declare-fun b!443372 () Bool)

(assert (=> b!443372 (= e!260878 false)))

(declare-fun lt!203326 () Bool)

(assert (=> b!443372 (= lt!203326 (arrayNoDuplicates!0 lt!203327 #b00000000000000000000000000000000 Nil!7851))))

(declare-fun b!443373 () Bool)

(declare-fun res!262714 () Bool)

(assert (=> b!443373 (=> (not res!262714) (not e!260879))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443373 (= res!262714 (and (= (size!13452 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13451 _keys!709) (size!13452 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443374 () Bool)

(declare-fun e!260877 () Bool)

(declare-fun e!260880 () Bool)

(assert (=> b!443374 (= e!260877 (and e!260880 mapRes!19245))))

(declare-fun condMapEmpty!19245 () Bool)

(declare-fun mapDefault!19245 () ValueCell!5529)

(assert (=> b!443374 (= condMapEmpty!19245 (= (arr!13100 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5529)) mapDefault!19245)))))

(declare-fun b!443375 () Bool)

(declare-fun tp_is_empty!11745 () Bool)

(assert (=> b!443375 (= e!260881 tp_is_empty!11745)))

(declare-fun b!443376 () Bool)

(assert (=> b!443376 (= e!260880 tp_is_empty!11745)))

(declare-fun mapIsEmpty!19245 () Bool)

(assert (=> mapIsEmpty!19245 mapRes!19245))

(declare-fun res!262712 () Bool)

(assert (=> start!40360 (=> (not res!262712) (not e!260879))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40360 (= res!262712 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13451 _keys!709))))))

(assert (=> start!40360 e!260879))

(assert (=> start!40360 true))

(declare-fun array_inv!9502 (array!27305) Bool)

(assert (=> start!40360 (and (array_inv!9502 _values!549) e!260877)))

(declare-fun array_inv!9503 (array!27303) Bool)

(assert (=> start!40360 (array_inv!9503 _keys!709)))

(declare-fun b!443377 () Bool)

(declare-fun res!262720 () Bool)

(assert (=> b!443377 (=> (not res!262720) (not e!260879))))

(assert (=> b!443377 (= res!262720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443378 () Bool)

(declare-fun res!262716 () Bool)

(assert (=> b!443378 (=> (not res!262716) (not e!260879))))

(assert (=> b!443378 (= res!262716 (or (= (select (arr!13099 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13099 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40360 res!262712) b!443368))

(assert (= (and b!443368 res!262719) b!443373))

(assert (= (and b!443373 res!262714) b!443377))

(assert (= (and b!443377 res!262720) b!443371))

(assert (= (and b!443371 res!262711) b!443366))

(assert (= (and b!443366 res!262713) b!443369))

(assert (= (and b!443369 res!262718) b!443378))

(assert (= (and b!443378 res!262716) b!443367))

(assert (= (and b!443367 res!262717) b!443370))

(assert (= (and b!443370 res!262715) b!443372))

(assert (= (and b!443374 condMapEmpty!19245) mapIsEmpty!19245))

(assert (= (and b!443374 (not condMapEmpty!19245)) mapNonEmpty!19245))

(get-info :version)

(assert (= (and mapNonEmpty!19245 ((_ is ValueCellFull!5529) mapValue!19245)) b!443375))

(assert (= (and b!443374 ((_ is ValueCellFull!5529) mapDefault!19245)) b!443376))

(assert (= start!40360 b!443374))

(declare-fun m!429661 () Bool)

(assert (=> b!443377 m!429661))

(declare-fun m!429663 () Bool)

(assert (=> b!443368 m!429663))

(declare-fun m!429665 () Bool)

(assert (=> b!443370 m!429665))

(declare-fun m!429667 () Bool)

(assert (=> b!443370 m!429667))

(declare-fun m!429669 () Bool)

(assert (=> b!443372 m!429669))

(declare-fun m!429671 () Bool)

(assert (=> mapNonEmpty!19245 m!429671))

(declare-fun m!429673 () Bool)

(assert (=> b!443367 m!429673))

(declare-fun m!429675 () Bool)

(assert (=> start!40360 m!429675))

(declare-fun m!429677 () Bool)

(assert (=> start!40360 m!429677))

(declare-fun m!429679 () Bool)

(assert (=> b!443371 m!429679))

(declare-fun m!429681 () Bool)

(assert (=> b!443369 m!429681))

(declare-fun m!429683 () Bool)

(assert (=> b!443378 m!429683))

(check-sat (not b!443372) (not b!443368) (not b!443370) (not b!443369) (not b!443377) (not b!443371) (not b!443367) (not mapNonEmpty!19245) (not start!40360) tp_is_empty!11745)
(check-sat)
