; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110668 () Bool)

(assert start!110668)

(declare-fun b_free!29503 () Bool)

(declare-fun b_next!29503 () Bool)

(assert (=> start!110668 (= b_free!29503 (not b_next!29503))))

(declare-fun tp!103831 () Bool)

(declare-fun b_and!47693 () Bool)

(assert (=> start!110668 (= tp!103831 b_and!47693)))

(declare-fun b!1309429 () Bool)

(declare-fun e!747102 () Bool)

(declare-fun tp_is_empty!35233 () Bool)

(assert (=> b!1309429 (= e!747102 tp_is_empty!35233)))

(declare-fun b!1309430 () Bool)

(declare-fun res!869253 () Bool)

(declare-fun e!747103 () Bool)

(assert (=> b!1309430 (=> (not res!869253) (not e!747103))))

(declare-datatypes ((array!87371 0))(
  ( (array!87372 (arr!42166 (Array (_ BitVec 32) (_ BitVec 64))) (size!42718 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87371)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309430 (= res!869253 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42718 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309431 () Bool)

(declare-fun e!747101 () Bool)

(declare-fun e!747104 () Bool)

(declare-fun mapRes!54478 () Bool)

(assert (=> b!1309431 (= e!747101 (and e!747104 mapRes!54478))))

(declare-fun condMapEmpty!54478 () Bool)

(declare-datatypes ((V!52081 0))(
  ( (V!52082 (val!17691 Int)) )
))
(declare-datatypes ((ValueCell!16718 0))(
  ( (ValueCellFull!16718 (v!20317 V!52081)) (EmptyCell!16718) )
))
(declare-datatypes ((array!87373 0))(
  ( (array!87374 (arr!42167 (Array (_ BitVec 32) ValueCell!16718)) (size!42719 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87373)

(declare-fun mapDefault!54478 () ValueCell!16718)

(assert (=> b!1309431 (= condMapEmpty!54478 (= (arr!42167 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16718)) mapDefault!54478)))))

(declare-fun b!1309432 () Bool)

(assert (=> b!1309432 (= e!747104 tp_is_empty!35233)))

(declare-fun b!1309433 () Bool)

(declare-fun res!869250 () Bool)

(assert (=> b!1309433 (=> (not res!869250) (not e!747103))))

(declare-datatypes ((List!29995 0))(
  ( (Nil!29992) (Cons!29991 (h!31200 (_ BitVec 64)) (t!43593 List!29995)) )
))
(declare-fun arrayNoDuplicates!0 (array!87371 (_ BitVec 32) List!29995) Bool)

(assert (=> b!1309433 (= res!869250 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29992))))

(declare-fun b!1309434 () Bool)

(assert (=> b!1309434 (= e!747103 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52081)

(declare-fun zeroValue!1296 () V!52081)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585087 () Bool)

(declare-datatypes ((tuple2!22868 0))(
  ( (tuple2!22869 (_1!11445 (_ BitVec 64)) (_2!11445 V!52081)) )
))
(declare-datatypes ((List!29996 0))(
  ( (Nil!29993) (Cons!29992 (h!31201 tuple2!22868) (t!43594 List!29996)) )
))
(declare-datatypes ((ListLongMap!20525 0))(
  ( (ListLongMap!20526 (toList!10278 List!29996)) )
))
(declare-fun contains!8355 (ListLongMap!20525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5173 (array!87371 array!87373 (_ BitVec 32) (_ BitVec 32) V!52081 V!52081 (_ BitVec 32) Int) ListLongMap!20525)

(assert (=> b!1309434 (= lt!585087 (contains!8355 (getCurrentListMap!5173 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!869254 () Bool)

(assert (=> start!110668 (=> (not res!869254) (not e!747103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110668 (= res!869254 (validMask!0 mask!2040))))

(assert (=> start!110668 e!747103))

(assert (=> start!110668 tp!103831))

(declare-fun array_inv!32057 (array!87371) Bool)

(assert (=> start!110668 (array_inv!32057 _keys!1628)))

(assert (=> start!110668 true))

(assert (=> start!110668 tp_is_empty!35233))

(declare-fun array_inv!32058 (array!87373) Bool)

(assert (=> start!110668 (and (array_inv!32058 _values!1354) e!747101)))

(declare-fun mapIsEmpty!54478 () Bool)

(assert (=> mapIsEmpty!54478 mapRes!54478))

(declare-fun b!1309435 () Bool)

(declare-fun res!869252 () Bool)

(assert (=> b!1309435 (=> (not res!869252) (not e!747103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87371 (_ BitVec 32)) Bool)

(assert (=> b!1309435 (= res!869252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54478 () Bool)

(declare-fun tp!103832 () Bool)

(assert (=> mapNonEmpty!54478 (= mapRes!54478 (and tp!103832 e!747102))))

(declare-fun mapKey!54478 () (_ BitVec 32))

(declare-fun mapRest!54478 () (Array (_ BitVec 32) ValueCell!16718))

(declare-fun mapValue!54478 () ValueCell!16718)

(assert (=> mapNonEmpty!54478 (= (arr!42167 _values!1354) (store mapRest!54478 mapKey!54478 mapValue!54478))))

(declare-fun b!1309436 () Bool)

(declare-fun res!869251 () Bool)

(assert (=> b!1309436 (=> (not res!869251) (not e!747103))))

(assert (=> b!1309436 (= res!869251 (and (= (size!42719 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42718 _keys!1628) (size!42719 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110668 res!869254) b!1309436))

(assert (= (and b!1309436 res!869251) b!1309435))

(assert (= (and b!1309435 res!869252) b!1309433))

(assert (= (and b!1309433 res!869250) b!1309430))

(assert (= (and b!1309430 res!869253) b!1309434))

(assert (= (and b!1309431 condMapEmpty!54478) mapIsEmpty!54478))

(assert (= (and b!1309431 (not condMapEmpty!54478)) mapNonEmpty!54478))

(get-info :version)

(assert (= (and mapNonEmpty!54478 ((_ is ValueCellFull!16718) mapValue!54478)) b!1309429))

(assert (= (and b!1309431 ((_ is ValueCellFull!16718) mapDefault!54478)) b!1309432))

(assert (= start!110668 b!1309431))

(declare-fun m!1199043 () Bool)

(assert (=> b!1309434 m!1199043))

(assert (=> b!1309434 m!1199043))

(declare-fun m!1199045 () Bool)

(assert (=> b!1309434 m!1199045))

(declare-fun m!1199047 () Bool)

(assert (=> mapNonEmpty!54478 m!1199047))

(declare-fun m!1199049 () Bool)

(assert (=> start!110668 m!1199049))

(declare-fun m!1199051 () Bool)

(assert (=> start!110668 m!1199051))

(declare-fun m!1199053 () Bool)

(assert (=> start!110668 m!1199053))

(declare-fun m!1199055 () Bool)

(assert (=> b!1309435 m!1199055))

(declare-fun m!1199057 () Bool)

(assert (=> b!1309433 m!1199057))

(check-sat (not b_next!29503) tp_is_empty!35233 (not b!1309433) (not start!110668) (not mapNonEmpty!54478) b_and!47693 (not b!1309434) (not b!1309435))
(check-sat b_and!47693 (not b_next!29503))
