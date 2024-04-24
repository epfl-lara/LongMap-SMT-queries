; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35442 () Bool)

(assert start!35442)

(declare-fun b_free!7843 () Bool)

(declare-fun b_next!7843 () Bool)

(assert (=> start!35442 (= b_free!7843 (not b_next!7843))))

(declare-fun tp!27314 () Bool)

(declare-fun b_and!15099 () Bool)

(assert (=> start!35442 (= tp!27314 b_and!15099)))

(declare-fun b!355119 () Bool)

(declare-fun e!217580 () Bool)

(declare-fun tp_is_empty!7909 () Bool)

(assert (=> b!355119 (= e!217580 tp_is_empty!7909)))

(declare-fun b!355120 () Bool)

(declare-fun e!217581 () Bool)

(declare-fun mapRes!13371 () Bool)

(assert (=> b!355120 (= e!217581 (and e!217580 mapRes!13371))))

(declare-fun condMapEmpty!13371 () Bool)

(declare-datatypes ((V!11523 0))(
  ( (V!11524 (val!3999 Int)) )
))
(declare-datatypes ((ValueCell!3611 0))(
  ( (ValueCellFull!3611 (v!6194 V!11523)) (EmptyCell!3611) )
))
(declare-datatypes ((array!19388 0))(
  ( (array!19389 (arr!9187 (Array (_ BitVec 32) ValueCell!3611)) (size!9539 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19388)

(declare-fun mapDefault!13371 () ValueCell!3611)

(assert (=> b!355120 (= condMapEmpty!13371 (= (arr!9187 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3611)) mapDefault!13371)))))

(declare-fun b!355122 () Bool)

(declare-fun res!196990 () Bool)

(declare-fun e!217578 () Bool)

(assert (=> b!355122 (=> (not res!196990) (not e!217578))))

(declare-datatypes ((array!19390 0))(
  ( (array!19391 (arr!9188 (Array (_ BitVec 32) (_ BitVec 64))) (size!9540 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19390)

(declare-datatypes ((List!5233 0))(
  ( (Nil!5230) (Cons!5229 (h!6085 (_ BitVec 64)) (t!10375 List!5233)) )
))
(declare-fun arrayNoDuplicates!0 (array!19390 (_ BitVec 32) List!5233) Bool)

(assert (=> b!355122 (= res!196990 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5230))))

(declare-fun b!355123 () Bool)

(declare-fun res!196988 () Bool)

(assert (=> b!355123 (=> (not res!196988) (not e!217578))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355123 (= res!196988 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355124 () Bool)

(declare-fun res!196986 () Bool)

(assert (=> b!355124 (=> (not res!196986) (not e!217578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355124 (= res!196986 (validKeyInArray!0 k0!1077))))

(declare-fun b!355125 () Bool)

(declare-fun res!196985 () Bool)

(assert (=> b!355125 (=> (not res!196985) (not e!217578))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!355125 (= res!196985 (and (= (size!9539 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9540 _keys!1456) (size!9539 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13371 () Bool)

(assert (=> mapIsEmpty!13371 mapRes!13371))

(declare-fun mapNonEmpty!13371 () Bool)

(declare-fun tp!27315 () Bool)

(declare-fun e!217579 () Bool)

(assert (=> mapNonEmpty!13371 (= mapRes!13371 (and tp!27315 e!217579))))

(declare-fun mapValue!13371 () ValueCell!3611)

(declare-fun mapRest!13371 () (Array (_ BitVec 32) ValueCell!3611))

(declare-fun mapKey!13371 () (_ BitVec 32))

(assert (=> mapNonEmpty!13371 (= (arr!9187 _values!1208) (store mapRest!13371 mapKey!13371 mapValue!13371))))

(declare-fun b!355126 () Bool)

(declare-fun res!196989 () Bool)

(assert (=> b!355126 (=> (not res!196989) (not e!217578))))

(assert (=> b!355126 (= res!196989 (= (select (arr!9188 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355127 () Bool)

(declare-fun res!196987 () Bool)

(assert (=> b!355127 (=> (not res!196987) (not e!217578))))

(assert (=> b!355127 (= res!196987 (validKeyInArray!0 (select (arr!9188 _keys!1456) from!1805)))))

(declare-fun b!355128 () Bool)

(declare-fun res!196982 () Bool)

(assert (=> b!355128 (=> (not res!196982) (not e!217578))))

(assert (=> b!355128 (= res!196982 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9540 _keys!1456))))))

(declare-fun b!355121 () Bool)

(assert (=> b!355121 (= e!217578 (not true))))

(declare-fun minValue!1150 () V!11523)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11523)

(declare-datatypes ((tuple2!5596 0))(
  ( (tuple2!5597 (_1!2809 (_ BitVec 64)) (_2!2809 V!11523)) )
))
(declare-datatypes ((List!5234 0))(
  ( (Nil!5231) (Cons!5230 (h!6086 tuple2!5596) (t!10376 List!5234)) )
))
(declare-datatypes ((ListLongMap!4511 0))(
  ( (ListLongMap!4512 (toList!2271 List!5234)) )
))
(declare-fun contains!2370 (ListLongMap!4511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1799 (array!19390 array!19388 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) ListLongMap!4511)

(assert (=> b!355121 (contains!2370 (getCurrentListMap!1799 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9188 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10927 0))(
  ( (Unit!10928) )
))
(declare-fun lt!165797 () Unit!10927)

(declare-fun lemmaValidKeyInArrayIsInListMap!189 (array!19390 array!19388 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) Unit!10927)

(assert (=> b!355121 (= lt!165797 (lemmaValidKeyInArrayIsInListMap!189 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun res!196983 () Bool)

(assert (=> start!35442 (=> (not res!196983) (not e!217578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35442 (= res!196983 (validMask!0 mask!1842))))

(assert (=> start!35442 e!217578))

(assert (=> start!35442 tp_is_empty!7909))

(assert (=> start!35442 true))

(assert (=> start!35442 tp!27314))

(declare-fun array_inv!6790 (array!19390) Bool)

(assert (=> start!35442 (array_inv!6790 _keys!1456)))

(declare-fun array_inv!6791 (array!19388) Bool)

(assert (=> start!35442 (and (array_inv!6791 _values!1208) e!217581)))

(declare-fun b!355129 () Bool)

(assert (=> b!355129 (= e!217579 tp_is_empty!7909)))

(declare-fun b!355130 () Bool)

(declare-fun res!196984 () Bool)

(assert (=> b!355130 (=> (not res!196984) (not e!217578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19390 (_ BitVec 32)) Bool)

(assert (=> b!355130 (= res!196984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35442 res!196983) b!355125))

(assert (= (and b!355125 res!196985) b!355130))

(assert (= (and b!355130 res!196984) b!355122))

(assert (= (and b!355122 res!196990) b!355124))

(assert (= (and b!355124 res!196986) b!355128))

(assert (= (and b!355128 res!196982) b!355123))

(assert (= (and b!355123 res!196988) b!355126))

(assert (= (and b!355126 res!196989) b!355127))

(assert (= (and b!355127 res!196987) b!355121))

(assert (= (and b!355120 condMapEmpty!13371) mapIsEmpty!13371))

(assert (= (and b!355120 (not condMapEmpty!13371)) mapNonEmpty!13371))

(get-info :version)

(assert (= (and mapNonEmpty!13371 ((_ is ValueCellFull!3611) mapValue!13371)) b!355129))

(assert (= (and b!355120 ((_ is ValueCellFull!3611) mapDefault!13371)) b!355119))

(assert (= start!35442 b!355120))

(declare-fun m!354189 () Bool)

(assert (=> b!355130 m!354189))

(declare-fun m!354191 () Bool)

(assert (=> b!355121 m!354191))

(declare-fun m!354193 () Bool)

(assert (=> b!355121 m!354193))

(assert (=> b!355121 m!354191))

(assert (=> b!355121 m!354193))

(declare-fun m!354195 () Bool)

(assert (=> b!355121 m!354195))

(declare-fun m!354197 () Bool)

(assert (=> b!355121 m!354197))

(declare-fun m!354199 () Bool)

(assert (=> b!355122 m!354199))

(declare-fun m!354201 () Bool)

(assert (=> mapNonEmpty!13371 m!354201))

(assert (=> b!355127 m!354193))

(assert (=> b!355127 m!354193))

(declare-fun m!354203 () Bool)

(assert (=> b!355127 m!354203))

(declare-fun m!354205 () Bool)

(assert (=> start!35442 m!354205))

(declare-fun m!354207 () Bool)

(assert (=> start!35442 m!354207))

(declare-fun m!354209 () Bool)

(assert (=> start!35442 m!354209))

(declare-fun m!354211 () Bool)

(assert (=> b!355123 m!354211))

(declare-fun m!354213 () Bool)

(assert (=> b!355124 m!354213))

(assert (=> b!355126 m!354193))

(check-sat (not b!355124) (not b!355127) tp_is_empty!7909 (not b!355122) (not b!355123) b_and!15099 (not b_next!7843) (not start!35442) (not mapNonEmpty!13371) (not b!355121) (not b!355130))
(check-sat b_and!15099 (not b_next!7843))
