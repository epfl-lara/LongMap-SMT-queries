; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113094 () Bool)

(assert start!113094)

(declare-fun b_free!31145 () Bool)

(declare-fun b_next!31145 () Bool)

(assert (=> start!113094 (= b_free!31145 (not b_next!31145))))

(declare-fun tp!109240 () Bool)

(declare-fun b_and!50197 () Bool)

(assert (=> start!113094 (= tp!109240 b_and!50197)))

(declare-fun b!1340649 () Bool)

(declare-fun e!763566 () Bool)

(declare-fun tp_is_empty!37145 () Bool)

(assert (=> b!1340649 (= e!763566 tp_is_empty!37145)))

(declare-fun b!1340650 () Bool)

(declare-fun res!889356 () Bool)

(declare-fun e!763568 () Bool)

(assert (=> b!1340650 (=> (not res!889356) (not e!763568))))

(declare-datatypes ((array!91142 0))(
  ( (array!91143 (arr!44027 (Array (_ BitVec 32) (_ BitVec 64))) (size!44577 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91142)

(declare-datatypes ((List!31164 0))(
  ( (Nil!31161) (Cons!31160 (h!32369 (_ BitVec 64)) (t!45520 List!31164)) )
))
(declare-fun arrayNoDuplicates!0 (array!91142 (_ BitVec 32) List!31164) Bool)

(assert (=> b!1340650 (= res!889356 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31161))))

(declare-fun b!1340651 () Bool)

(declare-fun e!763567 () Bool)

(assert (=> b!1340651 (= e!763567 tp_is_empty!37145)))

(declare-fun mapIsEmpty!57424 () Bool)

(declare-fun mapRes!57424 () Bool)

(assert (=> mapIsEmpty!57424 mapRes!57424))

(declare-fun b!1340652 () Bool)

(declare-fun res!889361 () Bool)

(assert (=> b!1340652 (=> (not res!889361) (not e!763568))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340652 (= res!889361 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340653 () Bool)

(declare-fun res!889358 () Bool)

(assert (=> b!1340653 (=> (not res!889358) (not e!763568))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340653 (= res!889358 (validKeyInArray!0 (select (arr!44027 _keys!1571) from!1960)))))

(declare-fun b!1340654 () Bool)

(declare-fun res!889359 () Bool)

(assert (=> b!1340654 (=> (not res!889359) (not e!763568))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91142 (_ BitVec 32)) Bool)

(assert (=> b!1340654 (= res!889359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340655 () Bool)

(declare-fun res!889357 () Bool)

(assert (=> b!1340655 (=> (not res!889357) (not e!763568))))

(declare-datatypes ((V!54629 0))(
  ( (V!54630 (val!18647 Int)) )
))
(declare-datatypes ((ValueCell!17674 0))(
  ( (ValueCellFull!17674 (v!21295 V!54629)) (EmptyCell!17674) )
))
(declare-datatypes ((array!91144 0))(
  ( (array!91145 (arr!44028 (Array (_ BitVec 32) ValueCell!17674)) (size!44578 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91144)

(assert (=> b!1340655 (= res!889357 (and (= (size!44578 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44577 _keys!1571) (size!44578 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57424 () Bool)

(declare-fun tp!109239 () Bool)

(assert (=> mapNonEmpty!57424 (= mapRes!57424 (and tp!109239 e!763567))))

(declare-fun mapRest!57424 () (Array (_ BitVec 32) ValueCell!17674))

(declare-fun mapKey!57424 () (_ BitVec 32))

(declare-fun mapValue!57424 () ValueCell!17674)

(assert (=> mapNonEmpty!57424 (= (arr!44028 _values!1303) (store mapRest!57424 mapKey!57424 mapValue!57424))))

(declare-fun b!1340656 () Bool)

(declare-fun res!889354 () Bool)

(assert (=> b!1340656 (=> (not res!889354) (not e!763568))))

(declare-fun minValue!1245 () V!54629)

(declare-fun zeroValue!1245 () V!54629)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24002 0))(
  ( (tuple2!24003 (_1!12012 (_ BitVec 64)) (_2!12012 V!54629)) )
))
(declare-datatypes ((List!31165 0))(
  ( (Nil!31162) (Cons!31161 (h!32370 tuple2!24002) (t!45521 List!31165)) )
))
(declare-datatypes ((ListLongMap!21659 0))(
  ( (ListLongMap!21660 (toList!10845 List!31165)) )
))
(declare-fun contains!9021 (ListLongMap!21659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5813 (array!91142 array!91144 (_ BitVec 32) (_ BitVec 32) V!54629 V!54629 (_ BitVec 32) Int) ListLongMap!21659)

(assert (=> b!1340656 (= res!889354 (contains!9021 (getCurrentListMap!5813 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340657 () Bool)

(declare-fun e!763565 () Bool)

(assert (=> b!1340657 (= e!763565 (and e!763566 mapRes!57424))))

(declare-fun condMapEmpty!57424 () Bool)

(declare-fun mapDefault!57424 () ValueCell!17674)

