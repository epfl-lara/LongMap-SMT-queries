; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109326 () Bool)

(assert start!109326)

(declare-fun b_free!28815 () Bool)

(declare-fun b_next!28815 () Bool)

(assert (=> start!109326 (= b_free!28815 (not b_next!28815))))

(declare-fun tp!101564 () Bool)

(declare-fun b_and!46905 () Bool)

(assert (=> start!109326 (= tp!101564 b_and!46905)))

(declare-fun res!859825 () Bool)

(declare-fun e!738393 () Bool)

(assert (=> start!109326 (=> (not res!859825) (not e!738393))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109326 (= res!859825 (validMask!0 mask!2175))))

(assert (=> start!109326 e!738393))

(declare-fun tp_is_empty!34455 () Bool)

(assert (=> start!109326 tp_is_empty!34455))

(assert (=> start!109326 true))

(declare-datatypes ((V!51043 0))(
  ( (V!51044 (val!17302 Int)) )
))
(declare-datatypes ((ValueCell!16329 0))(
  ( (ValueCellFull!16329 (v!19905 V!51043)) (EmptyCell!16329) )
))
(declare-datatypes ((array!85936 0))(
  ( (array!85937 (arr!41469 (Array (_ BitVec 32) ValueCell!16329)) (size!42019 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85936)

(declare-fun e!738392 () Bool)

(declare-fun array_inv!31409 (array!85936) Bool)

(assert (=> start!109326 (and (array_inv!31409 _values!1445) e!738392)))

(declare-datatypes ((array!85938 0))(
  ( (array!85939 (arr!41470 (Array (_ BitVec 32) (_ BitVec 64))) (size!42020 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85938)

(declare-fun array_inv!31410 (array!85938) Bool)

(assert (=> start!109326 (array_inv!31410 _keys!1741)))

(assert (=> start!109326 tp!101564))

(declare-fun b!1293872 () Bool)

(declare-fun res!859823 () Bool)

(assert (=> b!1293872 (=> (not res!859823) (not e!738393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85938 (_ BitVec 32)) Bool)

(assert (=> b!1293872 (= res!859823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53243 () Bool)

(declare-fun mapRes!53243 () Bool)

(declare-fun tp!101563 () Bool)

(declare-fun e!738390 () Bool)

(assert (=> mapNonEmpty!53243 (= mapRes!53243 (and tp!101563 e!738390))))

(declare-fun mapRest!53243 () (Array (_ BitVec 32) ValueCell!16329))

(declare-fun mapKey!53243 () (_ BitVec 32))

(declare-fun mapValue!53243 () ValueCell!16329)

(assert (=> mapNonEmpty!53243 (= (arr!41469 _values!1445) (store mapRest!53243 mapKey!53243 mapValue!53243))))

(declare-fun b!1293873 () Bool)

(declare-fun res!859829 () Bool)

(assert (=> b!1293873 (=> (not res!859829) (not e!738393))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293873 (= res!859829 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42020 _keys!1741))))))

(declare-fun mapIsEmpty!53243 () Bool)

(assert (=> mapIsEmpty!53243 mapRes!53243))

(declare-fun b!1293874 () Bool)

(assert (=> b!1293874 (= e!738390 tp_is_empty!34455)))

(declare-fun b!1293875 () Bool)

(declare-fun res!859830 () Bool)

(assert (=> b!1293875 (=> (not res!859830) (not e!738393))))

(declare-fun minValue!1387 () V!51043)

(declare-fun zeroValue!1387 () V!51043)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22270 0))(
  ( (tuple2!22271 (_1!11146 (_ BitVec 64)) (_2!11146 V!51043)) )
))
(declare-datatypes ((List!29415 0))(
  ( (Nil!29412) (Cons!29411 (h!30620 tuple2!22270) (t!42979 List!29415)) )
))
(declare-datatypes ((ListLongMap!19927 0))(
  ( (ListLongMap!19928 (toList!9979 List!29415)) )
))
(declare-fun contains!8097 (ListLongMap!19927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5020 (array!85938 array!85936 (_ BitVec 32) (_ BitVec 32) V!51043 V!51043 (_ BitVec 32) Int) ListLongMap!19927)

(assert (=> b!1293875 (= res!859830 (contains!8097 (getCurrentListMap!5020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293876 () Bool)

(declare-fun e!738391 () Bool)

(assert (=> b!1293876 (= e!738393 (not e!738391))))

(declare-fun res!859822 () Bool)

(assert (=> b!1293876 (=> res!859822 e!738391)))

(assert (=> b!1293876 (= res!859822 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293876 (not (contains!8097 (ListLongMap!19928 Nil!29412) k0!1205))))

(declare-datatypes ((Unit!42850 0))(
  ( (Unit!42851) )
))
(declare-fun lt!579659 () Unit!42850)

(declare-fun emptyContainsNothing!146 ((_ BitVec 64)) Unit!42850)

(assert (=> b!1293876 (= lt!579659 (emptyContainsNothing!146 k0!1205))))

(declare-fun b!1293877 () Bool)

(declare-fun e!738395 () Bool)

(assert (=> b!1293877 (= e!738395 tp_is_empty!34455)))

(declare-fun b!1293878 () Bool)

(declare-fun res!859827 () Bool)

(assert (=> b!1293878 (=> (not res!859827) (not e!738393))))

(assert (=> b!1293878 (= res!859827 (and (= (size!42019 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42020 _keys!1741) (size!42019 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293879 () Bool)

(assert (=> b!1293879 (= e!738392 (and e!738395 mapRes!53243))))

(declare-fun condMapEmpty!53243 () Bool)

(declare-fun mapDefault!53243 () ValueCell!16329)

(assert (=> b!1293879 (= condMapEmpty!53243 (= (arr!41469 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16329)) mapDefault!53243)))))

(declare-fun b!1293880 () Bool)

(declare-fun res!859824 () Bool)

(assert (=> b!1293880 (=> (not res!859824) (not e!738393))))

(assert (=> b!1293880 (= res!859824 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42020 _keys!1741))))))

(declare-fun b!1293881 () Bool)

(assert (=> b!1293881 (= e!738391 true)))

(declare-fun lt!579658 () ListLongMap!19927)

(declare-fun +!4407 (ListLongMap!19927 tuple2!22270) ListLongMap!19927)

(assert (=> b!1293881 (not (contains!8097 (+!4407 lt!579658 (tuple2!22271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579657 () Unit!42850)

(declare-fun addStillNotContains!425 (ListLongMap!19927 (_ BitVec 64) V!51043 (_ BitVec 64)) Unit!42850)

(assert (=> b!1293881 (= lt!579657 (addStillNotContains!425 lt!579658 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6039 (array!85938 array!85936 (_ BitVec 32) (_ BitVec 32) V!51043 V!51043 (_ BitVec 32) Int) ListLongMap!19927)

(assert (=> b!1293881 (= lt!579658 (getCurrentListMapNoExtraKeys!6039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293882 () Bool)

(declare-fun res!859828 () Bool)

(assert (=> b!1293882 (=> (not res!859828) (not e!738393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293882 (= res!859828 (not (validKeyInArray!0 (select (arr!41470 _keys!1741) from!2144))))))

(declare-fun b!1293883 () Bool)

(declare-fun res!859826 () Bool)

(assert (=> b!1293883 (=> (not res!859826) (not e!738393))))

(declare-datatypes ((List!29416 0))(
  ( (Nil!29413) (Cons!29412 (h!30621 (_ BitVec 64)) (t!42980 List!29416)) )
))
(declare-fun arrayNoDuplicates!0 (array!85938 (_ BitVec 32) List!29416) Bool)

(assert (=> b!1293883 (= res!859826 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29413))))

(assert (= (and start!109326 res!859825) b!1293878))

(assert (= (and b!1293878 res!859827) b!1293872))

(assert (= (and b!1293872 res!859823) b!1293883))

(assert (= (and b!1293883 res!859826) b!1293880))

(assert (= (and b!1293880 res!859824) b!1293875))

(assert (= (and b!1293875 res!859830) b!1293873))

(assert (= (and b!1293873 res!859829) b!1293882))

(assert (= (and b!1293882 res!859828) b!1293876))

(assert (= (and b!1293876 (not res!859822)) b!1293881))

(assert (= (and b!1293879 condMapEmpty!53243) mapIsEmpty!53243))

(assert (= (and b!1293879 (not condMapEmpty!53243)) mapNonEmpty!53243))

(get-info :version)

(assert (= (and mapNonEmpty!53243 ((_ is ValueCellFull!16329) mapValue!53243)) b!1293874))

(assert (= (and b!1293879 ((_ is ValueCellFull!16329) mapDefault!53243)) b!1293877))

(assert (= start!109326 b!1293879))

(declare-fun m!1186219 () Bool)

(assert (=> b!1293882 m!1186219))

(assert (=> b!1293882 m!1186219))

(declare-fun m!1186221 () Bool)

(assert (=> b!1293882 m!1186221))

(declare-fun m!1186223 () Bool)

(assert (=> b!1293875 m!1186223))

(assert (=> b!1293875 m!1186223))

(declare-fun m!1186225 () Bool)

(assert (=> b!1293875 m!1186225))

(declare-fun m!1186227 () Bool)

(assert (=> start!109326 m!1186227))

(declare-fun m!1186229 () Bool)

(assert (=> start!109326 m!1186229))

(declare-fun m!1186231 () Bool)

(assert (=> start!109326 m!1186231))

(declare-fun m!1186233 () Bool)

(assert (=> b!1293876 m!1186233))

(declare-fun m!1186235 () Bool)

(assert (=> b!1293876 m!1186235))

(declare-fun m!1186237 () Bool)

(assert (=> b!1293872 m!1186237))

(declare-fun m!1186239 () Bool)

(assert (=> b!1293883 m!1186239))

(declare-fun m!1186241 () Bool)

(assert (=> b!1293881 m!1186241))

(assert (=> b!1293881 m!1186241))

(declare-fun m!1186243 () Bool)

(assert (=> b!1293881 m!1186243))

(declare-fun m!1186245 () Bool)

(assert (=> b!1293881 m!1186245))

(declare-fun m!1186247 () Bool)

(assert (=> b!1293881 m!1186247))

(declare-fun m!1186249 () Bool)

(assert (=> mapNonEmpty!53243 m!1186249))

(check-sat (not b_next!28815) (not b!1293882) (not b!1293881) (not start!109326) (not b!1293876) b_and!46905 tp_is_empty!34455 (not b!1293872) (not b!1293883) (not b!1293875) (not mapNonEmpty!53243))
(check-sat b_and!46905 (not b_next!28815))
