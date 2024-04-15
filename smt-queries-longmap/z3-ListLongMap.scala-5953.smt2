; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77526 () Bool)

(assert start!77526)

(declare-fun b_free!16129 () Bool)

(declare-fun b_next!16129 () Bool)

(assert (=> start!77526 (= b_free!16129 (not b_next!16129))))

(declare-fun tp!56649 () Bool)

(declare-fun b_and!26469 () Bool)

(assert (=> start!77526 (= tp!56649 b_and!26469)))

(declare-fun b!903249 () Bool)

(declare-fun res!609462 () Bool)

(declare-fun e!506068 () Bool)

(assert (=> b!903249 (=> (not res!609462) (not e!506068))))

(declare-datatypes ((array!53133 0))(
  ( (array!53134 (arr!25526 (Array (_ BitVec 32) (_ BitVec 64))) (size!25987 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53133)

(declare-datatypes ((List!17938 0))(
  ( (Nil!17935) (Cons!17934 (h!19080 (_ BitVec 64)) (t!25312 List!17938)) )
))
(declare-fun arrayNoDuplicates!0 (array!53133 (_ BitVec 32) List!17938) Bool)

(assert (=> b!903249 (= res!609462 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17935))))

(declare-fun b!903250 () Bool)

(declare-fun e!506072 () Bool)

(declare-fun tp_is_empty!18547 () Bool)

(assert (=> b!903250 (= e!506072 tp_is_empty!18547)))

(declare-fun b!903251 () Bool)

(declare-fun res!609459 () Bool)

(assert (=> b!903251 (=> (not res!609459) (not e!506068))))

(declare-datatypes ((V!29695 0))(
  ( (V!29696 (val!9324 Int)) )
))
(declare-datatypes ((ValueCell!8792 0))(
  ( (ValueCellFull!8792 (v!11828 V!29695)) (EmptyCell!8792) )
))
(declare-datatypes ((array!53135 0))(
  ( (array!53136 (arr!25527 (Array (_ BitVec 32) ValueCell!8792)) (size!25988 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53135)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903251 (= res!609459 (and (= (size!25988 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25987 _keys!1386) (size!25988 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29533 () Bool)

(declare-fun mapRes!29533 () Bool)

(declare-fun tp!56650 () Bool)

(assert (=> mapNonEmpty!29533 (= mapRes!29533 (and tp!56650 e!506072))))

(declare-fun mapKey!29533 () (_ BitVec 32))

(declare-fun mapRest!29533 () (Array (_ BitVec 32) ValueCell!8792))

(declare-fun mapValue!29533 () ValueCell!8792)

(assert (=> mapNonEmpty!29533 (= (arr!25527 _values!1152) (store mapRest!29533 mapKey!29533 mapValue!29533))))

(declare-fun b!903252 () Bool)

(declare-fun e!506071 () Bool)

(declare-fun e!506070 () Bool)

(assert (=> b!903252 (= e!506071 (and e!506070 mapRes!29533))))

(declare-fun condMapEmpty!29533 () Bool)

(declare-fun mapDefault!29533 () ValueCell!8792)

(assert (=> b!903252 (= condMapEmpty!29533 (= (arr!25527 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8792)) mapDefault!29533)))))

(declare-fun res!609460 () Bool)

(assert (=> start!77526 (=> (not res!609460) (not e!506068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77526 (= res!609460 (validMask!0 mask!1756))))

(assert (=> start!77526 e!506068))

(declare-fun array_inv!20062 (array!53135) Bool)

(assert (=> start!77526 (and (array_inv!20062 _values!1152) e!506071)))

(assert (=> start!77526 tp!56649))

(assert (=> start!77526 true))

(assert (=> start!77526 tp_is_empty!18547))

(declare-fun array_inv!20063 (array!53133) Bool)

(assert (=> start!77526 (array_inv!20063 _keys!1386)))

(declare-fun b!903253 () Bool)

(assert (=> b!903253 (= e!506068 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29695)

(declare-fun lt!407779 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29695)

(declare-datatypes ((tuple2!12132 0))(
  ( (tuple2!12133 (_1!6077 (_ BitVec 64)) (_2!6077 V!29695)) )
))
(declare-datatypes ((List!17939 0))(
  ( (Nil!17936) (Cons!17935 (h!19081 tuple2!12132) (t!25313 List!17939)) )
))
(declare-datatypes ((ListLongMap!10819 0))(
  ( (ListLongMap!10820 (toList!5425 List!17939)) )
))
(declare-fun contains!4436 (ListLongMap!10819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2640 (array!53133 array!53135 (_ BitVec 32) (_ BitVec 32) V!29695 V!29695 (_ BitVec 32) Int) ListLongMap!10819)

(assert (=> b!903253 (= lt!407779 (contains!4436 (getCurrentListMap!2640 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29533 () Bool)

(assert (=> mapIsEmpty!29533 mapRes!29533))

(declare-fun b!903254 () Bool)

(assert (=> b!903254 (= e!506070 tp_is_empty!18547)))

(declare-fun b!903255 () Bool)

(declare-fun res!609461 () Bool)

(assert (=> b!903255 (=> (not res!609461) (not e!506068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53133 (_ BitVec 32)) Bool)

(assert (=> b!903255 (= res!609461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77526 res!609460) b!903251))

(assert (= (and b!903251 res!609459) b!903255))

(assert (= (and b!903255 res!609461) b!903249))

(assert (= (and b!903249 res!609462) b!903253))

(assert (= (and b!903252 condMapEmpty!29533) mapIsEmpty!29533))

(assert (= (and b!903252 (not condMapEmpty!29533)) mapNonEmpty!29533))

(get-info :version)

(assert (= (and mapNonEmpty!29533 ((_ is ValueCellFull!8792) mapValue!29533)) b!903250))

(assert (= (and b!903252 ((_ is ValueCellFull!8792) mapDefault!29533)) b!903254))

(assert (= start!77526 b!903252))

(declare-fun m!838403 () Bool)

(assert (=> b!903255 m!838403))

(declare-fun m!838405 () Bool)

(assert (=> mapNonEmpty!29533 m!838405))

(declare-fun m!838407 () Bool)

(assert (=> b!903249 m!838407))

(declare-fun m!838409 () Bool)

(assert (=> start!77526 m!838409))

(declare-fun m!838411 () Bool)

(assert (=> start!77526 m!838411))

(declare-fun m!838413 () Bool)

(assert (=> start!77526 m!838413))

(declare-fun m!838415 () Bool)

(assert (=> b!903253 m!838415))

(assert (=> b!903253 m!838415))

(declare-fun m!838417 () Bool)

(assert (=> b!903253 m!838417))

(check-sat (not b!903255) (not b_next!16129) (not mapNonEmpty!29533) (not b!903253) (not b!903249) tp_is_empty!18547 b_and!26469 (not start!77526))
(check-sat b_and!26469 (not b_next!16129))
