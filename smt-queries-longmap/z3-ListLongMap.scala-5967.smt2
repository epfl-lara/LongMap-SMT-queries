; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77630 () Bool)

(assert start!77630)

(declare-fun b_free!16215 () Bool)

(declare-fun b_next!16215 () Bool)

(assert (=> start!77630 (= b_free!16215 (not b_next!16215))))

(declare-fun tp!56906 () Bool)

(declare-fun b_and!26583 () Bool)

(assert (=> start!77630 (= tp!56906 b_and!26583)))

(declare-fun b!904918 () Bool)

(declare-fun e!507076 () Bool)

(declare-fun tp_is_empty!18633 () Bool)

(assert (=> b!904918 (= e!507076 tp_is_empty!18633)))

(declare-fun b!904919 () Bool)

(declare-fun res!610615 () Bool)

(declare-fun e!507079 () Bool)

(assert (=> b!904919 (=> (not res!610615) (not e!507079))))

(declare-datatypes ((array!53310 0))(
  ( (array!53311 (arr!25614 (Array (_ BitVec 32) (_ BitVec 64))) (size!26073 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53310)

(declare-datatypes ((List!17989 0))(
  ( (Nil!17986) (Cons!17985 (h!19131 (_ BitVec 64)) (t!25376 List!17989)) )
))
(declare-fun arrayNoDuplicates!0 (array!53310 (_ BitVec 32) List!17989) Bool)

(assert (=> b!904919 (= res!610615 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17986))))

(declare-fun b!904920 () Bool)

(declare-fun e!507075 () Bool)

(declare-fun e!507078 () Bool)

(assert (=> b!904920 (= e!507075 e!507078)))

(declare-fun res!610614 () Bool)

(assert (=> b!904920 (=> res!610614 e!507078)))

(declare-datatypes ((V!29809 0))(
  ( (V!29810 (val!9367 Int)) )
))
(declare-datatypes ((tuple2!12176 0))(
  ( (tuple2!12177 (_1!6099 (_ BitVec 64)) (_2!6099 V!29809)) )
))
(declare-datatypes ((List!17990 0))(
  ( (Nil!17987) (Cons!17986 (h!19132 tuple2!12176) (t!25377 List!17990)) )
))
(declare-datatypes ((ListLongMap!10873 0))(
  ( (ListLongMap!10874 (toList!5452 List!17990)) )
))
(declare-fun lt!408364 () ListLongMap!10873)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4499 (ListLongMap!10873 (_ BitVec 64)) Bool)

(assert (=> b!904920 (= res!610614 (not (contains!4499 lt!408364 k0!1033)))))

(declare-datatypes ((ValueCell!8835 0))(
  ( (ValueCellFull!8835 (v!11872 V!29809)) (EmptyCell!8835) )
))
(declare-datatypes ((array!53312 0))(
  ( (array!53313 (arr!25615 (Array (_ BitVec 32) ValueCell!8835)) (size!26074 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53312)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29809)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29809)

(declare-fun getCurrentListMap!2720 (array!53310 array!53312 (_ BitVec 32) (_ BitVec 32) V!29809 V!29809 (_ BitVec 32) Int) ListLongMap!10873)

(assert (=> b!904920 (= lt!408364 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904921 () Bool)

(declare-fun e!507077 () Bool)

(assert (=> b!904921 (= e!507077 tp_is_empty!18633)))

(declare-fun res!610619 () Bool)

(assert (=> start!77630 (=> (not res!610619) (not e!507079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77630 (= res!610619 (validMask!0 mask!1756))))

(assert (=> start!77630 e!507079))

(declare-fun e!507074 () Bool)

(declare-fun array_inv!20068 (array!53312) Bool)

(assert (=> start!77630 (and (array_inv!20068 _values!1152) e!507074)))

(assert (=> start!77630 tp!56906))

(assert (=> start!77630 true))

(assert (=> start!77630 tp_is_empty!18633))

(declare-fun array_inv!20069 (array!53310) Bool)

(assert (=> start!77630 (array_inv!20069 _keys!1386)))

(declare-fun b!904922 () Bool)

(assert (=> b!904922 (= e!507078 true)))

(declare-fun lt!408366 () ListLongMap!10873)

(declare-fun lt!408362 () V!29809)

(declare-fun apply!444 (ListLongMap!10873 (_ BitVec 64)) V!29809)

(assert (=> b!904922 (= (apply!444 lt!408366 k0!1033) lt!408362)))

(declare-datatypes ((Unit!30698 0))(
  ( (Unit!30699) )
))
(declare-fun lt!408365 () Unit!30698)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!2 (array!53310 array!53312 (_ BitVec 32) (_ BitVec 32) V!29809 V!29809 (_ BitVec 64) V!29809 (_ BitVec 32) Int) Unit!30698)

(assert (=> b!904922 (= lt!408365 (lemmaListMapApplyFromThenApplyFromZero!2 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408362 i!717 defaultEntry!1160))))

(declare-fun b!904923 () Bool)

(declare-fun e!507081 () Bool)

(assert (=> b!904923 (= e!507079 e!507081)))

(declare-fun res!610613 () Bool)

(assert (=> b!904923 (=> (not res!610613) (not e!507081))))

(assert (=> b!904923 (= res!610613 (contains!4499 lt!408366 k0!1033))))

(assert (=> b!904923 (= lt!408366 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!904924 () Bool)

(declare-fun res!610618 () Bool)

(assert (=> b!904924 (=> (not res!610618) (not e!507081))))

(assert (=> b!904924 (= res!610618 (and (= (select (arr!25614 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904925 () Bool)

(declare-fun mapRes!29662 () Bool)

(assert (=> b!904925 (= e!507074 (and e!507076 mapRes!29662))))

(declare-fun condMapEmpty!29662 () Bool)

(declare-fun mapDefault!29662 () ValueCell!8835)

(assert (=> b!904925 (= condMapEmpty!29662 (= (arr!25615 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8835)) mapDefault!29662)))))

(declare-fun mapNonEmpty!29662 () Bool)

(declare-fun tp!56907 () Bool)

(assert (=> mapNonEmpty!29662 (= mapRes!29662 (and tp!56907 e!507077))))

(declare-fun mapRest!29662 () (Array (_ BitVec 32) ValueCell!8835))

(declare-fun mapValue!29662 () ValueCell!8835)

(declare-fun mapKey!29662 () (_ BitVec 32))

(assert (=> mapNonEmpty!29662 (= (arr!25615 _values!1152) (store mapRest!29662 mapKey!29662 mapValue!29662))))

(declare-fun b!904926 () Bool)

(declare-fun res!610610 () Bool)

(assert (=> b!904926 (=> (not res!610610) (not e!507079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53310 (_ BitVec 32)) Bool)

(assert (=> b!904926 (= res!610610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904927 () Bool)

(declare-fun res!610616 () Bool)

(assert (=> b!904927 (=> res!610616 e!507078)))

(assert (=> b!904927 (= res!610616 (not (= (apply!444 lt!408364 k0!1033) lt!408362)))))

(declare-fun b!904928 () Bool)

(declare-fun res!610612 () Bool)

(assert (=> b!904928 (=> (not res!610612) (not e!507081))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904928 (= res!610612 (inRange!0 i!717 mask!1756))))

(declare-fun b!904929 () Bool)

(assert (=> b!904929 (= e!507081 (not e!507075))))

(declare-fun res!610617 () Bool)

(assert (=> b!904929 (=> res!610617 e!507075)))

(assert (=> b!904929 (= res!610617 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26073 _keys!1386))))))

(declare-fun get!13452 (ValueCell!8835 V!29809) V!29809)

(declare-fun dynLambda!1320 (Int (_ BitVec 64)) V!29809)

(assert (=> b!904929 (= lt!408362 (get!13452 (select (arr!25615 _values!1152) i!717) (dynLambda!1320 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904929 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408363 () Unit!30698)

(declare-fun lemmaKeyInListMapIsInArray!192 (array!53310 array!53312 (_ BitVec 32) (_ BitVec 32) V!29809 V!29809 (_ BitVec 64) Int) Unit!30698)

(assert (=> b!904929 (= lt!408363 (lemmaKeyInListMapIsInArray!192 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904930 () Bool)

(declare-fun res!610611 () Bool)

(assert (=> b!904930 (=> (not res!610611) (not e!507079))))

(assert (=> b!904930 (= res!610611 (and (= (size!26074 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26073 _keys!1386) (size!26074 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29662 () Bool)

(assert (=> mapIsEmpty!29662 mapRes!29662))

(assert (= (and start!77630 res!610619) b!904930))

(assert (= (and b!904930 res!610611) b!904926))

(assert (= (and b!904926 res!610610) b!904919))

(assert (= (and b!904919 res!610615) b!904923))

(assert (= (and b!904923 res!610613) b!904928))

(assert (= (and b!904928 res!610612) b!904924))

(assert (= (and b!904924 res!610618) b!904929))

(assert (= (and b!904929 (not res!610617)) b!904920))

(assert (= (and b!904920 (not res!610614)) b!904927))

(assert (= (and b!904927 (not res!610616)) b!904922))

(assert (= (and b!904925 condMapEmpty!29662) mapIsEmpty!29662))

(assert (= (and b!904925 (not condMapEmpty!29662)) mapNonEmpty!29662))

(get-info :version)

(assert (= (and mapNonEmpty!29662 ((_ is ValueCellFull!8835) mapValue!29662)) b!904921))

(assert (= (and b!904925 ((_ is ValueCellFull!8835) mapDefault!29662)) b!904918))

(assert (= start!77630 b!904925))

(declare-fun b_lambda!13089 () Bool)

(assert (=> (not b_lambda!13089) (not b!904929)))

(declare-fun t!25375 () Bool)

(declare-fun tb!5237 () Bool)

(assert (=> (and start!77630 (= defaultEntry!1160 defaultEntry!1160) t!25375) tb!5237))

(declare-fun result!10269 () Bool)

(assert (=> tb!5237 (= result!10269 tp_is_empty!18633)))

(assert (=> b!904929 t!25375))

(declare-fun b_and!26585 () Bool)

(assert (= b_and!26583 (and (=> t!25375 result!10269) b_and!26585)))

(declare-fun m!840335 () Bool)

(assert (=> b!904929 m!840335))

(declare-fun m!840337 () Bool)

(assert (=> b!904929 m!840337))

(declare-fun m!840339 () Bool)

(assert (=> b!904929 m!840339))

(declare-fun m!840341 () Bool)

(assert (=> b!904929 m!840341))

(assert (=> b!904929 m!840335))

(assert (=> b!904929 m!840339))

(declare-fun m!840343 () Bool)

(assert (=> b!904929 m!840343))

(declare-fun m!840345 () Bool)

(assert (=> mapNonEmpty!29662 m!840345))

(declare-fun m!840347 () Bool)

(assert (=> start!77630 m!840347))

(declare-fun m!840349 () Bool)

(assert (=> start!77630 m!840349))

(declare-fun m!840351 () Bool)

(assert (=> start!77630 m!840351))

(declare-fun m!840353 () Bool)

(assert (=> b!904923 m!840353))

(declare-fun m!840355 () Bool)

(assert (=> b!904923 m!840355))

(declare-fun m!840357 () Bool)

(assert (=> b!904927 m!840357))

(declare-fun m!840359 () Bool)

(assert (=> b!904928 m!840359))

(declare-fun m!840361 () Bool)

(assert (=> b!904926 m!840361))

(declare-fun m!840363 () Bool)

(assert (=> b!904919 m!840363))

(declare-fun m!840365 () Bool)

(assert (=> b!904920 m!840365))

(declare-fun m!840367 () Bool)

(assert (=> b!904920 m!840367))

(declare-fun m!840369 () Bool)

(assert (=> b!904922 m!840369))

(declare-fun m!840371 () Bool)

(assert (=> b!904922 m!840371))

(declare-fun m!840373 () Bool)

(assert (=> b!904924 m!840373))

(check-sat (not b!904929) (not b!904922) (not b!904926) (not start!77630) (not mapNonEmpty!29662) (not b_next!16215) tp_is_empty!18633 (not b!904923) (not b!904927) (not b!904928) (not b_lambda!13089) (not b!904920) b_and!26585 (not b!904919))
(check-sat b_and!26585 (not b_next!16215))
