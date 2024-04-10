; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112390 () Bool)

(assert start!112390)

(declare-fun b_free!30785 () Bool)

(declare-fun b_next!30785 () Bool)

(assert (=> start!112390 (= b_free!30785 (not b_next!30785))))

(declare-fun tp!107992 () Bool)

(declare-fun b_and!49625 () Bool)

(assert (=> start!112390 (= tp!107992 b_and!49625)))

(declare-fun b!1332477 () Bool)

(declare-fun res!884257 () Bool)

(declare-fun e!759087 () Bool)

(assert (=> b!1332477 (=> (not res!884257) (not e!759087))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90270 0))(
  ( (array!90271 (arr!43601 (Array (_ BitVec 32) (_ BitVec 64))) (size!44151 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90270)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332477 (= res!884257 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44151 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332478 () Bool)

(declare-fun res!884256 () Bool)

(assert (=> b!1332478 (=> (not res!884256) (not e!759087))))

(declare-datatypes ((List!30885 0))(
  ( (Nil!30882) (Cons!30881 (h!32090 (_ BitVec 64)) (t!45083 List!30885)) )
))
(declare-fun arrayNoDuplicates!0 (array!90270 (_ BitVec 32) List!30885) Bool)

(assert (=> b!1332478 (= res!884256 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30882))))

(declare-fun res!884255 () Bool)

(assert (=> start!112390 (=> (not res!884255) (not e!759087))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112390 (= res!884255 (validMask!0 mask!1998))))

(assert (=> start!112390 e!759087))

(declare-datatypes ((V!54029 0))(
  ( (V!54030 (val!18422 Int)) )
))
(declare-datatypes ((ValueCell!17449 0))(
  ( (ValueCellFull!17449 (v!21059 V!54029)) (EmptyCell!17449) )
))
(declare-datatypes ((array!90272 0))(
  ( (array!90273 (arr!43602 (Array (_ BitVec 32) ValueCell!17449)) (size!44152 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90272)

(declare-fun e!759091 () Bool)

(declare-fun array_inv!32887 (array!90272) Bool)

(assert (=> start!112390 (and (array_inv!32887 _values!1320) e!759091)))

(assert (=> start!112390 true))

(declare-fun array_inv!32888 (array!90270) Bool)

(assert (=> start!112390 (array_inv!32888 _keys!1590)))

(assert (=> start!112390 tp!107992))

(declare-fun tp_is_empty!36695 () Bool)

(assert (=> start!112390 tp_is_empty!36695))

(declare-fun mapNonEmpty!56716 () Bool)

(declare-fun mapRes!56716 () Bool)

(declare-fun tp!107991 () Bool)

(declare-fun e!759090 () Bool)

(assert (=> mapNonEmpty!56716 (= mapRes!56716 (and tp!107991 e!759090))))

(declare-fun mapKey!56716 () (_ BitVec 32))

(declare-fun mapRest!56716 () (Array (_ BitVec 32) ValueCell!17449))

(declare-fun mapValue!56716 () ValueCell!17449)

(assert (=> mapNonEmpty!56716 (= (arr!43602 _values!1320) (store mapRest!56716 mapKey!56716 mapValue!56716))))

(declare-fun b!1332479 () Bool)

(declare-fun e!759088 () Bool)

(assert (=> b!1332479 (= e!759091 (and e!759088 mapRes!56716))))

(declare-fun condMapEmpty!56716 () Bool)

(declare-fun mapDefault!56716 () ValueCell!17449)

