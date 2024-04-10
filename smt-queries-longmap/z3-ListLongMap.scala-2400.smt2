; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37998 () Bool)

(assert start!37998)

(declare-fun b_free!8967 () Bool)

(declare-fun b_next!8967 () Bool)

(assert (=> start!37998 (= b_free!8967 (not b_next!8967))))

(declare-fun tp!31671 () Bool)

(declare-fun b_and!16281 () Bool)

(assert (=> start!37998 (= tp!31671 b_and!16281)))

(declare-fun b!390953 () Bool)

(declare-datatypes ((V!13957 0))(
  ( (V!13958 (val!4864 Int)) )
))
(declare-datatypes ((tuple2!6548 0))(
  ( (tuple2!6549 (_1!3285 (_ BitVec 64)) (_2!3285 V!13957)) )
))
(declare-datatypes ((List!6403 0))(
  ( (Nil!6400) (Cons!6399 (h!7255 tuple2!6548) (t!11565 List!6403)) )
))
(declare-datatypes ((ListLongMap!5461 0))(
  ( (ListLongMap!5462 (toList!2746 List!6403)) )
))
(declare-fun lt!184371 () ListLongMap!5461)

(declare-fun e!236816 () Bool)

(declare-fun lt!184378 () ListLongMap!5461)

(declare-fun lt!184375 () tuple2!6548)

(declare-fun +!1041 (ListLongMap!5461 tuple2!6548) ListLongMap!5461)

(assert (=> b!390953 (= e!236816 (= lt!184378 (+!1041 lt!184371 lt!184375)))))

(declare-fun b!390954 () Bool)

(declare-fun e!236815 () Bool)

(declare-fun e!236810 () Bool)

(assert (=> b!390954 (= e!236815 e!236810)))

(declare-fun res!223729 () Bool)

(assert (=> b!390954 (=> (not res!223729) (not e!236810))))

(declare-datatypes ((array!23179 0))(
  ( (array!23180 (arr!11052 (Array (_ BitVec 32) (_ BitVec 64))) (size!11404 (_ BitVec 32))) )
))
(declare-fun lt!184372 () array!23179)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23179 (_ BitVec 32)) Bool)

(assert (=> b!390954 (= res!223729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184372 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23179)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390954 (= lt!184372 (array!23180 (store (arr!11052 _keys!658) i!548 k0!778) (size!11404 _keys!658)))))

(declare-fun b!390955 () Bool)

(declare-fun e!236814 () Bool)

(declare-fun tp_is_empty!9639 () Bool)

(assert (=> b!390955 (= e!236814 tp_is_empty!9639)))

(declare-fun mapNonEmpty!16041 () Bool)

(declare-fun mapRes!16041 () Bool)

(declare-fun tp!31670 () Bool)

(assert (=> mapNonEmpty!16041 (= mapRes!16041 (and tp!31670 e!236814))))

