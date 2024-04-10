; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40298 () Bool)

(assert start!40298)

(declare-fun b!442512 () Bool)

(declare-fun e!260437 () Bool)

(assert (=> b!442512 (= e!260437 false)))

(declare-fun lt!203210 () Bool)

(declare-datatypes ((array!27207 0))(
  ( (array!27208 (arr!13052 (Array (_ BitVec 32) (_ BitVec 64))) (size!13404 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27207)

(declare-datatypes ((List!7838 0))(
  ( (Nil!7835) (Cons!7834 (h!8690 (_ BitVec 64)) (t!13596 List!7838)) )
))
(declare-fun arrayNoDuplicates!0 (array!27207 (_ BitVec 32) List!7838) Bool)

(assert (=> b!442512 (= lt!203210 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7835))))

(declare-fun b!442513 () Bool)

(declare-fun res!262100 () Bool)

(assert (=> b!442513 (=> (not res!262100) (not e!260437))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16701 0))(
  ( (V!16702 (val!5893 Int)) )
))
(declare-datatypes ((ValueCell!5505 0))(
  ( (ValueCellFull!5505 (v!8144 V!16701)) (EmptyCell!5505) )
))
(declare-datatypes ((array!27209 0))(
  ( (array!27210 (arr!13053 (Array (_ BitVec 32) ValueCell!5505)) (size!13405 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27209)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442513 (= res!262100 (and (= (size!13405 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13404 _keys!709) (size!13405 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442514 () Bool)

(declare-fun e!260436 () Bool)

(declare-fun tp_is_empty!11697 () Bool)

(assert (=> b!442514 (= e!260436 tp_is_empty!11697)))

(declare-fun mapNonEmpty!19170 () Bool)

(declare-fun mapRes!19170 () Bool)

(declare-fun tp!37152 () Bool)

(assert (=> mapNonEmpty!19170 (= mapRes!19170 (and tp!37152 e!260436))))

(declare-fun mapRest!19170 () (Array (_ BitVec 32) ValueCell!5505))

(declare-fun mapValue!19170 () ValueCell!5505)

(declare-fun mapKey!19170 () (_ BitVec 32))

(assert (=> mapNonEmpty!19170 (= (arr!13053 _values!549) (store mapRest!19170 mapKey!19170 mapValue!19170))))

(declare-fun b!442516 () Bool)

(declare-fun e!260440 () Bool)

(declare-fun e!260439 () Bool)

(assert (=> b!442516 (= e!260440 (and e!260439 mapRes!19170))))

(declare-fun condMapEmpty!19170 () Bool)

(declare-fun mapDefault!19170 () ValueCell!5505)

(assert (=> b!442516 (= condMapEmpty!19170 (= (arr!13053 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5505)) mapDefault!19170)))))

(declare-fun mapIsEmpty!19170 () Bool)

(assert (=> mapIsEmpty!19170 mapRes!19170))

(declare-fun b!442517 () Bool)

(declare-fun res!262097 () Bool)

(assert (=> b!442517 (=> (not res!262097) (not e!260437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442517 (= res!262097 (validMask!0 mask!1025))))

(declare-fun b!442518 () Bool)

(assert (=> b!442518 (= e!260439 tp_is_empty!11697)))

(declare-fun b!442515 () Bool)

(declare-fun res!262099 () Bool)

(assert (=> b!442515 (=> (not res!262099) (not e!260437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27207 (_ BitVec 32)) Bool)

(assert (=> b!442515 (= res!262099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!262098 () Bool)

(assert (=> start!40298 (=> (not res!262098) (not e!260437))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40298 (= res!262098 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13404 _keys!709))))))

(assert (=> start!40298 e!260437))

(assert (=> start!40298 true))

(declare-fun array_inv!9470 (array!27209) Bool)

(assert (=> start!40298 (and (array_inv!9470 _values!549) e!260440)))

(declare-fun array_inv!9471 (array!27207) Bool)

(assert (=> start!40298 (array_inv!9471 _keys!709)))

(assert (= (and start!40298 res!262098) b!442517))

(assert (= (and b!442517 res!262097) b!442513))

(assert (= (and b!442513 res!262100) b!442515))

(assert (= (and b!442515 res!262099) b!442512))

(assert (= (and b!442516 condMapEmpty!19170) mapIsEmpty!19170))

(assert (= (and b!442516 (not condMapEmpty!19170)) mapNonEmpty!19170))

(get-info :version)

(assert (= (and mapNonEmpty!19170 ((_ is ValueCellFull!5505) mapValue!19170)) b!442514))

(assert (= (and b!442516 ((_ is ValueCellFull!5505) mapDefault!19170)) b!442518))

(assert (= start!40298 b!442516))

(declare-fun m!429151 () Bool)

(assert (=> b!442512 m!429151))

(declare-fun m!429153 () Bool)

(assert (=> b!442517 m!429153))

(declare-fun m!429155 () Bool)

(assert (=> mapNonEmpty!19170 m!429155))

(declare-fun m!429157 () Bool)

(assert (=> b!442515 m!429157))

(declare-fun m!429159 () Bool)

(assert (=> start!40298 m!429159))

(declare-fun m!429161 () Bool)

(assert (=> start!40298 m!429161))

(check-sat (not mapNonEmpty!19170) (not start!40298) tp_is_empty!11697 (not b!442515) (not b!442512) (not b!442517))
(check-sat)
