; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113456 () Bool)

(assert start!113456)

(declare-fun b_free!31507 () Bool)

(declare-fun b_next!31507 () Bool)

(assert (=> start!113456 (= b_free!31507 (not b_next!31507))))

(declare-fun tp!110326 () Bool)

(declare-fun b_and!50795 () Bool)

(assert (=> start!113456 (= tp!110326 b_and!50795)))

(declare-fun b!1346898 () Bool)

(declare-fun e!766364 () Bool)

(declare-fun tp_is_empty!37507 () Bool)

(assert (=> b!1346898 (= e!766364 tp_is_empty!37507)))

(declare-fun b!1346899 () Bool)

(declare-fun res!893743 () Bool)

(declare-fun e!766360 () Bool)

(assert (=> b!1346899 (=> (not res!893743) (not e!766360))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91846 0))(
  ( (array!91847 (arr!44379 (Array (_ BitVec 32) (_ BitVec 64))) (size!44929 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91846)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346899 (= res!893743 (not (= (select (arr!44379 _keys!1571) from!1960) k!1142)))))

(declare-fun mapIsEmpty!57967 () Bool)

(declare-fun mapRes!57967 () Bool)

(assert (=> mapIsEmpty!57967 mapRes!57967))

(declare-fun b!1346900 () Bool)

(declare-fun res!893742 () Bool)

(assert (=> b!1346900 (=> (not res!893742) (not e!766360))))

(declare-datatypes ((List!31425 0))(
  ( (Nil!31422) (Cons!31421 (h!32630 (_ BitVec 64)) (t!46015 List!31425)) )
))
(declare-fun arrayNoDuplicates!0 (array!91846 (_ BitVec 32) List!31425) Bool)

(assert (=> b!1346900 (= res!893742 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31422))))

(declare-fun b!1346901 () Bool)

(declare-fun res!893744 () Bool)

(assert (=> b!1346901 (=> (not res!893744) (not e!766360))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55113 0))(
  ( (V!55114 (val!18828 Int)) )
))
(declare-datatypes ((ValueCell!17855 0))(
  ( (ValueCellFull!17855 (v!21476 V!55113)) (EmptyCell!17855) )
))
(declare-datatypes ((array!91848 0))(
  ( (array!91849 (arr!44380 (Array (_ BitVec 32) ValueCell!17855)) (size!44930 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91848)

(assert (=> b!1346901 (= res!893744 (and (= (size!44930 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44929 _keys!1571) (size!44930 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346902 () Bool)

(declare-fun res!893739 () Bool)

(assert (=> b!1346902 (=> (not res!893739) (not e!766360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346902 (= res!893739 (validKeyInArray!0 (select (arr!44379 _keys!1571) from!1960)))))

(declare-fun b!1346903 () Bool)

(declare-fun res!893740 () Bool)

(assert (=> b!1346903 (=> (not res!893740) (not e!766360))))

(assert (=> b!1346903 (= res!893740 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44929 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346904 () Bool)

(declare-fun e!766363 () Bool)

(assert (=> b!1346904 (= e!766363 tp_is_empty!37507)))

(declare-fun b!1346905 () Bool)

(declare-fun res!893738 () Bool)

(assert (=> b!1346905 (=> (not res!893738) (not e!766360))))

(declare-fun minValue!1245 () V!55113)

(declare-fun zeroValue!1245 () V!55113)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24270 0))(
  ( (tuple2!24271 (_1!12146 (_ BitVec 64)) (_2!12146 V!55113)) )
))
(declare-datatypes ((List!31426 0))(
  ( (Nil!31423) (Cons!31422 (h!32631 tuple2!24270) (t!46016 List!31426)) )
))
(declare-datatypes ((ListLongMap!21927 0))(
  ( (ListLongMap!21928 (toList!10979 List!31426)) )
))
(declare-fun contains!9155 (ListLongMap!21927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5931 (array!91846 array!91848 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21927)

(assert (=> b!1346905 (= res!893738 (contains!9155 (getCurrentListMap!5931 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!893737 () Bool)

(assert (=> start!113456 (=> (not res!893737) (not e!766360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113456 (= res!893737 (validMask!0 mask!1977))))

(assert (=> start!113456 e!766360))

(assert (=> start!113456 tp_is_empty!37507))

(assert (=> start!113456 true))

(declare-fun array_inv!33433 (array!91846) Bool)

(assert (=> start!113456 (array_inv!33433 _keys!1571)))

(declare-fun e!766361 () Bool)

(declare-fun array_inv!33434 (array!91848) Bool)

(assert (=> start!113456 (and (array_inv!33434 _values!1303) e!766361)))

(assert (=> start!113456 tp!110326))

(declare-fun b!1346897 () Bool)

(assert (=> b!1346897 (= e!766360 (bvsge from!1960 (size!44930 _values!1303)))))

(declare-fun lt!595554 () ListLongMap!21927)

(declare-fun getCurrentListMapNoExtraKeys!6480 (array!91846 array!91848 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21927)

(assert (=> b!1346897 (= lt!595554 (getCurrentListMapNoExtraKeys!6480 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57967 () Bool)

(declare-fun tp!110325 () Bool)

(assert (=> mapNonEmpty!57967 (= mapRes!57967 (and tp!110325 e!766363))))

(declare-fun mapValue!57967 () ValueCell!17855)

(declare-fun mapKey!57967 () (_ BitVec 32))

(declare-fun mapRest!57967 () (Array (_ BitVec 32) ValueCell!17855))

(assert (=> mapNonEmpty!57967 (= (arr!44380 _values!1303) (store mapRest!57967 mapKey!57967 mapValue!57967))))

(declare-fun b!1346906 () Bool)

(declare-fun res!893745 () Bool)

(assert (=> b!1346906 (=> (not res!893745) (not e!766360))))

(assert (=> b!1346906 (= res!893745 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1346907 () Bool)

(declare-fun res!893741 () Bool)

(assert (=> b!1346907 (=> (not res!893741) (not e!766360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91846 (_ BitVec 32)) Bool)

(assert (=> b!1346907 (= res!893741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346908 () Bool)

(assert (=> b!1346908 (= e!766361 (and e!766364 mapRes!57967))))

(declare-fun condMapEmpty!57967 () Bool)

(declare-fun mapDefault!57967 () ValueCell!17855)

