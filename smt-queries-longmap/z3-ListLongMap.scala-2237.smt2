; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36870 () Bool)

(assert start!36870)

(declare-fun b_free!8011 () Bool)

(declare-fun b_next!8011 () Bool)

(assert (=> start!36870 (= b_free!8011 (not b_next!8011))))

(declare-fun tp!28748 () Bool)

(declare-fun b_and!15227 () Bool)

(assert (=> start!36870 (= tp!28748 b_and!15227)))

(declare-fun b!368983 () Bool)

(declare-fun e!225536 () Bool)

(declare-fun e!225538 () Bool)

(declare-fun mapRes!14553 () Bool)

(assert (=> b!368983 (= e!225536 (and e!225538 mapRes!14553))))

(declare-fun condMapEmpty!14553 () Bool)

(declare-datatypes ((V!12651 0))(
  ( (V!12652 (val!4374 Int)) )
))
(declare-datatypes ((ValueCell!3986 0))(
  ( (ValueCellFull!3986 (v!6565 V!12651)) (EmptyCell!3986) )
))
(declare-datatypes ((array!21255 0))(
  ( (array!21256 (arr!10096 (Array (_ BitVec 32) ValueCell!3986)) (size!10449 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21255)

(declare-fun mapDefault!14553 () ValueCell!3986)

(assert (=> b!368983 (= condMapEmpty!14553 (= (arr!10096 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3986)) mapDefault!14553)))))

(declare-fun b!368984 () Bool)

(declare-fun e!225537 () Bool)

(declare-fun e!225539 () Bool)

(assert (=> b!368984 (= e!225537 e!225539)))

(declare-fun res!206984 () Bool)

(assert (=> b!368984 (=> (not res!206984) (not e!225539))))

(declare-datatypes ((array!21257 0))(
  ( (array!21258 (arr!10097 (Array (_ BitVec 32) (_ BitVec 64))) (size!10450 (_ BitVec 32))) )
))
(declare-fun lt!169459 () array!21257)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21257 (_ BitVec 32)) Bool)

(assert (=> b!368984 (= res!206984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169459 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21257)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368984 (= lt!169459 (array!21258 (store (arr!10097 _keys!658) i!548 k0!778) (size!10450 _keys!658)))))

(declare-fun b!368985 () Bool)

