; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83090 () Bool)

(assert start!83090)

(declare-fun mapNonEmpty!34981 () Bool)

(declare-fun mapRes!34981 () Bool)

(declare-fun tp!66549 () Bool)

(declare-fun e!546423 () Bool)

(assert (=> mapNonEmpty!34981 (= mapRes!34981 (and tp!66549 e!546423))))

(declare-datatypes ((V!34291 0))(
  ( (V!34292 (val!11041 Int)) )
))
(declare-datatypes ((ValueCell!10509 0))(
  ( (ValueCellFull!10509 (v!13600 V!34291)) (EmptyCell!10509) )
))
(declare-datatypes ((array!60029 0))(
  ( (array!60030 (arr!28878 (Array (_ BitVec 32) ValueCell!10509)) (size!29357 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60029)

(declare-fun mapKey!34981 () (_ BitVec 32))

(declare-fun mapValue!34981 () ValueCell!10509)

(declare-fun mapRest!34981 () (Array (_ BitVec 32) ValueCell!10509))

(assert (=> mapNonEmpty!34981 (= (arr!28878 _values!1425) (store mapRest!34981 mapKey!34981 mapValue!34981))))

(declare-fun b!969254 () Bool)

(declare-fun e!546422 () Bool)

(declare-fun e!546424 () Bool)

(assert (=> b!969254 (= e!546422 (and e!546424 mapRes!34981))))

(declare-fun condMapEmpty!34981 () Bool)

(declare-fun mapDefault!34981 () ValueCell!10509)

(assert (=> b!969254 (= condMapEmpty!34981 (= (arr!28878 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10509)) mapDefault!34981)))))

(declare-fun b!969255 () Bool)

(declare-fun e!546421 () Bool)

(assert (=> b!969255 (= e!546421 false)))

(declare-fun lt!431621 () Bool)

(declare-datatypes ((array!60031 0))(
  ( (array!60032 (arr!28879 (Array (_ BitVec 32) (_ BitVec 64))) (size!29358 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60031)

(declare-datatypes ((List!20020 0))(
  ( (Nil!20017) (Cons!20016 (h!21178 (_ BitVec 64)) (t!28383 List!20020)) )
))
(declare-fun arrayNoDuplicates!0 (array!60031 (_ BitVec 32) List!20020) Bool)

(assert (=> b!969255 (= lt!431621 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20017))))

(declare-fun res!648749 () Bool)

(assert (=> start!83090 (=> (not res!648749) (not e!546421))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83090 (= res!648749 (validMask!0 mask!2147))))

(assert (=> start!83090 e!546421))

(assert (=> start!83090 true))

(declare-fun array_inv!22355 (array!60029) Bool)

(assert (=> start!83090 (and (array_inv!22355 _values!1425) e!546422)))

(declare-fun array_inv!22356 (array!60031) Bool)

(assert (=> start!83090 (array_inv!22356 _keys!1717)))

(declare-fun b!969256 () Bool)

(declare-fun res!648750 () Bool)

(assert (=> b!969256 (=> (not res!648750) (not e!546421))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969256 (= res!648750 (and (= (size!29357 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29358 _keys!1717) (size!29357 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969257 () Bool)

(declare-fun tp_is_empty!21981 () Bool)

(assert (=> b!969257 (= e!546424 tp_is_empty!21981)))

(declare-fun b!969258 () Bool)

(assert (=> b!969258 (= e!546423 tp_is_empty!21981)))

(declare-fun mapIsEmpty!34981 () Bool)

(assert (=> mapIsEmpty!34981 mapRes!34981))

(declare-fun b!969259 () Bool)

(declare-fun res!648748 () Bool)

(assert (=> b!969259 (=> (not res!648748) (not e!546421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60031 (_ BitVec 32)) Bool)

(assert (=> b!969259 (= res!648748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83090 res!648749) b!969256))

(assert (= (and b!969256 res!648750) b!969259))

(assert (= (and b!969259 res!648748) b!969255))

(assert (= (and b!969254 condMapEmpty!34981) mapIsEmpty!34981))

(assert (= (and b!969254 (not condMapEmpty!34981)) mapNonEmpty!34981))

(get-info :version)

(assert (= (and mapNonEmpty!34981 ((_ is ValueCellFull!10509) mapValue!34981)) b!969258))

(assert (= (and b!969254 ((_ is ValueCellFull!10509) mapDefault!34981)) b!969257))

(assert (= start!83090 b!969254))

(declare-fun m!897319 () Bool)

(assert (=> mapNonEmpty!34981 m!897319))

(declare-fun m!897321 () Bool)

(assert (=> b!969255 m!897321))

(declare-fun m!897323 () Bool)

(assert (=> start!83090 m!897323))

(declare-fun m!897325 () Bool)

(assert (=> start!83090 m!897325))

(declare-fun m!897327 () Bool)

(assert (=> start!83090 m!897327))

(declare-fun m!897329 () Bool)

(assert (=> b!969259 m!897329))

(check-sat (not b!969259) (not start!83090) (not b!969255) tp_is_empty!21981 (not mapNonEmpty!34981))
(check-sat)
