; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79296 () Bool)

(assert start!79296)

(declare-fun b_free!17527 () Bool)

(declare-fun b_next!17527 () Bool)

(assert (=> start!79296 (= b_free!17527 (not b_next!17527))))

(declare-fun tp!61023 () Bool)

(declare-fun b_and!28579 () Bool)

(assert (=> start!79296 (= tp!61023 b_and!28579)))

(declare-fun b!931380 () Bool)

(declare-fun res!627322 () Bool)

(declare-fun e!523043 () Bool)

(assert (=> b!931380 (=> (not res!627322) (not e!523043))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55977 0))(
  ( (array!55978 (arr!26934 (Array (_ BitVec 32) (_ BitVec 64))) (size!27395 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55977)

(assert (=> b!931380 (= res!627322 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27395 _keys!1487))))))

(declare-fun b!931381 () Bool)

(declare-fun e!523042 () Bool)

(declare-fun e!523041 () Bool)

(assert (=> b!931381 (= e!523042 e!523041)))

(declare-fun res!627326 () Bool)

(assert (=> b!931381 (=> (not res!627326) (not e!523041))))

(declare-fun lt!419236 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931381 (= res!627326 (validKeyInArray!0 lt!419236))))

(assert (=> b!931381 (= lt!419236 (select (arr!26934 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31809 () Bool)

(declare-fun mapRes!31809 () Bool)

(assert (=> mapIsEmpty!31809 mapRes!31809))

(declare-fun b!931383 () Bool)

(declare-fun e!523040 () Bool)

(declare-fun tp_is_empty!20035 () Bool)

(assert (=> b!931383 (= e!523040 tp_is_empty!20035)))

(declare-fun b!931384 () Bool)

(assert (=> b!931384 (= e!523041 (not true))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31679 0))(
  ( (V!31680 (val!10068 Int)) )
))
(declare-datatypes ((ValueCell!9536 0))(
  ( (ValueCellFull!9536 (v!12585 V!31679)) (EmptyCell!9536) )
))
(declare-datatypes ((array!55979 0))(
  ( (array!55980 (arr!26935 (Array (_ BitVec 32) ValueCell!9536)) (size!27396 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55979)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31679)

(declare-fun minValue!1173 () V!31679)

(declare-datatypes ((tuple2!13238 0))(
  ( (tuple2!13239 (_1!6630 (_ BitVec 64)) (_2!6630 V!31679)) )
))
(declare-datatypes ((List!18992 0))(
  ( (Nil!18989) (Cons!18988 (h!20134 tuple2!13238) (t!27054 List!18992)) )
))
(declare-datatypes ((ListLongMap!11925 0))(
  ( (ListLongMap!11926 (toList!5978 List!18992)) )
))
(declare-fun getCurrentListMap!3152 (array!55977 array!55979 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) ListLongMap!11925)

(declare-fun +!2789 (ListLongMap!11925 tuple2!13238) ListLongMap!11925)

(declare-fun get!14160 (ValueCell!9536 V!31679) V!31679)

(declare-fun dynLambda!1545 (Int (_ BitVec 64)) V!31679)

(assert (=> b!931384 (= (getCurrentListMap!3152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2789 (getCurrentListMap!3152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13239 lt!419236 (get!14160 (select (arr!26935 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1545 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31343 0))(
  ( (Unit!31344) )
))
(declare-fun lt!419235 () Unit!31343)

(declare-fun lemmaListMapRecursiveValidKeyArray!153 (array!55977 array!55979 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) Unit!31343)

(assert (=> b!931384 (= lt!419235 (lemmaListMapRecursiveValidKeyArray!153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931385 () Bool)

(declare-fun res!627323 () Bool)

(assert (=> b!931385 (=> (not res!627323) (not e!523042))))

(assert (=> b!931385 (= res!627323 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931386 () Bool)

(declare-fun res!627324 () Bool)

(assert (=> b!931386 (=> (not res!627324) (not e!523042))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31679)

(declare-fun lt!419237 () ListLongMap!11925)

(declare-fun apply!771 (ListLongMap!11925 (_ BitVec 64)) V!31679)

(assert (=> b!931386 (= res!627324 (= (apply!771 lt!419237 k0!1099) v!791))))

(declare-fun b!931387 () Bool)

(assert (=> b!931387 (= e!523043 e!523042)))

(declare-fun res!627327 () Bool)

(assert (=> b!931387 (=> (not res!627327) (not e!523042))))

(declare-fun contains!4976 (ListLongMap!11925 (_ BitVec 64)) Bool)

(assert (=> b!931387 (= res!627327 (contains!4976 lt!419237 k0!1099))))

(assert (=> b!931387 (= lt!419237 (getCurrentListMap!3152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931388 () Bool)

(declare-fun e!523039 () Bool)

(declare-fun e!523044 () Bool)

(assert (=> b!931388 (= e!523039 (and e!523044 mapRes!31809))))

(declare-fun condMapEmpty!31809 () Bool)

(declare-fun mapDefault!31809 () ValueCell!9536)

(assert (=> b!931388 (= condMapEmpty!31809 (= (arr!26935 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9536)) mapDefault!31809)))))

(declare-fun b!931389 () Bool)

(assert (=> b!931389 (= e!523044 tp_is_empty!20035)))

(declare-fun b!931390 () Bool)

(declare-fun res!627329 () Bool)

(assert (=> b!931390 (=> (not res!627329) (not e!523043))))

(assert (=> b!931390 (= res!627329 (and (= (size!27396 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27395 _keys!1487) (size!27396 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31809 () Bool)

(declare-fun tp!61022 () Bool)

(assert (=> mapNonEmpty!31809 (= mapRes!31809 (and tp!61022 e!523040))))

(declare-fun mapValue!31809 () ValueCell!9536)

(declare-fun mapRest!31809 () (Array (_ BitVec 32) ValueCell!9536))

(declare-fun mapKey!31809 () (_ BitVec 32))

(assert (=> mapNonEmpty!31809 (= (arr!26935 _values!1231) (store mapRest!31809 mapKey!31809 mapValue!31809))))

(declare-fun b!931391 () Bool)

(declare-fun res!627328 () Bool)

(assert (=> b!931391 (=> (not res!627328) (not e!523042))))

(assert (=> b!931391 (= res!627328 (validKeyInArray!0 k0!1099))))

(declare-fun b!931392 () Bool)

(declare-fun res!627325 () Bool)

(assert (=> b!931392 (=> (not res!627325) (not e!523043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55977 (_ BitVec 32)) Bool)

(assert (=> b!931392 (= res!627325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!627321 () Bool)

(assert (=> start!79296 (=> (not res!627321) (not e!523043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79296 (= res!627321 (validMask!0 mask!1881))))

(assert (=> start!79296 e!523043))

(assert (=> start!79296 true))

(assert (=> start!79296 tp_is_empty!20035))

(declare-fun array_inv!21030 (array!55979) Bool)

(assert (=> start!79296 (and (array_inv!21030 _values!1231) e!523039)))

(assert (=> start!79296 tp!61023))

(declare-fun array_inv!21031 (array!55977) Bool)

(assert (=> start!79296 (array_inv!21031 _keys!1487)))

(declare-fun b!931382 () Bool)

(declare-fun res!627320 () Bool)

(assert (=> b!931382 (=> (not res!627320) (not e!523043))))

(declare-datatypes ((List!18993 0))(
  ( (Nil!18990) (Cons!18989 (h!20135 (_ BitVec 64)) (t!27055 List!18993)) )
))
(declare-fun arrayNoDuplicates!0 (array!55977 (_ BitVec 32) List!18993) Bool)

(assert (=> b!931382 (= res!627320 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18990))))

(assert (= (and start!79296 res!627321) b!931390))

(assert (= (and b!931390 res!627329) b!931392))

(assert (= (and b!931392 res!627325) b!931382))

(assert (= (and b!931382 res!627320) b!931380))

(assert (= (and b!931380 res!627322) b!931387))

(assert (= (and b!931387 res!627327) b!931386))

(assert (= (and b!931386 res!627324) b!931385))

(assert (= (and b!931385 res!627323) b!931391))

(assert (= (and b!931391 res!627328) b!931381))

(assert (= (and b!931381 res!627326) b!931384))

(assert (= (and b!931388 condMapEmpty!31809) mapIsEmpty!31809))

(assert (= (and b!931388 (not condMapEmpty!31809)) mapNonEmpty!31809))

(get-info :version)

(assert (= (and mapNonEmpty!31809 ((_ is ValueCellFull!9536) mapValue!31809)) b!931383))

(assert (= (and b!931388 ((_ is ValueCellFull!9536) mapDefault!31809)) b!931389))

(assert (= start!79296 b!931388))

(declare-fun b_lambda!13825 () Bool)

(assert (=> (not b_lambda!13825) (not b!931384)))

(declare-fun t!27053 () Bool)

(declare-fun tb!5913 () Bool)

(assert (=> (and start!79296 (= defaultEntry!1235 defaultEntry!1235) t!27053) tb!5913))

(declare-fun result!11657 () Bool)

(assert (=> tb!5913 (= result!11657 tp_is_empty!20035)))

(assert (=> b!931384 t!27053))

(declare-fun b_and!28581 () Bool)

(assert (= b_and!28579 (and (=> t!27053 result!11657) b_and!28581)))

(declare-fun m!864733 () Bool)

(assert (=> b!931386 m!864733))

(declare-fun m!864735 () Bool)

(assert (=> b!931391 m!864735))

(declare-fun m!864737 () Bool)

(assert (=> b!931381 m!864737))

(declare-fun m!864739 () Bool)

(assert (=> b!931381 m!864739))

(declare-fun m!864741 () Bool)

(assert (=> mapNonEmpty!31809 m!864741))

(declare-fun m!864743 () Bool)

(assert (=> b!931392 m!864743))

(declare-fun m!864745 () Bool)

(assert (=> start!79296 m!864745))

(declare-fun m!864747 () Bool)

(assert (=> start!79296 m!864747))

(declare-fun m!864749 () Bool)

(assert (=> start!79296 m!864749))

(declare-fun m!864751 () Bool)

(assert (=> b!931387 m!864751))

(declare-fun m!864753 () Bool)

(assert (=> b!931387 m!864753))

(declare-fun m!864755 () Bool)

(assert (=> b!931384 m!864755))

(declare-fun m!864757 () Bool)

(assert (=> b!931384 m!864757))

(assert (=> b!931384 m!864755))

(assert (=> b!931384 m!864757))

(declare-fun m!864759 () Bool)

(assert (=> b!931384 m!864759))

(declare-fun m!864761 () Bool)

(assert (=> b!931384 m!864761))

(declare-fun m!864763 () Bool)

(assert (=> b!931384 m!864763))

(declare-fun m!864765 () Bool)

(assert (=> b!931384 m!864765))

(assert (=> b!931384 m!864761))

(declare-fun m!864767 () Bool)

(assert (=> b!931384 m!864767))

(declare-fun m!864769 () Bool)

(assert (=> b!931382 m!864769))

(check-sat (not mapNonEmpty!31809) tp_is_empty!20035 (not b!931384) (not b!931381) (not start!79296) (not b!931387) (not b!931382) (not b_next!17527) (not b!931392) (not b!931386) (not b!931391) b_and!28581 (not b_lambda!13825))
(check-sat b_and!28581 (not b_next!17527))
