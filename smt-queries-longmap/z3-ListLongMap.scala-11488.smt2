; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134138 () Bool)

(assert start!134138)

(declare-fun b_free!32089 () Bool)

(declare-fun b_next!32089 () Bool)

(assert (=> start!134138 (= b_free!32089 (not b_next!32089))))

(declare-fun tp!113472 () Bool)

(declare-fun b_and!51661 () Bool)

(assert (=> start!134138 (= tp!113472 b_and!51661)))

(declare-fun b!1566041 () Bool)

(declare-fun res!1069823 () Bool)

(declare-fun e!872960 () Bool)

(assert (=> b!1566041 (=> (not res!1069823) (not e!872960))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104436 0))(
  ( (array!104437 (arr!50403 (Array (_ BitVec 32) (_ BitVec 64))) (size!50954 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104436)

(assert (=> b!1566041 (= res!1069823 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50954 _keys!637)) (bvslt from!782 (size!50954 _keys!637))))))

(declare-fun mapNonEmpty!59589 () Bool)

(declare-fun mapRes!59589 () Bool)

(declare-fun tp!113471 () Bool)

(declare-fun e!872961 () Bool)

(assert (=> mapNonEmpty!59589 (= mapRes!59589 (and tp!113471 e!872961))))

(declare-datatypes ((V!59953 0))(
  ( (V!59954 (val!19488 Int)) )
))
(declare-datatypes ((ValueCell!18374 0))(
  ( (ValueCellFull!18374 (v!22232 V!59953)) (EmptyCell!18374) )
))
(declare-fun mapRest!59589 () (Array (_ BitVec 32) ValueCell!18374))

(declare-fun mapValue!59589 () ValueCell!18374)

(declare-fun mapKey!59589 () (_ BitVec 32))

