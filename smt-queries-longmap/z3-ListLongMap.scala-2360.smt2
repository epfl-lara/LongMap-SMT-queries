; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37608 () Bool)

(assert start!37608)

(declare-fun b_free!8749 () Bool)

(declare-fun b_next!8749 () Bool)

(assert (=> start!37608 (= b_free!8749 (not b_next!8749))))

(declare-fun tp!30963 () Bool)

(declare-fun b_and!16005 () Bool)

(assert (=> start!37608 (= tp!30963 b_and!16005)))

(declare-fun b!384966 () Bool)

(declare-fun e!233666 () Bool)

(declare-fun e!233663 () Bool)

(assert (=> b!384966 (= e!233666 e!233663)))

(declare-fun res!219548 () Bool)

(assert (=> b!384966 (=> (not res!219548) (not e!233663))))

(declare-datatypes ((array!22686 0))(
  ( (array!22687 (arr!10811 (Array (_ BitVec 32) (_ BitVec 64))) (size!11163 (_ BitVec 32))) )
))
(declare-fun lt!181356 () array!22686)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22686 (_ BitVec 32)) Bool)

(assert (=> b!384966 (= res!219548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181356 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22686)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384966 (= lt!181356 (array!22687 (store (arr!10811 _keys!658) i!548 k0!778) (size!11163 _keys!658)))))

(declare-fun b!384967 () Bool)

(declare-fun e!233661 () Bool)

(declare-fun tp_is_empty!9397 () Bool)

(assert (=> b!384967 (= e!233661 tp_is_empty!9397)))

(declare-fun mapIsEmpty!15660 () Bool)

(declare-fun mapRes!15660 () Bool)

(assert (=> mapIsEmpty!15660 mapRes!15660))

(declare-fun b!384968 () Bool)

(declare-fun e!233665 () Bool)

(assert (=> b!384968 (= e!233665 (and e!233661 mapRes!15660))))

(declare-fun condMapEmpty!15660 () Bool)

