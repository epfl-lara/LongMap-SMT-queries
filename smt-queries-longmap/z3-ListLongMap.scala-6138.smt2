; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78918 () Bool)

(assert start!78918)

(declare-fun b_free!17149 () Bool)

(declare-fun b_next!17149 () Bool)

(assert (=> start!78918 (= b_free!17149 (not b_next!17149))))

(declare-fun tp!59889 () Bool)

(declare-fun b_and!28009 () Bool)

(assert (=> start!78918 (= tp!59889 b_and!28009)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!922990 () Bool)

(declare-fun e!517843 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55263 0))(
  ( (array!55264 (arr!26577 (Array (_ BitVec 32) (_ BitVec 64))) (size!27038 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55263)

(declare-fun arrayContainsKey!0 (array!55263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922990 (= e!517843 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922992 () Bool)

(declare-datatypes ((Unit!31060 0))(
  ( (Unit!31061) )
))
(declare-fun e!517839 () Unit!31060)

(declare-fun Unit!31062 () Unit!31060)

(assert (=> b!922992 (= e!517839 Unit!31062)))

(declare-fun b!922993 () Bool)

(declare-fun e!517844 () Bool)

(declare-fun e!517847 () Bool)

(assert (=> b!922993 (= e!517844 e!517847)))

(declare-fun res!622438 () Bool)

(assert (=> b!922993 (=> (not res!622438) (not e!517847))))

(declare-datatypes ((V!31175 0))(
  ( (V!31176 (val!9879 Int)) )
))
(declare-fun lt!414470 () V!31175)

(declare-fun v!791 () V!31175)

(assert (=> b!922993 (= res!622438 (and (= lt!414470 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12924 0))(
  ( (tuple2!12925 (_1!6473 (_ BitVec 64)) (_2!6473 V!31175)) )
))
(declare-datatypes ((List!18705 0))(
  ( (Nil!18702) (Cons!18701 (h!19847 tuple2!12924) (t!26575 List!18705)) )
))
(declare-datatypes ((ListLongMap!11611 0))(
  ( (ListLongMap!11612 (toList!5821 List!18705)) )
))
(declare-fun lt!414463 () ListLongMap!11611)

(declare-fun apply!634 (ListLongMap!11611 (_ BitVec 64)) V!31175)

(assert (=> b!922993 (= lt!414470 (apply!634 lt!414463 k0!1099))))

(declare-fun b!922994 () Bool)

(declare-fun e!517842 () Unit!31060)

(assert (=> b!922994 (= e!517842 e!517839)))

(declare-fun lt!414469 () (_ BitVec 64))

(assert (=> b!922994 (= lt!414469 (select (arr!26577 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96164 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922994 (= c!96164 (validKeyInArray!0 lt!414469))))

(declare-fun b!922995 () Bool)

(declare-fun res!622437 () Bool)

(declare-fun e!517840 () Bool)

(assert (=> b!922995 (=> (not res!622437) (not e!517840))))

(declare-datatypes ((List!18706 0))(
  ( (Nil!18703) (Cons!18702 (h!19848 (_ BitVec 64)) (t!26576 List!18706)) )
))
(declare-fun arrayNoDuplicates!0 (array!55263 (_ BitVec 32) List!18706) Bool)

(assert (=> b!922995 (= res!622437 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18703))))

(declare-fun b!922996 () Bool)

(declare-fun e!517838 () Bool)

(assert (=> b!922996 (= e!517847 e!517838)))

(declare-fun res!622434 () Bool)

(assert (=> b!922996 (=> (not res!622434) (not e!517838))))

(assert (=> b!922996 (= res!622434 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27038 _keys!1487)))))

(declare-fun lt!414467 () Unit!31060)

(assert (=> b!922996 (= lt!414467 e!517842)))

(declare-fun c!96165 () Bool)

(assert (=> b!922996 (= c!96165 (validKeyInArray!0 k0!1099))))

(declare-fun b!922997 () Bool)

(declare-fun lt!414466 () ListLongMap!11611)

(assert (=> b!922997 (= (apply!634 lt!414466 k0!1099) lt!414470)))

(declare-fun lt!414475 () V!31175)

(declare-fun lt!414476 () Unit!31060)

(declare-fun addApplyDifferent!352 (ListLongMap!11611 (_ BitVec 64) V!31175 (_ BitVec 64)) Unit!31060)

(assert (=> b!922997 (= lt!414476 (addApplyDifferent!352 lt!414463 lt!414469 lt!414475 k0!1099))))

(assert (=> b!922997 (not (= lt!414469 k0!1099))))

(declare-fun lt!414464 () Unit!31060)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55263 (_ BitVec 64) (_ BitVec 32) List!18706) Unit!31060)

(assert (=> b!922997 (= lt!414464 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703))))

(assert (=> b!922997 e!517843))

(declare-fun c!96166 () Bool)

(assert (=> b!922997 (= c!96166 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!414473 () Unit!31060)

(declare-datatypes ((ValueCell!9347 0))(
  ( (ValueCellFull!9347 (v!12396 V!31175)) (EmptyCell!9347) )
))
(declare-datatypes ((array!55265 0))(
  ( (array!55266 (arr!26578 (Array (_ BitVec 32) ValueCell!9347)) (size!27039 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55265)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31175)

(declare-fun minValue!1173 () V!31175)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!212 (array!55263 array!55265 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 64) (_ BitVec 32) Int) Unit!31060)

(assert (=> b!922997 (= lt!414473 (lemmaListMapContainsThenArrayContainsFrom!212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922997 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703)))

(declare-fun lt!414471 () Unit!31060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55263 (_ BitVec 32) (_ BitVec 32)) Unit!31060)

(assert (=> b!922997 (= lt!414471 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4835 (ListLongMap!11611 (_ BitVec 64)) Bool)

(assert (=> b!922997 (contains!4835 lt!414466 k0!1099)))

(declare-fun lt!414465 () tuple2!12924)

(declare-fun +!2724 (ListLongMap!11611 tuple2!12924) ListLongMap!11611)

(assert (=> b!922997 (= lt!414466 (+!2724 lt!414463 lt!414465))))

(declare-fun lt!414472 () Unit!31060)

(declare-fun addStillContains!421 (ListLongMap!11611 (_ BitVec 64) V!31175 (_ BitVec 64)) Unit!31060)

(assert (=> b!922997 (= lt!414472 (addStillContains!421 lt!414463 lt!414469 lt!414475 k0!1099))))

(declare-fun getCurrentListMap!3009 (array!55263 array!55265 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 32) Int) ListLongMap!11611)

(assert (=> b!922997 (= (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2724 (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414465))))

(assert (=> b!922997 (= lt!414465 (tuple2!12925 lt!414469 lt!414475))))

(declare-fun get!13969 (ValueCell!9347 V!31175) V!31175)

(declare-fun dynLambda!1480 (Int (_ BitVec 64)) V!31175)

(assert (=> b!922997 (= lt!414475 (get!13969 (select (arr!26578 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1480 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414474 () Unit!31060)

(declare-fun lemmaListMapRecursiveValidKeyArray!88 (array!55263 array!55265 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 32) Int) Unit!31060)

(assert (=> b!922997 (= lt!414474 (lemmaListMapRecursiveValidKeyArray!88 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!922997 (= e!517839 lt!414476)))

(declare-fun b!922998 () Bool)

(declare-fun e!517846 () Bool)

(declare-fun e!517848 () Bool)

(declare-fun mapRes!31242 () Bool)

(assert (=> b!922998 (= e!517846 (and e!517848 mapRes!31242))))

(declare-fun condMapEmpty!31242 () Bool)

(declare-fun mapDefault!31242 () ValueCell!9347)

(assert (=> b!922998 (= condMapEmpty!31242 (= (arr!26578 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9347)) mapDefault!31242)))))

(declare-fun b!922999 () Bool)

(declare-fun e!517845 () Bool)

(assert (=> b!922999 (= e!517845 false)))

(declare-fun lt!414462 () V!31175)

(declare-fun lt!414468 () ListLongMap!11611)

(assert (=> b!922999 (= lt!414462 (apply!634 lt!414468 k0!1099))))

(declare-fun b!923000 () Bool)

(declare-fun tp_is_empty!19657 () Bool)

(assert (=> b!923000 (= e!517848 tp_is_empty!19657)))

(declare-fun mapIsEmpty!31242 () Bool)

(assert (=> mapIsEmpty!31242 mapRes!31242))

(declare-fun b!923001 () Bool)

(declare-fun e!517837 () Bool)

(assert (=> b!923001 (= e!517837 tp_is_empty!19657)))

(declare-fun b!923002 () Bool)

(declare-fun Unit!31063 () Unit!31060)

(assert (=> b!923002 (= e!517842 Unit!31063)))

(declare-fun b!923003 () Bool)

(declare-fun res!622439 () Bool)

(assert (=> b!923003 (=> (not res!622439) (not e!517840))))

(assert (=> b!923003 (= res!622439 (and (= (size!27039 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27038 _keys!1487) (size!27039 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922991 () Bool)

(assert (=> b!922991 (= e!517840 e!517844)))

(declare-fun res!622432 () Bool)

(assert (=> b!922991 (=> (not res!622432) (not e!517844))))

(assert (=> b!922991 (= res!622432 (contains!4835 lt!414463 k0!1099))))

(assert (=> b!922991 (= lt!414463 (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!622435 () Bool)

(assert (=> start!78918 (=> (not res!622435) (not e!517840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78918 (= res!622435 (validMask!0 mask!1881))))

(assert (=> start!78918 e!517840))

(assert (=> start!78918 true))

(assert (=> start!78918 tp_is_empty!19657))

(declare-fun array_inv!20786 (array!55265) Bool)

(assert (=> start!78918 (and (array_inv!20786 _values!1231) e!517846)))

(assert (=> start!78918 tp!59889))

(declare-fun array_inv!20787 (array!55263) Bool)

(assert (=> start!78918 (array_inv!20787 _keys!1487)))

(declare-fun b!923004 () Bool)

(assert (=> b!923004 (= e!517843 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923005 () Bool)

(declare-fun res!622431 () Bool)

(assert (=> b!923005 (=> (not res!622431) (not e!517840))))

(assert (=> b!923005 (= res!622431 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27038 _keys!1487))))))

(declare-fun b!923006 () Bool)

(assert (=> b!923006 (= e!517838 e!517845)))

(declare-fun res!622433 () Bool)

(assert (=> b!923006 (=> (not res!622433) (not e!517845))))

(assert (=> b!923006 (= res!622433 (contains!4835 lt!414468 k0!1099))))

(assert (=> b!923006 (= lt!414468 (getCurrentListMap!3009 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31242 () Bool)

(declare-fun tp!59888 () Bool)

(assert (=> mapNonEmpty!31242 (= mapRes!31242 (and tp!59888 e!517837))))

(declare-fun mapRest!31242 () (Array (_ BitVec 32) ValueCell!9347))

(declare-fun mapKey!31242 () (_ BitVec 32))

(declare-fun mapValue!31242 () ValueCell!9347)

(assert (=> mapNonEmpty!31242 (= (arr!26578 _values!1231) (store mapRest!31242 mapKey!31242 mapValue!31242))))

(declare-fun b!923007 () Bool)

(declare-fun res!622436 () Bool)

(assert (=> b!923007 (=> (not res!622436) (not e!517840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55263 (_ BitVec 32)) Bool)

(assert (=> b!923007 (= res!622436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78918 res!622435) b!923003))

(assert (= (and b!923003 res!622439) b!923007))

(assert (= (and b!923007 res!622436) b!922995))

(assert (= (and b!922995 res!622437) b!923005))

(assert (= (and b!923005 res!622431) b!922991))

(assert (= (and b!922991 res!622432) b!922993))

(assert (= (and b!922993 res!622438) b!922996))

(assert (= (and b!922996 c!96165) b!922994))

(assert (= (and b!922996 (not c!96165)) b!923002))

(assert (= (and b!922994 c!96164) b!922997))

(assert (= (and b!922994 (not c!96164)) b!922992))

(assert (= (and b!922997 c!96166) b!922990))

(assert (= (and b!922997 (not c!96166)) b!923004))

(assert (= (and b!922996 res!622434) b!923006))

(assert (= (and b!923006 res!622433) b!922999))

(assert (= (and b!922998 condMapEmpty!31242) mapIsEmpty!31242))

(assert (= (and b!922998 (not condMapEmpty!31242)) mapNonEmpty!31242))

(get-info :version)

(assert (= (and mapNonEmpty!31242 ((_ is ValueCellFull!9347) mapValue!31242)) b!923001))

(assert (= (and b!922998 ((_ is ValueCellFull!9347) mapDefault!31242)) b!923000))

(assert (= start!78918 b!922998))

(declare-fun b_lambda!13633 () Bool)

(assert (=> (not b_lambda!13633) (not b!922997)))

(declare-fun t!26574 () Bool)

(declare-fun tb!5721 () Bool)

(assert (=> (and start!78918 (= defaultEntry!1235 defaultEntry!1235) t!26574) tb!5721))

(declare-fun result!11273 () Bool)

(assert (=> tb!5721 (= result!11273 tp_is_empty!19657)))

(assert (=> b!922997 t!26574))

(declare-fun b_and!28011 () Bool)

(assert (= b_and!28009 (and (=> t!26574 result!11273) b_and!28011)))

(declare-fun m!856651 () Bool)

(assert (=> b!922994 m!856651))

(declare-fun m!856653 () Bool)

(assert (=> b!922994 m!856653))

(declare-fun m!856655 () Bool)

(assert (=> b!922997 m!856655))

(declare-fun m!856657 () Bool)

(assert (=> b!922997 m!856657))

(declare-fun m!856659 () Bool)

(assert (=> b!922997 m!856659))

(declare-fun m!856661 () Bool)

(assert (=> b!922997 m!856661))

(declare-fun m!856663 () Bool)

(assert (=> b!922997 m!856663))

(declare-fun m!856665 () Bool)

(assert (=> b!922997 m!856665))

(declare-fun m!856667 () Bool)

(assert (=> b!922997 m!856667))

(declare-fun m!856669 () Bool)

(assert (=> b!922997 m!856669))

(declare-fun m!856671 () Bool)

(assert (=> b!922997 m!856671))

(assert (=> b!922997 m!856663))

(assert (=> b!922997 m!856669))

(declare-fun m!856673 () Bool)

(assert (=> b!922997 m!856673))

(declare-fun m!856675 () Bool)

(assert (=> b!922997 m!856675))

(declare-fun m!856677 () Bool)

(assert (=> b!922997 m!856677))

(declare-fun m!856679 () Bool)

(assert (=> b!922997 m!856679))

(assert (=> b!922997 m!856655))

(declare-fun m!856681 () Bool)

(assert (=> b!922997 m!856681))

(declare-fun m!856683 () Bool)

(assert (=> b!922997 m!856683))

(declare-fun m!856685 () Bool)

(assert (=> b!922997 m!856685))

(declare-fun m!856687 () Bool)

(assert (=> b!922995 m!856687))

(declare-fun m!856689 () Bool)

(assert (=> b!922993 m!856689))

(declare-fun m!856691 () Bool)

(assert (=> b!922991 m!856691))

(declare-fun m!856693 () Bool)

(assert (=> b!922991 m!856693))

(declare-fun m!856695 () Bool)

(assert (=> b!923007 m!856695))

(declare-fun m!856697 () Bool)

(assert (=> mapNonEmpty!31242 m!856697))

(declare-fun m!856699 () Bool)

(assert (=> b!922999 m!856699))

(declare-fun m!856701 () Bool)

(assert (=> b!922996 m!856701))

(declare-fun m!856703 () Bool)

(assert (=> start!78918 m!856703))

(declare-fun m!856705 () Bool)

(assert (=> start!78918 m!856705))

(declare-fun m!856707 () Bool)

(assert (=> start!78918 m!856707))

(declare-fun m!856709 () Bool)

(assert (=> b!923006 m!856709))

(assert (=> b!923006 m!856675))

(declare-fun m!856711 () Bool)

(assert (=> b!922990 m!856711))

(check-sat (not b!922994) (not b!923006) (not b!922991) (not b!922999) (not b!922993) (not b!922995) (not b!922997) (not b!922996) (not start!78918) (not b!922990) tp_is_empty!19657 (not b_next!17149) (not b_lambda!13633) (not b!923007) b_and!28011 (not mapNonEmpty!31242))
(check-sat b_and!28011 (not b_next!17149))
