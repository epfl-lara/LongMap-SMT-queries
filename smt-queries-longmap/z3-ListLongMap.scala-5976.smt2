; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77684 () Bool)

(assert start!77684)

(declare-fun b_free!16269 () Bool)

(declare-fun b_next!16269 () Bool)

(assert (=> start!77684 (= b_free!16269 (not b_next!16269))))

(declare-fun tp!57069 () Bool)

(declare-fun b_and!26691 () Bool)

(assert (=> start!77684 (= tp!57069 b_and!26691)))

(declare-fun b!906025 () Bool)

(declare-fun res!611424 () Bool)

(declare-fun e!507729 () Bool)

(assert (=> b!906025 (=> res!611424 e!507729)))

(declare-datatypes ((V!29881 0))(
  ( (V!29882 (val!9394 Int)) )
))
(declare-fun lt!408769 () V!29881)

(declare-datatypes ((tuple2!12224 0))(
  ( (tuple2!12225 (_1!6123 (_ BitVec 64)) (_2!6123 V!29881)) )
))
(declare-datatypes ((List!18032 0))(
  ( (Nil!18029) (Cons!18028 (h!19174 tuple2!12224) (t!25473 List!18032)) )
))
(declare-datatypes ((ListLongMap!10921 0))(
  ( (ListLongMap!10922 (toList!5476 List!18032)) )
))
(declare-fun lt!408771 () ListLongMap!10921)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!464 (ListLongMap!10921 (_ BitVec 64)) V!29881)

(assert (=> b!906025 (= res!611424 (not (= (apply!464 lt!408771 k0!1033) lt!408769)))))

(declare-fun b!906026 () Bool)

(declare-fun res!611421 () Bool)

(declare-fun e!507724 () Bool)

(assert (=> b!906026 (=> (not res!611421) (not e!507724))))

