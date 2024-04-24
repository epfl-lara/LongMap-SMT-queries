; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83116 () Bool)

(assert start!83116)

(declare-fun b_free!19075 () Bool)

(declare-fun b_next!19075 () Bool)

(assert (=> start!83116 (= b_free!19075 (not b_next!19075))))

(declare-fun tp!66355 () Bool)

(declare-fun b_and!30573 () Bool)

(assert (=> start!83116 (= tp!66355 b_and!30573)))

(declare-fun b!968981 () Bool)

(declare-fun e!546156 () Bool)

(declare-fun e!546160 () Bool)

(assert (=> b!968981 (= e!546156 (not e!546160))))

(declare-fun res!648428 () Bool)

(assert (=> b!968981 (=> res!648428 e!546160)))

(declare-datatypes ((array!59856 0))(
  ( (array!59857 (arr!28792 (Array (_ BitVec 32) (_ BitVec 64))) (size!29272 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59856)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968981 (= res!648428 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29272 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34161 0))(
  ( (V!34162 (val!10992 Int)) )
))
(declare-datatypes ((ValueCell!10460 0))(
  ( (ValueCellFull!10460 (v!13547 V!34161)) (EmptyCell!10460) )
))
(declare-datatypes ((array!59858 0))(
  ( (array!59859 (arr!28793 (Array (_ BitVec 32) ValueCell!10460)) (size!29273 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59858)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!34161)

(declare-fun zeroValue!1342 () V!34161)

(declare-datatypes ((tuple2!14134 0))(
  ( (tuple2!14135 (_1!7078 (_ BitVec 64)) (_2!7078 V!34161)) )
))
(declare-datatypes ((List!19978 0))(
  ( (Nil!19975) (Cons!19974 (h!21142 tuple2!14134) (t!28333 List!19978)) )
))
(declare-datatypes ((ListLongMap!12833 0))(
  ( (ListLongMap!12834 (toList!6432 List!19978)) )
))
(declare-fun contains!5544 (ListLongMap!12833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3665 (array!59856 array!59858 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) Int) ListLongMap!12833)

(assert (=> b!968981 (contains!5544 (getCurrentListMap!3665 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28792 _keys!1686) i!803))))

(declare-datatypes ((Unit!32316 0))(
  ( (Unit!32317) )
))
(declare-fun lt!431842 () Unit!32316)

(declare-fun lemmaInListMapFromThenInFromMinusOne!69 (array!59856 array!59858 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) Int) Unit!32316)

(assert (=> b!968981 (= lt!431842 (lemmaInListMapFromThenInFromMinusOne!69 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968982 () Bool)

(declare-fun e!546159 () Bool)

(declare-fun e!546158 () Bool)

(declare-fun mapRes!34819 () Bool)

(assert (=> b!968982 (= e!546159 (and e!546158 mapRes!34819))))

(declare-fun condMapEmpty!34819 () Bool)

(declare-fun mapDefault!34819 () ValueCell!10460)

(assert (=> b!968982 (= condMapEmpty!34819 (= (arr!28793 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10460)) mapDefault!34819)))))

(declare-fun mapNonEmpty!34819 () Bool)

(declare-fun tp!66354 () Bool)

(declare-fun e!546161 () Bool)

(assert (=> mapNonEmpty!34819 (= mapRes!34819 (and tp!66354 e!546161))))

(declare-fun mapValue!34819 () ValueCell!10460)

(declare-fun mapKey!34819 () (_ BitVec 32))

(declare-fun mapRest!34819 () (Array (_ BitVec 32) ValueCell!10460))

(assert (=> mapNonEmpty!34819 (= (arr!28793 _values!1400) (store mapRest!34819 mapKey!34819 mapValue!34819))))

(declare-fun mapIsEmpty!34819 () Bool)

(assert (=> mapIsEmpty!34819 mapRes!34819))

(declare-fun b!968983 () Bool)

(declare-fun res!648421 () Bool)

(assert (=> b!968983 (=> (not res!648421) (not e!546156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968983 (= res!648421 (validKeyInArray!0 (select (arr!28792 _keys!1686) i!803)))))

(declare-fun b!968985 () Bool)

(declare-fun res!648426 () Bool)

(assert (=> b!968985 (=> (not res!648426) (not e!546156))))

(assert (=> b!968985 (= res!648426 (contains!5544 (getCurrentListMap!3665 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28792 _keys!1686) i!803)))))

(declare-fun b!968986 () Bool)

(declare-fun tp_is_empty!21883 () Bool)

(assert (=> b!968986 (= e!546161 tp_is_empty!21883)))

(declare-fun b!968987 () Bool)

(declare-fun res!648427 () Bool)

(assert (=> b!968987 (=> (not res!648427) (not e!546156))))

(assert (=> b!968987 (= res!648427 (and (= (size!29273 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29272 _keys!1686) (size!29273 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968988 () Bool)

(assert (=> b!968988 (= e!546158 tp_is_empty!21883)))

(declare-fun b!968989 () Bool)

(declare-fun res!648429 () Bool)

(assert (=> b!968989 (=> (not res!648429) (not e!546156))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968989 (= res!648429 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968990 () Bool)

(declare-fun res!648424 () Bool)

(assert (=> b!968990 (=> (not res!648424) (not e!546156))))

(assert (=> b!968990 (= res!648424 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29272 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29272 _keys!1686))))))

(declare-fun b!968991 () Bool)

(assert (=> b!968991 (= e!546160 (bvsge i!803 #b00000000000000000000000000000000))))

(assert (=> b!968991 (contains!5544 (getCurrentListMap!3665 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28792 _keys!1686) i!803))))

(declare-fun lt!431843 () Unit!32316)

(declare-fun lemmaInListMapFromThenInFromSmaller!37 (array!59856 array!59858 (_ BitVec 32) (_ BitVec 32) V!34161 V!34161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32316)

(assert (=> b!968991 (= lt!431843 (lemmaInListMapFromThenInFromSmaller!37 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!968992 () Bool)

(declare-fun res!648422 () Bool)

(assert (=> b!968992 (=> (not res!648422) (not e!546156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59856 (_ BitVec 32)) Bool)

(assert (=> b!968992 (= res!648422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968984 () Bool)

(declare-fun res!648425 () Bool)

(assert (=> b!968984 (=> (not res!648425) (not e!546156))))

(declare-datatypes ((List!19979 0))(
  ( (Nil!19976) (Cons!19975 (h!21143 (_ BitVec 64)) (t!28334 List!19979)) )
))
(declare-fun arrayNoDuplicates!0 (array!59856 (_ BitVec 32) List!19979) Bool)

(assert (=> b!968984 (= res!648425 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19976))))

(declare-fun res!648423 () Bool)

(assert (=> start!83116 (=> (not res!648423) (not e!546156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83116 (= res!648423 (validMask!0 mask!2110))))

(assert (=> start!83116 e!546156))

(assert (=> start!83116 true))

(declare-fun array_inv!22351 (array!59858) Bool)

(assert (=> start!83116 (and (array_inv!22351 _values!1400) e!546159)))

(declare-fun array_inv!22352 (array!59856) Bool)

(assert (=> start!83116 (array_inv!22352 _keys!1686)))

(assert (=> start!83116 tp!66355))

(assert (=> start!83116 tp_is_empty!21883))

(assert (= (and start!83116 res!648423) b!968987))

(assert (= (and b!968987 res!648427) b!968992))

(assert (= (and b!968992 res!648422) b!968984))

(assert (= (and b!968984 res!648425) b!968990))

(assert (= (and b!968990 res!648424) b!968983))

(assert (= (and b!968983 res!648421) b!968985))

(assert (= (and b!968985 res!648426) b!968989))

(assert (= (and b!968989 res!648429) b!968981))

(assert (= (and b!968981 (not res!648428)) b!968991))

(assert (= (and b!968982 condMapEmpty!34819) mapIsEmpty!34819))

(assert (= (and b!968982 (not condMapEmpty!34819)) mapNonEmpty!34819))

(get-info :version)

(assert (= (and mapNonEmpty!34819 ((_ is ValueCellFull!10460) mapValue!34819)) b!968986))

(assert (= (and b!968982 ((_ is ValueCellFull!10460) mapDefault!34819)) b!968988))

(assert (= start!83116 b!968982))

(declare-fun m!897787 () Bool)

(assert (=> start!83116 m!897787))

(declare-fun m!897789 () Bool)

(assert (=> start!83116 m!897789))

(declare-fun m!897791 () Bool)

(assert (=> start!83116 m!897791))

(declare-fun m!897793 () Bool)

(assert (=> b!968983 m!897793))

(assert (=> b!968983 m!897793))

(declare-fun m!897795 () Bool)

(assert (=> b!968983 m!897795))

(declare-fun m!897797 () Bool)

(assert (=> b!968991 m!897797))

(assert (=> b!968991 m!897793))

(assert (=> b!968991 m!897797))

(assert (=> b!968991 m!897793))

(declare-fun m!897799 () Bool)

(assert (=> b!968991 m!897799))

(declare-fun m!897801 () Bool)

(assert (=> b!968991 m!897801))

(declare-fun m!897803 () Bool)

(assert (=> b!968984 m!897803))

(declare-fun m!897805 () Bool)

(assert (=> b!968992 m!897805))

(declare-fun m!897807 () Bool)

(assert (=> mapNonEmpty!34819 m!897807))

(declare-fun m!897809 () Bool)

(assert (=> b!968981 m!897809))

(assert (=> b!968981 m!897793))

(assert (=> b!968981 m!897809))

(assert (=> b!968981 m!897793))

(declare-fun m!897811 () Bool)

(assert (=> b!968981 m!897811))

(declare-fun m!897813 () Bool)

(assert (=> b!968981 m!897813))

(declare-fun m!897815 () Bool)

(assert (=> b!968985 m!897815))

(assert (=> b!968985 m!897793))

(assert (=> b!968985 m!897815))

(assert (=> b!968985 m!897793))

(declare-fun m!897817 () Bool)

(assert (=> b!968985 m!897817))

(check-sat b_and!30573 (not b_next!19075) (not b!968981) (not b!968991) (not start!83116) (not b!968985) (not mapNonEmpty!34819) (not b!968983) (not b!968984) tp_is_empty!21883 (not b!968992))
(check-sat b_and!30573 (not b_next!19075))
