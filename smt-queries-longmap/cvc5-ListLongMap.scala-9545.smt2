; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113132 () Bool)

(assert start!113132)

(declare-fun b_free!31183 () Bool)

(declare-fun b_next!31183 () Bool)

(assert (=> start!113132 (= b_free!31183 (not b_next!31183))))

(declare-fun tp!109354 () Bool)

(declare-fun b_and!50273 () Bool)

(assert (=> start!113132 (= tp!109354 b_and!50273)))

(declare-fun b!1341371 () Bool)

(declare-fun res!889868 () Bool)

(declare-fun e!763850 () Bool)

(assert (=> b!1341371 (=> (not res!889868) (not e!763850))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91218 0))(
  ( (array!91219 (arr!44065 (Array (_ BitVec 32) (_ BitVec 64))) (size!44615 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91218)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341371 (= res!889868 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44615 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57481 () Bool)

(declare-fun mapRes!57481 () Bool)

(assert (=> mapIsEmpty!57481 mapRes!57481))

(declare-fun b!1341372 () Bool)

(declare-fun res!889873 () Bool)

(assert (=> b!1341372 (=> (not res!889873) (not e!763850))))

(assert (=> b!1341372 (= res!889873 (not (= (select (arr!44065 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1341373 () Bool)

(declare-fun res!889871 () Bool)

(assert (=> b!1341373 (=> (not res!889871) (not e!763850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341373 (= res!889871 (validKeyInArray!0 (select (arr!44065 _keys!1571) from!1960)))))

(declare-fun b!1341374 () Bool)

(assert (=> b!1341374 (= e!763850 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54681 0))(
  ( (V!54682 (val!18666 Int)) )
))
(declare-datatypes ((tuple2!24034 0))(
  ( (tuple2!24035 (_1!12028 (_ BitVec 64)) (_2!12028 V!54681)) )
))
(declare-datatypes ((List!31193 0))(
  ( (Nil!31190) (Cons!31189 (h!32398 tuple2!24034) (t!45587 List!31193)) )
))
(declare-datatypes ((ListLongMap!21691 0))(
  ( (ListLongMap!21692 (toList!10861 List!31193)) )
))
(declare-fun lt!594134 () ListLongMap!21691)

(declare-fun contains!9037 (ListLongMap!21691 (_ BitVec 64)) Bool)

(assert (=> b!1341374 (contains!9037 lt!594134 k!1142)))

(declare-datatypes ((Unit!44025 0))(
  ( (Unit!44026) )
))
(declare-fun lt!594135 () Unit!44025)

(declare-fun zeroValue!1245 () V!54681)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!343 ((_ BitVec 64) (_ BitVec 64) V!54681 ListLongMap!21691) Unit!44025)

(assert (=> b!1341374 (= lt!594135 (lemmaInListMapAfterAddingDiffThenInBefore!343 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594134))))

(declare-fun minValue!1245 () V!54681)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17693 0))(
  ( (ValueCellFull!17693 (v!21314 V!54681)) (EmptyCell!17693) )
))
(declare-datatypes ((array!91220 0))(
  ( (array!91221 (arr!44066 (Array (_ BitVec 32) ValueCell!17693)) (size!44616 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91220)

(declare-fun +!4774 (ListLongMap!21691 tuple2!24034) ListLongMap!21691)

(declare-fun getCurrentListMapNoExtraKeys!6416 (array!91218 array!91220 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21691)

(declare-fun get!22241 (ValueCell!17693 V!54681) V!54681)

(declare-fun dynLambda!3713 (Int (_ BitVec 64)) V!54681)

(assert (=> b!1341374 (= lt!594134 (+!4774 (getCurrentListMapNoExtraKeys!6416 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24035 (select (arr!44065 _keys!1571) from!1960) (get!22241 (select (arr!44066 _values!1303) from!1960) (dynLambda!3713 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341375 () Bool)

(declare-fun e!763852 () Bool)

(declare-fun tp_is_empty!37183 () Bool)

(assert (=> b!1341375 (= e!763852 tp_is_empty!37183)))

(declare-fun mapNonEmpty!57481 () Bool)

(declare-fun tp!109353 () Bool)

(declare-fun e!763851 () Bool)

(assert (=> mapNonEmpty!57481 (= mapRes!57481 (and tp!109353 e!763851))))

(declare-fun mapKey!57481 () (_ BitVec 32))

(declare-fun mapRest!57481 () (Array (_ BitVec 32) ValueCell!17693))

(declare-fun mapValue!57481 () ValueCell!17693)

(assert (=> mapNonEmpty!57481 (= (arr!44066 _values!1303) (store mapRest!57481 mapKey!57481 mapValue!57481))))

(declare-fun b!1341376 () Bool)

(declare-fun res!889870 () Bool)

(assert (=> b!1341376 (=> (not res!889870) (not e!763850))))

(assert (=> b!1341376 (= res!889870 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!889874 () Bool)

(assert (=> start!113132 (=> (not res!889874) (not e!763850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113132 (= res!889874 (validMask!0 mask!1977))))

(assert (=> start!113132 e!763850))

(assert (=> start!113132 tp_is_empty!37183))

(assert (=> start!113132 true))

(declare-fun array_inv!33217 (array!91218) Bool)

(assert (=> start!113132 (array_inv!33217 _keys!1571)))

(declare-fun e!763853 () Bool)

(declare-fun array_inv!33218 (array!91220) Bool)

(assert (=> start!113132 (and (array_inv!33218 _values!1303) e!763853)))

(assert (=> start!113132 tp!109354))

(declare-fun b!1341377 () Bool)

(declare-fun res!889867 () Bool)

(assert (=> b!1341377 (=> (not res!889867) (not e!763850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91218 (_ BitVec 32)) Bool)

(assert (=> b!1341377 (= res!889867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341378 () Bool)

(declare-fun res!889872 () Bool)

(assert (=> b!1341378 (=> (not res!889872) (not e!763850))))

(declare-fun getCurrentListMap!5826 (array!91218 array!91220 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21691)

(assert (=> b!1341378 (= res!889872 (contains!9037 (getCurrentListMap!5826 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341379 () Bool)

(assert (=> b!1341379 (= e!763853 (and e!763852 mapRes!57481))))

(declare-fun condMapEmpty!57481 () Bool)

(declare-fun mapDefault!57481 () ValueCell!17693)

