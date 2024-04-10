; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83108 () Bool)

(assert start!83108)

(declare-fun b_free!19101 () Bool)

(declare-fun b_next!19101 () Bool)

(assert (=> start!83108 (= b_free!19101 (not b_next!19101))))

(declare-fun tp!66582 () Bool)

(declare-fun b_and!30589 () Bool)

(assert (=> start!83108 (= tp!66582 b_and!30589)))

(declare-fun b!969458 () Bool)

(declare-fun res!648876 () Bool)

(declare-fun e!546555 () Bool)

(assert (=> b!969458 (=> (not res!648876) (not e!546555))))

(declare-datatypes ((array!60063 0))(
  ( (array!60064 (arr!28895 (Array (_ BitVec 32) (_ BitVec 64))) (size!29374 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60063)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969458 (= res!648876 (validKeyInArray!0 (select (arr!28895 _keys!1717) i!822)))))

(declare-fun b!969459 () Bool)

(declare-fun res!648872 () Bool)

(assert (=> b!969459 (=> (not res!648872) (not e!546555))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60063 (_ BitVec 32)) Bool)

(assert (=> b!969459 (= res!648872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969460 () Bool)

(declare-fun e!546559 () Bool)

(declare-fun e!546558 () Bool)

(declare-fun mapRes!35008 () Bool)

(assert (=> b!969460 (= e!546559 (and e!546558 mapRes!35008))))

(declare-fun condMapEmpty!35008 () Bool)

(declare-datatypes ((V!34315 0))(
  ( (V!34316 (val!11050 Int)) )
))
(declare-datatypes ((ValueCell!10518 0))(
  ( (ValueCellFull!10518 (v!13609 V!34315)) (EmptyCell!10518) )
))
(declare-datatypes ((array!60065 0))(
  ( (array!60066 (arr!28896 (Array (_ BitVec 32) ValueCell!10518)) (size!29375 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60065)

(declare-fun mapDefault!35008 () ValueCell!10518)

(assert (=> b!969460 (= condMapEmpty!35008 (= (arr!28896 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10518)) mapDefault!35008)))))

(declare-fun b!969461 () Bool)

(declare-fun e!546556 () Bool)

(declare-fun tp_is_empty!21999 () Bool)

(assert (=> b!969461 (= e!546556 tp_is_empty!21999)))

(declare-fun mapNonEmpty!35008 () Bool)

(declare-fun tp!66581 () Bool)

(assert (=> mapNonEmpty!35008 (= mapRes!35008 (and tp!66581 e!546556))))

(declare-fun mapRest!35008 () (Array (_ BitVec 32) ValueCell!10518))

(declare-fun mapValue!35008 () ValueCell!10518)

(declare-fun mapKey!35008 () (_ BitVec 32))

(assert (=> mapNonEmpty!35008 (= (arr!28896 _values!1425) (store mapRest!35008 mapKey!35008 mapValue!35008))))

(declare-fun res!648871 () Bool)

(assert (=> start!83108 (=> (not res!648871) (not e!546555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83108 (= res!648871 (validMask!0 mask!2147))))

(assert (=> start!83108 e!546555))

(assert (=> start!83108 true))

(declare-fun array_inv!22369 (array!60065) Bool)

(assert (=> start!83108 (and (array_inv!22369 _values!1425) e!546559)))

(assert (=> start!83108 tp_is_empty!21999))

(assert (=> start!83108 tp!66582))

(declare-fun array_inv!22370 (array!60063) Bool)

(assert (=> start!83108 (array_inv!22370 _keys!1717)))

(declare-fun b!969462 () Bool)

(assert (=> b!969462 (= e!546558 tp_is_empty!21999)))

(declare-fun b!969463 () Bool)

(declare-fun res!648873 () Bool)

(assert (=> b!969463 (=> (not res!648873) (not e!546555))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969463 (= res!648873 (and (= (size!29375 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29374 _keys!1717) (size!29375 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969464 () Bool)

(assert (=> b!969464 (= e!546555 false)))

(declare-fun zeroValue!1367 () V!34315)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431639 () Bool)

(declare-fun minValue!1367 () V!34315)

(declare-datatypes ((tuple2!14160 0))(
  ( (tuple2!14161 (_1!7091 (_ BitVec 64)) (_2!7091 V!34315)) )
))
(declare-datatypes ((List!20028 0))(
  ( (Nil!20025) (Cons!20024 (h!21186 tuple2!14160) (t!28391 List!20028)) )
))
(declare-datatypes ((ListLongMap!12857 0))(
  ( (ListLongMap!12858 (toList!6444 List!20028)) )
))
(declare-fun contains!5548 (ListLongMap!12857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3677 (array!60063 array!60065 (_ BitVec 32) (_ BitVec 32) V!34315 V!34315 (_ BitVec 32) Int) ListLongMap!12857)

(assert (=> b!969464 (= lt!431639 (contains!5548 (getCurrentListMap!3677 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28895 _keys!1717) i!822)))))

(declare-fun b!969465 () Bool)

(declare-fun res!648874 () Bool)

(assert (=> b!969465 (=> (not res!648874) (not e!546555))))

(declare-datatypes ((List!20029 0))(
  ( (Nil!20026) (Cons!20025 (h!21187 (_ BitVec 64)) (t!28392 List!20029)) )
))
(declare-fun arrayNoDuplicates!0 (array!60063 (_ BitVec 32) List!20029) Bool)

(assert (=> b!969465 (= res!648874 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20026))))

(declare-fun mapIsEmpty!35008 () Bool)

(assert (=> mapIsEmpty!35008 mapRes!35008))

(declare-fun b!969466 () Bool)

(declare-fun res!648875 () Bool)

(assert (=> b!969466 (=> (not res!648875) (not e!546555))))

(assert (=> b!969466 (= res!648875 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29374 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29374 _keys!1717))))))

(assert (= (and start!83108 res!648871) b!969463))

(assert (= (and b!969463 res!648873) b!969459))

(assert (= (and b!969459 res!648872) b!969465))

(assert (= (and b!969465 res!648874) b!969466))

(assert (= (and b!969466 res!648875) b!969458))

(assert (= (and b!969458 res!648876) b!969464))

(assert (= (and b!969460 condMapEmpty!35008) mapIsEmpty!35008))

(assert (= (and b!969460 (not condMapEmpty!35008)) mapNonEmpty!35008))

(get-info :version)

(assert (= (and mapNonEmpty!35008 ((_ is ValueCellFull!10518) mapValue!35008)) b!969461))

(assert (= (and b!969460 ((_ is ValueCellFull!10518) mapDefault!35008)) b!969462))

(assert (= start!83108 b!969460))

(declare-fun m!897447 () Bool)

(assert (=> b!969458 m!897447))

(assert (=> b!969458 m!897447))

(declare-fun m!897449 () Bool)

(assert (=> b!969458 m!897449))

(declare-fun m!897451 () Bool)

(assert (=> start!83108 m!897451))

(declare-fun m!897453 () Bool)

(assert (=> start!83108 m!897453))

(declare-fun m!897455 () Bool)

(assert (=> start!83108 m!897455))

(declare-fun m!897457 () Bool)

(assert (=> mapNonEmpty!35008 m!897457))

(declare-fun m!897459 () Bool)

(assert (=> b!969465 m!897459))

(declare-fun m!897461 () Bool)

(assert (=> b!969464 m!897461))

(assert (=> b!969464 m!897447))

(assert (=> b!969464 m!897461))

(assert (=> b!969464 m!897447))

(declare-fun m!897463 () Bool)

(assert (=> b!969464 m!897463))

(declare-fun m!897465 () Bool)

(assert (=> b!969459 m!897465))

(check-sat (not b!969458) b_and!30589 (not b!969464) (not b_next!19101) (not b!969465) (not b!969459) (not start!83108) (not mapNonEmpty!35008) tp_is_empty!21999)
(check-sat b_and!30589 (not b_next!19101))
