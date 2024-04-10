; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71010 () Bool)

(assert start!71010)

(declare-fun b_free!13213 () Bool)

(declare-fun b_next!13213 () Bool)

(assert (=> start!71010 (= b_free!13213 (not b_next!13213))))

(declare-fun tp!46392 () Bool)

(declare-fun b_and!22117 () Bool)

(assert (=> start!71010 (= tp!46392 b_and!22117)))

(declare-fun b!824596 () Bool)

(declare-fun e!458807 () Bool)

(declare-fun tp_is_empty!14923 () Bool)

(assert (=> b!824596 (= e!458807 tp_is_empty!14923)))

(declare-fun mapIsEmpty!24004 () Bool)

(declare-fun mapRes!24004 () Bool)

(assert (=> mapIsEmpty!24004 mapRes!24004))

(declare-fun res!562179 () Bool)

(declare-fun e!458802 () Bool)

(assert (=> start!71010 (=> (not res!562179) (not e!458802))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71010 (= res!562179 (validMask!0 mask!1312))))

(assert (=> start!71010 e!458802))

(assert (=> start!71010 tp_is_empty!14923))

(declare-datatypes ((array!46034 0))(
  ( (array!46035 (arr!22064 (Array (_ BitVec 32) (_ BitVec 64))) (size!22485 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46034)

(declare-fun array_inv!17603 (array!46034) Bool)

(assert (=> start!71010 (array_inv!17603 _keys!976)))

(assert (=> start!71010 true))

(declare-datatypes ((V!24899 0))(
  ( (V!24900 (val!7509 Int)) )
))
(declare-datatypes ((ValueCell!7046 0))(
  ( (ValueCellFull!7046 (v!9942 V!24899)) (EmptyCell!7046) )
))
(declare-datatypes ((array!46036 0))(
  ( (array!46037 (arr!22065 (Array (_ BitVec 32) ValueCell!7046)) (size!22486 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46036)

(declare-fun e!458804 () Bool)

(declare-fun array_inv!17604 (array!46036) Bool)

(assert (=> start!71010 (and (array_inv!17604 _values!788) e!458804)))

(assert (=> start!71010 tp!46392))

(declare-fun b!824597 () Bool)

(assert (=> b!824597 (= e!458804 (and e!458807 mapRes!24004))))

(declare-fun condMapEmpty!24004 () Bool)

(declare-fun mapDefault!24004 () ValueCell!7046)

