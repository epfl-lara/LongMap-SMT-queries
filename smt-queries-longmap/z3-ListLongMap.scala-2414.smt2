; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38176 () Bool)

(assert start!38176)

(declare-fun b_free!9049 () Bool)

(declare-fun b_next!9049 () Bool)

(assert (=> start!38176 (= b_free!9049 (not b_next!9049))))

(declare-fun tp!31932 () Bool)

(declare-fun b_and!16397 () Bool)

(assert (=> start!38176 (= tp!31932 b_and!16397)))

(declare-fun b!393513 () Bool)

(declare-fun res!225505 () Bool)

(declare-fun e!238230 () Bool)

(assert (=> b!393513 (=> (not res!225505) (not e!238230))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23333 0))(
  ( (array!23334 (arr!11124 (Array (_ BitVec 32) (_ BitVec 64))) (size!11477 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23333)

(assert (=> b!393513 (= res!225505 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11477 _keys!658))))))

(declare-fun b!393514 () Bool)

(declare-fun res!225502 () Bool)

(assert (=> b!393514 (=> (not res!225502) (not e!238230))))

(declare-datatypes ((List!6431 0))(
  ( (Nil!6428) (Cons!6427 (h!7283 (_ BitVec 64)) (t!11594 List!6431)) )
))
(declare-fun arrayNoDuplicates!0 (array!23333 (_ BitVec 32) List!6431) Bool)

(assert (=> b!393514 (= res!225502 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6428))))

(declare-fun b!393515 () Bool)

(declare-fun res!225501 () Bool)

