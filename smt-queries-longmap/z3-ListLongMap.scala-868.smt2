; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20306 () Bool)

(assert start!20306)

(declare-fun b_free!4965 () Bool)

(declare-fun b_next!4965 () Bool)

(assert (=> start!20306 (= b_free!4965 (not b_next!4965))))

(declare-fun tp!17926 () Bool)

(declare-fun b_and!11711 () Bool)

(assert (=> start!20306 (= tp!17926 b_and!11711)))

(declare-fun b!200024 () Bool)

(declare-fun res!95201 () Bool)

(declare-fun e!131219 () Bool)

(assert (=> b!200024 (=> (not res!95201) (not e!131219))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200024 (= res!95201 (validKeyInArray!0 k0!843))))

(declare-fun b!200025 () Bool)

(declare-fun res!95200 () Bool)

(assert (=> b!200025 (=> (not res!95200) (not e!131219))))

(declare-datatypes ((array!8879 0))(
  ( (array!8880 (arr!4190 (Array (_ BitVec 32) (_ BitVec 64))) (size!4515 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8879)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200025 (= res!95200 (= (select (arr!4190 _keys!825) i!601) k0!843))))

(declare-fun b!200026 () Bool)

(declare-fun e!131217 () Bool)

(declare-fun tp_is_empty!4821 () Bool)

(assert (=> b!200026 (= e!131217 tp_is_empty!4821)))

(declare-fun b!200027 () Bool)

(declare-fun res!95198 () Bool)

(assert (=> b!200027 (=> (not res!95198) (not e!131219))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8879 (_ BitVec 32)) Bool)

(assert (=> b!200027 (= res!95198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200028 () Bool)

(declare-fun e!131218 () Bool)

(declare-fun mapRes!8300 () Bool)

(assert (=> b!200028 (= e!131218 (and e!131217 mapRes!8300))))

(declare-fun condMapEmpty!8300 () Bool)

(declare-datatypes ((V!6075 0))(
  ( (V!6076 (val!2455 Int)) )
))
(declare-datatypes ((ValueCell!2067 0))(
  ( (ValueCellFull!2067 (v!4425 V!6075)) (EmptyCell!2067) )
))
(declare-datatypes ((array!8881 0))(
  ( (array!8882 (arr!4191 (Array (_ BitVec 32) ValueCell!2067)) (size!4516 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8881)

(declare-fun mapDefault!8300 () ValueCell!2067)

(assert (=> b!200028 (= condMapEmpty!8300 (= (arr!4191 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2067)) mapDefault!8300)))))

(declare-fun b!200030 () Bool)

(declare-fun res!95202 () Bool)

(assert (=> b!200030 (=> (not res!95202) (not e!131219))))

(assert (=> b!200030 (= res!95202 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4515 _keys!825))))))

(declare-fun mapIsEmpty!8300 () Bool)

(assert (=> mapIsEmpty!8300 mapRes!8300))

(declare-fun b!200031 () Bool)

(assert (=> b!200031 (= e!131219 (not true))))

(declare-datatypes ((tuple2!3710 0))(
  ( (tuple2!3711 (_1!1866 (_ BitVec 64)) (_2!1866 V!6075)) )
))
(declare-datatypes ((List!2627 0))(
  ( (Nil!2624) (Cons!2623 (h!3265 tuple2!3710) (t!7558 List!2627)) )
))
(declare-datatypes ((ListLongMap!2623 0))(
  ( (ListLongMap!2624 (toList!1327 List!2627)) )
))
(declare-fun lt!98668 () ListLongMap!2623)

(declare-fun lt!98670 () array!8881)

(declare-fun zeroValue!615 () V!6075)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6075)

(declare-fun getCurrentListMap!918 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6075 V!6075 (_ BitVec 32) Int) ListLongMap!2623)

(assert (=> b!200031 (= lt!98668 (getCurrentListMap!918 _keys!825 lt!98670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98673 () ListLongMap!2623)

(declare-fun lt!98671 () ListLongMap!2623)

(assert (=> b!200031 (and (= lt!98673 lt!98671) (= lt!98671 lt!98673))))

(declare-fun v!520 () V!6075)

(declare-fun lt!98669 () ListLongMap!2623)

(declare-fun +!354 (ListLongMap!2623 tuple2!3710) ListLongMap!2623)

(assert (=> b!200031 (= lt!98671 (+!354 lt!98669 (tuple2!3711 k0!843 v!520)))))

(declare-datatypes ((Unit!6010 0))(
  ( (Unit!6011) )
))
(declare-fun lt!98672 () Unit!6010)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6075 V!6075 (_ BitVec 32) (_ BitVec 64) V!6075 (_ BitVec 32) Int) Unit!6010)

(assert (=> b!200031 (= lt!98672 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!292 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6075 V!6075 (_ BitVec 32) Int) ListLongMap!2623)

(assert (=> b!200031 (= lt!98673 (getCurrentListMapNoExtraKeys!292 _keys!825 lt!98670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200031 (= lt!98670 (array!8882 (store (arr!4191 _values!649) i!601 (ValueCellFull!2067 v!520)) (size!4516 _values!649)))))

(assert (=> b!200031 (= lt!98669 (getCurrentListMapNoExtraKeys!292 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200032 () Bool)

(declare-fun e!131216 () Bool)

(assert (=> b!200032 (= e!131216 tp_is_empty!4821)))

(declare-fun mapNonEmpty!8300 () Bool)

(declare-fun tp!17927 () Bool)

(assert (=> mapNonEmpty!8300 (= mapRes!8300 (and tp!17927 e!131216))))

(declare-fun mapRest!8300 () (Array (_ BitVec 32) ValueCell!2067))

(declare-fun mapValue!8300 () ValueCell!2067)

(declare-fun mapKey!8300 () (_ BitVec 32))

(assert (=> mapNonEmpty!8300 (= (arr!4191 _values!649) (store mapRest!8300 mapKey!8300 mapValue!8300))))

(declare-fun b!200033 () Bool)

(declare-fun res!95203 () Bool)

(assert (=> b!200033 (=> (not res!95203) (not e!131219))))

(declare-datatypes ((List!2628 0))(
  ( (Nil!2625) (Cons!2624 (h!3266 (_ BitVec 64)) (t!7559 List!2628)) )
))
(declare-fun arrayNoDuplicates!0 (array!8879 (_ BitVec 32) List!2628) Bool)

(assert (=> b!200033 (= res!95203 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2625))))

(declare-fun res!95199 () Bool)

(assert (=> start!20306 (=> (not res!95199) (not e!131219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20306 (= res!95199 (validMask!0 mask!1149))))

(assert (=> start!20306 e!131219))

(declare-fun array_inv!2757 (array!8881) Bool)

(assert (=> start!20306 (and (array_inv!2757 _values!649) e!131218)))

(assert (=> start!20306 true))

(assert (=> start!20306 tp_is_empty!4821))

(declare-fun array_inv!2758 (array!8879) Bool)

(assert (=> start!20306 (array_inv!2758 _keys!825)))

(assert (=> start!20306 tp!17926))

(declare-fun b!200029 () Bool)

(declare-fun res!95197 () Bool)

(assert (=> b!200029 (=> (not res!95197) (not e!131219))))

(assert (=> b!200029 (= res!95197 (and (= (size!4516 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4515 _keys!825) (size!4516 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20306 res!95199) b!200029))

(assert (= (and b!200029 res!95197) b!200027))

(assert (= (and b!200027 res!95198) b!200033))

(assert (= (and b!200033 res!95203) b!200030))

(assert (= (and b!200030 res!95202) b!200024))

(assert (= (and b!200024 res!95201) b!200025))

(assert (= (and b!200025 res!95200) b!200031))

(assert (= (and b!200028 condMapEmpty!8300) mapIsEmpty!8300))

(assert (= (and b!200028 (not condMapEmpty!8300)) mapNonEmpty!8300))

(get-info :version)

(assert (= (and mapNonEmpty!8300 ((_ is ValueCellFull!2067) mapValue!8300)) b!200032))

(assert (= (and b!200028 ((_ is ValueCellFull!2067) mapDefault!8300)) b!200026))

(assert (= start!20306 b!200028))

(declare-fun m!226451 () Bool)

(assert (=> b!200025 m!226451))

(declare-fun m!226453 () Bool)

(assert (=> b!200024 m!226453))

(declare-fun m!226455 () Bool)

(assert (=> b!200031 m!226455))

(declare-fun m!226457 () Bool)

(assert (=> b!200031 m!226457))

(declare-fun m!226459 () Bool)

(assert (=> b!200031 m!226459))

(declare-fun m!226461 () Bool)

(assert (=> b!200031 m!226461))

(declare-fun m!226463 () Bool)

(assert (=> b!200031 m!226463))

(declare-fun m!226465 () Bool)

(assert (=> b!200031 m!226465))

(declare-fun m!226467 () Bool)

(assert (=> b!200033 m!226467))

(declare-fun m!226469 () Bool)

(assert (=> start!20306 m!226469))

(declare-fun m!226471 () Bool)

(assert (=> start!20306 m!226471))

(declare-fun m!226473 () Bool)

(assert (=> start!20306 m!226473))

(declare-fun m!226475 () Bool)

(assert (=> mapNonEmpty!8300 m!226475))

(declare-fun m!226477 () Bool)

(assert (=> b!200027 m!226477))

(check-sat b_and!11711 (not start!20306) (not b!200027) tp_is_empty!4821 (not b_next!4965) (not b!200033) (not b!200024) (not mapNonEmpty!8300) (not b!200031))
(check-sat b_and!11711 (not b_next!4965))
