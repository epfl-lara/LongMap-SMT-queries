; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112236 () Bool)

(assert start!112236)

(declare-fun b_free!30631 () Bool)

(declare-fun b_next!30631 () Bool)

(assert (=> start!112236 (= b_free!30631 (not b_next!30631))))

(declare-fun tp!107530 () Bool)

(declare-fun b_and!49317 () Bool)

(assert (=> start!112236 (= tp!107530 b_and!49317)))

(declare-fun b!1329551 () Bool)

(declare-fun e!757932 () Bool)

(declare-fun tp_is_empty!36541 () Bool)

(assert (=> b!1329551 (= e!757932 tp_is_empty!36541)))

(declare-fun b!1329552 () Bool)

(declare-fun e!757936 () Bool)

(assert (=> b!1329552 (= e!757936 tp_is_empty!36541)))

(declare-fun mapNonEmpty!56485 () Bool)

(declare-fun mapRes!56485 () Bool)

(declare-fun tp!107529 () Bool)

(assert (=> mapNonEmpty!56485 (= mapRes!56485 (and tp!107529 e!757936))))

(declare-datatypes ((V!53825 0))(
  ( (V!53826 (val!18345 Int)) )
))
(declare-datatypes ((ValueCell!17372 0))(
  ( (ValueCellFull!17372 (v!20982 V!53825)) (EmptyCell!17372) )
))
(declare-datatypes ((array!89974 0))(
  ( (array!89975 (arr!43453 (Array (_ BitVec 32) ValueCell!17372)) (size!44003 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89974)

(declare-fun mapValue!56485 () ValueCell!17372)

(declare-fun mapRest!56485 () (Array (_ BitVec 32) ValueCell!17372))

(declare-fun mapKey!56485 () (_ BitVec 32))

(assert (=> mapNonEmpty!56485 (= (arr!43453 _values!1320) (store mapRest!56485 mapKey!56485 mapValue!56485))))

(declare-fun b!1329553 () Bool)

(declare-fun res!882183 () Bool)

(declare-fun e!757933 () Bool)

(assert (=> b!1329553 (=> (not res!882183) (not e!757933))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!89976 0))(
  ( (array!89977 (arr!43454 (Array (_ BitVec 32) (_ BitVec 64))) (size!44004 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89976)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329553 (= res!882183 (not (= (select (arr!43454 _keys!1590) from!1980) k!1153)))))

(declare-fun res!882175 () Bool)

(assert (=> start!112236 (=> (not res!882175) (not e!757933))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112236 (= res!882175 (validMask!0 mask!1998))))

(assert (=> start!112236 e!757933))

(declare-fun e!757935 () Bool)

(declare-fun array_inv!32787 (array!89974) Bool)

(assert (=> start!112236 (and (array_inv!32787 _values!1320) e!757935)))

(assert (=> start!112236 true))

(declare-fun array_inv!32788 (array!89976) Bool)

(assert (=> start!112236 (array_inv!32788 _keys!1590)))

(assert (=> start!112236 tp!107530))

(assert (=> start!112236 tp_is_empty!36541))

(declare-fun b!1329554 () Bool)

(declare-fun res!882180 () Bool)

(assert (=> b!1329554 (=> (not res!882180) (not e!757933))))

(declare-datatypes ((List!30771 0))(
  ( (Nil!30768) (Cons!30767 (h!31976 (_ BitVec 64)) (t!44815 List!30771)) )
))
(declare-fun arrayNoDuplicates!0 (array!89976 (_ BitVec 32) List!30771) Bool)

(assert (=> b!1329554 (= res!882180 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30768))))

(declare-fun b!1329555 () Bool)

(declare-fun res!882176 () Bool)

(assert (=> b!1329555 (=> (not res!882176) (not e!757933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329555 (= res!882176 (validKeyInArray!0 (select (arr!43454 _keys!1590) from!1980)))))

(declare-fun b!1329556 () Bool)

(declare-fun res!882177 () Bool)

(assert (=> b!1329556 (=> (not res!882177) (not e!757933))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329556 (= res!882177 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44004 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329557 () Bool)

(declare-fun res!882181 () Bool)

(assert (=> b!1329557 (=> (not res!882181) (not e!757933))))

(assert (=> b!1329557 (= res!882181 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329558 () Bool)

(assert (=> b!1329558 (= e!757935 (and e!757932 mapRes!56485))))

(declare-fun condMapEmpty!56485 () Bool)

(declare-fun mapDefault!56485 () ValueCell!17372)

