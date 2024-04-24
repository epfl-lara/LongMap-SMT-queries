; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33496 () Bool)

(assert start!33496)

(declare-fun b_free!6799 () Bool)

(declare-fun b_next!6799 () Bool)

(assert (=> start!33496 (= b_free!6799 (not b_next!6799))))

(declare-fun tp!23892 () Bool)

(declare-fun b_and!13987 () Bool)

(assert (=> start!33496 (= tp!23892 b_and!13987)))

(declare-fun b!332473 () Bool)

(declare-fun e!204160 () Bool)

(assert (=> b!332473 (= e!204160 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!9979 0))(
  ( (V!9980 (val!3420 Int)) )
))
(declare-fun zeroValue!1467 () V!9979)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3032 0))(
  ( (ValueCellFull!3032 (v!5580 V!9979)) (EmptyCell!3032) )
))
(declare-datatypes ((array!17098 0))(
  ( (array!17099 (arr!8082 (Array (_ BitVec 32) ValueCell!3032)) (size!8434 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17098)

(declare-datatypes ((array!17100 0))(
  ( (array!17101 (arr!8083 (Array (_ BitVec 32) (_ BitVec 64))) (size!8435 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17100)

(declare-fun lt!159040 () Bool)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9979)

(declare-datatypes ((tuple2!4892 0))(
  ( (tuple2!4893 (_1!2457 (_ BitVec 64)) (_2!2457 V!9979)) )
))
(declare-datatypes ((List!4509 0))(
  ( (Nil!4506) (Cons!4505 (h!5361 tuple2!4892) (t!9583 List!4509)) )
))
(declare-datatypes ((ListLongMap!3807 0))(
  ( (ListLongMap!3808 (toList!1919 List!4509)) )
))
(declare-fun contains!1979 (ListLongMap!3807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1451 (array!17100 array!17098 (_ BitVec 32) (_ BitVec 32) V!9979 V!9979 (_ BitVec 32) Int) ListLongMap!3807)

(assert (=> b!332473 (= lt!159040 (contains!1979 (getCurrentListMap!1451 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332474 () Bool)

(declare-fun e!204164 () Bool)

(declare-fun tp_is_empty!6751 () Bool)

(assert (=> b!332474 (= e!204164 tp_is_empty!6751)))

(declare-fun res!183183 () Bool)

(assert (=> start!33496 (=> (not res!183183) (not e!204160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33496 (= res!183183 (validMask!0 mask!2385))))

(assert (=> start!33496 e!204160))

(assert (=> start!33496 true))

(assert (=> start!33496 tp_is_empty!6751))

(assert (=> start!33496 tp!23892))

(declare-fun e!204161 () Bool)

(declare-fun array_inv!6014 (array!17098) Bool)

(assert (=> start!33496 (and (array_inv!6014 _values!1525) e!204161)))

(declare-fun array_inv!6015 (array!17100) Bool)

(assert (=> start!33496 (array_inv!6015 _keys!1895)))

(declare-fun b!332475 () Bool)

(declare-fun e!204163 () Bool)

(declare-fun mapRes!11514 () Bool)

(assert (=> b!332475 (= e!204161 (and e!204163 mapRes!11514))))

(declare-fun condMapEmpty!11514 () Bool)

(declare-fun mapDefault!11514 () ValueCell!3032)

(assert (=> b!332475 (= condMapEmpty!11514 (= (arr!8082 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3032)) mapDefault!11514)))))

(declare-fun b!332476 () Bool)

(assert (=> b!332476 (= e!204163 tp_is_empty!6751)))

(declare-fun b!332477 () Bool)

(declare-fun res!183185 () Bool)

(assert (=> b!332477 (=> (not res!183185) (not e!204160))))

(assert (=> b!332477 (= res!183185 (and (= (size!8434 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8435 _keys!1895) (size!8434 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332478 () Bool)

(declare-fun res!183184 () Bool)

(assert (=> b!332478 (=> (not res!183184) (not e!204160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332478 (= res!183184 (validKeyInArray!0 k0!1348))))

(declare-fun b!332479 () Bool)

(declare-fun res!183182 () Bool)

(assert (=> b!332479 (=> (not res!183182) (not e!204160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17100 (_ BitVec 32)) Bool)

(assert (=> b!332479 (= res!183182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11514 () Bool)

(assert (=> mapIsEmpty!11514 mapRes!11514))

(declare-fun mapNonEmpty!11514 () Bool)

(declare-fun tp!23891 () Bool)

(assert (=> mapNonEmpty!11514 (= mapRes!11514 (and tp!23891 e!204164))))

(declare-fun mapValue!11514 () ValueCell!3032)

(declare-fun mapRest!11514 () (Array (_ BitVec 32) ValueCell!3032))

(declare-fun mapKey!11514 () (_ BitVec 32))

(assert (=> mapNonEmpty!11514 (= (arr!8082 _values!1525) (store mapRest!11514 mapKey!11514 mapValue!11514))))

(declare-fun b!332480 () Bool)

(declare-fun res!183181 () Bool)

(assert (=> b!332480 (=> (not res!183181) (not e!204160))))

(declare-datatypes ((List!4510 0))(
  ( (Nil!4507) (Cons!4506 (h!5362 (_ BitVec 64)) (t!9584 List!4510)) )
))
(declare-fun arrayNoDuplicates!0 (array!17100 (_ BitVec 32) List!4510) Bool)

(assert (=> b!332480 (= res!183181 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4507))))

(assert (= (and start!33496 res!183183) b!332477))

(assert (= (and b!332477 res!183185) b!332479))

(assert (= (and b!332479 res!183182) b!332480))

(assert (= (and b!332480 res!183181) b!332478))

(assert (= (and b!332478 res!183184) b!332473))

(assert (= (and b!332475 condMapEmpty!11514) mapIsEmpty!11514))

(assert (= (and b!332475 (not condMapEmpty!11514)) mapNonEmpty!11514))

(get-info :version)

(assert (= (and mapNonEmpty!11514 ((_ is ValueCellFull!3032) mapValue!11514)) b!332474))

(assert (= (and b!332475 ((_ is ValueCellFull!3032) mapDefault!11514)) b!332476))

(assert (= start!33496 b!332475))

(declare-fun m!337229 () Bool)

(assert (=> start!33496 m!337229))

(declare-fun m!337231 () Bool)

(assert (=> start!33496 m!337231))

(declare-fun m!337233 () Bool)

(assert (=> start!33496 m!337233))

(declare-fun m!337235 () Bool)

(assert (=> mapNonEmpty!11514 m!337235))

(declare-fun m!337237 () Bool)

(assert (=> b!332478 m!337237))

(declare-fun m!337239 () Bool)

(assert (=> b!332480 m!337239))

(declare-fun m!337241 () Bool)

(assert (=> b!332479 m!337241))

(declare-fun m!337243 () Bool)

(assert (=> b!332473 m!337243))

(assert (=> b!332473 m!337243))

(declare-fun m!337245 () Bool)

(assert (=> b!332473 m!337245))

(check-sat (not b!332480) (not start!33496) (not b!332473) (not b_next!6799) b_and!13987 (not b!332479) (not b!332478) (not mapNonEmpty!11514) tp_is_empty!6751)
(check-sat b_and!13987 (not b_next!6799))
