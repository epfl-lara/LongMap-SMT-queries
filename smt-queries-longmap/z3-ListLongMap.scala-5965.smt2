; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77618 () Bool)

(assert start!77618)

(declare-fun b_free!16203 () Bool)

(declare-fun b_next!16203 () Bool)

(assert (=> start!77618 (= b_free!16203 (not b_next!16203))))

(declare-fun tp!56870 () Bool)

(declare-fun b_and!26569 () Bool)

(assert (=> start!77618 (= tp!56870 b_and!26569)))

(declare-fun b!904695 () Bool)

(declare-fun res!610449 () Bool)

(declare-fun e!506944 () Bool)

(assert (=> b!904695 (=> (not res!610449) (not e!506944))))

(declare-datatypes ((V!29793 0))(
  ( (V!29794 (val!9361 Int)) )
))
(declare-datatypes ((ValueCell!8829 0))(
  ( (ValueCellFull!8829 (v!11866 V!29793)) (EmptyCell!8829) )
))
(declare-datatypes ((array!53286 0))(
  ( (array!53287 (arr!25602 (Array (_ BitVec 32) ValueCell!8829)) (size!26061 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53286)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((array!53288 0))(
  ( (array!53289 (arr!25603 (Array (_ BitVec 32) (_ BitVec 64))) (size!26062 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53288)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29793)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29793)

(declare-datatypes ((tuple2!12164 0))(
  ( (tuple2!12165 (_1!6093 (_ BitVec 64)) (_2!6093 V!29793)) )
))
(declare-datatypes ((List!17978 0))(
  ( (Nil!17975) (Cons!17974 (h!19120 tuple2!12164) (t!25361 List!17978)) )
))
(declare-datatypes ((ListLongMap!10861 0))(
  ( (ListLongMap!10862 (toList!5446 List!17978)) )
))
(declare-fun contains!4493 (ListLongMap!10861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2714 (array!53288 array!53286 (_ BitVec 32) (_ BitVec 32) V!29793 V!29793 (_ BitVec 32) Int) ListLongMap!10861)

(assert (=> b!904695 (= res!610449 (contains!4493 (getCurrentListMap!2714 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904696 () Bool)

(declare-fun res!610445 () Bool)

(assert (=> b!904696 (=> (not res!610445) (not e!506944))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904696 (= res!610445 (and (= (select (arr!25603 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904697 () Bool)

(declare-fun res!610450 () Bool)

(assert (=> b!904697 (=> (not res!610450) (not e!506944))))

(assert (=> b!904697 (= res!610450 (and (= (size!26061 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26062 _keys!1386) (size!26061 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904698 () Bool)

(declare-fun e!506943 () Bool)

(declare-fun tp_is_empty!18621 () Bool)

(assert (=> b!904698 (= e!506943 tp_is_empty!18621)))

(declare-fun b!904699 () Bool)

(declare-fun e!506949 () Bool)

(declare-fun e!506946 () Bool)

(assert (=> b!904699 (= e!506949 e!506946)))

(declare-fun res!610444 () Bool)

(assert (=> b!904699 (=> res!610444 e!506946)))

(declare-fun lt!408300 () ListLongMap!10861)

(assert (=> b!904699 (= res!610444 (not (contains!4493 lt!408300 k0!1033)))))

(assert (=> b!904699 (= lt!408300 (getCurrentListMap!2714 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29644 () Bool)

(declare-fun mapRes!29644 () Bool)

(declare-fun tp!56871 () Bool)

(declare-fun e!506948 () Bool)

(assert (=> mapNonEmpty!29644 (= mapRes!29644 (and tp!56871 e!506948))))

(declare-fun mapValue!29644 () ValueCell!8829)

(declare-fun mapRest!29644 () (Array (_ BitVec 32) ValueCell!8829))

(declare-fun mapKey!29644 () (_ BitVec 32))

(assert (=> mapNonEmpty!29644 (= (arr!25602 _values!1152) (store mapRest!29644 mapKey!29644 mapValue!29644))))

(declare-fun b!904700 () Bool)

(declare-fun res!610446 () Bool)

(assert (=> b!904700 (=> (not res!610446) (not e!506944))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904700 (= res!610446 (inRange!0 i!717 mask!1756))))

(declare-fun b!904701 () Bool)

(assert (=> b!904701 (= e!506946 true)))

(declare-fun lt!408299 () V!29793)

(declare-fun apply!439 (ListLongMap!10861 (_ BitVec 64)) V!29793)

(assert (=> b!904701 (= lt!408299 (apply!439 lt!408300 k0!1033))))

(declare-fun b!904702 () Bool)

(declare-fun res!610447 () Bool)

(assert (=> b!904702 (=> (not res!610447) (not e!506944))))

(declare-datatypes ((List!17979 0))(
  ( (Nil!17976) (Cons!17975 (h!19121 (_ BitVec 64)) (t!25362 List!17979)) )
))
(declare-fun arrayNoDuplicates!0 (array!53288 (_ BitVec 32) List!17979) Bool)

(assert (=> b!904702 (= res!610447 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17976))))

(declare-fun b!904703 () Bool)

(assert (=> b!904703 (= e!506948 tp_is_empty!18621)))

(declare-fun mapIsEmpty!29644 () Bool)

(assert (=> mapIsEmpty!29644 mapRes!29644))

(declare-fun b!904704 () Bool)

(declare-fun res!610448 () Bool)

(assert (=> b!904704 (=> (not res!610448) (not e!506944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53288 (_ BitVec 32)) Bool)

(assert (=> b!904704 (= res!610448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904705 () Bool)

(assert (=> b!904705 (= e!506944 (not e!506949))))

(declare-fun res!610451 () Bool)

(assert (=> b!904705 (=> res!610451 e!506949)))

(assert (=> b!904705 (= res!610451 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26062 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904705 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30686 0))(
  ( (Unit!30687) )
))
(declare-fun lt!408298 () Unit!30686)

(declare-fun lemmaKeyInListMapIsInArray!186 (array!53288 array!53286 (_ BitVec 32) (_ BitVec 32) V!29793 V!29793 (_ BitVec 64) Int) Unit!30686)

(assert (=> b!904705 (= lt!408298 (lemmaKeyInListMapIsInArray!186 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904706 () Bool)

(declare-fun e!506947 () Bool)

(assert (=> b!904706 (= e!506947 (and e!506943 mapRes!29644))))

(declare-fun condMapEmpty!29644 () Bool)

(declare-fun mapDefault!29644 () ValueCell!8829)

(assert (=> b!904706 (= condMapEmpty!29644 (= (arr!25602 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8829)) mapDefault!29644)))))

(declare-fun res!610443 () Bool)

(assert (=> start!77618 (=> (not res!610443) (not e!506944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77618 (= res!610443 (validMask!0 mask!1756))))

(assert (=> start!77618 e!506944))

(declare-fun array_inv!20058 (array!53286) Bool)

(assert (=> start!77618 (and (array_inv!20058 _values!1152) e!506947)))

(assert (=> start!77618 tp!56870))

(assert (=> start!77618 true))

(assert (=> start!77618 tp_is_empty!18621))

(declare-fun array_inv!20059 (array!53288) Bool)

(assert (=> start!77618 (array_inv!20059 _keys!1386)))

(assert (= (and start!77618 res!610443) b!904697))

(assert (= (and b!904697 res!610450) b!904704))

(assert (= (and b!904704 res!610448) b!904702))

(assert (= (and b!904702 res!610447) b!904695))

(assert (= (and b!904695 res!610449) b!904700))

(assert (= (and b!904700 res!610446) b!904696))

(assert (= (and b!904696 res!610445) b!904705))

(assert (= (and b!904705 (not res!610451)) b!904699))

(assert (= (and b!904699 (not res!610444)) b!904701))

(assert (= (and b!904706 condMapEmpty!29644) mapIsEmpty!29644))

(assert (= (and b!904706 (not condMapEmpty!29644)) mapNonEmpty!29644))

(get-info :version)

(assert (= (and mapNonEmpty!29644 ((_ is ValueCellFull!8829) mapValue!29644)) b!904703))

(assert (= (and b!904706 ((_ is ValueCellFull!8829) mapDefault!29644)) b!904698))

(assert (= start!77618 b!904706))

(declare-fun m!840145 () Bool)

(assert (=> b!904700 m!840145))

(declare-fun m!840147 () Bool)

(assert (=> mapNonEmpty!29644 m!840147))

(declare-fun m!840149 () Bool)

(assert (=> b!904695 m!840149))

(assert (=> b!904695 m!840149))

(declare-fun m!840151 () Bool)

(assert (=> b!904695 m!840151))

(declare-fun m!840153 () Bool)

(assert (=> b!904702 m!840153))

(declare-fun m!840155 () Bool)

(assert (=> b!904701 m!840155))

(declare-fun m!840157 () Bool)

(assert (=> b!904699 m!840157))

(declare-fun m!840159 () Bool)

(assert (=> b!904699 m!840159))

(declare-fun m!840161 () Bool)

(assert (=> b!904705 m!840161))

(declare-fun m!840163 () Bool)

(assert (=> b!904705 m!840163))

(declare-fun m!840165 () Bool)

(assert (=> start!77618 m!840165))

(declare-fun m!840167 () Bool)

(assert (=> start!77618 m!840167))

(declare-fun m!840169 () Bool)

(assert (=> start!77618 m!840169))

(declare-fun m!840171 () Bool)

(assert (=> b!904704 m!840171))

(declare-fun m!840173 () Bool)

(assert (=> b!904696 m!840173))

(check-sat (not b!904702) (not b!904705) (not b!904700) (not b!904695) (not b_next!16203) b_and!26569 tp_is_empty!18621 (not start!77618) (not b!904704) (not mapNonEmpty!29644) (not b!904699) (not b!904701))
(check-sat b_and!26569 (not b_next!16203))
