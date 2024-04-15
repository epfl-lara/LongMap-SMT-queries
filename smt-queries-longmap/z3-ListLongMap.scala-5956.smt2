; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77544 () Bool)

(assert start!77544)

(declare-fun b_free!16147 () Bool)

(declare-fun b_next!16147 () Bool)

(assert (=> start!77544 (= b_free!16147 (not b_next!16147))))

(declare-fun tp!56703 () Bool)

(declare-fun b_and!26487 () Bool)

(assert (=> start!77544 (= tp!56703 b_and!26487)))

(declare-fun b!903448 () Bool)

(declare-fun e!506207 () Bool)

(declare-fun e!506211 () Bool)

(assert (=> b!903448 (= e!506207 e!506211)))

(declare-fun res!609580 () Bool)

(assert (=> b!903448 (=> res!609580 e!506211)))

(declare-datatypes ((V!29719 0))(
  ( (V!29720 (val!9333 Int)) )
))
(declare-datatypes ((tuple2!12144 0))(
  ( (tuple2!12145 (_1!6083 (_ BitVec 64)) (_2!6083 V!29719)) )
))
(declare-datatypes ((List!17949 0))(
  ( (Nil!17946) (Cons!17945 (h!19091 tuple2!12144) (t!25323 List!17949)) )
))
(declare-datatypes ((ListLongMap!10831 0))(
  ( (ListLongMap!10832 (toList!5431 List!17949)) )
))
(declare-fun lt!407811 () ListLongMap!10831)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4442 (ListLongMap!10831 (_ BitVec 64)) Bool)

(assert (=> b!903448 (= res!609580 (not (contains!4442 lt!407811 k0!1033)))))

