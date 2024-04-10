; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79654 () Bool)

(assert start!79654)

(declare-fun b_free!17703 () Bool)

(declare-fun b_next!17703 () Bool)

(assert (=> start!79654 (= b_free!17703 (not b_next!17703))))

(declare-fun tp!61565 () Bool)

(declare-fun b_and!28997 () Bool)

(assert (=> start!79654 (= tp!61565 b_and!28997)))

(declare-fun b!936538 () Bool)

(declare-fun e!525875 () Bool)

(declare-fun e!525874 () Bool)

(assert (=> b!936538 (= e!525875 e!525874)))

(declare-fun res!630574 () Bool)

(assert (=> b!936538 (=> (not res!630574) (not e!525874))))

(declare-datatypes ((V!31913 0))(
  ( (V!31914 (val!10156 Int)) )
))
(declare-datatypes ((tuple2!13336 0))(
  ( (tuple2!13337 (_1!6679 (_ BitVec 64)) (_2!6679 V!31913)) )
))
(declare-datatypes ((List!19116 0))(
  ( (Nil!19113) (Cons!19112 (h!20258 tuple2!13336) (t!27363 List!19116)) )
))
(declare-datatypes ((ListLongMap!12033 0))(
  ( (ListLongMap!12034 (toList!6032 List!19116)) )
))
(declare-fun lt!422307 () ListLongMap!12033)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5092 (ListLongMap!12033 (_ BitVec 64)) Bool)

(assert (=> b!936538 (= res!630574 (contains!5092 lt!422307 k0!1099))))

