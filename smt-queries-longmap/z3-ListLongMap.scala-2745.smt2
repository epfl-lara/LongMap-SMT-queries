; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40294 () Bool)

(assert start!40294)

(declare-fun b!442346 () Bool)

(declare-fun res!262029 () Bool)

(declare-fun e!260339 () Bool)

(assert (=> b!442346 (=> (not res!262029) (not e!260339))))

(declare-datatypes ((array!27225 0))(
  ( (array!27226 (arr!13061 (Array (_ BitVec 32) (_ BitVec 64))) (size!13414 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27225)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16715 0))(
  ( (V!16716 (val!5898 Int)) )
))
(declare-datatypes ((ValueCell!5510 0))(
  ( (ValueCellFull!5510 (v!8143 V!16715)) (EmptyCell!5510) )
))
(declare-datatypes ((array!27227 0))(
  ( (array!27228 (arr!13062 (Array (_ BitVec 32) ValueCell!5510)) (size!13415 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27227)

(assert (=> b!442346 (= res!262029 (and (= (size!13415 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13414 _keys!709) (size!13415 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442347 () Bool)

(declare-fun e!260338 () Bool)

(declare-fun e!260340 () Bool)

(declare-fun mapRes!19185 () Bool)

(assert (=> b!442347 (= e!260338 (and e!260340 mapRes!19185))))

(declare-fun condMapEmpty!19185 () Bool)

(declare-fun mapDefault!19185 () ValueCell!5510)

(assert (=> b!442347 (= condMapEmpty!19185 (= (arr!13062 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5510)) mapDefault!19185)))))

(declare-fun mapIsEmpty!19185 () Bool)

(assert (=> mapIsEmpty!19185 mapRes!19185))

(declare-fun res!262031 () Bool)

(assert (=> start!40294 (=> (not res!262031) (not e!260339))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40294 (= res!262031 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13414 _keys!709))))))

(assert (=> start!40294 e!260339))

(assert (=> start!40294 true))

(declare-fun array_inv!9524 (array!27227) Bool)

(assert (=> start!40294 (and (array_inv!9524 _values!549) e!260338)))

(declare-fun array_inv!9525 (array!27225) Bool)

(assert (=> start!40294 (array_inv!9525 _keys!709)))

(declare-fun b!442348 () Bool)

(assert (=> b!442348 (= e!260339 false)))

(declare-fun lt!202991 () Bool)

(declare-datatypes ((List!7841 0))(
  ( (Nil!7838) (Cons!7837 (h!8693 (_ BitVec 64)) (t!13590 List!7841)) )
))
(declare-fun arrayNoDuplicates!0 (array!27225 (_ BitVec 32) List!7841) Bool)

(assert (=> b!442348 (= lt!202991 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7838))))

(declare-fun b!442349 () Bool)

(declare-fun tp_is_empty!11707 () Bool)

(assert (=> b!442349 (= e!260340 tp_is_empty!11707)))

(declare-fun b!442350 () Bool)

(declare-fun res!262028 () Bool)

(assert (=> b!442350 (=> (not res!262028) (not e!260339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442350 (= res!262028 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19185 () Bool)

(declare-fun tp!37167 () Bool)

(declare-fun e!260341 () Bool)

(assert (=> mapNonEmpty!19185 (= mapRes!19185 (and tp!37167 e!260341))))

(declare-fun mapKey!19185 () (_ BitVec 32))

(declare-fun mapValue!19185 () ValueCell!5510)

(declare-fun mapRest!19185 () (Array (_ BitVec 32) ValueCell!5510))

(assert (=> mapNonEmpty!19185 (= (arr!13062 _values!549) (store mapRest!19185 mapKey!19185 mapValue!19185))))

(declare-fun b!442351 () Bool)

(declare-fun res!262030 () Bool)

(assert (=> b!442351 (=> (not res!262030) (not e!260339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27225 (_ BitVec 32)) Bool)

(assert (=> b!442351 (= res!262030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442352 () Bool)

(assert (=> b!442352 (= e!260341 tp_is_empty!11707)))

(assert (= (and start!40294 res!262031) b!442350))

(assert (= (and b!442350 res!262028) b!442346))

(assert (= (and b!442346 res!262029) b!442351))

(assert (= (and b!442351 res!262030) b!442348))

(assert (= (and b!442347 condMapEmpty!19185) mapIsEmpty!19185))

(assert (= (and b!442347 (not condMapEmpty!19185)) mapNonEmpty!19185))

(get-info :version)

(assert (= (and mapNonEmpty!19185 ((_ is ValueCellFull!5510) mapValue!19185)) b!442352))

(assert (= (and b!442347 ((_ is ValueCellFull!5510) mapDefault!19185)) b!442349))

(assert (= start!40294 b!442347))

(declare-fun m!428479 () Bool)

(assert (=> b!442348 m!428479))

(declare-fun m!428481 () Bool)

(assert (=> b!442351 m!428481))

(declare-fun m!428483 () Bool)

(assert (=> b!442350 m!428483))

(declare-fun m!428485 () Bool)

(assert (=> mapNonEmpty!19185 m!428485))

(declare-fun m!428487 () Bool)

(assert (=> start!40294 m!428487))

(declare-fun m!428489 () Bool)

(assert (=> start!40294 m!428489))

(check-sat (not b!442351) (not mapNonEmpty!19185) (not b!442350) tp_is_empty!11707 (not b!442348) (not start!40294))
(check-sat)
