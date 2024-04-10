; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21172 () Bool)

(assert start!21172)

(declare-fun b_free!5623 () Bool)

(declare-fun b_next!5623 () Bool)

(assert (=> start!21172 (= b_free!5623 (not b_next!5623))))

(declare-fun tp!19940 () Bool)

(declare-fun b_and!12489 () Bool)

(assert (=> start!21172 (= tp!19940 b_and!12489)))

(declare-fun b!213188 () Bool)

(declare-fun res!104298 () Bool)

(declare-fun e!138674 () Bool)

(assert (=> b!213188 (=> (not res!104298) (not e!138674))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213188 (= res!104298 (validKeyInArray!0 k!843))))

(declare-fun b!213189 () Bool)

(declare-fun e!138673 () Bool)

(declare-fun tp_is_empty!5485 () Bool)

(assert (=> b!213189 (= e!138673 tp_is_empty!5485)))

(declare-fun b!213190 () Bool)

(declare-fun e!138675 () Bool)

(declare-fun e!138671 () Bool)

(assert (=> b!213190 (= e!138675 e!138671)))

(declare-fun res!104299 () Bool)

(assert (=> b!213190 (=> res!104299 e!138671)))

(assert (=> b!213190 (= res!104299 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6961 0))(
  ( (V!6962 (val!2787 Int)) )
))
(declare-datatypes ((tuple2!4220 0))(
  ( (tuple2!4221 (_1!2121 (_ BitVec 64)) (_2!2121 V!6961)) )
))
(declare-datatypes ((List!3107 0))(
  ( (Nil!3104) (Cons!3103 (h!3745 tuple2!4220) (t!8058 List!3107)) )
))
(declare-datatypes ((ListLongMap!3133 0))(
  ( (ListLongMap!3134 (toList!1582 List!3107)) )
))
(declare-fun lt!110076 () ListLongMap!3133)

(declare-fun lt!110069 () ListLongMap!3133)

(assert (=> b!213190 (= lt!110076 lt!110069)))

(declare-fun lt!110066 () ListLongMap!3133)

(declare-fun lt!110073 () tuple2!4220)

(declare-fun +!585 (ListLongMap!3133 tuple2!4220) ListLongMap!3133)

(assert (=> b!213190 (= lt!110069 (+!585 lt!110066 lt!110073))))

(declare-fun lt!110072 () ListLongMap!3133)

(declare-fun lt!110068 () ListLongMap!3133)

(assert (=> b!213190 (= lt!110072 lt!110068)))

(declare-fun lt!110067 () ListLongMap!3133)

(assert (=> b!213190 (= lt!110068 (+!585 lt!110067 lt!110073))))

(declare-fun lt!110075 () ListLongMap!3133)

(assert (=> b!213190 (= lt!110072 (+!585 lt!110075 lt!110073))))

(declare-fun minValue!615 () V!6961)

(assert (=> b!213190 (= lt!110073 (tuple2!4221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213191 () Bool)

(declare-fun res!104294 () Bool)

(assert (=> b!213191 (=> (not res!104294) (not e!138674))))

(declare-datatypes ((array!10175 0))(
  ( (array!10176 (arr!4828 (Array (_ BitVec 32) (_ BitVec 64))) (size!5153 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10175)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213191 (= res!104294 (= (select (arr!4828 _keys!825) i!601) k!843))))

(declare-fun b!213192 () Bool)

(declare-fun e!138670 () Bool)

(declare-fun e!138672 () Bool)

(declare-fun mapRes!9326 () Bool)

(assert (=> b!213192 (= e!138670 (and e!138672 mapRes!9326))))

(declare-fun condMapEmpty!9326 () Bool)

(declare-datatypes ((ValueCell!2399 0))(
  ( (ValueCellFull!2399 (v!4797 V!6961)) (EmptyCell!2399) )
))
(declare-datatypes ((array!10177 0))(
  ( (array!10178 (arr!4829 (Array (_ BitVec 32) ValueCell!2399)) (size!5154 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10177)

(declare-fun mapDefault!9326 () ValueCell!2399)

