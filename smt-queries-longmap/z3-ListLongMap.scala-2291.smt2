; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37194 () Bool)

(assert start!37194)

(declare-fun b_free!8335 () Bool)

(declare-fun b_next!8335 () Bool)

(assert (=> start!37194 (= b_free!8335 (not b_next!8335))))

(declare-fun tp!29721 () Bool)

(declare-fun b_and!15591 () Bool)

(assert (=> start!37194 (= tp!29721 b_and!15591)))

(declare-fun b!375932 () Bool)

(declare-fun e!228984 () Bool)

(declare-fun e!228985 () Bool)

(assert (=> b!375932 (= e!228984 e!228985)))

(declare-fun res!212379 () Bool)

(assert (=> b!375932 (=> (not res!212379) (not e!228985))))

(declare-datatypes ((array!21884 0))(
  ( (array!21885 (arr!10410 (Array (_ BitVec 32) (_ BitVec 64))) (size!10762 (_ BitVec 32))) )
))
(declare-fun lt!174253 () array!21884)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21884 (_ BitVec 32)) Bool)

(assert (=> b!375932 (= res!212379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174253 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21884)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375932 (= lt!174253 (array!21885 (store (arr!10410 _keys!658) i!548 k0!778) (size!10762 _keys!658)))))

(declare-fun b!375933 () Bool)

(declare-fun e!228983 () Bool)

(assert (=> b!375933 (= e!228983 true)))

(declare-datatypes ((V!13083 0))(
  ( (V!13084 (val!4536 Int)) )
))
(declare-datatypes ((tuple2!5944 0))(
  ( (tuple2!5945 (_1!2983 (_ BitVec 64)) (_2!2983 V!13083)) )
))
(declare-datatypes ((List!5786 0))(
  ( (Nil!5783) (Cons!5782 (h!6638 tuple2!5944) (t!10928 List!5786)) )
))
(declare-datatypes ((ListLongMap!4859 0))(
  ( (ListLongMap!4860 (toList!2445 List!5786)) )
))
(declare-fun lt!174252 () ListLongMap!4859)

(declare-fun lt!174259 () ListLongMap!4859)

(declare-fun lt!174255 () tuple2!5944)

(declare-fun +!841 (ListLongMap!4859 tuple2!5944) ListLongMap!4859)

(assert (=> b!375933 (= lt!174252 (+!841 lt!174259 lt!174255))))

(declare-fun lt!174261 () ListLongMap!4859)

(declare-datatypes ((Unit!11569 0))(
  ( (Unit!11570) )
))
(declare-fun lt!174254 () Unit!11569)

(declare-fun v!373 () V!13083)

(declare-fun zeroValue!472 () V!13083)

(declare-fun addCommutativeForDiffKeys!264 (ListLongMap!4859 (_ BitVec 64) V!13083 (_ BitVec 64) V!13083) Unit!11569)

(assert (=> b!375933 (= lt!174254 (addCommutativeForDiffKeys!264 lt!174261 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375934 () Bool)

(declare-fun res!212376 () Bool)

(assert (=> b!375934 (=> (not res!212376) (not e!228984))))

(assert (=> b!375934 (= res!212376 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10762 _keys!658))))))

(declare-fun b!375935 () Bool)

(declare-fun res!212384 () Bool)

(assert (=> b!375935 (=> (not res!212384) (not e!228984))))

