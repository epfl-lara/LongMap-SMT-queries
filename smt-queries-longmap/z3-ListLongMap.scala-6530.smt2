; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83232 () Bool)

(assert start!83232)

(declare-fun mapIsEmpty!34942 () Bool)

(declare-fun mapRes!34942 () Bool)

(assert (=> mapIsEmpty!34942 mapRes!34942))

(declare-fun b!969923 () Bool)

(declare-fun e!546811 () Bool)

(assert (=> b!969923 (= e!546811 false)))

(declare-fun lt!431943 () Bool)

(declare-datatypes ((array!59996 0))(
  ( (array!59997 (arr!28857 (Array (_ BitVec 32) (_ BitVec 64))) (size!29337 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59996)

(declare-datatypes ((List!20002 0))(
  ( (Nil!19999) (Cons!19998 (h!21166 (_ BitVec 64)) (t!28357 List!20002)) )
))
(declare-fun arrayNoDuplicates!0 (array!59996 (_ BitVec 32) List!20002) Bool)

(assert (=> b!969923 (= lt!431943 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!19999))))

(declare-fun b!969924 () Bool)

(declare-fun e!546809 () Bool)

(declare-fun tp_is_empty!21955 () Bool)

(assert (=> b!969924 (= e!546809 tp_is_empty!21955)))

(declare-fun b!969925 () Bool)

(declare-fun res!648975 () Bool)

(assert (=> b!969925 (=> (not res!648975) (not e!546811))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34257 0))(
  ( (V!34258 (val!11028 Int)) )
))
(declare-datatypes ((ValueCell!10496 0))(
  ( (ValueCellFull!10496 (v!13584 V!34257)) (EmptyCell!10496) )
))
(declare-datatypes ((array!59998 0))(
  ( (array!59999 (arr!28858 (Array (_ BitVec 32) ValueCell!10496)) (size!29338 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59998)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969925 (= res!648975 (and (= (size!29338 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29337 _keys!1717) (size!29338 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34942 () Bool)

(declare-fun tp!66511 () Bool)

(declare-fun e!546810 () Bool)

(assert (=> mapNonEmpty!34942 (= mapRes!34942 (and tp!66511 e!546810))))

(declare-fun mapValue!34942 () ValueCell!10496)

(declare-fun mapKey!34942 () (_ BitVec 32))

(declare-fun mapRest!34942 () (Array (_ BitVec 32) ValueCell!10496))

(assert (=> mapNonEmpty!34942 (= (arr!28858 _values!1425) (store mapRest!34942 mapKey!34942 mapValue!34942))))

(declare-fun res!648976 () Bool)

(assert (=> start!83232 (=> (not res!648976) (not e!546811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83232 (= res!648976 (validMask!0 mask!2147))))

(assert (=> start!83232 e!546811))

(assert (=> start!83232 true))

(declare-fun e!546808 () Bool)

(declare-fun array_inv!22395 (array!59998) Bool)

(assert (=> start!83232 (and (array_inv!22395 _values!1425) e!546808)))

(declare-fun array_inv!22396 (array!59996) Bool)

(assert (=> start!83232 (array_inv!22396 _keys!1717)))

(declare-fun b!969926 () Bool)

(assert (=> b!969926 (= e!546808 (and e!546809 mapRes!34942))))

(declare-fun condMapEmpty!34942 () Bool)

(declare-fun mapDefault!34942 () ValueCell!10496)

(assert (=> b!969926 (= condMapEmpty!34942 (= (arr!28858 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10496)) mapDefault!34942)))))

(declare-fun b!969927 () Bool)

(declare-fun res!648977 () Bool)

(assert (=> b!969927 (=> (not res!648977) (not e!546811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59996 (_ BitVec 32)) Bool)

(assert (=> b!969927 (= res!648977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969928 () Bool)

(assert (=> b!969928 (= e!546810 tp_is_empty!21955)))

(assert (= (and start!83232 res!648976) b!969925))

(assert (= (and b!969925 res!648975) b!969927))

(assert (= (and b!969927 res!648977) b!969923))

(assert (= (and b!969926 condMapEmpty!34942) mapIsEmpty!34942))

(assert (= (and b!969926 (not condMapEmpty!34942)) mapNonEmpty!34942))

(get-info :version)

(assert (= (and mapNonEmpty!34942 ((_ is ValueCellFull!10496) mapValue!34942)) b!969928))

(assert (= (and b!969926 ((_ is ValueCellFull!10496) mapDefault!34942)) b!969924))

(assert (= start!83232 b!969926))

(declare-fun m!898457 () Bool)

(assert (=> b!969923 m!898457))

(declare-fun m!898459 () Bool)

(assert (=> mapNonEmpty!34942 m!898459))

(declare-fun m!898461 () Bool)

(assert (=> start!83232 m!898461))

(declare-fun m!898463 () Bool)

(assert (=> start!83232 m!898463))

(declare-fun m!898465 () Bool)

(assert (=> start!83232 m!898465))

(declare-fun m!898467 () Bool)

(assert (=> b!969927 m!898467))

(check-sat (not mapNonEmpty!34942) (not b!969923) (not b!969927) tp_is_empty!21955 (not start!83232))
(check-sat)
