; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112258 () Bool)

(assert start!112258)

(declare-fun b_free!30653 () Bool)

(declare-fun b_next!30653 () Bool)

(assert (=> start!112258 (= b_free!30653 (not b_next!30653))))

(declare-fun tp!107595 () Bool)

(declare-fun b_and!49361 () Bool)

(assert (=> start!112258 (= tp!107595 b_and!49361)))

(declare-fun b!1329969 () Bool)

(declare-fun res!882478 () Bool)

(declare-fun e!758097 () Bool)

(assert (=> b!1329969 (=> (not res!882478) (not e!758097))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90016 0))(
  ( (array!90017 (arr!43474 (Array (_ BitVec 32) (_ BitVec 64))) (size!44024 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90016)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329969 (= res!882478 (not (= (select (arr!43474 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329970 () Bool)

(declare-fun res!882480 () Bool)

(assert (=> b!1329970 (=> (not res!882480) (not e!758097))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329970 (= res!882480 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329971 () Bool)

(declare-fun res!882475 () Bool)

(assert (=> b!1329971 (=> (not res!882475) (not e!758097))))

(declare-datatypes ((V!53853 0))(
  ( (V!53854 (val!18356 Int)) )
))
(declare-datatypes ((ValueCell!17383 0))(
  ( (ValueCellFull!17383 (v!20993 V!53853)) (EmptyCell!17383) )
))
(declare-datatypes ((array!90018 0))(
  ( (array!90019 (arr!43475 (Array (_ BitVec 32) ValueCell!17383)) (size!44025 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90018)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1329971 (= res!882475 (and (= (size!44025 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44024 _keys!1590) (size!44025 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329972 () Bool)

(declare-fun res!882479 () Bool)

(assert (=> b!1329972 (=> (not res!882479) (not e!758097))))

(declare-datatypes ((List!30788 0))(
  ( (Nil!30785) (Cons!30784 (h!31993 (_ BitVec 64)) (t!44854 List!30788)) )
))
(declare-fun arrayNoDuplicates!0 (array!90016 (_ BitVec 32) List!30788) Bool)

(assert (=> b!1329972 (= res!882479 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30785))))

(declare-fun b!1329973 () Bool)

(declare-fun e!758100 () Bool)

(declare-fun e!758099 () Bool)

(declare-fun mapRes!56518 () Bool)

(assert (=> b!1329973 (= e!758100 (and e!758099 mapRes!56518))))

(declare-fun condMapEmpty!56518 () Bool)

(declare-fun mapDefault!56518 () ValueCell!17383)

