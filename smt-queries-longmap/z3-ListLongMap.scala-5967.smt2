; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77610 () Bool)

(assert start!77610)

(declare-fun b_free!16213 () Bool)

(declare-fun b_next!16213 () Bool)

(assert (=> start!77610 (= b_free!16213 (not b_next!16213))))

(declare-fun tp!56902 () Bool)

(declare-fun b_and!26553 () Bool)

(assert (=> start!77610 (= tp!56902 b_and!26553)))

(declare-fun b!904638 () Bool)

(declare-fun res!610476 () Bool)

(declare-fun e!506909 () Bool)

(assert (=> b!904638 (=> (not res!610476) (not e!506909))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904638 (= res!610476 (inRange!0 i!717 mask!1756))))

(declare-fun b!904639 () Bool)

(declare-fun e!506903 () Bool)

(assert (=> b!904639 (= e!506909 (not e!506903))))

(declare-fun res!610479 () Bool)

(assert (=> b!904639 (=> res!610479 e!506903)))

(declare-datatypes ((array!53283 0))(
  ( (array!53284 (arr!25601 (Array (_ BitVec 32) (_ BitVec 64))) (size!26062 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53283)

(assert (=> b!904639 (= res!610479 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26062 _keys!1386))))))

(declare-datatypes ((V!29807 0))(
  ( (V!29808 (val!9366 Int)) )
))
(declare-datatypes ((ValueCell!8834 0))(
  ( (ValueCellFull!8834 (v!11870 V!29807)) (EmptyCell!8834) )
))
(declare-datatypes ((array!53285 0))(
  ( (array!53286 (arr!25602 (Array (_ BitVec 32) ValueCell!8834)) (size!26063 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53285)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408114 () V!29807)

(declare-fun get!13453 (ValueCell!8834 V!29807) V!29807)

(declare-fun dynLambda!1316 (Int (_ BitVec 64)) V!29807)

(assert (=> b!904639 (= lt!408114 (get!13453 (select (arr!25602 _values!1152) i!717) (dynLambda!1316 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904639 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29807)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29807)

(declare-datatypes ((Unit!30620 0))(
  ( (Unit!30621) )
))
(declare-fun lt!408115 () Unit!30620)

(declare-fun lemmaKeyInListMapIsInArray!192 (array!53283 array!53285 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) Int) Unit!30620)

(assert (=> b!904639 (= lt!408115 (lemmaKeyInListMapIsInArray!192 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904640 () Bool)

(declare-fun e!506907 () Bool)

(declare-fun e!506904 () Bool)

(declare-fun mapRes!29659 () Bool)

(assert (=> b!904640 (= e!506907 (and e!506904 mapRes!29659))))

(declare-fun condMapEmpty!29659 () Bool)

(declare-fun mapDefault!29659 () ValueCell!8834)

(assert (=> b!904640 (= condMapEmpty!29659 (= (arr!25602 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8834)) mapDefault!29659)))))

(declare-fun b!904641 () Bool)

(declare-fun res!610471 () Bool)

(declare-fun e!506906 () Bool)

(assert (=> b!904641 (=> (not res!610471) (not e!506906))))

(declare-datatypes ((List!17995 0))(
  ( (Nil!17992) (Cons!17991 (h!19137 (_ BitVec 64)) (t!25371 List!17995)) )
))
(declare-fun arrayNoDuplicates!0 (array!53283 (_ BitVec 32) List!17995) Bool)

(assert (=> b!904641 (= res!610471 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17992))))

(declare-fun b!904642 () Bool)

(declare-fun e!506908 () Bool)

(declare-fun tp_is_empty!18631 () Bool)

(assert (=> b!904642 (= e!506908 tp_is_empty!18631)))

(declare-fun b!904643 () Bool)

(assert (=> b!904643 (= e!506904 tp_is_empty!18631)))

(declare-fun b!904644 () Bool)

(declare-fun res!610475 () Bool)

(assert (=> b!904644 (=> (not res!610475) (not e!506906))))

(assert (=> b!904644 (= res!610475 (and (= (size!26063 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26062 _keys!1386) (size!26063 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904645 () Bool)

(declare-fun e!506902 () Bool)

(assert (=> b!904645 (= e!506903 e!506902)))

(declare-fun res!610477 () Bool)

(assert (=> b!904645 (=> res!610477 e!506902)))

(declare-datatypes ((tuple2!12194 0))(
  ( (tuple2!12195 (_1!6108 (_ BitVec 64)) (_2!6108 V!29807)) )
))
(declare-datatypes ((List!17996 0))(
  ( (Nil!17993) (Cons!17992 (h!19138 tuple2!12194) (t!25372 List!17996)) )
))
(declare-datatypes ((ListLongMap!10881 0))(
  ( (ListLongMap!10882 (toList!5456 List!17996)) )
))
(declare-fun lt!408112 () ListLongMap!10881)

(declare-fun contains!4466 (ListLongMap!10881 (_ BitVec 64)) Bool)

(assert (=> b!904645 (= res!610477 (not (contains!4466 lt!408112 k0!1033)))))

(declare-fun getCurrentListMap!2670 (array!53283 array!53285 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 32) Int) ListLongMap!10881)

(assert (=> b!904645 (= lt!408112 (getCurrentListMap!2670 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904646 () Bool)

(assert (=> b!904646 (= e!506902 true)))

(declare-fun lt!408111 () ListLongMap!10881)

(declare-fun apply!437 (ListLongMap!10881 (_ BitVec 64)) V!29807)

(assert (=> b!904646 (= (apply!437 lt!408111 k0!1033) lt!408114)))

(declare-fun lt!408113 () Unit!30620)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!1 (array!53283 array!53285 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) V!29807 (_ BitVec 32) Int) Unit!30620)

(assert (=> b!904646 (= lt!408113 (lemmaListMapApplyFromThenApplyFromZero!1 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408114 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29659 () Bool)

(declare-fun tp!56901 () Bool)

(assert (=> mapNonEmpty!29659 (= mapRes!29659 (and tp!56901 e!506908))))

(declare-fun mapRest!29659 () (Array (_ BitVec 32) ValueCell!8834))

(declare-fun mapValue!29659 () ValueCell!8834)

(declare-fun mapKey!29659 () (_ BitVec 32))

(assert (=> mapNonEmpty!29659 (= (arr!25602 _values!1152) (store mapRest!29659 mapKey!29659 mapValue!29659))))

(declare-fun mapIsEmpty!29659 () Bool)

(assert (=> mapIsEmpty!29659 mapRes!29659))

(declare-fun res!610470 () Bool)

(assert (=> start!77610 (=> (not res!610470) (not e!506906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77610 (= res!610470 (validMask!0 mask!1756))))

(assert (=> start!77610 e!506906))

(declare-fun array_inv!20114 (array!53285) Bool)

(assert (=> start!77610 (and (array_inv!20114 _values!1152) e!506907)))

(assert (=> start!77610 tp!56902))

(assert (=> start!77610 true))

(assert (=> start!77610 tp_is_empty!18631))

(declare-fun array_inv!20115 (array!53283) Bool)

(assert (=> start!77610 (array_inv!20115 _keys!1386)))

(declare-fun b!904647 () Bool)

(declare-fun res!610474 () Bool)

(assert (=> b!904647 (=> res!610474 e!506902)))

(assert (=> b!904647 (= res!610474 (not (= (apply!437 lt!408112 k0!1033) lt!408114)))))

(declare-fun b!904648 () Bool)

(declare-fun res!610472 () Bool)

(assert (=> b!904648 (=> (not res!610472) (not e!506909))))

(assert (=> b!904648 (= res!610472 (and (= (select (arr!25601 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904649 () Bool)

(assert (=> b!904649 (= e!506906 e!506909)))

(declare-fun res!610478 () Bool)

(assert (=> b!904649 (=> (not res!610478) (not e!506909))))

(assert (=> b!904649 (= res!610478 (contains!4466 lt!408111 k0!1033))))

(assert (=> b!904649 (= lt!408111 (getCurrentListMap!2670 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!904650 () Bool)

(declare-fun res!610473 () Bool)

(assert (=> b!904650 (=> (not res!610473) (not e!506906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53283 (_ BitVec 32)) Bool)

(assert (=> b!904650 (= res!610473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77610 res!610470) b!904644))

(assert (= (and b!904644 res!610475) b!904650))

(assert (= (and b!904650 res!610473) b!904641))

(assert (= (and b!904641 res!610471) b!904649))

(assert (= (and b!904649 res!610478) b!904638))

(assert (= (and b!904638 res!610476) b!904648))

(assert (= (and b!904648 res!610472) b!904639))

(assert (= (and b!904639 (not res!610479)) b!904645))

(assert (= (and b!904645 (not res!610477)) b!904647))

(assert (= (and b!904647 (not res!610474)) b!904646))

(assert (= (and b!904640 condMapEmpty!29659) mapIsEmpty!29659))

(assert (= (and b!904640 (not condMapEmpty!29659)) mapNonEmpty!29659))

(get-info :version)

(assert (= (and mapNonEmpty!29659 ((_ is ValueCellFull!8834) mapValue!29659)) b!904642))

(assert (= (and b!904640 ((_ is ValueCellFull!8834) mapDefault!29659)) b!904643))

(assert (= start!77610 b!904640))

(declare-fun b_lambda!13069 () Bool)

(assert (=> (not b_lambda!13069) (not b!904639)))

(declare-fun t!25370 () Bool)

(declare-fun tb!5227 () Bool)

(assert (=> (and start!77610 (= defaultEntry!1160 defaultEntry!1160) t!25370) tb!5227))

(declare-fun result!10257 () Bool)

(assert (=> tb!5227 (= result!10257 tp_is_empty!18631)))

(assert (=> b!904639 t!25370))

(declare-fun b_and!26555 () Bool)

(assert (= b_and!26553 (and (=> t!25370 result!10257) b_and!26555)))

(declare-fun m!839537 () Bool)

(assert (=> b!904638 m!839537))

(declare-fun m!839539 () Bool)

(assert (=> b!904647 m!839539))

(declare-fun m!839541 () Bool)

(assert (=> b!904641 m!839541))

(declare-fun m!839543 () Bool)

(assert (=> b!904648 m!839543))

(declare-fun m!839545 () Bool)

(assert (=> b!904646 m!839545))

(declare-fun m!839547 () Bool)

(assert (=> b!904646 m!839547))

(declare-fun m!839549 () Bool)

(assert (=> b!904645 m!839549))

(declare-fun m!839551 () Bool)

(assert (=> b!904645 m!839551))

(declare-fun m!839553 () Bool)

(assert (=> b!904639 m!839553))

(declare-fun m!839555 () Bool)

(assert (=> b!904639 m!839555))

(declare-fun m!839557 () Bool)

(assert (=> b!904639 m!839557))

(declare-fun m!839559 () Bool)

(assert (=> b!904639 m!839559))

(assert (=> b!904639 m!839553))

(assert (=> b!904639 m!839557))

(declare-fun m!839561 () Bool)

(assert (=> b!904639 m!839561))

(declare-fun m!839563 () Bool)

(assert (=> mapNonEmpty!29659 m!839563))

(declare-fun m!839565 () Bool)

(assert (=> start!77610 m!839565))

(declare-fun m!839567 () Bool)

(assert (=> start!77610 m!839567))

(declare-fun m!839569 () Bool)

(assert (=> start!77610 m!839569))

(declare-fun m!839571 () Bool)

(assert (=> b!904650 m!839571))

(declare-fun m!839573 () Bool)

(assert (=> b!904649 m!839573))

(declare-fun m!839575 () Bool)

(assert (=> b!904649 m!839575))

(check-sat (not b!904646) (not b!904649) tp_is_empty!18631 (not mapNonEmpty!29659) (not b!904650) (not b!904639) (not start!77610) (not b!904645) (not b!904647) (not b!904638) (not b!904641) (not b_lambda!13069) (not b_next!16213) b_and!26555)
(check-sat b_and!26555 (not b_next!16213))
