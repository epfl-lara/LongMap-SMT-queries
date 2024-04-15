; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35436 () Bool)

(assert start!35436)

(declare-fun b_free!7837 () Bool)

(declare-fun b_next!7837 () Bool)

(assert (=> start!35436 (= b_free!7837 (not b_next!7837))))

(declare-fun tp!27296 () Bool)

(declare-fun b_and!15053 () Bool)

(assert (=> start!35436 (= tp!27296 b_and!15053)))

(declare-fun b!354789 () Bool)

(declare-fun res!196781 () Bool)

(declare-fun e!217393 () Bool)

(assert (=> b!354789 (=> (not res!196781) (not e!217393))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354789 (= res!196781 (validKeyInArray!0 k0!1077))))

(declare-fun b!354790 () Bool)

(declare-fun e!217395 () Bool)

(declare-fun tp_is_empty!7903 () Bool)

(assert (=> b!354790 (= e!217395 tp_is_empty!7903)))

(declare-fun b!354792 () Bool)

(declare-fun res!196782 () Bool)

(assert (=> b!354792 (=> (not res!196782) (not e!217393))))

(declare-datatypes ((array!19371 0))(
  ( (array!19372 (arr!9179 (Array (_ BitVec 32) (_ BitVec 64))) (size!9532 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19371)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354792 (= res!196782 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354793 () Bool)

(declare-fun res!196779 () Bool)

(assert (=> b!354793 (=> (not res!196779) (not e!217393))))

(assert (=> b!354793 (= res!196779 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9532 _keys!1456))))))

(declare-fun b!354794 () Bool)

(declare-fun res!196776 () Bool)

(assert (=> b!354794 (=> (not res!196776) (not e!217393))))

(assert (=> b!354794 (= res!196776 (validKeyInArray!0 (select (arr!9179 _keys!1456) from!1805)))))

(declare-fun b!354795 () Bool)

(assert (=> b!354795 (= e!217393 (not true))))

(declare-datatypes ((V!11515 0))(
  ( (V!11516 (val!3996 Int)) )
))
(declare-fun minValue!1150 () V!11515)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3608 0))(
  ( (ValueCellFull!3608 (v!6184 V!11515)) (EmptyCell!3608) )
))
(declare-datatypes ((array!19373 0))(
  ( (array!19374 (arr!9180 (Array (_ BitVec 32) ValueCell!3608)) (size!9533 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19373)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11515)

(declare-datatypes ((tuple2!5648 0))(
  ( (tuple2!5649 (_1!2835 (_ BitVec 64)) (_2!2835 V!11515)) )
))
(declare-datatypes ((List!5289 0))(
  ( (Nil!5286) (Cons!5285 (h!6141 tuple2!5648) (t!10430 List!5289)) )
))
(declare-datatypes ((ListLongMap!4551 0))(
  ( (ListLongMap!4552 (toList!2291 List!5289)) )
))
(declare-fun contains!2381 (ListLongMap!4551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1796 (array!19371 array!19373 (_ BitVec 32) (_ BitVec 32) V!11515 V!11515 (_ BitVec 32) Int) ListLongMap!4551)

(assert (=> b!354795 (contains!2381 (getCurrentListMap!1796 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9179 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10928 0))(
  ( (Unit!10929) )
))
(declare-fun lt!165535 () Unit!10928)

(declare-fun lemmaValidKeyInArrayIsInListMap!188 (array!19371 array!19373 (_ BitVec 32) (_ BitVec 32) V!11515 V!11515 (_ BitVec 32) Int) Unit!10928)

(assert (=> b!354795 (= lt!165535 (lemmaValidKeyInArrayIsInListMap!188 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354796 () Bool)

(declare-fun res!196780 () Bool)

(assert (=> b!354796 (=> (not res!196780) (not e!217393))))

(assert (=> b!354796 (= res!196780 (and (= (size!9533 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9532 _keys!1456) (size!9533 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354797 () Bool)

(declare-fun res!196778 () Bool)

(assert (=> b!354797 (=> (not res!196778) (not e!217393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19371 (_ BitVec 32)) Bool)

(assert (=> b!354797 (= res!196778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354798 () Bool)

(declare-fun res!196783 () Bool)

(assert (=> b!354798 (=> (not res!196783) (not e!217393))))

(declare-datatypes ((List!5290 0))(
  ( (Nil!5287) (Cons!5286 (h!6142 (_ BitVec 64)) (t!10431 List!5290)) )
))
(declare-fun arrayNoDuplicates!0 (array!19371 (_ BitVec 32) List!5290) Bool)

(assert (=> b!354798 (= res!196783 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5287))))

(declare-fun mapIsEmpty!13362 () Bool)

(declare-fun mapRes!13362 () Bool)

(assert (=> mapIsEmpty!13362 mapRes!13362))

(declare-fun res!196777 () Bool)

(assert (=> start!35436 (=> (not res!196777) (not e!217393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35436 (= res!196777 (validMask!0 mask!1842))))

(assert (=> start!35436 e!217393))

(assert (=> start!35436 tp_is_empty!7903))

(assert (=> start!35436 true))

(assert (=> start!35436 tp!27296))

(declare-fun array_inv!6794 (array!19371) Bool)

(assert (=> start!35436 (array_inv!6794 _keys!1456)))

(declare-fun e!217391 () Bool)

(declare-fun array_inv!6795 (array!19373) Bool)

(assert (=> start!35436 (and (array_inv!6795 _values!1208) e!217391)))

(declare-fun b!354791 () Bool)

(declare-fun e!217394 () Bool)

(assert (=> b!354791 (= e!217391 (and e!217394 mapRes!13362))))

(declare-fun condMapEmpty!13362 () Bool)

(declare-fun mapDefault!13362 () ValueCell!3608)

(assert (=> b!354791 (= condMapEmpty!13362 (= (arr!9180 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3608)) mapDefault!13362)))))

(declare-fun b!354799 () Bool)

(assert (=> b!354799 (= e!217394 tp_is_empty!7903)))

(declare-fun mapNonEmpty!13362 () Bool)

(declare-fun tp!27297 () Bool)

(assert (=> mapNonEmpty!13362 (= mapRes!13362 (and tp!27297 e!217395))))

(declare-fun mapRest!13362 () (Array (_ BitVec 32) ValueCell!3608))

(declare-fun mapKey!13362 () (_ BitVec 32))

(declare-fun mapValue!13362 () ValueCell!3608)

(assert (=> mapNonEmpty!13362 (= (arr!9180 _values!1208) (store mapRest!13362 mapKey!13362 mapValue!13362))))

(declare-fun b!354800 () Bool)

(declare-fun res!196775 () Bool)

(assert (=> b!354800 (=> (not res!196775) (not e!217393))))

(assert (=> b!354800 (= res!196775 (= (select (arr!9179 _keys!1456) from!1805) k0!1077))))

(assert (= (and start!35436 res!196777) b!354796))

(assert (= (and b!354796 res!196780) b!354797))

(assert (= (and b!354797 res!196778) b!354798))

(assert (= (and b!354798 res!196783) b!354789))

(assert (= (and b!354789 res!196781) b!354793))

(assert (= (and b!354793 res!196779) b!354792))

(assert (= (and b!354792 res!196782) b!354800))

(assert (= (and b!354800 res!196775) b!354794))

(assert (= (and b!354794 res!196776) b!354795))

(assert (= (and b!354791 condMapEmpty!13362) mapIsEmpty!13362))

(assert (= (and b!354791 (not condMapEmpty!13362)) mapNonEmpty!13362))

(get-info :version)

(assert (= (and mapNonEmpty!13362 ((_ is ValueCellFull!3608) mapValue!13362)) b!354790))

(assert (= (and b!354791 ((_ is ValueCellFull!3608) mapDefault!13362)) b!354799))

(assert (= start!35436 b!354791))

(declare-fun m!353157 () Bool)

(assert (=> b!354798 m!353157))

(declare-fun m!353159 () Bool)

(assert (=> mapNonEmpty!13362 m!353159))

(declare-fun m!353161 () Bool)

(assert (=> b!354797 m!353161))

(declare-fun m!353163 () Bool)

(assert (=> b!354789 m!353163))

(declare-fun m!353165 () Bool)

(assert (=> start!35436 m!353165))

(declare-fun m!353167 () Bool)

(assert (=> start!35436 m!353167))

(declare-fun m!353169 () Bool)

(assert (=> start!35436 m!353169))

(declare-fun m!353171 () Bool)

(assert (=> b!354792 m!353171))

(declare-fun m!353173 () Bool)

(assert (=> b!354794 m!353173))

(assert (=> b!354794 m!353173))

(declare-fun m!353175 () Bool)

(assert (=> b!354794 m!353175))

(assert (=> b!354800 m!353173))

(declare-fun m!353177 () Bool)

(assert (=> b!354795 m!353177))

(assert (=> b!354795 m!353173))

(assert (=> b!354795 m!353177))

(assert (=> b!354795 m!353173))

(declare-fun m!353179 () Bool)

(assert (=> b!354795 m!353179))

(declare-fun m!353181 () Bool)

(assert (=> b!354795 m!353181))

(check-sat (not start!35436) (not b!354797) (not b!354789) b_and!15053 (not b!354794) (not b_next!7837) (not mapNonEmpty!13362) (not b!354798) (not b!354795) tp_is_empty!7903 (not b!354792))
(check-sat b_and!15053 (not b_next!7837))
