; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33508 () Bool)

(assert start!33508)

(declare-fun b_free!6811 () Bool)

(declare-fun b_next!6811 () Bool)

(assert (=> start!33508 (= b_free!6811 (not b_next!6811))))

(declare-fun tp!23927 () Bool)

(declare-fun b_and!13999 () Bool)

(assert (=> start!33508 (= tp!23927 b_and!13999)))

(declare-fun b!332619 () Bool)

(declare-fun res!183273 () Bool)

(declare-fun e!204254 () Bool)

(assert (=> b!332619 (=> (not res!183273) (not e!204254))))

(declare-datatypes ((array!17120 0))(
  ( (array!17121 (arr!8093 (Array (_ BitVec 32) (_ BitVec 64))) (size!8445 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17120)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17120 (_ BitVec 32)) Bool)

(assert (=> b!332619 (= res!183273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332620 () Bool)

(declare-fun res!183277 () Bool)

(assert (=> b!332620 (=> (not res!183277) (not e!204254))))

(declare-datatypes ((List!4517 0))(
  ( (Nil!4514) (Cons!4513 (h!5369 (_ BitVec 64)) (t!9591 List!4517)) )
))
(declare-fun arrayNoDuplicates!0 (array!17120 (_ BitVec 32) List!4517) Bool)

(assert (=> b!332620 (= res!183277 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4514))))

(declare-fun mapIsEmpty!11532 () Bool)

(declare-fun mapRes!11532 () Bool)

(assert (=> mapIsEmpty!11532 mapRes!11532))

(declare-fun b!332621 () Bool)

(declare-fun e!204250 () Bool)

(declare-fun tp_is_empty!6763 () Bool)

(assert (=> b!332621 (= e!204250 tp_is_empty!6763)))

(declare-fun b!332622 () Bool)

(declare-fun e!204253 () Bool)

(assert (=> b!332622 (= e!204253 tp_is_empty!6763)))

(declare-fun b!332623 () Bool)

(declare-fun res!183275 () Bool)

(assert (=> b!332623 (=> (not res!183275) (not e!204254))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332623 (= res!183275 (validKeyInArray!0 k0!1348))))

(declare-fun res!183276 () Bool)

(assert (=> start!33508 (=> (not res!183276) (not e!204254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33508 (= res!183276 (validMask!0 mask!2385))))

(assert (=> start!33508 e!204254))

(assert (=> start!33508 true))

(assert (=> start!33508 tp_is_empty!6763))

(assert (=> start!33508 tp!23927))

(declare-datatypes ((V!9995 0))(
  ( (V!9996 (val!3426 Int)) )
))
(declare-datatypes ((ValueCell!3038 0))(
  ( (ValueCellFull!3038 (v!5586 V!9995)) (EmptyCell!3038) )
))
(declare-datatypes ((array!17122 0))(
  ( (array!17123 (arr!8094 (Array (_ BitVec 32) ValueCell!3038)) (size!8446 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17122)

(declare-fun e!204252 () Bool)

(declare-fun array_inv!6022 (array!17122) Bool)

(assert (=> start!33508 (and (array_inv!6022 _values!1525) e!204252)))

(declare-fun array_inv!6023 (array!17120) Bool)

(assert (=> start!33508 (array_inv!6023 _keys!1895)))

(declare-fun b!332624 () Bool)

(declare-fun res!183274 () Bool)

(assert (=> b!332624 (=> (not res!183274) (not e!204254))))

(declare-fun zeroValue!1467 () V!9995)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9995)

(declare-datatypes ((tuple2!4902 0))(
  ( (tuple2!4903 (_1!2462 (_ BitVec 64)) (_2!2462 V!9995)) )
))
(declare-datatypes ((List!4518 0))(
  ( (Nil!4515) (Cons!4514 (h!5370 tuple2!4902) (t!9592 List!4518)) )
))
(declare-datatypes ((ListLongMap!3817 0))(
  ( (ListLongMap!3818 (toList!1924 List!4518)) )
))
(declare-fun contains!1984 (ListLongMap!3817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1456 (array!17120 array!17122 (_ BitVec 32) (_ BitVec 32) V!9995 V!9995 (_ BitVec 32) Int) ListLongMap!3817)

(assert (=> b!332624 (= res!183274 (not (contains!1984 (getCurrentListMap!1456 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11532 () Bool)

(declare-fun tp!23928 () Bool)

(assert (=> mapNonEmpty!11532 (= mapRes!11532 (and tp!23928 e!204253))))

(declare-fun mapRest!11532 () (Array (_ BitVec 32) ValueCell!3038))

(declare-fun mapKey!11532 () (_ BitVec 32))

(declare-fun mapValue!11532 () ValueCell!3038)

(assert (=> mapNonEmpty!11532 (= (arr!8094 _values!1525) (store mapRest!11532 mapKey!11532 mapValue!11532))))

(declare-fun b!332625 () Bool)

(declare-fun res!183278 () Bool)

(assert (=> b!332625 (=> (not res!183278) (not e!204254))))

(assert (=> b!332625 (= res!183278 (and (= (size!8446 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8445 _keys!1895) (size!8446 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332626 () Bool)

(assert (=> b!332626 (= e!204252 (and e!204250 mapRes!11532))))

(declare-fun condMapEmpty!11532 () Bool)

(declare-fun mapDefault!11532 () ValueCell!3038)

(assert (=> b!332626 (= condMapEmpty!11532 (= (arr!8094 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3038)) mapDefault!11532)))))

(declare-fun b!332627 () Bool)

(assert (=> b!332627 (= e!204254 (not (= (size!8445 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385))))))

(assert (= (and start!33508 res!183276) b!332625))

(assert (= (and b!332625 res!183278) b!332619))

(assert (= (and b!332619 res!183273) b!332620))

(assert (= (and b!332620 res!183277) b!332623))

(assert (= (and b!332623 res!183275) b!332624))

(assert (= (and b!332624 res!183274) b!332627))

(assert (= (and b!332626 condMapEmpty!11532) mapIsEmpty!11532))

(assert (= (and b!332626 (not condMapEmpty!11532)) mapNonEmpty!11532))

(get-info :version)

(assert (= (and mapNonEmpty!11532 ((_ is ValueCellFull!3038) mapValue!11532)) b!332622))

(assert (= (and b!332626 ((_ is ValueCellFull!3038) mapDefault!11532)) b!332621))

(assert (= start!33508 b!332626))

(declare-fun m!337337 () Bool)

(assert (=> b!332619 m!337337))

(declare-fun m!337339 () Bool)

(assert (=> b!332620 m!337339))

(declare-fun m!337341 () Bool)

(assert (=> mapNonEmpty!11532 m!337341))

(declare-fun m!337343 () Bool)

(assert (=> start!33508 m!337343))

(declare-fun m!337345 () Bool)

(assert (=> start!33508 m!337345))

(declare-fun m!337347 () Bool)

(assert (=> start!33508 m!337347))

(declare-fun m!337349 () Bool)

(assert (=> b!332624 m!337349))

(assert (=> b!332624 m!337349))

(declare-fun m!337351 () Bool)

(assert (=> b!332624 m!337351))

(declare-fun m!337353 () Bool)

(assert (=> b!332623 m!337353))

(check-sat (not b!332623) (not b!332619) b_and!13999 tp_is_empty!6763 (not b!332624) (not start!33508) (not b!332620) (not b_next!6811) (not mapNonEmpty!11532))
(check-sat b_and!13999 (not b_next!6811))
