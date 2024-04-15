; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110980 () Bool)

(assert start!110980)

(declare-fun b_free!29815 () Bool)

(declare-fun b_next!29815 () Bool)

(assert (=> start!110980 (= b_free!29815 (not b_next!29815))))

(declare-fun tp!104767 () Bool)

(declare-fun b_and!48005 () Bool)

(assert (=> start!110980 (= tp!104767 b_and!48005)))

(declare-fun res!872267 () Bool)

(declare-fun e!749441 () Bool)

(assert (=> start!110980 (=> (not res!872267) (not e!749441))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110980 (= res!872267 (validMask!0 mask!2040))))

(assert (=> start!110980 e!749441))

(assert (=> start!110980 tp!104767))

(declare-datatypes ((array!87969 0))(
  ( (array!87970 (arr!42465 (Array (_ BitVec 32) (_ BitVec 64))) (size!43017 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87969)

(declare-fun array_inv!32265 (array!87969) Bool)

(assert (=> start!110980 (array_inv!32265 _keys!1628)))

(assert (=> start!110980 true))

(declare-fun tp_is_empty!35545 () Bool)

(assert (=> start!110980 tp_is_empty!35545))

(declare-datatypes ((V!52497 0))(
  ( (V!52498 (val!17847 Int)) )
))
(declare-datatypes ((ValueCell!16874 0))(
  ( (ValueCellFull!16874 (v!20473 V!52497)) (EmptyCell!16874) )
))
(declare-datatypes ((array!87971 0))(
  ( (array!87972 (arr!42466 (Array (_ BitVec 32) ValueCell!16874)) (size!43018 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87971)

(declare-fun e!749442 () Bool)

(declare-fun array_inv!32266 (array!87971) Bool)

(assert (=> start!110980 (and (array_inv!32266 _values!1354) e!749442)))

(declare-fun mapNonEmpty!54946 () Bool)

(declare-fun mapRes!54946 () Bool)

(declare-fun tp!104768 () Bool)

(declare-fun e!749444 () Bool)

(assert (=> mapNonEmpty!54946 (= mapRes!54946 (and tp!104768 e!749444))))

(declare-fun mapRest!54946 () (Array (_ BitVec 32) ValueCell!16874))

(declare-fun mapKey!54946 () (_ BitVec 32))

(declare-fun mapValue!54946 () ValueCell!16874)

(assert (=> mapNonEmpty!54946 (= (arr!42466 _values!1354) (store mapRest!54946 mapKey!54946 mapValue!54946))))

(declare-fun b!1313848 () Bool)

(assert (=> b!1313848 (= e!749441 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52497)

(declare-fun zeroValue!1296 () V!52497)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585546 () Bool)

(declare-datatypes ((tuple2!23096 0))(
  ( (tuple2!23097 (_1!11559 (_ BitVec 64)) (_2!11559 V!52497)) )
))
(declare-datatypes ((List!30216 0))(
  ( (Nil!30213) (Cons!30212 (h!31421 tuple2!23096) (t!43814 List!30216)) )
))
(declare-datatypes ((ListLongMap!20753 0))(
  ( (ListLongMap!20754 (toList!10392 List!30216)) )
))
(declare-fun contains!8469 (ListLongMap!20753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5287 (array!87969 array!87971 (_ BitVec 32) (_ BitVec 32) V!52497 V!52497 (_ BitVec 32) Int) ListLongMap!20753)

(assert (=> b!1313848 (= lt!585546 (contains!8469 (getCurrentListMap!5287 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54946 () Bool)

(assert (=> mapIsEmpty!54946 mapRes!54946))

(declare-fun b!1313849 () Bool)

(declare-fun res!872268 () Bool)

(assert (=> b!1313849 (=> (not res!872268) (not e!749441))))

(assert (=> b!1313849 (= res!872268 (and (= (size!43018 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43017 _keys!1628) (size!43018 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313850 () Bool)

(declare-fun res!872266 () Bool)

(assert (=> b!1313850 (=> (not res!872266) (not e!749441))))

(assert (=> b!1313850 (= res!872266 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43017 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313851 () Bool)

(declare-fun res!872269 () Bool)

(assert (=> b!1313851 (=> (not res!872269) (not e!749441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87969 (_ BitVec 32)) Bool)

(assert (=> b!1313851 (= res!872269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313852 () Bool)

(declare-fun e!749443 () Bool)

(assert (=> b!1313852 (= e!749443 tp_is_empty!35545)))

(declare-fun b!1313853 () Bool)

(declare-fun res!872265 () Bool)

(assert (=> b!1313853 (=> (not res!872265) (not e!749441))))

(declare-datatypes ((List!30217 0))(
  ( (Nil!30214) (Cons!30213 (h!31422 (_ BitVec 64)) (t!43815 List!30217)) )
))
(declare-fun arrayNoDuplicates!0 (array!87969 (_ BitVec 32) List!30217) Bool)

(assert (=> b!1313853 (= res!872265 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30214))))

(declare-fun b!1313854 () Bool)

(assert (=> b!1313854 (= e!749444 tp_is_empty!35545)))

(declare-fun b!1313855 () Bool)

(assert (=> b!1313855 (= e!749442 (and e!749443 mapRes!54946))))

(declare-fun condMapEmpty!54946 () Bool)

(declare-fun mapDefault!54946 () ValueCell!16874)

(assert (=> b!1313855 (= condMapEmpty!54946 (= (arr!42466 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16874)) mapDefault!54946)))))

(assert (= (and start!110980 res!872267) b!1313849))

(assert (= (and b!1313849 res!872268) b!1313851))

(assert (= (and b!1313851 res!872269) b!1313853))

(assert (= (and b!1313853 res!872265) b!1313850))

(assert (= (and b!1313850 res!872266) b!1313848))

(assert (= (and b!1313855 condMapEmpty!54946) mapIsEmpty!54946))

(assert (= (and b!1313855 (not condMapEmpty!54946)) mapNonEmpty!54946))

(get-info :version)

(assert (= (and mapNonEmpty!54946 ((_ is ValueCellFull!16874) mapValue!54946)) b!1313854))

(assert (= (and b!1313855 ((_ is ValueCellFull!16874) mapDefault!54946)) b!1313852))

(assert (= start!110980 b!1313855))

(declare-fun m!1202091 () Bool)

(assert (=> b!1313851 m!1202091))

(declare-fun m!1202093 () Bool)

(assert (=> b!1313848 m!1202093))

(assert (=> b!1313848 m!1202093))

(declare-fun m!1202095 () Bool)

(assert (=> b!1313848 m!1202095))

(declare-fun m!1202097 () Bool)

(assert (=> b!1313853 m!1202097))

(declare-fun m!1202099 () Bool)

(assert (=> mapNonEmpty!54946 m!1202099))

(declare-fun m!1202101 () Bool)

(assert (=> start!110980 m!1202101))

(declare-fun m!1202103 () Bool)

(assert (=> start!110980 m!1202103))

(declare-fun m!1202105 () Bool)

(assert (=> start!110980 m!1202105))

(check-sat (not b!1313851) (not b!1313848) (not start!110980) (not b_next!29815) (not b!1313853) (not mapNonEmpty!54946) tp_is_empty!35545 b_and!48005)
(check-sat b_and!48005 (not b_next!29815))
