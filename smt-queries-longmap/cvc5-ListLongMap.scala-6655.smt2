; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83902 () Bool)

(assert start!83902)

(declare-fun b_free!19711 () Bool)

(declare-fun b_next!19711 () Bool)

(assert (=> start!83902 (= b_free!19711 (not b_next!19711))))

(declare-fun tp!68575 () Bool)

(declare-fun b_and!31511 () Bool)

(assert (=> start!83902 (= tp!68575 b_and!31511)))

(declare-fun b!980486 () Bool)

(declare-fun res!656186 () Bool)

(declare-fun e!552649 () Bool)

(assert (=> b!980486 (=> (not res!656186) (not e!552649))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61417 0))(
  ( (array!61418 (arr!29566 (Array (_ BitVec 32) (_ BitVec 64))) (size!30045 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61417)

(declare-datatypes ((V!35257 0))(
  ( (V!35258 (val!11403 Int)) )
))
(declare-datatypes ((ValueCell!10871 0))(
  ( (ValueCellFull!10871 (v!13965 V!35257)) (EmptyCell!10871) )
))
(declare-datatypes ((array!61419 0))(
  ( (array!61420 (arr!29567 (Array (_ BitVec 32) ValueCell!10871)) (size!30046 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61419)

(assert (=> b!980486 (= res!656186 (and (= (size!30046 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30045 _keys!1544) (size!30046 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36086 () Bool)

(declare-fun mapRes!36086 () Bool)

(declare-fun tp!68574 () Bool)

(declare-fun e!552651 () Bool)

(assert (=> mapNonEmpty!36086 (= mapRes!36086 (and tp!68574 e!552651))))

(declare-fun mapValue!36086 () ValueCell!10871)

(declare-fun mapKey!36086 () (_ BitVec 32))

(declare-fun mapRest!36086 () (Array (_ BitVec 32) ValueCell!10871))

(assert (=> mapNonEmpty!36086 (= (arr!29567 _values!1278) (store mapRest!36086 mapKey!36086 mapValue!36086))))

(declare-fun mapIsEmpty!36086 () Bool)

(assert (=> mapIsEmpty!36086 mapRes!36086))

(declare-fun b!980488 () Bool)

(declare-fun res!656184 () Bool)

(assert (=> b!980488 (=> (not res!656184) (not e!552649))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980488 (= res!656184 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30045 _keys!1544))))))

(declare-fun b!980489 () Bool)

(declare-fun e!552650 () Bool)

(declare-fun tp_is_empty!22705 () Bool)

(assert (=> b!980489 (= e!552650 tp_is_empty!22705)))

(declare-fun b!980490 () Bool)

(declare-fun e!552654 () Bool)

(assert (=> b!980490 (= e!552649 (not e!552654))))

(declare-fun res!656187 () Bool)

(assert (=> b!980490 (=> res!656187 e!552654)))

(assert (=> b!980490 (= res!656187 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29566 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14624 0))(
  ( (tuple2!14625 (_1!7323 (_ BitVec 64)) (_2!7323 V!35257)) )
))
(declare-datatypes ((List!20491 0))(
  ( (Nil!20488) (Cons!20487 (h!21649 tuple2!14624) (t!29158 List!20491)) )
))
(declare-datatypes ((ListLongMap!13321 0))(
  ( (ListLongMap!13322 (toList!6676 List!20491)) )
))
(declare-fun lt!435356 () ListLongMap!13321)

(declare-fun lt!435351 () tuple2!14624)

(declare-fun lt!435359 () tuple2!14624)

(declare-fun lt!435357 () ListLongMap!13321)

(declare-fun +!2981 (ListLongMap!13321 tuple2!14624) ListLongMap!13321)

(assert (=> b!980490 (= (+!2981 lt!435356 lt!435351) (+!2981 lt!435357 lt!435359))))

(declare-fun lt!435352 () ListLongMap!13321)

(assert (=> b!980490 (= lt!435357 (+!2981 lt!435352 lt!435351))))

(declare-fun lt!435355 () V!35257)

(assert (=> b!980490 (= lt!435351 (tuple2!14625 (select (arr!29566 _keys!1544) from!1932) lt!435355))))

(assert (=> b!980490 (= lt!435356 (+!2981 lt!435352 lt!435359))))

(declare-fun minValue!1220 () V!35257)

(assert (=> b!980490 (= lt!435359 (tuple2!14625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32601 0))(
  ( (Unit!32602) )
))
(declare-fun lt!435354 () Unit!32601)

(declare-fun addCommutativeForDiffKeys!609 (ListLongMap!13321 (_ BitVec 64) V!35257 (_ BitVec 64) V!35257) Unit!32601)

(assert (=> b!980490 (= lt!435354 (addCommutativeForDiffKeys!609 lt!435352 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29566 _keys!1544) from!1932) lt!435355))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15330 (ValueCell!10871 V!35257) V!35257)

(declare-fun dynLambda!1767 (Int (_ BitVec 64)) V!35257)

(assert (=> b!980490 (= lt!435355 (get!15330 (select (arr!29567 _values!1278) from!1932) (dynLambda!1767 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435353 () ListLongMap!13321)

(declare-fun lt!435350 () tuple2!14624)

(assert (=> b!980490 (= lt!435352 (+!2981 lt!435353 lt!435350))))

(declare-fun zeroValue!1220 () V!35257)

(assert (=> b!980490 (= lt!435350 (tuple2!14625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3381 (array!61417 array!61419 (_ BitVec 32) (_ BitVec 32) V!35257 V!35257 (_ BitVec 32) Int) ListLongMap!13321)

(assert (=> b!980490 (= lt!435353 (getCurrentListMapNoExtraKeys!3381 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980491 () Bool)

(declare-fun res!656182 () Bool)

(assert (=> b!980491 (=> (not res!656182) (not e!552649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980491 (= res!656182 (validKeyInArray!0 (select (arr!29566 _keys!1544) from!1932)))))

(declare-fun b!980492 () Bool)

(declare-fun res!656188 () Bool)

(assert (=> b!980492 (=> (not res!656188) (not e!552649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61417 (_ BitVec 32)) Bool)

(assert (=> b!980492 (= res!656188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980487 () Bool)

(declare-fun res!656189 () Bool)

(assert (=> b!980487 (=> (not res!656189) (not e!552649))))

(assert (=> b!980487 (= res!656189 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!656185 () Bool)

(assert (=> start!83902 (=> (not res!656185) (not e!552649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83902 (= res!656185 (validMask!0 mask!1948))))

(assert (=> start!83902 e!552649))

(assert (=> start!83902 true))

(assert (=> start!83902 tp_is_empty!22705))

(declare-fun e!552653 () Bool)

(declare-fun array_inv!22857 (array!61419) Bool)

(assert (=> start!83902 (and (array_inv!22857 _values!1278) e!552653)))

(assert (=> start!83902 tp!68575))

(declare-fun array_inv!22858 (array!61417) Bool)

(assert (=> start!83902 (array_inv!22858 _keys!1544)))

(declare-fun b!980493 () Bool)

(assert (=> b!980493 (= e!552651 tp_is_empty!22705)))

(declare-fun b!980494 () Bool)

(assert (=> b!980494 (= e!552653 (and e!552650 mapRes!36086))))

(declare-fun condMapEmpty!36086 () Bool)

(declare-fun mapDefault!36086 () ValueCell!10871)

