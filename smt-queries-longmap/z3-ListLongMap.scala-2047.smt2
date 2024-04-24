; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35436 () Bool)

(assert start!35436)

(declare-fun b_free!7837 () Bool)

(declare-fun b_next!7837 () Bool)

(assert (=> start!35436 (= b_free!7837 (not b_next!7837))))

(declare-fun tp!27296 () Bool)

(declare-fun b_and!15093 () Bool)

(assert (=> start!35436 (= tp!27296 b_and!15093)))

(declare-fun b!355011 () Bool)

(declare-fun res!196907 () Bool)

(declare-fun e!217533 () Bool)

(assert (=> b!355011 (=> (not res!196907) (not e!217533))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355011 (= res!196907 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13362 () Bool)

(declare-fun mapRes!13362 () Bool)

(declare-fun tp!27297 () Bool)

(declare-fun e!217535 () Bool)

(assert (=> mapNonEmpty!13362 (= mapRes!13362 (and tp!27297 e!217535))))

(declare-datatypes ((V!11515 0))(
  ( (V!11516 (val!3996 Int)) )
))
(declare-datatypes ((ValueCell!3608 0))(
  ( (ValueCellFull!3608 (v!6191 V!11515)) (EmptyCell!3608) )
))
(declare-fun mapRest!13362 () (Array (_ BitVec 32) ValueCell!3608))

(declare-fun mapKey!13362 () (_ BitVec 32))

(declare-datatypes ((array!19376 0))(
  ( (array!19377 (arr!9181 (Array (_ BitVec 32) ValueCell!3608)) (size!9533 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19376)

(declare-fun mapValue!13362 () ValueCell!3608)

(assert (=> mapNonEmpty!13362 (= (arr!9181 _values!1208) (store mapRest!13362 mapKey!13362 mapValue!13362))))

(declare-fun b!355012 () Bool)

(assert (=> b!355012 (= e!217533 (not true))))

(declare-fun minValue!1150 () V!11515)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19378 0))(
  ( (array!19379 (arr!9182 (Array (_ BitVec 32) (_ BitVec 64))) (size!9534 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19378)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11515)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((tuple2!5590 0))(
  ( (tuple2!5591 (_1!2806 (_ BitVec 64)) (_2!2806 V!11515)) )
))
(declare-datatypes ((List!5228 0))(
  ( (Nil!5225) (Cons!5224 (h!6080 tuple2!5590) (t!10370 List!5228)) )
))
(declare-datatypes ((ListLongMap!4505 0))(
  ( (ListLongMap!4506 (toList!2268 List!5228)) )
))
(declare-fun contains!2367 (ListLongMap!4505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1796 (array!19378 array!19376 (_ BitVec 32) (_ BitVec 32) V!11515 V!11515 (_ BitVec 32) Int) ListLongMap!4505)

(assert (=> b!355012 (contains!2367 (getCurrentListMap!1796 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9182 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10921 0))(
  ( (Unit!10922) )
))
(declare-fun lt!165788 () Unit!10921)

(declare-fun lemmaValidKeyInArrayIsInListMap!186 (array!19378 array!19376 (_ BitVec 32) (_ BitVec 32) V!11515 V!11515 (_ BitVec 32) Int) Unit!10921)

(assert (=> b!355012 (= lt!165788 (lemmaValidKeyInArrayIsInListMap!186 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355013 () Bool)

(declare-fun tp_is_empty!7903 () Bool)

(assert (=> b!355013 (= e!217535 tp_is_empty!7903)))

(declare-fun b!355014 () Bool)

(declare-fun res!196908 () Bool)

(assert (=> b!355014 (=> (not res!196908) (not e!217533))))

(assert (=> b!355014 (= res!196908 (= (select (arr!9182 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355015 () Bool)

(declare-fun res!196909 () Bool)

(assert (=> b!355015 (=> (not res!196909) (not e!217533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19378 (_ BitVec 32)) Bool)

(assert (=> b!355015 (= res!196909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355016 () Bool)

(declare-fun e!217537 () Bool)

(declare-fun e!217536 () Bool)

(assert (=> b!355016 (= e!217537 (and e!217536 mapRes!13362))))

(declare-fun condMapEmpty!13362 () Bool)

(declare-fun mapDefault!13362 () ValueCell!3608)

(assert (=> b!355016 (= condMapEmpty!13362 (= (arr!9181 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3608)) mapDefault!13362)))))

(declare-fun b!355017 () Bool)

(declare-fun res!196904 () Bool)

(assert (=> b!355017 (=> (not res!196904) (not e!217533))))

(assert (=> b!355017 (= res!196904 (and (= (size!9533 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9534 _keys!1456) (size!9533 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196905 () Bool)

(assert (=> start!35436 (=> (not res!196905) (not e!217533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35436 (= res!196905 (validMask!0 mask!1842))))

(assert (=> start!35436 e!217533))

(assert (=> start!35436 tp_is_empty!7903))

(assert (=> start!35436 true))

(assert (=> start!35436 tp!27296))

(declare-fun array_inv!6786 (array!19378) Bool)

(assert (=> start!35436 (array_inv!6786 _keys!1456)))

(declare-fun array_inv!6787 (array!19376) Bool)

(assert (=> start!35436 (and (array_inv!6787 _values!1208) e!217537)))

(declare-fun b!355018 () Bool)

(declare-fun res!196906 () Bool)

(assert (=> b!355018 (=> (not res!196906) (not e!217533))))

(declare-datatypes ((List!5229 0))(
  ( (Nil!5226) (Cons!5225 (h!6081 (_ BitVec 64)) (t!10371 List!5229)) )
))
(declare-fun arrayNoDuplicates!0 (array!19378 (_ BitVec 32) List!5229) Bool)

(assert (=> b!355018 (= res!196906 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5226))))

(declare-fun b!355019 () Bool)

(declare-fun res!196903 () Bool)

(assert (=> b!355019 (=> (not res!196903) (not e!217533))))

(assert (=> b!355019 (= res!196903 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9534 _keys!1456))))))

(declare-fun mapIsEmpty!13362 () Bool)

(assert (=> mapIsEmpty!13362 mapRes!13362))

(declare-fun b!355020 () Bool)

(declare-fun res!196901 () Bool)

(assert (=> b!355020 (=> (not res!196901) (not e!217533))))

(declare-fun arrayContainsKey!0 (array!19378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355020 (= res!196901 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355021 () Bool)

(assert (=> b!355021 (= e!217536 tp_is_empty!7903)))

(declare-fun b!355022 () Bool)

(declare-fun res!196902 () Bool)

(assert (=> b!355022 (=> (not res!196902) (not e!217533))))

(assert (=> b!355022 (= res!196902 (validKeyInArray!0 (select (arr!9182 _keys!1456) from!1805)))))

(assert (= (and start!35436 res!196905) b!355017))

(assert (= (and b!355017 res!196904) b!355015))

(assert (= (and b!355015 res!196909) b!355018))

(assert (= (and b!355018 res!196906) b!355011))

(assert (= (and b!355011 res!196907) b!355019))

(assert (= (and b!355019 res!196903) b!355020))

(assert (= (and b!355020 res!196901) b!355014))

(assert (= (and b!355014 res!196908) b!355022))

(assert (= (and b!355022 res!196902) b!355012))

(assert (= (and b!355016 condMapEmpty!13362) mapIsEmpty!13362))

(assert (= (and b!355016 (not condMapEmpty!13362)) mapNonEmpty!13362))

(get-info :version)

(assert (= (and mapNonEmpty!13362 ((_ is ValueCellFull!3608) mapValue!13362)) b!355013))

(assert (= (and b!355016 ((_ is ValueCellFull!3608) mapDefault!13362)) b!355021))

(assert (= start!35436 b!355016))

(declare-fun m!354111 () Bool)

(assert (=> b!355022 m!354111))

(assert (=> b!355022 m!354111))

(declare-fun m!354113 () Bool)

(assert (=> b!355022 m!354113))

(declare-fun m!354115 () Bool)

(assert (=> b!355015 m!354115))

(declare-fun m!354117 () Bool)

(assert (=> b!355011 m!354117))

(declare-fun m!354119 () Bool)

(assert (=> mapNonEmpty!13362 m!354119))

(declare-fun m!354121 () Bool)

(assert (=> start!35436 m!354121))

(declare-fun m!354123 () Bool)

(assert (=> start!35436 m!354123))

(declare-fun m!354125 () Bool)

(assert (=> start!35436 m!354125))

(declare-fun m!354127 () Bool)

(assert (=> b!355012 m!354127))

(assert (=> b!355012 m!354111))

(assert (=> b!355012 m!354127))

(assert (=> b!355012 m!354111))

(declare-fun m!354129 () Bool)

(assert (=> b!355012 m!354129))

(declare-fun m!354131 () Bool)

(assert (=> b!355012 m!354131))

(declare-fun m!354133 () Bool)

(assert (=> b!355020 m!354133))

(declare-fun m!354135 () Bool)

(assert (=> b!355018 m!354135))

(assert (=> b!355014 m!354111))

(check-sat (not b!355015) tp_is_empty!7903 (not b!355012) (not start!35436) (not b!355018) (not mapNonEmpty!13362) b_and!15093 (not b_next!7837) (not b!355022) (not b!355011) (not b!355020))
(check-sat b_and!15093 (not b_next!7837))
