; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84604 () Bool)

(assert start!84604)

(declare-fun b_free!20047 () Bool)

(declare-fun b_next!20047 () Bool)

(assert (=> start!84604 (= b_free!20047 (not b_next!20047))))

(declare-fun tp!69933 () Bool)

(declare-fun b_and!32153 () Bool)

(assert (=> start!84604 (= tp!69933 b_and!32153)))

(declare-fun b!989406 () Bool)

(declare-fun res!661666 () Bool)

(declare-fun e!557901 () Bool)

(assert (=> b!989406 (=> (not res!661666) (not e!557901))))

(declare-datatypes ((array!62422 0))(
  ( (array!62423 (arr!30064 (Array (_ BitVec 32) (_ BitVec 64))) (size!30545 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62422)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989406 (= res!661666 (validKeyInArray!0 (select (arr!30064 _keys!1544) from!1932)))))

(declare-fun b!989407 () Bool)

(declare-fun res!661667 () Bool)

(assert (=> b!989407 (=> (not res!661667) (not e!557901))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62422 (_ BitVec 32)) Bool)

(assert (=> b!989407 (= res!661667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36940 () Bool)

(declare-fun mapRes!36940 () Bool)

(declare-fun tp!69934 () Bool)

(declare-fun e!557899 () Bool)

(assert (=> mapNonEmpty!36940 (= mapRes!36940 (and tp!69934 e!557899))))

(declare-datatypes ((V!36001 0))(
  ( (V!36002 (val!11682 Int)) )
))
(declare-datatypes ((ValueCell!11150 0))(
  ( (ValueCellFull!11150 (v!14251 V!36001)) (EmptyCell!11150) )
))
(declare-fun mapValue!36940 () ValueCell!11150)

(declare-fun mapKey!36940 () (_ BitVec 32))

(declare-fun mapRest!36940 () (Array (_ BitVec 32) ValueCell!11150))

(declare-datatypes ((array!62424 0))(
  ( (array!62425 (arr!30065 (Array (_ BitVec 32) ValueCell!11150)) (size!30546 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62424)

(assert (=> mapNonEmpty!36940 (= (arr!30065 _values!1278) (store mapRest!36940 mapKey!36940 mapValue!36940))))

(declare-fun b!989408 () Bool)

(declare-fun e!557902 () Bool)

(declare-fun e!557903 () Bool)

(assert (=> b!989408 (= e!557902 (and e!557903 mapRes!36940))))

(declare-fun condMapEmpty!36940 () Bool)

(declare-fun mapDefault!36940 () ValueCell!11150)

(assert (=> b!989408 (= condMapEmpty!36940 (= (arr!30065 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11150)) mapDefault!36940)))))

(declare-fun b!989409 () Bool)

(declare-fun res!661670 () Bool)

(assert (=> b!989409 (=> (not res!661670) (not e!557901))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989409 (= res!661670 (and (= (size!30546 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30545 _keys!1544) (size!30546 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989410 () Bool)

(assert (=> b!989410 (= e!557901 false)))

(declare-fun zeroValue!1220 () V!36001)

(declare-datatypes ((tuple2!14970 0))(
  ( (tuple2!14971 (_1!7496 (_ BitVec 64)) (_2!7496 V!36001)) )
))
(declare-datatypes ((List!20854 0))(
  ( (Nil!20851) (Cons!20850 (h!22012 tuple2!14970) (t!29802 List!20854)) )
))
(declare-datatypes ((ListLongMap!13657 0))(
  ( (ListLongMap!13658 (toList!6844 List!20854)) )
))
(declare-fun lt!438862 () ListLongMap!13657)

(declare-fun defaultEntry!1281 () Int)

(declare-fun minValue!1220 () V!36001)

(declare-fun getCurrentListMapNoExtraKeys!3544 (array!62422 array!62424 (_ BitVec 32) (_ BitVec 32) V!36001 V!36001 (_ BitVec 32) Int) ListLongMap!13657)

(assert (=> b!989410 (= lt!438862 (getCurrentListMapNoExtraKeys!3544 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989411 () Bool)

(declare-fun tp_is_empty!23263 () Bool)

(assert (=> b!989411 (= e!557903 tp_is_empty!23263)))

(declare-fun b!989412 () Bool)

(declare-fun res!661671 () Bool)

(assert (=> b!989412 (=> (not res!661671) (not e!557901))))

(assert (=> b!989412 (= res!661671 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989413 () Bool)

(declare-fun res!661669 () Bool)

(assert (=> b!989413 (=> (not res!661669) (not e!557901))))

(assert (=> b!989413 (= res!661669 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30545 _keys!1544))))))

(declare-fun b!989414 () Bool)

(declare-fun res!661668 () Bool)

(assert (=> b!989414 (=> (not res!661668) (not e!557901))))

(declare-datatypes ((List!20855 0))(
  ( (Nil!20852) (Cons!20851 (h!22013 (_ BitVec 64)) (t!29803 List!20855)) )
))
(declare-fun arrayNoDuplicates!0 (array!62422 (_ BitVec 32) List!20855) Bool)

(assert (=> b!989414 (= res!661668 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20852))))

(declare-fun res!661672 () Bool)

(assert (=> start!84604 (=> (not res!661672) (not e!557901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84604 (= res!661672 (validMask!0 mask!1948))))

(assert (=> start!84604 e!557901))

(assert (=> start!84604 true))

(assert (=> start!84604 tp_is_empty!23263))

(declare-fun array_inv!23233 (array!62424) Bool)

(assert (=> start!84604 (and (array_inv!23233 _values!1278) e!557902)))

(assert (=> start!84604 tp!69933))

(declare-fun array_inv!23234 (array!62422) Bool)

(assert (=> start!84604 (array_inv!23234 _keys!1544)))

(declare-fun b!989415 () Bool)

(assert (=> b!989415 (= e!557899 tp_is_empty!23263)))

(declare-fun mapIsEmpty!36940 () Bool)

(assert (=> mapIsEmpty!36940 mapRes!36940))

(assert (= (and start!84604 res!661672) b!989409))

(assert (= (and b!989409 res!661670) b!989407))

(assert (= (and b!989407 res!661667) b!989414))

(assert (= (and b!989414 res!661668) b!989413))

(assert (= (and b!989413 res!661669) b!989406))

(assert (= (and b!989406 res!661666) b!989412))

(assert (= (and b!989412 res!661671) b!989410))

(assert (= (and b!989408 condMapEmpty!36940) mapIsEmpty!36940))

(assert (= (and b!989408 (not condMapEmpty!36940)) mapNonEmpty!36940))

(get-info :version)

(assert (= (and mapNonEmpty!36940 ((_ is ValueCellFull!11150) mapValue!36940)) b!989415))

(assert (= (and b!989408 ((_ is ValueCellFull!11150) mapDefault!36940)) b!989411))

(assert (= start!84604 b!989408))

(declare-fun m!916419 () Bool)

(assert (=> b!989406 m!916419))

(assert (=> b!989406 m!916419))

(declare-fun m!916421 () Bool)

(assert (=> b!989406 m!916421))

(declare-fun m!916423 () Bool)

(assert (=> b!989410 m!916423))

(declare-fun m!916425 () Bool)

(assert (=> b!989407 m!916425))

(declare-fun m!916427 () Bool)

(assert (=> start!84604 m!916427))

(declare-fun m!916429 () Bool)

(assert (=> start!84604 m!916429))

(declare-fun m!916431 () Bool)

(assert (=> start!84604 m!916431))

(declare-fun m!916433 () Bool)

(assert (=> mapNonEmpty!36940 m!916433))

(declare-fun m!916435 () Bool)

(assert (=> b!989414 m!916435))

(check-sat (not start!84604) (not b!989407) (not b_next!20047) tp_is_empty!23263 (not mapNonEmpty!36940) (not b!989406) (not b!989414) (not b!989410) b_and!32153)
(check-sat b_and!32153 (not b_next!20047))
