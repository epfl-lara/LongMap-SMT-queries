; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110668 () Bool)

(assert start!110668)

(declare-fun b_free!29503 () Bool)

(declare-fun b_next!29503 () Bool)

(assert (=> start!110668 (= b_free!29503 (not b_next!29503))))

(declare-fun tp!103831 () Bool)

(declare-fun b_and!47711 () Bool)

(assert (=> start!110668 (= tp!103831 b_and!47711)))

(declare-fun b!1309499 () Bool)

(declare-fun res!869283 () Bool)

(declare-fun e!747133 () Bool)

(assert (=> b!1309499 (=> (not res!869283) (not e!747133))))

(declare-datatypes ((array!87456 0))(
  ( (array!87457 (arr!42208 (Array (_ BitVec 32) (_ BitVec 64))) (size!42758 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87456)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309499 (= res!869283 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42758 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309500 () Bool)

(declare-fun res!869282 () Bool)

(assert (=> b!1309500 (=> (not res!869282) (not e!747133))))

(declare-datatypes ((List!29924 0))(
  ( (Nil!29921) (Cons!29920 (h!31129 (_ BitVec 64)) (t!43530 List!29924)) )
))
(declare-fun arrayNoDuplicates!0 (array!87456 (_ BitVec 32) List!29924) Bool)

(assert (=> b!1309500 (= res!869282 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29921))))

(declare-fun b!1309501 () Bool)

(declare-fun e!747135 () Bool)

(declare-fun tp_is_empty!35233 () Bool)

(assert (=> b!1309501 (= e!747135 tp_is_empty!35233)))

(declare-fun b!1309502 () Bool)

(declare-fun res!869281 () Bool)

(assert (=> b!1309502 (=> (not res!869281) (not e!747133))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87456 (_ BitVec 32)) Bool)

(assert (=> b!1309502 (= res!869281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54478 () Bool)

(declare-fun mapRes!54478 () Bool)

(assert (=> mapIsEmpty!54478 mapRes!54478))

(declare-fun b!1309503 () Bool)

(declare-fun res!869279 () Bool)

(assert (=> b!1309503 (=> (not res!869279) (not e!747133))))

(declare-datatypes ((V!52081 0))(
  ( (V!52082 (val!17691 Int)) )
))
(declare-datatypes ((ValueCell!16718 0))(
  ( (ValueCellFull!16718 (v!20318 V!52081)) (EmptyCell!16718) )
))
(declare-datatypes ((array!87458 0))(
  ( (array!87459 (arr!42209 (Array (_ BitVec 32) ValueCell!16718)) (size!42759 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87458)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309503 (= res!869279 (and (= (size!42759 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42758 _keys!1628) (size!42759 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!869280 () Bool)

(assert (=> start!110668 (=> (not res!869280) (not e!747133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110668 (= res!869280 (validMask!0 mask!2040))))

(assert (=> start!110668 e!747133))

(assert (=> start!110668 tp!103831))

(declare-fun array_inv!31895 (array!87456) Bool)

(assert (=> start!110668 (array_inv!31895 _keys!1628)))

(assert (=> start!110668 true))

(assert (=> start!110668 tp_is_empty!35233))

(declare-fun e!747136 () Bool)

(declare-fun array_inv!31896 (array!87458) Bool)

(assert (=> start!110668 (and (array_inv!31896 _values!1354) e!747136)))

(declare-fun mapNonEmpty!54478 () Bool)

(declare-fun tp!103830 () Bool)

(assert (=> mapNonEmpty!54478 (= mapRes!54478 (and tp!103830 e!747135))))

(declare-fun mapValue!54478 () ValueCell!16718)

(declare-fun mapKey!54478 () (_ BitVec 32))

(declare-fun mapRest!54478 () (Array (_ BitVec 32) ValueCell!16718))

(assert (=> mapNonEmpty!54478 (= (arr!42209 _values!1354) (store mapRest!54478 mapKey!54478 mapValue!54478))))

(declare-fun b!1309504 () Bool)

(assert (=> b!1309504 (= e!747133 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585273 () Bool)

(declare-fun minValue!1296 () V!52081)

(declare-fun zeroValue!1296 () V!52081)

(declare-datatypes ((tuple2!22780 0))(
  ( (tuple2!22781 (_1!11401 (_ BitVec 64)) (_2!11401 V!52081)) )
))
(declare-datatypes ((List!29925 0))(
  ( (Nil!29922) (Cons!29921 (h!31130 tuple2!22780) (t!43531 List!29925)) )
))
(declare-datatypes ((ListLongMap!20437 0))(
  ( (ListLongMap!20438 (toList!10234 List!29925)) )
))
(declare-fun contains!8384 (ListLongMap!20437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5247 (array!87456 array!87458 (_ BitVec 32) (_ BitVec 32) V!52081 V!52081 (_ BitVec 32) Int) ListLongMap!20437)

(assert (=> b!1309504 (= lt!585273 (contains!8384 (getCurrentListMap!5247 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309505 () Bool)

(declare-fun e!747134 () Bool)

(assert (=> b!1309505 (= e!747136 (and e!747134 mapRes!54478))))

(declare-fun condMapEmpty!54478 () Bool)

(declare-fun mapDefault!54478 () ValueCell!16718)

