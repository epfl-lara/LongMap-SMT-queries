; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20056 () Bool)

(assert start!20056)

(declare-fun mapNonEmpty!7919 () Bool)

(declare-fun mapRes!7919 () Bool)

(declare-fun tp!17207 () Bool)

(declare-fun e!129211 () Bool)

(assert (=> mapNonEmpty!7919 (= mapRes!7919 (and tp!17207 e!129211))))

(declare-datatypes ((V!5737 0))(
  ( (V!5738 (val!2328 Int)) )
))
(declare-datatypes ((ValueCell!1940 0))(
  ( (ValueCellFull!1940 (v!4292 V!5737)) (EmptyCell!1940) )
))
(declare-fun mapValue!7919 () ValueCell!1940)

(declare-datatypes ((array!8369 0))(
  ( (array!8370 (arr!3934 (Array (_ BitVec 32) ValueCell!1940)) (size!4260 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8369)

(declare-fun mapKey!7919 () (_ BitVec 32))

(declare-fun mapRest!7919 () (Array (_ BitVec 32) ValueCell!1940))

(assert (=> mapNonEmpty!7919 (= (arr!3934 _values!649) (store mapRest!7919 mapKey!7919 mapValue!7919))))

(declare-fun res!92582 () Bool)

(declare-fun e!129209 () Bool)

(assert (=> start!20056 (=> (not res!92582) (not e!129209))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20056 (= res!92582 (validMask!0 mask!1149))))

(assert (=> start!20056 e!129209))

(assert (=> start!20056 true))

(declare-fun e!129212 () Bool)

(declare-fun array_inv!2551 (array!8369) Bool)

(assert (=> start!20056 (and (array_inv!2551 _values!649) e!129212)))

(declare-datatypes ((array!8371 0))(
  ( (array!8372 (arr!3935 (Array (_ BitVec 32) (_ BitVec 64))) (size!4261 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8371)

(declare-fun array_inv!2552 (array!8371) Bool)

(assert (=> start!20056 (array_inv!2552 _keys!825)))

(declare-fun b!196212 () Bool)

(declare-fun res!92580 () Bool)

(assert (=> b!196212 (=> (not res!92580) (not e!129209))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196212 (= res!92580 (and (= (size!4260 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4261 _keys!825) (size!4260 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196213 () Bool)

(declare-fun res!92581 () Bool)

(assert (=> b!196213 (=> (not res!92581) (not e!129209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8371 (_ BitVec 32)) Bool)

(assert (=> b!196213 (= res!92581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196214 () Bool)

(declare-fun e!129210 () Bool)

(assert (=> b!196214 (= e!129212 (and e!129210 mapRes!7919))))

(declare-fun condMapEmpty!7919 () Bool)

(declare-fun mapDefault!7919 () ValueCell!1940)

(assert (=> b!196214 (= condMapEmpty!7919 (= (arr!3934 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1940)) mapDefault!7919)))))

(declare-fun b!196215 () Bool)

(declare-fun tp_is_empty!4567 () Bool)

(assert (=> b!196215 (= e!129210 tp_is_empty!4567)))

(declare-fun b!196216 () Bool)

(assert (=> b!196216 (= e!129209 false)))

(declare-fun lt!97424 () Bool)

(declare-datatypes ((List!2447 0))(
  ( (Nil!2444) (Cons!2443 (h!3085 (_ BitVec 64)) (t!7369 List!2447)) )
))
(declare-fun arrayNoDuplicates!0 (array!8371 (_ BitVec 32) List!2447) Bool)

(assert (=> b!196216 (= lt!97424 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2444))))

(declare-fun mapIsEmpty!7919 () Bool)

(assert (=> mapIsEmpty!7919 mapRes!7919))

(declare-fun b!196217 () Bool)

(assert (=> b!196217 (= e!129211 tp_is_empty!4567)))

(assert (= (and start!20056 res!92582) b!196212))

(assert (= (and b!196212 res!92580) b!196213))

(assert (= (and b!196213 res!92581) b!196216))

(assert (= (and b!196214 condMapEmpty!7919) mapIsEmpty!7919))

(assert (= (and b!196214 (not condMapEmpty!7919)) mapNonEmpty!7919))

(get-info :version)

(assert (= (and mapNonEmpty!7919 ((_ is ValueCellFull!1940) mapValue!7919)) b!196217))

(assert (= (and b!196214 ((_ is ValueCellFull!1940) mapDefault!7919)) b!196215))

(assert (= start!20056 b!196214))

(declare-fun m!223047 () Bool)

(assert (=> mapNonEmpty!7919 m!223047))

(declare-fun m!223049 () Bool)

(assert (=> start!20056 m!223049))

(declare-fun m!223051 () Bool)

(assert (=> start!20056 m!223051))

(declare-fun m!223053 () Bool)

(assert (=> start!20056 m!223053))

(declare-fun m!223055 () Bool)

(assert (=> b!196213 m!223055))

(declare-fun m!223057 () Bool)

(assert (=> b!196216 m!223057))

(check-sat (not start!20056) (not b!196213) (not b!196216) tp_is_empty!4567 (not mapNonEmpty!7919))
(check-sat)
