; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37002 () Bool)

(assert start!37002)

(declare-fun b_free!8143 () Bool)

(declare-fun b_next!8143 () Bool)

(assert (=> start!37002 (= b_free!8143 (not b_next!8143))))

(declare-fun tp!29144 () Bool)

(declare-fun b_and!15399 () Bool)

(assert (=> start!37002 (= tp!29144 b_and!15399)))

(declare-fun b!371779 () Bool)

(declare-fun e!226864 () Bool)

(declare-datatypes ((array!21508 0))(
  ( (array!21509 (arr!10222 (Array (_ BitVec 32) (_ BitVec 64))) (size!10574 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21508)

(assert (=> b!371779 (= e!226864 (not (bvsle #b00000000000000000000000000000000 (size!10574 _keys!658))))))

(declare-datatypes ((V!12827 0))(
  ( (V!12828 (val!4440 Int)) )
))
(declare-datatypes ((tuple2!5792 0))(
  ( (tuple2!5793 (_1!2907 (_ BitVec 64)) (_2!2907 V!12827)) )
))
(declare-datatypes ((List!5631 0))(
  ( (Nil!5628) (Cons!5627 (h!6483 tuple2!5792) (t!10773 List!5631)) )
))
(declare-datatypes ((ListLongMap!4707 0))(
  ( (ListLongMap!4708 (toList!2369 List!5631)) )
))
(declare-fun lt!170457 () ListLongMap!4707)

(declare-fun lt!170454 () ListLongMap!4707)

(assert (=> b!371779 (and (= lt!170457 lt!170454) (= lt!170454 lt!170457))))

(declare-fun v!373 () V!12827)

(declare-fun lt!170456 () ListLongMap!4707)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!765 (ListLongMap!4707 tuple2!5792) ListLongMap!4707)

(assert (=> b!371779 (= lt!170454 (+!765 lt!170456 (tuple2!5793 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4052 0))(
  ( (ValueCellFull!4052 (v!6638 V!12827)) (EmptyCell!4052) )
))
(declare-datatypes ((array!21510 0))(
  ( (array!21511 (arr!10223 (Array (_ BitVec 32) ValueCell!4052)) (size!10575 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21510)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11421 0))(
  ( (Unit!11422) )
))
(declare-fun lt!170455 () Unit!11421)

(declare-fun zeroValue!472 () V!12827)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12827)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 (array!21508 array!21510 (_ BitVec 32) (_ BitVec 32) V!12827 V!12827 (_ BitVec 32) (_ BitVec 64) V!12827 (_ BitVec 32) Int) Unit!11421)

(assert (=> b!371779 (= lt!170455 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170458 () array!21508)

(declare-fun getCurrentListMapNoExtraKeys!678 (array!21508 array!21510 (_ BitVec 32) (_ BitVec 32) V!12827 V!12827 (_ BitVec 32) Int) ListLongMap!4707)

(assert (=> b!371779 (= lt!170457 (getCurrentListMapNoExtraKeys!678 lt!170458 (array!21511 (store (arr!10223 _values!506) i!548 (ValueCellFull!4052 v!373)) (size!10575 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371779 (= lt!170456 (getCurrentListMapNoExtraKeys!678 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371780 () Bool)

(declare-fun e!226869 () Bool)

(declare-fun tp_is_empty!8791 () Bool)

(assert (=> b!371780 (= e!226869 tp_is_empty!8791)))

(declare-fun b!371781 () Bool)

(declare-fun e!226866 () Bool)

(declare-fun e!226867 () Bool)

(declare-fun mapRes!14751 () Bool)

(assert (=> b!371781 (= e!226866 (and e!226867 mapRes!14751))))

(declare-fun condMapEmpty!14751 () Bool)

(declare-fun mapDefault!14751 () ValueCell!4052)

(assert (=> b!371781 (= condMapEmpty!14751 (= (arr!10223 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4052)) mapDefault!14751)))))

(declare-fun b!371782 () Bool)

(declare-fun res!209089 () Bool)

(declare-fun e!226868 () Bool)

(assert (=> b!371782 (=> (not res!209089) (not e!226868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371782 (= res!209089 (validKeyInArray!0 k0!778))))

(declare-fun b!371783 () Bool)

(declare-fun res!209087 () Bool)

(assert (=> b!371783 (=> (not res!209087) (not e!226868))))

(assert (=> b!371783 (= res!209087 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10574 _keys!658))))))

(declare-fun b!371784 () Bool)

(declare-fun res!209096 () Bool)

(assert (=> b!371784 (=> (not res!209096) (not e!226868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21508 (_ BitVec 32)) Bool)

(assert (=> b!371784 (= res!209096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14751 () Bool)

(declare-fun tp!29145 () Bool)

(assert (=> mapNonEmpty!14751 (= mapRes!14751 (and tp!29145 e!226869))))

(declare-fun mapRest!14751 () (Array (_ BitVec 32) ValueCell!4052))

(declare-fun mapKey!14751 () (_ BitVec 32))

(declare-fun mapValue!14751 () ValueCell!4052)

(assert (=> mapNonEmpty!14751 (= (arr!10223 _values!506) (store mapRest!14751 mapKey!14751 mapValue!14751))))

(declare-fun b!371785 () Bool)

(declare-fun res!209093 () Bool)

(assert (=> b!371785 (=> (not res!209093) (not e!226868))))

(declare-fun arrayContainsKey!0 (array!21508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371785 (= res!209093 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14751 () Bool)

(assert (=> mapIsEmpty!14751 mapRes!14751))

(declare-fun b!371786 () Bool)

(declare-fun res!209091 () Bool)

(assert (=> b!371786 (=> (not res!209091) (not e!226868))))

(declare-datatypes ((List!5632 0))(
  ( (Nil!5629) (Cons!5628 (h!6484 (_ BitVec 64)) (t!10774 List!5632)) )
))
(declare-fun arrayNoDuplicates!0 (array!21508 (_ BitVec 32) List!5632) Bool)

(assert (=> b!371786 (= res!209091 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5629))))

(declare-fun b!371787 () Bool)

(declare-fun res!209092 () Bool)

(assert (=> b!371787 (=> (not res!209092) (not e!226868))))

(assert (=> b!371787 (= res!209092 (and (= (size!10575 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10574 _keys!658) (size!10575 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!209095 () Bool)

(assert (=> start!37002 (=> (not res!209095) (not e!226868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37002 (= res!209095 (validMask!0 mask!970))))

(assert (=> start!37002 e!226868))

(declare-fun array_inv!7578 (array!21510) Bool)

(assert (=> start!37002 (and (array_inv!7578 _values!506) e!226866)))

(assert (=> start!37002 tp!29144))

(assert (=> start!37002 true))

(assert (=> start!37002 tp_is_empty!8791))

(declare-fun array_inv!7579 (array!21508) Bool)

(assert (=> start!37002 (array_inv!7579 _keys!658)))

(declare-fun b!371788 () Bool)

(declare-fun res!209090 () Bool)

(assert (=> b!371788 (=> (not res!209090) (not e!226868))))

(assert (=> b!371788 (= res!209090 (or (= (select (arr!10222 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10222 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371789 () Bool)

(assert (=> b!371789 (= e!226867 tp_is_empty!8791)))

(declare-fun b!371790 () Bool)

(assert (=> b!371790 (= e!226868 e!226864)))

(declare-fun res!209094 () Bool)

(assert (=> b!371790 (=> (not res!209094) (not e!226864))))

(assert (=> b!371790 (= res!209094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170458 mask!970))))

(assert (=> b!371790 (= lt!170458 (array!21509 (store (arr!10222 _keys!658) i!548 k0!778) (size!10574 _keys!658)))))

(declare-fun b!371791 () Bool)

(declare-fun res!209088 () Bool)

(assert (=> b!371791 (=> (not res!209088) (not e!226864))))

(assert (=> b!371791 (= res!209088 (arrayNoDuplicates!0 lt!170458 #b00000000000000000000000000000000 Nil!5629))))

(assert (= (and start!37002 res!209095) b!371787))

(assert (= (and b!371787 res!209092) b!371784))

(assert (= (and b!371784 res!209096) b!371786))

(assert (= (and b!371786 res!209091) b!371783))

(assert (= (and b!371783 res!209087) b!371782))

(assert (= (and b!371782 res!209089) b!371788))

(assert (= (and b!371788 res!209090) b!371785))

(assert (= (and b!371785 res!209093) b!371790))

(assert (= (and b!371790 res!209094) b!371791))

(assert (= (and b!371791 res!209088) b!371779))

(assert (= (and b!371781 condMapEmpty!14751) mapIsEmpty!14751))

(assert (= (and b!371781 (not condMapEmpty!14751)) mapNonEmpty!14751))

(get-info :version)

(assert (= (and mapNonEmpty!14751 ((_ is ValueCellFull!4052) mapValue!14751)) b!371780))

(assert (= (and b!371781 ((_ is ValueCellFull!4052) mapDefault!14751)) b!371789))

(assert (= start!37002 b!371781))

(declare-fun m!367979 () Bool)

(assert (=> b!371786 m!367979))

(declare-fun m!367981 () Bool)

(assert (=> b!371788 m!367981))

(declare-fun m!367983 () Bool)

(assert (=> mapNonEmpty!14751 m!367983))

(declare-fun m!367985 () Bool)

(assert (=> start!37002 m!367985))

(declare-fun m!367987 () Bool)

(assert (=> start!37002 m!367987))

(declare-fun m!367989 () Bool)

(assert (=> start!37002 m!367989))

(declare-fun m!367991 () Bool)

(assert (=> b!371782 m!367991))

(declare-fun m!367993 () Bool)

(assert (=> b!371779 m!367993))

(declare-fun m!367995 () Bool)

(assert (=> b!371779 m!367995))

(declare-fun m!367997 () Bool)

(assert (=> b!371779 m!367997))

(declare-fun m!367999 () Bool)

(assert (=> b!371779 m!367999))

(declare-fun m!368001 () Bool)

(assert (=> b!371779 m!368001))

(declare-fun m!368003 () Bool)

(assert (=> b!371790 m!368003))

(declare-fun m!368005 () Bool)

(assert (=> b!371790 m!368005))

(declare-fun m!368007 () Bool)

(assert (=> b!371785 m!368007))

(declare-fun m!368009 () Bool)

(assert (=> b!371791 m!368009))

(declare-fun m!368011 () Bool)

(assert (=> b!371784 m!368011))

(check-sat b_and!15399 tp_is_empty!8791 (not b!371784) (not b!371779) (not b!371782) (not b!371790) (not b_next!8143) (not b!371786) (not b!371791) (not start!37002) (not mapNonEmpty!14751) (not b!371785))
(check-sat b_and!15399 (not b_next!8143))
