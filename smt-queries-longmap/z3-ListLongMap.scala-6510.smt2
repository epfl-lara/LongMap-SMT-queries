; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82902 () Bool)

(assert start!82902)

(declare-fun b_free!19029 () Bool)

(declare-fun b_next!19029 () Bool)

(assert (=> start!82902 (= b_free!19029 (not b_next!19029))))

(declare-fun tp!66215 () Bool)

(declare-fun b_and!30517 () Bool)

(assert (=> start!82902 (= tp!66215 b_and!30517)))

(declare-fun b!967317 () Bool)

(declare-fun e!545227 () Bool)

(declare-fun tp_is_empty!21837 () Bool)

(assert (=> b!967317 (= e!545227 tp_is_empty!21837)))

(declare-fun b!967318 () Bool)

(declare-fun res!647523 () Bool)

(declare-fun e!545230 () Bool)

(assert (=> b!967318 (=> (not res!647523) (not e!545230))))

(declare-datatypes ((array!59749 0))(
  ( (array!59750 (arr!28743 (Array (_ BitVec 32) (_ BitVec 64))) (size!29222 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59749)

(declare-datatypes ((List!19956 0))(
  ( (Nil!19953) (Cons!19952 (h!21114 (_ BitVec 64)) (t!28319 List!19956)) )
))
(declare-fun arrayNoDuplicates!0 (array!59749 (_ BitVec 32) List!19956) Bool)

(assert (=> b!967318 (= res!647523 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19953))))

(declare-fun b!967319 () Bool)

(declare-fun res!647524 () Bool)

(assert (=> b!967319 (=> (not res!647524) (not e!545230))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34099 0))(
  ( (V!34100 (val!10969 Int)) )
))
(declare-datatypes ((ValueCell!10437 0))(
  ( (ValueCellFull!10437 (v!13527 V!34099)) (EmptyCell!10437) )
))
(declare-datatypes ((array!59751 0))(
  ( (array!59752 (arr!28744 (Array (_ BitVec 32) ValueCell!10437)) (size!29223 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59751)

(declare-fun minValue!1342 () V!34099)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34099)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14106 0))(
  ( (tuple2!14107 (_1!7064 (_ BitVec 64)) (_2!7064 V!34099)) )
))
(declare-datatypes ((List!19957 0))(
  ( (Nil!19954) (Cons!19953 (h!21115 tuple2!14106) (t!28320 List!19957)) )
))
(declare-datatypes ((ListLongMap!12803 0))(
  ( (ListLongMap!12804 (toList!6417 List!19957)) )
))
(declare-fun contains!5518 (ListLongMap!12803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3650 (array!59749 array!59751 (_ BitVec 32) (_ BitVec 32) V!34099 V!34099 (_ BitVec 32) Int) ListLongMap!12803)

(assert (=> b!967319 (= res!647524 (contains!5518 (getCurrentListMap!3650 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28743 _keys!1686) i!803)))))

(declare-fun b!967321 () Bool)

(declare-fun res!647526 () Bool)

(assert (=> b!967321 (=> (not res!647526) (not e!545230))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967321 (= res!647526 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967322 () Bool)

(declare-fun e!545231 () Bool)

(assert (=> b!967322 (= e!545231 tp_is_empty!21837)))

(declare-fun mapIsEmpty!34750 () Bool)

(declare-fun mapRes!34750 () Bool)

(assert (=> mapIsEmpty!34750 mapRes!34750))

(declare-fun b!967323 () Bool)

(declare-fun res!647527 () Bool)

(assert (=> b!967323 (=> (not res!647527) (not e!545230))))

(assert (=> b!967323 (= res!647527 (and (= (size!29223 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29222 _keys!1686) (size!29223 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967324 () Bool)

(declare-fun res!647528 () Bool)

(assert (=> b!967324 (=> (not res!647528) (not e!545230))))

(assert (=> b!967324 (= res!647528 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29222 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29222 _keys!1686))))))

(declare-fun b!967325 () Bool)

(assert (=> b!967325 (= e!545230 (not true))))

(assert (=> b!967325 (contains!5518 (getCurrentListMap!3650 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28743 _keys!1686) i!803))))

(declare-datatypes ((Unit!32317 0))(
  ( (Unit!32318) )
))
(declare-fun lt!431410 () Unit!32317)

(declare-fun lemmaInListMapFromThenInFromMinusOne!53 (array!59749 array!59751 (_ BitVec 32) (_ BitVec 32) V!34099 V!34099 (_ BitVec 32) (_ BitVec 32) Int) Unit!32317)

(assert (=> b!967325 (= lt!431410 (lemmaInListMapFromThenInFromMinusOne!53 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34750 () Bool)

(declare-fun tp!66216 () Bool)

(assert (=> mapNonEmpty!34750 (= mapRes!34750 (and tp!66216 e!545227))))

(declare-fun mapValue!34750 () ValueCell!10437)

(declare-fun mapRest!34750 () (Array (_ BitVec 32) ValueCell!10437))

(declare-fun mapKey!34750 () (_ BitVec 32))

(assert (=> mapNonEmpty!34750 (= (arr!28744 _values!1400) (store mapRest!34750 mapKey!34750 mapValue!34750))))

(declare-fun res!647525 () Bool)

(assert (=> start!82902 (=> (not res!647525) (not e!545230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82902 (= res!647525 (validMask!0 mask!2110))))

(assert (=> start!82902 e!545230))

(assert (=> start!82902 true))

(declare-fun e!545228 () Bool)

(declare-fun array_inv!22259 (array!59751) Bool)

(assert (=> start!82902 (and (array_inv!22259 _values!1400) e!545228)))

(declare-fun array_inv!22260 (array!59749) Bool)

(assert (=> start!82902 (array_inv!22260 _keys!1686)))

(assert (=> start!82902 tp!66215))

(assert (=> start!82902 tp_is_empty!21837))

(declare-fun b!967320 () Bool)

(declare-fun res!647529 () Bool)

(assert (=> b!967320 (=> (not res!647529) (not e!545230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967320 (= res!647529 (validKeyInArray!0 (select (arr!28743 _keys!1686) i!803)))))

(declare-fun b!967326 () Bool)

(assert (=> b!967326 (= e!545228 (and e!545231 mapRes!34750))))

(declare-fun condMapEmpty!34750 () Bool)

(declare-fun mapDefault!34750 () ValueCell!10437)

(assert (=> b!967326 (= condMapEmpty!34750 (= (arr!28744 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10437)) mapDefault!34750)))))

(declare-fun b!967327 () Bool)

(declare-fun res!647530 () Bool)

(assert (=> b!967327 (=> (not res!647530) (not e!545230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59749 (_ BitVec 32)) Bool)

(assert (=> b!967327 (= res!647530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82902 res!647525) b!967323))

(assert (= (and b!967323 res!647527) b!967327))

(assert (= (and b!967327 res!647530) b!967318))

(assert (= (and b!967318 res!647523) b!967324))

(assert (= (and b!967324 res!647528) b!967320))

(assert (= (and b!967320 res!647529) b!967319))

(assert (= (and b!967319 res!647524) b!967321))

(assert (= (and b!967321 res!647526) b!967325))

(assert (= (and b!967326 condMapEmpty!34750) mapIsEmpty!34750))

(assert (= (and b!967326 (not condMapEmpty!34750)) mapNonEmpty!34750))

(get-info :version)

(assert (= (and mapNonEmpty!34750 ((_ is ValueCellFull!10437) mapValue!34750)) b!967317))

(assert (= (and b!967326 ((_ is ValueCellFull!10437) mapDefault!34750)) b!967322))

(assert (= start!82902 b!967326))

(declare-fun m!895895 () Bool)

(assert (=> b!967318 m!895895))

(declare-fun m!895897 () Bool)

(assert (=> start!82902 m!895897))

(declare-fun m!895899 () Bool)

(assert (=> start!82902 m!895899))

(declare-fun m!895901 () Bool)

(assert (=> start!82902 m!895901))

(declare-fun m!895903 () Bool)

(assert (=> mapNonEmpty!34750 m!895903))

(declare-fun m!895905 () Bool)

(assert (=> b!967325 m!895905))

(declare-fun m!895907 () Bool)

(assert (=> b!967325 m!895907))

(assert (=> b!967325 m!895905))

(assert (=> b!967325 m!895907))

(declare-fun m!895909 () Bool)

(assert (=> b!967325 m!895909))

(declare-fun m!895911 () Bool)

(assert (=> b!967325 m!895911))

(declare-fun m!895913 () Bool)

(assert (=> b!967327 m!895913))

(declare-fun m!895915 () Bool)

(assert (=> b!967319 m!895915))

(assert (=> b!967319 m!895907))

(assert (=> b!967319 m!895915))

(assert (=> b!967319 m!895907))

(declare-fun m!895917 () Bool)

(assert (=> b!967319 m!895917))

(assert (=> b!967320 m!895907))

(assert (=> b!967320 m!895907))

(declare-fun m!895919 () Bool)

(assert (=> b!967320 m!895919))

(check-sat (not b!967320) b_and!30517 tp_is_empty!21837 (not b!967319) (not b_next!19029) (not b!967327) (not b!967325) (not b!967318) (not mapNonEmpty!34750) (not start!82902))
(check-sat b_and!30517 (not b_next!19029))
