; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41494 () Bool)

(assert start!41494)

(declare-fun b_free!11161 () Bool)

(declare-fun b_next!11161 () Bool)

(assert (=> start!41494 (= b_free!11161 (not b_next!11161))))

(declare-fun tp!39480 () Bool)

(declare-fun b_and!19501 () Bool)

(assert (=> start!41494 (= tp!39480 b_and!19501)))

(declare-fun b!463537 () Bool)

(declare-fun e!270656 () Bool)

(assert (=> b!463537 (= e!270656 false)))

(declare-datatypes ((V!17891 0))(
  ( (V!17892 (val!6339 Int)) )
))
(declare-fun zeroValue!794 () V!17891)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8304 0))(
  ( (tuple2!8305 (_1!4163 (_ BitVec 64)) (_2!4163 V!17891)) )
))
(declare-datatypes ((List!8397 0))(
  ( (Nil!8394) (Cons!8393 (h!9249 tuple2!8304) (t!14343 List!8397)) )
))
(declare-datatypes ((ListLongMap!7217 0))(
  ( (ListLongMap!7218 (toList!3624 List!8397)) )
))
(declare-fun lt!209408 () ListLongMap!7217)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28973 0))(
  ( (array!28974 (arr!13918 (Array (_ BitVec 32) (_ BitVec 64))) (size!14270 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28973)

(declare-datatypes ((ValueCell!5951 0))(
  ( (ValueCellFull!5951 (v!8626 V!17891)) (EmptyCell!5951) )
))
(declare-datatypes ((array!28975 0))(
  ( (array!28976 (arr!13919 (Array (_ BitVec 32) ValueCell!5951)) (size!14271 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28975)

(declare-fun minValueAfter!38 () V!17891)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1804 (array!28973 array!28975 (_ BitVec 32) (_ BitVec 32) V!17891 V!17891 (_ BitVec 32) Int) ListLongMap!7217)

(assert (=> b!463537 (= lt!209408 (getCurrentListMapNoExtraKeys!1804 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17891)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209407 () ListLongMap!7217)

(assert (=> b!463537 (= lt!209407 (getCurrentListMapNoExtraKeys!1804 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277160 () Bool)

(assert (=> start!41494 (=> (not res!277160) (not e!270656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41494 (= res!277160 (validMask!0 mask!1365))))

(assert (=> start!41494 e!270656))

(declare-fun tp_is_empty!12589 () Bool)

(assert (=> start!41494 tp_is_empty!12589))

(assert (=> start!41494 tp!39480))

(assert (=> start!41494 true))

(declare-fun array_inv!10060 (array!28973) Bool)

(assert (=> start!41494 (array_inv!10060 _keys!1025)))

(declare-fun e!270653 () Bool)

(declare-fun array_inv!10061 (array!28975) Bool)

(assert (=> start!41494 (and (array_inv!10061 _values!833) e!270653)))

(declare-fun b!463538 () Bool)

(declare-fun res!277157 () Bool)

(assert (=> b!463538 (=> (not res!277157) (not e!270656))))

(assert (=> b!463538 (= res!277157 (and (= (size!14271 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14270 _keys!1025) (size!14271 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463539 () Bool)

(declare-fun e!270657 () Bool)

(declare-fun mapRes!20560 () Bool)

(assert (=> b!463539 (= e!270653 (and e!270657 mapRes!20560))))

(declare-fun condMapEmpty!20560 () Bool)

(declare-fun mapDefault!20560 () ValueCell!5951)

