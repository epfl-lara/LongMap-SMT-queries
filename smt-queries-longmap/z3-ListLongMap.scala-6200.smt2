; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79290 () Bool)

(assert start!79290)

(declare-fun b_free!17521 () Bool)

(declare-fun b_next!17521 () Bool)

(assert (=> start!79290 (= b_free!17521 (not b_next!17521))))

(declare-fun tp!61004 () Bool)

(declare-fun b_and!28567 () Bool)

(assert (=> start!79290 (= tp!61004 b_and!28567)))

(declare-fun b!931257 () Bool)

(declare-fun e!522980 () Bool)

(declare-fun e!522981 () Bool)

(declare-fun mapRes!31800 () Bool)

(assert (=> b!931257 (= e!522980 (and e!522981 mapRes!31800))))

(declare-fun condMapEmpty!31800 () Bool)

(declare-datatypes ((V!31671 0))(
  ( (V!31672 (val!10065 Int)) )
))
(declare-datatypes ((ValueCell!9533 0))(
  ( (ValueCellFull!9533 (v!12582 V!31671)) (EmptyCell!9533) )
))
(declare-datatypes ((array!55967 0))(
  ( (array!55968 (arr!26929 (Array (_ BitVec 32) ValueCell!9533)) (size!27390 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55967)

(declare-fun mapDefault!31800 () ValueCell!9533)

(assert (=> b!931257 (= condMapEmpty!31800 (= (arr!26929 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9533)) mapDefault!31800)))))

(declare-fun b!931258 () Bool)

(declare-fun res!627238 () Bool)

(declare-fun e!522976 () Bool)

(assert (=> b!931258 (=> (not res!627238) (not e!522976))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55969 0))(
  ( (array!55970 (arr!26930 (Array (_ BitVec 32) (_ BitVec 64))) (size!27391 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55969)

(assert (=> b!931258 (= res!627238 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27391 _keys!1487))))))

(declare-fun b!931259 () Bool)

(declare-fun res!627231 () Bool)

(assert (=> b!931259 (=> (not res!627231) (not e!522976))))

(declare-datatypes ((List!18988 0))(
  ( (Nil!18985) (Cons!18984 (h!20130 (_ BitVec 64)) (t!27044 List!18988)) )
))
(declare-fun arrayNoDuplicates!0 (array!55969 (_ BitVec 32) List!18988) Bool)

(assert (=> b!931259 (= res!627231 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18985))))

(declare-fun b!931260 () Bool)

(declare-fun e!522975 () Bool)

(assert (=> b!931260 (= e!522976 e!522975)))

(declare-fun res!627236 () Bool)

(assert (=> b!931260 (=> (not res!627236) (not e!522975))))

(declare-datatypes ((tuple2!13232 0))(
  ( (tuple2!13233 (_1!6627 (_ BitVec 64)) (_2!6627 V!31671)) )
))
(declare-datatypes ((List!18989 0))(
  ( (Nil!18986) (Cons!18985 (h!20131 tuple2!13232) (t!27045 List!18989)) )
))
(declare-datatypes ((ListLongMap!11919 0))(
  ( (ListLongMap!11920 (toList!5975 List!18989)) )
))
(declare-fun lt!419208 () ListLongMap!11919)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4975 (ListLongMap!11919 (_ BitVec 64)) Bool)

