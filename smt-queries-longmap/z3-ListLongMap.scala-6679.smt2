; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84214 () Bool)

(assert start!84214)

(declare-fun b_free!19801 () Bool)

(declare-fun b_next!19801 () Bool)

(assert (=> start!84214 (= b_free!19801 (not b_next!19801))))

(declare-fun tp!68926 () Bool)

(declare-fun b_and!31695 () Bool)

(assert (=> start!84214 (= tp!68926 b_and!31695)))

(declare-fun b!983462 () Bool)

(declare-fun res!657872 () Bool)

(declare-fun e!554442 () Bool)

(assert (=> b!983462 (=> (not res!657872) (not e!554442))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61726 0))(
  ( (array!61727 (arr!29716 (Array (_ BitVec 32) (_ BitVec 64))) (size!30196 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61726)

(assert (=> b!983462 (= res!657872 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30196 _keys!1544))))))

(declare-fun b!983463 () Bool)

(declare-fun e!554441 () Bool)

(declare-fun e!554440 () Bool)

(declare-fun mapRes!36302 () Bool)

(assert (=> b!983463 (= e!554441 (and e!554440 mapRes!36302))))

(declare-fun condMapEmpty!36302 () Bool)

(declare-datatypes ((V!35449 0))(
  ( (V!35450 (val!11475 Int)) )
))
(declare-datatypes ((ValueCell!10943 0))(
  ( (ValueCellFull!10943 (v!14034 V!35449)) (EmptyCell!10943) )
))
(declare-datatypes ((array!61728 0))(
  ( (array!61729 (arr!29717 (Array (_ BitVec 32) ValueCell!10943)) (size!30197 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61728)

(declare-fun mapDefault!36302 () ValueCell!10943)

(assert (=> b!983463 (= condMapEmpty!36302 (= (arr!29717 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10943)) mapDefault!36302)))))

(declare-fun b!983464 () Bool)

(declare-fun res!657871 () Bool)

(assert (=> b!983464 (=> (not res!657871) (not e!554442))))

(declare-datatypes ((List!20589 0))(
  ( (Nil!20586) (Cons!20585 (h!21753 (_ BitVec 64)) (t!29332 List!20589)) )
))
(declare-fun arrayNoDuplicates!0 (array!61726 (_ BitVec 32) List!20589) Bool)

(assert (=> b!983464 (= res!657871 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20586))))

(declare-fun b!983465 () Bool)

(declare-fun res!657867 () Bool)

(assert (=> b!983465 (=> (not res!657867) (not e!554442))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61726 (_ BitVec 32)) Bool)

(assert (=> b!983465 (= res!657867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36302 () Bool)

(assert (=> mapIsEmpty!36302 mapRes!36302))

(declare-fun b!983467 () Bool)

(declare-fun e!554437 () Bool)

(assert (=> b!983467 (= e!554437 (not true))))

(declare-datatypes ((tuple2!14714 0))(
  ( (tuple2!14715 (_1!7368 (_ BitVec 64)) (_2!7368 V!35449)) )
))
(declare-datatypes ((List!20590 0))(
  ( (Nil!20587) (Cons!20586 (h!21754 tuple2!14714) (t!29333 List!20590)) )
))
(declare-datatypes ((ListLongMap!13413 0))(
  ( (ListLongMap!13414 (toList!6722 List!20590)) )
))
(declare-fun lt!436551 () ListLongMap!13413)

(declare-fun lt!436547 () tuple2!14714)

(declare-fun lt!436549 () tuple2!14714)

(declare-fun +!3029 (ListLongMap!13413 tuple2!14714) ListLongMap!13413)

(assert (=> b!983467 (= (+!3029 (+!3029 lt!436551 lt!436547) lt!436549) (+!3029 (+!3029 lt!436551 lt!436549) lt!436547))))

(declare-fun lt!436548 () V!35449)

(assert (=> b!983467 (= lt!436549 (tuple2!14715 (select (arr!29716 _keys!1544) from!1932) lt!436548))))

(declare-fun zeroValue!1220 () V!35449)

(assert (=> b!983467 (= lt!436547 (tuple2!14715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32638 0))(
  ( (Unit!32639) )
))
(declare-fun lt!436550 () Unit!32638)

(declare-fun addCommutativeForDiffKeys!636 (ListLongMap!13413 (_ BitVec 64) V!35449 (_ BitVec 64) V!35449) Unit!32638)

(assert (=> b!983467 (= lt!436550 (addCommutativeForDiffKeys!636 lt!436551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29716 _keys!1544) from!1932) lt!436548))))

(declare-fun mapNonEmpty!36302 () Bool)

(declare-fun tp!68927 () Bool)

(declare-fun e!554438 () Bool)

(assert (=> mapNonEmpty!36302 (= mapRes!36302 (and tp!68927 e!554438))))

(declare-fun mapValue!36302 () ValueCell!10943)

(declare-fun mapRest!36302 () (Array (_ BitVec 32) ValueCell!10943))

(declare-fun mapKey!36302 () (_ BitVec 32))

(assert (=> mapNonEmpty!36302 (= (arr!29717 _values!1278) (store mapRest!36302 mapKey!36302 mapValue!36302))))

(declare-fun b!983468 () Bool)

(declare-fun tp_is_empty!22849 () Bool)

(assert (=> b!983468 (= e!554438 tp_is_empty!22849)))

(declare-fun b!983469 () Bool)

(assert (=> b!983469 (= e!554442 e!554437)))

(declare-fun res!657869 () Bool)

(assert (=> b!983469 (=> (not res!657869) (not e!554437))))

(assert (=> b!983469 (= res!657869 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29716 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15439 (ValueCell!10943 V!35449) V!35449)

(declare-fun dynLambda!1824 (Int (_ BitVec 64)) V!35449)

(assert (=> b!983469 (= lt!436548 (get!15439 (select (arr!29717 _values!1278) from!1932) (dynLambda!1824 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35449)

(declare-fun getCurrentListMapNoExtraKeys!3465 (array!61726 array!61728 (_ BitVec 32) (_ BitVec 32) V!35449 V!35449 (_ BitVec 32) Int) ListLongMap!13413)

(assert (=> b!983469 (= lt!436551 (getCurrentListMapNoExtraKeys!3465 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983470 () Bool)

(declare-fun res!657870 () Bool)

(assert (=> b!983470 (=> (not res!657870) (not e!554442))))

(assert (=> b!983470 (= res!657870 (and (= (size!30197 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30196 _keys!1544) (size!30197 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!657874 () Bool)

(assert (=> start!84214 (=> (not res!657874) (not e!554442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84214 (= res!657874 (validMask!0 mask!1948))))

(assert (=> start!84214 e!554442))

(assert (=> start!84214 true))

(assert (=> start!84214 tp_is_empty!22849))

(declare-fun array_inv!22995 (array!61728) Bool)

(assert (=> start!84214 (and (array_inv!22995 _values!1278) e!554441)))

(assert (=> start!84214 tp!68926))

(declare-fun array_inv!22996 (array!61726) Bool)

(assert (=> start!84214 (array_inv!22996 _keys!1544)))

(declare-fun b!983466 () Bool)

(declare-fun res!657868 () Bool)

(assert (=> b!983466 (=> (not res!657868) (not e!554442))))

(assert (=> b!983466 (= res!657868 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983471 () Bool)

(declare-fun res!657873 () Bool)

(assert (=> b!983471 (=> (not res!657873) (not e!554442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983471 (= res!657873 (validKeyInArray!0 (select (arr!29716 _keys!1544) from!1932)))))

(declare-fun b!983472 () Bool)

(assert (=> b!983472 (= e!554440 tp_is_empty!22849)))

(assert (= (and start!84214 res!657874) b!983470))

(assert (= (and b!983470 res!657870) b!983465))

(assert (= (and b!983465 res!657867) b!983464))

(assert (= (and b!983464 res!657871) b!983462))

(assert (= (and b!983462 res!657872) b!983471))

(assert (= (and b!983471 res!657873) b!983466))

(assert (= (and b!983466 res!657868) b!983469))

(assert (= (and b!983469 res!657869) b!983467))

(assert (= (and b!983463 condMapEmpty!36302) mapIsEmpty!36302))

(assert (= (and b!983463 (not condMapEmpty!36302)) mapNonEmpty!36302))

(get-info :version)

(assert (= (and mapNonEmpty!36302 ((_ is ValueCellFull!10943) mapValue!36302)) b!983468))

(assert (= (and b!983463 ((_ is ValueCellFull!10943) mapDefault!36302)) b!983472))

(assert (= start!84214 b!983463))

(declare-fun b_lambda!14853 () Bool)

(assert (=> (not b_lambda!14853) (not b!983469)))

(declare-fun t!29331 () Bool)

(declare-fun tb!6593 () Bool)

(assert (=> (and start!84214 (= defaultEntry!1281 defaultEntry!1281) t!29331) tb!6593))

(declare-fun result!13183 () Bool)

(assert (=> tb!6593 (= result!13183 tp_is_empty!22849)))

(assert (=> b!983469 t!29331))

(declare-fun b_and!31697 () Bool)

(assert (= b_and!31695 (and (=> t!29331 result!13183) b_and!31697)))

(declare-fun m!911189 () Bool)

(assert (=> start!84214 m!911189))

(declare-fun m!911191 () Bool)

(assert (=> start!84214 m!911191))

(declare-fun m!911193 () Bool)

(assert (=> start!84214 m!911193))

(declare-fun m!911195 () Bool)

(assert (=> b!983469 m!911195))

(declare-fun m!911197 () Bool)

(assert (=> b!983469 m!911197))

(declare-fun m!911199 () Bool)

(assert (=> b!983469 m!911199))

(declare-fun m!911201 () Bool)

(assert (=> b!983469 m!911201))

(assert (=> b!983469 m!911197))

(assert (=> b!983469 m!911201))

(declare-fun m!911203 () Bool)

(assert (=> b!983469 m!911203))

(assert (=> b!983467 m!911195))

(assert (=> b!983467 m!911195))

(declare-fun m!911205 () Bool)

(assert (=> b!983467 m!911205))

(declare-fun m!911207 () Bool)

(assert (=> b!983467 m!911207))

(declare-fun m!911209 () Bool)

(assert (=> b!983467 m!911209))

(declare-fun m!911211 () Bool)

(assert (=> b!983467 m!911211))

(assert (=> b!983467 m!911207))

(assert (=> b!983467 m!911211))

(declare-fun m!911213 () Bool)

(assert (=> b!983467 m!911213))

(declare-fun m!911215 () Bool)

(assert (=> b!983465 m!911215))

(declare-fun m!911217 () Bool)

(assert (=> mapNonEmpty!36302 m!911217))

(declare-fun m!911219 () Bool)

(assert (=> b!983464 m!911219))

(assert (=> b!983471 m!911195))

(assert (=> b!983471 m!911195))

(declare-fun m!911221 () Bool)

(assert (=> b!983471 m!911221))

(check-sat (not b!983471) (not b!983464) (not b!983467) (not b!983469) (not b!983465) (not mapNonEmpty!36302) tp_is_empty!22849 b_and!31697 (not b_next!19801) (not start!84214) (not b_lambda!14853))
(check-sat b_and!31697 (not b_next!19801))
