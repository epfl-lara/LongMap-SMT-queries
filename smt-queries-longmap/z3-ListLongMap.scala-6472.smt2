; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82674 () Bool)

(assert start!82674)

(declare-fun b_free!18807 () Bool)

(declare-fun b_next!18807 () Bool)

(assert (=> start!82674 (= b_free!18807 (not b_next!18807))))

(declare-fun tp!65540 () Bool)

(declare-fun b_and!30295 () Bool)

(assert (=> start!82674 (= tp!65540 b_and!30295)))

(declare-fun b!963888 () Bool)

(declare-fun res!645120 () Bool)

(declare-fun e!543438 () Bool)

(assert (=> b!963888 (=> (not res!645120) (not e!543438))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33795 0))(
  ( (V!33796 (val!10855 Int)) )
))
(declare-datatypes ((ValueCell!10323 0))(
  ( (ValueCellFull!10323 (v!13413 V!33795)) (EmptyCell!10323) )
))
(declare-datatypes ((array!59307 0))(
  ( (array!59308 (arr!28522 (Array (_ BitVec 32) ValueCell!10323)) (size!29001 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59307)

(declare-datatypes ((array!59309 0))(
  ( (array!59310 (arr!28523 (Array (_ BitVec 32) (_ BitVec 64))) (size!29002 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59309)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963888 (= res!645120 (and (= (size!29001 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29002 _keys!1686) (size!29001 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34408 () Bool)

(declare-fun mapRes!34408 () Bool)

(assert (=> mapIsEmpty!34408 mapRes!34408))

(declare-fun b!963889 () Bool)

(declare-fun res!645122 () Bool)

(assert (=> b!963889 (=> (not res!645122) (not e!543438))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963889 (= res!645122 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34408 () Bool)

(declare-fun tp!65541 () Bool)

(declare-fun e!543440 () Bool)

(assert (=> mapNonEmpty!34408 (= mapRes!34408 (and tp!65541 e!543440))))

(declare-fun mapRest!34408 () (Array (_ BitVec 32) ValueCell!10323))

(declare-fun mapKey!34408 () (_ BitVec 32))

(declare-fun mapValue!34408 () ValueCell!10323)

(assert (=> mapNonEmpty!34408 (= (arr!28522 _values!1400) (store mapRest!34408 mapKey!34408 mapValue!34408))))

(declare-fun b!963890 () Bool)

(declare-fun res!645124 () Bool)

(assert (=> b!963890 (=> (not res!645124) (not e!543438))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963890 (= res!645124 (validKeyInArray!0 (select (arr!28523 _keys!1686) i!803)))))

(declare-fun b!963891 () Bool)

(declare-fun res!645121 () Bool)

(assert (=> b!963891 (=> (not res!645121) (not e!543438))))

(declare-fun minValue!1342 () V!33795)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33795)

(declare-datatypes ((tuple2!13944 0))(
  ( (tuple2!13945 (_1!6983 (_ BitVec 64)) (_2!6983 V!33795)) )
))
(declare-datatypes ((List!19794 0))(
  ( (Nil!19791) (Cons!19790 (h!20952 tuple2!13944) (t!28157 List!19794)) )
))
(declare-datatypes ((ListLongMap!12641 0))(
  ( (ListLongMap!12642 (toList!6336 List!19794)) )
))
(declare-fun contains!5439 (ListLongMap!12641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3569 (array!59309 array!59307 (_ BitVec 32) (_ BitVec 32) V!33795 V!33795 (_ BitVec 32) Int) ListLongMap!12641)

(assert (=> b!963891 (= res!645121 (contains!5439 (getCurrentListMap!3569 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28523 _keys!1686) i!803)))))

(declare-fun b!963893 () Bool)

(assert (=> b!963893 (= e!543438 (not true))))

(assert (=> b!963893 (contains!5439 (getCurrentListMap!3569 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28523 _keys!1686) i!803))))

(declare-datatypes ((Unit!32255 0))(
  ( (Unit!32256) )
))
(declare-fun lt!431014 () Unit!32255)

(declare-fun lemmaInListMapFromThenInFromMinusOne!22 (array!59309 array!59307 (_ BitVec 32) (_ BitVec 32) V!33795 V!33795 (_ BitVec 32) (_ BitVec 32) Int) Unit!32255)

(assert (=> b!963893 (= lt!431014 (lemmaInListMapFromThenInFromMinusOne!22 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963894 () Bool)

(declare-fun e!543437 () Bool)

(declare-fun tp_is_empty!21609 () Bool)

(assert (=> b!963894 (= e!543437 tp_is_empty!21609)))

(declare-fun b!963895 () Bool)

(declare-fun res!645126 () Bool)

(assert (=> b!963895 (=> (not res!645126) (not e!543438))))

(assert (=> b!963895 (= res!645126 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29002 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29002 _keys!1686))))))

(declare-fun b!963896 () Bool)

(declare-fun e!543439 () Bool)

(assert (=> b!963896 (= e!543439 (and e!543437 mapRes!34408))))

(declare-fun condMapEmpty!34408 () Bool)

(declare-fun mapDefault!34408 () ValueCell!10323)

(assert (=> b!963896 (= condMapEmpty!34408 (= (arr!28522 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10323)) mapDefault!34408)))))

(declare-fun b!963897 () Bool)

(assert (=> b!963897 (= e!543440 tp_is_empty!21609)))

(declare-fun b!963898 () Bool)

(declare-fun res!645123 () Bool)

(assert (=> b!963898 (=> (not res!645123) (not e!543438))))

(declare-datatypes ((List!19795 0))(
  ( (Nil!19792) (Cons!19791 (h!20953 (_ BitVec 64)) (t!28158 List!19795)) )
))
(declare-fun arrayNoDuplicates!0 (array!59309 (_ BitVec 32) List!19795) Bool)

(assert (=> b!963898 (= res!645123 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19792))))

(declare-fun b!963892 () Bool)

(declare-fun res!645127 () Bool)

(assert (=> b!963892 (=> (not res!645127) (not e!543438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59309 (_ BitVec 32)) Bool)

(assert (=> b!963892 (= res!645127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!645125 () Bool)

(assert (=> start!82674 (=> (not res!645125) (not e!543438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82674 (= res!645125 (validMask!0 mask!2110))))

(assert (=> start!82674 e!543438))

(assert (=> start!82674 true))

(declare-fun array_inv!22091 (array!59307) Bool)

(assert (=> start!82674 (and (array_inv!22091 _values!1400) e!543439)))

(declare-fun array_inv!22092 (array!59309) Bool)

(assert (=> start!82674 (array_inv!22092 _keys!1686)))

(assert (=> start!82674 tp!65540))

(assert (=> start!82674 tp_is_empty!21609))

(assert (= (and start!82674 res!645125) b!963888))

(assert (= (and b!963888 res!645120) b!963892))

(assert (= (and b!963892 res!645127) b!963898))

(assert (= (and b!963898 res!645123) b!963895))

(assert (= (and b!963895 res!645126) b!963890))

(assert (= (and b!963890 res!645124) b!963891))

(assert (= (and b!963891 res!645121) b!963889))

(assert (= (and b!963889 res!645122) b!963893))

(assert (= (and b!963896 condMapEmpty!34408) mapIsEmpty!34408))

(assert (= (and b!963896 (not condMapEmpty!34408)) mapNonEmpty!34408))

(get-info :version)

(assert (= (and mapNonEmpty!34408 ((_ is ValueCellFull!10323) mapValue!34408)) b!963897))

(assert (= (and b!963896 ((_ is ValueCellFull!10323) mapDefault!34408)) b!963894))

(assert (= start!82674 b!963896))

(declare-fun m!893213 () Bool)

(assert (=> b!963893 m!893213))

(declare-fun m!893215 () Bool)

(assert (=> b!963893 m!893215))

(assert (=> b!963893 m!893213))

(assert (=> b!963893 m!893215))

(declare-fun m!893217 () Bool)

(assert (=> b!963893 m!893217))

(declare-fun m!893219 () Bool)

(assert (=> b!963893 m!893219))

(declare-fun m!893221 () Bool)

(assert (=> b!963892 m!893221))

(declare-fun m!893223 () Bool)

(assert (=> start!82674 m!893223))

(declare-fun m!893225 () Bool)

(assert (=> start!82674 m!893225))

(declare-fun m!893227 () Bool)

(assert (=> start!82674 m!893227))

(assert (=> b!963890 m!893215))

(assert (=> b!963890 m!893215))

(declare-fun m!893229 () Bool)

(assert (=> b!963890 m!893229))

(declare-fun m!893231 () Bool)

(assert (=> b!963891 m!893231))

(assert (=> b!963891 m!893215))

(assert (=> b!963891 m!893231))

(assert (=> b!963891 m!893215))

(declare-fun m!893233 () Bool)

(assert (=> b!963891 m!893233))

(declare-fun m!893235 () Bool)

(assert (=> b!963898 m!893235))

(declare-fun m!893237 () Bool)

(assert (=> mapNonEmpty!34408 m!893237))

(check-sat (not b!963898) (not b!963892) (not mapNonEmpty!34408) (not b!963890) (not b!963891) tp_is_empty!21609 b_and!30295 (not b!963893) (not b_next!18807) (not start!82674))
(check-sat b_and!30295 (not b_next!18807))
