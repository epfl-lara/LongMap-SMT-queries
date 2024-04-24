; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40422 () Bool)

(assert start!40422)

(declare-fun b!444799 () Bool)

(declare-fun res!263856 () Bool)

(declare-fun e!261533 () Bool)

(assert (=> b!444799 (=> (not res!263856) (not e!261533))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27456 0))(
  ( (array!27457 (arr!13175 (Array (_ BitVec 32) (_ BitVec 64))) (size!13527 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27456)

(assert (=> b!444799 (= res!263856 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13527 _keys!709))))))

(declare-fun mapIsEmpty!19359 () Bool)

(declare-fun mapRes!19359 () Bool)

(assert (=> mapIsEmpty!19359 mapRes!19359))

(declare-fun b!444800 () Bool)

(declare-fun res!263848 () Bool)

(assert (=> b!444800 (=> (not res!263848) (not e!261533))))

(assert (=> b!444800 (= res!263848 (or (= (select (arr!13175 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13175 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444801 () Bool)

(declare-fun e!261531 () Bool)

(declare-fun tp_is_empty!11821 () Bool)

(assert (=> b!444801 (= e!261531 tp_is_empty!11821)))

(declare-fun b!444802 () Bool)

(declare-fun res!263852 () Bool)

(assert (=> b!444802 (=> (not res!263852) (not e!261533))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444802 (= res!263852 (validKeyInArray!0 k0!794))))

(declare-fun b!444803 () Bool)

(declare-fun res!263853 () Bool)

(assert (=> b!444803 (=> (not res!263853) (not e!261533))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444803 (= res!263853 (validMask!0 mask!1025))))

(declare-fun b!444804 () Bool)

(declare-fun res!263854 () Bool)

(assert (=> b!444804 (=> (not res!263854) (not e!261533))))

(declare-fun arrayContainsKey!0 (array!27456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444804 (= res!263854 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!263850 () Bool)

(assert (=> start!40422 (=> (not res!263850) (not e!261533))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40422 (= res!263850 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13527 _keys!709))))))

(assert (=> start!40422 e!261533))

(assert (=> start!40422 true))

(declare-datatypes ((V!16867 0))(
  ( (V!16868 (val!5955 Int)) )
))
(declare-datatypes ((ValueCell!5567 0))(
  ( (ValueCellFull!5567 (v!8207 V!16867)) (EmptyCell!5567) )
))
(declare-datatypes ((array!27458 0))(
  ( (array!27459 (arr!13176 (Array (_ BitVec 32) ValueCell!5567)) (size!13528 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27458)

(declare-fun e!261529 () Bool)

(declare-fun array_inv!9632 (array!27458) Bool)

(assert (=> start!40422 (and (array_inv!9632 _values!549) e!261529)))

(declare-fun array_inv!9633 (array!27456) Bool)

(assert (=> start!40422 (array_inv!9633 _keys!709)))

(declare-fun b!444805 () Bool)

(declare-fun res!263855 () Bool)

(assert (=> b!444805 (=> (not res!263855) (not e!261533))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444805 (= res!263855 (and (= (size!13528 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13527 _keys!709) (size!13528 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444806 () Bool)

(declare-fun res!263857 () Bool)

(assert (=> b!444806 (=> (not res!263857) (not e!261533))))

(declare-datatypes ((List!7793 0))(
  ( (Nil!7790) (Cons!7789 (h!8645 (_ BitVec 64)) (t!13543 List!7793)) )
))
(declare-fun arrayNoDuplicates!0 (array!27456 (_ BitVec 32) List!7793) Bool)

(assert (=> b!444806 (= res!263857 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7790))))

(declare-fun b!444807 () Bool)

(declare-fun e!261534 () Bool)

(assert (=> b!444807 (= e!261533 e!261534)))

(declare-fun res!263851 () Bool)

(assert (=> b!444807 (=> (not res!263851) (not e!261534))))

(declare-fun lt!203573 () array!27456)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27456 (_ BitVec 32)) Bool)

(assert (=> b!444807 (= res!263851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203573 mask!1025))))

(assert (=> b!444807 (= lt!203573 (array!27457 (store (arr!13175 _keys!709) i!563 k0!794) (size!13527 _keys!709)))))

(declare-fun b!444808 () Bool)

(declare-fun e!261530 () Bool)

(assert (=> b!444808 (= e!261529 (and e!261530 mapRes!19359))))

(declare-fun condMapEmpty!19359 () Bool)

(declare-fun mapDefault!19359 () ValueCell!5567)

(assert (=> b!444808 (= condMapEmpty!19359 (= (arr!13176 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5567)) mapDefault!19359)))))

(declare-fun b!444809 () Bool)

(declare-fun res!263849 () Bool)

(assert (=> b!444809 (=> (not res!263849) (not e!261533))))

(assert (=> b!444809 (= res!263849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444810 () Bool)

(assert (=> b!444810 (= e!261530 tp_is_empty!11821)))

(declare-fun mapNonEmpty!19359 () Bool)

(declare-fun tp!37341 () Bool)

(assert (=> mapNonEmpty!19359 (= mapRes!19359 (and tp!37341 e!261531))))

(declare-fun mapKey!19359 () (_ BitVec 32))

(declare-fun mapRest!19359 () (Array (_ BitVec 32) ValueCell!5567))

(declare-fun mapValue!19359 () ValueCell!5567)

(assert (=> mapNonEmpty!19359 (= (arr!13176 _values!549) (store mapRest!19359 mapKey!19359 mapValue!19359))))

(declare-fun b!444811 () Bool)

(assert (=> b!444811 (= e!261534 false)))

(declare-fun lt!203574 () Bool)

(assert (=> b!444811 (= lt!203574 (arrayNoDuplicates!0 lt!203573 #b00000000000000000000000000000000 Nil!7790))))

(assert (= (and start!40422 res!263850) b!444803))

(assert (= (and b!444803 res!263853) b!444805))

(assert (= (and b!444805 res!263855) b!444809))

(assert (= (and b!444809 res!263849) b!444806))

(assert (= (and b!444806 res!263857) b!444799))

(assert (= (and b!444799 res!263856) b!444802))

(assert (= (and b!444802 res!263852) b!444800))

(assert (= (and b!444800 res!263848) b!444804))

(assert (= (and b!444804 res!263854) b!444807))

(assert (= (and b!444807 res!263851) b!444811))

(assert (= (and b!444808 condMapEmpty!19359) mapIsEmpty!19359))

(assert (= (and b!444808 (not condMapEmpty!19359)) mapNonEmpty!19359))

(get-info :version)

(assert (= (and mapNonEmpty!19359 ((_ is ValueCellFull!5567) mapValue!19359)) b!444801))

(assert (= (and b!444808 ((_ is ValueCellFull!5567) mapDefault!19359)) b!444810))

(assert (= start!40422 b!444808))

(declare-fun m!430791 () Bool)

(assert (=> start!40422 m!430791))

(declare-fun m!430793 () Bool)

(assert (=> start!40422 m!430793))

(declare-fun m!430795 () Bool)

(assert (=> mapNonEmpty!19359 m!430795))

(declare-fun m!430797 () Bool)

(assert (=> b!444809 m!430797))

(declare-fun m!430799 () Bool)

(assert (=> b!444803 m!430799))

(declare-fun m!430801 () Bool)

(assert (=> b!444806 m!430801))

(declare-fun m!430803 () Bool)

(assert (=> b!444804 m!430803))

(declare-fun m!430805 () Bool)

(assert (=> b!444800 m!430805))

(declare-fun m!430807 () Bool)

(assert (=> b!444811 m!430807))

(declare-fun m!430809 () Bool)

(assert (=> b!444802 m!430809))

(declare-fun m!430811 () Bool)

(assert (=> b!444807 m!430811))

(declare-fun m!430813 () Bool)

(assert (=> b!444807 m!430813))

(check-sat (not b!444803) (not b!444806) (not b!444804) tp_is_empty!11821 (not b!444809) (not b!444802) (not b!444807) (not b!444811) (not start!40422) (not mapNonEmpty!19359))
(check-sat)
