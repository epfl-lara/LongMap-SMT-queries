; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!618 () Bool)

(assert start!618)

(declare-fun b_free!91 () Bool)

(declare-fun b_next!91 () Bool)

(assert (=> start!618 (= b_free!91 (not b_next!91))))

(declare-fun tp!491 () Bool)

(declare-fun b_and!229 () Bool)

(assert (=> start!618 (= tp!491 b_and!229)))

(declare-fun b!3889 () Bool)

(declare-fun e!1982 () Bool)

(declare-fun e!1981 () Bool)

(declare-fun mapRes!212 () Bool)

(assert (=> b!3889 (= e!1982 (and e!1981 mapRes!212))))

(declare-fun condMapEmpty!212 () Bool)

(declare-datatypes ((V!403 0))(
  ( (V!404 (val!90 Int)) )
))
(declare-datatypes ((ValueCell!68 0))(
  ( (ValueCellFull!68 (v!1177 V!403)) (EmptyCell!68) )
))
(declare-datatypes ((array!267 0))(
  ( (array!268 (arr!126 (Array (_ BitVec 32) ValueCell!68)) (size!188 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!267)

(declare-fun mapDefault!212 () ValueCell!68)

(assert (=> b!3889 (= condMapEmpty!212 (= (arr!126 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!68)) mapDefault!212)))))

(declare-fun b!3890 () Bool)

(declare-fun res!5427 () Bool)

(declare-fun e!1984 () Bool)

(assert (=> b!3890 (=> (not res!5427) (not e!1984))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((array!269 0))(
  ( (array!270 (arr!127 (Array (_ BitVec 32) (_ BitVec 64))) (size!189 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!269)

(assert (=> b!3890 (= res!5427 (and (= (size!188 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!189 _keys!1806) (size!188 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5426 () Bool)

(assert (=> start!618 (=> (not res!5426) (not e!1984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!618 (= res!5426 (validMask!0 mask!2250))))

(assert (=> start!618 e!1984))

(assert (=> start!618 tp!491))

(assert (=> start!618 true))

(declare-fun array_inv!89 (array!267) Bool)

(assert (=> start!618 (and (array_inv!89 _values!1492) e!1982)))

(declare-fun tp_is_empty!169 () Bool)

(assert (=> start!618 tp_is_empty!169))

(declare-fun array_inv!90 (array!269) Bool)

(assert (=> start!618 (array_inv!90 _keys!1806)))

(declare-fun b!3891 () Bool)

(declare-fun res!5428 () Bool)

(assert (=> b!3891 (=> (not res!5428) (not e!1984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!269 (_ BitVec 32)) Bool)

(assert (=> b!3891 (= res!5428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3892 () Bool)

(assert (=> b!3892 (= e!1981 tp_is_empty!169)))

(declare-fun b!3893 () Bool)

(assert (=> b!3893 (= e!1984 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!403)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!403)

(declare-fun lt!537 () Bool)

(declare-datatypes ((tuple2!72 0))(
  ( (tuple2!73 (_1!36 (_ BitVec 64)) (_2!36 V!403)) )
))
(declare-datatypes ((List!78 0))(
  ( (Nil!75) (Cons!74 (h!640 tuple2!72) (t!2205 List!78)) )
))
(declare-datatypes ((ListLongMap!77 0))(
  ( (ListLongMap!78 (toList!54 List!78)) )
))
(declare-fun contains!24 (ListLongMap!77 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!13 (array!269 array!267 (_ BitVec 32) (_ BitVec 32) V!403 V!403 (_ BitVec 32) Int) ListLongMap!77)

(assert (=> b!3893 (= lt!537 (contains!24 (getCurrentListMap!13 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3894 () Bool)

(declare-fun e!1983 () Bool)

(assert (=> b!3894 (= e!1983 tp_is_empty!169)))

(declare-fun b!3895 () Bool)

(declare-fun res!5425 () Bool)

(assert (=> b!3895 (=> (not res!5425) (not e!1984))))

(declare-datatypes ((List!79 0))(
  ( (Nil!76) (Cons!75 (h!641 (_ BitVec 64)) (t!2206 List!79)) )
))
(declare-fun arrayNoDuplicates!0 (array!269 (_ BitVec 32) List!79) Bool)

(assert (=> b!3895 (= res!5425 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!76))))

(declare-fun mapIsEmpty!212 () Bool)

(assert (=> mapIsEmpty!212 mapRes!212))

(declare-fun mapNonEmpty!212 () Bool)

(declare-fun tp!490 () Bool)

(assert (=> mapNonEmpty!212 (= mapRes!212 (and tp!490 e!1983))))

(declare-fun mapValue!212 () ValueCell!68)

(declare-fun mapRest!212 () (Array (_ BitVec 32) ValueCell!68))

(declare-fun mapKey!212 () (_ BitVec 32))

(assert (=> mapNonEmpty!212 (= (arr!126 _values!1492) (store mapRest!212 mapKey!212 mapValue!212))))

(assert (= (and start!618 res!5426) b!3890))

(assert (= (and b!3890 res!5427) b!3891))

(assert (= (and b!3891 res!5428) b!3895))

(assert (= (and b!3895 res!5425) b!3893))

(assert (= (and b!3889 condMapEmpty!212) mapIsEmpty!212))

(assert (= (and b!3889 (not condMapEmpty!212)) mapNonEmpty!212))

(get-info :version)

(assert (= (and mapNonEmpty!212 ((_ is ValueCellFull!68) mapValue!212)) b!3894))

(assert (= (and b!3889 ((_ is ValueCellFull!68) mapDefault!212)) b!3892))

(assert (= start!618 b!3889))

(declare-fun m!1967 () Bool)

(assert (=> mapNonEmpty!212 m!1967))

(declare-fun m!1969 () Bool)

(assert (=> b!3893 m!1969))

(assert (=> b!3893 m!1969))

(declare-fun m!1971 () Bool)

(assert (=> b!3893 m!1971))

(declare-fun m!1973 () Bool)

(assert (=> b!3895 m!1973))

(declare-fun m!1975 () Bool)

(assert (=> start!618 m!1975))

(declare-fun m!1977 () Bool)

(assert (=> start!618 m!1977))

(declare-fun m!1979 () Bool)

(assert (=> start!618 m!1979))

(declare-fun m!1981 () Bool)

(assert (=> b!3891 m!1981))

(check-sat b_and!229 (not b!3893) (not b!3891) tp_is_empty!169 (not b!3895) (not start!618) (not mapNonEmpty!212) (not b_next!91))
(check-sat b_and!229 (not b_next!91))
