; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36898 () Bool)

(assert start!36898)

(declare-fun b_free!8025 () Bool)

(declare-fun b_next!8025 () Bool)

(assert (=> start!36898 (= b_free!8025 (not b_next!8025))))

(declare-fun tp!28791 () Bool)

(declare-fun b_and!15267 () Bool)

(assert (=> start!36898 (= tp!28791 b_and!15267)))

(declare-fun mapIsEmpty!14574 () Bool)

(declare-fun mapRes!14574 () Bool)

(assert (=> mapIsEmpty!14574 mapRes!14574))

(declare-fun b!369527 () Bool)

(declare-fun res!207327 () Bool)

(declare-fun e!225837 () Bool)

(assert (=> b!369527 (=> (not res!207327) (not e!225837))))

(declare-datatypes ((array!21295 0))(
  ( (array!21296 (arr!10116 (Array (_ BitVec 32) (_ BitVec 64))) (size!10468 (_ BitVec 32))) )
))
(declare-fun lt!169758 () array!21295)

(declare-datatypes ((List!5646 0))(
  ( (Nil!5643) (Cons!5642 (h!6498 (_ BitVec 64)) (t!10796 List!5646)) )
))
(declare-fun arrayNoDuplicates!0 (array!21295 (_ BitVec 32) List!5646) Bool)

