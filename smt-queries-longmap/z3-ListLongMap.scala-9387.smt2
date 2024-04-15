; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111758 () Bool)

(assert start!111758)

(declare-fun b_free!30415 () Bool)

(declare-fun b_next!30415 () Bool)

(assert (=> start!111758 (= b_free!30415 (not b_next!30415))))

(declare-fun tp!106721 () Bool)

(declare-fun b_and!48935 () Bool)

(assert (=> start!111758 (= tp!106721 b_and!48935)))

(declare-fun b!1324206 () Bool)

(declare-fun res!878960 () Bool)

(declare-fun e!754921 () Bool)

(assert (=> b!1324206 (=> (not res!878960) (not e!754921))))

(declare-datatypes ((array!89313 0))(
  ( (array!89314 (arr!43131 (Array (_ BitVec 32) (_ BitVec 64))) (size!43683 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89313)

(declare-datatypes ((List!30655 0))(
  ( (Nil!30652) (Cons!30651 (h!31860 (_ BitVec 64)) (t!44573 List!30655)) )
))
(declare-fun arrayNoDuplicates!0 (array!89313 (_ BitVec 32) List!30655) Bool)

(assert (=> b!1324206 (= res!878960 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30652))))

(declare-fun b!1324207 () Bool)

(declare-fun e!754918 () Bool)

(declare-fun tp_is_empty!36235 () Bool)

(assert (=> b!1324207 (= e!754918 tp_is_empty!36235)))

(declare-fun b!1324208 () Bool)

(declare-fun res!878963 () Bool)

(assert (=> b!1324208 (=> (not res!878963) (not e!754921))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89313 (_ BitVec 32)) Bool)

(assert (=> b!1324208 (= res!878963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!56000 () Bool)

(declare-fun mapRes!56000 () Bool)

(assert (=> mapIsEmpty!56000 mapRes!56000))

(declare-fun b!1324209 () Bool)

(assert (=> b!1324209 (= e!754921 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53417 0))(
  ( (V!53418 (val!18192 Int)) )
))
(declare-fun zeroValue!1279 () V!53417)

(declare-datatypes ((ValueCell!17219 0))(
  ( (ValueCellFull!17219 (v!20821 V!53417)) (EmptyCell!17219) )
))
(declare-datatypes ((array!89315 0))(
  ( (array!89316 (arr!43132 (Array (_ BitVec 32) ValueCell!17219)) (size!43684 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89315)

(declare-fun minValue!1279 () V!53417)

(declare-fun lt!589269 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23522 0))(
  ( (tuple2!23523 (_1!11772 (_ BitVec 64)) (_2!11772 V!53417)) )
))
(declare-datatypes ((List!30656 0))(
  ( (Nil!30653) (Cons!30652 (h!31861 tuple2!23522) (t!44574 List!30656)) )
))
(declare-datatypes ((ListLongMap!21179 0))(
  ( (ListLongMap!21180 (toList!10605 List!30656)) )
))
(declare-fun contains!8688 (ListLongMap!21179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5484 (array!89313 array!89315 (_ BitVec 32) (_ BitVec 32) V!53417 V!53417 (_ BitVec 32) Int) ListLongMap!21179)

(assert (=> b!1324209 (= lt!589269 (contains!8688 (getCurrentListMap!5484 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!56000 () Bool)

(declare-fun tp!106722 () Bool)

(assert (=> mapNonEmpty!56000 (= mapRes!56000 (and tp!106722 e!754918))))

(declare-fun mapRest!56000 () (Array (_ BitVec 32) ValueCell!17219))

(declare-fun mapValue!56000 () ValueCell!17219)

(declare-fun mapKey!56000 () (_ BitVec 32))

(assert (=> mapNonEmpty!56000 (= (arr!43132 _values!1337) (store mapRest!56000 mapKey!56000 mapValue!56000))))

(declare-fun b!1324210 () Bool)

(declare-fun res!878964 () Bool)

(assert (=> b!1324210 (=> (not res!878964) (not e!754921))))

(assert (=> b!1324210 (= res!878964 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43683 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324211 () Bool)

(declare-fun e!754919 () Bool)

(assert (=> b!1324211 (= e!754919 tp_is_empty!36235)))

(declare-fun b!1324212 () Bool)

(declare-fun e!754917 () Bool)

(assert (=> b!1324212 (= e!754917 (and e!754919 mapRes!56000))))

(declare-fun condMapEmpty!56000 () Bool)

(declare-fun mapDefault!56000 () ValueCell!17219)

(assert (=> b!1324212 (= condMapEmpty!56000 (= (arr!43132 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17219)) mapDefault!56000)))))

(declare-fun b!1324213 () Bool)

(declare-fun res!878961 () Bool)

(assert (=> b!1324213 (=> (not res!878961) (not e!754921))))

(assert (=> b!1324213 (= res!878961 (and (= (size!43684 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43683 _keys!1609) (size!43684 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!878962 () Bool)

(assert (=> start!111758 (=> (not res!878962) (not e!754921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111758 (= res!878962 (validMask!0 mask!2019))))

(assert (=> start!111758 e!754921))

(declare-fun array_inv!32743 (array!89313) Bool)

(assert (=> start!111758 (array_inv!32743 _keys!1609)))

(assert (=> start!111758 true))

(assert (=> start!111758 tp_is_empty!36235))

(declare-fun array_inv!32744 (array!89315) Bool)

(assert (=> start!111758 (and (array_inv!32744 _values!1337) e!754917)))

(assert (=> start!111758 tp!106721))

(assert (= (and start!111758 res!878962) b!1324213))

(assert (= (and b!1324213 res!878961) b!1324208))

(assert (= (and b!1324208 res!878963) b!1324206))

(assert (= (and b!1324206 res!878960) b!1324210))

(assert (= (and b!1324210 res!878964) b!1324209))

(assert (= (and b!1324212 condMapEmpty!56000) mapIsEmpty!56000))

(assert (= (and b!1324212 (not condMapEmpty!56000)) mapNonEmpty!56000))

(get-info :version)

(assert (= (and mapNonEmpty!56000 ((_ is ValueCellFull!17219) mapValue!56000)) b!1324207))

(assert (= (and b!1324212 ((_ is ValueCellFull!17219) mapDefault!56000)) b!1324211))

(assert (= start!111758 b!1324212))

(declare-fun m!1212675 () Bool)

(assert (=> start!111758 m!1212675))

(declare-fun m!1212677 () Bool)

(assert (=> start!111758 m!1212677))

(declare-fun m!1212679 () Bool)

(assert (=> start!111758 m!1212679))

(declare-fun m!1212681 () Bool)

(assert (=> b!1324208 m!1212681))

(declare-fun m!1212683 () Bool)

(assert (=> b!1324206 m!1212683))

(declare-fun m!1212685 () Bool)

(assert (=> mapNonEmpty!56000 m!1212685))

(declare-fun m!1212687 () Bool)

(assert (=> b!1324209 m!1212687))

(assert (=> b!1324209 m!1212687))

(declare-fun m!1212689 () Bool)

(assert (=> b!1324209 m!1212689))

(check-sat tp_is_empty!36235 (not b_next!30415) (not b!1324208) (not b!1324209) (not start!111758) b_and!48935 (not b!1324206) (not mapNonEmpty!56000))
(check-sat b_and!48935 (not b_next!30415))
