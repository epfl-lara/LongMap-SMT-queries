; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113378 () Bool)

(assert start!113378)

(declare-fun b_free!31429 () Bool)

(declare-fun b_next!31429 () Bool)

(assert (=> start!113378 (= b_free!31429 (not b_next!31429))))

(declare-fun tp!110091 () Bool)

(declare-fun b_and!50711 () Bool)

(assert (=> start!113378 (= tp!110091 b_and!50711)))

(declare-fun b!1345842 () Bool)

(declare-fun e!765771 () Bool)

(declare-fun tp_is_empty!37429 () Bool)

(assert (=> b!1345842 (= e!765771 tp_is_empty!37429)))

(declare-fun b!1345843 () Bool)

(declare-fun res!893048 () Bool)

(declare-fun e!765770 () Bool)

(assert (=> b!1345843 (=> (not res!893048) (not e!765770))))

(declare-datatypes ((array!91698 0))(
  ( (array!91699 (arr!44305 (Array (_ BitVec 32) (_ BitVec 64))) (size!44855 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91698)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345843 (= res!893048 (validKeyInArray!0 (select (arr!44305 _keys!1571) from!1960)))))

(declare-fun b!1345844 () Bool)

(declare-fun res!893046 () Bool)

(assert (=> b!1345844 (=> (not res!893046) (not e!765770))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345844 (= res!893046 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!893043 () Bool)

(assert (=> start!113378 (=> (not res!893043) (not e!765770))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113378 (= res!893043 (validMask!0 mask!1977))))

(assert (=> start!113378 e!765770))

(assert (=> start!113378 tp_is_empty!37429))

(assert (=> start!113378 true))

(declare-fun array_inv!33385 (array!91698) Bool)

(assert (=> start!113378 (array_inv!33385 _keys!1571)))

(declare-datatypes ((V!55009 0))(
  ( (V!55010 (val!18789 Int)) )
))
(declare-datatypes ((ValueCell!17816 0))(
  ( (ValueCellFull!17816 (v!21437 V!55009)) (EmptyCell!17816) )
))
(declare-datatypes ((array!91700 0))(
  ( (array!91701 (arr!44306 (Array (_ BitVec 32) ValueCell!17816)) (size!44856 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91700)

(declare-fun e!765772 () Bool)

(declare-fun array_inv!33386 (array!91700) Bool)

(assert (=> start!113378 (and (array_inv!33386 _values!1303) e!765772)))

(assert (=> start!113378 tp!110091))

(declare-fun b!1345845 () Bool)

(declare-fun e!765773 () Bool)

(assert (=> b!1345845 (= e!765770 e!765773)))

(declare-fun res!893049 () Bool)

(assert (=> b!1345845 (=> (not res!893049) (not e!765773))))

(declare-datatypes ((tuple2!24222 0))(
  ( (tuple2!24223 (_1!12122 (_ BitVec 64)) (_2!12122 V!55009)) )
))
(declare-datatypes ((List!31378 0))(
  ( (Nil!31375) (Cons!31374 (h!32583 tuple2!24222) (t!45964 List!31378)) )
))
(declare-datatypes ((ListLongMap!21879 0))(
  ( (ListLongMap!21880 (toList!10955 List!31378)) )
))
(declare-fun lt!595434 () ListLongMap!21879)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun lt!595432 () V!55009)

(declare-fun contains!9131 (ListLongMap!21879 (_ BitVec 64)) Bool)

(declare-fun +!4835 (ListLongMap!21879 tuple2!24222) ListLongMap!21879)

(assert (=> b!1345845 (= res!893049 (contains!9131 (+!4835 lt!595434 (tuple2!24223 (select (arr!44305 _keys!1571) from!1960) lt!595432)) k!1142))))

(declare-fun minValue!1245 () V!55009)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55009)

(declare-fun getCurrentListMapNoExtraKeys!6477 (array!91698 array!91700 (_ BitVec 32) (_ BitVec 32) V!55009 V!55009 (_ BitVec 32) Int) ListLongMap!21879)

(assert (=> b!1345845 (= lt!595434 (getCurrentListMapNoExtraKeys!6477 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22384 (ValueCell!17816 V!55009) V!55009)

(declare-fun dynLambda!3774 (Int (_ BitVec 64)) V!55009)

(assert (=> b!1345845 (= lt!595432 (get!22384 (select (arr!44306 _values!1303) from!1960) (dynLambda!3774 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345846 () Bool)

(declare-fun res!893041 () Bool)

(assert (=> b!1345846 (=> (not res!893041) (not e!765770))))

(assert (=> b!1345846 (= res!893041 (and (= (size!44856 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44855 _keys!1571) (size!44856 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345847 () Bool)

(declare-fun e!765768 () Bool)

(assert (=> b!1345847 (= e!765768 tp_is_empty!37429)))

(declare-fun b!1345848 () Bool)

(declare-fun res!893044 () Bool)

(assert (=> b!1345848 (=> (not res!893044) (not e!765770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91698 (_ BitVec 32)) Bool)

(assert (=> b!1345848 (= res!893044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345849 () Bool)

(assert (=> b!1345849 (= e!765773 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(assert (=> b!1345849 (contains!9131 lt!595434 k!1142)))

(declare-datatypes ((Unit!44139 0))(
  ( (Unit!44140) )
))
(declare-fun lt!595433 () Unit!44139)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!400 ((_ BitVec 64) (_ BitVec 64) V!55009 ListLongMap!21879) Unit!44139)

(assert (=> b!1345849 (= lt!595433 (lemmaInListMapAfterAddingDiffThenInBefore!400 k!1142 (select (arr!44305 _keys!1571) from!1960) lt!595432 lt!595434))))

(declare-fun b!1345850 () Bool)

(declare-fun res!893040 () Bool)

(assert (=> b!1345850 (=> (not res!893040) (not e!765770))))

(declare-datatypes ((List!31379 0))(
  ( (Nil!31376) (Cons!31375 (h!32584 (_ BitVec 64)) (t!45965 List!31379)) )
))
(declare-fun arrayNoDuplicates!0 (array!91698 (_ BitVec 32) List!31379) Bool)

(assert (=> b!1345850 (= res!893040 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31376))))

(declare-fun b!1345851 () Bool)

(declare-fun res!893042 () Bool)

(assert (=> b!1345851 (=> (not res!893042) (not e!765770))))

(assert (=> b!1345851 (= res!893042 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44855 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345852 () Bool)

(declare-fun mapRes!57850 () Bool)

(assert (=> b!1345852 (= e!765772 (and e!765771 mapRes!57850))))

(declare-fun condMapEmpty!57850 () Bool)

(declare-fun mapDefault!57850 () ValueCell!17816)

