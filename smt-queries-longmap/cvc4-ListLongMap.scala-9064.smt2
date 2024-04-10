; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109172 () Bool)

(assert start!109172)

(declare-fun b_free!28661 () Bool)

(declare-fun b_next!28661 () Bool)

(assert (=> start!109172 (= b_free!28661 (not b_next!28661))))

(declare-fun tp!101101 () Bool)

(declare-fun b_and!46751 () Bool)

(assert (=> start!109172 (= tp!101101 b_and!46751)))

(declare-fun b!1291182 () Bool)

(declare-fun res!857829 () Bool)

(declare-fun e!737088 () Bool)

(assert (=> b!1291182 (=> (not res!857829) (not e!737088))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85638 0))(
  ( (array!85639 (arr!41320 (Array (_ BitVec 32) (_ BitVec 64))) (size!41870 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85638)

(assert (=> b!1291182 (= res!857829 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41870 _keys!1741))))))

(declare-fun b!1291183 () Bool)

(declare-fun e!737085 () Bool)

(assert (=> b!1291183 (= e!737088 (not e!737085))))

(declare-fun res!857828 () Bool)

(assert (=> b!1291183 (=> res!857828 e!737085)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291183 (= res!857828 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50837 0))(
  ( (V!50838 (val!17225 Int)) )
))
(declare-datatypes ((tuple2!22142 0))(
  ( (tuple2!22143 (_1!11082 (_ BitVec 64)) (_2!11082 V!50837)) )
))
(declare-datatypes ((List!29303 0))(
  ( (Nil!29300) (Cons!29299 (h!30508 tuple2!22142) (t!42867 List!29303)) )
))
(declare-datatypes ((ListLongMap!19799 0))(
  ( (ListLongMap!19800 (toList!9915 List!29303)) )
))
(declare-fun contains!8033 (ListLongMap!19799 (_ BitVec 64)) Bool)

(assert (=> b!1291183 (not (contains!8033 (ListLongMap!19800 Nil!29300) k!1205))))

(declare-datatypes ((Unit!42742 0))(
  ( (Unit!42743) )
))
(declare-fun lt!579000 () Unit!42742)

(declare-fun emptyContainsNothing!95 ((_ BitVec 64)) Unit!42742)

(assert (=> b!1291183 (= lt!579000 (emptyContainsNothing!95 k!1205))))

(declare-fun b!1291184 () Bool)

(declare-fun e!737087 () Bool)

(declare-fun tp_is_empty!34301 () Bool)

(assert (=> b!1291184 (= e!737087 tp_is_empty!34301)))

(declare-fun b!1291185 () Bool)

(declare-fun e!737089 () Bool)

(declare-fun e!737086 () Bool)

(declare-fun mapRes!53012 () Bool)

(assert (=> b!1291185 (= e!737089 (and e!737086 mapRes!53012))))

(declare-fun condMapEmpty!53012 () Bool)

(declare-datatypes ((ValueCell!16252 0))(
  ( (ValueCellFull!16252 (v!19828 V!50837)) (EmptyCell!16252) )
))
(declare-datatypes ((array!85640 0))(
  ( (array!85641 (arr!41321 (Array (_ BitVec 32) ValueCell!16252)) (size!41871 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85640)

(declare-fun mapDefault!53012 () ValueCell!16252)

