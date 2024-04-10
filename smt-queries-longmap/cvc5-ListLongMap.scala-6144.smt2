; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78972 () Bool)

(assert start!78972)

(declare-fun b_free!17185 () Bool)

(declare-fun b_next!17185 () Bool)

(assert (=> start!78972 (= b_free!17185 (not b_next!17185))))

(declare-fun tp!59996 () Bool)

(declare-fun b_and!28107 () Bool)

(assert (=> start!78972 (= tp!59996 b_and!28107)))

(declare-fun b!924237 () Bool)

(declare-fun e!518634 () Bool)

(declare-fun e!518633 () Bool)

(assert (=> b!924237 (= e!518634 e!518633)))

(declare-fun res!623027 () Bool)

(assert (=> b!924237 (=> (not res!623027) (not e!518633))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31223 0))(
  ( (V!31224 (val!9897 Int)) )
))
(declare-fun v!791 () V!31223)

(declare-fun lt!415512 () V!31223)

(assert (=> b!924237 (= res!623027 (and (= lt!415512 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12892 0))(
  ( (tuple2!12893 (_1!6457 (_ BitVec 64)) (_2!6457 V!31223)) )
))
(declare-datatypes ((List!18695 0))(
  ( (Nil!18692) (Cons!18691 (h!19837 tuple2!12892) (t!26610 List!18695)) )
))
(declare-datatypes ((ListLongMap!11589 0))(
  ( (ListLongMap!11590 (toList!5810 List!18695)) )
))
(declare-fun lt!415522 () ListLongMap!11589)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!640 (ListLongMap!11589 (_ BitVec 64)) V!31223)

(assert (=> b!924237 (= lt!415512 (apply!640 lt!415522 k!1099))))

(declare-fun b!924238 () Bool)

(declare-fun e!518643 () Bool)

(declare-fun e!518644 () Bool)

(declare-fun mapRes!31296 () Bool)

(assert (=> b!924238 (= e!518643 (and e!518644 mapRes!31296))))

(declare-fun condMapEmpty!31296 () Bool)

(declare-datatypes ((ValueCell!9365 0))(
  ( (ValueCellFull!9365 (v!12415 V!31223)) (EmptyCell!9365) )
))
(declare-datatypes ((array!55358 0))(
  ( (array!55359 (arr!26624 (Array (_ BitVec 32) ValueCell!9365)) (size!27083 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55358)

(declare-fun mapDefault!31296 () ValueCell!9365)

