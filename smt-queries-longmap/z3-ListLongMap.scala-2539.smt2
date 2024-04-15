; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39038 () Bool)

(assert start!39038)

(declare-fun b_free!9319 () Bool)

(declare-fun b_next!9319 () Bool)

(assert (=> start!39038 (= b_free!9319 (not b_next!9319))))

(declare-fun tp!33485 () Bool)

(declare-fun b_and!16679 () Bool)

(assert (=> start!39038 (= tp!33485 b_and!16679)))

(declare-fun b!409511 () Bool)

(declare-fun res!237235 () Bool)

(declare-fun e!245574 () Bool)

(assert (=> b!409511 (=> (not res!237235) (not e!245574))))

(declare-datatypes ((array!24803 0))(
  ( (array!24804 (arr!11851 (Array (_ BitVec 32) (_ BitVec 64))) (size!12204 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24803)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15067 0))(
  ( (V!15068 (val!5280 Int)) )
))
(declare-datatypes ((ValueCell!4892 0))(
  ( (ValueCellFull!4892 (v!7521 V!15067)) (EmptyCell!4892) )
))
(declare-datatypes ((array!24805 0))(
  ( (array!24806 (arr!11852 (Array (_ BitVec 32) ValueCell!4892)) (size!12205 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24805)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409511 (= res!237235 (and (= (size!12205 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12204 _keys!709) (size!12205 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409512 () Bool)

(declare-fun e!245570 () Bool)

(declare-fun e!245571 () Bool)

(declare-fun mapRes!17328 () Bool)

(assert (=> b!409512 (= e!245570 (and e!245571 mapRes!17328))))

(declare-fun condMapEmpty!17328 () Bool)

(declare-fun mapDefault!17328 () ValueCell!4892)

(assert (=> b!409512 (= condMapEmpty!17328 (= (arr!11852 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4892)) mapDefault!17328)))))

(declare-fun b!409513 () Bool)

(declare-fun res!237246 () Bool)

(assert (=> b!409513 (=> (not res!237246) (not e!245574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409513 (= res!237246 (validMask!0 mask!1025))))

(declare-fun b!409514 () Bool)

(declare-fun e!245573 () Bool)

(assert (=> b!409514 (= e!245574 e!245573)))

(declare-fun res!237237 () Bool)

(assert (=> b!409514 (=> (not res!237237) (not e!245573))))

(declare-fun lt!188758 () array!24803)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24803 (_ BitVec 32)) Bool)

(assert (=> b!409514 (= res!237237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188758 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409514 (= lt!188758 (array!24804 (store (arr!11851 _keys!709) i!563 k0!794) (size!12204 _keys!709)))))

(declare-fun b!409515 () Bool)

(assert (=> b!409515 (= e!245573 false)))

(declare-fun minValue!515 () V!15067)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6832 0))(
  ( (tuple2!6833 (_1!3427 (_ BitVec 64)) (_2!3427 V!15067)) )
))
(declare-datatypes ((List!6843 0))(
  ( (Nil!6840) (Cons!6839 (h!7695 tuple2!6832) (t!12008 List!6843)) )
))
(declare-datatypes ((ListLongMap!5735 0))(
  ( (ListLongMap!5736 (toList!2883 List!6843)) )
))
(declare-fun lt!188759 () ListLongMap!5735)

(declare-fun zeroValue!515 () V!15067)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1097 (array!24803 array!24805 (_ BitVec 32) (_ BitVec 32) V!15067 V!15067 (_ BitVec 32) Int) ListLongMap!5735)

(assert (=> b!409515 (= lt!188759 (getCurrentListMapNoExtraKeys!1097 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409516 () Bool)

(declare-fun res!237245 () Bool)

(assert (=> b!409516 (=> (not res!237245) (not e!245573))))

(assert (=> b!409516 (= res!237245 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17328 () Bool)

(assert (=> mapIsEmpty!17328 mapRes!17328))

(declare-fun res!237243 () Bool)

(assert (=> start!39038 (=> (not res!237243) (not e!245574))))

(assert (=> start!39038 (= res!237243 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12204 _keys!709))))))

(assert (=> start!39038 e!245574))

(declare-fun tp_is_empty!10471 () Bool)

(assert (=> start!39038 tp_is_empty!10471))

(assert (=> start!39038 tp!33485))

(assert (=> start!39038 true))

(declare-fun array_inv!8690 (array!24805) Bool)

(assert (=> start!39038 (and (array_inv!8690 _values!549) e!245570)))

(declare-fun array_inv!8691 (array!24803) Bool)

(assert (=> start!39038 (array_inv!8691 _keys!709)))

(declare-fun b!409517 () Bool)

(declare-fun e!245572 () Bool)

(assert (=> b!409517 (= e!245572 tp_is_empty!10471)))

(declare-fun b!409518 () Bool)

(declare-fun res!237241 () Bool)

(assert (=> b!409518 (=> (not res!237241) (not e!245574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409518 (= res!237241 (validKeyInArray!0 k0!794))))

(declare-fun b!409519 () Bool)

(declare-fun res!237240 () Bool)

(assert (=> b!409519 (=> (not res!237240) (not e!245574))))

(assert (=> b!409519 (= res!237240 (or (= (select (arr!11851 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11851 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409520 () Bool)

(declare-fun res!237244 () Bool)

(assert (=> b!409520 (=> (not res!237244) (not e!245574))))

(declare-datatypes ((List!6844 0))(
  ( (Nil!6841) (Cons!6840 (h!7696 (_ BitVec 64)) (t!12009 List!6844)) )
))
(declare-fun arrayNoDuplicates!0 (array!24803 (_ BitVec 32) List!6844) Bool)

(assert (=> b!409520 (= res!237244 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6841))))

(declare-fun b!409521 () Bool)

(declare-fun res!237239 () Bool)

(assert (=> b!409521 (=> (not res!237239) (not e!245573))))

(assert (=> b!409521 (= res!237239 (arrayNoDuplicates!0 lt!188758 #b00000000000000000000000000000000 Nil!6841))))

(declare-fun b!409522 () Bool)

(assert (=> b!409522 (= e!245571 tp_is_empty!10471)))

(declare-fun mapNonEmpty!17328 () Bool)

(declare-fun tp!33486 () Bool)

(assert (=> mapNonEmpty!17328 (= mapRes!17328 (and tp!33486 e!245572))))

(declare-fun mapRest!17328 () (Array (_ BitVec 32) ValueCell!4892))

(declare-fun mapValue!17328 () ValueCell!4892)

(declare-fun mapKey!17328 () (_ BitVec 32))

(assert (=> mapNonEmpty!17328 (= (arr!11852 _values!549) (store mapRest!17328 mapKey!17328 mapValue!17328))))

(declare-fun b!409523 () Bool)

(declare-fun res!237236 () Bool)

(assert (=> b!409523 (=> (not res!237236) (not e!245574))))

(declare-fun arrayContainsKey!0 (array!24803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409523 (= res!237236 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409524 () Bool)

(declare-fun res!237242 () Bool)

(assert (=> b!409524 (=> (not res!237242) (not e!245574))))

(assert (=> b!409524 (= res!237242 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12204 _keys!709))))))

(declare-fun b!409525 () Bool)

(declare-fun res!237238 () Bool)

(assert (=> b!409525 (=> (not res!237238) (not e!245574))))

(assert (=> b!409525 (= res!237238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39038 res!237243) b!409513))

(assert (= (and b!409513 res!237246) b!409511))

(assert (= (and b!409511 res!237235) b!409525))

(assert (= (and b!409525 res!237238) b!409520))

(assert (= (and b!409520 res!237244) b!409524))

(assert (= (and b!409524 res!237242) b!409518))

(assert (= (and b!409518 res!237241) b!409519))

(assert (= (and b!409519 res!237240) b!409523))

(assert (= (and b!409523 res!237236) b!409514))

(assert (= (and b!409514 res!237237) b!409521))

(assert (= (and b!409521 res!237239) b!409516))

(assert (= (and b!409516 res!237245) b!409515))

(assert (= (and b!409512 condMapEmpty!17328) mapIsEmpty!17328))

(assert (= (and b!409512 (not condMapEmpty!17328)) mapNonEmpty!17328))

(get-info :version)

(assert (= (and mapNonEmpty!17328 ((_ is ValueCellFull!4892) mapValue!17328)) b!409517))

(assert (= (and b!409512 ((_ is ValueCellFull!4892) mapDefault!17328)) b!409522))

(assert (= start!39038 b!409512))

(declare-fun m!399819 () Bool)

(assert (=> b!409523 m!399819))

(declare-fun m!399821 () Bool)

(assert (=> b!409525 m!399821))

(declare-fun m!399823 () Bool)

(assert (=> b!409515 m!399823))

(declare-fun m!399825 () Bool)

(assert (=> start!39038 m!399825))

(declare-fun m!399827 () Bool)

(assert (=> start!39038 m!399827))

(declare-fun m!399829 () Bool)

(assert (=> b!409520 m!399829))

(declare-fun m!399831 () Bool)

(assert (=> b!409513 m!399831))

(declare-fun m!399833 () Bool)

(assert (=> b!409521 m!399833))

(declare-fun m!399835 () Bool)

(assert (=> mapNonEmpty!17328 m!399835))

(declare-fun m!399837 () Bool)

(assert (=> b!409518 m!399837))

(declare-fun m!399839 () Bool)

(assert (=> b!409514 m!399839))

(declare-fun m!399841 () Bool)

(assert (=> b!409514 m!399841))

(declare-fun m!399843 () Bool)

(assert (=> b!409519 m!399843))

(check-sat (not b!409521) (not b!409520) (not b!409514) (not mapNonEmpty!17328) (not b!409525) (not b!409523) (not b_next!9319) (not b!409515) (not b!409518) (not start!39038) tp_is_empty!10471 (not b!409513) b_and!16679)
(check-sat b_and!16679 (not b_next!9319))
