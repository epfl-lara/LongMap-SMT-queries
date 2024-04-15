; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77556 () Bool)

(assert start!77556)

(declare-fun b_free!16159 () Bool)

(declare-fun b_next!16159 () Bool)

(assert (=> start!77556 (= b_free!16159 (not b_next!16159))))

(declare-fun tp!56739 () Bool)

(declare-fun b_and!26499 () Bool)

(assert (=> start!77556 (= tp!56739 b_and!26499)))

(declare-fun mapNonEmpty!29578 () Bool)

(declare-fun mapRes!29578 () Bool)

(declare-fun tp!56740 () Bool)

(declare-fun e!506337 () Bool)

(assert (=> mapNonEmpty!29578 (= mapRes!29578 (and tp!56740 e!506337))))

(declare-fun mapKey!29578 () (_ BitVec 32))

(declare-datatypes ((V!29735 0))(
  ( (V!29736 (val!9339 Int)) )
))
(declare-datatypes ((ValueCell!8807 0))(
  ( (ValueCellFull!8807 (v!11843 V!29735)) (EmptyCell!8807) )
))
(declare-fun mapValue!29578 () ValueCell!8807)

(declare-fun mapRest!29578 () (Array (_ BitVec 32) ValueCell!8807))

(declare-datatypes ((array!53185 0))(
  ( (array!53186 (arr!25552 (Array (_ BitVec 32) ValueCell!8807)) (size!26013 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53185)

(assert (=> mapNonEmpty!29578 (= (arr!25552 _values!1152) (store mapRest!29578 mapKey!29578 mapValue!29578))))

(declare-fun mapIsEmpty!29578 () Bool)

(assert (=> mapIsEmpty!29578 mapRes!29578))

(declare-fun b!903664 () Bool)

(declare-fun res!609741 () Bool)

(declare-fun e!506333 () Bool)

(assert (=> b!903664 (=> (not res!609741) (not e!506333))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53187 0))(
  ( (array!53188 (arr!25553 (Array (_ BitVec 32) (_ BitVec 64))) (size!26014 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53187)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!903664 (= res!609741 (and (= (select (arr!25553 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903666 () Bool)

(declare-fun res!609740 () Bool)

(assert (=> b!903666 (=> (not res!609740) (not e!506333))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903666 (= res!609740 (inRange!0 i!717 mask!1756))))

(declare-fun b!903667 () Bool)

(declare-fun e!506339 () Bool)

(assert (=> b!903667 (= e!506339 true)))

(declare-fun lt!407865 () V!29735)

(declare-datatypes ((tuple2!12154 0))(
  ( (tuple2!12155 (_1!6088 (_ BitVec 64)) (_2!6088 V!29735)) )
))
(declare-datatypes ((List!17958 0))(
  ( (Nil!17955) (Cons!17954 (h!19100 tuple2!12154) (t!25332 List!17958)) )
))
(declare-datatypes ((ListLongMap!10841 0))(
  ( (ListLongMap!10842 (toList!5436 List!17958)) )
))
(declare-fun lt!407864 () ListLongMap!10841)

(declare-fun apply!421 (ListLongMap!10841 (_ BitVec 64)) V!29735)

(assert (=> b!903667 (= lt!407865 (apply!421 lt!407864 k0!1033))))

(declare-fun b!903668 () Bool)

(declare-fun e!506334 () Bool)

(declare-fun tp_is_empty!18577 () Bool)

(assert (=> b!903668 (= e!506334 tp_is_empty!18577)))

(declare-fun b!903669 () Bool)

(declare-fun res!609746 () Bool)

(assert (=> b!903669 (=> (not res!609746) (not e!506333))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903669 (= res!609746 (and (= (size!26013 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26014 _keys!1386) (size!26013 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903670 () Bool)

(declare-fun res!609747 () Bool)

(assert (=> b!903670 (=> (not res!609747) (not e!506333))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29735)

(declare-fun minValue!1094 () V!29735)

(declare-fun contains!4446 (ListLongMap!10841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2650 (array!53187 array!53185 (_ BitVec 32) (_ BitVec 32) V!29735 V!29735 (_ BitVec 32) Int) ListLongMap!10841)

(assert (=> b!903670 (= res!609747 (contains!4446 (getCurrentListMap!2650 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903671 () Bool)

(assert (=> b!903671 (= e!506337 tp_is_empty!18577)))

(declare-fun b!903672 () Bool)

(declare-fun e!506336 () Bool)

(assert (=> b!903672 (= e!506333 (not e!506336))))

(declare-fun res!609739 () Bool)

(assert (=> b!903672 (=> res!609739 e!506336)))

(assert (=> b!903672 (= res!609739 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26014 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903672 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30590 0))(
  ( (Unit!30591) )
))
(declare-fun lt!407866 () Unit!30590)

(declare-fun lemmaKeyInListMapIsInArray!177 (array!53187 array!53185 (_ BitVec 32) (_ BitVec 32) V!29735 V!29735 (_ BitVec 64) Int) Unit!30590)

(assert (=> b!903672 (= lt!407866 (lemmaKeyInListMapIsInArray!177 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903673 () Bool)

(assert (=> b!903673 (= e!506336 e!506339)))

(declare-fun res!609745 () Bool)

(assert (=> b!903673 (=> res!609745 e!506339)))

(assert (=> b!903673 (= res!609745 (not (contains!4446 lt!407864 k0!1033)))))

(assert (=> b!903673 (= lt!407864 (getCurrentListMap!2650 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903665 () Bool)

(declare-fun res!609743 () Bool)

(assert (=> b!903665 (=> (not res!609743) (not e!506333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53187 (_ BitVec 32)) Bool)

(assert (=> b!903665 (= res!609743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609744 () Bool)

(assert (=> start!77556 (=> (not res!609744) (not e!506333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77556 (= res!609744 (validMask!0 mask!1756))))

(assert (=> start!77556 e!506333))

(declare-fun e!506338 () Bool)

(declare-fun array_inv!20080 (array!53185) Bool)

(assert (=> start!77556 (and (array_inv!20080 _values!1152) e!506338)))

(assert (=> start!77556 tp!56739))

(assert (=> start!77556 true))

(assert (=> start!77556 tp_is_empty!18577))

(declare-fun array_inv!20081 (array!53187) Bool)

(assert (=> start!77556 (array_inv!20081 _keys!1386)))

(declare-fun b!903674 () Bool)

(assert (=> b!903674 (= e!506338 (and e!506334 mapRes!29578))))

(declare-fun condMapEmpty!29578 () Bool)

(declare-fun mapDefault!29578 () ValueCell!8807)

(assert (=> b!903674 (= condMapEmpty!29578 (= (arr!25552 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8807)) mapDefault!29578)))))

(declare-fun b!903675 () Bool)

(declare-fun res!609742 () Bool)

(assert (=> b!903675 (=> (not res!609742) (not e!506333))))

(declare-datatypes ((List!17959 0))(
  ( (Nil!17956) (Cons!17955 (h!19101 (_ BitVec 64)) (t!25333 List!17959)) )
))
(declare-fun arrayNoDuplicates!0 (array!53187 (_ BitVec 32) List!17959) Bool)

(assert (=> b!903675 (= res!609742 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17956))))

(assert (= (and start!77556 res!609744) b!903669))

(assert (= (and b!903669 res!609746) b!903665))

(assert (= (and b!903665 res!609743) b!903675))

(assert (= (and b!903675 res!609742) b!903670))

(assert (= (and b!903670 res!609747) b!903666))

(assert (= (and b!903666 res!609740) b!903664))

(assert (= (and b!903664 res!609741) b!903672))

(assert (= (and b!903672 (not res!609739)) b!903673))

(assert (= (and b!903673 (not res!609745)) b!903667))

(assert (= (and b!903674 condMapEmpty!29578) mapIsEmpty!29578))

(assert (= (and b!903674 (not condMapEmpty!29578)) mapNonEmpty!29578))

(get-info :version)

(assert (= (and mapNonEmpty!29578 ((_ is ValueCellFull!8807) mapValue!29578)) b!903671))

(assert (= (and b!903674 ((_ is ValueCellFull!8807) mapDefault!29578)) b!903668))

(assert (= start!77556 b!903674))

(declare-fun m!838727 () Bool)

(assert (=> start!77556 m!838727))

(declare-fun m!838729 () Bool)

(assert (=> start!77556 m!838729))

(declare-fun m!838731 () Bool)

(assert (=> start!77556 m!838731))

(declare-fun m!838733 () Bool)

(assert (=> b!903670 m!838733))

(assert (=> b!903670 m!838733))

(declare-fun m!838735 () Bool)

(assert (=> b!903670 m!838735))

(declare-fun m!838737 () Bool)

(assert (=> b!903672 m!838737))

(declare-fun m!838739 () Bool)

(assert (=> b!903672 m!838739))

(declare-fun m!838741 () Bool)

(assert (=> b!903667 m!838741))

(declare-fun m!838743 () Bool)

(assert (=> b!903664 m!838743))

(declare-fun m!838745 () Bool)

(assert (=> b!903673 m!838745))

(declare-fun m!838747 () Bool)

(assert (=> b!903673 m!838747))

(declare-fun m!838749 () Bool)

(assert (=> b!903665 m!838749))

(declare-fun m!838751 () Bool)

(assert (=> b!903675 m!838751))

(declare-fun m!838753 () Bool)

(assert (=> b!903666 m!838753))

(declare-fun m!838755 () Bool)

(assert (=> mapNonEmpty!29578 m!838755))

(check-sat (not mapNonEmpty!29578) (not b!903667) (not b!903675) (not b_next!16159) (not b!903672) (not b!903670) (not b!903666) (not b!903673) (not start!77556) tp_is_empty!18577 (not b!903665) b_and!26499)
(check-sat b_and!26499 (not b_next!16159))
