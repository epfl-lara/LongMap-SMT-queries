; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35464 () Bool)

(assert start!35464)

(declare-fun b_free!7851 () Bool)

(declare-fun b_next!7851 () Bool)

(assert (=> start!35464 (= b_free!7851 (not b_next!7851))))

(declare-fun tp!27338 () Bool)

(declare-fun b_and!15093 () Bool)

(assert (=> start!35464 (= tp!27338 b_and!15093)))

(declare-fun b!355317 () Bool)

(declare-fun e!217673 () Bool)

(assert (=> b!355317 (= e!217673 (not true))))

(declare-datatypes ((V!11533 0))(
  ( (V!11534 (val!4003 Int)) )
))
(declare-fun minValue!1150 () V!11533)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19413 0))(
  ( (array!19414 (arr!9200 (Array (_ BitVec 32) (_ BitVec 64))) (size!9552 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19413)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3615 0))(
  ( (ValueCellFull!3615 (v!6197 V!11533)) (EmptyCell!3615) )
))
(declare-datatypes ((array!19415 0))(
  ( (array!19416 (arr!9201 (Array (_ BitVec 32) ValueCell!3615)) (size!9553 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19415)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11533)

(declare-datatypes ((tuple2!5688 0))(
  ( (tuple2!5689 (_1!2855 (_ BitVec 64)) (_2!2855 V!11533)) )
))
(declare-datatypes ((List!5331 0))(
  ( (Nil!5328) (Cons!5327 (h!6183 tuple2!5688) (t!10481 List!5331)) )
))
(declare-datatypes ((ListLongMap!4601 0))(
  ( (ListLongMap!4602 (toList!2316 List!5331)) )
))
(declare-fun contains!2396 (ListLongMap!4601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1837 (array!19413 array!19415 (_ BitVec 32) (_ BitVec 32) V!11533 V!11533 (_ BitVec 32) Int) ListLongMap!4601)

(assert (=> b!355317 (contains!2396 (getCurrentListMap!1837 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9200 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10954 0))(
  ( (Unit!10955) )
))
(declare-fun lt!165791 () Unit!10954)

(declare-fun lemmaValidKeyInArrayIsInListMap!194 (array!19413 array!19415 (_ BitVec 32) (_ BitVec 32) V!11533 V!11533 (_ BitVec 32) Int) Unit!10954)

(assert (=> b!355317 (= lt!165791 (lemmaValidKeyInArrayIsInListMap!194 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355318 () Bool)

(declare-fun res!197100 () Bool)

(assert (=> b!355318 (=> (not res!197100) (not e!217673))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355318 (= res!197100 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13383 () Bool)

(declare-fun mapRes!13383 () Bool)

(declare-fun tp!27339 () Bool)

(declare-fun e!217672 () Bool)

(assert (=> mapNonEmpty!13383 (= mapRes!13383 (and tp!27339 e!217672))))

(declare-fun mapRest!13383 () (Array (_ BitVec 32) ValueCell!3615))

(declare-fun mapKey!13383 () (_ BitVec 32))

(declare-fun mapValue!13383 () ValueCell!3615)

(assert (=> mapNonEmpty!13383 (= (arr!9201 _values!1208) (store mapRest!13383 mapKey!13383 mapValue!13383))))

(declare-fun b!355319 () Bool)

(declare-fun res!197094 () Bool)

(assert (=> b!355319 (=> (not res!197094) (not e!217673))))

(assert (=> b!355319 (= res!197094 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9552 _keys!1456))))))

(declare-fun b!355320 () Bool)

(declare-fun e!217676 () Bool)

(declare-fun e!217675 () Bool)

(assert (=> b!355320 (= e!217676 (and e!217675 mapRes!13383))))

(declare-fun condMapEmpty!13383 () Bool)

(declare-fun mapDefault!13383 () ValueCell!3615)

(assert (=> b!355320 (= condMapEmpty!13383 (= (arr!9201 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3615)) mapDefault!13383)))))

(declare-fun b!355321 () Bool)

(declare-fun res!197097 () Bool)

(assert (=> b!355321 (=> (not res!197097) (not e!217673))))

(declare-datatypes ((List!5332 0))(
  ( (Nil!5329) (Cons!5328 (h!6184 (_ BitVec 64)) (t!10482 List!5332)) )
))
(declare-fun arrayNoDuplicates!0 (array!19413 (_ BitVec 32) List!5332) Bool)

(assert (=> b!355321 (= res!197097 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5329))))

(declare-fun b!355322 () Bool)

(declare-fun res!197101 () Bool)

(assert (=> b!355322 (=> (not res!197101) (not e!217673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19413 (_ BitVec 32)) Bool)

(assert (=> b!355322 (= res!197101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355323 () Bool)

(declare-fun res!197099 () Bool)

(assert (=> b!355323 (=> (not res!197099) (not e!217673))))

(declare-fun arrayContainsKey!0 (array!19413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355323 (= res!197099 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355324 () Bool)

(declare-fun tp_is_empty!7917 () Bool)

(assert (=> b!355324 (= e!217675 tp_is_empty!7917)))

(declare-fun b!355325 () Bool)

(declare-fun res!197098 () Bool)

(assert (=> b!355325 (=> (not res!197098) (not e!217673))))

(assert (=> b!355325 (= res!197098 (and (= (size!9553 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9552 _keys!1456) (size!9553 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13383 () Bool)

(assert (=> mapIsEmpty!13383 mapRes!13383))

(declare-fun res!197095 () Bool)

(assert (=> start!35464 (=> (not res!197095) (not e!217673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35464 (= res!197095 (validMask!0 mask!1842))))

(assert (=> start!35464 e!217673))

(assert (=> start!35464 tp_is_empty!7917))

(assert (=> start!35464 true))

(assert (=> start!35464 tp!27338))

(declare-fun array_inv!6758 (array!19413) Bool)

(assert (=> start!35464 (array_inv!6758 _keys!1456)))

(declare-fun array_inv!6759 (array!19415) Bool)

(assert (=> start!35464 (and (array_inv!6759 _values!1208) e!217676)))

(declare-fun b!355316 () Bool)

(assert (=> b!355316 (= e!217672 tp_is_empty!7917)))

(declare-fun b!355326 () Bool)

(declare-fun res!197096 () Bool)

(assert (=> b!355326 (=> (not res!197096) (not e!217673))))

(assert (=> b!355326 (= res!197096 (= (select (arr!9200 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355327 () Bool)

(declare-fun res!197093 () Bool)

(assert (=> b!355327 (=> (not res!197093) (not e!217673))))

(assert (=> b!355327 (= res!197093 (validKeyInArray!0 (select (arr!9200 _keys!1456) from!1805)))))

(assert (= (and start!35464 res!197095) b!355325))

(assert (= (and b!355325 res!197098) b!355322))

(assert (= (and b!355322 res!197101) b!355321))

(assert (= (and b!355321 res!197097) b!355318))

(assert (= (and b!355318 res!197100) b!355319))

(assert (= (and b!355319 res!197094) b!355323))

(assert (= (and b!355323 res!197099) b!355326))

(assert (= (and b!355326 res!197096) b!355327))

(assert (= (and b!355327 res!197093) b!355317))

(assert (= (and b!355320 condMapEmpty!13383) mapIsEmpty!13383))

(assert (= (and b!355320 (not condMapEmpty!13383)) mapNonEmpty!13383))

(get-info :version)

(assert (= (and mapNonEmpty!13383 ((_ is ValueCellFull!3615) mapValue!13383)) b!355316))

(assert (= (and b!355320 ((_ is ValueCellFull!3615) mapDefault!13383)) b!355324))

(assert (= start!35464 b!355320))

(declare-fun m!354069 () Bool)

(assert (=> b!355317 m!354069))

(declare-fun m!354071 () Bool)

(assert (=> b!355317 m!354071))

(assert (=> b!355317 m!354069))

(assert (=> b!355317 m!354071))

(declare-fun m!354073 () Bool)

(assert (=> b!355317 m!354073))

(declare-fun m!354075 () Bool)

(assert (=> b!355317 m!354075))

(declare-fun m!354077 () Bool)

(assert (=> b!355318 m!354077))

(declare-fun m!354079 () Bool)

(assert (=> start!35464 m!354079))

(declare-fun m!354081 () Bool)

(assert (=> start!35464 m!354081))

(declare-fun m!354083 () Bool)

(assert (=> start!35464 m!354083))

(assert (=> b!355326 m!354071))

(declare-fun m!354085 () Bool)

(assert (=> b!355323 m!354085))

(assert (=> b!355327 m!354071))

(assert (=> b!355327 m!354071))

(declare-fun m!354087 () Bool)

(assert (=> b!355327 m!354087))

(declare-fun m!354089 () Bool)

(assert (=> b!355321 m!354089))

(declare-fun m!354091 () Bool)

(assert (=> mapNonEmpty!13383 m!354091))

(declare-fun m!354093 () Bool)

(assert (=> b!355322 m!354093))

(check-sat b_and!15093 (not b!355323) tp_is_empty!7917 (not b_next!7851) (not b!355322) (not b!355318) (not b!355321) (not b!355317) (not b!355327) (not start!35464) (not mapNonEmpty!13383))
(check-sat b_and!15093 (not b_next!7851))
