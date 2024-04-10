; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110938 () Bool)

(assert start!110938)

(declare-fun b_free!29773 () Bool)

(declare-fun b_next!29773 () Bool)

(assert (=> start!110938 (= b_free!29773 (not b_next!29773))))

(declare-fun tp!104640 () Bool)

(declare-fun b_and!47981 () Bool)

(assert (=> start!110938 (= tp!104640 b_and!47981)))

(declare-fun b!1313414 () Bool)

(declare-fun res!871983 () Bool)

(declare-fun e!749159 () Bool)

(assert (=> b!1313414 (=> (not res!871983) (not e!749159))))

(declare-datatypes ((array!87984 0))(
  ( (array!87985 (arr!42472 (Array (_ BitVec 32) (_ BitVec 64))) (size!43022 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87984)

(declare-datatypes ((List!30118 0))(
  ( (Nil!30115) (Cons!30114 (h!31323 (_ BitVec 64)) (t!43724 List!30118)) )
))
(declare-fun arrayNoDuplicates!0 (array!87984 (_ BitVec 32) List!30118) Bool)

(assert (=> b!1313414 (= res!871983 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30115))))

(declare-fun mapIsEmpty!54883 () Bool)

(declare-fun mapRes!54883 () Bool)

(assert (=> mapIsEmpty!54883 mapRes!54883))

(declare-fun b!1313415 () Bool)

(declare-fun e!749160 () Bool)

(declare-fun tp_is_empty!35503 () Bool)

(assert (=> b!1313415 (= e!749160 tp_is_empty!35503)))

(declare-fun mapNonEmpty!54883 () Bool)

(declare-fun tp!104641 () Bool)

(declare-fun e!749158 () Bool)

(assert (=> mapNonEmpty!54883 (= mapRes!54883 (and tp!104641 e!749158))))

(declare-fun mapKey!54883 () (_ BitVec 32))

(declare-datatypes ((V!52441 0))(
  ( (V!52442 (val!17826 Int)) )
))
(declare-datatypes ((ValueCell!16853 0))(
  ( (ValueCellFull!16853 (v!20453 V!52441)) (EmptyCell!16853) )
))
(declare-fun mapRest!54883 () (Array (_ BitVec 32) ValueCell!16853))

(declare-fun mapValue!54883 () ValueCell!16853)

(declare-datatypes ((array!87986 0))(
  ( (array!87987 (arr!42473 (Array (_ BitVec 32) ValueCell!16853)) (size!43023 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87986)

(assert (=> mapNonEmpty!54883 (= (arr!42473 _values!1354) (store mapRest!54883 mapKey!54883 mapValue!54883))))

(declare-fun b!1313416 () Bool)

(assert (=> b!1313416 (= e!749158 tp_is_empty!35503)))

(declare-fun b!1313417 () Bool)

(declare-fun res!871979 () Bool)

(assert (=> b!1313417 (=> (not res!871979) (not e!749159))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313417 (= res!871979 (and (= (size!43023 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43022 _keys!1628) (size!43023 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313418 () Bool)

(assert (=> b!1313418 (= e!749159 false)))

(declare-fun lt!585669 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52441)

(declare-fun zeroValue!1296 () V!52441)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22982 0))(
  ( (tuple2!22983 (_1!11502 (_ BitVec 64)) (_2!11502 V!52441)) )
))
(declare-datatypes ((List!30119 0))(
  ( (Nil!30116) (Cons!30115 (h!31324 tuple2!22982) (t!43725 List!30119)) )
))
(declare-datatypes ((ListLongMap!20639 0))(
  ( (ListLongMap!20640 (toList!10335 List!30119)) )
))
(declare-fun contains!8485 (ListLongMap!20639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5348 (array!87984 array!87986 (_ BitVec 32) (_ BitVec 32) V!52441 V!52441 (_ BitVec 32) Int) ListLongMap!20639)

(assert (=> b!1313418 (= lt!585669 (contains!8485 (getCurrentListMap!5348 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313419 () Bool)

(declare-fun res!871982 () Bool)

(assert (=> b!1313419 (=> (not res!871982) (not e!749159))))

(assert (=> b!1313419 (= res!871982 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43022 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313420 () Bool)

(declare-fun e!749162 () Bool)

(assert (=> b!1313420 (= e!749162 (and e!749160 mapRes!54883))))

(declare-fun condMapEmpty!54883 () Bool)

(declare-fun mapDefault!54883 () ValueCell!16853)

