; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112216 () Bool)

(assert start!112216)

(declare-fun b_free!30611 () Bool)

(declare-fun b_next!30611 () Bool)

(assert (=> start!112216 (= b_free!30611 (not b_next!30611))))

(declare-fun tp!107469 () Bool)

(declare-fun b_and!49277 () Bool)

(assert (=> start!112216 (= tp!107469 b_and!49277)))

(declare-fun b!1329171 () Bool)

(declare-fun res!881905 () Bool)

(declare-fun e!757783 () Bool)

(assert (=> b!1329171 (=> (not res!881905) (not e!757783))))

(declare-datatypes ((V!53797 0))(
  ( (V!53798 (val!18335 Int)) )
))
(declare-datatypes ((ValueCell!17362 0))(
  ( (ValueCellFull!17362 (v!20972 V!53797)) (EmptyCell!17362) )
))
(declare-datatypes ((array!89934 0))(
  ( (array!89935 (arr!43433 (Array (_ BitVec 32) ValueCell!17362)) (size!43983 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89934)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89936 0))(
  ( (array!89937 (arr!43434 (Array (_ BitVec 32) (_ BitVec 64))) (size!43984 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89936)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53797)

(declare-fun zeroValue!1262 () V!53797)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23604 0))(
  ( (tuple2!23605 (_1!11813 (_ BitVec 64)) (_2!11813 V!53797)) )
))
(declare-datatypes ((List!30759 0))(
  ( (Nil!30756) (Cons!30755 (h!31964 tuple2!23604) (t!44783 List!30759)) )
))
(declare-datatypes ((ListLongMap!21261 0))(
  ( (ListLongMap!21262 (toList!10646 List!30759)) )
))
(declare-fun contains!8810 (ListLongMap!21261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5636 (array!89936 array!89934 (_ BitVec 32) (_ BitVec 32) V!53797 V!53797 (_ BitVec 32) Int) ListLongMap!21261)

(assert (=> b!1329171 (= res!881905 (contains!8810 (getCurrentListMap!5636 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329172 () Bool)

(declare-fun res!881906 () Bool)

(assert (=> b!1329172 (=> (not res!881906) (not e!757783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89936 (_ BitVec 32)) Bool)

(assert (=> b!1329172 (= res!881906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881910 () Bool)

(assert (=> start!112216 (=> (not res!881910) (not e!757783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112216 (= res!881910 (validMask!0 mask!1998))))

(assert (=> start!112216 e!757783))

(declare-fun e!757786 () Bool)

(declare-fun array_inv!32771 (array!89934) Bool)

(assert (=> start!112216 (and (array_inv!32771 _values!1320) e!757786)))

(assert (=> start!112216 true))

(declare-fun array_inv!32772 (array!89936) Bool)

(assert (=> start!112216 (array_inv!32772 _keys!1590)))

(assert (=> start!112216 tp!107469))

(declare-fun tp_is_empty!36521 () Bool)

(assert (=> start!112216 tp_is_empty!36521))

(declare-fun b!1329173 () Bool)

(declare-fun res!881907 () Bool)

(assert (=> b!1329173 (=> (not res!881907) (not e!757783))))

(assert (=> b!1329173 (= res!881907 (and (= (size!43983 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43984 _keys!1590) (size!43983 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329174 () Bool)

(assert (=> b!1329174 (= e!757783 (not true))))

(declare-fun lt!590914 () ListLongMap!21261)

(assert (=> b!1329174 (contains!8810 lt!590914 k!1153)))

(declare-datatypes ((Unit!43743 0))(
  ( (Unit!43744) )
))
(declare-fun lt!590913 () Unit!43743)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!234 ((_ BitVec 64) (_ BitVec 64) V!53797 ListLongMap!21261) Unit!43743)

(assert (=> b!1329174 (= lt!590913 (lemmaInListMapAfterAddingDiffThenInBefore!234 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590914))))

(declare-fun +!4647 (ListLongMap!21261 tuple2!23604) ListLongMap!21261)

(declare-fun getCurrentListMapNoExtraKeys!6285 (array!89936 array!89934 (_ BitVec 32) (_ BitVec 32) V!53797 V!53797 (_ BitVec 32) Int) ListLongMap!21261)

(declare-fun get!21879 (ValueCell!17362 V!53797) V!53797)

(declare-fun dynLambda!3586 (Int (_ BitVec 64)) V!53797)

(assert (=> b!1329174 (= lt!590914 (+!4647 (getCurrentListMapNoExtraKeys!6285 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23605 (select (arr!43434 _keys!1590) from!1980) (get!21879 (select (arr!43433 _values!1320) from!1980) (dynLambda!3586 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329175 () Bool)

(declare-fun res!881909 () Bool)

(assert (=> b!1329175 (=> (not res!881909) (not e!757783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329175 (= res!881909 (validKeyInArray!0 (select (arr!43434 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56455 () Bool)

(declare-fun mapRes!56455 () Bool)

(declare-fun tp!107470 () Bool)

(declare-fun e!757782 () Bool)

(assert (=> mapNonEmpty!56455 (= mapRes!56455 (and tp!107470 e!757782))))

(declare-fun mapValue!56455 () ValueCell!17362)

(declare-fun mapKey!56455 () (_ BitVec 32))

(declare-fun mapRest!56455 () (Array (_ BitVec 32) ValueCell!17362))

(assert (=> mapNonEmpty!56455 (= (arr!43433 _values!1320) (store mapRest!56455 mapKey!56455 mapValue!56455))))

(declare-fun b!1329176 () Bool)

(assert (=> b!1329176 (= e!757782 tp_is_empty!36521)))

(declare-fun b!1329177 () Bool)

(declare-fun res!881908 () Bool)

(assert (=> b!1329177 (=> (not res!881908) (not e!757783))))

(declare-datatypes ((List!30760 0))(
  ( (Nil!30757) (Cons!30756 (h!31965 (_ BitVec 64)) (t!44784 List!30760)) )
))
(declare-fun arrayNoDuplicates!0 (array!89936 (_ BitVec 32) List!30760) Bool)

(assert (=> b!1329177 (= res!881908 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30757))))

(declare-fun b!1329178 () Bool)

(declare-fun e!757784 () Bool)

(assert (=> b!1329178 (= e!757784 tp_is_empty!36521)))

(declare-fun b!1329179 () Bool)

(assert (=> b!1329179 (= e!757786 (and e!757784 mapRes!56455))))

(declare-fun condMapEmpty!56455 () Bool)

(declare-fun mapDefault!56455 () ValueCell!17362)

