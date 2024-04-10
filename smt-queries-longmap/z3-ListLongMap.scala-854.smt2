; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20222 () Bool)

(assert start!20222)

(declare-fun b_free!4881 () Bool)

(declare-fun b_next!4881 () Bool)

(assert (=> start!20222 (= b_free!4881 (not b_next!4881))))

(declare-fun tp!17674 () Bool)

(declare-fun b_and!11627 () Bool)

(assert (=> start!20222 (= tp!17674 b_and!11627)))

(declare-fun b!198764 () Bool)

(declare-fun res!94319 () Bool)

(declare-fun e!130588 () Bool)

(assert (=> b!198764 (=> (not res!94319) (not e!130588))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8715 0))(
  ( (array!8716 (arr!4108 (Array (_ BitVec 32) (_ BitVec 64))) (size!4433 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8715)

(assert (=> b!198764 (= res!94319 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4433 _keys!825))))))

(declare-fun res!94316 () Bool)

(assert (=> start!20222 (=> (not res!94316) (not e!130588))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20222 (= res!94316 (validMask!0 mask!1149))))

(assert (=> start!20222 e!130588))

(declare-datatypes ((V!5963 0))(
  ( (V!5964 (val!2413 Int)) )
))
(declare-datatypes ((ValueCell!2025 0))(
  ( (ValueCellFull!2025 (v!4383 V!5963)) (EmptyCell!2025) )
))
(declare-datatypes ((array!8717 0))(
  ( (array!8718 (arr!4109 (Array (_ BitVec 32) ValueCell!2025)) (size!4434 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8717)

(declare-fun e!130587 () Bool)

(declare-fun array_inv!2691 (array!8717) Bool)

(assert (=> start!20222 (and (array_inv!2691 _values!649) e!130587)))

(assert (=> start!20222 true))

(declare-fun tp_is_empty!4737 () Bool)

(assert (=> start!20222 tp_is_empty!4737))

(declare-fun array_inv!2692 (array!8715) Bool)

(assert (=> start!20222 (array_inv!2692 _keys!825)))

(assert (=> start!20222 tp!17674))

(declare-fun mapNonEmpty!8174 () Bool)

(declare-fun mapRes!8174 () Bool)

(declare-fun tp!17675 () Bool)

(declare-fun e!130586 () Bool)

(assert (=> mapNonEmpty!8174 (= mapRes!8174 (and tp!17675 e!130586))))

(declare-fun mapRest!8174 () (Array (_ BitVec 32) ValueCell!2025))

(declare-fun mapKey!8174 () (_ BitVec 32))

(declare-fun mapValue!8174 () ValueCell!2025)

(assert (=> mapNonEmpty!8174 (= (arr!4109 _values!649) (store mapRest!8174 mapKey!8174 mapValue!8174))))

(declare-fun b!198765 () Bool)

(declare-fun res!94317 () Bool)

(assert (=> b!198765 (=> (not res!94317) (not e!130588))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198765 (= res!94317 (and (= (size!4434 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4433 _keys!825) (size!4434 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198766 () Bool)

(assert (=> b!198766 (= e!130588 (not true))))

(declare-datatypes ((tuple2!3656 0))(
  ( (tuple2!3657 (_1!1839 (_ BitVec 64)) (_2!1839 V!5963)) )
))
(declare-datatypes ((List!2570 0))(
  ( (Nil!2567) (Cons!2566 (h!3208 tuple2!3656) (t!7501 List!2570)) )
))
(declare-datatypes ((ListLongMap!2569 0))(
  ( (ListLongMap!2570 (toList!1300 List!2570)) )
))
(declare-fun lt!98028 () ListLongMap!2569)

(declare-fun lt!98030 () ListLongMap!2569)

(assert (=> b!198766 (and (= lt!98028 lt!98030) (= lt!98030 lt!98028))))

(declare-fun v!520 () V!5963)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!98031 () ListLongMap!2569)

(declare-fun +!327 (ListLongMap!2569 tuple2!3656) ListLongMap!2569)

(assert (=> b!198766 (= lt!98030 (+!327 lt!98031 (tuple2!3657 k0!843 v!520)))))

(declare-datatypes ((Unit!5956 0))(
  ( (Unit!5957) )
))
(declare-fun lt!98029 () Unit!5956)

(declare-fun zeroValue!615 () V!5963)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5963)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!4 (array!8715 array!8717 (_ BitVec 32) (_ BitVec 32) V!5963 V!5963 (_ BitVec 32) (_ BitVec 64) V!5963 (_ BitVec 32) Int) Unit!5956)

(assert (=> b!198766 (= lt!98029 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!4 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!265 (array!8715 array!8717 (_ BitVec 32) (_ BitVec 32) V!5963 V!5963 (_ BitVec 32) Int) ListLongMap!2569)

(assert (=> b!198766 (= lt!98028 (getCurrentListMapNoExtraKeys!265 _keys!825 (array!8718 (store (arr!4109 _values!649) i!601 (ValueCellFull!2025 v!520)) (size!4434 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198766 (= lt!98031 (getCurrentListMapNoExtraKeys!265 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198767 () Bool)

(declare-fun res!94320 () Bool)

(assert (=> b!198767 (=> (not res!94320) (not e!130588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8715 (_ BitVec 32)) Bool)

(assert (=> b!198767 (= res!94320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198768 () Bool)

(declare-fun res!94321 () Bool)

(assert (=> b!198768 (=> (not res!94321) (not e!130588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198768 (= res!94321 (validKeyInArray!0 k0!843))))

(declare-fun b!198769 () Bool)

(declare-fun e!130585 () Bool)

(assert (=> b!198769 (= e!130585 tp_is_empty!4737)))

(declare-fun b!198770 () Bool)

(declare-fun res!94315 () Bool)

(assert (=> b!198770 (=> (not res!94315) (not e!130588))))

(declare-datatypes ((List!2571 0))(
  ( (Nil!2568) (Cons!2567 (h!3209 (_ BitVec 64)) (t!7502 List!2571)) )
))
(declare-fun arrayNoDuplicates!0 (array!8715 (_ BitVec 32) List!2571) Bool)

(assert (=> b!198770 (= res!94315 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2568))))

(declare-fun b!198771 () Bool)

(assert (=> b!198771 (= e!130586 tp_is_empty!4737)))

(declare-fun b!198772 () Bool)

(assert (=> b!198772 (= e!130587 (and e!130585 mapRes!8174))))

(declare-fun condMapEmpty!8174 () Bool)

(declare-fun mapDefault!8174 () ValueCell!2025)

(assert (=> b!198772 (= condMapEmpty!8174 (= (arr!4109 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2025)) mapDefault!8174)))))

(declare-fun b!198773 () Bool)

(declare-fun res!94318 () Bool)

(assert (=> b!198773 (=> (not res!94318) (not e!130588))))

(assert (=> b!198773 (= res!94318 (= (select (arr!4108 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8174 () Bool)

(assert (=> mapIsEmpty!8174 mapRes!8174))

(assert (= (and start!20222 res!94316) b!198765))

(assert (= (and b!198765 res!94317) b!198767))

(assert (= (and b!198767 res!94320) b!198770))

(assert (= (and b!198770 res!94315) b!198764))

(assert (= (and b!198764 res!94319) b!198768))

(assert (= (and b!198768 res!94321) b!198773))

(assert (= (and b!198773 res!94318) b!198766))

(assert (= (and b!198772 condMapEmpty!8174) mapIsEmpty!8174))

(assert (= (and b!198772 (not condMapEmpty!8174)) mapNonEmpty!8174))

(get-info :version)

(assert (= (and mapNonEmpty!8174 ((_ is ValueCellFull!2025) mapValue!8174)) b!198771))

(assert (= (and b!198772 ((_ is ValueCellFull!2025) mapDefault!8174)) b!198769))

(assert (= start!20222 b!198772))

(declare-fun m!225315 () Bool)

(assert (=> b!198767 m!225315))

(declare-fun m!225317 () Bool)

(assert (=> start!20222 m!225317))

(declare-fun m!225319 () Bool)

(assert (=> start!20222 m!225319))

(declare-fun m!225321 () Bool)

(assert (=> start!20222 m!225321))

(declare-fun m!225323 () Bool)

(assert (=> b!198768 m!225323))

(declare-fun m!225325 () Bool)

(assert (=> b!198773 m!225325))

(declare-fun m!225327 () Bool)

(assert (=> mapNonEmpty!8174 m!225327))

(declare-fun m!225329 () Bool)

(assert (=> b!198766 m!225329))

(declare-fun m!225331 () Bool)

(assert (=> b!198766 m!225331))

(declare-fun m!225333 () Bool)

(assert (=> b!198766 m!225333))

(declare-fun m!225335 () Bool)

(assert (=> b!198766 m!225335))

(declare-fun m!225337 () Bool)

(assert (=> b!198766 m!225337))

(declare-fun m!225339 () Bool)

(assert (=> b!198770 m!225339))

(check-sat (not mapNonEmpty!8174) (not b!198767) tp_is_empty!4737 (not b!198770) (not start!20222) b_and!11627 (not b!198768) (not b_next!4881) (not b!198766))
(check-sat b_and!11627 (not b_next!4881))
