; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20258 () Bool)

(assert start!20258)

(declare-fun b_free!4917 () Bool)

(declare-fun b_next!4917 () Bool)

(assert (=> start!20258 (= b_free!4917 (not b_next!4917))))

(declare-fun tp!17782 () Bool)

(declare-fun b_and!11663 () Bool)

(assert (=> start!20258 (= tp!17782 b_and!11663)))

(declare-fun b!199304 () Bool)

(declare-fun e!130855 () Bool)

(declare-fun e!130856 () Bool)

(declare-fun mapRes!8228 () Bool)

(assert (=> b!199304 (= e!130855 (and e!130856 mapRes!8228))))

(declare-fun condMapEmpty!8228 () Bool)

(declare-datatypes ((V!6011 0))(
  ( (V!6012 (val!2431 Int)) )
))
(declare-datatypes ((ValueCell!2043 0))(
  ( (ValueCellFull!2043 (v!4401 V!6011)) (EmptyCell!2043) )
))
(declare-datatypes ((array!8787 0))(
  ( (array!8788 (arr!4144 (Array (_ BitVec 32) ValueCell!2043)) (size!4469 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8787)

(declare-fun mapDefault!8228 () ValueCell!2043)

(assert (=> b!199304 (= condMapEmpty!8228 (= (arr!4144 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2043)) mapDefault!8228)))))

(declare-fun b!199305 () Bool)

(declare-fun res!94697 () Bool)

(declare-fun e!130859 () Bool)

(assert (=> b!199305 (=> (not res!94697) (not e!130859))))

(declare-datatypes ((array!8789 0))(
  ( (array!8790 (arr!4145 (Array (_ BitVec 32) (_ BitVec 64))) (size!4470 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8789)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8789 (_ BitVec 32)) Bool)

(assert (=> b!199305 (= res!94697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94698 () Bool)

(assert (=> start!20258 (=> (not res!94698) (not e!130859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20258 (= res!94698 (validMask!0 mask!1149))))

(assert (=> start!20258 e!130859))

(declare-fun array_inv!2719 (array!8787) Bool)

(assert (=> start!20258 (and (array_inv!2719 _values!649) e!130855)))

(assert (=> start!20258 true))

(declare-fun tp_is_empty!4773 () Bool)

(assert (=> start!20258 tp_is_empty!4773))

(declare-fun array_inv!2720 (array!8789) Bool)

(assert (=> start!20258 (array_inv!2720 _keys!825)))

(assert (=> start!20258 tp!17782))

(declare-fun b!199306 () Bool)

(declare-fun res!94694 () Bool)

(assert (=> b!199306 (=> (not res!94694) (not e!130859))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199306 (= res!94694 (validKeyInArray!0 k0!843))))

(declare-fun b!199307 () Bool)

(assert (=> b!199307 (= e!130859 (not (bvsle #b00000000000000000000000000000000 (size!4470 _keys!825))))))

(declare-datatypes ((tuple2!3680 0))(
  ( (tuple2!3681 (_1!1851 (_ BitVec 64)) (_2!1851 V!6011)) )
))
(declare-datatypes ((List!2596 0))(
  ( (Nil!2593) (Cons!2592 (h!3234 tuple2!3680) (t!7527 List!2596)) )
))
(declare-datatypes ((ListLongMap!2593 0))(
  ( (ListLongMap!2594 (toList!1312 List!2596)) )
))
(declare-fun lt!98247 () ListLongMap!2593)

(declare-fun lt!98246 () ListLongMap!2593)

(assert (=> b!199307 (and (= lt!98247 lt!98246) (= lt!98246 lt!98247))))

(declare-fun lt!98245 () ListLongMap!2593)

(declare-fun v!520 () V!6011)

(declare-fun +!339 (ListLongMap!2593 tuple2!3680) ListLongMap!2593)

(assert (=> b!199307 (= lt!98246 (+!339 lt!98245 (tuple2!3681 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6011)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((Unit!5980 0))(
  ( (Unit!5981) )
))
(declare-fun lt!98244 () Unit!5980)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6011)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!16 (array!8789 array!8787 (_ BitVec 32) (_ BitVec 32) V!6011 V!6011 (_ BitVec 32) (_ BitVec 64) V!6011 (_ BitVec 32) Int) Unit!5980)

(assert (=> b!199307 (= lt!98244 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!16 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!277 (array!8789 array!8787 (_ BitVec 32) (_ BitVec 32) V!6011 V!6011 (_ BitVec 32) Int) ListLongMap!2593)

(assert (=> b!199307 (= lt!98247 (getCurrentListMapNoExtraKeys!277 _keys!825 (array!8788 (store (arr!4144 _values!649) i!601 (ValueCellFull!2043 v!520)) (size!4469 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199307 (= lt!98245 (getCurrentListMapNoExtraKeys!277 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199308 () Bool)

(declare-fun res!94693 () Bool)

(assert (=> b!199308 (=> (not res!94693) (not e!130859))))

(declare-datatypes ((List!2597 0))(
  ( (Nil!2594) (Cons!2593 (h!3235 (_ BitVec 64)) (t!7528 List!2597)) )
))
(declare-fun arrayNoDuplicates!0 (array!8789 (_ BitVec 32) List!2597) Bool)

(assert (=> b!199308 (= res!94693 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2594))))

(declare-fun b!199309 () Bool)

(declare-fun res!94696 () Bool)

(assert (=> b!199309 (=> (not res!94696) (not e!130859))))

(assert (=> b!199309 (= res!94696 (and (= (size!4469 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4470 _keys!825) (size!4469 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199310 () Bool)

(declare-fun e!130857 () Bool)

(assert (=> b!199310 (= e!130857 tp_is_empty!4773)))

(declare-fun mapNonEmpty!8228 () Bool)

(declare-fun tp!17783 () Bool)

(assert (=> mapNonEmpty!8228 (= mapRes!8228 (and tp!17783 e!130857))))

(declare-fun mapKey!8228 () (_ BitVec 32))

(declare-fun mapRest!8228 () (Array (_ BitVec 32) ValueCell!2043))

(declare-fun mapValue!8228 () ValueCell!2043)

(assert (=> mapNonEmpty!8228 (= (arr!4144 _values!649) (store mapRest!8228 mapKey!8228 mapValue!8228))))

(declare-fun b!199311 () Bool)

(assert (=> b!199311 (= e!130856 tp_is_empty!4773)))

(declare-fun b!199312 () Bool)

(declare-fun res!94699 () Bool)

(assert (=> b!199312 (=> (not res!94699) (not e!130859))))

(assert (=> b!199312 (= res!94699 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4470 _keys!825))))))

(declare-fun mapIsEmpty!8228 () Bool)

(assert (=> mapIsEmpty!8228 mapRes!8228))

(declare-fun b!199313 () Bool)

(declare-fun res!94695 () Bool)

(assert (=> b!199313 (=> (not res!94695) (not e!130859))))

(assert (=> b!199313 (= res!94695 (= (select (arr!4145 _keys!825) i!601) k0!843))))

(assert (= (and start!20258 res!94698) b!199309))

(assert (= (and b!199309 res!94696) b!199305))

(assert (= (and b!199305 res!94697) b!199308))

(assert (= (and b!199308 res!94693) b!199312))

(assert (= (and b!199312 res!94699) b!199306))

(assert (= (and b!199306 res!94694) b!199313))

(assert (= (and b!199313 res!94695) b!199307))

(assert (= (and b!199304 condMapEmpty!8228) mapIsEmpty!8228))

(assert (= (and b!199304 (not condMapEmpty!8228)) mapNonEmpty!8228))

(get-info :version)

(assert (= (and mapNonEmpty!8228 ((_ is ValueCellFull!2043) mapValue!8228)) b!199310))

(assert (= (and b!199304 ((_ is ValueCellFull!2043) mapDefault!8228)) b!199311))

(assert (= start!20258 b!199304))

(declare-fun m!225783 () Bool)

(assert (=> b!199313 m!225783))

(declare-fun m!225785 () Bool)

(assert (=> mapNonEmpty!8228 m!225785))

(declare-fun m!225787 () Bool)

(assert (=> start!20258 m!225787))

(declare-fun m!225789 () Bool)

(assert (=> start!20258 m!225789))

(declare-fun m!225791 () Bool)

(assert (=> start!20258 m!225791))

(declare-fun m!225793 () Bool)

(assert (=> b!199305 m!225793))

(declare-fun m!225795 () Bool)

(assert (=> b!199306 m!225795))

(declare-fun m!225797 () Bool)

(assert (=> b!199307 m!225797))

(declare-fun m!225799 () Bool)

(assert (=> b!199307 m!225799))

(declare-fun m!225801 () Bool)

(assert (=> b!199307 m!225801))

(declare-fun m!225803 () Bool)

(assert (=> b!199307 m!225803))

(declare-fun m!225805 () Bool)

(assert (=> b!199307 m!225805))

(declare-fun m!225807 () Bool)

(assert (=> b!199308 m!225807))

(check-sat (not mapNonEmpty!8228) (not b!199305) (not start!20258) b_and!11663 (not b!199307) (not b!199308) (not b_next!4917) (not b!199306) tp_is_empty!4773)
(check-sat b_and!11663 (not b_next!4917))
