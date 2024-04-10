; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35458 () Bool)

(assert start!35458)

(declare-fun b_free!7845 () Bool)

(declare-fun b_next!7845 () Bool)

(assert (=> start!35458 (= b_free!7845 (not b_next!7845))))

(declare-fun tp!27320 () Bool)

(declare-fun b_and!15087 () Bool)

(assert (=> start!35458 (= tp!27320 b_and!15087)))

(declare-fun b!355208 () Bool)

(declare-fun res!197016 () Bool)

(declare-fun e!217628 () Bool)

(assert (=> b!355208 (=> (not res!197016) (not e!217628))))

(declare-datatypes ((array!19401 0))(
  ( (array!19402 (arr!9194 (Array (_ BitVec 32) (_ BitVec 64))) (size!9546 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19401)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355208 (= res!197016 (validKeyInArray!0 (select (arr!9194 _keys!1456) from!1805)))))

(declare-fun b!355209 () Bool)

(declare-fun res!197017 () Bool)

(assert (=> b!355209 (=> (not res!197017) (not e!217628))))

(declare-datatypes ((List!5327 0))(
  ( (Nil!5324) (Cons!5323 (h!6179 (_ BitVec 64)) (t!10477 List!5327)) )
))
(declare-fun arrayNoDuplicates!0 (array!19401 (_ BitVec 32) List!5327) Bool)

(assert (=> b!355209 (= res!197017 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5324))))

(declare-fun b!355210 () Bool)

(declare-fun e!217627 () Bool)

(declare-fun tp_is_empty!7911 () Bool)

(assert (=> b!355210 (= e!217627 tp_is_empty!7911)))

(declare-fun b!355211 () Bool)

(declare-fun res!197020 () Bool)

(assert (=> b!355211 (=> (not res!197020) (not e!217628))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19401 (_ BitVec 32)) Bool)

(assert (=> b!355211 (= res!197020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355212 () Bool)

(declare-fun res!197013 () Bool)

(assert (=> b!355212 (=> (not res!197013) (not e!217628))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355212 (= res!197013 (validKeyInArray!0 k0!1077))))

(declare-fun b!355213 () Bool)

(declare-fun res!197012 () Bool)

(assert (=> b!355213 (=> (not res!197012) (not e!217628))))

(declare-fun arrayContainsKey!0 (array!19401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355213 (= res!197012 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355214 () Bool)

(assert (=> b!355214 (= e!217628 (not true))))

(declare-datatypes ((V!11525 0))(
  ( (V!11526 (val!4000 Int)) )
))
(declare-fun minValue!1150 () V!11525)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3612 0))(
  ( (ValueCellFull!3612 (v!6194 V!11525)) (EmptyCell!3612) )
))
(declare-datatypes ((array!19403 0))(
  ( (array!19404 (arr!9195 (Array (_ BitVec 32) ValueCell!3612)) (size!9547 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19403)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11525)

(declare-datatypes ((tuple2!5684 0))(
  ( (tuple2!5685 (_1!2853 (_ BitVec 64)) (_2!2853 V!11525)) )
))
(declare-datatypes ((List!5328 0))(
  ( (Nil!5325) (Cons!5324 (h!6180 tuple2!5684) (t!10478 List!5328)) )
))
(declare-datatypes ((ListLongMap!4597 0))(
  ( (ListLongMap!4598 (toList!2314 List!5328)) )
))
(declare-fun contains!2394 (ListLongMap!4597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1835 (array!19401 array!19403 (_ BitVec 32) (_ BitVec 32) V!11525 V!11525 (_ BitVec 32) Int) ListLongMap!4597)

(assert (=> b!355214 (contains!2394 (getCurrentListMap!1835 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9194 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10950 0))(
  ( (Unit!10951) )
))
(declare-fun lt!165782 () Unit!10950)

(declare-fun lemmaValidKeyInArrayIsInListMap!192 (array!19401 array!19403 (_ BitVec 32) (_ BitVec 32) V!11525 V!11525 (_ BitVec 32) Int) Unit!10950)

(assert (=> b!355214 (= lt!165782 (lemmaValidKeyInArrayIsInListMap!192 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355215 () Bool)

(declare-fun res!197015 () Bool)

(assert (=> b!355215 (=> (not res!197015) (not e!217628))))

(assert (=> b!355215 (= res!197015 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9546 _keys!1456))))))

(declare-fun res!197018 () Bool)

(assert (=> start!35458 (=> (not res!197018) (not e!217628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35458 (= res!197018 (validMask!0 mask!1842))))

(assert (=> start!35458 e!217628))

(assert (=> start!35458 tp_is_empty!7911))

(assert (=> start!35458 true))

(assert (=> start!35458 tp!27320))

(declare-fun array_inv!6754 (array!19401) Bool)

(assert (=> start!35458 (array_inv!6754 _keys!1456)))

(declare-fun e!217630 () Bool)

(declare-fun array_inv!6755 (array!19403) Bool)

(assert (=> start!35458 (and (array_inv!6755 _values!1208) e!217630)))

(declare-fun b!355216 () Bool)

(declare-fun e!217629 () Bool)

(assert (=> b!355216 (= e!217629 tp_is_empty!7911)))

(declare-fun mapNonEmpty!13374 () Bool)

(declare-fun mapRes!13374 () Bool)

(declare-fun tp!27321 () Bool)

(assert (=> mapNonEmpty!13374 (= mapRes!13374 (and tp!27321 e!217629))))

(declare-fun mapValue!13374 () ValueCell!3612)

(declare-fun mapKey!13374 () (_ BitVec 32))

(declare-fun mapRest!13374 () (Array (_ BitVec 32) ValueCell!3612))

(assert (=> mapNonEmpty!13374 (= (arr!9195 _values!1208) (store mapRest!13374 mapKey!13374 mapValue!13374))))

(declare-fun b!355217 () Bool)

(assert (=> b!355217 (= e!217630 (and e!217627 mapRes!13374))))

(declare-fun condMapEmpty!13374 () Bool)

(declare-fun mapDefault!13374 () ValueCell!3612)

(assert (=> b!355217 (= condMapEmpty!13374 (= (arr!9195 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3612)) mapDefault!13374)))))

(declare-fun mapIsEmpty!13374 () Bool)

(assert (=> mapIsEmpty!13374 mapRes!13374))

(declare-fun b!355218 () Bool)

(declare-fun res!197014 () Bool)

(assert (=> b!355218 (=> (not res!197014) (not e!217628))))

(assert (=> b!355218 (= res!197014 (and (= (size!9547 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9546 _keys!1456) (size!9547 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355219 () Bool)

(declare-fun res!197019 () Bool)

(assert (=> b!355219 (=> (not res!197019) (not e!217628))))

(assert (=> b!355219 (= res!197019 (= (select (arr!9194 _keys!1456) from!1805) k0!1077))))

(assert (= (and start!35458 res!197018) b!355218))

(assert (= (and b!355218 res!197014) b!355211))

(assert (= (and b!355211 res!197020) b!355209))

(assert (= (and b!355209 res!197017) b!355212))

(assert (= (and b!355212 res!197013) b!355215))

(assert (= (and b!355215 res!197015) b!355213))

(assert (= (and b!355213 res!197012) b!355219))

(assert (= (and b!355219 res!197019) b!355208))

(assert (= (and b!355208 res!197016) b!355214))

(assert (= (and b!355217 condMapEmpty!13374) mapIsEmpty!13374))

(assert (= (and b!355217 (not condMapEmpty!13374)) mapNonEmpty!13374))

(get-info :version)

(assert (= (and mapNonEmpty!13374 ((_ is ValueCellFull!3612) mapValue!13374)) b!355216))

(assert (= (and b!355217 ((_ is ValueCellFull!3612) mapDefault!13374)) b!355210))

(assert (= start!35458 b!355217))

(declare-fun m!353991 () Bool)

(assert (=> b!355212 m!353991))

(declare-fun m!353993 () Bool)

(assert (=> b!355219 m!353993))

(declare-fun m!353995 () Bool)

(assert (=> b!355214 m!353995))

(assert (=> b!355214 m!353993))

(assert (=> b!355214 m!353995))

(assert (=> b!355214 m!353993))

(declare-fun m!353997 () Bool)

(assert (=> b!355214 m!353997))

(declare-fun m!353999 () Bool)

(assert (=> b!355214 m!353999))

(declare-fun m!354001 () Bool)

(assert (=> mapNonEmpty!13374 m!354001))

(declare-fun m!354003 () Bool)

(assert (=> b!355211 m!354003))

(assert (=> b!355208 m!353993))

(assert (=> b!355208 m!353993))

(declare-fun m!354005 () Bool)

(assert (=> b!355208 m!354005))

(declare-fun m!354007 () Bool)

(assert (=> b!355209 m!354007))

(declare-fun m!354009 () Bool)

(assert (=> b!355213 m!354009))

(declare-fun m!354011 () Bool)

(assert (=> start!35458 m!354011))

(declare-fun m!354013 () Bool)

(assert (=> start!35458 m!354013))

(declare-fun m!354015 () Bool)

(assert (=> start!35458 m!354015))

(check-sat (not b!355214) (not b!355208) tp_is_empty!7911 (not b!355213) b_and!15087 (not b!355211) (not b!355209) (not start!35458) (not mapNonEmpty!13374) (not b_next!7845) (not b!355212))
(check-sat b_and!15087 (not b_next!7845))
