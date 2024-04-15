; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112512 () Bool)

(assert start!112512)

(declare-fun b_free!30907 () Bool)

(declare-fun b_next!30907 () Bool)

(assert (=> start!112512 (= b_free!30907 (not b_next!30907))))

(declare-fun tp!108359 () Bool)

(declare-fun b_and!49797 () Bool)

(assert (=> start!112512 (= tp!108359 b_and!49797)))

(declare-fun b!1334528 () Bool)

(declare-fun res!885731 () Bool)

(declare-fun e!760054 () Bool)

(assert (=> b!1334528 (=> (not res!885731) (not e!760054))))

(declare-datatypes ((V!54193 0))(
  ( (V!54194 (val!18483 Int)) )
))
(declare-datatypes ((ValueCell!17510 0))(
  ( (ValueCellFull!17510 (v!21119 V!54193)) (EmptyCell!17510) )
))
(declare-datatypes ((array!90445 0))(
  ( (array!90446 (arr!43689 (Array (_ BitVec 32) ValueCell!17510)) (size!44241 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90445)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90447 0))(
  ( (array!90448 (arr!43690 (Array (_ BitVec 32) (_ BitVec 64))) (size!44242 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90447)

(assert (=> b!1334528 (= res!885731 (and (= (size!44241 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44242 _keys!1590) (size!44241 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334529 () Bool)

(declare-fun e!760052 () Bool)

(declare-fun tp_is_empty!36817 () Bool)

(assert (=> b!1334529 (= e!760052 tp_is_empty!36817)))

(declare-fun b!1334530 () Bool)

(declare-fun res!885732 () Bool)

(assert (=> b!1334530 (=> (not res!885732) (not e!760054))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334530 (= res!885732 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44242 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334531 () Bool)

(declare-fun res!885730 () Bool)

(assert (=> b!1334531 (=> (not res!885730) (not e!760054))))

(declare-datatypes ((List!31035 0))(
  ( (Nil!31032) (Cons!31031 (h!32240 (_ BitVec 64)) (t!45291 List!31035)) )
))
(declare-fun arrayNoDuplicates!0 (array!90447 (_ BitVec 32) List!31035) Bool)

(assert (=> b!1334531 (= res!885730 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31032))))

(declare-fun b!1334532 () Bool)

(declare-fun e!760051 () Bool)

(declare-fun mapRes!56899 () Bool)

(assert (=> b!1334532 (= e!760051 (and e!760052 mapRes!56899))))

(declare-fun condMapEmpty!56899 () Bool)

(declare-fun mapDefault!56899 () ValueCell!17510)

(assert (=> b!1334532 (= condMapEmpty!56899 (= (arr!43689 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17510)) mapDefault!56899)))))

(declare-fun b!1334533 () Bool)

(declare-fun res!885733 () Bool)

(assert (=> b!1334533 (=> (not res!885733) (not e!760054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90447 (_ BitVec 32)) Bool)

(assert (=> b!1334533 (= res!885733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56899 () Bool)

(assert (=> mapIsEmpty!56899 mapRes!56899))

(declare-fun b!1334534 () Bool)

(assert (=> b!1334534 (= e!760054 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592180 () Bool)

(declare-fun minValue!1262 () V!54193)

(declare-fun zeroValue!1262 () V!54193)

(declare-datatypes ((tuple2!23896 0))(
  ( (tuple2!23897 (_1!11959 (_ BitVec 64)) (_2!11959 V!54193)) )
))
(declare-datatypes ((List!31036 0))(
  ( (Nil!31033) (Cons!31032 (h!32241 tuple2!23896) (t!45292 List!31036)) )
))
(declare-datatypes ((ListLongMap!21553 0))(
  ( (ListLongMap!21554 (toList!10792 List!31036)) )
))
(declare-fun contains!8884 (ListLongMap!21553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5646 (array!90447 array!90445 (_ BitVec 32) (_ BitVec 32) V!54193 V!54193 (_ BitVec 32) Int) ListLongMap!21553)

(assert (=> b!1334534 (= lt!592180 (contains!8884 (getCurrentListMap!5646 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334535 () Bool)

(declare-fun e!760053 () Bool)

(assert (=> b!1334535 (= e!760053 tp_is_empty!36817)))

(declare-fun mapNonEmpty!56899 () Bool)

(declare-fun tp!108358 () Bool)

(assert (=> mapNonEmpty!56899 (= mapRes!56899 (and tp!108358 e!760053))))

(declare-fun mapValue!56899 () ValueCell!17510)

(declare-fun mapRest!56899 () (Array (_ BitVec 32) ValueCell!17510))

(declare-fun mapKey!56899 () (_ BitVec 32))

(assert (=> mapNonEmpty!56899 (= (arr!43689 _values!1320) (store mapRest!56899 mapKey!56899 mapValue!56899))))

(declare-fun res!885729 () Bool)

(assert (=> start!112512 (=> (not res!885729) (not e!760054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112512 (= res!885729 (validMask!0 mask!1998))))

(assert (=> start!112512 e!760054))

(declare-fun array_inv!33147 (array!90445) Bool)

(assert (=> start!112512 (and (array_inv!33147 _values!1320) e!760051)))

(assert (=> start!112512 true))

(declare-fun array_inv!33148 (array!90447) Bool)

(assert (=> start!112512 (array_inv!33148 _keys!1590)))

(assert (=> start!112512 tp!108359))

(assert (=> start!112512 tp_is_empty!36817))

(assert (= (and start!112512 res!885729) b!1334528))

(assert (= (and b!1334528 res!885731) b!1334533))

(assert (= (and b!1334533 res!885733) b!1334531))

(assert (= (and b!1334531 res!885730) b!1334530))

(assert (= (and b!1334530 res!885732) b!1334534))

(assert (= (and b!1334532 condMapEmpty!56899) mapIsEmpty!56899))

(assert (= (and b!1334532 (not condMapEmpty!56899)) mapNonEmpty!56899))

(get-info :version)

(assert (= (and mapNonEmpty!56899 ((_ is ValueCellFull!17510) mapValue!56899)) b!1334535))

(assert (= (and b!1334532 ((_ is ValueCellFull!17510) mapDefault!56899)) b!1334529))

(assert (= start!112512 b!1334532))

(declare-fun m!1222431 () Bool)

(assert (=> b!1334531 m!1222431))

(declare-fun m!1222433 () Bool)

(assert (=> b!1334533 m!1222433))

(declare-fun m!1222435 () Bool)

(assert (=> start!112512 m!1222435))

(declare-fun m!1222437 () Bool)

(assert (=> start!112512 m!1222437))

(declare-fun m!1222439 () Bool)

(assert (=> start!112512 m!1222439))

(declare-fun m!1222441 () Bool)

(assert (=> b!1334534 m!1222441))

(assert (=> b!1334534 m!1222441))

(declare-fun m!1222443 () Bool)

(assert (=> b!1334534 m!1222443))

(declare-fun m!1222445 () Bool)

(assert (=> mapNonEmpty!56899 m!1222445))

(check-sat b_and!49797 (not b!1334533) tp_is_empty!36817 (not b!1334531) (not b!1334534) (not mapNonEmpty!56899) (not start!112512) (not b_next!30907))
(check-sat b_and!49797 (not b_next!30907))
