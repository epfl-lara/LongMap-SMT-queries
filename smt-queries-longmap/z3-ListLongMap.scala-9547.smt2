; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113146 () Bool)

(assert start!113146)

(declare-fun b_free!31197 () Bool)

(declare-fun b_next!31197 () Bool)

(assert (=> start!113146 (= b_free!31197 (not b_next!31197))))

(declare-fun tp!109396 () Bool)

(declare-fun b_and!50301 () Bool)

(assert (=> start!113146 (= tp!109396 b_and!50301)))

(declare-fun b!1341637 () Bool)

(declare-fun res!890064 () Bool)

(declare-fun e!763955 () Bool)

(assert (=> b!1341637 (=> (not res!890064) (not e!763955))))

(declare-datatypes ((array!91246 0))(
  ( (array!91247 (arr!44079 (Array (_ BitVec 32) (_ BitVec 64))) (size!44629 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91246)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341637 (= res!890064 (validKeyInArray!0 (select (arr!44079 _keys!1571) from!1960)))))

(declare-fun b!1341638 () Bool)

(declare-fun res!890056 () Bool)

(assert (=> b!1341638 (=> (not res!890056) (not e!763955))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341638 (= res!890056 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341639 () Bool)

(declare-fun res!890063 () Bool)

(assert (=> b!1341639 (=> (not res!890063) (not e!763955))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54699 0))(
  ( (V!54700 (val!18673 Int)) )
))
(declare-datatypes ((ValueCell!17700 0))(
  ( (ValueCellFull!17700 (v!21321 V!54699)) (EmptyCell!17700) )
))
(declare-datatypes ((array!91248 0))(
  ( (array!91249 (arr!44080 (Array (_ BitVec 32) ValueCell!17700)) (size!44630 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91248)

(assert (=> b!1341639 (= res!890063 (and (= (size!44630 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44629 _keys!1571) (size!44630 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57502 () Bool)

(declare-fun mapRes!57502 () Bool)

(assert (=> mapIsEmpty!57502 mapRes!57502))

(declare-fun b!1341640 () Bool)

(declare-fun res!890060 () Bool)

(assert (=> b!1341640 (=> (not res!890060) (not e!763955))))

(declare-fun minValue!1245 () V!54699)

(declare-fun zeroValue!1245 () V!54699)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24048 0))(
  ( (tuple2!24049 (_1!12035 (_ BitVec 64)) (_2!12035 V!54699)) )
))
(declare-datatypes ((List!31205 0))(
  ( (Nil!31202) (Cons!31201 (h!32410 tuple2!24048) (t!45613 List!31205)) )
))
(declare-datatypes ((ListLongMap!21705 0))(
  ( (ListLongMap!21706 (toList!10868 List!31205)) )
))
(declare-fun contains!9044 (ListLongMap!21705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5832 (array!91246 array!91248 (_ BitVec 32) (_ BitVec 32) V!54699 V!54699 (_ BitVec 32) Int) ListLongMap!21705)

(assert (=> b!1341640 (= res!890060 (contains!9044 (getCurrentListMap!5832 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341641 () Bool)

(declare-fun res!890062 () Bool)

(assert (=> b!1341641 (=> (not res!890062) (not e!763955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91246 (_ BitVec 32)) Bool)

(assert (=> b!1341641 (= res!890062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57502 () Bool)

(declare-fun tp!109395 () Bool)

(declare-fun e!763954 () Bool)

(assert (=> mapNonEmpty!57502 (= mapRes!57502 (and tp!109395 e!763954))))

(declare-fun mapValue!57502 () ValueCell!17700)

(declare-fun mapKey!57502 () (_ BitVec 32))

(declare-fun mapRest!57502 () (Array (_ BitVec 32) ValueCell!17700))

(assert (=> mapNonEmpty!57502 (= (arr!44080 _values!1303) (store mapRest!57502 mapKey!57502 mapValue!57502))))

(declare-fun res!890061 () Bool)

(assert (=> start!113146 (=> (not res!890061) (not e!763955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113146 (= res!890061 (validMask!0 mask!1977))))

(assert (=> start!113146 e!763955))

(declare-fun tp_is_empty!37197 () Bool)

(assert (=> start!113146 tp_is_empty!37197))

(assert (=> start!113146 true))

(declare-fun array_inv!33227 (array!91246) Bool)

(assert (=> start!113146 (array_inv!33227 _keys!1571)))

(declare-fun e!763957 () Bool)

(declare-fun array_inv!33228 (array!91248) Bool)

(assert (=> start!113146 (and (array_inv!33228 _values!1303) e!763957)))

(assert (=> start!113146 tp!109396))

(declare-fun b!1341642 () Bool)

(declare-fun e!763958 () Bool)

(assert (=> b!1341642 (= e!763958 tp_is_empty!37197)))

(declare-fun b!1341643 () Bool)

(assert (=> b!1341643 (= e!763955 (not true))))

(declare-fun lt!594177 () ListLongMap!21705)

(assert (=> b!1341643 (contains!9044 lt!594177 k0!1142)))

(declare-datatypes ((Unit!44039 0))(
  ( (Unit!44040) )
))
(declare-fun lt!594176 () Unit!44039)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!350 ((_ BitVec 64) (_ BitVec 64) V!54699 ListLongMap!21705) Unit!44039)

(assert (=> b!1341643 (= lt!594176 (lemmaInListMapAfterAddingDiffThenInBefore!350 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594177))))

(declare-fun +!4781 (ListLongMap!21705 tuple2!24048) ListLongMap!21705)

(declare-fun getCurrentListMapNoExtraKeys!6423 (array!91246 array!91248 (_ BitVec 32) (_ BitVec 32) V!54699 V!54699 (_ BitVec 32) Int) ListLongMap!21705)

(declare-fun get!22252 (ValueCell!17700 V!54699) V!54699)

(declare-fun dynLambda!3720 (Int (_ BitVec 64)) V!54699)

(assert (=> b!1341643 (= lt!594177 (+!4781 (getCurrentListMapNoExtraKeys!6423 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24049 (select (arr!44079 _keys!1571) from!1960) (get!22252 (select (arr!44080 _values!1303) from!1960) (dynLambda!3720 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341644 () Bool)

(declare-fun res!890057 () Bool)

(assert (=> b!1341644 (=> (not res!890057) (not e!763955))))

(declare-datatypes ((List!31206 0))(
  ( (Nil!31203) (Cons!31202 (h!32411 (_ BitVec 64)) (t!45614 List!31206)) )
))
(declare-fun arrayNoDuplicates!0 (array!91246 (_ BitVec 32) List!31206) Bool)

(assert (=> b!1341644 (= res!890057 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31203))))

(declare-fun b!1341645 () Bool)

(declare-fun res!890059 () Bool)

(assert (=> b!1341645 (=> (not res!890059) (not e!763955))))

(assert (=> b!1341645 (= res!890059 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44629 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341646 () Bool)

(declare-fun res!890058 () Bool)

(assert (=> b!1341646 (=> (not res!890058) (not e!763955))))

(assert (=> b!1341646 (= res!890058 (not (= (select (arr!44079 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341647 () Bool)

(assert (=> b!1341647 (= e!763954 tp_is_empty!37197)))

(declare-fun b!1341648 () Bool)

(assert (=> b!1341648 (= e!763957 (and e!763958 mapRes!57502))))

(declare-fun condMapEmpty!57502 () Bool)

(declare-fun mapDefault!57502 () ValueCell!17700)

(assert (=> b!1341648 (= condMapEmpty!57502 (= (arr!44080 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17700)) mapDefault!57502)))))

(assert (= (and start!113146 res!890061) b!1341639))

(assert (= (and b!1341639 res!890063) b!1341641))

(assert (= (and b!1341641 res!890062) b!1341644))

(assert (= (and b!1341644 res!890057) b!1341645))

(assert (= (and b!1341645 res!890059) b!1341640))

(assert (= (and b!1341640 res!890060) b!1341646))

(assert (= (and b!1341646 res!890058) b!1341637))

(assert (= (and b!1341637 res!890064) b!1341638))

(assert (= (and b!1341638 res!890056) b!1341643))

(assert (= (and b!1341648 condMapEmpty!57502) mapIsEmpty!57502))

(assert (= (and b!1341648 (not condMapEmpty!57502)) mapNonEmpty!57502))

(get-info :version)

(assert (= (and mapNonEmpty!57502 ((_ is ValueCellFull!17700) mapValue!57502)) b!1341647))

(assert (= (and b!1341648 ((_ is ValueCellFull!17700) mapDefault!57502)) b!1341642))

(assert (= start!113146 b!1341648))

(declare-fun b_lambda!24373 () Bool)

(assert (=> (not b_lambda!24373) (not b!1341643)))

(declare-fun t!45612 () Bool)

(declare-fun tb!12211 () Bool)

(assert (=> (and start!113146 (= defaultEntry!1306 defaultEntry!1306) t!45612) tb!12211))

(declare-fun result!25513 () Bool)

(assert (=> tb!12211 (= result!25513 tp_is_empty!37197)))

(assert (=> b!1341643 t!45612))

(declare-fun b_and!50303 () Bool)

(assert (= b_and!50301 (and (=> t!45612 result!25513) b_and!50303)))

(declare-fun m!1229267 () Bool)

(assert (=> b!1341644 m!1229267))

(declare-fun m!1229269 () Bool)

(assert (=> mapNonEmpty!57502 m!1229269))

(declare-fun m!1229271 () Bool)

(assert (=> b!1341640 m!1229271))

(assert (=> b!1341640 m!1229271))

(declare-fun m!1229273 () Bool)

(assert (=> b!1341640 m!1229273))

(declare-fun m!1229275 () Bool)

(assert (=> b!1341646 m!1229275))

(declare-fun m!1229277 () Bool)

(assert (=> start!113146 m!1229277))

(declare-fun m!1229279 () Bool)

(assert (=> start!113146 m!1229279))

(declare-fun m!1229281 () Bool)

(assert (=> start!113146 m!1229281))

(declare-fun m!1229283 () Bool)

(assert (=> b!1341643 m!1229283))

(declare-fun m!1229285 () Bool)

(assert (=> b!1341643 m!1229285))

(declare-fun m!1229287 () Bool)

(assert (=> b!1341643 m!1229287))

(declare-fun m!1229289 () Bool)

(assert (=> b!1341643 m!1229289))

(declare-fun m!1229291 () Bool)

(assert (=> b!1341643 m!1229291))

(assert (=> b!1341643 m!1229283))

(declare-fun m!1229293 () Bool)

(assert (=> b!1341643 m!1229293))

(assert (=> b!1341643 m!1229285))

(assert (=> b!1341643 m!1229287))

(declare-fun m!1229295 () Bool)

(assert (=> b!1341643 m!1229295))

(assert (=> b!1341643 m!1229275))

(assert (=> b!1341637 m!1229275))

(assert (=> b!1341637 m!1229275))

(declare-fun m!1229297 () Bool)

(assert (=> b!1341637 m!1229297))

(declare-fun m!1229299 () Bool)

(assert (=> b!1341641 m!1229299))

(check-sat (not b!1341641) (not b!1341644) b_and!50303 (not b!1341643) (not b!1341637) (not b_lambda!24373) tp_is_empty!37197 (not start!113146) (not b_next!31197) (not b!1341640) (not mapNonEmpty!57502))
(check-sat b_and!50303 (not b_next!31197))
