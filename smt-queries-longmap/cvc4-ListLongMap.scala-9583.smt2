; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113364 () Bool)

(assert start!113364)

(declare-fun b_free!31415 () Bool)

(declare-fun b_next!31415 () Bool)

(assert (=> start!113364 (= b_free!31415 (not b_next!31415))))

(declare-fun tp!110050 () Bool)

(declare-fun b_and!50683 () Bool)

(assert (=> start!113364 (= tp!110050 b_and!50683)))

(declare-fun b!1345534 () Bool)

(declare-fun res!892810 () Bool)

(declare-fun e!765645 () Bool)

(assert (=> b!1345534 (=> (not res!892810) (not e!765645))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91670 0))(
  ( (array!91671 (arr!44291 (Array (_ BitVec 32) (_ BitVec 64))) (size!44841 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91670)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345534 (= res!892810 (not (= (select (arr!44291 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345535 () Bool)

(declare-fun res!892813 () Bool)

(assert (=> b!1345535 (=> (not res!892813) (not e!765645))))

(declare-datatypes ((List!31367 0))(
  ( (Nil!31364) (Cons!31363 (h!32572 (_ BitVec 64)) (t!45939 List!31367)) )
))
(declare-fun arrayNoDuplicates!0 (array!91670 (_ BitVec 32) List!31367) Bool)

(assert (=> b!1345535 (= res!892813 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31364))))

(declare-fun mapIsEmpty!57829 () Bool)

(declare-fun mapRes!57829 () Bool)

(assert (=> mapIsEmpty!57829 mapRes!57829))

(declare-fun b!1345536 () Bool)

(declare-fun e!765646 () Bool)

(declare-fun tp_is_empty!37415 () Bool)

(assert (=> b!1345536 (= e!765646 tp_is_empty!37415)))

(declare-fun b!1345537 () Bool)

(declare-fun e!765643 () Bool)

(assert (=> b!1345537 (= e!765645 e!765643)))

(declare-fun res!892811 () Bool)

(assert (=> b!1345537 (=> (not res!892811) (not e!765643))))

(declare-datatypes ((V!54989 0))(
  ( (V!54990 (val!18782 Int)) )
))
(declare-datatypes ((tuple2!24212 0))(
  ( (tuple2!24213 (_1!12117 (_ BitVec 64)) (_2!12117 V!54989)) )
))
(declare-datatypes ((List!31368 0))(
  ( (Nil!31365) (Cons!31364 (h!32573 tuple2!24212) (t!45940 List!31368)) )
))
(declare-datatypes ((ListLongMap!21869 0))(
  ( (ListLongMap!21870 (toList!10950 List!31368)) )
))
(declare-fun lt!595369 () ListLongMap!21869)

(declare-fun lt!595370 () V!54989)

(declare-fun contains!9126 (ListLongMap!21869 (_ BitVec 64)) Bool)

(declare-fun +!4831 (ListLongMap!21869 tuple2!24212) ListLongMap!21869)

(assert (=> b!1345537 (= res!892811 (contains!9126 (+!4831 lt!595369 (tuple2!24213 (select (arr!44291 _keys!1571) from!1960) lt!595370)) k!1142))))

(declare-fun minValue!1245 () V!54989)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17809 0))(
  ( (ValueCellFull!17809 (v!21430 V!54989)) (EmptyCell!17809) )
))
(declare-datatypes ((array!91672 0))(
  ( (array!91673 (arr!44292 (Array (_ BitVec 32) ValueCell!17809)) (size!44842 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91672)

(declare-fun zeroValue!1245 () V!54989)

(declare-fun getCurrentListMapNoExtraKeys!6473 (array!91670 array!91672 (_ BitVec 32) (_ BitVec 32) V!54989 V!54989 (_ BitVec 32) Int) ListLongMap!21869)

(assert (=> b!1345537 (= lt!595369 (getCurrentListMapNoExtraKeys!6473 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22374 (ValueCell!17809 V!54989) V!54989)

(declare-fun dynLambda!3770 (Int (_ BitVec 64)) V!54989)

(assert (=> b!1345537 (= lt!595370 (get!22374 (select (arr!44292 _values!1303) from!1960) (dynLambda!3770 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57829 () Bool)

(declare-fun tp!110049 () Bool)

(declare-fun e!765642 () Bool)

(assert (=> mapNonEmpty!57829 (= mapRes!57829 (and tp!110049 e!765642))))

(declare-fun mapKey!57829 () (_ BitVec 32))

(declare-fun mapRest!57829 () (Array (_ BitVec 32) ValueCell!17809))

(declare-fun mapValue!57829 () ValueCell!17809)

(assert (=> mapNonEmpty!57829 (= (arr!44292 _values!1303) (store mapRest!57829 mapKey!57829 mapValue!57829))))

(declare-fun b!1345538 () Bool)

(declare-fun res!892812 () Bool)

(assert (=> b!1345538 (=> (not res!892812) (not e!765645))))

(assert (=> b!1345538 (= res!892812 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345539 () Bool)

(assert (=> b!1345539 (= e!765642 tp_is_empty!37415)))

(declare-fun b!1345541 () Bool)

(declare-fun res!892818 () Bool)

(assert (=> b!1345541 (=> (not res!892818) (not e!765645))))

(assert (=> b!1345541 (= res!892818 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44841 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345542 () Bool)

(declare-fun res!892809 () Bool)

(assert (=> b!1345542 (=> (not res!892809) (not e!765645))))

(declare-fun getCurrentListMap!5903 (array!91670 array!91672 (_ BitVec 32) (_ BitVec 32) V!54989 V!54989 (_ BitVec 32) Int) ListLongMap!21869)

(assert (=> b!1345542 (= res!892809 (contains!9126 (getCurrentListMap!5903 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345543 () Bool)

(declare-fun res!892815 () Bool)

(assert (=> b!1345543 (=> (not res!892815) (not e!765645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91670 (_ BitVec 32)) Bool)

(assert (=> b!1345543 (= res!892815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345544 () Bool)

(declare-fun res!892814 () Bool)

(assert (=> b!1345544 (=> (not res!892814) (not e!765645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345544 (= res!892814 (validKeyInArray!0 (select (arr!44291 _keys!1571) from!1960)))))

(declare-fun b!1345545 () Bool)

(assert (=> b!1345545 (= e!765643 (not true))))

(assert (=> b!1345545 (contains!9126 lt!595369 k!1142)))

(declare-datatypes ((Unit!44133 0))(
  ( (Unit!44134) )
))
(declare-fun lt!595371 () Unit!44133)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!397 ((_ BitVec 64) (_ BitVec 64) V!54989 ListLongMap!21869) Unit!44133)

(assert (=> b!1345545 (= lt!595371 (lemmaInListMapAfterAddingDiffThenInBefore!397 k!1142 (select (arr!44291 _keys!1571) from!1960) lt!595370 lt!595369))))

(declare-fun b!1345546 () Bool)

(declare-fun res!892816 () Bool)

(assert (=> b!1345546 (=> (not res!892816) (not e!765645))))

(assert (=> b!1345546 (= res!892816 (and (= (size!44842 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44841 _keys!1571) (size!44842 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345547 () Bool)

(declare-fun res!892808 () Bool)

(assert (=> b!1345547 (=> (not res!892808) (not e!765643))))

(assert (=> b!1345547 (= res!892808 (not (= k!1142 (select (arr!44291 _keys!1571) from!1960))))))

(declare-fun b!1345540 () Bool)

(declare-fun e!765647 () Bool)

(assert (=> b!1345540 (= e!765647 (and e!765646 mapRes!57829))))

(declare-fun condMapEmpty!57829 () Bool)

(declare-fun mapDefault!57829 () ValueCell!17809)

