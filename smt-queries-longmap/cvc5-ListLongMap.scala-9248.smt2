; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110836 () Bool)

(assert start!110836)

(declare-fun b_free!29671 () Bool)

(declare-fun b_next!29671 () Bool)

(assert (=> start!110836 (= b_free!29671 (not b_next!29671))))

(declare-fun tp!104335 () Bool)

(declare-fun b_and!47879 () Bool)

(assert (=> start!110836 (= tp!104335 b_and!47879)))

(declare-fun b!1311991 () Bool)

(declare-fun e!748395 () Bool)

(declare-fun tp_is_empty!35401 () Bool)

(assert (=> b!1311991 (= e!748395 tp_is_empty!35401)))

(declare-fun b!1311992 () Bool)

(declare-fun res!871017 () Bool)

(declare-fun e!748393 () Bool)

(assert (=> b!1311992 (=> (not res!871017) (not e!748393))))

(declare-datatypes ((array!87790 0))(
  ( (array!87791 (arr!42375 (Array (_ BitVec 32) (_ BitVec 64))) (size!42925 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87790)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52305 0))(
  ( (V!52306 (val!17775 Int)) )
))
(declare-datatypes ((ValueCell!16802 0))(
  ( (ValueCellFull!16802 (v!20402 V!52305)) (EmptyCell!16802) )
))
(declare-datatypes ((array!87792 0))(
  ( (array!87793 (arr!42376 (Array (_ BitVec 32) ValueCell!16802)) (size!42926 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87792)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311992 (= res!871017 (and (= (size!42926 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42925 _keys!1628) (size!42926 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311993 () Bool)

(declare-fun res!871022 () Bool)

(assert (=> b!1311993 (=> (not res!871022) (not e!748393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87790 (_ BitVec 32)) Bool)

(assert (=> b!1311993 (= res!871022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311994 () Bool)

(declare-fun res!871018 () Bool)

(assert (=> b!1311994 (=> (not res!871018) (not e!748393))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311994 (= res!871018 (validKeyInArray!0 (select (arr!42375 _keys!1628) from!2020)))))

(declare-fun b!1311995 () Bool)

(declare-fun res!871015 () Bool)

(assert (=> b!1311995 (=> (not res!871015) (not e!748393))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1311995 (= res!871015 (not (= (select (arr!42375 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1311996 () Bool)

(declare-fun res!871019 () Bool)

(assert (=> b!1311996 (=> (not res!871019) (not e!748393))))

(assert (=> b!1311996 (= res!871019 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42925 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311997 () Bool)

(declare-fun res!871016 () Bool)

(assert (=> b!1311997 (=> (not res!871016) (not e!748393))))

(declare-datatypes ((List!30048 0))(
  ( (Nil!30045) (Cons!30044 (h!31253 (_ BitVec 64)) (t!43654 List!30048)) )
))
(declare-fun arrayNoDuplicates!0 (array!87790 (_ BitVec 32) List!30048) Bool)

(assert (=> b!1311997 (= res!871016 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30045))))

(declare-fun mapIsEmpty!54730 () Bool)

(declare-fun mapRes!54730 () Bool)

(assert (=> mapIsEmpty!54730 mapRes!54730))

(declare-fun b!1311998 () Bool)

(declare-fun e!748397 () Bool)

(assert (=> b!1311998 (= e!748397 (and e!748395 mapRes!54730))))

(declare-fun condMapEmpty!54730 () Bool)

(declare-fun mapDefault!54730 () ValueCell!16802)

