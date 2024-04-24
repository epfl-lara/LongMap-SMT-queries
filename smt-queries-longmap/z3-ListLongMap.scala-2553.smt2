; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39122 () Bool)

(assert start!39122)

(declare-fun b_free!9403 () Bool)

(declare-fun b_next!9403 () Bool)

(assert (=> start!39122 (= b_free!9403 (not b_next!9403))))

(declare-fun tp!33738 () Bool)

(declare-fun b_and!16803 () Bool)

(assert (=> start!39122 (= tp!33738 b_and!16803)))

(declare-fun b!411623 () Bool)

(declare-fun e!246467 () Bool)

(declare-fun tp_is_empty!10555 () Bool)

(assert (=> b!411623 (= e!246467 tp_is_empty!10555)))

(declare-fun b!411624 () Bool)

(declare-fun res!238881 () Bool)

(declare-fun e!246472 () Bool)

(assert (=> b!411624 (=> (not res!238881) (not e!246472))))

(declare-datatypes ((array!24974 0))(
  ( (array!24975 (arr!11936 (Array (_ BitVec 32) (_ BitVec 64))) (size!12288 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24974)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411624 (= res!238881 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411625 () Bool)

(declare-fun e!246471 () Bool)

(assert (=> b!411625 (= e!246472 e!246471)))

(declare-fun res!238878 () Bool)

(assert (=> b!411625 (=> (not res!238878) (not e!246471))))

(declare-fun lt!189346 () array!24974)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24974 (_ BitVec 32)) Bool)

(assert (=> b!411625 (= res!238878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189346 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411625 (= lt!189346 (array!24975 (store (arr!11936 _keys!709) i!563 k0!794) (size!12288 _keys!709)))))

(declare-fun b!411626 () Bool)

(declare-fun res!238883 () Bool)

(assert (=> b!411626 (=> (not res!238883) (not e!246472))))

(assert (=> b!411626 (= res!238883 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12288 _keys!709))))))

(declare-fun b!411627 () Bool)

(declare-fun res!238884 () Bool)

(assert (=> b!411627 (=> (not res!238884) (not e!246472))))

