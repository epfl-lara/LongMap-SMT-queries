; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83038 () Bool)

(assert start!83038)

(declare-fun b!968857 () Bool)

(declare-fun e!546095 () Bool)

(declare-fun e!546093 () Bool)

(assert (=> b!968857 (= e!546095 e!546093)))

(declare-fun res!648547 () Bool)

(assert (=> b!968857 (=> res!648547 e!546093)))

(declare-datatypes ((List!20006 0))(
  ( (Nil!20003) (Cons!20002 (h!21164 (_ BitVec 64)) (t!28369 List!20006)) )
))
(declare-fun contains!5546 (List!20006 (_ BitVec 64)) Bool)

(assert (=> b!968857 (= res!648547 (contains!5546 Nil!20003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968858 () Bool)

(declare-fun e!546094 () Bool)

(declare-fun tp_is_empty!21941 () Bool)

(assert (=> b!968858 (= e!546094 tp_is_empty!21941)))

(declare-fun b!968859 () Bool)

(assert (=> b!968859 (= e!546093 (contains!5546 Nil!20003 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968860 () Bool)

(declare-fun e!546091 () Bool)

(assert (=> b!968860 (= e!546091 tp_is_empty!21941)))

(declare-fun b!968861 () Bool)

(declare-fun e!546090 () Bool)

(declare-fun mapRes!34918 () Bool)

(assert (=> b!968861 (= e!546090 (and e!546091 mapRes!34918))))

(declare-fun condMapEmpty!34918 () Bool)

(declare-datatypes ((V!34237 0))(
  ( (V!34238 (val!11021 Int)) )
))
(declare-datatypes ((ValueCell!10489 0))(
  ( (ValueCellFull!10489 (v!13579 V!34237)) (EmptyCell!10489) )
))
(declare-datatypes ((array!59955 0))(
  ( (array!59956 (arr!28842 (Array (_ BitVec 32) ValueCell!10489)) (size!29321 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59955)

(declare-fun mapDefault!34918 () ValueCell!10489)

