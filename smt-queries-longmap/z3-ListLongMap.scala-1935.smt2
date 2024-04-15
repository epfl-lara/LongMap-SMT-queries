; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34290 () Bool)

(assert start!34290)

(declare-fun b_free!7279 () Bool)

(declare-fun b_next!7279 () Bool)

(assert (=> start!34290 (= b_free!7279 (not b_next!7279))))

(declare-fun tp!25377 () Bool)

(declare-fun b_and!14457 () Bool)

(assert (=> start!34290 (= tp!25377 b_and!14457)))

(declare-fun b!341988 () Bool)

(declare-fun e!209719 () Bool)

(declare-fun e!209716 () Bool)

(assert (=> b!341988 (= e!209719 e!209716)))

(declare-fun res!189057 () Bool)

(assert (=> b!341988 (=> (not res!189057) (not e!209716))))

(declare-datatypes ((SeekEntryResult!3290 0))(
  ( (MissingZero!3290 (index!15339 (_ BitVec 32))) (Found!3290 (index!15340 (_ BitVec 32))) (Intermediate!3290 (undefined!4102 Bool) (index!15341 (_ BitVec 32)) (x!34067 (_ BitVec 32))) (Undefined!3290) (MissingVacant!3290 (index!15342 (_ BitVec 32))) )
))
(declare-fun lt!161871 () SeekEntryResult!3290)

(get-info :version)

