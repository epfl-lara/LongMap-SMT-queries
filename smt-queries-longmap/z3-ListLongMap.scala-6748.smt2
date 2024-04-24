; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84790 () Bool)

(assert start!84790)

(declare-fun b_free!20047 () Bool)

(declare-fun b_next!20047 () Bool)

(assert (=> start!84790 (= b_free!20047 (not b_next!20047))))

(declare-fun tp!69933 () Bool)

(declare-fun b_and!32189 () Bool)

(assert (=> start!84790 (= tp!69933 b_and!32189)))

(declare-fun b!990548 () Bool)

(declare-fun res!662122 () Bool)

(declare-fun e!558630 () Bool)

(assert (=> b!990548 (=> (not res!662122) (not e!558630))))

(declare-datatypes ((array!62532 0))(
  ( (array!62533 (arr!30114 (Array (_ BitVec 32) (_ BitVec 64))) (size!30594 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62532)

(declare-datatypes ((List!20817 0))(
  ( (Nil!20814) (Cons!20813 (h!21981 (_ BitVec 64)) (t!29766 List!20817)) )
))
(declare-fun arrayNoDuplicates!0 (array!62532 (_ BitVec 32) List!20817) Bool)

(assert (=> b!990548 (= res!662122 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20814))))

(declare-fun b!990549 () Bool)

(declare-fun e!558632 () Bool)

(declare-fun tp_is_empty!23263 () Bool)

(assert (=> b!990549 (= e!558632 tp_is_empty!23263)))

(declare-fun b!990550 () Bool)

(declare-fun res!662124 () Bool)

(assert (=> b!990550 (=> (not res!662124) (not e!558630))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990550 (= res!662124 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30594 _keys!1544))))))

(declare-fun b!990551 () Bool)

(declare-fun res!662126 () Bool)

