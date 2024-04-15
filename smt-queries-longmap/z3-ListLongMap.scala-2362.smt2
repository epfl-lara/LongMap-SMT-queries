; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37620 () Bool)

(assert start!37620)

(declare-fun b_free!8761 () Bool)

(declare-fun b_next!8761 () Bool)

(assert (=> start!37620 (= b_free!8761 (not b_next!8761))))

(declare-fun tp!30998 () Bool)

(declare-fun b_and!15977 () Bool)

(assert (=> start!37620 (= tp!30998 b_and!15977)))

(declare-fun b!384998 () Bool)

(declare-fun res!219623 () Bool)

(declare-fun e!233647 () Bool)

(assert (=> b!384998 (=> (not res!219623) (not e!233647))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384998 (= res!219623 (validKeyInArray!0 k0!778))))

(declare-fun b!384999 () Bool)

(declare-fun e!233653 () Bool)

(declare-datatypes ((array!22705 0))(
  ( (array!22706 (arr!10821 (Array (_ BitVec 32) (_ BitVec 64))) (size!11174 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22705)

(assert (=> b!384999 (= e!233653 (bvsle #b00000000000000000000000000000000 (size!11174 _keys!658)))))

(declare-fun b!385000 () Bool)

(declare-fun res!219630 () Bool)

(assert (=> b!385000 (=> (not res!219630) (not e!233647))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22705 (_ BitVec 32)) Bool)

(assert (=> b!385000 (= res!219630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385001 () Bool)

(declare-fun e!233651 () Bool)

(declare-fun e!233649 () Bool)

(declare-fun mapRes!15678 () Bool)

(assert (=> b!385001 (= e!233651 (and e!233649 mapRes!15678))))

(declare-fun condMapEmpty!15678 () Bool)

(declare-datatypes ((V!13651 0))(
  ( (V!13652 (val!4749 Int)) )
))
(declare-datatypes ((ValueCell!4361 0))(
  ( (ValueCellFull!4361 (v!6940 V!13651)) (EmptyCell!4361) )
))
(declare-datatypes ((array!22707 0))(
  ( (array!22708 (arr!10822 (Array (_ BitVec 32) ValueCell!4361)) (size!11175 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22707)

(declare-fun mapDefault!15678 () ValueCell!4361)

(assert (=> b!385001 (= condMapEmpty!15678 (= (arr!10822 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4361)) mapDefault!15678)))))

(declare-fun b!385002 () Bool)

(declare-fun tp_is_empty!9409 () Bool)

(assert (=> b!385002 (= e!233649 tp_is_empty!9409)))

(declare-fun b!385003 () Bool)

(declare-fun e!233652 () Bool)

(assert (=> b!385003 (= e!233652 tp_is_empty!9409)))

(declare-fun res!219626 () Bool)

(assert (=> start!37620 (=> (not res!219626) (not e!233647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37620 (= res!219626 (validMask!0 mask!970))))

(assert (=> start!37620 e!233647))

(declare-fun array_inv!7966 (array!22707) Bool)

(assert (=> start!37620 (and (array_inv!7966 _values!506) e!233651)))

(assert (=> start!37620 tp!30998))

(assert (=> start!37620 true))

(assert (=> start!37620 tp_is_empty!9409))

(declare-fun array_inv!7967 (array!22705) Bool)

(assert (=> start!37620 (array_inv!7967 _keys!658)))

(declare-fun mapNonEmpty!15678 () Bool)

(declare-fun tp!30999 () Bool)

(assert (=> mapNonEmpty!15678 (= mapRes!15678 (and tp!30999 e!233652))))

(declare-fun mapRest!15678 () (Array (_ BitVec 32) ValueCell!4361))

(declare-fun mapKey!15678 () (_ BitVec 32))

(declare-fun mapValue!15678 () ValueCell!4361)

(assert (=> mapNonEmpty!15678 (= (arr!10822 _values!506) (store mapRest!15678 mapKey!15678 mapValue!15678))))

(declare-fun b!385004 () Bool)

(declare-fun e!233654 () Bool)

(declare-fun e!233650 () Bool)

(assert (=> b!385004 (= e!233654 (not e!233650))))

(declare-fun res!219622 () Bool)

(assert (=> b!385004 (=> res!219622 e!233650)))

(declare-fun lt!181305 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385004 (= res!219622 (or (and (not lt!181305) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181305) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181305)))))

(assert (=> b!385004 (= lt!181305 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6380 0))(
  ( (tuple2!6381 (_1!3201 (_ BitVec 64)) (_2!3201 V!13651)) )
))
(declare-datatypes ((List!6204 0))(
  ( (Nil!6201) (Cons!6200 (h!7056 tuple2!6380) (t!11345 List!6204)) )
))
(declare-datatypes ((ListLongMap!5283 0))(
  ( (ListLongMap!5284 (toList!2657 List!6204)) )
))
(declare-fun lt!181306 () ListLongMap!5283)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13651)

(declare-fun minValue!472 () V!13651)

(declare-fun getCurrentListMap!2033 (array!22705 array!22707 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!385004 (= lt!181306 (getCurrentListMap!2033 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181302 () array!22705)

(declare-fun lt!181303 () array!22707)

(declare-fun lt!181307 () ListLongMap!5283)

(assert (=> b!385004 (= lt!181307 (getCurrentListMap!2033 lt!181302 lt!181303 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181304 () ListLongMap!5283)

(declare-fun lt!181299 () ListLongMap!5283)

(assert (=> b!385004 (and (= lt!181304 lt!181299) (= lt!181299 lt!181304))))

(declare-fun lt!181300 () ListLongMap!5283)

(declare-fun lt!181308 () tuple2!6380)

(declare-fun +!1014 (ListLongMap!5283 tuple2!6380) ListLongMap!5283)

(assert (=> b!385004 (= lt!181299 (+!1014 lt!181300 lt!181308))))

(declare-fun v!373 () V!13651)

(assert (=> b!385004 (= lt!181308 (tuple2!6381 k0!778 v!373))))

(declare-datatypes ((Unit!11872 0))(
  ( (Unit!11873) )
))
(declare-fun lt!181301 () Unit!11872)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 (array!22705 array!22707 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) (_ BitVec 64) V!13651 (_ BitVec 32) Int) Unit!11872)

(assert (=> b!385004 (= lt!181301 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!898 (array!22705 array!22707 (_ BitVec 32) (_ BitVec 32) V!13651 V!13651 (_ BitVec 32) Int) ListLongMap!5283)

(assert (=> b!385004 (= lt!181304 (getCurrentListMapNoExtraKeys!898 lt!181302 lt!181303 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385004 (= lt!181303 (array!22708 (store (arr!10822 _values!506) i!548 (ValueCellFull!4361 v!373)) (size!11175 _values!506)))))

(assert (=> b!385004 (= lt!181300 (getCurrentListMapNoExtraKeys!898 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385005 () Bool)

(declare-fun res!219624 () Bool)

(assert (=> b!385005 (=> (not res!219624) (not e!233647))))

(assert (=> b!385005 (= res!219624 (and (= (size!11175 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11174 _keys!658) (size!11175 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385006 () Bool)

(declare-fun res!219628 () Bool)

(assert (=> b!385006 (=> (not res!219628) (not e!233647))))

(assert (=> b!385006 (= res!219628 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11174 _keys!658))))))

(declare-fun b!385007 () Bool)

(declare-fun res!219631 () Bool)

(assert (=> b!385007 (=> (not res!219631) (not e!233647))))

(assert (=> b!385007 (= res!219631 (or (= (select (arr!10821 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10821 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385008 () Bool)

(assert (=> b!385008 (= e!233647 e!233654)))

(declare-fun res!219629 () Bool)

(assert (=> b!385008 (=> (not res!219629) (not e!233654))))

(assert (=> b!385008 (= res!219629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181302 mask!970))))

(assert (=> b!385008 (= lt!181302 (array!22706 (store (arr!10821 _keys!658) i!548 k0!778) (size!11174 _keys!658)))))

(declare-fun b!385009 () Bool)

(declare-fun res!219627 () Bool)

(assert (=> b!385009 (=> (not res!219627) (not e!233654))))

(declare-datatypes ((List!6205 0))(
  ( (Nil!6202) (Cons!6201 (h!7057 (_ BitVec 64)) (t!11346 List!6205)) )
))
(declare-fun arrayNoDuplicates!0 (array!22705 (_ BitVec 32) List!6205) Bool)

(assert (=> b!385009 (= res!219627 (arrayNoDuplicates!0 lt!181302 #b00000000000000000000000000000000 Nil!6202))))

(declare-fun b!385010 () Bool)

(assert (=> b!385010 (= e!233650 e!233653)))

(declare-fun res!219625 () Bool)

(assert (=> b!385010 (=> res!219625 e!233653)))

(assert (=> b!385010 (= res!219625 (not (= (+!1014 lt!181306 lt!181308) lt!181307)))))

(assert (=> b!385010 (= lt!181307 lt!181304)))

(declare-fun b!385011 () Bool)

(declare-fun res!219621 () Bool)

(assert (=> b!385011 (=> (not res!219621) (not e!233647))))

(declare-fun arrayContainsKey!0 (array!22705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385011 (= res!219621 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15678 () Bool)

(assert (=> mapIsEmpty!15678 mapRes!15678))

(declare-fun b!385012 () Bool)

(declare-fun res!219632 () Bool)

(assert (=> b!385012 (=> (not res!219632) (not e!233647))))

(assert (=> b!385012 (= res!219632 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6202))))

(assert (= (and start!37620 res!219626) b!385005))

(assert (= (and b!385005 res!219624) b!385000))

(assert (= (and b!385000 res!219630) b!385012))

(assert (= (and b!385012 res!219632) b!385006))

(assert (= (and b!385006 res!219628) b!384998))

(assert (= (and b!384998 res!219623) b!385007))

(assert (= (and b!385007 res!219631) b!385011))

(assert (= (and b!385011 res!219621) b!385008))

(assert (= (and b!385008 res!219629) b!385009))

(assert (= (and b!385009 res!219627) b!385004))

(assert (= (and b!385004 (not res!219622)) b!385010))

(assert (= (and b!385010 (not res!219625)) b!384999))

(assert (= (and b!385001 condMapEmpty!15678) mapIsEmpty!15678))

(assert (= (and b!385001 (not condMapEmpty!15678)) mapNonEmpty!15678))

(get-info :version)

(assert (= (and mapNonEmpty!15678 ((_ is ValueCellFull!4361) mapValue!15678)) b!385003))

(assert (= (and b!385001 ((_ is ValueCellFull!4361) mapDefault!15678)) b!385002))

(assert (= start!37620 b!385001))

(declare-fun m!381191 () Bool)

(assert (=> b!385007 m!381191))

(declare-fun m!381193 () Bool)

(assert (=> b!384998 m!381193))

(declare-fun m!381195 () Bool)

(assert (=> b!385009 m!381195))

(declare-fun m!381197 () Bool)

(assert (=> b!385010 m!381197))

(declare-fun m!381199 () Bool)

(assert (=> mapNonEmpty!15678 m!381199))

(declare-fun m!381201 () Bool)

(assert (=> b!385011 m!381201))

(declare-fun m!381203 () Bool)

(assert (=> b!385004 m!381203))

(declare-fun m!381205 () Bool)

(assert (=> b!385004 m!381205))

(declare-fun m!381207 () Bool)

(assert (=> b!385004 m!381207))

(declare-fun m!381209 () Bool)

(assert (=> b!385004 m!381209))

(declare-fun m!381211 () Bool)

(assert (=> b!385004 m!381211))

(declare-fun m!381213 () Bool)

(assert (=> b!385004 m!381213))

(declare-fun m!381215 () Bool)

(assert (=> b!385004 m!381215))

(declare-fun m!381217 () Bool)

(assert (=> b!385012 m!381217))

(declare-fun m!381219 () Bool)

(assert (=> start!37620 m!381219))

(declare-fun m!381221 () Bool)

(assert (=> start!37620 m!381221))

(declare-fun m!381223 () Bool)

(assert (=> start!37620 m!381223))

(declare-fun m!381225 () Bool)

(assert (=> b!385000 m!381225))

(declare-fun m!381227 () Bool)

(assert (=> b!385008 m!381227))

(declare-fun m!381229 () Bool)

(assert (=> b!385008 m!381229))

(check-sat (not b!385008) (not b!384998) (not b!385010) (not b!385000) (not mapNonEmpty!15678) (not start!37620) tp_is_empty!9409 (not b!385004) (not b!385012) b_and!15977 (not b!385011) (not b!385009) (not b_next!8761))
(check-sat b_and!15977 (not b_next!8761))
