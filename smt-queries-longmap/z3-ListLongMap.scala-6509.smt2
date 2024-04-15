; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82876 () Bool)

(assert start!82876)

(declare-fun b_free!19021 () Bool)

(declare-fun b_next!19021 () Bool)

(assert (=> start!82876 (= b_free!19021 (not b_next!19021))))

(declare-fun tp!66193 () Bool)

(declare-fun b_and!30483 () Bool)

(assert (=> start!82876 (= tp!66193 b_and!30483)))

(declare-fun b!966946 () Bool)

(declare-fun res!647319 () Bool)

(declare-fun e!545022 () Bool)

(assert (=> b!966946 (=> (not res!647319) (not e!545022))))

(declare-datatypes ((array!59662 0))(
  ( (array!59663 (arr!28700 (Array (_ BitVec 32) (_ BitVec 64))) (size!29181 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59662)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966946 (= res!647319 (validKeyInArray!0 (select (arr!28700 _keys!1686) i!803)))))

(declare-fun b!966947 () Bool)

(declare-fun e!545023 () Bool)

(declare-fun e!545019 () Bool)

(declare-fun mapRes!34738 () Bool)

(assert (=> b!966947 (= e!545023 (and e!545019 mapRes!34738))))

(declare-fun condMapEmpty!34738 () Bool)

(declare-datatypes ((V!34089 0))(
  ( (V!34090 (val!10965 Int)) )
))
(declare-datatypes ((ValueCell!10433 0))(
  ( (ValueCellFull!10433 (v!13522 V!34089)) (EmptyCell!10433) )
))
(declare-datatypes ((array!59664 0))(
  ( (array!59665 (arr!28701 (Array (_ BitVec 32) ValueCell!10433)) (size!29182 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59664)

(declare-fun mapDefault!34738 () ValueCell!10433)

(assert (=> b!966947 (= condMapEmpty!34738 (= (arr!28701 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10433)) mapDefault!34738)))))

(declare-fun b!966948 () Bool)

(declare-fun res!647324 () Bool)

(assert (=> b!966948 (=> (not res!647324) (not e!545022))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966948 (= res!647324 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29181 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29181 _keys!1686))))))

(declare-fun res!647317 () Bool)

(assert (=> start!82876 (=> (not res!647317) (not e!545022))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82876 (= res!647317 (validMask!0 mask!2110))))

(assert (=> start!82876 e!545022))

(assert (=> start!82876 true))

(declare-fun array_inv!22283 (array!59664) Bool)

(assert (=> start!82876 (and (array_inv!22283 _values!1400) e!545023)))

(declare-fun array_inv!22284 (array!59662) Bool)

(assert (=> start!82876 (array_inv!22284 _keys!1686)))

(assert (=> start!82876 tp!66193))

(declare-fun tp_is_empty!21829 () Bool)

(assert (=> start!82876 tp_is_empty!21829))

(declare-fun b!966949 () Bool)

(declare-fun res!647322 () Bool)

(assert (=> b!966949 (=> (not res!647322) (not e!545022))))

(declare-datatypes ((List!19979 0))(
  ( (Nil!19976) (Cons!19975 (h!21137 (_ BitVec 64)) (t!28333 List!19979)) )
))
(declare-fun arrayNoDuplicates!0 (array!59662 (_ BitVec 32) List!19979) Bool)

(assert (=> b!966949 (= res!647322 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19976))))

(declare-fun b!966950 () Bool)

