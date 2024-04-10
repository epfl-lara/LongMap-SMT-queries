; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20162 () Bool)

(assert start!20162)

(declare-fun b_free!4821 () Bool)

(declare-fun b_next!4821 () Bool)

(assert (=> start!20162 (= b_free!4821 (not b_next!4821))))

(declare-fun tp!17495 () Bool)

(declare-fun b_and!11567 () Bool)

(assert (=> start!20162 (= tp!17495 b_and!11567)))

(declare-fun b!197864 () Bool)

(declare-fun res!93690 () Bool)

(declare-fun e!130138 () Bool)

(assert (=> b!197864 (=> (not res!93690) (not e!130138))))

(declare-datatypes ((array!8607 0))(
  ( (array!8608 (arr!4054 (Array (_ BitVec 32) (_ BitVec 64))) (size!4379 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8607)

(declare-datatypes ((List!2531 0))(
  ( (Nil!2528) (Cons!2527 (h!3169 (_ BitVec 64)) (t!7462 List!2531)) )
))
(declare-fun arrayNoDuplicates!0 (array!8607 (_ BitVec 32) List!2531) Bool)

(assert (=> b!197864 (= res!93690 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2528))))

(declare-fun b!197865 () Bool)

(declare-fun res!93688 () Bool)

(assert (=> b!197865 (=> (not res!93688) (not e!130138))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197865 (= res!93688 (= (select (arr!4054 _keys!825) i!601) k0!843))))

(declare-fun b!197866 () Bool)

(declare-fun res!93685 () Bool)

(assert (=> b!197866 (=> (not res!93685) (not e!130138))))

(assert (=> b!197866 (= res!93685 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4379 _keys!825))))))

(declare-fun b!197867 () Bool)

(declare-fun e!130137 () Bool)

(declare-fun tp_is_empty!4677 () Bool)

(assert (=> b!197867 (= e!130137 tp_is_empty!4677)))

(declare-fun b!197868 () Bool)

(declare-fun e!130139 () Bool)

(assert (=> b!197868 (= e!130139 tp_is_empty!4677)))

(declare-fun b!197869 () Bool)

(declare-fun e!130135 () Bool)

(declare-fun mapRes!8084 () Bool)

(assert (=> b!197869 (= e!130135 (and e!130139 mapRes!8084))))

(declare-fun condMapEmpty!8084 () Bool)

