; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113046 () Bool)

(assert start!113046)

(declare-fun b_free!31097 () Bool)

(declare-fun b_next!31097 () Bool)

(assert (=> start!113046 (= b_free!31097 (not b_next!31097))))

(declare-fun tp!109095 () Bool)

(declare-fun b_and!50127 () Bool)

(assert (=> start!113046 (= tp!109095 b_and!50127)))

(declare-fun b!1339885 () Bool)

(declare-fun res!888829 () Bool)

(declare-fun e!763206 () Bool)

(assert (=> b!1339885 (=> (not res!888829) (not e!763206))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91048 0))(
  ( (array!91049 (arr!43980 (Array (_ BitVec 32) (_ BitVec 64))) (size!44530 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91048)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54565 0))(
  ( (V!54566 (val!18623 Int)) )
))
(declare-datatypes ((ValueCell!17650 0))(
  ( (ValueCellFull!17650 (v!21271 V!54565)) (EmptyCell!17650) )
))
(declare-datatypes ((array!91050 0))(
  ( (array!91051 (arr!43981 (Array (_ BitVec 32) ValueCell!17650)) (size!44531 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91050)

(assert (=> b!1339885 (= res!888829 (and (= (size!44531 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44530 _keys!1571) (size!44531 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339886 () Bool)

(declare-fun e!763207 () Bool)

(declare-fun tp_is_empty!37097 () Bool)

(assert (=> b!1339886 (= e!763207 tp_is_empty!37097)))

(declare-fun mapNonEmpty!57352 () Bool)

(declare-fun mapRes!57352 () Bool)

(declare-fun tp!109096 () Bool)

(declare-fun e!763208 () Bool)

(assert (=> mapNonEmpty!57352 (= mapRes!57352 (and tp!109096 e!763208))))

(declare-fun mapValue!57352 () ValueCell!17650)

(declare-fun mapRest!57352 () (Array (_ BitVec 32) ValueCell!17650))

(declare-fun mapKey!57352 () (_ BitVec 32))

(assert (=> mapNonEmpty!57352 (= (arr!43981 _values!1303) (store mapRest!57352 mapKey!57352 mapValue!57352))))

(declare-fun b!1339887 () Bool)

(declare-fun res!888828 () Bool)

(assert (=> b!1339887 (=> (not res!888828) (not e!763206))))

(declare-datatypes ((List!31133 0))(
  ( (Nil!31130) (Cons!31129 (h!32338 (_ BitVec 64)) (t!45465 List!31133)) )
))
(declare-fun arrayNoDuplicates!0 (array!91048 (_ BitVec 32) List!31133) Bool)

(assert (=> b!1339887 (= res!888828 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31130))))

(declare-fun b!1339888 () Bool)

(declare-fun res!888827 () Bool)

(assert (=> b!1339888 (=> (not res!888827) (not e!763206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91048 (_ BitVec 32)) Bool)

(assert (=> b!1339888 (= res!888827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339889 () Bool)

(declare-fun res!888831 () Bool)

(assert (=> b!1339889 (=> (not res!888831) (not e!763206))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339889 (= res!888831 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44530 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57352 () Bool)

(assert (=> mapIsEmpty!57352 mapRes!57352))

(declare-fun b!1339884 () Bool)

(declare-fun e!763204 () Bool)

(assert (=> b!1339884 (= e!763204 (and e!763207 mapRes!57352))))

(declare-fun condMapEmpty!57352 () Bool)

(declare-fun mapDefault!57352 () ValueCell!17650)

