; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99596 () Bool)

(assert start!99596)

(declare-fun b_free!25175 () Bool)

(declare-fun b_next!25175 () Bool)

(assert (=> start!99596 (= b_free!25175 (not b_next!25175))))

(declare-fun tp!88239 () Bool)

(declare-fun b_and!41217 () Bool)

(assert (=> start!99596 (= tp!88239 b_and!41217)))

(declare-fun res!783662 () Bool)

(declare-fun e!670594 () Bool)

(assert (=> start!99596 (=> (not res!783662) (not e!670594))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76213 0))(
  ( (array!76214 (arr!36756 (Array (_ BitVec 32) (_ BitVec 64))) (size!37292 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76213)

(assert (=> start!99596 (= res!783662 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37292 _keys!1208))))))

(assert (=> start!99596 e!670594))

(declare-fun tp_is_empty!29705 () Bool)

(assert (=> start!99596 tp_is_empty!29705))

(declare-fun array_inv!28064 (array!76213) Bool)

(assert (=> start!99596 (array_inv!28064 _keys!1208)))

(assert (=> start!99596 true))

(assert (=> start!99596 tp!88239))

(declare-datatypes ((V!44733 0))(
  ( (V!44734 (val!14909 Int)) )
))
(declare-datatypes ((ValueCell!14143 0))(
  ( (ValueCellFull!14143 (v!17547 V!44733)) (EmptyCell!14143) )
))
(declare-datatypes ((array!76215 0))(
  ( (array!76216 (arr!36757 (Array (_ BitVec 32) ValueCell!14143)) (size!37293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76215)

(declare-fun e!670593 () Bool)

(declare-fun array_inv!28065 (array!76215) Bool)

(assert (=> start!99596 (and (array_inv!28065 _values!996) e!670593)))

(declare-fun b!1179530 () Bool)

(declare-fun res!783673 () Bool)

(assert (=> b!1179530 (=> (not res!783673) (not e!670594))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179530 (= res!783673 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37292 _keys!1208))))))

(declare-fun b!1179531 () Bool)

(declare-fun res!783670 () Bool)

(declare-fun e!670600 () Bool)

(assert (=> b!1179531 (=> (not res!783670) (not e!670600))))

(declare-fun lt!533116 () array!76213)

(declare-datatypes ((List!25823 0))(
  ( (Nil!25820) (Cons!25819 (h!27028 (_ BitVec 64)) (t!37990 List!25823)) )
))
(declare-fun arrayNoDuplicates!0 (array!76213 (_ BitVec 32) List!25823) Bool)

(assert (=> b!1179531 (= res!783670 (arrayNoDuplicates!0 lt!533116 #b00000000000000000000000000000000 Nil!25820))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!670589 () Bool)

(declare-fun b!1179532 () Bool)

(declare-fun arrayContainsKey!0 (array!76213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179532 (= e!670589 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179533 () Bool)

(declare-fun e!670598 () Bool)

(declare-fun mapRes!46385 () Bool)

(assert (=> b!1179533 (= e!670593 (and e!670598 mapRes!46385))))

(declare-fun condMapEmpty!46385 () Bool)

(declare-fun mapDefault!46385 () ValueCell!14143)

