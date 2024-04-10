; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111738 () Bool)

(assert start!111738)

(declare-fun b_free!30395 () Bool)

(declare-fun b_next!30395 () Bool)

(assert (=> start!111738 (= b_free!30395 (not b_next!30395))))

(declare-fun tp!106660 () Bool)

(declare-fun b_and!48933 () Bool)

(assert (=> start!111738 (= tp!106660 b_and!48933)))

(declare-fun res!878839 () Bool)

(declare-fun e!754803 () Bool)

(assert (=> start!111738 (=> (not res!878839) (not e!754803))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111738 (= res!878839 (validMask!0 mask!2019))))

(assert (=> start!111738 e!754803))

(declare-datatypes ((array!89346 0))(
  ( (array!89347 (arr!43147 (Array (_ BitVec 32) (_ BitVec 64))) (size!43697 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89346)

(declare-fun array_inv!32571 (array!89346) Bool)

(assert (=> start!111738 (array_inv!32571 _keys!1609)))

(assert (=> start!111738 true))

(declare-fun tp_is_empty!36215 () Bool)

(assert (=> start!111738 tp_is_empty!36215))

(declare-datatypes ((V!53389 0))(
  ( (V!53390 (val!18182 Int)) )
))
(declare-datatypes ((ValueCell!17209 0))(
  ( (ValueCellFull!17209 (v!20812 V!53389)) (EmptyCell!17209) )
))
(declare-datatypes ((array!89348 0))(
  ( (array!89349 (arr!43148 (Array (_ BitVec 32) ValueCell!17209)) (size!43698 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89348)

(declare-fun e!754801 () Bool)

(declare-fun array_inv!32572 (array!89348) Bool)

(assert (=> start!111738 (and (array_inv!32572 _values!1337) e!754801)))

(assert (=> start!111738 tp!106660))

(declare-fun b!1324036 () Bool)

(declare-fun res!878842 () Bool)

(assert (=> b!1324036 (=> (not res!878842) (not e!754803))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324036 (= res!878842 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43697 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55970 () Bool)

(declare-fun mapRes!55970 () Bool)

(declare-fun tp!106661 () Bool)

(declare-fun e!754800 () Bool)

(assert (=> mapNonEmpty!55970 (= mapRes!55970 (and tp!106661 e!754800))))

(declare-fun mapRest!55970 () (Array (_ BitVec 32) ValueCell!17209))

(declare-fun mapKey!55970 () (_ BitVec 32))

(declare-fun mapValue!55970 () ValueCell!17209)

(assert (=> mapNonEmpty!55970 (= (arr!43148 _values!1337) (store mapRest!55970 mapKey!55970 mapValue!55970))))

(declare-fun b!1324037 () Bool)

(declare-fun res!878843 () Bool)

(assert (=> b!1324037 (=> (not res!878843) (not e!754803))))

(declare-datatypes ((List!30584 0))(
  ( (Nil!30581) (Cons!30580 (h!31789 (_ BitVec 64)) (t!44510 List!30584)) )
))
(declare-fun arrayNoDuplicates!0 (array!89346 (_ BitVec 32) List!30584) Bool)

(assert (=> b!1324037 (= res!878843 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30581))))

(declare-fun b!1324038 () Bool)

(declare-fun e!754804 () Bool)

(assert (=> b!1324038 (= e!754801 (and e!754804 mapRes!55970))))

(declare-fun condMapEmpty!55970 () Bool)

(declare-fun mapDefault!55970 () ValueCell!17209)

