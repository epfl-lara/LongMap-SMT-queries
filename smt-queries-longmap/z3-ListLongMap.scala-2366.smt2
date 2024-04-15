; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37644 () Bool)

(assert start!37644)

(declare-fun b!385287 () Bool)

(declare-fun res!219803 () Bool)

(declare-fun e!233852 () Bool)

(assert (=> b!385287 (=> (not res!219803) (not e!233852))))

(declare-datatypes ((array!22753 0))(
  ( (array!22754 (arr!10845 (Array (_ BitVec 32) (_ BitVec 64))) (size!11198 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22753)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385287 (= res!219803 (or (= (select (arr!10845 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10845 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15714 () Bool)

(declare-fun mapRes!15714 () Bool)

(assert (=> mapIsEmpty!15714 mapRes!15714))

(declare-fun b!385288 () Bool)

(declare-fun res!219807 () Bool)

(assert (=> b!385288 (=> (not res!219807) (not e!233852))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385288 (= res!219807 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385289 () Bool)

(declare-fun res!219802 () Bool)

(assert (=> b!385289 (=> (not res!219802) (not e!233852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385289 (= res!219802 (validKeyInArray!0 k0!778))))

(declare-fun b!385290 () Bool)

(assert (=> b!385290 (= e!233852 false)))

(declare-fun lt!181398 () Bool)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22753 (_ BitVec 32)) Bool)

(assert (=> b!385290 (= lt!181398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!22754 (store (arr!10845 _keys!658) i!548 k0!778) (size!11198 _keys!658)) mask!970))))

(declare-fun res!219809 () Bool)

(assert (=> start!37644 (=> (not res!219809) (not e!233852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37644 (= res!219809 (validMask!0 mask!970))))

(assert (=> start!37644 e!233852))

(assert (=> start!37644 true))

(declare-datatypes ((V!13683 0))(
  ( (V!13684 (val!4761 Int)) )
))
(declare-datatypes ((ValueCell!4373 0))(
  ( (ValueCellFull!4373 (v!6952 V!13683)) (EmptyCell!4373) )
))
(declare-datatypes ((array!22755 0))(
  ( (array!22756 (arr!10846 (Array (_ BitVec 32) ValueCell!4373)) (size!11199 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22755)

(declare-fun e!233850 () Bool)

(declare-fun array_inv!7982 (array!22755) Bool)

(assert (=> start!37644 (and (array_inv!7982 _values!506) e!233850)))

(declare-fun array_inv!7983 (array!22753) Bool)

(assert (=> start!37644 (array_inv!7983 _keys!658)))

(declare-fun b!385291 () Bool)

(declare-fun e!233851 () Bool)

(assert (=> b!385291 (= e!233850 (and e!233851 mapRes!15714))))

(declare-fun condMapEmpty!15714 () Bool)

(declare-fun mapDefault!15714 () ValueCell!4373)

(assert (=> b!385291 (= condMapEmpty!15714 (= (arr!10846 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4373)) mapDefault!15714)))))

(declare-fun b!385292 () Bool)

(declare-fun res!219806 () Bool)

(assert (=> b!385292 (=> (not res!219806) (not e!233852))))

(declare-datatypes ((List!6215 0))(
  ( (Nil!6212) (Cons!6211 (h!7067 (_ BitVec 64)) (t!11356 List!6215)) )
))
(declare-fun arrayNoDuplicates!0 (array!22753 (_ BitVec 32) List!6215) Bool)

(assert (=> b!385292 (= res!219806 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6212))))

(declare-fun b!385293 () Bool)

(declare-fun e!233848 () Bool)

(declare-fun tp_is_empty!9433 () Bool)

(assert (=> b!385293 (= e!233848 tp_is_empty!9433)))

(declare-fun b!385294 () Bool)

(declare-fun res!219804 () Bool)

(assert (=> b!385294 (=> (not res!219804) (not e!233852))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385294 (= res!219804 (and (= (size!11199 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11198 _keys!658) (size!11199 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15714 () Bool)

(declare-fun tp!31041 () Bool)

(assert (=> mapNonEmpty!15714 (= mapRes!15714 (and tp!31041 e!233848))))

(declare-fun mapKey!15714 () (_ BitVec 32))

(declare-fun mapRest!15714 () (Array (_ BitVec 32) ValueCell!4373))

(declare-fun mapValue!15714 () ValueCell!4373)

(assert (=> mapNonEmpty!15714 (= (arr!10846 _values!506) (store mapRest!15714 mapKey!15714 mapValue!15714))))

(declare-fun b!385295 () Bool)

(declare-fun res!219805 () Bool)

(assert (=> b!385295 (=> (not res!219805) (not e!233852))))

(assert (=> b!385295 (= res!219805 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11198 _keys!658))))))

(declare-fun b!385296 () Bool)

(declare-fun res!219808 () Bool)

(assert (=> b!385296 (=> (not res!219808) (not e!233852))))

(assert (=> b!385296 (= res!219808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385297 () Bool)

(assert (=> b!385297 (= e!233851 tp_is_empty!9433)))

(assert (= (and start!37644 res!219809) b!385294))

(assert (= (and b!385294 res!219804) b!385296))

(assert (= (and b!385296 res!219808) b!385292))

(assert (= (and b!385292 res!219806) b!385295))

(assert (= (and b!385295 res!219805) b!385289))

(assert (= (and b!385289 res!219802) b!385287))

(assert (= (and b!385287 res!219803) b!385288))

(assert (= (and b!385288 res!219807) b!385290))

(assert (= (and b!385291 condMapEmpty!15714) mapIsEmpty!15714))

(assert (= (and b!385291 (not condMapEmpty!15714)) mapNonEmpty!15714))

(get-info :version)

(assert (= (and mapNonEmpty!15714 ((_ is ValueCellFull!4373) mapValue!15714)) b!385293))

(assert (= (and b!385291 ((_ is ValueCellFull!4373) mapDefault!15714)) b!385297))

(assert (= start!37644 b!385291))

(declare-fun m!381419 () Bool)

(assert (=> b!385289 m!381419))

(declare-fun m!381421 () Bool)

(assert (=> b!385296 m!381421))

(declare-fun m!381423 () Bool)

(assert (=> b!385287 m!381423))

(declare-fun m!381425 () Bool)

(assert (=> b!385290 m!381425))

(declare-fun m!381427 () Bool)

(assert (=> b!385290 m!381427))

(declare-fun m!381429 () Bool)

(assert (=> start!37644 m!381429))

(declare-fun m!381431 () Bool)

(assert (=> start!37644 m!381431))

(declare-fun m!381433 () Bool)

(assert (=> start!37644 m!381433))

(declare-fun m!381435 () Bool)

(assert (=> b!385292 m!381435))

(declare-fun m!381437 () Bool)

(assert (=> b!385288 m!381437))

(declare-fun m!381439 () Bool)

(assert (=> mapNonEmpty!15714 m!381439))

(check-sat (not b!385290) (not b!385288) (not start!37644) (not mapNonEmpty!15714) tp_is_empty!9433 (not b!385289) (not b!385296) (not b!385292))
(check-sat)