(declare-datatypes ((ValueCell!4476 0))(
  ( (ValueCellFull!4476 (v!7085 V!13957)) (EmptyCell!4476) )
))
(declare-datatypes ((array!23181 0))(
  ( (array!23182 (arr!11053 (Array (_ BitVec 32) ValueCell!4476)) (size!11405 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23181)

(declare-fun mapValue!16041 () ValueCell!4476)

(declare-fun mapRest!16041 () (Array (_ BitVec 32) ValueCell!4476))

(declare-fun mapKey!16041 () (_ BitVec 32))

(assert (=> mapNonEmpty!16041 (= (arr!11053 _values!506) (store mapRest!16041 mapKey!16041 mapValue!16041))))

(declare-fun b!390956 () Bool)

(declare-fun e!236812 () Bool)

(assert (=> b!390956 (= e!236810 (not e!236812))))

(declare-fun res!223736 () Bool)

(assert (=> b!390956 (=> res!223736 e!236812)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390956 (= res!223736 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13957)

(declare-fun minValue!472 () V!13957)

(declare-fun getCurrentListMap!2091 (array!23179 array!23181 (_ BitVec 32) (_ BitVec 32) V!13957 V!13957 (_ BitVec 32) Int) ListLongMap!5461)

(assert (=> b!390956 (= lt!184378 (getCurrentListMap!2091 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184370 () ListLongMap!5461)

(declare-fun lt!184373 () array!23181)

(assert (=> b!390956 (= lt!184370 (getCurrentListMap!2091 lt!184372 lt!184373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184376 () ListLongMap!5461)

(declare-fun lt!184377 () ListLongMap!5461)

(assert (=> b!390956 (and (= lt!184376 lt!184377) (= lt!184377 lt!184376))))

(declare-fun v!373 () V!13957)

(assert (=> b!390956 (= lt!184377 (+!1041 lt!184371 (tuple2!6549 k0!778 v!373)))))

(declare-datatypes ((Unit!11964 0))(
  ( (Unit!11965) )
))
(declare-fun lt!184374 () Unit!11964)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 (array!23179 array!23181 (_ BitVec 32) (_ BitVec 32) V!13957 V!13957 (_ BitVec 32) (_ BitVec 64) V!13957 (_ BitVec 32) Int) Unit!11964)

(assert (=> b!390956 (= lt!184374 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!971 (array!23179 array!23181 (_ BitVec 32) (_ BitVec 32) V!13957 V!13957 (_ BitVec 32) Int) ListLongMap!5461)

(assert (=> b!390956 (= lt!184376 (getCurrentListMapNoExtraKeys!971 lt!184372 lt!184373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390956 (= lt!184373 (array!23182 (store (arr!11053 _values!506) i!548 (ValueCellFull!4476 v!373)) (size!11405 _values!506)))))

(assert (=> b!390956 (= lt!184371 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390957 () Bool)

(declare-fun e!236813 () Bool)

(assert (=> b!390957 (= e!236813 tp_is_empty!9639)))

(declare-fun b!390958 () Bool)

(declare-fun res!223734 () Bool)

(assert (=> b!390958 (=> (not res!223734) (not e!236815))))

(declare-datatypes ((List!6404 0))(
  ( (Nil!6401) (Cons!6400 (h!7256 (_ BitVec 64)) (t!11566 List!6404)) )
))
(declare-fun arrayNoDuplicates!0 (array!23179 (_ BitVec 32) List!6404) Bool)

(assert (=> b!390958 (= res!223734 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6401))))

(declare-fun b!390959 () Bool)

(declare-fun e!236811 () Bool)

(assert (=> b!390959 (= e!236811 (and e!236813 mapRes!16041))))

(declare-fun condMapEmpty!16041 () Bool)

(declare-fun mapDefault!16041 () ValueCell!4476)

(assert (=> b!390959 (= condMapEmpty!16041 (= (arr!11053 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4476)) mapDefault!16041)))))

(declare-fun mapIsEmpty!16041 () Bool)

(assert (=> mapIsEmpty!16041 mapRes!16041))

(declare-fun b!390960 () Bool)

(declare-fun res!223732 () Bool)

(assert (=> b!390960 (=> (not res!223732) (not e!236815))))

(assert (=> b!390960 (= res!223732 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11404 _keys!658))))))

(declare-fun res!223730 () Bool)

(assert (=> start!37998 (=> (not res!223730) (not e!236815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37998 (= res!223730 (validMask!0 mask!970))))

(assert (=> start!37998 e!236815))

(declare-fun array_inv!8118 (array!23181) Bool)

(assert (=> start!37998 (and (array_inv!8118 _values!506) e!236811)))

(assert (=> start!37998 tp!31671))

(assert (=> start!37998 true))

(assert (=> start!37998 tp_is_empty!9639))

(declare-fun array_inv!8119 (array!23179) Bool)

(assert (=> start!37998 (array_inv!8119 _keys!658)))

(declare-fun b!390961 () Bool)

(declare-fun res!223737 () Bool)

(assert (=> b!390961 (=> (not res!223737) (not e!236815))))

(assert (=> b!390961 (= res!223737 (and (= (size!11405 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11404 _keys!658) (size!11405 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390962 () Bool)

(declare-fun res!223727 () Bool)

(assert (=> b!390962 (=> (not res!223727) (not e!236815))))

(assert (=> b!390962 (= res!223727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390963 () Bool)

(assert (=> b!390963 (= e!236812 (= lt!184370 (+!1041 lt!184377 lt!184375)))))

(assert (=> b!390963 e!236816))

(declare-fun res!223738 () Bool)

(assert (=> b!390963 (=> (not res!223738) (not e!236816))))

(assert (=> b!390963 (= res!223738 (= lt!184370 (+!1041 lt!184376 lt!184375)))))

(assert (=> b!390963 (= lt!184375 (tuple2!6549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390964 () Bool)

(declare-fun res!223728 () Bool)

(assert (=> b!390964 (=> (not res!223728) (not e!236815))))

(assert (=> b!390964 (= res!223728 (or (= (select (arr!11052 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11052 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390965 () Bool)

(declare-fun res!223735 () Bool)

(assert (=> b!390965 (=> (not res!223735) (not e!236815))))

(declare-fun arrayContainsKey!0 (array!23179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390965 (= res!223735 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390966 () Bool)

(declare-fun res!223731 () Bool)

(assert (=> b!390966 (=> (not res!223731) (not e!236810))))

(assert (=> b!390966 (= res!223731 (arrayNoDuplicates!0 lt!184372 #b00000000000000000000000000000000 Nil!6401))))

(declare-fun b!390967 () Bool)

(declare-fun res!223733 () Bool)

(assert (=> b!390967 (=> (not res!223733) (not e!236815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390967 (= res!223733 (validKeyInArray!0 k0!778))))

(assert (= (and start!37998 res!223730) b!390961))

(assert (= (and b!390961 res!223737) b!390962))

(assert (= (and b!390962 res!223727) b!390958))

(assert (= (and b!390958 res!223734) b!390960))

(assert (= (and b!390960 res!223732) b!390967))

(assert (= (and b!390967 res!223733) b!390964))

(assert (= (and b!390964 res!223728) b!390965))

(assert (= (and b!390965 res!223735) b!390954))

(assert (= (and b!390954 res!223729) b!390966))

(assert (= (and b!390966 res!223731) b!390956))

(assert (= (and b!390956 (not res!223736)) b!390963))

(assert (= (and b!390963 res!223738) b!390953))

(assert (= (and b!390959 condMapEmpty!16041) mapIsEmpty!16041))

(assert (= (and b!390959 (not condMapEmpty!16041)) mapNonEmpty!16041))

(get-info :version)

(assert (= (and mapNonEmpty!16041 ((_ is ValueCellFull!4476) mapValue!16041)) b!390955))

(assert (= (and b!390959 ((_ is ValueCellFull!4476) mapDefault!16041)) b!390957))

(assert (= start!37998 b!390959))

(declare-fun m!387303 () Bool)

(assert (=> b!390954 m!387303))

(declare-fun m!387305 () Bool)

(assert (=> b!390954 m!387305))

(declare-fun m!387307 () Bool)

(assert (=> b!390965 m!387307))

(declare-fun m!387309 () Bool)

(assert (=> b!390958 m!387309))

(declare-fun m!387311 () Bool)

(assert (=> mapNonEmpty!16041 m!387311))

(declare-fun m!387313 () Bool)

(assert (=> b!390967 m!387313))

(declare-fun m!387315 () Bool)

(assert (=> b!390953 m!387315))

(declare-fun m!387317 () Bool)

(assert (=> b!390956 m!387317))

(declare-fun m!387319 () Bool)

(assert (=> b!390956 m!387319))

(declare-fun m!387321 () Bool)

(assert (=> b!390956 m!387321))

(declare-fun m!387323 () Bool)

(assert (=> b!390956 m!387323))

(declare-fun m!387325 () Bool)

(assert (=> b!390956 m!387325))

(declare-fun m!387327 () Bool)

(assert (=> b!390956 m!387327))

(declare-fun m!387329 () Bool)

(assert (=> b!390956 m!387329))

(declare-fun m!387331 () Bool)

(assert (=> b!390963 m!387331))

(declare-fun m!387333 () Bool)

(assert (=> b!390963 m!387333))

(declare-fun m!387335 () Bool)

(assert (=> b!390966 m!387335))

(declare-fun m!387337 () Bool)

(assert (=> b!390962 m!387337))

(declare-fun m!387339 () Bool)

(assert (=> start!37998 m!387339))

(declare-fun m!387341 () Bool)

(assert (=> start!37998 m!387341))

(declare-fun m!387343 () Bool)

(assert (=> start!37998 m!387343))

(declare-fun m!387345 () Bool)

(assert (=> b!390964 m!387345))

(check-sat (not b!390953) (not b!390958) (not b!390967) (not b!390963) (not mapNonEmpty!16041) b_and!16281 (not start!37998) (not b!390954) (not b!390965) (not b!390956) (not b_next!8967) tp_is_empty!9639 (not b!390962) (not b!390966))
(check-sat b_and!16281 (not b_next!8967))