(assert (=> b!990551 (=> (not res!662126) (not e!558630))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990551 (= res!662126 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36940 () Bool)

(declare-fun mapRes!36940 () Bool)

(assert (=> mapIsEmpty!36940 mapRes!36940))

(declare-fun b!990552 () Bool)

(declare-fun res!662121 () Bool)

(assert (=> b!990552 (=> (not res!662121) (not e!558630))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62532 (_ BitVec 32)) Bool)

(assert (=> b!990552 (= res!662121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990553 () Bool)

(assert (=> b!990553 (= e!558630 false)))

(declare-datatypes ((V!36001 0))(
  ( (V!36002 (val!11682 Int)) )
))
(declare-fun minValue!1220 () V!36001)

(declare-datatypes ((ValueCell!11150 0))(
  ( (ValueCellFull!11150 (v!14249 V!36001)) (EmptyCell!11150) )
))
(declare-datatypes ((array!62534 0))(
  ( (array!62535 (arr!30115 (Array (_ BitVec 32) ValueCell!11150)) (size!30595 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62534)

(declare-datatypes ((tuple2!14912 0))(
  ( (tuple2!14913 (_1!7467 (_ BitVec 64)) (_2!7467 V!36001)) )
))
(declare-datatypes ((List!20818 0))(
  ( (Nil!20815) (Cons!20814 (h!21982 tuple2!14912) (t!29767 List!20818)) )
))
(declare-datatypes ((ListLongMap!13611 0))(
  ( (ListLongMap!13612 (toList!6821 List!20818)) )
))
(declare-fun lt!439459 () ListLongMap!13611)

(declare-fun defaultEntry!1281 () Int)

(declare-fun zeroValue!1220 () V!36001)

(declare-fun getCurrentListMapNoExtraKeys!3549 (array!62532 array!62534 (_ BitVec 32) (_ BitVec 32) V!36001 V!36001 (_ BitVec 32) Int) ListLongMap!13611)

(assert (=> b!990553 (= lt!439459 (getCurrentListMapNoExtraKeys!3549 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!662120 () Bool)

(assert (=> start!84790 (=> (not res!662120) (not e!558630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84790 (= res!662120 (validMask!0 mask!1948))))

(assert (=> start!84790 e!558630))

(assert (=> start!84790 true))

(assert (=> start!84790 tp_is_empty!23263))

(declare-fun e!558631 () Bool)

(declare-fun array_inv!23291 (array!62534) Bool)

(assert (=> start!84790 (and (array_inv!23291 _values!1278) e!558631)))

(assert (=> start!84790 tp!69933))

(declare-fun array_inv!23292 (array!62532) Bool)

(assert (=> start!84790 (array_inv!23292 _keys!1544)))

(declare-fun b!990554 () Bool)

(declare-fun e!558629 () Bool)

(assert (=> b!990554 (= e!558629 tp_is_empty!23263)))

(declare-fun b!990555 () Bool)

(declare-fun res!662123 () Bool)

(assert (=> b!990555 (=> (not res!662123) (not e!558630))))

(assert (=> b!990555 (= res!662123 (and (= (size!30595 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30594 _keys!1544) (size!30595 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990556 () Bool)

(assert (=> b!990556 (= e!558631 (and e!558632 mapRes!36940))))

(declare-fun condMapEmpty!36940 () Bool)

(declare-fun mapDefault!36940 () ValueCell!11150)

(assert (=> b!990556 (= condMapEmpty!36940 (= (arr!30115 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11150)) mapDefault!36940)))))

(declare-fun b!990557 () Bool)

(declare-fun res!662125 () Bool)

(assert (=> b!990557 (=> (not res!662125) (not e!558630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990557 (= res!662125 (validKeyInArray!0 (select (arr!30114 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36940 () Bool)

(declare-fun tp!69934 () Bool)

(assert (=> mapNonEmpty!36940 (= mapRes!36940 (and tp!69934 e!558629))))

(declare-fun mapValue!36940 () ValueCell!11150)

(declare-fun mapRest!36940 () (Array (_ BitVec 32) ValueCell!11150))

(declare-fun mapKey!36940 () (_ BitVec 32))

(assert (=> mapNonEmpty!36940 (= (arr!30115 _values!1278) (store mapRest!36940 mapKey!36940 mapValue!36940))))

(assert (= (and start!84790 res!662120) b!990555))

(assert (= (and b!990555 res!662123) b!990552))

(assert (= (and b!990552 res!662121) b!990548))

(assert (= (and b!990548 res!662122) b!990550))

(assert (= (and b!990550 res!662124) b!990557))

(assert (= (and b!990557 res!662125) b!990551))

(assert (= (and b!990551 res!662126) b!990553))

(assert (= (and b!990556 condMapEmpty!36940) mapIsEmpty!36940))

(assert (= (and b!990556 (not condMapEmpty!36940)) mapNonEmpty!36940))

(get-info :version)

(assert (= (and mapNonEmpty!36940 ((_ is ValueCellFull!11150) mapValue!36940)) b!990554))

(assert (= (and b!990556 ((_ is ValueCellFull!11150) mapDefault!36940)) b!990549))

(assert (= start!84790 b!990556))

(declare-fun m!918471 () Bool)

(assert (=> start!84790 m!918471))

(declare-fun m!918473 () Bool)

(assert (=> start!84790 m!918473))

(declare-fun m!918475 () Bool)

(assert (=> start!84790 m!918475))

(declare-fun m!918477 () Bool)

(assert (=> mapNonEmpty!36940 m!918477))

(declare-fun m!918479 () Bool)

(assert (=> b!990552 m!918479))

(declare-fun m!918481 () Bool)

(assert (=> b!990553 m!918481))

(declare-fun m!918483 () Bool)

(assert (=> b!990548 m!918483))

(declare-fun m!918485 () Bool)

(assert (=> b!990557 m!918485))

(assert (=> b!990557 m!918485))

(declare-fun m!918487 () Bool)

(assert (=> b!990557 m!918487))

(check-sat b_and!32189 (not start!84790) (not b!990553) (not mapNonEmpty!36940) (not b!990548) (not b_next!20047) tp_is_empty!23263 (not b!990557) (not b!990552))
(check-sat b_and!32189 (not b_next!20047))
