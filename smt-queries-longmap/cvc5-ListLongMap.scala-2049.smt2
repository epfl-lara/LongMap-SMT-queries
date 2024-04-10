; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35462 () Bool)

(assert start!35462)

(declare-fun b_free!7849 () Bool)

(declare-fun b_next!7849 () Bool)

(assert (=> start!35462 (= b_free!7849 (not b_next!7849))))

(declare-fun tp!27333 () Bool)

(declare-fun b_and!15091 () Bool)

(assert (=> start!35462 (= tp!27333 b_and!15091)))

(declare-fun b!355280 () Bool)

(declare-fun e!217661 () Bool)

(assert (=> b!355280 (= e!217661 (not true))))

(declare-datatypes ((V!11531 0))(
  ( (V!11532 (val!4002 Int)) )
))
(declare-fun minValue!1150 () V!11531)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19409 0))(
  ( (array!19410 (arr!9198 (Array (_ BitVec 32) (_ BitVec 64))) (size!9550 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19409)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3614 0))(
  ( (ValueCellFull!3614 (v!6196 V!11531)) (EmptyCell!3614) )
))
(declare-datatypes ((array!19411 0))(
  ( (array!19412 (arr!9199 (Array (_ BitVec 32) ValueCell!3614)) (size!9551 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19411)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11531)

(declare-datatypes ((tuple2!5686 0))(
  ( (tuple2!5687 (_1!2854 (_ BitVec 64)) (_2!2854 V!11531)) )
))
(declare-datatypes ((List!5330 0))(
  ( (Nil!5327) (Cons!5326 (h!6182 tuple2!5686) (t!10480 List!5330)) )
))
(declare-datatypes ((ListLongMap!4599 0))(
  ( (ListLongMap!4600 (toList!2315 List!5330)) )
))
(declare-fun contains!2395 (ListLongMap!4599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1836 (array!19409 array!19411 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) ListLongMap!4599)

(assert (=> b!355280 (contains!2395 (getCurrentListMap!1836 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9198 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10952 0))(
  ( (Unit!10953) )
))
(declare-fun lt!165788 () Unit!10952)

(declare-fun lemmaValidKeyInArrayIsInListMap!193 (array!19409 array!19411 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) Unit!10952)

(assert (=> b!355280 (= lt!165788 (lemmaValidKeyInArrayIsInListMap!193 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355281 () Bool)

(declare-fun res!197066 () Bool)

(assert (=> b!355281 (=> (not res!197066) (not e!217661))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355281 (= res!197066 (validKeyInArray!0 k!1077))))

(declare-fun b!355282 () Bool)

(declare-fun res!197071 () Bool)

(assert (=> b!355282 (=> (not res!197071) (not e!217661))))

(assert (=> b!355282 (= res!197071 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9550 _keys!1456))))))

(declare-fun b!355283 () Bool)

(declare-fun res!197070 () Bool)

(assert (=> b!355283 (=> (not res!197070) (not e!217661))))

(assert (=> b!355283 (= res!197070 (validKeyInArray!0 (select (arr!9198 _keys!1456) from!1805)))))

(declare-fun res!197074 () Bool)

(assert (=> start!35462 (=> (not res!197074) (not e!217661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35462 (= res!197074 (validMask!0 mask!1842))))

(assert (=> start!35462 e!217661))

(declare-fun tp_is_empty!7915 () Bool)

(assert (=> start!35462 tp_is_empty!7915))

(assert (=> start!35462 true))

(assert (=> start!35462 tp!27333))

(declare-fun array_inv!6756 (array!19409) Bool)

(assert (=> start!35462 (array_inv!6756 _keys!1456)))

(declare-fun e!217659 () Bool)

(declare-fun array_inv!6757 (array!19411) Bool)

(assert (=> start!35462 (and (array_inv!6757 _values!1208) e!217659)))

(declare-fun b!355284 () Bool)

(declare-fun res!197067 () Bool)

(assert (=> b!355284 (=> (not res!197067) (not e!217661))))

(assert (=> b!355284 (= res!197067 (= (select (arr!9198 _keys!1456) from!1805) k!1077))))

(declare-fun mapIsEmpty!13380 () Bool)

(declare-fun mapRes!13380 () Bool)

(assert (=> mapIsEmpty!13380 mapRes!13380))

(declare-fun b!355285 () Bool)

(declare-fun res!197073 () Bool)

(assert (=> b!355285 (=> (not res!197073) (not e!217661))))

(declare-fun arrayContainsKey!0 (array!19409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355285 (= res!197073 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!355286 () Bool)

(declare-fun e!217660 () Bool)

(assert (=> b!355286 (= e!217660 tp_is_empty!7915)))

(declare-fun b!355287 () Bool)

(declare-fun res!197069 () Bool)

(assert (=> b!355287 (=> (not res!197069) (not e!217661))))

(assert (=> b!355287 (= res!197069 (and (= (size!9551 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9550 _keys!1456) (size!9551 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13380 () Bool)

(declare-fun tp!27332 () Bool)

(declare-fun e!217657 () Bool)

(assert (=> mapNonEmpty!13380 (= mapRes!13380 (and tp!27332 e!217657))))

(declare-fun mapRest!13380 () (Array (_ BitVec 32) ValueCell!3614))

(declare-fun mapValue!13380 () ValueCell!3614)

(declare-fun mapKey!13380 () (_ BitVec 32))

(assert (=> mapNonEmpty!13380 (= (arr!9199 _values!1208) (store mapRest!13380 mapKey!13380 mapValue!13380))))

(declare-fun b!355288 () Bool)

(assert (=> b!355288 (= e!217657 tp_is_empty!7915)))

(declare-fun b!355289 () Bool)

(declare-fun res!197068 () Bool)

(assert (=> b!355289 (=> (not res!197068) (not e!217661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19409 (_ BitVec 32)) Bool)

(assert (=> b!355289 (= res!197068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355290 () Bool)

(assert (=> b!355290 (= e!217659 (and e!217660 mapRes!13380))))

(declare-fun condMapEmpty!13380 () Bool)

(declare-fun mapDefault!13380 () ValueCell!3614)

