; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20702 () Bool)

(assert start!20702)

(declare-fun b_free!5361 () Bool)

(declare-fun b_next!5361 () Bool)

(assert (=> start!20702 (= b_free!5361 (not b_next!5361))))

(declare-fun tp!19115 () Bool)

(declare-fun b_and!12107 () Bool)

(assert (=> start!20702 (= tp!19115 b_and!12107)))

(declare-fun b!207026 () Bool)

(declare-fun e!135222 () Bool)

(declare-fun e!135220 () Bool)

(declare-fun mapRes!8894 () Bool)

(assert (=> b!207026 (= e!135222 (and e!135220 mapRes!8894))))

(declare-fun condMapEmpty!8894 () Bool)

(declare-datatypes ((V!6603 0))(
  ( (V!6604 (val!2653 Int)) )
))
(declare-datatypes ((ValueCell!2265 0))(
  ( (ValueCellFull!2265 (v!4623 V!6603)) (EmptyCell!2265) )
))
(declare-datatypes ((array!9643 0))(
  ( (array!9644 (arr!4572 (Array (_ BitVec 32) ValueCell!2265)) (size!4897 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9643)

(declare-fun mapDefault!8894 () ValueCell!2265)

(assert (=> b!207026 (= condMapEmpty!8894 (= (arr!4572 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2265)) mapDefault!8894)))))

(declare-fun mapIsEmpty!8894 () Bool)

(assert (=> mapIsEmpty!8894 mapRes!8894))

(declare-fun b!207027 () Bool)

(declare-fun e!135224 () Bool)

(declare-fun tp_is_empty!5217 () Bool)

(assert (=> b!207027 (= e!135224 tp_is_empty!5217)))

(declare-fun res!100422 () Bool)

(declare-fun e!135221 () Bool)

(assert (=> start!20702 (=> (not res!100422) (not e!135221))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20702 (= res!100422 (validMask!0 mask!1149))))

(assert (=> start!20702 e!135221))

(declare-fun array_inv!3025 (array!9643) Bool)

(assert (=> start!20702 (and (array_inv!3025 _values!649) e!135222)))

(assert (=> start!20702 true))

(assert (=> start!20702 tp_is_empty!5217))

(declare-datatypes ((array!9645 0))(
  ( (array!9646 (arr!4573 (Array (_ BitVec 32) (_ BitVec 64))) (size!4898 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9645)

(declare-fun array_inv!3026 (array!9645) Bool)

(assert (=> start!20702 (array_inv!3026 _keys!825)))

(assert (=> start!20702 tp!19115))

(declare-fun b!207028 () Bool)

(declare-fun res!100419 () Bool)

(assert (=> b!207028 (=> (not res!100419) (not e!135221))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207028 (= res!100419 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4898 _keys!825))))))

(declare-fun b!207029 () Bool)

(declare-fun res!100420 () Bool)

(assert (=> b!207029 (=> (not res!100420) (not e!135221))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207029 (= res!100420 (validKeyInArray!0 k0!843))))

(declare-fun b!207030 () Bool)

(declare-fun res!100418 () Bool)

(assert (=> b!207030 (=> (not res!100418) (not e!135221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9645 (_ BitVec 32)) Bool)

(assert (=> b!207030 (= res!100418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207031 () Bool)

(declare-fun res!100421 () Bool)

(assert (=> b!207031 (=> (not res!100421) (not e!135221))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207031 (= res!100421 (and (= (size!4897 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4898 _keys!825) (size!4897 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207032 () Bool)

(assert (=> b!207032 (= e!135221 (not true))))

(declare-fun zeroValue!615 () V!6603)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6603)

(declare-datatypes ((tuple2!4028 0))(
  ( (tuple2!4029 (_1!2025 (_ BitVec 64)) (_2!2025 V!6603)) )
))
(declare-datatypes ((List!2918 0))(
  ( (Nil!2915) (Cons!2914 (h!3556 tuple2!4028) (t!7849 List!2918)) )
))
(declare-datatypes ((ListLongMap!2941 0))(
  ( (ListLongMap!2942 (toList!1486 List!2918)) )
))
(declare-fun lt!105985 () ListLongMap!2941)

(declare-fun getCurrentListMap!1053 (array!9645 array!9643 (_ BitVec 32) (_ BitVec 32) V!6603 V!6603 (_ BitVec 32) Int) ListLongMap!2941)

(assert (=> b!207032 (= lt!105985 (getCurrentListMap!1053 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105987 () ListLongMap!2941)

(declare-fun lt!105983 () array!9643)

(assert (=> b!207032 (= lt!105987 (getCurrentListMap!1053 _keys!825 lt!105983 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105982 () ListLongMap!2941)

(declare-fun lt!105986 () ListLongMap!2941)

(assert (=> b!207032 (and (= lt!105982 lt!105986) (= lt!105986 lt!105982))))

(declare-fun v!520 () V!6603)

(declare-fun lt!105981 () ListLongMap!2941)

(declare-fun +!513 (ListLongMap!2941 tuple2!4028) ListLongMap!2941)

(assert (=> b!207032 (= lt!105986 (+!513 lt!105981 (tuple2!4029 k0!843 v!520)))))

(declare-datatypes ((Unit!6314 0))(
  ( (Unit!6315) )
))
(declare-fun lt!105984 () Unit!6314)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!166 (array!9645 array!9643 (_ BitVec 32) (_ BitVec 32) V!6603 V!6603 (_ BitVec 32) (_ BitVec 64) V!6603 (_ BitVec 32) Int) Unit!6314)

(assert (=> b!207032 (= lt!105984 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!166 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!427 (array!9645 array!9643 (_ BitVec 32) (_ BitVec 32) V!6603 V!6603 (_ BitVec 32) Int) ListLongMap!2941)

(assert (=> b!207032 (= lt!105982 (getCurrentListMapNoExtraKeys!427 _keys!825 lt!105983 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207032 (= lt!105983 (array!9644 (store (arr!4572 _values!649) i!601 (ValueCellFull!2265 v!520)) (size!4897 _values!649)))))

(assert (=> b!207032 (= lt!105981 (getCurrentListMapNoExtraKeys!427 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207033 () Bool)

(declare-fun res!100423 () Bool)

(assert (=> b!207033 (=> (not res!100423) (not e!135221))))

(assert (=> b!207033 (= res!100423 (= (select (arr!4573 _keys!825) i!601) k0!843))))

(declare-fun b!207034 () Bool)

(declare-fun res!100417 () Bool)

(assert (=> b!207034 (=> (not res!100417) (not e!135221))))

(declare-datatypes ((List!2919 0))(
  ( (Nil!2916) (Cons!2915 (h!3557 (_ BitVec 64)) (t!7850 List!2919)) )
))
(declare-fun arrayNoDuplicates!0 (array!9645 (_ BitVec 32) List!2919) Bool)

(assert (=> b!207034 (= res!100417 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2916))))

(declare-fun mapNonEmpty!8894 () Bool)

(declare-fun tp!19114 () Bool)

(assert (=> mapNonEmpty!8894 (= mapRes!8894 (and tp!19114 e!135224))))

(declare-fun mapRest!8894 () (Array (_ BitVec 32) ValueCell!2265))

(declare-fun mapValue!8894 () ValueCell!2265)

(declare-fun mapKey!8894 () (_ BitVec 32))

(assert (=> mapNonEmpty!8894 (= (arr!4572 _values!649) (store mapRest!8894 mapKey!8894 mapValue!8894))))

(declare-fun b!207035 () Bool)

(assert (=> b!207035 (= e!135220 tp_is_empty!5217)))

(assert (= (and start!20702 res!100422) b!207031))

(assert (= (and b!207031 res!100421) b!207030))

(assert (= (and b!207030 res!100418) b!207034))

(assert (= (and b!207034 res!100417) b!207028))

(assert (= (and b!207028 res!100419) b!207029))

(assert (= (and b!207029 res!100420) b!207033))

(assert (= (and b!207033 res!100423) b!207032))

(assert (= (and b!207026 condMapEmpty!8894) mapIsEmpty!8894))

(assert (= (and b!207026 (not condMapEmpty!8894)) mapNonEmpty!8894))

(get-info :version)

(assert (= (and mapNonEmpty!8894 ((_ is ValueCellFull!2265) mapValue!8894)) b!207027))

(assert (= (and b!207026 ((_ is ValueCellFull!2265) mapDefault!8894)) b!207035))

(assert (= start!20702 b!207026))

(declare-fun m!234769 () Bool)

(assert (=> mapNonEmpty!8894 m!234769))

(declare-fun m!234771 () Bool)

(assert (=> b!207030 m!234771))

(declare-fun m!234773 () Bool)

(assert (=> b!207032 m!234773))

(declare-fun m!234775 () Bool)

(assert (=> b!207032 m!234775))

(declare-fun m!234777 () Bool)

(assert (=> b!207032 m!234777))

(declare-fun m!234779 () Bool)

(assert (=> b!207032 m!234779))

(declare-fun m!234781 () Bool)

(assert (=> b!207032 m!234781))

(declare-fun m!234783 () Bool)

(assert (=> b!207032 m!234783))

(declare-fun m!234785 () Bool)

(assert (=> b!207032 m!234785))

(declare-fun m!234787 () Bool)

(assert (=> b!207029 m!234787))

(declare-fun m!234789 () Bool)

(assert (=> start!20702 m!234789))

(declare-fun m!234791 () Bool)

(assert (=> start!20702 m!234791))

(declare-fun m!234793 () Bool)

(assert (=> start!20702 m!234793))

(declare-fun m!234795 () Bool)

(assert (=> b!207033 m!234795))

(declare-fun m!234797 () Bool)

(assert (=> b!207034 m!234797))

(check-sat b_and!12107 tp_is_empty!5217 (not mapNonEmpty!8894) (not b!207030) (not b!207032) (not b_next!5361) (not b!207029) (not b!207034) (not start!20702))
(check-sat b_and!12107 (not b_next!5361))