(assert (=> b!931260 (= res!627236 (contains!4975 lt!419208 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31671)

(declare-fun minValue!1173 () V!31671)

(declare-fun getCurrentListMap!3150 (array!55969 array!55967 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) ListLongMap!11919)

(assert (=> b!931260 (= lt!419208 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31800 () Bool)

(assert (=> mapIsEmpty!31800 mapRes!31800))

(declare-fun b!931261 () Bool)

(declare-fun e!522979 () Bool)

(declare-fun tp_is_empty!20029 () Bool)

(assert (=> b!931261 (= e!522979 tp_is_empty!20029)))

(declare-fun b!931262 () Bool)

(declare-fun res!627235 () Bool)

(assert (=> b!931262 (=> (not res!627235) (not e!522975))))

(assert (=> b!931262 (= res!627235 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931263 () Bool)

(declare-fun res!627232 () Bool)

(assert (=> b!931263 (=> (not res!627232) (not e!522976))))

(assert (=> b!931263 (= res!627232 (and (= (size!27390 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27391 _keys!1487) (size!27390 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627234 () Bool)

(assert (=> start!79290 (=> (not res!627234) (not e!522976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79290 (= res!627234 (validMask!0 mask!1881))))

(assert (=> start!79290 e!522976))

(assert (=> start!79290 true))

(assert (=> start!79290 tp_is_empty!20029))

(declare-fun array_inv!21026 (array!55967) Bool)

(assert (=> start!79290 (and (array_inv!21026 _values!1231) e!522980)))

(assert (=> start!79290 tp!61004))

(declare-fun array_inv!21027 (array!55969) Bool)

(assert (=> start!79290 (array_inv!21027 _keys!1487)))

(declare-fun b!931264 () Bool)

(declare-fun res!627239 () Bool)

(assert (=> b!931264 (=> (not res!627239) (not e!522975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931264 (= res!627239 (validKeyInArray!0 k0!1099))))

(declare-fun b!931265 () Bool)

(declare-fun e!522977 () Bool)

(assert (=> b!931265 (= e!522977 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27390 _values!1231))))))

(declare-fun lt!419209 () (_ BitVec 64))

(declare-fun +!2787 (ListLongMap!11919 tuple2!13232) ListLongMap!11919)

(declare-fun get!14156 (ValueCell!9533 V!31671) V!31671)

(declare-fun dynLambda!1543 (Int (_ BitVec 64)) V!31671)

(assert (=> b!931265 (= (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2787 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13233 lt!419209 (get!14156 (select (arr!26929 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1543 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31339 0))(
  ( (Unit!31340) )
))
(declare-fun lt!419210 () Unit!31339)

(declare-fun lemmaListMapRecursiveValidKeyArray!151 (array!55969 array!55967 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) Unit!31339)

(assert (=> b!931265 (= lt!419210 (lemmaListMapRecursiveValidKeyArray!151 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931266 () Bool)

(declare-fun res!627237 () Bool)

(assert (=> b!931266 (=> (not res!627237) (not e!522976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55969 (_ BitVec 32)) Bool)

(assert (=> b!931266 (= res!627237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931267 () Bool)

(assert (=> b!931267 (= e!522975 e!522977)))

(declare-fun res!627233 () Bool)

(assert (=> b!931267 (=> (not res!627233) (not e!522977))))

(assert (=> b!931267 (= res!627233 (validKeyInArray!0 lt!419209))))

(assert (=> b!931267 (= lt!419209 (select (arr!26930 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931268 () Bool)

(declare-fun res!627230 () Bool)

(assert (=> b!931268 (=> (not res!627230) (not e!522975))))

(declare-fun v!791 () V!31671)

(declare-fun apply!769 (ListLongMap!11919 (_ BitVec 64)) V!31671)

(assert (=> b!931268 (= res!627230 (= (apply!769 lt!419208 k0!1099) v!791))))

(declare-fun mapNonEmpty!31800 () Bool)

(declare-fun tp!61005 () Bool)

(assert (=> mapNonEmpty!31800 (= mapRes!31800 (and tp!61005 e!522979))))

(declare-fun mapValue!31800 () ValueCell!9533)

(declare-fun mapKey!31800 () (_ BitVec 32))

(declare-fun mapRest!31800 () (Array (_ BitVec 32) ValueCell!9533))

(assert (=> mapNonEmpty!31800 (= (arr!26929 _values!1231) (store mapRest!31800 mapKey!31800 mapValue!31800))))

(declare-fun b!931269 () Bool)

(assert (=> b!931269 (= e!522981 tp_is_empty!20029)))

(assert (= (and start!79290 res!627234) b!931263))

(assert (= (and b!931263 res!627232) b!931266))

(assert (= (and b!931266 res!627237) b!931259))

(assert (= (and b!931259 res!627231) b!931258))

(assert (= (and b!931258 res!627238) b!931260))

(assert (= (and b!931260 res!627236) b!931268))

(assert (= (and b!931268 res!627230) b!931262))

(assert (= (and b!931262 res!627235) b!931264))

(assert (= (and b!931264 res!627239) b!931267))

(assert (= (and b!931267 res!627233) b!931265))

(assert (= (and b!931257 condMapEmpty!31800) mapIsEmpty!31800))

(assert (= (and b!931257 (not condMapEmpty!31800)) mapNonEmpty!31800))

(get-info :version)

(assert (= (and mapNonEmpty!31800 ((_ is ValueCellFull!9533) mapValue!31800)) b!931261))

(assert (= (and b!931257 ((_ is ValueCellFull!9533) mapDefault!31800)) b!931269))

(assert (= start!79290 b!931257))

(declare-fun b_lambda!13819 () Bool)

(assert (=> (not b_lambda!13819) (not b!931265)))

(declare-fun t!27043 () Bool)

(declare-fun tb!5907 () Bool)

(assert (=> (and start!79290 (= defaultEntry!1235 defaultEntry!1235) t!27043) tb!5907))

(declare-fun result!11645 () Bool)

(assert (=> tb!5907 (= result!11645 tp_is_empty!20029)))

(assert (=> b!931265 t!27043))

(declare-fun b_and!28569 () Bool)

(assert (= b_and!28567 (and (=> t!27043 result!11645) b_and!28569)))

(declare-fun m!864619 () Bool)

(assert (=> b!931266 m!864619))

(declare-fun m!864621 () Bool)

(assert (=> b!931259 m!864621))

(declare-fun m!864623 () Bool)

(assert (=> mapNonEmpty!31800 m!864623))

(declare-fun m!864625 () Bool)

(assert (=> b!931260 m!864625))

(declare-fun m!864627 () Bool)

(assert (=> b!931260 m!864627))

(declare-fun m!864629 () Bool)

(assert (=> b!931267 m!864629))

(declare-fun m!864631 () Bool)

(assert (=> b!931267 m!864631))

(declare-fun m!864633 () Bool)

(assert (=> start!79290 m!864633))

(declare-fun m!864635 () Bool)

(assert (=> start!79290 m!864635))

(declare-fun m!864637 () Bool)

(assert (=> start!79290 m!864637))

(declare-fun m!864639 () Bool)

(assert (=> b!931265 m!864639))

(declare-fun m!864641 () Bool)

(assert (=> b!931265 m!864641))

(assert (=> b!931265 m!864639))

(assert (=> b!931265 m!864641))

(declare-fun m!864643 () Bool)

(assert (=> b!931265 m!864643))

(declare-fun m!864645 () Bool)

(assert (=> b!931265 m!864645))

(declare-fun m!864647 () Bool)

(assert (=> b!931265 m!864647))

(declare-fun m!864649 () Bool)

(assert (=> b!931265 m!864649))

(assert (=> b!931265 m!864647))

(declare-fun m!864651 () Bool)

(assert (=> b!931265 m!864651))

(declare-fun m!864653 () Bool)

(assert (=> b!931264 m!864653))

(declare-fun m!864655 () Bool)

(assert (=> b!931268 m!864655))

(check-sat (not start!79290) (not b!931260) (not b_next!17521) (not b_lambda!13819) (not b!931268) (not b!931267) (not b!931266) (not b!931264) b_and!28569 (not mapNonEmpty!31800) (not b!931259) (not b!931265) tp_is_empty!20029)
(check-sat b_and!28569 (not b_next!17521))
