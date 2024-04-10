; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110988 () Bool)

(assert start!110988)

(declare-fun b_free!29823 () Bool)

(declare-fun b_next!29823 () Bool)

(assert (=> start!110988 (= b_free!29823 (not b_next!29823))))

(declare-fun tp!104791 () Bool)

(declare-fun b_and!48031 () Bool)

(assert (=> start!110988 (= tp!104791 b_and!48031)))

(declare-fun b!1314014 () Bool)

(declare-fun res!872356 () Bool)

(declare-fun e!749535 () Bool)

(assert (=> b!1314014 (=> (not res!872356) (not e!749535))))

(declare-datatypes ((array!88078 0))(
  ( (array!88079 (arr!42519 (Array (_ BitVec 32) (_ BitVec 64))) (size!43069 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88078)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88078 (_ BitVec 32)) Bool)

(assert (=> b!1314014 (= res!872356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314015 () Bool)

(declare-fun res!872354 () Bool)

(assert (=> b!1314015 (=> (not res!872354) (not e!749535))))

(declare-datatypes ((V!52507 0))(
  ( (V!52508 (val!17851 Int)) )
))
(declare-datatypes ((ValueCell!16878 0))(
  ( (ValueCellFull!16878 (v!20478 V!52507)) (EmptyCell!16878) )
))
(declare-datatypes ((array!88080 0))(
  ( (array!88081 (arr!42520 (Array (_ BitVec 32) ValueCell!16878)) (size!43070 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88080)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314015 (= res!872354 (and (= (size!43070 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43069 _keys!1628) (size!43070 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314016 () Bool)

(declare-fun e!749533 () Bool)

(declare-fun tp_is_empty!35553 () Bool)

(assert (=> b!1314016 (= e!749533 tp_is_empty!35553)))

(declare-fun res!872358 () Bool)

(assert (=> start!110988 (=> (not res!872358) (not e!749535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110988 (= res!872358 (validMask!0 mask!2040))))

(assert (=> start!110988 e!749535))

(assert (=> start!110988 tp!104791))

(declare-fun array_inv!32119 (array!88078) Bool)

(assert (=> start!110988 (array_inv!32119 _keys!1628)))

(assert (=> start!110988 true))

(assert (=> start!110988 tp_is_empty!35553))

(declare-fun e!749536 () Bool)

(declare-fun array_inv!32120 (array!88080) Bool)

(assert (=> start!110988 (and (array_inv!32120 _values!1354) e!749536)))

(declare-fun mapIsEmpty!54958 () Bool)

(declare-fun mapRes!54958 () Bool)

(assert (=> mapIsEmpty!54958 mapRes!54958))

(declare-fun b!1314017 () Bool)

(declare-fun res!872355 () Bool)

(assert (=> b!1314017 (=> (not res!872355) (not e!749535))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314017 (= res!872355 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43069 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54958 () Bool)

(declare-fun tp!104790 () Bool)

(assert (=> mapNonEmpty!54958 (= mapRes!54958 (and tp!104790 e!749533))))

(declare-fun mapRest!54958 () (Array (_ BitVec 32) ValueCell!16878))

(declare-fun mapValue!54958 () ValueCell!16878)

(declare-fun mapKey!54958 () (_ BitVec 32))

(assert (=> mapNonEmpty!54958 (= (arr!42520 _values!1354) (store mapRest!54958 mapKey!54958 mapValue!54958))))

(declare-fun b!1314018 () Bool)

(assert (=> b!1314018 (= e!749535 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52507)

(declare-fun lt!585744 () Bool)

(declare-fun zeroValue!1296 () V!52507)

(declare-datatypes ((tuple2!23016 0))(
  ( (tuple2!23017 (_1!11519 (_ BitVec 64)) (_2!11519 V!52507)) )
))
(declare-datatypes ((List!30153 0))(
  ( (Nil!30150) (Cons!30149 (h!31358 tuple2!23016) (t!43759 List!30153)) )
))
(declare-datatypes ((ListLongMap!20673 0))(
  ( (ListLongMap!20674 (toList!10352 List!30153)) )
))
(declare-fun contains!8502 (ListLongMap!20673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5365 (array!88078 array!88080 (_ BitVec 32) (_ BitVec 32) V!52507 V!52507 (_ BitVec 32) Int) ListLongMap!20673)

(assert (=> b!1314018 (= lt!585744 (contains!8502 (getCurrentListMap!5365 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314019 () Bool)

(declare-fun e!749534 () Bool)

(assert (=> b!1314019 (= e!749536 (and e!749534 mapRes!54958))))

(declare-fun condMapEmpty!54958 () Bool)

(declare-fun mapDefault!54958 () ValueCell!16878)

(assert (=> b!1314019 (= condMapEmpty!54958 (= (arr!42520 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16878)) mapDefault!54958)))))

(declare-fun b!1314020 () Bool)

(assert (=> b!1314020 (= e!749534 tp_is_empty!35553)))

(declare-fun b!1314021 () Bool)

(declare-fun res!872357 () Bool)

(assert (=> b!1314021 (=> (not res!872357) (not e!749535))))

(declare-datatypes ((List!30154 0))(
  ( (Nil!30151) (Cons!30150 (h!31359 (_ BitVec 64)) (t!43760 List!30154)) )
))
(declare-fun arrayNoDuplicates!0 (array!88078 (_ BitVec 32) List!30154) Bool)

(assert (=> b!1314021 (= res!872357 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30151))))

(assert (= (and start!110988 res!872358) b!1314015))

(assert (= (and b!1314015 res!872354) b!1314014))

(assert (= (and b!1314014 res!872356) b!1314021))

(assert (= (and b!1314021 res!872357) b!1314017))

(assert (= (and b!1314017 res!872355) b!1314018))

(assert (= (and b!1314019 condMapEmpty!54958) mapIsEmpty!54958))

(assert (= (and b!1314019 (not condMapEmpty!54958)) mapNonEmpty!54958))

(get-info :version)

(assert (= (and mapNonEmpty!54958 ((_ is ValueCellFull!16878) mapValue!54958)) b!1314016))

(assert (= (and b!1314019 ((_ is ValueCellFull!16878) mapDefault!54958)) b!1314020))

(assert (= start!110988 b!1314019))

(declare-fun m!1202671 () Bool)

(assert (=> b!1314021 m!1202671))

(declare-fun m!1202673 () Bool)

(assert (=> start!110988 m!1202673))

(declare-fun m!1202675 () Bool)

(assert (=> start!110988 m!1202675))

(declare-fun m!1202677 () Bool)

(assert (=> start!110988 m!1202677))

(declare-fun m!1202679 () Bool)

(assert (=> b!1314014 m!1202679))

(declare-fun m!1202681 () Bool)

(assert (=> b!1314018 m!1202681))

(assert (=> b!1314018 m!1202681))

(declare-fun m!1202683 () Bool)

(assert (=> b!1314018 m!1202683))

(declare-fun m!1202685 () Bool)

(assert (=> mapNonEmpty!54958 m!1202685))

(check-sat (not b!1314021) b_and!48031 (not mapNonEmpty!54958) tp_is_empty!35553 (not b!1314018) (not b_next!29823) (not start!110988) (not b!1314014))
(check-sat b_and!48031 (not b_next!29823))
