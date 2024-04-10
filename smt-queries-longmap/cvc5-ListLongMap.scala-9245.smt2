; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110818 () Bool)

(assert start!110818)

(declare-fun b_free!29653 () Bool)

(declare-fun b_next!29653 () Bool)

(assert (=> start!110818 (= b_free!29653 (not b_next!29653))))

(declare-fun tp!104280 () Bool)

(declare-fun b_and!47861 () Bool)

(assert (=> start!110818 (= tp!104280 b_and!47861)))

(declare-fun b!1311667 () Bool)

(declare-fun res!870777 () Bool)

(declare-fun e!748259 () Bool)

(assert (=> b!1311667 (=> (not res!870777) (not e!748259))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87754 0))(
  ( (array!87755 (arr!42357 (Array (_ BitVec 32) (_ BitVec 64))) (size!42907 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87754)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52281 0))(
  ( (V!52282 (val!17766 Int)) )
))
(declare-fun minValue!1296 () V!52281)

(declare-datatypes ((ValueCell!16793 0))(
  ( (ValueCellFull!16793 (v!20393 V!52281)) (EmptyCell!16793) )
))
(declare-datatypes ((array!87756 0))(
  ( (array!87757 (arr!42358 (Array (_ BitVec 32) ValueCell!16793)) (size!42908 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87756)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52281)

(declare-datatypes ((tuple2!22896 0))(
  ( (tuple2!22897 (_1!11459 (_ BitVec 64)) (_2!11459 V!52281)) )
))
(declare-datatypes ((List!30036 0))(
  ( (Nil!30033) (Cons!30032 (h!31241 tuple2!22896) (t!43642 List!30036)) )
))
(declare-datatypes ((ListLongMap!20553 0))(
  ( (ListLongMap!20554 (toList!10292 List!30036)) )
))
(declare-fun contains!8442 (ListLongMap!20553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5305 (array!87754 array!87756 (_ BitVec 32) (_ BitVec 32) V!52281 V!52281 (_ BitVec 32) Int) ListLongMap!20553)

(assert (=> b!1311667 (= res!870777 (contains!8442 (getCurrentListMap!5305 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311668 () Bool)

(declare-fun res!870772 () Bool)

(assert (=> b!1311668 (=> (not res!870772) (not e!748259))))

(assert (=> b!1311668 (= res!870772 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42907 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311669 () Bool)

(declare-fun e!748258 () Bool)

(declare-fun e!748262 () Bool)

(declare-fun mapRes!54703 () Bool)

(assert (=> b!1311669 (= e!748258 (and e!748262 mapRes!54703))))

(declare-fun condMapEmpty!54703 () Bool)

(declare-fun mapDefault!54703 () ValueCell!16793)

