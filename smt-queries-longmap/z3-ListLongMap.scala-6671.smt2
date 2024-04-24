; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84166 () Bool)

(assert start!84166)

(declare-fun b_free!19753 () Bool)

(declare-fun b_next!19753 () Bool)

(assert (=> start!84166 (= b_free!19753 (not b_next!19753))))

(declare-fun tp!68782 () Bool)

(declare-fun b_and!31599 () Bool)

(assert (=> start!84166 (= tp!68782 b_and!31599)))

(declare-fun b!982622 () Bool)

(declare-fun res!657298 () Bool)

(declare-fun e!554010 () Bool)

(assert (=> b!982622 (=> (not res!657298) (not e!554010))))

(declare-datatypes ((array!61634 0))(
  ( (array!61635 (arr!29670 (Array (_ BitVec 32) (_ BitVec 64))) (size!30150 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61634)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61634 (_ BitVec 32)) Bool)

(assert (=> b!982622 (= res!657298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982623 () Bool)

(declare-fun res!657297 () Bool)

(assert (=> b!982623 (=> (not res!657297) (not e!554010))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982623 (= res!657297 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982624 () Bool)

(declare-fun e!554006 () Bool)

(assert (=> b!982624 (= e!554006 (not true))))

(declare-datatypes ((V!35385 0))(
  ( (V!35386 (val!11451 Int)) )
))
(declare-datatypes ((tuple2!14674 0))(
  ( (tuple2!14675 (_1!7348 (_ BitVec 64)) (_2!7348 V!35385)) )
))
(declare-datatypes ((List!20551 0))(
  ( (Nil!20548) (Cons!20547 (h!21715 tuple2!14674) (t!29246 List!20551)) )
))
(declare-datatypes ((ListLongMap!13373 0))(
  ( (ListLongMap!13374 (toList!6702 List!20551)) )
))
(declare-fun lt!436189 () ListLongMap!13373)

(declare-fun lt!436191 () tuple2!14674)

(declare-fun lt!436190 () tuple2!14674)

(declare-fun +!3013 (ListLongMap!13373 tuple2!14674) ListLongMap!13373)

(assert (=> b!982624 (= (+!3013 (+!3013 lt!436189 lt!436191) lt!436190) (+!3013 (+!3013 lt!436189 lt!436190) lt!436191))))

(declare-fun lt!436188 () V!35385)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982624 (= lt!436190 (tuple2!14675 (select (arr!29670 _keys!1544) from!1932) lt!436188))))

(declare-fun zeroValue!1220 () V!35385)

(assert (=> b!982624 (= lt!436191 (tuple2!14675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32606 0))(
  ( (Unit!32607) )
))
(declare-fun lt!436187 () Unit!32606)

(declare-fun addCommutativeForDiffKeys!620 (ListLongMap!13373 (_ BitVec 64) V!35385 (_ BitVec 64) V!35385) Unit!32606)

(assert (=> b!982624 (= lt!436187 (addCommutativeForDiffKeys!620 lt!436189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29670 _keys!1544) from!1932) lt!436188))))

(declare-fun b!982625 () Bool)

(declare-fun e!554007 () Bool)

(declare-fun tp_is_empty!22801 () Bool)

(assert (=> b!982625 (= e!554007 tp_is_empty!22801)))

(declare-fun b!982626 () Bool)

(declare-fun res!657293 () Bool)

(assert (=> b!982626 (=> (not res!657293) (not e!554010))))

(assert (=> b!982626 (= res!657293 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30150 _keys!1544))))))

(declare-fun b!982627 () Bool)

(declare-fun res!657295 () Bool)

(assert (=> b!982627 (=> (not res!657295) (not e!554010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982627 (= res!657295 (validKeyInArray!0 (select (arr!29670 _keys!1544) from!1932)))))

(declare-fun b!982628 () Bool)

(declare-fun e!554008 () Bool)

(assert (=> b!982628 (= e!554008 tp_is_empty!22801)))

(declare-fun b!982629 () Bool)

(assert (=> b!982629 (= e!554010 e!554006)))

(declare-fun res!657291 () Bool)

(assert (=> b!982629 (=> (not res!657291) (not e!554006))))

(assert (=> b!982629 (= res!657291 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29670 _keys!1544) from!1932))))))

