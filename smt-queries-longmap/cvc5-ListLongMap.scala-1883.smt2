; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33732 () Bool)

(assert start!33732)

(declare-fun b_free!6967 () Bool)

(declare-fun b_next!6967 () Bool)

(assert (=> start!33732 (= b_free!6967 (not b_next!6967))))

(declare-fun tp!24405 () Bool)

(declare-fun b_and!14147 () Bool)

(assert (=> start!33732 (= tp!24405 b_and!14147)))

(declare-fun b!335460 () Bool)

(declare-fun e!205920 () Bool)

(declare-fun tp_is_empty!6919 () Bool)

(assert (=> b!335460 (= e!205920 tp_is_empty!6919)))

(declare-fun b!335461 () Bool)

(declare-fun e!205923 () Bool)

(declare-fun e!205917 () Bool)

(assert (=> b!335461 (= e!205923 e!205917)))

(declare-fun res!185123 () Bool)

(assert (=> b!335461 (=> (not res!185123) (not e!205917))))

(declare-datatypes ((V!10203 0))(
  ( (V!10204 (val!3504 Int)) )
))
(declare-datatypes ((tuple2!5090 0))(
  ( (tuple2!5091 (_1!2556 (_ BitVec 64)) (_2!2556 V!10203)) )
))
(declare-datatypes ((List!4710 0))(
  ( (Nil!4707) (Cons!4706 (h!5562 tuple2!5090) (t!9798 List!4710)) )
))
(declare-datatypes ((ListLongMap!4003 0))(
  ( (ListLongMap!4004 (toList!2017 List!4710)) )
))
(declare-fun lt!159840 () ListLongMap!4003)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun contains!2061 (ListLongMap!4003 (_ BitVec 64)) Bool)

(assert (=> b!335461 (= res!185123 (not (contains!2061 lt!159840 k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10203)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3116 0))(
  ( (ValueCellFull!3116 (v!5666 V!10203)) (EmptyCell!3116) )
))
(declare-datatypes ((array!17431 0))(
  ( (array!17432 (arr!8246 (Array (_ BitVec 32) ValueCell!3116)) (size!8598 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17431)

(declare-datatypes ((array!17433 0))(
  ( (array!17434 (arr!8247 (Array (_ BitVec 32) (_ BitVec 64))) (size!8599 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17433)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10203)

(declare-fun getCurrentListMap!1541 (array!17433 array!17431 (_ BitVec 32) (_ BitVec 32) V!10203 V!10203 (_ BitVec 32) Int) ListLongMap!4003)

(assert (=> b!335461 (= lt!159840 (getCurrentListMap!1541 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335462 () Bool)

(declare-fun e!205919 () Bool)

(declare-fun e!205922 () Bool)

(declare-fun mapRes!11775 () Bool)

(assert (=> b!335462 (= e!205919 (and e!205922 mapRes!11775))))

(declare-fun condMapEmpty!11775 () Bool)

(declare-fun mapDefault!11775 () ValueCell!3116)

