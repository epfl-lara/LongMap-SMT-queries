; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78934 () Bool)

(assert start!78934)

(declare-fun b_free!17147 () Bool)

(declare-fun b_next!17147 () Bool)

(assert (=> start!78934 (= b_free!17147 (not b_next!17147))))

(declare-fun tp!59882 () Bool)

(declare-fun b_and!28031 () Bool)

(assert (=> start!78934 (= tp!59882 b_and!28031)))

(declare-fun b!923176 () Bool)

(declare-fun res!622513 () Bool)

(declare-fun e!517955 () Bool)

(assert (=> b!923176 (=> (not res!622513) (not e!517955))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31171 0))(
  ( (V!31172 (val!9878 Int)) )
))
(declare-fun v!791 () V!31171)

(declare-datatypes ((tuple2!12856 0))(
  ( (tuple2!12857 (_1!6439 (_ BitVec 64)) (_2!6439 V!31171)) )
))
(declare-datatypes ((List!18662 0))(
  ( (Nil!18659) (Cons!18658 (h!19804 tuple2!12856) (t!26539 List!18662)) )
))
(declare-datatypes ((ListLongMap!11553 0))(
  ( (ListLongMap!11554 (toList!5792 List!18662)) )
))
(declare-fun lt!414661 () ListLongMap!11553)

(declare-fun apply!623 (ListLongMap!11553 (_ BitVec 64)) V!31171)

(assert (=> b!923176 (= res!622513 (= (apply!623 lt!414661 k!1099) v!791))))

(declare-fun b!923177 () Bool)

(declare-fun res!622516 () Bool)

(assert (=> b!923177 (=> (not res!622516) (not e!517955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923177 (= res!622516 (validKeyInArray!0 k!1099))))

(declare-fun b!923178 () Bool)

(declare-fun e!517956 () Bool)

(declare-fun e!517959 () Bool)

(declare-fun mapRes!31239 () Bool)

(assert (=> b!923178 (= e!517956 (and e!517959 mapRes!31239))))

(declare-fun condMapEmpty!31239 () Bool)

(declare-datatypes ((ValueCell!9346 0))(
  ( (ValueCellFull!9346 (v!12396 V!31171)) (EmptyCell!9346) )
))
(declare-datatypes ((array!55286 0))(
  ( (array!55287 (arr!26588 (Array (_ BitVec 32) ValueCell!9346)) (size!27047 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55286)

(declare-fun mapDefault!31239 () ValueCell!9346)

