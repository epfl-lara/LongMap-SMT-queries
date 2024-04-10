; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113126 () Bool)

(assert start!113126)

(declare-fun b_free!31177 () Bool)

(declare-fun b_next!31177 () Bool)

(assert (=> start!113126 (= b_free!31177 (not b_next!31177))))

(declare-fun tp!109335 () Bool)

(declare-fun b_and!50261 () Bool)

(assert (=> start!113126 (= tp!109335 b_and!50261)))

(declare-fun b!1341257 () Bool)

(declare-fun res!889787 () Bool)

(declare-fun e!763807 () Bool)

(assert (=> b!1341257 (=> (not res!889787) (not e!763807))))

(declare-datatypes ((array!91206 0))(
  ( (array!91207 (arr!44059 (Array (_ BitVec 32) (_ BitVec 64))) (size!44609 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91206)

(declare-datatypes ((List!31188 0))(
  ( (Nil!31185) (Cons!31184 (h!32393 (_ BitVec 64)) (t!45576 List!31188)) )
))
(declare-fun arrayNoDuplicates!0 (array!91206 (_ BitVec 32) List!31188) Bool)

(assert (=> b!1341257 (= res!889787 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31185))))

(declare-fun b!1341258 () Bool)

(declare-fun e!763808 () Bool)

(declare-fun tp_is_empty!37177 () Bool)

(assert (=> b!1341258 (= e!763808 tp_is_empty!37177)))

(declare-fun b!1341259 () Bool)

(declare-fun res!889786 () Bool)

(assert (=> b!1341259 (=> (not res!889786) (not e!763807))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1341259 (= res!889786 (not (= (select (arr!44059 _keys!1571) from!1960) k!1142)))))

(declare-fun res!889792 () Bool)

(assert (=> start!113126 (=> (not res!889792) (not e!763807))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113126 (= res!889792 (validMask!0 mask!1977))))

(assert (=> start!113126 e!763807))

(assert (=> start!113126 tp_is_empty!37177))

(assert (=> start!113126 true))

(declare-fun array_inv!33213 (array!91206) Bool)

(assert (=> start!113126 (array_inv!33213 _keys!1571)))

(declare-datatypes ((V!54673 0))(
  ( (V!54674 (val!18663 Int)) )
))
(declare-datatypes ((ValueCell!17690 0))(
  ( (ValueCellFull!17690 (v!21311 V!54673)) (EmptyCell!17690) )
))
(declare-datatypes ((array!91208 0))(
  ( (array!91209 (arr!44060 (Array (_ BitVec 32) ValueCell!17690)) (size!44610 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91208)

(declare-fun e!763804 () Bool)

(declare-fun array_inv!33214 (array!91208) Bool)

(assert (=> start!113126 (and (array_inv!33214 _values!1303) e!763804)))

(assert (=> start!113126 tp!109335))

(declare-fun b!1341260 () Bool)

(declare-fun res!889791 () Bool)

(assert (=> b!1341260 (=> (not res!889791) (not e!763807))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341260 (= res!889791 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44609 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57472 () Bool)

(declare-fun mapRes!57472 () Bool)

(declare-fun tp!109336 () Bool)

(declare-fun e!763806 () Bool)

(assert (=> mapNonEmpty!57472 (= mapRes!57472 (and tp!109336 e!763806))))

(declare-fun mapKey!57472 () (_ BitVec 32))

(declare-fun mapValue!57472 () ValueCell!17690)

(declare-fun mapRest!57472 () (Array (_ BitVec 32) ValueCell!17690))

(assert (=> mapNonEmpty!57472 (= (arr!44060 _values!1303) (store mapRest!57472 mapKey!57472 mapValue!57472))))

(declare-fun b!1341261 () Bool)

(declare-fun res!889789 () Bool)

(assert (=> b!1341261 (=> (not res!889789) (not e!763807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341261 (= res!889789 (validKeyInArray!0 (select (arr!44059 _keys!1571) from!1960)))))

(declare-fun b!1341262 () Bool)

(declare-fun res!889793 () Bool)

(assert (=> b!1341262 (=> (not res!889793) (not e!763807))))

(declare-fun minValue!1245 () V!54673)

(declare-fun zeroValue!1245 () V!54673)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24028 0))(
  ( (tuple2!24029 (_1!12025 (_ BitVec 64)) (_2!12025 V!54673)) )
))
(declare-datatypes ((List!31189 0))(
  ( (Nil!31186) (Cons!31185 (h!32394 tuple2!24028) (t!45577 List!31189)) )
))
(declare-datatypes ((ListLongMap!21685 0))(
  ( (ListLongMap!21686 (toList!10858 List!31189)) )
))
(declare-fun contains!9034 (ListLongMap!21685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5823 (array!91206 array!91208 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21685)

(assert (=> b!1341262 (= res!889793 (contains!9034 (getCurrentListMap!5823 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341263 () Bool)

(declare-fun res!889788 () Bool)

(assert (=> b!1341263 (=> (not res!889788) (not e!763807))))

(assert (=> b!1341263 (= res!889788 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341264 () Bool)

(assert (=> b!1341264 (= e!763807 (not true))))

(declare-fun lt!594116 () ListLongMap!21685)

(assert (=> b!1341264 (contains!9034 lt!594116 k!1142)))

(declare-datatypes ((Unit!44021 0))(
  ( (Unit!44022) )
))
(declare-fun lt!594117 () Unit!44021)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!341 ((_ BitVec 64) (_ BitVec 64) V!54673 ListLongMap!21685) Unit!44021)

(assert (=> b!1341264 (= lt!594117 (lemmaInListMapAfterAddingDiffThenInBefore!341 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594116))))

(declare-fun +!4772 (ListLongMap!21685 tuple2!24028) ListLongMap!21685)

(declare-fun getCurrentListMapNoExtraKeys!6414 (array!91206 array!91208 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21685)

(declare-fun get!22237 (ValueCell!17690 V!54673) V!54673)

(declare-fun dynLambda!3711 (Int (_ BitVec 64)) V!54673)

(assert (=> b!1341264 (= lt!594116 (+!4772 (getCurrentListMapNoExtraKeys!6414 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24029 (select (arr!44059 _keys!1571) from!1960) (get!22237 (select (arr!44060 _values!1303) from!1960) (dynLambda!3711 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341265 () Bool)

(assert (=> b!1341265 (= e!763806 tp_is_empty!37177)))

(declare-fun b!1341266 () Bool)

(assert (=> b!1341266 (= e!763804 (and e!763808 mapRes!57472))))

(declare-fun condMapEmpty!57472 () Bool)

(declare-fun mapDefault!57472 () ValueCell!17690)

