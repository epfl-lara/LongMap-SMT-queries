; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40282 () Bool)

(assert start!40282)

(declare-fun b!442442 () Bool)

(declare-fun res!262084 () Bool)

(declare-fun e!260390 () Bool)

(assert (=> b!442442 (=> (not res!262084) (not e!260390))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442442 (= res!262084 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19167 () Bool)

(declare-fun mapRes!19167 () Bool)

(declare-fun tp!37149 () Bool)

(declare-fun e!260389 () Bool)

(assert (=> mapNonEmpty!19167 (= mapRes!19167 (and tp!37149 e!260389))))

(declare-datatypes ((V!16699 0))(
  ( (V!16700 (val!5892 Int)) )
))
(declare-datatypes ((ValueCell!5504 0))(
  ( (ValueCellFull!5504 (v!8144 V!16699)) (EmptyCell!5504) )
))
(declare-fun mapRest!19167 () (Array (_ BitVec 32) ValueCell!5504))

(declare-fun mapValue!19167 () ValueCell!5504)

(declare-datatypes ((array!27208 0))(
  ( (array!27209 (arr!13052 (Array (_ BitVec 32) ValueCell!5504)) (size!13404 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27208)

(declare-fun mapKey!19167 () (_ BitVec 32))

(assert (=> mapNonEmpty!19167 (= (arr!13052 _values!549) (store mapRest!19167 mapKey!19167 mapValue!19167))))

(declare-fun mapIsEmpty!19167 () Bool)

(assert (=> mapIsEmpty!19167 mapRes!19167))

(declare-fun b!442443 () Bool)

(declare-fun e!260391 () Bool)

(declare-fun tp_is_empty!11695 () Bool)

(assert (=> b!442443 (= e!260391 tp_is_empty!11695)))

(declare-fun b!442444 () Bool)

(declare-fun res!262085 () Bool)

(assert (=> b!442444 (=> (not res!262085) (not e!260390))))

(declare-datatypes ((array!27210 0))(
  ( (array!27211 (arr!13053 (Array (_ BitVec 32) (_ BitVec 64))) (size!13405 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27210)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442444 (= res!262085 (and (= (size!13404 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13405 _keys!709) (size!13404 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442445 () Bool)

(declare-fun e!260392 () Bool)

(assert (=> b!442445 (= e!260392 (and e!260391 mapRes!19167))))

(declare-fun condMapEmpty!19167 () Bool)

(declare-fun mapDefault!19167 () ValueCell!5504)

(assert (=> b!442445 (= condMapEmpty!19167 (= (arr!13052 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5504)) mapDefault!19167)))))

(declare-fun b!442446 () Bool)

(assert (=> b!442446 (= e!260389 tp_is_empty!11695)))

(declare-fun res!262083 () Bool)

(assert (=> start!40282 (=> (not res!262083) (not e!260390))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40282 (= res!262083 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13405 _keys!709))))))

(assert (=> start!40282 e!260390))

(assert (=> start!40282 true))

(declare-fun array_inv!9536 (array!27208) Bool)

(assert (=> start!40282 (and (array_inv!9536 _values!549) e!260392)))

(declare-fun array_inv!9537 (array!27210) Bool)

(assert (=> start!40282 (array_inv!9537 _keys!709)))

(declare-fun b!442447 () Bool)

(assert (=> b!442447 (= e!260390 false)))

(declare-fun lt!203226 () Bool)

(declare-datatypes ((List!7738 0))(
  ( (Nil!7735) (Cons!7734 (h!8590 (_ BitVec 64)) (t!13488 List!7738)) )
))
(declare-fun arrayNoDuplicates!0 (array!27210 (_ BitVec 32) List!7738) Bool)

(assert (=> b!442447 (= lt!203226 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7735))))

(declare-fun b!442448 () Bool)

(declare-fun res!262082 () Bool)

(assert (=> b!442448 (=> (not res!262082) (not e!260390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27210 (_ BitVec 32)) Bool)

(assert (=> b!442448 (= res!262082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40282 res!262083) b!442442))

(assert (= (and b!442442 res!262084) b!442444))

(assert (= (and b!442444 res!262085) b!442448))

(assert (= (and b!442448 res!262082) b!442447))

(assert (= (and b!442445 condMapEmpty!19167) mapIsEmpty!19167))

(assert (= (and b!442445 (not condMapEmpty!19167)) mapNonEmpty!19167))

(get-info :version)

(assert (= (and mapNonEmpty!19167 ((_ is ValueCellFull!5504) mapValue!19167)) b!442446))

(assert (= (and b!442445 ((_ is ValueCellFull!5504) mapDefault!19167)) b!442443))

(assert (= start!40282 b!442445))

(declare-fun m!429357 () Bool)

(assert (=> b!442447 m!429357))

(declare-fun m!429359 () Bool)

(assert (=> mapNonEmpty!19167 m!429359))

(declare-fun m!429361 () Bool)

(assert (=> start!40282 m!429361))

(declare-fun m!429363 () Bool)

(assert (=> start!40282 m!429363))

(declare-fun m!429365 () Bool)

(assert (=> b!442442 m!429365))

(declare-fun m!429367 () Bool)

(assert (=> b!442448 m!429367))

(check-sat (not b!442448) (not b!442442) tp_is_empty!11695 (not start!40282) (not mapNonEmpty!19167) (not b!442447))
(check-sat)
