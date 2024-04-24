; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37512 () Bool)

(assert start!37512)

(declare-fun b_free!8653 () Bool)

(declare-fun b_next!8653 () Bool)

(assert (=> start!37512 (= b_free!8653 (not b_next!8653))))

(declare-fun tp!30674 () Bool)

(declare-fun b_and!15909 () Bool)

(assert (=> start!37512 (= tp!30674 b_and!15909)))

(declare-fun res!217955 () Bool)

(declare-fun e!232645 () Bool)

(assert (=> start!37512 (=> (not res!217955) (not e!232645))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37512 (= res!217955 (validMask!0 mask!970))))

(assert (=> start!37512 e!232645))

(declare-datatypes ((V!13507 0))(
  ( (V!13508 (val!4695 Int)) )
))
(declare-datatypes ((ValueCell!4307 0))(
  ( (ValueCellFull!4307 (v!6893 V!13507)) (EmptyCell!4307) )
))
(declare-datatypes ((array!22500 0))(
  ( (array!22501 (arr!10718 (Array (_ BitVec 32) ValueCell!4307)) (size!11070 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22500)

(declare-fun e!232648 () Bool)

(declare-fun array_inv!7932 (array!22500) Bool)

(assert (=> start!37512 (and (array_inv!7932 _values!506) e!232648)))

(assert (=> start!37512 tp!30674))

(assert (=> start!37512 true))

(declare-fun tp_is_empty!9301 () Bool)

(assert (=> start!37512 tp_is_empty!9301))

(declare-datatypes ((array!22502 0))(
  ( (array!22503 (arr!10719 (Array (_ BitVec 32) (_ BitVec 64))) (size!11071 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22502)

(declare-fun array_inv!7933 (array!22502) Bool)

(assert (=> start!37512 (array_inv!7933 _keys!658)))

(declare-fun b!382941 () Bool)

(declare-fun e!232649 () Bool)

(assert (=> b!382941 (= e!232649 (bvsle #b00000000000000000000000000000000 (size!11071 _keys!658)))))

(declare-datatypes ((tuple2!6192 0))(
  ( (tuple2!6193 (_1!3107 (_ BitVec 64)) (_2!3107 V!13507)) )
))
(declare-datatypes ((List!6028 0))(
  ( (Nil!6025) (Cons!6024 (h!6880 tuple2!6192) (t!11170 List!6028)) )
))
(declare-datatypes ((ListLongMap!5107 0))(
  ( (ListLongMap!5108 (toList!2569 List!6028)) )
))
(declare-fun lt!179800 () ListLongMap!5107)

(declare-fun lt!179797 () ListLongMap!5107)

(assert (=> b!382941 (= lt!179800 lt!179797)))

(declare-fun b!382942 () Bool)

(declare-fun res!217963 () Bool)

(assert (=> b!382942 (=> (not res!217963) (not e!232645))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382942 (= res!217963 (and (= (size!11070 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11071 _keys!658) (size!11070 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382943 () Bool)

(declare-fun res!217959 () Bool)

(assert (=> b!382943 (=> (not res!217959) (not e!232645))))

(declare-datatypes ((List!6029 0))(
  ( (Nil!6026) (Cons!6025 (h!6881 (_ BitVec 64)) (t!11171 List!6029)) )
))
(declare-fun arrayNoDuplicates!0 (array!22502 (_ BitVec 32) List!6029) Bool)

(assert (=> b!382943 (= res!217959 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6026))))

(declare-fun b!382944 () Bool)

(declare-fun e!232644 () Bool)

(assert (=> b!382944 (= e!232644 tp_is_empty!9301)))

(declare-fun mapNonEmpty!15516 () Bool)

(declare-fun mapRes!15516 () Bool)

(declare-fun tp!30675 () Bool)

(assert (=> mapNonEmpty!15516 (= mapRes!15516 (and tp!30675 e!232644))))

(declare-fun mapRest!15516 () (Array (_ BitVec 32) ValueCell!4307))

(declare-fun mapValue!15516 () ValueCell!4307)

(declare-fun mapKey!15516 () (_ BitVec 32))

(assert (=> mapNonEmpty!15516 (= (arr!10718 _values!506) (store mapRest!15516 mapKey!15516 mapValue!15516))))

(declare-fun b!382945 () Bool)

(declare-fun res!217956 () Bool)

(assert (=> b!382945 (=> (not res!217956) (not e!232645))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382945 (= res!217956 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382946 () Bool)

(declare-fun res!217957 () Bool)

(declare-fun e!232647 () Bool)

(assert (=> b!382946 (=> (not res!217957) (not e!232647))))

(declare-fun lt!179795 () array!22502)

(assert (=> b!382946 (= res!217957 (arrayNoDuplicates!0 lt!179795 #b00000000000000000000000000000000 Nil!6026))))

(declare-fun b!382947 () Bool)

(declare-fun res!217964 () Bool)

(assert (=> b!382947 (=> (not res!217964) (not e!232645))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382947 (= res!217964 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11071 _keys!658))))))

(declare-fun b!382948 () Bool)

(declare-fun e!232650 () Bool)

(assert (=> b!382948 (= e!232650 tp_is_empty!9301)))

(declare-fun b!382949 () Bool)

(declare-fun res!217954 () Bool)

(assert (=> b!382949 (=> (not res!217954) (not e!232645))))

(assert (=> b!382949 (= res!217954 (or (= (select (arr!10719 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10719 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382950 () Bool)

(assert (=> b!382950 (= e!232647 (not e!232649))))

(declare-fun res!217961 () Bool)

(assert (=> b!382950 (=> res!217961 e!232649)))

(declare-fun lt!179803 () Bool)

(assert (=> b!382950 (= res!217961 (or (and (not lt!179803) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179803) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179803)))))

(assert (=> b!382950 (= lt!179803 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179796 () ListLongMap!5107)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13507)

(declare-fun minValue!472 () V!13507)

(declare-fun getCurrentListMap!2003 (array!22502 array!22500 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) Int) ListLongMap!5107)

(assert (=> b!382950 (= lt!179796 (getCurrentListMap!2003 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179802 () array!22500)

(assert (=> b!382950 (= lt!179800 (getCurrentListMap!2003 lt!179795 lt!179802 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179801 () ListLongMap!5107)

(assert (=> b!382950 (and (= lt!179797 lt!179801) (= lt!179801 lt!179797))))

(declare-fun v!373 () V!13507)

(declare-fun lt!179799 () ListLongMap!5107)

(declare-fun +!961 (ListLongMap!5107 tuple2!6192) ListLongMap!5107)

(assert (=> b!382950 (= lt!179801 (+!961 lt!179799 (tuple2!6193 k0!778 v!373)))))

(declare-datatypes ((Unit!11801 0))(
  ( (Unit!11802) )
))
(declare-fun lt!179798 () Unit!11801)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 (array!22502 array!22500 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) (_ BitVec 64) V!13507 (_ BitVec 32) Int) Unit!11801)

(assert (=> b!382950 (= lt!179798 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!850 (array!22502 array!22500 (_ BitVec 32) (_ BitVec 32) V!13507 V!13507 (_ BitVec 32) Int) ListLongMap!5107)

(assert (=> b!382950 (= lt!179797 (getCurrentListMapNoExtraKeys!850 lt!179795 lt!179802 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382950 (= lt!179802 (array!22501 (store (arr!10718 _values!506) i!548 (ValueCellFull!4307 v!373)) (size!11070 _values!506)))))

(assert (=> b!382950 (= lt!179799 (getCurrentListMapNoExtraKeys!850 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382951 () Bool)

(declare-fun res!217962 () Bool)

(assert (=> b!382951 (=> (not res!217962) (not e!232645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382951 (= res!217962 (validKeyInArray!0 k0!778))))

(declare-fun b!382952 () Bool)

(declare-fun res!217960 () Bool)

(assert (=> b!382952 (=> (not res!217960) (not e!232645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22502 (_ BitVec 32)) Bool)

(assert (=> b!382952 (= res!217960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382953 () Bool)

(assert (=> b!382953 (= e!232648 (and e!232650 mapRes!15516))))

(declare-fun condMapEmpty!15516 () Bool)

(declare-fun mapDefault!15516 () ValueCell!4307)

(assert (=> b!382953 (= condMapEmpty!15516 (= (arr!10718 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4307)) mapDefault!15516)))))

(declare-fun mapIsEmpty!15516 () Bool)

(assert (=> mapIsEmpty!15516 mapRes!15516))

(declare-fun b!382954 () Bool)

(assert (=> b!382954 (= e!232645 e!232647)))

(declare-fun res!217958 () Bool)

(assert (=> b!382954 (=> (not res!217958) (not e!232647))))

(assert (=> b!382954 (= res!217958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179795 mask!970))))

(assert (=> b!382954 (= lt!179795 (array!22503 (store (arr!10719 _keys!658) i!548 k0!778) (size!11071 _keys!658)))))

(assert (= (and start!37512 res!217955) b!382942))

(assert (= (and b!382942 res!217963) b!382952))

(assert (= (and b!382952 res!217960) b!382943))

(assert (= (and b!382943 res!217959) b!382947))

(assert (= (and b!382947 res!217964) b!382951))

(assert (= (and b!382951 res!217962) b!382949))

(assert (= (and b!382949 res!217954) b!382945))

(assert (= (and b!382945 res!217956) b!382954))

(assert (= (and b!382954 res!217958) b!382946))

(assert (= (and b!382946 res!217957) b!382950))

(assert (= (and b!382950 (not res!217961)) b!382941))

(assert (= (and b!382953 condMapEmpty!15516) mapIsEmpty!15516))

(assert (= (and b!382953 (not condMapEmpty!15516)) mapNonEmpty!15516))

(get-info :version)

(assert (= (and mapNonEmpty!15516 ((_ is ValueCellFull!4307) mapValue!15516)) b!382944))

(assert (= (and b!382953 ((_ is ValueCellFull!4307) mapDefault!15516)) b!382948))

(assert (= start!37512 b!382953))

(declare-fun m!379991 () Bool)

(assert (=> b!382943 m!379991))

(declare-fun m!379993 () Bool)

(assert (=> b!382946 m!379993))

(declare-fun m!379995 () Bool)

(assert (=> b!382949 m!379995))

(declare-fun m!379997 () Bool)

(assert (=> mapNonEmpty!15516 m!379997))

(declare-fun m!379999 () Bool)

(assert (=> b!382950 m!379999))

(declare-fun m!380001 () Bool)

(assert (=> b!382950 m!380001))

(declare-fun m!380003 () Bool)

(assert (=> b!382950 m!380003))

(declare-fun m!380005 () Bool)

(assert (=> b!382950 m!380005))

(declare-fun m!380007 () Bool)

(assert (=> b!382950 m!380007))

(declare-fun m!380009 () Bool)

(assert (=> b!382950 m!380009))

(declare-fun m!380011 () Bool)

(assert (=> b!382950 m!380011))

(declare-fun m!380013 () Bool)

(assert (=> b!382954 m!380013))

(declare-fun m!380015 () Bool)

(assert (=> b!382954 m!380015))

(declare-fun m!380017 () Bool)

(assert (=> b!382951 m!380017))

(declare-fun m!380019 () Bool)

(assert (=> b!382952 m!380019))

(declare-fun m!380021 () Bool)

(assert (=> b!382945 m!380021))

(declare-fun m!380023 () Bool)

(assert (=> start!37512 m!380023))

(declare-fun m!380025 () Bool)

(assert (=> start!37512 m!380025))

(declare-fun m!380027 () Bool)

(assert (=> start!37512 m!380027))

(check-sat (not start!37512) (not b!382952) (not b!382951) (not b!382945) (not b!382950) (not b!382954) (not b_next!8653) b_and!15909 (not mapNonEmpty!15516) tp_is_empty!9301 (not b!382946) (not b!382943))
(check-sat b_and!15909 (not b_next!8653))
