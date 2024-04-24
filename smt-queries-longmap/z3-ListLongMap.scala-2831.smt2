; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40936 () Bool)

(assert start!40936)

(declare-fun b_free!10885 () Bool)

(declare-fun b_next!10885 () Bool)

(assert (=> start!40936 (= b_free!10885 (not b_next!10885))))

(declare-fun tp!38482 () Bool)

(declare-fun b_and!19037 () Bool)

(assert (=> start!40936 (= tp!38482 b_and!19037)))

(declare-fun b!455476 () Bool)

(declare-fun res!271641 () Bool)

(declare-fun e!266282 () Bool)

(assert (=> b!455476 (=> (not res!271641) (not e!266282))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455476 (= res!271641 (validKeyInArray!0 k0!794))))

(declare-fun b!455477 () Bool)

(declare-fun res!271645 () Bool)

(assert (=> b!455477 (=> (not res!271645) (not e!266282))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28240 0))(
  ( (array!28241 (arr!13563 (Array (_ BitVec 32) (_ BitVec 64))) (size!13915 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28240)

(assert (=> b!455477 (= res!271645 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13915 _keys!709))))))

(declare-fun res!271639 () Bool)

(assert (=> start!40936 (=> (not res!271639) (not e!266282))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40936 (= res!271639 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13915 _keys!709))))))

(assert (=> start!40936 e!266282))

(declare-fun tp_is_empty!12223 () Bool)

(assert (=> start!40936 tp_is_empty!12223))

(assert (=> start!40936 tp!38482))

(assert (=> start!40936 true))

