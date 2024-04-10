; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113090 () Bool)

(assert start!113090)

(declare-fun b_free!31141 () Bool)

(declare-fun b_next!31141 () Bool)

(assert (=> start!113090 (= b_free!31141 (not b_next!31141))))

(declare-fun tp!109227 () Bool)

(declare-fun b_and!50189 () Bool)

(assert (=> start!113090 (= tp!109227 b_and!50189)))

(declare-fun b!1340573 () Bool)

(declare-fun res!889305 () Bool)

(declare-fun e!763536 () Bool)

(assert (=> b!1340573 (=> (not res!889305) (not e!763536))))

(declare-datatypes ((array!91134 0))(
  ( (array!91135 (arr!44023 (Array (_ BitVec 32) (_ BitVec 64))) (size!44573 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91134)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340573 (= res!889305 (validKeyInArray!0 (select (arr!44023 _keys!1571) from!1960)))))

(declare-fun b!1340574 () Bool)

(declare-fun res!889302 () Bool)

(assert (=> b!1340574 (=> (not res!889302) (not e!763536))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1340574 (= res!889302 (not (= (select (arr!44023 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340575 () Bool)

(declare-fun e!763535 () Bool)

(declare-fun tp_is_empty!37141 () Bool)

(assert (=> b!1340575 (= e!763535 tp_is_empty!37141)))

(declare-fun b!1340576 () Bool)

(declare-fun e!763534 () Bool)

(assert (=> b!1340576 (= e!763534 tp_is_empty!37141)))

(declare-fun b!1340577 () Bool)

(declare-fun res!889307 () Bool)

(assert (=> b!1340577 (=> (not res!889307) (not e!763536))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91134 (_ BitVec 32)) Bool)

(assert (=> b!1340577 (= res!889307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340578 () Bool)

(declare-fun res!889303 () Bool)

(assert (=> b!1340578 (=> (not res!889303) (not e!763536))))

(declare-datatypes ((V!54625 0))(
  ( (V!54626 (val!18645 Int)) )
))
(declare-fun minValue!1245 () V!54625)

(declare-fun zeroValue!1245 () V!54625)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17672 0))(
  ( (ValueCellFull!17672 (v!21293 V!54625)) (EmptyCell!17672) )
))
(declare-datatypes ((array!91136 0))(
  ( (array!91137 (arr!44024 (Array (_ BitVec 32) ValueCell!17672)) (size!44574 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91136)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23998 0))(
  ( (tuple2!23999 (_1!12010 (_ BitVec 64)) (_2!12010 V!54625)) )
))
(declare-datatypes ((List!31161 0))(
  ( (Nil!31158) (Cons!31157 (h!32366 tuple2!23998) (t!45513 List!31161)) )
))
(declare-datatypes ((ListLongMap!21655 0))(
  ( (ListLongMap!21656 (toList!10843 List!31161)) )
))
(declare-fun contains!9019 (ListLongMap!21655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5811 (array!91134 array!91136 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21655)

(assert (=> b!1340578 (= res!889303 (contains!9019 (getCurrentListMap!5811 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57418 () Bool)

(declare-fun mapRes!57418 () Bool)

(declare-fun tp!109228 () Bool)

(assert (=> mapNonEmpty!57418 (= mapRes!57418 (and tp!109228 e!763535))))

(declare-fun mapRest!57418 () (Array (_ BitVec 32) ValueCell!17672))

(declare-fun mapValue!57418 () ValueCell!17672)

(declare-fun mapKey!57418 () (_ BitVec 32))

(assert (=> mapNonEmpty!57418 (= (arr!44024 _values!1303) (store mapRest!57418 mapKey!57418 mapValue!57418))))

(declare-fun b!1340579 () Bool)

(declare-fun res!889301 () Bool)

(assert (=> b!1340579 (=> (not res!889301) (not e!763536))))

(assert (=> b!1340579 (= res!889301 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!889304 () Bool)

(assert (=> start!113090 (=> (not res!889304) (not e!763536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113090 (= res!889304 (validMask!0 mask!1977))))

(assert (=> start!113090 e!763536))

(assert (=> start!113090 tp_is_empty!37141))

(assert (=> start!113090 true))

(declare-fun array_inv!33193 (array!91134) Bool)

(assert (=> start!113090 (array_inv!33193 _keys!1571)))

(declare-fun e!763537 () Bool)

(declare-fun array_inv!33194 (array!91136) Bool)

(assert (=> start!113090 (and (array_inv!33194 _values!1303) e!763537)))

(assert (=> start!113090 tp!109227))

(declare-fun b!1340580 () Bool)

(assert (=> b!1340580 (= e!763536 (not true))))

(declare-fun lt!594009 () ListLongMap!21655)

(assert (=> b!1340580 (contains!9019 lt!594009 k!1142)))

(declare-datatypes ((Unit!43995 0))(
  ( (Unit!43996) )
))
(declare-fun lt!594008 () Unit!43995)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!328 ((_ BitVec 64) (_ BitVec 64) V!54625 ListLongMap!21655) Unit!43995)

(assert (=> b!1340580 (= lt!594008 (lemmaInListMapAfterAddingDiffThenInBefore!328 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594009))))

(declare-fun +!4759 (ListLongMap!21655 tuple2!23998) ListLongMap!21655)

(declare-fun getCurrentListMapNoExtraKeys!6401 (array!91134 array!91136 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21655)

(declare-fun get!22212 (ValueCell!17672 V!54625) V!54625)

(declare-fun dynLambda!3698 (Int (_ BitVec 64)) V!54625)

(assert (=> b!1340580 (= lt!594009 (+!4759 (getCurrentListMapNoExtraKeys!6401 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23999 (select (arr!44023 _keys!1571) from!1960) (get!22212 (select (arr!44024 _values!1303) from!1960) (dynLambda!3698 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340581 () Bool)

(assert (=> b!1340581 (= e!763537 (and e!763534 mapRes!57418))))

(declare-fun condMapEmpty!57418 () Bool)

(declare-fun mapDefault!57418 () ValueCell!17672)

