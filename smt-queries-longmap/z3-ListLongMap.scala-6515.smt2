; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82932 () Bool)

(assert start!82932)

(declare-fun b_free!19059 () Bool)

(declare-fun b_next!19059 () Bool)

(assert (=> start!82932 (= b_free!19059 (not b_next!19059))))

(declare-fun tp!66305 () Bool)

(declare-fun b_and!30547 () Bool)

(assert (=> start!82932 (= tp!66305 b_and!30547)))

(declare-fun b!967812 () Bool)

(declare-fun res!647883 () Bool)

(declare-fun e!545454 () Bool)

(assert (=> b!967812 (=> (not res!647883) (not e!545454))))

(declare-datatypes ((array!59807 0))(
  ( (array!59808 (arr!28772 (Array (_ BitVec 32) (_ BitVec 64))) (size!29251 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59807)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967812 (= res!647883 (validKeyInArray!0 (select (arr!28772 _keys!1686) i!803)))))

(declare-fun b!967813 () Bool)

(declare-fun res!647890 () Bool)

(assert (=> b!967813 (=> (not res!647890) (not e!545454))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34139 0))(
  ( (V!34140 (val!10984 Int)) )
))
(declare-fun minValue!1342 () V!34139)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((ValueCell!10452 0))(
  ( (ValueCellFull!10452 (v!13542 V!34139)) (EmptyCell!10452) )
))
(declare-datatypes ((array!59809 0))(
  ( (array!59810 (arr!28773 (Array (_ BitVec 32) ValueCell!10452)) (size!29252 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59809)

(declare-fun zeroValue!1342 () V!34139)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14128 0))(
  ( (tuple2!14129 (_1!7075 (_ BitVec 64)) (_2!7075 V!34139)) )
))
(declare-datatypes ((List!19975 0))(
  ( (Nil!19972) (Cons!19971 (h!21133 tuple2!14128) (t!28338 List!19975)) )
))
(declare-datatypes ((ListLongMap!12825 0))(
  ( (ListLongMap!12826 (toList!6428 List!19975)) )
))
(declare-fun contains!5529 (ListLongMap!12825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3661 (array!59807 array!59809 (_ BitVec 32) (_ BitVec 32) V!34139 V!34139 (_ BitVec 32) Int) ListLongMap!12825)

(assert (=> b!967813 (= res!647890 (contains!5529 (getCurrentListMap!3661 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28772 _keys!1686) i!803)))))

(declare-fun b!967814 () Bool)

(declare-fun res!647889 () Bool)

(assert (=> b!967814 (=> (not res!647889) (not e!545454))))

(assert (=> b!967814 (= res!647889 (and (= (size!29252 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29251 _keys!1686) (size!29252 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967815 () Bool)

(declare-fun e!545456 () Bool)

(declare-fun tp_is_empty!21867 () Bool)

(assert (=> b!967815 (= e!545456 tp_is_empty!21867)))

(declare-fun b!967816 () Bool)

(declare-fun res!647884 () Bool)

(assert (=> b!967816 (=> (not res!647884) (not e!545454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59807 (_ BitVec 32)) Bool)

(assert (=> b!967816 (= res!647884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967817 () Bool)

(declare-fun res!647888 () Bool)

(assert (=> b!967817 (=> (not res!647888) (not e!545454))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967817 (= res!647888 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29251 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29251 _keys!1686))))))

(declare-fun res!647886 () Bool)

(assert (=> start!82932 (=> (not res!647886) (not e!545454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82932 (= res!647886 (validMask!0 mask!2110))))

(assert (=> start!82932 e!545454))

(assert (=> start!82932 true))

(declare-fun e!545453 () Bool)

(declare-fun array_inv!22275 (array!59809) Bool)

(assert (=> start!82932 (and (array_inv!22275 _values!1400) e!545453)))

(declare-fun array_inv!22276 (array!59807) Bool)

(assert (=> start!82932 (array_inv!22276 _keys!1686)))

(assert (=> start!82932 tp!66305))

(assert (=> start!82932 tp_is_empty!21867))

(declare-fun b!967818 () Bool)

(declare-fun res!647887 () Bool)

(assert (=> b!967818 (=> (not res!647887) (not e!545454))))

(declare-datatypes ((List!19976 0))(
  ( (Nil!19973) (Cons!19972 (h!21134 (_ BitVec 64)) (t!28339 List!19976)) )
))
(declare-fun arrayNoDuplicates!0 (array!59807 (_ BitVec 32) List!19976) Bool)

(assert (=> b!967818 (= res!647887 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19973))))

(declare-fun b!967819 () Bool)

(assert (=> b!967819 (= e!545454 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29251 _keys!1686)) (bvsge i!803 (bvsub from!2084 #b00000000000000000000000000000001)))))))

(assert (=> b!967819 (contains!5529 (getCurrentListMap!3661 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28772 _keys!1686) i!803))))

(declare-datatypes ((Unit!32337 0))(
  ( (Unit!32338) )
))
(declare-fun lt!431455 () Unit!32337)

(declare-fun lemmaInListMapFromThenInFromMinusOne!63 (array!59807 array!59809 (_ BitVec 32) (_ BitVec 32) V!34139 V!34139 (_ BitVec 32) (_ BitVec 32) Int) Unit!32337)

(assert (=> b!967819 (= lt!431455 (lemmaInListMapFromThenInFromMinusOne!63 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34795 () Bool)

(declare-fun mapRes!34795 () Bool)

(declare-fun tp!66306 () Bool)

(declare-fun e!545452 () Bool)

(assert (=> mapNonEmpty!34795 (= mapRes!34795 (and tp!66306 e!545452))))

(declare-fun mapRest!34795 () (Array (_ BitVec 32) ValueCell!10452))

(declare-fun mapValue!34795 () ValueCell!10452)

(declare-fun mapKey!34795 () (_ BitVec 32))

(assert (=> mapNonEmpty!34795 (= (arr!28773 _values!1400) (store mapRest!34795 mapKey!34795 mapValue!34795))))

(declare-fun b!967820 () Bool)

(assert (=> b!967820 (= e!545453 (and e!545456 mapRes!34795))))

(declare-fun condMapEmpty!34795 () Bool)

(declare-fun mapDefault!34795 () ValueCell!10452)

(assert (=> b!967820 (= condMapEmpty!34795 (= (arr!28773 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10452)) mapDefault!34795)))))

(declare-fun mapIsEmpty!34795 () Bool)

(assert (=> mapIsEmpty!34795 mapRes!34795))

(declare-fun b!967821 () Bool)

(assert (=> b!967821 (= e!545452 tp_is_empty!21867)))

(declare-fun b!967822 () Bool)

(declare-fun res!647885 () Bool)

(assert (=> b!967822 (=> (not res!647885) (not e!545454))))

(assert (=> b!967822 (= res!647885 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82932 res!647886) b!967814))

(assert (= (and b!967814 res!647889) b!967816))

(assert (= (and b!967816 res!647884) b!967818))

(assert (= (and b!967818 res!647887) b!967817))

(assert (= (and b!967817 res!647888) b!967812))

(assert (= (and b!967812 res!647883) b!967813))

(assert (= (and b!967813 res!647890) b!967822))

(assert (= (and b!967822 res!647885) b!967819))

(assert (= (and b!967820 condMapEmpty!34795) mapIsEmpty!34795))

(assert (= (and b!967820 (not condMapEmpty!34795)) mapNonEmpty!34795))

(get-info :version)

(assert (= (and mapNonEmpty!34795 ((_ is ValueCellFull!10452) mapValue!34795)) b!967821))

(assert (= (and b!967820 ((_ is ValueCellFull!10452) mapDefault!34795)) b!967815))

(assert (= start!82932 b!967820))

(declare-fun m!896285 () Bool)

(assert (=> start!82932 m!896285))

(declare-fun m!896287 () Bool)

(assert (=> start!82932 m!896287))

(declare-fun m!896289 () Bool)

(assert (=> start!82932 m!896289))

(declare-fun m!896291 () Bool)

(assert (=> b!967818 m!896291))

(declare-fun m!896293 () Bool)

(assert (=> mapNonEmpty!34795 m!896293))

(declare-fun m!896295 () Bool)

(assert (=> b!967819 m!896295))

(declare-fun m!896297 () Bool)

(assert (=> b!967819 m!896297))

(assert (=> b!967819 m!896295))

(assert (=> b!967819 m!896297))

(declare-fun m!896299 () Bool)

(assert (=> b!967819 m!896299))

(declare-fun m!896301 () Bool)

(assert (=> b!967819 m!896301))

(assert (=> b!967812 m!896297))

(assert (=> b!967812 m!896297))

(declare-fun m!896303 () Bool)

(assert (=> b!967812 m!896303))

(declare-fun m!896305 () Bool)

(assert (=> b!967816 m!896305))

(declare-fun m!896307 () Bool)

(assert (=> b!967813 m!896307))

(assert (=> b!967813 m!896297))

(assert (=> b!967813 m!896307))

(assert (=> b!967813 m!896297))

(declare-fun m!896309 () Bool)

(assert (=> b!967813 m!896309))

(check-sat (not start!82932) (not b!967813) (not b!967818) (not b_next!19059) (not b!967816) tp_is_empty!21867 b_and!30547 (not mapNonEmpty!34795) (not b!967812) (not b!967819))
(check-sat b_and!30547 (not b_next!19059))
