; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35640 () Bool)

(assert start!35640)

(declare-fun b_free!7909 () Bool)

(declare-fun b_next!7909 () Bool)

(assert (=> start!35640 (= b_free!7909 (not b_next!7909))))

(declare-fun tp!27710 () Bool)

(declare-fun b_and!15165 () Bool)

(assert (=> start!35640 (= tp!27710 b_and!15165)))

(declare-fun b!357990 () Bool)

(declare-fun res!198970 () Bool)

(declare-fun e!219133 () Bool)

(assert (=> b!357990 (=> (not res!198970) (not e!219133))))

(declare-datatypes ((array!19764 0))(
  ( (array!19765 (arr!9375 (Array (_ BitVec 32) (_ BitVec 64))) (size!9727 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19764)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357990 (= res!198970 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!198967 () Bool)

(assert (=> start!35640 (=> (not res!198967) (not e!219133))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35640 (= res!198967 (validMask!0 mask!1842))))

(assert (=> start!35640 e!219133))

(declare-fun tp_is_empty!8107 () Bool)

(assert (=> start!35640 tp_is_empty!8107))

(assert (=> start!35640 true))

(assert (=> start!35640 tp!27710))

(declare-fun array_inv!6928 (array!19764) Bool)

(assert (=> start!35640 (array_inv!6928 _keys!1456)))

(declare-datatypes ((V!11787 0))(
  ( (V!11788 (val!4098 Int)) )
))
(declare-datatypes ((ValueCell!3710 0))(
  ( (ValueCellFull!3710 (v!6293 V!11787)) (EmptyCell!3710) )
))
(declare-datatypes ((array!19766 0))(
  ( (array!19767 (arr!9376 (Array (_ BitVec 32) ValueCell!3710)) (size!9728 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19766)

(declare-fun e!219129 () Bool)

(declare-fun array_inv!6929 (array!19766) Bool)

(assert (=> start!35640 (and (array_inv!6929 _values!1208) e!219129)))

(declare-fun b!357991 () Bool)

(declare-fun res!198965 () Bool)

(assert (=> b!357991 (=> (not res!198965) (not e!219133))))

(assert (=> b!357991 (= res!198965 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9727 _keys!1456))))))

(declare-fun b!357992 () Bool)

(declare-fun e!219131 () Bool)

(declare-fun mapRes!13668 () Bool)

(assert (=> b!357992 (= e!219129 (and e!219131 mapRes!13668))))

(declare-fun condMapEmpty!13668 () Bool)

(declare-fun mapDefault!13668 () ValueCell!3710)

(assert (=> b!357992 (= condMapEmpty!13668 (= (arr!9376 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3710)) mapDefault!13668)))))

(declare-fun b!357993 () Bool)

(declare-fun res!198969 () Bool)

(assert (=> b!357993 (=> (not res!198969) (not e!219133))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357993 (= res!198969 (and (= (size!9728 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9727 _keys!1456) (size!9728 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13668 () Bool)

(declare-fun tp!27711 () Bool)

(declare-fun e!219130 () Bool)

(assert (=> mapNonEmpty!13668 (= mapRes!13668 (and tp!27711 e!219130))))

(declare-fun mapKey!13668 () (_ BitVec 32))

(declare-fun mapRest!13668 () (Array (_ BitVec 32) ValueCell!3710))

(declare-fun mapValue!13668 () ValueCell!3710)

(assert (=> mapNonEmpty!13668 (= (arr!9376 _values!1208) (store mapRest!13668 mapKey!13668 mapValue!13668))))

(declare-fun b!357994 () Bool)

(declare-fun res!198962 () Bool)

(assert (=> b!357994 (=> (not res!198962) (not e!219133))))

(assert (=> b!357994 (= res!198962 (not (= (select (arr!9375 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13668 () Bool)

(assert (=> mapIsEmpty!13668 mapRes!13668))

(declare-fun b!357995 () Bool)

(declare-fun res!198968 () Bool)

(assert (=> b!357995 (=> (not res!198968) (not e!219133))))

(declare-datatypes ((List!5323 0))(
  ( (Nil!5320) (Cons!5319 (h!6175 (_ BitVec 64)) (t!10465 List!5323)) )
))
(declare-fun arrayNoDuplicates!0 (array!19764 (_ BitVec 32) List!5323) Bool)

(assert (=> b!357995 (= res!198968 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5320))))

(declare-fun b!357996 () Bool)

(declare-fun res!198963 () Bool)

(assert (=> b!357996 (=> (not res!198963) (not e!219133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357996 (= res!198963 (validKeyInArray!0 k0!1077))))

(declare-fun b!357997 () Bool)

(declare-fun e!219128 () Bool)

(assert (=> b!357997 (= e!219133 (not e!219128))))

(declare-fun res!198966 () Bool)

(assert (=> b!357997 (=> res!198966 e!219128)))

(assert (=> b!357997 (= res!198966 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9727 _keys!1456))))))

(assert (=> b!357997 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11023 0))(
  ( (Unit!11024) )
))
(declare-fun lt!166159 () Unit!11023)

(declare-fun minValue!1150 () V!11787)

(declare-fun zeroValue!1150 () V!11787)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 (array!19764 array!19766 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 64) (_ BitVec 32)) Unit!11023)

(assert (=> b!357997 (= lt!166159 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!37 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357998 () Bool)

(assert (=> b!357998 (= e!219128 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5640 0))(
  ( (tuple2!5641 (_1!2831 (_ BitVec 64)) (_2!2831 V!11787)) )
))
(declare-datatypes ((List!5324 0))(
  ( (Nil!5321) (Cons!5320 (h!6176 tuple2!5640) (t!10466 List!5324)) )
))
(declare-datatypes ((ListLongMap!4555 0))(
  ( (ListLongMap!4556 (toList!2293 List!5324)) )
))
(declare-fun contains!2392 (ListLongMap!4555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1821 (array!19764 array!19766 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 32) Int) ListLongMap!4555)

(assert (=> b!357998 (contains!2392 (getCurrentListMap!1821 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166160 () Unit!11023)

(declare-fun lemmaArrayContainsKeyThenInListMap!360 (array!19764 array!19766 (_ BitVec 32) (_ BitVec 32) V!11787 V!11787 (_ BitVec 64) (_ BitVec 32) Int) Unit!11023)

(assert (=> b!357998 (= lt!166160 (lemmaArrayContainsKeyThenInListMap!360 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357999 () Bool)

(assert (=> b!357999 (= e!219130 tp_is_empty!8107)))

(declare-fun b!358000 () Bool)

(declare-fun res!198964 () Bool)

(assert (=> b!358000 (=> (not res!198964) (not e!219133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19764 (_ BitVec 32)) Bool)

(assert (=> b!358000 (= res!198964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358001 () Bool)

(assert (=> b!358001 (= e!219131 tp_is_empty!8107)))

(assert (= (and start!35640 res!198967) b!357993))

(assert (= (and b!357993 res!198969) b!358000))

(assert (= (and b!358000 res!198964) b!357995))

(assert (= (and b!357995 res!198968) b!357996))

(assert (= (and b!357996 res!198963) b!357991))

(assert (= (and b!357991 res!198965) b!357990))

(assert (= (and b!357990 res!198970) b!357994))

(assert (= (and b!357994 res!198962) b!357997))

(assert (= (and b!357997 (not res!198966)) b!357998))

(assert (= (and b!357992 condMapEmpty!13668) mapIsEmpty!13668))

(assert (= (and b!357992 (not condMapEmpty!13668)) mapNonEmpty!13668))

(get-info :version)

(assert (= (and mapNonEmpty!13668 ((_ is ValueCellFull!3710) mapValue!13668)) b!357999))

(assert (= (and b!357992 ((_ is ValueCellFull!3710) mapDefault!13668)) b!358001))

(assert (= start!35640 b!357992))

(declare-fun m!356211 () Bool)

(assert (=> mapNonEmpty!13668 m!356211))

(declare-fun m!356213 () Bool)

(assert (=> b!357997 m!356213))

(declare-fun m!356215 () Bool)

(assert (=> b!357997 m!356215))

(declare-fun m!356217 () Bool)

(assert (=> b!357994 m!356217))

(declare-fun m!356219 () Bool)

(assert (=> b!357996 m!356219))

(declare-fun m!356221 () Bool)

(assert (=> start!35640 m!356221))

(declare-fun m!356223 () Bool)

(assert (=> start!35640 m!356223))

(declare-fun m!356225 () Bool)

(assert (=> start!35640 m!356225))

(declare-fun m!356227 () Bool)

(assert (=> b!357995 m!356227))

(declare-fun m!356229 () Bool)

(assert (=> b!358000 m!356229))

(declare-fun m!356231 () Bool)

(assert (=> b!357998 m!356231))

(assert (=> b!357998 m!356231))

(declare-fun m!356233 () Bool)

(assert (=> b!357998 m!356233))

(declare-fun m!356235 () Bool)

(assert (=> b!357998 m!356235))

(declare-fun m!356237 () Bool)

(assert (=> b!357990 m!356237))

(check-sat (not b!357997) (not b!357996) tp_is_empty!8107 b_and!15165 (not b!357995) (not b!357998) (not b!357990) (not start!35640) (not b!358000) (not b_next!7909) (not mapNonEmpty!13668))
(check-sat b_and!15165 (not b_next!7909))
