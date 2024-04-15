; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77604 () Bool)

(assert start!77604)

(declare-fun b_free!16207 () Bool)

(declare-fun b_next!16207 () Bool)

(assert (=> start!77604 (= b_free!16207 (not b_next!16207))))

(declare-fun tp!56883 () Bool)

(declare-fun b_and!26547 () Bool)

(assert (=> start!77604 (= tp!56883 b_and!26547)))

(declare-fun b!904528 () Bool)

(declare-fun res!610389 () Bool)

(declare-fun e!506842 () Bool)

(assert (=> b!904528 (=> (not res!610389) (not e!506842))))

(declare-datatypes ((V!29799 0))(
  ( (V!29800 (val!9363 Int)) )
))
(declare-datatypes ((ValueCell!8831 0))(
  ( (ValueCellFull!8831 (v!11867 V!29799)) (EmptyCell!8831) )
))
(declare-datatypes ((array!53275 0))(
  ( (array!53276 (arr!25597 (Array (_ BitVec 32) ValueCell!8831)) (size!26058 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53275)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29799)

(declare-datatypes ((array!53277 0))(
  ( (array!53278 (arr!25598 (Array (_ BitVec 32) (_ BitVec 64))) (size!26059 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53277)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29799)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((tuple2!12192 0))(
  ( (tuple2!12193 (_1!6107 (_ BitVec 64)) (_2!6107 V!29799)) )
))
(declare-datatypes ((List!17993 0))(
  ( (Nil!17990) (Cons!17989 (h!19135 tuple2!12192) (t!25367 List!17993)) )
))
(declare-datatypes ((ListLongMap!10879 0))(
  ( (ListLongMap!10880 (toList!5455 List!17993)) )
))
(declare-fun contains!4465 (ListLongMap!10879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2669 (array!53277 array!53275 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 32) Int) ListLongMap!10879)

(assert (=> b!904528 (= res!610389 (contains!4465 (getCurrentListMap!2669 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29650 () Bool)

(declare-fun mapRes!29650 () Bool)

(assert (=> mapIsEmpty!29650 mapRes!29650))

(declare-fun b!904529 () Bool)

(declare-fun res!610390 () Bool)

(assert (=> b!904529 (=> (not res!610390) (not e!506842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53277 (_ BitVec 32)) Bool)

(assert (=> b!904529 (= res!610390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904531 () Bool)

(declare-fun e!506841 () Bool)

(declare-fun tp_is_empty!18625 () Bool)

(assert (=> b!904531 (= e!506841 tp_is_empty!18625)))

(declare-fun b!904532 () Bool)

(declare-fun e!506838 () Bool)

(assert (=> b!904532 (= e!506842 (not e!506838))))

(declare-fun res!610392 () Bool)

(assert (=> b!904532 (=> res!610392 e!506838)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904532 (= res!610392 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26059 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904532 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30618 0))(
  ( (Unit!30619) )
))
(declare-fun lt!408082 () Unit!30618)

(declare-fun lemmaKeyInListMapIsInArray!191 (array!53277 array!53275 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 64) Int) Unit!30618)

(assert (=> b!904532 (= lt!408082 (lemmaKeyInListMapIsInArray!191 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904533 () Bool)

(declare-fun e!506840 () Bool)

(assert (=> b!904533 (= e!506838 e!506840)))

(declare-fun res!610388 () Bool)

(assert (=> b!904533 (=> res!610388 e!506840)))

(declare-fun lt!408080 () ListLongMap!10879)

(assert (=> b!904533 (= res!610388 (not (contains!4465 lt!408080 k0!1033)))))

(assert (=> b!904533 (= lt!408080 (getCurrentListMap!2669 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904534 () Bool)

(assert (=> b!904534 (= e!506840 true)))

(declare-fun lt!408081 () V!29799)

(declare-fun apply!436 (ListLongMap!10879 (_ BitVec 64)) V!29799)

(assert (=> b!904534 (= lt!408081 (apply!436 lt!408080 k0!1033))))

(declare-fun b!904535 () Bool)

(declare-fun e!506837 () Bool)

(assert (=> b!904535 (= e!506837 tp_is_empty!18625)))

(declare-fun b!904536 () Bool)

(declare-fun res!610394 () Bool)

(assert (=> b!904536 (=> (not res!610394) (not e!506842))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904536 (= res!610394 (inRange!0 i!717 mask!1756))))

(declare-fun b!904537 () Bool)

(declare-fun res!610393 () Bool)

(assert (=> b!904537 (=> (not res!610393) (not e!506842))))

(assert (=> b!904537 (= res!610393 (and (= (size!26058 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26059 _keys!1386) (size!26058 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904530 () Bool)

(declare-fun res!610387 () Bool)

(assert (=> b!904530 (=> (not res!610387) (not e!506842))))

(declare-datatypes ((List!17994 0))(
  ( (Nil!17991) (Cons!17990 (h!19136 (_ BitVec 64)) (t!25368 List!17994)) )
))
(declare-fun arrayNoDuplicates!0 (array!53277 (_ BitVec 32) List!17994) Bool)

(assert (=> b!904530 (= res!610387 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17991))))

(declare-fun res!610391 () Bool)

(assert (=> start!77604 (=> (not res!610391) (not e!506842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77604 (= res!610391 (validMask!0 mask!1756))))

(assert (=> start!77604 e!506842))

(declare-fun e!506843 () Bool)

(declare-fun array_inv!20112 (array!53275) Bool)

(assert (=> start!77604 (and (array_inv!20112 _values!1152) e!506843)))

(assert (=> start!77604 tp!56883))

(assert (=> start!77604 true))

(assert (=> start!77604 tp_is_empty!18625))

(declare-fun array_inv!20113 (array!53277) Bool)

(assert (=> start!77604 (array_inv!20113 _keys!1386)))

(declare-fun mapNonEmpty!29650 () Bool)

(declare-fun tp!56884 () Bool)

(assert (=> mapNonEmpty!29650 (= mapRes!29650 (and tp!56884 e!506837))))

(declare-fun mapRest!29650 () (Array (_ BitVec 32) ValueCell!8831))

(declare-fun mapValue!29650 () ValueCell!8831)

(declare-fun mapKey!29650 () (_ BitVec 32))

(assert (=> mapNonEmpty!29650 (= (arr!25597 _values!1152) (store mapRest!29650 mapKey!29650 mapValue!29650))))

(declare-fun b!904538 () Bool)

(declare-fun res!610395 () Bool)

(assert (=> b!904538 (=> (not res!610395) (not e!506842))))

(assert (=> b!904538 (= res!610395 (and (= (select (arr!25598 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904539 () Bool)

(assert (=> b!904539 (= e!506843 (and e!506841 mapRes!29650))))

(declare-fun condMapEmpty!29650 () Bool)

(declare-fun mapDefault!29650 () ValueCell!8831)

(assert (=> b!904539 (= condMapEmpty!29650 (= (arr!25597 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8831)) mapDefault!29650)))))

(assert (= (and start!77604 res!610391) b!904537))

(assert (= (and b!904537 res!610393) b!904529))

(assert (= (and b!904529 res!610390) b!904530))

(assert (= (and b!904530 res!610387) b!904528))

(assert (= (and b!904528 res!610389) b!904536))

(assert (= (and b!904536 res!610394) b!904538))

(assert (= (and b!904538 res!610395) b!904532))

(assert (= (and b!904532 (not res!610392)) b!904533))

(assert (= (and b!904533 (not res!610388)) b!904534))

(assert (= (and b!904539 condMapEmpty!29650) mapIsEmpty!29650))

(assert (= (and b!904539 (not condMapEmpty!29650)) mapNonEmpty!29650))

(get-info :version)

(assert (= (and mapNonEmpty!29650 ((_ is ValueCellFull!8831) mapValue!29650)) b!904535))

(assert (= (and b!904539 ((_ is ValueCellFull!8831) mapDefault!29650)) b!904531))

(assert (= start!77604 b!904539))

(declare-fun m!839447 () Bool)

(assert (=> b!904534 m!839447))

(declare-fun m!839449 () Bool)

(assert (=> b!904538 m!839449))

(declare-fun m!839451 () Bool)

(assert (=> b!904530 m!839451))

(declare-fun m!839453 () Bool)

(assert (=> b!904529 m!839453))

(declare-fun m!839455 () Bool)

(assert (=> b!904533 m!839455))

(declare-fun m!839457 () Bool)

(assert (=> b!904533 m!839457))

(declare-fun m!839459 () Bool)

(assert (=> mapNonEmpty!29650 m!839459))

(declare-fun m!839461 () Bool)

(assert (=> start!77604 m!839461))

(declare-fun m!839463 () Bool)

(assert (=> start!77604 m!839463))

(declare-fun m!839465 () Bool)

(assert (=> start!77604 m!839465))

(declare-fun m!839467 () Bool)

(assert (=> b!904536 m!839467))

(declare-fun m!839469 () Bool)

(assert (=> b!904532 m!839469))

(declare-fun m!839471 () Bool)

(assert (=> b!904532 m!839471))

(declare-fun m!839473 () Bool)

(assert (=> b!904528 m!839473))

(assert (=> b!904528 m!839473))

(declare-fun m!839475 () Bool)

(assert (=> b!904528 m!839475))

(check-sat (not b!904532) (not b_next!16207) (not b!904533) (not b!904534) (not b!904536) (not b!904530) (not mapNonEmpty!29650) tp_is_empty!18625 b_and!26547 (not b!904529) (not b!904528) (not start!77604))
(check-sat b_and!26547 (not b_next!16207))
