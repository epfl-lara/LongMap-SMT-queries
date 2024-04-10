; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78800 () Bool)

(assert start!78800)

(declare-fun b_free!17013 () Bool)

(declare-fun b_next!17013 () Bool)

(assert (=> start!78800 (= b_free!17013 (not b_next!17013))))

(declare-fun tp!59480 () Bool)

(declare-fun b_and!27763 () Bool)

(assert (=> start!78800 (= tp!59480 b_and!27763)))

(declare-fun b!919847 () Bool)

(declare-fun e!516300 () Bool)

(declare-fun tp_is_empty!19521 () Bool)

(assert (=> b!919847 (= e!516300 tp_is_empty!19521)))

(declare-fun b!919848 () Bool)

(declare-fun e!516296 () Bool)

(declare-fun e!516299 () Bool)

(declare-fun mapRes!31038 () Bool)

(assert (=> b!919848 (= e!516296 (and e!516299 mapRes!31038))))

(declare-fun condMapEmpty!31038 () Bool)

(declare-datatypes ((V!30993 0))(
  ( (V!30994 (val!9811 Int)) )
))
(declare-datatypes ((ValueCell!9279 0))(
  ( (ValueCellFull!9279 (v!12329 V!30993)) (EmptyCell!9279) )
))
(declare-datatypes ((array!55024 0))(
  ( (array!55025 (arr!26457 (Array (_ BitVec 32) ValueCell!9279)) (size!26916 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55024)

(declare-fun mapDefault!31038 () ValueCell!9279)

(assert (=> b!919848 (= condMapEmpty!31038 (= (arr!26457 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9279)) mapDefault!31038)))))

(declare-fun b!919849 () Bool)

(declare-fun res!620262 () Bool)

(declare-fun e!516297 () Bool)

(assert (=> b!919849 (=> (not res!620262) (not e!516297))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30993)

(declare-datatypes ((tuple2!12750 0))(
  ( (tuple2!12751 (_1!6386 (_ BitVec 64)) (_2!6386 V!30993)) )
))
(declare-datatypes ((List!18554 0))(
  ( (Nil!18551) (Cons!18550 (h!19696 tuple2!12750) (t!26297 List!18554)) )
))
(declare-datatypes ((ListLongMap!11447 0))(
  ( (ListLongMap!11448 (toList!5739 List!18554)) )
))
(declare-fun lt!412917 () ListLongMap!11447)

(declare-fun apply!582 (ListLongMap!11447 (_ BitVec 64)) V!30993)

(assert (=> b!919849 (= res!620262 (= (apply!582 lt!412917 k0!1099) v!791))))

(declare-fun b!919850 () Bool)

(assert (=> b!919850 (= e!516299 tp_is_empty!19521)))

(declare-fun b!919851 () Bool)

(declare-fun res!620266 () Bool)

(assert (=> b!919851 (=> (not res!620266) (not e!516297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919851 (= res!620266 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31038 () Bool)

(declare-fun tp!59479 () Bool)

(assert (=> mapNonEmpty!31038 (= mapRes!31038 (and tp!59479 e!516300))))

(declare-fun mapKey!31038 () (_ BitVec 32))

(declare-fun mapRest!31038 () (Array (_ BitVec 32) ValueCell!9279))

(declare-fun mapValue!31038 () ValueCell!9279)

(assert (=> mapNonEmpty!31038 (= (arr!26457 _values!1231) (store mapRest!31038 mapKey!31038 mapValue!31038))))

(declare-fun mapIsEmpty!31038 () Bool)

(assert (=> mapIsEmpty!31038 mapRes!31038))

(declare-fun b!919852 () Bool)

(declare-fun res!620265 () Bool)

(declare-fun e!516298 () Bool)

(assert (=> b!919852 (=> (not res!620265) (not e!516298))))

(declare-datatypes ((array!55026 0))(
  ( (array!55027 (arr!26458 (Array (_ BitVec 32) (_ BitVec 64))) (size!26917 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55026)

(declare-datatypes ((List!18555 0))(
  ( (Nil!18552) (Cons!18551 (h!19697 (_ BitVec 64)) (t!26298 List!18555)) )
))
(declare-fun arrayNoDuplicates!0 (array!55026 (_ BitVec 32) List!18555) Bool)

(assert (=> b!919852 (= res!620265 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18552))))

(declare-fun b!919853 () Bool)

(declare-fun e!516295 () Bool)

(assert (=> b!919853 (= e!516297 e!516295)))

(declare-fun res!620264 () Bool)

(assert (=> b!919853 (=> (not res!620264) (not e!516295))))

(declare-fun lt!412913 () (_ BitVec 64))

(assert (=> b!919853 (= res!620264 (validKeyInArray!0 lt!412913))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919853 (= lt!412913 (select (arr!26458 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919854 () Bool)

(declare-fun res!620268 () Bool)

(assert (=> b!919854 (=> (not res!620268) (not e!516298))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55026 (_ BitVec 32)) Bool)

(assert (=> b!919854 (= res!620268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919855 () Bool)

(declare-fun res!620267 () Bool)

(assert (=> b!919855 (=> (not res!620267) (not e!516297))))

(assert (=> b!919855 (= res!620267 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919856 () Bool)

(declare-fun res!620263 () Bool)

(assert (=> b!919856 (=> (not res!620263) (not e!516298))))

(assert (=> b!919856 (= res!620263 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26917 _keys!1487))))))

(declare-fun b!919857 () Bool)

(assert (=> b!919857 (= e!516298 e!516297)))

(declare-fun res!620261 () Bool)

(assert (=> b!919857 (=> (not res!620261) (not e!516297))))

(declare-fun contains!4785 (ListLongMap!11447 (_ BitVec 64)) Bool)

(assert (=> b!919857 (= res!620261 (contains!4785 lt!412917 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30993)

(declare-fun minValue!1173 () V!30993)

(declare-fun getCurrentListMap!2995 (array!55026 array!55024 (_ BitVec 32) (_ BitVec 32) V!30993 V!30993 (_ BitVec 32) Int) ListLongMap!11447)

(assert (=> b!919857 (= lt!412917 (getCurrentListMap!2995 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919858 () Bool)

(declare-fun res!620269 () Bool)

(assert (=> b!919858 (=> (not res!620269) (not e!516298))))

(assert (=> b!919858 (= res!620269 (and (= (size!26916 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26917 _keys!1487) (size!26916 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919846 () Bool)

(assert (=> b!919846 (= e!516295 (not true))))

(assert (=> b!919846 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18552)))

(declare-datatypes ((Unit!31046 0))(
  ( (Unit!31047) )
))
(declare-fun lt!412918 () Unit!31046)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55026 (_ BitVec 32) (_ BitVec 32)) Unit!31046)

(assert (=> b!919846 (= lt!412918 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412912 () tuple2!12750)

(declare-fun +!2649 (ListLongMap!11447 tuple2!12750) ListLongMap!11447)

(assert (=> b!919846 (contains!4785 (+!2649 lt!412917 lt!412912) k0!1099)))

(declare-fun lt!412916 () V!30993)

(declare-fun lt!412914 () Unit!31046)

(declare-fun addStillContains!373 (ListLongMap!11447 (_ BitVec 64) V!30993 (_ BitVec 64)) Unit!31046)

(assert (=> b!919846 (= lt!412914 (addStillContains!373 lt!412917 lt!412913 lt!412916 k0!1099))))

(assert (=> b!919846 (= (getCurrentListMap!2995 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2649 (getCurrentListMap!2995 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412912))))

(assert (=> b!919846 (= lt!412912 (tuple2!12751 lt!412913 lt!412916))))

(declare-fun get!13876 (ValueCell!9279 V!30993) V!30993)

(declare-fun dynLambda!1438 (Int (_ BitVec 64)) V!30993)

(assert (=> b!919846 (= lt!412916 (get!13876 (select (arr!26457 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1438 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412915 () Unit!31046)

(declare-fun lemmaListMapRecursiveValidKeyArray!39 (array!55026 array!55024 (_ BitVec 32) (_ BitVec 32) V!30993 V!30993 (_ BitVec 32) Int) Unit!31046)

(assert (=> b!919846 (= lt!412915 (lemmaListMapRecursiveValidKeyArray!39 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!620260 () Bool)

(assert (=> start!78800 (=> (not res!620260) (not e!516298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78800 (= res!620260 (validMask!0 mask!1881))))

(assert (=> start!78800 e!516298))

(assert (=> start!78800 true))

(assert (=> start!78800 tp_is_empty!19521))

(declare-fun array_inv!20620 (array!55024) Bool)

(assert (=> start!78800 (and (array_inv!20620 _values!1231) e!516296)))

(assert (=> start!78800 tp!59480))

(declare-fun array_inv!20621 (array!55026) Bool)

(assert (=> start!78800 (array_inv!20621 _keys!1487)))

(assert (= (and start!78800 res!620260) b!919858))

(assert (= (and b!919858 res!620269) b!919854))

(assert (= (and b!919854 res!620268) b!919852))

(assert (= (and b!919852 res!620265) b!919856))

(assert (= (and b!919856 res!620263) b!919857))

(assert (= (and b!919857 res!620261) b!919849))

(assert (= (and b!919849 res!620262) b!919855))

(assert (= (and b!919855 res!620267) b!919851))

(assert (= (and b!919851 res!620266) b!919853))

(assert (= (and b!919853 res!620264) b!919846))

(assert (= (and b!919848 condMapEmpty!31038) mapIsEmpty!31038))

(assert (= (and b!919848 (not condMapEmpty!31038)) mapNonEmpty!31038))

(get-info :version)

(assert (= (and mapNonEmpty!31038 ((_ is ValueCellFull!9279) mapValue!31038)) b!919847))

(assert (= (and b!919848 ((_ is ValueCellFull!9279) mapDefault!31038)) b!919850))

(assert (= start!78800 b!919848))

(declare-fun b_lambda!13515 () Bool)

(assert (=> (not b_lambda!13515) (not b!919846)))

(declare-fun t!26296 () Bool)

(declare-fun tb!5593 () Bool)

(assert (=> (and start!78800 (= defaultEntry!1235 defaultEntry!1235) t!26296) tb!5593))

(declare-fun result!11009 () Bool)

(assert (=> tb!5593 (= result!11009 tp_is_empty!19521)))

(assert (=> b!919846 t!26296))

(declare-fun b_and!27765 () Bool)

(assert (= b_and!27763 (and (=> t!26296 result!11009) b_and!27765)))

(declare-fun m!853695 () Bool)

(assert (=> b!919857 m!853695))

(declare-fun m!853697 () Bool)

(assert (=> b!919857 m!853697))

(declare-fun m!853699 () Bool)

(assert (=> b!919852 m!853699))

(declare-fun m!853701 () Bool)

(assert (=> b!919846 m!853701))

(declare-fun m!853703 () Bool)

(assert (=> b!919846 m!853703))

(declare-fun m!853705 () Bool)

(assert (=> b!919846 m!853705))

(assert (=> b!919846 m!853705))

(declare-fun m!853707 () Bool)

(assert (=> b!919846 m!853707))

(declare-fun m!853709 () Bool)

(assert (=> b!919846 m!853709))

(declare-fun m!853711 () Bool)

(assert (=> b!919846 m!853711))

(declare-fun m!853713 () Bool)

(assert (=> b!919846 m!853713))

(declare-fun m!853715 () Bool)

(assert (=> b!919846 m!853715))

(declare-fun m!853717 () Bool)

(assert (=> b!919846 m!853717))

(declare-fun m!853719 () Bool)

(assert (=> b!919846 m!853719))

(declare-fun m!853721 () Bool)

(assert (=> b!919846 m!853721))

(assert (=> b!919846 m!853707))

(assert (=> b!919846 m!853701))

(assert (=> b!919846 m!853717))

(declare-fun m!853723 () Bool)

(assert (=> b!919846 m!853723))

(declare-fun m!853725 () Bool)

(assert (=> start!78800 m!853725))

(declare-fun m!853727 () Bool)

(assert (=> start!78800 m!853727))

(declare-fun m!853729 () Bool)

(assert (=> start!78800 m!853729))

(declare-fun m!853731 () Bool)

(assert (=> b!919849 m!853731))

(declare-fun m!853733 () Bool)

(assert (=> b!919851 m!853733))

(declare-fun m!853735 () Bool)

(assert (=> b!919853 m!853735))

(declare-fun m!853737 () Bool)

(assert (=> b!919853 m!853737))

(declare-fun m!853739 () Bool)

(assert (=> b!919854 m!853739))

(declare-fun m!853741 () Bool)

(assert (=> mapNonEmpty!31038 m!853741))

(check-sat (not b_lambda!13515) (not start!78800) tp_is_empty!19521 (not b!919846) b_and!27765 (not b!919854) (not b!919851) (not b!919857) (not mapNonEmpty!31038) (not b_next!17013) (not b!919853) (not b!919852) (not b!919849))
(check-sat b_and!27765 (not b_next!17013))