(declare-datatypes ((ValueCell!8801 0))(
  ( (ValueCellFull!8801 (v!11837 V!29719)) (EmptyCell!8801) )
))
(declare-datatypes ((array!53163 0))(
  ( (array!53164 (arr!25541 (Array (_ BitVec 32) ValueCell!8801)) (size!26002 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53163)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29719)

(declare-datatypes ((array!53165 0))(
  ( (array!53166 (arr!25542 (Array (_ BitVec 32) (_ BitVec 64))) (size!26003 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53165)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29719)

(declare-fun getCurrentListMap!2646 (array!53165 array!53163 (_ BitVec 32) (_ BitVec 32) V!29719 V!29719 (_ BitVec 32) Int) ListLongMap!10831)

(assert (=> b!903448 (= lt!407811 (getCurrentListMap!2646 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29560 () Bool)

(declare-fun mapRes!29560 () Bool)

(declare-fun tp!56704 () Bool)

(declare-fun e!506210 () Bool)

(assert (=> mapNonEmpty!29560 (= mapRes!29560 (and tp!56704 e!506210))))

(declare-fun mapRest!29560 () (Array (_ BitVec 32) ValueCell!8801))

(declare-fun mapKey!29560 () (_ BitVec 32))

(declare-fun mapValue!29560 () ValueCell!8801)

(assert (=> mapNonEmpty!29560 (= (arr!25541 _values!1152) (store mapRest!29560 mapKey!29560 mapValue!29560))))

(declare-fun b!903449 () Bool)

(assert (=> b!903449 (= e!506211 true)))

(declare-fun lt!407810 () V!29719)

(declare-fun apply!418 (ListLongMap!10831 (_ BitVec 64)) V!29719)

(assert (=> b!903449 (= lt!407810 (apply!418 lt!407811 k0!1033))))

(declare-fun b!903450 () Bool)

(declare-fun e!506212 () Bool)

(assert (=> b!903450 (= e!506212 (not e!506207))))

(declare-fun res!609585 () Bool)

(assert (=> b!903450 (=> res!609585 e!506207)))

(assert (=> b!903450 (= res!609585 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26003 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903450 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30584 0))(
  ( (Unit!30585) )
))
(declare-fun lt!407812 () Unit!30584)

(declare-fun lemmaKeyInListMapIsInArray!174 (array!53165 array!53163 (_ BitVec 32) (_ BitVec 32) V!29719 V!29719 (_ BitVec 64) Int) Unit!30584)

(assert (=> b!903450 (= lt!407812 (lemmaKeyInListMapIsInArray!174 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903451 () Bool)

(declare-fun tp_is_empty!18565 () Bool)

(assert (=> b!903451 (= e!506210 tp_is_empty!18565)))

(declare-fun b!903452 () Bool)

(declare-fun res!609583 () Bool)

(assert (=> b!903452 (=> (not res!609583) (not e!506212))))

(assert (=> b!903452 (= res!609583 (contains!4442 (getCurrentListMap!2646 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903453 () Bool)

(declare-fun res!609584 () Bool)

(assert (=> b!903453 (=> (not res!609584) (not e!506212))))

(assert (=> b!903453 (= res!609584 (and (= (select (arr!25542 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903454 () Bool)

(declare-fun res!609579 () Bool)

(assert (=> b!903454 (=> (not res!609579) (not e!506212))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903454 (= res!609579 (inRange!0 i!717 mask!1756))))

(declare-fun b!903455 () Bool)

(declare-fun e!506208 () Bool)

(declare-fun e!506209 () Bool)

(assert (=> b!903455 (= e!506208 (and e!506209 mapRes!29560))))

(declare-fun condMapEmpty!29560 () Bool)

(declare-fun mapDefault!29560 () ValueCell!8801)

(assert (=> b!903455 (= condMapEmpty!29560 (= (arr!25541 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8801)) mapDefault!29560)))))

(declare-fun b!903456 () Bool)

(assert (=> b!903456 (= e!506209 tp_is_empty!18565)))

(declare-fun mapIsEmpty!29560 () Bool)

(assert (=> mapIsEmpty!29560 mapRes!29560))

(declare-fun b!903457 () Bool)

(declare-fun res!609582 () Bool)

(assert (=> b!903457 (=> (not res!609582) (not e!506212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53165 (_ BitVec 32)) Bool)

(assert (=> b!903457 (= res!609582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609581 () Bool)

(assert (=> start!77544 (=> (not res!609581) (not e!506212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77544 (= res!609581 (validMask!0 mask!1756))))

(assert (=> start!77544 e!506212))

(declare-fun array_inv!20074 (array!53163) Bool)

(assert (=> start!77544 (and (array_inv!20074 _values!1152) e!506208)))

(assert (=> start!77544 tp!56703))

(assert (=> start!77544 true))

(assert (=> start!77544 tp_is_empty!18565))

(declare-fun array_inv!20075 (array!53165) Bool)

(assert (=> start!77544 (array_inv!20075 _keys!1386)))

(declare-fun b!903458 () Bool)

(declare-fun res!609577 () Bool)

(assert (=> b!903458 (=> (not res!609577) (not e!506212))))

(declare-datatypes ((List!17950 0))(
  ( (Nil!17947) (Cons!17946 (h!19092 (_ BitVec 64)) (t!25324 List!17950)) )
))
(declare-fun arrayNoDuplicates!0 (array!53165 (_ BitVec 32) List!17950) Bool)

(assert (=> b!903458 (= res!609577 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17947))))

(declare-fun b!903459 () Bool)

(declare-fun res!609578 () Bool)

(assert (=> b!903459 (=> (not res!609578) (not e!506212))))

(assert (=> b!903459 (= res!609578 (and (= (size!26002 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26003 _keys!1386) (size!26002 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77544 res!609581) b!903459))

(assert (= (and b!903459 res!609578) b!903457))

(assert (= (and b!903457 res!609582) b!903458))

(assert (= (and b!903458 res!609577) b!903452))

(assert (= (and b!903452 res!609583) b!903454))

(assert (= (and b!903454 res!609579) b!903453))

(assert (= (and b!903453 res!609584) b!903450))

(assert (= (and b!903450 (not res!609585)) b!903448))

(assert (= (and b!903448 (not res!609580)) b!903449))

(assert (= (and b!903455 condMapEmpty!29560) mapIsEmpty!29560))

(assert (= (and b!903455 (not condMapEmpty!29560)) mapNonEmpty!29560))

(get-info :version)

(assert (= (and mapNonEmpty!29560 ((_ is ValueCellFull!8801) mapValue!29560)) b!903451))

(assert (= (and b!903455 ((_ is ValueCellFull!8801) mapDefault!29560)) b!903456))

(assert (= start!77544 b!903455))

(declare-fun m!838547 () Bool)

(assert (=> b!903448 m!838547))

(declare-fun m!838549 () Bool)

(assert (=> b!903448 m!838549))

(declare-fun m!838551 () Bool)

(assert (=> b!903457 m!838551))

(declare-fun m!838553 () Bool)

(assert (=> mapNonEmpty!29560 m!838553))

(declare-fun m!838555 () Bool)

(assert (=> b!903453 m!838555))

(declare-fun m!838557 () Bool)

(assert (=> b!903450 m!838557))

(declare-fun m!838559 () Bool)

(assert (=> b!903450 m!838559))

(declare-fun m!838561 () Bool)

(assert (=> start!77544 m!838561))

(declare-fun m!838563 () Bool)

(assert (=> start!77544 m!838563))

(declare-fun m!838565 () Bool)

(assert (=> start!77544 m!838565))

(declare-fun m!838567 () Bool)

(assert (=> b!903454 m!838567))

(declare-fun m!838569 () Bool)

(assert (=> b!903449 m!838569))

(declare-fun m!838571 () Bool)

(assert (=> b!903452 m!838571))

(assert (=> b!903452 m!838571))

(declare-fun m!838573 () Bool)

(assert (=> b!903452 m!838573))

(declare-fun m!838575 () Bool)

(assert (=> b!903458 m!838575))

(check-sat (not b!903457) (not mapNonEmpty!29560) (not b!903449) (not b!903454) (not b_next!16147) (not b!903458) (not b!903448) (not b!903450) b_and!26487 (not start!77544) (not b!903452) tp_is_empty!18565)
(check-sat b_and!26487 (not b_next!16147))
