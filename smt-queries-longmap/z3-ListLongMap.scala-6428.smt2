; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82366 () Bool)

(assert start!82366)

(declare-fun b_free!18633 () Bool)

(declare-fun b_next!18633 () Bool)

(assert (=> start!82366 (= b_free!18633 (not b_next!18633))))

(declare-fun tp!64868 () Bool)

(declare-fun b_and!30121 () Bool)

(assert (=> start!82366 (= tp!64868 b_and!30121)))

(declare-fun b!960368 () Bool)

(declare-fun res!642852 () Bool)

(declare-fun e!541365 () Bool)

(assert (=> b!960368 (=> (not res!642852) (not e!541365))))

(declare-datatypes ((array!58781 0))(
  ( (array!58782 (arr!28264 (Array (_ BitVec 32) (_ BitVec 64))) (size!28743 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58781)

(declare-datatypes ((List!19654 0))(
  ( (Nil!19651) (Cons!19650 (h!20812 (_ BitVec 64)) (t!28017 List!19654)) )
))
(declare-fun arrayNoDuplicates!0 (array!58781 (_ BitVec 32) List!19654) Bool)

(assert (=> b!960368 (= res!642852 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19651))))

(declare-fun mapNonEmpty!33997 () Bool)

(declare-fun mapRes!33997 () Bool)

(declare-fun tp!64869 () Bool)

(declare-fun e!541364 () Bool)

(assert (=> mapNonEmpty!33997 (= mapRes!33997 (and tp!64869 e!541364))))

(declare-datatypes ((V!33443 0))(
  ( (V!33444 (val!10723 Int)) )
))
(declare-datatypes ((ValueCell!10191 0))(
  ( (ValueCellFull!10191 (v!13280 V!33443)) (EmptyCell!10191) )
))
(declare-fun mapValue!33997 () ValueCell!10191)

(declare-fun mapKey!33997 () (_ BitVec 32))

(declare-datatypes ((array!58783 0))(
  ( (array!58784 (arr!28265 (Array (_ BitVec 32) ValueCell!10191)) (size!28744 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58783)

(declare-fun mapRest!33997 () (Array (_ BitVec 32) ValueCell!10191))

(assert (=> mapNonEmpty!33997 (= (arr!28265 _values!1386) (store mapRest!33997 mapKey!33997 mapValue!33997))))

(declare-fun b!960369 () Bool)

(assert (=> b!960369 (= e!541365 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33443)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430641 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33443)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13834 0))(
  ( (tuple2!13835 (_1!6928 (_ BitVec 64)) (_2!6928 V!33443)) )
))
(declare-datatypes ((List!19655 0))(
  ( (Nil!19652) (Cons!19651 (h!20813 tuple2!13834) (t!28018 List!19655)) )
))
(declare-datatypes ((ListLongMap!12531 0))(
  ( (ListLongMap!12532 (toList!6281 List!19655)) )
))
(declare-fun contains!5380 (ListLongMap!12531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3514 (array!58781 array!58783 (_ BitVec 32) (_ BitVec 32) V!33443 V!33443 (_ BitVec 32) Int) ListLongMap!12531)

(assert (=> b!960369 (= lt!430641 (contains!5380 (getCurrentListMap!3514 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28264 _keys!1668) i!793)))))

(declare-fun b!960370 () Bool)

(declare-fun tp_is_empty!21345 () Bool)

(assert (=> b!960370 (= e!541364 tp_is_empty!21345)))

(declare-fun b!960371 () Bool)

(declare-fun res!642857 () Bool)

(assert (=> b!960371 (=> (not res!642857) (not e!541365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960371 (= res!642857 (validKeyInArray!0 (select (arr!28264 _keys!1668) i!793)))))

(declare-fun res!642854 () Bool)

(assert (=> start!82366 (=> (not res!642854) (not e!541365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82366 (= res!642854 (validMask!0 mask!2088))))

(assert (=> start!82366 e!541365))

(assert (=> start!82366 true))

(assert (=> start!82366 tp_is_empty!21345))

(declare-fun array_inv!21901 (array!58781) Bool)

(assert (=> start!82366 (array_inv!21901 _keys!1668)))

(declare-fun e!541363 () Bool)

(declare-fun array_inv!21902 (array!58783) Bool)

(assert (=> start!82366 (and (array_inv!21902 _values!1386) e!541363)))

(assert (=> start!82366 tp!64868))

(declare-fun b!960372 () Bool)

(declare-fun res!642855 () Bool)

(assert (=> b!960372 (=> (not res!642855) (not e!541365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58781 (_ BitVec 32)) Bool)

(assert (=> b!960372 (= res!642855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960373 () Bool)

(declare-fun e!541362 () Bool)

(assert (=> b!960373 (= e!541362 tp_is_empty!21345)))

(declare-fun mapIsEmpty!33997 () Bool)

(assert (=> mapIsEmpty!33997 mapRes!33997))

(declare-fun b!960374 () Bool)

(declare-fun res!642853 () Bool)

(assert (=> b!960374 (=> (not res!642853) (not e!541365))))

(assert (=> b!960374 (= res!642853 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28743 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28743 _keys!1668))))))

(declare-fun b!960375 () Bool)

(declare-fun res!642856 () Bool)

(assert (=> b!960375 (=> (not res!642856) (not e!541365))))

(assert (=> b!960375 (= res!642856 (and (= (size!28744 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28743 _keys!1668) (size!28744 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960376 () Bool)

(assert (=> b!960376 (= e!541363 (and e!541362 mapRes!33997))))

(declare-fun condMapEmpty!33997 () Bool)

(declare-fun mapDefault!33997 () ValueCell!10191)

(assert (=> b!960376 (= condMapEmpty!33997 (= (arr!28265 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10191)) mapDefault!33997)))))

(assert (= (and start!82366 res!642854) b!960375))

(assert (= (and b!960375 res!642856) b!960372))

(assert (= (and b!960372 res!642855) b!960368))

(assert (= (and b!960368 res!642852) b!960374))

(assert (= (and b!960374 res!642853) b!960371))

(assert (= (and b!960371 res!642857) b!960369))

(assert (= (and b!960376 condMapEmpty!33997) mapIsEmpty!33997))

(assert (= (and b!960376 (not condMapEmpty!33997)) mapNonEmpty!33997))

(get-info :version)

(assert (= (and mapNonEmpty!33997 ((_ is ValueCellFull!10191) mapValue!33997)) b!960370))

(assert (= (and b!960376 ((_ is ValueCellFull!10191) mapDefault!33997)) b!960373))

(assert (= start!82366 b!960376))

(declare-fun m!890629 () Bool)

(assert (=> b!960372 m!890629))

(declare-fun m!890631 () Bool)

(assert (=> b!960368 m!890631))

(declare-fun m!890633 () Bool)

(assert (=> mapNonEmpty!33997 m!890633))

(declare-fun m!890635 () Bool)

(assert (=> b!960371 m!890635))

(assert (=> b!960371 m!890635))

(declare-fun m!890637 () Bool)

(assert (=> b!960371 m!890637))

(declare-fun m!890639 () Bool)

(assert (=> b!960369 m!890639))

(assert (=> b!960369 m!890635))

(assert (=> b!960369 m!890639))

(assert (=> b!960369 m!890635))

(declare-fun m!890641 () Bool)

(assert (=> b!960369 m!890641))

(declare-fun m!890643 () Bool)

(assert (=> start!82366 m!890643))

(declare-fun m!890645 () Bool)

(assert (=> start!82366 m!890645))

(declare-fun m!890647 () Bool)

(assert (=> start!82366 m!890647))

(check-sat (not b!960371) (not b!960369) (not b!960368) tp_is_empty!21345 (not b!960372) (not mapNonEmpty!33997) b_and!30121 (not b_next!18633) (not start!82366))
(check-sat b_and!30121 (not b_next!18633))
