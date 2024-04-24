; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40392 () Bool)

(assert start!40392)

(declare-fun b!444214 () Bool)

(declare-fun e!261263 () Bool)

(assert (=> b!444214 (= e!261263 false)))

(declare-fun lt!203483 () Bool)

(declare-datatypes ((array!27396 0))(
  ( (array!27397 (arr!13145 (Array (_ BitVec 32) (_ BitVec 64))) (size!13497 (_ BitVec 32))) )
))
(declare-fun lt!203484 () array!27396)

(declare-datatypes ((List!7780 0))(
  ( (Nil!7777) (Cons!7776 (h!8632 (_ BitVec 64)) (t!13530 List!7780)) )
))
(declare-fun arrayNoDuplicates!0 (array!27396 (_ BitVec 32) List!7780) Bool)

(assert (=> b!444214 (= lt!203483 (arrayNoDuplicates!0 lt!203484 #b00000000000000000000000000000000 Nil!7777))))

(declare-fun b!444215 () Bool)

(declare-fun res!263407 () Bool)

(declare-fun e!261259 () Bool)

(assert (=> b!444215 (=> (not res!263407) (not e!261259))))

(declare-fun _keys!709 () array!27396)

(assert (=> b!444215 (= res!263407 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7777))))

(declare-fun res!263405 () Bool)

(assert (=> start!40392 (=> (not res!263405) (not e!261259))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40392 (= res!263405 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13497 _keys!709))))))

(assert (=> start!40392 e!261259))

(assert (=> start!40392 true))

