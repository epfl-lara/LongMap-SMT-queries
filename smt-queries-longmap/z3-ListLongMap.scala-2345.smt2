; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37518 () Bool)

(assert start!37518)

(declare-fun b_free!8659 () Bool)

(declare-fun b_next!8659 () Bool)

(assert (=> start!37518 (= b_free!8659 (not b_next!8659))))

(declare-fun tp!30692 () Bool)

(declare-fun b_and!15915 () Bool)

(assert (=> start!37518 (= tp!30692 b_and!15915)))

(declare-fun mapNonEmpty!15525 () Bool)

(declare-fun mapRes!15525 () Bool)

(declare-fun tp!30693 () Bool)

(declare-fun e!232713 () Bool)

(assert (=> mapNonEmpty!15525 (= mapRes!15525 (and tp!30693 e!232713))))

(declare-datatypes ((V!13515 0))(
  ( (V!13516 (val!4698 Int)) )
))
(declare-datatypes ((ValueCell!4310 0))(
  ( (ValueCellFull!4310 (v!6896 V!13515)) (EmptyCell!4310) )
))
(declare-datatypes ((array!22512 0))(
  ( (array!22513 (arr!10724 (Array (_ BitVec 32) ValueCell!4310)) (size!11076 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22512)

(declare-fun mapRest!15525 () (Array (_ BitVec 32) ValueCell!4310))

(declare-fun mapValue!15525 () ValueCell!4310)

(declare-fun mapKey!15525 () (_ BitVec 32))

(assert (=> mapNonEmpty!15525 (= (arr!10724 _values!506) (store mapRest!15525 mapKey!15525 mapValue!15525))))

(declare-fun res!218062 () Bool)

(declare-fun e!232709 () Bool)

(assert (=> start!37518 (=> (not res!218062) (not e!232709))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37518 (= res!218062 (validMask!0 mask!970))))

(assert (=> start!37518 e!232709))

(declare-fun e!232708 () Bool)

(declare-fun array_inv!7936 (array!22512) Bool)

(assert (=> start!37518 (and (array_inv!7936 _values!506) e!232708)))

(assert (=> start!37518 tp!30692))

(assert (=> start!37518 true))

(declare-fun tp_is_empty!9307 () Bool)

(assert (=> start!37518 tp_is_empty!9307))

(declare-datatypes ((array!22514 0))(
  ( (array!22515 (arr!10725 (Array (_ BitVec 32) (_ BitVec 64))) (size!11077 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22514)

(declare-fun array_inv!7937 (array!22514) Bool)

(assert (=> start!37518 (array_inv!7937 _keys!658)))

(declare-fun b!383067 () Bool)

(declare-fun res!218054 () Bool)

(assert (=> b!383067 (=> (not res!218054) (not e!232709))))

(declare-datatypes ((List!6032 0))(
  ( (Nil!6029) (Cons!6028 (h!6884 (_ BitVec 64)) (t!11174 List!6032)) )
))
(declare-fun arrayNoDuplicates!0 (array!22514 (_ BitVec 32) List!6032) Bool)

(assert (=> b!383067 (= res!218054 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6029))))

(declare-fun mapIsEmpty!15525 () Bool)

(assert (=> mapIsEmpty!15525 mapRes!15525))

(declare-fun b!383068 () Bool)

(declare-fun e!232707 () Bool)

(assert (=> b!383068 (= e!232707 tp_is_empty!9307)))

(declare-fun b!383069 () Bool)

(declare-fun res!218061 () Bool)

(assert (=> b!383069 (=> (not res!218061) (not e!232709))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383069 (= res!218061 (or (= (select (arr!10725 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10725 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383070 () Bool)

(declare-fun res!218060 () Bool)

(declare-fun e!232711 () Bool)

(assert (=> b!383070 (=> (not res!218060) (not e!232711))))

(declare-fun lt!179890 () array!22514)

(assert (=> b!383070 (= res!218060 (arrayNoDuplicates!0 lt!179890 #b00000000000000000000000000000000 Nil!6029))))

(declare-fun b!383071 () Bool)

(declare-fun res!218055 () Bool)

(assert (=> b!383071 (=> (not res!218055) (not e!232709))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383071 (= res!218055 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383072 () Bool)

(assert (=> b!383072 (= e!232713 tp_is_empty!9307)))

(declare-fun b!383073 () Bool)

(assert (=> b!383073 (= e!232709 e!232711)))

(declare-fun res!218056 () Bool)

(assert (=> b!383073 (=> (not res!218056) (not e!232711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22514 (_ BitVec 32)) Bool)

(assert (=> b!383073 (= res!218056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179890 mask!970))))

(assert (=> b!383073 (= lt!179890 (array!22515 (store (arr!10725 _keys!658) i!548 k0!778) (size!11077 _keys!658)))))

(declare-fun b!383074 () Bool)

(declare-fun res!218058 () Bool)

(assert (=> b!383074 (=> (not res!218058) (not e!232709))))

(assert (=> b!383074 (= res!218058 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11077 _keys!658))))))

(declare-fun b!383075 () Bool)

(declare-fun res!218063 () Bool)

(assert (=> b!383075 (=> (not res!218063) (not e!232709))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383075 (= res!218063 (and (= (size!11076 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11077 _keys!658) (size!11076 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383076 () Bool)

(declare-fun e!232712 () Bool)

(assert (=> b!383076 (= e!232711 (not e!232712))))

(declare-fun res!218057 () Bool)

(assert (=> b!383076 (=> res!218057 e!232712)))

(declare-fun lt!179889 () Bool)

(assert (=> b!383076 (= res!218057 (or (and (not lt!179889) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179889) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179889)))))

(assert (=> b!383076 (= lt!179889 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6196 0))(
  ( (tuple2!6197 (_1!3109 (_ BitVec 64)) (_2!3109 V!13515)) )
))
(declare-datatypes ((List!6033 0))(
  ( (Nil!6030) (Cons!6029 (h!6885 tuple2!6196) (t!11175 List!6033)) )
))
(declare-datatypes ((ListLongMap!5111 0))(
  ( (ListLongMap!5112 (toList!2571 List!6033)) )
))
(declare-fun lt!179884 () ListLongMap!5111)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13515)

(declare-fun minValue!472 () V!13515)

(declare-fun getCurrentListMap!2005 (array!22514 array!22512 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5111)

(assert (=> b!383076 (= lt!179884 (getCurrentListMap!2005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179880 () array!22512)

(declare-fun lt!179885 () ListLongMap!5111)

(assert (=> b!383076 (= lt!179885 (getCurrentListMap!2005 lt!179890 lt!179880 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179882 () ListLongMap!5111)

(declare-fun lt!179888 () ListLongMap!5111)

(assert (=> b!383076 (and (= lt!179882 lt!179888) (= lt!179888 lt!179882))))

(declare-fun lt!179883 () ListLongMap!5111)

(declare-fun lt!179887 () tuple2!6196)

(declare-fun +!963 (ListLongMap!5111 tuple2!6196) ListLongMap!5111)

(assert (=> b!383076 (= lt!179888 (+!963 lt!179883 lt!179887))))

(declare-fun v!373 () V!13515)

(assert (=> b!383076 (= lt!179887 (tuple2!6197 k0!778 v!373))))

(declare-datatypes ((Unit!11805 0))(
  ( (Unit!11806) )
))
(declare-fun lt!179881 () Unit!11805)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!192 (array!22514 array!22512 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) (_ BitVec 64) V!13515 (_ BitVec 32) Int) Unit!11805)

(assert (=> b!383076 (= lt!179881 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!192 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!852 (array!22514 array!22512 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5111)

(assert (=> b!383076 (= lt!179882 (getCurrentListMapNoExtraKeys!852 lt!179890 lt!179880 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383076 (= lt!179880 (array!22513 (store (arr!10724 _values!506) i!548 (ValueCellFull!4310 v!373)) (size!11076 _values!506)))))

(assert (=> b!383076 (= lt!179883 (getCurrentListMapNoExtraKeys!852 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383077 () Bool)

(declare-fun res!218053 () Bool)

(assert (=> b!383077 (=> (not res!218053) (not e!232709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383077 (= res!218053 (validKeyInArray!0 k0!778))))

(declare-fun b!383078 () Bool)

(assert (=> b!383078 (= e!232712 true)))

(declare-fun lt!179886 () ListLongMap!5111)

(assert (=> b!383078 (= lt!179886 (+!963 lt!179884 lt!179887))))

(assert (=> b!383078 (= lt!179885 lt!179882)))

(declare-fun b!383079 () Bool)

(declare-fun res!218059 () Bool)

(assert (=> b!383079 (=> (not res!218059) (not e!232709))))

(assert (=> b!383079 (= res!218059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383080 () Bool)

(assert (=> b!383080 (= e!232708 (and e!232707 mapRes!15525))))

(declare-fun condMapEmpty!15525 () Bool)

(declare-fun mapDefault!15525 () ValueCell!4310)

(assert (=> b!383080 (= condMapEmpty!15525 (= (arr!10724 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4310)) mapDefault!15525)))))

(assert (= (and start!37518 res!218062) b!383075))

(assert (= (and b!383075 res!218063) b!383079))

(assert (= (and b!383079 res!218059) b!383067))

(assert (= (and b!383067 res!218054) b!383074))

(assert (= (and b!383074 res!218058) b!383077))

(assert (= (and b!383077 res!218053) b!383069))

(assert (= (and b!383069 res!218061) b!383071))

(assert (= (and b!383071 res!218055) b!383073))

(assert (= (and b!383073 res!218056) b!383070))

(assert (= (and b!383070 res!218060) b!383076))

(assert (= (and b!383076 (not res!218057)) b!383078))

(assert (= (and b!383080 condMapEmpty!15525) mapIsEmpty!15525))

(assert (= (and b!383080 (not condMapEmpty!15525)) mapNonEmpty!15525))

(get-info :version)

(assert (= (and mapNonEmpty!15525 ((_ is ValueCellFull!4310) mapValue!15525)) b!383072))

(assert (= (and b!383080 ((_ is ValueCellFull!4310) mapDefault!15525)) b!383068))

(assert (= start!37518 b!383080))

(declare-fun m!380105 () Bool)

(assert (=> b!383071 m!380105))

(declare-fun m!380107 () Bool)

(assert (=> mapNonEmpty!15525 m!380107))

(declare-fun m!380109 () Bool)

(assert (=> b!383077 m!380109))

(declare-fun m!380111 () Bool)

(assert (=> b!383078 m!380111))

(declare-fun m!380113 () Bool)

(assert (=> b!383070 m!380113))

(declare-fun m!380115 () Bool)

(assert (=> b!383076 m!380115))

(declare-fun m!380117 () Bool)

(assert (=> b!383076 m!380117))

(declare-fun m!380119 () Bool)

(assert (=> b!383076 m!380119))

(declare-fun m!380121 () Bool)

(assert (=> b!383076 m!380121))

(declare-fun m!380123 () Bool)

(assert (=> b!383076 m!380123))

(declare-fun m!380125 () Bool)

(assert (=> b!383076 m!380125))

(declare-fun m!380127 () Bool)

(assert (=> b!383076 m!380127))

(declare-fun m!380129 () Bool)

(assert (=> b!383073 m!380129))

(declare-fun m!380131 () Bool)

(assert (=> b!383073 m!380131))

(declare-fun m!380133 () Bool)

(assert (=> b!383069 m!380133))

(declare-fun m!380135 () Bool)

(assert (=> start!37518 m!380135))

(declare-fun m!380137 () Bool)

(assert (=> start!37518 m!380137))

(declare-fun m!380139 () Bool)

(assert (=> start!37518 m!380139))

(declare-fun m!380141 () Bool)

(assert (=> b!383079 m!380141))

(declare-fun m!380143 () Bool)

(assert (=> b!383067 m!380143))

(check-sat tp_is_empty!9307 (not b!383070) b_and!15915 (not b!383079) (not b!383071) (not b!383073) (not mapNonEmpty!15525) (not b!383067) (not b_next!8659) (not start!37518) (not b!383076) (not b!383078) (not b!383077))
(check-sat b_and!15915 (not b_next!8659))
