; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82926 () Bool)

(assert start!82926)

(declare-fun b_free!19053 () Bool)

(declare-fun b_next!19053 () Bool)

(assert (=> start!82926 (= b_free!19053 (not b_next!19053))))

(declare-fun tp!66287 () Bool)

(declare-fun b_and!30541 () Bool)

(assert (=> start!82926 (= tp!66287 b_and!30541)))

(declare-fun b!967713 () Bool)

(declare-fun res!647815 () Bool)

(declare-fun e!545411 () Bool)

(assert (=> b!967713 (=> (not res!647815) (not e!545411))))

(declare-datatypes ((array!59795 0))(
  ( (array!59796 (arr!28766 (Array (_ BitVec 32) (_ BitVec 64))) (size!29245 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59795)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967713 (= res!647815 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29245 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29245 _keys!1686))))))

(declare-fun b!967714 () Bool)

(declare-fun e!545409 () Bool)

(declare-fun tp_is_empty!21861 () Bool)

(assert (=> b!967714 (= e!545409 tp_is_empty!21861)))

(declare-fun b!967716 () Bool)

(declare-fun res!647816 () Bool)

(assert (=> b!967716 (=> (not res!647816) (not e!545411))))

(assert (=> b!967716 (= res!647816 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967717 () Bool)

(declare-fun e!545410 () Bool)

(declare-fun e!545408 () Bool)

(declare-fun mapRes!34786 () Bool)

(assert (=> b!967717 (= e!545410 (and e!545408 mapRes!34786))))

(declare-fun condMapEmpty!34786 () Bool)

(declare-datatypes ((V!34131 0))(
  ( (V!34132 (val!10981 Int)) )
))
(declare-datatypes ((ValueCell!10449 0))(
  ( (ValueCellFull!10449 (v!13539 V!34131)) (EmptyCell!10449) )
))
(declare-datatypes ((array!59797 0))(
  ( (array!59798 (arr!28767 (Array (_ BitVec 32) ValueCell!10449)) (size!29246 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59797)

(declare-fun mapDefault!34786 () ValueCell!10449)

(assert (=> b!967717 (= condMapEmpty!34786 (= (arr!28767 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10449)) mapDefault!34786)))))

(declare-fun mapNonEmpty!34786 () Bool)

(declare-fun tp!66288 () Bool)

(assert (=> mapNonEmpty!34786 (= mapRes!34786 (and tp!66288 e!545409))))

(declare-fun mapKey!34786 () (_ BitVec 32))

(declare-fun mapValue!34786 () ValueCell!10449)

(declare-fun mapRest!34786 () (Array (_ BitVec 32) ValueCell!10449))

(assert (=> mapNonEmpty!34786 (= (arr!28767 _values!1400) (store mapRest!34786 mapKey!34786 mapValue!34786))))

(declare-fun b!967718 () Bool)

(assert (=> b!967718 (= e!545408 tp_is_empty!21861)))

(declare-fun b!967719 () Bool)

(assert (=> b!967719 (= e!545411 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34131)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34131)

(declare-datatypes ((tuple2!14124 0))(
  ( (tuple2!14125 (_1!7073 (_ BitVec 64)) (_2!7073 V!34131)) )
))
(declare-datatypes ((List!19971 0))(
  ( (Nil!19968) (Cons!19967 (h!21129 tuple2!14124) (t!28334 List!19971)) )
))
(declare-datatypes ((ListLongMap!12821 0))(
  ( (ListLongMap!12822 (toList!6426 List!19971)) )
))
(declare-fun contains!5527 (ListLongMap!12821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3659 (array!59795 array!59797 (_ BitVec 32) (_ BitVec 32) V!34131 V!34131 (_ BitVec 32) Int) ListLongMap!12821)

(assert (=> b!967719 (contains!5527 (getCurrentListMap!3659 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28766 _keys!1686) i!803))))

(declare-datatypes ((Unit!32335 0))(
  ( (Unit!32336) )
))
(declare-fun lt!431446 () Unit!32335)

(declare-fun lemmaInListMapFromThenInFromMinusOne!62 (array!59795 array!59797 (_ BitVec 32) (_ BitVec 32) V!34131 V!34131 (_ BitVec 32) (_ BitVec 32) Int) Unit!32335)

(assert (=> b!967719 (= lt!431446 (lemmaInListMapFromThenInFromMinusOne!62 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!647813 () Bool)

(assert (=> start!82926 (=> (not res!647813) (not e!545411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82926 (= res!647813 (validMask!0 mask!2110))))

(assert (=> start!82926 e!545411))

(assert (=> start!82926 true))

(declare-fun array_inv!22271 (array!59797) Bool)

(assert (=> start!82926 (and (array_inv!22271 _values!1400) e!545410)))

(declare-fun array_inv!22272 (array!59795) Bool)

(assert (=> start!82926 (array_inv!22272 _keys!1686)))

(assert (=> start!82926 tp!66287))

(assert (=> start!82926 tp_is_empty!21861))

(declare-fun b!967715 () Bool)

(declare-fun res!647818 () Bool)

(assert (=> b!967715 (=> (not res!647818) (not e!545411))))

(assert (=> b!967715 (= res!647818 (and (= (size!29246 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29245 _keys!1686) (size!29246 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967720 () Bool)

(declare-fun res!647812 () Bool)

(assert (=> b!967720 (=> (not res!647812) (not e!545411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967720 (= res!647812 (validKeyInArray!0 (select (arr!28766 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34786 () Bool)

(assert (=> mapIsEmpty!34786 mapRes!34786))

(declare-fun b!967721 () Bool)

(declare-fun res!647817 () Bool)

(assert (=> b!967721 (=> (not res!647817) (not e!545411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59795 (_ BitVec 32)) Bool)

(assert (=> b!967721 (= res!647817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967722 () Bool)

(declare-fun res!647811 () Bool)

(assert (=> b!967722 (=> (not res!647811) (not e!545411))))

(assert (=> b!967722 (= res!647811 (contains!5527 (getCurrentListMap!3659 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28766 _keys!1686) i!803)))))

(declare-fun b!967723 () Bool)

(declare-fun res!647814 () Bool)

(assert (=> b!967723 (=> (not res!647814) (not e!545411))))

(declare-datatypes ((List!19972 0))(
  ( (Nil!19969) (Cons!19968 (h!21130 (_ BitVec 64)) (t!28335 List!19972)) )
))
(declare-fun arrayNoDuplicates!0 (array!59795 (_ BitVec 32) List!19972) Bool)

(assert (=> b!967723 (= res!647814 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19969))))

(assert (= (and start!82926 res!647813) b!967715))

(assert (= (and b!967715 res!647818) b!967721))

(assert (= (and b!967721 res!647817) b!967723))

(assert (= (and b!967723 res!647814) b!967713))

(assert (= (and b!967713 res!647815) b!967720))

(assert (= (and b!967720 res!647812) b!967722))

(assert (= (and b!967722 res!647811) b!967716))

(assert (= (and b!967716 res!647816) b!967719))

(assert (= (and b!967717 condMapEmpty!34786) mapIsEmpty!34786))

(assert (= (and b!967717 (not condMapEmpty!34786)) mapNonEmpty!34786))

(get-info :version)

(assert (= (and mapNonEmpty!34786 ((_ is ValueCellFull!10449) mapValue!34786)) b!967714))

(assert (= (and b!967717 ((_ is ValueCellFull!10449) mapDefault!34786)) b!967718))

(assert (= start!82926 b!967717))

(declare-fun m!896207 () Bool)

(assert (=> start!82926 m!896207))

(declare-fun m!896209 () Bool)

(assert (=> start!82926 m!896209))

(declare-fun m!896211 () Bool)

(assert (=> start!82926 m!896211))

(declare-fun m!896213 () Bool)

(assert (=> b!967719 m!896213))

(declare-fun m!896215 () Bool)

(assert (=> b!967719 m!896215))

(assert (=> b!967719 m!896213))

(assert (=> b!967719 m!896215))

(declare-fun m!896217 () Bool)

(assert (=> b!967719 m!896217))

(declare-fun m!896219 () Bool)

(assert (=> b!967719 m!896219))

(assert (=> b!967720 m!896215))

(assert (=> b!967720 m!896215))

(declare-fun m!896221 () Bool)

(assert (=> b!967720 m!896221))

(declare-fun m!896223 () Bool)

(assert (=> b!967721 m!896223))

(declare-fun m!896225 () Bool)

(assert (=> b!967722 m!896225))

(assert (=> b!967722 m!896215))

(assert (=> b!967722 m!896225))

(assert (=> b!967722 m!896215))

(declare-fun m!896227 () Bool)

(assert (=> b!967722 m!896227))

(declare-fun m!896229 () Bool)

(assert (=> b!967723 m!896229))

(declare-fun m!896231 () Bool)

(assert (=> mapNonEmpty!34786 m!896231))

(check-sat (not b_next!19053) (not b!967723) (not b!967722) tp_is_empty!21861 (not b!967721) (not start!82926) (not mapNonEmpty!34786) b_and!30541 (not b!967719) (not b!967720))
(check-sat b_and!30541 (not b_next!19053))
