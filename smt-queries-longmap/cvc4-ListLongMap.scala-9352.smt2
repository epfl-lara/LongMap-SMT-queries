; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111552 () Bool)

(assert start!111552)

(declare-fun b_free!30209 () Bool)

(declare-fun b_next!30209 () Bool)

(assert (=> start!111552 (= b_free!30209 (not b_next!30209))))

(declare-fun tp!106102 () Bool)

(declare-fun b_and!48577 () Bool)

(assert (=> start!111552 (= tp!106102 b_and!48577)))

(declare-fun res!876689 () Bool)

(declare-fun e!753406 () Bool)

(assert (=> start!111552 (=> (not res!876689) (not e!753406))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111552 (= res!876689 (validMask!0 mask!2019))))

(assert (=> start!111552 e!753406))

(declare-datatypes ((array!88988 0))(
  ( (array!88989 (arr!42968 (Array (_ BitVec 32) (_ BitVec 64))) (size!43518 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88988)

(declare-fun array_inv!32439 (array!88988) Bool)

(assert (=> start!111552 (array_inv!32439 _keys!1609)))

(assert (=> start!111552 true))

(declare-fun tp_is_empty!36029 () Bool)

(assert (=> start!111552 tp_is_empty!36029))

(declare-datatypes ((V!53141 0))(
  ( (V!53142 (val!18089 Int)) )
))
(declare-datatypes ((ValueCell!17116 0))(
  ( (ValueCellFull!17116 (v!20719 V!53141)) (EmptyCell!17116) )
))
(declare-datatypes ((array!88990 0))(
  ( (array!88991 (arr!42969 (Array (_ BitVec 32) ValueCell!17116)) (size!43519 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88990)

(declare-fun e!753405 () Bool)

(declare-fun array_inv!32440 (array!88990) Bool)

(assert (=> start!111552 (and (array_inv!32440 _values!1337) e!753405)))

(assert (=> start!111552 tp!106102))

(declare-fun b!1320875 () Bool)

(declare-fun e!753409 () Bool)

(assert (=> b!1320875 (= e!753409 tp_is_empty!36029)))

(declare-fun b!1320876 () Bool)

(declare-fun res!876690 () Bool)

(assert (=> b!1320876 (=> (not res!876690) (not e!753406))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320876 (= res!876690 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43518 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320877 () Bool)

(declare-fun res!876687 () Bool)

(assert (=> b!1320877 (=> (not res!876687) (not e!753406))))

(declare-datatypes ((List!30445 0))(
  ( (Nil!30442) (Cons!30441 (h!31650 (_ BitVec 64)) (t!44203 List!30445)) )
))
(declare-fun arrayNoDuplicates!0 (array!88988 (_ BitVec 32) List!30445) Bool)

(assert (=> b!1320877 (= res!876687 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30442))))

(declare-fun b!1320878 () Bool)

(declare-fun e!753407 () Bool)

(assert (=> b!1320878 (= e!753407 tp_is_empty!36029)))

(declare-fun b!1320879 () Bool)

(declare-fun mapRes!55691 () Bool)

(assert (=> b!1320879 (= e!753405 (and e!753409 mapRes!55691))))

(declare-fun condMapEmpty!55691 () Bool)

(declare-fun mapDefault!55691 () ValueCell!17116)

