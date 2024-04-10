; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36904 () Bool)

(assert start!36904)

(declare-fun b_free!8031 () Bool)

(declare-fun b_next!8031 () Bool)

(assert (=> start!36904 (= b_free!8031 (not b_next!8031))))

(declare-fun tp!28809 () Bool)

(declare-fun b_and!15273 () Bool)

(assert (=> start!36904 (= tp!28809 b_and!15273)))

(declare-fun b!369644 () Bool)

(declare-fun res!207413 () Bool)

(declare-fun e!225893 () Bool)

(assert (=> b!369644 (=> (not res!207413) (not e!225893))))

(declare-datatypes ((array!21305 0))(
  ( (array!21306 (arr!10121 (Array (_ BitVec 32) (_ BitVec 64))) (size!10473 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21305)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369644 (= res!207413 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369645 () Bool)

(declare-fun e!225892 () Bool)

(assert (=> b!369645 (= e!225892 false)))

(declare-datatypes ((V!12677 0))(
  ( (V!12678 (val!4384 Int)) )
))
(declare-datatypes ((ValueCell!3996 0))(
  ( (ValueCellFull!3996 (v!6581 V!12677)) (EmptyCell!3996) )
))
(declare-datatypes ((array!21307 0))(
  ( (array!21308 (arr!10122 (Array (_ BitVec 32) ValueCell!3996)) (size!10474 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21307)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5816 0))(
  ( (tuple2!5817 (_1!2919 (_ BitVec 64)) (_2!2919 V!12677)) )
))
(declare-datatypes ((List!5650 0))(
  ( (Nil!5647) (Cons!5646 (h!6502 tuple2!5816) (t!10800 List!5650)) )
))
(declare-datatypes ((ListLongMap!4729 0))(
  ( (ListLongMap!4730 (toList!2380 List!5650)) )
))
(declare-fun lt!169783 () ListLongMap!4729)

(declare-fun lt!169785 () array!21305)

(declare-fun zeroValue!472 () V!12677)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12677)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12677)

(declare-fun getCurrentListMapNoExtraKeys!657 (array!21305 array!21307 (_ BitVec 32) (_ BitVec 32) V!12677 V!12677 (_ BitVec 32) Int) ListLongMap!4729)

(assert (=> b!369645 (= lt!169783 (getCurrentListMapNoExtraKeys!657 lt!169785 (array!21308 (store (arr!10122 _values!506) i!548 (ValueCellFull!3996 v!373)) (size!10474 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169784 () ListLongMap!4729)

(assert (=> b!369645 (= lt!169784 (getCurrentListMapNoExtraKeys!657 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14583 () Bool)

(declare-fun mapRes!14583 () Bool)

(declare-fun tp!28808 () Bool)

(declare-fun e!225891 () Bool)

(assert (=> mapNonEmpty!14583 (= mapRes!14583 (and tp!28808 e!225891))))

(declare-fun mapValue!14583 () ValueCell!3996)

(declare-fun mapKey!14583 () (_ BitVec 32))

(declare-fun mapRest!14583 () (Array (_ BitVec 32) ValueCell!3996))

(assert (=> mapNonEmpty!14583 (= (arr!10122 _values!506) (store mapRest!14583 mapKey!14583 mapValue!14583))))

(declare-fun b!369646 () Bool)

(declare-fun res!207411 () Bool)

(assert (=> b!369646 (=> (not res!207411) (not e!225893))))

(assert (=> b!369646 (= res!207411 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10473 _keys!658))))))

(declare-fun b!369647 () Bool)

(declare-fun res!207414 () Bool)

(assert (=> b!369647 (=> (not res!207414) (not e!225893))))

(declare-datatypes ((List!5651 0))(
  ( (Nil!5648) (Cons!5647 (h!6503 (_ BitVec 64)) (t!10801 List!5651)) )
))
(declare-fun arrayNoDuplicates!0 (array!21305 (_ BitVec 32) List!5651) Bool)

(assert (=> b!369647 (= res!207414 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5648))))

(declare-fun b!369648 () Bool)

(declare-fun e!225890 () Bool)

(declare-fun tp_is_empty!8679 () Bool)

(assert (=> b!369648 (= e!225890 tp_is_empty!8679)))

(declare-fun b!369649 () Bool)

(declare-fun res!207418 () Bool)

(assert (=> b!369649 (=> (not res!207418) (not e!225893))))

(assert (=> b!369649 (= res!207418 (or (= (select (arr!10121 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10121 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!207415 () Bool)

(assert (=> start!36904 (=> (not res!207415) (not e!225893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36904 (= res!207415 (validMask!0 mask!970))))

(assert (=> start!36904 e!225893))

(declare-fun e!225888 () Bool)

(declare-fun array_inv!7480 (array!21307) Bool)

(assert (=> start!36904 (and (array_inv!7480 _values!506) e!225888)))

(assert (=> start!36904 tp!28809))

(assert (=> start!36904 true))

(assert (=> start!36904 tp_is_empty!8679))

(declare-fun array_inv!7481 (array!21305) Bool)

(assert (=> start!36904 (array_inv!7481 _keys!658)))

(declare-fun mapIsEmpty!14583 () Bool)

(assert (=> mapIsEmpty!14583 mapRes!14583))

(declare-fun b!369650 () Bool)

(declare-fun res!207416 () Bool)

(assert (=> b!369650 (=> (not res!207416) (not e!225893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369650 (= res!207416 (validKeyInArray!0 k0!778))))

(declare-fun b!369651 () Bool)

(declare-fun res!207419 () Bool)

(assert (=> b!369651 (=> (not res!207419) (not e!225893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21305 (_ BitVec 32)) Bool)

(assert (=> b!369651 (= res!207419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369652 () Bool)

(assert (=> b!369652 (= e!225893 e!225892)))

(declare-fun res!207410 () Bool)

(assert (=> b!369652 (=> (not res!207410) (not e!225892))))

(assert (=> b!369652 (= res!207410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169785 mask!970))))

(assert (=> b!369652 (= lt!169785 (array!21306 (store (arr!10121 _keys!658) i!548 k0!778) (size!10473 _keys!658)))))

(declare-fun b!369653 () Bool)

(declare-fun res!207412 () Bool)

(assert (=> b!369653 (=> (not res!207412) (not e!225893))))

(assert (=> b!369653 (= res!207412 (and (= (size!10474 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10473 _keys!658) (size!10474 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369654 () Bool)

(assert (=> b!369654 (= e!225891 tp_is_empty!8679)))

(declare-fun b!369655 () Bool)

(assert (=> b!369655 (= e!225888 (and e!225890 mapRes!14583))))

(declare-fun condMapEmpty!14583 () Bool)

(declare-fun mapDefault!14583 () ValueCell!3996)

(assert (=> b!369655 (= condMapEmpty!14583 (= (arr!10122 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3996)) mapDefault!14583)))))

(declare-fun b!369656 () Bool)

(declare-fun res!207417 () Bool)

(assert (=> b!369656 (=> (not res!207417) (not e!225892))))

(assert (=> b!369656 (= res!207417 (arrayNoDuplicates!0 lt!169785 #b00000000000000000000000000000000 Nil!5648))))

(assert (= (and start!36904 res!207415) b!369653))

(assert (= (and b!369653 res!207412) b!369651))

(assert (= (and b!369651 res!207419) b!369647))

(assert (= (and b!369647 res!207414) b!369646))

(assert (= (and b!369646 res!207411) b!369650))

(assert (= (and b!369650 res!207416) b!369649))

(assert (= (and b!369649 res!207418) b!369644))

(assert (= (and b!369644 res!207413) b!369652))

(assert (= (and b!369652 res!207410) b!369656))

(assert (= (and b!369656 res!207417) b!369645))

(assert (= (and b!369655 condMapEmpty!14583) mapIsEmpty!14583))

(assert (= (and b!369655 (not condMapEmpty!14583)) mapNonEmpty!14583))

(get-info :version)

(assert (= (and mapNonEmpty!14583 ((_ is ValueCellFull!3996) mapValue!14583)) b!369654))

(assert (= (and b!369655 ((_ is ValueCellFull!3996) mapDefault!14583)) b!369648))

(assert (= start!36904 b!369655))

(declare-fun m!365973 () Bool)

(assert (=> b!369650 m!365973))

(declare-fun m!365975 () Bool)

(assert (=> mapNonEmpty!14583 m!365975))

(declare-fun m!365977 () Bool)

(assert (=> b!369645 m!365977))

(declare-fun m!365979 () Bool)

(assert (=> b!369645 m!365979))

(declare-fun m!365981 () Bool)

(assert (=> b!369645 m!365981))

(declare-fun m!365983 () Bool)

(assert (=> b!369647 m!365983))

(declare-fun m!365985 () Bool)

(assert (=> b!369644 m!365985))

(declare-fun m!365987 () Bool)

(assert (=> b!369656 m!365987))

(declare-fun m!365989 () Bool)

(assert (=> b!369652 m!365989))

(declare-fun m!365991 () Bool)

(assert (=> b!369652 m!365991))

(declare-fun m!365993 () Bool)

(assert (=> b!369649 m!365993))

(declare-fun m!365995 () Bool)

(assert (=> start!36904 m!365995))

(declare-fun m!365997 () Bool)

(assert (=> start!36904 m!365997))

(declare-fun m!365999 () Bool)

(assert (=> start!36904 m!365999))

(declare-fun m!366001 () Bool)

(assert (=> b!369651 m!366001))

(check-sat b_and!15273 (not mapNonEmpty!14583) (not b!369651) (not b!369650) tp_is_empty!8679 (not start!36904) (not b!369656) (not b!369644) (not b!369647) (not b!369645) (not b_next!8031) (not b!369652))
(check-sat b_and!15273 (not b_next!8031))
