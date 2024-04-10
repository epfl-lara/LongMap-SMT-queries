; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40304 () Bool)

(assert start!40304)

(declare-fun b!442575 () Bool)

(declare-fun res!262134 () Bool)

(declare-fun e!260481 () Bool)

(assert (=> b!442575 (=> (not res!262134) (not e!260481))))

(declare-datatypes ((array!27219 0))(
  ( (array!27220 (arr!13058 (Array (_ BitVec 32) (_ BitVec 64))) (size!13410 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27219)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27219 (_ BitVec 32)) Bool)

(assert (=> b!442575 (= res!262134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19179 () Bool)

(declare-fun mapRes!19179 () Bool)

(declare-fun tp!37161 () Bool)

(declare-fun e!260484 () Bool)

(assert (=> mapNonEmpty!19179 (= mapRes!19179 (and tp!37161 e!260484))))

(declare-fun mapKey!19179 () (_ BitVec 32))

(declare-datatypes ((V!16709 0))(
  ( (V!16710 (val!5896 Int)) )
))
(declare-datatypes ((ValueCell!5508 0))(
  ( (ValueCellFull!5508 (v!8147 V!16709)) (EmptyCell!5508) )
))
(declare-fun mapRest!19179 () (Array (_ BitVec 32) ValueCell!5508))

(declare-datatypes ((array!27221 0))(
  ( (array!27222 (arr!13059 (Array (_ BitVec 32) ValueCell!5508)) (size!13411 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27221)

(declare-fun mapValue!19179 () ValueCell!5508)

(assert (=> mapNonEmpty!19179 (= (arr!13059 _values!549) (store mapRest!19179 mapKey!19179 mapValue!19179))))

(declare-fun mapIsEmpty!19179 () Bool)

(assert (=> mapIsEmpty!19179 mapRes!19179))

(declare-fun b!442576 () Bool)

(declare-fun e!260485 () Bool)

(declare-fun e!260483 () Bool)

(assert (=> b!442576 (= e!260485 (and e!260483 mapRes!19179))))

(declare-fun condMapEmpty!19179 () Bool)

(declare-fun mapDefault!19179 () ValueCell!5508)

(assert (=> b!442576 (= condMapEmpty!19179 (= (arr!13059 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5508)) mapDefault!19179)))))

(declare-fun b!442577 () Bool)

(declare-fun res!262136 () Bool)

(assert (=> b!442577 (=> (not res!262136) (not e!260481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442577 (= res!262136 (validMask!0 mask!1025))))

(declare-fun b!442578 () Bool)

(declare-fun tp_is_empty!11703 () Bool)

(assert (=> b!442578 (= e!260483 tp_is_empty!11703)))

(declare-fun b!442579 () Bool)

(assert (=> b!442579 (= e!260481 false)))

(declare-fun lt!203219 () Bool)

(declare-datatypes ((List!7840 0))(
  ( (Nil!7837) (Cons!7836 (h!8692 (_ BitVec 64)) (t!13598 List!7840)) )
))
(declare-fun arrayNoDuplicates!0 (array!27219 (_ BitVec 32) List!7840) Bool)

(assert (=> b!442579 (= lt!203219 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7837))))

(declare-fun res!262133 () Bool)

(assert (=> start!40304 (=> (not res!262133) (not e!260481))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40304 (= res!262133 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13410 _keys!709))))))

(assert (=> start!40304 e!260481))

(assert (=> start!40304 true))

(declare-fun array_inv!9474 (array!27221) Bool)

(assert (=> start!40304 (and (array_inv!9474 _values!549) e!260485)))

(declare-fun array_inv!9475 (array!27219) Bool)

(assert (=> start!40304 (array_inv!9475 _keys!709)))

(declare-fun b!442580 () Bool)

(declare-fun res!262135 () Bool)

(assert (=> b!442580 (=> (not res!262135) (not e!260481))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442580 (= res!262135 (and (= (size!13411 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13410 _keys!709) (size!13411 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442581 () Bool)

(assert (=> b!442581 (= e!260484 tp_is_empty!11703)))

(assert (= (and start!40304 res!262133) b!442577))

(assert (= (and b!442577 res!262136) b!442580))

(assert (= (and b!442580 res!262135) b!442575))

(assert (= (and b!442575 res!262134) b!442579))

(assert (= (and b!442576 condMapEmpty!19179) mapIsEmpty!19179))

(assert (= (and b!442576 (not condMapEmpty!19179)) mapNonEmpty!19179))

(get-info :version)

(assert (= (and mapNonEmpty!19179 ((_ is ValueCellFull!5508) mapValue!19179)) b!442581))

(assert (= (and b!442576 ((_ is ValueCellFull!5508) mapDefault!19179)) b!442578))

(assert (= start!40304 b!442576))

(declare-fun m!429187 () Bool)

(assert (=> b!442577 m!429187))

(declare-fun m!429189 () Bool)

(assert (=> start!40304 m!429189))

(declare-fun m!429191 () Bool)

(assert (=> start!40304 m!429191))

(declare-fun m!429193 () Bool)

(assert (=> b!442575 m!429193))

(declare-fun m!429195 () Bool)

(assert (=> mapNonEmpty!19179 m!429195))

(declare-fun m!429197 () Bool)

(assert (=> b!442579 m!429197))

(check-sat (not mapNonEmpty!19179) (not b!442575) tp_is_empty!11703 (not b!442579) (not b!442577) (not start!40304))
(check-sat)
