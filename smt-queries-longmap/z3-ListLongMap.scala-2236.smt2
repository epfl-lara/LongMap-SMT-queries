; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36864 () Bool)

(assert start!36864)

(declare-fun b_free!8005 () Bool)

(declare-fun b_next!8005 () Bool)

(assert (=> start!36864 (= b_free!8005 (not b_next!8005))))

(declare-fun tp!28730 () Bool)

(declare-fun b_and!15221 () Bool)

(assert (=> start!36864 (= tp!28730 b_and!15221)))

(declare-fun b!368866 () Bool)

(declare-fun res!206898 () Bool)

(declare-fun e!225483 () Bool)

(assert (=> b!368866 (=> (not res!206898) (not e!225483))))

(declare-datatypes ((array!21243 0))(
  ( (array!21244 (arr!10090 (Array (_ BitVec 32) (_ BitVec 64))) (size!10443 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21243)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368866 (= res!206898 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14544 () Bool)

(declare-fun mapRes!14544 () Bool)

(assert (=> mapIsEmpty!14544 mapRes!14544))

(declare-fun b!368867 () Bool)

(declare-fun res!206897 () Bool)

(assert (=> b!368867 (=> (not res!206897) (not e!225483))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368867 (= res!206897 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10443 _keys!658))))))

(declare-fun b!368868 () Bool)

(declare-fun res!206895 () Bool)

(assert (=> b!368868 (=> (not res!206895) (not e!225483))))

(assert (=> b!368868 (= res!206895 (or (= (select (arr!10090 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10090 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368869 () Bool)

(declare-fun res!206891 () Bool)

(assert (=> b!368869 (=> (not res!206891) (not e!225483))))

(declare-datatypes ((List!5597 0))(
  ( (Nil!5594) (Cons!5593 (h!6449 (_ BitVec 64)) (t!10738 List!5597)) )
))
(declare-fun arrayNoDuplicates!0 (array!21243 (_ BitVec 32) List!5597) Bool)

(assert (=> b!368869 (= res!206891 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5594))))

(declare-fun b!368870 () Bool)

(declare-fun res!206900 () Bool)

(declare-fun e!225481 () Bool)

(assert (=> b!368870 (=> (not res!206900) (not e!225481))))

(declare-fun lt!169433 () array!21243)

(assert (=> b!368870 (= res!206900 (arrayNoDuplicates!0 lt!169433 #b00000000000000000000000000000000 Nil!5594))))

(declare-fun b!368871 () Bool)

(declare-fun res!206892 () Bool)

(assert (=> b!368871 (=> (not res!206892) (not e!225483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368871 (= res!206892 (validKeyInArray!0 k0!778))))

(declare-fun b!368872 () Bool)

(declare-fun res!206899 () Bool)

(assert (=> b!368872 (=> (not res!206899) (not e!225483))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21243 (_ BitVec 32)) Bool)

(assert (=> b!368872 (= res!206899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14544 () Bool)

(declare-fun tp!28731 () Bool)

(declare-fun e!225485 () Bool)

(assert (=> mapNonEmpty!14544 (= mapRes!14544 (and tp!28731 e!225485))))

(declare-datatypes ((V!12643 0))(
  ( (V!12644 (val!4371 Int)) )
))
(declare-datatypes ((ValueCell!3983 0))(
  ( (ValueCellFull!3983 (v!6562 V!12643)) (EmptyCell!3983) )
))
(declare-fun mapRest!14544 () (Array (_ BitVec 32) ValueCell!3983))

(declare-fun mapKey!14544 () (_ BitVec 32))

(declare-fun mapValue!14544 () ValueCell!3983)

(declare-datatypes ((array!21245 0))(
  ( (array!21246 (arr!10091 (Array (_ BitVec 32) ValueCell!3983)) (size!10444 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21245)

(assert (=> mapNonEmpty!14544 (= (arr!10091 _values!506) (store mapRest!14544 mapKey!14544 mapValue!14544))))

(declare-fun b!368873 () Bool)

(declare-fun e!225480 () Bool)

(declare-fun e!225482 () Bool)

(assert (=> b!368873 (= e!225480 (and e!225482 mapRes!14544))))

(declare-fun condMapEmpty!14544 () Bool)

(declare-fun mapDefault!14544 () ValueCell!3983)

(assert (=> b!368873 (= condMapEmpty!14544 (= (arr!10091 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3983)) mapDefault!14544)))))

(declare-fun res!206894 () Bool)

(assert (=> start!36864 (=> (not res!206894) (not e!225483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36864 (= res!206894 (validMask!0 mask!970))))

(assert (=> start!36864 e!225483))

(declare-fun array_inv!7470 (array!21245) Bool)

(assert (=> start!36864 (and (array_inv!7470 _values!506) e!225480)))

(assert (=> start!36864 tp!28730))

(assert (=> start!36864 true))

(declare-fun tp_is_empty!8653 () Bool)

(assert (=> start!36864 tp_is_empty!8653))

(declare-fun array_inv!7471 (array!21243) Bool)

(assert (=> start!36864 (array_inv!7471 _keys!658)))

(declare-fun b!368874 () Bool)

(assert (=> b!368874 (= e!225485 tp_is_empty!8653)))

(declare-fun b!368875 () Bool)

(assert (=> b!368875 (= e!225481 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5768 0))(
  ( (tuple2!5769 (_1!2895 (_ BitVec 64)) (_2!2895 V!12643)) )
))
(declare-datatypes ((List!5598 0))(
  ( (Nil!5595) (Cons!5594 (h!6450 tuple2!5768) (t!10739 List!5598)) )
))
(declare-datatypes ((ListLongMap!4671 0))(
  ( (ListLongMap!4672 (toList!2351 List!5598)) )
))
(declare-fun lt!169434 () ListLongMap!4671)

(declare-fun zeroValue!472 () V!12643)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12643)

(declare-fun minValue!472 () V!12643)

(declare-fun getCurrentListMapNoExtraKeys!642 (array!21243 array!21245 (_ BitVec 32) (_ BitVec 32) V!12643 V!12643 (_ BitVec 32) Int) ListLongMap!4671)

(assert (=> b!368875 (= lt!169434 (getCurrentListMapNoExtraKeys!642 lt!169433 (array!21246 (store (arr!10091 _values!506) i!548 (ValueCellFull!3983 v!373)) (size!10444 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169432 () ListLongMap!4671)

(assert (=> b!368875 (= lt!169432 (getCurrentListMapNoExtraKeys!642 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368876 () Bool)

(assert (=> b!368876 (= e!225482 tp_is_empty!8653)))

(declare-fun b!368877 () Bool)

(assert (=> b!368877 (= e!225483 e!225481)))

(declare-fun res!206896 () Bool)

(assert (=> b!368877 (=> (not res!206896) (not e!225481))))

(assert (=> b!368877 (= res!206896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169433 mask!970))))

(assert (=> b!368877 (= lt!169433 (array!21244 (store (arr!10090 _keys!658) i!548 k0!778) (size!10443 _keys!658)))))

(declare-fun b!368878 () Bool)

(declare-fun res!206893 () Bool)

(assert (=> b!368878 (=> (not res!206893) (not e!225483))))

(assert (=> b!368878 (= res!206893 (and (= (size!10444 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10443 _keys!658) (size!10444 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!36864 res!206894) b!368878))

(assert (= (and b!368878 res!206893) b!368872))

(assert (= (and b!368872 res!206899) b!368869))

(assert (= (and b!368869 res!206891) b!368867))

(assert (= (and b!368867 res!206897) b!368871))

(assert (= (and b!368871 res!206892) b!368868))

(assert (= (and b!368868 res!206895) b!368866))

(assert (= (and b!368866 res!206898) b!368877))

(assert (= (and b!368877 res!206896) b!368870))

(assert (= (and b!368870 res!206900) b!368875))

(assert (= (and b!368873 condMapEmpty!14544) mapIsEmpty!14544))

(assert (= (and b!368873 (not condMapEmpty!14544)) mapNonEmpty!14544))

(get-info :version)

(assert (= (and mapNonEmpty!14544 ((_ is ValueCellFull!3983) mapValue!14544)) b!368874))

(assert (= (and b!368873 ((_ is ValueCellFull!3983) mapDefault!14544)) b!368876))

(assert (= start!36864 b!368873))

(declare-fun m!364859 () Bool)

(assert (=> b!368870 m!364859))

(declare-fun m!364861 () Bool)

(assert (=> b!368872 m!364861))

(declare-fun m!364863 () Bool)

(assert (=> start!36864 m!364863))

(declare-fun m!364865 () Bool)

(assert (=> start!36864 m!364865))

(declare-fun m!364867 () Bool)

(assert (=> start!36864 m!364867))

(declare-fun m!364869 () Bool)

(assert (=> b!368877 m!364869))

(declare-fun m!364871 () Bool)

(assert (=> b!368877 m!364871))

(declare-fun m!364873 () Bool)

(assert (=> b!368868 m!364873))

(declare-fun m!364875 () Bool)

(assert (=> b!368869 m!364875))

(declare-fun m!364877 () Bool)

(assert (=> b!368866 m!364877))

(declare-fun m!364879 () Bool)

(assert (=> b!368875 m!364879))

(declare-fun m!364881 () Bool)

(assert (=> b!368875 m!364881))

(declare-fun m!364883 () Bool)

(assert (=> b!368875 m!364883))

(declare-fun m!364885 () Bool)

(assert (=> mapNonEmpty!14544 m!364885))

(declare-fun m!364887 () Bool)

(assert (=> b!368871 m!364887))

(check-sat (not b!368869) (not b!368875) (not b!368872) (not start!36864) (not b!368866) (not mapNonEmpty!14544) (not b!368870) tp_is_empty!8653 (not b_next!8005) (not b!368877) b_and!15221 (not b!368871))
(check-sat b_and!15221 (not b_next!8005))