(assert (=> b!369527 (= res!207327 (arrayNoDuplicates!0 lt!169758 #b00000000000000000000000000000000 Nil!5643))))

(declare-fun b!369528 () Bool)

(declare-fun res!207324 () Bool)

(declare-fun e!225838 () Bool)

(assert (=> b!369528 (=> (not res!207324) (not e!225838))))

(declare-fun _keys!658 () array!21295)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369528 (= res!207324 (or (= (select (arr!10116 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10116 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369530 () Bool)

(declare-fun res!207329 () Bool)

(assert (=> b!369530 (=> (not res!207329) (not e!225838))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12669 0))(
  ( (V!12670 (val!4381 Int)) )
))
(declare-datatypes ((ValueCell!3993 0))(
  ( (ValueCellFull!3993 (v!6578 V!12669)) (EmptyCell!3993) )
))
(declare-datatypes ((array!21297 0))(
  ( (array!21298 (arr!10117 (Array (_ BitVec 32) ValueCell!3993)) (size!10469 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21297)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!369530 (= res!207329 (and (= (size!10469 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10468 _keys!658) (size!10469 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369531 () Bool)

(declare-fun res!207326 () Bool)

(assert (=> b!369531 (=> (not res!207326) (not e!225838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21295 (_ BitVec 32)) Bool)

(assert (=> b!369531 (= res!207326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369532 () Bool)

(declare-fun e!225834 () Bool)

(declare-fun tp_is_empty!8673 () Bool)

(assert (=> b!369532 (= e!225834 tp_is_empty!8673)))

(declare-fun b!369533 () Bool)

(declare-fun res!207321 () Bool)

(assert (=> b!369533 (=> (not res!207321) (not e!225838))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369533 (= res!207321 (validKeyInArray!0 k0!778))))

(declare-fun b!369534 () Bool)

(declare-fun res!207322 () Bool)

(assert (=> b!369534 (=> (not res!207322) (not e!225838))))

(assert (=> b!369534 (= res!207322 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5643))))

(declare-fun b!369535 () Bool)

(declare-fun e!225835 () Bool)

(assert (=> b!369535 (= e!225835 tp_is_empty!8673)))

(declare-fun b!369536 () Bool)

(declare-fun e!225839 () Bool)

(assert (=> b!369536 (= e!225839 (and e!225835 mapRes!14574))))

(declare-fun condMapEmpty!14574 () Bool)

(declare-fun mapDefault!14574 () ValueCell!3993)

(assert (=> b!369536 (= condMapEmpty!14574 (= (arr!10117 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3993)) mapDefault!14574)))))

(declare-fun b!369529 () Bool)

(declare-fun res!207323 () Bool)

(assert (=> b!369529 (=> (not res!207323) (not e!225838))))

(declare-fun arrayContainsKey!0 (array!21295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369529 (= res!207323 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!207325 () Bool)

(assert (=> start!36898 (=> (not res!207325) (not e!225838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36898 (= res!207325 (validMask!0 mask!970))))

(assert (=> start!36898 e!225838))

(declare-fun array_inv!7478 (array!21297) Bool)

(assert (=> start!36898 (and (array_inv!7478 _values!506) e!225839)))

(assert (=> start!36898 tp!28791))

(assert (=> start!36898 true))

(assert (=> start!36898 tp_is_empty!8673))

(declare-fun array_inv!7479 (array!21295) Bool)

(assert (=> start!36898 (array_inv!7479 _keys!658)))

(declare-fun b!369537 () Bool)

(declare-fun res!207320 () Bool)

(assert (=> b!369537 (=> (not res!207320) (not e!225838))))

(assert (=> b!369537 (= res!207320 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10468 _keys!658))))))

(declare-fun mapNonEmpty!14574 () Bool)

(declare-fun tp!28790 () Bool)

(assert (=> mapNonEmpty!14574 (= mapRes!14574 (and tp!28790 e!225834))))

(declare-fun mapValue!14574 () ValueCell!3993)

(declare-fun mapRest!14574 () (Array (_ BitVec 32) ValueCell!3993))

(declare-fun mapKey!14574 () (_ BitVec 32))

(assert (=> mapNonEmpty!14574 (= (arr!10117 _values!506) (store mapRest!14574 mapKey!14574 mapValue!14574))))

(declare-fun b!369538 () Bool)

(assert (=> b!369538 (= e!225837 false)))

(declare-datatypes ((tuple2!5812 0))(
  ( (tuple2!5813 (_1!2917 (_ BitVec 64)) (_2!2917 V!12669)) )
))
(declare-datatypes ((List!5647 0))(
  ( (Nil!5644) (Cons!5643 (h!6499 tuple2!5812) (t!10797 List!5647)) )
))
(declare-datatypes ((ListLongMap!4725 0))(
  ( (ListLongMap!4726 (toList!2378 List!5647)) )
))
(declare-fun lt!169757 () ListLongMap!4725)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12669)

(declare-fun v!373 () V!12669)

(declare-fun minValue!472 () V!12669)

(declare-fun getCurrentListMapNoExtraKeys!655 (array!21295 array!21297 (_ BitVec 32) (_ BitVec 32) V!12669 V!12669 (_ BitVec 32) Int) ListLongMap!4725)

(assert (=> b!369538 (= lt!169757 (getCurrentListMapNoExtraKeys!655 lt!169758 (array!21298 (store (arr!10117 _values!506) i!548 (ValueCellFull!3993 v!373)) (size!10469 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169756 () ListLongMap!4725)

(assert (=> b!369538 (= lt!169756 (getCurrentListMapNoExtraKeys!655 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369539 () Bool)

(assert (=> b!369539 (= e!225838 e!225837)))

(declare-fun res!207328 () Bool)

(assert (=> b!369539 (=> (not res!207328) (not e!225837))))

(assert (=> b!369539 (= res!207328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169758 mask!970))))

(assert (=> b!369539 (= lt!169758 (array!21296 (store (arr!10116 _keys!658) i!548 k0!778) (size!10468 _keys!658)))))

(assert (= (and start!36898 res!207325) b!369530))

(assert (= (and b!369530 res!207329) b!369531))

(assert (= (and b!369531 res!207326) b!369534))

(assert (= (and b!369534 res!207322) b!369537))

(assert (= (and b!369537 res!207320) b!369533))

(assert (= (and b!369533 res!207321) b!369528))

(assert (= (and b!369528 res!207324) b!369529))

(assert (= (and b!369529 res!207323) b!369539))

(assert (= (and b!369539 res!207328) b!369527))

(assert (= (and b!369527 res!207327) b!369538))

(assert (= (and b!369536 condMapEmpty!14574) mapIsEmpty!14574))

(assert (= (and b!369536 (not condMapEmpty!14574)) mapNonEmpty!14574))

(get-info :version)

(assert (= (and mapNonEmpty!14574 ((_ is ValueCellFull!3993) mapValue!14574)) b!369532))

(assert (= (and b!369536 ((_ is ValueCellFull!3993) mapDefault!14574)) b!369535))

(assert (= start!36898 b!369536))

(declare-fun m!365883 () Bool)

(assert (=> start!36898 m!365883))

(declare-fun m!365885 () Bool)

(assert (=> start!36898 m!365885))

(declare-fun m!365887 () Bool)

(assert (=> start!36898 m!365887))

(declare-fun m!365889 () Bool)

(assert (=> b!369527 m!365889))

(declare-fun m!365891 () Bool)

(assert (=> b!369534 m!365891))

(declare-fun m!365893 () Bool)

(assert (=> b!369531 m!365893))

(declare-fun m!365895 () Bool)

(assert (=> mapNonEmpty!14574 m!365895))

(declare-fun m!365897 () Bool)

(assert (=> b!369539 m!365897))

(declare-fun m!365899 () Bool)

(assert (=> b!369539 m!365899))

(declare-fun m!365901 () Bool)

(assert (=> b!369529 m!365901))

(declare-fun m!365903 () Bool)

(assert (=> b!369528 m!365903))

(declare-fun m!365905 () Bool)

(assert (=> b!369538 m!365905))

(declare-fun m!365907 () Bool)

(assert (=> b!369538 m!365907))

(declare-fun m!365909 () Bool)

(assert (=> b!369538 m!365909))

(declare-fun m!365911 () Bool)

(assert (=> b!369533 m!365911))

(check-sat (not b_next!8025) (not b!369534) (not b!369527) (not b!369533) (not start!36898) b_and!15267 (not b!369538) (not b!369539) tp_is_empty!8673 (not mapNonEmpty!14574) (not b!369529) (not b!369531))
(check-sat b_and!15267 (not b_next!8025))
