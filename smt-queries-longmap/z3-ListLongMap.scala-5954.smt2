; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77552 () Bool)

(assert start!77552)

(declare-fun b_free!16137 () Bool)

(declare-fun b_next!16137 () Bool)

(assert (=> start!77552 (= b_free!16137 (not b_next!16137))))

(declare-fun tp!56673 () Bool)

(declare-fun b_and!26503 () Bool)

(assert (=> start!77552 (= tp!56673 b_and!26503)))

(declare-fun b!903572 () Bool)

(declare-fun res!609618 () Bool)

(declare-fun e!506279 () Bool)

(assert (=> b!903572 (=> (not res!609618) (not e!506279))))

(declare-datatypes ((array!53162 0))(
  ( (array!53163 (arr!25540 (Array (_ BitVec 32) (_ BitVec 64))) (size!25999 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53162)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53162 (_ BitVec 32)) Bool)

(assert (=> b!903572 (= res!609618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903573 () Bool)

(declare-fun res!609617 () Bool)

(assert (=> b!903573 (=> (not res!609617) (not e!506279))))

(declare-datatypes ((List!17932 0))(
  ( (Nil!17929) (Cons!17928 (h!19074 (_ BitVec 64)) (t!25315 List!17932)) )
))
(declare-fun arrayNoDuplicates!0 (array!53162 (_ BitVec 32) List!17932) Bool)

(assert (=> b!903573 (= res!609617 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17929))))

(declare-fun mapIsEmpty!29545 () Bool)

(declare-fun mapRes!29545 () Bool)

(assert (=> mapIsEmpty!29545 mapRes!29545))

(declare-fun b!903574 () Bool)

(assert (=> b!903574 (= e!506279 false)))

(declare-datatypes ((V!29705 0))(
  ( (V!29706 (val!9328 Int)) )
))
(declare-datatypes ((ValueCell!8796 0))(
  ( (ValueCellFull!8796 (v!11833 V!29705)) (EmptyCell!8796) )
))
(declare-datatypes ((array!53164 0))(
  ( (array!53165 (arr!25541 (Array (_ BitVec 32) ValueCell!8796)) (size!26000 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53164)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29705)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29705)

(declare-fun lt!408027 () Bool)

(declare-datatypes ((tuple2!12112 0))(
  ( (tuple2!12113 (_1!6067 (_ BitVec 64)) (_2!6067 V!29705)) )
))
(declare-datatypes ((List!17933 0))(
  ( (Nil!17930) (Cons!17929 (h!19075 tuple2!12112) (t!25316 List!17933)) )
))
(declare-datatypes ((ListLongMap!10809 0))(
  ( (ListLongMap!10810 (toList!5420 List!17933)) )
))
(declare-fun contains!4468 (ListLongMap!10809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2689 (array!53162 array!53164 (_ BitVec 32) (_ BitVec 32) V!29705 V!29705 (_ BitVec 32) Int) ListLongMap!10809)

(assert (=> b!903574 (= lt!408027 (contains!4468 (getCurrentListMap!2689 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903575 () Bool)

(declare-fun res!609619 () Bool)

(assert (=> b!903575 (=> (not res!609619) (not e!506279))))

(assert (=> b!903575 (= res!609619 (and (= (size!26000 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25999 _keys!1386) (size!26000 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903576 () Bool)

(declare-fun e!506280 () Bool)

(declare-fun e!506278 () Bool)

(assert (=> b!903576 (= e!506280 (and e!506278 mapRes!29545))))

(declare-fun condMapEmpty!29545 () Bool)

(declare-fun mapDefault!29545 () ValueCell!8796)

(assert (=> b!903576 (= condMapEmpty!29545 (= (arr!25541 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8796)) mapDefault!29545)))))

(declare-fun res!609620 () Bool)

(assert (=> start!77552 (=> (not res!609620) (not e!506279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77552 (= res!609620 (validMask!0 mask!1756))))

(assert (=> start!77552 e!506279))

(declare-fun array_inv!20014 (array!53164) Bool)

(assert (=> start!77552 (and (array_inv!20014 _values!1152) e!506280)))

(assert (=> start!77552 tp!56673))

(assert (=> start!77552 true))

(declare-fun tp_is_empty!18555 () Bool)

(assert (=> start!77552 tp_is_empty!18555))

(declare-fun array_inv!20015 (array!53162) Bool)

(assert (=> start!77552 (array_inv!20015 _keys!1386)))

(declare-fun b!903577 () Bool)

(declare-fun e!506277 () Bool)

(assert (=> b!903577 (= e!506277 tp_is_empty!18555)))

(declare-fun mapNonEmpty!29545 () Bool)

(declare-fun tp!56672 () Bool)

(assert (=> mapNonEmpty!29545 (= mapRes!29545 (and tp!56672 e!506277))))

(declare-fun mapRest!29545 () (Array (_ BitVec 32) ValueCell!8796))

(declare-fun mapValue!29545 () ValueCell!8796)

(declare-fun mapKey!29545 () (_ BitVec 32))

(assert (=> mapNonEmpty!29545 (= (arr!25541 _values!1152) (store mapRest!29545 mapKey!29545 mapValue!29545))))

(declare-fun b!903578 () Bool)

(assert (=> b!903578 (= e!506278 tp_is_empty!18555)))

(assert (= (and start!77552 res!609620) b!903575))

(assert (= (and b!903575 res!609619) b!903572))

(assert (= (and b!903572 res!609618) b!903573))

(assert (= (and b!903573 res!609617) b!903574))

(assert (= (and b!903576 condMapEmpty!29545) mapIsEmpty!29545))

(assert (= (and b!903576 (not condMapEmpty!29545)) mapNonEmpty!29545))

(get-info :version)

(assert (= (and mapNonEmpty!29545 ((_ is ValueCellFull!8796) mapValue!29545)) b!903577))

(assert (= (and b!903576 ((_ is ValueCellFull!8796) mapDefault!29545)) b!903578))

(assert (= start!77552 b!903576))

(declare-fun m!839225 () Bool)

(assert (=> b!903574 m!839225))

(assert (=> b!903574 m!839225))

(declare-fun m!839227 () Bool)

(assert (=> b!903574 m!839227))

(declare-fun m!839229 () Bool)

(assert (=> b!903573 m!839229))

(declare-fun m!839231 () Bool)

(assert (=> start!77552 m!839231))

(declare-fun m!839233 () Bool)

(assert (=> start!77552 m!839233))

(declare-fun m!839235 () Bool)

(assert (=> start!77552 m!839235))

(declare-fun m!839237 () Bool)

(assert (=> mapNonEmpty!29545 m!839237))

(declare-fun m!839239 () Bool)

(assert (=> b!903572 m!839239))

(check-sat (not b!903572) tp_is_empty!18555 (not mapNonEmpty!29545) (not b!903573) (not b!903574) (not start!77552) (not b_next!16137) b_and!26503)
(check-sat b_and!26503 (not b_next!16137))
