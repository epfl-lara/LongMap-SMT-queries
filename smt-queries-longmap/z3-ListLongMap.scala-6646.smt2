; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83850 () Bool)

(assert start!83850)

(declare-fun b_free!19659 () Bool)

(declare-fun b_next!19659 () Bool)

(assert (=> start!83850 (= b_free!19659 (not b_next!19659))))

(declare-fun tp!68418 () Bool)

(declare-fun b_and!31407 () Bool)

(assert (=> start!83850 (= tp!68418 b_and!31407)))

(declare-fun b!979576 () Bool)

(declare-fun res!655561 () Bool)

(declare-fun e!552185 () Bool)

(assert (=> b!979576 (=> (not res!655561) (not e!552185))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35187 0))(
  ( (V!35188 (val!11377 Int)) )
))
(declare-datatypes ((ValueCell!10845 0))(
  ( (ValueCellFull!10845 (v!13939 V!35187)) (EmptyCell!10845) )
))
(declare-datatypes ((array!61323 0))(
  ( (array!61324 (arr!29519 (Array (_ BitVec 32) ValueCell!10845)) (size!29998 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61323)

(declare-datatypes ((array!61325 0))(
  ( (array!61326 (arr!29520 (Array (_ BitVec 32) (_ BitVec 64))) (size!29999 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61325)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979576 (= res!655561 (and (= (size!29998 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29999 _keys!1544) (size!29998 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979577 () Bool)

(declare-fun e!552181 () Bool)

(declare-fun e!552182 () Bool)

(declare-fun mapRes!36008 () Bool)

(assert (=> b!979577 (= e!552181 (and e!552182 mapRes!36008))))

(declare-fun condMapEmpty!36008 () Bool)

(declare-fun mapDefault!36008 () ValueCell!10845)

(assert (=> b!979577 (= condMapEmpty!36008 (= (arr!29519 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10845)) mapDefault!36008)))))

(declare-fun b!979578 () Bool)

(declare-fun e!552183 () Bool)

(assert (=> b!979578 (= e!552183 true)))

(declare-datatypes ((tuple2!14594 0))(
  ( (tuple2!14595 (_1!7308 (_ BitVec 64)) (_2!7308 V!35187)) )
))
(declare-fun lt!434573 () tuple2!14594)

(declare-fun lt!434572 () tuple2!14594)

(declare-datatypes ((List!20463 0))(
  ( (Nil!20460) (Cons!20459 (h!21621 tuple2!14594) (t!29078 List!20463)) )
))
(declare-datatypes ((ListLongMap!13291 0))(
  ( (ListLongMap!13292 (toList!6661 List!20463)) )
))
(declare-fun lt!434571 () ListLongMap!13291)

(declare-fun lt!434578 () ListLongMap!13291)

(declare-fun +!2966 (ListLongMap!13291 tuple2!14594) ListLongMap!13291)

(assert (=> b!979578 (= lt!434578 (+!2966 (+!2966 lt!434571 lt!434573) lt!434572))))

(declare-fun lt!434570 () V!35187)

(declare-fun zeroValue!1220 () V!35187)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((Unit!32571 0))(
  ( (Unit!32572) )
))
(declare-fun lt!434577 () Unit!32571)

(declare-fun addCommutativeForDiffKeys!594 (ListLongMap!13291 (_ BitVec 64) V!35187 (_ BitVec 64) V!35187) Unit!32571)

(assert (=> b!979578 (= lt!434577 (addCommutativeForDiffKeys!594 lt!434571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29520 _keys!1544) from!1932) lt!434570))))

(declare-fun b!979579 () Bool)

(declare-fun res!655562 () Bool)

(assert (=> b!979579 (=> (not res!655562) (not e!552185))))

(assert (=> b!979579 (= res!655562 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29999 _keys!1544))))))

(declare-fun b!979580 () Bool)

(declare-fun res!655560 () Bool)

(assert (=> b!979580 (=> (not res!655560) (not e!552185))))

(assert (=> b!979580 (= res!655560 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979581 () Bool)

(declare-fun res!655559 () Bool)

(assert (=> b!979581 (=> (not res!655559) (not e!552185))))

(declare-datatypes ((List!20464 0))(
  ( (Nil!20461) (Cons!20460 (h!21622 (_ BitVec 64)) (t!29079 List!20464)) )
))
(declare-fun arrayNoDuplicates!0 (array!61325 (_ BitVec 32) List!20464) Bool)

(assert (=> b!979581 (= res!655559 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20461))))

(declare-fun b!979582 () Bool)

(declare-fun res!655565 () Bool)

(assert (=> b!979582 (=> (not res!655565) (not e!552185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979582 (= res!655565 (validKeyInArray!0 (select (arr!29520 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36008 () Bool)

(assert (=> mapIsEmpty!36008 mapRes!36008))

(declare-fun b!979584 () Bool)

(assert (=> b!979584 (= e!552185 (not e!552183))))

(declare-fun res!655564 () Bool)

(assert (=> b!979584 (=> res!655564 e!552183)))

(assert (=> b!979584 (= res!655564 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29520 _keys!1544) from!1932)))))

(declare-fun lt!434576 () tuple2!14594)

(declare-fun lt!434579 () ListLongMap!13291)

(assert (=> b!979584 (= (+!2966 lt!434579 lt!434573) (+!2966 lt!434578 lt!434576))))

(declare-fun lt!434574 () ListLongMap!13291)

(assert (=> b!979584 (= lt!434578 (+!2966 lt!434574 lt!434573))))

(assert (=> b!979584 (= lt!434573 (tuple2!14595 (select (arr!29520 _keys!1544) from!1932) lt!434570))))

(assert (=> b!979584 (= lt!434579 (+!2966 lt!434574 lt!434576))))

(declare-fun minValue!1220 () V!35187)

(assert (=> b!979584 (= lt!434576 (tuple2!14595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434575 () Unit!32571)

(assert (=> b!979584 (= lt!434575 (addCommutativeForDiffKeys!594 lt!434574 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29520 _keys!1544) from!1932) lt!434570))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15298 (ValueCell!10845 V!35187) V!35187)

(declare-fun dynLambda!1753 (Int (_ BitVec 64)) V!35187)

(assert (=> b!979584 (= lt!434570 (get!15298 (select (arr!29519 _values!1278) from!1932) (dynLambda!1753 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979584 (= lt!434574 (+!2966 lt!434571 lt!434572))))

(assert (=> b!979584 (= lt!434572 (tuple2!14595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3367 (array!61325 array!61323 (_ BitVec 32) (_ BitVec 32) V!35187 V!35187 (_ BitVec 32) Int) ListLongMap!13291)

(assert (=> b!979584 (= lt!434571 (getCurrentListMapNoExtraKeys!3367 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36008 () Bool)

(declare-fun tp!68419 () Bool)

(declare-fun e!552184 () Bool)

(assert (=> mapNonEmpty!36008 (= mapRes!36008 (and tp!68419 e!552184))))

(declare-fun mapRest!36008 () (Array (_ BitVec 32) ValueCell!10845))

(declare-fun mapKey!36008 () (_ BitVec 32))

(declare-fun mapValue!36008 () ValueCell!10845)

(assert (=> mapNonEmpty!36008 (= (arr!29519 _values!1278) (store mapRest!36008 mapKey!36008 mapValue!36008))))

(declare-fun res!655563 () Bool)

(assert (=> start!83850 (=> (not res!655563) (not e!552185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83850 (= res!655563 (validMask!0 mask!1948))))

(assert (=> start!83850 e!552185))

(assert (=> start!83850 true))

(declare-fun tp_is_empty!22653 () Bool)

(assert (=> start!83850 tp_is_empty!22653))

(declare-fun array_inv!22823 (array!61323) Bool)

(assert (=> start!83850 (and (array_inv!22823 _values!1278) e!552181)))

(assert (=> start!83850 tp!68418))

(declare-fun array_inv!22824 (array!61325) Bool)

(assert (=> start!83850 (array_inv!22824 _keys!1544)))

(declare-fun b!979583 () Bool)

(assert (=> b!979583 (= e!552182 tp_is_empty!22653)))

(declare-fun b!979585 () Bool)

(declare-fun res!655558 () Bool)

(assert (=> b!979585 (=> (not res!655558) (not e!552185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61325 (_ BitVec 32)) Bool)

(assert (=> b!979585 (= res!655558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979586 () Bool)

(assert (=> b!979586 (= e!552184 tp_is_empty!22653)))

(assert (= (and start!83850 res!655563) b!979576))

(assert (= (and b!979576 res!655561) b!979585))

(assert (= (and b!979585 res!655558) b!979581))

(assert (= (and b!979581 res!655559) b!979579))

(assert (= (and b!979579 res!655562) b!979582))

(assert (= (and b!979582 res!655565) b!979580))

(assert (= (and b!979580 res!655560) b!979584))

(assert (= (and b!979584 (not res!655564)) b!979578))

(assert (= (and b!979577 condMapEmpty!36008) mapIsEmpty!36008))

(assert (= (and b!979577 (not condMapEmpty!36008)) mapNonEmpty!36008))

(get-info :version)

(assert (= (and mapNonEmpty!36008 ((_ is ValueCellFull!10845) mapValue!36008)) b!979586))

(assert (= (and b!979577 ((_ is ValueCellFull!10845) mapDefault!36008)) b!979583))

(assert (= start!83850 b!979577))

(declare-fun b_lambda!14703 () Bool)

(assert (=> (not b_lambda!14703) (not b!979584)))

(declare-fun t!29077 () Bool)

(declare-fun tb!6465 () Bool)

(assert (=> (and start!83850 (= defaultEntry!1281 defaultEntry!1281) t!29077) tb!6465))

(declare-fun result!12919 () Bool)

(assert (=> tb!6465 (= result!12919 tp_is_empty!22653)))

(assert (=> b!979584 t!29077))

(declare-fun b_and!31409 () Bool)

(assert (= b_and!31407 (and (=> t!29077 result!12919) b_and!31409)))

(declare-fun m!906913 () Bool)

(assert (=> b!979585 m!906913))

(declare-fun m!906915 () Bool)

(assert (=> b!979584 m!906915))

(declare-fun m!906917 () Bool)

(assert (=> b!979584 m!906917))

(declare-fun m!906919 () Bool)

(assert (=> b!979584 m!906919))

(declare-fun m!906921 () Bool)

(assert (=> b!979584 m!906921))

(declare-fun m!906923 () Bool)

(assert (=> b!979584 m!906923))

(declare-fun m!906925 () Bool)

(assert (=> b!979584 m!906925))

(declare-fun m!906927 () Bool)

(assert (=> b!979584 m!906927))

(declare-fun m!906929 () Bool)

(assert (=> b!979584 m!906929))

(assert (=> b!979584 m!906917))

(declare-fun m!906931 () Bool)

(assert (=> b!979584 m!906931))

(declare-fun m!906933 () Bool)

(assert (=> b!979584 m!906933))

(assert (=> b!979584 m!906919))

(assert (=> b!979584 m!906933))

(declare-fun m!906935 () Bool)

(assert (=> b!979584 m!906935))

(declare-fun m!906937 () Bool)

(assert (=> start!83850 m!906937))

(declare-fun m!906939 () Bool)

(assert (=> start!83850 m!906939))

(declare-fun m!906941 () Bool)

(assert (=> start!83850 m!906941))

(declare-fun m!906943 () Bool)

(assert (=> b!979578 m!906943))

(assert (=> b!979578 m!906943))

(declare-fun m!906945 () Bool)

(assert (=> b!979578 m!906945))

(assert (=> b!979578 m!906917))

(assert (=> b!979578 m!906917))

(declare-fun m!906947 () Bool)

(assert (=> b!979578 m!906947))

(declare-fun m!906949 () Bool)

(assert (=> b!979581 m!906949))

(declare-fun m!906951 () Bool)

(assert (=> mapNonEmpty!36008 m!906951))

(assert (=> b!979582 m!906917))

(assert (=> b!979582 m!906917))

(declare-fun m!906953 () Bool)

(assert (=> b!979582 m!906953))

(check-sat (not b_next!19659) (not b!979582) (not b!979585) tp_is_empty!22653 (not b!979578) b_and!31409 (not mapNonEmpty!36008) (not b!979584) (not b!979581) (not b_lambda!14703) (not start!83850))
(check-sat b_and!31409 (not b_next!19659))
