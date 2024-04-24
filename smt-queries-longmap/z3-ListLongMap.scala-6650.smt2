; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84040 () Bool)

(assert start!84040)

(declare-fun b_free!19681 () Bool)

(declare-fun b_next!19681 () Bool)

(assert (=> start!84040 (= b_free!19681 (not b_next!19681))))

(declare-fun tp!68486 () Bool)

(declare-fun b_and!31461 () Bool)

(assert (=> start!84040 (= tp!68486 b_and!31461)))

(declare-fun b!980864 () Bool)

(declare-fun e!552966 () Bool)

(declare-fun tp_is_empty!22675 () Bool)

(assert (=> b!980864 (= e!552966 tp_is_empty!22675)))

(declare-fun b!980865 () Bool)

(declare-fun res!656171 () Bool)

(declare-fun e!552965 () Bool)

(assert (=> b!980865 (=> (not res!656171) (not e!552965))))

(declare-datatypes ((array!61394 0))(
  ( (array!61395 (arr!29550 (Array (_ BitVec 32) (_ BitVec 64))) (size!30030 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61394)

(declare-datatypes ((List!20479 0))(
  ( (Nil!20476) (Cons!20475 (h!21643 (_ BitVec 64)) (t!29108 List!20479)) )
))
(declare-fun arrayNoDuplicates!0 (array!61394 (_ BitVec 32) List!20479) Bool)

(assert (=> b!980865 (= res!656171 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20476))))

(declare-fun mapIsEmpty!36041 () Bool)

(declare-fun mapRes!36041 () Bool)

(assert (=> mapIsEmpty!36041 mapRes!36041))

(declare-fun b!980866 () Bool)

(declare-fun res!656168 () Bool)

(assert (=> b!980866 (=> (not res!656168) (not e!552965))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61394 (_ BitVec 32)) Bool)

(assert (=> b!980866 (= res!656168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980867 () Bool)

(declare-fun res!656170 () Bool)

(assert (=> b!980867 (=> (not res!656170) (not e!552965))))

(declare-datatypes ((V!35217 0))(
  ( (V!35218 (val!11388 Int)) )
))
(declare-datatypes ((ValueCell!10856 0))(
  ( (ValueCellFull!10856 (v!13947 V!35217)) (EmptyCell!10856) )
))
(declare-datatypes ((array!61396 0))(
  ( (array!61397 (arr!29551 (Array (_ BitVec 32) ValueCell!10856)) (size!30031 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61396)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980867 (= res!656170 (and (= (size!30031 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30030 _keys!1544) (size!30031 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980868 () Bool)

(declare-fun e!552962 () Bool)

(assert (=> b!980868 (= e!552962 tp_is_empty!22675)))

(declare-fun b!980869 () Bool)

(declare-fun res!656173 () Bool)

(assert (=> b!980869 (=> (not res!656173) (not e!552965))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980869 (= res!656173 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30030 _keys!1544))))))

(declare-fun b!980870 () Bool)

(declare-fun e!552963 () Bool)

(assert (=> b!980870 (= e!552963 true)))

(declare-datatypes ((tuple2!14620 0))(
  ( (tuple2!14621 (_1!7321 (_ BitVec 64)) (_2!7321 V!35217)) )
))
(declare-fun lt!435266 () tuple2!14620)

(declare-fun lt!435262 () tuple2!14620)

(declare-datatypes ((List!20480 0))(
  ( (Nil!20477) (Cons!20476 (h!21644 tuple2!14620) (t!29109 List!20480)) )
))
(declare-datatypes ((ListLongMap!13319 0))(
  ( (ListLongMap!13320 (toList!6675 List!20480)) )
))
(declare-fun lt!435270 () ListLongMap!13319)

(declare-fun lt!435269 () ListLongMap!13319)

(declare-fun +!2990 (ListLongMap!13319 tuple2!14620) ListLongMap!13319)

(assert (=> b!980870 (= lt!435270 (+!2990 (+!2990 lt!435269 lt!435262) lt!435266))))

(declare-fun lt!435267 () V!35217)

(declare-fun zeroValue!1220 () V!35217)

(declare-datatypes ((Unit!32560 0))(
  ( (Unit!32561) )
))
(declare-fun lt!435263 () Unit!32560)

(declare-fun addCommutativeForDiffKeys!597 (ListLongMap!13319 (_ BitVec 64) V!35217 (_ BitVec 64) V!35217) Unit!32560)

(assert (=> b!980870 (= lt!435263 (addCommutativeForDiffKeys!597 lt!435269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29550 _keys!1544) from!1932) lt!435267))))

(declare-fun b!980872 () Bool)

(declare-fun e!552961 () Bool)

(assert (=> b!980872 (= e!552961 (and e!552966 mapRes!36041))))

(declare-fun condMapEmpty!36041 () Bool)

(declare-fun mapDefault!36041 () ValueCell!10856)

(assert (=> b!980872 (= condMapEmpty!36041 (= (arr!29551 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10856)) mapDefault!36041)))))

(declare-fun b!980873 () Bool)

(assert (=> b!980873 (= e!552965 (not e!552963))))

(declare-fun res!656166 () Bool)

(assert (=> b!980873 (=> res!656166 e!552963)))

(assert (=> b!980873 (= res!656166 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29550 _keys!1544) from!1932)))))

(declare-fun lt!435264 () tuple2!14620)

(declare-fun lt!435261 () ListLongMap!13319)

(assert (=> b!980873 (= (+!2990 lt!435261 lt!435262) (+!2990 lt!435270 lt!435264))))

(declare-fun lt!435268 () ListLongMap!13319)

(assert (=> b!980873 (= lt!435270 (+!2990 lt!435268 lt!435262))))

(assert (=> b!980873 (= lt!435262 (tuple2!14621 (select (arr!29550 _keys!1544) from!1932) lt!435267))))

(assert (=> b!980873 (= lt!435261 (+!2990 lt!435268 lt!435264))))

(declare-fun minValue!1220 () V!35217)

(assert (=> b!980873 (= lt!435264 (tuple2!14621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435265 () Unit!32560)

(assert (=> b!980873 (= lt!435265 (addCommutativeForDiffKeys!597 lt!435268 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29550 _keys!1544) from!1932) lt!435267))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15342 (ValueCell!10856 V!35217) V!35217)

(declare-fun dynLambda!1785 (Int (_ BitVec 64)) V!35217)

(assert (=> b!980873 (= lt!435267 (get!15342 (select (arr!29551 _values!1278) from!1932) (dynLambda!1785 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980873 (= lt!435268 (+!2990 lt!435269 lt!435266))))

(assert (=> b!980873 (= lt!435266 (tuple2!14621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3423 (array!61394 array!61396 (_ BitVec 32) (_ BitVec 32) V!35217 V!35217 (_ BitVec 32) Int) ListLongMap!13319)

(assert (=> b!980873 (= lt!435269 (getCurrentListMapNoExtraKeys!3423 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36041 () Bool)

(declare-fun tp!68485 () Bool)

(assert (=> mapNonEmpty!36041 (= mapRes!36041 (and tp!68485 e!552962))))

(declare-fun mapKey!36041 () (_ BitVec 32))

(declare-fun mapRest!36041 () (Array (_ BitVec 32) ValueCell!10856))

(declare-fun mapValue!36041 () ValueCell!10856)

(assert (=> mapNonEmpty!36041 (= (arr!29551 _values!1278) (store mapRest!36041 mapKey!36041 mapValue!36041))))

(declare-fun b!980874 () Bool)

(declare-fun res!656167 () Bool)

(assert (=> b!980874 (=> (not res!656167) (not e!552965))))

(assert (=> b!980874 (= res!656167 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!656169 () Bool)

(assert (=> start!84040 (=> (not res!656169) (not e!552965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84040 (= res!656169 (validMask!0 mask!1948))))

(assert (=> start!84040 e!552965))

(assert (=> start!84040 true))

(assert (=> start!84040 tp_is_empty!22675))

(declare-fun array_inv!22879 (array!61396) Bool)

(assert (=> start!84040 (and (array_inv!22879 _values!1278) e!552961)))

(assert (=> start!84040 tp!68486))

(declare-fun array_inv!22880 (array!61394) Bool)

(assert (=> start!84040 (array_inv!22880 _keys!1544)))

(declare-fun b!980871 () Bool)

(declare-fun res!656172 () Bool)

(assert (=> b!980871 (=> (not res!656172) (not e!552965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980871 (= res!656172 (validKeyInArray!0 (select (arr!29550 _keys!1544) from!1932)))))

(assert (= (and start!84040 res!656169) b!980867))

(assert (= (and b!980867 res!656170) b!980866))

(assert (= (and b!980866 res!656168) b!980865))

(assert (= (and b!980865 res!656171) b!980869))

(assert (= (and b!980869 res!656173) b!980871))

(assert (= (and b!980871 res!656172) b!980874))

(assert (= (and b!980874 res!656167) b!980873))

(assert (= (and b!980873 (not res!656166)) b!980870))

(assert (= (and b!980872 condMapEmpty!36041) mapIsEmpty!36041))

(assert (= (and b!980872 (not condMapEmpty!36041)) mapNonEmpty!36041))

(get-info :version)

(assert (= (and mapNonEmpty!36041 ((_ is ValueCellFull!10856) mapValue!36041)) b!980868))

(assert (= (and b!980872 ((_ is ValueCellFull!10856) mapDefault!36041)) b!980864))

(assert (= start!84040 b!980872))

(declare-fun b_lambda!14739 () Bool)

(assert (=> (not b_lambda!14739) (not b!980873)))

(declare-fun t!29107 () Bool)

(declare-fun tb!6479 () Bool)

(assert (=> (and start!84040 (= defaultEntry!1281 defaultEntry!1281) t!29107) tb!6479))

(declare-fun result!12955 () Bool)

(assert (=> tb!6479 (= result!12955 tp_is_empty!22675)))

(assert (=> b!980873 t!29107))

(declare-fun b_and!31463 () Bool)

(assert (= b_and!31461 (and (=> t!29107 result!12955) b_and!31463)))

(declare-fun m!908669 () Bool)

(assert (=> start!84040 m!908669))

(declare-fun m!908671 () Bool)

(assert (=> start!84040 m!908671))

(declare-fun m!908673 () Bool)

(assert (=> start!84040 m!908673))

(declare-fun m!908675 () Bool)

(assert (=> b!980870 m!908675))

(assert (=> b!980870 m!908675))

(declare-fun m!908677 () Bool)

(assert (=> b!980870 m!908677))

(declare-fun m!908679 () Bool)

(assert (=> b!980870 m!908679))

(assert (=> b!980870 m!908679))

(declare-fun m!908681 () Bool)

(assert (=> b!980870 m!908681))

(declare-fun m!908683 () Bool)

(assert (=> b!980873 m!908683))

(assert (=> b!980873 m!908679))

(declare-fun m!908685 () Bool)

(assert (=> b!980873 m!908685))

(declare-fun m!908687 () Bool)

(assert (=> b!980873 m!908687))

(declare-fun m!908689 () Bool)

(assert (=> b!980873 m!908689))

(declare-fun m!908691 () Bool)

(assert (=> b!980873 m!908691))

(declare-fun m!908693 () Bool)

(assert (=> b!980873 m!908693))

(declare-fun m!908695 () Bool)

(assert (=> b!980873 m!908695))

(assert (=> b!980873 m!908679))

(declare-fun m!908697 () Bool)

(assert (=> b!980873 m!908697))

(declare-fun m!908699 () Bool)

(assert (=> b!980873 m!908699))

(assert (=> b!980873 m!908691))

(assert (=> b!980873 m!908699))

(declare-fun m!908701 () Bool)

(assert (=> b!980873 m!908701))

(declare-fun m!908703 () Bool)

(assert (=> mapNonEmpty!36041 m!908703))

(declare-fun m!908705 () Bool)

(assert (=> b!980865 m!908705))

(declare-fun m!908707 () Bool)

(assert (=> b!980866 m!908707))

(assert (=> b!980871 m!908679))

(assert (=> b!980871 m!908679))

(declare-fun m!908709 () Bool)

(assert (=> b!980871 m!908709))

(check-sat (not b!980866) (not b_next!19681) (not start!84040) (not b!980873) b_and!31463 tp_is_empty!22675 (not b!980865) (not b!980871) (not b!980870) (not mapNonEmpty!36041) (not b_lambda!14739))
(check-sat b_and!31463 (not b_next!19681))
