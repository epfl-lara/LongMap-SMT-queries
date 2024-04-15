; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82942 () Bool)

(assert start!82942)

(declare-fun b_free!19087 () Bool)

(declare-fun b_next!19087 () Bool)

(assert (=> start!82942 (= b_free!19087 (not b_next!19087))))

(declare-fun tp!66390 () Bool)

(declare-fun b_and!30549 () Bool)

(assert (=> start!82942 (= tp!66390 b_and!30549)))

(declare-fun b!968053 () Bool)

(declare-fun e!545533 () Bool)

(declare-fun tp_is_empty!21895 () Bool)

(assert (=> b!968053 (= e!545533 tp_is_empty!21895)))

(declare-fun b!968054 () Bool)

(declare-fun res!648133 () Bool)

(declare-fun e!545532 () Bool)

(assert (=> b!968054 (=> (not res!648133) (not e!545532))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34177 0))(
  ( (V!34178 (val!10998 Int)) )
))
(declare-datatypes ((ValueCell!10466 0))(
  ( (ValueCellFull!10466 (v!13555 V!34177)) (EmptyCell!10466) )
))
(declare-datatypes ((array!59790 0))(
  ( (array!59791 (arr!28764 (Array (_ BitVec 32) ValueCell!10466)) (size!29245 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59790)

(declare-datatypes ((array!59792 0))(
  ( (array!59793 (arr!28765 (Array (_ BitVec 32) (_ BitVec 64))) (size!29246 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59792)

(declare-fun minValue!1342 () V!34177)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34177)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14226 0))(
  ( (tuple2!14227 (_1!7124 (_ BitVec 64)) (_2!7124 V!34177)) )
))
(declare-datatypes ((List!20025 0))(
  ( (Nil!20022) (Cons!20021 (h!21183 tuple2!14226) (t!28379 List!20025)) )
))
(declare-datatypes ((ListLongMap!12913 0))(
  ( (ListLongMap!12914 (toList!6472 List!20025)) )
))
(declare-fun contains!5517 (ListLongMap!12913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3634 (array!59792 array!59790 (_ BitVec 32) (_ BitVec 32) V!34177 V!34177 (_ BitVec 32) Int) ListLongMap!12913)

(assert (=> b!968054 (= res!648133 (contains!5517 (getCurrentListMap!3634 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28765 _keys!1686) i!803)))))

(declare-fun b!968055 () Bool)

(declare-fun res!648130 () Bool)

(assert (=> b!968055 (=> (not res!648130) (not e!545532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59792 (_ BitVec 32)) Bool)

(assert (=> b!968055 (= res!648130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968056 () Bool)

(assert (=> b!968056 (= e!545532 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun lt!431279 () ListLongMap!12913)

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968056 (= lt!431279 (getCurrentListMap!3634 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403))))

(declare-fun b!968057 () Bool)

(declare-fun res!648129 () Bool)

(assert (=> b!968057 (=> (not res!648129) (not e!545532))))

(assert (=> b!968057 (= res!648129 (bvsle from!2084 newFrom!159))))

(declare-fun res!648131 () Bool)

(assert (=> start!82942 (=> (not res!648131) (not e!545532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82942 (= res!648131 (validMask!0 mask!2110))))

(assert (=> start!82942 e!545532))

(assert (=> start!82942 true))

(declare-fun e!545534 () Bool)

(declare-fun array_inv!22333 (array!59790) Bool)

(assert (=> start!82942 (and (array_inv!22333 _values!1400) e!545534)))

(declare-fun array_inv!22334 (array!59792) Bool)

(assert (=> start!82942 (array_inv!22334 _keys!1686)))

(assert (=> start!82942 tp!66390))

(assert (=> start!82942 tp_is_empty!21895))

(declare-fun mapIsEmpty!34837 () Bool)

(declare-fun mapRes!34837 () Bool)

(assert (=> mapIsEmpty!34837 mapRes!34837))

(declare-fun mapNonEmpty!34837 () Bool)

(declare-fun tp!66391 () Bool)

(assert (=> mapNonEmpty!34837 (= mapRes!34837 (and tp!66391 e!545533))))

(declare-fun mapRest!34837 () (Array (_ BitVec 32) ValueCell!10466))

(declare-fun mapValue!34837 () ValueCell!10466)

(declare-fun mapKey!34837 () (_ BitVec 32))

(assert (=> mapNonEmpty!34837 (= (arr!28764 _values!1400) (store mapRest!34837 mapKey!34837 mapValue!34837))))

(declare-fun b!968058 () Bool)

(declare-fun res!648134 () Bool)

(assert (=> b!968058 (=> (not res!648134) (not e!545532))))

(declare-datatypes ((List!20026 0))(
  ( (Nil!20023) (Cons!20022 (h!21184 (_ BitVec 64)) (t!28380 List!20026)) )
))
(declare-fun arrayNoDuplicates!0 (array!59792 (_ BitVec 32) List!20026) Bool)

(assert (=> b!968058 (= res!648134 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20023))))

(declare-fun b!968059 () Bool)

(declare-fun e!545535 () Bool)

(assert (=> b!968059 (= e!545534 (and e!545535 mapRes!34837))))

(declare-fun condMapEmpty!34837 () Bool)

(declare-fun mapDefault!34837 () ValueCell!10466)

(assert (=> b!968059 (= condMapEmpty!34837 (= (arr!28764 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10466)) mapDefault!34837)))))

(declare-fun b!968060 () Bool)

(declare-fun res!648132 () Bool)

(assert (=> b!968060 (=> (not res!648132) (not e!545532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968060 (= res!648132 (validKeyInArray!0 (select (arr!28765 _keys!1686) i!803)))))

(declare-fun b!968061 () Bool)

(assert (=> b!968061 (= e!545535 tp_is_empty!21895)))

(declare-fun b!968062 () Bool)

(declare-fun res!648128 () Bool)

(assert (=> b!968062 (=> (not res!648128) (not e!545532))))

(assert (=> b!968062 (= res!648128 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29246 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29246 _keys!1686))))))

(declare-fun b!968063 () Bool)

(declare-fun res!648127 () Bool)

(assert (=> b!968063 (=> (not res!648127) (not e!545532))))

(assert (=> b!968063 (= res!648127 (and (= (size!29245 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29246 _keys!1686) (size!29245 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82942 res!648131) b!968063))

(assert (= (and b!968063 res!648127) b!968055))

(assert (= (and b!968055 res!648130) b!968058))

(assert (= (and b!968058 res!648134) b!968062))

(assert (= (and b!968062 res!648128) b!968060))

(assert (= (and b!968060 res!648132) b!968054))

(assert (= (and b!968054 res!648133) b!968057))

(assert (= (and b!968057 res!648129) b!968056))

(assert (= (and b!968059 condMapEmpty!34837) mapIsEmpty!34837))

(assert (= (and b!968059 (not condMapEmpty!34837)) mapNonEmpty!34837))

(get-info :version)

(assert (= (and mapNonEmpty!34837 ((_ is ValueCellFull!10466) mapValue!34837)) b!968053))

(assert (= (and b!968059 ((_ is ValueCellFull!10466) mapDefault!34837)) b!968061))

(assert (= start!82942 b!968059))

(declare-fun m!895927 () Bool)

(assert (=> b!968054 m!895927))

(declare-fun m!895929 () Bool)

(assert (=> b!968054 m!895929))

(assert (=> b!968054 m!895927))

(assert (=> b!968054 m!895929))

(declare-fun m!895931 () Bool)

(assert (=> b!968054 m!895931))

(assert (=> b!968060 m!895929))

(assert (=> b!968060 m!895929))

(declare-fun m!895933 () Bool)

(assert (=> b!968060 m!895933))

(declare-fun m!895935 () Bool)

(assert (=> start!82942 m!895935))

(declare-fun m!895937 () Bool)

(assert (=> start!82942 m!895937))

(declare-fun m!895939 () Bool)

(assert (=> start!82942 m!895939))

(declare-fun m!895941 () Bool)

(assert (=> mapNonEmpty!34837 m!895941))

(declare-fun m!895943 () Bool)

(assert (=> b!968056 m!895943))

(declare-fun m!895945 () Bool)

(assert (=> b!968055 m!895945))

(declare-fun m!895947 () Bool)

(assert (=> b!968058 m!895947))

(check-sat (not start!82942) (not b!968056) (not b!968054) (not b!968058) (not b_next!19087) (not mapNonEmpty!34837) b_and!30549 (not b!968055) (not b!968060) tp_is_empty!21895)
(check-sat b_and!30549 (not b_next!19087))