(declare-datatypes ((V!17403 0))(
  ( (V!17404 (val!6156 Int)) )
))
(declare-datatypes ((ValueCell!5768 0))(
  ( (ValueCellFull!5768 (v!8423 V!17403)) (EmptyCell!5768) )
))
(declare-datatypes ((array!28242 0))(
  ( (array!28243 (arr!13564 (Array (_ BitVec 32) ValueCell!5768)) (size!13916 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28242)

(declare-fun e!266281 () Bool)

(declare-fun array_inv!9898 (array!28242) Bool)

(assert (=> start!40936 (and (array_inv!9898 _values!549) e!266281)))

(declare-fun array_inv!9899 (array!28240) Bool)

(assert (=> start!40936 (array_inv!9899 _keys!709)))

(declare-fun mapIsEmpty!19975 () Bool)

(declare-fun mapRes!19975 () Bool)

(assert (=> mapIsEmpty!19975 mapRes!19975))

(declare-fun b!455478 () Bool)

(declare-fun e!266279 () Bool)

(assert (=> b!455478 (= e!266279 tp_is_empty!12223)))

(declare-fun mapNonEmpty!19975 () Bool)

(declare-fun tp!38481 () Bool)

(assert (=> mapNonEmpty!19975 (= mapRes!19975 (and tp!38481 e!266279))))

(declare-fun mapRest!19975 () (Array (_ BitVec 32) ValueCell!5768))

(declare-fun mapValue!19975 () ValueCell!5768)

(declare-fun mapKey!19975 () (_ BitVec 32))

(assert (=> mapNonEmpty!19975 (= (arr!13564 _values!549) (store mapRest!19975 mapKey!19975 mapValue!19975))))

(declare-fun b!455479 () Bool)

(declare-fun e!266280 () Bool)

(assert (=> b!455479 (= e!266280 tp_is_empty!12223)))

(declare-fun b!455480 () Bool)

(declare-fun e!266283 () Bool)

(assert (=> b!455480 (= e!266283 false)))

(declare-fun minValue!515 () V!17403)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17403)

(declare-datatypes ((tuple2!8020 0))(
  ( (tuple2!8021 (_1!4021 (_ BitVec 64)) (_2!4021 V!17403)) )
))
(declare-datatypes ((List!8090 0))(
  ( (Nil!8087) (Cons!8086 (h!8942 tuple2!8020) (t!13910 List!8090)) )
))
(declare-datatypes ((ListLongMap!6935 0))(
  ( (ListLongMap!6936 (toList!3483 List!8090)) )
))
(declare-fun lt!206369 () ListLongMap!6935)

(declare-fun lt!206368 () array!28240)

(declare-fun v!412 () V!17403)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1712 (array!28240 array!28242 (_ BitVec 32) (_ BitVec 32) V!17403 V!17403 (_ BitVec 32) Int) ListLongMap!6935)

(assert (=> b!455480 (= lt!206369 (getCurrentListMapNoExtraKeys!1712 lt!206368 (array!28243 (store (arr!13564 _values!549) i!563 (ValueCellFull!5768 v!412)) (size!13916 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206367 () ListLongMap!6935)

(assert (=> b!455480 (= lt!206367 (getCurrentListMapNoExtraKeys!1712 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455481 () Bool)

(declare-fun res!271643 () Bool)

(assert (=> b!455481 (=> (not res!271643) (not e!266282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28240 (_ BitVec 32)) Bool)

(assert (=> b!455481 (= res!271643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455482 () Bool)

(declare-fun res!271640 () Bool)

(assert (=> b!455482 (=> (not res!271640) (not e!266283))))

(declare-datatypes ((List!8091 0))(
  ( (Nil!8088) (Cons!8087 (h!8943 (_ BitVec 64)) (t!13911 List!8091)) )
))
(declare-fun arrayNoDuplicates!0 (array!28240 (_ BitVec 32) List!8091) Bool)

(assert (=> b!455482 (= res!271640 (arrayNoDuplicates!0 lt!206368 #b00000000000000000000000000000000 Nil!8088))))

(declare-fun b!455483 () Bool)

(declare-fun res!271638 () Bool)

(assert (=> b!455483 (=> (not res!271638) (not e!266282))))

(assert (=> b!455483 (= res!271638 (and (= (size!13916 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13915 _keys!709) (size!13916 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455484 () Bool)

(declare-fun res!271648 () Bool)

(assert (=> b!455484 (=> (not res!271648) (not e!266282))))

(assert (=> b!455484 (= res!271648 (or (= (select (arr!13563 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13563 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455485 () Bool)

(declare-fun res!271647 () Bool)

(assert (=> b!455485 (=> (not res!271647) (not e!266282))))

(assert (=> b!455485 (= res!271647 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8088))))

(declare-fun b!455486 () Bool)

(assert (=> b!455486 (= e!266281 (and e!266280 mapRes!19975))))

(declare-fun condMapEmpty!19975 () Bool)

(declare-fun mapDefault!19975 () ValueCell!5768)

(assert (=> b!455486 (= condMapEmpty!19975 (= (arr!13564 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5768)) mapDefault!19975)))))

(declare-fun b!455487 () Bool)

(declare-fun res!271642 () Bool)

(assert (=> b!455487 (=> (not res!271642) (not e!266283))))

(assert (=> b!455487 (= res!271642 (bvsle from!863 i!563))))

(declare-fun b!455488 () Bool)

(assert (=> b!455488 (= e!266282 e!266283)))

(declare-fun res!271637 () Bool)

(assert (=> b!455488 (=> (not res!271637) (not e!266283))))

(assert (=> b!455488 (= res!271637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206368 mask!1025))))

(assert (=> b!455488 (= lt!206368 (array!28241 (store (arr!13563 _keys!709) i!563 k0!794) (size!13915 _keys!709)))))

(declare-fun b!455489 () Bool)

(declare-fun res!271644 () Bool)

(assert (=> b!455489 (=> (not res!271644) (not e!266282))))

(declare-fun arrayContainsKey!0 (array!28240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455489 (= res!271644 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455490 () Bool)

(declare-fun res!271646 () Bool)

(assert (=> b!455490 (=> (not res!271646) (not e!266282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455490 (= res!271646 (validMask!0 mask!1025))))

(assert (= (and start!40936 res!271639) b!455490))

(assert (= (and b!455490 res!271646) b!455483))

(assert (= (and b!455483 res!271638) b!455481))

(assert (= (and b!455481 res!271643) b!455485))

(assert (= (and b!455485 res!271647) b!455477))

(assert (= (and b!455477 res!271645) b!455476))

(assert (= (and b!455476 res!271641) b!455484))

(assert (= (and b!455484 res!271648) b!455489))

(assert (= (and b!455489 res!271644) b!455488))

(assert (= (and b!455488 res!271637) b!455482))

(assert (= (and b!455482 res!271640) b!455487))

(assert (= (and b!455487 res!271642) b!455480))

(assert (= (and b!455486 condMapEmpty!19975) mapIsEmpty!19975))

(assert (= (and b!455486 (not condMapEmpty!19975)) mapNonEmpty!19975))

(get-info :version)

(assert (= (and mapNonEmpty!19975 ((_ is ValueCellFull!5768) mapValue!19975)) b!455478))

(assert (= (and b!455486 ((_ is ValueCellFull!5768) mapDefault!19975)) b!455479))

(assert (= start!40936 b!455486))

(declare-fun m!439473 () Bool)

(assert (=> b!455476 m!439473))

(declare-fun m!439475 () Bool)

(assert (=> b!455480 m!439475))

(declare-fun m!439477 () Bool)

(assert (=> b!455480 m!439477))

(declare-fun m!439479 () Bool)

(assert (=> b!455480 m!439479))

(declare-fun m!439481 () Bool)

(assert (=> b!455481 m!439481))

(declare-fun m!439483 () Bool)

(assert (=> mapNonEmpty!19975 m!439483))

(declare-fun m!439485 () Bool)

(assert (=> b!455484 m!439485))

(declare-fun m!439487 () Bool)

(assert (=> b!455489 m!439487))

(declare-fun m!439489 () Bool)

(assert (=> b!455488 m!439489))

(declare-fun m!439491 () Bool)

(assert (=> b!455488 m!439491))

(declare-fun m!439493 () Bool)

(assert (=> start!40936 m!439493))

(declare-fun m!439495 () Bool)

(assert (=> start!40936 m!439495))

(declare-fun m!439497 () Bool)

(assert (=> b!455482 m!439497))

(declare-fun m!439499 () Bool)

(assert (=> b!455485 m!439499))

(declare-fun m!439501 () Bool)

(assert (=> b!455490 m!439501))

(check-sat (not b!455480) (not b!455488) (not b!455485) (not mapNonEmpty!19975) (not b!455482) tp_is_empty!12223 (not b!455489) (not start!40936) b_and!19037 (not b!455476) (not b_next!10885) (not b!455481) (not b!455490))
(check-sat b_and!19037 (not b_next!10885))
