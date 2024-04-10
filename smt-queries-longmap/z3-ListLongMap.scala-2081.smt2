; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35656 () Bool)

(assert start!35656)

(declare-fun b_free!7911 () Bool)

(declare-fun b_next!7911 () Bool)

(assert (=> start!35656 (= b_free!7911 (not b_next!7911))))

(declare-fun tp!27717 () Bool)

(declare-fun b_and!15153 () Bool)

(assert (=> start!35656 (= tp!27717 b_and!15153)))

(declare-fun b!358079 () Bool)

(declare-fun e!219184 () Bool)

(declare-fun e!219181 () Bool)

(assert (=> b!358079 (= e!219184 (not e!219181))))

(declare-fun res!198999 () Bool)

(assert (=> b!358079 (=> res!198999 e!219181)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19785 0))(
  ( (array!19786 (arr!9386 (Array (_ BitVec 32) (_ BitVec 64))) (size!9738 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19785)

(assert (=> b!358079 (= res!198999 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9738 _keys!1456))))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358079 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11789 0))(
  ( (V!11790 (val!4099 Int)) )
))
(declare-fun minValue!1150 () V!11789)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3711 0))(
  ( (ValueCellFull!3711 (v!6293 V!11789)) (EmptyCell!3711) )
))
(declare-datatypes ((array!19787 0))(
  ( (array!19788 (arr!9387 (Array (_ BitVec 32) ValueCell!3711)) (size!9739 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19787)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11789)

(declare-datatypes ((Unit!11042 0))(
  ( (Unit!11043) )
))
(declare-fun lt!166147 () Unit!11042)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!39 (array!19785 array!19787 (_ BitVec 32) (_ BitVec 32) V!11789 V!11789 (_ BitVec 64) (_ BitVec 32)) Unit!11042)

(assert (=> b!358079 (= lt!166147 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!39 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13671 () Bool)

(declare-fun mapRes!13671 () Bool)

(assert (=> mapIsEmpty!13671 mapRes!13671))

(declare-fun b!358080 () Bool)

(declare-fun res!198996 () Bool)

(assert (=> b!358080 (=> (not res!198996) (not e!219184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358080 (= res!198996 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13671 () Bool)

(declare-fun tp!27716 () Bool)

(declare-fun e!219182 () Bool)

(assert (=> mapNonEmpty!13671 (= mapRes!13671 (and tp!27716 e!219182))))

(declare-fun mapRest!13671 () (Array (_ BitVec 32) ValueCell!3711))

(declare-fun mapValue!13671 () ValueCell!3711)

(declare-fun mapKey!13671 () (_ BitVec 32))

(assert (=> mapNonEmpty!13671 (= (arr!9387 _values!1208) (store mapRest!13671 mapKey!13671 mapValue!13671))))

(declare-fun b!358081 () Bool)

(declare-fun res!198995 () Bool)

(assert (=> b!358081 (=> (not res!198995) (not e!219184))))

(assert (=> b!358081 (= res!198995 (not (= (select (arr!9386 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!358082 () Bool)

(declare-fun res!198993 () Bool)

(assert (=> b!358082 (=> (not res!198993) (not e!219184))))

(assert (=> b!358082 (= res!198993 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358084 () Bool)

(declare-fun e!219180 () Bool)

(declare-fun e!219183 () Bool)

(assert (=> b!358084 (= e!219180 (and e!219183 mapRes!13671))))

(declare-fun condMapEmpty!13671 () Bool)

(declare-fun mapDefault!13671 () ValueCell!3711)

(assert (=> b!358084 (= condMapEmpty!13671 (= (arr!9387 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3711)) mapDefault!13671)))))

(declare-fun b!358085 () Bool)

(assert (=> b!358085 (= e!219181 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5722 0))(
  ( (tuple2!5723 (_1!2872 (_ BitVec 64)) (_2!2872 V!11789)) )
))
(declare-datatypes ((List!5417 0))(
  ( (Nil!5414) (Cons!5413 (h!6269 tuple2!5722) (t!10567 List!5417)) )
))
(declare-datatypes ((ListLongMap!4635 0))(
  ( (ListLongMap!4636 (toList!2333 List!5417)) )
))
(declare-fun contains!2413 (ListLongMap!4635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1854 (array!19785 array!19787 (_ BitVec 32) (_ BitVec 32) V!11789 V!11789 (_ BitVec 32) Int) ListLongMap!4635)

(assert (=> b!358085 (contains!2413 (getCurrentListMap!1854 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166148 () Unit!11042)

(declare-fun lemmaArrayContainsKeyThenInListMap!349 (array!19785 array!19787 (_ BitVec 32) (_ BitVec 32) V!11789 V!11789 (_ BitVec 64) (_ BitVec 32) Int) Unit!11042)

(assert (=> b!358085 (= lt!166148 (lemmaArrayContainsKeyThenInListMap!349 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!358086 () Bool)

(declare-fun res!198998 () Bool)

(assert (=> b!358086 (=> (not res!198998) (not e!219184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19785 (_ BitVec 32)) Bool)

(assert (=> b!358086 (= res!198998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358087 () Bool)

(declare-fun res!198997 () Bool)

(assert (=> b!358087 (=> (not res!198997) (not e!219184))))

(assert (=> b!358087 (= res!198997 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9738 _keys!1456))))))

(declare-fun b!358088 () Bool)

(declare-fun res!198992 () Bool)

(assert (=> b!358088 (=> (not res!198992) (not e!219184))))

(declare-datatypes ((List!5418 0))(
  ( (Nil!5415) (Cons!5414 (h!6270 (_ BitVec 64)) (t!10568 List!5418)) )
))
(declare-fun arrayNoDuplicates!0 (array!19785 (_ BitVec 32) List!5418) Bool)

(assert (=> b!358088 (= res!198992 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5415))))

(declare-fun b!358083 () Bool)

(declare-fun res!199000 () Bool)

(assert (=> b!358083 (=> (not res!199000) (not e!219184))))

(assert (=> b!358083 (= res!199000 (and (= (size!9739 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9738 _keys!1456) (size!9739 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!198994 () Bool)

(assert (=> start!35656 (=> (not res!198994) (not e!219184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35656 (= res!198994 (validMask!0 mask!1842))))

(assert (=> start!35656 e!219184))

(declare-fun tp_is_empty!8109 () Bool)

(assert (=> start!35656 tp_is_empty!8109))

(assert (=> start!35656 true))

(assert (=> start!35656 tp!27717))

(declare-fun array_inv!6900 (array!19785) Bool)

(assert (=> start!35656 (array_inv!6900 _keys!1456)))

(declare-fun array_inv!6901 (array!19787) Bool)

(assert (=> start!35656 (and (array_inv!6901 _values!1208) e!219180)))

(declare-fun b!358089 () Bool)

(assert (=> b!358089 (= e!219183 tp_is_empty!8109)))

(declare-fun b!358090 () Bool)

(assert (=> b!358090 (= e!219182 tp_is_empty!8109)))

(assert (= (and start!35656 res!198994) b!358083))

(assert (= (and b!358083 res!199000) b!358086))

(assert (= (and b!358086 res!198998) b!358088))

(assert (= (and b!358088 res!198992) b!358080))

(assert (= (and b!358080 res!198996) b!358087))

(assert (= (and b!358087 res!198997) b!358082))

(assert (= (and b!358082 res!198993) b!358081))

(assert (= (and b!358081 res!198995) b!358079))

(assert (= (and b!358079 (not res!198999)) b!358085))

(assert (= (and b!358084 condMapEmpty!13671) mapIsEmpty!13671))

(assert (= (and b!358084 (not condMapEmpty!13671)) mapNonEmpty!13671))

(get-info :version)

(assert (= (and mapNonEmpty!13671 ((_ is ValueCellFull!3711) mapValue!13671)) b!358090))

(assert (= (and b!358084 ((_ is ValueCellFull!3711) mapDefault!13671)) b!358089))

(assert (= start!35656 b!358084))

(declare-fun m!356015 () Bool)

(assert (=> mapNonEmpty!13671 m!356015))

(declare-fun m!356017 () Bool)

(assert (=> b!358085 m!356017))

(assert (=> b!358085 m!356017))

(declare-fun m!356019 () Bool)

(assert (=> b!358085 m!356019))

(declare-fun m!356021 () Bool)

(assert (=> b!358085 m!356021))

(declare-fun m!356023 () Bool)

(assert (=> b!358080 m!356023))

(declare-fun m!356025 () Bool)

(assert (=> b!358086 m!356025))

(declare-fun m!356027 () Bool)

(assert (=> b!358081 m!356027))

(declare-fun m!356029 () Bool)

(assert (=> start!35656 m!356029))

(declare-fun m!356031 () Bool)

(assert (=> start!35656 m!356031))

(declare-fun m!356033 () Bool)

(assert (=> start!35656 m!356033))

(declare-fun m!356035 () Bool)

(assert (=> b!358082 m!356035))

(declare-fun m!356037 () Bool)

(assert (=> b!358088 m!356037))

(declare-fun m!356039 () Bool)

(assert (=> b!358079 m!356039))

(declare-fun m!356041 () Bool)

(assert (=> b!358079 m!356041))

(check-sat (not b!358086) (not b_next!7911) (not mapNonEmpty!13671) (not start!35656) b_and!15153 (not b!358085) (not b!358080) (not b!358079) (not b!358082) (not b!358088) tp_is_empty!8109)
(check-sat b_and!15153 (not b_next!7911))
