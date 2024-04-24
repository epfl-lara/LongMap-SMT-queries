; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79476 () Bool)

(assert start!79476)

(declare-fun b_free!17521 () Bool)

(declare-fun b_next!17521 () Bool)

(assert (=> start!79476 (= b_free!17521 (not b_next!17521))))

(declare-fun tp!61005 () Bool)

(declare-fun b_and!28603 () Bool)

(assert (=> start!79476 (= tp!61005 b_and!28603)))

(declare-fun b!932399 () Bool)

(declare-fun e!523709 () Bool)

(declare-fun e!523708 () Bool)

(assert (=> b!932399 (= e!523709 e!523708)))

(declare-fun res!627686 () Bool)

(assert (=> b!932399 (=> (not res!627686) (not e!523708))))

(declare-fun lt!419805 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932399 (= res!627686 (validKeyInArray!0 lt!419805))))

(declare-datatypes ((array!56055 0))(
  ( (array!56056 (arr!26968 (Array (_ BitVec 32) (_ BitVec 64))) (size!27428 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56055)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932399 (= lt!419805 (select (arr!26968 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932400 () Bool)

(declare-fun res!627692 () Bool)

(assert (=> b!932400 (=> (not res!627692) (not e!523709))))

(assert (=> b!932400 (= res!627692 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932401 () Bool)

(declare-fun res!627691 () Bool)

(assert (=> b!932401 (=> (not res!627691) (not e!523709))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31671 0))(
  ( (V!31672 (val!10065 Int)) )
))
(declare-datatypes ((tuple2!13172 0))(
  ( (tuple2!13173 (_1!6597 (_ BitVec 64)) (_2!6597 V!31671)) )
))
(declare-datatypes ((List!18958 0))(
  ( (Nil!18955) (Cons!18954 (h!20106 tuple2!13172) (t!27015 List!18958)) )
))
(declare-datatypes ((ListLongMap!11871 0))(
  ( (ListLongMap!11872 (toList!5951 List!18958)) )
))
(declare-fun lt!419806 () ListLongMap!11871)

(declare-fun v!791 () V!31671)

(declare-fun apply!781 (ListLongMap!11871 (_ BitVec 64)) V!31671)

(assert (=> b!932401 (= res!627691 (= (apply!781 lt!419806 k0!1099) v!791))))

(declare-fun b!932402 () Bool)

(declare-fun res!627684 () Bool)

(declare-fun e!523710 () Bool)

(assert (=> b!932402 (=> (not res!627684) (not e!523710))))

(assert (=> b!932402 (= res!627684 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27428 _keys!1487))))))

(declare-fun res!627687 () Bool)

(assert (=> start!79476 (=> (not res!627687) (not e!523710))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79476 (= res!627687 (validMask!0 mask!1881))))

(assert (=> start!79476 e!523710))

(assert (=> start!79476 true))

(declare-fun tp_is_empty!20029 () Bool)

(assert (=> start!79476 tp_is_empty!20029))

(declare-datatypes ((ValueCell!9533 0))(
  ( (ValueCellFull!9533 (v!12580 V!31671)) (EmptyCell!9533) )
))
(declare-datatypes ((array!56057 0))(
  ( (array!56058 (arr!26969 (Array (_ BitVec 32) ValueCell!9533)) (size!27429 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56057)

(declare-fun e!523706 () Bool)

(declare-fun array_inv!21080 (array!56057) Bool)

(assert (=> start!79476 (and (array_inv!21080 _values!1231) e!523706)))

(assert (=> start!79476 tp!61005))

(declare-fun array_inv!21081 (array!56055) Bool)

(assert (=> start!79476 (array_inv!21081 _keys!1487)))

(declare-fun b!932403 () Bool)

(assert (=> b!932403 (= e!523710 e!523709)))

(declare-fun res!627693 () Bool)

(assert (=> b!932403 (=> (not res!627693) (not e!523709))))

(declare-fun contains!5015 (ListLongMap!11871 (_ BitVec 64)) Bool)

(assert (=> b!932403 (= res!627693 (contains!5015 lt!419806 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31671)

(declare-fun minValue!1173 () V!31671)

(declare-fun getCurrentListMap!3194 (array!56055 array!56057 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) ListLongMap!11871)

(assert (=> b!932403 (= lt!419806 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932404 () Bool)

(declare-fun res!627690 () Bool)

(assert (=> b!932404 (=> (not res!627690) (not e!523710))))

(declare-datatypes ((List!18959 0))(
  ( (Nil!18956) (Cons!18955 (h!20107 (_ BitVec 64)) (t!27016 List!18959)) )
))
(declare-fun arrayNoDuplicates!0 (array!56055 (_ BitVec 32) List!18959) Bool)

(assert (=> b!932404 (= res!627690 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18956))))

(declare-fun b!932405 () Bool)

(declare-fun e!523705 () Bool)

(declare-fun mapRes!31800 () Bool)

(assert (=> b!932405 (= e!523706 (and e!523705 mapRes!31800))))

(declare-fun condMapEmpty!31800 () Bool)

(declare-fun mapDefault!31800 () ValueCell!9533)

(assert (=> b!932405 (= condMapEmpty!31800 (= (arr!26969 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9533)) mapDefault!31800)))))

(declare-fun mapNonEmpty!31800 () Bool)

(declare-fun tp!61004 () Bool)

(declare-fun e!523711 () Bool)

(assert (=> mapNonEmpty!31800 (= mapRes!31800 (and tp!61004 e!523711))))

(declare-fun mapValue!31800 () ValueCell!9533)

(declare-fun mapRest!31800 () (Array (_ BitVec 32) ValueCell!9533))

(declare-fun mapKey!31800 () (_ BitVec 32))

(assert (=> mapNonEmpty!31800 (= (arr!26969 _values!1231) (store mapRest!31800 mapKey!31800 mapValue!31800))))

(declare-fun b!932406 () Bool)

(declare-fun res!627685 () Bool)

(assert (=> b!932406 (=> (not res!627685) (not e!523710))))

(assert (=> b!932406 (= res!627685 (and (= (size!27429 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27428 _keys!1487) (size!27429 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932407 () Bool)

(assert (=> b!932407 (= e!523711 tp_is_empty!20029)))

(declare-fun b!932408 () Bool)

(assert (=> b!932408 (= e!523708 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27429 _values!1231))))))

(declare-fun +!2782 (ListLongMap!11871 tuple2!13172) ListLongMap!11871)

(declare-fun get!14191 (ValueCell!9533 V!31671) V!31671)

(declare-fun dynLambda!1579 (Int (_ BitVec 64)) V!31671)

(assert (=> b!932408 (= (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2782 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13173 lt!419805 (get!14191 (select (arr!26969 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1579 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31429 0))(
  ( (Unit!31430) )
))
(declare-fun lt!419807 () Unit!31429)

(declare-fun lemmaListMapRecursiveValidKeyArray!162 (array!56055 array!56057 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) Unit!31429)

(assert (=> b!932408 (= lt!419807 (lemmaListMapRecursiveValidKeyArray!162 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932409 () Bool)

(assert (=> b!932409 (= e!523705 tp_is_empty!20029)))

(declare-fun b!932410 () Bool)

(declare-fun res!627689 () Bool)

(assert (=> b!932410 (=> (not res!627689) (not e!523709))))

(assert (=> b!932410 (= res!627689 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31800 () Bool)

(assert (=> mapIsEmpty!31800 mapRes!31800))

(declare-fun b!932411 () Bool)

(declare-fun res!627688 () Bool)

(assert (=> b!932411 (=> (not res!627688) (not e!523710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56055 (_ BitVec 32)) Bool)

(assert (=> b!932411 (= res!627688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79476 res!627687) b!932406))

(assert (= (and b!932406 res!627685) b!932411))

(assert (= (and b!932411 res!627688) b!932404))

(assert (= (and b!932404 res!627690) b!932402))

(assert (= (and b!932402 res!627684) b!932403))

(assert (= (and b!932403 res!627693) b!932401))

(assert (= (and b!932401 res!627691) b!932400))

(assert (= (and b!932400 res!627692) b!932410))

(assert (= (and b!932410 res!627689) b!932399))

(assert (= (and b!932399 res!627686) b!932408))

(assert (= (and b!932405 condMapEmpty!31800) mapIsEmpty!31800))

(assert (= (and b!932405 (not condMapEmpty!31800)) mapNonEmpty!31800))

(get-info :version)

(assert (= (and mapNonEmpty!31800 ((_ is ValueCellFull!9533) mapValue!31800)) b!932407))

(assert (= (and b!932405 ((_ is ValueCellFull!9533) mapDefault!31800)) b!932409))

(assert (= start!79476 b!932405))

(declare-fun b_lambda!13851 () Bool)

(assert (=> (not b_lambda!13851) (not b!932408)))

(declare-fun t!27014 () Bool)

(declare-fun tb!5907 () Bool)

(assert (=> (and start!79476 (= defaultEntry!1235 defaultEntry!1235) t!27014) tb!5907))

(declare-fun result!11645 () Bool)

(assert (=> tb!5907 (= result!11645 tp_is_empty!20029)))

(assert (=> b!932408 t!27014))

(declare-fun b_and!28605 () Bool)

(assert (= b_and!28603 (and (=> t!27014 result!11645) b_and!28605)))

(declare-fun m!866671 () Bool)

(assert (=> b!932401 m!866671))

(declare-fun m!866673 () Bool)

(assert (=> b!932404 m!866673))

(declare-fun m!866675 () Bool)

(assert (=> b!932399 m!866675))

(declare-fun m!866677 () Bool)

(assert (=> b!932399 m!866677))

(declare-fun m!866679 () Bool)

(assert (=> start!79476 m!866679))

(declare-fun m!866681 () Bool)

(assert (=> start!79476 m!866681))

(declare-fun m!866683 () Bool)

(assert (=> start!79476 m!866683))

(declare-fun m!866685 () Bool)

(assert (=> mapNonEmpty!31800 m!866685))

(declare-fun m!866687 () Bool)

(assert (=> b!932408 m!866687))

(declare-fun m!866689 () Bool)

(assert (=> b!932408 m!866689))

(assert (=> b!932408 m!866687))

(assert (=> b!932408 m!866689))

(declare-fun m!866691 () Bool)

(assert (=> b!932408 m!866691))

(declare-fun m!866693 () Bool)

(assert (=> b!932408 m!866693))

(declare-fun m!866695 () Bool)

(assert (=> b!932408 m!866695))

(assert (=> b!932408 m!866695))

(declare-fun m!866697 () Bool)

(assert (=> b!932408 m!866697))

(declare-fun m!866699 () Bool)

(assert (=> b!932408 m!866699))

(declare-fun m!866701 () Bool)

(assert (=> b!932411 m!866701))

(declare-fun m!866703 () Bool)

(assert (=> b!932410 m!866703))

(declare-fun m!866705 () Bool)

(assert (=> b!932403 m!866705))

(declare-fun m!866707 () Bool)

(assert (=> b!932403 m!866707))

(check-sat (not b!932410) tp_is_empty!20029 (not mapNonEmpty!31800) (not b!932399) (not start!79476) (not b!932411) (not b!932401) b_and!28605 (not b!932404) (not b_lambda!13851) (not b!932408) (not b!932403) (not b_next!17521))
(check-sat b_and!28605 (not b_next!17521))
