; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40310 () Bool)

(assert start!40310)

(declare-fun b!442638 () Bool)

(declare-fun e!260528 () Bool)

(assert (=> b!442638 (= e!260528 false)))

(declare-fun lt!203228 () Bool)

(declare-datatypes ((array!27229 0))(
  ( (array!27230 (arr!13063 (Array (_ BitVec 32) (_ BitVec 64))) (size!13415 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27229)

(declare-datatypes ((List!7841 0))(
  ( (Nil!7838) (Cons!7837 (h!8693 (_ BitVec 64)) (t!13599 List!7841)) )
))
(declare-fun arrayNoDuplicates!0 (array!27229 (_ BitVec 32) List!7841) Bool)

(assert (=> b!442638 (= lt!203228 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7838))))

(declare-fun b!442639 () Bool)

(declare-fun e!260529 () Bool)

(declare-fun tp_is_empty!11709 () Bool)

(assert (=> b!442639 (= e!260529 tp_is_empty!11709)))

(declare-fun b!442640 () Bool)

(declare-fun e!260526 () Bool)

(declare-fun mapRes!19188 () Bool)

(assert (=> b!442640 (= e!260526 (and e!260529 mapRes!19188))))

(declare-fun condMapEmpty!19188 () Bool)

(declare-datatypes ((V!16717 0))(
  ( (V!16718 (val!5899 Int)) )
))
(declare-datatypes ((ValueCell!5511 0))(
  ( (ValueCellFull!5511 (v!8150 V!16717)) (EmptyCell!5511) )
))
(declare-datatypes ((array!27231 0))(
  ( (array!27232 (arr!13064 (Array (_ BitVec 32) ValueCell!5511)) (size!13416 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27231)

(declare-fun mapDefault!19188 () ValueCell!5511)

(assert (=> b!442640 (= condMapEmpty!19188 (= (arr!13064 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5511)) mapDefault!19188)))))

(declare-fun b!442641 () Bool)

(declare-fun e!260527 () Bool)

(assert (=> b!442641 (= e!260527 tp_is_empty!11709)))

(declare-fun b!442642 () Bool)

(declare-fun res!262171 () Bool)

(assert (=> b!442642 (=> (not res!262171) (not e!260528))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442642 (= res!262171 (and (= (size!13416 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13415 _keys!709) (size!13416 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19188 () Bool)

(assert (=> mapIsEmpty!19188 mapRes!19188))

(declare-fun mapNonEmpty!19188 () Bool)

(declare-fun tp!37170 () Bool)

(assert (=> mapNonEmpty!19188 (= mapRes!19188 (and tp!37170 e!260527))))

(declare-fun mapValue!19188 () ValueCell!5511)

(declare-fun mapRest!19188 () (Array (_ BitVec 32) ValueCell!5511))

(declare-fun mapKey!19188 () (_ BitVec 32))

(assert (=> mapNonEmpty!19188 (= (arr!13064 _values!549) (store mapRest!19188 mapKey!19188 mapValue!19188))))

(declare-fun res!262169 () Bool)

(assert (=> start!40310 (=> (not res!262169) (not e!260528))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40310 (= res!262169 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13415 _keys!709))))))

(assert (=> start!40310 e!260528))

(assert (=> start!40310 true))

(declare-fun array_inv!9478 (array!27231) Bool)

(assert (=> start!40310 (and (array_inv!9478 _values!549) e!260526)))

(declare-fun array_inv!9479 (array!27229) Bool)

(assert (=> start!40310 (array_inv!9479 _keys!709)))

(declare-fun b!442643 () Bool)

(declare-fun res!262172 () Bool)

(assert (=> b!442643 (=> (not res!262172) (not e!260528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27229 (_ BitVec 32)) Bool)

(assert (=> b!442643 (= res!262172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442644 () Bool)

(declare-fun res!262170 () Bool)

(assert (=> b!442644 (=> (not res!262170) (not e!260528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442644 (= res!262170 (validMask!0 mask!1025))))

(assert (= (and start!40310 res!262169) b!442644))

(assert (= (and b!442644 res!262170) b!442642))

(assert (= (and b!442642 res!262171) b!442643))

(assert (= (and b!442643 res!262172) b!442638))

(assert (= (and b!442640 condMapEmpty!19188) mapIsEmpty!19188))

(assert (= (and b!442640 (not condMapEmpty!19188)) mapNonEmpty!19188))

(get-info :version)

(assert (= (and mapNonEmpty!19188 ((_ is ValueCellFull!5511) mapValue!19188)) b!442641))

(assert (= (and b!442640 ((_ is ValueCellFull!5511) mapDefault!19188)) b!442639))

(assert (= start!40310 b!442640))

(declare-fun m!429223 () Bool)

(assert (=> mapNonEmpty!19188 m!429223))

(declare-fun m!429225 () Bool)

(assert (=> b!442643 m!429225))

(declare-fun m!429227 () Bool)

(assert (=> start!40310 m!429227))

(declare-fun m!429229 () Bool)

(assert (=> start!40310 m!429229))

(declare-fun m!429231 () Bool)

(assert (=> b!442644 m!429231))

(declare-fun m!429233 () Bool)

(assert (=> b!442638 m!429233))

(check-sat (not b!442644) (not start!40310) (not mapNonEmpty!19188) tp_is_empty!11709 (not b!442643) (not b!442638))
(check-sat)
