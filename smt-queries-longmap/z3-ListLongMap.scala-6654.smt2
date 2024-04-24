; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84064 () Bool)

(assert start!84064)

(declare-fun b_free!19705 () Bool)

(declare-fun b_next!19705 () Bool)

(assert (=> start!84064 (= b_free!19705 (not b_next!19705))))

(declare-fun tp!68557 () Bool)

(declare-fun b_and!31509 () Bool)

(assert (=> start!84064 (= tp!68557 b_and!31509)))

(declare-fun b!981284 () Bool)

(declare-fun res!656457 () Bool)

(declare-fun e!553177 () Bool)

(assert (=> b!981284 (=> (not res!656457) (not e!553177))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35249 0))(
  ( (V!35250 (val!11400 Int)) )
))
(declare-datatypes ((ValueCell!10868 0))(
  ( (ValueCellFull!10868 (v!13959 V!35249)) (EmptyCell!10868) )
))
(declare-datatypes ((array!61440 0))(
  ( (array!61441 (arr!29573 (Array (_ BitVec 32) ValueCell!10868)) (size!30053 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61440)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61442 0))(
  ( (array!61443 (arr!29574 (Array (_ BitVec 32) (_ BitVec 64))) (size!30054 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61442)

(assert (=> b!981284 (= res!656457 (and (= (size!30053 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30054 _keys!1544) (size!30053 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981285 () Bool)

(declare-fun e!553182 () Bool)

(declare-fun e!553178 () Bool)

(declare-fun mapRes!36077 () Bool)

(assert (=> b!981285 (= e!553182 (and e!553178 mapRes!36077))))

(declare-fun condMapEmpty!36077 () Bool)

(declare-fun mapDefault!36077 () ValueCell!10868)

(assert (=> b!981285 (= condMapEmpty!36077 (= (arr!29573 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10868)) mapDefault!36077)))))

(declare-fun b!981286 () Bool)

(declare-fun e!553180 () Bool)

(assert (=> b!981286 (= e!553177 (not e!553180))))

(declare-fun res!656459 () Bool)

(assert (=> b!981286 (=> res!656459 e!553180)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981286 (= res!656459 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29574 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14638 0))(
  ( (tuple2!14639 (_1!7330 (_ BitVec 64)) (_2!7330 V!35249)) )
))
(declare-datatypes ((List!20497 0))(
  ( (Nil!20494) (Cons!20493 (h!21661 tuple2!14638) (t!29150 List!20497)) )
))
(declare-datatypes ((ListLongMap!13337 0))(
  ( (ListLongMap!13338 (toList!6684 List!20497)) )
))
(declare-fun lt!435623 () ListLongMap!13337)

(declare-fun lt!435622 () tuple2!14638)

(declare-fun lt!435626 () tuple2!14638)

(declare-fun lt!435627 () ListLongMap!13337)

(declare-fun +!2999 (ListLongMap!13337 tuple2!14638) ListLongMap!13337)

(assert (=> b!981286 (= (+!2999 lt!435623 lt!435626) (+!2999 lt!435627 lt!435622))))

(declare-fun lt!435621 () ListLongMap!13337)

(assert (=> b!981286 (= lt!435627 (+!2999 lt!435621 lt!435626))))

(declare-fun lt!435629 () V!35249)

(assert (=> b!981286 (= lt!435626 (tuple2!14639 (select (arr!29574 _keys!1544) from!1932) lt!435629))))

(assert (=> b!981286 (= lt!435623 (+!2999 lt!435621 lt!435622))))

(declare-fun minValue!1220 () V!35249)

(assert (=> b!981286 (= lt!435622 (tuple2!14639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32578 0))(
  ( (Unit!32579) )
))
(declare-fun lt!435625 () Unit!32578)

(declare-fun addCommutativeForDiffKeys!606 (ListLongMap!13337 (_ BitVec 64) V!35249 (_ BitVec 64) V!35249) Unit!32578)

(assert (=> b!981286 (= lt!435625 (addCommutativeForDiffKeys!606 lt!435621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29574 _keys!1544) from!1932) lt!435629))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15358 (ValueCell!10868 V!35249) V!35249)

(declare-fun dynLambda!1793 (Int (_ BitVec 64)) V!35249)

(assert (=> b!981286 (= lt!435629 (get!15358 (select (arr!29573 _values!1278) from!1932) (dynLambda!1793 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435630 () ListLongMap!13337)

(declare-fun lt!435624 () tuple2!14638)

(assert (=> b!981286 (= lt!435621 (+!2999 lt!435630 lt!435624))))

(declare-fun zeroValue!1220 () V!35249)

(assert (=> b!981286 (= lt!435624 (tuple2!14639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3431 (array!61442 array!61440 (_ BitVec 32) (_ BitVec 32) V!35249 V!35249 (_ BitVec 32) Int) ListLongMap!13337)

(assert (=> b!981286 (= lt!435630 (getCurrentListMapNoExtraKeys!3431 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36077 () Bool)

(declare-fun tp!68558 () Bool)

(declare-fun e!553179 () Bool)

(assert (=> mapNonEmpty!36077 (= mapRes!36077 (and tp!68558 e!553179))))

(declare-fun mapKey!36077 () (_ BitVec 32))

(declare-fun mapRest!36077 () (Array (_ BitVec 32) ValueCell!10868))

(declare-fun mapValue!36077 () ValueCell!10868)

(assert (=> mapNonEmpty!36077 (= (arr!29573 _values!1278) (store mapRest!36077 mapKey!36077 mapValue!36077))))

(declare-fun b!981287 () Bool)

(declare-fun res!656461 () Bool)

(assert (=> b!981287 (=> (not res!656461) (not e!553177))))

(assert (=> b!981287 (= res!656461 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30054 _keys!1544))))))

(declare-fun b!981288 () Bool)

(declare-fun res!656460 () Bool)

(assert (=> b!981288 (=> (not res!656460) (not e!553177))))

(assert (=> b!981288 (= res!656460 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!981289 () Bool)

(declare-fun res!656455 () Bool)

(assert (=> b!981289 (=> (not res!656455) (not e!553177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61442 (_ BitVec 32)) Bool)

(assert (=> b!981289 (= res!656455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981290 () Bool)

(declare-fun res!656456 () Bool)

(assert (=> b!981290 (=> (not res!656456) (not e!553177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981290 (= res!656456 (validKeyInArray!0 (select (arr!29574 _keys!1544) from!1932)))))

(declare-fun res!656454 () Bool)

(assert (=> start!84064 (=> (not res!656454) (not e!553177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84064 (= res!656454 (validMask!0 mask!1948))))

(assert (=> start!84064 e!553177))

(assert (=> start!84064 true))

(declare-fun tp_is_empty!22699 () Bool)

(assert (=> start!84064 tp_is_empty!22699))

(declare-fun array_inv!22893 (array!61440) Bool)

(assert (=> start!84064 (and (array_inv!22893 _values!1278) e!553182)))

(assert (=> start!84064 tp!68557))

(declare-fun array_inv!22894 (array!61442) Bool)

(assert (=> start!84064 (array_inv!22894 _keys!1544)))

(declare-fun b!981291 () Bool)

(assert (=> b!981291 (= e!553180 true)))

(assert (=> b!981291 (= lt!435627 (+!2999 (+!2999 lt!435630 lt!435626) lt!435624))))

(declare-fun lt!435628 () Unit!32578)

(assert (=> b!981291 (= lt!435628 (addCommutativeForDiffKeys!606 lt!435630 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29574 _keys!1544) from!1932) lt!435629))))

(declare-fun b!981292 () Bool)

(assert (=> b!981292 (= e!553179 tp_is_empty!22699)))

(declare-fun b!981293 () Bool)

(declare-fun res!656458 () Bool)

(assert (=> b!981293 (=> (not res!656458) (not e!553177))))

(declare-datatypes ((List!20498 0))(
  ( (Nil!20495) (Cons!20494 (h!21662 (_ BitVec 64)) (t!29151 List!20498)) )
))
(declare-fun arrayNoDuplicates!0 (array!61442 (_ BitVec 32) List!20498) Bool)

(assert (=> b!981293 (= res!656458 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20495))))

(declare-fun b!981294 () Bool)

(assert (=> b!981294 (= e!553178 tp_is_empty!22699)))

(declare-fun mapIsEmpty!36077 () Bool)

(assert (=> mapIsEmpty!36077 mapRes!36077))

(assert (= (and start!84064 res!656454) b!981284))

(assert (= (and b!981284 res!656457) b!981289))

(assert (= (and b!981289 res!656455) b!981293))

(assert (= (and b!981293 res!656458) b!981287))

(assert (= (and b!981287 res!656461) b!981290))

(assert (= (and b!981290 res!656456) b!981288))

(assert (= (and b!981288 res!656460) b!981286))

(assert (= (and b!981286 (not res!656459)) b!981291))

(assert (= (and b!981285 condMapEmpty!36077) mapIsEmpty!36077))

(assert (= (and b!981285 (not condMapEmpty!36077)) mapNonEmpty!36077))

(get-info :version)

(assert (= (and mapNonEmpty!36077 ((_ is ValueCellFull!10868) mapValue!36077)) b!981292))

(assert (= (and b!981285 ((_ is ValueCellFull!10868) mapDefault!36077)) b!981294))

(assert (= start!84064 b!981285))

(declare-fun b_lambda!14763 () Bool)

(assert (=> (not b_lambda!14763) (not b!981286)))

(declare-fun t!29149 () Bool)

(declare-fun tb!6503 () Bool)

(assert (=> (and start!84064 (= defaultEntry!1281 defaultEntry!1281) t!29149) tb!6503))

(declare-fun result!13003 () Bool)

(assert (=> tb!6503 (= result!13003 tp_is_empty!22699)))

(assert (=> b!981286 t!29149))

(declare-fun b_and!31511 () Bool)

(assert (= b_and!31509 (and (=> t!29149 result!13003) b_and!31511)))

(declare-fun m!909173 () Bool)

(assert (=> b!981290 m!909173))

(assert (=> b!981290 m!909173))

(declare-fun m!909175 () Bool)

(assert (=> b!981290 m!909175))

(declare-fun m!909177 () Bool)

(assert (=> b!981289 m!909177))

(declare-fun m!909179 () Bool)

(assert (=> b!981286 m!909179))

(assert (=> b!981286 m!909173))

(declare-fun m!909181 () Bool)

(assert (=> b!981286 m!909181))

(assert (=> b!981286 m!909173))

(declare-fun m!909183 () Bool)

(assert (=> b!981286 m!909183))

(declare-fun m!909185 () Bool)

(assert (=> b!981286 m!909185))

(declare-fun m!909187 () Bool)

(assert (=> b!981286 m!909187))

(declare-fun m!909189 () Bool)

(assert (=> b!981286 m!909189))

(declare-fun m!909191 () Bool)

(assert (=> b!981286 m!909191))

(declare-fun m!909193 () Bool)

(assert (=> b!981286 m!909193))

(declare-fun m!909195 () Bool)

(assert (=> b!981286 m!909195))

(assert (=> b!981286 m!909181))

(assert (=> b!981286 m!909195))

(declare-fun m!909197 () Bool)

(assert (=> b!981286 m!909197))

(declare-fun m!909199 () Bool)

(assert (=> b!981293 m!909199))

(declare-fun m!909201 () Bool)

(assert (=> start!84064 m!909201))

(declare-fun m!909203 () Bool)

(assert (=> start!84064 m!909203))

(declare-fun m!909205 () Bool)

(assert (=> start!84064 m!909205))

(declare-fun m!909207 () Bool)

(assert (=> b!981291 m!909207))

(assert (=> b!981291 m!909207))

(declare-fun m!909209 () Bool)

(assert (=> b!981291 m!909209))

(assert (=> b!981291 m!909173))

(assert (=> b!981291 m!909173))

(declare-fun m!909211 () Bool)

(assert (=> b!981291 m!909211))

(declare-fun m!909213 () Bool)

(assert (=> mapNonEmpty!36077 m!909213))

(check-sat (not b_lambda!14763) b_and!31511 (not b!981290) tp_is_empty!22699 (not b!981289) (not mapNonEmpty!36077) (not b_next!19705) (not b!981293) (not b!981286) (not b!981291) (not start!84064))
(check-sat b_and!31511 (not b_next!19705))
