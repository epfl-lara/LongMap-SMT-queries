; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112562 () Bool)

(assert start!112562)

(declare-fun b_free!30957 () Bool)

(declare-fun b_next!30957 () Bool)

(assert (=> start!112562 (= b_free!30957 (not b_next!30957))))

(declare-fun tp!108508 () Bool)

(declare-fun b_and!49865 () Bool)

(assert (=> start!112562 (= tp!108508 b_and!49865)))

(declare-fun b!1335213 () Bool)

(declare-fun e!760461 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1335213 (= e!760461 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000))))

(declare-fun b!1335214 () Bool)

(declare-fun res!886154 () Bool)

(assert (=> b!1335214 (=> (not res!886154) (not e!760461))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90594 0))(
  ( (array!90595 (arr!43763 (Array (_ BitVec 32) (_ BitVec 64))) (size!44313 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90594)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335214 (= res!886154 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44313 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335215 () Bool)

(declare-fun res!886152 () Bool)

(assert (=> b!1335215 (=> (not res!886152) (not e!760461))))

(declare-datatypes ((V!54259 0))(
  ( (V!54260 (val!18508 Int)) )
))
(declare-datatypes ((ValueCell!17535 0))(
  ( (ValueCellFull!17535 (v!21145 V!54259)) (EmptyCell!17535) )
))
(declare-datatypes ((array!90596 0))(
  ( (array!90597 (arr!43764 (Array (_ BitVec 32) ValueCell!17535)) (size!44314 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90596)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54259)

(declare-fun zeroValue!1262 () V!54259)

(declare-datatypes ((tuple2!23866 0))(
  ( (tuple2!23867 (_1!11944 (_ BitVec 64)) (_2!11944 V!54259)) )
))
(declare-datatypes ((List!31006 0))(
  ( (Nil!31003) (Cons!31002 (h!32211 tuple2!23866) (t!45270 List!31006)) )
))
(declare-datatypes ((ListLongMap!21523 0))(
  ( (ListLongMap!21524 (toList!10777 List!31006)) )
))
(declare-fun contains!8941 (ListLongMap!21523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5751 (array!90594 array!90596 (_ BitVec 32) (_ BitVec 32) V!54259 V!54259 (_ BitVec 32) Int) ListLongMap!21523)

(assert (=> b!1335215 (= res!886152 (contains!8941 (getCurrentListMap!5751 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335216 () Bool)

(declare-fun res!886149 () Bool)

(assert (=> b!1335216 (=> (not res!886149) (not e!760461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335216 (= res!886149 (not (validKeyInArray!0 (select (arr!43763 _keys!1590) from!1980))))))

(declare-fun b!1335217 () Bool)

(declare-fun e!760458 () Bool)

(declare-fun e!760460 () Bool)

(declare-fun mapRes!56974 () Bool)

(assert (=> b!1335217 (= e!760458 (and e!760460 mapRes!56974))))

(declare-fun condMapEmpty!56974 () Bool)

(declare-fun mapDefault!56974 () ValueCell!17535)

(assert (=> b!1335217 (= condMapEmpty!56974 (= (arr!43764 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17535)) mapDefault!56974)))))

(declare-fun b!1335218 () Bool)

(declare-fun res!886155 () Bool)

(assert (=> b!1335218 (=> (not res!886155) (not e!760461))))

(assert (=> b!1335218 (= res!886155 (not (= (select (arr!43763 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335219 () Bool)

(declare-fun res!886148 () Bool)

(assert (=> b!1335219 (=> (not res!886148) (not e!760461))))

(assert (=> b!1335219 (= res!886148 (and (= (size!44314 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44313 _keys!1590) (size!44314 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335220 () Bool)

(declare-fun res!886153 () Bool)

(assert (=> b!1335220 (=> (not res!886153) (not e!760461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90594 (_ BitVec 32)) Bool)

(assert (=> b!1335220 (= res!886153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335221 () Bool)

(declare-fun e!760459 () Bool)

(declare-fun tp_is_empty!36867 () Bool)

(assert (=> b!1335221 (= e!760459 tp_is_empty!36867)))

(declare-fun b!1335222 () Bool)

(declare-fun res!886151 () Bool)

(assert (=> b!1335222 (=> (not res!886151) (not e!760461))))

(declare-datatypes ((List!31007 0))(
  ( (Nil!31004) (Cons!31003 (h!32212 (_ BitVec 64)) (t!45271 List!31007)) )
))
(declare-fun arrayNoDuplicates!0 (array!90594 (_ BitVec 32) List!31007) Bool)

(assert (=> b!1335222 (= res!886151 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31004))))

(declare-fun mapNonEmpty!56974 () Bool)

(declare-fun tp!108507 () Bool)

(assert (=> mapNonEmpty!56974 (= mapRes!56974 (and tp!108507 e!760459))))

(declare-fun mapRest!56974 () (Array (_ BitVec 32) ValueCell!17535))

(declare-fun mapValue!56974 () ValueCell!17535)

(declare-fun mapKey!56974 () (_ BitVec 32))

(assert (=> mapNonEmpty!56974 (= (arr!43764 _values!1320) (store mapRest!56974 mapKey!56974 mapValue!56974))))

(declare-fun b!1335223 () Bool)

(assert (=> b!1335223 (= e!760460 tp_is_empty!36867)))

(declare-fun res!886150 () Bool)

(assert (=> start!112562 (=> (not res!886150) (not e!760461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112562 (= res!886150 (validMask!0 mask!1998))))

(assert (=> start!112562 e!760461))

(declare-fun array_inv!33005 (array!90596) Bool)

(assert (=> start!112562 (and (array_inv!33005 _values!1320) e!760458)))

(assert (=> start!112562 true))

(declare-fun array_inv!33006 (array!90594) Bool)

(assert (=> start!112562 (array_inv!33006 _keys!1590)))

(assert (=> start!112562 tp!108508))

(assert (=> start!112562 tp_is_empty!36867))

(declare-fun mapIsEmpty!56974 () Bool)

(assert (=> mapIsEmpty!56974 mapRes!56974))

(assert (= (and start!112562 res!886150) b!1335219))

(assert (= (and b!1335219 res!886148) b!1335220))

(assert (= (and b!1335220 res!886153) b!1335222))

(assert (= (and b!1335222 res!886151) b!1335214))

(assert (= (and b!1335214 res!886154) b!1335215))

(assert (= (and b!1335215 res!886152) b!1335218))

(assert (= (and b!1335218 res!886155) b!1335216))

(assert (= (and b!1335216 res!886149) b!1335213))

(assert (= (and b!1335217 condMapEmpty!56974) mapIsEmpty!56974))

(assert (= (and b!1335217 (not condMapEmpty!56974)) mapNonEmpty!56974))

(get-info :version)

(assert (= (and mapNonEmpty!56974 ((_ is ValueCellFull!17535) mapValue!56974)) b!1335221))

(assert (= (and b!1335217 ((_ is ValueCellFull!17535) mapDefault!56974)) b!1335223))

(assert (= start!112562 b!1335217))

(declare-fun m!1223351 () Bool)

(assert (=> b!1335218 m!1223351))

(declare-fun m!1223353 () Bool)

(assert (=> mapNonEmpty!56974 m!1223353))

(assert (=> b!1335216 m!1223351))

(assert (=> b!1335216 m!1223351))

(declare-fun m!1223355 () Bool)

(assert (=> b!1335216 m!1223355))

(declare-fun m!1223357 () Bool)

(assert (=> b!1335222 m!1223357))

(declare-fun m!1223359 () Bool)

(assert (=> start!112562 m!1223359))

(declare-fun m!1223361 () Bool)

(assert (=> start!112562 m!1223361))

(declare-fun m!1223363 () Bool)

(assert (=> start!112562 m!1223363))

(declare-fun m!1223365 () Bool)

(assert (=> b!1335220 m!1223365))

(declare-fun m!1223367 () Bool)

(assert (=> b!1335215 m!1223367))

(assert (=> b!1335215 m!1223367))

(declare-fun m!1223369 () Bool)

(assert (=> b!1335215 m!1223369))

(check-sat (not b!1335216) (not b!1335222) (not b!1335220) (not b_next!30957) (not mapNonEmpty!56974) (not start!112562) b_and!49865 (not b!1335215) tp_is_empty!36867)
(check-sat b_and!49865 (not b_next!30957))
