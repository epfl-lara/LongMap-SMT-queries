; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111934 () Bool)

(assert start!111934)

(declare-fun b_free!30533 () Bool)

(declare-fun b_next!30533 () Bool)

(assert (=> start!111934 (= b_free!30533 (not b_next!30533))))

(declare-fun tp!107078 () Bool)

(declare-fun b_and!49161 () Bool)

(assert (=> start!111934 (= tp!107078 b_and!49161)))

(declare-fun b!1326608 () Bool)

(declare-fun res!880475 () Bool)

(declare-fun e!756096 () Bool)

(assert (=> b!1326608 (=> (not res!880475) (not e!756096))))

(declare-datatypes ((array!89612 0))(
  ( (array!89613 (arr!43279 (Array (_ BitVec 32) (_ BitVec 64))) (size!43829 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89612)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326608 (= res!880475 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43829 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56181 () Bool)

(declare-fun mapRes!56181 () Bool)

(declare-fun tp!107079 () Bool)

(declare-fun e!756095 () Bool)

(assert (=> mapNonEmpty!56181 (= mapRes!56181 (and tp!107079 e!756095))))

(declare-datatypes ((V!53573 0))(
  ( (V!53574 (val!18251 Int)) )
))
(declare-datatypes ((ValueCell!17278 0))(
  ( (ValueCellFull!17278 (v!20884 V!53573)) (EmptyCell!17278) )
))
(declare-datatypes ((array!89614 0))(
  ( (array!89615 (arr!43280 (Array (_ BitVec 32) ValueCell!17278)) (size!43830 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89614)

(declare-fun mapRest!56181 () (Array (_ BitVec 32) ValueCell!17278))

(declare-fun mapValue!56181 () ValueCell!17278)

(declare-fun mapKey!56181 () (_ BitVec 32))

(assert (=> mapNonEmpty!56181 (= (arr!43280 _values!1337) (store mapRest!56181 mapKey!56181 mapValue!56181))))

(declare-fun res!880480 () Bool)

(assert (=> start!111934 (=> (not res!880480) (not e!756096))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111934 (= res!880480 (validMask!0 mask!2019))))

(assert (=> start!111934 e!756096))

(declare-fun array_inv!32667 (array!89612) Bool)

(assert (=> start!111934 (array_inv!32667 _keys!1609)))

(assert (=> start!111934 true))

(declare-fun tp_is_empty!36353 () Bool)

(assert (=> start!111934 tp_is_empty!36353))

(declare-fun e!756093 () Bool)

(declare-fun array_inv!32668 (array!89614) Bool)

(assert (=> start!111934 (and (array_inv!32668 _values!1337) e!756093)))

(assert (=> start!111934 tp!107078))

(declare-fun mapIsEmpty!56181 () Bool)

(assert (=> mapIsEmpty!56181 mapRes!56181))

(declare-fun b!1326609 () Bool)

(declare-fun res!880476 () Bool)

(assert (=> b!1326609 (=> (not res!880476) (not e!756096))))

(assert (=> b!1326609 (= res!880476 (not (= (select (arr!43279 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326610 () Bool)

(declare-fun e!756097 () Bool)

(assert (=> b!1326610 (= e!756093 (and e!756097 mapRes!56181))))

(declare-fun condMapEmpty!56181 () Bool)

(declare-fun mapDefault!56181 () ValueCell!17278)

