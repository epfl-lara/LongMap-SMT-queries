; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79284 () Bool)

(assert start!79284)

(declare-fun b_free!17515 () Bool)

(declare-fun b_next!17515 () Bool)

(assert (=> start!79284 (= b_free!17515 (not b_next!17515))))

(declare-fun tp!60987 () Bool)

(declare-fun b_and!28555 () Bool)

(assert (=> start!79284 (= tp!60987 b_and!28555)))

(declare-fun mapIsEmpty!31791 () Bool)

(declare-fun mapRes!31791 () Bool)

(assert (=> mapIsEmpty!31791 mapRes!31791))

(declare-fun b!931134 () Bool)

(declare-fun res!627148 () Bool)

(declare-fun e!522917 () Bool)

(assert (=> b!931134 (=> (not res!627148) (not e!522917))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931134 (= res!627148 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931135 () Bool)

(declare-fun e!522912 () Bool)

(declare-fun e!522915 () Bool)

(assert (=> b!931135 (= e!522912 (and e!522915 mapRes!31791))))

(declare-fun condMapEmpty!31791 () Bool)

(declare-datatypes ((V!31663 0))(
  ( (V!31664 (val!10062 Int)) )
))
(declare-datatypes ((ValueCell!9530 0))(
  ( (ValueCellFull!9530 (v!12579 V!31663)) (EmptyCell!9530) )
))
(declare-datatypes ((array!55955 0))(
  ( (array!55956 (arr!26923 (Array (_ BitVec 32) ValueCell!9530)) (size!27384 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55955)

(declare-fun mapDefault!31791 () ValueCell!9530)

(assert (=> b!931135 (= condMapEmpty!31791 (= (arr!26923 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9530)) mapDefault!31791)))))

(declare-fun b!931136 () Bool)

(declare-fun e!522918 () Bool)

(declare-fun tp_is_empty!20023 () Bool)

(assert (=> b!931136 (= e!522918 tp_is_empty!20023)))

(declare-fun b!931137 () Bool)

(declare-fun e!522914 () Bool)

(assert (=> b!931137 (= e!522914 e!522917)))

(declare-fun res!627140 () Bool)

(assert (=> b!931137 (=> (not res!627140) (not e!522917))))

(declare-datatypes ((tuple2!13226 0))(
  ( (tuple2!13227 (_1!6624 (_ BitVec 64)) (_2!6624 V!31663)) )
))
(declare-datatypes ((List!18982 0))(
  ( (Nil!18979) (Cons!18978 (h!20124 tuple2!13226) (t!27032 List!18982)) )
))
(declare-datatypes ((ListLongMap!11913 0))(
  ( (ListLongMap!11914 (toList!5972 List!18982)) )
))
(declare-fun lt!419182 () ListLongMap!11913)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4973 (ListLongMap!11913 (_ BitVec 64)) Bool)

(assert (=> b!931137 (= res!627140 (contains!4973 lt!419182 k0!1099))))

(declare-datatypes ((array!55957 0))(
  ( (array!55958 (arr!26924 (Array (_ BitVec 32) (_ BitVec 64))) (size!27385 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55957)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31663)

(declare-fun minValue!1173 () V!31663)

(declare-fun getCurrentListMap!3147 (array!55957 array!55955 (_ BitVec 32) (_ BitVec 32) V!31663 V!31663 (_ BitVec 32) Int) ListLongMap!11913)

(assert (=> b!931137 (= lt!419182 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931138 () Bool)

(declare-fun res!627149 () Bool)

(assert (=> b!931138 (=> (not res!627149) (not e!522917))))

(declare-fun v!791 () V!31663)

(declare-fun apply!766 (ListLongMap!11913 (_ BitVec 64)) V!31663)

(assert (=> b!931138 (= res!627149 (= (apply!766 lt!419182 k0!1099) v!791))))

(declare-fun res!627143 () Bool)

(assert (=> start!79284 (=> (not res!627143) (not e!522914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79284 (= res!627143 (validMask!0 mask!1881))))

(assert (=> start!79284 e!522914))

(assert (=> start!79284 true))

(assert (=> start!79284 tp_is_empty!20023))

(declare-fun array_inv!21020 (array!55955) Bool)

(assert (=> start!79284 (and (array_inv!21020 _values!1231) e!522912)))

(assert (=> start!79284 tp!60987))

(declare-fun array_inv!21021 (array!55957) Bool)

(assert (=> start!79284 (array_inv!21021 _keys!1487)))

(declare-fun b!931139 () Bool)

(declare-fun res!627142 () Bool)

(assert (=> b!931139 (=> (not res!627142) (not e!522914))))

(assert (=> b!931139 (= res!627142 (and (= (size!27384 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27385 _keys!1487) (size!27384 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931140 () Bool)

(declare-fun res!627141 () Bool)

(assert (=> b!931140 (=> (not res!627141) (not e!522914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55957 (_ BitVec 32)) Bool)

(assert (=> b!931140 (= res!627141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931141 () Bool)

(declare-fun res!627146 () Bool)

(assert (=> b!931141 (=> (not res!627146) (not e!522914))))

(declare-datatypes ((List!18983 0))(
  ( (Nil!18980) (Cons!18979 (h!20125 (_ BitVec 64)) (t!27033 List!18983)) )
))
(declare-fun arrayNoDuplicates!0 (array!55957 (_ BitVec 32) List!18983) Bool)

(assert (=> b!931141 (= res!627146 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18980))))

(declare-fun mapNonEmpty!31791 () Bool)

(declare-fun tp!60986 () Bool)

(assert (=> mapNonEmpty!31791 (= mapRes!31791 (and tp!60986 e!522918))))

(declare-fun mapRest!31791 () (Array (_ BitVec 32) ValueCell!9530))

(declare-fun mapKey!31791 () (_ BitVec 32))

(declare-fun mapValue!31791 () ValueCell!9530)

(assert (=> mapNonEmpty!31791 (= (arr!26923 _values!1231) (store mapRest!31791 mapKey!31791 mapValue!31791))))

(declare-fun b!931142 () Bool)

(assert (=> b!931142 (= e!522915 tp_is_empty!20023)))

(declare-fun b!931143 () Bool)

(declare-fun res!627145 () Bool)

(assert (=> b!931143 (=> (not res!627145) (not e!522914))))

(assert (=> b!931143 (= res!627145 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27385 _keys!1487))))))

(declare-fun b!931144 () Bool)

(declare-fun e!522913 () Bool)

(assert (=> b!931144 (= e!522913 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27385 _keys!1487))))))

(declare-fun lt!419183 () (_ BitVec 64))

(declare-fun +!2784 (ListLongMap!11913 tuple2!13226) ListLongMap!11913)

(declare-fun get!14151 (ValueCell!9530 V!31663) V!31663)

(declare-fun dynLambda!1540 (Int (_ BitVec 64)) V!31663)

(assert (=> b!931144 (= (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2784 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13227 lt!419183 (get!14151 (select (arr!26923 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1540 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31333 0))(
  ( (Unit!31334) )
))
(declare-fun lt!419181 () Unit!31333)

(declare-fun lemmaListMapRecursiveValidKeyArray!148 (array!55957 array!55955 (_ BitVec 32) (_ BitVec 32) V!31663 V!31663 (_ BitVec 32) Int) Unit!31333)

(assert (=> b!931144 (= lt!419181 (lemmaListMapRecursiveValidKeyArray!148 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931145 () Bool)

(assert (=> b!931145 (= e!522917 e!522913)))

(declare-fun res!627144 () Bool)

(assert (=> b!931145 (=> (not res!627144) (not e!522913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931145 (= res!627144 (validKeyInArray!0 lt!419183))))

(assert (=> b!931145 (= lt!419183 (select (arr!26924 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931146 () Bool)

(declare-fun res!627147 () Bool)

(assert (=> b!931146 (=> (not res!627147) (not e!522917))))

(assert (=> b!931146 (= res!627147 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79284 res!627143) b!931139))

(assert (= (and b!931139 res!627142) b!931140))

(assert (= (and b!931140 res!627141) b!931141))

(assert (= (and b!931141 res!627146) b!931143))

(assert (= (and b!931143 res!627145) b!931137))

(assert (= (and b!931137 res!627140) b!931138))

(assert (= (and b!931138 res!627149) b!931134))

(assert (= (and b!931134 res!627148) b!931146))

(assert (= (and b!931146 res!627147) b!931145))

(assert (= (and b!931145 res!627144) b!931144))

(assert (= (and b!931135 condMapEmpty!31791) mapIsEmpty!31791))

(assert (= (and b!931135 (not condMapEmpty!31791)) mapNonEmpty!31791))

(get-info :version)

(assert (= (and mapNonEmpty!31791 ((_ is ValueCellFull!9530) mapValue!31791)) b!931136))

(assert (= (and b!931135 ((_ is ValueCellFull!9530) mapDefault!31791)) b!931142))

(assert (= start!79284 b!931135))

(declare-fun b_lambda!13813 () Bool)

(assert (=> (not b_lambda!13813) (not b!931144)))

(declare-fun t!27031 () Bool)

(declare-fun tb!5901 () Bool)

(assert (=> (and start!79284 (= defaultEntry!1235 defaultEntry!1235) t!27031) tb!5901))

(declare-fun result!11633 () Bool)

(assert (=> tb!5901 (= result!11633 tp_is_empty!20023)))

(assert (=> b!931144 t!27031))

(declare-fun b_and!28557 () Bool)

(assert (= b_and!28555 (and (=> t!27031 result!11633) b_and!28557)))

(declare-fun m!864505 () Bool)

(assert (=> b!931137 m!864505))

(declare-fun m!864507 () Bool)

(assert (=> b!931137 m!864507))

(declare-fun m!864509 () Bool)

(assert (=> b!931141 m!864509))

(declare-fun m!864511 () Bool)

(assert (=> b!931138 m!864511))

(declare-fun m!864513 () Bool)

(assert (=> b!931146 m!864513))

(declare-fun m!864515 () Bool)

(assert (=> b!931144 m!864515))

(declare-fun m!864517 () Bool)

(assert (=> b!931144 m!864517))

(assert (=> b!931144 m!864515))

(assert (=> b!931144 m!864517))

(declare-fun m!864519 () Bool)

(assert (=> b!931144 m!864519))

(declare-fun m!864521 () Bool)

(assert (=> b!931144 m!864521))

(declare-fun m!864523 () Bool)

(assert (=> b!931144 m!864523))

(declare-fun m!864525 () Bool)

(assert (=> b!931144 m!864525))

(assert (=> b!931144 m!864523))

(declare-fun m!864527 () Bool)

(assert (=> b!931144 m!864527))

(declare-fun m!864529 () Bool)

(assert (=> mapNonEmpty!31791 m!864529))

(declare-fun m!864531 () Bool)

(assert (=> b!931145 m!864531))

(declare-fun m!864533 () Bool)

(assert (=> b!931145 m!864533))

(declare-fun m!864535 () Bool)

(assert (=> start!79284 m!864535))

(declare-fun m!864537 () Bool)

(assert (=> start!79284 m!864537))

(declare-fun m!864539 () Bool)

(assert (=> start!79284 m!864539))

(declare-fun m!864541 () Bool)

(assert (=> b!931140 m!864541))

(check-sat (not b!931145) b_and!28557 (not mapNonEmpty!31791) (not b!931146) (not b!931137) tp_is_empty!20023 (not b!931144) (not b!931138) (not b_next!17515) (not start!79284) (not b!931141) (not b_lambda!13813) (not b!931140))
(check-sat b_and!28557 (not b_next!17515))
