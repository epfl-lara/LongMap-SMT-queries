; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108986 () Bool)

(assert start!108986)

(declare-fun b_free!28475 () Bool)

(declare-fun b_next!28475 () Bool)

(assert (=> start!108986 (= b_free!28475 (not b_next!28475))))

(declare-fun tp!100543 () Bool)

(declare-fun b_and!46565 () Bool)

(assert (=> start!108986 (= tp!100543 b_and!46565)))

(declare-fun b!1287861 () Bool)

(declare-fun e!735439 () Bool)

(assert (=> b!1287861 (= e!735439 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50589 0))(
  ( (V!50590 (val!17132 Int)) )
))
(declare-datatypes ((tuple2!21986 0))(
  ( (tuple2!21987 (_1!11004 (_ BitVec 64)) (_2!11004 V!50589)) )
))
(declare-datatypes ((List!29163 0))(
  ( (Nil!29160) (Cons!29159 (h!30368 tuple2!21986) (t!42727 List!29163)) )
))
(declare-datatypes ((ListLongMap!19643 0))(
  ( (ListLongMap!19644 (toList!9837 List!29163)) )
))
(declare-fun contains!7955 (ListLongMap!19643 (_ BitVec 64)) Bool)

(assert (=> b!1287861 (not (contains!7955 (ListLongMap!19644 Nil!29160) k!1205))))

(declare-datatypes ((Unit!42594 0))(
  ( (Unit!42595) )
))
(declare-fun lt!577904 () Unit!42594)

(declare-fun emptyContainsNothing!26 ((_ BitVec 64)) Unit!42594)

(assert (=> b!1287861 (= lt!577904 (emptyContainsNothing!26 k!1205))))

(declare-fun b!1287862 () Bool)

(declare-fun res!855342 () Bool)

(assert (=> b!1287862 (=> (not res!855342) (not e!735439))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85278 0))(
  ( (array!85279 (arr!41140 (Array (_ BitVec 32) (_ BitVec 64))) (size!41690 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85278)

(assert (=> b!1287862 (= res!855342 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41690 _keys!1741))))))

(declare-fun b!1287863 () Bool)

(declare-fun res!855347 () Bool)

(assert (=> b!1287863 (=> (not res!855347) (not e!735439))))

(declare-datatypes ((List!29164 0))(
  ( (Nil!29161) (Cons!29160 (h!30369 (_ BitVec 64)) (t!42728 List!29164)) )
))
(declare-fun arrayNoDuplicates!0 (array!85278 (_ BitVec 32) List!29164) Bool)

(assert (=> b!1287863 (= res!855347 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29161))))

(declare-fun res!855344 () Bool)

(assert (=> start!108986 (=> (not res!855344) (not e!735439))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108986 (= res!855344 (validMask!0 mask!2175))))

(assert (=> start!108986 e!735439))

(declare-fun tp_is_empty!34115 () Bool)

(assert (=> start!108986 tp_is_empty!34115))

(assert (=> start!108986 true))

(declare-datatypes ((ValueCell!16159 0))(
  ( (ValueCellFull!16159 (v!19735 V!50589)) (EmptyCell!16159) )
))
(declare-datatypes ((array!85280 0))(
  ( (array!85281 (arr!41141 (Array (_ BitVec 32) ValueCell!16159)) (size!41691 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85280)

(declare-fun e!735440 () Bool)

(declare-fun array_inv!31199 (array!85280) Bool)

(assert (=> start!108986 (and (array_inv!31199 _values!1445) e!735440)))

(declare-fun array_inv!31200 (array!85278) Bool)

(assert (=> start!108986 (array_inv!31200 _keys!1741)))

(assert (=> start!108986 tp!100543))

(declare-fun b!1287864 () Bool)

(declare-fun e!735443 () Bool)

(assert (=> b!1287864 (= e!735443 tp_is_empty!34115)))

(declare-fun b!1287865 () Bool)

(declare-fun mapRes!52733 () Bool)

(assert (=> b!1287865 (= e!735440 (and e!735443 mapRes!52733))))

(declare-fun condMapEmpty!52733 () Bool)

(declare-fun mapDefault!52733 () ValueCell!16159)

