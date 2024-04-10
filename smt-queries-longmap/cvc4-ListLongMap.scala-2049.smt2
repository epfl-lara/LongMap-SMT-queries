; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35466 () Bool)

(assert start!35466)

(declare-fun b_free!7853 () Bool)

(declare-fun b_next!7853 () Bool)

(assert (=> start!35466 (= b_free!7853 (not b_next!7853))))

(declare-fun tp!27345 () Bool)

(declare-fun b_and!15095 () Bool)

(assert (=> start!35466 (= tp!27345 b_and!15095)))

(declare-fun b!355352 () Bool)

(declare-fun e!217687 () Bool)

(assert (=> b!355352 (= e!217687 (not true))))

(declare-datatypes ((V!11535 0))(
  ( (V!11536 (val!4004 Int)) )
))
(declare-fun minValue!1150 () V!11535)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19417 0))(
  ( (array!19418 (arr!9202 (Array (_ BitVec 32) (_ BitVec 64))) (size!9554 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19417)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11535)

(declare-datatypes ((ValueCell!3616 0))(
  ( (ValueCellFull!3616 (v!6198 V!11535)) (EmptyCell!3616) )
))
(declare-datatypes ((array!19419 0))(
  ( (array!19420 (arr!9203 (Array (_ BitVec 32) ValueCell!3616)) (size!9555 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19419)

(declare-datatypes ((tuple2!5690 0))(
  ( (tuple2!5691 (_1!2856 (_ BitVec 64)) (_2!2856 V!11535)) )
))
(declare-datatypes ((List!5333 0))(
  ( (Nil!5330) (Cons!5329 (h!6185 tuple2!5690) (t!10483 List!5333)) )
))
(declare-datatypes ((ListLongMap!4603 0))(
  ( (ListLongMap!4604 (toList!2317 List!5333)) )
))
(declare-fun contains!2397 (ListLongMap!4603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1838 (array!19417 array!19419 (_ BitVec 32) (_ BitVec 32) V!11535 V!11535 (_ BitVec 32) Int) ListLongMap!4603)

(assert (=> b!355352 (contains!2397 (getCurrentListMap!1838 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9202 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10956 0))(
  ( (Unit!10957) )
))
(declare-fun lt!165794 () Unit!10956)

(declare-fun lemmaValidKeyInArrayIsInListMap!195 (array!19417 array!19419 (_ BitVec 32) (_ BitVec 32) V!11535 V!11535 (_ BitVec 32) Int) Unit!10956)

(assert (=> b!355352 (= lt!165794 (lemmaValidKeyInArrayIsInListMap!195 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355353 () Bool)

(declare-fun res!197127 () Bool)

(assert (=> b!355353 (=> (not res!197127) (not e!217687))))

(declare-datatypes ((List!5334 0))(
  ( (Nil!5331) (Cons!5330 (h!6186 (_ BitVec 64)) (t!10484 List!5334)) )
))
(declare-fun arrayNoDuplicates!0 (array!19417 (_ BitVec 32) List!5334) Bool)

(assert (=> b!355353 (= res!197127 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5331))))

(declare-fun b!355354 () Bool)

(declare-fun res!197120 () Bool)

(assert (=> b!355354 (=> (not res!197120) (not e!217687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355354 (= res!197120 (validKeyInArray!0 (select (arr!9202 _keys!1456) from!1805)))))

(declare-fun b!355355 () Bool)

(declare-fun res!197126 () Bool)

(assert (=> b!355355 (=> (not res!197126) (not e!217687))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!355355 (= res!197126 (validKeyInArray!0 k!1077))))

(declare-fun res!197122 () Bool)

(assert (=> start!35466 (=> (not res!197122) (not e!217687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35466 (= res!197122 (validMask!0 mask!1842))))

(assert (=> start!35466 e!217687))

(declare-fun tp_is_empty!7919 () Bool)

(assert (=> start!35466 tp_is_empty!7919))

(assert (=> start!35466 true))

(assert (=> start!35466 tp!27345))

(declare-fun array_inv!6760 (array!19417) Bool)

(assert (=> start!35466 (array_inv!6760 _keys!1456)))

(declare-fun e!217691 () Bool)

(declare-fun array_inv!6761 (array!19419) Bool)

(assert (=> start!35466 (and (array_inv!6761 _values!1208) e!217691)))

(declare-fun b!355356 () Bool)

(declare-fun res!197121 () Bool)

(assert (=> b!355356 (=> (not res!197121) (not e!217687))))

(assert (=> b!355356 (= res!197121 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9554 _keys!1456))))))

(declare-fun b!355357 () Bool)

(declare-fun res!197125 () Bool)

(assert (=> b!355357 (=> (not res!197125) (not e!217687))))

(declare-fun arrayContainsKey!0 (array!19417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355357 (= res!197125 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!355358 () Bool)

(declare-fun res!197123 () Bool)

(assert (=> b!355358 (=> (not res!197123) (not e!217687))))

(assert (=> b!355358 (= res!197123 (and (= (size!9555 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9554 _keys!1456) (size!9555 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355359 () Bool)

(declare-fun res!197124 () Bool)

(assert (=> b!355359 (=> (not res!197124) (not e!217687))))

(assert (=> b!355359 (= res!197124 (= (select (arr!9202 _keys!1456) from!1805) k!1077))))

(declare-fun b!355360 () Bool)

(declare-fun e!217688 () Bool)

(assert (=> b!355360 (= e!217688 tp_is_empty!7919)))

(declare-fun mapIsEmpty!13386 () Bool)

(declare-fun mapRes!13386 () Bool)

(assert (=> mapIsEmpty!13386 mapRes!13386))

(declare-fun b!355361 () Bool)

(declare-fun e!217689 () Bool)

(assert (=> b!355361 (= e!217689 tp_is_empty!7919)))

(declare-fun b!355362 () Bool)

(declare-fun res!197128 () Bool)

(assert (=> b!355362 (=> (not res!197128) (not e!217687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19417 (_ BitVec 32)) Bool)

(assert (=> b!355362 (= res!197128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13386 () Bool)

(declare-fun tp!27344 () Bool)

(assert (=> mapNonEmpty!13386 (= mapRes!13386 (and tp!27344 e!217688))))

(declare-fun mapValue!13386 () ValueCell!3616)

(declare-fun mapKey!13386 () (_ BitVec 32))

(declare-fun mapRest!13386 () (Array (_ BitVec 32) ValueCell!3616))

(assert (=> mapNonEmpty!13386 (= (arr!9203 _values!1208) (store mapRest!13386 mapKey!13386 mapValue!13386))))

(declare-fun b!355363 () Bool)

(assert (=> b!355363 (= e!217691 (and e!217689 mapRes!13386))))

(declare-fun condMapEmpty!13386 () Bool)

(declare-fun mapDefault!13386 () ValueCell!3616)

