; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42114 () Bool)

(assert start!42114)

(declare-fun b_free!11647 () Bool)

(declare-fun b_next!11647 () Bool)

(assert (=> start!42114 (= b_free!11647 (not b_next!11647))))

(declare-fun tp!40962 () Bool)

(declare-fun b_and!20069 () Bool)

(assert (=> start!42114 (= tp!40962 b_and!20069)))

(declare-fun res!280947 () Bool)

(declare-fun e!275406 () Bool)

(assert (=> start!42114 (=> (not res!280947) (not e!275406))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42114 (= res!280947 (validMask!0 mask!1365))))

(assert (=> start!42114 e!275406))

(declare-fun tp_is_empty!13075 () Bool)

(assert (=> start!42114 tp_is_empty!13075))

(assert (=> start!42114 tp!40962))

(assert (=> start!42114 true))

(declare-datatypes ((array!29923 0))(
  ( (array!29924 (arr!14385 (Array (_ BitVec 32) (_ BitVec 64))) (size!14737 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29923)

(declare-fun array_inv!10376 (array!29923) Bool)

(assert (=> start!42114 (array_inv!10376 _keys!1025)))

(declare-datatypes ((V!18539 0))(
  ( (V!18540 (val!6582 Int)) )
))
(declare-datatypes ((ValueCell!6194 0))(
  ( (ValueCellFull!6194 (v!8873 V!18539)) (EmptyCell!6194) )
))
(declare-datatypes ((array!29925 0))(
  ( (array!29926 (arr!14386 (Array (_ BitVec 32) ValueCell!6194)) (size!14738 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29925)

(declare-fun e!275409 () Bool)

(declare-fun array_inv!10377 (array!29925) Bool)

(assert (=> start!42114 (and (array_inv!10377 _values!833) e!275409)))

(declare-fun mapIsEmpty!21313 () Bool)

(declare-fun mapRes!21313 () Bool)

(assert (=> mapIsEmpty!21313 mapRes!21313))

(declare-fun b!470174 () Bool)

(declare-fun res!280950 () Bool)

(assert (=> b!470174 (=> (not res!280950) (not e!275406))))

(declare-datatypes ((List!8747 0))(
  ( (Nil!8744) (Cons!8743 (h!9599 (_ BitVec 64)) (t!14709 List!8747)) )
))
(declare-fun arrayNoDuplicates!0 (array!29923 (_ BitVec 32) List!8747) Bool)

(assert (=> b!470174 (= res!280950 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8744))))

(declare-fun mapNonEmpty!21313 () Bool)

(declare-fun tp!40963 () Bool)

(declare-fun e!275407 () Bool)

(assert (=> mapNonEmpty!21313 (= mapRes!21313 (and tp!40963 e!275407))))

(declare-fun mapValue!21313 () ValueCell!6194)

(declare-fun mapRest!21313 () (Array (_ BitVec 32) ValueCell!6194))

(declare-fun mapKey!21313 () (_ BitVec 32))

(assert (=> mapNonEmpty!21313 (= (arr!14386 _values!833) (store mapRest!21313 mapKey!21313 mapValue!21313))))

(declare-fun b!470175 () Bool)

(declare-fun res!280948 () Bool)

(assert (=> b!470175 (=> (not res!280948) (not e!275406))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470175 (= res!280948 (and (= (size!14738 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14737 _keys!1025) (size!14738 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470176 () Bool)

(declare-fun res!280949 () Bool)

(assert (=> b!470176 (=> (not res!280949) (not e!275406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29923 (_ BitVec 32)) Bool)

(assert (=> b!470176 (= res!280949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470177 () Bool)

(declare-fun e!275410 () Bool)

(assert (=> b!470177 (= e!275409 (and e!275410 mapRes!21313))))

(declare-fun condMapEmpty!21313 () Bool)

(declare-fun mapDefault!21313 () ValueCell!6194)

