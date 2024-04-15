; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84232 () Bool)

(assert start!84232)

(declare-fun b_free!19951 () Bool)

(declare-fun b_next!19951 () Bool)

(assert (=> start!84232 (= b_free!19951 (not b_next!19951))))

(declare-fun tp!69458 () Bool)

(declare-fun b_and!31953 () Bool)

(assert (=> start!84232 (= tp!69458 b_and!31953)))

(declare-fun b!985443 () Bool)

(declare-fun e!555455 () Bool)

(declare-fun tp_is_empty!23053 () Bool)

(assert (=> b!985443 (= e!555455 tp_is_empty!23053)))

(declare-fun b!985444 () Bool)

(declare-fun res!659474 () Bool)

(declare-fun e!555458 () Bool)

(assert (=> b!985444 (=> (not res!659474) (not e!555458))))

(declare-datatypes ((array!62008 0))(
  ( (array!62009 (arr!29862 (Array (_ BitVec 32) (_ BitVec 64))) (size!30343 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62008)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985444 (= res!659474 (validKeyInArray!0 (select (arr!29862 _keys!1544) from!1932)))))

(declare-fun b!985445 () Bool)

(declare-fun e!555457 () Bool)

(assert (=> b!985445 (= e!555457 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!35721 0))(
  ( (V!35722 (val!11577 Int)) )
))
(declare-datatypes ((tuple2!14898 0))(
  ( (tuple2!14899 (_1!7460 (_ BitVec 64)) (_2!7460 V!35721)) )
))
(declare-datatypes ((List!20746 0))(
  ( (Nil!20743) (Cons!20742 (h!21904 tuple2!14898) (t!29632 List!20746)) )
))
(declare-datatypes ((ListLongMap!13585 0))(
  ( (ListLongMap!13586 (toList!6808 List!20746)) )
))
(declare-fun lt!437114 () ListLongMap!13585)

(declare-fun lt!437115 () tuple2!14898)

(declare-fun lt!437112 () tuple2!14898)

(declare-fun +!3084 (ListLongMap!13585 tuple2!14898) ListLongMap!13585)

(assert (=> b!985445 (= (+!3084 (+!3084 lt!437114 lt!437115) lt!437112) (+!3084 (+!3084 lt!437114 lt!437112) lt!437115))))

(declare-fun lt!437113 () V!35721)

(assert (=> b!985445 (= lt!437112 (tuple2!14899 (select (arr!29862 _keys!1544) from!1932) lt!437113))))

(declare-fun minValue!1220 () V!35721)

(assert (=> b!985445 (= lt!437115 (tuple2!14899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32634 0))(
  ( (Unit!32635) )
))
(declare-fun lt!437111 () Unit!32634)

(declare-fun addCommutativeForDiffKeys!688 (ListLongMap!13585 (_ BitVec 64) V!35721 (_ BitVec 64) V!35721) Unit!32634)

(assert (=> b!985445 (= lt!437111 (addCommutativeForDiffKeys!688 lt!437114 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29862 _keys!1544) from!1932) lt!437113))))

(declare-fun b!985447 () Bool)

(declare-fun res!659479 () Bool)

(assert (=> b!985447 (=> (not res!659479) (not e!555458))))

(declare-datatypes ((List!20747 0))(
  ( (Nil!20744) (Cons!20743 (h!21905 (_ BitVec 64)) (t!29633 List!20747)) )
))
(declare-fun arrayNoDuplicates!0 (array!62008 (_ BitVec 32) List!20747) Bool)

(assert (=> b!985447 (= res!659479 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20744))))

(declare-fun b!985448 () Bool)

(declare-fun res!659476 () Bool)

