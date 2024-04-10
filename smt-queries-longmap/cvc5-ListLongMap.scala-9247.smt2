; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110830 () Bool)

(assert start!110830)

(declare-fun b_free!29665 () Bool)

(declare-fun b_next!29665 () Bool)

(assert (=> start!110830 (= b_free!29665 (not b_next!29665))))

(declare-fun tp!104316 () Bool)

(declare-fun b_and!47873 () Bool)

(assert (=> start!110830 (= tp!104316 b_and!47873)))

(declare-fun b!1311883 () Bool)

(declare-fun e!748349 () Bool)

(declare-fun tp_is_empty!35395 () Bool)

(assert (=> b!1311883 (= e!748349 tp_is_empty!35395)))

(declare-fun b!1311884 () Bool)

(declare-fun res!870934 () Bool)

(declare-fun e!748352 () Bool)

(assert (=> b!1311884 (=> (not res!870934) (not e!748352))))

(declare-datatypes ((array!87778 0))(
  ( (array!87779 (arr!42369 (Array (_ BitVec 32) (_ BitVec 64))) (size!42919 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87778)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311884 (= res!870934 (not (= (select (arr!42369 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1311885 () Bool)

(declare-fun res!870937 () Bool)

(assert (=> b!1311885 (=> (not res!870937) (not e!748352))))

(declare-datatypes ((V!52297 0))(
  ( (V!52298 (val!17772 Int)) )
))
(declare-datatypes ((ValueCell!16799 0))(
  ( (ValueCellFull!16799 (v!20399 V!52297)) (EmptyCell!16799) )
))
(declare-datatypes ((array!87780 0))(
  ( (array!87781 (arr!42370 (Array (_ BitVec 32) ValueCell!16799)) (size!42920 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87780)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1311885 (= res!870937 (and (= (size!42920 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42919 _keys!1628) (size!42920 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311886 () Bool)

(declare-fun res!870935 () Bool)

(assert (=> b!1311886 (=> (not res!870935) (not e!748352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87778 (_ BitVec 32)) Bool)

(assert (=> b!1311886 (= res!870935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311887 () Bool)

(declare-fun e!748348 () Bool)

(declare-fun mapRes!54721 () Bool)

(assert (=> b!1311887 (= e!748348 (and e!748349 mapRes!54721))))

(declare-fun condMapEmpty!54721 () Bool)

(declare-fun mapDefault!54721 () ValueCell!16799)

