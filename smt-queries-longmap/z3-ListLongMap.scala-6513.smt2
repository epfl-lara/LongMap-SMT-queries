; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82920 () Bool)

(assert start!82920)

(declare-fun b_free!19047 () Bool)

(declare-fun b_next!19047 () Bool)

(assert (=> start!82920 (= b_free!19047 (not b_next!19047))))

(declare-fun tp!66269 () Bool)

(declare-fun b_and!30535 () Bool)

(assert (=> start!82920 (= tp!66269 b_and!30535)))

(declare-fun b!967614 () Bool)

(declare-fun res!647742 () Bool)

(declare-fun e!545363 () Bool)

(assert (=> b!967614 (=> (not res!647742) (not e!545363))))

(declare-datatypes ((array!59783 0))(
  ( (array!59784 (arr!28760 (Array (_ BitVec 32) (_ BitVec 64))) (size!29239 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59783)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967614 (= res!647742 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29239 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29239 _keys!1686))))))

(declare-fun b!967615 () Bool)

(declare-fun res!647745 () Bool)

(assert (=> b!967615 (=> (not res!647745) (not e!545363))))

(declare-datatypes ((List!19968 0))(
  ( (Nil!19965) (Cons!19964 (h!21126 (_ BitVec 64)) (t!28331 List!19968)) )
))
(declare-fun arrayNoDuplicates!0 (array!59783 (_ BitVec 32) List!19968) Bool)

(assert (=> b!967615 (= res!647745 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19965))))

(declare-fun b!967616 () Bool)

(declare-fun res!647741 () Bool)

