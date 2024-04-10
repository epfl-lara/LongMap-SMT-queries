; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112230 () Bool)

(assert start!112230)

(declare-fun b_free!30625 () Bool)

(declare-fun b_next!30625 () Bool)

(assert (=> start!112230 (= b_free!30625 (not b_next!30625))))

(declare-fun tp!107512 () Bool)

(declare-fun b_and!49305 () Bool)

(assert (=> start!112230 (= tp!107512 b_and!49305)))

(declare-fun b!1329437 () Bool)

(declare-fun e!757889 () Bool)

(declare-fun tp_is_empty!36535 () Bool)

(assert (=> b!1329437 (= e!757889 tp_is_empty!36535)))

(declare-fun b!1329438 () Bool)

(declare-fun e!757887 () Bool)

(assert (=> b!1329438 (= e!757887 tp_is_empty!36535)))

(declare-fun res!882096 () Bool)

(declare-fun e!757891 () Bool)

(assert (=> start!112230 (=> (not res!882096) (not e!757891))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112230 (= res!882096 (validMask!0 mask!1998))))

(assert (=> start!112230 e!757891))

(declare-datatypes ((V!53817 0))(
  ( (V!53818 (val!18342 Int)) )
))
(declare-datatypes ((ValueCell!17369 0))(
  ( (ValueCellFull!17369 (v!20979 V!53817)) (EmptyCell!17369) )
))
(declare-datatypes ((array!89962 0))(
  ( (array!89963 (arr!43447 (Array (_ BitVec 32) ValueCell!17369)) (size!43997 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89962)

(declare-fun e!757890 () Bool)

(declare-fun array_inv!32781 (array!89962) Bool)

(assert (=> start!112230 (and (array_inv!32781 _values!1320) e!757890)))

(assert (=> start!112230 true))

(declare-datatypes ((array!89964 0))(
  ( (array!89965 (arr!43448 (Array (_ BitVec 32) (_ BitVec 64))) (size!43998 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89964)

(declare-fun array_inv!32782 (array!89964) Bool)

(assert (=> start!112230 (array_inv!32782 _keys!1590)))

(assert (=> start!112230 tp!107512))

(assert (=> start!112230 tp_is_empty!36535))

(declare-fun b!1329439 () Bool)

(declare-fun res!882094 () Bool)

(assert (=> b!1329439 (=> (not res!882094) (not e!757891))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329439 (= res!882094 (not (= (select (arr!43448 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329440 () Bool)

(declare-fun res!882101 () Bool)

(assert (=> b!1329440 (=> (not res!882101) (not e!757891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329440 (= res!882101 (validKeyInArray!0 (select (arr!43448 _keys!1590) from!1980)))))

(declare-fun b!1329441 () Bool)

(declare-fun res!882095 () Bool)

(assert (=> b!1329441 (=> (not res!882095) (not e!757891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89964 (_ BitVec 32)) Bool)

(assert (=> b!1329441 (= res!882095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329442 () Bool)

(declare-fun res!882097 () Bool)

(assert (=> b!1329442 (=> (not res!882097) (not e!757891))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329442 (= res!882097 (and (= (size!43997 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43998 _keys!1590) (size!43997 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329443 () Bool)

(declare-fun res!882099 () Bool)

(assert (=> b!1329443 (=> (not res!882099) (not e!757891))))

(assert (=> b!1329443 (= res!882099 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43998 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56476 () Bool)

(declare-fun mapRes!56476 () Bool)

(assert (=> mapIsEmpty!56476 mapRes!56476))

(declare-fun b!1329444 () Bool)

(assert (=> b!1329444 (= e!757890 (and e!757889 mapRes!56476))))

(declare-fun condMapEmpty!56476 () Bool)

(declare-fun mapDefault!56476 () ValueCell!17369)

