; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112176 () Bool)

(assert start!112176)

(declare-fun b_free!30571 () Bool)

(declare-fun b_next!30571 () Bool)

(assert (=> start!112176 (= b_free!30571 (not b_next!30571))))

(declare-fun tp!107349 () Bool)

(declare-fun b_and!49221 () Bool)

(assert (=> start!112176 (= tp!107349 b_and!49221)))

(declare-fun res!881478 () Bool)

(declare-fun e!757485 () Bool)

(assert (=> start!112176 (=> (not res!881478) (not e!757485))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112176 (= res!881478 (validMask!0 mask!1998))))

(assert (=> start!112176 e!757485))

(declare-datatypes ((V!53745 0))(
  ( (V!53746 (val!18315 Int)) )
))
(declare-datatypes ((ValueCell!17342 0))(
  ( (ValueCellFull!17342 (v!20952 V!53745)) (EmptyCell!17342) )
))
(declare-datatypes ((array!89856 0))(
  ( (array!89857 (arr!43394 (Array (_ BitVec 32) ValueCell!17342)) (size!43944 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89856)

(declare-fun e!757483 () Bool)

(declare-fun array_inv!32741 (array!89856) Bool)

(assert (=> start!112176 (and (array_inv!32741 _values!1320) e!757483)))

(assert (=> start!112176 true))

(declare-datatypes ((array!89858 0))(
  ( (array!89859 (arr!43395 (Array (_ BitVec 32) (_ BitVec 64))) (size!43945 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89858)

(declare-fun array_inv!32742 (array!89858) Bool)

(assert (=> start!112176 (array_inv!32742 _keys!1590)))

(assert (=> start!112176 tp!107349))

(declare-fun tp_is_empty!36481 () Bool)

(assert (=> start!112176 tp_is_empty!36481))

(declare-fun b!1328544 () Bool)

(assert (=> b!1328544 (= e!757485 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53745)

(declare-fun lt!590854 () Bool)

(declare-fun zeroValue!1262 () V!53745)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23574 0))(
  ( (tuple2!23575 (_1!11798 (_ BitVec 64)) (_2!11798 V!53745)) )
))
(declare-datatypes ((List!30731 0))(
  ( (Nil!30728) (Cons!30727 (h!31936 tuple2!23574) (t!44737 List!30731)) )
))
(declare-datatypes ((ListLongMap!21231 0))(
  ( (ListLongMap!21232 (toList!10631 List!30731)) )
))
(declare-fun contains!8795 (ListLongMap!21231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5622 (array!89858 array!89856 (_ BitVec 32) (_ BitVec 32) V!53745 V!53745 (_ BitVec 32) Int) ListLongMap!21231)

(assert (=> b!1328544 (= lt!590854 (contains!8795 (getCurrentListMap!5622 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328545 () Bool)

(declare-fun e!757482 () Bool)

(declare-fun mapRes!56395 () Bool)

(assert (=> b!1328545 (= e!757483 (and e!757482 mapRes!56395))))

(declare-fun condMapEmpty!56395 () Bool)

(declare-fun mapDefault!56395 () ValueCell!17342)

