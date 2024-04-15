; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20854 () Bool)

(assert start!20854)

(declare-fun b_free!5503 () Bool)

(declare-fun b_next!5503 () Bool)

(assert (=> start!20854 (= b_free!5503 (not b_next!5503))))

(declare-fun tp!19549 () Bool)

(declare-fun b_and!12223 () Bool)

(assert (=> start!20854 (= tp!19549 b_and!12223)))

(declare-fun b!209063 () Bool)

(declare-fun res!101845 () Bool)

(declare-fun e!136230 () Bool)

(assert (=> b!209063 (=> (not res!101845) (not e!136230))))

(declare-datatypes ((array!9919 0))(
  ( (array!9920 (arr!4709 (Array (_ BitVec 32) (_ BitVec 64))) (size!5035 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9919)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9919 (_ BitVec 32)) Bool)

(assert (=> b!209063 (= res!101845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209064 () Bool)

(declare-fun res!101844 () Bool)

(assert (=> b!209064 (=> (not res!101844) (not e!136230))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209064 (= res!101844 (validKeyInArray!0 k0!843))))

(declare-fun b!209065 () Bool)

(assert (=> b!209065 (= e!136230 false)))

(declare-datatypes ((V!6801 0))(
  ( (V!6802 (val!2727 Int)) )
))
(declare-datatypes ((ValueCell!2339 0))(
  ( (ValueCellFull!2339 (v!4691 V!6801)) (EmptyCell!2339) )
))
(declare-datatypes ((array!9921 0))(
  ( (array!9922 (arr!4710 (Array (_ BitVec 32) ValueCell!2339)) (size!5036 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9921)

(declare-fun v!520 () V!6801)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6801)

(declare-datatypes ((tuple2!4108 0))(
  ( (tuple2!4109 (_1!2065 (_ BitVec 64)) (_2!2065 V!6801)) )
))
(declare-datatypes ((List!3015 0))(
  ( (Nil!3012) (Cons!3011 (h!3653 tuple2!4108) (t!7937 List!3015)) )
))
(declare-datatypes ((ListLongMap!3011 0))(
  ( (ListLongMap!3012 (toList!1521 List!3015)) )
))
(declare-fun lt!106759 () ListLongMap!3011)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6801)

(declare-fun getCurrentListMapNoExtraKeys!472 (array!9919 array!9921 (_ BitVec 32) (_ BitVec 32) V!6801 V!6801 (_ BitVec 32) Int) ListLongMap!3011)

(assert (=> b!209065 (= lt!106759 (getCurrentListMapNoExtraKeys!472 _keys!825 (array!9922 (store (arr!4710 _values!649) i!601 (ValueCellFull!2339 v!520)) (size!5036 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106760 () ListLongMap!3011)

(assert (=> b!209065 (= lt!106760 (getCurrentListMapNoExtraKeys!472 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209066 () Bool)

(declare-fun e!136231 () Bool)

(declare-fun tp_is_empty!5365 () Bool)

(assert (=> b!209066 (= e!136231 tp_is_empty!5365)))

(declare-fun mapIsEmpty!9116 () Bool)

(declare-fun mapRes!9116 () Bool)

(assert (=> mapIsEmpty!9116 mapRes!9116))

(declare-fun res!101842 () Bool)

(assert (=> start!20854 (=> (not res!101842) (not e!136230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20854 (= res!101842 (validMask!0 mask!1149))))

(assert (=> start!20854 e!136230))

(declare-fun e!136233 () Bool)

(declare-fun array_inv!3093 (array!9921) Bool)

(assert (=> start!20854 (and (array_inv!3093 _values!649) e!136233)))

(assert (=> start!20854 true))

(assert (=> start!20854 tp_is_empty!5365))

(declare-fun array_inv!3094 (array!9919) Bool)

(assert (=> start!20854 (array_inv!3094 _keys!825)))

(assert (=> start!20854 tp!19549))

(declare-fun b!209067 () Bool)

(declare-fun e!136232 () Bool)

(assert (=> b!209067 (= e!136233 (and e!136232 mapRes!9116))))

(declare-fun condMapEmpty!9116 () Bool)

(declare-fun mapDefault!9116 () ValueCell!2339)

(assert (=> b!209067 (= condMapEmpty!9116 (= (arr!4710 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2339)) mapDefault!9116)))))

(declare-fun mapNonEmpty!9116 () Bool)

(declare-fun tp!19550 () Bool)

(assert (=> mapNonEmpty!9116 (= mapRes!9116 (and tp!19550 e!136231))))

(declare-fun mapValue!9116 () ValueCell!2339)

(declare-fun mapRest!9116 () (Array (_ BitVec 32) ValueCell!2339))

(declare-fun mapKey!9116 () (_ BitVec 32))

(assert (=> mapNonEmpty!9116 (= (arr!4710 _values!649) (store mapRest!9116 mapKey!9116 mapValue!9116))))

(declare-fun b!209068 () Bool)

(declare-fun res!101843 () Bool)

(assert (=> b!209068 (=> (not res!101843) (not e!136230))))

(assert (=> b!209068 (= res!101843 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5035 _keys!825))))))

(declare-fun b!209069 () Bool)

(declare-fun res!101846 () Bool)

(assert (=> b!209069 (=> (not res!101846) (not e!136230))))

(assert (=> b!209069 (= res!101846 (= (select (arr!4709 _keys!825) i!601) k0!843))))

(declare-fun b!209070 () Bool)

(declare-fun res!101840 () Bool)

(assert (=> b!209070 (=> (not res!101840) (not e!136230))))

(assert (=> b!209070 (= res!101840 (and (= (size!5036 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5035 _keys!825) (size!5036 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209071 () Bool)

(assert (=> b!209071 (= e!136232 tp_is_empty!5365)))

(declare-fun b!209072 () Bool)

(declare-fun res!101841 () Bool)

(assert (=> b!209072 (=> (not res!101841) (not e!136230))))

(declare-datatypes ((List!3016 0))(
  ( (Nil!3013) (Cons!3012 (h!3654 (_ BitVec 64)) (t!7938 List!3016)) )
))
(declare-fun arrayNoDuplicates!0 (array!9919 (_ BitVec 32) List!3016) Bool)

(assert (=> b!209072 (= res!101841 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3013))))

(assert (= (and start!20854 res!101842) b!209070))

(assert (= (and b!209070 res!101840) b!209063))

(assert (= (and b!209063 res!101845) b!209072))

(assert (= (and b!209072 res!101841) b!209068))

(assert (= (and b!209068 res!101843) b!209064))

(assert (= (and b!209064 res!101844) b!209069))

(assert (= (and b!209069 res!101846) b!209065))

(assert (= (and b!209067 condMapEmpty!9116) mapIsEmpty!9116))

(assert (= (and b!209067 (not condMapEmpty!9116)) mapNonEmpty!9116))

(get-info :version)

(assert (= (and mapNonEmpty!9116 ((_ is ValueCellFull!2339) mapValue!9116)) b!209066))

(assert (= (and b!209067 ((_ is ValueCellFull!2339) mapDefault!9116)) b!209071))

(assert (= start!20854 b!209067))

(declare-fun m!236019 () Bool)

(assert (=> b!209065 m!236019))

(declare-fun m!236021 () Bool)

(assert (=> b!209065 m!236021))

(declare-fun m!236023 () Bool)

(assert (=> b!209065 m!236023))

(declare-fun m!236025 () Bool)

(assert (=> b!209064 m!236025))

(declare-fun m!236027 () Bool)

(assert (=> mapNonEmpty!9116 m!236027))

(declare-fun m!236029 () Bool)

(assert (=> b!209063 m!236029))

(declare-fun m!236031 () Bool)

(assert (=> start!20854 m!236031))

(declare-fun m!236033 () Bool)

(assert (=> start!20854 m!236033))

(declare-fun m!236035 () Bool)

(assert (=> start!20854 m!236035))

(declare-fun m!236037 () Bool)

(assert (=> b!209069 m!236037))

(declare-fun m!236039 () Bool)

(assert (=> b!209072 m!236039))

(check-sat (not mapNonEmpty!9116) (not start!20854) (not b!209065) (not b!209072) (not b_next!5503) tp_is_empty!5365 (not b!209064) (not b!209063) b_and!12223)
(check-sat b_and!12223 (not b_next!5503))
