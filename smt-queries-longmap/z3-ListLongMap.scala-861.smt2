; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20264 () Bool)

(assert start!20264)

(declare-fun b_free!4923 () Bool)

(declare-fun b_next!4923 () Bool)

(assert (=> start!20264 (= b_free!4923 (not b_next!4923))))

(declare-fun tp!17801 () Bool)

(declare-fun b_and!11669 () Bool)

(assert (=> start!20264 (= tp!17801 b_and!11669)))

(declare-fun b!199394 () Bool)

(declare-fun res!94761 () Bool)

(declare-fun e!130900 () Bool)

(assert (=> b!199394 (=> (not res!94761) (not e!130900))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199394 (= res!94761 (validKeyInArray!0 k0!843))))

(declare-fun b!199395 () Bool)

(declare-fun res!94756 () Bool)

(assert (=> b!199395 (=> (not res!94756) (not e!130900))))

(declare-datatypes ((array!8799 0))(
  ( (array!8800 (arr!4150 (Array (_ BitVec 32) (_ BitVec 64))) (size!4475 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8799)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6019 0))(
  ( (V!6020 (val!2434 Int)) )
))
(declare-datatypes ((ValueCell!2046 0))(
  ( (ValueCellFull!2046 (v!4404 V!6019)) (EmptyCell!2046) )
))
(declare-datatypes ((array!8801 0))(
  ( (array!8802 (arr!4151 (Array (_ BitVec 32) ValueCell!2046)) (size!4476 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8801)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199395 (= res!94756 (and (= (size!4476 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4475 _keys!825) (size!4476 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!94757 () Bool)

(assert (=> start!20264 (=> (not res!94757) (not e!130900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20264 (= res!94757 (validMask!0 mask!1149))))

(assert (=> start!20264 e!130900))

(declare-fun e!130904 () Bool)

(declare-fun array_inv!2723 (array!8801) Bool)

(assert (=> start!20264 (and (array_inv!2723 _values!649) e!130904)))

(assert (=> start!20264 true))

(declare-fun tp_is_empty!4779 () Bool)

(assert (=> start!20264 tp_is_empty!4779))

(declare-fun array_inv!2724 (array!8799) Bool)

(assert (=> start!20264 (array_inv!2724 _keys!825)))

(assert (=> start!20264 tp!17801))

(declare-fun b!199396 () Bool)

(assert (=> b!199396 (= e!130900 (not true))))

(declare-fun lt!98290 () array!8801)

(declare-datatypes ((tuple2!3682 0))(
  ( (tuple2!3683 (_1!1852 (_ BitVec 64)) (_2!1852 V!6019)) )
))
(declare-datatypes ((List!2600 0))(
  ( (Nil!2597) (Cons!2596 (h!3238 tuple2!3682) (t!7531 List!2600)) )
))
(declare-datatypes ((ListLongMap!2595 0))(
  ( (ListLongMap!2596 (toList!1313 List!2600)) )
))
(declare-fun lt!98294 () ListLongMap!2595)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6019)

(declare-fun zeroValue!615 () V!6019)

(declare-fun getCurrentListMap!904 (array!8799 array!8801 (_ BitVec 32) (_ BitVec 32) V!6019 V!6019 (_ BitVec 32) Int) ListLongMap!2595)

(assert (=> b!199396 (= lt!98294 (getCurrentListMap!904 _keys!825 lt!98290 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98292 () ListLongMap!2595)

(declare-fun lt!98291 () ListLongMap!2595)

(assert (=> b!199396 (and (= lt!98292 lt!98291) (= lt!98291 lt!98292))))

(declare-fun lt!98293 () ListLongMap!2595)

(declare-fun v!520 () V!6019)

(declare-fun +!340 (ListLongMap!2595 tuple2!3682) ListLongMap!2595)

(assert (=> b!199396 (= lt!98291 (+!340 lt!98293 (tuple2!3683 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!5982 0))(
  ( (Unit!5983) )
))
(declare-fun lt!98295 () Unit!5982)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!17 (array!8799 array!8801 (_ BitVec 32) (_ BitVec 32) V!6019 V!6019 (_ BitVec 32) (_ BitVec 64) V!6019 (_ BitVec 32) Int) Unit!5982)

(assert (=> b!199396 (= lt!98295 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!17 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!278 (array!8799 array!8801 (_ BitVec 32) (_ BitVec 32) V!6019 V!6019 (_ BitVec 32) Int) ListLongMap!2595)

(assert (=> b!199396 (= lt!98292 (getCurrentListMapNoExtraKeys!278 _keys!825 lt!98290 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199396 (= lt!98290 (array!8802 (store (arr!4151 _values!649) i!601 (ValueCellFull!2046 v!520)) (size!4476 _values!649)))))

(assert (=> b!199396 (= lt!98293 (getCurrentListMapNoExtraKeys!278 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8237 () Bool)

(declare-fun mapRes!8237 () Bool)

(declare-fun tp!17800 () Bool)

(declare-fun e!130903 () Bool)

(assert (=> mapNonEmpty!8237 (= mapRes!8237 (and tp!17800 e!130903))))

(declare-fun mapValue!8237 () ValueCell!2046)

(declare-fun mapKey!8237 () (_ BitVec 32))

(declare-fun mapRest!8237 () (Array (_ BitVec 32) ValueCell!2046))

(assert (=> mapNonEmpty!8237 (= (arr!4151 _values!649) (store mapRest!8237 mapKey!8237 mapValue!8237))))

(declare-fun b!199397 () Bool)

(declare-fun e!130901 () Bool)

(assert (=> b!199397 (= e!130901 tp_is_empty!4779)))

(declare-fun b!199398 () Bool)

(declare-fun res!94762 () Bool)

(assert (=> b!199398 (=> (not res!94762) (not e!130900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8799 (_ BitVec 32)) Bool)

(assert (=> b!199398 (= res!94762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199399 () Bool)

(assert (=> b!199399 (= e!130903 tp_is_empty!4779)))

(declare-fun mapIsEmpty!8237 () Bool)

(assert (=> mapIsEmpty!8237 mapRes!8237))

(declare-fun b!199400 () Bool)

(declare-fun res!94759 () Bool)

(assert (=> b!199400 (=> (not res!94759) (not e!130900))))

(assert (=> b!199400 (= res!94759 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4475 _keys!825))))))

(declare-fun b!199401 () Bool)

(assert (=> b!199401 (= e!130904 (and e!130901 mapRes!8237))))

(declare-fun condMapEmpty!8237 () Bool)

(declare-fun mapDefault!8237 () ValueCell!2046)

(assert (=> b!199401 (= condMapEmpty!8237 (= (arr!4151 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2046)) mapDefault!8237)))))

(declare-fun b!199402 () Bool)

(declare-fun res!94758 () Bool)

(assert (=> b!199402 (=> (not res!94758) (not e!130900))))

(assert (=> b!199402 (= res!94758 (= (select (arr!4150 _keys!825) i!601) k0!843))))

(declare-fun b!199403 () Bool)

(declare-fun res!94760 () Bool)

(assert (=> b!199403 (=> (not res!94760) (not e!130900))))

(declare-datatypes ((List!2601 0))(
  ( (Nil!2598) (Cons!2597 (h!3239 (_ BitVec 64)) (t!7532 List!2601)) )
))
(declare-fun arrayNoDuplicates!0 (array!8799 (_ BitVec 32) List!2601) Bool)

(assert (=> b!199403 (= res!94760 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2598))))

(assert (= (and start!20264 res!94757) b!199395))

(assert (= (and b!199395 res!94756) b!199398))

(assert (= (and b!199398 res!94762) b!199403))

(assert (= (and b!199403 res!94760) b!199400))

(assert (= (and b!199400 res!94759) b!199394))

(assert (= (and b!199394 res!94761) b!199402))

(assert (= (and b!199402 res!94758) b!199396))

(assert (= (and b!199401 condMapEmpty!8237) mapIsEmpty!8237))

(assert (= (and b!199401 (not condMapEmpty!8237)) mapNonEmpty!8237))

(get-info :version)

(assert (= (and mapNonEmpty!8237 ((_ is ValueCellFull!2046) mapValue!8237)) b!199399))

(assert (= (and b!199401 ((_ is ValueCellFull!2046) mapDefault!8237)) b!199397))

(assert (= start!20264 b!199401))

(declare-fun m!225863 () Bool)

(assert (=> start!20264 m!225863))

(declare-fun m!225865 () Bool)

(assert (=> start!20264 m!225865))

(declare-fun m!225867 () Bool)

(assert (=> start!20264 m!225867))

(declare-fun m!225869 () Bool)

(assert (=> b!199403 m!225869))

(declare-fun m!225871 () Bool)

(assert (=> b!199396 m!225871))

(declare-fun m!225873 () Bool)

(assert (=> b!199396 m!225873))

(declare-fun m!225875 () Bool)

(assert (=> b!199396 m!225875))

(declare-fun m!225877 () Bool)

(assert (=> b!199396 m!225877))

(declare-fun m!225879 () Bool)

(assert (=> b!199396 m!225879))

(declare-fun m!225881 () Bool)

(assert (=> b!199396 m!225881))

(declare-fun m!225883 () Bool)

(assert (=> b!199402 m!225883))

(declare-fun m!225885 () Bool)

(assert (=> mapNonEmpty!8237 m!225885))

(declare-fun m!225887 () Bool)

(assert (=> b!199394 m!225887))

(declare-fun m!225889 () Bool)

(assert (=> b!199398 m!225889))

(check-sat (not start!20264) tp_is_empty!4779 (not b!199396) (not mapNonEmpty!8237) (not b!199403) (not b_next!4923) b_and!11669 (not b!199394) (not b!199398))
(check-sat b_and!11669 (not b_next!4923))