(declare-datatypes ((ValueCell!10919 0))(
  ( (ValueCellFull!10919 (v!14010 V!35385)) (EmptyCell!10919) )
))
(declare-datatypes ((array!61636 0))(
  ( (array!61637 (arr!29671 (Array (_ BitVec 32) ValueCell!10919)) (size!30151 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61636)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15405 (ValueCell!10919 V!35385) V!35385)

(declare-fun dynLambda!1806 (Int (_ BitVec 64)) V!35385)

(assert (=> b!982629 (= lt!436188 (get!15405 (select (arr!29671 _values!1278) from!1932) (dynLambda!1806 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35385)

(declare-fun getCurrentListMapNoExtraKeys!3447 (array!61634 array!61636 (_ BitVec 32) (_ BitVec 32) V!35385 V!35385 (_ BitVec 32) Int) ListLongMap!13373)

(assert (=> b!982629 (= lt!436189 (getCurrentListMapNoExtraKeys!3447 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982630 () Bool)

(declare-fun res!657294 () Bool)

(assert (=> b!982630 (=> (not res!657294) (not e!554010))))

(declare-datatypes ((List!20552 0))(
  ( (Nil!20549) (Cons!20548 (h!21716 (_ BitVec 64)) (t!29247 List!20552)) )
))
(declare-fun arrayNoDuplicates!0 (array!61634 (_ BitVec 32) List!20552) Bool)

(assert (=> b!982630 (= res!657294 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20549))))

(declare-fun b!982631 () Bool)

(declare-fun e!554005 () Bool)

(declare-fun mapRes!36230 () Bool)

(assert (=> b!982631 (= e!554005 (and e!554008 mapRes!36230))))

(declare-fun condMapEmpty!36230 () Bool)

(declare-fun mapDefault!36230 () ValueCell!10919)

(assert (=> b!982631 (= condMapEmpty!36230 (= (arr!29671 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10919)) mapDefault!36230)))))

(declare-fun b!982632 () Bool)

(declare-fun res!657296 () Bool)

(assert (=> b!982632 (=> (not res!657296) (not e!554010))))

(assert (=> b!982632 (= res!657296 (and (= (size!30151 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30150 _keys!1544) (size!30151 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36230 () Bool)

(assert (=> mapIsEmpty!36230 mapRes!36230))

(declare-fun res!657292 () Bool)

(assert (=> start!84166 (=> (not res!657292) (not e!554010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84166 (= res!657292 (validMask!0 mask!1948))))

(assert (=> start!84166 e!554010))

(assert (=> start!84166 true))

(assert (=> start!84166 tp_is_empty!22801))

(declare-fun array_inv!22961 (array!61636) Bool)

(assert (=> start!84166 (and (array_inv!22961 _values!1278) e!554005)))

(assert (=> start!84166 tp!68782))

(declare-fun array_inv!22962 (array!61634) Bool)

(assert (=> start!84166 (array_inv!22962 _keys!1544)))

(declare-fun mapNonEmpty!36230 () Bool)

(declare-fun tp!68783 () Bool)

(assert (=> mapNonEmpty!36230 (= mapRes!36230 (and tp!68783 e!554007))))

(declare-fun mapRest!36230 () (Array (_ BitVec 32) ValueCell!10919))

(declare-fun mapKey!36230 () (_ BitVec 32))

(declare-fun mapValue!36230 () ValueCell!10919)

(assert (=> mapNonEmpty!36230 (= (arr!29671 _values!1278) (store mapRest!36230 mapKey!36230 mapValue!36230))))

(assert (= (and start!84166 res!657292) b!982632))

(assert (= (and b!982632 res!657296) b!982622))

(assert (= (and b!982622 res!657298) b!982630))

(assert (= (and b!982630 res!657294) b!982626))

(assert (= (and b!982626 res!657293) b!982627))

(assert (= (and b!982627 res!657295) b!982623))

(assert (= (and b!982623 res!657297) b!982629))

(assert (= (and b!982629 res!657291) b!982624))

(assert (= (and b!982631 condMapEmpty!36230) mapIsEmpty!36230))

(assert (= (and b!982631 (not condMapEmpty!36230)) mapNonEmpty!36230))

(get-info :version)

(assert (= (and mapNonEmpty!36230 ((_ is ValueCellFull!10919) mapValue!36230)) b!982625))

(assert (= (and b!982631 ((_ is ValueCellFull!10919) mapDefault!36230)) b!982628))

(assert (= start!84166 b!982631))

(declare-fun b_lambda!14805 () Bool)

(assert (=> (not b_lambda!14805) (not b!982629)))

(declare-fun t!29245 () Bool)

(declare-fun tb!6545 () Bool)

(assert (=> (and start!84166 (= defaultEntry!1281 defaultEntry!1281) t!29245) tb!6545))

(declare-fun result!13087 () Bool)

(assert (=> tb!6545 (= result!13087 tp_is_empty!22801)))

(assert (=> b!982629 t!29245))

(declare-fun b_and!31601 () Bool)

(assert (= b_and!31599 (and (=> t!29245 result!13087) b_and!31601)))

(declare-fun m!910373 () Bool)

(assert (=> b!982629 m!910373))

(declare-fun m!910375 () Bool)

(assert (=> b!982629 m!910375))

(declare-fun m!910377 () Bool)

(assert (=> b!982629 m!910377))

(declare-fun m!910379 () Bool)

(assert (=> b!982629 m!910379))

(assert (=> b!982629 m!910375))

(assert (=> b!982629 m!910379))

(declare-fun m!910381 () Bool)

(assert (=> b!982629 m!910381))

(declare-fun m!910383 () Bool)

(assert (=> mapNonEmpty!36230 m!910383))

(declare-fun m!910385 () Bool)

(assert (=> start!84166 m!910385))

(declare-fun m!910387 () Bool)

(assert (=> start!84166 m!910387))

(declare-fun m!910389 () Bool)

(assert (=> start!84166 m!910389))

(assert (=> b!982627 m!910373))

(assert (=> b!982627 m!910373))

(declare-fun m!910391 () Bool)

(assert (=> b!982627 m!910391))

(assert (=> b!982624 m!910373))

(assert (=> b!982624 m!910373))

(declare-fun m!910393 () Bool)

(assert (=> b!982624 m!910393))

(declare-fun m!910395 () Bool)

(assert (=> b!982624 m!910395))

(declare-fun m!910397 () Bool)

(assert (=> b!982624 m!910397))

(declare-fun m!910399 () Bool)

(assert (=> b!982624 m!910399))

(assert (=> b!982624 m!910395))

(assert (=> b!982624 m!910399))

(declare-fun m!910401 () Bool)

(assert (=> b!982624 m!910401))

(declare-fun m!910403 () Bool)

(assert (=> b!982630 m!910403))

(declare-fun m!910405 () Bool)

(assert (=> b!982622 m!910405))

(check-sat (not start!84166) b_and!31601 tp_is_empty!22801 (not mapNonEmpty!36230) (not b!982622) (not b_next!19753) (not b_lambda!14805) (not b!982624) (not b!982630) (not b!982627) (not b!982629))
(check-sat b_and!31601 (not b_next!19753))
