; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20248 () Bool)

(assert start!20248)

(declare-fun b_free!4903 () Bool)

(declare-fun b_next!4903 () Bool)

(assert (=> start!20248 (= b_free!4903 (not b_next!4903))))

(declare-fun tp!17741 () Bool)

(declare-fun b_and!11663 () Bool)

(assert (=> start!20248 (= tp!17741 b_and!11663)))

(declare-fun b!199141 () Bool)

(declare-fun e!130778 () Bool)

(declare-fun tp_is_empty!4759 () Bool)

(assert (=> b!199141 (= e!130778 tp_is_empty!4759)))

(declare-fun b!199142 () Bool)

(declare-fun res!94569 () Bool)

(declare-fun e!130777 () Bool)

(assert (=> b!199142 (=> (not res!94569) (not e!130777))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8749 0))(
  ( (array!8750 (arr!4125 (Array (_ BitVec 32) (_ BitVec 64))) (size!4450 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8749)

(assert (=> b!199142 (= res!94569 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4450 _keys!825))))))

(declare-fun mapNonEmpty!8207 () Bool)

(declare-fun mapRes!8207 () Bool)

(declare-fun tp!17740 () Bool)

(declare-fun e!130774 () Bool)

(assert (=> mapNonEmpty!8207 (= mapRes!8207 (and tp!17740 e!130774))))

(declare-datatypes ((V!5993 0))(
  ( (V!5994 (val!2424 Int)) )
))
(declare-datatypes ((ValueCell!2036 0))(
  ( (ValueCellFull!2036 (v!4395 V!5993)) (EmptyCell!2036) )
))
(declare-fun mapValue!8207 () ValueCell!2036)

