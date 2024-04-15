; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77682 () Bool)

(assert start!77682)

(declare-fun b_free!16285 () Bool)

(declare-fun b_next!16285 () Bool)

(assert (=> start!77682 (= b_free!16285 (not b_next!16285))))

(declare-fun tp!57117 () Bool)

(declare-fun b_and!26697 () Bool)

(assert (=> start!77682 (= tp!57117 b_and!26697)))

(declare-fun b!906114 () Bool)

(declare-fun e!507771 () Bool)

(declare-fun tp_is_empty!18703 () Bool)

(assert (=> b!906114 (= e!507771 tp_is_empty!18703)))

(declare-fun b!906115 () Bool)

(declare-fun e!507772 () Bool)

(declare-fun mapRes!29767 () Bool)

(assert (=> b!906115 (= e!507772 (and e!507771 mapRes!29767))))

(declare-fun condMapEmpty!29767 () Bool)

(declare-datatypes ((V!29903 0))(
  ( (V!29904 (val!9402 Int)) )
))
(declare-datatypes ((ValueCell!8870 0))(
  ( (ValueCellFull!8870 (v!11906 V!29903)) (EmptyCell!8870) )
))
(declare-datatypes ((array!53425 0))(
  ( (array!53426 (arr!25672 (Array (_ BitVec 32) ValueCell!8870)) (size!26133 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53425)

(declare-fun mapDefault!29767 () ValueCell!8870)

(assert (=> b!906115 (= condMapEmpty!29767 (= (arr!25672 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8870)) mapDefault!29767)))))

(declare-fun res!611550 () Bool)

(declare-fun e!507773 () Bool)

(assert (=> start!77682 (=> (not res!611550) (not e!507773))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77682 (= res!611550 (validMask!0 mask!1756))))

(assert (=> start!77682 e!507773))

(declare-fun array_inv!20152 (array!53425) Bool)

(assert (=> start!77682 (and (array_inv!20152 _values!1152) e!507772)))

(assert (=> start!77682 tp!57117))

(assert (=> start!77682 true))

(assert (=> start!77682 tp_is_empty!18703))

(declare-datatypes ((array!53427 0))(
  ( (array!53428 (arr!25673 (Array (_ BitVec 32) (_ BitVec 64))) (size!26134 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53427)

(declare-fun array_inv!20153 (array!53427) Bool)

(assert (=> start!77682 (array_inv!20153 _keys!1386)))

(declare-fun b!906116 () Bool)

(declare-fun res!611555 () Bool)

(declare-fun e!507770 () Bool)

(assert (=> b!906116 (=> res!611555 e!507770)))

(declare-datatypes ((tuple2!12258 0))(
  ( (tuple2!12259 (_1!6140 (_ BitVec 64)) (_2!6140 V!29903)) )
))
(declare-datatypes ((List!18048 0))(
  ( (Nil!18045) (Cons!18044 (h!19190 tuple2!12258) (t!25496 List!18048)) )
))
(declare-datatypes ((ListLongMap!10945 0))(
  ( (ListLongMap!10946 (toList!5488 List!18048)) )
))
(declare-fun lt!408655 () ListLongMap!10945)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408651 () V!29903)

(declare-fun apply!464 (ListLongMap!10945 (_ BitVec 64)) V!29903)

(assert (=> b!906116 (= res!611555 (not (= (apply!464 lt!408655 k0!1033) lt!408651)))))

(declare-fun b!906117 () Bool)

(declare-fun res!611557 () Bool)

(declare-fun e!507766 () Bool)

(assert (=> b!906117 (=> (not res!611557) (not e!507766))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906117 (= res!611557 (and (= (select (arr!25673 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906118 () Bool)

(assert (=> b!906118 (= e!507773 e!507766)))

(declare-fun res!611556 () Bool)

(assert (=> b!906118 (=> (not res!611556) (not e!507766))))

(declare-fun lt!408654 () ListLongMap!10945)

(declare-fun contains!4494 (ListLongMap!10945 (_ BitVec 64)) Bool)

(assert (=> b!906118 (= res!611556 (contains!4494 lt!408654 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29903)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29903)

(declare-fun getCurrentListMap!2698 (array!53427 array!53425 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 32) Int) ListLongMap!10945)

(assert (=> b!906118 (= lt!408654 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906119 () Bool)

(declare-fun e!507768 () Bool)

(assert (=> b!906119 (= e!507766 (not e!507768))))

(declare-fun res!611551 () Bool)

(assert (=> b!906119 (=> res!611551 e!507768)))

(assert (=> b!906119 (= res!611551 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26134 _keys!1386))))))

(declare-fun get!13500 (ValueCell!8870 V!29903) V!29903)

(declare-fun dynLambda!1339 (Int (_ BitVec 64)) V!29903)

(assert (=> b!906119 (= lt!408651 (get!13500 (select (arr!25672 _values!1152) i!717) (dynLambda!1339 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906119 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30676 0))(
  ( (Unit!30677) )
))
(declare-fun lt!408653 () Unit!30676)

(declare-fun lemmaKeyInListMapIsInArray!215 (array!53427 array!53425 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) Int) Unit!30676)

(assert (=> b!906119 (= lt!408653 (lemmaKeyInListMapIsInArray!215 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29767 () Bool)

(declare-fun tp!57118 () Bool)

(declare-fun e!507769 () Bool)

(assert (=> mapNonEmpty!29767 (= mapRes!29767 (and tp!57118 e!507769))))

(declare-fun mapKey!29767 () (_ BitVec 32))

(declare-fun mapRest!29767 () (Array (_ BitVec 32) ValueCell!8870))

(declare-fun mapValue!29767 () ValueCell!8870)

(assert (=> mapNonEmpty!29767 (= (arr!25672 _values!1152) (store mapRest!29767 mapKey!29767 mapValue!29767))))

(declare-fun b!906120 () Bool)

(declare-fun res!611553 () Bool)

(assert (=> b!906120 (=> (not res!611553) (not e!507773))))

(assert (=> b!906120 (= res!611553 (and (= (size!26133 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26134 _keys!1386) (size!26133 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906121 () Bool)

(assert (=> b!906121 (= e!507768 e!507770)))

(declare-fun res!611552 () Bool)

(assert (=> b!906121 (=> res!611552 e!507770)))

(assert (=> b!906121 (= res!611552 (not (contains!4494 lt!408655 k0!1033)))))

(assert (=> b!906121 (= lt!408655 (getCurrentListMap!2698 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906122 () Bool)

(assert (=> b!906122 (= e!507770 true)))

(assert (=> b!906122 (= (apply!464 lt!408654 k0!1033) lt!408651)))

(declare-fun lt!408652 () Unit!30676)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!25 (array!53427 array!53425 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) V!29903 (_ BitVec 32) Int) Unit!30676)

(assert (=> b!906122 (= lt!408652 (lemmaListMapApplyFromThenApplyFromZero!25 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408651 i!717 defaultEntry!1160))))

(declare-fun b!906123 () Bool)

(declare-fun res!611559 () Bool)

(assert (=> b!906123 (=> (not res!611559) (not e!507766))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906123 (= res!611559 (inRange!0 i!717 mask!1756))))

(declare-fun b!906124 () Bool)

(declare-fun res!611554 () Bool)

(assert (=> b!906124 (=> (not res!611554) (not e!507773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53427 (_ BitVec 32)) Bool)

(assert (=> b!906124 (= res!611554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906125 () Bool)

(assert (=> b!906125 (= e!507769 tp_is_empty!18703)))

(declare-fun mapIsEmpty!29767 () Bool)

(assert (=> mapIsEmpty!29767 mapRes!29767))

(declare-fun b!906126 () Bool)

(declare-fun res!611558 () Bool)

(assert (=> b!906126 (=> (not res!611558) (not e!507773))))

(declare-datatypes ((List!18049 0))(
  ( (Nil!18046) (Cons!18045 (h!19191 (_ BitVec 64)) (t!25497 List!18049)) )
))
(declare-fun arrayNoDuplicates!0 (array!53427 (_ BitVec 32) List!18049) Bool)

(assert (=> b!906126 (= res!611558 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18046))))

(assert (= (and start!77682 res!611550) b!906120))

(assert (= (and b!906120 res!611553) b!906124))

(assert (= (and b!906124 res!611554) b!906126))

(assert (= (and b!906126 res!611558) b!906118))

(assert (= (and b!906118 res!611556) b!906123))

(assert (= (and b!906123 res!611559) b!906117))

(assert (= (and b!906117 res!611557) b!906119))

(assert (= (and b!906119 (not res!611551)) b!906121))

(assert (= (and b!906121 (not res!611552)) b!906116))

(assert (= (and b!906116 (not res!611555)) b!906122))

(assert (= (and b!906115 condMapEmpty!29767) mapIsEmpty!29767))

(assert (= (and b!906115 (not condMapEmpty!29767)) mapNonEmpty!29767))

(get-info :version)

(assert (= (and mapNonEmpty!29767 ((_ is ValueCellFull!8870) mapValue!29767)) b!906125))

(assert (= (and b!906115 ((_ is ValueCellFull!8870) mapDefault!29767)) b!906114))

(assert (= start!77682 b!906115))

(declare-fun b_lambda!13141 () Bool)

(assert (=> (not b_lambda!13141) (not b!906119)))

(declare-fun t!25495 () Bool)

(declare-fun tb!5299 () Bool)

(assert (=> (and start!77682 (= defaultEntry!1160 defaultEntry!1160) t!25495) tb!5299))

(declare-fun result!10401 () Bool)

(assert (=> tb!5299 (= result!10401 tp_is_empty!18703)))

(assert (=> b!906119 t!25495))

(declare-fun b_and!26699 () Bool)

(assert (= b_and!26697 (and (=> t!25495 result!10401) b_and!26699)))

(declare-fun m!840977 () Bool)

(assert (=> b!906118 m!840977))

(declare-fun m!840979 () Bool)

(assert (=> b!906118 m!840979))

(declare-fun m!840981 () Bool)

(assert (=> b!906117 m!840981))

(declare-fun m!840983 () Bool)

(assert (=> b!906123 m!840983))

(declare-fun m!840985 () Bool)

(assert (=> b!906126 m!840985))

(declare-fun m!840987 () Bool)

(assert (=> mapNonEmpty!29767 m!840987))

(declare-fun m!840989 () Bool)

(assert (=> b!906122 m!840989))

(declare-fun m!840991 () Bool)

(assert (=> b!906122 m!840991))

(declare-fun m!840993 () Bool)

(assert (=> b!906119 m!840993))

(declare-fun m!840995 () Bool)

(assert (=> b!906119 m!840995))

(declare-fun m!840997 () Bool)

(assert (=> b!906119 m!840997))

(declare-fun m!840999 () Bool)

(assert (=> b!906119 m!840999))

(assert (=> b!906119 m!840993))

(assert (=> b!906119 m!840997))

(declare-fun m!841001 () Bool)

(assert (=> b!906119 m!841001))

(declare-fun m!841003 () Bool)

(assert (=> b!906116 m!841003))

(declare-fun m!841005 () Bool)

(assert (=> start!77682 m!841005))

(declare-fun m!841007 () Bool)

(assert (=> start!77682 m!841007))

(declare-fun m!841009 () Bool)

(assert (=> start!77682 m!841009))

(declare-fun m!841011 () Bool)

(assert (=> b!906124 m!841011))

(declare-fun m!841013 () Bool)

(assert (=> b!906121 m!841013))

(declare-fun m!841015 () Bool)

(assert (=> b!906121 m!841015))

(check-sat (not b!906121) (not b!906124) (not b!906126) (not start!77682) (not b!906119) (not b!906122) (not b_next!16285) (not b!906118) (not mapNonEmpty!29767) b_and!26699 (not b!906116) tp_is_empty!18703 (not b!906123) (not b_lambda!13141))
(check-sat b_and!26699 (not b_next!16285))