(declare-datatypes ((array!104438 0))(
  ( (array!104439 (arr!50404 (Array (_ BitVec 32) ValueCell!18374)) (size!50955 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104438)

(assert (=> mapNonEmpty!59589 (= (arr!50404 _values!487) (store mapRest!59589 mapKey!59589 mapValue!59589))))

(declare-fun b!1566042 () Bool)

(declare-fun res!1069822 () Bool)

(assert (=> b!1566042 (=> (not res!1069822) (not e!872960))))

(declare-datatypes ((List!36564 0))(
  ( (Nil!36561) (Cons!36560 (h!38024 (_ BitVec 64)) (t!51403 List!36564)) )
))
(declare-fun arrayNoDuplicates!0 (array!104436 (_ BitVec 32) List!36564) Bool)

(assert (=> b!1566042 (= res!1069822 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36561))))

(declare-fun b!1566043 () Bool)

(declare-fun res!1069825 () Bool)

(assert (=> b!1566043 (=> (not res!1069825) (not e!872960))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104436 (_ BitVec 32)) Bool)

(assert (=> b!1566043 (= res!1069825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566044 () Bool)

(declare-fun res!1069824 () Bool)

(assert (=> b!1566044 (=> (not res!1069824) (not e!872960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566044 (= res!1069824 (not (validKeyInArray!0 (select (arr!50403 _keys!637) from!782))))))

(declare-fun b!1566045 () Bool)

(declare-fun tp_is_empty!38809 () Bool)

(assert (=> b!1566045 (= e!872961 tp_is_empty!38809)))

(declare-fun b!1566046 () Bool)

(declare-fun e!872962 () Bool)

(declare-fun e!872963 () Bool)

(assert (=> b!1566046 (= e!872962 (and e!872963 mapRes!59589))))

(declare-fun condMapEmpty!59589 () Bool)

(declare-fun mapDefault!59589 () ValueCell!18374)

(assert (=> b!1566046 (= condMapEmpty!59589 (= (arr!50404 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18374)) mapDefault!59589)))))

(declare-fun b!1566047 () Bool)

(assert (=> b!1566047 (= e!872963 tp_is_empty!38809)))

(declare-fun b!1566049 () Bool)

(declare-fun e!872965 () Bool)

(assert (=> b!1566049 (= e!872965 false)))

(declare-fun lt!672830 () Bool)

(declare-datatypes ((tuple2!25200 0))(
  ( (tuple2!25201 (_1!12611 (_ BitVec 64)) (_2!12611 V!59953)) )
))
(declare-datatypes ((List!36565 0))(
  ( (Nil!36562) (Cons!36561 (h!38025 tuple2!25200) (t!51404 List!36565)) )
))
(declare-datatypes ((ListLongMap!22643 0))(
  ( (ListLongMap!22644 (toList!11337 List!36565)) )
))
(declare-fun lt!672829 () ListLongMap!22643)

(declare-fun contains!10338 (ListLongMap!22643 (_ BitVec 64)) Bool)

(assert (=> b!1566049 (= lt!672830 (contains!10338 lt!672829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59589 () Bool)

(assert (=> mapIsEmpty!59589 mapRes!59589))

(declare-fun b!1566050 () Bool)

(declare-fun res!1069826 () Bool)

(assert (=> b!1566050 (=> (not res!1069826) (not e!872960))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566050 (= res!1069826 (and (= (size!50955 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50954 _keys!637) (size!50955 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566048 () Bool)

(assert (=> b!1566048 (= e!872960 e!872965)))

(declare-fun res!1069820 () Bool)

(assert (=> b!1566048 (=> (not res!1069820) (not e!872965))))

(assert (=> b!1566048 (= res!1069820 (not (contains!10338 lt!672829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59953)

(declare-fun minValue!453 () V!59953)

(declare-fun getCurrentListMapNoExtraKeys!6733 (array!104436 array!104438 (_ BitVec 32) (_ BitVec 32) V!59953 V!59953 (_ BitVec 32) Int) ListLongMap!22643)

(assert (=> b!1566048 (= lt!672829 (getCurrentListMapNoExtraKeys!6733 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1069821 () Bool)

(assert (=> start!134138 (=> (not res!1069821) (not e!872960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134138 (= res!1069821 (validMask!0 mask!947))))

(assert (=> start!134138 e!872960))

(assert (=> start!134138 tp!113472))

(assert (=> start!134138 tp_is_empty!38809))

(assert (=> start!134138 true))

(declare-fun array_inv!39415 (array!104436) Bool)

(assert (=> start!134138 (array_inv!39415 _keys!637)))

(declare-fun array_inv!39416 (array!104438) Bool)

(assert (=> start!134138 (and (array_inv!39416 _values!487) e!872962)))

(assert (= (and start!134138 res!1069821) b!1566050))

(assert (= (and b!1566050 res!1069826) b!1566043))

(assert (= (and b!1566043 res!1069825) b!1566042))

(assert (= (and b!1566042 res!1069822) b!1566041))

(assert (= (and b!1566041 res!1069823) b!1566044))

(assert (= (and b!1566044 res!1069824) b!1566048))

(assert (= (and b!1566048 res!1069820) b!1566049))

(assert (= (and b!1566046 condMapEmpty!59589) mapIsEmpty!59589))

(assert (= (and b!1566046 (not condMapEmpty!59589)) mapNonEmpty!59589))

(get-info :version)

(assert (= (and mapNonEmpty!59589 ((_ is ValueCellFull!18374) mapValue!59589)) b!1566045))

(assert (= (and b!1566046 ((_ is ValueCellFull!18374) mapDefault!59589)) b!1566047))

(assert (= start!134138 b!1566046))

(declare-fun m!1441341 () Bool)

(assert (=> mapNonEmpty!59589 m!1441341))

(declare-fun m!1441343 () Bool)

(assert (=> b!1566042 m!1441343))

(declare-fun m!1441345 () Bool)

(assert (=> start!134138 m!1441345))

(declare-fun m!1441347 () Bool)

(assert (=> start!134138 m!1441347))

(declare-fun m!1441349 () Bool)

(assert (=> start!134138 m!1441349))

(declare-fun m!1441351 () Bool)

(assert (=> b!1566043 m!1441351))

(declare-fun m!1441353 () Bool)

(assert (=> b!1566049 m!1441353))

(declare-fun m!1441355 () Bool)

(assert (=> b!1566044 m!1441355))

(assert (=> b!1566044 m!1441355))

(declare-fun m!1441357 () Bool)

(assert (=> b!1566044 m!1441357))

(declare-fun m!1441359 () Bool)

(assert (=> b!1566048 m!1441359))

(declare-fun m!1441361 () Bool)

(assert (=> b!1566048 m!1441361))

(check-sat (not b!1566048) (not mapNonEmpty!59589) (not b!1566044) (not start!134138) b_and!51661 (not b!1566049) (not b!1566042) (not b_next!32089) (not b!1566043) tp_is_empty!38809)
(check-sat b_and!51661 (not b_next!32089))
