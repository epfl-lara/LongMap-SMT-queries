; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77534 () Bool)

(assert start!77534)

(declare-fun b_free!16119 () Bool)

(declare-fun b_next!16119 () Bool)

(assert (=> start!77534 (= b_free!16119 (not b_next!16119))))

(declare-fun tp!56619 () Bool)

(declare-fun b_and!26485 () Bool)

(assert (=> start!77534 (= tp!56619 b_and!26485)))

(declare-fun b!903383 () Bool)

(declare-fun res!609509 () Bool)

(declare-fun e!506141 () Bool)

(assert (=> b!903383 (=> (not res!609509) (not e!506141))))

(declare-datatypes ((array!53130 0))(
  ( (array!53131 (arr!25524 (Array (_ BitVec 32) (_ BitVec 64))) (size!25983 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53130)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53130 (_ BitVec 32)) Bool)

(assert (=> b!903383 (= res!609509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609510 () Bool)

(assert (=> start!77534 (=> (not res!609510) (not e!506141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77534 (= res!609510 (validMask!0 mask!1756))))

(assert (=> start!77534 e!506141))

(declare-datatypes ((V!29681 0))(
  ( (V!29682 (val!9319 Int)) )
))
(declare-datatypes ((ValueCell!8787 0))(
  ( (ValueCellFull!8787 (v!11824 V!29681)) (EmptyCell!8787) )
))
(declare-datatypes ((array!53132 0))(
  ( (array!53133 (arr!25525 (Array (_ BitVec 32) ValueCell!8787)) (size!25984 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53132)

(declare-fun e!506144 () Bool)

(declare-fun array_inv!20002 (array!53132) Bool)

(assert (=> start!77534 (and (array_inv!20002 _values!1152) e!506144)))

(assert (=> start!77534 tp!56619))

(assert (=> start!77534 true))

(declare-fun tp_is_empty!18537 () Bool)

(assert (=> start!77534 tp_is_empty!18537))

(declare-fun array_inv!20003 (array!53130) Bool)

(assert (=> start!77534 (array_inv!20003 _keys!1386)))

(declare-fun b!903384 () Bool)

(assert (=> b!903384 (= e!506141 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29681)

(declare-fun lt!408000 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29681)

(declare-datatypes ((tuple2!12102 0))(
  ( (tuple2!12103 (_1!6062 (_ BitVec 64)) (_2!6062 V!29681)) )
))
(declare-datatypes ((List!17922 0))(
  ( (Nil!17919) (Cons!17918 (h!19064 tuple2!12102) (t!25305 List!17922)) )
))
(declare-datatypes ((ListLongMap!10799 0))(
  ( (ListLongMap!10800 (toList!5415 List!17922)) )
))
(declare-fun contains!4463 (ListLongMap!10799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2684 (array!53130 array!53132 (_ BitVec 32) (_ BitVec 32) V!29681 V!29681 (_ BitVec 32) Int) ListLongMap!10799)

(assert (=> b!903384 (= lt!408000 (contains!4463 (getCurrentListMap!2684 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29518 () Bool)

(declare-fun mapRes!29518 () Bool)

(assert (=> mapIsEmpty!29518 mapRes!29518))

(declare-fun b!903385 () Bool)

(declare-fun e!506142 () Bool)

(assert (=> b!903385 (= e!506142 tp_is_empty!18537)))

(declare-fun b!903386 () Bool)

(declare-fun res!609512 () Bool)

(assert (=> b!903386 (=> (not res!609512) (not e!506141))))

(declare-datatypes ((List!17923 0))(
  ( (Nil!17920) (Cons!17919 (h!19065 (_ BitVec 64)) (t!25306 List!17923)) )
))
(declare-fun arrayNoDuplicates!0 (array!53130 (_ BitVec 32) List!17923) Bool)

(assert (=> b!903386 (= res!609512 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17920))))

(declare-fun b!903387 () Bool)

(declare-fun e!506143 () Bool)

(assert (=> b!903387 (= e!506143 tp_is_empty!18537)))

(declare-fun mapNonEmpty!29518 () Bool)

(declare-fun tp!56618 () Bool)

(assert (=> mapNonEmpty!29518 (= mapRes!29518 (and tp!56618 e!506142))))

(declare-fun mapValue!29518 () ValueCell!8787)

(declare-fun mapKey!29518 () (_ BitVec 32))

(declare-fun mapRest!29518 () (Array (_ BitVec 32) ValueCell!8787))

(assert (=> mapNonEmpty!29518 (= (arr!25525 _values!1152) (store mapRest!29518 mapKey!29518 mapValue!29518))))

(declare-fun b!903388 () Bool)

(assert (=> b!903388 (= e!506144 (and e!506143 mapRes!29518))))

(declare-fun condMapEmpty!29518 () Bool)

(declare-fun mapDefault!29518 () ValueCell!8787)

(assert (=> b!903388 (= condMapEmpty!29518 (= (arr!25525 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8787)) mapDefault!29518)))))

(declare-fun b!903389 () Bool)

(declare-fun res!609511 () Bool)

(assert (=> b!903389 (=> (not res!609511) (not e!506141))))

(assert (=> b!903389 (= res!609511 (and (= (size!25984 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25983 _keys!1386) (size!25984 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77534 res!609510) b!903389))

(assert (= (and b!903389 res!609511) b!903383))

(assert (= (and b!903383 res!609509) b!903386))

(assert (= (and b!903386 res!609512) b!903384))

(assert (= (and b!903388 condMapEmpty!29518) mapIsEmpty!29518))

(assert (= (and b!903388 (not condMapEmpty!29518)) mapNonEmpty!29518))

(get-info :version)

(assert (= (and mapNonEmpty!29518 ((_ is ValueCellFull!8787) mapValue!29518)) b!903385))

(assert (= (and b!903388 ((_ is ValueCellFull!8787) mapDefault!29518)) b!903387))

(assert (= start!77534 b!903388))

(declare-fun m!839081 () Bool)

(assert (=> b!903386 m!839081))

(declare-fun m!839083 () Bool)

(assert (=> start!77534 m!839083))

(declare-fun m!839085 () Bool)

(assert (=> start!77534 m!839085))

(declare-fun m!839087 () Bool)

(assert (=> start!77534 m!839087))

(declare-fun m!839089 () Bool)

(assert (=> b!903383 m!839089))

(declare-fun m!839091 () Bool)

(assert (=> mapNonEmpty!29518 m!839091))

(declare-fun m!839093 () Bool)

(assert (=> b!903384 m!839093))

(assert (=> b!903384 m!839093))

(declare-fun m!839095 () Bool)

(assert (=> b!903384 m!839095))

(check-sat (not b!903384) (not b!903386) (not start!77534) (not mapNonEmpty!29518) (not b_next!16119) tp_is_empty!18537 (not b!903383) b_and!26485)
(check-sat b_and!26485 (not b_next!16119))
