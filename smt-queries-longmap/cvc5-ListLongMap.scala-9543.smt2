; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113120 () Bool)

(assert start!113120)

(declare-fun b_free!31171 () Bool)

(declare-fun b_next!31171 () Bool)

(assert (=> start!113120 (= b_free!31171 (not b_next!31171))))

(declare-fun tp!109318 () Bool)

(declare-fun b_and!50249 () Bool)

(assert (=> start!113120 (= tp!109318 b_and!50249)))

(declare-fun b!1341143 () Bool)

(declare-fun e!763761 () Bool)

(declare-fun tp_is_empty!37171 () Bool)

(assert (=> b!1341143 (= e!763761 tp_is_empty!37171)))

(declare-fun b!1341144 () Bool)

(declare-fun res!889705 () Bool)

(declare-fun e!763759 () Bool)

(assert (=> b!1341144 (=> (not res!889705) (not e!763759))))

(declare-datatypes ((array!91194 0))(
  ( (array!91195 (arr!44053 (Array (_ BitVec 32) (_ BitVec 64))) (size!44603 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91194)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91194 (_ BitVec 32)) Bool)

(assert (=> b!1341144 (= res!889705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57463 () Bool)

(declare-fun mapRes!57463 () Bool)

(assert (=> mapIsEmpty!57463 mapRes!57463))

(declare-fun b!1341145 () Bool)

(declare-fun e!763760 () Bool)

(assert (=> b!1341145 (= e!763760 tp_is_empty!37171)))

(declare-fun b!1341146 () Bool)

(declare-fun res!889712 () Bool)

(assert (=> b!1341146 (=> (not res!889712) (not e!763759))))

(declare-datatypes ((V!54665 0))(
  ( (V!54666 (val!18660 Int)) )
))
(declare-fun minValue!1245 () V!54665)

(declare-fun zeroValue!1245 () V!54665)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17687 0))(
  ( (ValueCellFull!17687 (v!21308 V!54665)) (EmptyCell!17687) )
))
(declare-datatypes ((array!91196 0))(
  ( (array!91197 (arr!44054 (Array (_ BitVec 32) ValueCell!17687)) (size!44604 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91196)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24024 0))(
  ( (tuple2!24025 (_1!12023 (_ BitVec 64)) (_2!12023 V!54665)) )
))
(declare-datatypes ((List!31185 0))(
  ( (Nil!31182) (Cons!31181 (h!32390 tuple2!24024) (t!45567 List!31185)) )
))
(declare-datatypes ((ListLongMap!21681 0))(
  ( (ListLongMap!21682 (toList!10856 List!31185)) )
))
(declare-fun contains!9032 (ListLongMap!21681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5821 (array!91194 array!91196 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21681)

(assert (=> b!1341146 (= res!889712 (contains!9032 (getCurrentListMap!5821 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341147 () Bool)

(assert (=> b!1341147 (= e!763759 (not true))))

(declare-fun lt!594098 () ListLongMap!21681)

(assert (=> b!1341147 (contains!9032 lt!594098 k!1142)))

(declare-datatypes ((Unit!44017 0))(
  ( (Unit!44018) )
))
(declare-fun lt!594099 () Unit!44017)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!339 ((_ BitVec 64) (_ BitVec 64) V!54665 ListLongMap!21681) Unit!44017)

(assert (=> b!1341147 (= lt!594099 (lemmaInListMapAfterAddingDiffThenInBefore!339 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594098))))

(declare-fun +!4770 (ListLongMap!21681 tuple2!24024) ListLongMap!21681)

(declare-fun getCurrentListMapNoExtraKeys!6412 (array!91194 array!91196 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21681)

(declare-fun get!22233 (ValueCell!17687 V!54665) V!54665)

(declare-fun dynLambda!3709 (Int (_ BitVec 64)) V!54665)

(assert (=> b!1341147 (= lt!594098 (+!4770 (getCurrentListMapNoExtraKeys!6412 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24025 (select (arr!44053 _keys!1571) from!1960) (get!22233 (select (arr!44054 _values!1303) from!1960) (dynLambda!3709 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341148 () Bool)

(declare-fun res!889710 () Bool)

(assert (=> b!1341148 (=> (not res!889710) (not e!763759))))

(assert (=> b!1341148 (= res!889710 (not (= (select (arr!44053 _keys!1571) from!1960) k!1142)))))

(declare-fun mapNonEmpty!57463 () Bool)

(declare-fun tp!109317 () Bool)

(assert (=> mapNonEmpty!57463 (= mapRes!57463 (and tp!109317 e!763760))))

(declare-fun mapKey!57463 () (_ BitVec 32))

(declare-fun mapValue!57463 () ValueCell!17687)

(declare-fun mapRest!57463 () (Array (_ BitVec 32) ValueCell!17687))

(assert (=> mapNonEmpty!57463 (= (arr!44054 _values!1303) (store mapRest!57463 mapKey!57463 mapValue!57463))))

(declare-fun b!1341149 () Bool)

(declare-fun res!889709 () Bool)

(assert (=> b!1341149 (=> (not res!889709) (not e!763759))))

(assert (=> b!1341149 (= res!889709 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44603 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!889711 () Bool)

(assert (=> start!113120 (=> (not res!889711) (not e!763759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113120 (= res!889711 (validMask!0 mask!1977))))

(assert (=> start!113120 e!763759))

(assert (=> start!113120 tp_is_empty!37171))

(assert (=> start!113120 true))

(declare-fun array_inv!33209 (array!91194) Bool)

(assert (=> start!113120 (array_inv!33209 _keys!1571)))

(declare-fun e!763763 () Bool)

(declare-fun array_inv!33210 (array!91196) Bool)

(assert (=> start!113120 (and (array_inv!33210 _values!1303) e!763763)))

(assert (=> start!113120 tp!109318))

(declare-fun b!1341150 () Bool)

(assert (=> b!1341150 (= e!763763 (and e!763761 mapRes!57463))))

(declare-fun condMapEmpty!57463 () Bool)

(declare-fun mapDefault!57463 () ValueCell!17687)