(declare-datatypes ((array!8751 0))(
  ( (array!8752 (arr!4126 (Array (_ BitVec 32) ValueCell!2036)) (size!4451 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8751)

(declare-fun mapRest!8207 () (Array (_ BitVec 32) ValueCell!2036))

(declare-fun mapKey!8207 () (_ BitVec 32))

(assert (=> mapNonEmpty!8207 (= (arr!4126 _values!649) (store mapRest!8207 mapKey!8207 mapValue!8207))))

(declare-fun b!199143 () Bool)

(declare-fun res!94567 () Bool)

(assert (=> b!199143 (=> (not res!94567) (not e!130777))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!199143 (= res!94567 (= (select (arr!4125 _keys!825) i!601) k0!843))))

(declare-fun res!94572 () Bool)

(assert (=> start!20248 (=> (not res!94572) (not e!130777))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20248 (= res!94572 (validMask!0 mask!1149))))

(assert (=> start!20248 e!130777))

(declare-fun e!130775 () Bool)

(declare-fun array_inv!2691 (array!8751) Bool)

(assert (=> start!20248 (and (array_inv!2691 _values!649) e!130775)))

(assert (=> start!20248 true))

(assert (=> start!20248 tp_is_empty!4759))

(declare-fun array_inv!2692 (array!8749) Bool)

(assert (=> start!20248 (array_inv!2692 _keys!825)))

(assert (=> start!20248 tp!17741))

(declare-fun b!199144 () Bool)

(declare-fun res!94568 () Bool)

(assert (=> b!199144 (=> (not res!94568) (not e!130777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8749 (_ BitVec 32)) Bool)

(assert (=> b!199144 (= res!94568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199145 () Bool)

(assert (=> b!199145 (= e!130775 (and e!130778 mapRes!8207))))

(declare-fun condMapEmpty!8207 () Bool)

(declare-fun mapDefault!8207 () ValueCell!2036)

(assert (=> b!199145 (= condMapEmpty!8207 (= (arr!4126 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2036)) mapDefault!8207)))))

(declare-fun b!199146 () Bool)

(declare-fun res!94573 () Bool)

(assert (=> b!199146 (=> (not res!94573) (not e!130777))))

(declare-datatypes ((List!2531 0))(
  ( (Nil!2528) (Cons!2527 (h!3169 (_ BitVec 64)) (t!7454 List!2531)) )
))
(declare-fun arrayNoDuplicates!0 (array!8749 (_ BitVec 32) List!2531) Bool)

(assert (=> b!199146 (= res!94573 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2528))))

(declare-fun b!199147 () Bool)

(declare-fun res!94570 () Bool)

(assert (=> b!199147 (=> (not res!94570) (not e!130777))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199147 (= res!94570 (and (= (size!4451 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4450 _keys!825) (size!4451 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199148 () Bool)

(declare-fun res!94571 () Bool)

(assert (=> b!199148 (=> (not res!94571) (not e!130777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199148 (= res!94571 (validKeyInArray!0 k0!843))))

(declare-fun b!199149 () Bool)

(assert (=> b!199149 (= e!130774 tp_is_empty!4759)))

(declare-fun mapIsEmpty!8207 () Bool)

(assert (=> mapIsEmpty!8207 mapRes!8207))

(declare-fun b!199150 () Bool)

(assert (=> b!199150 (= e!130777 (not true))))

(declare-datatypes ((tuple2!3612 0))(
  ( (tuple2!3613 (_1!1817 (_ BitVec 64)) (_2!1817 V!5993)) )
))
(declare-datatypes ((List!2532 0))(
  ( (Nil!2529) (Cons!2528 (h!3170 tuple2!3612) (t!7455 List!2532)) )
))
(declare-datatypes ((ListLongMap!2527 0))(
  ( (ListLongMap!2528 (toList!1279 List!2532)) )
))
(declare-fun lt!98219 () ListLongMap!2527)

(declare-fun lt!98222 () ListLongMap!2527)

(assert (=> b!199150 (and (= lt!98219 lt!98222) (= lt!98222 lt!98219))))

(declare-fun lt!98220 () ListLongMap!2527)

(declare-fun v!520 () V!5993)

(declare-fun +!333 (ListLongMap!2527 tuple2!3612) ListLongMap!2527)

(assert (=> b!199150 (= lt!98222 (+!333 lt!98220 (tuple2!3613 k0!843 v!520)))))

(declare-datatypes ((Unit!5952 0))(
  ( (Unit!5953) )
))
(declare-fun lt!98221 () Unit!5952)

(declare-fun zeroValue!615 () V!5993)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5993)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 (array!8749 array!8751 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) (_ BitVec 64) V!5993 (_ BitVec 32) Int) Unit!5952)

(assert (=> b!199150 (= lt!98221 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!269 (array!8749 array!8751 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) Int) ListLongMap!2527)

(assert (=> b!199150 (= lt!98219 (getCurrentListMapNoExtraKeys!269 _keys!825 (array!8752 (store (arr!4126 _values!649) i!601 (ValueCellFull!2036 v!520)) (size!4451 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199150 (= lt!98220 (getCurrentListMapNoExtraKeys!269 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20248 res!94572) b!199147))

(assert (= (and b!199147 res!94570) b!199144))

(assert (= (and b!199144 res!94568) b!199146))

(assert (= (and b!199146 res!94573) b!199142))

(assert (= (and b!199142 res!94569) b!199148))

(assert (= (and b!199148 res!94571) b!199143))

(assert (= (and b!199143 res!94567) b!199150))

(assert (= (and b!199145 condMapEmpty!8207) mapIsEmpty!8207))

(assert (= (and b!199145 (not condMapEmpty!8207)) mapNonEmpty!8207))

(get-info :version)

(assert (= (and mapNonEmpty!8207 ((_ is ValueCellFull!2036) mapValue!8207)) b!199149))

(assert (= (and b!199145 ((_ is ValueCellFull!2036) mapDefault!8207)) b!199141))

(assert (= start!20248 b!199145))

(declare-fun m!225783 () Bool)

(assert (=> start!20248 m!225783))

(declare-fun m!225785 () Bool)

(assert (=> start!20248 m!225785))

(declare-fun m!225787 () Bool)

(assert (=> start!20248 m!225787))

(declare-fun m!225789 () Bool)

(assert (=> b!199150 m!225789))

(declare-fun m!225791 () Bool)

(assert (=> b!199150 m!225791))

(declare-fun m!225793 () Bool)

(assert (=> b!199150 m!225793))

(declare-fun m!225795 () Bool)

(assert (=> b!199150 m!225795))

(declare-fun m!225797 () Bool)

(assert (=> b!199150 m!225797))

(declare-fun m!225799 () Bool)

(assert (=> b!199144 m!225799))

(declare-fun m!225801 () Bool)

(assert (=> b!199148 m!225801))

(declare-fun m!225803 () Bool)

(assert (=> b!199146 m!225803))

(declare-fun m!225805 () Bool)

(assert (=> b!199143 m!225805))

(declare-fun m!225807 () Bool)

(assert (=> mapNonEmpty!8207 m!225807))

(check-sat (not b!199146) (not b!199144) tp_is_empty!4759 (not b!199150) (not start!20248) (not mapNonEmpty!8207) (not b!199148) (not b_next!4903) b_and!11663)
(check-sat b_and!11663 (not b_next!4903))
