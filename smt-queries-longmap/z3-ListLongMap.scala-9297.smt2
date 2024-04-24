; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111354 () Bool)

(assert start!111354)

(declare-fun b_free!29965 () Bool)

(declare-fun b_next!29965 () Bool)

(assert (=> start!111354 (= b_free!29965 (not b_next!29965))))

(declare-fun tp!105216 () Bool)

(declare-fun b_and!48175 () Bool)

(assert (=> start!111354 (= tp!105216 b_and!48175)))

(declare-fun b!1317089 () Bool)

(declare-fun res!874013 () Bool)

(declare-fun e!751442 () Bool)

(assert (=> b!1317089 (=> (not res!874013) (not e!751442))))

(declare-datatypes ((array!88407 0))(
  ( (array!88408 (arr!42679 (Array (_ BitVec 32) (_ BitVec 64))) (size!43230 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88407)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52697 0))(
  ( (V!52698 (val!17922 Int)) )
))
(declare-datatypes ((ValueCell!16949 0))(
  ( (ValueCellFull!16949 (v!20544 V!52697)) (EmptyCell!16949) )
))
(declare-datatypes ((array!88409 0))(
  ( (array!88410 (arr!42680 (Array (_ BitVec 32) ValueCell!16949)) (size!43231 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88409)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1317089 (= res!874013 (and (= (size!43231 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43230 _keys!1628) (size!43231 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55171 () Bool)

(declare-fun mapRes!55171 () Bool)

(declare-fun tp!105217 () Bool)

(declare-fun e!751443 () Bool)

(assert (=> mapNonEmpty!55171 (= mapRes!55171 (and tp!105217 e!751443))))

(declare-fun mapValue!55171 () ValueCell!16949)

(declare-fun mapKey!55171 () (_ BitVec 32))

(declare-fun mapRest!55171 () (Array (_ BitVec 32) ValueCell!16949))

(assert (=> mapNonEmpty!55171 (= (arr!42680 _values!1354) (store mapRest!55171 mapKey!55171 mapValue!55171))))

(declare-fun mapIsEmpty!55171 () Bool)

(assert (=> mapIsEmpty!55171 mapRes!55171))

(declare-fun b!1317090 () Bool)

(declare-fun e!751444 () Bool)

(declare-fun e!751445 () Bool)

(assert (=> b!1317090 (= e!751444 (and e!751445 mapRes!55171))))

(declare-fun condMapEmpty!55171 () Bool)

(declare-fun mapDefault!55171 () ValueCell!16949)

(assert (=> b!1317090 (= condMapEmpty!55171 (= (arr!42680 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16949)) mapDefault!55171)))))

(declare-fun b!1317091 () Bool)

(declare-fun res!874009 () Bool)

(assert (=> b!1317091 (=> (not res!874009) (not e!751442))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1317091 (= res!874009 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43230 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317092 () Bool)

(assert (=> b!1317092 (= e!751442 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52697)

(declare-fun zeroValue!1296 () V!52697)

(declare-fun lt!586433 () Bool)

(declare-datatypes ((tuple2!23146 0))(
  ( (tuple2!23147 (_1!11584 (_ BitVec 64)) (_2!11584 V!52697)) )
))
(declare-datatypes ((List!30293 0))(
  ( (Nil!30290) (Cons!30289 (h!31507 tuple2!23146) (t!43891 List!30293)) )
))
(declare-datatypes ((ListLongMap!20811 0))(
  ( (ListLongMap!20812 (toList!10421 List!30293)) )
))
(declare-fun contains!8583 (ListLongMap!20811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5425 (array!88407 array!88409 (_ BitVec 32) (_ BitVec 32) V!52697 V!52697 (_ BitVec 32) Int) ListLongMap!20811)

(assert (=> b!1317092 (= lt!586433 (contains!8583 (getCurrentListMap!5425 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317093 () Bool)

(declare-fun res!874012 () Bool)

(assert (=> b!1317093 (=> (not res!874012) (not e!751442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88407 (_ BitVec 32)) Bool)

(assert (=> b!1317093 (= res!874012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!874011 () Bool)

(assert (=> start!111354 (=> (not res!874011) (not e!751442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111354 (= res!874011 (validMask!0 mask!2040))))

(assert (=> start!111354 e!751442))

(assert (=> start!111354 tp!105216))

(declare-fun array_inv!32501 (array!88407) Bool)

(assert (=> start!111354 (array_inv!32501 _keys!1628)))

(assert (=> start!111354 true))

(declare-fun tp_is_empty!35695 () Bool)

(assert (=> start!111354 tp_is_empty!35695))

(declare-fun array_inv!32502 (array!88409) Bool)

(assert (=> start!111354 (and (array_inv!32502 _values!1354) e!751444)))

(declare-fun b!1317094 () Bool)

(declare-fun res!874010 () Bool)

(assert (=> b!1317094 (=> (not res!874010) (not e!751442))))

(declare-datatypes ((List!30294 0))(
  ( (Nil!30291) (Cons!30290 (h!31508 (_ BitVec 64)) (t!43892 List!30294)) )
))
(declare-fun arrayNoDuplicates!0 (array!88407 (_ BitVec 32) List!30294) Bool)

(assert (=> b!1317094 (= res!874010 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30291))))

(declare-fun b!1317095 () Bool)

(assert (=> b!1317095 (= e!751443 tp_is_empty!35695)))

(declare-fun b!1317096 () Bool)

(assert (=> b!1317096 (= e!751445 tp_is_empty!35695)))

(assert (= (and start!111354 res!874011) b!1317089))

(assert (= (and b!1317089 res!874013) b!1317093))

(assert (= (and b!1317093 res!874012) b!1317094))

(assert (= (and b!1317094 res!874010) b!1317091))

(assert (= (and b!1317091 res!874009) b!1317092))

(assert (= (and b!1317090 condMapEmpty!55171) mapIsEmpty!55171))

(assert (= (and b!1317090 (not condMapEmpty!55171)) mapNonEmpty!55171))

(get-info :version)

(assert (= (and mapNonEmpty!55171 ((_ is ValueCellFull!16949) mapValue!55171)) b!1317095))

(assert (= (and b!1317090 ((_ is ValueCellFull!16949) mapDefault!55171)) b!1317096))

(assert (= start!111354 b!1317090))

(declare-fun m!1205465 () Bool)

(assert (=> start!111354 m!1205465))

(declare-fun m!1205467 () Bool)

(assert (=> start!111354 m!1205467))

(declare-fun m!1205469 () Bool)

(assert (=> start!111354 m!1205469))

(declare-fun m!1205471 () Bool)

(assert (=> b!1317094 m!1205471))

(declare-fun m!1205473 () Bool)

(assert (=> b!1317092 m!1205473))

(assert (=> b!1317092 m!1205473))

(declare-fun m!1205475 () Bool)

(assert (=> b!1317092 m!1205475))

(declare-fun m!1205477 () Bool)

(assert (=> mapNonEmpty!55171 m!1205477))

(declare-fun m!1205479 () Bool)

(assert (=> b!1317093 m!1205479))

(check-sat (not mapNonEmpty!55171) (not b_next!29965) tp_is_empty!35695 (not start!111354) (not b!1317093) (not b!1317092) b_and!48175 (not b!1317094))
(check-sat b_and!48175 (not b_next!29965))