(declare-datatypes ((array!56362 0))(
  ( (array!56363 (arr!27121 (Array (_ BitVec 32) (_ BitVec 64))) (size!27580 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56362)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9624 0))(
  ( (ValueCellFull!9624 (v!12681 V!31913)) (EmptyCell!9624) )
))
(declare-datatypes ((array!56364 0))(
  ( (array!56365 (arr!27122 (Array (_ BitVec 32) ValueCell!9624)) (size!27581 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56364)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31913)

(declare-fun minValue!1173 () V!31913)

(declare-fun getCurrentListMap!3268 (array!56362 array!56364 (_ BitVec 32) (_ BitVec 32) V!31913 V!31913 (_ BitVec 32) Int) ListLongMap!12033)

(assert (=> b!936538 (= lt!422307 (getCurrentListMap!3268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936539 () Bool)

(declare-fun e!525870 () Bool)

(assert (=> b!936539 (= e!525874 e!525870)))

(declare-fun res!630575 () Bool)

(assert (=> b!936539 (=> (not res!630575) (not e!525870))))

(declare-fun v!791 () V!31913)

(declare-fun lt!422311 () V!31913)

(assert (=> b!936539 (= res!630575 (and (= lt!422311 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!834 (ListLongMap!12033 (_ BitVec 64)) V!31913)

(assert (=> b!936539 (= lt!422311 (apply!834 lt!422307 k0!1099))))

(declare-fun b!936540 () Bool)

(assert (=> b!936540 (= e!525870 false)))

(declare-datatypes ((Unit!31592 0))(
  ( (Unit!31593) )
))
(declare-fun lt!422312 () Unit!31592)

(declare-fun e!525876 () Unit!31592)

(assert (=> b!936540 (= lt!422312 e!525876)))

(declare-fun c!97414 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936540 (= c!97414 (validKeyInArray!0 k0!1099))))

(declare-fun res!630580 () Bool)

(assert (=> start!79654 (=> (not res!630580) (not e!525875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79654 (= res!630580 (validMask!0 mask!1881))))

(assert (=> start!79654 e!525875))

(assert (=> start!79654 true))

(declare-fun tp_is_empty!20211 () Bool)

(assert (=> start!79654 tp_is_empty!20211))

(declare-fun e!525873 () Bool)

(declare-fun array_inv!21102 (array!56364) Bool)

(assert (=> start!79654 (and (array_inv!21102 _values!1231) e!525873)))

(assert (=> start!79654 tp!61565))

(declare-fun array_inv!21103 (array!56362) Bool)

(assert (=> start!79654 (array_inv!21103 _keys!1487)))

(declare-fun b!936541 () Bool)

(declare-fun e!525869 () Unit!31592)

(declare-fun Unit!31594 () Unit!31592)

(assert (=> b!936541 (= e!525869 Unit!31594)))

(declare-fun b!936542 () Bool)

(declare-fun res!630576 () Bool)

(assert (=> b!936542 (=> (not res!630576) (not e!525875))))

(assert (=> b!936542 (= res!630576 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27580 _keys!1487))))))

(declare-fun b!936543 () Bool)

(declare-fun e!525868 () Bool)

(assert (=> b!936543 (= e!525868 tp_is_empty!20211)))

(declare-fun b!936544 () Bool)

(declare-fun Unit!31595 () Unit!31592)

(assert (=> b!936544 (= e!525876 Unit!31595)))

(declare-fun b!936545 () Bool)

(declare-fun e!525871 () Bool)

(assert (=> b!936545 (= e!525871 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936546 () Bool)

(declare-fun mapRes!32088 () Bool)

(assert (=> b!936546 (= e!525873 (and e!525868 mapRes!32088))))

(declare-fun condMapEmpty!32088 () Bool)

(declare-fun mapDefault!32088 () ValueCell!9624)

(assert (=> b!936546 (= condMapEmpty!32088 (= (arr!27122 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9624)) mapDefault!32088)))))

(declare-fun b!936547 () Bool)

(declare-fun lt!422304 () ListLongMap!12033)

(assert (=> b!936547 (= (apply!834 lt!422304 k0!1099) lt!422311)))

(declare-fun lt!422301 () Unit!31592)

(declare-fun lt!422306 () (_ BitVec 64))

(declare-fun lt!422308 () V!31913)

(declare-fun addApplyDifferent!423 (ListLongMap!12033 (_ BitVec 64) V!31913 (_ BitVec 64)) Unit!31592)

(assert (=> b!936547 (= lt!422301 (addApplyDifferent!423 lt!422307 lt!422306 lt!422308 k0!1099))))

(assert (=> b!936547 (not (= lt!422306 k0!1099))))

(declare-fun lt!422309 () Unit!31592)

(declare-datatypes ((List!19117 0))(
  ( (Nil!19114) (Cons!19113 (h!20259 (_ BitVec 64)) (t!27364 List!19117)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56362 (_ BitVec 64) (_ BitVec 32) List!19117) Unit!31592)

(assert (=> b!936547 (= lt!422309 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19114))))

(assert (=> b!936547 e!525871))

(declare-fun c!97415 () Bool)

(assert (=> b!936547 (= c!97415 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422310 () Unit!31592)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!296 (array!56362 array!56364 (_ BitVec 32) (_ BitVec 32) V!31913 V!31913 (_ BitVec 64) (_ BitVec 32) Int) Unit!31592)

(assert (=> b!936547 (= lt!422310 (lemmaListMapContainsThenArrayContainsFrom!296 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56362 (_ BitVec 32) List!19117) Bool)

(assert (=> b!936547 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19114)))

(declare-fun lt!422305 () Unit!31592)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56362 (_ BitVec 32) (_ BitVec 32)) Unit!31592)

(assert (=> b!936547 (= lt!422305 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936547 (contains!5092 lt!422304 k0!1099)))

(declare-fun lt!422303 () tuple2!13336)

(declare-fun +!2824 (ListLongMap!12033 tuple2!13336) ListLongMap!12033)

(assert (=> b!936547 (= lt!422304 (+!2824 lt!422307 lt!422303))))

(declare-fun lt!422302 () Unit!31592)

(declare-fun addStillContains!543 (ListLongMap!12033 (_ BitVec 64) V!31913 (_ BitVec 64)) Unit!31592)

(assert (=> b!936547 (= lt!422302 (addStillContains!543 lt!422307 lt!422306 lt!422308 k0!1099))))

(assert (=> b!936547 (= (getCurrentListMap!3268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2824 (getCurrentListMap!3268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422303))))

(assert (=> b!936547 (= lt!422303 (tuple2!13337 lt!422306 lt!422308))))

(declare-fun get!14296 (ValueCell!9624 V!31913) V!31913)

(declare-fun dynLambda!1613 (Int (_ BitVec 64)) V!31913)

(assert (=> b!936547 (= lt!422308 (get!14296 (select (arr!27122 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1613 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422300 () Unit!31592)

(declare-fun lemmaListMapRecursiveValidKeyArray!214 (array!56362 array!56364 (_ BitVec 32) (_ BitVec 32) V!31913 V!31913 (_ BitVec 32) Int) Unit!31592)

(assert (=> b!936547 (= lt!422300 (lemmaListMapRecursiveValidKeyArray!214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936547 (= e!525869 lt!422301)))

(declare-fun b!936548 () Bool)

(declare-fun res!630577 () Bool)

(assert (=> b!936548 (=> (not res!630577) (not e!525875))))

(assert (=> b!936548 (= res!630577 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19114))))

(declare-fun b!936549 () Bool)

(declare-fun res!630578 () Bool)

(assert (=> b!936549 (=> (not res!630578) (not e!525875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56362 (_ BitVec 32)) Bool)

(assert (=> b!936549 (= res!630578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936550 () Bool)

(assert (=> b!936550 (= e!525876 e!525869)))

(assert (=> b!936550 (= lt!422306 (select (arr!27121 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97416 () Bool)

(assert (=> b!936550 (= c!97416 (validKeyInArray!0 lt!422306))))

(declare-fun b!936551 () Bool)

(declare-fun arrayContainsKey!0 (array!56362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936551 (= e!525871 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936552 () Bool)

(declare-fun e!525867 () Bool)

(assert (=> b!936552 (= e!525867 tp_is_empty!20211)))

(declare-fun mapIsEmpty!32088 () Bool)

(assert (=> mapIsEmpty!32088 mapRes!32088))

(declare-fun b!936553 () Bool)

(declare-fun res!630579 () Bool)

(assert (=> b!936553 (=> (not res!630579) (not e!525875))))

(assert (=> b!936553 (= res!630579 (and (= (size!27581 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27580 _keys!1487) (size!27581 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32088 () Bool)

(declare-fun tp!61564 () Bool)

(assert (=> mapNonEmpty!32088 (= mapRes!32088 (and tp!61564 e!525867))))

(declare-fun mapValue!32088 () ValueCell!9624)

(declare-fun mapRest!32088 () (Array (_ BitVec 32) ValueCell!9624))

(declare-fun mapKey!32088 () (_ BitVec 32))

(assert (=> mapNonEmpty!32088 (= (arr!27122 _values!1231) (store mapRest!32088 mapKey!32088 mapValue!32088))))

(assert (= (and start!79654 res!630580) b!936553))

(assert (= (and b!936553 res!630579) b!936549))

(assert (= (and b!936549 res!630578) b!936548))

(assert (= (and b!936548 res!630577) b!936542))

(assert (= (and b!936542 res!630576) b!936538))

(assert (= (and b!936538 res!630574) b!936539))

(assert (= (and b!936539 res!630575) b!936540))

(assert (= (and b!936540 c!97414) b!936550))

(assert (= (and b!936540 (not c!97414)) b!936544))

(assert (= (and b!936550 c!97416) b!936547))

(assert (= (and b!936550 (not c!97416)) b!936541))

(assert (= (and b!936547 c!97415) b!936551))

(assert (= (and b!936547 (not c!97415)) b!936545))

(assert (= (and b!936546 condMapEmpty!32088) mapIsEmpty!32088))

(assert (= (and b!936546 (not condMapEmpty!32088)) mapNonEmpty!32088))

(get-info :version)

(assert (= (and mapNonEmpty!32088 ((_ is ValueCellFull!9624) mapValue!32088)) b!936552))

(assert (= (and b!936546 ((_ is ValueCellFull!9624) mapDefault!32088)) b!936543))

(assert (= start!79654 b!936546))

(declare-fun b_lambda!14109 () Bool)

(assert (=> (not b_lambda!14109) (not b!936547)))

(declare-fun t!27362 () Bool)

(declare-fun tb!6097 () Bool)

(assert (=> (and start!79654 (= defaultEntry!1235 defaultEntry!1235) t!27362) tb!6097))

(declare-fun result!12027 () Bool)

(assert (=> tb!6097 (= result!12027 tp_is_empty!20211)))

(assert (=> b!936547 t!27362))

(declare-fun b_and!28999 () Bool)

(assert (= b_and!28997 (and (=> t!27362 result!12027) b_and!28999)))

(declare-fun m!871157 () Bool)

(assert (=> b!936547 m!871157))

(declare-fun m!871159 () Bool)

(assert (=> b!936547 m!871159))

(declare-fun m!871161 () Bool)

(assert (=> b!936547 m!871161))

(declare-fun m!871163 () Bool)

(assert (=> b!936547 m!871163))

(assert (=> b!936547 m!871159))

(declare-fun m!871165 () Bool)

(assert (=> b!936547 m!871165))

(declare-fun m!871167 () Bool)

(assert (=> b!936547 m!871167))

(declare-fun m!871169 () Bool)

(assert (=> b!936547 m!871169))

(declare-fun m!871171 () Bool)

(assert (=> b!936547 m!871171))

(declare-fun m!871173 () Bool)

(assert (=> b!936547 m!871173))

(declare-fun m!871175 () Bool)

(assert (=> b!936547 m!871175))

(declare-fun m!871177 () Bool)

(assert (=> b!936547 m!871177))

(declare-fun m!871179 () Bool)

(assert (=> b!936547 m!871179))

(declare-fun m!871181 () Bool)

(assert (=> b!936547 m!871181))

(declare-fun m!871183 () Bool)

(assert (=> b!936547 m!871183))

(assert (=> b!936547 m!871165))

(declare-fun m!871185 () Bool)

(assert (=> b!936547 m!871185))

(assert (=> b!936547 m!871175))

(declare-fun m!871187 () Bool)

(assert (=> b!936547 m!871187))

(declare-fun m!871189 () Bool)

(assert (=> b!936551 m!871189))

(declare-fun m!871191 () Bool)

(assert (=> start!79654 m!871191))

(declare-fun m!871193 () Bool)

(assert (=> start!79654 m!871193))

(declare-fun m!871195 () Bool)

(assert (=> start!79654 m!871195))

(declare-fun m!871197 () Bool)

(assert (=> b!936548 m!871197))

(declare-fun m!871199 () Bool)

(assert (=> b!936538 m!871199))

(declare-fun m!871201 () Bool)

(assert (=> b!936538 m!871201))

(declare-fun m!871203 () Bool)

(assert (=> b!936539 m!871203))

(declare-fun m!871205 () Bool)

(assert (=> b!936549 m!871205))

(declare-fun m!871207 () Bool)

(assert (=> mapNonEmpty!32088 m!871207))

(declare-fun m!871209 () Bool)

(assert (=> b!936540 m!871209))

(declare-fun m!871211 () Bool)

(assert (=> b!936550 m!871211))

(declare-fun m!871213 () Bool)

(assert (=> b!936550 m!871213))

(check-sat (not mapNonEmpty!32088) (not b!936548) b_and!28999 tp_is_empty!20211 (not b!936550) (not b_lambda!14109) (not b!936547) (not b!936539) (not b_next!17703) (not b!936551) (not b!936540) (not b!936538) (not start!79654) (not b!936549))
(check-sat b_and!28999 (not b_next!17703))
