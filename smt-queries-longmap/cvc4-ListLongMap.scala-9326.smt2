; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111396 () Bool)

(assert start!111396)

(declare-fun b_free!30053 () Bool)

(declare-fun b_next!30053 () Bool)

(assert (=> start!111396 (= b_free!30053 (not b_next!30053))))

(declare-fun tp!105634 () Bool)

(declare-fun b_and!48273 () Bool)

(assert (=> start!111396 (= tp!105634 b_and!48273)))

(declare-fun res!874818 () Bool)

(declare-fun e!752238 () Bool)

(assert (=> start!111396 (=> (not res!874818) (not e!752238))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111396 (= res!874818 (validMask!0 mask!2019))))

(assert (=> start!111396 e!752238))

(declare-datatypes ((array!88694 0))(
  ( (array!88695 (arr!42821 (Array (_ BitVec 32) (_ BitVec 64))) (size!43371 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88694)

(declare-fun array_inv!32341 (array!88694) Bool)

(assert (=> start!111396 (array_inv!32341 _keys!1609)))

(assert (=> start!111396 true))

(declare-fun tp_is_empty!35873 () Bool)

(assert (=> start!111396 tp_is_empty!35873))

(declare-datatypes ((V!52933 0))(
  ( (V!52934 (val!18011 Int)) )
))
(declare-datatypes ((ValueCell!17038 0))(
  ( (ValueCellFull!17038 (v!20641 V!52933)) (EmptyCell!17038) )
))
(declare-datatypes ((array!88696 0))(
  ( (array!88697 (arr!42822 (Array (_ BitVec 32) ValueCell!17038)) (size!43372 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88696)

(declare-fun e!752235 () Bool)

(declare-fun array_inv!32342 (array!88696) Bool)

(assert (=> start!111396 (and (array_inv!32342 _values!1337) e!752235)))

(assert (=> start!111396 tp!105634))

(declare-fun b!1318156 () Bool)

(declare-fun res!874817 () Bool)

(assert (=> b!1318156 (=> (not res!874817) (not e!752238))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318156 (= res!874817 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43371 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318157 () Bool)

(declare-fun e!752236 () Bool)

(declare-fun mapRes!55457 () Bool)

(assert (=> b!1318157 (= e!752235 (and e!752236 mapRes!55457))))

(declare-fun condMapEmpty!55457 () Bool)

(declare-fun mapDefault!55457 () ValueCell!17038)

