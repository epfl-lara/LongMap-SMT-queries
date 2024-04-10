; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112318 () Bool)

(assert start!112318)

(declare-fun b_free!30713 () Bool)

(declare-fun b_next!30713 () Bool)

(assert (=> start!112318 (= b_free!30713 (not b_next!30713))))

(declare-fun tp!107775 () Bool)

(declare-fun b_and!49481 () Bool)

(assert (=> start!112318 (= tp!107775 b_and!49481)))

(declare-fun b!1331109 () Bool)

(declare-fun res!883285 () Bool)

(declare-fun e!758551 () Bool)

(assert (=> b!1331109 (=> (not res!883285) (not e!758551))))

(declare-datatypes ((array!90128 0))(
  ( (array!90129 (arr!43530 (Array (_ BitVec 32) (_ BitVec 64))) (size!44080 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90128)

(declare-datatypes ((List!30831 0))(
  ( (Nil!30828) (Cons!30827 (h!32036 (_ BitVec 64)) (t!44957 List!30831)) )
))
(declare-fun arrayNoDuplicates!0 (array!90128 (_ BitVec 32) List!30831) Bool)

(assert (=> b!1331109 (= res!883285 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30828))))

(declare-fun b!1331110 () Bool)

(declare-fun res!883289 () Bool)

(assert (=> b!1331110 (=> (not res!883289) (not e!758551))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331110 (= res!883289 (validKeyInArray!0 (select (arr!43530 _keys!1590) from!1980)))))

(declare-fun b!1331111 () Bool)

(declare-fun e!758547 () Bool)

(declare-fun tp_is_empty!36623 () Bool)

(assert (=> b!1331111 (= e!758547 tp_is_empty!36623)))

(declare-fun b!1331112 () Bool)

(declare-fun res!883288 () Bool)

(assert (=> b!1331112 (=> (not res!883288) (not e!758551))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331112 (= res!883288 (not (= (select (arr!43530 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331114 () Bool)

(declare-fun res!883283 () Bool)

(assert (=> b!1331114 (=> (not res!883283) (not e!758551))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90128 (_ BitVec 32)) Bool)

(assert (=> b!1331114 (= res!883283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331115 () Bool)

(declare-fun res!883290 () Bool)

(assert (=> b!1331115 (=> (not res!883290) (not e!758551))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331115 (= res!883290 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56608 () Bool)

(declare-fun mapRes!56608 () Bool)

(assert (=> mapIsEmpty!56608 mapRes!56608))

(declare-fun b!1331116 () Bool)

(declare-fun res!883284 () Bool)

(assert (=> b!1331116 (=> (not res!883284) (not e!758551))))

(assert (=> b!1331116 (= res!883284 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44080 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331117 () Bool)

(declare-fun res!883287 () Bool)

(assert (=> b!1331117 (=> (not res!883287) (not e!758551))))

(declare-datatypes ((V!53933 0))(
  ( (V!53934 (val!18386 Int)) )
))
(declare-datatypes ((ValueCell!17413 0))(
  ( (ValueCellFull!17413 (v!21023 V!53933)) (EmptyCell!17413) )
))
(declare-datatypes ((array!90130 0))(
  ( (array!90131 (arr!43531 (Array (_ BitVec 32) ValueCell!17413)) (size!44081 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90130)

(assert (=> b!1331117 (= res!883287 (and (= (size!44081 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44080 _keys!1590) (size!44081 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331118 () Bool)

(declare-fun e!758548 () Bool)

(declare-fun e!758550 () Bool)

(assert (=> b!1331118 (= e!758548 (and e!758550 mapRes!56608))))

(declare-fun condMapEmpty!56608 () Bool)

(declare-fun mapDefault!56608 () ValueCell!17413)

