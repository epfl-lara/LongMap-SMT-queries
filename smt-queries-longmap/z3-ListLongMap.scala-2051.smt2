; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35460 () Bool)

(assert start!35460)

(declare-fun b_free!7861 () Bool)

(declare-fun b_next!7861 () Bool)

(assert (=> start!35460 (= b_free!7861 (not b_next!7861))))

(declare-fun tp!27368 () Bool)

(declare-fun b_and!15117 () Bool)

(assert (=> start!35460 (= tp!27368 b_and!15117)))

(declare-fun b!355443 () Bool)

(declare-fun res!197233 () Bool)

(declare-fun e!217717 () Bool)

(assert (=> b!355443 (=> (not res!197233) (not e!217717))))

(declare-datatypes ((array!19424 0))(
  ( (array!19425 (arr!9205 (Array (_ BitVec 32) (_ BitVec 64))) (size!9557 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19424)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19424 (_ BitVec 32)) Bool)

(assert (=> b!355443 (= res!197233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13398 () Bool)

(declare-fun mapRes!13398 () Bool)

(declare-fun tp!27369 () Bool)

(declare-fun e!217715 () Bool)

(assert (=> mapNonEmpty!13398 (= mapRes!13398 (and tp!27369 e!217715))))

(declare-fun mapKey!13398 () (_ BitVec 32))

(declare-datatypes ((V!11547 0))(
  ( (V!11548 (val!4008 Int)) )
))
(declare-datatypes ((ValueCell!3620 0))(
  ( (ValueCellFull!3620 (v!6203 V!11547)) (EmptyCell!3620) )
))
(declare-fun mapValue!13398 () ValueCell!3620)

(declare-fun mapRest!13398 () (Array (_ BitVec 32) ValueCell!3620))

(declare-datatypes ((array!19426 0))(
  ( (array!19427 (arr!9206 (Array (_ BitVec 32) ValueCell!3620)) (size!9558 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19426)

(assert (=> mapNonEmpty!13398 (= (arr!9206 _values!1208) (store mapRest!13398 mapKey!13398 mapValue!13398))))

(declare-fun b!355444 () Bool)

(declare-fun tp_is_empty!7927 () Bool)

(assert (=> b!355444 (= e!217715 tp_is_empty!7927)))

(declare-fun b!355445 () Bool)

(declare-fun res!197226 () Bool)

(assert (=> b!355445 (=> (not res!197226) (not e!217717))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355445 (= res!197226 (validKeyInArray!0 (select (arr!9205 _keys!1456) from!1805)))))

(declare-fun mapIsEmpty!13398 () Bool)

(assert (=> mapIsEmpty!13398 mapRes!13398))

(declare-fun b!355446 () Bool)

(declare-fun res!197225 () Bool)

(assert (=> b!355446 (=> (not res!197225) (not e!217717))))

(assert (=> b!355446 (= res!197225 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9557 _keys!1456))))))

(declare-fun b!355447 () Bool)

(assert (=> b!355447 (= e!217717 (not (bvsle #b00000000000000000000000000000000 (size!9557 _keys!1456))))))

(declare-fun minValue!1150 () V!11547)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11547)

(declare-datatypes ((tuple2!5610 0))(
  ( (tuple2!5611 (_1!2816 (_ BitVec 64)) (_2!2816 V!11547)) )
))
(declare-datatypes ((List!5247 0))(
  ( (Nil!5244) (Cons!5243 (h!6099 tuple2!5610) (t!10389 List!5247)) )
))
(declare-datatypes ((ListLongMap!4525 0))(
  ( (ListLongMap!4526 (toList!2278 List!5247)) )
))
(declare-fun contains!2377 (ListLongMap!4525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1806 (array!19424 array!19426 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) ListLongMap!4525)

(assert (=> b!355447 (contains!2377 (getCurrentListMap!1806 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9205 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10941 0))(
  ( (Unit!10942) )
))
(declare-fun lt!165824 () Unit!10941)

(declare-fun lemmaValidKeyInArrayIsInListMap!196 (array!19424 array!19426 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) Unit!10941)

(assert (=> b!355447 (= lt!165824 (lemmaValidKeyInArrayIsInListMap!196 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355449 () Bool)

(declare-fun res!197229 () Bool)

(assert (=> b!355449 (=> (not res!197229) (not e!217717))))

(assert (=> b!355449 (= res!197229 (and (= (size!9558 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9557 _keys!1456) (size!9558 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355450 () Bool)

(declare-fun res!197228 () Bool)

(assert (=> b!355450 (=> (not res!197228) (not e!217717))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355450 (= res!197228 (validKeyInArray!0 k0!1077))))

(declare-fun b!355451 () Bool)

(declare-fun res!197227 () Bool)

(assert (=> b!355451 (=> (not res!197227) (not e!217717))))

(declare-fun arrayContainsKey!0 (array!19424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355451 (= res!197227 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355452 () Bool)

(declare-fun e!217713 () Bool)

(declare-fun e!217716 () Bool)

(assert (=> b!355452 (= e!217713 (and e!217716 mapRes!13398))))

(declare-fun condMapEmpty!13398 () Bool)

(declare-fun mapDefault!13398 () ValueCell!3620)

(assert (=> b!355452 (= condMapEmpty!13398 (= (arr!9206 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3620)) mapDefault!13398)))))

(declare-fun b!355453 () Bool)

(assert (=> b!355453 (= e!217716 tp_is_empty!7927)))

(declare-fun b!355454 () Bool)

(declare-fun res!197230 () Bool)

(assert (=> b!355454 (=> (not res!197230) (not e!217717))))

(assert (=> b!355454 (= res!197230 (= (select (arr!9205 _keys!1456) from!1805) k0!1077))))

(declare-fun res!197231 () Bool)

(assert (=> start!35460 (=> (not res!197231) (not e!217717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35460 (= res!197231 (validMask!0 mask!1842))))

(assert (=> start!35460 e!217717))

(assert (=> start!35460 tp_is_empty!7927))

(assert (=> start!35460 true))

(assert (=> start!35460 tp!27368))

(declare-fun array_inv!6804 (array!19424) Bool)

(assert (=> start!35460 (array_inv!6804 _keys!1456)))

(declare-fun array_inv!6805 (array!19426) Bool)

(assert (=> start!35460 (and (array_inv!6805 _values!1208) e!217713)))

(declare-fun b!355448 () Bool)

(declare-fun res!197232 () Bool)

(assert (=> b!355448 (=> (not res!197232) (not e!217717))))

(declare-datatypes ((List!5248 0))(
  ( (Nil!5245) (Cons!5244 (h!6100 (_ BitVec 64)) (t!10390 List!5248)) )
))
(declare-fun arrayNoDuplicates!0 (array!19424 (_ BitVec 32) List!5248) Bool)

(assert (=> b!355448 (= res!197232 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5245))))

(assert (= (and start!35460 res!197231) b!355449))

(assert (= (and b!355449 res!197229) b!355443))

(assert (= (and b!355443 res!197233) b!355448))

(assert (= (and b!355448 res!197232) b!355450))

(assert (= (and b!355450 res!197228) b!355446))

(assert (= (and b!355446 res!197225) b!355451))

(assert (= (and b!355451 res!197227) b!355454))

(assert (= (and b!355454 res!197230) b!355445))

(assert (= (and b!355445 res!197226) b!355447))

(assert (= (and b!355452 condMapEmpty!13398) mapIsEmpty!13398))

(assert (= (and b!355452 (not condMapEmpty!13398)) mapNonEmpty!13398))

(get-info :version)

(assert (= (and mapNonEmpty!13398 ((_ is ValueCellFull!3620) mapValue!13398)) b!355444))

(assert (= (and b!355452 ((_ is ValueCellFull!3620) mapDefault!13398)) b!355453))

(assert (= start!35460 b!355452))

(declare-fun m!354423 () Bool)

(assert (=> mapNonEmpty!13398 m!354423))

(declare-fun m!354425 () Bool)

(assert (=> b!355454 m!354425))

(declare-fun m!354427 () Bool)

(assert (=> start!35460 m!354427))

(declare-fun m!354429 () Bool)

(assert (=> start!35460 m!354429))

(declare-fun m!354431 () Bool)

(assert (=> start!35460 m!354431))

(declare-fun m!354433 () Bool)

(assert (=> b!355443 m!354433))

(assert (=> b!355445 m!354425))

(assert (=> b!355445 m!354425))

(declare-fun m!354435 () Bool)

(assert (=> b!355445 m!354435))

(declare-fun m!354437 () Bool)

(assert (=> b!355448 m!354437))

(declare-fun m!354439 () Bool)

(assert (=> b!355447 m!354439))

(assert (=> b!355447 m!354425))

(assert (=> b!355447 m!354439))

(assert (=> b!355447 m!354425))

(declare-fun m!354441 () Bool)

(assert (=> b!355447 m!354441))

(declare-fun m!354443 () Bool)

(assert (=> b!355447 m!354443))

(declare-fun m!354445 () Bool)

(assert (=> b!355450 m!354445))

(declare-fun m!354447 () Bool)

(assert (=> b!355451 m!354447))

(check-sat (not b!355451) tp_is_empty!7927 (not start!35460) b_and!15117 (not b!355450) (not b_next!7861) (not b!355447) (not b!355448) (not mapNonEmpty!13398) (not b!355445) (not b!355443))
(check-sat b_and!15117 (not b_next!7861))