(assert (=> b!411627 (= res!238884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411628 () Bool)

(assert (=> b!411628 (= e!246471 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15179 0))(
  ( (V!15180 (val!5322 Int)) )
))
(declare-fun minValue!515 () V!15179)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4934 0))(
  ( (ValueCellFull!4934 (v!7570 V!15179)) (EmptyCell!4934) )
))
(declare-datatypes ((array!24976 0))(
  ( (array!24977 (arr!11937 (Array (_ BitVec 32) ValueCell!4934)) (size!12289 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24976)

(declare-fun zeroValue!515 () V!15179)

(declare-fun v!412 () V!15179)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6776 0))(
  ( (tuple2!6777 (_1!3399 (_ BitVec 64)) (_2!3399 V!15179)) )
))
(declare-datatypes ((List!6796 0))(
  ( (Nil!6793) (Cons!6792 (h!7648 tuple2!6776) (t!11962 List!6796)) )
))
(declare-datatypes ((ListLongMap!5691 0))(
  ( (ListLongMap!5692 (toList!2861 List!6796)) )
))
(declare-fun lt!189347 () ListLongMap!5691)

(declare-fun getCurrentListMapNoExtraKeys!1113 (array!24974 array!24976 (_ BitVec 32) (_ BitVec 32) V!15179 V!15179 (_ BitVec 32) Int) ListLongMap!5691)

(assert (=> b!411628 (= lt!189347 (getCurrentListMapNoExtraKeys!1113 lt!189346 (array!24977 (store (arr!11937 _values!549) i!563 (ValueCellFull!4934 v!412)) (size!12289 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189348 () ListLongMap!5691)

(assert (=> b!411628 (= lt!189348 (getCurrentListMapNoExtraKeys!1113 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!238879 () Bool)

(assert (=> start!39122 (=> (not res!238879) (not e!246472))))

(assert (=> start!39122 (= res!238879 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12288 _keys!709))))))

(assert (=> start!39122 e!246472))

(assert (=> start!39122 tp_is_empty!10555))

(assert (=> start!39122 tp!33738))

(assert (=> start!39122 true))

(declare-fun e!246468 () Bool)

(declare-fun array_inv!8788 (array!24976) Bool)

(assert (=> start!39122 (and (array_inv!8788 _values!549) e!246468)))

(declare-fun array_inv!8789 (array!24974) Bool)

(assert (=> start!39122 (array_inv!8789 _keys!709)))

(declare-fun b!411629 () Bool)

(declare-fun res!238877 () Bool)

(assert (=> b!411629 (=> (not res!238877) (not e!246471))))

(assert (=> b!411629 (= res!238877 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17454 () Bool)

(declare-fun mapRes!17454 () Bool)

(declare-fun tp!33737 () Bool)

(declare-fun e!246470 () Bool)

(assert (=> mapNonEmpty!17454 (= mapRes!17454 (and tp!33737 e!246470))))

(declare-fun mapRest!17454 () (Array (_ BitVec 32) ValueCell!4934))

(declare-fun mapValue!17454 () ValueCell!4934)

(declare-fun mapKey!17454 () (_ BitVec 32))

(assert (=> mapNonEmpty!17454 (= (arr!11937 _values!549) (store mapRest!17454 mapKey!17454 mapValue!17454))))

(declare-fun b!411630 () Bool)

(assert (=> b!411630 (= e!246468 (and e!246467 mapRes!17454))))

(declare-fun condMapEmpty!17454 () Bool)

(declare-fun mapDefault!17454 () ValueCell!4934)

(assert (=> b!411630 (= condMapEmpty!17454 (= (arr!11937 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4934)) mapDefault!17454)))))

(declare-fun b!411631 () Bool)

(declare-fun res!238874 () Bool)

(assert (=> b!411631 (=> (not res!238874) (not e!246472))))

(assert (=> b!411631 (= res!238874 (and (= (size!12289 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12288 _keys!709) (size!12289 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17454 () Bool)

(assert (=> mapIsEmpty!17454 mapRes!17454))

(declare-fun b!411632 () Bool)

(declare-fun res!238875 () Bool)

(assert (=> b!411632 (=> (not res!238875) (not e!246471))))

(declare-datatypes ((List!6797 0))(
  ( (Nil!6794) (Cons!6793 (h!7649 (_ BitVec 64)) (t!11963 List!6797)) )
))
(declare-fun arrayNoDuplicates!0 (array!24974 (_ BitVec 32) List!6797) Bool)

(assert (=> b!411632 (= res!238875 (arrayNoDuplicates!0 lt!189346 #b00000000000000000000000000000000 Nil!6794))))

(declare-fun b!411633 () Bool)

(declare-fun res!238882 () Bool)

(assert (=> b!411633 (=> (not res!238882) (not e!246472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411633 (= res!238882 (validKeyInArray!0 k0!794))))

(declare-fun b!411634 () Bool)

(declare-fun res!238880 () Bool)

(assert (=> b!411634 (=> (not res!238880) (not e!246472))))

(assert (=> b!411634 (= res!238880 (or (= (select (arr!11936 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11936 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411635 () Bool)

(declare-fun res!238873 () Bool)

(assert (=> b!411635 (=> (not res!238873) (not e!246472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411635 (= res!238873 (validMask!0 mask!1025))))

(declare-fun b!411636 () Bool)

(declare-fun res!238876 () Bool)

(assert (=> b!411636 (=> (not res!238876) (not e!246472))))

(assert (=> b!411636 (= res!238876 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6794))))

(declare-fun b!411637 () Bool)

(assert (=> b!411637 (= e!246470 tp_is_empty!10555)))

(assert (= (and start!39122 res!238879) b!411635))

(assert (= (and b!411635 res!238873) b!411631))

(assert (= (and b!411631 res!238874) b!411627))

(assert (= (and b!411627 res!238884) b!411636))

(assert (= (and b!411636 res!238876) b!411626))

(assert (= (and b!411626 res!238883) b!411633))

(assert (= (and b!411633 res!238882) b!411634))

(assert (= (and b!411634 res!238880) b!411624))

(assert (= (and b!411624 res!238881) b!411625))

(assert (= (and b!411625 res!238878) b!411632))

(assert (= (and b!411632 res!238875) b!411629))

(assert (= (and b!411629 res!238877) b!411628))

(assert (= (and b!411630 condMapEmpty!17454) mapIsEmpty!17454))

(assert (= (and b!411630 (not condMapEmpty!17454)) mapNonEmpty!17454))

(get-info :version)

(assert (= (and mapNonEmpty!17454 ((_ is ValueCellFull!4934) mapValue!17454)) b!411637))

(assert (= (and b!411630 ((_ is ValueCellFull!4934) mapDefault!17454)) b!411623))

(assert (= start!39122 b!411630))

(declare-fun m!401973 () Bool)

(assert (=> b!411627 m!401973))

(declare-fun m!401975 () Bool)

(assert (=> b!411625 m!401975))

(declare-fun m!401977 () Bool)

(assert (=> b!411625 m!401977))

(declare-fun m!401979 () Bool)

(assert (=> b!411635 m!401979))

(declare-fun m!401981 () Bool)

(assert (=> b!411633 m!401981))

(declare-fun m!401983 () Bool)

(assert (=> b!411628 m!401983))

(declare-fun m!401985 () Bool)

(assert (=> b!411628 m!401985))

(declare-fun m!401987 () Bool)

(assert (=> b!411628 m!401987))

(declare-fun m!401989 () Bool)

(assert (=> b!411636 m!401989))

(declare-fun m!401991 () Bool)

(assert (=> b!411632 m!401991))

(declare-fun m!401993 () Bool)

(assert (=> b!411624 m!401993))

(declare-fun m!401995 () Bool)

(assert (=> b!411634 m!401995))

(declare-fun m!401997 () Bool)

(assert (=> mapNonEmpty!17454 m!401997))

(declare-fun m!401999 () Bool)

(assert (=> start!39122 m!401999))

(declare-fun m!402001 () Bool)

(assert (=> start!39122 m!402001))

(check-sat (not b!411635) (not b_next!9403) (not mapNonEmpty!17454) (not b!411625) (not b!411636) b_and!16803 (not b!411633) (not b!411624) (not b!411632) (not b!411628) (not b!411627) tp_is_empty!10555 (not start!39122))
(check-sat b_and!16803 (not b_next!9403))
