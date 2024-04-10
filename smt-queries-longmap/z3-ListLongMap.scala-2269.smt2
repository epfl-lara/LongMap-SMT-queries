; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37078 () Bool)

(assert start!37078)

(declare-fun b_free!8205 () Bool)

(declare-fun b_next!8205 () Bool)

(assert (=> start!37078 (= b_free!8205 (not b_next!8205))))

(declare-fun tp!29330 () Bool)

(declare-fun b_and!15447 () Bool)

(assert (=> start!37078 (= tp!29330 b_and!15447)))

(declare-fun b!373052 () Bool)

(declare-fun e!227466 () Bool)

(declare-fun tp_is_empty!8853 () Bool)

(assert (=> b!373052 (= e!227466 tp_is_empty!8853)))

(declare-fun b!373053 () Bool)

(declare-fun res!210047 () Bool)

(declare-fun e!227468 () Bool)

(assert (=> b!373053 (=> (not res!210047) (not e!227468))))

(declare-datatypes ((array!21647 0))(
  ( (array!21648 (arr!10292 (Array (_ BitVec 32) (_ BitVec 64))) (size!10644 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21647)

(declare-datatypes ((List!5776 0))(
  ( (Nil!5773) (Cons!5772 (h!6628 (_ BitVec 64)) (t!10926 List!5776)) )
))
(declare-fun arrayNoDuplicates!0 (array!21647 (_ BitVec 32) List!5776) Bool)

(assert (=> b!373053 (= res!210047 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5773))))

(declare-fun b!373054 () Bool)

(declare-fun res!210044 () Bool)

(assert (=> b!373054 (=> (not res!210044) (not e!227468))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373054 (= res!210044 (or (= (select (arr!10292 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10292 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!210045 () Bool)

(assert (=> start!37078 (=> (not res!210045) (not e!227468))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37078 (= res!210045 (validMask!0 mask!970))))

(assert (=> start!37078 e!227468))

(declare-datatypes ((V!12909 0))(
  ( (V!12910 (val!4471 Int)) )
))
(declare-datatypes ((ValueCell!4083 0))(
  ( (ValueCellFull!4083 (v!6668 V!12909)) (EmptyCell!4083) )
))
(declare-datatypes ((array!21649 0))(
  ( (array!21650 (arr!10293 (Array (_ BitVec 32) ValueCell!4083)) (size!10645 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21649)

(declare-fun e!227465 () Bool)

(declare-fun array_inv!7590 (array!21649) Bool)

(assert (=> start!37078 (and (array_inv!7590 _values!506) e!227465)))

(assert (=> start!37078 tp!29330))

(assert (=> start!37078 true))

(assert (=> start!37078 tp_is_empty!8853))

(declare-fun array_inv!7591 (array!21647) Bool)

(assert (=> start!37078 (array_inv!7591 _keys!658)))

(declare-fun b!373055 () Bool)

(declare-fun res!210041 () Bool)

(assert (=> b!373055 (=> (not res!210041) (not e!227468))))

(assert (=> b!373055 (= res!210041 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10644 _keys!658))))))

(declare-fun b!373056 () Bool)

(declare-fun res!210040 () Bool)

(declare-fun e!227470 () Bool)

(assert (=> b!373056 (=> (not res!210040) (not e!227470))))

(declare-datatypes ((tuple2!5930 0))(
  ( (tuple2!5931 (_1!2976 (_ BitVec 64)) (_2!2976 V!12909)) )
))
(declare-datatypes ((List!5777 0))(
  ( (Nil!5774) (Cons!5773 (h!6629 tuple2!5930) (t!10927 List!5777)) )
))
(declare-datatypes ((ListLongMap!4843 0))(
  ( (ListLongMap!4844 (toList!2437 List!5777)) )
))
(declare-fun lt!171093 () ListLongMap!4843)

(declare-fun lt!171088 () ListLongMap!4843)

(declare-fun lt!171090 () tuple2!5930)

(declare-fun lt!171095 () tuple2!5930)

(declare-fun +!783 (ListLongMap!4843 tuple2!5930) ListLongMap!4843)

(assert (=> b!373056 (= res!210040 (= lt!171093 (+!783 (+!783 lt!171088 lt!171095) lt!171090)))))

(declare-fun b!373057 () Bool)

(declare-fun res!210042 () Bool)

(assert (=> b!373057 (=> (not res!210042) (not e!227468))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373057 (= res!210042 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373058 () Bool)

(declare-fun e!227469 () Bool)

(declare-fun e!227467 () Bool)

(assert (=> b!373058 (= e!227469 (not e!227467))))

(declare-fun res!210036 () Bool)

(assert (=> b!373058 (=> res!210036 e!227467)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373058 (= res!210036 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!12909)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12909)

(declare-fun getCurrentListMap!1880 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12909 V!12909 (_ BitVec 32) Int) ListLongMap!4843)

(assert (=> b!373058 (= lt!171093 (getCurrentListMap!1880 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171092 () array!21647)

(declare-fun lt!171089 () array!21649)

(declare-fun lt!171094 () ListLongMap!4843)

(assert (=> b!373058 (= lt!171094 (getCurrentListMap!1880 lt!171092 lt!171089 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171091 () ListLongMap!4843)

(declare-fun lt!171087 () ListLongMap!4843)

(assert (=> b!373058 (and (= lt!171091 lt!171087) (= lt!171087 lt!171091))))

(declare-fun v!373 () V!12909)

(assert (=> b!373058 (= lt!171087 (+!783 lt!171088 (tuple2!5931 k0!778 v!373)))))

(declare-datatypes ((Unit!11472 0))(
  ( (Unit!11473) )
))
(declare-fun lt!171096 () Unit!11472)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12909 V!12909 (_ BitVec 32) (_ BitVec 64) V!12909 (_ BitVec 32) Int) Unit!11472)

(assert (=> b!373058 (= lt!171096 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!714 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12909 V!12909 (_ BitVec 32) Int) ListLongMap!4843)

(assert (=> b!373058 (= lt!171091 (getCurrentListMapNoExtraKeys!714 lt!171092 lt!171089 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373058 (= lt!171089 (array!21650 (store (arr!10293 _values!506) i!548 (ValueCellFull!4083 v!373)) (size!10645 _values!506)))))

(assert (=> b!373058 (= lt!171088 (getCurrentListMapNoExtraKeys!714 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373059 () Bool)

(assert (=> b!373059 (= e!227468 e!227469)))

(declare-fun res!210043 () Bool)

(assert (=> b!373059 (=> (not res!210043) (not e!227469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21647 (_ BitVec 32)) Bool)

(assert (=> b!373059 (= res!210043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171092 mask!970))))

(assert (=> b!373059 (= lt!171092 (array!21648 (store (arr!10292 _keys!658) i!548 k0!778) (size!10644 _keys!658)))))

(declare-fun mapNonEmpty!14844 () Bool)

(declare-fun mapRes!14844 () Bool)

(declare-fun tp!29331 () Bool)

(assert (=> mapNonEmpty!14844 (= mapRes!14844 (and tp!29331 e!227466))))

(declare-fun mapKey!14844 () (_ BitVec 32))

(declare-fun mapValue!14844 () ValueCell!4083)

(declare-fun mapRest!14844 () (Array (_ BitVec 32) ValueCell!4083))

(assert (=> mapNonEmpty!14844 (= (arr!10293 _values!506) (store mapRest!14844 mapKey!14844 mapValue!14844))))

(declare-fun b!373060 () Bool)

(declare-fun res!210038 () Bool)

(assert (=> b!373060 (=> (not res!210038) (not e!227468))))

(assert (=> b!373060 (= res!210038 (and (= (size!10645 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10644 _keys!658) (size!10645 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373061 () Bool)

(declare-fun e!227464 () Bool)

(assert (=> b!373061 (= e!227465 (and e!227464 mapRes!14844))))

(declare-fun condMapEmpty!14844 () Bool)

(declare-fun mapDefault!14844 () ValueCell!4083)

(assert (=> b!373061 (= condMapEmpty!14844 (= (arr!10293 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4083)) mapDefault!14844)))))

(declare-fun b!373062 () Bool)

(declare-fun res!210037 () Bool)

(assert (=> b!373062 (=> (not res!210037) (not e!227468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373062 (= res!210037 (validKeyInArray!0 k0!778))))

(declare-fun b!373063 () Bool)

(declare-fun res!210046 () Bool)

(assert (=> b!373063 (=> (not res!210046) (not e!227468))))

(assert (=> b!373063 (= res!210046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373064 () Bool)

(declare-fun res!210039 () Bool)

(assert (=> b!373064 (=> (not res!210039) (not e!227469))))

(assert (=> b!373064 (= res!210039 (arrayNoDuplicates!0 lt!171092 #b00000000000000000000000000000000 Nil!5773))))

(declare-fun b!373065 () Bool)

(assert (=> b!373065 (= e!227470 (= lt!171094 (+!783 (+!783 lt!171087 lt!171095) lt!171090)))))

(declare-fun b!373066 () Bool)

(assert (=> b!373066 (= e!227467 true)))

(assert (=> b!373066 e!227470))

(declare-fun res!210035 () Bool)

(assert (=> b!373066 (=> (not res!210035) (not e!227470))))

(assert (=> b!373066 (= res!210035 (= lt!171094 (+!783 (+!783 lt!171091 lt!171095) lt!171090)))))

(assert (=> b!373066 (= lt!171090 (tuple2!5931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373066 (= lt!171095 (tuple2!5931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373067 () Bool)

(assert (=> b!373067 (= e!227464 tp_is_empty!8853)))

(declare-fun mapIsEmpty!14844 () Bool)

(assert (=> mapIsEmpty!14844 mapRes!14844))

(assert (= (and start!37078 res!210045) b!373060))

(assert (= (and b!373060 res!210038) b!373063))

(assert (= (and b!373063 res!210046) b!373053))

(assert (= (and b!373053 res!210047) b!373055))

(assert (= (and b!373055 res!210041) b!373062))

(assert (= (and b!373062 res!210037) b!373054))

(assert (= (and b!373054 res!210044) b!373057))

(assert (= (and b!373057 res!210042) b!373059))

(assert (= (and b!373059 res!210043) b!373064))

(assert (= (and b!373064 res!210039) b!373058))

(assert (= (and b!373058 (not res!210036)) b!373066))

(assert (= (and b!373066 res!210035) b!373056))

(assert (= (and b!373056 res!210040) b!373065))

(assert (= (and b!373061 condMapEmpty!14844) mapIsEmpty!14844))

(assert (= (and b!373061 (not condMapEmpty!14844)) mapNonEmpty!14844))

(get-info :version)

(assert (= (and mapNonEmpty!14844 ((_ is ValueCellFull!4083) mapValue!14844)) b!373052))

(assert (= (and b!373061 ((_ is ValueCellFull!4083) mapDefault!14844)) b!373067))

(assert (= start!37078 b!373061))

(declare-fun m!368873 () Bool)

(assert (=> b!373065 m!368873))

(assert (=> b!373065 m!368873))

(declare-fun m!368875 () Bool)

(assert (=> b!373065 m!368875))

(declare-fun m!368877 () Bool)

(assert (=> b!373066 m!368877))

(assert (=> b!373066 m!368877))

(declare-fun m!368879 () Bool)

(assert (=> b!373066 m!368879))

(declare-fun m!368881 () Bool)

(assert (=> b!373063 m!368881))

(declare-fun m!368883 () Bool)

(assert (=> mapNonEmpty!14844 m!368883))

(declare-fun m!368885 () Bool)

(assert (=> b!373056 m!368885))

(assert (=> b!373056 m!368885))

(declare-fun m!368887 () Bool)

(assert (=> b!373056 m!368887))

(declare-fun m!368889 () Bool)

(assert (=> b!373062 m!368889))

(declare-fun m!368891 () Bool)

(assert (=> b!373064 m!368891))

(declare-fun m!368893 () Bool)

(assert (=> b!373059 m!368893))

(declare-fun m!368895 () Bool)

(assert (=> b!373059 m!368895))

(declare-fun m!368897 () Bool)

(assert (=> b!373054 m!368897))

(declare-fun m!368899 () Bool)

(assert (=> b!373057 m!368899))

(declare-fun m!368901 () Bool)

(assert (=> start!37078 m!368901))

(declare-fun m!368903 () Bool)

(assert (=> start!37078 m!368903))

(declare-fun m!368905 () Bool)

(assert (=> start!37078 m!368905))

(declare-fun m!368907 () Bool)

(assert (=> b!373058 m!368907))

(declare-fun m!368909 () Bool)

(assert (=> b!373058 m!368909))

(declare-fun m!368911 () Bool)

(assert (=> b!373058 m!368911))

(declare-fun m!368913 () Bool)

(assert (=> b!373058 m!368913))

(declare-fun m!368915 () Bool)

(assert (=> b!373058 m!368915))

(declare-fun m!368917 () Bool)

(assert (=> b!373058 m!368917))

(declare-fun m!368919 () Bool)

(assert (=> b!373058 m!368919))

(declare-fun m!368921 () Bool)

(assert (=> b!373053 m!368921))

(check-sat b_and!15447 tp_is_empty!8853 (not b_next!8205) (not b!373064) (not b!373059) (not b!373058) (not b!373063) (not b!373062) (not b!373057) (not mapNonEmpty!14844) (not b!373056) (not b!373053) (not b!373066) (not b!373065) (not start!37078))
(check-sat b_and!15447 (not b_next!8205))
