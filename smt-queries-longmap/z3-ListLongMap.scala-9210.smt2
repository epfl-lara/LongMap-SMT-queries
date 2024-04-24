; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110832 () Bool)

(assert start!110832)

(declare-fun b_free!29443 () Bool)

(declare-fun b_next!29443 () Bool)

(assert (=> start!110832 (= b_free!29443 (not b_next!29443))))

(declare-fun tp!103651 () Bool)

(declare-fun b_and!47653 () Bool)

(assert (=> start!110832 (= tp!103651 b_and!47653)))

(declare-fun b!1310050 () Bool)

(declare-fun res!869327 () Bool)

(declare-fun e!747526 () Bool)

(assert (=> b!1310050 (=> (not res!869327) (not e!747526))))

(declare-datatypes ((array!87403 0))(
  ( (array!87404 (arr!42177 (Array (_ BitVec 32) (_ BitVec 64))) (size!42728 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87403)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87403 (_ BitVec 32)) Bool)

(assert (=> b!1310050 (= res!869327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869323 () Bool)

(assert (=> start!110832 (=> (not res!869323) (not e!747526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110832 (= res!869323 (validMask!0 mask!2040))))

(assert (=> start!110832 e!747526))

(assert (=> start!110832 tp!103651))

(declare-fun array_inv!32137 (array!87403) Bool)

(assert (=> start!110832 (array_inv!32137 _keys!1628)))

(assert (=> start!110832 true))

(declare-fun tp_is_empty!35173 () Bool)

(assert (=> start!110832 tp_is_empty!35173))

(declare-datatypes ((V!52001 0))(
  ( (V!52002 (val!17661 Int)) )
))
(declare-datatypes ((ValueCell!16688 0))(
  ( (ValueCellFull!16688 (v!20283 V!52001)) (EmptyCell!16688) )
))
(declare-datatypes ((array!87405 0))(
  ( (array!87406 (arr!42178 (Array (_ BitVec 32) ValueCell!16688)) (size!42729 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87405)

(declare-fun e!747530 () Bool)

(declare-fun array_inv!32138 (array!87405) Bool)

(assert (=> start!110832 (and (array_inv!32138 _values!1354) e!747530)))

(declare-fun b!1310051 () Bool)

(declare-fun res!869324 () Bool)

(assert (=> b!1310051 (=> (not res!869324) (not e!747526))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310051 (= res!869324 (not (= (select (arr!42177 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310052 () Bool)

(declare-fun e!747527 () Bool)

(assert (=> b!1310052 (= e!747527 tp_is_empty!35173)))

(declare-fun b!1310053 () Bool)

(declare-fun res!869321 () Bool)

(assert (=> b!1310053 (=> (not res!869321) (not e!747526))))

(declare-datatypes ((List!29943 0))(
  ( (Nil!29940) (Cons!29939 (h!31157 (_ BitVec 64)) (t!43541 List!29943)) )
))
(declare-fun arrayNoDuplicates!0 (array!87403 (_ BitVec 32) List!29943) Bool)

(assert (=> b!1310053 (= res!869321 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29940))))

(declare-fun b!1310054 () Bool)

(declare-fun res!869320 () Bool)

(assert (=> b!1310054 (=> (not res!869320) (not e!747526))))

(assert (=> b!1310054 (= res!869320 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42728 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310055 () Bool)

(declare-fun res!869325 () Bool)

(assert (=> b!1310055 (=> (not res!869325) (not e!747526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310055 (= res!869325 (validKeyInArray!0 (select (arr!42177 _keys!1628) from!2020)))))

(declare-fun b!1310056 () Bool)

(declare-fun res!869319 () Bool)

(assert (=> b!1310056 (=> (not res!869319) (not e!747526))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310056 (= res!869319 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1310057 () Bool)

(declare-fun res!869326 () Bool)

(assert (=> b!1310057 (=> (not res!869326) (not e!747526))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52001)

(declare-fun zeroValue!1296 () V!52001)

(declare-datatypes ((tuple2!22786 0))(
  ( (tuple2!22787 (_1!11404 (_ BitVec 64)) (_2!11404 V!52001)) )
))
(declare-datatypes ((List!29944 0))(
  ( (Nil!29941) (Cons!29940 (h!31158 tuple2!22786) (t!43542 List!29944)) )
))
(declare-datatypes ((ListLongMap!20451 0))(
  ( (ListLongMap!20452 (toList!10241 List!29944)) )
))
(declare-fun contains!8403 (ListLongMap!20451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5245 (array!87403 array!87405 (_ BitVec 32) (_ BitVec 32) V!52001 V!52001 (_ BitVec 32) Int) ListLongMap!20451)

(assert (=> b!1310057 (= res!869326 (contains!8403 (getCurrentListMap!5245 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310058 () Bool)

(declare-fun mapRes!54388 () Bool)

(assert (=> b!1310058 (= e!747530 (and e!747527 mapRes!54388))))

(declare-fun condMapEmpty!54388 () Bool)

(declare-fun mapDefault!54388 () ValueCell!16688)

(assert (=> b!1310058 (= condMapEmpty!54388 (= (arr!42178 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16688)) mapDefault!54388)))))

(declare-fun mapNonEmpty!54388 () Bool)

(declare-fun tp!103650 () Bool)

(declare-fun e!747529 () Bool)

(assert (=> mapNonEmpty!54388 (= mapRes!54388 (and tp!103650 e!747529))))

(declare-fun mapValue!54388 () ValueCell!16688)

(declare-fun mapRest!54388 () (Array (_ BitVec 32) ValueCell!16688))

(declare-fun mapKey!54388 () (_ BitVec 32))

(assert (=> mapNonEmpty!54388 (= (arr!42178 _values!1354) (store mapRest!54388 mapKey!54388 mapValue!54388))))

(declare-fun b!1310059 () Bool)

(declare-fun res!869322 () Bool)

(assert (=> b!1310059 (=> (not res!869322) (not e!747526))))

(assert (=> b!1310059 (= res!869322 (and (= (size!42729 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42728 _keys!1628) (size!42729 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54388 () Bool)

(assert (=> mapIsEmpty!54388 mapRes!54388))

(declare-fun b!1310060 () Bool)

(assert (=> b!1310060 (= e!747529 tp_is_empty!35173)))

(declare-fun b!1310061 () Bool)

(assert (=> b!1310061 (= e!747526 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(assert (=> b!1310061 (contains!8403 (getCurrentListMap!5245 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43277 0))(
  ( (Unit!43278) )
))
(declare-fun lt!585659 () Unit!43277)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 (array!87403 array!87405 (_ BitVec 32) (_ BitVec 32) V!52001 V!52001 (_ BitVec 64) (_ BitVec 32) Int) Unit!43277)

(assert (=> b!1310061 (= lt!585659 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(assert (= (and start!110832 res!869323) b!1310059))

(assert (= (and b!1310059 res!869322) b!1310050))

(assert (= (and b!1310050 res!869327) b!1310053))

(assert (= (and b!1310053 res!869321) b!1310054))

(assert (= (and b!1310054 res!869320) b!1310057))

(assert (= (and b!1310057 res!869326) b!1310051))

(assert (= (and b!1310051 res!869324) b!1310055))

(assert (= (and b!1310055 res!869325) b!1310056))

(assert (= (and b!1310056 res!869319) b!1310061))

(assert (= (and b!1310058 condMapEmpty!54388) mapIsEmpty!54388))

(assert (= (and b!1310058 (not condMapEmpty!54388)) mapNonEmpty!54388))

(get-info :version)

(assert (= (and mapNonEmpty!54388 ((_ is ValueCellFull!16688) mapValue!54388)) b!1310060))

(assert (= (and b!1310058 ((_ is ValueCellFull!16688) mapDefault!54388)) b!1310052))

(assert (= start!110832 b!1310058))

(declare-fun m!1200647 () Bool)

(assert (=> start!110832 m!1200647))

(declare-fun m!1200649 () Bool)

(assert (=> start!110832 m!1200649))

(declare-fun m!1200651 () Bool)

(assert (=> start!110832 m!1200651))

(declare-fun m!1200653 () Bool)

(assert (=> b!1310057 m!1200653))

(assert (=> b!1310057 m!1200653))

(declare-fun m!1200655 () Bool)

(assert (=> b!1310057 m!1200655))

(declare-fun m!1200657 () Bool)

(assert (=> mapNonEmpty!54388 m!1200657))

(declare-fun m!1200659 () Bool)

(assert (=> b!1310055 m!1200659))

(assert (=> b!1310055 m!1200659))

(declare-fun m!1200661 () Bool)

(assert (=> b!1310055 m!1200661))

(declare-fun m!1200663 () Bool)

(assert (=> b!1310050 m!1200663))

(declare-fun m!1200665 () Bool)

(assert (=> b!1310053 m!1200665))

(declare-fun m!1200667 () Bool)

(assert (=> b!1310061 m!1200667))

(assert (=> b!1310061 m!1200667))

(declare-fun m!1200669 () Bool)

(assert (=> b!1310061 m!1200669))

(declare-fun m!1200671 () Bool)

(assert (=> b!1310061 m!1200671))

(assert (=> b!1310051 m!1200659))

(check-sat (not b!1310061) (not b!1310053) (not mapNonEmpty!54388) (not b!1310057) b_and!47653 (not b!1310050) (not b!1310055) (not b_next!29443) tp_is_empty!35173 (not start!110832))
(check-sat b_and!47653 (not b_next!29443))
