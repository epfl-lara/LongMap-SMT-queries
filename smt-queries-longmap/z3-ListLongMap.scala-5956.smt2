; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77564 () Bool)

(assert start!77564)

(declare-fun b_free!16149 () Bool)

(declare-fun b_next!16149 () Bool)

(assert (=> start!77564 (= b_free!16149 (not b_next!16149))))

(declare-fun tp!56708 () Bool)

(declare-fun b_and!26515 () Bool)

(assert (=> start!77564 (= tp!56708 b_and!26515)))

(declare-fun b!903723 () Bool)

(declare-fun e!506376 () Bool)

(declare-fun e!506381 () Bool)

(assert (=> b!903723 (= e!506376 (not e!506381))))

(declare-fun res!609722 () Bool)

(assert (=> b!903723 (=> res!609722 e!506381)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53186 0))(
  ( (array!53187 (arr!25552 (Array (_ BitVec 32) (_ BitVec 64))) (size!26011 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53186)

(assert (=> b!903723 (= res!609722 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26011 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903723 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29721 0))(
  ( (V!29722 (val!9334 Int)) )
))
(declare-datatypes ((ValueCell!8802 0))(
  ( (ValueCellFull!8802 (v!11839 V!29721)) (EmptyCell!8802) )
))
(declare-datatypes ((array!53188 0))(
  ( (array!53189 (arr!25553 (Array (_ BitVec 32) ValueCell!8802)) (size!26012 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53188)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30648 0))(
  ( (Unit!30649) )
))
(declare-fun lt!408055 () Unit!30648)

(declare-fun zeroValue!1094 () V!29721)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29721)

(declare-fun lemmaKeyInListMapIsInArray!167 (array!53186 array!53188 (_ BitVec 32) (_ BitVec 32) V!29721 V!29721 (_ BitVec 64) Int) Unit!30648)

(assert (=> b!903723 (= lt!408055 (lemmaKeyInListMapIsInArray!167 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903724 () Bool)

(declare-fun e!506382 () Bool)

(declare-fun tp_is_empty!18567 () Bool)

(assert (=> b!903724 (= e!506382 tp_is_empty!18567)))

(declare-fun b!903725 () Bool)

(declare-fun res!609721 () Bool)

(assert (=> b!903725 (=> (not res!609721) (not e!506376))))

(declare-datatypes ((List!17941 0))(
  ( (Nil!17938) (Cons!17937 (h!19083 (_ BitVec 64)) (t!25324 List!17941)) )
))
(declare-fun arrayNoDuplicates!0 (array!53186 (_ BitVec 32) List!17941) Bool)

(assert (=> b!903725 (= res!609721 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17938))))

(declare-fun mapIsEmpty!29563 () Bool)

(declare-fun mapRes!29563 () Bool)

(assert (=> mapIsEmpty!29563 mapRes!29563))

(declare-fun b!903726 () Bool)

(declare-fun res!609719 () Bool)

(assert (=> b!903726 (=> (not res!609719) (not e!506376))))

(assert (=> b!903726 (= res!609719 (and (= (size!26012 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26011 _keys!1386) (size!26012 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903727 () Bool)

(declare-fun e!506378 () Bool)

(declare-fun e!506380 () Bool)

(assert (=> b!903727 (= e!506378 (and e!506380 mapRes!29563))))

(declare-fun condMapEmpty!29563 () Bool)

(declare-fun mapDefault!29563 () ValueCell!8802)

(assert (=> b!903727 (= condMapEmpty!29563 (= (arr!25553 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8802)) mapDefault!29563)))))

(declare-fun b!903728 () Bool)

(declare-fun res!609716 () Bool)

(assert (=> b!903728 (=> (not res!609716) (not e!506376))))

(assert (=> b!903728 (= res!609716 (and (= (select (arr!25552 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903729 () Bool)

(declare-fun e!506377 () Bool)

(assert (=> b!903729 (= e!506381 e!506377)))

(declare-fun res!609720 () Bool)

(assert (=> b!903729 (=> res!609720 e!506377)))

(declare-datatypes ((tuple2!12122 0))(
  ( (tuple2!12123 (_1!6072 (_ BitVec 64)) (_2!6072 V!29721)) )
))
(declare-datatypes ((List!17942 0))(
  ( (Nil!17939) (Cons!17938 (h!19084 tuple2!12122) (t!25325 List!17942)) )
))
(declare-datatypes ((ListLongMap!10819 0))(
  ( (ListLongMap!10820 (toList!5425 List!17942)) )
))
(declare-fun lt!408056 () ListLongMap!10819)

(declare-fun contains!4473 (ListLongMap!10819 (_ BitVec 64)) Bool)

(assert (=> b!903729 (= res!609720 (not (contains!4473 lt!408056 k0!1033)))))

(declare-fun getCurrentListMap!2694 (array!53186 array!53188 (_ BitVec 32) (_ BitVec 32) V!29721 V!29721 (_ BitVec 32) Int) ListLongMap!10819)

(assert (=> b!903729 (= lt!408056 (getCurrentListMap!2694 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!609714 () Bool)

(assert (=> start!77564 (=> (not res!609714) (not e!506376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77564 (= res!609714 (validMask!0 mask!1756))))

(assert (=> start!77564 e!506376))

(declare-fun array_inv!20020 (array!53188) Bool)

(assert (=> start!77564 (and (array_inv!20020 _values!1152) e!506378)))

(assert (=> start!77564 tp!56708))

(assert (=> start!77564 true))

(assert (=> start!77564 tp_is_empty!18567))

(declare-fun array_inv!20021 (array!53186) Bool)

(assert (=> start!77564 (array_inv!20021 _keys!1386)))

(declare-fun b!903730 () Bool)

(declare-fun res!609718 () Bool)

(assert (=> b!903730 (=> (not res!609718) (not e!506376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53186 (_ BitVec 32)) Bool)

(assert (=> b!903730 (= res!609718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903731 () Bool)

(assert (=> b!903731 (= e!506377 true)))

(declare-fun lt!408057 () V!29721)

(declare-fun apply!423 (ListLongMap!10819 (_ BitVec 64)) V!29721)

(assert (=> b!903731 (= lt!408057 (apply!423 lt!408056 k0!1033))))

(declare-fun b!903732 () Bool)

(declare-fun res!609717 () Bool)

(assert (=> b!903732 (=> (not res!609717) (not e!506376))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903732 (= res!609717 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29563 () Bool)

(declare-fun tp!56709 () Bool)

(assert (=> mapNonEmpty!29563 (= mapRes!29563 (and tp!56709 e!506382))))

(declare-fun mapValue!29563 () ValueCell!8802)

(declare-fun mapKey!29563 () (_ BitVec 32))

(declare-fun mapRest!29563 () (Array (_ BitVec 32) ValueCell!8802))

(assert (=> mapNonEmpty!29563 (= (arr!25553 _values!1152) (store mapRest!29563 mapKey!29563 mapValue!29563))))

(declare-fun b!903733 () Bool)

(assert (=> b!903733 (= e!506380 tp_is_empty!18567)))

(declare-fun b!903734 () Bool)

(declare-fun res!609715 () Bool)

(assert (=> b!903734 (=> (not res!609715) (not e!506376))))

(assert (=> b!903734 (= res!609715 (contains!4473 (getCurrentListMap!2694 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77564 res!609714) b!903726))

(assert (= (and b!903726 res!609719) b!903730))

(assert (= (and b!903730 res!609718) b!903725))

(assert (= (and b!903725 res!609721) b!903734))

(assert (= (and b!903734 res!609715) b!903732))

(assert (= (and b!903732 res!609717) b!903728))

(assert (= (and b!903728 res!609716) b!903723))

(assert (= (and b!903723 (not res!609722)) b!903729))

(assert (= (and b!903729 (not res!609720)) b!903731))

(assert (= (and b!903727 condMapEmpty!29563) mapIsEmpty!29563))

(assert (= (and b!903727 (not condMapEmpty!29563)) mapNonEmpty!29563))

(get-info :version)

(assert (= (and mapNonEmpty!29563 ((_ is ValueCellFull!8802) mapValue!29563)) b!903724))

(assert (= (and b!903727 ((_ is ValueCellFull!8802) mapDefault!29563)) b!903733))

(assert (= start!77564 b!903727))

(declare-fun m!839335 () Bool)

(assert (=> b!903728 m!839335))

(declare-fun m!839337 () Bool)

(assert (=> b!903732 m!839337))

(declare-fun m!839339 () Bool)

(assert (=> mapNonEmpty!29563 m!839339))

(declare-fun m!839341 () Bool)

(assert (=> start!77564 m!839341))

(declare-fun m!839343 () Bool)

(assert (=> start!77564 m!839343))

(declare-fun m!839345 () Bool)

(assert (=> start!77564 m!839345))

(declare-fun m!839347 () Bool)

(assert (=> b!903731 m!839347))

(declare-fun m!839349 () Bool)

(assert (=> b!903729 m!839349))

(declare-fun m!839351 () Bool)

(assert (=> b!903729 m!839351))

(declare-fun m!839353 () Bool)

(assert (=> b!903734 m!839353))

(assert (=> b!903734 m!839353))

(declare-fun m!839355 () Bool)

(assert (=> b!903734 m!839355))

(declare-fun m!839357 () Bool)

(assert (=> b!903723 m!839357))

(declare-fun m!839359 () Bool)

(assert (=> b!903723 m!839359))

(declare-fun m!839361 () Bool)

(assert (=> b!903730 m!839361))

(declare-fun m!839363 () Bool)

(assert (=> b!903725 m!839363))

(check-sat (not b_next!16149) (not b!903731) (not b!903729) (not b!903723) (not b!903732) (not start!77564) (not b!903734) b_and!26515 (not b!903725) (not b!903730) (not mapNonEmpty!29563) tp_is_empty!18567)
(check-sat b_and!26515 (not b_next!16149))
