; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77606 () Bool)

(assert start!77606)

(declare-fun b_free!16191 () Bool)

(declare-fun b_next!16191 () Bool)

(assert (=> start!77606 (= b_free!16191 (not b_next!16191))))

(declare-fun tp!56835 () Bool)

(declare-fun b_and!26557 () Bool)

(assert (=> start!77606 (= tp!56835 b_and!26557)))

(declare-fun b!904479 () Bool)

(declare-fun e!506819 () Bool)

(declare-fun e!506821 () Bool)

(assert (=> b!904479 (= e!506819 (not e!506821))))

(declare-fun res!610285 () Bool)

(assert (=> b!904479 (=> res!610285 e!506821)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53262 0))(
  ( (array!53263 (arr!25590 (Array (_ BitVec 32) (_ BitVec 64))) (size!26049 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53262)

(assert (=> b!904479 (= res!610285 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26049 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904479 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((V!29777 0))(
  ( (V!29778 (val!9355 Int)) )
))
(declare-fun zeroValue!1094 () V!29777)

(declare-datatypes ((ValueCell!8823 0))(
  ( (ValueCellFull!8823 (v!11860 V!29777)) (EmptyCell!8823) )
))
(declare-datatypes ((array!53264 0))(
  ( (array!53265 (arr!25591 (Array (_ BitVec 32) ValueCell!8823)) (size!26050 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53264)

(declare-datatypes ((Unit!30676 0))(
  ( (Unit!30677) )
))
(declare-fun lt!408245 () Unit!30676)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29777)

(declare-fun lemmaKeyInListMapIsInArray!181 (array!53262 array!53264 (_ BitVec 32) (_ BitVec 32) V!29777 V!29777 (_ BitVec 64) Int) Unit!30676)

(assert (=> b!904479 (= lt!408245 (lemmaKeyInListMapIsInArray!181 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!610281 () Bool)

(assert (=> start!77606 (=> (not res!610281) (not e!506819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77606 (= res!610281 (validMask!0 mask!1756))))

(assert (=> start!77606 e!506819))

(declare-fun e!506822 () Bool)

(declare-fun array_inv!20048 (array!53264) Bool)

(assert (=> start!77606 (and (array_inv!20048 _values!1152) e!506822)))

(assert (=> start!77606 tp!56835))

(assert (=> start!77606 true))

(declare-fun tp_is_empty!18609 () Bool)

(assert (=> start!77606 tp_is_empty!18609))

(declare-fun array_inv!20049 (array!53262) Bool)

(assert (=> start!77606 (array_inv!20049 _keys!1386)))

(declare-fun b!904480 () Bool)

(declare-fun e!506818 () Bool)

(assert (=> b!904480 (= e!506818 tp_is_empty!18609)))

(declare-fun b!904481 () Bool)

(declare-fun res!610287 () Bool)

(assert (=> b!904481 (=> (not res!610287) (not e!506819))))

(assert (=> b!904481 (= res!610287 (and (= (size!26050 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26049 _keys!1386) (size!26050 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904482 () Bool)

(declare-fun e!506820 () Bool)

(assert (=> b!904482 (= e!506820 tp_is_empty!18609)))

(declare-fun b!904483 () Bool)

(declare-fun e!506817 () Bool)

(assert (=> b!904483 (= e!506817 true)))

(declare-fun lt!408244 () V!29777)

(declare-datatypes ((tuple2!12154 0))(
  ( (tuple2!12155 (_1!6088 (_ BitVec 64)) (_2!6088 V!29777)) )
))
(declare-datatypes ((List!17971 0))(
  ( (Nil!17968) (Cons!17967 (h!19113 tuple2!12154) (t!25354 List!17971)) )
))
(declare-datatypes ((ListLongMap!10851 0))(
  ( (ListLongMap!10852 (toList!5441 List!17971)) )
))
(declare-fun lt!408246 () ListLongMap!10851)

(declare-fun apply!436 (ListLongMap!10851 (_ BitVec 64)) V!29777)

(assert (=> b!904483 (= lt!408244 (apply!436 lt!408246 k0!1033))))

(declare-fun b!904484 () Bool)

(assert (=> b!904484 (= e!506821 e!506817)))

(declare-fun res!610288 () Bool)

(assert (=> b!904484 (=> res!610288 e!506817)))

(declare-fun contains!4489 (ListLongMap!10851 (_ BitVec 64)) Bool)

(assert (=> b!904484 (= res!610288 (not (contains!4489 lt!408246 k0!1033)))))

(declare-fun getCurrentListMap!2710 (array!53262 array!53264 (_ BitVec 32) (_ BitVec 32) V!29777 V!29777 (_ BitVec 32) Int) ListLongMap!10851)

(assert (=> b!904484 (= lt!408246 (getCurrentListMap!2710 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904485 () Bool)

(declare-fun res!610286 () Bool)

(assert (=> b!904485 (=> (not res!610286) (not e!506819))))

(assert (=> b!904485 (= res!610286 (and (= (select (arr!25590 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904486 () Bool)

(declare-fun mapRes!29626 () Bool)

(assert (=> b!904486 (= e!506822 (and e!506820 mapRes!29626))))

(declare-fun condMapEmpty!29626 () Bool)

(declare-fun mapDefault!29626 () ValueCell!8823)

(assert (=> b!904486 (= condMapEmpty!29626 (= (arr!25591 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8823)) mapDefault!29626)))))

(declare-fun b!904487 () Bool)

(declare-fun res!610289 () Bool)

(assert (=> b!904487 (=> (not res!610289) (not e!506819))))

(assert (=> b!904487 (= res!610289 (contains!4489 (getCurrentListMap!2710 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29626 () Bool)

(assert (=> mapIsEmpty!29626 mapRes!29626))

(declare-fun b!904488 () Bool)

(declare-fun res!610283 () Bool)

(assert (=> b!904488 (=> (not res!610283) (not e!506819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53262 (_ BitVec 32)) Bool)

(assert (=> b!904488 (= res!610283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904489 () Bool)

(declare-fun res!610284 () Bool)

(assert (=> b!904489 (=> (not res!610284) (not e!506819))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904489 (= res!610284 (inRange!0 i!717 mask!1756))))

(declare-fun b!904490 () Bool)

(declare-fun res!610282 () Bool)

(assert (=> b!904490 (=> (not res!610282) (not e!506819))))

(declare-datatypes ((List!17972 0))(
  ( (Nil!17969) (Cons!17968 (h!19114 (_ BitVec 64)) (t!25355 List!17972)) )
))
(declare-fun arrayNoDuplicates!0 (array!53262 (_ BitVec 32) List!17972) Bool)

(assert (=> b!904490 (= res!610282 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17969))))

(declare-fun mapNonEmpty!29626 () Bool)

(declare-fun tp!56834 () Bool)

(assert (=> mapNonEmpty!29626 (= mapRes!29626 (and tp!56834 e!506818))))

(declare-fun mapValue!29626 () ValueCell!8823)

(declare-fun mapKey!29626 () (_ BitVec 32))

(declare-fun mapRest!29626 () (Array (_ BitVec 32) ValueCell!8823))

(assert (=> mapNonEmpty!29626 (= (arr!25591 _values!1152) (store mapRest!29626 mapKey!29626 mapValue!29626))))

(assert (= (and start!77606 res!610281) b!904481))

(assert (= (and b!904481 res!610287) b!904488))

(assert (= (and b!904488 res!610283) b!904490))

(assert (= (and b!904490 res!610282) b!904487))

(assert (= (and b!904487 res!610289) b!904489))

(assert (= (and b!904489 res!610284) b!904485))

(assert (= (and b!904485 res!610286) b!904479))

(assert (= (and b!904479 (not res!610285)) b!904484))

(assert (= (and b!904484 (not res!610288)) b!904483))

(assert (= (and b!904486 condMapEmpty!29626) mapIsEmpty!29626))

(assert (= (and b!904486 (not condMapEmpty!29626)) mapNonEmpty!29626))

(get-info :version)

(assert (= (and mapNonEmpty!29626 ((_ is ValueCellFull!8823) mapValue!29626)) b!904480))

(assert (= (and b!904486 ((_ is ValueCellFull!8823) mapDefault!29626)) b!904482))

(assert (= start!77606 b!904486))

(declare-fun m!839965 () Bool)

(assert (=> b!904485 m!839965))

(declare-fun m!839967 () Bool)

(assert (=> b!904489 m!839967))

(declare-fun m!839969 () Bool)

(assert (=> b!904490 m!839969))

(declare-fun m!839971 () Bool)

(assert (=> b!904484 m!839971))

(declare-fun m!839973 () Bool)

(assert (=> b!904484 m!839973))

(declare-fun m!839975 () Bool)

(assert (=> start!77606 m!839975))

(declare-fun m!839977 () Bool)

(assert (=> start!77606 m!839977))

(declare-fun m!839979 () Bool)

(assert (=> start!77606 m!839979))

(declare-fun m!839981 () Bool)

(assert (=> b!904488 m!839981))

(declare-fun m!839983 () Bool)

(assert (=> b!904487 m!839983))

(assert (=> b!904487 m!839983))

(declare-fun m!839985 () Bool)

(assert (=> b!904487 m!839985))

(declare-fun m!839987 () Bool)

(assert (=> b!904479 m!839987))

(declare-fun m!839989 () Bool)

(assert (=> b!904479 m!839989))

(declare-fun m!839991 () Bool)

(assert (=> mapNonEmpty!29626 m!839991))

(declare-fun m!839993 () Bool)

(assert (=> b!904483 m!839993))

(check-sat (not start!77606) (not b!904489) (not b!904490) (not mapNonEmpty!29626) tp_is_empty!18609 b_and!26557 (not b!904479) (not b!904488) (not b!904487) (not b_next!16191) (not b!904483) (not b!904484))
(check-sat b_and!26557 (not b_next!16191))
