; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110920 () Bool)

(assert start!110920)

(declare-fun b_free!29755 () Bool)

(declare-fun b_next!29755 () Bool)

(assert (=> start!110920 (= b_free!29755 (not b_next!29755))))

(declare-fun tp!104587 () Bool)

(declare-fun b_and!47963 () Bool)

(assert (=> start!110920 (= tp!104587 b_and!47963)))

(declare-fun b!1313198 () Bool)

(declare-fun e!749024 () Bool)

(declare-fun tp_is_empty!35485 () Bool)

(assert (=> b!1313198 (= e!749024 tp_is_empty!35485)))

(declare-fun mapNonEmpty!54856 () Bool)

(declare-fun mapRes!54856 () Bool)

(declare-fun tp!104586 () Bool)

(assert (=> mapNonEmpty!54856 (= mapRes!54856 (and tp!104586 e!749024))))

(declare-datatypes ((V!52417 0))(
  ( (V!52418 (val!17817 Int)) )
))
(declare-datatypes ((ValueCell!16844 0))(
  ( (ValueCellFull!16844 (v!20444 V!52417)) (EmptyCell!16844) )
))
(declare-fun mapRest!54856 () (Array (_ BitVec 32) ValueCell!16844))

(declare-datatypes ((array!87952 0))(
  ( (array!87953 (arr!42456 (Array (_ BitVec 32) ValueCell!16844)) (size!43006 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87952)

(declare-fun mapKey!54856 () (_ BitVec 32))

(declare-fun mapValue!54856 () ValueCell!16844)

(assert (=> mapNonEmpty!54856 (= (arr!42456 _values!1354) (store mapRest!54856 mapKey!54856 mapValue!54856))))

(declare-fun b!1313199 () Bool)

(declare-fun res!871848 () Bool)

(declare-fun e!749023 () Bool)

(assert (=> b!1313199 (=> (not res!871848) (not e!749023))))

(declare-datatypes ((array!87954 0))(
  ( (array!87955 (arr!42457 (Array (_ BitVec 32) (_ BitVec 64))) (size!43007 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87954)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87954 (_ BitVec 32)) Bool)

(assert (=> b!1313199 (= res!871848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313200 () Bool)

(assert (=> b!1313200 (= e!749023 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52417)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585642 () Bool)

(declare-fun zeroValue!1296 () V!52417)

(declare-datatypes ((tuple2!22972 0))(
  ( (tuple2!22973 (_1!11497 (_ BitVec 64)) (_2!11497 V!52417)) )
))
(declare-datatypes ((List!30107 0))(
  ( (Nil!30104) (Cons!30103 (h!31312 tuple2!22972) (t!43713 List!30107)) )
))
(declare-datatypes ((ListLongMap!20629 0))(
  ( (ListLongMap!20630 (toList!10330 List!30107)) )
))
(declare-fun contains!8480 (ListLongMap!20629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5343 (array!87954 array!87952 (_ BitVec 32) (_ BitVec 32) V!52417 V!52417 (_ BitVec 32) Int) ListLongMap!20629)

(assert (=> b!1313200 (= lt!585642 (contains!8480 (getCurrentListMap!5343 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!871847 () Bool)

(assert (=> start!110920 (=> (not res!871847) (not e!749023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110920 (= res!871847 (validMask!0 mask!2040))))

(assert (=> start!110920 e!749023))

(assert (=> start!110920 tp!104587))

(declare-fun array_inv!32071 (array!87954) Bool)

(assert (=> start!110920 (array_inv!32071 _keys!1628)))

(assert (=> start!110920 true))

(assert (=> start!110920 tp_is_empty!35485))

(declare-fun e!749025 () Bool)

(declare-fun array_inv!32072 (array!87952) Bool)

(assert (=> start!110920 (and (array_inv!32072 _values!1354) e!749025)))

(declare-fun b!1313201 () Bool)

(declare-fun res!871844 () Bool)

(assert (=> b!1313201 (=> (not res!871844) (not e!749023))))

(assert (=> b!1313201 (= res!871844 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43007 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313202 () Bool)

(declare-fun res!871846 () Bool)

(assert (=> b!1313202 (=> (not res!871846) (not e!749023))))

(assert (=> b!1313202 (= res!871846 (and (= (size!43006 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43007 _keys!1628) (size!43006 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313203 () Bool)

(declare-fun res!871845 () Bool)

(assert (=> b!1313203 (=> (not res!871845) (not e!749023))))

(declare-datatypes ((List!30108 0))(
  ( (Nil!30105) (Cons!30104 (h!31313 (_ BitVec 64)) (t!43714 List!30108)) )
))
(declare-fun arrayNoDuplicates!0 (array!87954 (_ BitVec 32) List!30108) Bool)

(assert (=> b!1313203 (= res!871845 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30105))))

(declare-fun b!1313204 () Bool)

(declare-fun e!749026 () Bool)

(assert (=> b!1313204 (= e!749025 (and e!749026 mapRes!54856))))

(declare-fun condMapEmpty!54856 () Bool)

(declare-fun mapDefault!54856 () ValueCell!16844)

