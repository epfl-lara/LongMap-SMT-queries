; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113138 () Bool)

(assert start!113138)

(declare-fun b_free!31189 () Bool)

(declare-fun b_next!31189 () Bool)

(assert (=> start!113138 (= b_free!31189 (not b_next!31189))))

(declare-fun tp!109372 () Bool)

(declare-fun b_and!50285 () Bool)

(assert (=> start!113138 (= tp!109372 b_and!50285)))

(declare-fun b!1341485 () Bool)

(declare-fun e!763896 () Bool)

(assert (=> b!1341485 (= e!763896 (not true))))

(declare-datatypes ((V!54689 0))(
  ( (V!54690 (val!18669 Int)) )
))
(declare-datatypes ((tuple2!24040 0))(
  ( (tuple2!24041 (_1!12031 (_ BitVec 64)) (_2!12031 V!54689)) )
))
(declare-datatypes ((List!31198 0))(
  ( (Nil!31195) (Cons!31194 (h!32403 tuple2!24040) (t!45598 List!31198)) )
))
(declare-datatypes ((ListLongMap!21697 0))(
  ( (ListLongMap!21698 (toList!10864 List!31198)) )
))
(declare-fun lt!594152 () ListLongMap!21697)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9040 (ListLongMap!21697 (_ BitVec 64)) Bool)

(assert (=> b!1341485 (contains!9040 lt!594152 k!1142)))

(declare-datatypes ((Unit!44031 0))(
  ( (Unit!44032) )
))
(declare-fun lt!594153 () Unit!44031)

(declare-fun zeroValue!1245 () V!54689)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!346 ((_ BitVec 64) (_ BitVec 64) V!54689 ListLongMap!21697) Unit!44031)

(assert (=> b!1341485 (= lt!594153 (lemmaInListMapAfterAddingDiffThenInBefore!346 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594152))))

(declare-fun minValue!1245 () V!54689)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91230 0))(
  ( (array!91231 (arr!44071 (Array (_ BitVec 32) (_ BitVec 64))) (size!44621 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91230)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17696 0))(
  ( (ValueCellFull!17696 (v!21317 V!54689)) (EmptyCell!17696) )
))
(declare-datatypes ((array!91232 0))(
  ( (array!91233 (arr!44072 (Array (_ BitVec 32) ValueCell!17696)) (size!44622 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91232)

(declare-fun +!4777 (ListLongMap!21697 tuple2!24040) ListLongMap!21697)

(declare-fun getCurrentListMapNoExtraKeys!6419 (array!91230 array!91232 (_ BitVec 32) (_ BitVec 32) V!54689 V!54689 (_ BitVec 32) Int) ListLongMap!21697)

(declare-fun get!22246 (ValueCell!17696 V!54689) V!54689)

(declare-fun dynLambda!3716 (Int (_ BitVec 64)) V!54689)

(assert (=> b!1341485 (= lt!594152 (+!4777 (getCurrentListMapNoExtraKeys!6419 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24041 (select (arr!44071 _keys!1571) from!1960) (get!22246 (select (arr!44072 _values!1303) from!1960) (dynLambda!3716 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!889951 () Bool)

(assert (=> start!113138 (=> (not res!889951) (not e!763896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113138 (= res!889951 (validMask!0 mask!1977))))

(assert (=> start!113138 e!763896))

(declare-fun tp_is_empty!37189 () Bool)

(assert (=> start!113138 tp_is_empty!37189))

(assert (=> start!113138 true))

(declare-fun array_inv!33221 (array!91230) Bool)

(assert (=> start!113138 (array_inv!33221 _keys!1571)))

(declare-fun e!763894 () Bool)

(declare-fun array_inv!33222 (array!91232) Bool)

(assert (=> start!113138 (and (array_inv!33222 _values!1303) e!763894)))

(assert (=> start!113138 tp!109372))

(declare-fun b!1341486 () Bool)

(declare-fun e!763895 () Bool)

(declare-fun mapRes!57490 () Bool)

(assert (=> b!1341486 (= e!763894 (and e!763895 mapRes!57490))))

(declare-fun condMapEmpty!57490 () Bool)

(declare-fun mapDefault!57490 () ValueCell!17696)

