; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83836 () Bool)

(assert start!83836)

(declare-fun b_free!19663 () Bool)

(declare-fun b_next!19663 () Bool)

(assert (=> start!83836 (= b_free!19663 (not b_next!19663))))

(declare-fun tp!68432 () Bool)

(declare-fun b_and!31389 () Bool)

(assert (=> start!83836 (= tp!68432 b_and!31389)))

(declare-fun b!979407 () Bool)

(declare-fun res!655497 () Bool)

(declare-fun e!552072 () Bool)

(assert (=> b!979407 (=> (not res!655497) (not e!552072))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35193 0))(
  ( (V!35194 (val!11379 Int)) )
))
(declare-datatypes ((ValueCell!10847 0))(
  ( (ValueCellFull!10847 (v!13940 V!35193)) (EmptyCell!10847) )
))
(declare-datatypes ((array!61252 0))(
  ( (array!61253 (arr!29484 (Array (_ BitVec 32) ValueCell!10847)) (size!29965 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61252)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61254 0))(
  ( (array!61255 (arr!29485 (Array (_ BitVec 32) (_ BitVec 64))) (size!29966 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61254)

(assert (=> b!979407 (= res!655497 (and (= (size!29965 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29966 _keys!1544) (size!29965 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979408 () Bool)

(declare-fun res!655499 () Bool)

(assert (=> b!979408 (=> (not res!655499) (not e!552072))))

(assert (=> b!979408 (= res!655499 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979409 () Bool)

(declare-fun res!655502 () Bool)

(assert (=> b!979409 (=> (not res!655502) (not e!552072))))

(declare-datatypes ((List!20485 0))(
  ( (Nil!20482) (Cons!20481 (h!21643 (_ BitVec 64)) (t!29095 List!20485)) )
))
(declare-fun arrayNoDuplicates!0 (array!61254 (_ BitVec 32) List!20485) Bool)

(assert (=> b!979409 (= res!655502 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20482))))

(declare-fun b!979410 () Bool)

(declare-fun res!655498 () Bool)

(assert (=> b!979410 (=> (not res!655498) (not e!552072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61254 (_ BitVec 32)) Bool)

(assert (=> b!979410 (= res!655498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36014 () Bool)

(declare-fun mapRes!36014 () Bool)

(assert (=> mapIsEmpty!36014 mapRes!36014))

(declare-fun b!979411 () Bool)

(declare-fun res!655503 () Bool)

(assert (=> b!979411 (=> (not res!655503) (not e!552072))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979411 (= res!655503 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29966 _keys!1544))))))

(declare-fun b!979412 () Bool)

(declare-fun e!552074 () Bool)

(declare-fun tp_is_empty!22657 () Bool)

(assert (=> b!979412 (= e!552074 tp_is_empty!22657)))

(declare-fun b!979413 () Bool)

(declare-fun e!552073 () Bool)

(assert (=> b!979413 (= e!552072 (not e!552073))))

(declare-fun res!655501 () Bool)

(assert (=> b!979413 (=> res!655501 e!552073)))

(assert (=> b!979413 (= res!655501 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29485 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14660 0))(
  ( (tuple2!14661 (_1!7341 (_ BitVec 64)) (_2!7341 V!35193)) )
))
(declare-fun lt!434401 () tuple2!14660)

(declare-datatypes ((List!20486 0))(
  ( (Nil!20483) (Cons!20482 (h!21644 tuple2!14660) (t!29096 List!20486)) )
))
(declare-datatypes ((ListLongMap!13347 0))(
  ( (ListLongMap!13348 (toList!6689 List!20486)) )
))
(declare-fun lt!434400 () ListLongMap!13347)

(declare-fun lt!434402 () tuple2!14660)

(declare-fun lt!434394 () ListLongMap!13347)

(declare-fun +!2989 (ListLongMap!13347 tuple2!14660) ListLongMap!13347)

(assert (=> b!979413 (= (+!2989 lt!434394 lt!434401) (+!2989 lt!434400 lt!434402))))

(declare-fun lt!434403 () ListLongMap!13347)

(assert (=> b!979413 (= lt!434400 (+!2989 lt!434403 lt!434401))))

(declare-fun lt!434397 () V!35193)

(assert (=> b!979413 (= lt!434401 (tuple2!14661 (select (arr!29485 _keys!1544) from!1932) lt!434397))))

(assert (=> b!979413 (= lt!434394 (+!2989 lt!434403 lt!434402))))

(declare-fun minValue!1220 () V!35193)

(assert (=> b!979413 (= lt!434402 (tuple2!14661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32444 0))(
  ( (Unit!32445) )
))
(declare-fun lt!434395 () Unit!32444)

(declare-fun addCommutativeForDiffKeys!593 (ListLongMap!13347 (_ BitVec 64) V!35193 (_ BitVec 64) V!35193) Unit!32444)

(assert (=> b!979413 (= lt!434395 (addCommutativeForDiffKeys!593 lt!434403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29485 _keys!1544) from!1932) lt!434397))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15291 (ValueCell!10847 V!35193) V!35193)

(declare-fun dynLambda!1739 (Int (_ BitVec 64)) V!35193)

(assert (=> b!979413 (= lt!434397 (get!15291 (select (arr!29484 _values!1278) from!1932) (dynLambda!1739 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434396 () ListLongMap!13347)

(declare-fun lt!434398 () tuple2!14660)

(assert (=> b!979413 (= lt!434403 (+!2989 lt!434396 lt!434398))))

(declare-fun zeroValue!1220 () V!35193)

(assert (=> b!979413 (= lt!434398 (tuple2!14661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3406 (array!61254 array!61252 (_ BitVec 32) (_ BitVec 32) V!35193 V!35193 (_ BitVec 32) Int) ListLongMap!13347)

(assert (=> b!979413 (= lt!434396 (getCurrentListMapNoExtraKeys!3406 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979414 () Bool)

(declare-fun e!552071 () Bool)

(assert (=> b!979414 (= e!552071 (and e!552074 mapRes!36014))))

(declare-fun condMapEmpty!36014 () Bool)

(declare-fun mapDefault!36014 () ValueCell!10847)

(assert (=> b!979414 (= condMapEmpty!36014 (= (arr!29484 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10847)) mapDefault!36014)))))

(declare-fun b!979415 () Bool)

(declare-fun e!552069 () Bool)

(assert (=> b!979415 (= e!552069 tp_is_empty!22657)))

(declare-fun b!979416 () Bool)

(declare-fun res!655496 () Bool)

(assert (=> b!979416 (=> (not res!655496) (not e!552072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979416 (= res!655496 (validKeyInArray!0 (select (arr!29485 _keys!1544) from!1932)))))

(declare-fun b!979417 () Bool)

(assert (=> b!979417 (= e!552073 true)))

(assert (=> b!979417 (= lt!434400 (+!2989 (+!2989 lt!434396 lt!434401) lt!434398))))

(declare-fun lt!434399 () Unit!32444)

(assert (=> b!979417 (= lt!434399 (addCommutativeForDiffKeys!593 lt!434396 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29485 _keys!1544) from!1932) lt!434397))))

(declare-fun mapNonEmpty!36014 () Bool)

(declare-fun tp!68431 () Bool)

(assert (=> mapNonEmpty!36014 (= mapRes!36014 (and tp!68431 e!552069))))

(declare-fun mapRest!36014 () (Array (_ BitVec 32) ValueCell!10847))

(declare-fun mapKey!36014 () (_ BitVec 32))

(declare-fun mapValue!36014 () ValueCell!10847)

(assert (=> mapNonEmpty!36014 (= (arr!29484 _values!1278) (store mapRest!36014 mapKey!36014 mapValue!36014))))

(declare-fun res!655500 () Bool)

(assert (=> start!83836 (=> (not res!655500) (not e!552072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83836 (= res!655500 (validMask!0 mask!1948))))

(assert (=> start!83836 e!552072))

(assert (=> start!83836 true))

(assert (=> start!83836 tp_is_empty!22657))

(declare-fun array_inv!22829 (array!61252) Bool)

(assert (=> start!83836 (and (array_inv!22829 _values!1278) e!552071)))

(assert (=> start!83836 tp!68432))

(declare-fun array_inv!22830 (array!61254) Bool)

(assert (=> start!83836 (array_inv!22830 _keys!1544)))

(assert (= (and start!83836 res!655500) b!979407))

(assert (= (and b!979407 res!655497) b!979410))

(assert (= (and b!979410 res!655498) b!979409))

(assert (= (and b!979409 res!655502) b!979411))

(assert (= (and b!979411 res!655503) b!979416))

(assert (= (and b!979416 res!655496) b!979408))

(assert (= (and b!979408 res!655499) b!979413))

(assert (= (and b!979413 (not res!655501)) b!979417))

(assert (= (and b!979414 condMapEmpty!36014) mapIsEmpty!36014))

(assert (= (and b!979414 (not condMapEmpty!36014)) mapNonEmpty!36014))

(get-info :version)

(assert (= (and mapNonEmpty!36014 ((_ is ValueCellFull!10847) mapValue!36014)) b!979415))

(assert (= (and b!979414 ((_ is ValueCellFull!10847) mapDefault!36014)) b!979412))

(assert (= start!83836 b!979414))

(declare-fun b_lambda!14689 () Bool)

(assert (=> (not b_lambda!14689) (not b!979413)))

(declare-fun t!29094 () Bool)

(declare-fun tb!6461 () Bool)

(assert (=> (and start!83836 (= defaultEntry!1281 defaultEntry!1281) t!29094) tb!6461))

(declare-fun result!12919 () Bool)

(assert (=> tb!6461 (= result!12919 tp_is_empty!22657)))

(assert (=> b!979413 t!29094))

(declare-fun b_and!31391 () Bool)

(assert (= b_and!31389 (and (=> t!29094 result!12919) b_and!31391)))

(declare-fun m!906239 () Bool)

(assert (=> mapNonEmpty!36014 m!906239))

(declare-fun m!906241 () Bool)

(assert (=> b!979416 m!906241))

(assert (=> b!979416 m!906241))

(declare-fun m!906243 () Bool)

(assert (=> b!979416 m!906243))

(declare-fun m!906245 () Bool)

(assert (=> start!83836 m!906245))

(declare-fun m!906247 () Bool)

(assert (=> start!83836 m!906247))

(declare-fun m!906249 () Bool)

(assert (=> start!83836 m!906249))

(declare-fun m!906251 () Bool)

(assert (=> b!979417 m!906251))

(assert (=> b!979417 m!906251))

(declare-fun m!906253 () Bool)

(assert (=> b!979417 m!906253))

(assert (=> b!979417 m!906241))

(assert (=> b!979417 m!906241))

(declare-fun m!906255 () Bool)

(assert (=> b!979417 m!906255))

(declare-fun m!906257 () Bool)

(assert (=> b!979410 m!906257))

(declare-fun m!906259 () Bool)

(assert (=> b!979409 m!906259))

(declare-fun m!906261 () Bool)

(assert (=> b!979413 m!906261))

(declare-fun m!906263 () Bool)

(assert (=> b!979413 m!906263))

(assert (=> b!979413 m!906241))

(declare-fun m!906265 () Bool)

(assert (=> b!979413 m!906265))

(declare-fun m!906267 () Bool)

(assert (=> b!979413 m!906267))

(declare-fun m!906269 () Bool)

(assert (=> b!979413 m!906269))

(declare-fun m!906271 () Bool)

(assert (=> b!979413 m!906271))

(declare-fun m!906273 () Bool)

(assert (=> b!979413 m!906273))

(assert (=> b!979413 m!906241))

(declare-fun m!906275 () Bool)

(assert (=> b!979413 m!906275))

(declare-fun m!906277 () Bool)

(assert (=> b!979413 m!906277))

(assert (=> b!979413 m!906261))

(assert (=> b!979413 m!906277))

(declare-fun m!906279 () Bool)

(assert (=> b!979413 m!906279))

(check-sat b_and!31391 (not b!979409) (not b!979417) (not b!979413) (not b_next!19663) (not b!979410) (not mapNonEmpty!36014) (not b_lambda!14689) (not b!979416) (not start!83836) tp_is_empty!22657)
(check-sat b_and!31391 (not b_next!19663))
