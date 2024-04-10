; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40334 () Bool)

(assert start!40334)

(declare-fun b!443073 () Bool)

(declare-fun e!260732 () Bool)

(declare-fun tp_is_empty!11733 () Bool)

(assert (=> b!443073 (= e!260732 tp_is_empty!11733)))

(declare-fun mapIsEmpty!19224 () Bool)

(declare-fun mapRes!19224 () Bool)

(assert (=> mapIsEmpty!19224 mapRes!19224))

(declare-fun b!443074 () Bool)

(declare-fun e!260731 () Bool)

(assert (=> b!443074 (= e!260731 false)))

(declare-fun lt!203288 () Bool)

(declare-datatypes ((array!27277 0))(
  ( (array!27278 (arr!13087 (Array (_ BitVec 32) (_ BitVec 64))) (size!13439 (_ BitVec 32))) )
))
(declare-fun lt!203287 () array!27277)

(declare-datatypes ((List!7850 0))(
  ( (Nil!7847) (Cons!7846 (h!8702 (_ BitVec 64)) (t!13608 List!7850)) )
))
(declare-fun arrayNoDuplicates!0 (array!27277 (_ BitVec 32) List!7850) Bool)

(assert (=> b!443074 (= lt!203288 (arrayNoDuplicates!0 lt!203287 #b00000000000000000000000000000000 Nil!7847))))

(declare-fun b!443075 () Bool)

(declare-fun res!262498 () Bool)

(declare-fun e!260733 () Bool)

(assert (=> b!443075 (=> (not res!262498) (not e!260733))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27277)

(assert (=> b!443075 (= res!262498 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13439 _keys!709))))))

(declare-fun b!443076 () Bool)

(assert (=> b!443076 (= e!260733 e!260731)))

(declare-fun res!262503 () Bool)

(assert (=> b!443076 (=> (not res!262503) (not e!260731))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27277 (_ BitVec 32)) Bool)

(assert (=> b!443076 (= res!262503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203287 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!443076 (= lt!203287 (array!27278 (store (arr!13087 _keys!709) i!563 k0!794) (size!13439 _keys!709)))))

(declare-fun b!443077 () Bool)

(declare-fun res!262497 () Bool)

(assert (=> b!443077 (=> (not res!262497) (not e!260733))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16749 0))(
  ( (V!16750 (val!5911 Int)) )
))
(declare-datatypes ((ValueCell!5523 0))(
  ( (ValueCellFull!5523 (v!8162 V!16749)) (EmptyCell!5523) )
))
(declare-datatypes ((array!27279 0))(
  ( (array!27280 (arr!13088 (Array (_ BitVec 32) ValueCell!5523)) (size!13440 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27279)

(assert (=> b!443077 (= res!262497 (and (= (size!13440 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13439 _keys!709) (size!13440 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19224 () Bool)

(declare-fun tp!37206 () Bool)

(assert (=> mapNonEmpty!19224 (= mapRes!19224 (and tp!37206 e!260732))))

(declare-fun mapKey!19224 () (_ BitVec 32))

(declare-fun mapValue!19224 () ValueCell!5523)

(declare-fun mapRest!19224 () (Array (_ BitVec 32) ValueCell!5523))

(assert (=> mapNonEmpty!19224 (= (arr!13088 _values!549) (store mapRest!19224 mapKey!19224 mapValue!19224))))

(declare-fun b!443078 () Bool)

(declare-fun res!262499 () Bool)

(assert (=> b!443078 (=> (not res!262499) (not e!260733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443078 (= res!262499 (validMask!0 mask!1025))))

(declare-fun b!443079 () Bool)

(declare-fun res!262500 () Bool)

(assert (=> b!443079 (=> (not res!262500) (not e!260733))))

(assert (=> b!443079 (= res!262500 (or (= (select (arr!13087 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13087 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443080 () Bool)

(declare-fun e!260729 () Bool)

(declare-fun e!260734 () Bool)

(assert (=> b!443080 (= e!260729 (and e!260734 mapRes!19224))))

(declare-fun condMapEmpty!19224 () Bool)

(declare-fun mapDefault!19224 () ValueCell!5523)

(assert (=> b!443080 (= condMapEmpty!19224 (= (arr!13088 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5523)) mapDefault!19224)))))

(declare-fun res!262496 () Bool)

(assert (=> start!40334 (=> (not res!262496) (not e!260733))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40334 (= res!262496 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13439 _keys!709))))))

(assert (=> start!40334 e!260733))

(assert (=> start!40334 true))

(declare-fun array_inv!9492 (array!27279) Bool)

(assert (=> start!40334 (and (array_inv!9492 _values!549) e!260729)))

(declare-fun array_inv!9493 (array!27277) Bool)

(assert (=> start!40334 (array_inv!9493 _keys!709)))

(declare-fun b!443081 () Bool)

(declare-fun res!262501 () Bool)

(assert (=> b!443081 (=> (not res!262501) (not e!260733))))

(assert (=> b!443081 (= res!262501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443082 () Bool)

(declare-fun res!262504 () Bool)

(assert (=> b!443082 (=> (not res!262504) (not e!260733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443082 (= res!262504 (validKeyInArray!0 k0!794))))

(declare-fun b!443083 () Bool)

(declare-fun res!262505 () Bool)

(assert (=> b!443083 (=> (not res!262505) (not e!260733))))

(assert (=> b!443083 (= res!262505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7847))))

(declare-fun b!443084 () Bool)

(declare-fun res!262502 () Bool)

(assert (=> b!443084 (=> (not res!262502) (not e!260733))))

(declare-fun arrayContainsKey!0 (array!27277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443084 (= res!262502 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443085 () Bool)

(assert (=> b!443085 (= e!260734 tp_is_empty!11733)))

(assert (= (and start!40334 res!262496) b!443078))

(assert (= (and b!443078 res!262499) b!443077))

(assert (= (and b!443077 res!262497) b!443081))

(assert (= (and b!443081 res!262501) b!443083))

(assert (= (and b!443083 res!262505) b!443075))

(assert (= (and b!443075 res!262498) b!443082))

(assert (= (and b!443082 res!262504) b!443079))

(assert (= (and b!443079 res!262500) b!443084))

(assert (= (and b!443084 res!262502) b!443076))

(assert (= (and b!443076 res!262503) b!443074))

(assert (= (and b!443080 condMapEmpty!19224) mapIsEmpty!19224))

(assert (= (and b!443080 (not condMapEmpty!19224)) mapNonEmpty!19224))

(get-info :version)

(assert (= (and mapNonEmpty!19224 ((_ is ValueCellFull!5523) mapValue!19224)) b!443073))

(assert (= (and b!443080 ((_ is ValueCellFull!5523) mapDefault!19224)) b!443085))

(assert (= start!40334 b!443080))

(declare-fun m!429481 () Bool)

(assert (=> b!443074 m!429481))

(declare-fun m!429483 () Bool)

(assert (=> b!443083 m!429483))

(declare-fun m!429485 () Bool)

(assert (=> b!443079 m!429485))

(declare-fun m!429487 () Bool)

(assert (=> b!443084 m!429487))

(declare-fun m!429489 () Bool)

(assert (=> b!443081 m!429489))

(declare-fun m!429491 () Bool)

(assert (=> start!40334 m!429491))

(declare-fun m!429493 () Bool)

(assert (=> start!40334 m!429493))

(declare-fun m!429495 () Bool)

(assert (=> b!443076 m!429495))

(declare-fun m!429497 () Bool)

(assert (=> b!443076 m!429497))

(declare-fun m!429499 () Bool)

(assert (=> b!443082 m!429499))

(declare-fun m!429501 () Bool)

(assert (=> mapNonEmpty!19224 m!429501))

(declare-fun m!429503 () Bool)

(assert (=> b!443078 m!429503))

(check-sat (not b!443074) (not start!40334) (not b!443081) (not b!443083) tp_is_empty!11733 (not mapNonEmpty!19224) (not b!443076) (not b!443082) (not b!443084) (not b!443078))
(check-sat)
