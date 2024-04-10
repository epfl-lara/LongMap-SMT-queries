; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84226 () Bool)

(assert start!84226)

(declare-fun b_free!19927 () Bool)

(declare-fun b_next!19927 () Bool)

(assert (=> start!84226 (= b_free!19927 (not b_next!19927))))

(declare-fun tp!69385 () Bool)

(declare-fun b_and!31931 () Bool)

(assert (=> start!84226 (= tp!69385 b_and!31931)))

(declare-fun b!985262 () Bool)

(declare-fun e!555386 () Bool)

(assert (=> b!985262 (= e!555386 (not true))))

(declare-datatypes ((V!35689 0))(
  ( (V!35690 (val!11565 Int)) )
))
(declare-datatypes ((tuple2!14796 0))(
  ( (tuple2!14797 (_1!7409 (_ BitVec 64)) (_2!7409 V!35689)) )
))
(declare-datatypes ((List!20688 0))(
  ( (Nil!20685) (Cons!20684 (h!21846 tuple2!14796) (t!29559 List!20688)) )
))
(declare-datatypes ((ListLongMap!13493 0))(
  ( (ListLongMap!13494 (toList!6762 List!20688)) )
))
(declare-fun lt!437170 () ListLongMap!13493)

(declare-fun lt!437171 () tuple2!14796)

(declare-fun lt!437169 () tuple2!14796)

(declare-fun +!3052 (ListLongMap!13493 tuple2!14796) ListLongMap!13493)

(assert (=> b!985262 (= (+!3052 (+!3052 lt!437170 lt!437171) lt!437169) (+!3052 (+!3052 lt!437170 lt!437169) lt!437171))))

(declare-fun lt!437168 () V!35689)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62033 0))(
  ( (array!62034 (arr!29874 (Array (_ BitVec 32) (_ BitVec 64))) (size!30353 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62033)

(assert (=> b!985262 (= lt!437169 (tuple2!14797 (select (arr!29874 _keys!1544) from!1932) lt!437168))))

(declare-fun minValue!1220 () V!35689)

(assert (=> b!985262 (= lt!437171 (tuple2!14797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32743 0))(
  ( (Unit!32744) )
))
(declare-fun lt!437167 () Unit!32743)

(declare-fun addCommutativeForDiffKeys!680 (ListLongMap!13493 (_ BitVec 64) V!35689 (_ BitVec 64) V!35689) Unit!32743)

(assert (=> b!985262 (= lt!437167 (addCommutativeForDiffKeys!680 lt!437170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29874 _keys!1544) from!1932) lt!437168))))

(declare-fun b!985264 () Bool)

(declare-fun res!659301 () Bool)

(declare-fun e!555388 () Bool)

(assert (=> b!985264 (=> (not res!659301) (not e!555388))))

(assert (=> b!985264 (= res!659301 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30353 _keys!1544))))))

(declare-fun b!985265 () Bool)

(declare-fun res!659296 () Bool)

(assert (=> b!985265 (=> (not res!659296) (not e!555388))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11033 0))(
  ( (ValueCellFull!11033 (v!14127 V!35689)) (EmptyCell!11033) )
))
(declare-datatypes ((array!62035 0))(
  ( (array!62036 (arr!29875 (Array (_ BitVec 32) ValueCell!11033)) (size!30354 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62035)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985265 (= res!659296 (and (= (size!30354 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30353 _keys!1544) (size!30354 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985266 () Bool)

(declare-fun res!659303 () Bool)

(assert (=> b!985266 (=> (not res!659303) (not e!555388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62033 (_ BitVec 32)) Bool)

(assert (=> b!985266 (= res!659303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985267 () Bool)

(assert (=> b!985267 (= e!555388 e!555386)))

(declare-fun res!659302 () Bool)

(assert (=> b!985267 (=> (not res!659302) (not e!555386))))

(assert (=> b!985267 (= res!659302 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29874 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15505 (ValueCell!11033 V!35689) V!35689)

(declare-fun dynLambda!1834 (Int (_ BitVec 64)) V!35689)

(assert (=> b!985267 (= lt!437168 (get!15505 (select (arr!29875 _values!1278) from!1932) (dynLambda!1834 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35689)

(declare-fun getCurrentListMapNoExtraKeys!3454 (array!62033 array!62035 (_ BitVec 32) (_ BitVec 32) V!35689 V!35689 (_ BitVec 32) Int) ListLongMap!13493)

(assert (=> b!985267 (= lt!437170 (getCurrentListMapNoExtraKeys!3454 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985268 () Bool)

(declare-fun res!659297 () Bool)

(assert (=> b!985268 (=> (not res!659297) (not e!555388))))

(declare-datatypes ((List!20689 0))(
  ( (Nil!20686) (Cons!20685 (h!21847 (_ BitVec 64)) (t!29560 List!20689)) )
))
(declare-fun arrayNoDuplicates!0 (array!62033 (_ BitVec 32) List!20689) Bool)

(assert (=> b!985268 (= res!659297 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20686))))

(declare-fun mapNonEmpty!36572 () Bool)

(declare-fun mapRes!36572 () Bool)

(declare-fun tp!69384 () Bool)

(declare-fun e!555385 () Bool)

(assert (=> mapNonEmpty!36572 (= mapRes!36572 (and tp!69384 e!555385))))

(declare-fun mapValue!36572 () ValueCell!11033)

(declare-fun mapRest!36572 () (Array (_ BitVec 32) ValueCell!11033))

(declare-fun mapKey!36572 () (_ BitVec 32))

(assert (=> mapNonEmpty!36572 (= (arr!29875 _values!1278) (store mapRest!36572 mapKey!36572 mapValue!36572))))

(declare-fun b!985269 () Bool)

(declare-fun res!659298 () Bool)

(assert (=> b!985269 (=> (not res!659298) (not e!555388))))

(assert (=> b!985269 (= res!659298 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985270 () Bool)

(declare-fun e!555387 () Bool)

(declare-fun e!555389 () Bool)

(assert (=> b!985270 (= e!555387 (and e!555389 mapRes!36572))))

(declare-fun condMapEmpty!36572 () Bool)

(declare-fun mapDefault!36572 () ValueCell!11033)

