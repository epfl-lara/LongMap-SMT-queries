; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110690 () Bool)

(assert start!110690)

(declare-fun b_free!29525 () Bool)

(declare-fun b_next!29525 () Bool)

(assert (=> start!110690 (= b_free!29525 (not b_next!29525))))

(declare-fun tp!103897 () Bool)

(declare-fun b_and!47733 () Bool)

(assert (=> start!110690 (= tp!103897 b_and!47733)))

(declare-fun b!1309795 () Bool)

(declare-fun e!747300 () Bool)

(assert (=> b!1309795 (= e!747300 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87500 0))(
  ( (array!87501 (arr!42230 (Array (_ BitVec 32) (_ BitVec 64))) (size!42780 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87500)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52109 0))(
  ( (V!52110 (val!17702 Int)) )
))
(declare-fun minValue!1296 () V!52109)

(declare-datatypes ((ValueCell!16729 0))(
  ( (ValueCellFull!16729 (v!20329 V!52109)) (EmptyCell!16729) )
))
(declare-datatypes ((array!87502 0))(
  ( (array!87503 (arr!42231 (Array (_ BitVec 32) ValueCell!16729)) (size!42781 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87502)

(declare-fun zeroValue!1296 () V!52109)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22800 0))(
  ( (tuple2!22801 (_1!11411 (_ BitVec 64)) (_2!11411 V!52109)) )
))
(declare-datatypes ((List!29941 0))(
  ( (Nil!29938) (Cons!29937 (h!31146 tuple2!22800) (t!43547 List!29941)) )
))
(declare-datatypes ((ListLongMap!20457 0))(
  ( (ListLongMap!20458 (toList!10244 List!29941)) )
))
(declare-fun contains!8394 (ListLongMap!20457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5257 (array!87500 array!87502 (_ BitVec 32) (_ BitVec 32) V!52109 V!52109 (_ BitVec 32) Int) ListLongMap!20457)

(assert (=> b!1309795 (contains!8394 (getCurrentListMap!5257 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43314 0))(
  ( (Unit!43315) )
))
(declare-fun lt!585306 () Unit!43314)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!3 (array!87500 array!87502 (_ BitVec 32) (_ BitVec 32) V!52109 V!52109 (_ BitVec 64) (_ BitVec 32) Int) Unit!43314)

(assert (=> b!1309795 (= lt!585306 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!3 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309796 () Bool)

(declare-fun res!869483 () Bool)

(assert (=> b!1309796 (=> (not res!869483) (not e!747300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309796 (= res!869483 (validKeyInArray!0 (select (arr!42230 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54511 () Bool)

(declare-fun mapRes!54511 () Bool)

(assert (=> mapIsEmpty!54511 mapRes!54511))

(declare-fun b!1309797 () Bool)

(declare-fun res!869479 () Bool)

(assert (=> b!1309797 (=> (not res!869479) (not e!747300))))

(assert (=> b!1309797 (= res!869479 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309798 () Bool)

(declare-fun res!869484 () Bool)

(assert (=> b!1309798 (=> (not res!869484) (not e!747300))))

(assert (=> b!1309798 (= res!869484 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42780 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54511 () Bool)

(declare-fun tp!103896 () Bool)

(declare-fun e!747298 () Bool)

(assert (=> mapNonEmpty!54511 (= mapRes!54511 (and tp!103896 e!747298))))

(declare-fun mapKey!54511 () (_ BitVec 32))

(declare-fun mapValue!54511 () ValueCell!16729)

(declare-fun mapRest!54511 () (Array (_ BitVec 32) ValueCell!16729))

(assert (=> mapNonEmpty!54511 (= (arr!42231 _values!1354) (store mapRest!54511 mapKey!54511 mapValue!54511))))

(declare-fun b!1309799 () Bool)

(declare-fun e!747301 () Bool)

(declare-fun e!747302 () Bool)

(assert (=> b!1309799 (= e!747301 (and e!747302 mapRes!54511))))

(declare-fun condMapEmpty!54511 () Bool)

(declare-fun mapDefault!54511 () ValueCell!16729)

