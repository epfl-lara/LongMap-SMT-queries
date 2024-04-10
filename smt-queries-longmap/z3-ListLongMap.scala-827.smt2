; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20060 () Bool)

(assert start!20060)

(declare-fun b!196431 () Bool)

(declare-fun res!92713 () Bool)

(declare-fun e!129371 () Bool)

(assert (=> b!196431 (=> (not res!92713) (not e!129371))))

(declare-datatypes ((array!8407 0))(
  ( (array!8408 (arr!3954 (Array (_ BitVec 32) (_ BitVec 64))) (size!4279 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8407)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5747 0))(
  ( (V!5748 (val!2332 Int)) )
))
(declare-datatypes ((ValueCell!1944 0))(
  ( (ValueCellFull!1944 (v!4302 V!5747)) (EmptyCell!1944) )
))
(declare-datatypes ((array!8409 0))(
  ( (array!8410 (arr!3955 (Array (_ BitVec 32) ValueCell!1944)) (size!4280 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8409)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196431 (= res!92713 (and (= (size!4280 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4279 _keys!825) (size!4280 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7931 () Bool)

(declare-fun mapRes!7931 () Bool)

(declare-fun tp!17219 () Bool)

(declare-fun e!129374 () Bool)

(assert (=> mapNonEmpty!7931 (= mapRes!7931 (and tp!17219 e!129374))))

(declare-fun mapValue!7931 () ValueCell!1944)

(declare-fun mapKey!7931 () (_ BitVec 32))

(declare-fun mapRest!7931 () (Array (_ BitVec 32) ValueCell!1944))

(assert (=> mapNonEmpty!7931 (= (arr!3955 _values!649) (store mapRest!7931 mapKey!7931 mapValue!7931))))

(declare-fun res!92712 () Bool)

(assert (=> start!20060 (=> (not res!92712) (not e!129371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20060 (= res!92712 (validMask!0 mask!1149))))

(assert (=> start!20060 e!129371))

(assert (=> start!20060 true))

(declare-fun e!129370 () Bool)

(declare-fun array_inv!2573 (array!8409) Bool)

(assert (=> start!20060 (and (array_inv!2573 _values!649) e!129370)))

(declare-fun array_inv!2574 (array!8407) Bool)

(assert (=> start!20060 (array_inv!2574 _keys!825)))

(declare-fun b!196432 () Bool)

(declare-fun res!92711 () Bool)

(assert (=> b!196432 (=> (not res!92711) (not e!129371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8407 (_ BitVec 32)) Bool)

(assert (=> b!196432 (= res!92711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196433 () Bool)

(declare-fun tp_is_empty!4575 () Bool)

(assert (=> b!196433 (= e!129374 tp_is_empty!4575)))

(declare-fun b!196434 () Bool)

(assert (=> b!196434 (= e!129371 false)))

(declare-fun lt!97617 () Bool)

(declare-datatypes ((List!2472 0))(
  ( (Nil!2469) (Cons!2468 (h!3110 (_ BitVec 64)) (t!7403 List!2472)) )
))
(declare-fun arrayNoDuplicates!0 (array!8407 (_ BitVec 32) List!2472) Bool)

(assert (=> b!196434 (= lt!97617 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2469))))

(declare-fun mapIsEmpty!7931 () Bool)

(assert (=> mapIsEmpty!7931 mapRes!7931))

(declare-fun b!196435 () Bool)

(declare-fun e!129373 () Bool)

(assert (=> b!196435 (= e!129370 (and e!129373 mapRes!7931))))

(declare-fun condMapEmpty!7931 () Bool)

(declare-fun mapDefault!7931 () ValueCell!1944)

(assert (=> b!196435 (= condMapEmpty!7931 (= (arr!3955 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1944)) mapDefault!7931)))))

(declare-fun b!196436 () Bool)

(assert (=> b!196436 (= e!129373 tp_is_empty!4575)))

(assert (= (and start!20060 res!92712) b!196431))

(assert (= (and b!196431 res!92713) b!196432))

(assert (= (and b!196432 res!92711) b!196434))

(assert (= (and b!196435 condMapEmpty!7931) mapIsEmpty!7931))

(assert (= (and b!196435 (not condMapEmpty!7931)) mapNonEmpty!7931))

(get-info :version)

(assert (= (and mapNonEmpty!7931 ((_ is ValueCellFull!1944) mapValue!7931)) b!196433))

(assert (= (and b!196435 ((_ is ValueCellFull!1944) mapDefault!7931)) b!196436))

(assert (= start!20060 b!196435))

(declare-fun m!223711 () Bool)

(assert (=> mapNonEmpty!7931 m!223711))

(declare-fun m!223713 () Bool)

(assert (=> start!20060 m!223713))

(declare-fun m!223715 () Bool)

(assert (=> start!20060 m!223715))

(declare-fun m!223717 () Bool)

(assert (=> start!20060 m!223717))

(declare-fun m!223719 () Bool)

(assert (=> b!196432 m!223719))

(declare-fun m!223721 () Bool)

(assert (=> b!196434 m!223721))

(check-sat (not b!196434) (not mapNonEmpty!7931) (not b!196432) tp_is_empty!4575 (not start!20060))
(check-sat)
