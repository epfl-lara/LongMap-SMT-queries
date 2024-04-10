; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111040 () Bool)

(assert start!111040)

(declare-fun b_free!29875 () Bool)

(declare-fun b_next!29875 () Bool)

(assert (=> start!111040 (= b_free!29875 (not b_next!29875))))

(declare-fun tp!104947 () Bool)

(declare-fun b_and!48083 () Bool)

(assert (=> start!111040 (= tp!104947 b_and!48083)))

(declare-fun mapNonEmpty!55036 () Bool)

(declare-fun mapRes!55036 () Bool)

(declare-fun tp!104946 () Bool)

(declare-fun e!749926 () Bool)

(assert (=> mapNonEmpty!55036 (= mapRes!55036 (and tp!104946 e!749926))))

(declare-datatypes ((V!52577 0))(
  ( (V!52578 (val!17877 Int)) )
))
(declare-datatypes ((ValueCell!16904 0))(
  ( (ValueCellFull!16904 (v!20504 V!52577)) (EmptyCell!16904) )
))
(declare-fun mapRest!55036 () (Array (_ BitVec 32) ValueCell!16904))

(declare-datatypes ((array!88178 0))(
  ( (array!88179 (arr!42569 (Array (_ BitVec 32) ValueCell!16904)) (size!43119 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88178)

(declare-fun mapKey!55036 () (_ BitVec 32))

(declare-fun mapValue!55036 () ValueCell!16904)

(assert (=> mapNonEmpty!55036 (= (arr!42569 _values!1354) (store mapRest!55036 mapKey!55036 mapValue!55036))))

(declare-fun b!1314674 () Bool)

(declare-fun res!872780 () Bool)

(declare-fun e!749924 () Bool)

(assert (=> b!1314674 (=> (not res!872780) (not e!749924))))

(declare-datatypes ((array!88180 0))(
  ( (array!88181 (arr!42570 (Array (_ BitVec 32) (_ BitVec 64))) (size!43120 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88180)

(declare-datatypes ((List!30191 0))(
  ( (Nil!30188) (Cons!30187 (h!31396 (_ BitVec 64)) (t!43797 List!30191)) )
))
(declare-fun arrayNoDuplicates!0 (array!88180 (_ BitVec 32) List!30191) Bool)

(assert (=> b!1314674 (= res!872780 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30188))))

(declare-fun res!872782 () Bool)

(assert (=> start!111040 (=> (not res!872782) (not e!749924))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111040 (= res!872782 (validMask!0 mask!2040))))

(assert (=> start!111040 e!749924))

(assert (=> start!111040 tp!104947))

(declare-fun array_inv!32147 (array!88180) Bool)

(assert (=> start!111040 (array_inv!32147 _keys!1628)))

(assert (=> start!111040 true))

(declare-fun tp_is_empty!35605 () Bool)

(assert (=> start!111040 tp_is_empty!35605))

(declare-fun e!749927 () Bool)

(declare-fun array_inv!32148 (array!88178) Bool)

(assert (=> start!111040 (and (array_inv!32148 _values!1354) e!749927)))

(declare-fun b!1314675 () Bool)

(declare-fun res!872781 () Bool)

(assert (=> b!1314675 (=> (not res!872781) (not e!749924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88180 (_ BitVec 32)) Bool)

(assert (=> b!1314675 (= res!872781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314676 () Bool)

(declare-fun res!872783 () Bool)

(assert (=> b!1314676 (=> (not res!872783) (not e!749924))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314676 (= res!872783 (and (= (size!43119 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43120 _keys!1628) (size!43119 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314677 () Bool)

(assert (=> b!1314677 (= e!749926 tp_is_empty!35605)))

(declare-fun b!1314678 () Bool)

(assert (=> b!1314678 (= e!749924 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585822 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52577)

(declare-fun zeroValue!1296 () V!52577)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23054 0))(
  ( (tuple2!23055 (_1!11538 (_ BitVec 64)) (_2!11538 V!52577)) )
))
(declare-datatypes ((List!30192 0))(
  ( (Nil!30189) (Cons!30188 (h!31397 tuple2!23054) (t!43798 List!30192)) )
))
(declare-datatypes ((ListLongMap!20711 0))(
  ( (ListLongMap!20712 (toList!10371 List!30192)) )
))
(declare-fun contains!8521 (ListLongMap!20711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5384 (array!88180 array!88178 (_ BitVec 32) (_ BitVec 32) V!52577 V!52577 (_ BitVec 32) Int) ListLongMap!20711)

(assert (=> b!1314678 (= lt!585822 (contains!8521 (getCurrentListMap!5384 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!55036 () Bool)

(assert (=> mapIsEmpty!55036 mapRes!55036))

(declare-fun b!1314679 () Bool)

(declare-fun e!749923 () Bool)

(assert (=> b!1314679 (= e!749927 (and e!749923 mapRes!55036))))

(declare-fun condMapEmpty!55036 () Bool)

(declare-fun mapDefault!55036 () ValueCell!16904)

