; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113136 () Bool)

(assert start!113136)

(declare-fun b_free!31187 () Bool)

(declare-fun b_next!31187 () Bool)

(assert (=> start!113136 (= b_free!31187 (not b_next!31187))))

(declare-fun tp!109366 () Bool)

(declare-fun b_and!50281 () Bool)

(assert (=> start!113136 (= tp!109366 b_and!50281)))

(declare-fun b!1341447 () Bool)

(declare-fun res!889929 () Bool)

(declare-fun e!763880 () Bool)

(assert (=> b!1341447 (=> (not res!889929) (not e!763880))))

(declare-datatypes ((array!91226 0))(
  ( (array!91227 (arr!44069 (Array (_ BitVec 32) (_ BitVec 64))) (size!44619 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91226)

(declare-datatypes ((List!31196 0))(
  ( (Nil!31193) (Cons!31192 (h!32401 (_ BitVec 64)) (t!45594 List!31196)) )
))
(declare-fun arrayNoDuplicates!0 (array!91226 (_ BitVec 32) List!31196) Bool)

(assert (=> b!1341447 (= res!889929 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31193))))

(declare-fun b!1341448 () Bool)

(declare-fun res!889926 () Bool)

(assert (=> b!1341448 (=> (not res!889926) (not e!763880))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341448 (= res!889926 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44619 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341449 () Bool)

(declare-fun res!889924 () Bool)

(assert (=> b!1341449 (=> (not res!889924) (not e!763880))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91226 (_ BitVec 32)) Bool)

(assert (=> b!1341449 (= res!889924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341450 () Bool)

(assert (=> b!1341450 (= e!763880 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54685 0))(
  ( (V!54686 (val!18668 Int)) )
))
(declare-datatypes ((tuple2!24038 0))(
  ( (tuple2!24039 (_1!12030 (_ BitVec 64)) (_2!12030 V!54685)) )
))
(declare-datatypes ((List!31197 0))(
  ( (Nil!31194) (Cons!31193 (h!32402 tuple2!24038) (t!45595 List!31197)) )
))
(declare-datatypes ((ListLongMap!21695 0))(
  ( (ListLongMap!21696 (toList!10863 List!31197)) )
))
(declare-fun lt!594147 () ListLongMap!21695)

(declare-fun contains!9039 (ListLongMap!21695 (_ BitVec 64)) Bool)

(assert (=> b!1341450 (contains!9039 lt!594147 k!1142)))

(declare-datatypes ((Unit!44029 0))(
  ( (Unit!44030) )
))
(declare-fun lt!594146 () Unit!44029)

(declare-fun zeroValue!1245 () V!54685)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!345 ((_ BitVec 64) (_ BitVec 64) V!54685 ListLongMap!21695) Unit!44029)

(assert (=> b!1341450 (= lt!594146 (lemmaInListMapAfterAddingDiffThenInBefore!345 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594147))))

(declare-fun minValue!1245 () V!54685)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17695 0))(
  ( (ValueCellFull!17695 (v!21316 V!54685)) (EmptyCell!17695) )
))
(declare-datatypes ((array!91228 0))(
  ( (array!91229 (arr!44070 (Array (_ BitVec 32) ValueCell!17695)) (size!44620 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91228)

(declare-fun +!4776 (ListLongMap!21695 tuple2!24038) ListLongMap!21695)

(declare-fun getCurrentListMapNoExtraKeys!6418 (array!91226 array!91228 (_ BitVec 32) (_ BitVec 32) V!54685 V!54685 (_ BitVec 32) Int) ListLongMap!21695)

(declare-fun get!22243 (ValueCell!17695 V!54685) V!54685)

(declare-fun dynLambda!3715 (Int (_ BitVec 64)) V!54685)

(assert (=> b!1341450 (= lt!594147 (+!4776 (getCurrentListMapNoExtraKeys!6418 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24039 (select (arr!44069 _keys!1571) from!1960) (get!22243 (select (arr!44070 _values!1303) from!1960) (dynLambda!3715 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341451 () Bool)

(declare-fun res!889921 () Bool)

(assert (=> b!1341451 (=> (not res!889921) (not e!763880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341451 (= res!889921 (validKeyInArray!0 (select (arr!44069 _keys!1571) from!1960)))))

(declare-fun b!1341452 () Bool)

(declare-fun e!763879 () Bool)

(declare-fun tp_is_empty!37187 () Bool)

(assert (=> b!1341452 (= e!763879 tp_is_empty!37187)))

(declare-fun b!1341453 () Bool)

(declare-fun res!889925 () Bool)

(assert (=> b!1341453 (=> (not res!889925) (not e!763880))))

(declare-fun getCurrentListMap!5828 (array!91226 array!91228 (_ BitVec 32) (_ BitVec 32) V!54685 V!54685 (_ BitVec 32) Int) ListLongMap!21695)

(assert (=> b!1341453 (= res!889925 (contains!9039 (getCurrentListMap!5828 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341454 () Bool)

(declare-fun e!763882 () Bool)

(declare-fun e!763881 () Bool)

(declare-fun mapRes!57487 () Bool)

(assert (=> b!1341454 (= e!763882 (and e!763881 mapRes!57487))))

(declare-fun condMapEmpty!57487 () Bool)

(declare-fun mapDefault!57487 () ValueCell!17695)

