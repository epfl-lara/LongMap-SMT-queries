; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40318 () Bool)

(assert start!40318)

(declare-fun b!442763 () Bool)

(declare-fun res!262339 () Bool)

(declare-fun e!260542 () Bool)

(assert (=> b!442763 (=> (not res!262339) (not e!260542))))

(declare-datatypes ((array!27273 0))(
  ( (array!27274 (arr!13085 (Array (_ BitVec 32) (_ BitVec 64))) (size!13438 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27273)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442763 (= res!262339 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19221 () Bool)

(declare-fun mapRes!19221 () Bool)

(declare-fun tp!37203 () Bool)

(declare-fun e!260540 () Bool)

(assert (=> mapNonEmpty!19221 (= mapRes!19221 (and tp!37203 e!260540))))

(declare-datatypes ((V!16747 0))(
  ( (V!16748 (val!5910 Int)) )
))
(declare-datatypes ((ValueCell!5522 0))(
  ( (ValueCellFull!5522 (v!8155 V!16747)) (EmptyCell!5522) )
))
(declare-fun mapRest!19221 () (Array (_ BitVec 32) ValueCell!5522))

(declare-datatypes ((array!27275 0))(
  ( (array!27276 (arr!13086 (Array (_ BitVec 32) ValueCell!5522)) (size!13439 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27275)

(declare-fun mapValue!19221 () ValueCell!5522)

(declare-fun mapKey!19221 () (_ BitVec 32))

(assert (=> mapNonEmpty!19221 (= (arr!13086 _values!549) (store mapRest!19221 mapKey!19221 mapValue!19221))))

(declare-fun b!442764 () Bool)

(declare-fun tp_is_empty!11731 () Bool)

(assert (=> b!442764 (= e!260540 tp_is_empty!11731)))

(declare-fun res!262338 () Bool)

(assert (=> start!40318 (=> (not res!262338) (not e!260542))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40318 (= res!262338 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13438 _keys!709))))))

(assert (=> start!40318 e!260542))

(assert (=> start!40318 true))

(declare-fun e!260541 () Bool)

(declare-fun array_inv!9542 (array!27275) Bool)

(assert (=> start!40318 (and (array_inv!9542 _values!549) e!260541)))

(declare-fun array_inv!9543 (array!27273) Bool)

(assert (=> start!40318 (array_inv!9543 _keys!709)))

(declare-fun b!442765 () Bool)

(declare-fun e!260538 () Bool)

(assert (=> b!442765 (= e!260542 e!260538)))

(declare-fun res!262342 () Bool)

(assert (=> b!442765 (=> (not res!262342) (not e!260538))))

(declare-fun lt!203047 () array!27273)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27273 (_ BitVec 32)) Bool)

(assert (=> b!442765 (= res!262342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203047 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442765 (= lt!203047 (array!27274 (store (arr!13085 _keys!709) i!563 k0!794) (size!13438 _keys!709)))))

(declare-fun b!442766 () Bool)

(declare-fun e!260539 () Bool)

(assert (=> b!442766 (= e!260539 tp_is_empty!11731)))

(declare-fun mapIsEmpty!19221 () Bool)

(assert (=> mapIsEmpty!19221 mapRes!19221))

(declare-fun b!442767 () Bool)

(declare-fun res!262340 () Bool)

(assert (=> b!442767 (=> (not res!262340) (not e!260542))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442767 (= res!262340 (and (= (size!13439 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13438 _keys!709) (size!13439 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442768 () Bool)

(declare-fun res!262345 () Bool)

(assert (=> b!442768 (=> (not res!262345) (not e!260542))))

(assert (=> b!442768 (= res!262345 (or (= (select (arr!13085 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13085 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442769 () Bool)

(declare-fun res!262337 () Bool)

(assert (=> b!442769 (=> (not res!262337) (not e!260542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442769 (= res!262337 (validMask!0 mask!1025))))

(declare-fun b!442770 () Bool)

(declare-fun res!262341 () Bool)

(assert (=> b!442770 (=> (not res!262341) (not e!260542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442770 (= res!262341 (validKeyInArray!0 k0!794))))

(declare-fun b!442771 () Bool)

(assert (=> b!442771 (= e!260541 (and e!260539 mapRes!19221))))

(declare-fun condMapEmpty!19221 () Bool)

(declare-fun mapDefault!19221 () ValueCell!5522)

(assert (=> b!442771 (= condMapEmpty!19221 (= (arr!13086 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5522)) mapDefault!19221)))))

(declare-fun b!442772 () Bool)

(declare-fun res!262343 () Bool)

(assert (=> b!442772 (=> (not res!262343) (not e!260542))))

(assert (=> b!442772 (= res!262343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442773 () Bool)

(declare-fun res!262344 () Bool)

(assert (=> b!442773 (=> (not res!262344) (not e!260542))))

(declare-datatypes ((List!7850 0))(
  ( (Nil!7847) (Cons!7846 (h!8702 (_ BitVec 64)) (t!13599 List!7850)) )
))
(declare-fun arrayNoDuplicates!0 (array!27273 (_ BitVec 32) List!7850) Bool)

(assert (=> b!442773 (= res!262344 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7847))))

(declare-fun b!442774 () Bool)

(assert (=> b!442774 (= e!260538 false)))

(declare-fun lt!203048 () Bool)

(assert (=> b!442774 (= lt!203048 (arrayNoDuplicates!0 lt!203047 #b00000000000000000000000000000000 Nil!7847))))

(declare-fun b!442775 () Bool)

(declare-fun res!262346 () Bool)

(assert (=> b!442775 (=> (not res!262346) (not e!260542))))

(assert (=> b!442775 (= res!262346 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13438 _keys!709))))))

(assert (= (and start!40318 res!262338) b!442769))

(assert (= (and b!442769 res!262337) b!442767))

(assert (= (and b!442767 res!262340) b!442772))

(assert (= (and b!442772 res!262343) b!442773))

(assert (= (and b!442773 res!262344) b!442775))

(assert (= (and b!442775 res!262346) b!442770))

(assert (= (and b!442770 res!262341) b!442768))

(assert (= (and b!442768 res!262345) b!442763))

(assert (= (and b!442763 res!262339) b!442765))

(assert (= (and b!442765 res!262342) b!442774))

(assert (= (and b!442771 condMapEmpty!19221) mapIsEmpty!19221))

(assert (= (and b!442771 (not condMapEmpty!19221)) mapNonEmpty!19221))

(get-info :version)

(assert (= (and mapNonEmpty!19221 ((_ is ValueCellFull!5522) mapValue!19221)) b!442764))

(assert (= (and b!442771 ((_ is ValueCellFull!5522) mapDefault!19221)) b!442766))

(assert (= start!40318 b!442771))

(declare-fun m!428725 () Bool)

(assert (=> b!442765 m!428725))

(declare-fun m!428727 () Bool)

(assert (=> b!442765 m!428727))

(declare-fun m!428729 () Bool)

(assert (=> b!442770 m!428729))

(declare-fun m!428731 () Bool)

(assert (=> b!442773 m!428731))

(declare-fun m!428733 () Bool)

(assert (=> b!442763 m!428733))

(declare-fun m!428735 () Bool)

(assert (=> start!40318 m!428735))

(declare-fun m!428737 () Bool)

(assert (=> start!40318 m!428737))

(declare-fun m!428739 () Bool)

(assert (=> b!442772 m!428739))

(declare-fun m!428741 () Bool)

(assert (=> b!442774 m!428741))

(declare-fun m!428743 () Bool)

(assert (=> mapNonEmpty!19221 m!428743))

(declare-fun m!428745 () Bool)

(assert (=> b!442768 m!428745))

(declare-fun m!428747 () Bool)

(assert (=> b!442769 m!428747))

(check-sat (not b!442772) (not b!442774) (not b!442763) (not b!442770) tp_is_empty!11731 (not b!442765) (not b!442773) (not mapNonEmpty!19221) (not start!40318) (not b!442769))
(check-sat)
