; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79388 () Bool)

(assert start!79388)

(declare-fun b_free!17575 () Bool)

(declare-fun b_next!17575 () Bool)

(assert (=> start!79388 (= b_free!17575 (not b_next!17575))))

(declare-fun tp!61168 () Bool)

(declare-fun b_and!28709 () Bool)

(assert (=> start!79388 (= tp!61168 b_and!28709)))

(declare-fun b!932773 () Bool)

(declare-fun res!628234 () Bool)

(declare-fun e!523800 () Bool)

(assert (=> b!932773 (=> (not res!628234) (not e!523800))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932773 (= res!628234 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932774 () Bool)

(declare-fun e!523801 () Bool)

(declare-fun e!523806 () Bool)

(declare-fun mapRes!31884 () Bool)

(assert (=> b!932774 (= e!523801 (and e!523806 mapRes!31884))))

(declare-fun condMapEmpty!31884 () Bool)

(declare-datatypes ((V!31743 0))(
  ( (V!31744 (val!10092 Int)) )
))
(declare-datatypes ((ValueCell!9560 0))(
  ( (ValueCellFull!9560 (v!12611 V!31743)) (EmptyCell!9560) )
))
(declare-datatypes ((array!56104 0))(
  ( (array!56105 (arr!26996 (Array (_ BitVec 32) ValueCell!9560)) (size!27455 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56104)

(declare-fun mapDefault!31884 () ValueCell!9560)

