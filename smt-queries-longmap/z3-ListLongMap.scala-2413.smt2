; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38170 () Bool)

(assert start!38170)

(declare-fun b_free!9043 () Bool)

(declare-fun b_next!9043 () Bool)

(assert (=> start!38170 (= b_free!9043 (not b_next!9043))))

(declare-fun tp!31914 () Bool)

(declare-fun b_and!16431 () Bool)

(assert (=> start!38170 (= tp!31914 b_and!16431)))

(declare-fun b!393609 () Bool)

(declare-fun e!238308 () Bool)

(declare-fun tp_is_empty!9715 () Bool)

(assert (=> b!393609 (= e!238308 tp_is_empty!9715)))

(declare-fun b!393610 () Bool)

(declare-fun res!225537 () Bool)

(declare-fun e!238310 () Bool)

(assert (=> b!393610 (=> (not res!225537) (not e!238310))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393610 (= res!225537 (validKeyInArray!0 k0!778))))

(declare-fun res!225536 () Bool)

(assert (=> start!38170 (=> (not res!225536) (not e!238310))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38170 (= res!225536 (validMask!0 mask!970))))

(assert (=> start!38170 e!238310))

(declare-datatypes ((V!14059 0))(
  ( (V!14060 (val!4902 Int)) )
))
(declare-datatypes ((ValueCell!4514 0))(
  ( (ValueCellFull!4514 (v!7144 V!14059)) (EmptyCell!4514) )
))
(declare-datatypes ((array!23326 0))(
  ( (array!23327 (arr!11120 (Array (_ BitVec 32) ValueCell!4514)) (size!11472 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23326)

(declare-fun e!238312 () Bool)

(declare-fun array_inv!8218 (array!23326) Bool)

(assert (=> start!38170 (and (array_inv!8218 _values!506) e!238312)))

(assert (=> start!38170 tp!31914))

(assert (=> start!38170 true))

(assert (=> start!38170 tp_is_empty!9715))

(declare-datatypes ((array!23328 0))(
  ( (array!23329 (arr!11121 (Array (_ BitVec 32) (_ BitVec 64))) (size!11473 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23328)

(declare-fun array_inv!8219 (array!23328) Bool)

(assert (=> start!38170 (array_inv!8219 _keys!658)))

(declare-fun b!393611 () Bool)

(declare-fun res!225531 () Bool)

(assert (=> b!393611 (=> (not res!225531) (not e!238310))))

(declare-fun arrayContainsKey!0 (array!23328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393611 (= res!225531 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393612 () Bool)

(declare-fun e!238313 () Bool)

(declare-fun e!238307 () Bool)

(assert (=> b!393612 (= e!238313 (not e!238307))))

(declare-fun res!225527 () Bool)

(assert (=> b!393612 (=> res!225527 e!238307)))

(declare-fun lt!186380 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393612 (= res!225527 (or (and (not lt!186380) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186380) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186380)))))

(assert (=> b!393612 (= lt!186380 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6480 0))(
  ( (tuple2!6481 (_1!3251 (_ BitVec 64)) (_2!3251 V!14059)) )
))
(declare-datatypes ((List!6328 0))(
  ( (Nil!6325) (Cons!6324 (h!7180 tuple2!6480) (t!11492 List!6328)) )
))
(declare-datatypes ((ListLongMap!5395 0))(
  ( (ListLongMap!5396 (toList!2713 List!6328)) )
))
(declare-fun lt!186379 () ListLongMap!5395)

(declare-fun zeroValue!472 () V!14059)

(declare-fun minValue!472 () V!14059)

(declare-fun getCurrentListMap!2086 (array!23328 array!23326 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5395)

(assert (=> b!393612 (= lt!186379 (getCurrentListMap!2086 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186378 () ListLongMap!5395)

(declare-fun lt!186382 () array!23328)

(declare-fun lt!186384 () array!23326)

(assert (=> b!393612 (= lt!186378 (getCurrentListMap!2086 lt!186382 lt!186384 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186385 () ListLongMap!5395)

(declare-fun lt!186383 () ListLongMap!5395)

(assert (=> b!393612 (and (= lt!186385 lt!186383) (= lt!186383 lt!186385))))

(declare-fun lt!186377 () ListLongMap!5395)

(declare-fun v!373 () V!14059)

(declare-fun +!1067 (ListLongMap!5395 tuple2!6480) ListLongMap!5395)

(assert (=> b!393612 (= lt!186383 (+!1067 lt!186377 (tuple2!6481 k0!778 v!373)))))

(declare-datatypes ((Unit!12003 0))(
  ( (Unit!12004) )
))
(declare-fun lt!186381 () Unit!12003)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!277 (array!23328 array!23326 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) (_ BitVec 64) V!14059 (_ BitVec 32) Int) Unit!12003)

(assert (=> b!393612 (= lt!186381 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!277 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!975 (array!23328 array!23326 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5395)

(assert (=> b!393612 (= lt!186385 (getCurrentListMapNoExtraKeys!975 lt!186382 lt!186384 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393612 (= lt!186384 (array!23327 (store (arr!11120 _values!506) i!548 (ValueCellFull!4514 v!373)) (size!11472 _values!506)))))

(assert (=> b!393612 (= lt!186377 (getCurrentListMapNoExtraKeys!975 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393613 () Bool)

(declare-fun res!225530 () Bool)

(assert (=> b!393613 (=> (not res!225530) (not e!238310))))

(assert (=> b!393613 (= res!225530 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11473 _keys!658))))))

(declare-fun b!393614 () Bool)

(declare-fun res!225528 () Bool)

(assert (=> b!393614 (=> (not res!225528) (not e!238310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23328 (_ BitVec 32)) Bool)

(assert (=> b!393614 (= res!225528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393615 () Bool)

(declare-fun res!225534 () Bool)

(assert (=> b!393615 (=> (not res!225534) (not e!238310))))

(declare-datatypes ((List!6329 0))(
  ( (Nil!6326) (Cons!6325 (h!7181 (_ BitVec 64)) (t!11493 List!6329)) )
))
(declare-fun arrayNoDuplicates!0 (array!23328 (_ BitVec 32) List!6329) Bool)

(assert (=> b!393615 (= res!225534 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6326))))

(declare-fun mapNonEmpty!16170 () Bool)

(declare-fun mapRes!16170 () Bool)

(declare-fun tp!31913 () Bool)

(declare-fun e!238311 () Bool)

(assert (=> mapNonEmpty!16170 (= mapRes!16170 (and tp!31913 e!238311))))

(declare-fun mapRest!16170 () (Array (_ BitVec 32) ValueCell!4514))

(declare-fun mapValue!16170 () ValueCell!4514)

(declare-fun mapKey!16170 () (_ BitVec 32))

(assert (=> mapNonEmpty!16170 (= (arr!11120 _values!506) (store mapRest!16170 mapKey!16170 mapValue!16170))))

(declare-fun b!393616 () Bool)

(assert (=> b!393616 (= e!238311 tp_is_empty!9715)))

(declare-fun b!393617 () Bool)

(assert (=> b!393617 (= e!238307 true)))

(assert (=> b!393617 (= lt!186378 lt!186385)))

(declare-fun b!393618 () Bool)

(declare-fun res!225532 () Bool)

(assert (=> b!393618 (=> (not res!225532) (not e!238310))))

(assert (=> b!393618 (= res!225532 (and (= (size!11472 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11473 _keys!658) (size!11472 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16170 () Bool)

(assert (=> mapIsEmpty!16170 mapRes!16170))

(declare-fun b!393619 () Bool)

(declare-fun res!225529 () Bool)

(assert (=> b!393619 (=> (not res!225529) (not e!238313))))

(assert (=> b!393619 (= res!225529 (arrayNoDuplicates!0 lt!186382 #b00000000000000000000000000000000 Nil!6326))))

(declare-fun b!393620 () Bool)

(assert (=> b!393620 (= e!238312 (and e!238308 mapRes!16170))))

(declare-fun condMapEmpty!16170 () Bool)

(declare-fun mapDefault!16170 () ValueCell!4514)

(assert (=> b!393620 (= condMapEmpty!16170 (= (arr!11120 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4514)) mapDefault!16170)))))

(declare-fun b!393621 () Bool)

(declare-fun res!225533 () Bool)

(assert (=> b!393621 (=> (not res!225533) (not e!238310))))

(assert (=> b!393621 (= res!225533 (or (= (select (arr!11121 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11121 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393622 () Bool)

(assert (=> b!393622 (= e!238310 e!238313)))

(declare-fun res!225535 () Bool)

(assert (=> b!393622 (=> (not res!225535) (not e!238313))))

(assert (=> b!393622 (= res!225535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186382 mask!970))))

(assert (=> b!393622 (= lt!186382 (array!23329 (store (arr!11121 _keys!658) i!548 k0!778) (size!11473 _keys!658)))))

(assert (= (and start!38170 res!225536) b!393618))

(assert (= (and b!393618 res!225532) b!393614))

(assert (= (and b!393614 res!225528) b!393615))

(assert (= (and b!393615 res!225534) b!393613))

(assert (= (and b!393613 res!225530) b!393610))

(assert (= (and b!393610 res!225537) b!393621))

(assert (= (and b!393621 res!225533) b!393611))

(assert (= (and b!393611 res!225531) b!393622))

(assert (= (and b!393622 res!225535) b!393619))

(assert (= (and b!393619 res!225529) b!393612))

(assert (= (and b!393612 (not res!225527)) b!393617))

(assert (= (and b!393620 condMapEmpty!16170) mapIsEmpty!16170))

(assert (= (and b!393620 (not condMapEmpty!16170)) mapNonEmpty!16170))

(get-info :version)

(assert (= (and mapNonEmpty!16170 ((_ is ValueCellFull!4514) mapValue!16170)) b!393616))

(assert (= (and b!393620 ((_ is ValueCellFull!4514) mapDefault!16170)) b!393609))

(assert (= start!38170 b!393620))

(declare-fun m!390353 () Bool)

(assert (=> b!393610 m!390353))

(declare-fun m!390355 () Bool)

(assert (=> b!393622 m!390355))

(declare-fun m!390357 () Bool)

(assert (=> b!393622 m!390357))

(declare-fun m!390359 () Bool)

(assert (=> b!393615 m!390359))

(declare-fun m!390361 () Bool)

(assert (=> b!393612 m!390361))

(declare-fun m!390363 () Bool)

(assert (=> b!393612 m!390363))

(declare-fun m!390365 () Bool)

(assert (=> b!393612 m!390365))

(declare-fun m!390367 () Bool)

(assert (=> b!393612 m!390367))

(declare-fun m!390369 () Bool)

(assert (=> b!393612 m!390369))

(declare-fun m!390371 () Bool)

(assert (=> b!393612 m!390371))

(declare-fun m!390373 () Bool)

(assert (=> b!393612 m!390373))

(declare-fun m!390375 () Bool)

(assert (=> start!38170 m!390375))

(declare-fun m!390377 () Bool)

(assert (=> start!38170 m!390377))

(declare-fun m!390379 () Bool)

(assert (=> start!38170 m!390379))

(declare-fun m!390381 () Bool)

(assert (=> mapNonEmpty!16170 m!390381))

(declare-fun m!390383 () Bool)

(assert (=> b!393619 m!390383))

(declare-fun m!390385 () Bool)

(assert (=> b!393614 m!390385))

(declare-fun m!390387 () Bool)

(assert (=> b!393611 m!390387))

(declare-fun m!390389 () Bool)

(assert (=> b!393621 m!390389))

(check-sat (not b!393615) (not b!393622) (not b!393611) (not b!393610) (not mapNonEmpty!16170) b_and!16431 (not start!38170) tp_is_empty!9715 (not b!393619) (not b!393612) (not b!393614) (not b_next!9043))
(check-sat b_and!16431 (not b_next!9043))
