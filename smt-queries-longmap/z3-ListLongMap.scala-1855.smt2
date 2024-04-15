; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33496 () Bool)

(assert start!33496)

(declare-fun b_free!6799 () Bool)

(declare-fun b_next!6799 () Bool)

(assert (=> start!33496 (= b_free!6799 (not b_next!6799))))

(declare-fun tp!23892 () Bool)

(declare-fun b_and!13947 () Bool)

(assert (=> start!33496 (= tp!23892 b_and!13947)))

(declare-fun b!332251 () Bool)

(declare-fun res!183056 () Bool)

(declare-fun e!204018 () Bool)

(assert (=> b!332251 (=> (not res!183056) (not e!204018))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332251 (= res!183056 (validKeyInArray!0 k0!1348))))

(declare-fun b!332252 () Bool)

(declare-fun res!183055 () Bool)

(assert (=> b!332252 (=> (not res!183055) (not e!204018))))

(declare-datatypes ((array!17081 0))(
  ( (array!17082 (arr!8074 (Array (_ BitVec 32) (_ BitVec 64))) (size!8427 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17081)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17081 (_ BitVec 32)) Bool)

(assert (=> b!332252 (= res!183055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183057 () Bool)

(assert (=> start!33496 (=> (not res!183057) (not e!204018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33496 (= res!183057 (validMask!0 mask!2385))))

(assert (=> start!33496 e!204018))

(assert (=> start!33496 true))

(declare-fun tp_is_empty!6751 () Bool)

(assert (=> start!33496 tp_is_empty!6751))

(assert (=> start!33496 tp!23892))

(declare-datatypes ((V!9979 0))(
  ( (V!9980 (val!3420 Int)) )
))
(declare-datatypes ((ValueCell!3032 0))(
  ( (ValueCellFull!3032 (v!5573 V!9979)) (EmptyCell!3032) )
))
(declare-datatypes ((array!17083 0))(
  ( (array!17084 (arr!8075 (Array (_ BitVec 32) ValueCell!3032)) (size!8428 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17083)

(declare-fun e!204021 () Bool)

(declare-fun array_inv!6030 (array!17083) Bool)

(assert (=> start!33496 (and (array_inv!6030 _values!1525) e!204021)))

(declare-fun array_inv!6031 (array!17081) Bool)

(assert (=> start!33496 (array_inv!6031 _keys!1895)))

(declare-fun b!332253 () Bool)

(declare-fun e!204022 () Bool)

(declare-fun mapRes!11514 () Bool)

(assert (=> b!332253 (= e!204021 (and e!204022 mapRes!11514))))

(declare-fun condMapEmpty!11514 () Bool)

(declare-fun mapDefault!11514 () ValueCell!3032)

(assert (=> b!332253 (= condMapEmpty!11514 (= (arr!8075 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3032)) mapDefault!11514)))))

(declare-fun b!332254 () Bool)

(declare-fun res!183058 () Bool)

(assert (=> b!332254 (=> (not res!183058) (not e!204018))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332254 (= res!183058 (and (= (size!8428 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8427 _keys!1895) (size!8428 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11514 () Bool)

(declare-fun tp!23891 () Bool)

(declare-fun e!204019 () Bool)

(assert (=> mapNonEmpty!11514 (= mapRes!11514 (and tp!23891 e!204019))))

(declare-fun mapValue!11514 () ValueCell!3032)

(declare-fun mapKey!11514 () (_ BitVec 32))

(declare-fun mapRest!11514 () (Array (_ BitVec 32) ValueCell!3032))

(assert (=> mapNonEmpty!11514 (= (arr!8075 _values!1525) (store mapRest!11514 mapKey!11514 mapValue!11514))))

(declare-fun b!332255 () Bool)

(declare-fun res!183059 () Bool)

(assert (=> b!332255 (=> (not res!183059) (not e!204018))))

(declare-datatypes ((List!4562 0))(
  ( (Nil!4559) (Cons!4558 (h!5414 (_ BitVec 64)) (t!9635 List!4562)) )
))
(declare-fun arrayNoDuplicates!0 (array!17081 (_ BitVec 32) List!4562) Bool)

(assert (=> b!332255 (= res!183059 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4559))))

(declare-fun b!332256 () Bool)

(assert (=> b!332256 (= e!204018 false)))

(declare-fun zeroValue!1467 () V!9979)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!9979)

(declare-fun lt!158787 () Bool)

(declare-datatypes ((tuple2!4926 0))(
  ( (tuple2!4927 (_1!2474 (_ BitVec 64)) (_2!2474 V!9979)) )
))
(declare-datatypes ((List!4563 0))(
  ( (Nil!4560) (Cons!4559 (h!5415 tuple2!4926) (t!9636 List!4563)) )
))
(declare-datatypes ((ListLongMap!3829 0))(
  ( (ListLongMap!3830 (toList!1930 List!4563)) )
))
(declare-fun contains!1982 (ListLongMap!3829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1439 (array!17081 array!17083 (_ BitVec 32) (_ BitVec 32) V!9979 V!9979 (_ BitVec 32) Int) ListLongMap!3829)

(assert (=> b!332256 (= lt!158787 (contains!1982 (getCurrentListMap!1439 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332257 () Bool)

(assert (=> b!332257 (= e!204022 tp_is_empty!6751)))

(declare-fun b!332258 () Bool)

(assert (=> b!332258 (= e!204019 tp_is_empty!6751)))

(declare-fun mapIsEmpty!11514 () Bool)

(assert (=> mapIsEmpty!11514 mapRes!11514))

(assert (= (and start!33496 res!183057) b!332254))

(assert (= (and b!332254 res!183058) b!332252))

(assert (= (and b!332252 res!183055) b!332255))

(assert (= (and b!332255 res!183059) b!332251))

(assert (= (and b!332251 res!183056) b!332256))

(assert (= (and b!332253 condMapEmpty!11514) mapIsEmpty!11514))

(assert (= (and b!332253 (not condMapEmpty!11514)) mapNonEmpty!11514))

(get-info :version)

(assert (= (and mapNonEmpty!11514 ((_ is ValueCellFull!3032) mapValue!11514)) b!332258))

(assert (= (and b!332253 ((_ is ValueCellFull!3032) mapDefault!11514)) b!332257))

(assert (= start!33496 b!332253))

(declare-fun m!336275 () Bool)

(assert (=> b!332251 m!336275))

(declare-fun m!336277 () Bool)

(assert (=> mapNonEmpty!11514 m!336277))

(declare-fun m!336279 () Bool)

(assert (=> b!332256 m!336279))

(assert (=> b!332256 m!336279))

(declare-fun m!336281 () Bool)

(assert (=> b!332256 m!336281))

(declare-fun m!336283 () Bool)

(assert (=> b!332255 m!336283))

(declare-fun m!336285 () Bool)

(assert (=> b!332252 m!336285))

(declare-fun m!336287 () Bool)

(assert (=> start!33496 m!336287))

(declare-fun m!336289 () Bool)

(assert (=> start!33496 m!336289))

(declare-fun m!336291 () Bool)

(assert (=> start!33496 m!336291))

(check-sat (not b!332255) b_and!13947 (not b!332252) (not start!33496) (not b!332251) (not b_next!6799) tp_is_empty!6751 (not mapNonEmpty!11514) (not b!332256))
(check-sat b_and!13947 (not b_next!6799))
