; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4484 () Bool)

(assert start!4484)

(declare-fun b_free!1245 () Bool)

(declare-fun b_next!1245 () Bool)

(assert (=> start!4484 (= b_free!1245 (not b_next!1245))))

(declare-fun tp!5172 () Bool)

(declare-fun b_and!2067 () Bool)

(assert (=> start!4484 (= tp!5172 b_and!2067)))

(declare-fun b!34891 () Bool)

(declare-fun res!21208 () Bool)

(declare-fun e!22071 () Bool)

(assert (=> b!34891 (=> (not res!21208) (not e!22071))))

(declare-datatypes ((V!1957 0))(
  ( (V!1958 (val!826 Int)) )
))
(declare-datatypes ((ValueCell!600 0))(
  ( (ValueCellFull!600 (v!1921 V!1957)) (EmptyCell!600) )
))
(declare-datatypes ((array!2411 0))(
  ( (array!2412 (arr!1153 (Array (_ BitVec 32) ValueCell!600)) (size!1254 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2411)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2413 0))(
  ( (array!2414 (arr!1154 (Array (_ BitVec 32) (_ BitVec 64))) (size!1255 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2413)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34891 (= res!21208 (and (= (size!1254 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1255 _keys!1833) (size!1254 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34892 () Bool)

(declare-fun res!21210 () Bool)

(assert (=> b!34892 (=> (not res!21210) (not e!22071))))

(declare-datatypes ((List!926 0))(
  ( (Nil!923) (Cons!922 (h!1489 (_ BitVec 64)) (t!3631 List!926)) )
))
(declare-fun arrayNoDuplicates!0 (array!2413 (_ BitVec 32) List!926) Bool)

(assert (=> b!34892 (= res!21210 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!923))))

(declare-fun b!34893 () Bool)

(declare-fun e!22073 () Bool)

(declare-fun tp_is_empty!1599 () Bool)

(assert (=> b!34893 (= e!22073 tp_is_empty!1599)))

(declare-fun res!21209 () Bool)

(assert (=> start!4484 (=> (not res!21209) (not e!22071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4484 (= res!21209 (validMask!0 mask!2294))))

(assert (=> start!4484 e!22071))

(assert (=> start!4484 true))

(assert (=> start!4484 tp!5172))

(declare-fun e!22072 () Bool)

(declare-fun array_inv!817 (array!2411) Bool)

(assert (=> start!4484 (and (array_inv!817 _values!1501) e!22072)))

(declare-fun array_inv!818 (array!2413) Bool)

(assert (=> start!4484 (array_inv!818 _keys!1833)))

(assert (=> start!4484 tp_is_empty!1599))

(declare-fun b!34894 () Bool)

(assert (=> b!34894 (= e!22071 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!153 0))(
  ( (MissingZero!153 (index!2734 (_ BitVec 32))) (Found!153 (index!2735 (_ BitVec 32))) (Intermediate!153 (undefined!965 Bool) (index!2736 (_ BitVec 32)) (x!6963 (_ BitVec 32))) (Undefined!153) (MissingVacant!153 (index!2737 (_ BitVec 32))) )
))
(declare-fun lt!12825 () SeekEntryResult!153)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2413 (_ BitVec 32)) SeekEntryResult!153)

(assert (=> b!34894 (= lt!12825 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34895 () Bool)

(declare-fun e!22074 () Bool)

(assert (=> b!34895 (= e!22074 tp_is_empty!1599)))

(declare-fun b!34896 () Bool)

(declare-fun res!21204 () Bool)

(assert (=> b!34896 (=> (not res!21204) (not e!22071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2413 (_ BitVec 32)) Bool)

(assert (=> b!34896 (= res!21204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1945 () Bool)

(declare-fun mapRes!1945 () Bool)

(declare-fun tp!5173 () Bool)

(assert (=> mapNonEmpty!1945 (= mapRes!1945 (and tp!5173 e!22073))))

(declare-fun mapRest!1945 () (Array (_ BitVec 32) ValueCell!600))

(declare-fun mapValue!1945 () ValueCell!600)

(declare-fun mapKey!1945 () (_ BitVec 32))

(assert (=> mapNonEmpty!1945 (= (arr!1153 _values!1501) (store mapRest!1945 mapKey!1945 mapValue!1945))))

(declare-fun b!34897 () Bool)

(declare-fun res!21205 () Bool)

(assert (=> b!34897 (=> (not res!21205) (not e!22071))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1957)

(declare-fun minValue!1443 () V!1957)

(declare-datatypes ((tuple2!1336 0))(
  ( (tuple2!1337 (_1!679 (_ BitVec 64)) (_2!679 V!1957)) )
))
(declare-datatypes ((List!927 0))(
  ( (Nil!924) (Cons!923 (h!1490 tuple2!1336) (t!3632 List!927)) )
))
(declare-datatypes ((ListLongMap!913 0))(
  ( (ListLongMap!914 (toList!472 List!927)) )
))
(declare-fun contains!418 (ListLongMap!913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!296 (array!2413 array!2411 (_ BitVec 32) (_ BitVec 32) V!1957 V!1957 (_ BitVec 32) Int) ListLongMap!913)

(assert (=> b!34897 (= res!21205 (not (contains!418 (getCurrentListMap!296 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34898 () Bool)

(declare-fun res!21207 () Bool)

(assert (=> b!34898 (=> (not res!21207) (not e!22071))))

(declare-fun arrayContainsKey!0 (array!2413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34898 (= res!21207 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1945 () Bool)

(assert (=> mapIsEmpty!1945 mapRes!1945))

(declare-fun b!34899 () Bool)

(assert (=> b!34899 (= e!22072 (and e!22074 mapRes!1945))))

(declare-fun condMapEmpty!1945 () Bool)

(declare-fun mapDefault!1945 () ValueCell!600)

(assert (=> b!34899 (= condMapEmpty!1945 (= (arr!1153 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!600)) mapDefault!1945)))))

(declare-fun b!34900 () Bool)

(declare-fun res!21206 () Bool)

(assert (=> b!34900 (=> (not res!21206) (not e!22071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34900 (= res!21206 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4484 res!21209) b!34891))

(assert (= (and b!34891 res!21208) b!34896))

(assert (= (and b!34896 res!21204) b!34892))

(assert (= (and b!34892 res!21210) b!34900))

(assert (= (and b!34900 res!21206) b!34897))

(assert (= (and b!34897 res!21205) b!34898))

(assert (= (and b!34898 res!21207) b!34894))

(assert (= (and b!34899 condMapEmpty!1945) mapIsEmpty!1945))

(assert (= (and b!34899 (not condMapEmpty!1945)) mapNonEmpty!1945))

(get-info :version)

(assert (= (and mapNonEmpty!1945 ((_ is ValueCellFull!600) mapValue!1945)) b!34893))

(assert (= (and b!34899 ((_ is ValueCellFull!600) mapDefault!1945)) b!34895))

(assert (= start!4484 b!34899))

(declare-fun m!28099 () Bool)

(assert (=> b!34897 m!28099))

(assert (=> b!34897 m!28099))

(declare-fun m!28101 () Bool)

(assert (=> b!34897 m!28101))

(declare-fun m!28103 () Bool)

(assert (=> b!34898 m!28103))

(declare-fun m!28105 () Bool)

(assert (=> start!4484 m!28105))

(declare-fun m!28107 () Bool)

(assert (=> start!4484 m!28107))

(declare-fun m!28109 () Bool)

(assert (=> start!4484 m!28109))

(declare-fun m!28111 () Bool)

(assert (=> b!34892 m!28111))

(declare-fun m!28113 () Bool)

(assert (=> b!34894 m!28113))

(declare-fun m!28115 () Bool)

(assert (=> b!34896 m!28115))

(declare-fun m!28117 () Bool)

(assert (=> b!34900 m!28117))

(declare-fun m!28119 () Bool)

(assert (=> mapNonEmpty!1945 m!28119))

(check-sat (not b_next!1245) (not start!4484) (not b!34898) tp_is_empty!1599 b_and!2067 (not b!34896) (not b!34897) (not mapNonEmpty!1945) (not b!34894) (not b!34900) (not b!34892))
(check-sat b_and!2067 (not b_next!1245))
