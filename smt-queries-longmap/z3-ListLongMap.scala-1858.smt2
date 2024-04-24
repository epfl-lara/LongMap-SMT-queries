; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33514 () Bool)

(assert start!33514)

(declare-fun b_free!6817 () Bool)

(declare-fun b_next!6817 () Bool)

(assert (=> start!33514 (= b_free!6817 (not b_next!6817))))

(declare-fun tp!23946 () Bool)

(declare-fun b_and!14005 () Bool)

(assert (=> start!33514 (= tp!23946 b_and!14005)))

(declare-fun b!332698 () Bool)

(declare-fun res!183327 () Bool)

(declare-fun e!204299 () Bool)

(assert (=> b!332698 (=> (not res!183327) (not e!204299))))

(declare-datatypes ((array!17130 0))(
  ( (array!17131 (arr!8098 (Array (_ BitVec 32) (_ BitVec 64))) (size!8450 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17130)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17130 (_ BitVec 32)) Bool)

(assert (=> b!332698 (= res!183327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332699 () Bool)

(declare-fun res!183325 () Bool)

(assert (=> b!332699 (=> (not res!183325) (not e!204299))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332699 (= res!183325 (validKeyInArray!0 k0!1348))))

(declare-fun res!183328 () Bool)

(assert (=> start!33514 (=> (not res!183328) (not e!204299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33514 (= res!183328 (validMask!0 mask!2385))))

(assert (=> start!33514 e!204299))

(assert (=> start!33514 true))

(declare-fun tp_is_empty!6769 () Bool)

(assert (=> start!33514 tp_is_empty!6769))

(assert (=> start!33514 tp!23946))

(declare-datatypes ((V!10003 0))(
  ( (V!10004 (val!3429 Int)) )
))
(declare-datatypes ((ValueCell!3041 0))(
  ( (ValueCellFull!3041 (v!5589 V!10003)) (EmptyCell!3041) )
))
(declare-datatypes ((array!17132 0))(
  ( (array!17133 (arr!8099 (Array (_ BitVec 32) ValueCell!3041)) (size!8451 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17132)

(declare-fun e!204297 () Bool)

(declare-fun array_inv!6026 (array!17132) Bool)

(assert (=> start!33514 (and (array_inv!6026 _values!1525) e!204297)))

(declare-fun array_inv!6027 (array!17130) Bool)

(assert (=> start!33514 (array_inv!6027 _keys!1895)))

(declare-fun mapNonEmpty!11541 () Bool)

(declare-fun mapRes!11541 () Bool)

(declare-fun tp!23945 () Bool)

(declare-fun e!204298 () Bool)

(assert (=> mapNonEmpty!11541 (= mapRes!11541 (and tp!23945 e!204298))))

(declare-fun mapKey!11541 () (_ BitVec 32))

(declare-fun mapRest!11541 () (Array (_ BitVec 32) ValueCell!3041))

(declare-fun mapValue!11541 () ValueCell!3041)

(assert (=> mapNonEmpty!11541 (= (arr!8099 _values!1525) (store mapRest!11541 mapKey!11541 mapValue!11541))))

(declare-fun b!332700 () Bool)

(declare-fun res!183326 () Bool)

(assert (=> b!332700 (=> (not res!183326) (not e!204299))))

(declare-datatypes ((List!4520 0))(
  ( (Nil!4517) (Cons!4516 (h!5372 (_ BitVec 64)) (t!9594 List!4520)) )
))
(declare-fun arrayNoDuplicates!0 (array!17130 (_ BitVec 32) List!4520) Bool)

(assert (=> b!332700 (= res!183326 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4517))))

(declare-fun b!332701 () Bool)

(declare-fun e!204295 () Bool)

(assert (=> b!332701 (= e!204295 tp_is_empty!6769)))

(declare-fun b!332702 () Bool)

(declare-fun res!183329 () Bool)

(assert (=> b!332702 (=> (not res!183329) (not e!204299))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332702 (= res!183329 (and (= (size!8451 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8450 _keys!1895) (size!8451 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332703 () Bool)

(assert (=> b!332703 (= e!204298 tp_is_empty!6769)))

(declare-fun b!332704 () Bool)

(assert (=> b!332704 (= e!204299 false)))

(declare-fun lt!159058 () Bool)

(declare-fun zeroValue!1467 () V!10003)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10003)

(declare-datatypes ((tuple2!4904 0))(
  ( (tuple2!4905 (_1!2463 (_ BitVec 64)) (_2!2463 V!10003)) )
))
(declare-datatypes ((List!4521 0))(
  ( (Nil!4518) (Cons!4517 (h!5373 tuple2!4904) (t!9595 List!4521)) )
))
(declare-datatypes ((ListLongMap!3819 0))(
  ( (ListLongMap!3820 (toList!1925 List!4521)) )
))
(declare-fun contains!1985 (ListLongMap!3819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1457 (array!17130 array!17132 (_ BitVec 32) (_ BitVec 32) V!10003 V!10003 (_ BitVec 32) Int) ListLongMap!3819)

(assert (=> b!332704 (= lt!159058 (contains!1985 (getCurrentListMap!1457 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332705 () Bool)

(assert (=> b!332705 (= e!204297 (and e!204295 mapRes!11541))))

(declare-fun condMapEmpty!11541 () Bool)

(declare-fun mapDefault!11541 () ValueCell!3041)

(assert (=> b!332705 (= condMapEmpty!11541 (= (arr!8099 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3041)) mapDefault!11541)))))

(declare-fun mapIsEmpty!11541 () Bool)

(assert (=> mapIsEmpty!11541 mapRes!11541))

(assert (= (and start!33514 res!183328) b!332702))

(assert (= (and b!332702 res!183329) b!332698))

(assert (= (and b!332698 res!183327) b!332700))

(assert (= (and b!332700 res!183326) b!332699))

(assert (= (and b!332699 res!183325) b!332704))

(assert (= (and b!332705 condMapEmpty!11541) mapIsEmpty!11541))

(assert (= (and b!332705 (not condMapEmpty!11541)) mapNonEmpty!11541))

(get-info :version)

(assert (= (and mapNonEmpty!11541 ((_ is ValueCellFull!3041) mapValue!11541)) b!332703))

(assert (= (and b!332705 ((_ is ValueCellFull!3041) mapDefault!11541)) b!332701))

(assert (= start!33514 b!332705))

(declare-fun m!337391 () Bool)

(assert (=> mapNonEmpty!11541 m!337391))

(declare-fun m!337393 () Bool)

(assert (=> b!332700 m!337393))

(declare-fun m!337395 () Bool)

(assert (=> b!332698 m!337395))

(declare-fun m!337397 () Bool)

(assert (=> b!332704 m!337397))

(assert (=> b!332704 m!337397))

(declare-fun m!337399 () Bool)

(assert (=> b!332704 m!337399))

(declare-fun m!337401 () Bool)

(assert (=> b!332699 m!337401))

(declare-fun m!337403 () Bool)

(assert (=> start!33514 m!337403))

(declare-fun m!337405 () Bool)

(assert (=> start!33514 m!337405))

(declare-fun m!337407 () Bool)

(assert (=> start!33514 m!337407))

(check-sat (not b_next!6817) (not b!332699) (not b!332698) (not b!332700) b_and!14005 (not b!332704) tp_is_empty!6769 (not start!33514) (not mapNonEmpty!11541))
(check-sat b_and!14005 (not b_next!6817))
