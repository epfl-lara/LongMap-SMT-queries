; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20804 () Bool)

(assert start!20804)

(declare-fun b_free!5457 () Bool)

(declare-fun b_next!5457 () Bool)

(assert (=> start!20804 (= b_free!5457 (not b_next!5457))))

(declare-fun tp!19412 () Bool)

(declare-fun b_and!12203 () Bool)

(assert (=> start!20804 (= tp!19412 b_and!12203)))

(declare-fun b!208520 () Bool)

(declare-fun e!135985 () Bool)

(declare-fun tp_is_empty!5319 () Bool)

(assert (=> b!208520 (= e!135985 tp_is_empty!5319)))

(declare-fun b!208521 () Bool)

(declare-fun e!135988 () Bool)

(assert (=> b!208521 (= e!135988 tp_is_empty!5319)))

(declare-fun b!208522 () Bool)

(declare-fun res!101452 () Bool)

(declare-fun e!135989 () Bool)

(assert (=> b!208522 (=> (not res!101452) (not e!135989))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9841 0))(
  ( (array!9842 (arr!4671 (Array (_ BitVec 32) (_ BitVec 64))) (size!4996 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9841)

(assert (=> b!208522 (= res!101452 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4996 _keys!825))))))

(declare-fun b!208523 () Bool)

(declare-fun res!101458 () Bool)

(assert (=> b!208523 (=> (not res!101458) (not e!135989))))

(declare-datatypes ((List!2993 0))(
  ( (Nil!2990) (Cons!2989 (h!3631 (_ BitVec 64)) (t!7924 List!2993)) )
))
(declare-fun arrayNoDuplicates!0 (array!9841 (_ BitVec 32) List!2993) Bool)

(assert (=> b!208523 (= res!101458 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2990))))

(declare-fun b!208524 () Bool)

(declare-fun res!101456 () Bool)

