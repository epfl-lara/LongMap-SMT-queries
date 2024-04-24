; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37644 () Bool)

(assert start!37644)

(declare-fun res!219930 () Bool)

(declare-fun e!233990 () Bool)

(assert (=> start!37644 (=> (not res!219930) (not e!233990))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37644 (= res!219930 (validMask!0 mask!970))))

(assert (=> start!37644 e!233990))

(assert (=> start!37644 true))

(declare-datatypes ((V!13683 0))(
  ( (V!13684 (val!4761 Int)) )
))
(declare-datatypes ((ValueCell!4373 0))(
  ( (ValueCellFull!4373 (v!6959 V!13683)) (EmptyCell!4373) )
))
(declare-datatypes ((array!22756 0))(
  ( (array!22757 (arr!10846 (Array (_ BitVec 32) ValueCell!4373)) (size!11198 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22756)

(declare-fun e!233991 () Bool)

(declare-fun array_inv!8020 (array!22756) Bool)

(assert (=> start!37644 (and (array_inv!8020 _values!506) e!233991)))

(declare-datatypes ((array!22758 0))(
  ( (array!22759 (arr!10847 (Array (_ BitVec 32) (_ BitVec 64))) (size!11199 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22758)

(declare-fun array_inv!8021 (array!22758) Bool)

(assert (=> start!37644 (array_inv!8021 _keys!658)))

(declare-fun b!385509 () Bool)

(declare-fun e!233993 () Bool)

(declare-fun tp_is_empty!9433 () Bool)

(assert (=> b!385509 (= e!233993 tp_is_empty!9433)))

(declare-fun b!385510 () Bool)

(declare-fun res!219932 () Bool)

(assert (=> b!385510 (=> (not res!219932) (not e!233990))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385510 (= res!219932 (or (= (select (arr!10847 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10847 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15714 () Bool)

(declare-fun mapRes!15714 () Bool)

(declare-fun tp!31041 () Bool)

(assert (=> mapNonEmpty!15714 (= mapRes!15714 (and tp!31041 e!233993))))

(declare-fun mapValue!15714 () ValueCell!4373)

(declare-fun mapRest!15714 () (Array (_ BitVec 32) ValueCell!4373))

(declare-fun mapKey!15714 () (_ BitVec 32))

(assert (=> mapNonEmpty!15714 (= (arr!10846 _values!506) (store mapRest!15714 mapKey!15714 mapValue!15714))))

(declare-fun b!385511 () Bool)

(declare-fun res!219933 () Bool)

(assert (=> b!385511 (=> (not res!219933) (not e!233990))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385511 (= res!219933 (and (= (size!11198 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11199 _keys!658) (size!11198 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15714 () Bool)

(assert (=> mapIsEmpty!15714 mapRes!15714))

(declare-fun b!385512 () Bool)

(declare-fun e!233994 () Bool)

(assert (=> b!385512 (= e!233991 (and e!233994 mapRes!15714))))

(declare-fun condMapEmpty!15714 () Bool)

(declare-fun mapDefault!15714 () ValueCell!4373)

(assert (=> b!385512 (= condMapEmpty!15714 (= (arr!10846 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4373)) mapDefault!15714)))))

(declare-fun b!385513 () Bool)

(declare-fun res!219935 () Bool)

(assert (=> b!385513 (=> (not res!219935) (not e!233990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22758 (_ BitVec 32)) Bool)

(assert (=> b!385513 (= res!219935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385514 () Bool)

(assert (=> b!385514 (= e!233994 tp_is_empty!9433)))

(declare-fun b!385515 () Bool)

(declare-fun res!219929 () Bool)

(assert (=> b!385515 (=> (not res!219929) (not e!233990))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385515 (= res!219929 (validKeyInArray!0 k0!778))))

(declare-fun b!385516 () Bool)

(assert (=> b!385516 (= e!233990 false)))

(declare-fun lt!181651 () Bool)

(assert (=> b!385516 (= lt!181651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!22759 (store (arr!10847 _keys!658) i!548 k0!778) (size!11199 _keys!658)) mask!970))))

(declare-fun b!385517 () Bool)

(declare-fun res!219934 () Bool)

(assert (=> b!385517 (=> (not res!219934) (not e!233990))))

(declare-datatypes ((List!6117 0))(
  ( (Nil!6114) (Cons!6113 (h!6969 (_ BitVec 64)) (t!11259 List!6117)) )
))
(declare-fun arrayNoDuplicates!0 (array!22758 (_ BitVec 32) List!6117) Bool)

(assert (=> b!385517 (= res!219934 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6114))))

(declare-fun b!385518 () Bool)

(declare-fun res!219928 () Bool)

(assert (=> b!385518 (=> (not res!219928) (not e!233990))))

(declare-fun arrayContainsKey!0 (array!22758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385518 (= res!219928 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385519 () Bool)

(declare-fun res!219931 () Bool)

(assert (=> b!385519 (=> (not res!219931) (not e!233990))))

(assert (=> b!385519 (= res!219931 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11199 _keys!658))))))

(assert (= (and start!37644 res!219930) b!385511))

(assert (= (and b!385511 res!219933) b!385513))

(assert (= (and b!385513 res!219935) b!385517))

(assert (= (and b!385517 res!219934) b!385519))

(assert (= (and b!385519 res!219931) b!385515))

(assert (= (and b!385515 res!219929) b!385510))

(assert (= (and b!385510 res!219932) b!385518))

(assert (= (and b!385518 res!219928) b!385516))

(assert (= (and b!385512 condMapEmpty!15714) mapIsEmpty!15714))

(assert (= (and b!385512 (not condMapEmpty!15714)) mapNonEmpty!15714))

(get-info :version)

(assert (= (and mapNonEmpty!15714 ((_ is ValueCellFull!4373) mapValue!15714)) b!385509))

(assert (= (and b!385512 ((_ is ValueCellFull!4373) mapDefault!15714)) b!385514))

(assert (= start!37644 b!385512))

(declare-fun m!382373 () Bool)

(assert (=> mapNonEmpty!15714 m!382373))

(declare-fun m!382375 () Bool)

(assert (=> start!37644 m!382375))

(declare-fun m!382377 () Bool)

(assert (=> start!37644 m!382377))

(declare-fun m!382379 () Bool)

(assert (=> start!37644 m!382379))

(declare-fun m!382381 () Bool)

(assert (=> b!385510 m!382381))

(declare-fun m!382383 () Bool)

(assert (=> b!385513 m!382383))

(declare-fun m!382385 () Bool)

(assert (=> b!385516 m!382385))

(declare-fun m!382387 () Bool)

(assert (=> b!385516 m!382387))

(declare-fun m!382389 () Bool)

(assert (=> b!385517 m!382389))

(declare-fun m!382391 () Bool)

(assert (=> b!385518 m!382391))

(declare-fun m!382393 () Bool)

(assert (=> b!385515 m!382393))

(check-sat (not b!385513) (not b!385516) (not b!385517) (not b!385515) (not start!37644) (not b!385518) (not mapNonEmpty!15714) tp_is_empty!9433)
(check-sat)
