; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40282 () Bool)

(assert start!40282)

(declare-fun b!442220 () Bool)

(declare-fun e!260247 () Bool)

(declare-fun e!260249 () Bool)

(declare-fun mapRes!19167 () Bool)

(assert (=> b!442220 (= e!260247 (and e!260249 mapRes!19167))))

(declare-fun condMapEmpty!19167 () Bool)

(declare-datatypes ((V!16699 0))(
  ( (V!16700 (val!5892 Int)) )
))
(declare-datatypes ((ValueCell!5504 0))(
  ( (ValueCellFull!5504 (v!8137 V!16699)) (EmptyCell!5504) )
))
(declare-datatypes ((array!27203 0))(
  ( (array!27204 (arr!13050 (Array (_ BitVec 32) ValueCell!5504)) (size!13403 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27203)

(declare-fun mapDefault!19167 () ValueCell!5504)

(assert (=> b!442220 (= condMapEmpty!19167 (= (arr!13050 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5504)) mapDefault!19167)))))

(declare-fun b!442221 () Bool)

(declare-fun res!261956 () Bool)

(declare-fun e!260248 () Bool)

(assert (=> b!442221 (=> (not res!261956) (not e!260248))))

(declare-datatypes ((array!27205 0))(
  ( (array!27206 (arr!13051 (Array (_ BitVec 32) (_ BitVec 64))) (size!13404 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27205)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442221 (= res!261956 (and (= (size!13403 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13404 _keys!709) (size!13403 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442222 () Bool)

(declare-fun res!261959 () Bool)

(assert (=> b!442222 (=> (not res!261959) (not e!260248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442222 (= res!261959 (validMask!0 mask!1025))))

(declare-fun b!442223 () Bool)

(assert (=> b!442223 (= e!260248 false)))

(declare-fun lt!202973 () Bool)

(declare-datatypes ((List!7837 0))(
  ( (Nil!7834) (Cons!7833 (h!8689 (_ BitVec 64)) (t!13586 List!7837)) )
))
(declare-fun arrayNoDuplicates!0 (array!27205 (_ BitVec 32) List!7837) Bool)

(assert (=> b!442223 (= lt!202973 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7834))))

(declare-fun b!442224 () Bool)

(declare-fun e!260251 () Bool)

(declare-fun tp_is_empty!11695 () Bool)

(assert (=> b!442224 (= e!260251 tp_is_empty!11695)))

(declare-fun mapNonEmpty!19167 () Bool)

(declare-fun tp!37149 () Bool)

(assert (=> mapNonEmpty!19167 (= mapRes!19167 (and tp!37149 e!260251))))

(declare-fun mapKey!19167 () (_ BitVec 32))

(declare-fun mapRest!19167 () (Array (_ BitVec 32) ValueCell!5504))

(declare-fun mapValue!19167 () ValueCell!5504)

(assert (=> mapNonEmpty!19167 (= (arr!13050 _values!549) (store mapRest!19167 mapKey!19167 mapValue!19167))))

(declare-fun b!442225 () Bool)

(declare-fun res!261957 () Bool)

(assert (=> b!442225 (=> (not res!261957) (not e!260248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27205 (_ BitVec 32)) Bool)

(assert (=> b!442225 (= res!261957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!261958 () Bool)

(assert (=> start!40282 (=> (not res!261958) (not e!260248))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40282 (= res!261958 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13404 _keys!709))))))

(assert (=> start!40282 e!260248))

(assert (=> start!40282 true))

(declare-fun array_inv!9518 (array!27203) Bool)

(assert (=> start!40282 (and (array_inv!9518 _values!549) e!260247)))

(declare-fun array_inv!9519 (array!27205) Bool)

(assert (=> start!40282 (array_inv!9519 _keys!709)))

(declare-fun mapIsEmpty!19167 () Bool)

(assert (=> mapIsEmpty!19167 mapRes!19167))

(declare-fun b!442226 () Bool)

(assert (=> b!442226 (= e!260249 tp_is_empty!11695)))

(assert (= (and start!40282 res!261958) b!442222))

(assert (= (and b!442222 res!261959) b!442221))

(assert (= (and b!442221 res!261956) b!442225))

(assert (= (and b!442225 res!261957) b!442223))

(assert (= (and b!442220 condMapEmpty!19167) mapIsEmpty!19167))

(assert (= (and b!442220 (not condMapEmpty!19167)) mapNonEmpty!19167))

(get-info :version)

(assert (= (and mapNonEmpty!19167 ((_ is ValueCellFull!5504) mapValue!19167)) b!442224))

(assert (= (and b!442220 ((_ is ValueCellFull!5504) mapDefault!19167)) b!442226))

(assert (= start!40282 b!442220))

(declare-fun m!428407 () Bool)

(assert (=> b!442222 m!428407))

(declare-fun m!428409 () Bool)

(assert (=> b!442223 m!428409))

(declare-fun m!428411 () Bool)

(assert (=> start!40282 m!428411))

(declare-fun m!428413 () Bool)

(assert (=> start!40282 m!428413))

(declare-fun m!428415 () Bool)

(assert (=> b!442225 m!428415))

(declare-fun m!428417 () Bool)

(assert (=> mapNonEmpty!19167 m!428417))

(check-sat (not b!442222) (not b!442225) (not b!442223) tp_is_empty!11695 (not mapNonEmpty!19167) (not start!40282))
(check-sat)
