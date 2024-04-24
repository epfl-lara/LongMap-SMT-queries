; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33502 () Bool)

(assert start!33502)

(declare-fun b_free!6805 () Bool)

(declare-fun b_next!6805 () Bool)

(assert (=> start!33502 (= b_free!6805 (not b_next!6805))))

(declare-fun tp!23909 () Bool)

(declare-fun b_and!13993 () Bool)

(assert (=> start!33502 (= tp!23909 b_and!13993)))

(declare-fun mapNonEmpty!11523 () Bool)

(declare-fun mapRes!11523 () Bool)

(declare-fun tp!23910 () Bool)

(declare-fun e!204205 () Bool)

(assert (=> mapNonEmpty!11523 (= mapRes!11523 (and tp!23910 e!204205))))

(declare-fun mapKey!11523 () (_ BitVec 32))

(declare-datatypes ((V!9987 0))(
  ( (V!9988 (val!3423 Int)) )
))
(declare-datatypes ((ValueCell!3035 0))(
  ( (ValueCellFull!3035 (v!5583 V!9987)) (EmptyCell!3035) )
))
(declare-fun mapValue!11523 () ValueCell!3035)

(declare-datatypes ((array!17108 0))(
  ( (array!17109 (arr!8087 (Array (_ BitVec 32) ValueCell!3035)) (size!8439 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17108)

(declare-fun mapRest!11523 () (Array (_ BitVec 32) ValueCell!3035))

(assert (=> mapNonEmpty!11523 (= (arr!8087 _values!1525) (store mapRest!11523 mapKey!11523 mapValue!11523))))

(declare-fun b!332545 () Bool)

(declare-fun res!183229 () Bool)

(declare-fun e!204207 () Bool)

(assert (=> b!332545 (=> (not res!183229) (not e!204207))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17110 0))(
  ( (array!17111 (arr!8088 (Array (_ BitVec 32) (_ BitVec 64))) (size!8440 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17110)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332545 (= res!183229 (and (= (size!8439 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8440 _keys!1895) (size!8439 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11523 () Bool)

(assert (=> mapIsEmpty!11523 mapRes!11523))

(declare-fun b!332546 () Bool)

(declare-fun res!183226 () Bool)

(assert (=> b!332546 (=> (not res!183226) (not e!204207))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332546 (= res!183226 (validKeyInArray!0 k0!1348))))

(declare-fun b!332547 () Bool)

(declare-fun e!204209 () Bool)

(declare-fun tp_is_empty!6757 () Bool)

(assert (=> b!332547 (= e!204209 tp_is_empty!6757)))

(declare-fun b!332548 () Bool)

(assert (=> b!332548 (= e!204205 tp_is_empty!6757)))

(declare-fun b!332549 () Bool)

(declare-fun res!183230 () Bool)

(assert (=> b!332549 (=> (not res!183230) (not e!204207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17110 (_ BitVec 32)) Bool)

(assert (=> b!332549 (= res!183230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332550 () Bool)

(assert (=> b!332550 (= e!204207 false)))

(declare-fun zeroValue!1467 () V!9987)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!159049 () Bool)

(declare-fun minValue!1467 () V!9987)

(declare-datatypes ((tuple2!4896 0))(
  ( (tuple2!4897 (_1!2459 (_ BitVec 64)) (_2!2459 V!9987)) )
))
(declare-datatypes ((List!4513 0))(
  ( (Nil!4510) (Cons!4509 (h!5365 tuple2!4896) (t!9587 List!4513)) )
))
(declare-datatypes ((ListLongMap!3811 0))(
  ( (ListLongMap!3812 (toList!1921 List!4513)) )
))
(declare-fun contains!1981 (ListLongMap!3811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1453 (array!17110 array!17108 (_ BitVec 32) (_ BitVec 32) V!9987 V!9987 (_ BitVec 32) Int) ListLongMap!3811)

(assert (=> b!332550 (= lt!159049 (contains!1981 (getCurrentListMap!1453 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332551 () Bool)

(declare-fun e!204206 () Bool)

(assert (=> b!332551 (= e!204206 (and e!204209 mapRes!11523))))

(declare-fun condMapEmpty!11523 () Bool)

(declare-fun mapDefault!11523 () ValueCell!3035)

(assert (=> b!332551 (= condMapEmpty!11523 (= (arr!8087 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3035)) mapDefault!11523)))))

(declare-fun res!183228 () Bool)

(assert (=> start!33502 (=> (not res!183228) (not e!204207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33502 (= res!183228 (validMask!0 mask!2385))))

(assert (=> start!33502 e!204207))

(assert (=> start!33502 true))

(assert (=> start!33502 tp_is_empty!6757))

(assert (=> start!33502 tp!23909))

(declare-fun array_inv!6018 (array!17108) Bool)

(assert (=> start!33502 (and (array_inv!6018 _values!1525) e!204206)))

(declare-fun array_inv!6019 (array!17110) Bool)

(assert (=> start!33502 (array_inv!6019 _keys!1895)))

(declare-fun b!332552 () Bool)

(declare-fun res!183227 () Bool)

(assert (=> b!332552 (=> (not res!183227) (not e!204207))))

(declare-datatypes ((List!4514 0))(
  ( (Nil!4511) (Cons!4510 (h!5366 (_ BitVec 64)) (t!9588 List!4514)) )
))
(declare-fun arrayNoDuplicates!0 (array!17110 (_ BitVec 32) List!4514) Bool)

(assert (=> b!332552 (= res!183227 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4511))))

(assert (= (and start!33502 res!183228) b!332545))

(assert (= (and b!332545 res!183229) b!332549))

(assert (= (and b!332549 res!183230) b!332552))

(assert (= (and b!332552 res!183227) b!332546))

(assert (= (and b!332546 res!183226) b!332550))

(assert (= (and b!332551 condMapEmpty!11523) mapIsEmpty!11523))

(assert (= (and b!332551 (not condMapEmpty!11523)) mapNonEmpty!11523))

(get-info :version)

(assert (= (and mapNonEmpty!11523 ((_ is ValueCellFull!3035) mapValue!11523)) b!332548))

(assert (= (and b!332551 ((_ is ValueCellFull!3035) mapDefault!11523)) b!332547))

(assert (= start!33502 b!332551))

(declare-fun m!337283 () Bool)

(assert (=> b!332552 m!337283))

(declare-fun m!337285 () Bool)

(assert (=> start!33502 m!337285))

(declare-fun m!337287 () Bool)

(assert (=> start!33502 m!337287))

(declare-fun m!337289 () Bool)

(assert (=> start!33502 m!337289))

(declare-fun m!337291 () Bool)

(assert (=> b!332546 m!337291))

(declare-fun m!337293 () Bool)

(assert (=> mapNonEmpty!11523 m!337293))

(declare-fun m!337295 () Bool)

(assert (=> b!332549 m!337295))

(declare-fun m!337297 () Bool)

(assert (=> b!332550 m!337297))

(assert (=> b!332550 m!337297))

(declare-fun m!337299 () Bool)

(assert (=> b!332550 m!337299))

(check-sat (not b!332546) (not mapNonEmpty!11523) (not b_next!6805) (not b!332550) tp_is_empty!6757 (not start!33502) (not b!332549) (not b!332552) b_and!13993)
(check-sat b_and!13993 (not b_next!6805))
