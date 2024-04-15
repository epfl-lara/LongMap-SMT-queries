; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111070 () Bool)

(assert start!111070)

(declare-fun b_free!29905 () Bool)

(declare-fun b_next!29905 () Bool)

(assert (=> start!111070 (= b_free!29905 (not b_next!29905))))

(declare-fun tp!105038 () Bool)

(declare-fun b_and!48095 () Bool)

(assert (=> start!111070 (= tp!105038 b_and!48095)))

(declare-fun b!1314964 () Bool)

(declare-fun e!750116 () Bool)

(assert (=> b!1314964 (= e!750116 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88143 0))(
  ( (array!88144 (arr!42552 (Array (_ BitVec 32) (_ BitVec 64))) (size!43104 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88143)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52617 0))(
  ( (V!52618 (val!17892 Int)) )
))
(declare-fun minValue!1296 () V!52617)

(declare-datatypes ((ValueCell!16919 0))(
  ( (ValueCellFull!16919 (v!20518 V!52617)) (EmptyCell!16919) )
))
(declare-datatypes ((array!88145 0))(
  ( (array!88146 (arr!42553 (Array (_ BitVec 32) ValueCell!16919)) (size!43105 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88145)

(declare-fun zeroValue!1296 () V!52617)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585681 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23164 0))(
  ( (tuple2!23165 (_1!11593 (_ BitVec 64)) (_2!11593 V!52617)) )
))
(declare-datatypes ((List!30278 0))(
  ( (Nil!30275) (Cons!30274 (h!31483 tuple2!23164) (t!43876 List!30278)) )
))
(declare-datatypes ((ListLongMap!20821 0))(
  ( (ListLongMap!20822 (toList!10426 List!30278)) )
))
(declare-fun contains!8503 (ListLongMap!20821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5321 (array!88143 array!88145 (_ BitVec 32) (_ BitVec 32) V!52617 V!52617 (_ BitVec 32) Int) ListLongMap!20821)

(assert (=> b!1314964 (= lt!585681 (contains!8503 (getCurrentListMap!5321 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314965 () Bool)

(declare-fun e!750118 () Bool)

(declare-fun e!750117 () Bool)

(declare-fun mapRes!55081 () Bool)

(assert (=> b!1314965 (= e!750118 (and e!750117 mapRes!55081))))

(declare-fun condMapEmpty!55081 () Bool)

(declare-fun mapDefault!55081 () ValueCell!16919)

(assert (=> b!1314965 (= condMapEmpty!55081 (= (arr!42553 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16919)) mapDefault!55081)))))

(declare-fun b!1314966 () Bool)

(declare-fun res!872977 () Bool)

(assert (=> b!1314966 (=> (not res!872977) (not e!750116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88143 (_ BitVec 32)) Bool)

(assert (=> b!1314966 (= res!872977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55081 () Bool)

(declare-fun tp!105037 () Bool)

(declare-fun e!750115 () Bool)

(assert (=> mapNonEmpty!55081 (= mapRes!55081 (and tp!105037 e!750115))))

(declare-fun mapRest!55081 () (Array (_ BitVec 32) ValueCell!16919))

(declare-fun mapKey!55081 () (_ BitVec 32))

(declare-fun mapValue!55081 () ValueCell!16919)

(assert (=> mapNonEmpty!55081 (= (arr!42553 _values!1354) (store mapRest!55081 mapKey!55081 mapValue!55081))))

(declare-fun b!1314967 () Bool)

(declare-fun tp_is_empty!35635 () Bool)

(assert (=> b!1314967 (= e!750115 tp_is_empty!35635)))

(declare-fun b!1314968 () Bool)

(declare-fun res!872978 () Bool)

(assert (=> b!1314968 (=> (not res!872978) (not e!750116))))

(assert (=> b!1314968 (= res!872978 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43104 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55081 () Bool)

(assert (=> mapIsEmpty!55081 mapRes!55081))

(declare-fun b!1314969 () Bool)

(assert (=> b!1314969 (= e!750117 tp_is_empty!35635)))

(declare-fun b!1314970 () Bool)

(declare-fun res!872979 () Bool)

(assert (=> b!1314970 (=> (not res!872979) (not e!750116))))

(declare-datatypes ((List!30279 0))(
  ( (Nil!30276) (Cons!30275 (h!31484 (_ BitVec 64)) (t!43877 List!30279)) )
))
(declare-fun arrayNoDuplicates!0 (array!88143 (_ BitVec 32) List!30279) Bool)

(assert (=> b!1314970 (= res!872979 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30276))))

(declare-fun b!1314971 () Bool)

(declare-fun res!872976 () Bool)

(assert (=> b!1314971 (=> (not res!872976) (not e!750116))))

(assert (=> b!1314971 (= res!872976 (and (= (size!43105 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43104 _keys!1628) (size!43105 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872980 () Bool)

(assert (=> start!111070 (=> (not res!872980) (not e!750116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111070 (= res!872980 (validMask!0 mask!2040))))

(assert (=> start!111070 e!750116))

(assert (=> start!111070 tp!105038))

(declare-fun array_inv!32325 (array!88143) Bool)

(assert (=> start!111070 (array_inv!32325 _keys!1628)))

(assert (=> start!111070 true))

(assert (=> start!111070 tp_is_empty!35635))

(declare-fun array_inv!32326 (array!88145) Bool)

(assert (=> start!111070 (and (array_inv!32326 _values!1354) e!750118)))

(assert (= (and start!111070 res!872980) b!1314971))

(assert (= (and b!1314971 res!872976) b!1314966))

(assert (= (and b!1314966 res!872977) b!1314970))

(assert (= (and b!1314970 res!872979) b!1314968))

(assert (= (and b!1314968 res!872978) b!1314964))

(assert (= (and b!1314965 condMapEmpty!55081) mapIsEmpty!55081))

(assert (= (and b!1314965 (not condMapEmpty!55081)) mapNonEmpty!55081))

(get-info :version)

(assert (= (and mapNonEmpty!55081 ((_ is ValueCellFull!16919) mapValue!55081)) b!1314967))

(assert (= (and b!1314965 ((_ is ValueCellFull!16919) mapDefault!55081)) b!1314969))

(assert (= start!111070 b!1314965))

(declare-fun m!1202841 () Bool)

(assert (=> b!1314966 m!1202841))

(declare-fun m!1202843 () Bool)

(assert (=> start!111070 m!1202843))

(declare-fun m!1202845 () Bool)

(assert (=> start!111070 m!1202845))

(declare-fun m!1202847 () Bool)

(assert (=> start!111070 m!1202847))

(declare-fun m!1202849 () Bool)

(assert (=> mapNonEmpty!55081 m!1202849))

(declare-fun m!1202851 () Bool)

(assert (=> b!1314970 m!1202851))

(declare-fun m!1202853 () Bool)

(assert (=> b!1314964 m!1202853))

(assert (=> b!1314964 m!1202853))

(declare-fun m!1202855 () Bool)

(assert (=> b!1314964 m!1202855))

(check-sat tp_is_empty!35635 (not b_next!29905) (not start!111070) (not b!1314964) (not b!1314966) (not mapNonEmpty!55081) (not b!1314970) b_and!48095)
(check-sat b_and!48095 (not b_next!29905))
