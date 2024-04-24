; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37176 () Bool)

(assert start!37176)

(declare-fun b_free!8317 () Bool)

(declare-fun b_next!8317 () Bool)

(assert (=> start!37176 (= b_free!8317 (not b_next!8317))))

(declare-fun tp!29666 () Bool)

(declare-fun b_and!15573 () Bool)

(assert (=> start!37176 (= tp!29666 b_and!15573)))

(declare-fun b!375518 () Bool)

(declare-fun res!212054 () Bool)

(declare-fun e!228771 () Bool)

(assert (=> b!375518 (=> (not res!212054) (not e!228771))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21848 0))(
  ( (array!21849 (arr!10392 (Array (_ BitVec 32) (_ BitVec 64))) (size!10744 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21848)

(assert (=> b!375518 (= res!212054 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10744 _keys!658))))))

(declare-fun b!375519 () Bool)

(declare-fun res!212046 () Bool)

(assert (=> b!375519 (=> (not res!212046) (not e!228771))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21848 (_ BitVec 32)) Bool)

(assert (=> b!375519 (= res!212046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15012 () Bool)

(declare-fun mapRes!15012 () Bool)

(declare-fun tp!29667 () Bool)

(declare-fun e!228768 () Bool)

(assert (=> mapNonEmpty!15012 (= mapRes!15012 (and tp!29667 e!228768))))

(declare-datatypes ((V!13059 0))(
  ( (V!13060 (val!4527 Int)) )
))
(declare-datatypes ((ValueCell!4139 0))(
  ( (ValueCellFull!4139 (v!6725 V!13059)) (EmptyCell!4139) )
))
(declare-datatypes ((array!21850 0))(
  ( (array!21851 (arr!10393 (Array (_ BitVec 32) ValueCell!4139)) (size!10745 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21850)

(declare-fun mapValue!15012 () ValueCell!4139)

(declare-fun mapKey!15012 () (_ BitVec 32))

(declare-fun mapRest!15012 () (Array (_ BitVec 32) ValueCell!4139))

(assert (=> mapNonEmpty!15012 (= (arr!10393 _values!506) (store mapRest!15012 mapKey!15012 mapValue!15012))))

(declare-fun mapIsEmpty!15012 () Bool)

(assert (=> mapIsEmpty!15012 mapRes!15012))

(declare-fun b!375520 () Bool)

(declare-fun res!212048 () Bool)

(assert (=> b!375520 (=> (not res!212048) (not e!228771))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375520 (= res!212048 (and (= (size!10745 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10744 _keys!658) (size!10745 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!212051 () Bool)

(assert (=> start!37176 (=> (not res!212051) (not e!228771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37176 (= res!212051 (validMask!0 mask!970))))

(assert (=> start!37176 e!228771))

(declare-fun e!228772 () Bool)

(declare-fun array_inv!7712 (array!21850) Bool)

(assert (=> start!37176 (and (array_inv!7712 _values!506) e!228772)))

(assert (=> start!37176 tp!29666))

(assert (=> start!37176 true))

(declare-fun tp_is_empty!8965 () Bool)

(assert (=> start!37176 tp_is_empty!8965))

(declare-fun array_inv!7713 (array!21848) Bool)

(assert (=> start!37176 (array_inv!7713 _keys!658)))

(declare-fun b!375521 () Bool)

(declare-fun e!228773 () Bool)

(assert (=> b!375521 (= e!228772 (and e!228773 mapRes!15012))))

(declare-fun condMapEmpty!15012 () Bool)

(declare-fun mapDefault!15012 () ValueCell!4139)

(assert (=> b!375521 (= condMapEmpty!15012 (= (arr!10393 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4139)) mapDefault!15012)))))

(declare-fun b!375522 () Bool)

(declare-fun res!212052 () Bool)

(assert (=> b!375522 (=> (not res!212052) (not e!228771))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375522 (= res!212052 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375523 () Bool)

(declare-fun res!212044 () Bool)

(assert (=> b!375523 (=> (not res!212044) (not e!228771))))

(assert (=> b!375523 (= res!212044 (or (= (select (arr!10392 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10392 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375524 () Bool)

(assert (=> b!375524 (= e!228768 tp_is_empty!8965)))

(declare-fun b!375525 () Bool)

(declare-fun res!212045 () Bool)

(assert (=> b!375525 (=> (not res!212045) (not e!228771))))

(declare-datatypes ((List!5772 0))(
  ( (Nil!5769) (Cons!5768 (h!6624 (_ BitVec 64)) (t!10914 List!5772)) )
))
(declare-fun arrayNoDuplicates!0 (array!21848 (_ BitVec 32) List!5772) Bool)

(assert (=> b!375525 (= res!212045 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5769))))

(declare-fun b!375526 () Bool)

(declare-fun res!212050 () Bool)

(declare-fun e!228769 () Bool)

(assert (=> b!375526 (=> (not res!212050) (not e!228769))))

(declare-fun lt!173907 () array!21848)

(assert (=> b!375526 (= res!212050 (arrayNoDuplicates!0 lt!173907 #b00000000000000000000000000000000 Nil!5769))))

(declare-fun b!375527 () Bool)

(declare-fun e!228770 () Bool)

(declare-fun e!228774 () Bool)

(assert (=> b!375527 (= e!228770 e!228774)))

(declare-fun res!212049 () Bool)

(assert (=> b!375527 (=> res!212049 e!228774)))

(assert (=> b!375527 (= res!212049 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5928 0))(
  ( (tuple2!5929 (_1!2975 (_ BitVec 64)) (_2!2975 V!13059)) )
))
(declare-datatypes ((List!5773 0))(
  ( (Nil!5770) (Cons!5769 (h!6625 tuple2!5928) (t!10915 List!5773)) )
))
(declare-datatypes ((ListLongMap!4843 0))(
  ( (ListLongMap!4844 (toList!2437 List!5773)) )
))
(declare-fun lt!173913 () ListLongMap!4843)

(declare-fun lt!173920 () ListLongMap!4843)

(assert (=> b!375527 (= lt!173913 lt!173920)))

(declare-fun lt!173918 () ListLongMap!4843)

(declare-fun lt!173910 () tuple2!5928)

(declare-fun +!833 (ListLongMap!4843 tuple2!5928) ListLongMap!4843)

(assert (=> b!375527 (= lt!173920 (+!833 lt!173918 lt!173910))))

(declare-fun v!373 () V!13059)

(declare-fun lt!173922 () ListLongMap!4843)

(declare-datatypes ((Unit!11555 0))(
  ( (Unit!11556) )
))
(declare-fun lt!173912 () Unit!11555)

(declare-fun zeroValue!472 () V!13059)

(declare-fun addCommutativeForDiffKeys!260 (ListLongMap!4843 (_ BitVec 64) V!13059 (_ BitVec 64) V!13059) Unit!11555)

(assert (=> b!375527 (= lt!173912 (addCommutativeForDiffKeys!260 lt!173922 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173917 () ListLongMap!4843)

(declare-fun lt!173921 () tuple2!5928)

(assert (=> b!375527 (= lt!173917 (+!833 lt!173913 lt!173921))))

(declare-fun lt!173911 () ListLongMap!4843)

(declare-fun lt!173916 () tuple2!5928)

(assert (=> b!375527 (= lt!173913 (+!833 lt!173911 lt!173916))))

(declare-fun lt!173909 () ListLongMap!4843)

(declare-fun lt!173919 () ListLongMap!4843)

(assert (=> b!375527 (= lt!173909 lt!173919)))

(assert (=> b!375527 (= lt!173919 (+!833 lt!173918 lt!173921))))

(assert (=> b!375527 (= lt!173918 (+!833 lt!173922 lt!173916))))

(declare-fun lt!173914 () ListLongMap!4843)

(assert (=> b!375527 (= lt!173917 (+!833 (+!833 lt!173914 lt!173916) lt!173921))))

(declare-fun minValue!472 () V!13059)

(assert (=> b!375527 (= lt!173921 (tuple2!5929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375527 (= lt!173916 (tuple2!5929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375528 () Bool)

(assert (=> b!375528 (= e!228769 (not e!228770))))

(declare-fun res!212043 () Bool)

(assert (=> b!375528 (=> res!212043 e!228770)))

(assert (=> b!375528 (= res!212043 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1891 (array!21848 array!21850 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) Int) ListLongMap!4843)

(assert (=> b!375528 (= lt!173909 (getCurrentListMap!1891 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173908 () array!21850)

(assert (=> b!375528 (= lt!173917 (getCurrentListMap!1891 lt!173907 lt!173908 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375528 (and (= lt!173914 lt!173911) (= lt!173911 lt!173914))))

(assert (=> b!375528 (= lt!173911 (+!833 lt!173922 lt!173910))))

(assert (=> b!375528 (= lt!173910 (tuple2!5929 k0!778 v!373))))

(declare-fun lt!173923 () Unit!11555)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 (array!21848 array!21850 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) (_ BitVec 64) V!13059 (_ BitVec 32) Int) Unit!11555)

(assert (=> b!375528 (= lt!173923 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!738 (array!21848 array!21850 (_ BitVec 32) (_ BitVec 32) V!13059 V!13059 (_ BitVec 32) Int) ListLongMap!4843)

(assert (=> b!375528 (= lt!173914 (getCurrentListMapNoExtraKeys!738 lt!173907 lt!173908 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375528 (= lt!173908 (array!21851 (store (arr!10393 _values!506) i!548 (ValueCellFull!4139 v!373)) (size!10745 _values!506)))))

(assert (=> b!375528 (= lt!173922 (getCurrentListMapNoExtraKeys!738 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375529 () Bool)

(assert (=> b!375529 (= e!228773 tp_is_empty!8965)))

(declare-fun b!375530 () Bool)

(assert (=> b!375530 (= e!228771 e!228769)))

(declare-fun res!212047 () Bool)

(assert (=> b!375530 (=> (not res!212047) (not e!228769))))

(assert (=> b!375530 (= res!212047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173907 mask!970))))

(assert (=> b!375530 (= lt!173907 (array!21849 (store (arr!10392 _keys!658) i!548 k0!778) (size!10744 _keys!658)))))

(declare-fun b!375531 () Bool)

(assert (=> b!375531 (= e!228774 (bvsle #b00000000000000000000000000000000 (size!10744 _keys!658)))))

(assert (=> b!375531 (= (+!833 lt!173920 lt!173921) (+!833 lt!173919 lt!173910))))

(declare-fun lt!173915 () Unit!11555)

(assert (=> b!375531 (= lt!173915 (addCommutativeForDiffKeys!260 lt!173918 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375532 () Bool)

(declare-fun res!212053 () Bool)

(assert (=> b!375532 (=> (not res!212053) (not e!228771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375532 (= res!212053 (validKeyInArray!0 k0!778))))

(assert (= (and start!37176 res!212051) b!375520))

(assert (= (and b!375520 res!212048) b!375519))

(assert (= (and b!375519 res!212046) b!375525))

(assert (= (and b!375525 res!212045) b!375518))

(assert (= (and b!375518 res!212054) b!375532))

(assert (= (and b!375532 res!212053) b!375523))

(assert (= (and b!375523 res!212044) b!375522))

(assert (= (and b!375522 res!212052) b!375530))

(assert (= (and b!375530 res!212047) b!375526))

(assert (= (and b!375526 res!212050) b!375528))

(assert (= (and b!375528 (not res!212043)) b!375527))

(assert (= (and b!375527 (not res!212049)) b!375531))

(assert (= (and b!375521 condMapEmpty!15012) mapIsEmpty!15012))

(assert (= (and b!375521 (not condMapEmpty!15012)) mapNonEmpty!15012))

(get-info :version)

(assert (= (and mapNonEmpty!15012 ((_ is ValueCellFull!4139) mapValue!15012)) b!375524))

(assert (= (and b!375521 ((_ is ValueCellFull!4139) mapDefault!15012)) b!375529))

(assert (= start!37176 b!375521))

(declare-fun m!372425 () Bool)

(assert (=> mapNonEmpty!15012 m!372425))

(declare-fun m!372427 () Bool)

(assert (=> b!375530 m!372427))

(declare-fun m!372429 () Bool)

(assert (=> b!375530 m!372429))

(declare-fun m!372431 () Bool)

(assert (=> b!375528 m!372431))

(declare-fun m!372433 () Bool)

(assert (=> b!375528 m!372433))

(declare-fun m!372435 () Bool)

(assert (=> b!375528 m!372435))

(declare-fun m!372437 () Bool)

(assert (=> b!375528 m!372437))

(declare-fun m!372439 () Bool)

(assert (=> b!375528 m!372439))

(declare-fun m!372441 () Bool)

(assert (=> b!375528 m!372441))

(declare-fun m!372443 () Bool)

(assert (=> b!375528 m!372443))

(declare-fun m!372445 () Bool)

(assert (=> b!375527 m!372445))

(declare-fun m!372447 () Bool)

(assert (=> b!375527 m!372447))

(declare-fun m!372449 () Bool)

(assert (=> b!375527 m!372449))

(declare-fun m!372451 () Bool)

(assert (=> b!375527 m!372451))

(declare-fun m!372453 () Bool)

(assert (=> b!375527 m!372453))

(declare-fun m!372455 () Bool)

(assert (=> b!375527 m!372455))

(assert (=> b!375527 m!372445))

(declare-fun m!372457 () Bool)

(assert (=> b!375527 m!372457))

(declare-fun m!372459 () Bool)

(assert (=> b!375527 m!372459))

(declare-fun m!372461 () Bool)

(assert (=> b!375525 m!372461))

(declare-fun m!372463 () Bool)

(assert (=> start!37176 m!372463))

(declare-fun m!372465 () Bool)

(assert (=> start!37176 m!372465))

(declare-fun m!372467 () Bool)

(assert (=> start!37176 m!372467))

(declare-fun m!372469 () Bool)

(assert (=> b!375522 m!372469))

(declare-fun m!372471 () Bool)

(assert (=> b!375532 m!372471))

(declare-fun m!372473 () Bool)

(assert (=> b!375523 m!372473))

(declare-fun m!372475 () Bool)

(assert (=> b!375531 m!372475))

(declare-fun m!372477 () Bool)

(assert (=> b!375531 m!372477))

(declare-fun m!372479 () Bool)

(assert (=> b!375531 m!372479))

(declare-fun m!372481 () Bool)

(assert (=> b!375526 m!372481))

(declare-fun m!372483 () Bool)

(assert (=> b!375519 m!372483))

(check-sat (not b!375519) (not b!375522) b_and!15573 (not b!375525) (not b!375532) (not mapNonEmpty!15012) (not b!375526) (not b!375527) (not b!375531) (not start!37176) (not b!375528) (not b_next!8317) tp_is_empty!8965 (not b!375530))
(check-sat b_and!15573 (not b_next!8317))
