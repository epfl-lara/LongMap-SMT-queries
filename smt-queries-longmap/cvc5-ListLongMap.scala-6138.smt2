; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78936 () Bool)

(assert start!78936)

(declare-fun b_free!17149 () Bool)

(declare-fun b_next!17149 () Bool)

(assert (=> start!78936 (= b_free!17149 (not b_next!17149))))

(declare-fun tp!59887 () Bool)

(declare-fun b_and!28035 () Bool)

(assert (=> start!78936 (= tp!59887 b_and!28035)))

(declare-fun b!923229 () Bool)

(declare-fun e!517987 () Bool)

(declare-fun e!517990 () Bool)

(assert (=> b!923229 (= e!517987 e!517990)))

(declare-fun res!622549 () Bool)

(assert (=> b!923229 (=> (not res!622549) (not e!517990))))

(declare-datatypes ((V!31175 0))(
  ( (V!31176 (val!9879 Int)) )
))
(declare-datatypes ((tuple2!12858 0))(
  ( (tuple2!12859 (_1!6440 (_ BitVec 64)) (_2!6440 V!31175)) )
))
(declare-datatypes ((List!18663 0))(
  ( (Nil!18660) (Cons!18659 (h!19805 tuple2!12858) (t!26542 List!18663)) )
))
(declare-datatypes ((ListLongMap!11555 0))(
  ( (ListLongMap!11556 (toList!5793 List!18663)) )
))
(declare-fun lt!414703 () ListLongMap!11555)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4855 (ListLongMap!11555 (_ BitVec 64)) Bool)

(assert (=> b!923229 (= res!622549 (contains!4855 lt!414703 k!1099))))

(declare-datatypes ((array!55288 0))(
  ( (array!55289 (arr!26589 (Array (_ BitVec 32) (_ BitVec 64))) (size!27048 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55288)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9347 0))(
  ( (ValueCellFull!9347 (v!12397 V!31175)) (EmptyCell!9347) )
))
(declare-datatypes ((array!55290 0))(
  ( (array!55291 (arr!26590 (Array (_ BitVec 32) ValueCell!9347)) (size!27049 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55290)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31175)

(declare-fun minValue!1173 () V!31175)

(declare-fun getCurrentListMap!3046 (array!55288 array!55290 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 32) Int) ListLongMap!11555)

(assert (=> b!923229 (= lt!414703 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923230 () Bool)

(declare-fun res!622541 () Bool)

(assert (=> b!923230 (=> (not res!622541) (not e!517987))))

(assert (=> b!923230 (= res!622541 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27048 _keys!1487))))))

(declare-fun b!923231 () Bool)

(declare-datatypes ((Unit!31140 0))(
  ( (Unit!31141) )
))
(declare-fun e!517994 () Unit!31140)

(declare-fun Unit!31142 () Unit!31140)

(assert (=> b!923231 (= e!517994 Unit!31142)))

(declare-fun b!923232 () Bool)

(declare-fun e!517989 () Unit!31140)

(declare-fun Unit!31143 () Unit!31140)

(assert (=> b!923232 (= e!517989 Unit!31143)))

(declare-fun b!923233 () Bool)

(declare-fun e!517986 () Bool)

(declare-fun e!517992 () Bool)

(declare-fun mapRes!31242 () Bool)

(assert (=> b!923233 (= e!517986 (and e!517992 mapRes!31242))))

(declare-fun condMapEmpty!31242 () Bool)

(declare-fun mapDefault!31242 () ValueCell!9347)