(assert (=> b!967616 (=> (not res!647741) (not e!545363))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34123 0))(
  ( (V!34124 (val!10978 Int)) )
))
(declare-datatypes ((ValueCell!10446 0))(
  ( (ValueCellFull!10446 (v!13536 V!34123)) (EmptyCell!10446) )
))
(declare-datatypes ((array!59785 0))(
  ( (array!59786 (arr!28761 (Array (_ BitVec 32) ValueCell!10446)) (size!29240 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59785)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!967616 (= res!647741 (and (= (size!29240 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29239 _keys!1686) (size!29240 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967617 () Bool)

(declare-fun res!647746 () Bool)

(assert (=> b!967617 (=> (not res!647746) (not e!545363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967617 (= res!647746 (validKeyInArray!0 (select (arr!28760 _keys!1686) i!803)))))

(declare-fun b!967618 () Bool)

(assert (=> b!967618 (= e!545363 (not (and (bvsge (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2084 #b00000000000000000000000000000001) (size!29239 _keys!1686)))))))

(declare-fun minValue!1342 () V!34123)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34123)

(declare-datatypes ((tuple2!14120 0))(
  ( (tuple2!14121 (_1!7071 (_ BitVec 64)) (_2!7071 V!34123)) )
))
(declare-datatypes ((List!19969 0))(
  ( (Nil!19966) (Cons!19965 (h!21127 tuple2!14120) (t!28332 List!19969)) )
))
(declare-datatypes ((ListLongMap!12817 0))(
  ( (ListLongMap!12818 (toList!6424 List!19969)) )
))
(declare-fun contains!5525 (ListLongMap!12817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3657 (array!59783 array!59785 (_ BitVec 32) (_ BitVec 32) V!34123 V!34123 (_ BitVec 32) Int) ListLongMap!12817)

(assert (=> b!967618 (contains!5525 (getCurrentListMap!3657 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28760 _keys!1686) i!803))))

(declare-datatypes ((Unit!32331 0))(
  ( (Unit!32332) )
))
(declare-fun lt!431437 () Unit!32331)

(declare-fun lemmaInListMapFromThenInFromMinusOne!60 (array!59783 array!59785 (_ BitVec 32) (_ BitVec 32) V!34123 V!34123 (_ BitVec 32) (_ BitVec 32) Int) Unit!32331)

(assert (=> b!967618 (= lt!431437 (lemmaInListMapFromThenInFromMinusOne!60 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967619 () Bool)

(declare-fun e!545364 () Bool)

(declare-fun e!545365 () Bool)

(declare-fun mapRes!34777 () Bool)

(assert (=> b!967619 (= e!545364 (and e!545365 mapRes!34777))))

(declare-fun condMapEmpty!34777 () Bool)

(declare-fun mapDefault!34777 () ValueCell!10446)

(assert (=> b!967619 (= condMapEmpty!34777 (= (arr!28761 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10446)) mapDefault!34777)))))

(declare-fun b!967620 () Bool)

(declare-fun tp_is_empty!21855 () Bool)

(assert (=> b!967620 (= e!545365 tp_is_empty!21855)))

(declare-fun b!967621 () Bool)

(declare-fun res!647739 () Bool)

(assert (=> b!967621 (=> (not res!647739) (not e!545363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59783 (_ BitVec 32)) Bool)

(assert (=> b!967621 (= res!647739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967622 () Bool)

(declare-fun res!647743 () Bool)

(assert (=> b!967622 (=> (not res!647743) (not e!545363))))

(assert (=> b!967622 (= res!647743 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967623 () Bool)

(declare-fun e!545362 () Bool)

(assert (=> b!967623 (= e!545362 tp_is_empty!21855)))

(declare-fun mapNonEmpty!34777 () Bool)

(declare-fun tp!66270 () Bool)

(assert (=> mapNonEmpty!34777 (= mapRes!34777 (and tp!66270 e!545362))))

(declare-fun mapKey!34777 () (_ BitVec 32))

(declare-fun mapRest!34777 () (Array (_ BitVec 32) ValueCell!10446))

(declare-fun mapValue!34777 () ValueCell!10446)

(assert (=> mapNonEmpty!34777 (= (arr!28761 _values!1400) (store mapRest!34777 mapKey!34777 mapValue!34777))))

(declare-fun mapIsEmpty!34777 () Bool)

(assert (=> mapIsEmpty!34777 mapRes!34777))

(declare-fun b!967624 () Bool)

(declare-fun res!647740 () Bool)

(assert (=> b!967624 (=> (not res!647740) (not e!545363))))

(assert (=> b!967624 (= res!647740 (contains!5525 (getCurrentListMap!3657 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28760 _keys!1686) i!803)))))

(declare-fun res!647744 () Bool)

(assert (=> start!82920 (=> (not res!647744) (not e!545363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82920 (= res!647744 (validMask!0 mask!2110))))

(assert (=> start!82920 e!545363))

(assert (=> start!82920 true))

(declare-fun array_inv!22269 (array!59785) Bool)

(assert (=> start!82920 (and (array_inv!22269 _values!1400) e!545364)))

(declare-fun array_inv!22270 (array!59783) Bool)

(assert (=> start!82920 (array_inv!22270 _keys!1686)))

(assert (=> start!82920 tp!66269))

(assert (=> start!82920 tp_is_empty!21855))

(assert (= (and start!82920 res!647744) b!967616))

(assert (= (and b!967616 res!647741) b!967621))

(assert (= (and b!967621 res!647739) b!967615))

(assert (= (and b!967615 res!647745) b!967614))

(assert (= (and b!967614 res!647742) b!967617))

(assert (= (and b!967617 res!647746) b!967624))

(assert (= (and b!967624 res!647740) b!967622))

(assert (= (and b!967622 res!647743) b!967618))

(assert (= (and b!967619 condMapEmpty!34777) mapIsEmpty!34777))

(assert (= (and b!967619 (not condMapEmpty!34777)) mapNonEmpty!34777))

(get-info :version)

(assert (= (and mapNonEmpty!34777 ((_ is ValueCellFull!10446) mapValue!34777)) b!967623))

(assert (= (and b!967619 ((_ is ValueCellFull!10446) mapDefault!34777)) b!967620))

(assert (= start!82920 b!967619))

(declare-fun m!896129 () Bool)

(assert (=> b!967624 m!896129))

(declare-fun m!896131 () Bool)

(assert (=> b!967624 m!896131))

(assert (=> b!967624 m!896129))

(assert (=> b!967624 m!896131))

(declare-fun m!896133 () Bool)

(assert (=> b!967624 m!896133))

(declare-fun m!896135 () Bool)

(assert (=> start!82920 m!896135))

(declare-fun m!896137 () Bool)

(assert (=> start!82920 m!896137))

(declare-fun m!896139 () Bool)

(assert (=> start!82920 m!896139))

(declare-fun m!896141 () Bool)

(assert (=> b!967618 m!896141))

(assert (=> b!967618 m!896131))

(assert (=> b!967618 m!896141))

(assert (=> b!967618 m!896131))

(declare-fun m!896143 () Bool)

(assert (=> b!967618 m!896143))

(declare-fun m!896145 () Bool)

(assert (=> b!967618 m!896145))

(declare-fun m!896147 () Bool)

(assert (=> b!967621 m!896147))

(assert (=> b!967617 m!896131))

(assert (=> b!967617 m!896131))

(declare-fun m!896149 () Bool)

(assert (=> b!967617 m!896149))

(declare-fun m!896151 () Bool)

(assert (=> mapNonEmpty!34777 m!896151))

(declare-fun m!896153 () Bool)

(assert (=> b!967615 m!896153))

(check-sat (not mapNonEmpty!34777) (not b!967618) b_and!30535 (not start!82920) (not b!967624) (not b_next!19047) (not b!967617) (not b!967615) (not b!967621) tp_is_empty!21855)
(check-sat b_and!30535 (not b_next!19047))
