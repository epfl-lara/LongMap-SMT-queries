; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113156 () Bool)

(assert start!113156)

(declare-fun b_free!31207 () Bool)

(declare-fun b_next!31207 () Bool)

(assert (=> start!113156 (= b_free!31207 (not b_next!31207))))

(declare-fun tp!109425 () Bool)

(declare-fun b_and!50321 () Bool)

(assert (=> start!113156 (= tp!109425 b_and!50321)))

(declare-fun b!1341827 () Bool)

(declare-fun res!890191 () Bool)

(declare-fun e!764032 () Bool)

(assert (=> b!1341827 (=> (not res!890191) (not e!764032))))

(declare-datatypes ((array!91266 0))(
  ( (array!91267 (arr!44089 (Array (_ BitVec 32) (_ BitVec 64))) (size!44639 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91266)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91266 (_ BitVec 32)) Bool)

(assert (=> b!1341827 (= res!890191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341828 () Bool)

(declare-fun res!890193 () Bool)

(assert (=> b!1341828 (=> (not res!890193) (not e!764032))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341828 (= res!890193 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44639 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341829 () Bool)

(declare-fun e!764030 () Bool)

(declare-fun tp_is_empty!37207 () Bool)

(assert (=> b!1341829 (= e!764030 tp_is_empty!37207)))

(declare-fun b!1341830 () Bool)

(assert (=> b!1341830 (= e!764032 (not true))))

(declare-datatypes ((V!54713 0))(
  ( (V!54714 (val!18678 Int)) )
))
(declare-datatypes ((tuple2!24054 0))(
  ( (tuple2!24055 (_1!12038 (_ BitVec 64)) (_2!12038 V!54713)) )
))
(declare-datatypes ((List!31211 0))(
  ( (Nil!31208) (Cons!31207 (h!32416 tuple2!24054) (t!45629 List!31211)) )
))
(declare-datatypes ((ListLongMap!21711 0))(
  ( (ListLongMap!21712 (toList!10871 List!31211)) )
))
(declare-fun lt!594239 () ListLongMap!21711)

(declare-fun contains!9047 (ListLongMap!21711 (_ BitVec 64)) Bool)

(assert (=> b!1341830 (contains!9047 lt!594239 k!1142)))

(declare-fun lt!594240 () V!54713)

(declare-datatypes ((Unit!44043 0))(
  ( (Unit!44044) )
))
(declare-fun lt!594242 () Unit!44043)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!352 ((_ BitVec 64) (_ BitVec 64) V!54713 ListLongMap!21711) Unit!44043)

(assert (=> b!1341830 (= lt!594242 (lemmaInListMapAfterAddingDiffThenInBefore!352 k!1142 (select (arr!44089 _keys!1571) from!1960) lt!594240 lt!594239))))

(declare-fun lt!594243 () ListLongMap!21711)

(assert (=> b!1341830 (contains!9047 lt!594243 k!1142)))

(declare-fun lt!594241 () Unit!44043)

(declare-fun zeroValue!1245 () V!54713)

(assert (=> b!1341830 (= lt!594241 (lemmaInListMapAfterAddingDiffThenInBefore!352 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594243))))

(declare-fun +!4783 (ListLongMap!21711 tuple2!24054) ListLongMap!21711)

(assert (=> b!1341830 (= lt!594243 (+!4783 lt!594239 (tuple2!24055 (select (arr!44089 _keys!1571) from!1960) lt!594240)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17705 0))(
  ( (ValueCellFull!17705 (v!21326 V!54713)) (EmptyCell!17705) )
))
(declare-datatypes ((array!91268 0))(
  ( (array!91269 (arr!44090 (Array (_ BitVec 32) ValueCell!17705)) (size!44640 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91268)

(declare-fun get!22258 (ValueCell!17705 V!54713) V!54713)

(declare-fun dynLambda!3722 (Int (_ BitVec 64)) V!54713)

(assert (=> b!1341830 (= lt!594240 (get!22258 (select (arr!44090 _values!1303) from!1960) (dynLambda!3722 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54713)

(declare-fun getCurrentListMapNoExtraKeys!6425 (array!91266 array!91268 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21711)

(assert (=> b!1341830 (= lt!594239 (getCurrentListMapNoExtraKeys!6425 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341831 () Bool)

(declare-fun res!890198 () Bool)

(assert (=> b!1341831 (=> (not res!890198) (not e!764032))))

(assert (=> b!1341831 (= res!890198 (and (= (size!44640 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44639 _keys!1571) (size!44640 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341832 () Bool)

(declare-fun res!890197 () Bool)

(assert (=> b!1341832 (=> (not res!890197) (not e!764032))))

(assert (=> b!1341832 (= res!890197 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341833 () Bool)

(declare-fun res!890199 () Bool)

(assert (=> b!1341833 (=> (not res!890199) (not e!764032))))

(declare-datatypes ((List!31212 0))(
  ( (Nil!31209) (Cons!31208 (h!32417 (_ BitVec 64)) (t!45630 List!31212)) )
))
(declare-fun arrayNoDuplicates!0 (array!91266 (_ BitVec 32) List!31212) Bool)

(assert (=> b!1341833 (= res!890199 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31209))))

(declare-fun b!1341834 () Bool)

(declare-fun res!890195 () Bool)

(assert (=> b!1341834 (=> (not res!890195) (not e!764032))))

(declare-fun getCurrentListMap!5835 (array!91266 array!91268 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21711)

(assert (=> b!1341834 (= res!890195 (contains!9047 (getCurrentListMap!5835 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57517 () Bool)

(declare-fun mapRes!57517 () Bool)

(declare-fun tp!109426 () Bool)

(declare-fun e!764031 () Bool)

(assert (=> mapNonEmpty!57517 (= mapRes!57517 (and tp!109426 e!764031))))

(declare-fun mapKey!57517 () (_ BitVec 32))

(declare-fun mapValue!57517 () ValueCell!17705)

(declare-fun mapRest!57517 () (Array (_ BitVec 32) ValueCell!17705))

(assert (=> mapNonEmpty!57517 (= (arr!44090 _values!1303) (store mapRest!57517 mapKey!57517 mapValue!57517))))

(declare-fun b!1341835 () Bool)

(declare-fun res!890194 () Bool)

(assert (=> b!1341835 (=> (not res!890194) (not e!764032))))

(assert (=> b!1341835 (= res!890194 (not (= (select (arr!44089 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1341836 () Bool)

(declare-fun res!890192 () Bool)

(assert (=> b!1341836 (=> (not res!890192) (not e!764032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341836 (= res!890192 (validKeyInArray!0 (select (arr!44089 _keys!1571) from!1960)))))

(declare-fun res!890196 () Bool)

(assert (=> start!113156 (=> (not res!890196) (not e!764032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113156 (= res!890196 (validMask!0 mask!1977))))

(assert (=> start!113156 e!764032))

(assert (=> start!113156 tp_is_empty!37207))

(assert (=> start!113156 true))

(declare-fun array_inv!33233 (array!91266) Bool)

(assert (=> start!113156 (array_inv!33233 _keys!1571)))

(declare-fun e!764033 () Bool)

(declare-fun array_inv!33234 (array!91268) Bool)

(assert (=> start!113156 (and (array_inv!33234 _values!1303) e!764033)))

(assert (=> start!113156 tp!109425))

(declare-fun b!1341837 () Bool)

(assert (=> b!1341837 (= e!764031 tp_is_empty!37207)))

(declare-fun b!1341838 () Bool)

(assert (=> b!1341838 (= e!764033 (and e!764030 mapRes!57517))))

(declare-fun condMapEmpty!57517 () Bool)

(declare-fun mapDefault!57517 () ValueCell!17705)

