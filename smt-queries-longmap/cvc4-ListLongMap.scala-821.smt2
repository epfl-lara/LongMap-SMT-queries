; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20014 () Bool)

(assert start!20014)

(declare-fun b!196088 () Bool)

(declare-fun res!92535 () Bool)

(declare-fun e!129089 () Bool)

(assert (=> b!196088 (=> (not res!92535) (not e!129089))))

(declare-datatypes ((List!2460 0))(
  ( (Nil!2457) (Cons!2456 (h!3098 (_ BitVec 64)) (t!7391 List!2460)) )
))
(declare-fun noDuplicate!62 (List!2460) Bool)

(assert (=> b!196088 (= res!92535 (noDuplicate!62 Nil!2457))))

(declare-fun b!196089 () Bool)

(declare-fun res!92536 () Bool)

(assert (=> b!196089 (=> (not res!92536) (not e!129089))))

(declare-datatypes ((array!8343 0))(
  ( (array!8344 (arr!3923 (Array (_ BitVec 32) (_ BitVec 64))) (size!4248 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8343)

(assert (=> b!196089 (= res!92536 (and (bvsle #b00000000000000000000000000000000 (size!4248 _keys!825)) (bvslt (size!4248 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun res!92537 () Bool)

(assert (=> start!20014 (=> (not res!92537) (not e!129089))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20014 (= res!92537 (validMask!0 mask!1149))))

(assert (=> start!20014 e!129089))

(assert (=> start!20014 true))

(declare-datatypes ((V!5701 0))(
  ( (V!5702 (val!2315 Int)) )
))
(declare-datatypes ((ValueCell!1927 0))(
  ( (ValueCellFull!1927 (v!4284 V!5701)) (EmptyCell!1927) )
))
(declare-datatypes ((array!8345 0))(
  ( (array!8346 (arr!3924 (Array (_ BitVec 32) ValueCell!1927)) (size!4249 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8345)

(declare-fun e!129090 () Bool)

(declare-fun array_inv!2549 (array!8345) Bool)

(assert (=> start!20014 (and (array_inv!2549 _values!649) e!129090)))

(declare-fun array_inv!2550 (array!8343) Bool)

(assert (=> start!20014 (array_inv!2550 _keys!825)))

(declare-fun b!196090 () Bool)

(declare-fun e!129087 () Bool)

(assert (=> b!196090 (= e!129089 e!129087)))

(declare-fun res!92539 () Bool)

(assert (=> b!196090 (=> res!92539 e!129087)))

(declare-fun contains!1388 (List!2460 (_ BitVec 64)) Bool)

(assert (=> b!196090 (= res!92539 (contains!1388 Nil!2457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!7877 () Bool)

(declare-fun mapRes!7877 () Bool)

(assert (=> mapIsEmpty!7877 mapRes!7877))

(declare-fun b!196091 () Bool)

(declare-fun e!129086 () Bool)

(declare-fun tp_is_empty!4541 () Bool)

(assert (=> b!196091 (= e!129086 tp_is_empty!4541)))

(declare-fun b!196092 () Bool)

(assert (=> b!196092 (= e!129087 (contains!1388 Nil!2457 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196093 () Bool)

(assert (=> b!196093 (= e!129090 (and e!129086 mapRes!7877))))

(declare-fun condMapEmpty!7877 () Bool)

(declare-fun mapDefault!7877 () ValueCell!1927)