(declare-datatypes ((V!5883 0))(
  ( (V!5884 (val!2383 Int)) )
))
(declare-datatypes ((ValueCell!1995 0))(
  ( (ValueCellFull!1995 (v!4353 V!5883)) (EmptyCell!1995) )
))
(declare-datatypes ((array!8609 0))(
  ( (array!8610 (arr!4055 (Array (_ BitVec 32) ValueCell!1995)) (size!4380 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8609)

(declare-fun mapDefault!8084 () ValueCell!1995)

(assert (=> b!197869 (= condMapEmpty!8084 (= (arr!4055 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1995)) mapDefault!8084)))))

(declare-fun b!197870 () Bool)

(declare-fun res!93691 () Bool)

(assert (=> b!197870 (=> (not res!93691) (not e!130138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197870 (= res!93691 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8084 () Bool)

(assert (=> mapIsEmpty!8084 mapRes!8084))

(declare-fun b!197871 () Bool)

(declare-fun res!93689 () Bool)

(assert (=> b!197871 (=> (not res!93689) (not e!130138))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8607 (_ BitVec 32)) Bool)

(assert (=> b!197871 (= res!93689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197872 () Bool)

(declare-fun res!93686 () Bool)

(assert (=> b!197872 (=> (not res!93686) (not e!130138))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197872 (= res!93686 (and (= (size!4380 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4379 _keys!825) (size!4380 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8084 () Bool)

(declare-fun tp!17494 () Bool)

(assert (=> mapNonEmpty!8084 (= mapRes!8084 (and tp!17494 e!130137))))

(declare-fun mapValue!8084 () ValueCell!1995)

(declare-fun mapRest!8084 () (Array (_ BitVec 32) ValueCell!1995))

(declare-fun mapKey!8084 () (_ BitVec 32))

(assert (=> mapNonEmpty!8084 (= (arr!4055 _values!649) (store mapRest!8084 mapKey!8084 mapValue!8084))))

(declare-fun b!197873 () Bool)

(assert (=> b!197873 (= e!130138 false)))

(declare-fun v!520 () V!5883)

(declare-fun zeroValue!615 () V!5883)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5883)

(declare-datatypes ((tuple2!3618 0))(
  ( (tuple2!3619 (_1!1820 (_ BitVec 64)) (_2!1820 V!5883)) )
))
(declare-datatypes ((List!2532 0))(
  ( (Nil!2529) (Cons!2528 (h!3170 tuple2!3618) (t!7463 List!2532)) )
))
(declare-datatypes ((ListLongMap!2531 0))(
  ( (ListLongMap!2532 (toList!1281 List!2532)) )
))
(declare-fun lt!97803 () ListLongMap!2531)

(declare-fun getCurrentListMapNoExtraKeys!246 (array!8607 array!8609 (_ BitVec 32) (_ BitVec 32) V!5883 V!5883 (_ BitVec 32) Int) ListLongMap!2531)

(assert (=> b!197873 (= lt!97803 (getCurrentListMapNoExtraKeys!246 _keys!825 (array!8610 (store (arr!4055 _values!649) i!601 (ValueCellFull!1995 v!520)) (size!4380 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97802 () ListLongMap!2531)

(assert (=> b!197873 (= lt!97802 (getCurrentListMapNoExtraKeys!246 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93687 () Bool)

(assert (=> start!20162 (=> (not res!93687) (not e!130138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20162 (= res!93687 (validMask!0 mask!1149))))

(assert (=> start!20162 e!130138))

(declare-fun array_inv!2649 (array!8609) Bool)

(assert (=> start!20162 (and (array_inv!2649 _values!649) e!130135)))

(assert (=> start!20162 true))

(assert (=> start!20162 tp_is_empty!4677))

(declare-fun array_inv!2650 (array!8607) Bool)

(assert (=> start!20162 (array_inv!2650 _keys!825)))

(assert (=> start!20162 tp!17495))

(assert (= (and start!20162 res!93687) b!197872))

(assert (= (and b!197872 res!93686) b!197871))

(assert (= (and b!197871 res!93689) b!197864))

(assert (= (and b!197864 res!93690) b!197866))

(assert (= (and b!197866 res!93685) b!197870))

(assert (= (and b!197870 res!93691) b!197865))

(assert (= (and b!197865 res!93688) b!197873))

(assert (= (and b!197869 condMapEmpty!8084) mapIsEmpty!8084))

(assert (= (and b!197869 (not condMapEmpty!8084)) mapNonEmpty!8084))

(get-info :version)

(assert (= (and mapNonEmpty!8084 ((_ is ValueCellFull!1995) mapValue!8084)) b!197867))

(assert (= (and b!197869 ((_ is ValueCellFull!1995) mapDefault!8084)) b!197868))

(assert (= start!20162 b!197869))

(declare-fun m!224627 () Bool)

(assert (=> b!197870 m!224627))

(declare-fun m!224629 () Bool)

(assert (=> b!197865 m!224629))

(declare-fun m!224631 () Bool)

(assert (=> mapNonEmpty!8084 m!224631))

(declare-fun m!224633 () Bool)

(assert (=> b!197871 m!224633))

(declare-fun m!224635 () Bool)

(assert (=> b!197873 m!224635))

(declare-fun m!224637 () Bool)

(assert (=> b!197873 m!224637))

(declare-fun m!224639 () Bool)

(assert (=> b!197873 m!224639))

(declare-fun m!224641 () Bool)

(assert (=> b!197864 m!224641))

(declare-fun m!224643 () Bool)

(assert (=> start!20162 m!224643))

(declare-fun m!224645 () Bool)

(assert (=> start!20162 m!224645))

(declare-fun m!224647 () Bool)

(assert (=> start!20162 m!224647))

(check-sat (not b!197871) (not b!197873) b_and!11567 tp_is_empty!4677 (not b!197870) (not mapNonEmpty!8084) (not b!197864) (not start!20162) (not b_next!4821))
(check-sat b_and!11567 (not b_next!4821))
