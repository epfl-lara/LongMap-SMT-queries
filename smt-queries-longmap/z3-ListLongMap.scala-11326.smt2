; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131862 () Bool)

(assert start!131862)

(declare-fun mapIsEmpty!58480 () Bool)

(declare-fun mapRes!58480 () Bool)

(assert (=> mapIsEmpty!58480 mapRes!58480))

(declare-fun b!1543713 () Bool)

(declare-fun res!1059132 () Bool)

(declare-fun e!859193 () Bool)

(assert (=> b!1543713 (=> (not res!1059132) (not e!859193))))

(declare-datatypes ((array!102922 0))(
  ( (array!102923 (arr!49663 (Array (_ BitVec 32) (_ BitVec 64))) (size!50213 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102922)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102922 (_ BitVec 32)) Bool)

(assert (=> b!1543713 (= res!1059132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543714 () Bool)

(assert (=> b!1543714 (= e!859193 false)))

(declare-fun lt!666029 () Bool)

(declare-datatypes ((List!35930 0))(
  ( (Nil!35927) (Cons!35926 (h!37371 (_ BitVec 64)) (t!50624 List!35930)) )
))
(declare-fun arrayNoDuplicates!0 (array!102922 (_ BitVec 32) List!35930) Bool)

(assert (=> b!1543714 (= lt!666029 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35927))))

(declare-fun b!1543715 () Bool)

(declare-fun res!1059130 () Bool)

(assert (=> b!1543715 (=> (not res!1059130) (not e!859193))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58911 0))(
  ( (V!58912 (val!19003 Int)) )
))
(declare-datatypes ((ValueCell!18015 0))(
  ( (ValueCellFull!18015 (v!21804 V!58911)) (EmptyCell!18015) )
))
(declare-datatypes ((array!102924 0))(
  ( (array!102925 (arr!49664 (Array (_ BitVec 32) ValueCell!18015)) (size!50214 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102924)

(assert (=> b!1543715 (= res!1059130 (and (= (size!50214 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50213 _keys!618) (size!50214 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543716 () Bool)

(declare-fun e!859190 () Bool)

(declare-fun tp_is_empty!37851 () Bool)

(assert (=> b!1543716 (= e!859190 tp_is_empty!37851)))

(declare-fun b!1543717 () Bool)

(declare-fun e!859194 () Bool)

(assert (=> b!1543717 (= e!859194 tp_is_empty!37851)))

(declare-fun res!1059131 () Bool)

(assert (=> start!131862 (=> (not res!1059131) (not e!859193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131862 (= res!1059131 (validMask!0 mask!926))))

(assert (=> start!131862 e!859193))

(assert (=> start!131862 true))

(declare-fun e!859191 () Bool)

(declare-fun array_inv!38633 (array!102924) Bool)

(assert (=> start!131862 (and (array_inv!38633 _values!470) e!859191)))

(declare-fun array_inv!38634 (array!102922) Bool)

(assert (=> start!131862 (array_inv!38634 _keys!618)))

(declare-fun b!1543718 () Bool)

(assert (=> b!1543718 (= e!859191 (and e!859194 mapRes!58480))))

(declare-fun condMapEmpty!58480 () Bool)

(declare-fun mapDefault!58480 () ValueCell!18015)

(assert (=> b!1543718 (= condMapEmpty!58480 (= (arr!49664 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18015)) mapDefault!58480)))))

(declare-fun mapNonEmpty!58480 () Bool)

(declare-fun tp!111007 () Bool)

(assert (=> mapNonEmpty!58480 (= mapRes!58480 (and tp!111007 e!859190))))

(declare-fun mapKey!58480 () (_ BitVec 32))

(declare-fun mapRest!58480 () (Array (_ BitVec 32) ValueCell!18015))

(declare-fun mapValue!58480 () ValueCell!18015)

(assert (=> mapNonEmpty!58480 (= (arr!49664 _values!470) (store mapRest!58480 mapKey!58480 mapValue!58480))))

(assert (= (and start!131862 res!1059131) b!1543715))

(assert (= (and b!1543715 res!1059130) b!1543713))

(assert (= (and b!1543713 res!1059132) b!1543714))

(assert (= (and b!1543718 condMapEmpty!58480) mapIsEmpty!58480))

(assert (= (and b!1543718 (not condMapEmpty!58480)) mapNonEmpty!58480))

(get-info :version)

(assert (= (and mapNonEmpty!58480 ((_ is ValueCellFull!18015) mapValue!58480)) b!1543716))

(assert (= (and b!1543718 ((_ is ValueCellFull!18015) mapDefault!58480)) b!1543717))

(assert (= start!131862 b!1543718))

(declare-fun m!1424929 () Bool)

(assert (=> b!1543713 m!1424929))

(declare-fun m!1424931 () Bool)

(assert (=> b!1543714 m!1424931))

(declare-fun m!1424933 () Bool)

(assert (=> start!131862 m!1424933))

(declare-fun m!1424935 () Bool)

(assert (=> start!131862 m!1424935))

(declare-fun m!1424937 () Bool)

(assert (=> start!131862 m!1424937))

(declare-fun m!1424939 () Bool)

(assert (=> mapNonEmpty!58480 m!1424939))

(check-sat tp_is_empty!37851 (not mapNonEmpty!58480) (not start!131862) (not b!1543713) (not b!1543714))
(check-sat)
