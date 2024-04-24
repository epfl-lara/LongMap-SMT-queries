; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84370 () Bool)

(assert start!84370)

(declare-fun b_free!19903 () Bool)

(declare-fun b_next!19903 () Bool)

(assert (=> start!84370 (= b_free!19903 (not b_next!19903))))

(declare-fun tp!69313 () Bool)

(declare-fun b_and!31893 () Bool)

(assert (=> start!84370 (= tp!69313 b_and!31893)))

(declare-fun b!985745 () Bool)

(declare-fun res!659357 () Bool)

(declare-fun e!555753 () Bool)

(assert (=> b!985745 (=> (not res!659357) (not e!555753))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35657 0))(
  ( (V!35658 (val!11553 Int)) )
))
(declare-datatypes ((ValueCell!11021 0))(
  ( (ValueCellFull!11021 (v!14112 V!35657)) (EmptyCell!11021) )
))
(declare-datatypes ((array!62026 0))(
  ( (array!62027 (arr!29866 (Array (_ BitVec 32) ValueCell!11021)) (size!30346 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62026)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62028 0))(
  ( (array!62029 (arr!29867 (Array (_ BitVec 32) (_ BitVec 64))) (size!30347 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62028)

(assert (=> b!985745 (= res!659357 (and (= (size!30346 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30347 _keys!1544) (size!30346 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985746 () Bool)

(declare-fun e!555755 () Bool)

(declare-fun tp_is_empty!23005 () Bool)

(assert (=> b!985746 (= e!555755 tp_is_empty!23005)))

(declare-fun mapNonEmpty!36536 () Bool)

(declare-fun mapRes!36536 () Bool)

(declare-fun tp!69314 () Bool)

(assert (=> mapNonEmpty!36536 (= mapRes!36536 (and tp!69314 e!555755))))

(declare-fun mapRest!36536 () (Array (_ BitVec 32) ValueCell!11021))

(declare-fun mapKey!36536 () (_ BitVec 32))

(declare-fun mapValue!36536 () ValueCell!11021)

(assert (=> mapNonEmpty!36536 (= (arr!29866 _values!1278) (store mapRest!36536 mapKey!36536 mapValue!36536))))

(declare-fun b!985747 () Bool)

(declare-fun e!555756 () Bool)

(declare-fun e!555751 () Bool)

(assert (=> b!985747 (= e!555756 (and e!555751 mapRes!36536))))

(declare-fun condMapEmpty!36536 () Bool)

(declare-fun mapDefault!36536 () ValueCell!11021)

(assert (=> b!985747 (= condMapEmpty!36536 (= (arr!29866 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11021)) mapDefault!36536)))))

(declare-fun b!985748 () Bool)

(declare-fun res!659354 () Bool)

(assert (=> b!985748 (=> (not res!659354) (not e!555753))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985748 (= res!659354 (validKeyInArray!0 (select (arr!29867 _keys!1544) from!1932)))))

(declare-fun b!985749 () Bool)

(declare-fun res!659358 () Bool)

(assert (=> b!985749 (=> (not res!659358) (not e!555753))))

(assert (=> b!985749 (= res!659358 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985750 () Bool)

(declare-fun res!659352 () Bool)

(assert (=> b!985750 (=> (not res!659352) (not e!555753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62028 (_ BitVec 32)) Bool)

(assert (=> b!985750 (= res!659352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985752 () Bool)

(assert (=> b!985752 (= e!555751 tp_is_empty!23005)))

(declare-fun b!985753 () Bool)

(declare-fun res!659356 () Bool)

(assert (=> b!985753 (=> (not res!659356) (not e!555753))))

(declare-datatypes ((List!20677 0))(
  ( (Nil!20674) (Cons!20673 (h!21841 (_ BitVec 64)) (t!29516 List!20677)) )
))
(declare-fun arrayNoDuplicates!0 (array!62028 (_ BitVec 32) List!20677) Bool)

(assert (=> b!985753 (= res!659356 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20674))))

(declare-fun b!985754 () Bool)

(declare-fun e!555754 () Bool)

(assert (=> b!985754 (= e!555753 e!555754)))

(declare-fun res!659355 () Bool)

(assert (=> b!985754 (=> (not res!659355) (not e!555754))))

(assert (=> b!985754 (= res!659355 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29867 _keys!1544) from!1932))))))

(declare-fun lt!437352 () V!35657)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15522 (ValueCell!11021 V!35657) V!35657)

(declare-fun dynLambda!1855 (Int (_ BitVec 64)) V!35657)

(assert (=> b!985754 (= lt!437352 (get!15522 (select (arr!29866 _values!1278) from!1932) (dynLambda!1855 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35657)

(declare-fun zeroValue!1220 () V!35657)

(declare-datatypes ((tuple2!14796 0))(
  ( (tuple2!14797 (_1!7409 (_ BitVec 64)) (_2!7409 V!35657)) )
))
(declare-datatypes ((List!20678 0))(
  ( (Nil!20675) (Cons!20674 (h!21842 tuple2!14796) (t!29517 List!20678)) )
))
(declare-datatypes ((ListLongMap!13495 0))(
  ( (ListLongMap!13496 (toList!6763 List!20678)) )
))
(declare-fun lt!437348 () ListLongMap!13495)

(declare-fun getCurrentListMapNoExtraKeys!3498 (array!62028 array!62026 (_ BitVec 32) (_ BitVec 32) V!35657 V!35657 (_ BitVec 32) Int) ListLongMap!13495)

(assert (=> b!985754 (= lt!437348 (getCurrentListMapNoExtraKeys!3498 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!659359 () Bool)

(assert (=> start!84370 (=> (not res!659359) (not e!555753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84370 (= res!659359 (validMask!0 mask!1948))))

(assert (=> start!84370 e!555753))

(assert (=> start!84370 true))

(assert (=> start!84370 tp_is_empty!23005))

(declare-fun array_inv!23105 (array!62026) Bool)

(assert (=> start!84370 (and (array_inv!23105 _values!1278) e!555756)))

(assert (=> start!84370 tp!69313))

(declare-fun array_inv!23106 (array!62028) Bool)

(assert (=> start!84370 (array_inv!23106 _keys!1544)))

(declare-fun b!985751 () Bool)

(declare-fun res!659353 () Bool)

(assert (=> b!985751 (=> (not res!659353) (not e!555753))))

(assert (=> b!985751 (= res!659353 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30347 _keys!1544))))))

(declare-fun b!985755 () Bool)

(assert (=> b!985755 (= e!555754 (not true))))

(declare-fun lt!437350 () tuple2!14796)

(declare-fun lt!437351 () tuple2!14796)

(declare-fun +!3064 (ListLongMap!13495 tuple2!14796) ListLongMap!13495)

(assert (=> b!985755 (= (+!3064 (+!3064 lt!437348 lt!437350) lt!437351) (+!3064 (+!3064 lt!437348 lt!437351) lt!437350))))

(assert (=> b!985755 (= lt!437351 (tuple2!14797 (select (arr!29867 _keys!1544) from!1932) lt!437352))))

(assert (=> b!985755 (= lt!437350 (tuple2!14797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32708 0))(
  ( (Unit!32709) )
))
(declare-fun lt!437349 () Unit!32708)

(declare-fun addCommutativeForDiffKeys!671 (ListLongMap!13495 (_ BitVec 64) V!35657 (_ BitVec 64) V!35657) Unit!32708)

(assert (=> b!985755 (= lt!437349 (addCommutativeForDiffKeys!671 lt!437348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29867 _keys!1544) from!1932) lt!437352))))

(declare-fun mapIsEmpty!36536 () Bool)

(assert (=> mapIsEmpty!36536 mapRes!36536))

(assert (= (and start!84370 res!659359) b!985745))

(assert (= (and b!985745 res!659357) b!985750))

(assert (= (and b!985750 res!659352) b!985753))

(assert (= (and b!985753 res!659356) b!985751))

(assert (= (and b!985751 res!659353) b!985748))

(assert (= (and b!985748 res!659354) b!985749))

(assert (= (and b!985749 res!659358) b!985754))

(assert (= (and b!985754 res!659355) b!985755))

(assert (= (and b!985747 condMapEmpty!36536) mapIsEmpty!36536))

(assert (= (and b!985747 (not condMapEmpty!36536)) mapNonEmpty!36536))

(get-info :version)

(assert (= (and mapNonEmpty!36536 ((_ is ValueCellFull!11021) mapValue!36536)) b!985746))

(assert (= (and b!985747 ((_ is ValueCellFull!11021) mapDefault!36536)) b!985752))

(assert (= start!84370 b!985747))

(declare-fun b_lambda!14949 () Bool)

(assert (=> (not b_lambda!14949) (not b!985754)))

(declare-fun t!29515 () Bool)

(declare-fun tb!6689 () Bool)

(assert (=> (and start!84370 (= defaultEntry!1281 defaultEntry!1281) t!29515) tb!6689))

(declare-fun result!13375 () Bool)

(assert (=> tb!6689 (= result!13375 tp_is_empty!23005)))

(assert (=> b!985754 t!29515))

(declare-fun b_and!31895 () Bool)

(assert (= b_and!31893 (and (=> t!29515 result!13375) b_and!31895)))

(declare-fun m!913211 () Bool)

(assert (=> b!985755 m!913211))

(declare-fun m!913213 () Bool)

(assert (=> b!985755 m!913213))

(assert (=> b!985755 m!913211))

(declare-fun m!913215 () Bool)

(assert (=> b!985755 m!913215))

(declare-fun m!913217 () Bool)

(assert (=> b!985755 m!913217))

(declare-fun m!913219 () Bool)

(assert (=> b!985755 m!913219))

(assert (=> b!985755 m!913217))

(assert (=> b!985755 m!913213))

(declare-fun m!913221 () Bool)

(assert (=> b!985755 m!913221))

(assert (=> b!985754 m!913213))

(declare-fun m!913223 () Bool)

(assert (=> b!985754 m!913223))

(declare-fun m!913225 () Bool)

(assert (=> b!985754 m!913225))

(declare-fun m!913227 () Bool)

(assert (=> b!985754 m!913227))

(assert (=> b!985754 m!913223))

(assert (=> b!985754 m!913227))

(declare-fun m!913229 () Bool)

(assert (=> b!985754 m!913229))

(declare-fun m!913231 () Bool)

(assert (=> start!84370 m!913231))

(declare-fun m!913233 () Bool)

(assert (=> start!84370 m!913233))

(declare-fun m!913235 () Bool)

(assert (=> start!84370 m!913235))

(declare-fun m!913237 () Bool)

(assert (=> mapNonEmpty!36536 m!913237))

(assert (=> b!985748 m!913213))

(assert (=> b!985748 m!913213))

(declare-fun m!913239 () Bool)

(assert (=> b!985748 m!913239))

(declare-fun m!913241 () Bool)

(assert (=> b!985750 m!913241))

(declare-fun m!913243 () Bool)

(assert (=> b!985753 m!913243))

(check-sat (not b!985755) b_and!31895 (not b!985753) (not b_next!19903) (not b!985754) (not b!985748) (not mapNonEmpty!36536) (not b!985750) (not start!84370) (not b_lambda!14949) tp_is_empty!23005)
(check-sat b_and!31895 (not b_next!19903))
