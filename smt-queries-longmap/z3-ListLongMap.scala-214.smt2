; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3956 () Bool)

(assert start!3956)

(declare-fun b_free!871 () Bool)

(declare-fun b_next!871 () Bool)

(assert (=> start!3956 (= b_free!871 (not b_next!871))))

(declare-fun tp!4033 () Bool)

(declare-fun b_and!1675 () Bool)

(assert (=> start!3956 (= tp!4033 b_and!1675)))

(declare-fun b!28403 () Bool)

(declare-fun res!16925 () Bool)

(declare-fun e!18360 () Bool)

(assert (=> b!28403 (=> (not res!16925) (not e!18360))))

(declare-datatypes ((array!1663 0))(
  ( (array!1664 (arr!785 (Array (_ BitVec 32) (_ BitVec 64))) (size!886 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1663)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1663 (_ BitVec 32)) Bool)

(assert (=> b!28403 (= res!16925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28404 () Bool)

(declare-fun e!18364 () Bool)

(declare-fun tp_is_empty!1225 () Bool)

(assert (=> b!28404 (= e!18364 tp_is_empty!1225)))

(declare-fun b!28405 () Bool)

(declare-fun res!16927 () Bool)

(assert (=> b!28405 (=> (not res!16927) (not e!18360))))

(declare-datatypes ((List!661 0))(
  ( (Nil!658) (Cons!657 (h!1224 (_ BitVec 64)) (t!3347 List!661)) )
))
(declare-fun arrayNoDuplicates!0 (array!1663 (_ BitVec 32) List!661) Bool)

(assert (=> b!28405 (= res!16927 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!658))))

(declare-fun mapNonEmpty!1366 () Bool)

(declare-fun mapRes!1366 () Bool)

(declare-fun tp!4032 () Bool)

(declare-fun e!18361 () Bool)

(assert (=> mapNonEmpty!1366 (= mapRes!1366 (and tp!4032 e!18361))))

(declare-datatypes ((V!1459 0))(
  ( (V!1460 (val!639 Int)) )
))
(declare-datatypes ((ValueCell!413 0))(
  ( (ValueCellFull!413 (v!1727 V!1459)) (EmptyCell!413) )
))
(declare-datatypes ((array!1665 0))(
  ( (array!1666 (arr!786 (Array (_ BitVec 32) ValueCell!413)) (size!887 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1665)

(declare-fun mapValue!1366 () ValueCell!413)

(declare-fun mapKey!1366 () (_ BitVec 32))

(declare-fun mapRest!1366 () (Array (_ BitVec 32) ValueCell!413))

(assert (=> mapNonEmpty!1366 (= (arr!786 _values!1501) (store mapRest!1366 mapKey!1366 mapValue!1366))))

(declare-fun b!28406 () Bool)

(declare-fun e!18358 () Bool)

(declare-fun e!18359 () Bool)

(assert (=> b!28406 (= e!18358 (not e!18359))))

(declare-fun res!16924 () Bool)

(assert (=> b!28406 (=> res!16924 e!18359)))

(assert (=> b!28406 (= res!16924 (not (= (size!886 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1076 0))(
  ( (tuple2!1077 (_1!549 (_ BitVec 64)) (_2!549 V!1459)) )
))
(declare-datatypes ((List!662 0))(
  ( (Nil!659) (Cons!658 (h!1225 tuple2!1076) (t!3348 List!662)) )
))
(declare-datatypes ((ListLongMap!641 0))(
  ( (ListLongMap!642 (toList!336 List!662)) )
))
(declare-fun lt!10811 () ListLongMap!641)

(declare-fun lt!10813 () (_ BitVec 32))

(declare-fun contains!277 (ListLongMap!641 (_ BitVec 64)) Bool)

(assert (=> b!28406 (contains!277 lt!10811 (select (arr!785 _keys!1833) lt!10813))))

(declare-datatypes ((Unit!648 0))(
  ( (Unit!649) )
))
(declare-fun lt!10812 () Unit!648)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1459)

(declare-fun minValue!1443 () V!1459)

(declare-fun lemmaValidKeyInArrayIsInListMap!14 (array!1663 array!1665 (_ BitVec 32) (_ BitVec 32) V!1459 V!1459 (_ BitVec 32) Int) Unit!648)

(assert (=> b!28406 (= lt!10812 (lemmaValidKeyInArrayIsInListMap!14 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10813 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1663 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28406 (= lt!10813 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28407 () Bool)

(assert (=> b!28407 (= e!18360 e!18358)))

(declare-fun res!16929 () Bool)

(assert (=> b!28407 (=> (not res!16929) (not e!18358))))

(assert (=> b!28407 (= res!16929 (not (contains!277 lt!10811 k0!1304)))))

(declare-fun getCurrentListMap!166 (array!1663 array!1665 (_ BitVec 32) (_ BitVec 32) V!1459 V!1459 (_ BitVec 32) Int) ListLongMap!641)

(assert (=> b!28407 (= lt!10811 (getCurrentListMap!166 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28409 () Bool)

(assert (=> b!28409 (= e!18361 tp_is_empty!1225)))

(declare-fun mapIsEmpty!1366 () Bool)

(assert (=> mapIsEmpty!1366 mapRes!1366))

(declare-fun b!28410 () Bool)

(assert (=> b!28410 (= e!18359 true)))

(declare-datatypes ((SeekEntryResult!69 0))(
  ( (MissingZero!69 (index!2398 (_ BitVec 32))) (Found!69 (index!2399 (_ BitVec 32))) (Intermediate!69 (undefined!881 Bool) (index!2400 (_ BitVec 32)) (x!6323 (_ BitVec 32))) (Undefined!69) (MissingVacant!69 (index!2401 (_ BitVec 32))) )
))
(declare-fun lt!10810 () SeekEntryResult!69)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1663 (_ BitVec 32)) SeekEntryResult!69)

(assert (=> b!28410 (= lt!10810 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28411 () Bool)

(declare-fun res!16928 () Bool)

(assert (=> b!28411 (=> (not res!16928) (not e!18360))))

(assert (=> b!28411 (= res!16928 (and (= (size!887 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!886 _keys!1833) (size!887 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28412 () Bool)

(declare-fun res!16926 () Bool)

(assert (=> b!28412 (=> (not res!16926) (not e!18358))))

(declare-fun arrayContainsKey!0 (array!1663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28412 (= res!16926 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28413 () Bool)

(declare-fun e!18362 () Bool)

(assert (=> b!28413 (= e!18362 (and e!18364 mapRes!1366))))

(declare-fun condMapEmpty!1366 () Bool)

(declare-fun mapDefault!1366 () ValueCell!413)

(assert (=> b!28413 (= condMapEmpty!1366 (= (arr!786 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!413)) mapDefault!1366)))))

(declare-fun res!16923 () Bool)

(assert (=> start!3956 (=> (not res!16923) (not e!18360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3956 (= res!16923 (validMask!0 mask!2294))))

(assert (=> start!3956 e!18360))

(assert (=> start!3956 true))

(assert (=> start!3956 tp!4033))

(declare-fun array_inv!551 (array!1665) Bool)

(assert (=> start!3956 (and (array_inv!551 _values!1501) e!18362)))

(declare-fun array_inv!552 (array!1663) Bool)

(assert (=> start!3956 (array_inv!552 _keys!1833)))

(assert (=> start!3956 tp_is_empty!1225))

(declare-fun b!28408 () Bool)

(declare-fun res!16930 () Bool)

(assert (=> b!28408 (=> (not res!16930) (not e!18360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28408 (= res!16930 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3956 res!16923) b!28411))

(assert (= (and b!28411 res!16928) b!28403))

(assert (= (and b!28403 res!16925) b!28405))

(assert (= (and b!28405 res!16927) b!28408))

(assert (= (and b!28408 res!16930) b!28407))

(assert (= (and b!28407 res!16929) b!28412))

(assert (= (and b!28412 res!16926) b!28406))

(assert (= (and b!28406 (not res!16924)) b!28410))

(assert (= (and b!28413 condMapEmpty!1366) mapIsEmpty!1366))

(assert (= (and b!28413 (not condMapEmpty!1366)) mapNonEmpty!1366))

(get-info :version)

(assert (= (and mapNonEmpty!1366 ((_ is ValueCellFull!413) mapValue!1366)) b!28409))

(assert (= (and b!28413 ((_ is ValueCellFull!413) mapDefault!1366)) b!28404))

(assert (= start!3956 b!28413))

(declare-fun m!22587 () Bool)

(assert (=> b!28410 m!22587))

(declare-fun m!22589 () Bool)

(assert (=> b!28408 m!22589))

(declare-fun m!22591 () Bool)

(assert (=> b!28405 m!22591))

(declare-fun m!22593 () Bool)

(assert (=> b!28403 m!22593))

(declare-fun m!22595 () Bool)

(assert (=> b!28407 m!22595))

(declare-fun m!22597 () Bool)

(assert (=> b!28407 m!22597))

(declare-fun m!22599 () Bool)

(assert (=> b!28412 m!22599))

(declare-fun m!22601 () Bool)

(assert (=> b!28406 m!22601))

(assert (=> b!28406 m!22601))

(declare-fun m!22603 () Bool)

(assert (=> b!28406 m!22603))

(declare-fun m!22605 () Bool)

(assert (=> b!28406 m!22605))

(declare-fun m!22607 () Bool)

(assert (=> b!28406 m!22607))

(declare-fun m!22609 () Bool)

(assert (=> mapNonEmpty!1366 m!22609))

(declare-fun m!22611 () Bool)

(assert (=> start!3956 m!22611))

(declare-fun m!22613 () Bool)

(assert (=> start!3956 m!22613))

(declare-fun m!22615 () Bool)

(assert (=> start!3956 m!22615))

(check-sat b_and!1675 (not start!3956) tp_is_empty!1225 (not b!28405) (not b!28407) (not b!28410) (not b!28412) (not b!28403) (not b!28406) (not mapNonEmpty!1366) (not b!28408) (not b_next!871))
(check-sat b_and!1675 (not b_next!871))
