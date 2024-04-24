; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77838 () Bool)

(assert start!77838)

(declare-fun b_free!16255 () Bool)

(declare-fun b_next!16255 () Bool)

(assert (=> start!77838 (= b_free!16255 (not b_next!16255))))

(declare-fun tp!57027 () Bool)

(declare-fun b_and!26673 () Bool)

(assert (=> start!77838 (= tp!57027 b_and!26673)))

(declare-fun b!906641 () Bool)

(declare-fun res!611560 () Bool)

(declare-fun e!508143 () Bool)

(assert (=> b!906641 (=> (not res!611560) (not e!508143))))

(declare-datatypes ((array!53429 0))(
  ( (array!53430 (arr!25669 (Array (_ BitVec 32) (_ BitVec 64))) (size!26129 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53429)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53429 (_ BitVec 32)) Bool)

(assert (=> b!906641 (= res!611560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906642 () Bool)

(declare-fun e!508136 () Bool)

(declare-fun e!508138 () Bool)

(assert (=> b!906642 (= e!508136 e!508138)))

(declare-fun res!611556 () Bool)

(assert (=> b!906642 (=> res!611556 e!508138)))

(declare-datatypes ((V!29863 0))(
  ( (V!29864 (val!9387 Int)) )
))
(declare-datatypes ((tuple2!12142 0))(
  ( (tuple2!12143 (_1!6082 (_ BitVec 64)) (_2!6082 V!29863)) )
))
(declare-datatypes ((List!17984 0))(
  ( (Nil!17981) (Cons!17980 (h!19132 tuple2!12142) (t!25403 List!17984)) )
))
(declare-datatypes ((ListLongMap!10841 0))(
  ( (ListLongMap!10842 (toList!5436 List!17984)) )
))
(declare-fun lt!409023 () ListLongMap!10841)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4491 (ListLongMap!10841 (_ BitVec 64)) Bool)

(assert (=> b!906642 (= res!611556 (not (contains!4491 lt!409023 k0!1033)))))

(declare-datatypes ((ValueCell!8855 0))(
  ( (ValueCellFull!8855 (v!11889 V!29863)) (EmptyCell!8855) )
))
(declare-datatypes ((array!53431 0))(
  ( (array!53432 (arr!25670 (Array (_ BitVec 32) ValueCell!8855)) (size!26130 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53431)

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29863)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29863)

(declare-fun getCurrentListMap!2702 (array!53429 array!53431 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 32) Int) ListLongMap!10841)

(assert (=> b!906642 (= lt!409023 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906643 () Bool)

(declare-fun e!508141 () Bool)

(assert (=> b!906643 (= e!508143 e!508141)))

(declare-fun res!611554 () Bool)

(assert (=> b!906643 (=> (not res!611554) (not e!508141))))

(declare-fun lt!409027 () ListLongMap!10841)

(assert (=> b!906643 (= res!611554 (contains!4491 lt!409027 k0!1033))))

(assert (=> b!906643 (= lt!409027 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906644 () Bool)

(declare-fun res!611557 () Bool)

(assert (=> b!906644 (=> (not res!611557) (not e!508141))))

(assert (=> b!906644 (= res!611557 (and (= (select (arr!25669 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906645 () Bool)

(declare-fun e!508142 () Bool)

(declare-fun tp_is_empty!18673 () Bool)

(assert (=> b!906645 (= e!508142 tp_is_empty!18673)))

(declare-fun b!906646 () Bool)

(declare-fun res!611559 () Bool)

(assert (=> b!906646 (=> (not res!611559) (not e!508143))))

(assert (=> b!906646 (= res!611559 (and (= (size!26130 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26129 _keys!1386) (size!26130 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906647 () Bool)

(assert (=> b!906647 (= e!508138 true)))

(declare-fun lt!409024 () V!29863)

(declare-fun apply!459 (ListLongMap!10841 (_ BitVec 64)) V!29863)

(assert (=> b!906647 (= (apply!459 lt!409027 k0!1033) lt!409024)))

(declare-datatypes ((Unit!30726 0))(
  ( (Unit!30727) )
))
(declare-fun lt!409026 () Unit!30726)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!15 (array!53429 array!53431 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 64) V!29863 (_ BitVec 32) Int) Unit!30726)

(assert (=> b!906647 (= lt!409026 (lemmaListMapApplyFromThenApplyFromZero!15 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409024 i!717 defaultEntry!1160))))

(declare-fun b!906648 () Bool)

(declare-fun res!611555 () Bool)

(assert (=> b!906648 (=> res!611555 e!508138)))

(assert (=> b!906648 (= res!611555 (not (= (apply!459 lt!409023 k0!1033) lt!409024)))))

(declare-fun b!906649 () Bool)

(declare-fun res!611561 () Bool)

(assert (=> b!906649 (=> (not res!611561) (not e!508141))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906649 (= res!611561 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29722 () Bool)

(declare-fun mapRes!29722 () Bool)

(declare-fun tp!57028 () Bool)

(assert (=> mapNonEmpty!29722 (= mapRes!29722 (and tp!57028 e!508142))))

(declare-fun mapValue!29722 () ValueCell!8855)

(declare-fun mapKey!29722 () (_ BitVec 32))

(declare-fun mapRest!29722 () (Array (_ BitVec 32) ValueCell!8855))

(assert (=> mapNonEmpty!29722 (= (arr!25670 _values!1152) (store mapRest!29722 mapKey!29722 mapValue!29722))))

(declare-fun b!906650 () Bool)

(declare-fun e!508137 () Bool)

(assert (=> b!906650 (= e!508137 tp_is_empty!18673)))

(declare-fun b!906651 () Bool)

(declare-fun res!611563 () Bool)

(assert (=> b!906651 (=> (not res!611563) (not e!508143))))

(declare-datatypes ((List!17985 0))(
  ( (Nil!17982) (Cons!17981 (h!19133 (_ BitVec 64)) (t!25404 List!17985)) )
))
(declare-fun arrayNoDuplicates!0 (array!53429 (_ BitVec 32) List!17985) Bool)

(assert (=> b!906651 (= res!611563 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17982))))

(declare-fun b!906652 () Bool)

(assert (=> b!906652 (= e!508141 (not e!508136))))

(declare-fun res!611562 () Bool)

(assert (=> b!906652 (=> res!611562 e!508136)))

(assert (=> b!906652 (= res!611562 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26129 _keys!1386))))))

(declare-fun get!13499 (ValueCell!8855 V!29863) V!29863)

(declare-fun dynLambda!1349 (Int (_ BitVec 64)) V!29863)

(assert (=> b!906652 (= lt!409024 (get!13499 (select (arr!25670 _values!1152) i!717) (dynLambda!1349 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906652 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409025 () Unit!30726)

(declare-fun lemmaKeyInListMapIsInArray!208 (array!53429 array!53431 (_ BitVec 32) (_ BitVec 32) V!29863 V!29863 (_ BitVec 64) Int) Unit!30726)

(assert (=> b!906652 (= lt!409025 (lemmaKeyInListMapIsInArray!208 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!611558 () Bool)

(assert (=> start!77838 (=> (not res!611558) (not e!508143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77838 (= res!611558 (validMask!0 mask!1756))))

(assert (=> start!77838 e!508143))

(declare-fun e!508140 () Bool)

(declare-fun array_inv!20166 (array!53431) Bool)

(assert (=> start!77838 (and (array_inv!20166 _values!1152) e!508140)))

(assert (=> start!77838 tp!57027))

(assert (=> start!77838 true))

(assert (=> start!77838 tp_is_empty!18673))

(declare-fun array_inv!20167 (array!53429) Bool)

(assert (=> start!77838 (array_inv!20167 _keys!1386)))

(declare-fun b!906653 () Bool)

(assert (=> b!906653 (= e!508140 (and e!508137 mapRes!29722))))

(declare-fun condMapEmpty!29722 () Bool)

(declare-fun mapDefault!29722 () ValueCell!8855)

(assert (=> b!906653 (= condMapEmpty!29722 (= (arr!25670 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8855)) mapDefault!29722)))))

(declare-fun mapIsEmpty!29722 () Bool)

(assert (=> mapIsEmpty!29722 mapRes!29722))

(assert (= (and start!77838 res!611558) b!906646))

(assert (= (and b!906646 res!611559) b!906641))

(assert (= (and b!906641 res!611560) b!906651))

(assert (= (and b!906651 res!611563) b!906643))

(assert (= (and b!906643 res!611554) b!906649))

(assert (= (and b!906649 res!611561) b!906644))

(assert (= (and b!906644 res!611557) b!906652))

(assert (= (and b!906652 (not res!611562)) b!906642))

(assert (= (and b!906642 (not res!611556)) b!906648))

(assert (= (and b!906648 (not res!611555)) b!906647))

(assert (= (and b!906653 condMapEmpty!29722) mapIsEmpty!29722))

(assert (= (and b!906653 (not condMapEmpty!29722)) mapNonEmpty!29722))

(get-info :version)

(assert (= (and mapNonEmpty!29722 ((_ is ValueCellFull!8855) mapValue!29722)) b!906645))

(assert (= (and b!906653 ((_ is ValueCellFull!8855) mapDefault!29722)) b!906650))

(assert (= start!77838 b!906653))

(declare-fun b_lambda!13143 () Bool)

(assert (=> (not b_lambda!13143) (not b!906652)))

(declare-fun t!25402 () Bool)

(declare-fun tb!5269 () Bool)

(assert (=> (and start!77838 (= defaultEntry!1160 defaultEntry!1160) t!25402) tb!5269))

(declare-fun result!10341 () Bool)

(assert (=> tb!5269 (= result!10341 tp_is_empty!18673)))

(assert (=> b!906652 t!25402))

(declare-fun b_and!26675 () Bool)

(assert (= b_and!26673 (and (=> t!25402 result!10341) b_and!26675)))

(declare-fun m!842429 () Bool)

(assert (=> b!906649 m!842429))

(declare-fun m!842431 () Bool)

(assert (=> mapNonEmpty!29722 m!842431))

(declare-fun m!842433 () Bool)

(assert (=> start!77838 m!842433))

(declare-fun m!842435 () Bool)

(assert (=> start!77838 m!842435))

(declare-fun m!842437 () Bool)

(assert (=> start!77838 m!842437))

(declare-fun m!842439 () Bool)

(assert (=> b!906641 m!842439))

(declare-fun m!842441 () Bool)

(assert (=> b!906647 m!842441))

(declare-fun m!842443 () Bool)

(assert (=> b!906647 m!842443))

(declare-fun m!842445 () Bool)

(assert (=> b!906652 m!842445))

(declare-fun m!842447 () Bool)

(assert (=> b!906652 m!842447))

(declare-fun m!842449 () Bool)

(assert (=> b!906652 m!842449))

(declare-fun m!842451 () Bool)

(assert (=> b!906652 m!842451))

(assert (=> b!906652 m!842445))

(assert (=> b!906652 m!842449))

(declare-fun m!842453 () Bool)

(assert (=> b!906652 m!842453))

(declare-fun m!842455 () Bool)

(assert (=> b!906651 m!842455))

(declare-fun m!842457 () Bool)

(assert (=> b!906642 m!842457))

(declare-fun m!842459 () Bool)

(assert (=> b!906642 m!842459))

(declare-fun m!842461 () Bool)

(assert (=> b!906643 m!842461))

(declare-fun m!842463 () Bool)

(assert (=> b!906643 m!842463))

(declare-fun m!842465 () Bool)

(assert (=> b!906644 m!842465))

(declare-fun m!842467 () Bool)

(assert (=> b!906648 m!842467))

(check-sat (not start!77838) (not mapNonEmpty!29722) (not b!906642) (not b!906647) (not b_next!16255) (not b_lambda!13143) (not b!906651) (not b!906648) tp_is_empty!18673 (not b!906652) b_and!26675 (not b!906649) (not b!906643) (not b!906641))
(check-sat b_and!26675 (not b_next!16255))
