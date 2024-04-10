; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40328 () Bool)

(assert start!40328)

(declare-fun b!442957 () Bool)

(declare-fun e!260678 () Bool)

(declare-fun tp_is_empty!11727 () Bool)

(assert (=> b!442957 (= e!260678 tp_is_empty!11727)))

(declare-fun b!442958 () Bool)

(declare-fun res!262415 () Bool)

(declare-fun e!260680 () Bool)

(assert (=> b!442958 (=> (not res!262415) (not e!260680))))

(declare-datatypes ((array!27265 0))(
  ( (array!27266 (arr!13081 (Array (_ BitVec 32) (_ BitVec 64))) (size!13433 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27265)

(declare-datatypes ((List!7847 0))(
  ( (Nil!7844) (Cons!7843 (h!8699 (_ BitVec 64)) (t!13605 List!7847)) )
))
(declare-fun arrayNoDuplicates!0 (array!27265 (_ BitVec 32) List!7847) Bool)

(assert (=> b!442958 (= res!262415 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7844))))

(declare-fun b!442959 () Bool)

(declare-fun res!262412 () Bool)

(assert (=> b!442959 (=> (not res!262412) (not e!260680))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27265 (_ BitVec 32)) Bool)

(assert (=> b!442959 (= res!262412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442960 () Bool)

(declare-fun e!260679 () Bool)

(assert (=> b!442960 (= e!260679 tp_is_empty!11727)))

(declare-fun b!442961 () Bool)

(declare-fun res!262411 () Bool)

(assert (=> b!442961 (=> (not res!262411) (not e!260680))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442961 (= res!262411 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442962 () Bool)

(declare-fun e!260675 () Bool)

(assert (=> b!442962 (= e!260680 e!260675)))

(declare-fun res!262408 () Bool)

(assert (=> b!442962 (=> (not res!262408) (not e!260675))))

(declare-fun lt!203269 () array!27265)

(assert (=> b!442962 (= res!262408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203269 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442962 (= lt!203269 (array!27266 (store (arr!13081 _keys!709) i!563 k0!794) (size!13433 _keys!709)))))

(declare-fun mapIsEmpty!19215 () Bool)

(declare-fun mapRes!19215 () Bool)

(assert (=> mapIsEmpty!19215 mapRes!19215))

(declare-fun b!442963 () Bool)

(declare-fun res!262410 () Bool)

(assert (=> b!442963 (=> (not res!262410) (not e!260680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442963 (= res!262410 (validMask!0 mask!1025))))

(declare-fun b!442964 () Bool)

(declare-fun res!262413 () Bool)

(assert (=> b!442964 (=> (not res!262413) (not e!260680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442964 (= res!262413 (validKeyInArray!0 k0!794))))

(declare-fun b!442965 () Bool)

(assert (=> b!442965 (= e!260675 false)))

(declare-fun lt!203270 () Bool)

(assert (=> b!442965 (= lt!203270 (arrayNoDuplicates!0 lt!203269 #b00000000000000000000000000000000 Nil!7844))))

(declare-fun b!442966 () Bool)

(declare-fun e!260677 () Bool)

(assert (=> b!442966 (= e!260677 (and e!260679 mapRes!19215))))

(declare-fun condMapEmpty!19215 () Bool)

(declare-datatypes ((V!16741 0))(
  ( (V!16742 (val!5908 Int)) )
))
(declare-datatypes ((ValueCell!5520 0))(
  ( (ValueCellFull!5520 (v!8159 V!16741)) (EmptyCell!5520) )
))
(declare-datatypes ((array!27267 0))(
  ( (array!27268 (arr!13082 (Array (_ BitVec 32) ValueCell!5520)) (size!13434 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27267)

(declare-fun mapDefault!19215 () ValueCell!5520)

(assert (=> b!442966 (= condMapEmpty!19215 (= (arr!13082 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5520)) mapDefault!19215)))))

(declare-fun mapNonEmpty!19215 () Bool)

(declare-fun tp!37197 () Bool)

(assert (=> mapNonEmpty!19215 (= mapRes!19215 (and tp!37197 e!260678))))

(declare-fun mapKey!19215 () (_ BitVec 32))

(declare-fun mapValue!19215 () ValueCell!5520)

(declare-fun mapRest!19215 () (Array (_ BitVec 32) ValueCell!5520))

(assert (=> mapNonEmpty!19215 (= (arr!13082 _values!549) (store mapRest!19215 mapKey!19215 mapValue!19215))))

(declare-fun res!262407 () Bool)

(assert (=> start!40328 (=> (not res!262407) (not e!260680))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40328 (= res!262407 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13433 _keys!709))))))

(assert (=> start!40328 e!260680))

(assert (=> start!40328 true))

(declare-fun array_inv!9486 (array!27267) Bool)

(assert (=> start!40328 (and (array_inv!9486 _values!549) e!260677)))

(declare-fun array_inv!9487 (array!27265) Bool)

(assert (=> start!40328 (array_inv!9487 _keys!709)))

(declare-fun b!442956 () Bool)

(declare-fun res!262409 () Bool)

(assert (=> b!442956 (=> (not res!262409) (not e!260680))))

(assert (=> b!442956 (= res!262409 (or (= (select (arr!13081 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13081 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442967 () Bool)

(declare-fun res!262414 () Bool)

(assert (=> b!442967 (=> (not res!262414) (not e!260680))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442967 (= res!262414 (and (= (size!13434 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13433 _keys!709) (size!13434 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442968 () Bool)

(declare-fun res!262406 () Bool)

(assert (=> b!442968 (=> (not res!262406) (not e!260680))))

(assert (=> b!442968 (= res!262406 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13433 _keys!709))))))

(assert (= (and start!40328 res!262407) b!442963))

(assert (= (and b!442963 res!262410) b!442967))

(assert (= (and b!442967 res!262414) b!442959))

(assert (= (and b!442959 res!262412) b!442958))

(assert (= (and b!442958 res!262415) b!442968))

(assert (= (and b!442968 res!262406) b!442964))

(assert (= (and b!442964 res!262413) b!442956))

(assert (= (and b!442956 res!262409) b!442961))

(assert (= (and b!442961 res!262411) b!442962))

(assert (= (and b!442962 res!262408) b!442965))

(assert (= (and b!442966 condMapEmpty!19215) mapIsEmpty!19215))

(assert (= (and b!442966 (not condMapEmpty!19215)) mapNonEmpty!19215))

(get-info :version)

(assert (= (and mapNonEmpty!19215 ((_ is ValueCellFull!5520) mapValue!19215)) b!442957))

(assert (= (and b!442966 ((_ is ValueCellFull!5520) mapDefault!19215)) b!442960))

(assert (= start!40328 b!442966))

(declare-fun m!429409 () Bool)

(assert (=> b!442965 m!429409))

(declare-fun m!429411 () Bool)

(assert (=> b!442956 m!429411))

(declare-fun m!429413 () Bool)

(assert (=> b!442959 m!429413))

(declare-fun m!429415 () Bool)

(assert (=> b!442961 m!429415))

(declare-fun m!429417 () Bool)

(assert (=> mapNonEmpty!19215 m!429417))

(declare-fun m!429419 () Bool)

(assert (=> start!40328 m!429419))

(declare-fun m!429421 () Bool)

(assert (=> start!40328 m!429421))

(declare-fun m!429423 () Bool)

(assert (=> b!442964 m!429423))

(declare-fun m!429425 () Bool)

(assert (=> b!442963 m!429425))

(declare-fun m!429427 () Bool)

(assert (=> b!442958 m!429427))

(declare-fun m!429429 () Bool)

(assert (=> b!442962 m!429429))

(declare-fun m!429431 () Bool)

(assert (=> b!442962 m!429431))

(check-sat (not start!40328) (not b!442961) (not b!442965) (not b!442963) (not mapNonEmpty!19215) (not b!442959) tp_is_empty!11727 (not b!442964) (not b!442958) (not b!442962))
(check-sat)
