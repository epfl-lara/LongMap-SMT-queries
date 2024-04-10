; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71268 () Bool)

(assert start!71268)

(declare-fun b_free!13415 () Bool)

(declare-fun b_next!13415 () Bool)

(assert (=> start!71268 (= b_free!13415 (not b_next!13415))))

(declare-fun tp!47008 () Bool)

(declare-fun b_and!22353 () Bool)

(assert (=> start!71268 (= tp!47008 b_and!22353)))

(declare-fun b!827806 () Bool)

(declare-fun e!461201 () Bool)

(assert (=> b!827806 (= e!461201 false)))

(declare-datatypes ((array!46414 0))(
  ( (array!46415 (arr!22251 (Array (_ BitVec 32) (_ BitVec 64))) (size!22672 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46414)

(declare-datatypes ((V!25167 0))(
  ( (V!25168 (val!7610 Int)) )
))
(declare-fun minValue!754 () V!25167)

(declare-datatypes ((ValueCell!7147 0))(
  ( (ValueCellFull!7147 (v!10045 V!25167)) (EmptyCell!7147) )
))
(declare-datatypes ((array!46416 0))(
  ( (array!46417 (arr!22252 (Array (_ BitVec 32) ValueCell!7147)) (size!22673 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46416)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25167)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!10088 0))(
  ( (tuple2!10089 (_1!5055 (_ BitVec 64)) (_2!5055 V!25167)) )
))
(declare-datatypes ((List!15881 0))(
  ( (Nil!15878) (Cons!15877 (h!17006 tuple2!10088) (t!22230 List!15881)) )
))
(declare-datatypes ((ListLongMap!8911 0))(
  ( (ListLongMap!8912 (toList!4471 List!15881)) )
))
(declare-fun lt!375011 () ListLongMap!8911)

(declare-fun getCurrentListMapNoExtraKeys!2473 (array!46414 array!46416 (_ BitVec 32) (_ BitVec 32) V!25167 V!25167 (_ BitVec 32) Int) ListLongMap!8911)

(assert (=> b!827806 (= lt!375011 (getCurrentListMapNoExtraKeys!2473 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25167)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375010 () ListLongMap!8911)

(assert (=> b!827806 (= lt!375010 (getCurrentListMapNoExtraKeys!2473 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827807 () Bool)

(declare-fun res!564185 () Bool)

(assert (=> b!827807 (=> (not res!564185) (not e!461201))))

(assert (=> b!827807 (= res!564185 (and (= (size!22673 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22672 _keys!976) (size!22673 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24316 () Bool)

(declare-fun mapRes!24316 () Bool)

(assert (=> mapIsEmpty!24316 mapRes!24316))

(declare-fun b!827808 () Bool)

(declare-fun res!564187 () Bool)

(assert (=> b!827808 (=> (not res!564187) (not e!461201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46414 (_ BitVec 32)) Bool)

(assert (=> b!827808 (= res!564187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827809 () Bool)

(declare-fun e!461200 () Bool)

(declare-fun e!461203 () Bool)

(assert (=> b!827809 (= e!461200 (and e!461203 mapRes!24316))))

(declare-fun condMapEmpty!24316 () Bool)

(declare-fun mapDefault!24316 () ValueCell!7147)

