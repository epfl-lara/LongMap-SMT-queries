; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112162 () Bool)

(assert start!112162)

(declare-fun b_free!30557 () Bool)

(declare-fun b_next!30557 () Bool)

(assert (=> start!112162 (= b_free!30557 (not b_next!30557))))

(declare-fun tp!107307 () Bool)

(declare-fun b_and!49207 () Bool)

(assert (=> start!112162 (= tp!107307 b_and!49207)))

(declare-fun b!1328376 () Bool)

(declare-fun res!881369 () Bool)

(declare-fun e!757378 () Bool)

(assert (=> b!1328376 (=> (not res!881369) (not e!757378))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89828 0))(
  ( (array!89829 (arr!43380 (Array (_ BitVec 32) (_ BitVec 64))) (size!43930 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89828)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328376 (= res!881369 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43930 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328377 () Bool)

(declare-fun res!881373 () Bool)

(assert (=> b!1328377 (=> (not res!881373) (not e!757378))))

(declare-datatypes ((V!53725 0))(
  ( (V!53726 (val!18308 Int)) )
))
(declare-datatypes ((ValueCell!17335 0))(
  ( (ValueCellFull!17335 (v!20945 V!53725)) (EmptyCell!17335) )
))
(declare-datatypes ((array!89830 0))(
  ( (array!89831 (arr!43381 (Array (_ BitVec 32) ValueCell!17335)) (size!43931 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89830)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1328377 (= res!881373 (and (= (size!43931 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43930 _keys!1590) (size!43931 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328378 () Bool)

(declare-fun e!757380 () Bool)

(declare-fun tp_is_empty!36467 () Bool)

(assert (=> b!1328378 (= e!757380 tp_is_empty!36467)))

(declare-fun b!1328379 () Bool)

(declare-fun res!881372 () Bool)

(assert (=> b!1328379 (=> (not res!881372) (not e!757378))))

(declare-datatypes ((List!30722 0))(
  ( (Nil!30719) (Cons!30718 (h!31927 (_ BitVec 64)) (t!44728 List!30722)) )
))
(declare-fun arrayNoDuplicates!0 (array!89828 (_ BitVec 32) List!30722) Bool)

(assert (=> b!1328379 (= res!881372 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30719))))

(declare-fun b!1328380 () Bool)

(declare-fun e!757381 () Bool)

(assert (=> b!1328380 (= e!757381 tp_is_empty!36467)))

(declare-fun mapNonEmpty!56374 () Bool)

(declare-fun mapRes!56374 () Bool)

(declare-fun tp!107308 () Bool)

(assert (=> mapNonEmpty!56374 (= mapRes!56374 (and tp!107308 e!757380))))

(declare-fun mapRest!56374 () (Array (_ BitVec 32) ValueCell!17335))

(declare-fun mapKey!56374 () (_ BitVec 32))

(declare-fun mapValue!56374 () ValueCell!17335)

(assert (=> mapNonEmpty!56374 (= (arr!43381 _values!1320) (store mapRest!56374 mapKey!56374 mapValue!56374))))

(declare-fun mapIsEmpty!56374 () Bool)

(assert (=> mapIsEmpty!56374 mapRes!56374))

(declare-fun b!1328381 () Bool)

(declare-fun e!757379 () Bool)

(assert (=> b!1328381 (= e!757379 (and e!757381 mapRes!56374))))

(declare-fun condMapEmpty!56374 () Bool)

(declare-fun mapDefault!56374 () ValueCell!17335)

