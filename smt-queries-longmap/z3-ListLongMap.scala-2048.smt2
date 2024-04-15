; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35442 () Bool)

(assert start!35442)

(declare-fun b_free!7843 () Bool)

(declare-fun b_next!7843 () Bool)

(assert (=> start!35442 (= b_free!7843 (not b_next!7843))))

(declare-fun tp!27314 () Bool)

(declare-fun b_and!15059 () Bool)

(assert (=> start!35442 (= tp!27314 b_and!15059)))

(declare-fun b!354897 () Bool)

(declare-fun res!196860 () Bool)

(declare-fun e!217437 () Bool)

(assert (=> b!354897 (=> (not res!196860) (not e!217437))))

(declare-datatypes ((array!19383 0))(
  ( (array!19384 (arr!9185 (Array (_ BitVec 32) (_ BitVec 64))) (size!9538 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19383)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354897 (= res!196860 (= (select (arr!9185 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354898 () Bool)

(declare-fun res!196859 () Bool)

(assert (=> b!354898 (=> (not res!196859) (not e!217437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354898 (= res!196859 (validKeyInArray!0 (select (arr!9185 _keys!1456) from!1805)))))

(declare-fun b!354899 () Bool)

(declare-fun res!196857 () Bool)

(assert (=> b!354899 (=> (not res!196857) (not e!217437))))

(declare-fun arrayContainsKey!0 (array!19383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354899 (= res!196857 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13371 () Bool)

(declare-fun mapRes!13371 () Bool)

(declare-fun tp!27315 () Bool)

(declare-fun e!217436 () Bool)

(assert (=> mapNonEmpty!13371 (= mapRes!13371 (and tp!27315 e!217436))))

(declare-fun mapKey!13371 () (_ BitVec 32))

(declare-datatypes ((V!11523 0))(
  ( (V!11524 (val!3999 Int)) )
))
(declare-datatypes ((ValueCell!3611 0))(
  ( (ValueCellFull!3611 (v!6187 V!11523)) (EmptyCell!3611) )
))
(declare-datatypes ((array!19385 0))(
  ( (array!19386 (arr!9186 (Array (_ BitVec 32) ValueCell!3611)) (size!9539 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19385)

(declare-fun mapValue!13371 () ValueCell!3611)

(declare-fun mapRest!13371 () (Array (_ BitVec 32) ValueCell!3611))

(assert (=> mapNonEmpty!13371 (= (arr!9186 _values!1208) (store mapRest!13371 mapKey!13371 mapValue!13371))))

(declare-fun b!354901 () Bool)

(declare-fun res!196863 () Bool)

(assert (=> b!354901 (=> (not res!196863) (not e!217437))))

(assert (=> b!354901 (= res!196863 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9538 _keys!1456))))))

(declare-fun b!354902 () Bool)

(declare-fun res!196864 () Bool)

(assert (=> b!354902 (=> (not res!196864) (not e!217437))))

(assert (=> b!354902 (= res!196864 (validKeyInArray!0 k0!1077))))

(declare-fun b!354903 () Bool)

(declare-fun res!196858 () Bool)

(assert (=> b!354903 (=> (not res!196858) (not e!217437))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!354903 (= res!196858 (and (= (size!9539 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9538 _keys!1456) (size!9539 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354904 () Bool)

(declare-fun e!217438 () Bool)

(declare-fun tp_is_empty!7909 () Bool)

(assert (=> b!354904 (= e!217438 tp_is_empty!7909)))

(declare-fun b!354905 () Bool)

(declare-fun res!196856 () Bool)

(assert (=> b!354905 (=> (not res!196856) (not e!217437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19383 (_ BitVec 32)) Bool)

(assert (=> b!354905 (= res!196856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13371 () Bool)

(assert (=> mapIsEmpty!13371 mapRes!13371))

(declare-fun b!354906 () Bool)

(assert (=> b!354906 (= e!217437 (not true))))

(declare-fun minValue!1150 () V!11523)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11523)

(declare-datatypes ((tuple2!5654 0))(
  ( (tuple2!5655 (_1!2838 (_ BitVec 64)) (_2!2838 V!11523)) )
))
(declare-datatypes ((List!5295 0))(
  ( (Nil!5292) (Cons!5291 (h!6147 tuple2!5654) (t!10436 List!5295)) )
))
(declare-datatypes ((ListLongMap!4557 0))(
  ( (ListLongMap!4558 (toList!2294 List!5295)) )
))
(declare-fun contains!2384 (ListLongMap!4557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1799 (array!19383 array!19385 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) ListLongMap!4557)

(assert (=> b!354906 (contains!2384 (getCurrentListMap!1799 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9185 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10934 0))(
  ( (Unit!10935) )
))
(declare-fun lt!165544 () Unit!10934)

(declare-fun lemmaValidKeyInArrayIsInListMap!191 (array!19383 array!19385 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) Unit!10934)

(assert (=> b!354906 (= lt!165544 (lemmaValidKeyInArrayIsInListMap!191 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354900 () Bool)

(declare-fun e!217439 () Bool)

(assert (=> b!354900 (= e!217439 (and e!217438 mapRes!13371))))

(declare-fun condMapEmpty!13371 () Bool)

(declare-fun mapDefault!13371 () ValueCell!3611)

(assert (=> b!354900 (= condMapEmpty!13371 (= (arr!9186 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3611)) mapDefault!13371)))))

(declare-fun res!196861 () Bool)

(assert (=> start!35442 (=> (not res!196861) (not e!217437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35442 (= res!196861 (validMask!0 mask!1842))))

(assert (=> start!35442 e!217437))

(assert (=> start!35442 tp_is_empty!7909))

(assert (=> start!35442 true))

(assert (=> start!35442 tp!27314))

(declare-fun array_inv!6800 (array!19383) Bool)

(assert (=> start!35442 (array_inv!6800 _keys!1456)))

(declare-fun array_inv!6801 (array!19385) Bool)

(assert (=> start!35442 (and (array_inv!6801 _values!1208) e!217439)))

(declare-fun b!354907 () Bool)

(declare-fun res!196862 () Bool)

(assert (=> b!354907 (=> (not res!196862) (not e!217437))))

(declare-datatypes ((List!5296 0))(
  ( (Nil!5293) (Cons!5292 (h!6148 (_ BitVec 64)) (t!10437 List!5296)) )
))
(declare-fun arrayNoDuplicates!0 (array!19383 (_ BitVec 32) List!5296) Bool)

(assert (=> b!354907 (= res!196862 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5293))))

(declare-fun b!354908 () Bool)

(assert (=> b!354908 (= e!217436 tp_is_empty!7909)))

(assert (= (and start!35442 res!196861) b!354903))

(assert (= (and b!354903 res!196858) b!354905))

(assert (= (and b!354905 res!196856) b!354907))

(assert (= (and b!354907 res!196862) b!354902))

(assert (= (and b!354902 res!196864) b!354901))

(assert (= (and b!354901 res!196863) b!354899))

(assert (= (and b!354899 res!196857) b!354897))

(assert (= (and b!354897 res!196860) b!354898))

(assert (= (and b!354898 res!196859) b!354906))

(assert (= (and b!354900 condMapEmpty!13371) mapIsEmpty!13371))

(assert (= (and b!354900 (not condMapEmpty!13371)) mapNonEmpty!13371))

(get-info :version)

(assert (= (and mapNonEmpty!13371 ((_ is ValueCellFull!3611) mapValue!13371)) b!354908))

(assert (= (and b!354900 ((_ is ValueCellFull!3611) mapDefault!13371)) b!354904))

(assert (= start!35442 b!354900))

(declare-fun m!353235 () Bool)

(assert (=> b!354905 m!353235))

(declare-fun m!353237 () Bool)

(assert (=> b!354902 m!353237))

(declare-fun m!353239 () Bool)

(assert (=> b!354906 m!353239))

(declare-fun m!353241 () Bool)

(assert (=> b!354906 m!353241))

(assert (=> b!354906 m!353239))

(assert (=> b!354906 m!353241))

(declare-fun m!353243 () Bool)

(assert (=> b!354906 m!353243))

(declare-fun m!353245 () Bool)

(assert (=> b!354906 m!353245))

(declare-fun m!353247 () Bool)

(assert (=> mapNonEmpty!13371 m!353247))

(declare-fun m!353249 () Bool)

(assert (=> b!354899 m!353249))

(declare-fun m!353251 () Bool)

(assert (=> b!354907 m!353251))

(assert (=> b!354898 m!353241))

(assert (=> b!354898 m!353241))

(declare-fun m!353253 () Bool)

(assert (=> b!354898 m!353253))

(assert (=> b!354897 m!353241))

(declare-fun m!353255 () Bool)

(assert (=> start!35442 m!353255))

(declare-fun m!353257 () Bool)

(assert (=> start!35442 m!353257))

(declare-fun m!353259 () Bool)

(assert (=> start!35442 m!353259))

(check-sat tp_is_empty!7909 (not b!354899) (not b!354905) (not b!354902) b_and!15059 (not start!35442) (not b!354907) (not b_next!7843) (not b!354898) (not mapNonEmpty!13371) (not b!354906))
(check-sat b_and!15059 (not b_next!7843))
