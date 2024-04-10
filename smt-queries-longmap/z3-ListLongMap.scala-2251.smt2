; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36970 () Bool)

(assert start!36970)

(declare-fun b_free!8097 () Bool)

(declare-fun b_next!8097 () Bool)

(assert (=> start!36970 (= b_free!8097 (not b_next!8097))))

(declare-fun tp!29007 () Bool)

(declare-fun b_and!15339 () Bool)

(assert (=> start!36970 (= tp!29007 b_and!15339)))

(declare-fun b!370931 () Bool)

(declare-fun res!208400 () Bool)

(declare-fun e!226483 () Bool)

(assert (=> b!370931 (=> (not res!208400) (not e!226483))))

(declare-datatypes ((array!21433 0))(
  ( (array!21434 (arr!10185 (Array (_ BitVec 32) (_ BitVec 64))) (size!10537 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21433)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21433 (_ BitVec 32)) Bool)

(assert (=> b!370931 (= res!208400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!208402 () Bool)

(assert (=> start!36970 (=> (not res!208402) (not e!226483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36970 (= res!208402 (validMask!0 mask!970))))

(assert (=> start!36970 e!226483))

(declare-datatypes ((V!12765 0))(
  ( (V!12766 (val!4417 Int)) )
))
(declare-datatypes ((ValueCell!4029 0))(
  ( (ValueCellFull!4029 (v!6614 V!12765)) (EmptyCell!4029) )
))
(declare-datatypes ((array!21435 0))(
  ( (array!21436 (arr!10186 (Array (_ BitVec 32) ValueCell!4029)) (size!10538 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21435)

(declare-fun e!226486 () Bool)

(declare-fun array_inv!7522 (array!21435) Bool)

(assert (=> start!36970 (and (array_inv!7522 _values!506) e!226486)))

(assert (=> start!36970 tp!29007))

(assert (=> start!36970 true))

(declare-fun tp_is_empty!8745 () Bool)

(assert (=> start!36970 tp_is_empty!8745))

(declare-fun array_inv!7523 (array!21433) Bool)

(assert (=> start!36970 (array_inv!7523 _keys!658)))

(declare-fun b!370932 () Bool)

(declare-fun res!208406 () Bool)

(assert (=> b!370932 (=> (not res!208406) (not e!226483))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370932 (= res!208406 (and (= (size!10538 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10537 _keys!658) (size!10538 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370933 () Bool)

(declare-fun res!208408 () Bool)

(assert (=> b!370933 (=> (not res!208408) (not e!226483))))

(declare-datatypes ((List!5698 0))(
  ( (Nil!5695) (Cons!5694 (h!6550 (_ BitVec 64)) (t!10848 List!5698)) )
))
(declare-fun arrayNoDuplicates!0 (array!21433 (_ BitVec 32) List!5698) Bool)

(assert (=> b!370933 (= res!208408 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5695))))

(declare-fun b!370934 () Bool)

(declare-fun e!226485 () Bool)

(assert (=> b!370934 (= e!226485 (not true))))

(declare-datatypes ((tuple2!5858 0))(
  ( (tuple2!5859 (_1!2940 (_ BitVec 64)) (_2!2940 V!12765)) )
))
(declare-datatypes ((List!5699 0))(
  ( (Nil!5696) (Cons!5695 (h!6551 tuple2!5858) (t!10849 List!5699)) )
))
(declare-datatypes ((ListLongMap!4771 0))(
  ( (ListLongMap!4772 (toList!2401 List!5699)) )
))
(declare-fun lt!170092 () ListLongMap!4771)

(declare-fun lt!170090 () ListLongMap!4771)

(assert (=> b!370934 (and (= lt!170092 lt!170090) (= lt!170090 lt!170092))))

(declare-fun lt!170094 () ListLongMap!4771)

(declare-fun v!373 () V!12765)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!747 (ListLongMap!4771 tuple2!5858) ListLongMap!4771)

(assert (=> b!370934 (= lt!170090 (+!747 lt!170094 (tuple2!5859 k0!778 v!373)))))

(declare-datatypes ((Unit!11400 0))(
  ( (Unit!11401) )
))
(declare-fun lt!170093 () Unit!11400)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12765)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12765)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!2 (array!21433 array!21435 (_ BitVec 32) (_ BitVec 32) V!12765 V!12765 (_ BitVec 32) (_ BitVec 64) V!12765 (_ BitVec 32) Int) Unit!11400)

(assert (=> b!370934 (= lt!170093 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!2 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170091 () array!21433)

(declare-fun getCurrentListMapNoExtraKeys!678 (array!21433 array!21435 (_ BitVec 32) (_ BitVec 32) V!12765 V!12765 (_ BitVec 32) Int) ListLongMap!4771)

(assert (=> b!370934 (= lt!170092 (getCurrentListMapNoExtraKeys!678 lt!170091 (array!21436 (store (arr!10186 _values!506) i!548 (ValueCellFull!4029 v!373)) (size!10538 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370934 (= lt!170094 (getCurrentListMapNoExtraKeys!678 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370935 () Bool)

(declare-fun res!208403 () Bool)

(assert (=> b!370935 (=> (not res!208403) (not e!226483))))

(assert (=> b!370935 (= res!208403 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10537 _keys!658))))))

(declare-fun mapNonEmpty!14682 () Bool)

(declare-fun mapRes!14682 () Bool)

(declare-fun tp!29006 () Bool)

(declare-fun e!226482 () Bool)

(assert (=> mapNonEmpty!14682 (= mapRes!14682 (and tp!29006 e!226482))))

(declare-fun mapValue!14682 () ValueCell!4029)

(declare-fun mapKey!14682 () (_ BitVec 32))

(declare-fun mapRest!14682 () (Array (_ BitVec 32) ValueCell!4029))

(assert (=> mapNonEmpty!14682 (= (arr!10186 _values!506) (store mapRest!14682 mapKey!14682 mapValue!14682))))

(declare-fun b!370936 () Bool)

(declare-fun res!208405 () Bool)

(assert (=> b!370936 (=> (not res!208405) (not e!226483))))

(declare-fun arrayContainsKey!0 (array!21433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370936 (= res!208405 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370937 () Bool)

(assert (=> b!370937 (= e!226482 tp_is_empty!8745)))

(declare-fun b!370938 () Bool)

(declare-fun res!208407 () Bool)

(assert (=> b!370938 (=> (not res!208407) (not e!226483))))

(assert (=> b!370938 (= res!208407 (or (= (select (arr!10185 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10185 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370939 () Bool)

(declare-fun e!226484 () Bool)

(assert (=> b!370939 (= e!226486 (and e!226484 mapRes!14682))))

(declare-fun condMapEmpty!14682 () Bool)

(declare-fun mapDefault!14682 () ValueCell!4029)

(assert (=> b!370939 (= condMapEmpty!14682 (= (arr!10186 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4029)) mapDefault!14682)))))

(declare-fun b!370940 () Bool)

(assert (=> b!370940 (= e!226483 e!226485)))

(declare-fun res!208401 () Bool)

(assert (=> b!370940 (=> (not res!208401) (not e!226485))))

(assert (=> b!370940 (= res!208401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170091 mask!970))))

(assert (=> b!370940 (= lt!170091 (array!21434 (store (arr!10185 _keys!658) i!548 k0!778) (size!10537 _keys!658)))))

(declare-fun b!370941 () Bool)

(declare-fun res!208404 () Bool)

(assert (=> b!370941 (=> (not res!208404) (not e!226485))))

(assert (=> b!370941 (= res!208404 (arrayNoDuplicates!0 lt!170091 #b00000000000000000000000000000000 Nil!5695))))

(declare-fun b!370942 () Bool)

(assert (=> b!370942 (= e!226484 tp_is_empty!8745)))

(declare-fun b!370943 () Bool)

(declare-fun res!208409 () Bool)

(assert (=> b!370943 (=> (not res!208409) (not e!226483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370943 (= res!208409 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14682 () Bool)

(assert (=> mapIsEmpty!14682 mapRes!14682))

(assert (= (and start!36970 res!208402) b!370932))

(assert (= (and b!370932 res!208406) b!370931))

(assert (= (and b!370931 res!208400) b!370933))

(assert (= (and b!370933 res!208408) b!370935))

(assert (= (and b!370935 res!208403) b!370943))

(assert (= (and b!370943 res!208409) b!370938))

(assert (= (and b!370938 res!208407) b!370936))

(assert (= (and b!370936 res!208405) b!370940))

(assert (= (and b!370940 res!208401) b!370941))

(assert (= (and b!370941 res!208404) b!370934))

(assert (= (and b!370939 condMapEmpty!14682) mapIsEmpty!14682))

(assert (= (and b!370939 (not condMapEmpty!14682)) mapNonEmpty!14682))

(get-info :version)

(assert (= (and mapNonEmpty!14682 ((_ is ValueCellFull!4029) mapValue!14682)) b!370937))

(assert (= (and b!370939 ((_ is ValueCellFull!4029) mapDefault!14682)) b!370942))

(assert (= start!36970 b!370939))

(declare-fun m!366967 () Bool)

(assert (=> b!370936 m!366967))

(declare-fun m!366969 () Bool)

(assert (=> b!370941 m!366969))

(declare-fun m!366971 () Bool)

(assert (=> b!370943 m!366971))

(declare-fun m!366973 () Bool)

(assert (=> b!370934 m!366973))

(declare-fun m!366975 () Bool)

(assert (=> b!370934 m!366975))

(declare-fun m!366977 () Bool)

(assert (=> b!370934 m!366977))

(declare-fun m!366979 () Bool)

(assert (=> b!370934 m!366979))

(declare-fun m!366981 () Bool)

(assert (=> b!370934 m!366981))

(declare-fun m!366983 () Bool)

(assert (=> b!370931 m!366983))

(declare-fun m!366985 () Bool)

(assert (=> start!36970 m!366985))

(declare-fun m!366987 () Bool)

(assert (=> start!36970 m!366987))

(declare-fun m!366989 () Bool)

(assert (=> start!36970 m!366989))

(declare-fun m!366991 () Bool)

(assert (=> mapNonEmpty!14682 m!366991))

(declare-fun m!366993 () Bool)

(assert (=> b!370933 m!366993))

(declare-fun m!366995 () Bool)

(assert (=> b!370938 m!366995))

(declare-fun m!366997 () Bool)

(assert (=> b!370940 m!366997))

(declare-fun m!366999 () Bool)

(assert (=> b!370940 m!366999))

(check-sat (not b!370933) (not b!370936) tp_is_empty!8745 (not b!370934) (not b!370940) (not b_next!8097) (not b!370943) (not mapNonEmpty!14682) (not start!36970) (not b!370941) b_and!15339 (not b!370931))
(check-sat b_and!15339 (not b_next!8097))
