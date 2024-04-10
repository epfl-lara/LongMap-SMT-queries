; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35898 () Bool)

(assert start!35898)

(declare-fun b_free!7927 () Bool)

(declare-fun b_next!7927 () Bool)

(assert (=> start!35898 (= b_free!7927 (not b_next!7927))))

(declare-fun tp!28083 () Bool)

(declare-fun b_and!15169 () Bool)

(assert (=> start!35898 (= tp!28083 b_and!15169)))

(declare-fun b!360921 () Bool)

(declare-fun e!220930 () Bool)

(assert (=> b!360921 (= e!220930 true)))

(declare-datatypes ((V!12091 0))(
  ( (V!12092 (val!4212 Int)) )
))
(declare-fun minValue!1150 () V!12091)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!20221 0))(
  ( (array!20222 (arr!9603 (Array (_ BitVec 32) (_ BitVec 64))) (size!9955 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20221)

(declare-fun k!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3824 0))(
  ( (ValueCellFull!3824 (v!6406 V!12091)) (EmptyCell!3824) )
))
(declare-datatypes ((array!20223 0))(
  ( (array!20224 (arr!9604 (Array (_ BitVec 32) ValueCell!3824)) (size!9956 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20223)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12091)

(declare-datatypes ((tuple2!5734 0))(
  ( (tuple2!5735 (_1!2878 (_ BitVec 64)) (_2!2878 V!12091)) )
))
(declare-datatypes ((List!5497 0))(
  ( (Nil!5494) (Cons!5493 (h!6349 tuple2!5734) (t!10647 List!5497)) )
))
(declare-datatypes ((ListLongMap!4647 0))(
  ( (ListLongMap!4648 (toList!2339 List!5497)) )
))
(declare-fun contains!2420 (ListLongMap!4647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1860 (array!20221 array!20223 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 32) Int) ListLongMap!4647)

(assert (=> b!360921 (contains!2420 (getCurrentListMap!1860 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11102 0))(
  ( (Unit!11103) )
))
(declare-fun lt!166504 () Unit!11102)

(declare-fun lemmaArrayContainsKeyThenInListMap!353 (array!20221 array!20223 (_ BitVec 32) (_ BitVec 32) V!12091 V!12091 (_ BitVec 64) (_ BitVec 32) Int) Unit!11102)

(assert (=> b!360921 (= lt!166504 (lemmaArrayContainsKeyThenInListMap!353 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun res!200801 () Bool)

(declare-fun e!220929 () Bool)

(assert (=> start!35898 (=> (not res!200801) (not e!220929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35898 (= res!200801 (validMask!0 mask!1842))))

(assert (=> start!35898 e!220929))

(declare-fun tp_is_empty!8335 () Bool)

(assert (=> start!35898 tp_is_empty!8335))

(assert (=> start!35898 true))

(assert (=> start!35898 tp!28083))

(declare-fun array_inv!7064 (array!20221) Bool)

(assert (=> start!35898 (array_inv!7064 _keys!1456)))

(declare-fun e!220928 () Bool)

(declare-fun array_inv!7065 (array!20223) Bool)

(assert (=> start!35898 (and (array_inv!7065 _values!1208) e!220928)))

(declare-fun b!360922 () Bool)

(declare-fun res!200797 () Bool)

(assert (=> b!360922 (=> (not res!200797) (not e!220929))))

(declare-fun arrayContainsKey!0 (array!20221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360922 (= res!200797 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!360923 () Bool)

(declare-fun e!220925 () Bool)

(declare-fun mapRes!14013 () Bool)

(assert (=> b!360923 (= e!220928 (and e!220925 mapRes!14013))))

(declare-fun condMapEmpty!14013 () Bool)

(declare-fun mapDefault!14013 () ValueCell!3824)