(assert (=> b!208524 (=> (not res!101456) (not e!135989))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208524 (= res!101456 (= (select (arr!4671 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9047 () Bool)

(declare-fun mapRes!9047 () Bool)

(declare-fun tp!19411 () Bool)

(assert (=> mapNonEmpty!9047 (= mapRes!9047 (and tp!19411 e!135988))))

(declare-datatypes ((V!6739 0))(
  ( (V!6740 (val!2704 Int)) )
))
(declare-datatypes ((ValueCell!2316 0))(
  ( (ValueCellFull!2316 (v!4674 V!6739)) (EmptyCell!2316) )
))
(declare-fun mapValue!9047 () ValueCell!2316)

(declare-fun mapRest!9047 () (Array (_ BitVec 32) ValueCell!2316))

(declare-fun mapKey!9047 () (_ BitVec 32))

(declare-datatypes ((array!9843 0))(
  ( (array!9844 (arr!4672 (Array (_ BitVec 32) ValueCell!2316)) (size!4997 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9843)

(assert (=> mapNonEmpty!9047 (= (arr!4672 _values!649) (store mapRest!9047 mapKey!9047 mapValue!9047))))

(declare-fun b!208525 () Bool)

(declare-fun res!101454 () Bool)

(assert (=> b!208525 (=> (not res!101454) (not e!135989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208525 (= res!101454 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9047 () Bool)

(assert (=> mapIsEmpty!9047 mapRes!9047))

(declare-fun res!101457 () Bool)

(assert (=> start!20804 (=> (not res!101457) (not e!135989))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20804 (= res!101457 (validMask!0 mask!1149))))

(assert (=> start!20804 e!135989))

(declare-fun e!135986 () Bool)

(declare-fun array_inv!3097 (array!9843) Bool)

(assert (=> start!20804 (and (array_inv!3097 _values!649) e!135986)))

(assert (=> start!20804 true))

(assert (=> start!20804 tp_is_empty!5319))

(declare-fun array_inv!3098 (array!9841) Bool)

(assert (=> start!20804 (array_inv!3098 _keys!825)))

(assert (=> start!20804 tp!19412))

(declare-fun b!208526 () Bool)

(assert (=> b!208526 (= e!135986 (and e!135985 mapRes!9047))))

(declare-fun condMapEmpty!9047 () Bool)

(declare-fun mapDefault!9047 () ValueCell!2316)

(assert (=> b!208526 (= condMapEmpty!9047 (= (arr!4672 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2316)) mapDefault!9047)))))

(declare-fun b!208527 () Bool)

(declare-fun res!101455 () Bool)

(assert (=> b!208527 (=> (not res!101455) (not e!135989))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208527 (= res!101455 (and (= (size!4997 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4996 _keys!825) (size!4997 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208528 () Bool)

(declare-fun res!101453 () Bool)

(assert (=> b!208528 (=> (not res!101453) (not e!135989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9841 (_ BitVec 32)) Bool)

(assert (=> b!208528 (= res!101453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208529 () Bool)

(assert (=> b!208529 (= e!135989 false)))

(declare-datatypes ((tuple2!4098 0))(
  ( (tuple2!4099 (_1!2060 (_ BitVec 64)) (_2!2060 V!6739)) )
))
(declare-datatypes ((List!2994 0))(
  ( (Nil!2991) (Cons!2990 (h!3632 tuple2!4098) (t!7925 List!2994)) )
))
(declare-datatypes ((ListLongMap!3011 0))(
  ( (ListLongMap!3012 (toList!1521 List!2994)) )
))
(declare-fun lt!106803 () ListLongMap!3011)

(declare-fun v!520 () V!6739)

(declare-fun zeroValue!615 () V!6739)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6739)

(declare-fun getCurrentListMapNoExtraKeys!462 (array!9841 array!9843 (_ BitVec 32) (_ BitVec 32) V!6739 V!6739 (_ BitVec 32) Int) ListLongMap!3011)

(assert (=> b!208529 (= lt!106803 (getCurrentListMapNoExtraKeys!462 _keys!825 (array!9844 (store (arr!4672 _values!649) i!601 (ValueCellFull!2316 v!520)) (size!4997 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106802 () ListLongMap!3011)

(assert (=> b!208529 (= lt!106802 (getCurrentListMapNoExtraKeys!462 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20804 res!101457) b!208527))

(assert (= (and b!208527 res!101455) b!208528))

(assert (= (and b!208528 res!101453) b!208523))

(assert (= (and b!208523 res!101458) b!208522))

(assert (= (and b!208522 res!101452) b!208525))

(assert (= (and b!208525 res!101454) b!208524))

(assert (= (and b!208524 res!101456) b!208529))

(assert (= (and b!208526 condMapEmpty!9047) mapIsEmpty!9047))

(assert (= (and b!208526 (not condMapEmpty!9047)) mapNonEmpty!9047))

(get-info :version)

(assert (= (and mapNonEmpty!9047 ((_ is ValueCellFull!2316) mapValue!9047)) b!208521))

(assert (= (and b!208526 ((_ is ValueCellFull!2316) mapDefault!9047)) b!208520))

(assert (= start!20804 b!208526))

(declare-fun m!236129 () Bool)

(assert (=> b!208525 m!236129))

(declare-fun m!236131 () Bool)

(assert (=> start!20804 m!236131))

(declare-fun m!236133 () Bool)

(assert (=> start!20804 m!236133))

(declare-fun m!236135 () Bool)

(assert (=> start!20804 m!236135))

(declare-fun m!236137 () Bool)

(assert (=> b!208524 m!236137))

(declare-fun m!236139 () Bool)

(assert (=> mapNonEmpty!9047 m!236139))

(declare-fun m!236141 () Bool)

(assert (=> b!208529 m!236141))

(declare-fun m!236143 () Bool)

(assert (=> b!208529 m!236143))

(declare-fun m!236145 () Bool)

(assert (=> b!208529 m!236145))

(declare-fun m!236147 () Bool)

(assert (=> b!208528 m!236147))

(declare-fun m!236149 () Bool)

(assert (=> b!208523 m!236149))

(check-sat b_and!12203 tp_is_empty!5319 (not b_next!5457) (not b!208529) (not b!208525) (not mapNonEmpty!9047) (not b!208528) (not b!208523) (not start!20804))
(check-sat b_and!12203 (not b_next!5457))
