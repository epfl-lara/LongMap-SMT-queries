; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97356 () Bool)

(assert start!97356)

(declare-fun b!1105959 () Bool)

(declare-fun res!737515 () Bool)

(declare-fun e!631373 () Bool)

(assert (=> b!1105959 (=> (not res!737515) (not e!631373))))

(declare-datatypes ((array!71691 0))(
  ( (array!71692 (arr!34493 (Array (_ BitVec 32) (_ BitVec 64))) (size!35030 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71691)

(declare-datatypes ((List!24082 0))(
  ( (Nil!24079) (Cons!24078 (h!25296 (_ BitVec 64)) (t!34339 List!24082)) )
))
(declare-fun arrayNoDuplicates!0 (array!71691 (_ BitVec 32) List!24082) Bool)

(assert (=> b!1105959 (= res!737515 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24079))))

(declare-fun b!1105960 () Bool)

(declare-fun e!631375 () Bool)

(assert (=> b!1105960 (= e!631375 false)))

(declare-fun lt!495687 () Bool)

(declare-fun lt!495688 () array!71691)

(assert (=> b!1105960 (= lt!495687 (arrayNoDuplicates!0 lt!495688 #b00000000000000000000000000000000 Nil!24079))))

(declare-fun mapNonEmpty!42865 () Bool)

(declare-fun mapRes!42865 () Bool)

(declare-fun tp!81785 () Bool)

(declare-fun e!631371 () Bool)

(assert (=> mapNonEmpty!42865 (= mapRes!42865 (and tp!81785 e!631371))))

(declare-fun mapKey!42865 () (_ BitVec 32))

(declare-datatypes ((V!41617 0))(
  ( (V!41618 (val!13740 Int)) )
))
(declare-datatypes ((ValueCell!12974 0))(
  ( (ValueCellFull!12974 (v!16369 V!41617)) (EmptyCell!12974) )
))
(declare-fun mapValue!42865 () ValueCell!12974)

(declare-datatypes ((array!71693 0))(
  ( (array!71694 (arr!34494 (Array (_ BitVec 32) ValueCell!12974)) (size!35031 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71693)

(declare-fun mapRest!42865 () (Array (_ BitVec 32) ValueCell!12974))

(assert (=> mapNonEmpty!42865 (= (arr!34494 _values!996) (store mapRest!42865 mapKey!42865 mapValue!42865))))

(declare-fun b!1105961 () Bool)

(declare-fun res!737514 () Bool)

(assert (=> b!1105961 (=> (not res!737514) (not e!631373))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105961 (= res!737514 (= (select (arr!34493 _keys!1208) i!673) k0!934))))

(declare-fun b!1105962 () Bool)

(assert (=> b!1105962 (= e!631373 e!631375)))

(declare-fun res!737517 () Bool)

(assert (=> b!1105962 (=> (not res!737517) (not e!631375))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71691 (_ BitVec 32)) Bool)

(assert (=> b!1105962 (= res!737517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495688 mask!1564))))

(assert (=> b!1105962 (= lt!495688 (array!71692 (store (arr!34493 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35030 _keys!1208)))))

(declare-fun b!1105963 () Bool)

(declare-fun res!737512 () Bool)

(assert (=> b!1105963 (=> (not res!737512) (not e!631373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105963 (= res!737512 (validKeyInArray!0 k0!934))))

(declare-fun res!737519 () Bool)

(assert (=> start!97356 (=> (not res!737519) (not e!631373))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97356 (= res!737519 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35030 _keys!1208))))))

(assert (=> start!97356 e!631373))

(declare-fun array_inv!26590 (array!71691) Bool)

(assert (=> start!97356 (array_inv!26590 _keys!1208)))

(assert (=> start!97356 true))

(declare-fun e!631372 () Bool)

(declare-fun array_inv!26591 (array!71693) Bool)

(assert (=> start!97356 (and (array_inv!26591 _values!996) e!631372)))

(declare-fun b!1105964 () Bool)

(declare-fun res!737511 () Bool)

(assert (=> b!1105964 (=> (not res!737511) (not e!631373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105964 (= res!737511 (validMask!0 mask!1564))))

(declare-fun b!1105965 () Bool)

(declare-fun res!737516 () Bool)

(assert (=> b!1105965 (=> (not res!737516) (not e!631373))))

(assert (=> b!1105965 (= res!737516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35030 _keys!1208))))))

(declare-fun b!1105966 () Bool)

(declare-fun res!737518 () Bool)

(assert (=> b!1105966 (=> (not res!737518) (not e!631373))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105966 (= res!737518 (and (= (size!35031 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35030 _keys!1208) (size!35031 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105967 () Bool)

(declare-fun e!631374 () Bool)

(declare-fun tp_is_empty!27367 () Bool)

(assert (=> b!1105967 (= e!631374 tp_is_empty!27367)))

(declare-fun b!1105968 () Bool)

(assert (=> b!1105968 (= e!631372 (and e!631374 mapRes!42865))))

(declare-fun condMapEmpty!42865 () Bool)

(declare-fun mapDefault!42865 () ValueCell!12974)

(assert (=> b!1105968 (= condMapEmpty!42865 (= (arr!34494 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12974)) mapDefault!42865)))))

(declare-fun mapIsEmpty!42865 () Bool)

(assert (=> mapIsEmpty!42865 mapRes!42865))

(declare-fun b!1105969 () Bool)

(assert (=> b!1105969 (= e!631371 tp_is_empty!27367)))

(declare-fun b!1105970 () Bool)

(declare-fun res!737513 () Bool)

(assert (=> b!1105970 (=> (not res!737513) (not e!631373))))

(assert (=> b!1105970 (= res!737513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97356 res!737519) b!1105964))

(assert (= (and b!1105964 res!737511) b!1105966))

(assert (= (and b!1105966 res!737518) b!1105970))

(assert (= (and b!1105970 res!737513) b!1105959))

(assert (= (and b!1105959 res!737515) b!1105965))

(assert (= (and b!1105965 res!737516) b!1105963))

(assert (= (and b!1105963 res!737512) b!1105961))

(assert (= (and b!1105961 res!737514) b!1105962))

(assert (= (and b!1105962 res!737517) b!1105960))

(assert (= (and b!1105968 condMapEmpty!42865) mapIsEmpty!42865))

(assert (= (and b!1105968 (not condMapEmpty!42865)) mapNonEmpty!42865))

(get-info :version)

(assert (= (and mapNonEmpty!42865 ((_ is ValueCellFull!12974) mapValue!42865)) b!1105969))

(assert (= (and b!1105968 ((_ is ValueCellFull!12974) mapDefault!42865)) b!1105967))

(assert (= start!97356 b!1105968))

(declare-fun m!1025977 () Bool)

(assert (=> b!1105963 m!1025977))

(declare-fun m!1025979 () Bool)

(assert (=> b!1105959 m!1025979))

(declare-fun m!1025981 () Bool)

(assert (=> mapNonEmpty!42865 m!1025981))

(declare-fun m!1025983 () Bool)

(assert (=> start!97356 m!1025983))

(declare-fun m!1025985 () Bool)

(assert (=> start!97356 m!1025985))

(declare-fun m!1025987 () Bool)

(assert (=> b!1105964 m!1025987))

(declare-fun m!1025989 () Bool)

(assert (=> b!1105970 m!1025989))

(declare-fun m!1025991 () Bool)

(assert (=> b!1105960 m!1025991))

(declare-fun m!1025993 () Bool)

(assert (=> b!1105962 m!1025993))

(declare-fun m!1025995 () Bool)

(assert (=> b!1105962 m!1025995))

(declare-fun m!1025997 () Bool)

(assert (=> b!1105961 m!1025997))

(check-sat (not b!1105970) (not b!1105963) (not start!97356) (not b!1105959) tp_is_empty!27367 (not mapNonEmpty!42865) (not b!1105962) (not b!1105960) (not b!1105964))
(check-sat)
