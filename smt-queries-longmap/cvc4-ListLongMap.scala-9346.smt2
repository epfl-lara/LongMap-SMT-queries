; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111516 () Bool)

(assert start!111516)

(declare-fun b_free!30173 () Bool)

(declare-fun b_next!30173 () Bool)

(assert (=> start!111516 (= b_free!30173 (not b_next!30173))))

(declare-fun tp!105994 () Bool)

(declare-fun b_and!48505 () Bool)

(assert (=> start!111516 (= tp!105994 b_and!48505)))

(declare-fun b!1320245 () Bool)

(declare-fun res!876258 () Bool)

(declare-fun e!753137 () Bool)

(assert (=> b!1320245 (=> (not res!876258) (not e!753137))))

(declare-datatypes ((array!88916 0))(
  ( (array!88917 (arr!42932 (Array (_ BitVec 32) (_ BitVec 64))) (size!43482 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88916)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320245 (= res!876258 (validKeyInArray!0 (select (arr!42932 _keys!1609) from!2000)))))

(declare-fun b!1320246 () Bool)

(declare-fun e!753136 () Bool)

(declare-fun tp_is_empty!35993 () Bool)

(assert (=> b!1320246 (= e!753136 tp_is_empty!35993)))

(declare-fun mapNonEmpty!55637 () Bool)

(declare-fun mapRes!55637 () Bool)

(declare-fun tp!105995 () Bool)

(declare-fun e!753138 () Bool)

(assert (=> mapNonEmpty!55637 (= mapRes!55637 (and tp!105995 e!753138))))

(declare-datatypes ((V!53093 0))(
  ( (V!53094 (val!18071 Int)) )
))
(declare-datatypes ((ValueCell!17098 0))(
  ( (ValueCellFull!17098 (v!20701 V!53093)) (EmptyCell!17098) )
))
(declare-datatypes ((array!88918 0))(
  ( (array!88919 (arr!42933 (Array (_ BitVec 32) ValueCell!17098)) (size!43483 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88918)

(declare-fun mapValue!55637 () ValueCell!17098)

(declare-fun mapRest!55637 () (Array (_ BitVec 32) ValueCell!17098))

(declare-fun mapKey!55637 () (_ BitVec 32))

(assert (=> mapNonEmpty!55637 (= (arr!42933 _values!1337) (store mapRest!55637 mapKey!55637 mapValue!55637))))

(declare-fun res!876254 () Bool)

(assert (=> start!111516 (=> (not res!876254) (not e!753137))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111516 (= res!876254 (validMask!0 mask!2019))))

(assert (=> start!111516 e!753137))

(declare-fun array_inv!32413 (array!88916) Bool)

(assert (=> start!111516 (array_inv!32413 _keys!1609)))

(assert (=> start!111516 true))

(assert (=> start!111516 tp_is_empty!35993))

(declare-fun e!753135 () Bool)

(declare-fun array_inv!32414 (array!88918) Bool)

(assert (=> start!111516 (and (array_inv!32414 _values!1337) e!753135)))

(assert (=> start!111516 tp!105994))

(declare-fun mapIsEmpty!55637 () Bool)

(assert (=> mapIsEmpty!55637 mapRes!55637))

(declare-fun b!1320247 () Bool)

(declare-fun res!876256 () Bool)

(assert (=> b!1320247 (=> (not res!876256) (not e!753137))))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320247 (= res!876256 (not (= (select (arr!42932 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320248 () Bool)

(declare-fun res!876260 () Bool)

(assert (=> b!1320248 (=> (not res!876260) (not e!753137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88916 (_ BitVec 32)) Bool)

(assert (=> b!1320248 (= res!876260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320249 () Bool)

(declare-fun res!876259 () Bool)

(assert (=> b!1320249 (=> (not res!876259) (not e!753137))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320249 (= res!876259 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43482 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320250 () Bool)

(assert (=> b!1320250 (= e!753135 (and e!753136 mapRes!55637))))

(declare-fun condMapEmpty!55637 () Bool)

(declare-fun mapDefault!55637 () ValueCell!17098)

