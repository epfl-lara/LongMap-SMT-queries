; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84710 () Bool)

(assert start!84710)

(declare-fun b_free!20083 () Bool)

(declare-fun b_next!20083 () Bool)

(assert (=> start!84710 (= b_free!20083 (not b_next!20083))))

(declare-fun tp!70048 () Bool)

(declare-fun b_and!32227 () Bool)

(assert (=> start!84710 (= tp!70048 b_and!32227)))

(declare-fun b!990559 () Bool)

(declare-fun e!558551 () Bool)

(assert (=> b!990559 (= e!558551 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36049 0))(
  ( (V!36050 (val!11700 Int)) )
))
(declare-fun minValue!1220 () V!36049)

(declare-datatypes ((ValueCell!11168 0))(
  ( (ValueCellFull!11168 (v!14272 V!36049)) (EmptyCell!11168) )
))
(declare-datatypes ((array!62494 0))(
  ( (array!62495 (arr!30098 (Array (_ BitVec 32) ValueCell!11168)) (size!30579 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62494)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36049)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62496 0))(
  ( (array!62497 (arr!30099 (Array (_ BitVec 32) (_ BitVec 64))) (size!30580 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62496)

(declare-datatypes ((tuple2!15000 0))(
  ( (tuple2!15001 (_1!7511 (_ BitVec 64)) (_2!7511 V!36049)) )
))
(declare-datatypes ((List!20880 0))(
  ( (Nil!20877) (Cons!20876 (h!22038 tuple2!15000) (t!29848 List!20880)) )
))
(declare-datatypes ((ListLongMap!13687 0))(
  ( (ListLongMap!13688 (toList!6859 List!20880)) )
))
(declare-fun lt!439439 () ListLongMap!13687)

(declare-fun getCurrentListMap!3828 (array!62496 array!62494 (_ BitVec 32) (_ BitVec 32) V!36049 V!36049 (_ BitVec 32) Int) ListLongMap!13687)

(assert (=> b!990559 (= lt!439439 (getCurrentListMap!3828 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990560 () Bool)

(declare-fun e!558548 () Bool)

(declare-fun tp_is_empty!23299 () Bool)

(assert (=> b!990560 (= e!558548 tp_is_empty!23299)))

(declare-fun b!990561 () Bool)

(declare-fun e!558549 () Bool)

(declare-fun mapRes!37001 () Bool)

(assert (=> b!990561 (= e!558549 (and e!558548 mapRes!37001))))

(declare-fun condMapEmpty!37001 () Bool)

(declare-fun mapDefault!37001 () ValueCell!11168)

(assert (=> b!990561 (= condMapEmpty!37001 (= (arr!30098 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11168)) mapDefault!37001)))))

(declare-fun mapNonEmpty!37001 () Bool)

(declare-fun tp!70049 () Bool)

(declare-fun e!558553 () Bool)

(assert (=> mapNonEmpty!37001 (= mapRes!37001 (and tp!70049 e!558553))))

(declare-fun mapValue!37001 () ValueCell!11168)

(declare-fun mapRest!37001 () (Array (_ BitVec 32) ValueCell!11168))

(declare-fun mapKey!37001 () (_ BitVec 32))

(assert (=> mapNonEmpty!37001 (= (arr!30098 _values!1278) (store mapRest!37001 mapKey!37001 mapValue!37001))))

(declare-fun b!990562 () Bool)

(declare-fun res!662308 () Bool)

(declare-fun e!558552 () Bool)

(assert (=> b!990562 (=> (not res!662308) (not e!558552))))

(assert (=> b!990562 (= res!662308 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30580 _keys!1544))))))

(declare-fun b!990563 () Bool)

(declare-fun res!662311 () Bool)

(assert (=> b!990563 (=> (not res!662311) (not e!558552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62496 (_ BitVec 32)) Bool)

(assert (=> b!990563 (= res!662311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990564 () Bool)

(declare-fun res!662310 () Bool)

(assert (=> b!990564 (=> (not res!662310) (not e!558552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990564 (= res!662310 (validKeyInArray!0 (select (arr!30099 _keys!1544) from!1932)))))

(declare-fun b!990565 () Bool)

(declare-fun res!662314 () Bool)

(assert (=> b!990565 (=> (not res!662314) (not e!558552))))

(declare-datatypes ((List!20881 0))(
  ( (Nil!20878) (Cons!20877 (h!22039 (_ BitVec 64)) (t!29849 List!20881)) )
))
(declare-fun arrayNoDuplicates!0 (array!62496 (_ BitVec 32) List!20881) Bool)

(assert (=> b!990565 (= res!662314 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20878))))

(declare-fun b!990566 () Bool)

(assert (=> b!990566 (= e!558552 e!558551)))

(declare-fun res!662312 () Bool)

(assert (=> b!990566 (=> (not res!662312) (not e!558551))))

(declare-fun lt!439440 () Bool)

(assert (=> b!990566 (= res!662312 (and (or lt!439440 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439440 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439440))))))

(assert (=> b!990566 (= lt!439440 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!662309 () Bool)

(assert (=> start!84710 (=> (not res!662309) (not e!558552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84710 (= res!662309 (validMask!0 mask!1948))))

(assert (=> start!84710 e!558552))

(assert (=> start!84710 true))

(assert (=> start!84710 tp_is_empty!23299))

(declare-fun array_inv!23257 (array!62494) Bool)

(assert (=> start!84710 (and (array_inv!23257 _values!1278) e!558549)))

(assert (=> start!84710 tp!70048))

(declare-fun array_inv!23258 (array!62496) Bool)

(assert (=> start!84710 (array_inv!23258 _keys!1544)))

(declare-fun mapIsEmpty!37001 () Bool)

(assert (=> mapIsEmpty!37001 mapRes!37001))

(declare-fun b!990567 () Bool)

(assert (=> b!990567 (= e!558553 tp_is_empty!23299)))

(declare-fun b!990568 () Bool)

(declare-fun res!662313 () Bool)

(assert (=> b!990568 (=> (not res!662313) (not e!558552))))

(assert (=> b!990568 (= res!662313 (and (= (size!30579 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30580 _keys!1544) (size!30579 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84710 res!662309) b!990568))

(assert (= (and b!990568 res!662313) b!990563))

(assert (= (and b!990563 res!662311) b!990565))

(assert (= (and b!990565 res!662314) b!990562))

(assert (= (and b!990562 res!662308) b!990564))

(assert (= (and b!990564 res!662310) b!990566))

(assert (= (and b!990566 res!662312) b!990559))

(assert (= (and b!990561 condMapEmpty!37001) mapIsEmpty!37001))

(assert (= (and b!990561 (not condMapEmpty!37001)) mapNonEmpty!37001))

(get-info :version)

(assert (= (and mapNonEmpty!37001 ((_ is ValueCellFull!11168) mapValue!37001)) b!990567))

(assert (= (and b!990561 ((_ is ValueCellFull!11168) mapDefault!37001)) b!990560))

(assert (= start!84710 b!990561))

(declare-fun m!917863 () Bool)

(assert (=> b!990559 m!917863))

(declare-fun m!917865 () Bool)

(assert (=> start!84710 m!917865))

(declare-fun m!917867 () Bool)

(assert (=> start!84710 m!917867))

(declare-fun m!917869 () Bool)

(assert (=> start!84710 m!917869))

(declare-fun m!917871 () Bool)

(assert (=> b!990563 m!917871))

(declare-fun m!917873 () Bool)

(assert (=> b!990565 m!917873))

(declare-fun m!917875 () Bool)

(assert (=> mapNonEmpty!37001 m!917875))

(declare-fun m!917877 () Bool)

(assert (=> b!990564 m!917877))

(assert (=> b!990564 m!917877))

(declare-fun m!917879 () Bool)

(assert (=> b!990564 m!917879))

(check-sat (not b!990563) (not start!84710) (not b!990565) (not mapNonEmpty!37001) (not b!990564) tp_is_empty!23299 (not b_next!20083) (not b!990559) b_and!32227)
(check-sat b_and!32227 (not b_next!20083))
