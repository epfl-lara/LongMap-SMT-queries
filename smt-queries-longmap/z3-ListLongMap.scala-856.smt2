; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20236 () Bool)

(assert start!20236)

(declare-fun b_free!4891 () Bool)

(declare-fun b_next!4891 () Bool)

(assert (=> start!20236 (= b_free!4891 (not b_next!4891))))

(declare-fun tp!17704 () Bool)

(declare-fun b_and!11611 () Bool)

(assert (=> start!20236 (= tp!17704 b_and!11611)))

(declare-fun b!198767 () Bool)

(declare-fun res!94331 () Bool)

(declare-fun e!130563 () Bool)

(assert (=> b!198767 (=> (not res!94331) (not e!130563))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198767 (= res!94331 (validKeyInArray!0 k0!843))))

(declare-fun b!198768 () Bool)

(declare-fun res!94325 () Bool)

(assert (=> b!198768 (=> (not res!94325) (not e!130563))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8717 0))(
  ( (array!8718 (arr!4108 (Array (_ BitVec 32) (_ BitVec 64))) (size!4434 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8717)

(assert (=> b!198768 (= res!94325 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4434 _keys!825))))))

(declare-fun b!198769 () Bool)

(declare-fun res!94329 () Bool)

(assert (=> b!198769 (=> (not res!94329) (not e!130563))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5977 0))(
  ( (V!5978 (val!2418 Int)) )
))
(declare-datatypes ((ValueCell!2030 0))(
  ( (ValueCellFull!2030 (v!4382 V!5977)) (EmptyCell!2030) )
))
(declare-datatypes ((array!8719 0))(
  ( (array!8720 (arr!4109 (Array (_ BitVec 32) ValueCell!2030)) (size!4435 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8719)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198769 (= res!94329 (and (= (size!4435 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4434 _keys!825) (size!4435 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198770 () Bool)

(declare-fun e!130562 () Bool)

(declare-fun e!130559 () Bool)

(declare-fun mapRes!8189 () Bool)

(assert (=> b!198770 (= e!130562 (and e!130559 mapRes!8189))))

(declare-fun condMapEmpty!8189 () Bool)

(declare-fun mapDefault!8189 () ValueCell!2030)

(assert (=> b!198770 (= condMapEmpty!8189 (= (arr!4109 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2030)) mapDefault!8189)))))

(declare-fun b!198771 () Bool)

(declare-fun res!94330 () Bool)

(assert (=> b!198771 (=> (not res!94330) (not e!130563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8717 (_ BitVec 32)) Bool)

(assert (=> b!198771 (= res!94330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94328 () Bool)

(assert (=> start!20236 (=> (not res!94328) (not e!130563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20236 (= res!94328 (validMask!0 mask!1149))))

(assert (=> start!20236 e!130563))

(declare-fun array_inv!2677 (array!8719) Bool)

(assert (=> start!20236 (and (array_inv!2677 _values!649) e!130562)))

(assert (=> start!20236 true))

(declare-fun tp_is_empty!4747 () Bool)

(assert (=> start!20236 tp_is_empty!4747))

(declare-fun array_inv!2678 (array!8717) Bool)

(assert (=> start!20236 (array_inv!2678 _keys!825)))

(assert (=> start!20236 tp!17704))

(declare-fun b!198772 () Bool)

(declare-fun res!94326 () Bool)

(assert (=> b!198772 (=> (not res!94326) (not e!130563))))

(declare-datatypes ((List!2556 0))(
  ( (Nil!2553) (Cons!2552 (h!3194 (_ BitVec 64)) (t!7478 List!2556)) )
))
(declare-fun arrayNoDuplicates!0 (array!8717 (_ BitVec 32) List!2556) Bool)

(assert (=> b!198772 (= res!94326 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2553))))

(declare-fun mapIsEmpty!8189 () Bool)

(assert (=> mapIsEmpty!8189 mapRes!8189))

(declare-fun b!198773 () Bool)

(declare-fun res!94327 () Bool)

(assert (=> b!198773 (=> (not res!94327) (not e!130563))))

(assert (=> b!198773 (= res!94327 (= (select (arr!4108 _keys!825) i!601) k0!843))))

(declare-fun b!198774 () Bool)

(assert (=> b!198774 (= e!130563 (not true))))

(declare-datatypes ((tuple2!3624 0))(
  ( (tuple2!3625 (_1!1823 (_ BitVec 64)) (_2!1823 V!5977)) )
))
(declare-datatypes ((List!2557 0))(
  ( (Nil!2554) (Cons!2553 (h!3195 tuple2!3624) (t!7479 List!2557)) )
))
(declare-datatypes ((ListLongMap!2527 0))(
  ( (ListLongMap!2528 (toList!1279 List!2557)) )
))
(declare-fun lt!97908 () ListLongMap!2527)

(declare-fun lt!97907 () ListLongMap!2527)

(assert (=> b!198774 (and (= lt!97908 lt!97907) (= lt!97907 lt!97908))))

(declare-fun lt!97910 () ListLongMap!2527)

(declare-fun v!520 () V!5977)

(declare-fun +!328 (ListLongMap!2527 tuple2!3624) ListLongMap!2527)

(assert (=> b!198774 (= lt!97907 (+!328 lt!97910 (tuple2!3625 k0!843 v!520)))))

(declare-datatypes ((Unit!5908 0))(
  ( (Unit!5909) )
))
(declare-fun lt!97909 () Unit!5908)

(declare-fun zeroValue!615 () V!5977)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5977)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!8 (array!8717 array!8719 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) (_ BitVec 64) V!5977 (_ BitVec 32) Int) Unit!5908)

(assert (=> b!198774 (= lt!97909 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!8 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!259 (array!8717 array!8719 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) Int) ListLongMap!2527)

(assert (=> b!198774 (= lt!97908 (getCurrentListMapNoExtraKeys!259 _keys!825 (array!8720 (store (arr!4109 _values!649) i!601 (ValueCellFull!2030 v!520)) (size!4435 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198774 (= lt!97910 (getCurrentListMapNoExtraKeys!259 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198775 () Bool)

(declare-fun e!130560 () Bool)

(assert (=> b!198775 (= e!130560 tp_is_empty!4747)))

(declare-fun b!198776 () Bool)

(assert (=> b!198776 (= e!130559 tp_is_empty!4747)))

(declare-fun mapNonEmpty!8189 () Bool)

(declare-fun tp!17705 () Bool)

(assert (=> mapNonEmpty!8189 (= mapRes!8189 (and tp!17705 e!130560))))

(declare-fun mapKey!8189 () (_ BitVec 32))

(declare-fun mapRest!8189 () (Array (_ BitVec 32) ValueCell!2030))

(declare-fun mapValue!8189 () ValueCell!2030)

(assert (=> mapNonEmpty!8189 (= (arr!4109 _values!649) (store mapRest!8189 mapKey!8189 mapValue!8189))))

(assert (= (and start!20236 res!94328) b!198769))

(assert (= (and b!198769 res!94329) b!198771))

(assert (= (and b!198771 res!94330) b!198772))

(assert (= (and b!198772 res!94326) b!198768))

(assert (= (and b!198768 res!94325) b!198767))

(assert (= (and b!198767 res!94331) b!198773))

(assert (= (and b!198773 res!94327) b!198774))

(assert (= (and b!198770 condMapEmpty!8189) mapIsEmpty!8189))

(assert (= (and b!198770 (not condMapEmpty!8189)) mapNonEmpty!8189))

(get-info :version)

(assert (= (and mapNonEmpty!8189 ((_ is ValueCellFull!2030) mapValue!8189)) b!198775))

(assert (= (and b!198770 ((_ is ValueCellFull!2030) mapDefault!8189)) b!198776))

(assert (= start!20236 b!198770))

(declare-fun m!224829 () Bool)

(assert (=> b!198774 m!224829))

(declare-fun m!224831 () Bool)

(assert (=> b!198774 m!224831))

(declare-fun m!224833 () Bool)

(assert (=> b!198774 m!224833))

(declare-fun m!224835 () Bool)

(assert (=> b!198774 m!224835))

(declare-fun m!224837 () Bool)

(assert (=> b!198774 m!224837))

(declare-fun m!224839 () Bool)

(assert (=> mapNonEmpty!8189 m!224839))

(declare-fun m!224841 () Bool)

(assert (=> b!198772 m!224841))

(declare-fun m!224843 () Bool)

(assert (=> start!20236 m!224843))

(declare-fun m!224845 () Bool)

(assert (=> start!20236 m!224845))

(declare-fun m!224847 () Bool)

(assert (=> start!20236 m!224847))

(declare-fun m!224849 () Bool)

(assert (=> b!198767 m!224849))

(declare-fun m!224851 () Bool)

(assert (=> b!198773 m!224851))

(declare-fun m!224853 () Bool)

(assert (=> b!198771 m!224853))

(check-sat (not b!198767) (not b!198774) (not start!20236) (not b_next!4891) (not mapNonEmpty!8189) tp_is_empty!4747 b_and!11611 (not b!198772) (not b!198771))
(check-sat b_and!11611 (not b_next!4891))
