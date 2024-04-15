; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33508 () Bool)

(assert start!33508)

(declare-fun b_free!6811 () Bool)

(declare-fun b_next!6811 () Bool)

(assert (=> start!33508 (= b_free!6811 (not b_next!6811))))

(declare-fun tp!23927 () Bool)

(declare-fun b_and!13959 () Bool)

(assert (=> start!33508 (= tp!23927 b_and!13959)))

(declare-fun b!332397 () Bool)

(declare-fun res!183151 () Bool)

(declare-fun e!204108 () Bool)

(assert (=> b!332397 (=> (not res!183151) (not e!204108))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!9995 0))(
  ( (V!9996 (val!3426 Int)) )
))
(declare-datatypes ((ValueCell!3038 0))(
  ( (ValueCellFull!3038 (v!5579 V!9995)) (EmptyCell!3038) )
))
(declare-datatypes ((array!17105 0))(
  ( (array!17106 (arr!8086 (Array (_ BitVec 32) ValueCell!3038)) (size!8439 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17105)

(declare-datatypes ((array!17107 0))(
  ( (array!17108 (arr!8087 (Array (_ BitVec 32) (_ BitVec 64))) (size!8440 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17107)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9995)

(declare-fun zeroValue!1467 () V!9995)

(declare-datatypes ((tuple2!4932 0))(
  ( (tuple2!4933 (_1!2477 (_ BitVec 64)) (_2!2477 V!9995)) )
))
(declare-datatypes ((List!4571 0))(
  ( (Nil!4568) (Cons!4567 (h!5423 tuple2!4932) (t!9644 List!4571)) )
))
(declare-datatypes ((ListLongMap!3835 0))(
  ( (ListLongMap!3836 (toList!1933 List!4571)) )
))
(declare-fun contains!1985 (ListLongMap!3835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1442 (array!17107 array!17105 (_ BitVec 32) (_ BitVec 32) V!9995 V!9995 (_ BitVec 32) Int) ListLongMap!3835)

(assert (=> b!332397 (= res!183151 (not (contains!1985 (getCurrentListMap!1442 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!332398 () Bool)

(declare-fun e!204110 () Bool)

(declare-fun tp_is_empty!6763 () Bool)

(assert (=> b!332398 (= e!204110 tp_is_empty!6763)))

(declare-fun mapNonEmpty!11532 () Bool)

(declare-fun mapRes!11532 () Bool)

(declare-fun tp!23928 () Bool)

(declare-fun e!204111 () Bool)

(assert (=> mapNonEmpty!11532 (= mapRes!11532 (and tp!23928 e!204111))))

(declare-fun mapKey!11532 () (_ BitVec 32))

(declare-fun mapRest!11532 () (Array (_ BitVec 32) ValueCell!3038))

(declare-fun mapValue!11532 () ValueCell!3038)

(assert (=> mapNonEmpty!11532 (= (arr!8086 _values!1525) (store mapRest!11532 mapKey!11532 mapValue!11532))))

(declare-fun b!332399 () Bool)

(assert (=> b!332399 (= e!204108 (not (= (size!8440 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385))))))

(declare-fun b!332400 () Bool)

(assert (=> b!332400 (= e!204111 tp_is_empty!6763)))

(declare-fun res!183152 () Bool)

(assert (=> start!33508 (=> (not res!183152) (not e!204108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33508 (= res!183152 (validMask!0 mask!2385))))

(assert (=> start!33508 e!204108))

(assert (=> start!33508 true))

(assert (=> start!33508 tp_is_empty!6763))

(assert (=> start!33508 tp!23927))

(declare-fun e!204109 () Bool)

(declare-fun array_inv!6036 (array!17105) Bool)

(assert (=> start!33508 (and (array_inv!6036 _values!1525) e!204109)))

(declare-fun array_inv!6037 (array!17107) Bool)

(assert (=> start!33508 (array_inv!6037 _keys!1895)))

(declare-fun mapIsEmpty!11532 () Bool)

(assert (=> mapIsEmpty!11532 mapRes!11532))

(declare-fun b!332401 () Bool)

(declare-fun res!183148 () Bool)

(assert (=> b!332401 (=> (not res!183148) (not e!204108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332401 (= res!183148 (validKeyInArray!0 k0!1348))))

(declare-fun b!332402 () Bool)

(declare-fun res!183149 () Bool)

(assert (=> b!332402 (=> (not res!183149) (not e!204108))))

(assert (=> b!332402 (= res!183149 (and (= (size!8439 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8440 _keys!1895) (size!8439 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332403 () Bool)

(declare-fun res!183147 () Bool)

(assert (=> b!332403 (=> (not res!183147) (not e!204108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17107 (_ BitVec 32)) Bool)

(assert (=> b!332403 (= res!183147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332404 () Bool)

(assert (=> b!332404 (= e!204109 (and e!204110 mapRes!11532))))

(declare-fun condMapEmpty!11532 () Bool)

(declare-fun mapDefault!11532 () ValueCell!3038)

(assert (=> b!332404 (= condMapEmpty!11532 (= (arr!8086 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3038)) mapDefault!11532)))))

(declare-fun b!332405 () Bool)

(declare-fun res!183150 () Bool)

(assert (=> b!332405 (=> (not res!183150) (not e!204108))))

(declare-datatypes ((List!4572 0))(
  ( (Nil!4569) (Cons!4568 (h!5424 (_ BitVec 64)) (t!9645 List!4572)) )
))
(declare-fun arrayNoDuplicates!0 (array!17107 (_ BitVec 32) List!4572) Bool)

(assert (=> b!332405 (= res!183150 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4569))))

(assert (= (and start!33508 res!183152) b!332402))

(assert (= (and b!332402 res!183149) b!332403))

(assert (= (and b!332403 res!183147) b!332405))

(assert (= (and b!332405 res!183150) b!332401))

(assert (= (and b!332401 res!183148) b!332397))

(assert (= (and b!332397 res!183151) b!332399))

(assert (= (and b!332404 condMapEmpty!11532) mapIsEmpty!11532))

(assert (= (and b!332404 (not condMapEmpty!11532)) mapNonEmpty!11532))

(get-info :version)

(assert (= (and mapNonEmpty!11532 ((_ is ValueCellFull!3038) mapValue!11532)) b!332400))

(assert (= (and b!332404 ((_ is ValueCellFull!3038) mapDefault!11532)) b!332398))

(assert (= start!33508 b!332404))

(declare-fun m!336383 () Bool)

(assert (=> b!332405 m!336383))

(declare-fun m!336385 () Bool)

(assert (=> mapNonEmpty!11532 m!336385))

(declare-fun m!336387 () Bool)

(assert (=> start!33508 m!336387))

(declare-fun m!336389 () Bool)

(assert (=> start!33508 m!336389))

(declare-fun m!336391 () Bool)

(assert (=> start!33508 m!336391))

(declare-fun m!336393 () Bool)

(assert (=> b!332397 m!336393))

(assert (=> b!332397 m!336393))

(declare-fun m!336395 () Bool)

(assert (=> b!332397 m!336395))

(declare-fun m!336397 () Bool)

(assert (=> b!332401 m!336397))

(declare-fun m!336399 () Bool)

(assert (=> b!332403 m!336399))

(check-sat (not b!332405) (not b!332403) (not mapNonEmpty!11532) tp_is_empty!6763 (not start!33508) b_and!13959 (not b_next!6811) (not b!332401) (not b!332397))
(check-sat b_and!13959 (not b_next!6811))
