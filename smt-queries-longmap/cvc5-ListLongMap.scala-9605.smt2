; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113550 () Bool)

(assert start!113550)

(declare-fun b_free!31543 () Bool)

(declare-fun b_next!31543 () Bool)

(assert (=> start!113550 (= b_free!31543 (not b_next!31543))))

(declare-fun tp!110438 () Bool)

(declare-fun b_and!50875 () Bool)

(assert (=> start!113550 (= tp!110438 b_and!50875)))

(declare-fun b!1347959 () Bool)

(declare-fun e!766874 () Bool)

(declare-fun tp_is_empty!37543 () Bool)

(assert (=> b!1347959 (= e!766874 tp_is_empty!37543)))

(declare-fun b!1347960 () Bool)

(declare-fun e!766873 () Bool)

(assert (=> b!1347960 (= e!766873 tp_is_empty!37543)))

(declare-fun b!1347962 () Bool)

(declare-fun res!894384 () Bool)

(declare-fun e!766876 () Bool)

(assert (=> b!1347962 (=> (not res!894384) (not e!766876))))

(declare-datatypes ((array!91916 0))(
  ( (array!91917 (arr!44413 (Array (_ BitVec 32) (_ BitVec 64))) (size!44963 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91916)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347962 (= res!894384 (validKeyInArray!0 (select (arr!44413 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!58025 () Bool)

(declare-fun mapRes!58025 () Bool)

(assert (=> mapIsEmpty!58025 mapRes!58025))

(declare-fun b!1347963 () Bool)

(declare-fun res!894390 () Bool)

(assert (=> b!1347963 (=> (not res!894390) (not e!766876))))

(declare-datatypes ((List!31451 0))(
  ( (Nil!31448) (Cons!31447 (h!32656 (_ BitVec 64)) (t!46073 List!31451)) )
))
(declare-fun arrayNoDuplicates!0 (array!91916 (_ BitVec 32) List!31451) Bool)

(assert (=> b!1347963 (= res!894390 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31448))))

(declare-fun mapNonEmpty!58025 () Bool)

(declare-fun tp!110437 () Bool)

(assert (=> mapNonEmpty!58025 (= mapRes!58025 (and tp!110437 e!766873))))

(declare-datatypes ((V!55161 0))(
  ( (V!55162 (val!18846 Int)) )
))
(declare-datatypes ((ValueCell!17873 0))(
  ( (ValueCellFull!17873 (v!21497 V!55161)) (EmptyCell!17873) )
))
(declare-fun mapValue!58025 () ValueCell!17873)

(declare-fun mapKey!58025 () (_ BitVec 32))

(declare-fun mapRest!58025 () (Array (_ BitVec 32) ValueCell!17873))

(declare-datatypes ((array!91918 0))(
  ( (array!91919 (arr!44414 (Array (_ BitVec 32) ValueCell!17873)) (size!44964 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91918)

(assert (=> mapNonEmpty!58025 (= (arr!44414 _values!1303) (store mapRest!58025 mapKey!58025 mapValue!58025))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun b!1347964 () Bool)

(assert (=> b!1347964 (= e!766876 (not (not (= k!1142 (select (arr!44413 _keys!1571) from!1960)))))))

(declare-datatypes ((tuple2!24296 0))(
  ( (tuple2!24297 (_1!12159 (_ BitVec 64)) (_2!12159 V!55161)) )
))
(declare-datatypes ((List!31452 0))(
  ( (Nil!31449) (Cons!31448 (h!32657 tuple2!24296) (t!46074 List!31452)) )
))
(declare-datatypes ((ListLongMap!21953 0))(
  ( (ListLongMap!21954 (toList!10992 List!31452)) )
))
(declare-fun lt!595888 () ListLongMap!21953)

(declare-fun contains!9170 (ListLongMap!21953 (_ BitVec 64)) Bool)

(assert (=> b!1347964 (contains!9170 lt!595888 k!1142)))

(declare-datatypes ((Unit!44164 0))(
  ( (Unit!44165) )
))
(declare-fun lt!595887 () Unit!44164)

(declare-fun zeroValue!1245 () V!55161)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!405 ((_ BitVec 64) (_ BitVec 64) V!55161 ListLongMap!21953) Unit!44164)

(assert (=> b!1347964 (= lt!595887 (lemmaInListMapAfterAddingDiffThenInBefore!405 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595888))))

(declare-fun minValue!1245 () V!55161)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun +!4844 (ListLongMap!21953 tuple2!24296) ListLongMap!21953)

(declare-fun getCurrentListMapNoExtraKeys!6490 (array!91916 array!91918 (_ BitVec 32) (_ BitVec 32) V!55161 V!55161 (_ BitVec 32) Int) ListLongMap!21953)

(declare-fun get!22434 (ValueCell!17873 V!55161) V!55161)

(declare-fun dynLambda!3783 (Int (_ BitVec 64)) V!55161)

(assert (=> b!1347964 (= lt!595888 (+!4844 (getCurrentListMapNoExtraKeys!6490 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24297 (select (arr!44413 _keys!1571) from!1960) (get!22434 (select (arr!44414 _values!1303) from!1960) (dynLambda!3783 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347965 () Bool)

(declare-fun res!894387 () Bool)

(assert (=> b!1347965 (=> (not res!894387) (not e!766876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91916 (_ BitVec 32)) Bool)

(assert (=> b!1347965 (= res!894387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347966 () Bool)

(declare-fun res!894385 () Bool)

(assert (=> b!1347966 (=> (not res!894385) (not e!766876))))

(assert (=> b!1347966 (= res!894385 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347961 () Bool)

(declare-fun res!894392 () Bool)

(assert (=> b!1347961 (=> (not res!894392) (not e!766876))))

(assert (=> b!1347961 (= res!894392 (not (= (select (arr!44413 _keys!1571) from!1960) k!1142)))))

(declare-fun res!894388 () Bool)

(assert (=> start!113550 (=> (not res!894388) (not e!766876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113550 (= res!894388 (validMask!0 mask!1977))))

(assert (=> start!113550 e!766876))

(assert (=> start!113550 tp_is_empty!37543))

(assert (=> start!113550 true))

(declare-fun array_inv!33459 (array!91916) Bool)

(assert (=> start!113550 (array_inv!33459 _keys!1571)))

(declare-fun e!766875 () Bool)

(declare-fun array_inv!33460 (array!91918) Bool)

(assert (=> start!113550 (and (array_inv!33460 _values!1303) e!766875)))

(assert (=> start!113550 tp!110438))

(declare-fun b!1347967 () Bool)

(declare-fun res!894391 () Bool)

(assert (=> b!1347967 (=> (not res!894391) (not e!766876))))

(assert (=> b!1347967 (= res!894391 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44963 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347968 () Bool)

(declare-fun res!894386 () Bool)

(assert (=> b!1347968 (=> (not res!894386) (not e!766876))))

(assert (=> b!1347968 (= res!894386 (and (= (size!44964 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44963 _keys!1571) (size!44964 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347969 () Bool)

(assert (=> b!1347969 (= e!766875 (and e!766874 mapRes!58025))))

(declare-fun condMapEmpty!58025 () Bool)

(declare-fun mapDefault!58025 () ValueCell!17873)

