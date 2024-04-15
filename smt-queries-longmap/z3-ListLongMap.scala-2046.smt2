; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35430 () Bool)

(assert start!35430)

(declare-fun b_free!7831 () Bool)

(declare-fun b_next!7831 () Bool)

(assert (=> start!35430 (= b_free!7831 (not b_next!7831))))

(declare-fun tp!27279 () Bool)

(declare-fun b_and!15047 () Bool)

(assert (=> start!35430 (= tp!27279 b_and!15047)))

(declare-fun b!354681 () Bool)

(declare-fun res!196700 () Bool)

(declare-fun e!217346 () Bool)

(assert (=> b!354681 (=> (not res!196700) (not e!217346))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354681 (= res!196700 (validKeyInArray!0 k0!1077))))

(declare-fun b!354682 () Bool)

(declare-fun res!196695 () Bool)

(assert (=> b!354682 (=> (not res!196695) (not e!217346))))

(declare-datatypes ((array!19359 0))(
  ( (array!19360 (arr!9173 (Array (_ BitVec 32) (_ BitVec 64))) (size!9526 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19359)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!354682 (= res!196695 (= (select (arr!9173 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354683 () Bool)

(declare-fun res!196699 () Bool)

(assert (=> b!354683 (=> (not res!196699) (not e!217346))))

(assert (=> b!354683 (= res!196699 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9526 _keys!1456))))))

(declare-fun mapNonEmpty!13353 () Bool)

(declare-fun mapRes!13353 () Bool)

(declare-fun tp!27278 () Bool)

(declare-fun e!217350 () Bool)

(assert (=> mapNonEmpty!13353 (= mapRes!13353 (and tp!27278 e!217350))))

(declare-datatypes ((V!11507 0))(
  ( (V!11508 (val!3993 Int)) )
))
(declare-datatypes ((ValueCell!3605 0))(
  ( (ValueCellFull!3605 (v!6181 V!11507)) (EmptyCell!3605) )
))
(declare-fun mapValue!13353 () ValueCell!3605)

(declare-fun mapKey!13353 () (_ BitVec 32))

(declare-datatypes ((array!19361 0))(
  ( (array!19362 (arr!9174 (Array (_ BitVec 32) ValueCell!3605)) (size!9527 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19361)

(declare-fun mapRest!13353 () (Array (_ BitVec 32) ValueCell!3605))

(assert (=> mapNonEmpty!13353 (= (arr!9174 _values!1208) (store mapRest!13353 mapKey!13353 mapValue!13353))))

(declare-fun b!354684 () Bool)

(declare-fun res!196694 () Bool)

(assert (=> b!354684 (=> (not res!196694) (not e!217346))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19359 (_ BitVec 32)) Bool)

(assert (=> b!354684 (= res!196694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354685 () Bool)

(declare-fun tp_is_empty!7897 () Bool)

(assert (=> b!354685 (= e!217350 tp_is_empty!7897)))

(declare-fun res!196701 () Bool)

(assert (=> start!35430 (=> (not res!196701) (not e!217346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35430 (= res!196701 (validMask!0 mask!1842))))

(assert (=> start!35430 e!217346))

(assert (=> start!35430 tp_is_empty!7897))

(assert (=> start!35430 true))

(assert (=> start!35430 tp!27279))

(declare-fun array_inv!6790 (array!19359) Bool)

(assert (=> start!35430 (array_inv!6790 _keys!1456)))

(declare-fun e!217348 () Bool)

(declare-fun array_inv!6791 (array!19361) Bool)

(assert (=> start!35430 (and (array_inv!6791 _values!1208) e!217348)))

(declare-fun b!354686 () Bool)

(declare-fun res!196702 () Bool)

(assert (=> b!354686 (=> (not res!196702) (not e!217346))))

(declare-fun arrayContainsKey!0 (array!19359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354686 (= res!196702 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354687 () Bool)

(declare-fun res!196698 () Bool)

(assert (=> b!354687 (=> (not res!196698) (not e!217346))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354687 (= res!196698 (and (= (size!9527 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9526 _keys!1456) (size!9527 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354688 () Bool)

(declare-fun e!217347 () Bool)

(assert (=> b!354688 (= e!217347 tp_is_empty!7897)))

(declare-fun mapIsEmpty!13353 () Bool)

(assert (=> mapIsEmpty!13353 mapRes!13353))

(declare-fun b!354689 () Bool)

(assert (=> b!354689 (= e!217348 (and e!217347 mapRes!13353))))

(declare-fun condMapEmpty!13353 () Bool)

(declare-fun mapDefault!13353 () ValueCell!3605)

(assert (=> b!354689 (= condMapEmpty!13353 (= (arr!9174 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3605)) mapDefault!13353)))))

(declare-fun b!354690 () Bool)

(assert (=> b!354690 (= e!217346 (not true))))

(declare-fun minValue!1150 () V!11507)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11507)

(declare-datatypes ((tuple2!5644 0))(
  ( (tuple2!5645 (_1!2833 (_ BitVec 64)) (_2!2833 V!11507)) )
))
(declare-datatypes ((List!5284 0))(
  ( (Nil!5281) (Cons!5280 (h!6136 tuple2!5644) (t!10425 List!5284)) )
))
(declare-datatypes ((ListLongMap!4547 0))(
  ( (ListLongMap!4548 (toList!2289 List!5284)) )
))
(declare-fun contains!2379 (ListLongMap!4547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1794 (array!19359 array!19361 (_ BitVec 32) (_ BitVec 32) V!11507 V!11507 (_ BitVec 32) Int) ListLongMap!4547)

(assert (=> b!354690 (contains!2379 (getCurrentListMap!1794 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9173 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10924 0))(
  ( (Unit!10925) )
))
(declare-fun lt!165526 () Unit!10924)

(declare-fun lemmaValidKeyInArrayIsInListMap!186 (array!19359 array!19361 (_ BitVec 32) (_ BitVec 32) V!11507 V!11507 (_ BitVec 32) Int) Unit!10924)

(assert (=> b!354690 (= lt!165526 (lemmaValidKeyInArrayIsInListMap!186 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354691 () Bool)

(declare-fun res!196696 () Bool)

(assert (=> b!354691 (=> (not res!196696) (not e!217346))))

(assert (=> b!354691 (= res!196696 (validKeyInArray!0 (select (arr!9173 _keys!1456) from!1805)))))

(declare-fun b!354692 () Bool)

(declare-fun res!196697 () Bool)

(assert (=> b!354692 (=> (not res!196697) (not e!217346))))

(declare-datatypes ((List!5285 0))(
  ( (Nil!5282) (Cons!5281 (h!6137 (_ BitVec 64)) (t!10426 List!5285)) )
))
(declare-fun arrayNoDuplicates!0 (array!19359 (_ BitVec 32) List!5285) Bool)

(assert (=> b!354692 (= res!196697 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5282))))

(assert (= (and start!35430 res!196701) b!354687))

(assert (= (and b!354687 res!196698) b!354684))

(assert (= (and b!354684 res!196694) b!354692))

(assert (= (and b!354692 res!196697) b!354681))

(assert (= (and b!354681 res!196700) b!354683))

(assert (= (and b!354683 res!196699) b!354686))

(assert (= (and b!354686 res!196702) b!354682))

(assert (= (and b!354682 res!196695) b!354691))

(assert (= (and b!354691 res!196696) b!354690))

(assert (= (and b!354689 condMapEmpty!13353) mapIsEmpty!13353))

(assert (= (and b!354689 (not condMapEmpty!13353)) mapNonEmpty!13353))

(get-info :version)

(assert (= (and mapNonEmpty!13353 ((_ is ValueCellFull!3605) mapValue!13353)) b!354685))

(assert (= (and b!354689 ((_ is ValueCellFull!3605) mapDefault!13353)) b!354688))

(assert (= start!35430 b!354689))

(declare-fun m!353079 () Bool)

(assert (=> b!354682 m!353079))

(declare-fun m!353081 () Bool)

(assert (=> b!354681 m!353081))

(declare-fun m!353083 () Bool)

(assert (=> b!354692 m!353083))

(declare-fun m!353085 () Bool)

(assert (=> b!354684 m!353085))

(declare-fun m!353087 () Bool)

(assert (=> b!354686 m!353087))

(declare-fun m!353089 () Bool)

(assert (=> mapNonEmpty!13353 m!353089))

(assert (=> b!354691 m!353079))

(assert (=> b!354691 m!353079))

(declare-fun m!353091 () Bool)

(assert (=> b!354691 m!353091))

(declare-fun m!353093 () Bool)

(assert (=> start!35430 m!353093))

(declare-fun m!353095 () Bool)

(assert (=> start!35430 m!353095))

(declare-fun m!353097 () Bool)

(assert (=> start!35430 m!353097))

(declare-fun m!353099 () Bool)

(assert (=> b!354690 m!353099))

(assert (=> b!354690 m!353079))

(assert (=> b!354690 m!353099))

(assert (=> b!354690 m!353079))

(declare-fun m!353101 () Bool)

(assert (=> b!354690 m!353101))

(declare-fun m!353103 () Bool)

(assert (=> b!354690 m!353103))

(check-sat (not b_next!7831) (not start!35430) b_and!15047 (not b!354681) (not mapNonEmpty!13353) (not b!354691) (not b!354684) (not b!354690) tp_is_empty!7897 (not b!354686) (not b!354692))
(check-sat b_and!15047 (not b_next!7831))
