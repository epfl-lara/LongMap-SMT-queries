; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37560 () Bool)

(assert start!37560)

(declare-fun b_free!8701 () Bool)

(declare-fun b_next!8701 () Bool)

(assert (=> start!37560 (= b_free!8701 (not b_next!8701))))

(declare-fun tp!30819 () Bool)

(declare-fun b_and!15957 () Bool)

(assert (=> start!37560 (= tp!30819 b_and!15957)))

(declare-fun res!218747 () Bool)

(declare-fun e!233152 () Bool)

(assert (=> start!37560 (=> (not res!218747) (not e!233152))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37560 (= res!218747 (validMask!0 mask!970))))

(assert (=> start!37560 e!233152))

(declare-datatypes ((V!13571 0))(
  ( (V!13572 (val!4719 Int)) )
))
(declare-datatypes ((ValueCell!4331 0))(
  ( (ValueCellFull!4331 (v!6917 V!13571)) (EmptyCell!4331) )
))
(declare-datatypes ((array!22592 0))(
  ( (array!22593 (arr!10764 (Array (_ BitVec 32) ValueCell!4331)) (size!11116 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22592)

(declare-fun e!233149 () Bool)

(declare-fun array_inv!7964 (array!22592) Bool)

(assert (=> start!37560 (and (array_inv!7964 _values!506) e!233149)))

(assert (=> start!37560 tp!30819))

(assert (=> start!37560 true))

(declare-fun tp_is_empty!9349 () Bool)

(assert (=> start!37560 tp_is_empty!9349))

(declare-datatypes ((array!22594 0))(
  ( (array!22595 (arr!10765 (Array (_ BitVec 32) (_ BitVec 64))) (size!11117 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22594)

(declare-fun array_inv!7965 (array!22594) Bool)

(assert (=> start!37560 (array_inv!7965 _keys!658)))

(declare-fun mapIsEmpty!15588 () Bool)

(declare-fun mapRes!15588 () Bool)

(assert (=> mapIsEmpty!15588 mapRes!15588))

(declare-fun b!383949 () Bool)

(declare-fun res!218753 () Bool)

(assert (=> b!383949 (=> (not res!218753) (not e!233152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22594 (_ BitVec 32)) Bool)

(assert (=> b!383949 (= res!218753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383950 () Bool)

(declare-fun res!218756 () Bool)

(assert (=> b!383950 (=> (not res!218756) (not e!233152))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383950 (= res!218756 (or (= (select (arr!10765 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10765 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383951 () Bool)

(declare-fun res!218748 () Bool)

(assert (=> b!383951 (=> (not res!218748) (not e!233152))))

(declare-datatypes ((List!6064 0))(
  ( (Nil!6061) (Cons!6060 (h!6916 (_ BitVec 64)) (t!11206 List!6064)) )
))
(declare-fun arrayNoDuplicates!0 (array!22594 (_ BitVec 32) List!6064) Bool)

(assert (=> b!383951 (= res!218748 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6061))))

(declare-fun b!383952 () Bool)

(declare-fun e!233150 () Bool)

(assert (=> b!383952 (= e!233150 tp_is_empty!9349)))

(declare-fun b!383953 () Bool)

(declare-fun res!218754 () Bool)

(assert (=> b!383953 (=> (not res!218754) (not e!233152))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383953 (= res!218754 (and (= (size!11116 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11117 _keys!658) (size!11116 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383954 () Bool)

(declare-fun res!218750 () Bool)

(assert (=> b!383954 (=> (not res!218750) (not e!233152))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383954 (= res!218750 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15588 () Bool)

(declare-fun tp!30818 () Bool)

(assert (=> mapNonEmpty!15588 (= mapRes!15588 (and tp!30818 e!233150))))

(declare-fun mapKey!15588 () (_ BitVec 32))

(declare-fun mapValue!15588 () ValueCell!4331)

(declare-fun mapRest!15588 () (Array (_ BitVec 32) ValueCell!4331))

(assert (=> mapNonEmpty!15588 (= (arr!10764 _values!506) (store mapRest!15588 mapKey!15588 mapValue!15588))))

(declare-fun b!383955 () Bool)

(declare-fun e!233153 () Bool)

(assert (=> b!383955 (= e!233152 e!233153)))

(declare-fun res!218755 () Bool)

(assert (=> b!383955 (=> (not res!218755) (not e!233153))))

(declare-fun lt!180578 () array!22594)

(assert (=> b!383955 (= res!218755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180578 mask!970))))

(assert (=> b!383955 (= lt!180578 (array!22595 (store (arr!10765 _keys!658) i!548 k0!778) (size!11117 _keys!658)))))

(declare-fun b!383956 () Bool)

(declare-fun res!218751 () Bool)

(assert (=> b!383956 (=> (not res!218751) (not e!233152))))

(declare-fun arrayContainsKey!0 (array!22594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383956 (= res!218751 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383957 () Bool)

(declare-fun res!218746 () Bool)

(assert (=> b!383957 (=> (not res!218746) (not e!233152))))

(assert (=> b!383957 (= res!218746 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11117 _keys!658))))))

(declare-fun b!383958 () Bool)

(declare-fun res!218752 () Bool)

(assert (=> b!383958 (=> (not res!218752) (not e!233153))))

(assert (=> b!383958 (= res!218752 (arrayNoDuplicates!0 lt!180578 #b00000000000000000000000000000000 Nil!6061))))

(declare-fun b!383959 () Bool)

(declare-fun e!233154 () Bool)

(assert (=> b!383959 (= e!233149 (and e!233154 mapRes!15588))))

(declare-fun condMapEmpty!15588 () Bool)

(declare-fun mapDefault!15588 () ValueCell!4331)

(assert (=> b!383959 (= condMapEmpty!15588 (= (arr!10764 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4331)) mapDefault!15588)))))

(declare-fun b!383960 () Bool)

(assert (=> b!383960 (= e!233154 tp_is_empty!9349)))

(declare-fun b!383961 () Bool)

(declare-fun e!233148 () Bool)

(assert (=> b!383961 (= e!233148 true)))

(declare-datatypes ((tuple2!6226 0))(
  ( (tuple2!6227 (_1!3124 (_ BitVec 64)) (_2!3124 V!13571)) )
))
(declare-datatypes ((List!6065 0))(
  ( (Nil!6062) (Cons!6061 (h!6917 tuple2!6226) (t!11207 List!6065)) )
))
(declare-datatypes ((ListLongMap!5141 0))(
  ( (ListLongMap!5142 (toList!2586 List!6065)) )
))
(declare-fun lt!180583 () ListLongMap!5141)

(declare-fun lt!180576 () ListLongMap!5141)

(declare-fun lt!180573 () tuple2!6226)

(declare-fun +!978 (ListLongMap!5141 tuple2!6226) ListLongMap!5141)

(assert (=> b!383961 (= lt!180583 (+!978 lt!180576 lt!180573))))

(declare-fun lt!180581 () ListLongMap!5141)

(declare-fun lt!180579 () ListLongMap!5141)

(assert (=> b!383961 (= lt!180581 lt!180579)))

(declare-fun b!383962 () Bool)

(assert (=> b!383962 (= e!233153 (not e!233148))))

(declare-fun res!218749 () Bool)

(assert (=> b!383962 (=> res!218749 e!233148)))

(declare-fun lt!180574 () Bool)

(assert (=> b!383962 (= res!218749 (or (and (not lt!180574) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180574) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180574)))))

(assert (=> b!383962 (= lt!180574 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13571)

(declare-fun minValue!472 () V!13571)

(declare-fun getCurrentListMap!2018 (array!22594 array!22592 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!383962 (= lt!180576 (getCurrentListMap!2018 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180577 () array!22592)

(assert (=> b!383962 (= lt!180581 (getCurrentListMap!2018 lt!180578 lt!180577 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180582 () ListLongMap!5141)

(assert (=> b!383962 (and (= lt!180579 lt!180582) (= lt!180582 lt!180579))))

(declare-fun lt!180575 () ListLongMap!5141)

(assert (=> b!383962 (= lt!180582 (+!978 lt!180575 lt!180573))))

(declare-fun v!373 () V!13571)

(assert (=> b!383962 (= lt!180573 (tuple2!6227 k0!778 v!373))))

(declare-datatypes ((Unit!11831 0))(
  ( (Unit!11832) )
))
(declare-fun lt!180580 () Unit!11831)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 (array!22594 array!22592 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) (_ BitVec 64) V!13571 (_ BitVec 32) Int) Unit!11831)

(assert (=> b!383962 (= lt!180580 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!865 (array!22594 array!22592 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!383962 (= lt!180579 (getCurrentListMapNoExtraKeys!865 lt!180578 lt!180577 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383962 (= lt!180577 (array!22593 (store (arr!10764 _values!506) i!548 (ValueCellFull!4331 v!373)) (size!11116 _values!506)))))

(assert (=> b!383962 (= lt!180575 (getCurrentListMapNoExtraKeys!865 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37560 res!218747) b!383953))

(assert (= (and b!383953 res!218754) b!383949))

(assert (= (and b!383949 res!218753) b!383951))

(assert (= (and b!383951 res!218748) b!383957))

(assert (= (and b!383957 res!218746) b!383954))

(assert (= (and b!383954 res!218750) b!383950))

(assert (= (and b!383950 res!218756) b!383956))

(assert (= (and b!383956 res!218751) b!383955))

(assert (= (and b!383955 res!218755) b!383958))

(assert (= (and b!383958 res!218752) b!383962))

(assert (= (and b!383962 (not res!218749)) b!383961))

(assert (= (and b!383959 condMapEmpty!15588) mapIsEmpty!15588))

(assert (= (and b!383959 (not condMapEmpty!15588)) mapNonEmpty!15588))

(get-info :version)

(assert (= (and mapNonEmpty!15588 ((_ is ValueCellFull!4331) mapValue!15588)) b!383952))

(assert (= (and b!383959 ((_ is ValueCellFull!4331) mapDefault!15588)) b!383960))

(assert (= start!37560 b!383959))

(declare-fun m!380945 () Bool)

(assert (=> start!37560 m!380945))

(declare-fun m!380947 () Bool)

(assert (=> start!37560 m!380947))

(declare-fun m!380949 () Bool)

(assert (=> start!37560 m!380949))

(declare-fun m!380951 () Bool)

(assert (=> b!383958 m!380951))

(declare-fun m!380953 () Bool)

(assert (=> b!383961 m!380953))

(declare-fun m!380955 () Bool)

(assert (=> b!383962 m!380955))

(declare-fun m!380957 () Bool)

(assert (=> b!383962 m!380957))

(declare-fun m!380959 () Bool)

(assert (=> b!383962 m!380959))

(declare-fun m!380961 () Bool)

(assert (=> b!383962 m!380961))

(declare-fun m!380963 () Bool)

(assert (=> b!383962 m!380963))

(declare-fun m!380965 () Bool)

(assert (=> b!383962 m!380965))

(declare-fun m!380967 () Bool)

(assert (=> b!383962 m!380967))

(declare-fun m!380969 () Bool)

(assert (=> mapNonEmpty!15588 m!380969))

(declare-fun m!380971 () Bool)

(assert (=> b!383950 m!380971))

(declare-fun m!380973 () Bool)

(assert (=> b!383949 m!380973))

(declare-fun m!380975 () Bool)

(assert (=> b!383955 m!380975))

(declare-fun m!380977 () Bool)

(assert (=> b!383955 m!380977))

(declare-fun m!380979 () Bool)

(assert (=> b!383954 m!380979))

(declare-fun m!380981 () Bool)

(assert (=> b!383956 m!380981))

(declare-fun m!380983 () Bool)

(assert (=> b!383951 m!380983))

(check-sat (not b!383954) (not b!383955) (not mapNonEmpty!15588) (not b!383949) (not b!383958) (not b!383961) (not start!37560) (not b!383951) tp_is_empty!9349 b_and!15957 (not b!383956) (not b!383962) (not b_next!8701))
(check-sat b_and!15957 (not b_next!8701))
