; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35452 () Bool)

(assert start!35452)

(declare-fun b_free!7839 () Bool)

(declare-fun b_next!7839 () Bool)

(assert (=> start!35452 (= b_free!7839 (not b_next!7839))))

(declare-fun tp!27303 () Bool)

(declare-fun b_and!15081 () Bool)

(assert (=> start!35452 (= tp!27303 b_and!15081)))

(declare-fun res!196939 () Bool)

(declare-fun e!217582 () Bool)

(assert (=> start!35452 (=> (not res!196939) (not e!217582))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35452 (= res!196939 (validMask!0 mask!1842))))

(assert (=> start!35452 e!217582))

(declare-fun tp_is_empty!7905 () Bool)

(assert (=> start!35452 tp_is_empty!7905))

(assert (=> start!35452 true))

(assert (=> start!35452 tp!27303))

(declare-datatypes ((array!19389 0))(
  ( (array!19390 (arr!9188 (Array (_ BitVec 32) (_ BitVec 64))) (size!9540 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19389)

(declare-fun array_inv!6752 (array!19389) Bool)

(assert (=> start!35452 (array_inv!6752 _keys!1456)))

(declare-datatypes ((V!11517 0))(
  ( (V!11518 (val!3997 Int)) )
))
(declare-datatypes ((ValueCell!3609 0))(
  ( (ValueCellFull!3609 (v!6191 V!11517)) (EmptyCell!3609) )
))
(declare-datatypes ((array!19391 0))(
  ( (array!19392 (arr!9189 (Array (_ BitVec 32) ValueCell!3609)) (size!9541 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19391)

(declare-fun e!217583 () Bool)

(declare-fun array_inv!6753 (array!19391) Bool)

(assert (=> start!35452 (and (array_inv!6753 _values!1208) e!217583)))

(declare-fun b!355100 () Bool)

(declare-fun res!196931 () Bool)

(assert (=> b!355100 (=> (not res!196931) (not e!217582))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355100 (= res!196931 (validKeyInArray!0 k0!1077))))

(declare-fun b!355101 () Bool)

(assert (=> b!355101 (= e!217582 (not true))))

(declare-fun minValue!1150 () V!11517)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11517)

(declare-datatypes ((tuple2!5678 0))(
  ( (tuple2!5679 (_1!2850 (_ BitVec 64)) (_2!2850 V!11517)) )
))
(declare-datatypes ((List!5322 0))(
  ( (Nil!5319) (Cons!5318 (h!6174 tuple2!5678) (t!10472 List!5322)) )
))
(declare-datatypes ((ListLongMap!4591 0))(
  ( (ListLongMap!4592 (toList!2311 List!5322)) )
))
(declare-fun contains!2391 (ListLongMap!4591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1832 (array!19389 array!19391 (_ BitVec 32) (_ BitVec 32) V!11517 V!11517 (_ BitVec 32) Int) ListLongMap!4591)

(assert (=> b!355101 (contains!2391 (getCurrentListMap!1832 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9188 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10944 0))(
  ( (Unit!10945) )
))
(declare-fun lt!165773 () Unit!10944)

(declare-fun lemmaValidKeyInArrayIsInListMap!189 (array!19389 array!19391 (_ BitVec 32) (_ BitVec 32) V!11517 V!11517 (_ BitVec 32) Int) Unit!10944)

(assert (=> b!355101 (= lt!165773 (lemmaValidKeyInArrayIsInListMap!189 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355102 () Bool)

(declare-fun e!217585 () Bool)

(assert (=> b!355102 (= e!217585 tp_is_empty!7905)))

(declare-fun b!355103 () Bool)

(declare-fun res!196938 () Bool)

(assert (=> b!355103 (=> (not res!196938) (not e!217582))))

(assert (=> b!355103 (= res!196938 (and (= (size!9541 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9540 _keys!1456) (size!9541 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355104 () Bool)

(declare-fun res!196932 () Bool)

(assert (=> b!355104 (=> (not res!196932) (not e!217582))))

(assert (=> b!355104 (= res!196932 (= (select (arr!9188 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355105 () Bool)

(declare-fun res!196936 () Bool)

(assert (=> b!355105 (=> (not res!196936) (not e!217582))))

(assert (=> b!355105 (= res!196936 (validKeyInArray!0 (select (arr!9188 _keys!1456) from!1805)))))

(declare-fun b!355106 () Bool)

(declare-fun res!196934 () Bool)

(assert (=> b!355106 (=> (not res!196934) (not e!217582))))

(declare-fun arrayContainsKey!0 (array!19389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355106 (= res!196934 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355107 () Bool)

(declare-fun e!217586 () Bool)

(declare-fun mapRes!13365 () Bool)

(assert (=> b!355107 (= e!217583 (and e!217586 mapRes!13365))))

(declare-fun condMapEmpty!13365 () Bool)

(declare-fun mapDefault!13365 () ValueCell!3609)

(assert (=> b!355107 (= condMapEmpty!13365 (= (arr!9189 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3609)) mapDefault!13365)))))

(declare-fun b!355108 () Bool)

(assert (=> b!355108 (= e!217586 tp_is_empty!7905)))

(declare-fun mapIsEmpty!13365 () Bool)

(assert (=> mapIsEmpty!13365 mapRes!13365))

(declare-fun mapNonEmpty!13365 () Bool)

(declare-fun tp!27302 () Bool)

(assert (=> mapNonEmpty!13365 (= mapRes!13365 (and tp!27302 e!217585))))

(declare-fun mapRest!13365 () (Array (_ BitVec 32) ValueCell!3609))

(declare-fun mapValue!13365 () ValueCell!3609)

(declare-fun mapKey!13365 () (_ BitVec 32))

(assert (=> mapNonEmpty!13365 (= (arr!9189 _values!1208) (store mapRest!13365 mapKey!13365 mapValue!13365))))

(declare-fun b!355109 () Bool)

(declare-fun res!196935 () Bool)

(assert (=> b!355109 (=> (not res!196935) (not e!217582))))

(declare-datatypes ((List!5323 0))(
  ( (Nil!5320) (Cons!5319 (h!6175 (_ BitVec 64)) (t!10473 List!5323)) )
))
(declare-fun arrayNoDuplicates!0 (array!19389 (_ BitVec 32) List!5323) Bool)

(assert (=> b!355109 (= res!196935 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5320))))

(declare-fun b!355110 () Bool)

(declare-fun res!196933 () Bool)

(assert (=> b!355110 (=> (not res!196933) (not e!217582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19389 (_ BitVec 32)) Bool)

(assert (=> b!355110 (= res!196933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355111 () Bool)

(declare-fun res!196937 () Bool)

(assert (=> b!355111 (=> (not res!196937) (not e!217582))))

(assert (=> b!355111 (= res!196937 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9540 _keys!1456))))))

(assert (= (and start!35452 res!196939) b!355103))

(assert (= (and b!355103 res!196938) b!355110))

(assert (= (and b!355110 res!196933) b!355109))

(assert (= (and b!355109 res!196935) b!355100))

(assert (= (and b!355100 res!196931) b!355111))

(assert (= (and b!355111 res!196937) b!355106))

(assert (= (and b!355106 res!196934) b!355104))

(assert (= (and b!355104 res!196932) b!355105))

(assert (= (and b!355105 res!196936) b!355101))

(assert (= (and b!355107 condMapEmpty!13365) mapIsEmpty!13365))

(assert (= (and b!355107 (not condMapEmpty!13365)) mapNonEmpty!13365))

(get-info :version)

(assert (= (and mapNonEmpty!13365 ((_ is ValueCellFull!3609) mapValue!13365)) b!355102))

(assert (= (and b!355107 ((_ is ValueCellFull!3609) mapDefault!13365)) b!355108))

(assert (= start!35452 b!355107))

(declare-fun m!353913 () Bool)

(assert (=> start!35452 m!353913))

(declare-fun m!353915 () Bool)

(assert (=> start!35452 m!353915))

(declare-fun m!353917 () Bool)

(assert (=> start!35452 m!353917))

(declare-fun m!353919 () Bool)

(assert (=> b!355100 m!353919))

(declare-fun m!353921 () Bool)

(assert (=> b!355104 m!353921))

(declare-fun m!353923 () Bool)

(assert (=> b!355101 m!353923))

(assert (=> b!355101 m!353921))

(assert (=> b!355101 m!353923))

(assert (=> b!355101 m!353921))

(declare-fun m!353925 () Bool)

(assert (=> b!355101 m!353925))

(declare-fun m!353927 () Bool)

(assert (=> b!355101 m!353927))

(declare-fun m!353929 () Bool)

(assert (=> mapNonEmpty!13365 m!353929))

(assert (=> b!355105 m!353921))

(assert (=> b!355105 m!353921))

(declare-fun m!353931 () Bool)

(assert (=> b!355105 m!353931))

(declare-fun m!353933 () Bool)

(assert (=> b!355110 m!353933))

(declare-fun m!353935 () Bool)

(assert (=> b!355109 m!353935))

(declare-fun m!353937 () Bool)

(assert (=> b!355106 m!353937))

(check-sat (not b!355110) (not b!355106) (not b!355100) (not b_next!7839) tp_is_empty!7905 (not b!355101) b_and!15081 (not start!35452) (not mapNonEmpty!13365) (not b!355105) (not b!355109))
(check-sat b_and!15081 (not b_next!7839))