(declare-datatypes ((ValueCell!8862 0))(
  ( (ValueCellFull!8862 (v!11899 V!29881)) (EmptyCell!8862) )
))
(declare-datatypes ((array!53416 0))(
  ( (array!53417 (arr!25667 (Array (_ BitVec 32) ValueCell!8862)) (size!26126 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53416)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53418 0))(
  ( (array!53419 (arr!25668 (Array (_ BitVec 32) (_ BitVec 64))) (size!26127 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53418)

(assert (=> b!906026 (= res!611421 (and (= (size!26126 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26127 _keys!1386) (size!26126 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906027 () Bool)

(declare-fun e!507726 () Bool)

(declare-fun e!507722 () Bool)

(assert (=> b!906027 (= e!507726 (not e!507722))))

(declare-fun res!611423 () Bool)

(assert (=> b!906027 (=> res!611423 e!507722)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906027 (= res!611423 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26127 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13490 (ValueCell!8862 V!29881) V!29881)

(declare-fun dynLambda!1340 (Int (_ BitVec 64)) V!29881)

(assert (=> b!906027 (= lt!408769 (get!13490 (select (arr!25667 _values!1152) i!717) (dynLambda!1340 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906027 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29881)

(declare-fun minValue!1094 () V!29881)

(declare-datatypes ((Unit!30746 0))(
  ( (Unit!30747) )
))
(declare-fun lt!408770 () Unit!30746)

(declare-fun lemmaKeyInListMapIsInArray!212 (array!53418 array!53416 (_ BitVec 32) (_ BitVec 32) V!29881 V!29881 (_ BitVec 64) Int) Unit!30746)

(assert (=> b!906027 (= lt!408770 (lemmaKeyInListMapIsInArray!212 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29743 () Bool)

(declare-fun mapRes!29743 () Bool)

(declare-fun tp!57068 () Bool)

(declare-fun e!507728 () Bool)

(assert (=> mapNonEmpty!29743 (= mapRes!29743 (and tp!57068 e!507728))))

(declare-fun mapKey!29743 () (_ BitVec 32))

(declare-fun mapValue!29743 () ValueCell!8862)

(declare-fun mapRest!29743 () (Array (_ BitVec 32) ValueCell!8862))

(assert (=> mapNonEmpty!29743 (= (arr!25667 _values!1152) (store mapRest!29743 mapKey!29743 mapValue!29743))))

(declare-fun b!906028 () Bool)

(declare-fun e!507723 () Bool)

(declare-fun tp_is_empty!18687 () Bool)

(assert (=> b!906028 (= e!507723 tp_is_empty!18687)))

(declare-fun mapIsEmpty!29743 () Bool)

(assert (=> mapIsEmpty!29743 mapRes!29743))

(declare-fun b!906030 () Bool)

(assert (=> b!906030 (= e!507729 true)))

(declare-fun lt!408768 () ListLongMap!10921)

(assert (=> b!906030 (= (apply!464 lt!408768 k0!1033) lt!408769)))

(declare-fun lt!408767 () Unit!30746)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!19 (array!53418 array!53416 (_ BitVec 32) (_ BitVec 32) V!29881 V!29881 (_ BitVec 64) V!29881 (_ BitVec 32) Int) Unit!30746)

(assert (=> b!906030 (= lt!408767 (lemmaListMapApplyFromThenApplyFromZero!19 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408769 i!717 defaultEntry!1160))))

(declare-fun b!906031 () Bool)

(declare-fun res!611429 () Bool)

(assert (=> b!906031 (=> (not res!611429) (not e!507726))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906031 (= res!611429 (inRange!0 i!717 mask!1756))))

(declare-fun b!906032 () Bool)

(assert (=> b!906032 (= e!507724 e!507726)))

(declare-fun res!611422 () Bool)

(assert (=> b!906032 (=> (not res!611422) (not e!507726))))

(declare-fun contains!4521 (ListLongMap!10921 (_ BitVec 64)) Bool)

(assert (=> b!906032 (= res!611422 (contains!4521 lt!408768 k0!1033))))

(declare-fun getCurrentListMap!2742 (array!53418 array!53416 (_ BitVec 32) (_ BitVec 32) V!29881 V!29881 (_ BitVec 32) Int) ListLongMap!10921)

(assert (=> b!906032 (= lt!408768 (getCurrentListMap!2742 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906033 () Bool)

(declare-fun res!611427 () Bool)

(assert (=> b!906033 (=> (not res!611427) (not e!507724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53418 (_ BitVec 32)) Bool)

(assert (=> b!906033 (= res!611427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906034 () Bool)

(assert (=> b!906034 (= e!507728 tp_is_empty!18687)))

(declare-fun b!906035 () Bool)

(declare-fun res!611428 () Bool)

(assert (=> b!906035 (=> (not res!611428) (not e!507726))))

(assert (=> b!906035 (= res!611428 (and (= (select (arr!25668 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906036 () Bool)

(declare-fun res!611425 () Bool)

(assert (=> b!906036 (=> (not res!611425) (not e!507724))))

(declare-datatypes ((List!18033 0))(
  ( (Nil!18030) (Cons!18029 (h!19175 (_ BitVec 64)) (t!25474 List!18033)) )
))
(declare-fun arrayNoDuplicates!0 (array!53418 (_ BitVec 32) List!18033) Bool)

(assert (=> b!906036 (= res!611425 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18030))))

(declare-fun b!906037 () Bool)

(assert (=> b!906037 (= e!507722 e!507729)))

(declare-fun res!611426 () Bool)

(assert (=> b!906037 (=> res!611426 e!507729)))

(assert (=> b!906037 (= res!611426 (not (contains!4521 lt!408771 k0!1033)))))

(assert (=> b!906037 (= lt!408771 (getCurrentListMap!2742 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!611420 () Bool)

(assert (=> start!77684 (=> (not res!611420) (not e!507724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77684 (= res!611420 (validMask!0 mask!1756))))

(assert (=> start!77684 e!507724))

(declare-fun e!507725 () Bool)

(declare-fun array_inv!20106 (array!53416) Bool)

(assert (=> start!77684 (and (array_inv!20106 _values!1152) e!507725)))

(assert (=> start!77684 tp!57069))

(assert (=> start!77684 true))

(assert (=> start!77684 tp_is_empty!18687))

(declare-fun array_inv!20107 (array!53418) Bool)

(assert (=> start!77684 (array_inv!20107 _keys!1386)))

(declare-fun b!906029 () Bool)

(assert (=> b!906029 (= e!507725 (and e!507723 mapRes!29743))))

(declare-fun condMapEmpty!29743 () Bool)

(declare-fun mapDefault!29743 () ValueCell!8862)

(assert (=> b!906029 (= condMapEmpty!29743 (= (arr!25667 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8862)) mapDefault!29743)))))

(assert (= (and start!77684 res!611420) b!906026))

(assert (= (and b!906026 res!611421) b!906033))

(assert (= (and b!906033 res!611427) b!906036))

(assert (= (and b!906036 res!611425) b!906032))

(assert (= (and b!906032 res!611422) b!906031))

(assert (= (and b!906031 res!611429) b!906035))

(assert (= (and b!906035 res!611428) b!906027))

(assert (= (and b!906027 (not res!611423)) b!906037))

(assert (= (and b!906037 (not res!611426)) b!906025))

(assert (= (and b!906025 (not res!611424)) b!906030))

(assert (= (and b!906029 condMapEmpty!29743) mapIsEmpty!29743))

(assert (= (and b!906029 (not condMapEmpty!29743)) mapNonEmpty!29743))

(get-info :version)

(assert (= (and mapNonEmpty!29743 ((_ is ValueCellFull!8862) mapValue!29743)) b!906034))

(assert (= (and b!906029 ((_ is ValueCellFull!8862) mapDefault!29743)) b!906028))

(assert (= start!77684 b!906029))

(declare-fun b_lambda!13143 () Bool)

(assert (=> (not b_lambda!13143) (not b!906027)))

(declare-fun t!25472 () Bool)

(declare-fun tb!5291 () Bool)

(assert (=> (and start!77684 (= defaultEntry!1160 defaultEntry!1160) t!25472) tb!5291))

(declare-fun result!10377 () Bool)

(assert (=> tb!5291 (= result!10377 tp_is_empty!18687)))

(assert (=> b!906027 t!25472))

(declare-fun b_and!26693 () Bool)

(assert (= b_and!26691 (and (=> t!25472 result!10377) b_and!26693)))

(declare-fun m!841415 () Bool)

(assert (=> b!906025 m!841415))

(declare-fun m!841417 () Bool)

(assert (=> b!906033 m!841417))

(declare-fun m!841419 () Bool)

(assert (=> b!906027 m!841419))

(declare-fun m!841421 () Bool)

(assert (=> b!906027 m!841421))

(declare-fun m!841423 () Bool)

(assert (=> b!906027 m!841423))

(declare-fun m!841425 () Bool)

(assert (=> b!906027 m!841425))

(assert (=> b!906027 m!841419))

(assert (=> b!906027 m!841423))

(declare-fun m!841427 () Bool)

(assert (=> b!906027 m!841427))

(declare-fun m!841429 () Bool)

(assert (=> b!906035 m!841429))

(declare-fun m!841431 () Bool)

(assert (=> b!906032 m!841431))

(declare-fun m!841433 () Bool)

(assert (=> b!906032 m!841433))

(declare-fun m!841435 () Bool)

(assert (=> b!906031 m!841435))

(declare-fun m!841437 () Bool)

(assert (=> mapNonEmpty!29743 m!841437))

(declare-fun m!841439 () Bool)

(assert (=> b!906030 m!841439))

(declare-fun m!841441 () Bool)

(assert (=> b!906030 m!841441))

(declare-fun m!841443 () Bool)

(assert (=> b!906037 m!841443))

(declare-fun m!841445 () Bool)

(assert (=> b!906037 m!841445))

(declare-fun m!841447 () Bool)

(assert (=> start!77684 m!841447))

(declare-fun m!841449 () Bool)

(assert (=> start!77684 m!841449))

(declare-fun m!841451 () Bool)

(assert (=> start!77684 m!841451))

(declare-fun m!841453 () Bool)

(assert (=> b!906036 m!841453))

(check-sat (not b_next!16269) (not b!906036) (not b!906025) (not start!77684) (not b!906037) (not b!906032) tp_is_empty!18687 (not b!906030) (not b_lambda!13143) (not b!906033) (not b!906031) (not b!906027) b_and!26693 (not mapNonEmpty!29743))
(check-sat b_and!26693 (not b_next!16269))