(assert (=> b!393515 (=> (not res!225501) (not e!238230))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14067 0))(
  ( (V!14068 (val!4905 Int)) )
))
(declare-datatypes ((ValueCell!4517 0))(
  ( (ValueCellFull!4517 (v!7140 V!14067)) (EmptyCell!4517) )
))
(declare-datatypes ((array!23335 0))(
  ( (array!23336 (arr!11125 (Array (_ BitVec 32) ValueCell!4517)) (size!11478 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23335)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!393515 (= res!225501 (and (= (size!11478 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11477 _keys!658) (size!11478 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393517 () Bool)

(declare-fun res!225509 () Bool)

(assert (=> b!393517 (=> (not res!225509) (not e!238230))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393517 (= res!225509 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393518 () Bool)

(declare-fun e!238232 () Bool)

(declare-fun tp_is_empty!9721 () Bool)

(assert (=> b!393518 (= e!238232 tp_is_empty!9721)))

(declare-fun mapNonEmpty!16179 () Bool)

(declare-fun mapRes!16179 () Bool)

(declare-fun tp!31931 () Bool)

(declare-fun e!238233 () Bool)

(assert (=> mapNonEmpty!16179 (= mapRes!16179 (and tp!31931 e!238233))))

(declare-fun mapKey!16179 () (_ BitVec 32))

(declare-fun mapValue!16179 () ValueCell!4517)

(declare-fun mapRest!16179 () (Array (_ BitVec 32) ValueCell!4517))

(assert (=> mapNonEmpty!16179 (= (arr!11125 _values!506) (store mapRest!16179 mapKey!16179 mapValue!16179))))

(declare-fun b!393519 () Bool)

(assert (=> b!393519 (= e!238233 tp_is_empty!9721)))

(declare-fun b!393520 () Bool)

(declare-fun res!225507 () Bool)

(assert (=> b!393520 (=> (not res!225507) (not e!238230))))

(assert (=> b!393520 (= res!225507 (or (= (select (arr!11124 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11124 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393521 () Bool)

(declare-fun e!238228 () Bool)

(assert (=> b!393521 (= e!238228 (and e!238232 mapRes!16179))))

(declare-fun condMapEmpty!16179 () Bool)

(declare-fun mapDefault!16179 () ValueCell!4517)

(assert (=> b!393521 (= condMapEmpty!16179 (= (arr!11125 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4517)) mapDefault!16179)))))

(declare-fun b!393522 () Bool)

(declare-fun res!225503 () Bool)

(declare-fun e!238229 () Bool)

(assert (=> b!393522 (=> (not res!225503) (not e!238229))))

(declare-fun lt!186212 () array!23333)

(assert (=> b!393522 (= res!225503 (arrayNoDuplicates!0 lt!186212 #b00000000000000000000000000000000 Nil!6428))))

(declare-fun b!393523 () Bool)

(declare-fun e!238231 () Bool)

(assert (=> b!393523 (= e!238229 (not e!238231))))

(declare-fun res!225510 () Bool)

(assert (=> b!393523 (=> res!225510 e!238231)))

(declare-fun lt!186206 () Bool)

(assert (=> b!393523 (= res!225510 (or (and (not lt!186206) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186206) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186206)))))

(assert (=> b!393523 (= lt!186206 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6590 0))(
  ( (tuple2!6591 (_1!3306 (_ BitVec 64)) (_2!3306 V!14067)) )
))
(declare-datatypes ((List!6432 0))(
  ( (Nil!6429) (Cons!6428 (h!7284 tuple2!6590) (t!11595 List!6432)) )
))
(declare-datatypes ((ListLongMap!5493 0))(
  ( (ListLongMap!5494 (toList!2762 List!6432)) )
))
(declare-fun lt!186205 () ListLongMap!5493)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14067)

(declare-fun minValue!472 () V!14067)

(declare-fun getCurrentListMap!2077 (array!23333 array!23335 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) Int) ListLongMap!5493)

(assert (=> b!393523 (= lt!186205 (getCurrentListMap!2077 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186211 () ListLongMap!5493)

(declare-fun lt!186207 () array!23335)

(assert (=> b!393523 (= lt!186211 (getCurrentListMap!2077 lt!186212 lt!186207 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186209 () ListLongMap!5493)

(declare-fun lt!186208 () ListLongMap!5493)

(assert (=> b!393523 (and (= lt!186209 lt!186208) (= lt!186208 lt!186209))))

(declare-fun v!373 () V!14067)

(declare-fun lt!186210 () ListLongMap!5493)

(declare-fun +!1082 (ListLongMap!5493 tuple2!6590) ListLongMap!5493)

(assert (=> b!393523 (= lt!186208 (+!1082 lt!186210 (tuple2!6591 k0!778 v!373)))))

(declare-datatypes ((Unit!12014 0))(
  ( (Unit!12015) )
))
(declare-fun lt!186213 () Unit!12014)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!278 (array!23333 array!23335 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) (_ BitVec 64) V!14067 (_ BitVec 32) Int) Unit!12014)

(assert (=> b!393523 (= lt!186213 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!278 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!987 (array!23333 array!23335 (_ BitVec 32) (_ BitVec 32) V!14067 V!14067 (_ BitVec 32) Int) ListLongMap!5493)

(assert (=> b!393523 (= lt!186209 (getCurrentListMapNoExtraKeys!987 lt!186212 lt!186207 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393523 (= lt!186207 (array!23336 (store (arr!11125 _values!506) i!548 (ValueCellFull!4517 v!373)) (size!11478 _values!506)))))

(assert (=> b!393523 (= lt!186210 (getCurrentListMapNoExtraKeys!987 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393524 () Bool)

(assert (=> b!393524 (= e!238231 (bvslt i!548 (size!11478 _values!506)))))

(assert (=> b!393524 (= lt!186211 lt!186209)))

(declare-fun b!393525 () Bool)

(declare-fun res!225500 () Bool)

(assert (=> b!393525 (=> (not res!225500) (not e!238230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23333 (_ BitVec 32)) Bool)

(assert (=> b!393525 (= res!225500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393516 () Bool)

(declare-fun res!225506 () Bool)

(assert (=> b!393516 (=> (not res!225506) (not e!238230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393516 (= res!225506 (validKeyInArray!0 k0!778))))

(declare-fun res!225508 () Bool)

(assert (=> start!38176 (=> (not res!225508) (not e!238230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38176 (= res!225508 (validMask!0 mask!970))))

(assert (=> start!38176 e!238230))

(declare-fun array_inv!8166 (array!23335) Bool)

(assert (=> start!38176 (and (array_inv!8166 _values!506) e!238228)))

(assert (=> start!38176 tp!31932))

(assert (=> start!38176 true))

(assert (=> start!38176 tp_is_empty!9721))

(declare-fun array_inv!8167 (array!23333) Bool)

(assert (=> start!38176 (array_inv!8167 _keys!658)))

(declare-fun b!393526 () Bool)

(assert (=> b!393526 (= e!238230 e!238229)))

(declare-fun res!225504 () Bool)

(assert (=> b!393526 (=> (not res!225504) (not e!238229))))

(assert (=> b!393526 (= res!225504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186212 mask!970))))

(assert (=> b!393526 (= lt!186212 (array!23334 (store (arr!11124 _keys!658) i!548 k0!778) (size!11477 _keys!658)))))

(declare-fun mapIsEmpty!16179 () Bool)

(assert (=> mapIsEmpty!16179 mapRes!16179))

(assert (= (and start!38176 res!225508) b!393515))

(assert (= (and b!393515 res!225501) b!393525))

(assert (= (and b!393525 res!225500) b!393514))

(assert (= (and b!393514 res!225502) b!393513))

(assert (= (and b!393513 res!225505) b!393516))

(assert (= (and b!393516 res!225506) b!393520))

(assert (= (and b!393520 res!225507) b!393517))

(assert (= (and b!393517 res!225509) b!393526))

(assert (= (and b!393526 res!225504) b!393522))

(assert (= (and b!393522 res!225503) b!393523))

(assert (= (and b!393523 (not res!225510)) b!393524))

(assert (= (and b!393521 condMapEmpty!16179) mapIsEmpty!16179))

(assert (= (and b!393521 (not condMapEmpty!16179)) mapNonEmpty!16179))

(get-info :version)

(assert (= (and mapNonEmpty!16179 ((_ is ValueCellFull!4517) mapValue!16179)) b!393519))

(assert (= (and b!393521 ((_ is ValueCellFull!4517) mapDefault!16179)) b!393518))

(assert (= start!38176 b!393521))

(declare-fun m!389513 () Bool)

(assert (=> start!38176 m!389513))

(declare-fun m!389515 () Bool)

(assert (=> start!38176 m!389515))

(declare-fun m!389517 () Bool)

(assert (=> start!38176 m!389517))

(declare-fun m!389519 () Bool)

(assert (=> b!393516 m!389519))

(declare-fun m!389521 () Bool)

(assert (=> b!393520 m!389521))

(declare-fun m!389523 () Bool)

(assert (=> b!393526 m!389523))

(declare-fun m!389525 () Bool)

(assert (=> b!393526 m!389525))

(declare-fun m!389527 () Bool)

(assert (=> b!393522 m!389527))

(declare-fun m!389529 () Bool)

(assert (=> mapNonEmpty!16179 m!389529))

(declare-fun m!389531 () Bool)

(assert (=> b!393523 m!389531))

(declare-fun m!389533 () Bool)

(assert (=> b!393523 m!389533))

(declare-fun m!389535 () Bool)

(assert (=> b!393523 m!389535))

(declare-fun m!389537 () Bool)

(assert (=> b!393523 m!389537))

(declare-fun m!389539 () Bool)

(assert (=> b!393523 m!389539))

(declare-fun m!389541 () Bool)

(assert (=> b!393523 m!389541))

(declare-fun m!389543 () Bool)

(assert (=> b!393523 m!389543))

(declare-fun m!389545 () Bool)

(assert (=> b!393517 m!389545))

(declare-fun m!389547 () Bool)

(assert (=> b!393514 m!389547))

(declare-fun m!389549 () Bool)

(assert (=> b!393525 m!389549))

(check-sat (not b!393523) (not b!393522) (not b!393517) b_and!16397 (not b!393525) (not b!393514) (not b_next!9049) (not b!393516) (not b!393526) tp_is_empty!9721 (not start!38176) (not mapNonEmpty!16179))
(check-sat b_and!16397 (not b_next!9049))
