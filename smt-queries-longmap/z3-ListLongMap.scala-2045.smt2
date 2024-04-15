; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35424 () Bool)

(assert start!35424)

(declare-fun b_free!7825 () Bool)

(declare-fun b_next!7825 () Bool)

(assert (=> start!35424 (= b_free!7825 (not b_next!7825))))

(declare-fun tp!27261 () Bool)

(declare-fun b_and!15041 () Bool)

(assert (=> start!35424 (= tp!27261 b_and!15041)))

(declare-fun b!354573 () Bool)

(declare-fun res!196621 () Bool)

(declare-fun e!217305 () Bool)

(assert (=> b!354573 (=> (not res!196621) (not e!217305))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19347 0))(
  ( (array!19348 (arr!9167 (Array (_ BitVec 32) (_ BitVec 64))) (size!9520 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19347)

(assert (=> b!354573 (= res!196621 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9520 _keys!1456))))))

(declare-fun b!354574 () Bool)

(assert (=> b!354574 (= e!217305 (not true))))

(declare-datatypes ((V!11499 0))(
  ( (V!11500 (val!3990 Int)) )
))
(declare-fun minValue!1150 () V!11499)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3602 0))(
  ( (ValueCellFull!3602 (v!6178 V!11499)) (EmptyCell!3602) )
))
(declare-datatypes ((array!19349 0))(
  ( (array!19350 (arr!9168 (Array (_ BitVec 32) ValueCell!3602)) (size!9521 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19349)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11499)

(declare-datatypes ((tuple2!5642 0))(
  ( (tuple2!5643 (_1!2832 (_ BitVec 64)) (_2!2832 V!11499)) )
))
(declare-datatypes ((List!5281 0))(
  ( (Nil!5278) (Cons!5277 (h!6133 tuple2!5642) (t!10422 List!5281)) )
))
(declare-datatypes ((ListLongMap!4545 0))(
  ( (ListLongMap!4546 (toList!2288 List!5281)) )
))
(declare-fun contains!2378 (ListLongMap!4545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1793 (array!19347 array!19349 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) ListLongMap!4545)

(assert (=> b!354574 (contains!2378 (getCurrentListMap!1793 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9167 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10922 0))(
  ( (Unit!10923) )
))
(declare-fun lt!165517 () Unit!10922)

(declare-fun lemmaValidKeyInArrayIsInListMap!185 (array!19347 array!19349 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) Unit!10922)

(assert (=> b!354574 (= lt!165517 (lemmaValidKeyInArrayIsInListMap!185 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354575 () Bool)

(declare-fun e!217303 () Bool)

(declare-fun e!217301 () Bool)

(declare-fun mapRes!13344 () Bool)

(assert (=> b!354575 (= e!217303 (and e!217301 mapRes!13344))))

(declare-fun condMapEmpty!13344 () Bool)

(declare-fun mapDefault!13344 () ValueCell!3602)

(assert (=> b!354575 (= condMapEmpty!13344 (= (arr!9168 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3602)) mapDefault!13344)))))

(declare-fun mapIsEmpty!13344 () Bool)

(assert (=> mapIsEmpty!13344 mapRes!13344))

(declare-fun b!354576 () Bool)

(declare-fun res!196618 () Bool)

(assert (=> b!354576 (=> (not res!196618) (not e!217305))))

(declare-datatypes ((List!5282 0))(
  ( (Nil!5279) (Cons!5278 (h!6134 (_ BitVec 64)) (t!10423 List!5282)) )
))
(declare-fun arrayNoDuplicates!0 (array!19347 (_ BitVec 32) List!5282) Bool)

(assert (=> b!354576 (= res!196618 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5279))))

(declare-fun mapNonEmpty!13344 () Bool)

(declare-fun tp!27260 () Bool)

(declare-fun e!217302 () Bool)

(assert (=> mapNonEmpty!13344 (= mapRes!13344 (and tp!27260 e!217302))))

(declare-fun mapValue!13344 () ValueCell!3602)

(declare-fun mapKey!13344 () (_ BitVec 32))

(declare-fun mapRest!13344 () (Array (_ BitVec 32) ValueCell!3602))

(assert (=> mapNonEmpty!13344 (= (arr!9168 _values!1208) (store mapRest!13344 mapKey!13344 mapValue!13344))))

(declare-fun b!354577 () Bool)

(declare-fun res!196617 () Bool)

(assert (=> b!354577 (=> (not res!196617) (not e!217305))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354577 (= res!196617 (= (select (arr!9167 _keys!1456) from!1805) k0!1077))))

(declare-fun res!196614 () Bool)

(assert (=> start!35424 (=> (not res!196614) (not e!217305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35424 (= res!196614 (validMask!0 mask!1842))))

(assert (=> start!35424 e!217305))

(declare-fun tp_is_empty!7891 () Bool)

(assert (=> start!35424 tp_is_empty!7891))

(assert (=> start!35424 true))

(assert (=> start!35424 tp!27261))

(declare-fun array_inv!6788 (array!19347) Bool)

(assert (=> start!35424 (array_inv!6788 _keys!1456)))

(declare-fun array_inv!6789 (array!19349) Bool)

(assert (=> start!35424 (and (array_inv!6789 _values!1208) e!217303)))

(declare-fun b!354578 () Bool)

(declare-fun res!196616 () Bool)

(assert (=> b!354578 (=> (not res!196616) (not e!217305))))

(declare-fun arrayContainsKey!0 (array!19347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354578 (= res!196616 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354579 () Bool)

(declare-fun res!196619 () Bool)

(assert (=> b!354579 (=> (not res!196619) (not e!217305))))

(assert (=> b!354579 (= res!196619 (and (= (size!9521 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9520 _keys!1456) (size!9521 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354580 () Bool)

(assert (=> b!354580 (= e!217302 tp_is_empty!7891)))

(declare-fun b!354581 () Bool)

(assert (=> b!354581 (= e!217301 tp_is_empty!7891)))

(declare-fun b!354582 () Bool)

(declare-fun res!196613 () Bool)

(assert (=> b!354582 (=> (not res!196613) (not e!217305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19347 (_ BitVec 32)) Bool)

(assert (=> b!354582 (= res!196613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354583 () Bool)

(declare-fun res!196620 () Bool)

(assert (=> b!354583 (=> (not res!196620) (not e!217305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354583 (= res!196620 (validKeyInArray!0 (select (arr!9167 _keys!1456) from!1805)))))

(declare-fun b!354584 () Bool)

(declare-fun res!196615 () Bool)

(assert (=> b!354584 (=> (not res!196615) (not e!217305))))

(assert (=> b!354584 (= res!196615 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35424 res!196614) b!354579))

(assert (= (and b!354579 res!196619) b!354582))

(assert (= (and b!354582 res!196613) b!354576))

(assert (= (and b!354576 res!196618) b!354584))

(assert (= (and b!354584 res!196615) b!354573))

(assert (= (and b!354573 res!196621) b!354578))

(assert (= (and b!354578 res!196616) b!354577))

(assert (= (and b!354577 res!196617) b!354583))

(assert (= (and b!354583 res!196620) b!354574))

(assert (= (and b!354575 condMapEmpty!13344) mapIsEmpty!13344))

(assert (= (and b!354575 (not condMapEmpty!13344)) mapNonEmpty!13344))

(get-info :version)

(assert (= (and mapNonEmpty!13344 ((_ is ValueCellFull!3602) mapValue!13344)) b!354580))

(assert (= (and b!354575 ((_ is ValueCellFull!3602) mapDefault!13344)) b!354581))

(assert (= start!35424 b!354575))

(declare-fun m!353001 () Bool)

(assert (=> b!354583 m!353001))

(assert (=> b!354583 m!353001))

(declare-fun m!353003 () Bool)

(assert (=> b!354583 m!353003))

(assert (=> b!354577 m!353001))

(declare-fun m!353005 () Bool)

(assert (=> b!354582 m!353005))

(declare-fun m!353007 () Bool)

(assert (=> b!354578 m!353007))

(declare-fun m!353009 () Bool)

(assert (=> mapNonEmpty!13344 m!353009))

(declare-fun m!353011 () Bool)

(assert (=> b!354574 m!353011))

(assert (=> b!354574 m!353001))

(assert (=> b!354574 m!353011))

(assert (=> b!354574 m!353001))

(declare-fun m!353013 () Bool)

(assert (=> b!354574 m!353013))

(declare-fun m!353015 () Bool)

(assert (=> b!354574 m!353015))

(declare-fun m!353017 () Bool)

(assert (=> b!354584 m!353017))

(declare-fun m!353019 () Bool)

(assert (=> start!35424 m!353019))

(declare-fun m!353021 () Bool)

(assert (=> start!35424 m!353021))

(declare-fun m!353023 () Bool)

(assert (=> start!35424 m!353023))

(declare-fun m!353025 () Bool)

(assert (=> b!354576 m!353025))

(check-sat (not b!354576) (not start!35424) (not b!354574) b_and!15041 (not b!354583) (not b!354584) (not b_next!7825) (not b!354582) tp_is_empty!7891 (not b!354578) (not mapNonEmpty!13344))
(check-sat b_and!15041 (not b_next!7825))