(assert (=> b!368985 (= e!225539 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12651)

(declare-datatypes ((tuple2!5774 0))(
  ( (tuple2!5775 (_1!2898 (_ BitVec 64)) (_2!2898 V!12651)) )
))
(declare-datatypes ((List!5602 0))(
  ( (Nil!5599) (Cons!5598 (h!6454 tuple2!5774) (t!10743 List!5602)) )
))
(declare-datatypes ((ListLongMap!4677 0))(
  ( (ListLongMap!4678 (toList!2354 List!5602)) )
))
(declare-fun lt!169460 () ListLongMap!4677)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12651)

(declare-fun minValue!472 () V!12651)

(declare-fun getCurrentListMapNoExtraKeys!645 (array!21257 array!21255 (_ BitVec 32) (_ BitVec 32) V!12651 V!12651 (_ BitVec 32) Int) ListLongMap!4677)

(assert (=> b!368985 (= lt!169460 (getCurrentListMapNoExtraKeys!645 lt!169459 (array!21256 (store (arr!10096 _values!506) i!548 (ValueCellFull!3986 v!373)) (size!10449 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169461 () ListLongMap!4677)

(assert (=> b!368985 (= lt!169461 (getCurrentListMapNoExtraKeys!645 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368986 () Bool)

(declare-fun res!206989 () Bool)

(assert (=> b!368986 (=> (not res!206989) (not e!225537))))

(assert (=> b!368986 (= res!206989 (and (= (size!10449 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10450 _keys!658) (size!10449 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368987 () Bool)

(declare-fun res!206985 () Bool)

(assert (=> b!368987 (=> (not res!206985) (not e!225537))))

(assert (=> b!368987 (= res!206985 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10450 _keys!658))))))

(declare-fun b!368988 () Bool)

(declare-fun e!225534 () Bool)

(declare-fun tp_is_empty!8659 () Bool)

(assert (=> b!368988 (= e!225534 tp_is_empty!8659)))

(declare-fun mapNonEmpty!14553 () Bool)

(declare-fun tp!28749 () Bool)

(assert (=> mapNonEmpty!14553 (= mapRes!14553 (and tp!28749 e!225534))))

(declare-fun mapValue!14553 () ValueCell!3986)

(declare-fun mapKey!14553 () (_ BitVec 32))

(declare-fun mapRest!14553 () (Array (_ BitVec 32) ValueCell!3986))

(assert (=> mapNonEmpty!14553 (= (arr!10096 _values!506) (store mapRest!14553 mapKey!14553 mapValue!14553))))

(declare-fun b!368989 () Bool)

(declare-fun res!206990 () Bool)

(assert (=> b!368989 (=> (not res!206990) (not e!225537))))

(declare-fun arrayContainsKey!0 (array!21257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368989 (= res!206990 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!206988 () Bool)

(assert (=> start!36870 (=> (not res!206988) (not e!225537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36870 (= res!206988 (validMask!0 mask!970))))

(assert (=> start!36870 e!225537))

(declare-fun array_inv!7476 (array!21255) Bool)

(assert (=> start!36870 (and (array_inv!7476 _values!506) e!225536)))

(assert (=> start!36870 tp!28748))

(assert (=> start!36870 true))

(assert (=> start!36870 tp_is_empty!8659))

(declare-fun array_inv!7477 (array!21257) Bool)

(assert (=> start!36870 (array_inv!7477 _keys!658)))

(declare-fun b!368990 () Bool)

(assert (=> b!368990 (= e!225538 tp_is_empty!8659)))

(declare-fun b!368991 () Bool)

(declare-fun res!206983 () Bool)

(assert (=> b!368991 (=> (not res!206983) (not e!225539))))

(declare-datatypes ((List!5603 0))(
  ( (Nil!5600) (Cons!5599 (h!6455 (_ BitVec 64)) (t!10744 List!5603)) )
))
(declare-fun arrayNoDuplicates!0 (array!21257 (_ BitVec 32) List!5603) Bool)

(assert (=> b!368991 (= res!206983 (arrayNoDuplicates!0 lt!169459 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun b!368992 () Bool)

(declare-fun res!206987 () Bool)

(assert (=> b!368992 (=> (not res!206987) (not e!225537))))

(assert (=> b!368992 (= res!206987 (or (= (select (arr!10097 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10097 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368993 () Bool)

(declare-fun res!206981 () Bool)

(assert (=> b!368993 (=> (not res!206981) (not e!225537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368993 (= res!206981 (validKeyInArray!0 k0!778))))

(declare-fun b!368994 () Bool)

(declare-fun res!206982 () Bool)

(assert (=> b!368994 (=> (not res!206982) (not e!225537))))

(assert (=> b!368994 (= res!206982 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun b!368995 () Bool)

(declare-fun res!206986 () Bool)

(assert (=> b!368995 (=> (not res!206986) (not e!225537))))

(assert (=> b!368995 (= res!206986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14553 () Bool)

(assert (=> mapIsEmpty!14553 mapRes!14553))

(assert (= (and start!36870 res!206988) b!368986))

(assert (= (and b!368986 res!206989) b!368995))

(assert (= (and b!368995 res!206986) b!368994))

(assert (= (and b!368994 res!206982) b!368987))

(assert (= (and b!368987 res!206985) b!368993))

(assert (= (and b!368993 res!206981) b!368992))

(assert (= (and b!368992 res!206987) b!368989))

(assert (= (and b!368989 res!206990) b!368984))

(assert (= (and b!368984 res!206984) b!368991))

(assert (= (and b!368991 res!206983) b!368985))

(assert (= (and b!368983 condMapEmpty!14553) mapIsEmpty!14553))

(assert (= (and b!368983 (not condMapEmpty!14553)) mapNonEmpty!14553))

(get-info :version)

(assert (= (and mapNonEmpty!14553 ((_ is ValueCellFull!3986) mapValue!14553)) b!368988))

(assert (= (and b!368983 ((_ is ValueCellFull!3986) mapDefault!14553)) b!368990))

(assert (= start!36870 b!368983))

(declare-fun m!364949 () Bool)

(assert (=> b!368989 m!364949))

(declare-fun m!364951 () Bool)

(assert (=> b!368985 m!364951))

(declare-fun m!364953 () Bool)

(assert (=> b!368985 m!364953))

(declare-fun m!364955 () Bool)

(assert (=> b!368985 m!364955))

(declare-fun m!364957 () Bool)

(assert (=> b!368994 m!364957))

(declare-fun m!364959 () Bool)

(assert (=> b!368993 m!364959))

(declare-fun m!364961 () Bool)

(assert (=> start!36870 m!364961))

(declare-fun m!364963 () Bool)

(assert (=> start!36870 m!364963))

(declare-fun m!364965 () Bool)

(assert (=> start!36870 m!364965))

(declare-fun m!364967 () Bool)

(assert (=> mapNonEmpty!14553 m!364967))

(declare-fun m!364969 () Bool)

(assert (=> b!368992 m!364969))

(declare-fun m!364971 () Bool)

(assert (=> b!368995 m!364971))

(declare-fun m!364973 () Bool)

(assert (=> b!368984 m!364973))

(declare-fun m!364975 () Bool)

(assert (=> b!368984 m!364975))

(declare-fun m!364977 () Bool)

(assert (=> b!368991 m!364977))

(check-sat (not b!368993) (not b!368985) tp_is_empty!8659 b_and!15227 (not mapNonEmpty!14553) (not b!368984) (not b_next!8011) (not b!368994) (not b!368995) (not b!368991) (not b!368989) (not start!36870))
(check-sat b_and!15227 (not b_next!8011))
