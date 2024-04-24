; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83044 () Bool)

(assert start!83044)

(declare-fun b_free!19003 () Bool)

(declare-fun b_next!19003 () Bool)

(assert (=> start!83044 (= b_free!19003 (not b_next!19003))))

(declare-fun tp!66139 () Bool)

(declare-fun b_and!30501 () Bool)

(assert (=> start!83044 (= tp!66139 b_and!30501)))

(declare-fun b!967791 () Bool)

(declare-fun e!545618 () Bool)

(assert (=> b!967791 (= e!545618 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34065 0))(
  ( (V!34066 (val!10956 Int)) )
))
(declare-datatypes ((ValueCell!10424 0))(
  ( (ValueCellFull!10424 (v!13511 V!34065)) (EmptyCell!10424) )
))
(declare-datatypes ((array!59720 0))(
  ( (array!59721 (arr!28724 (Array (_ BitVec 32) ValueCell!10424)) (size!29204 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59720)

(declare-datatypes ((array!59722 0))(
  ( (array!59723 (arr!28725 (Array (_ BitVec 32) (_ BitVec 64))) (size!29205 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59722)

(declare-fun minValue!1342 () V!34065)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34065)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14078 0))(
  ( (tuple2!14079 (_1!7050 (_ BitVec 64)) (_2!7050 V!34065)) )
))
(declare-datatypes ((List!19926 0))(
  ( (Nil!19923) (Cons!19922 (h!21090 tuple2!14078) (t!28281 List!19926)) )
))
(declare-datatypes ((ListLongMap!12777 0))(
  ( (ListLongMap!12778 (toList!6404 List!19926)) )
))
(declare-fun contains!5516 (ListLongMap!12777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3637 (array!59722 array!59720 (_ BitVec 32) (_ BitVec 32) V!34065 V!34065 (_ BitVec 32) Int) ListLongMap!12777)

(assert (=> b!967791 (contains!5516 (getCurrentListMap!3637 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28725 _keys!1686) i!803))))

(declare-datatypes ((Unit!32266 0))(
  ( (Unit!32267) )
))
(declare-fun lt!431732 () Unit!32266)

(declare-fun lemmaInListMapFromThenInFromMinusOne!44 (array!59722 array!59720 (_ BitVec 32) (_ BitVec 32) V!34065 V!34065 (_ BitVec 32) (_ BitVec 32) Int) Unit!32266)

(assert (=> b!967791 (= lt!431732 (lemmaInListMapFromThenInFromMinusOne!44 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!647560 () Bool)

(assert (=> start!83044 (=> (not res!647560) (not e!545618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83044 (= res!647560 (validMask!0 mask!2110))))

(assert (=> start!83044 e!545618))

(assert (=> start!83044 true))

(declare-fun e!545615 () Bool)

(declare-fun array_inv!22297 (array!59720) Bool)

(assert (=> start!83044 (and (array_inv!22297 _values!1400) e!545615)))

(declare-fun array_inv!22298 (array!59722) Bool)

(assert (=> start!83044 (array_inv!22298 _keys!1686)))

(assert (=> start!83044 tp!66139))

(declare-fun tp_is_empty!21811 () Bool)

(assert (=> start!83044 tp_is_empty!21811))

(declare-fun mapNonEmpty!34711 () Bool)

(declare-fun mapRes!34711 () Bool)

(declare-fun tp!66138 () Bool)

(declare-fun e!545614 () Bool)

(assert (=> mapNonEmpty!34711 (= mapRes!34711 (and tp!66138 e!545614))))

(declare-fun mapValue!34711 () ValueCell!10424)

(declare-fun mapKey!34711 () (_ BitVec 32))

(declare-fun mapRest!34711 () (Array (_ BitVec 32) ValueCell!10424))

(assert (=> mapNonEmpty!34711 (= (arr!28724 _values!1400) (store mapRest!34711 mapKey!34711 mapValue!34711))))

(declare-fun b!967792 () Bool)

(declare-fun res!647555 () Bool)

(assert (=> b!967792 (=> (not res!647555) (not e!545618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59722 (_ BitVec 32)) Bool)

(assert (=> b!967792 (= res!647555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967793 () Bool)

(declare-fun res!647561 () Bool)

(assert (=> b!967793 (=> (not res!647561) (not e!545618))))

(declare-datatypes ((List!19927 0))(
  ( (Nil!19924) (Cons!19923 (h!21091 (_ BitVec 64)) (t!28282 List!19927)) )
))
(declare-fun arrayNoDuplicates!0 (array!59722 (_ BitVec 32) List!19927) Bool)

(assert (=> b!967793 (= res!647561 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19924))))

(declare-fun mapIsEmpty!34711 () Bool)

(assert (=> mapIsEmpty!34711 mapRes!34711))

(declare-fun b!967794 () Bool)

(declare-fun res!647562 () Bool)

(assert (=> b!967794 (=> (not res!647562) (not e!545618))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967794 (= res!647562 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967795 () Bool)

(declare-fun res!647557 () Bool)

(assert (=> b!967795 (=> (not res!647557) (not e!545618))))

(assert (=> b!967795 (= res!647557 (contains!5516 (getCurrentListMap!3637 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28725 _keys!1686) i!803)))))

(declare-fun b!967796 () Bool)

(declare-fun res!647556 () Bool)

(assert (=> b!967796 (=> (not res!647556) (not e!545618))))

(assert (=> b!967796 (= res!647556 (and (= (size!29204 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29205 _keys!1686) (size!29204 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967797 () Bool)

(declare-fun e!545617 () Bool)

(assert (=> b!967797 (= e!545617 tp_is_empty!21811)))

(declare-fun b!967798 () Bool)

(assert (=> b!967798 (= e!545615 (and e!545617 mapRes!34711))))

(declare-fun condMapEmpty!34711 () Bool)

(declare-fun mapDefault!34711 () ValueCell!10424)

(assert (=> b!967798 (= condMapEmpty!34711 (= (arr!28724 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10424)) mapDefault!34711)))))

(declare-fun b!967799 () Bool)

(declare-fun res!647558 () Bool)

(assert (=> b!967799 (=> (not res!647558) (not e!545618))))

(assert (=> b!967799 (= res!647558 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29205 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29205 _keys!1686))))))

(declare-fun b!967800 () Bool)

(declare-fun res!647559 () Bool)

(assert (=> b!967800 (=> (not res!647559) (not e!545618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967800 (= res!647559 (validKeyInArray!0 (select (arr!28725 _keys!1686) i!803)))))

(declare-fun b!967801 () Bool)

(assert (=> b!967801 (= e!545614 tp_is_empty!21811)))

(assert (= (and start!83044 res!647560) b!967796))

(assert (= (and b!967796 res!647556) b!967792))

(assert (= (and b!967792 res!647555) b!967793))

(assert (= (and b!967793 res!647561) b!967799))

(assert (= (and b!967799 res!647558) b!967800))

(assert (= (and b!967800 res!647559) b!967795))

(assert (= (and b!967795 res!647557) b!967794))

(assert (= (and b!967794 res!647562) b!967791))

(assert (= (and b!967798 condMapEmpty!34711) mapIsEmpty!34711))

(assert (= (and b!967798 (not condMapEmpty!34711)) mapNonEmpty!34711))

(get-info :version)

(assert (= (and mapNonEmpty!34711 ((_ is ValueCellFull!10424) mapValue!34711)) b!967801))

(assert (= (and b!967798 ((_ is ValueCellFull!10424) mapDefault!34711)) b!967797))

(assert (= start!83044 b!967798))

(declare-fun m!896851 () Bool)

(assert (=> b!967791 m!896851))

(declare-fun m!896853 () Bool)

(assert (=> b!967791 m!896853))

(assert (=> b!967791 m!896851))

(assert (=> b!967791 m!896853))

(declare-fun m!896855 () Bool)

(assert (=> b!967791 m!896855))

(declare-fun m!896857 () Bool)

(assert (=> b!967791 m!896857))

(declare-fun m!896859 () Bool)

(assert (=> start!83044 m!896859))

(declare-fun m!896861 () Bool)

(assert (=> start!83044 m!896861))

(declare-fun m!896863 () Bool)

(assert (=> start!83044 m!896863))

(declare-fun m!896865 () Bool)

(assert (=> b!967793 m!896865))

(declare-fun m!896867 () Bool)

(assert (=> b!967792 m!896867))

(assert (=> b!967800 m!896853))

(assert (=> b!967800 m!896853))

(declare-fun m!896869 () Bool)

(assert (=> b!967800 m!896869))

(declare-fun m!896871 () Bool)

(assert (=> mapNonEmpty!34711 m!896871))

(declare-fun m!896873 () Bool)

(assert (=> b!967795 m!896873))

(assert (=> b!967795 m!896853))

(assert (=> b!967795 m!896873))

(assert (=> b!967795 m!896853))

(declare-fun m!896875 () Bool)

(assert (=> b!967795 m!896875))

(check-sat (not b!967792) (not b_next!19003) (not b!967793) (not b!967800) (not start!83044) tp_is_empty!21811 (not b!967795) (not b!967791) b_and!30501 (not mapNonEmpty!34711))
(check-sat b_and!30501 (not b_next!19003))
