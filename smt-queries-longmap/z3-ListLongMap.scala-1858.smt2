; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33514 () Bool)

(assert start!33514)

(declare-fun b_free!6817 () Bool)

(declare-fun b_next!6817 () Bool)

(assert (=> start!33514 (= b_free!6817 (not b_next!6817))))

(declare-fun tp!23946 () Bool)

(declare-fun b_and!13965 () Bool)

(assert (=> start!33514 (= tp!23946 b_and!13965)))

(declare-fun b!332476 () Bool)

(declare-fun e!204154 () Bool)

(declare-fun e!204153 () Bool)

(declare-fun mapRes!11541 () Bool)

(assert (=> b!332476 (= e!204154 (and e!204153 mapRes!11541))))

(declare-fun condMapEmpty!11541 () Bool)

(declare-datatypes ((V!10003 0))(
  ( (V!10004 (val!3429 Int)) )
))
(declare-datatypes ((ValueCell!3041 0))(
  ( (ValueCellFull!3041 (v!5582 V!10003)) (EmptyCell!3041) )
))
(declare-datatypes ((array!17115 0))(
  ( (array!17116 (arr!8091 (Array (_ BitVec 32) ValueCell!3041)) (size!8444 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17115)

(declare-fun mapDefault!11541 () ValueCell!3041)

(assert (=> b!332476 (= condMapEmpty!11541 (= (arr!8091 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3041)) mapDefault!11541)))))

(declare-fun b!332477 () Bool)

(declare-fun res!183201 () Bool)

(declare-fun e!204155 () Bool)

(assert (=> b!332477 (=> (not res!183201) (not e!204155))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332477 (= res!183201 (validKeyInArray!0 k0!1348))))

(declare-fun b!332478 () Bool)

(declare-fun e!204156 () Bool)

(declare-fun tp_is_empty!6769 () Bool)

(assert (=> b!332478 (= e!204156 tp_is_empty!6769)))

(declare-fun b!332480 () Bool)

(declare-fun res!183200 () Bool)

(assert (=> b!332480 (=> (not res!183200) (not e!204155))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17117 0))(
  ( (array!17118 (arr!8092 (Array (_ BitVec 32) (_ BitVec 64))) (size!8445 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17117)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332480 (= res!183200 (and (= (size!8444 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8445 _keys!1895) (size!8444 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332481 () Bool)

(declare-fun res!183202 () Bool)

(assert (=> b!332481 (=> (not res!183202) (not e!204155))))

(declare-datatypes ((List!4574 0))(
  ( (Nil!4571) (Cons!4570 (h!5426 (_ BitVec 64)) (t!9647 List!4574)) )
))
(declare-fun arrayNoDuplicates!0 (array!17117 (_ BitVec 32) List!4574) Bool)

(assert (=> b!332481 (= res!183202 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4571))))

(declare-fun mapIsEmpty!11541 () Bool)

(assert (=> mapIsEmpty!11541 mapRes!11541))

(declare-fun b!332482 () Bool)

(assert (=> b!332482 (= e!204155 false)))

(declare-fun lt!158805 () Bool)

(declare-fun zeroValue!1467 () V!10003)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10003)

(declare-datatypes ((tuple2!4936 0))(
  ( (tuple2!4937 (_1!2479 (_ BitVec 64)) (_2!2479 V!10003)) )
))
(declare-datatypes ((List!4575 0))(
  ( (Nil!4572) (Cons!4571 (h!5427 tuple2!4936) (t!9648 List!4575)) )
))
(declare-datatypes ((ListLongMap!3839 0))(
  ( (ListLongMap!3840 (toList!1935 List!4575)) )
))
(declare-fun contains!1987 (ListLongMap!3839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1444 (array!17117 array!17115 (_ BitVec 32) (_ BitVec 32) V!10003 V!10003 (_ BitVec 32) Int) ListLongMap!3839)

(assert (=> b!332482 (= lt!158805 (contains!1987 (getCurrentListMap!1444 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun mapNonEmpty!11541 () Bool)

(declare-fun tp!23945 () Bool)

(assert (=> mapNonEmpty!11541 (= mapRes!11541 (and tp!23945 e!204156))))

(declare-fun mapKey!11541 () (_ BitVec 32))

(declare-fun mapValue!11541 () ValueCell!3041)

(declare-fun mapRest!11541 () (Array (_ BitVec 32) ValueCell!3041))

(assert (=> mapNonEmpty!11541 (= (arr!8091 _values!1525) (store mapRest!11541 mapKey!11541 mapValue!11541))))

(declare-fun b!332483 () Bool)

(declare-fun res!183199 () Bool)

(assert (=> b!332483 (=> (not res!183199) (not e!204155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17117 (_ BitVec 32)) Bool)

(assert (=> b!332483 (= res!183199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332479 () Bool)

(assert (=> b!332479 (= e!204153 tp_is_empty!6769)))

(declare-fun res!183203 () Bool)

(assert (=> start!33514 (=> (not res!183203) (not e!204155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33514 (= res!183203 (validMask!0 mask!2385))))

(assert (=> start!33514 e!204155))

(assert (=> start!33514 true))

(assert (=> start!33514 tp_is_empty!6769))

(assert (=> start!33514 tp!23946))

(declare-fun array_inv!6038 (array!17115) Bool)

(assert (=> start!33514 (and (array_inv!6038 _values!1525) e!204154)))

(declare-fun array_inv!6039 (array!17117) Bool)

(assert (=> start!33514 (array_inv!6039 _keys!1895)))

(assert (= (and start!33514 res!183203) b!332480))

(assert (= (and b!332480 res!183200) b!332483))

(assert (= (and b!332483 res!183199) b!332481))

(assert (= (and b!332481 res!183202) b!332477))

(assert (= (and b!332477 res!183201) b!332482))

(assert (= (and b!332476 condMapEmpty!11541) mapIsEmpty!11541))

(assert (= (and b!332476 (not condMapEmpty!11541)) mapNonEmpty!11541))

(get-info :version)

(assert (= (and mapNonEmpty!11541 ((_ is ValueCellFull!3041) mapValue!11541)) b!332478))

(assert (= (and b!332476 ((_ is ValueCellFull!3041) mapDefault!11541)) b!332479))

(assert (= start!33514 b!332476))

(declare-fun m!336437 () Bool)

(assert (=> b!332483 m!336437))

(declare-fun m!336439 () Bool)

(assert (=> b!332477 m!336439))

(declare-fun m!336441 () Bool)

(assert (=> mapNonEmpty!11541 m!336441))

(declare-fun m!336443 () Bool)

(assert (=> b!332482 m!336443))

(assert (=> b!332482 m!336443))

(declare-fun m!336445 () Bool)

(assert (=> b!332482 m!336445))

(declare-fun m!336447 () Bool)

(assert (=> start!33514 m!336447))

(declare-fun m!336449 () Bool)

(assert (=> start!33514 m!336449))

(declare-fun m!336451 () Bool)

(assert (=> start!33514 m!336451))

(declare-fun m!336453 () Bool)

(assert (=> b!332481 m!336453))

(check-sat b_and!13965 (not b!332482) tp_is_empty!6769 (not start!33514) (not b!332477) (not b!332481) (not b!332483) (not mapNonEmpty!11541) (not b_next!6817))
(check-sat b_and!13965 (not b_next!6817))
