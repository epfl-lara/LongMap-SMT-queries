; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71228 () Bool)

(assert start!71228)

(declare-fun b_free!13375 () Bool)

(declare-fun b_next!13375 () Bool)

(assert (=> start!71228 (= b_free!13375 (not b_next!13375))))

(declare-fun tp!46887 () Bool)

(declare-fun b_and!22313 () Bool)

(assert (=> start!71228 (= tp!46887 b_and!22313)))

(declare-fun b!827386 () Bool)

(declare-fun e!460901 () Bool)

(assert (=> b!827386 (= e!460901 false)))

(declare-datatypes ((array!46346 0))(
  ( (array!46347 (arr!22217 (Array (_ BitVec 32) (_ BitVec 64))) (size!22638 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46346)

(declare-datatypes ((V!25115 0))(
  ( (V!25116 (val!7590 Int)) )
))
(declare-fun minValue!754 () V!25115)

(declare-datatypes ((ValueCell!7127 0))(
  ( (ValueCellFull!7127 (v!10025 V!25115)) (EmptyCell!7127) )
))
(declare-datatypes ((array!46348 0))(
  ( (array!46349 (arr!22218 (Array (_ BitVec 32) ValueCell!7127)) (size!22639 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46348)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10062 0))(
  ( (tuple2!10063 (_1!5042 (_ BitVec 64)) (_2!5042 V!25115)) )
))
(declare-datatypes ((List!15858 0))(
  ( (Nil!15855) (Cons!15854 (h!16983 tuple2!10062) (t!22207 List!15858)) )
))
(declare-datatypes ((ListLongMap!8885 0))(
  ( (ListLongMap!8886 (toList!4458 List!15858)) )
))
(declare-fun lt!374891 () ListLongMap!8885)

(declare-fun zeroValueAfter!34 () V!25115)

(declare-fun getCurrentListMapNoExtraKeys!2460 (array!46346 array!46348 (_ BitVec 32) (_ BitVec 32) V!25115 V!25115 (_ BitVec 32) Int) ListLongMap!8885)

(assert (=> b!827386 (= lt!374891 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25115)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374890 () ListLongMap!8885)

(assert (=> b!827386 (= lt!374890 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827387 () Bool)

(declare-fun e!460903 () Bool)

(declare-fun e!460900 () Bool)

(declare-fun mapRes!24256 () Bool)

(assert (=> b!827387 (= e!460903 (and e!460900 mapRes!24256))))

(declare-fun condMapEmpty!24256 () Bool)

(declare-fun mapDefault!24256 () ValueCell!7127)