(assert (=> b!966950 (= e!545022 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34089)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34089)

(declare-datatypes ((tuple2!14172 0))(
  ( (tuple2!14173 (_1!7097 (_ BitVec 64)) (_2!7097 V!34089)) )
))
(declare-datatypes ((List!19980 0))(
  ( (Nil!19977) (Cons!19976 (h!21138 tuple2!14172) (t!28334 List!19980)) )
))
(declare-datatypes ((ListLongMap!12859 0))(
  ( (ListLongMap!12860 (toList!6445 List!19980)) )
))
(declare-fun contains!5490 (ListLongMap!12859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3607 (array!59662 array!59664 (_ BitVec 32) (_ BitVec 32) V!34089 V!34089 (_ BitVec 32) Int) ListLongMap!12859)

(assert (=> b!966950 (contains!5490 (getCurrentListMap!3607 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28700 _keys!1686) i!803))))

(declare-datatypes ((Unit!32184 0))(
  ( (Unit!32185) )
))
(declare-fun lt!431162 () Unit!32184)

(declare-fun lemmaInListMapFromThenInFromMinusOne!56 (array!59662 array!59664 (_ BitVec 32) (_ BitVec 32) V!34089 V!34089 (_ BitVec 32) (_ BitVec 32) Int) Unit!32184)

(assert (=> b!966950 (= lt!431162 (lemmaInListMapFromThenInFromMinusOne!56 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!966951 () Bool)

(declare-fun res!647321 () Bool)

(assert (=> b!966951 (=> (not res!647321) (not e!545022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59662 (_ BitVec 32)) Bool)

(assert (=> b!966951 (= res!647321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966952 () Bool)

(assert (=> b!966952 (= e!545019 tp_is_empty!21829)))

(declare-fun mapIsEmpty!34738 () Bool)

(assert (=> mapIsEmpty!34738 mapRes!34738))

(declare-fun b!966953 () Bool)

(declare-fun res!647318 () Bool)

(assert (=> b!966953 (=> (not res!647318) (not e!545022))))

(assert (=> b!966953 (= res!647318 (and (= (size!29182 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29181 _keys!1686) (size!29182 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966954 () Bool)

(declare-fun e!545020 () Bool)

(assert (=> b!966954 (= e!545020 tp_is_empty!21829)))

(declare-fun b!966955 () Bool)

(declare-fun res!647320 () Bool)

(assert (=> b!966955 (=> (not res!647320) (not e!545022))))

(assert (=> b!966955 (= res!647320 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966956 () Bool)

(declare-fun res!647323 () Bool)

(assert (=> b!966956 (=> (not res!647323) (not e!545022))))

(assert (=> b!966956 (= res!647323 (contains!5490 (getCurrentListMap!3607 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28700 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34738 () Bool)

(declare-fun tp!66192 () Bool)

(assert (=> mapNonEmpty!34738 (= mapRes!34738 (and tp!66192 e!545020))))

(declare-fun mapRest!34738 () (Array (_ BitVec 32) ValueCell!10433))

(declare-fun mapValue!34738 () ValueCell!10433)

(declare-fun mapKey!34738 () (_ BitVec 32))

(assert (=> mapNonEmpty!34738 (= (arr!28701 _values!1400) (store mapRest!34738 mapKey!34738 mapValue!34738))))

(assert (= (and start!82876 res!647317) b!966953))

(assert (= (and b!966953 res!647318) b!966951))

(assert (= (and b!966951 res!647321) b!966949))

(assert (= (and b!966949 res!647322) b!966948))

(assert (= (and b!966948 res!647324) b!966946))

(assert (= (and b!966946 res!647319) b!966956))

(assert (= (and b!966956 res!647323) b!966955))

(assert (= (and b!966955 res!647320) b!966950))

(assert (= (and b!966947 condMapEmpty!34738) mapIsEmpty!34738))

(assert (= (and b!966947 (not condMapEmpty!34738)) mapNonEmpty!34738))

(get-info :version)

(assert (= (and mapNonEmpty!34738 ((_ is ValueCellFull!10433) mapValue!34738)) b!966954))

(assert (= (and b!966947 ((_ is ValueCellFull!10433) mapDefault!34738)) b!966952))

(assert (= start!82876 b!966947))

(declare-fun m!895033 () Bool)

(assert (=> b!966949 m!895033))

(declare-fun m!895035 () Bool)

(assert (=> b!966951 m!895035))

(declare-fun m!895037 () Bool)

(assert (=> b!966946 m!895037))

(assert (=> b!966946 m!895037))

(declare-fun m!895039 () Bool)

(assert (=> b!966946 m!895039))

(declare-fun m!895041 () Bool)

(assert (=> mapNonEmpty!34738 m!895041))

(declare-fun m!895043 () Bool)

(assert (=> b!966950 m!895043))

(assert (=> b!966950 m!895037))

(assert (=> b!966950 m!895043))

(assert (=> b!966950 m!895037))

(declare-fun m!895045 () Bool)

(assert (=> b!966950 m!895045))

(declare-fun m!895047 () Bool)

(assert (=> b!966950 m!895047))

(declare-fun m!895049 () Bool)

(assert (=> start!82876 m!895049))

(declare-fun m!895051 () Bool)

(assert (=> start!82876 m!895051))

(declare-fun m!895053 () Bool)

(assert (=> start!82876 m!895053))

(declare-fun m!895055 () Bool)

(assert (=> b!966956 m!895055))

(assert (=> b!966956 m!895037))

(assert (=> b!966956 m!895055))

(assert (=> b!966956 m!895037))

(declare-fun m!895057 () Bool)

(assert (=> b!966956 m!895057))

(check-sat (not b!966956) b_and!30483 tp_is_empty!21829 (not mapNonEmpty!34738) (not b!966951) (not b!966946) (not b!966949) (not b_next!19021) (not b!966950) (not start!82876))
(check-sat b_and!30483 (not b_next!19021))