(assert (=> b!341988 (= res!189057 (and (not ((_ is Found!3290) lt!161871)) (not ((_ is MissingZero!3290) lt!161871)) ((_ is MissingVacant!3290) lt!161871)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18041 0))(
  ( (array!18042 (arr!8539 (Array (_ BitVec 32) (_ BitVec 64))) (size!8892 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18041)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18041 (_ BitVec 32)) SeekEntryResult!3290)

(assert (=> b!341988 (= lt!161871 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12279 () Bool)

(declare-fun mapRes!12279 () Bool)

(assert (=> mapIsEmpty!12279 mapRes!12279))

(declare-fun res!189062 () Bool)

(assert (=> start!34290 (=> (not res!189062) (not e!209719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34290 (= res!189062 (validMask!0 mask!2385))))

(assert (=> start!34290 e!209719))

(assert (=> start!34290 true))

(declare-fun tp_is_empty!7231 () Bool)

(assert (=> start!34290 tp_is_empty!7231))

(assert (=> start!34290 tp!25377))

(declare-datatypes ((V!10619 0))(
  ( (V!10620 (val!3660 Int)) )
))
(declare-datatypes ((ValueCell!3272 0))(
  ( (ValueCellFull!3272 (v!5828 V!10619)) (EmptyCell!3272) )
))
(declare-datatypes ((array!18043 0))(
  ( (array!18044 (arr!8540 (Array (_ BitVec 32) ValueCell!3272)) (size!8893 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18043)

(declare-fun e!209715 () Bool)

(declare-fun array_inv!6352 (array!18043) Bool)

(assert (=> start!34290 (and (array_inv!6352 _values!1525) e!209715)))

(declare-fun array_inv!6353 (array!18041) Bool)

(assert (=> start!34290 (array_inv!6353 _keys!1895)))

(declare-fun b!341989 () Bool)

(declare-fun res!189059 () Bool)

(assert (=> b!341989 (=> (not res!189059) (not e!209719))))

(declare-fun zeroValue!1467 () V!10619)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10619)

(declare-datatypes ((tuple2!5252 0))(
  ( (tuple2!5253 (_1!2637 (_ BitVec 64)) (_2!2637 V!10619)) )
))
(declare-datatypes ((List!4876 0))(
  ( (Nil!4873) (Cons!4872 (h!5728 tuple2!5252) (t!9979 List!4876)) )
))
(declare-datatypes ((ListLongMap!4155 0))(
  ( (ListLongMap!4156 (toList!2093 List!4876)) )
))
(declare-fun contains!2160 (ListLongMap!4155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1599 (array!18041 array!18043 (_ BitVec 32) (_ BitVec 32) V!10619 V!10619 (_ BitVec 32) Int) ListLongMap!4155)

(assert (=> b!341989 (= res!189059 (not (contains!2160 (getCurrentListMap!1599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341990 () Bool)

(declare-fun e!209717 () Bool)

(assert (=> b!341990 (= e!209717 tp_is_empty!7231)))

(declare-fun b!341991 () Bool)

(declare-fun res!189061 () Bool)

(assert (=> b!341991 (=> (not res!189061) (not e!209719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341991 (= res!189061 (validKeyInArray!0 k0!1348))))

(declare-fun b!341992 () Bool)

(declare-fun res!189060 () Bool)

(assert (=> b!341992 (=> (not res!189060) (not e!209719))))

(declare-datatypes ((List!4877 0))(
  ( (Nil!4874) (Cons!4873 (h!5729 (_ BitVec 64)) (t!9980 List!4877)) )
))
(declare-fun arrayNoDuplicates!0 (array!18041 (_ BitVec 32) List!4877) Bool)

(assert (=> b!341992 (= res!189060 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4874))))

(declare-fun b!341993 () Bool)

(declare-fun res!189058 () Bool)

(assert (=> b!341993 (=> (not res!189058) (not e!209719))))

(assert (=> b!341993 (= res!189058 (and (= (size!8893 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8892 _keys!1895) (size!8893 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341994 () Bool)

(assert (=> b!341994 (= e!209716 false)))

(declare-datatypes ((Unit!10609 0))(
  ( (Unit!10610) )
))
(declare-fun lt!161869 () Unit!10609)

(declare-fun e!209718 () Unit!10609)

(assert (=> b!341994 (= lt!161869 e!209718)))

(declare-fun c!52727 () Bool)

(declare-fun arrayContainsKey!0 (array!18041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341994 (= c!52727 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341995 () Bool)

(declare-fun Unit!10611 () Unit!10609)

(assert (=> b!341995 (= e!209718 Unit!10611)))

(declare-fun lt!161870 () Unit!10609)

(declare-fun lemmaArrayContainsKeyThenInListMap!295 (array!18041 array!18043 (_ BitVec 32) (_ BitVec 32) V!10619 V!10619 (_ BitVec 64) (_ BitVec 32) Int) Unit!10609)

(declare-fun arrayScanForKey!0 (array!18041 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341995 (= lt!161870 (lemmaArrayContainsKeyThenInListMap!295 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341995 false))

(declare-fun b!341996 () Bool)

(declare-fun e!209714 () Bool)

(assert (=> b!341996 (= e!209714 tp_is_empty!7231)))

(declare-fun b!341997 () Bool)

(declare-fun Unit!10612 () Unit!10609)

(assert (=> b!341997 (= e!209718 Unit!10612)))

(declare-fun b!341998 () Bool)

(assert (=> b!341998 (= e!209715 (and e!209714 mapRes!12279))))

(declare-fun condMapEmpty!12279 () Bool)

(declare-fun mapDefault!12279 () ValueCell!3272)

(assert (=> b!341998 (= condMapEmpty!12279 (= (arr!8540 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3272)) mapDefault!12279)))))

(declare-fun b!341999 () Bool)

(declare-fun res!189056 () Bool)

(assert (=> b!341999 (=> (not res!189056) (not e!209719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18041 (_ BitVec 32)) Bool)

(assert (=> b!341999 (= res!189056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12279 () Bool)

(declare-fun tp!25376 () Bool)

(assert (=> mapNonEmpty!12279 (= mapRes!12279 (and tp!25376 e!209717))))

(declare-fun mapValue!12279 () ValueCell!3272)

(declare-fun mapRest!12279 () (Array (_ BitVec 32) ValueCell!3272))

(declare-fun mapKey!12279 () (_ BitVec 32))

(assert (=> mapNonEmpty!12279 (= (arr!8540 _values!1525) (store mapRest!12279 mapKey!12279 mapValue!12279))))

(assert (= (and start!34290 res!189062) b!341993))

(assert (= (and b!341993 res!189058) b!341999))

(assert (= (and b!341999 res!189056) b!341992))

(assert (= (and b!341992 res!189060) b!341991))

(assert (= (and b!341991 res!189061) b!341989))

(assert (= (and b!341989 res!189059) b!341988))

(assert (= (and b!341988 res!189057) b!341994))

(assert (= (and b!341994 c!52727) b!341995))

(assert (= (and b!341994 (not c!52727)) b!341997))

(assert (= (and b!341998 condMapEmpty!12279) mapIsEmpty!12279))

(assert (= (and b!341998 (not condMapEmpty!12279)) mapNonEmpty!12279))

(assert (= (and mapNonEmpty!12279 ((_ is ValueCellFull!3272) mapValue!12279)) b!341990))

(assert (= (and b!341998 ((_ is ValueCellFull!3272) mapDefault!12279)) b!341996))

(assert (= start!34290 b!341998))

(declare-fun m!343737 () Bool)

(assert (=> mapNonEmpty!12279 m!343737))

(declare-fun m!343739 () Bool)

(assert (=> b!341995 m!343739))

(assert (=> b!341995 m!343739))

(declare-fun m!343741 () Bool)

(assert (=> b!341995 m!343741))

(declare-fun m!343743 () Bool)

(assert (=> b!341991 m!343743))

(declare-fun m!343745 () Bool)

(assert (=> b!341992 m!343745))

(declare-fun m!343747 () Bool)

(assert (=> start!34290 m!343747))

(declare-fun m!343749 () Bool)

(assert (=> start!34290 m!343749))

(declare-fun m!343751 () Bool)

(assert (=> start!34290 m!343751))

(declare-fun m!343753 () Bool)

(assert (=> b!341999 m!343753))

(declare-fun m!343755 () Bool)

(assert (=> b!341988 m!343755))

(declare-fun m!343757 () Bool)

(assert (=> b!341994 m!343757))

(declare-fun m!343759 () Bool)

(assert (=> b!341989 m!343759))

(assert (=> b!341989 m!343759))

(declare-fun m!343761 () Bool)

(assert (=> b!341989 m!343761))

(check-sat (not start!34290) (not b!341995) (not b!341988) (not b!341991) tp_is_empty!7231 (not b!341992) (not b_next!7279) (not mapNonEmpty!12279) (not b!341999) (not b!341989) (not b!341994) b_and!14457)
(check-sat b_and!14457 (not b_next!7279))
