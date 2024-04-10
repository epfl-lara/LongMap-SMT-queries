; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113544 () Bool)

(assert start!113544)

(declare-fun b_free!31537 () Bool)

(declare-fun b_next!31537 () Bool)

(assert (=> start!113544 (= b_free!31537 (not b_next!31537))))

(declare-fun tp!110420 () Bool)

(declare-fun b_and!50863 () Bool)

(assert (=> start!113544 (= tp!110420 b_and!50863)))

(declare-fun mapNonEmpty!58016 () Bool)

(declare-fun mapRes!58016 () Bool)

(declare-fun tp!110419 () Bool)

(declare-fun e!766831 () Bool)

(assert (=> mapNonEmpty!58016 (= mapRes!58016 (and tp!110419 e!766831))))

(declare-fun mapKey!58016 () (_ BitVec 32))

(declare-datatypes ((V!55153 0))(
  ( (V!55154 (val!18843 Int)) )
))
(declare-datatypes ((ValueCell!17870 0))(
  ( (ValueCellFull!17870 (v!21494 V!55153)) (EmptyCell!17870) )
))
(declare-fun mapValue!58016 () ValueCell!17870)

(declare-fun mapRest!58016 () (Array (_ BitVec 32) ValueCell!17870))

(declare-datatypes ((array!91906 0))(
  ( (array!91907 (arr!44408 (Array (_ BitVec 32) ValueCell!17870)) (size!44958 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91906)

(assert (=> mapNonEmpty!58016 (= (arr!44408 _values!1303) (store mapRest!58016 mapKey!58016 mapValue!58016))))

(declare-fun res!894305 () Bool)

(declare-fun e!766832 () Bool)

(assert (=> start!113544 (=> (not res!894305) (not e!766832))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113544 (= res!894305 (validMask!0 mask!1977))))

(assert (=> start!113544 e!766832))

(declare-fun tp_is_empty!37537 () Bool)

(assert (=> start!113544 tp_is_empty!37537))

(assert (=> start!113544 true))

(declare-datatypes ((array!91908 0))(
  ( (array!91909 (arr!44409 (Array (_ BitVec 32) (_ BitVec 64))) (size!44959 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91908)

(declare-fun array_inv!33455 (array!91908) Bool)

(assert (=> start!113544 (array_inv!33455 _keys!1571)))

(declare-fun e!766828 () Bool)

(declare-fun array_inv!33456 (array!91906) Bool)

(assert (=> start!113544 (and (array_inv!33456 _values!1303) e!766828)))

(assert (=> start!113544 tp!110420))

(declare-fun b!1347845 () Bool)

(declare-fun res!894307 () Bool)

(assert (=> b!1347845 (=> (not res!894307) (not e!766832))))

(declare-fun minValue!1245 () V!55153)

(declare-fun zeroValue!1245 () V!55153)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24292 0))(
  ( (tuple2!24293 (_1!12157 (_ BitVec 64)) (_2!12157 V!55153)) )
))
(declare-datatypes ((List!31447 0))(
  ( (Nil!31444) (Cons!31443 (h!32652 tuple2!24292) (t!46063 List!31447)) )
))
(declare-datatypes ((ListLongMap!21949 0))(
  ( (ListLongMap!21950 (toList!10990 List!31447)) )
))
(declare-fun contains!9168 (ListLongMap!21949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5941 (array!91908 array!91906 (_ BitVec 32) (_ BitVec 32) V!55153 V!55153 (_ BitVec 32) Int) ListLongMap!21949)

(assert (=> b!1347845 (= res!894307 (contains!9168 (getCurrentListMap!5941 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1347846 () Bool)

(declare-fun res!894311 () Bool)

(assert (=> b!1347846 (=> (not res!894311) (not e!766832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347846 (= res!894311 (validKeyInArray!0 (select (arr!44409 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!58016 () Bool)

(assert (=> mapIsEmpty!58016 mapRes!58016))

(declare-fun b!1347847 () Bool)

(declare-fun res!894309 () Bool)

(assert (=> b!1347847 (=> (not res!894309) (not e!766832))))

(assert (=> b!1347847 (= res!894309 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347848 () Bool)

(declare-fun res!894306 () Bool)

(assert (=> b!1347848 (=> (not res!894306) (not e!766832))))

(assert (=> b!1347848 (= res!894306 (not (= (select (arr!44409 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1347849 () Bool)

(declare-fun res!894308 () Bool)

(assert (=> b!1347849 (=> (not res!894308) (not e!766832))))

(assert (=> b!1347849 (= res!894308 (and (= (size!44958 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44959 _keys!1571) (size!44958 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347850 () Bool)

(declare-fun res!894303 () Bool)

(assert (=> b!1347850 (=> (not res!894303) (not e!766832))))

(assert (=> b!1347850 (= res!894303 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44959 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347851 () Bool)

(assert (=> b!1347851 (= e!766831 tp_is_empty!37537)))

(declare-fun b!1347852 () Bool)

(declare-fun res!894304 () Bool)

(assert (=> b!1347852 (=> (not res!894304) (not e!766832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91908 (_ BitVec 32)) Bool)

(assert (=> b!1347852 (= res!894304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347853 () Bool)

(declare-fun res!894310 () Bool)

(assert (=> b!1347853 (=> (not res!894310) (not e!766832))))

(declare-datatypes ((List!31448 0))(
  ( (Nil!31445) (Cons!31444 (h!32653 (_ BitVec 64)) (t!46064 List!31448)) )
))
(declare-fun arrayNoDuplicates!0 (array!91908 (_ BitVec 32) List!31448) Bool)

(assert (=> b!1347853 (= res!894310 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31445))))

(declare-fun b!1347854 () Bool)

(declare-fun e!766830 () Bool)

(assert (=> b!1347854 (= e!766828 (and e!766830 mapRes!58016))))

(declare-fun condMapEmpty!58016 () Bool)

(declare-fun mapDefault!58016 () ValueCell!17870)

