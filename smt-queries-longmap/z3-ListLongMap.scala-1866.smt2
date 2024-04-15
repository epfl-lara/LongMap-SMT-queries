; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33616 () Bool)

(assert start!33616)

(declare-fun b_free!6865 () Bool)

(declare-fun b_next!6865 () Bool)

(assert (=> start!33616 (= b_free!6865 (not b_next!6865))))

(declare-fun tp!24099 () Bool)

(declare-fun b_and!14019 () Bool)

(assert (=> start!33616 (= tp!24099 b_and!14019)))

(declare-fun b!333502 () Bool)

(declare-fun res!183764 () Bool)

(declare-fun e!204758 () Bool)

(assert (=> b!333502 (=> (not res!183764) (not e!204758))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10067 0))(
  ( (V!10068 (val!3453 Int)) )
))
(declare-fun zeroValue!1467 () V!10067)

(declare-datatypes ((ValueCell!3065 0))(
  ( (ValueCellFull!3065 (v!5609 V!10067)) (EmptyCell!3065) )
))
(declare-datatypes ((array!17213 0))(
  ( (array!17214 (arr!8137 (Array (_ BitVec 32) ValueCell!3065)) (size!8490 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17213)

(declare-datatypes ((array!17215 0))(
  ( (array!17216 (arr!8138 (Array (_ BitVec 32) (_ BitVec 64))) (size!8491 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17215)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10067)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!4966 0))(
  ( (tuple2!4967 (_1!2494 (_ BitVec 64)) (_2!2494 V!10067)) )
))
(declare-datatypes ((List!4605 0))(
  ( (Nil!4602) (Cons!4601 (h!5457 tuple2!4966) (t!9684 List!4605)) )
))
(declare-datatypes ((ListLongMap!3869 0))(
  ( (ListLongMap!3870 (toList!1950 List!4605)) )
))
(declare-fun contains!2005 (ListLongMap!3869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1459 (array!17215 array!17213 (_ BitVec 32) (_ BitVec 32) V!10067 V!10067 (_ BitVec 32) Int) ListLongMap!3869)

(assert (=> b!333502 (= res!183764 (not (contains!2005 (getCurrentListMap!1459 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333503 () Bool)

(declare-fun e!204759 () Bool)

(declare-fun tp_is_empty!6817 () Bool)

(assert (=> b!333503 (= e!204759 tp_is_empty!6817)))

(declare-fun mapIsEmpty!11622 () Bool)

(declare-fun mapRes!11622 () Bool)

(assert (=> mapIsEmpty!11622 mapRes!11622))

(declare-fun b!333504 () Bool)

(declare-fun res!183769 () Bool)

(declare-fun e!204763 () Bool)

(assert (=> b!333504 (=> (not res!183769) (not e!204763))))

(declare-datatypes ((SeekEntryResult!3143 0))(
  ( (MissingZero!3143 (index!14751 (_ BitVec 32))) (Found!3143 (index!14752 (_ BitVec 32))) (Intermediate!3143 (undefined!3955 Bool) (index!14753 (_ BitVec 32)) (x!33248 (_ BitVec 32))) (Undefined!3143) (MissingVacant!3143 (index!14754 (_ BitVec 32))) )
))
(declare-fun lt!159167 () SeekEntryResult!3143)

(declare-fun arrayContainsKey!0 (array!17215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333504 (= res!183769 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14752 lt!159167)))))

(declare-fun b!333505 () Bool)

(declare-fun res!183763 () Bool)

(assert (=> b!333505 (=> (not res!183763) (not e!204758))))

(assert (=> b!333505 (= res!183763 (and (= (size!8490 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8491 _keys!1895) (size!8490 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333506 () Bool)

(declare-fun res!183765 () Bool)

(assert (=> b!333506 (=> (not res!183765) (not e!204758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17215 (_ BitVec 32)) Bool)

(assert (=> b!333506 (= res!183765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333507 () Bool)

(assert (=> b!333507 (= e!204763 (not true))))

(assert (=> b!333507 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10350 0))(
  ( (Unit!10351) )
))
(declare-fun lt!159168 () Unit!10350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17215 (_ BitVec 64) (_ BitVec 32)) Unit!10350)

(assert (=> b!333507 (= lt!159168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14752 lt!159167)))))

(declare-fun mapNonEmpty!11622 () Bool)

(declare-fun tp!24098 () Bool)

(assert (=> mapNonEmpty!11622 (= mapRes!11622 (and tp!24098 e!204759))))

(declare-fun mapKey!11622 () (_ BitVec 32))

(declare-fun mapRest!11622 () (Array (_ BitVec 32) ValueCell!3065))

(declare-fun mapValue!11622 () ValueCell!3065)

(assert (=> mapNonEmpty!11622 (= (arr!8137 _values!1525) (store mapRest!11622 mapKey!11622 mapValue!11622))))

(declare-fun b!333509 () Bool)

(declare-fun e!204760 () Bool)

(declare-fun e!204761 () Bool)

(assert (=> b!333509 (= e!204760 (and e!204761 mapRes!11622))))

(declare-fun condMapEmpty!11622 () Bool)

(declare-fun mapDefault!11622 () ValueCell!3065)

(assert (=> b!333509 (= condMapEmpty!11622 (= (arr!8137 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3065)) mapDefault!11622)))))

(declare-fun b!333510 () Bool)

(declare-fun res!183766 () Bool)

(assert (=> b!333510 (=> (not res!183766) (not e!204758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333510 (= res!183766 (validKeyInArray!0 k0!1348))))

(declare-fun b!333511 () Bool)

(declare-fun res!183768 () Bool)

(assert (=> b!333511 (=> (not res!183768) (not e!204758))))

(declare-datatypes ((List!4606 0))(
  ( (Nil!4603) (Cons!4602 (h!5458 (_ BitVec 64)) (t!9685 List!4606)) )
))
(declare-fun arrayNoDuplicates!0 (array!17215 (_ BitVec 32) List!4606) Bool)

(assert (=> b!333511 (= res!183768 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4603))))

(declare-fun b!333512 () Bool)

(assert (=> b!333512 (= e!204758 e!204763)))

(declare-fun res!183767 () Bool)

(assert (=> b!333512 (=> (not res!183767) (not e!204763))))

(get-info :version)

(assert (=> b!333512 (= res!183767 (and ((_ is Found!3143) lt!159167) (= (select (arr!8138 _keys!1895) (index!14752 lt!159167)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17215 (_ BitVec 32)) SeekEntryResult!3143)

(assert (=> b!333512 (= lt!159167 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!183770 () Bool)

(assert (=> start!33616 (=> (not res!183770) (not e!204758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33616 (= res!183770 (validMask!0 mask!2385))))

(assert (=> start!33616 e!204758))

(assert (=> start!33616 true))

(assert (=> start!33616 tp_is_empty!6817))

(assert (=> start!33616 tp!24099))

(declare-fun array_inv!6070 (array!17213) Bool)

(assert (=> start!33616 (and (array_inv!6070 _values!1525) e!204760)))

(declare-fun array_inv!6071 (array!17215) Bool)

(assert (=> start!33616 (array_inv!6071 _keys!1895)))

(declare-fun b!333508 () Bool)

(assert (=> b!333508 (= e!204761 tp_is_empty!6817)))

(assert (= (and start!33616 res!183770) b!333505))

(assert (= (and b!333505 res!183763) b!333506))

(assert (= (and b!333506 res!183765) b!333511))

(assert (= (and b!333511 res!183768) b!333510))

(assert (= (and b!333510 res!183766) b!333502))

(assert (= (and b!333502 res!183764) b!333512))

(assert (= (and b!333512 res!183767) b!333504))

(assert (= (and b!333504 res!183769) b!333507))

(assert (= (and b!333509 condMapEmpty!11622) mapIsEmpty!11622))

(assert (= (and b!333509 (not condMapEmpty!11622)) mapNonEmpty!11622))

(assert (= (and mapNonEmpty!11622 ((_ is ValueCellFull!3065) mapValue!11622)) b!333503))

(assert (= (and b!333509 ((_ is ValueCellFull!3065) mapDefault!11622)) b!333508))

(assert (= start!33616 b!333509))

(declare-fun m!337211 () Bool)

(assert (=> b!333512 m!337211))

(declare-fun m!337213 () Bool)

(assert (=> b!333512 m!337213))

(declare-fun m!337215 () Bool)

(assert (=> b!333504 m!337215))

(declare-fun m!337217 () Bool)

(assert (=> b!333510 m!337217))

(declare-fun m!337219 () Bool)

(assert (=> start!33616 m!337219))

(declare-fun m!337221 () Bool)

(assert (=> start!33616 m!337221))

(declare-fun m!337223 () Bool)

(assert (=> start!33616 m!337223))

(declare-fun m!337225 () Bool)

(assert (=> b!333511 m!337225))

(declare-fun m!337227 () Bool)

(assert (=> b!333502 m!337227))

(assert (=> b!333502 m!337227))

(declare-fun m!337229 () Bool)

(assert (=> b!333502 m!337229))

(declare-fun m!337231 () Bool)

(assert (=> mapNonEmpty!11622 m!337231))

(declare-fun m!337233 () Bool)

(assert (=> b!333506 m!337233))

(declare-fun m!337235 () Bool)

(assert (=> b!333507 m!337235))

(declare-fun m!337237 () Bool)

(assert (=> b!333507 m!337237))

(check-sat (not start!33616) b_and!14019 tp_is_empty!6817 (not b!333510) (not b!333507) (not b!333504) (not b!333512) (not b_next!6865) (not b!333506) (not b!333511) (not mapNonEmpty!11622) (not b!333502))
(check-sat b_and!14019 (not b_next!6865))
