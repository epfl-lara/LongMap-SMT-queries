; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110650 () Bool)

(assert start!110650)

(declare-fun b_free!29485 () Bool)

(declare-fun b_next!29485 () Bool)

(assert (=> start!110650 (= b_free!29485 (not b_next!29485))))

(declare-fun tp!103777 () Bool)

(declare-fun b_and!47675 () Bool)

(assert (=> start!110650 (= tp!103777 b_and!47675)))

(declare-fun b!1309213 () Bool)

(declare-fun e!746966 () Bool)

(declare-fun tp_is_empty!35215 () Bool)

(assert (=> b!1309213 (= e!746966 tp_is_empty!35215)))

(declare-fun b!1309214 () Bool)

(declare-fun res!869116 () Bool)

(declare-fun e!746965 () Bool)

(assert (=> b!1309214 (=> (not res!869116) (not e!746965))))

(declare-datatypes ((array!87339 0))(
  ( (array!87340 (arr!42150 (Array (_ BitVec 32) (_ BitVec 64))) (size!42702 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87339)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52057 0))(
  ( (V!52058 (val!17682 Int)) )
))
(declare-datatypes ((ValueCell!16709 0))(
  ( (ValueCellFull!16709 (v!20308 V!52057)) (EmptyCell!16709) )
))
(declare-datatypes ((array!87341 0))(
  ( (array!87342 (arr!42151 (Array (_ BitVec 32) ValueCell!16709)) (size!42703 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87341)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309214 (= res!869116 (and (= (size!42703 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42702 _keys!1628) (size!42703 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54451 () Bool)

(declare-fun mapRes!54451 () Bool)

(declare-fun tp!103778 () Bool)

(declare-fun e!746967 () Bool)

(assert (=> mapNonEmpty!54451 (= mapRes!54451 (and tp!103778 e!746967))))

(declare-fun mapValue!54451 () ValueCell!16709)

(declare-fun mapRest!54451 () (Array (_ BitVec 32) ValueCell!16709))

(declare-fun mapKey!54451 () (_ BitVec 32))

(assert (=> mapNonEmpty!54451 (= (arr!42151 _values!1354) (store mapRest!54451 mapKey!54451 mapValue!54451))))

(declare-fun res!869119 () Bool)

(assert (=> start!110650 (=> (not res!869119) (not e!746965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110650 (= res!869119 (validMask!0 mask!2040))))

(assert (=> start!110650 e!746965))

(assert (=> start!110650 tp!103777))

(declare-fun array_inv!32047 (array!87339) Bool)

(assert (=> start!110650 (array_inv!32047 _keys!1628)))

(assert (=> start!110650 true))

(assert (=> start!110650 tp_is_empty!35215))

(declare-fun e!746969 () Bool)

(declare-fun array_inv!32048 (array!87341) Bool)

(assert (=> start!110650 (and (array_inv!32048 _values!1354) e!746969)))

(declare-fun b!1309215 () Bool)

(assert (=> b!1309215 (= e!746969 (and e!746966 mapRes!54451))))

(declare-fun condMapEmpty!54451 () Bool)

(declare-fun mapDefault!54451 () ValueCell!16709)

(assert (=> b!1309215 (= condMapEmpty!54451 (= (arr!42151 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16709)) mapDefault!54451)))))

(declare-fun mapIsEmpty!54451 () Bool)

(assert (=> mapIsEmpty!54451 mapRes!54451))

(declare-fun b!1309216 () Bool)

(assert (=> b!1309216 (= e!746965 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585060 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52057)

(declare-fun zeroValue!1296 () V!52057)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22856 0))(
  ( (tuple2!22857 (_1!11439 (_ BitVec 64)) (_2!11439 V!52057)) )
))
(declare-datatypes ((List!29983 0))(
  ( (Nil!29980) (Cons!29979 (h!31188 tuple2!22856) (t!43581 List!29983)) )
))
(declare-datatypes ((ListLongMap!20513 0))(
  ( (ListLongMap!20514 (toList!10272 List!29983)) )
))
(declare-fun contains!8349 (ListLongMap!20513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5167 (array!87339 array!87341 (_ BitVec 32) (_ BitVec 32) V!52057 V!52057 (_ BitVec 32) Int) ListLongMap!20513)

(assert (=> b!1309216 (= lt!585060 (contains!8349 (getCurrentListMap!5167 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309217 () Bool)

(assert (=> b!1309217 (= e!746967 tp_is_empty!35215)))

(declare-fun b!1309218 () Bool)

(declare-fun res!869118 () Bool)

(assert (=> b!1309218 (=> (not res!869118) (not e!746965))))

(assert (=> b!1309218 (= res!869118 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42702 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309219 () Bool)

(declare-fun res!869117 () Bool)

(assert (=> b!1309219 (=> (not res!869117) (not e!746965))))

(declare-datatypes ((List!29984 0))(
  ( (Nil!29981) (Cons!29980 (h!31189 (_ BitVec 64)) (t!43582 List!29984)) )
))
(declare-fun arrayNoDuplicates!0 (array!87339 (_ BitVec 32) List!29984) Bool)

(assert (=> b!1309219 (= res!869117 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29981))))

(declare-fun b!1309220 () Bool)

(declare-fun res!869115 () Bool)

(assert (=> b!1309220 (=> (not res!869115) (not e!746965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87339 (_ BitVec 32)) Bool)

(assert (=> b!1309220 (= res!869115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110650 res!869119) b!1309214))

(assert (= (and b!1309214 res!869116) b!1309220))

(assert (= (and b!1309220 res!869115) b!1309219))

(assert (= (and b!1309219 res!869117) b!1309218))

(assert (= (and b!1309218 res!869118) b!1309216))

(assert (= (and b!1309215 condMapEmpty!54451) mapIsEmpty!54451))

(assert (= (and b!1309215 (not condMapEmpty!54451)) mapNonEmpty!54451))

(get-info :version)

(assert (= (and mapNonEmpty!54451 ((_ is ValueCellFull!16709) mapValue!54451)) b!1309217))

(assert (= (and b!1309215 ((_ is ValueCellFull!16709) mapDefault!54451)) b!1309213))

(assert (= start!110650 b!1309215))

(declare-fun m!1198899 () Bool)

(assert (=> b!1309220 m!1198899))

(declare-fun m!1198901 () Bool)

(assert (=> start!110650 m!1198901))

(declare-fun m!1198903 () Bool)

(assert (=> start!110650 m!1198903))

(declare-fun m!1198905 () Bool)

(assert (=> start!110650 m!1198905))

(declare-fun m!1198907 () Bool)

(assert (=> b!1309219 m!1198907))

(declare-fun m!1198909 () Bool)

(assert (=> mapNonEmpty!54451 m!1198909))

(declare-fun m!1198911 () Bool)

(assert (=> b!1309216 m!1198911))

(assert (=> b!1309216 m!1198911))

(declare-fun m!1198913 () Bool)

(assert (=> b!1309216 m!1198913))

(check-sat tp_is_empty!35215 b_and!47675 (not b!1309219) (not mapNonEmpty!54451) (not b!1309220) (not b_next!29485) (not start!110650) (not b!1309216))
(check-sat b_and!47675 (not b_next!29485))
