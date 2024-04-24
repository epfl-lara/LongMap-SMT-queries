; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20056 () Bool)

(assert start!20056)

(declare-fun b!196406 () Bool)

(declare-fun e!129336 () Bool)

(declare-fun e!129335 () Bool)

(declare-fun mapRes!7919 () Bool)

(assert (=> b!196406 (= e!129336 (and e!129335 mapRes!7919))))

(declare-fun condMapEmpty!7919 () Bool)

(declare-datatypes ((V!5737 0))(
  ( (V!5738 (val!2328 Int)) )
))
(declare-datatypes ((ValueCell!1940 0))(
  ( (ValueCellFull!1940 (v!4299 V!5737)) (EmptyCell!1940) )
))
(declare-datatypes ((array!8383 0))(
  ( (array!8384 (arr!3942 (Array (_ BitVec 32) ValueCell!1940)) (size!4267 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8383)

(declare-fun mapDefault!7919 () ValueCell!1940)

(assert (=> b!196406 (= condMapEmpty!7919 (= (arr!3942 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1940)) mapDefault!7919)))))

(declare-fun mapNonEmpty!7919 () Bool)

(declare-fun tp!17207 () Bool)

(declare-fun e!129334 () Bool)

(assert (=> mapNonEmpty!7919 (= mapRes!7919 (and tp!17207 e!129334))))

(declare-fun mapRest!7919 () (Array (_ BitVec 32) ValueCell!1940))

(declare-fun mapKey!7919 () (_ BitVec 32))

(declare-fun mapValue!7919 () ValueCell!1940)

(assert (=> mapNonEmpty!7919 (= (arr!3942 _values!649) (store mapRest!7919 mapKey!7919 mapValue!7919))))

(declare-fun res!92696 () Bool)

(declare-fun e!129337 () Bool)

(assert (=> start!20056 (=> (not res!92696) (not e!129337))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20056 (= res!92696 (validMask!0 mask!1149))))

(assert (=> start!20056 e!129337))

(assert (=> start!20056 true))

(declare-fun array_inv!2557 (array!8383) Bool)

(assert (=> start!20056 (and (array_inv!2557 _values!649) e!129336)))

(declare-datatypes ((array!8385 0))(
  ( (array!8386 (arr!3943 (Array (_ BitVec 32) (_ BitVec 64))) (size!4268 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8385)

(declare-fun array_inv!2558 (array!8385) Bool)

(assert (=> start!20056 (array_inv!2558 _keys!825)))

(declare-fun b!196407 () Bool)

(assert (=> b!196407 (= e!129337 false)))

(declare-fun lt!97664 () Bool)

(declare-datatypes ((List!2426 0))(
  ( (Nil!2423) (Cons!2422 (h!3064 (_ BitVec 64)) (t!7349 List!2426)) )
))
(declare-fun arrayNoDuplicates!0 (array!8385 (_ BitVec 32) List!2426) Bool)

(assert (=> b!196407 (= lt!97664 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2423))))

(declare-fun b!196408 () Bool)

(declare-fun res!92698 () Bool)

(assert (=> b!196408 (=> (not res!92698) (not e!129337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8385 (_ BitVec 32)) Bool)

(assert (=> b!196408 (= res!92698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196409 () Bool)

(declare-fun tp_is_empty!4567 () Bool)

(assert (=> b!196409 (= e!129335 tp_is_empty!4567)))

(declare-fun b!196410 () Bool)

(assert (=> b!196410 (= e!129334 tp_is_empty!4567)))

(declare-fun b!196411 () Bool)

(declare-fun res!92697 () Bool)

(assert (=> b!196411 (=> (not res!92697) (not e!129337))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196411 (= res!92697 (and (= (size!4267 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4268 _keys!825) (size!4267 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7919 () Bool)

(assert (=> mapIsEmpty!7919 mapRes!7919))

(assert (= (and start!20056 res!92696) b!196411))

(assert (= (and b!196411 res!92697) b!196408))

(assert (= (and b!196408 res!92698) b!196407))

(assert (= (and b!196406 condMapEmpty!7919) mapIsEmpty!7919))

(assert (= (and b!196406 (not condMapEmpty!7919)) mapNonEmpty!7919))

(get-info :version)

(assert (= (and mapNonEmpty!7919 ((_ is ValueCellFull!1940) mapValue!7919)) b!196410))

(assert (= (and b!196406 ((_ is ValueCellFull!1940) mapDefault!7919)) b!196409))

(assert (= start!20056 b!196406))

(declare-fun m!223845 () Bool)

(assert (=> mapNonEmpty!7919 m!223845))

(declare-fun m!223847 () Bool)

(assert (=> start!20056 m!223847))

(declare-fun m!223849 () Bool)

(assert (=> start!20056 m!223849))

(declare-fun m!223851 () Bool)

(assert (=> start!20056 m!223851))

(declare-fun m!223853 () Bool)

(assert (=> b!196407 m!223853))

(declare-fun m!223855 () Bool)

(assert (=> b!196408 m!223855))

(check-sat (not start!20056) tp_is_empty!4567 (not b!196407) (not b!196408) (not mapNonEmpty!7919))
(check-sat)