(declare-datatypes ((V!13635 0))(
  ( (V!13636 (val!4743 Int)) )
))
(declare-datatypes ((ValueCell!4355 0))(
  ( (ValueCellFull!4355 (v!6941 V!13635)) (EmptyCell!4355) )
))
(declare-datatypes ((array!22688 0))(
  ( (array!22689 (arr!10812 (Array (_ BitVec 32) ValueCell!4355)) (size!11164 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22688)

(declare-fun mapDefault!15660 () ValueCell!4355)

(assert (=> b!384968 (= condMapEmpty!15660 (= (arr!10812 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4355)) mapDefault!15660)))))

(declare-fun b!384969 () Bool)

(declare-fun res!219555 () Bool)

(assert (=> b!384969 (=> (not res!219555) (not e!233663))))

(declare-datatypes ((List!6095 0))(
  ( (Nil!6092) (Cons!6091 (h!6947 (_ BitVec 64)) (t!11237 List!6095)) )
))
(declare-fun arrayNoDuplicates!0 (array!22686 (_ BitVec 32) List!6095) Bool)

(assert (=> b!384969 (= res!219555 (arrayNoDuplicates!0 lt!181356 #b00000000000000000000000000000000 Nil!6092))))

(declare-fun mapNonEmpty!15660 () Bool)

(declare-fun tp!30962 () Bool)

(declare-fun e!233662 () Bool)

(assert (=> mapNonEmpty!15660 (= mapRes!15660 (and tp!30962 e!233662))))

(declare-fun mapKey!15660 () (_ BitVec 32))

(declare-fun mapRest!15660 () (Array (_ BitVec 32) ValueCell!4355))

(declare-fun mapValue!15660 () ValueCell!4355)

(assert (=> mapNonEmpty!15660 (= (arr!10812 _values!506) (store mapRest!15660 mapKey!15660 mapValue!15660))))

(declare-fun b!384970 () Bool)

(declare-fun res!219551 () Bool)

(assert (=> b!384970 (=> (not res!219551) (not e!233666))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384970 (= res!219551 (and (= (size!11164 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11163 _keys!658) (size!11164 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384971 () Bool)

(declare-fun e!233664 () Bool)

(assert (=> b!384971 (= e!233663 (not e!233664))))

(declare-fun res!219553 () Bool)

(assert (=> b!384971 (=> res!219553 e!233664)))

(declare-fun lt!181362 () Bool)

(assert (=> b!384971 (= res!219553 (or (and (not lt!181362) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181362) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181362)))))

(assert (=> b!384971 (= lt!181362 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13635)

(declare-datatypes ((tuple2!6258 0))(
  ( (tuple2!6259 (_1!3140 (_ BitVec 64)) (_2!3140 V!13635)) )
))
(declare-datatypes ((List!6096 0))(
  ( (Nil!6093) (Cons!6092 (h!6948 tuple2!6258) (t!11238 List!6096)) )
))
(declare-datatypes ((ListLongMap!5173 0))(
  ( (ListLongMap!5174 (toList!2602 List!6096)) )
))
(declare-fun lt!181366 () ListLongMap!5173)

(declare-fun minValue!472 () V!13635)

(declare-fun getCurrentListMap!2032 (array!22686 array!22688 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!384971 (= lt!181366 (getCurrentListMap!2032 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181361 () array!22688)

(declare-fun lt!181365 () ListLongMap!5173)

(assert (=> b!384971 (= lt!181365 (getCurrentListMap!2032 lt!181356 lt!181361 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181364 () ListLongMap!5173)

(declare-fun lt!181359 () ListLongMap!5173)

(assert (=> b!384971 (and (= lt!181364 lt!181359) (= lt!181359 lt!181364))))

(declare-fun lt!181360 () ListLongMap!5173)

(declare-fun lt!181358 () tuple2!6258)

(declare-fun +!994 (ListLongMap!5173 tuple2!6258) ListLongMap!5173)

(assert (=> b!384971 (= lt!181359 (+!994 lt!181360 lt!181358))))

(declare-fun v!373 () V!13635)

(assert (=> b!384971 (= lt!181358 (tuple2!6259 k0!778 v!373))))

(declare-datatypes ((Unit!11859 0))(
  ( (Unit!11860) )
))
(declare-fun lt!181363 () Unit!11859)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!219 (array!22686 array!22688 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) (_ BitVec 64) V!13635 (_ BitVec 32) Int) Unit!11859)

(assert (=> b!384971 (= lt!181363 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!219 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!879 (array!22686 array!22688 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) Int) ListLongMap!5173)

(assert (=> b!384971 (= lt!181364 (getCurrentListMapNoExtraKeys!879 lt!181356 lt!181361 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384971 (= lt!181361 (array!22689 (store (arr!10812 _values!506) i!548 (ValueCellFull!4355 v!373)) (size!11164 _values!506)))))

(assert (=> b!384971 (= lt!181360 (getCurrentListMapNoExtraKeys!879 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384972 () Bool)

(declare-fun res!219552 () Bool)

(assert (=> b!384972 (=> (not res!219552) (not e!233666))))

(assert (=> b!384972 (= res!219552 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11163 _keys!658))))))

(declare-fun b!384973 () Bool)

(declare-fun res!219549 () Bool)

(assert (=> b!384973 (=> (not res!219549) (not e!233666))))

(declare-fun arrayContainsKey!0 (array!22686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384973 (= res!219549 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384974 () Bool)

(declare-fun res!219557 () Bool)

(assert (=> b!384974 (=> (not res!219557) (not e!233666))))

(assert (=> b!384974 (= res!219557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!219550 () Bool)

(assert (=> start!37608 (=> (not res!219550) (not e!233666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37608 (= res!219550 (validMask!0 mask!970))))

(assert (=> start!37608 e!233666))

(declare-fun array_inv!7998 (array!22688) Bool)

(assert (=> start!37608 (and (array_inv!7998 _values!506) e!233665)))

(assert (=> start!37608 tp!30963))

(assert (=> start!37608 true))

(assert (=> start!37608 tp_is_empty!9397))

(declare-fun array_inv!7999 (array!22686) Bool)

(assert (=> start!37608 (array_inv!7999 _keys!658)))

(declare-fun b!384975 () Bool)

(declare-fun res!219547 () Bool)

(assert (=> b!384975 (=> (not res!219547) (not e!233666))))

(assert (=> b!384975 (= res!219547 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6092))))

(declare-fun b!384976 () Bool)

(declare-fun res!219556 () Bool)

(assert (=> b!384976 (=> (not res!219556) (not e!233666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384976 (= res!219556 (validKeyInArray!0 k0!778))))

(declare-fun b!384977 () Bool)

(assert (=> b!384977 (= e!233664 true)))

(declare-fun lt!181357 () ListLongMap!5173)

(assert (=> b!384977 (= lt!181357 (+!994 lt!181366 lt!181358))))

(assert (=> b!384977 (= lt!181365 lt!181364)))

(declare-fun b!384978 () Bool)

(assert (=> b!384978 (= e!233662 tp_is_empty!9397)))

(declare-fun b!384979 () Bool)

(declare-fun res!219554 () Bool)

(assert (=> b!384979 (=> (not res!219554) (not e!233666))))

(assert (=> b!384979 (= res!219554 (or (= (select (arr!10811 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10811 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37608 res!219550) b!384970))

(assert (= (and b!384970 res!219551) b!384974))

(assert (= (and b!384974 res!219557) b!384975))

(assert (= (and b!384975 res!219547) b!384972))

(assert (= (and b!384972 res!219552) b!384976))

(assert (= (and b!384976 res!219556) b!384979))

(assert (= (and b!384979 res!219554) b!384973))

(assert (= (and b!384973 res!219549) b!384966))

(assert (= (and b!384966 res!219548) b!384969))

(assert (= (and b!384969 res!219555) b!384971))

(assert (= (and b!384971 (not res!219553)) b!384977))

(assert (= (and b!384968 condMapEmpty!15660) mapIsEmpty!15660))

(assert (= (and b!384968 (not condMapEmpty!15660)) mapNonEmpty!15660))

(get-info :version)

(assert (= (and mapNonEmpty!15660 ((_ is ValueCellFull!4355) mapValue!15660)) b!384978))

(assert (= (and b!384968 ((_ is ValueCellFull!4355) mapDefault!15660)) b!384967))

(assert (= start!37608 b!384968))

(declare-fun m!381905 () Bool)

(assert (=> mapNonEmpty!15660 m!381905))

(declare-fun m!381907 () Bool)

(assert (=> b!384975 m!381907))

(declare-fun m!381909 () Bool)

(assert (=> b!384979 m!381909))

(declare-fun m!381911 () Bool)

(assert (=> start!37608 m!381911))

(declare-fun m!381913 () Bool)

(assert (=> start!37608 m!381913))

(declare-fun m!381915 () Bool)

(assert (=> start!37608 m!381915))

(declare-fun m!381917 () Bool)

(assert (=> b!384971 m!381917))

(declare-fun m!381919 () Bool)

(assert (=> b!384971 m!381919))

(declare-fun m!381921 () Bool)

(assert (=> b!384971 m!381921))

(declare-fun m!381923 () Bool)

(assert (=> b!384971 m!381923))

(declare-fun m!381925 () Bool)

(assert (=> b!384971 m!381925))

(declare-fun m!381927 () Bool)

(assert (=> b!384971 m!381927))

(declare-fun m!381929 () Bool)

(assert (=> b!384971 m!381929))

(declare-fun m!381931 () Bool)

(assert (=> b!384973 m!381931))

(declare-fun m!381933 () Bool)

(assert (=> b!384969 m!381933))

(declare-fun m!381935 () Bool)

(assert (=> b!384977 m!381935))

(declare-fun m!381937 () Bool)

(assert (=> b!384974 m!381937))

(declare-fun m!381939 () Bool)

(assert (=> b!384966 m!381939))

(declare-fun m!381941 () Bool)

(assert (=> b!384966 m!381941))

(declare-fun m!381943 () Bool)

(assert (=> b!384976 m!381943))

(check-sat (not b!384971) (not b!384975) tp_is_empty!9397 (not b!384977) (not b!384966) b_and!16005 (not mapNonEmpty!15660) (not b!384974) (not b!384969) (not b_next!8749) (not b!384976) (not start!37608) (not b!384973))
(check-sat b_and!16005 (not b_next!8749))
