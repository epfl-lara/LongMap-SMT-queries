; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38370 () Bool)

(assert start!38370)

(declare-fun b!395856 () Bool)

(declare-fun e!239601 () Bool)

(declare-fun e!239599 () Bool)

(declare-fun mapRes!16368 () Bool)

(assert (=> b!395856 (= e!239601 (and e!239599 mapRes!16368))))

(declare-fun condMapEmpty!16368 () Bool)

(declare-datatypes ((V!14221 0))(
  ( (V!14222 (val!4963 Int)) )
))
(declare-datatypes ((ValueCell!4575 0))(
  ( (ValueCellFull!4575 (v!7209 V!14221)) (EmptyCell!4575) )
))
(declare-datatypes ((array!23581 0))(
  ( (array!23582 (arr!11243 (Array (_ BitVec 32) ValueCell!4575)) (size!11595 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23581)

(declare-fun mapDefault!16368 () ValueCell!4575)

(assert (=> b!395856 (= condMapEmpty!16368 (= (arr!11243 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4575)) mapDefault!16368)))))

(declare-fun b!395857 () Bool)

(declare-fun e!239598 () Bool)

(declare-fun tp_is_empty!9837 () Bool)

(assert (=> b!395857 (= e!239598 tp_is_empty!9837)))

(declare-fun mapNonEmpty!16368 () Bool)

(declare-fun tp!32163 () Bool)

(assert (=> mapNonEmpty!16368 (= mapRes!16368 (and tp!32163 e!239598))))

(declare-fun mapValue!16368 () ValueCell!4575)

(declare-fun mapRest!16368 () (Array (_ BitVec 32) ValueCell!4575))

(declare-fun mapKey!16368 () (_ BitVec 32))

(assert (=> mapNonEmpty!16368 (= (arr!11243 _values!549) (store mapRest!16368 mapKey!16368 mapValue!16368))))

(declare-fun b!395858 () Bool)

(declare-fun res!227008 () Bool)

(declare-fun e!239602 () Bool)

(assert (=> b!395858 (=> (not res!227008) (not e!239602))))

(declare-datatypes ((array!23583 0))(
  ( (array!23584 (arr!11244 (Array (_ BitVec 32) (_ BitVec 64))) (size!11596 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23583)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23583 (_ BitVec 32)) Bool)

(assert (=> b!395858 (= res!227008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395859 () Bool)

(assert (=> b!395859 (= e!239599 tp_is_empty!9837)))

(declare-fun b!395860 () Bool)

(declare-fun res!227009 () Bool)

(assert (=> b!395860 (=> (not res!227009) (not e!239602))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395860 (= res!227009 (validKeyInArray!0 k0!794))))

(declare-fun res!227012 () Bool)

(assert (=> start!38370 (=> (not res!227012) (not e!239602))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38370 (= res!227012 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11596 _keys!709))))))

(assert (=> start!38370 e!239602))

(assert (=> start!38370 true))

(declare-fun array_inv!8252 (array!23581) Bool)

(assert (=> start!38370 (and (array_inv!8252 _values!549) e!239601)))

(declare-fun array_inv!8253 (array!23583) Bool)

(assert (=> start!38370 (array_inv!8253 _keys!709)))

(declare-fun b!395861 () Bool)

(declare-fun res!227006 () Bool)

(assert (=> b!395861 (=> (not res!227006) (not e!239602))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395861 (= res!227006 (or (= (select (arr!11244 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11244 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16368 () Bool)

(assert (=> mapIsEmpty!16368 mapRes!16368))

(declare-fun b!395862 () Bool)

(declare-fun res!227005 () Bool)

(assert (=> b!395862 (=> (not res!227005) (not e!239602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395862 (= res!227005 (validMask!0 mask!1025))))

(declare-fun b!395863 () Bool)

(assert (=> b!395863 (= e!239602 (and (bvsle #b00000000000000000000000000000000 (size!11596 _keys!709)) (bvsge (size!11596 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395864 () Bool)

(declare-fun res!227011 () Bool)

(assert (=> b!395864 (=> (not res!227011) (not e!239602))))

(assert (=> b!395864 (= res!227011 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11596 _keys!709))))))

(declare-fun b!395865 () Bool)

(declare-fun res!227013 () Bool)

(assert (=> b!395865 (=> (not res!227013) (not e!239602))))

(assert (=> b!395865 (= res!227013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) mask!1025))))

(declare-fun b!395866 () Bool)

(declare-fun res!227014 () Bool)

(assert (=> b!395866 (=> (not res!227014) (not e!239602))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395866 (= res!227014 (and (= (size!11595 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11596 _keys!709) (size!11595 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395867 () Bool)

(declare-fun res!227010 () Bool)

(assert (=> b!395867 (=> (not res!227010) (not e!239602))))

(declare-fun arrayContainsKey!0 (array!23583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395867 (= res!227010 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395868 () Bool)

(declare-fun res!227007 () Bool)

(assert (=> b!395868 (=> (not res!227007) (not e!239602))))

(declare-datatypes ((List!6518 0))(
  ( (Nil!6515) (Cons!6514 (h!7370 (_ BitVec 64)) (t!11692 List!6518)) )
))
(declare-fun arrayNoDuplicates!0 (array!23583 (_ BitVec 32) List!6518) Bool)

(assert (=> b!395868 (= res!227007 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6515))))

(assert (= (and start!38370 res!227012) b!395862))

(assert (= (and b!395862 res!227005) b!395866))

(assert (= (and b!395866 res!227014) b!395858))

(assert (= (and b!395858 res!227008) b!395868))

(assert (= (and b!395868 res!227007) b!395864))

(assert (= (and b!395864 res!227011) b!395860))

(assert (= (and b!395860 res!227009) b!395861))

(assert (= (and b!395861 res!227006) b!395867))

(assert (= (and b!395867 res!227010) b!395865))

(assert (= (and b!395865 res!227013) b!395863))

(assert (= (and b!395856 condMapEmpty!16368) mapIsEmpty!16368))

(assert (= (and b!395856 (not condMapEmpty!16368)) mapNonEmpty!16368))

(get-info :version)

(assert (= (and mapNonEmpty!16368 ((_ is ValueCellFull!4575) mapValue!16368)) b!395857))

(assert (= (and b!395856 ((_ is ValueCellFull!4575) mapDefault!16368)) b!395859))

(assert (= start!38370 b!395856))

(declare-fun m!391709 () Bool)

(assert (=> b!395862 m!391709))

(declare-fun m!391711 () Bool)

(assert (=> b!395861 m!391711))

(declare-fun m!391713 () Bool)

(assert (=> b!395860 m!391713))

(declare-fun m!391715 () Bool)

(assert (=> b!395867 m!391715))

(declare-fun m!391717 () Bool)

(assert (=> start!38370 m!391717))

(declare-fun m!391719 () Bool)

(assert (=> start!38370 m!391719))

(declare-fun m!391721 () Bool)

(assert (=> mapNonEmpty!16368 m!391721))

(declare-fun m!391723 () Bool)

(assert (=> b!395865 m!391723))

(declare-fun m!391725 () Bool)

(assert (=> b!395865 m!391725))

(declare-fun m!391727 () Bool)

(assert (=> b!395858 m!391727))

(declare-fun m!391729 () Bool)

(assert (=> b!395868 m!391729))

(check-sat (not b!395868) tp_is_empty!9837 (not b!395862) (not b!395860) (not b!395867) (not b!395858) (not mapNonEmpty!16368) (not start!38370) (not b!395865))
(check-sat)
(get-model)

(declare-fun d!73357 () Bool)

(assert (=> d!73357 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395862 d!73357))

(declare-fun d!73359 () Bool)

(declare-fun res!227050 () Bool)

(declare-fun e!239626 () Bool)

(assert (=> d!73359 (=> res!227050 e!239626)))

(assert (=> d!73359 (= res!227050 (bvsge #b00000000000000000000000000000000 (size!11596 _keys!709)))))

(assert (=> d!73359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239626)))

(declare-fun b!395916 () Bool)

(declare-fun e!239624 () Bool)

(declare-fun e!239625 () Bool)

(assert (=> b!395916 (= e!239624 e!239625)))

(declare-fun lt!187101 () (_ BitVec 64))

(assert (=> b!395916 (= lt!187101 (select (arr!11244 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12072 0))(
  ( (Unit!12073) )
))
(declare-fun lt!187100 () Unit!12072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23583 (_ BitVec 64) (_ BitVec 32)) Unit!12072)

(assert (=> b!395916 (= lt!187100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187101 #b00000000000000000000000000000000))))

(assert (=> b!395916 (arrayContainsKey!0 _keys!709 lt!187101 #b00000000000000000000000000000000)))

(declare-fun lt!187102 () Unit!12072)

(assert (=> b!395916 (= lt!187102 lt!187100)))

(declare-fun res!227049 () Bool)

(declare-datatypes ((SeekEntryResult!3524 0))(
  ( (MissingZero!3524 (index!16275 (_ BitVec 32))) (Found!3524 (index!16276 (_ BitVec 32))) (Intermediate!3524 (undefined!4336 Bool) (index!16277 (_ BitVec 32)) (x!38672 (_ BitVec 32))) (Undefined!3524) (MissingVacant!3524 (index!16278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23583 (_ BitVec 32)) SeekEntryResult!3524)

(assert (=> b!395916 (= res!227049 (= (seekEntryOrOpen!0 (select (arr!11244 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3524 #b00000000000000000000000000000000)))))

(assert (=> b!395916 (=> (not res!227049) (not e!239625))))

(declare-fun b!395917 () Bool)

(declare-fun call!27878 () Bool)

(assert (=> b!395917 (= e!239625 call!27878)))

(declare-fun b!395918 () Bool)

(assert (=> b!395918 (= e!239626 e!239624)))

(declare-fun c!54554 () Bool)

(assert (=> b!395918 (= c!54554 (validKeyInArray!0 (select (arr!11244 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27875 () Bool)

(assert (=> bm!27875 (= call!27878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!395919 () Bool)

(assert (=> b!395919 (= e!239624 call!27878)))

(assert (= (and d!73359 (not res!227050)) b!395918))

(assert (= (and b!395918 c!54554) b!395916))

(assert (= (and b!395918 (not c!54554)) b!395919))

(assert (= (and b!395916 res!227049) b!395917))

(assert (= (or b!395917 b!395919) bm!27875))

(declare-fun m!391753 () Bool)

(assert (=> b!395916 m!391753))

(declare-fun m!391755 () Bool)

(assert (=> b!395916 m!391755))

(declare-fun m!391757 () Bool)

(assert (=> b!395916 m!391757))

(assert (=> b!395916 m!391753))

(declare-fun m!391759 () Bool)

(assert (=> b!395916 m!391759))

(assert (=> b!395918 m!391753))

(assert (=> b!395918 m!391753))

(declare-fun m!391761 () Bool)

(assert (=> b!395918 m!391761))

(declare-fun m!391763 () Bool)

(assert (=> bm!27875 m!391763))

(assert (=> b!395858 d!73359))

(declare-fun d!73361 () Bool)

(declare-fun res!227055 () Bool)

(declare-fun e!239631 () Bool)

(assert (=> d!73361 (=> res!227055 e!239631)))

(assert (=> d!73361 (= res!227055 (= (select (arr!11244 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73361 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239631)))

(declare-fun b!395924 () Bool)

(declare-fun e!239632 () Bool)

(assert (=> b!395924 (= e!239631 e!239632)))

(declare-fun res!227056 () Bool)

(assert (=> b!395924 (=> (not res!227056) (not e!239632))))

(assert (=> b!395924 (= res!227056 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11596 _keys!709)))))

(declare-fun b!395925 () Bool)

(assert (=> b!395925 (= e!239632 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73361 (not res!227055)) b!395924))

(assert (= (and b!395924 res!227056) b!395925))

(assert (=> d!73361 m!391753))

(declare-fun m!391765 () Bool)

(assert (=> b!395925 m!391765))

(assert (=> b!395867 d!73361))

(declare-fun d!73363 () Bool)

(assert (=> d!73363 (= (array_inv!8252 _values!549) (bvsge (size!11595 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38370 d!73363))

(declare-fun d!73365 () Bool)

(assert (=> d!73365 (= (array_inv!8253 _keys!709) (bvsge (size!11596 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38370 d!73365))

(declare-fun bm!27878 () Bool)

(declare-fun call!27881 () Bool)

(declare-fun c!54557 () Bool)

(assert (=> bm!27878 (= call!27881 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54557 (Cons!6514 (select (arr!11244 _keys!709) #b00000000000000000000000000000000) Nil!6515) Nil!6515)))))

(declare-fun d!73367 () Bool)

(declare-fun res!227064 () Bool)

(declare-fun e!239643 () Bool)

(assert (=> d!73367 (=> res!227064 e!239643)))

(assert (=> d!73367 (= res!227064 (bvsge #b00000000000000000000000000000000 (size!11596 _keys!709)))))

(assert (=> d!73367 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6515) e!239643)))

(declare-fun b!395936 () Bool)

(declare-fun e!239641 () Bool)

(declare-fun e!239644 () Bool)

(assert (=> b!395936 (= e!239641 e!239644)))

(assert (=> b!395936 (= c!54557 (validKeyInArray!0 (select (arr!11244 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395937 () Bool)

(assert (=> b!395937 (= e!239644 call!27881)))

(declare-fun b!395938 () Bool)

(declare-fun e!239642 () Bool)

(declare-fun contains!2481 (List!6518 (_ BitVec 64)) Bool)

(assert (=> b!395938 (= e!239642 (contains!2481 Nil!6515 (select (arr!11244 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395939 () Bool)

(assert (=> b!395939 (= e!239643 e!239641)))

(declare-fun res!227065 () Bool)

(assert (=> b!395939 (=> (not res!227065) (not e!239641))))

(assert (=> b!395939 (= res!227065 (not e!239642))))

(declare-fun res!227063 () Bool)

(assert (=> b!395939 (=> (not res!227063) (not e!239642))))

(assert (=> b!395939 (= res!227063 (validKeyInArray!0 (select (arr!11244 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395940 () Bool)

(assert (=> b!395940 (= e!239644 call!27881)))

(assert (= (and d!73367 (not res!227064)) b!395939))

(assert (= (and b!395939 res!227063) b!395938))

(assert (= (and b!395939 res!227065) b!395936))

(assert (= (and b!395936 c!54557) b!395940))

(assert (= (and b!395936 (not c!54557)) b!395937))

(assert (= (or b!395940 b!395937) bm!27878))

(assert (=> bm!27878 m!391753))

(declare-fun m!391767 () Bool)

(assert (=> bm!27878 m!391767))

(assert (=> b!395936 m!391753))

(assert (=> b!395936 m!391753))

(assert (=> b!395936 m!391761))

(assert (=> b!395938 m!391753))

(assert (=> b!395938 m!391753))

(declare-fun m!391769 () Bool)

(assert (=> b!395938 m!391769))

(assert (=> b!395939 m!391753))

(assert (=> b!395939 m!391753))

(assert (=> b!395939 m!391761))

(assert (=> b!395868 d!73367))

(declare-fun d!73369 () Bool)

(declare-fun res!227067 () Bool)

(declare-fun e!239647 () Bool)

(assert (=> d!73369 (=> res!227067 e!239647)))

(assert (=> d!73369 (= res!227067 (bvsge #b00000000000000000000000000000000 (size!11596 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)))))))

(assert (=> d!73369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) mask!1025) e!239647)))

(declare-fun b!395941 () Bool)

(declare-fun e!239645 () Bool)

(declare-fun e!239646 () Bool)

(assert (=> b!395941 (= e!239645 e!239646)))

(declare-fun lt!187104 () (_ BitVec 64))

(assert (=> b!395941 (= lt!187104 (select (arr!11244 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709))) #b00000000000000000000000000000000))))

(declare-fun lt!187103 () Unit!12072)

(assert (=> b!395941 (= lt!187103 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) lt!187104 #b00000000000000000000000000000000))))

(assert (=> b!395941 (arrayContainsKey!0 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) lt!187104 #b00000000000000000000000000000000)))

(declare-fun lt!187105 () Unit!12072)

(assert (=> b!395941 (= lt!187105 lt!187103)))

(declare-fun res!227066 () Bool)

(assert (=> b!395941 (= res!227066 (= (seekEntryOrOpen!0 (select (arr!11244 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709))) #b00000000000000000000000000000000) (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) mask!1025) (Found!3524 #b00000000000000000000000000000000)))))

(assert (=> b!395941 (=> (not res!227066) (not e!239646))))

(declare-fun b!395942 () Bool)

(declare-fun call!27882 () Bool)

(assert (=> b!395942 (= e!239646 call!27882)))

(declare-fun b!395943 () Bool)

(assert (=> b!395943 (= e!239647 e!239645)))

(declare-fun c!54558 () Bool)

(assert (=> b!395943 (= c!54558 (validKeyInArray!0 (select (arr!11244 (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun bm!27879 () Bool)

(assert (=> bm!27879 (= call!27882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23584 (store (arr!11244 _keys!709) i!563 k0!794) (size!11596 _keys!709)) mask!1025))))

(declare-fun b!395944 () Bool)

(assert (=> b!395944 (= e!239645 call!27882)))

(assert (= (and d!73369 (not res!227067)) b!395943))

(assert (= (and b!395943 c!54558) b!395941))

(assert (= (and b!395943 (not c!54558)) b!395944))

(assert (= (and b!395941 res!227066) b!395942))

(assert (= (or b!395942 b!395944) bm!27879))

(declare-fun m!391771 () Bool)

(assert (=> b!395941 m!391771))

(declare-fun m!391773 () Bool)

(assert (=> b!395941 m!391773))

(declare-fun m!391775 () Bool)

(assert (=> b!395941 m!391775))

(assert (=> b!395941 m!391771))

(declare-fun m!391777 () Bool)

(assert (=> b!395941 m!391777))

(assert (=> b!395943 m!391771))

(assert (=> b!395943 m!391771))

(declare-fun m!391779 () Bool)

(assert (=> b!395943 m!391779))

(declare-fun m!391781 () Bool)

(assert (=> bm!27879 m!391781))

(assert (=> b!395865 d!73369))

(declare-fun d!73371 () Bool)

(assert (=> d!73371 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395860 d!73371))

(declare-fun condMapEmpty!16374 () Bool)

(declare-fun mapDefault!16374 () ValueCell!4575)

(assert (=> mapNonEmpty!16368 (= condMapEmpty!16374 (= mapRest!16368 ((as const (Array (_ BitVec 32) ValueCell!4575)) mapDefault!16374)))))

(declare-fun e!239653 () Bool)

(declare-fun mapRes!16374 () Bool)

(assert (=> mapNonEmpty!16368 (= tp!32163 (and e!239653 mapRes!16374))))

(declare-fun b!395951 () Bool)

(declare-fun e!239652 () Bool)

(assert (=> b!395951 (= e!239652 tp_is_empty!9837)))

(declare-fun mapIsEmpty!16374 () Bool)

(assert (=> mapIsEmpty!16374 mapRes!16374))

(declare-fun mapNonEmpty!16374 () Bool)

(declare-fun tp!32169 () Bool)

(assert (=> mapNonEmpty!16374 (= mapRes!16374 (and tp!32169 e!239652))))

(declare-fun mapRest!16374 () (Array (_ BitVec 32) ValueCell!4575))

(declare-fun mapKey!16374 () (_ BitVec 32))

(declare-fun mapValue!16374 () ValueCell!4575)

(assert (=> mapNonEmpty!16374 (= mapRest!16368 (store mapRest!16374 mapKey!16374 mapValue!16374))))

(declare-fun b!395952 () Bool)

(assert (=> b!395952 (= e!239653 tp_is_empty!9837)))

(assert (= (and mapNonEmpty!16368 condMapEmpty!16374) mapIsEmpty!16374))

(assert (= (and mapNonEmpty!16368 (not condMapEmpty!16374)) mapNonEmpty!16374))

(assert (= (and mapNonEmpty!16374 ((_ is ValueCellFull!4575) mapValue!16374)) b!395951))

(assert (= (and mapNonEmpty!16368 ((_ is ValueCellFull!4575) mapDefault!16374)) b!395952))

(declare-fun m!391783 () Bool)

(assert (=> mapNonEmpty!16374 m!391783))

(check-sat tp_is_empty!9837 (not b!395939) (not bm!27879) (not bm!27878) (not b!395938) (not mapNonEmpty!16374) (not b!395943) (not b!395925) (not b!395936) (not b!395941) (not b!395918) (not bm!27875) (not b!395916))
(check-sat)