(assert (=> b!375935 (= res!212384 (or (= (select (arr!10410 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10410 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375936 () Bool)

(declare-fun e!228986 () Bool)

(declare-fun tp_is_empty!8983 () Bool)

(assert (=> b!375936 (= e!228986 tp_is_empty!8983)))

(declare-fun b!375937 () Bool)

(declare-fun res!212383 () Bool)

(assert (=> b!375937 (=> (not res!212383) (not e!228984))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4148 0))(
  ( (ValueCellFull!4148 (v!6734 V!13083)) (EmptyCell!4148) )
))
(declare-datatypes ((array!21886 0))(
  ( (array!21887 (arr!10411 (Array (_ BitVec 32) ValueCell!4148)) (size!10763 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21886)

(assert (=> b!375937 (= res!212383 (and (= (size!10763 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10762 _keys!658) (size!10763 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!212377 () Bool)

(assert (=> start!37194 (=> (not res!212377) (not e!228984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37194 (= res!212377 (validMask!0 mask!970))))

(assert (=> start!37194 e!228984))

(declare-fun e!228990 () Bool)

(declare-fun array_inv!7724 (array!21886) Bool)

(assert (=> start!37194 (and (array_inv!7724 _values!506) e!228990)))

(assert (=> start!37194 tp!29721))

(assert (=> start!37194 true))

(assert (=> start!37194 tp_is_empty!8983))

(declare-fun array_inv!7725 (array!21884) Bool)

(assert (=> start!37194 (array_inv!7725 _keys!658)))

(declare-fun b!375938 () Bool)

(declare-fun res!212382 () Bool)

(assert (=> b!375938 (=> (not res!212382) (not e!228984))))

(declare-fun arrayContainsKey!0 (array!21884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375938 (= res!212382 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375939 () Bool)

(declare-fun mapRes!15039 () Bool)

(assert (=> b!375939 (= e!228990 (and e!228986 mapRes!15039))))

(declare-fun condMapEmpty!15039 () Bool)

(declare-fun mapDefault!15039 () ValueCell!4148)

(assert (=> b!375939 (= condMapEmpty!15039 (= (arr!10411 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4148)) mapDefault!15039)))))

(declare-fun b!375940 () Bool)

(declare-fun res!212386 () Bool)

(assert (=> b!375940 (=> (not res!212386) (not e!228985))))

(declare-datatypes ((List!5787 0))(
  ( (Nil!5784) (Cons!5783 (h!6639 (_ BitVec 64)) (t!10929 List!5787)) )
))
(declare-fun arrayNoDuplicates!0 (array!21884 (_ BitVec 32) List!5787) Bool)

(assert (=> b!375940 (= res!212386 (arrayNoDuplicates!0 lt!174253 #b00000000000000000000000000000000 Nil!5784))))

(declare-fun mapNonEmpty!15039 () Bool)

(declare-fun tp!29720 () Bool)

(declare-fun e!228987 () Bool)

(assert (=> mapNonEmpty!15039 (= mapRes!15039 (and tp!29720 e!228987))))

(declare-fun mapKey!15039 () (_ BitVec 32))

(declare-fun mapValue!15039 () ValueCell!4148)

(declare-fun mapRest!15039 () (Array (_ BitVec 32) ValueCell!4148))

(assert (=> mapNonEmpty!15039 (= (arr!10411 _values!506) (store mapRest!15039 mapKey!15039 mapValue!15039))))

(declare-fun b!375941 () Bool)

(declare-fun res!212387 () Bool)

(assert (=> b!375941 (=> (not res!212387) (not e!228984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375941 (= res!212387 (validKeyInArray!0 k0!778))))

(declare-fun b!375942 () Bool)

(declare-fun res!212385 () Bool)

(assert (=> b!375942 (=> (not res!212385) (not e!228984))))

(assert (=> b!375942 (= res!212385 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5784))))

(declare-fun mapIsEmpty!15039 () Bool)

(assert (=> mapIsEmpty!15039 mapRes!15039))

(declare-fun b!375943 () Bool)

(assert (=> b!375943 (= e!228987 tp_is_empty!8983)))

(declare-fun b!375944 () Bool)

(declare-fun e!228988 () Bool)

(assert (=> b!375944 (= e!228988 e!228983)))

(declare-fun res!212381 () Bool)

(assert (=> b!375944 (=> res!212381 e!228983)))

(assert (=> b!375944 (= res!212381 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174262 () ListLongMap!4859)

(assert (=> b!375944 (= lt!174262 lt!174252)))

(declare-fun lt!174250 () ListLongMap!4859)

(declare-fun lt!174257 () tuple2!5944)

(assert (=> b!375944 (= lt!174252 (+!841 lt!174250 lt!174257))))

(declare-fun lt!174260 () ListLongMap!4859)

(assert (=> b!375944 (= lt!174260 lt!174259)))

(assert (=> b!375944 (= lt!174259 (+!841 lt!174261 lt!174257))))

(declare-fun lt!174251 () ListLongMap!4859)

(assert (=> b!375944 (= lt!174262 (+!841 lt!174251 lt!174257))))

(assert (=> b!375944 (= lt!174257 (tuple2!5945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375945 () Bool)

(declare-fun res!212380 () Bool)

(assert (=> b!375945 (=> (not res!212380) (not e!228984))))

(assert (=> b!375945 (= res!212380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375946 () Bool)

(assert (=> b!375946 (= e!228985 (not e!228988))))

(declare-fun res!212378 () Bool)

(assert (=> b!375946 (=> res!212378 e!228988)))

(assert (=> b!375946 (= res!212378 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13083)

(declare-fun getCurrentListMap!1897 (array!21884 array!21886 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!375946 (= lt!174260 (getCurrentListMap!1897 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174256 () array!21886)

(assert (=> b!375946 (= lt!174262 (getCurrentListMap!1897 lt!174253 lt!174256 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375946 (and (= lt!174251 lt!174250) (= lt!174250 lt!174251))))

(assert (=> b!375946 (= lt!174250 (+!841 lt!174261 lt!174255))))

(assert (=> b!375946 (= lt!174255 (tuple2!5945 k0!778 v!373))))

(declare-fun lt!174258 () Unit!11569)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 (array!21884 array!21886 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) (_ BitVec 64) V!13083 (_ BitVec 32) Int) Unit!11569)

(assert (=> b!375946 (= lt!174258 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!744 (array!21884 array!21886 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!375946 (= lt!174251 (getCurrentListMapNoExtraKeys!744 lt!174253 lt!174256 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375946 (= lt!174256 (array!21887 (store (arr!10411 _values!506) i!548 (ValueCellFull!4148 v!373)) (size!10763 _values!506)))))

(assert (=> b!375946 (= lt!174261 (getCurrentListMapNoExtraKeys!744 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37194 res!212377) b!375937))

(assert (= (and b!375937 res!212383) b!375945))

(assert (= (and b!375945 res!212380) b!375942))

(assert (= (and b!375942 res!212385) b!375934))

(assert (= (and b!375934 res!212376) b!375941))

(assert (= (and b!375941 res!212387) b!375935))

(assert (= (and b!375935 res!212384) b!375938))

(assert (= (and b!375938 res!212382) b!375932))

(assert (= (and b!375932 res!212379) b!375940))

(assert (= (and b!375940 res!212386) b!375946))

(assert (= (and b!375946 (not res!212378)) b!375944))

(assert (= (and b!375944 (not res!212381)) b!375933))

(assert (= (and b!375939 condMapEmpty!15039) mapIsEmpty!15039))

(assert (= (and b!375939 (not condMapEmpty!15039)) mapNonEmpty!15039))

(get-info :version)

(assert (= (and mapNonEmpty!15039 ((_ is ValueCellFull!4148) mapValue!15039)) b!375943))

(assert (= (and b!375939 ((_ is ValueCellFull!4148) mapDefault!15039)) b!375936))

(assert (= start!37194 b!375939))

(declare-fun m!372881 () Bool)

(assert (=> b!375933 m!372881))

(declare-fun m!372883 () Bool)

(assert (=> b!375933 m!372883))

(declare-fun m!372885 () Bool)

(assert (=> mapNonEmpty!15039 m!372885))

(declare-fun m!372887 () Bool)

(assert (=> b!375945 m!372887))

(declare-fun m!372889 () Bool)

(assert (=> b!375938 m!372889))

(declare-fun m!372891 () Bool)

(assert (=> b!375944 m!372891))

(declare-fun m!372893 () Bool)

(assert (=> b!375944 m!372893))

(declare-fun m!372895 () Bool)

(assert (=> b!375944 m!372895))

(declare-fun m!372897 () Bool)

(assert (=> b!375932 m!372897))

(declare-fun m!372899 () Bool)

(assert (=> b!375932 m!372899))

(declare-fun m!372901 () Bool)

(assert (=> b!375941 m!372901))

(declare-fun m!372903 () Bool)

(assert (=> start!37194 m!372903))

(declare-fun m!372905 () Bool)

(assert (=> start!37194 m!372905))

(declare-fun m!372907 () Bool)

(assert (=> start!37194 m!372907))

(declare-fun m!372909 () Bool)

(assert (=> b!375940 m!372909))

(declare-fun m!372911 () Bool)

(assert (=> b!375935 m!372911))

(declare-fun m!372913 () Bool)

(assert (=> b!375942 m!372913))

(declare-fun m!372915 () Bool)

(assert (=> b!375946 m!372915))

(declare-fun m!372917 () Bool)

(assert (=> b!375946 m!372917))

(declare-fun m!372919 () Bool)

(assert (=> b!375946 m!372919))

(declare-fun m!372921 () Bool)

(assert (=> b!375946 m!372921))

(declare-fun m!372923 () Bool)

(assert (=> b!375946 m!372923))

(declare-fun m!372925 () Bool)

(assert (=> b!375946 m!372925))

(declare-fun m!372927 () Bool)

(assert (=> b!375946 m!372927))

(check-sat (not mapNonEmpty!15039) (not b!375933) (not start!37194) (not b!375944) (not b!375942) (not b!375940) b_and!15591 (not b!375945) (not b!375932) (not b!375938) (not b!375941) (not b_next!8335) tp_is_empty!8983 (not b!375946))
(check-sat b_and!15591 (not b_next!8335))