(declare-datatypes ((V!16827 0))(
  ( (V!16828 (val!5940 Int)) )
))
(declare-datatypes ((ValueCell!5552 0))(
  ( (ValueCellFull!5552 (v!8192 V!16827)) (EmptyCell!5552) )
))
(declare-datatypes ((array!27398 0))(
  ( (array!27399 (arr!13146 (Array (_ BitVec 32) ValueCell!5552)) (size!13498 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27398)

(declare-fun e!261261 () Bool)

(declare-fun array_inv!9606 (array!27398) Bool)

(assert (=> start!40392 (and (array_inv!9606 _values!549) e!261261)))

(declare-fun array_inv!9607 (array!27396) Bool)

(assert (=> start!40392 (array_inv!9607 _keys!709)))

(declare-fun b!444216 () Bool)

(assert (=> b!444216 (= e!261259 e!261263)))

(declare-fun res!263399 () Bool)

(assert (=> b!444216 (=> (not res!263399) (not e!261263))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27396 (_ BitVec 32)) Bool)

(assert (=> b!444216 (= res!263399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203484 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444216 (= lt!203484 (array!27397 (store (arr!13145 _keys!709) i!563 k0!794) (size!13497 _keys!709)))))

(declare-fun b!444217 () Bool)

(declare-fun res!263402 () Bool)

(assert (=> b!444217 (=> (not res!263402) (not e!261259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444217 (= res!263402 (validKeyInArray!0 k0!794))))

(declare-fun b!444218 () Bool)

(declare-fun res!263406 () Bool)

(assert (=> b!444218 (=> (not res!263406) (not e!261259))))

(assert (=> b!444218 (= res!263406 (or (= (select (arr!13145 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13145 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444219 () Bool)

(declare-fun res!263403 () Bool)

(assert (=> b!444219 (=> (not res!263403) (not e!261259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444219 (= res!263403 (validMask!0 mask!1025))))

(declare-fun b!444220 () Bool)

(declare-fun e!261264 () Bool)

(declare-fun mapRes!19314 () Bool)

(assert (=> b!444220 (= e!261261 (and e!261264 mapRes!19314))))

(declare-fun condMapEmpty!19314 () Bool)

(declare-fun mapDefault!19314 () ValueCell!5552)

(assert (=> b!444220 (= condMapEmpty!19314 (= (arr!13146 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5552)) mapDefault!19314)))))

(declare-fun b!444221 () Bool)

(declare-fun tp_is_empty!11791 () Bool)

(assert (=> b!444221 (= e!261264 tp_is_empty!11791)))

(declare-fun b!444222 () Bool)

(declare-fun res!263398 () Bool)

(assert (=> b!444222 (=> (not res!263398) (not e!261259))))

(assert (=> b!444222 (= res!263398 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13497 _keys!709))))))

(declare-fun b!444223 () Bool)

(declare-fun res!263401 () Bool)

(assert (=> b!444223 (=> (not res!263401) (not e!261259))))

(assert (=> b!444223 (= res!263401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444224 () Bool)

(declare-fun res!263404 () Bool)

(assert (=> b!444224 (=> (not res!263404) (not e!261259))))

(declare-fun arrayContainsKey!0 (array!27396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444224 (= res!263404 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444225 () Bool)

(declare-fun e!261262 () Bool)

(assert (=> b!444225 (= e!261262 tp_is_empty!11791)))

(declare-fun mapNonEmpty!19314 () Bool)

(declare-fun tp!37296 () Bool)

(assert (=> mapNonEmpty!19314 (= mapRes!19314 (and tp!37296 e!261262))))

(declare-fun mapKey!19314 () (_ BitVec 32))

(declare-fun mapRest!19314 () (Array (_ BitVec 32) ValueCell!5552))

(declare-fun mapValue!19314 () ValueCell!5552)

(assert (=> mapNonEmpty!19314 (= (arr!13146 _values!549) (store mapRest!19314 mapKey!19314 mapValue!19314))))

(declare-fun b!444226 () Bool)

(declare-fun res!263400 () Bool)

(assert (=> b!444226 (=> (not res!263400) (not e!261259))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444226 (= res!263400 (and (= (size!13498 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13497 _keys!709) (size!13498 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19314 () Bool)

(assert (=> mapIsEmpty!19314 mapRes!19314))

(assert (= (and start!40392 res!263405) b!444219))

(assert (= (and b!444219 res!263403) b!444226))

(assert (= (and b!444226 res!263400) b!444223))

(assert (= (and b!444223 res!263401) b!444215))

(assert (= (and b!444215 res!263407) b!444222))

(assert (= (and b!444222 res!263398) b!444217))

(assert (= (and b!444217 res!263402) b!444218))

(assert (= (and b!444218 res!263406) b!444224))

(assert (= (and b!444224 res!263404) b!444216))

(assert (= (and b!444216 res!263399) b!444214))

(assert (= (and b!444220 condMapEmpty!19314) mapIsEmpty!19314))

(assert (= (and b!444220 (not condMapEmpty!19314)) mapNonEmpty!19314))

(get-info :version)

(assert (= (and mapNonEmpty!19314 ((_ is ValueCellFull!5552) mapValue!19314)) b!444225))

(assert (= (and b!444220 ((_ is ValueCellFull!5552) mapDefault!19314)) b!444221))

(assert (= start!40392 b!444220))

(declare-fun m!430431 () Bool)

(assert (=> b!444215 m!430431))

(declare-fun m!430433 () Bool)

(assert (=> mapNonEmpty!19314 m!430433))

(declare-fun m!430435 () Bool)

(assert (=> b!444224 m!430435))

(declare-fun m!430437 () Bool)

(assert (=> b!444223 m!430437))

(declare-fun m!430439 () Bool)

(assert (=> b!444217 m!430439))

(declare-fun m!430441 () Bool)

(assert (=> b!444218 m!430441))

(declare-fun m!430443 () Bool)

(assert (=> b!444219 m!430443))

(declare-fun m!430445 () Bool)

(assert (=> b!444214 m!430445))

(declare-fun m!430447 () Bool)

(assert (=> start!40392 m!430447))

(declare-fun m!430449 () Bool)

(assert (=> start!40392 m!430449))

(declare-fun m!430451 () Bool)

(assert (=> b!444216 m!430451))

(declare-fun m!430453 () Bool)

(assert (=> b!444216 m!430453))

(check-sat (not mapNonEmpty!19314) (not b!444223) (not b!444224) (not start!40392) (not b!444214) (not b!444219) tp_is_empty!11791 (not b!444216) (not b!444217) (not b!444215))
(check-sat)
