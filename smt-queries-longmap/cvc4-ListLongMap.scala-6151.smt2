; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79018 () Bool)

(assert start!79018)

(declare-fun b_free!17231 () Bool)

(declare-fun b_next!17231 () Bool)

(assert (=> start!79018 (= b_free!17231 (not b_next!17231))))

(declare-fun tp!60134 () Bool)

(declare-fun b_and!28199 () Bool)

(assert (=> start!79018 (= tp!60134 b_and!28199)))

(declare-fun b!925577 () Bool)

(declare-fun e!519496 () Bool)

(declare-fun e!519495 () Bool)

(assert (=> b!925577 (= e!519496 e!519495)))

(declare-fun res!623706 () Bool)

(assert (=> b!925577 (=> (not res!623706) (not e!519495))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31283 0))(
  ( (V!31284 (val!9920 Int)) )
))
(declare-fun v!791 () V!31283)

(declare-fun lt!416572 () V!31283)

(assert (=> b!925577 (= res!623706 (and (= lt!416572 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12936 0))(
  ( (tuple2!12937 (_1!6479 (_ BitVec 64)) (_2!6479 V!31283)) )
))
(declare-datatypes ((List!18738 0))(
  ( (Nil!18735) (Cons!18734 (h!19880 tuple2!12936) (t!26699 List!18738)) )
))
(declare-datatypes ((ListLongMap!11633 0))(
  ( (ListLongMap!11634 (toList!5832 List!18738)) )
))
(declare-fun lt!416581 () ListLongMap!11633)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!662 (ListLongMap!11633 (_ BitVec 64)) V!31283)

(assert (=> b!925577 (= lt!416572 (apply!662 lt!416581 k!1099))))

(declare-fun b!925578 () Bool)

(declare-datatypes ((Unit!31277 0))(
  ( (Unit!31278) )
))
(declare-fun e!519487 () Unit!31277)

(declare-fun Unit!31279 () Unit!31277)

(assert (=> b!925578 (= e!519487 Unit!31279)))

(declare-fun b!925579 () Bool)

(declare-fun e!519494 () Bool)

(declare-fun e!519498 () Bool)

(declare-fun mapRes!31365 () Bool)

(assert (=> b!925579 (= e!519494 (and e!519498 mapRes!31365))))

(declare-fun condMapEmpty!31365 () Bool)

(declare-datatypes ((ValueCell!9388 0))(
  ( (ValueCellFull!9388 (v!12438 V!31283)) (EmptyCell!9388) )
))
(declare-datatypes ((array!55446 0))(
  ( (array!55447 (arr!26668 (Array (_ BitVec 32) ValueCell!9388)) (size!27127 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55446)

(declare-fun mapDefault!31365 () ValueCell!9388)