(assert (=> b!985448 (=> (not res!659476) (not e!555458))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985448 (= res!659476 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985449 () Bool)

(declare-fun res!659480 () Bool)

(assert (=> b!985449 (=> (not res!659480) (not e!555458))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62008 (_ BitVec 32)) Bool)

(assert (=> b!985449 (= res!659480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985450 () Bool)

(declare-fun res!659475 () Bool)

(assert (=> b!985450 (=> (not res!659475) (not e!555458))))

(assert (=> b!985450 (= res!659475 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30343 _keys!1544))))))

(declare-fun mapNonEmpty!36608 () Bool)

(declare-fun mapRes!36608 () Bool)

(declare-fun tp!69457 () Bool)

(declare-fun e!555454 () Bool)

(assert (=> mapNonEmpty!36608 (= mapRes!36608 (and tp!69457 e!555454))))

(declare-datatypes ((ValueCell!11045 0))(
  ( (ValueCellFull!11045 (v!14138 V!35721)) (EmptyCell!11045) )
))
(declare-fun mapRest!36608 () (Array (_ BitVec 32) ValueCell!11045))

(declare-datatypes ((array!62010 0))(
  ( (array!62011 (arr!29863 (Array (_ BitVec 32) ValueCell!11045)) (size!30344 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62010)

(declare-fun mapValue!36608 () ValueCell!11045)

(declare-fun mapKey!36608 () (_ BitVec 32))

(assert (=> mapNonEmpty!36608 (= (arr!29863 _values!1278) (store mapRest!36608 mapKey!36608 mapValue!36608))))

(declare-fun mapIsEmpty!36608 () Bool)

(assert (=> mapIsEmpty!36608 mapRes!36608))

(declare-fun b!985451 () Bool)

(declare-fun res!659481 () Bool)

(assert (=> b!985451 (=> (not res!659481) (not e!555458))))

(assert (=> b!985451 (= res!659481 (and (= (size!30344 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30343 _keys!1544) (size!30344 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985452 () Bool)

(declare-fun e!555453 () Bool)

(assert (=> b!985452 (= e!555453 (and e!555455 mapRes!36608))))

(declare-fun condMapEmpty!36608 () Bool)

(declare-fun mapDefault!36608 () ValueCell!11045)

(assert (=> b!985452 (= condMapEmpty!36608 (= (arr!29863 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11045)) mapDefault!36608)))))

(declare-fun b!985453 () Bool)

(assert (=> b!985453 (= e!555454 tp_is_empty!23053)))

(declare-fun res!659477 () Bool)

(assert (=> start!84232 (=> (not res!659477) (not e!555458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84232 (= res!659477 (validMask!0 mask!1948))))

(assert (=> start!84232 e!555458))

(assert (=> start!84232 true))

(assert (=> start!84232 tp_is_empty!23053))

(declare-fun array_inv!23091 (array!62010) Bool)

(assert (=> start!84232 (and (array_inv!23091 _values!1278) e!555453)))

(assert (=> start!84232 tp!69458))

(declare-fun array_inv!23092 (array!62008) Bool)

(assert (=> start!84232 (array_inv!23092 _keys!1544)))

(declare-fun b!985446 () Bool)

(assert (=> b!985446 (= e!555458 e!555457)))

(declare-fun res!659478 () Bool)

(assert (=> b!985446 (=> (not res!659478) (not e!555457))))

(assert (=> b!985446 (= res!659478 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29862 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15524 (ValueCell!11045 V!35721) V!35721)

(declare-fun dynLambda!1840 (Int (_ BitVec 64)) V!35721)

(assert (=> b!985446 (= lt!437113 (get!15524 (select (arr!29863 _values!1278) from!1932) (dynLambda!1840 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35721)

(declare-fun getCurrentListMapNoExtraKeys!3512 (array!62008 array!62010 (_ BitVec 32) (_ BitVec 32) V!35721 V!35721 (_ BitVec 32) Int) ListLongMap!13585)

(assert (=> b!985446 (= lt!437114 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84232 res!659477) b!985451))

(assert (= (and b!985451 res!659481) b!985449))

(assert (= (and b!985449 res!659480) b!985447))

(assert (= (and b!985447 res!659479) b!985450))

(assert (= (and b!985450 res!659475) b!985444))

(assert (= (and b!985444 res!659474) b!985448))

(assert (= (and b!985448 res!659476) b!985446))

(assert (= (and b!985446 res!659478) b!985445))

(assert (= (and b!985452 condMapEmpty!36608) mapIsEmpty!36608))

(assert (= (and b!985452 (not condMapEmpty!36608)) mapNonEmpty!36608))

(get-info :version)

(assert (= (and mapNonEmpty!36608 ((_ is ValueCellFull!11045) mapValue!36608)) b!985453))

(assert (= (and b!985452 ((_ is ValueCellFull!11045) mapDefault!36608)) b!985443))

(assert (= start!84232 b!985452))

(declare-fun b_lambda!14965 () Bool)

(assert (=> (not b_lambda!14965) (not b!985446)))

(declare-fun t!29631 () Bool)

(declare-fun tb!6737 () Bool)

(assert (=> (and start!84232 (= defaultEntry!1281 defaultEntry!1281) t!29631) tb!6737))

(declare-fun result!13471 () Bool)

(assert (=> tb!6737 (= result!13471 tp_is_empty!23053)))

(assert (=> b!985446 t!29631))

(declare-fun b_and!31955 () Bool)

(assert (= b_and!31953 (and (=> t!29631 result!13471) b_and!31955)))

(declare-fun m!911975 () Bool)

(assert (=> start!84232 m!911975))

(declare-fun m!911977 () Bool)

(assert (=> start!84232 m!911977))

(declare-fun m!911979 () Bool)

(assert (=> start!84232 m!911979))

(declare-fun m!911981 () Bool)

(assert (=> b!985446 m!911981))

(declare-fun m!911983 () Bool)

(assert (=> b!985446 m!911983))

(declare-fun m!911985 () Bool)

(assert (=> b!985446 m!911985))

(declare-fun m!911987 () Bool)

(assert (=> b!985446 m!911987))

(assert (=> b!985446 m!911983))

(assert (=> b!985446 m!911987))

(declare-fun m!911989 () Bool)

(assert (=> b!985446 m!911989))

(assert (=> b!985445 m!911981))

(declare-fun m!911991 () Bool)

(assert (=> b!985445 m!911991))

(assert (=> b!985445 m!911981))

(declare-fun m!911993 () Bool)

(assert (=> b!985445 m!911993))

(assert (=> b!985445 m!911991))

(declare-fun m!911995 () Bool)

(assert (=> b!985445 m!911995))

(declare-fun m!911997 () Bool)

(assert (=> b!985445 m!911997))

(assert (=> b!985445 m!911997))

(declare-fun m!911999 () Bool)

(assert (=> b!985445 m!911999))

(declare-fun m!912001 () Bool)

(assert (=> b!985449 m!912001))

(declare-fun m!912003 () Bool)

(assert (=> mapNonEmpty!36608 m!912003))

(assert (=> b!985444 m!911981))

(assert (=> b!985444 m!911981))

(declare-fun m!912005 () Bool)

(assert (=> b!985444 m!912005))

(declare-fun m!912007 () Bool)

(assert (=> b!985447 m!912007))

(check-sat (not b!985449) (not b!985447) (not start!84232) b_and!31955 (not b_next!19951) tp_is_empty!23053 (not b!985445) (not b!985446) (not b_lambda!14965) (not b!985444) (not mapNonEmpty!36608))
(check-sat b_and!31955 (not b_next!19951))
