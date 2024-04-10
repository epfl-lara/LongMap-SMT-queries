; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38226 () Bool)

(assert start!38226)

(declare-fun b_free!9063 () Bool)

(declare-fun b_next!9063 () Bool)

(assert (=> start!38226 (= b_free!9063 (not b_next!9063))))

(declare-fun tp!31976 () Bool)

(declare-fun b_and!16449 () Bool)

(assert (=> start!38226 (= tp!31976 b_and!16449)))

(declare-fun mapIsEmpty!16203 () Bool)

(declare-fun mapRes!16203 () Bool)

(assert (=> mapIsEmpty!16203 mapRes!16203))

(declare-fun b!394279 () Bool)

(declare-fun e!238683 () Bool)

(declare-fun e!238682 () Bool)

(assert (=> b!394279 (= e!238683 e!238682)))

(declare-fun res!225955 () Bool)

(assert (=> b!394279 (=> (not res!225955) (not e!238682))))

(declare-datatypes ((array!23379 0))(
  ( (array!23380 (arr!11146 (Array (_ BitVec 32) (_ BitVec 64))) (size!11498 (_ BitVec 32))) )
))
(declare-fun lt!186804 () array!23379)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23379 (_ BitVec 32)) Bool)

(assert (=> b!394279 (= res!225955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186804 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23379)

(assert (=> b!394279 (= lt!186804 (array!23380 (store (arr!11146 _keys!658) i!548 k0!778) (size!11498 _keys!658)))))

(declare-fun res!225952 () Bool)

(assert (=> start!38226 (=> (not res!225952) (not e!238683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38226 (= res!225952 (validMask!0 mask!970))))

(assert (=> start!38226 e!238683))

(declare-datatypes ((V!14085 0))(
  ( (V!14086 (val!4912 Int)) )
))
(declare-datatypes ((ValueCell!4524 0))(
  ( (ValueCellFull!4524 (v!7157 V!14085)) (EmptyCell!4524) )
))
(declare-datatypes ((array!23381 0))(
  ( (array!23382 (arr!11147 (Array (_ BitVec 32) ValueCell!4524)) (size!11499 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23381)

(declare-fun e!238684 () Bool)

(declare-fun array_inv!8184 (array!23381) Bool)

(assert (=> start!38226 (and (array_inv!8184 _values!506) e!238684)))

(assert (=> start!38226 tp!31976))

(assert (=> start!38226 true))

(declare-fun tp_is_empty!9735 () Bool)

(assert (=> start!38226 tp_is_empty!9735))

(declare-fun array_inv!8185 (array!23379) Bool)

(assert (=> start!38226 (array_inv!8185 _keys!658)))

(declare-fun b!394280 () Bool)

(declare-fun e!238685 () Bool)

(assert (=> b!394280 (= e!238685 tp_is_empty!9735)))

(declare-fun b!394281 () Bool)

(declare-fun res!225950 () Bool)

(assert (=> b!394281 (=> (not res!225950) (not e!238683))))

(assert (=> b!394281 (= res!225950 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11498 _keys!658))))))

(declare-fun b!394282 () Bool)

(declare-fun res!225954 () Bool)

(assert (=> b!394282 (=> (not res!225954) (not e!238683))))

(assert (=> b!394282 (= res!225954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394283 () Bool)

(declare-fun res!225949 () Bool)

(assert (=> b!394283 (=> (not res!225949) (not e!238683))))

(declare-fun arrayContainsKey!0 (array!23379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394283 (= res!225949 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394284 () Bool)

(declare-fun e!238680 () Bool)

(assert (=> b!394284 (= e!238680 true)))

(declare-datatypes ((tuple2!6632 0))(
  ( (tuple2!6633 (_1!3327 (_ BitVec 64)) (_2!3327 V!14085)) )
))
(declare-datatypes ((List!6484 0))(
  ( (Nil!6481) (Cons!6480 (h!7336 tuple2!6632) (t!11658 List!6484)) )
))
(declare-datatypes ((ListLongMap!5545 0))(
  ( (ListLongMap!5546 (toList!2788 List!6484)) )
))
(declare-fun lt!186801 () ListLongMap!5545)

(declare-fun lt!186796 () ListLongMap!5545)

(declare-fun lt!186794 () tuple2!6632)

(declare-fun +!1081 (ListLongMap!5545 tuple2!6632) ListLongMap!5545)

(assert (=> b!394284 (= lt!186801 (+!1081 lt!186796 lt!186794))))

(declare-fun lt!186795 () ListLongMap!5545)

(declare-fun lt!186799 () ListLongMap!5545)

(assert (=> b!394284 (= lt!186795 lt!186799)))

(declare-fun b!394285 () Bool)

(declare-fun res!225953 () Bool)

(assert (=> b!394285 (=> (not res!225953) (not e!238683))))

(declare-datatypes ((List!6485 0))(
  ( (Nil!6482) (Cons!6481 (h!7337 (_ BitVec 64)) (t!11659 List!6485)) )
))
(declare-fun arrayNoDuplicates!0 (array!23379 (_ BitVec 32) List!6485) Bool)

(assert (=> b!394285 (= res!225953 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6482))))

(declare-fun b!394286 () Bool)

(assert (=> b!394286 (= e!238682 (not e!238680))))

(declare-fun res!225959 () Bool)

(assert (=> b!394286 (=> res!225959 e!238680)))

(declare-fun lt!186800 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394286 (= res!225959 (or (and (not lt!186800) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186800) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186800)))))

(assert (=> b!394286 (= lt!186800 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14085)

(declare-fun minValue!472 () V!14085)

(declare-fun getCurrentListMap!2127 (array!23379 array!23381 (_ BitVec 32) (_ BitVec 32) V!14085 V!14085 (_ BitVec 32) Int) ListLongMap!5545)

(assert (=> b!394286 (= lt!186796 (getCurrentListMap!2127 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186798 () array!23381)

(assert (=> b!394286 (= lt!186795 (getCurrentListMap!2127 lt!186804 lt!186798 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186797 () ListLongMap!5545)

(assert (=> b!394286 (and (= lt!186799 lt!186797) (= lt!186797 lt!186799))))

(declare-fun lt!186802 () ListLongMap!5545)

(assert (=> b!394286 (= lt!186797 (+!1081 lt!186802 lt!186794))))

(declare-fun v!373 () V!14085)

(assert (=> b!394286 (= lt!186794 (tuple2!6633 k0!778 v!373))))

(declare-datatypes ((Unit!12052 0))(
  ( (Unit!12053) )
))
(declare-fun lt!186803 () Unit!12052)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!291 (array!23379 array!23381 (_ BitVec 32) (_ BitVec 32) V!14085 V!14085 (_ BitVec 32) (_ BitVec 64) V!14085 (_ BitVec 32) Int) Unit!12052)

(assert (=> b!394286 (= lt!186803 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!291 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1007 (array!23379 array!23381 (_ BitVec 32) (_ BitVec 32) V!14085 V!14085 (_ BitVec 32) Int) ListLongMap!5545)

(assert (=> b!394286 (= lt!186799 (getCurrentListMapNoExtraKeys!1007 lt!186804 lt!186798 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394286 (= lt!186798 (array!23382 (store (arr!11147 _values!506) i!548 (ValueCellFull!4524 v!373)) (size!11499 _values!506)))))

(assert (=> b!394286 (= lt!186802 (getCurrentListMapNoExtraKeys!1007 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394287 () Bool)

(declare-fun res!225957 () Bool)

(assert (=> b!394287 (=> (not res!225957) (not e!238683))))

(assert (=> b!394287 (= res!225957 (or (= (select (arr!11146 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11146 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394288 () Bool)

(declare-fun res!225956 () Bool)

(assert (=> b!394288 (=> (not res!225956) (not e!238683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394288 (= res!225956 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16203 () Bool)

(declare-fun tp!31977 () Bool)

(declare-fun e!238681 () Bool)

(assert (=> mapNonEmpty!16203 (= mapRes!16203 (and tp!31977 e!238681))))

(declare-fun mapValue!16203 () ValueCell!4524)

(declare-fun mapRest!16203 () (Array (_ BitVec 32) ValueCell!4524))

(declare-fun mapKey!16203 () (_ BitVec 32))

(assert (=> mapNonEmpty!16203 (= (arr!11147 _values!506) (store mapRest!16203 mapKey!16203 mapValue!16203))))

(declare-fun b!394289 () Bool)

(assert (=> b!394289 (= e!238681 tp_is_empty!9735)))

(declare-fun b!394290 () Bool)

(declare-fun res!225951 () Bool)

(assert (=> b!394290 (=> (not res!225951) (not e!238683))))

(assert (=> b!394290 (= res!225951 (and (= (size!11499 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11498 _keys!658) (size!11499 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394291 () Bool)

(assert (=> b!394291 (= e!238684 (and e!238685 mapRes!16203))))

(declare-fun condMapEmpty!16203 () Bool)

(declare-fun mapDefault!16203 () ValueCell!4524)

(assert (=> b!394291 (= condMapEmpty!16203 (= (arr!11147 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4524)) mapDefault!16203)))))

(declare-fun b!394292 () Bool)

(declare-fun res!225958 () Bool)

(assert (=> b!394292 (=> (not res!225958) (not e!238682))))

(assert (=> b!394292 (= res!225958 (arrayNoDuplicates!0 lt!186804 #b00000000000000000000000000000000 Nil!6482))))

(assert (= (and start!38226 res!225952) b!394290))

(assert (= (and b!394290 res!225951) b!394282))

(assert (= (and b!394282 res!225954) b!394285))

(assert (= (and b!394285 res!225953) b!394281))

(assert (= (and b!394281 res!225950) b!394288))

(assert (= (and b!394288 res!225956) b!394287))

(assert (= (and b!394287 res!225957) b!394283))

(assert (= (and b!394283 res!225949) b!394279))

(assert (= (and b!394279 res!225955) b!394292))

(assert (= (and b!394292 res!225958) b!394286))

(assert (= (and b!394286 (not res!225959)) b!394284))

(assert (= (and b!394291 condMapEmpty!16203) mapIsEmpty!16203))

(assert (= (and b!394291 (not condMapEmpty!16203)) mapNonEmpty!16203))

(get-info :version)

(assert (= (and mapNonEmpty!16203 ((_ is ValueCellFull!4524) mapValue!16203)) b!394289))

(assert (= (and b!394291 ((_ is ValueCellFull!4524) mapDefault!16203)) b!394280))

(assert (= start!38226 b!394291))

(declare-fun m!390719 () Bool)

(assert (=> b!394282 m!390719))

(declare-fun m!390721 () Bool)

(assert (=> start!38226 m!390721))

(declare-fun m!390723 () Bool)

(assert (=> start!38226 m!390723))

(declare-fun m!390725 () Bool)

(assert (=> start!38226 m!390725))

(declare-fun m!390727 () Bool)

(assert (=> b!394288 m!390727))

(declare-fun m!390729 () Bool)

(assert (=> b!394286 m!390729))

(declare-fun m!390731 () Bool)

(assert (=> b!394286 m!390731))

(declare-fun m!390733 () Bool)

(assert (=> b!394286 m!390733))

(declare-fun m!390735 () Bool)

(assert (=> b!394286 m!390735))

(declare-fun m!390737 () Bool)

(assert (=> b!394286 m!390737))

(declare-fun m!390739 () Bool)

(assert (=> b!394286 m!390739))

(declare-fun m!390741 () Bool)

(assert (=> b!394286 m!390741))

(declare-fun m!390743 () Bool)

(assert (=> b!394284 m!390743))

(declare-fun m!390745 () Bool)

(assert (=> mapNonEmpty!16203 m!390745))

(declare-fun m!390747 () Bool)

(assert (=> b!394283 m!390747))

(declare-fun m!390749 () Bool)

(assert (=> b!394292 m!390749))

(declare-fun m!390751 () Bool)

(assert (=> b!394279 m!390751))

(declare-fun m!390753 () Bool)

(assert (=> b!394279 m!390753))

(declare-fun m!390755 () Bool)

(assert (=> b!394287 m!390755))

(declare-fun m!390757 () Bool)

(assert (=> b!394285 m!390757))

(check-sat (not b!394285) (not b!394292) (not b!394279) (not b!394286) (not b!394284) b_and!16449 tp_is_empty!9735 (not start!38226) (not b_next!9063) (not b!394283) (not mapNonEmpty!16203) (not b!394282) (not b!394288))
(check-sat b_and!16449 (not b_next!9063))
