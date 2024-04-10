; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112480 () Bool)

(assert start!112480)

(declare-fun b_free!30875 () Bool)

(declare-fun b_next!30875 () Bool)

(assert (=> start!112480 (= b_free!30875 (not b_next!30875))))

(declare-fun tp!108261 () Bool)

(declare-fun b_and!49751 () Bool)

(assert (=> start!112480 (= tp!108261 b_and!49751)))

(declare-fun mapIsEmpty!56851 () Bool)

(declare-fun mapRes!56851 () Bool)

(assert (=> mapIsEmpty!56851 mapRes!56851))

(declare-fun b!1333906 () Bool)

(declare-fun e!759801 () Bool)

(assert (=> b!1333906 (= e!759801 (not true))))

(declare-datatypes ((V!54149 0))(
  ( (V!54150 (val!18467 Int)) )
))
(declare-datatypes ((tuple2!23804 0))(
  ( (tuple2!23805 (_1!11913 (_ BitVec 64)) (_2!11913 V!54149)) )
))
(declare-datatypes ((List!30948 0))(
  ( (Nil!30945) (Cons!30944 (h!32153 tuple2!23804) (t!45182 List!30948)) )
))
(declare-datatypes ((ListLongMap!21461 0))(
  ( (ListLongMap!21462 (toList!10746 List!30948)) )
))
(declare-fun lt!592227 () ListLongMap!21461)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8910 (ListLongMap!21461 (_ BitVec 64)) Bool)

(assert (=> b!1333906 (contains!8910 lt!592227 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592226 () V!54149)

(declare-datatypes ((array!90436 0))(
  ( (array!90437 (arr!43684 (Array (_ BitVec 32) (_ BitVec 64))) (size!44234 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90436)

(declare-datatypes ((Unit!43877 0))(
  ( (Unit!43878) )
))
(declare-fun lt!592228 () Unit!43877)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!301 ((_ BitVec 64) (_ BitVec 64) V!54149 ListLongMap!21461) Unit!43877)

(assert (=> b!1333906 (= lt!592228 (lemmaInListMapAfterAddingDiffThenInBefore!301 k!1153 (select (arr!43684 _keys!1590) from!1980) lt!592226 lt!592227))))

(declare-fun b!1333907 () Bool)

(declare-fun e!759800 () Bool)

(declare-fun e!759797 () Bool)

(assert (=> b!1333907 (= e!759800 (and e!759797 mapRes!56851))))

(declare-fun condMapEmpty!56851 () Bool)

(declare-datatypes ((ValueCell!17494 0))(
  ( (ValueCellFull!17494 (v!21104 V!54149)) (EmptyCell!17494) )
))
(declare-datatypes ((array!90438 0))(
  ( (array!90439 (arr!43685 (Array (_ BitVec 32) ValueCell!17494)) (size!44235 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90438)

(declare-fun mapDefault!56851 () ValueCell!17494)

