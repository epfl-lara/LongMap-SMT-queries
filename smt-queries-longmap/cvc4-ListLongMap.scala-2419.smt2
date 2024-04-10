; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38246 () Bool)

(assert start!38246)

(declare-fun mapNonEmpty!16233 () Bool)

(declare-fun mapRes!16233 () Bool)

(declare-fun tp!32028 () Bool)

(declare-fun e!238884 () Bool)

(assert (=> mapNonEmpty!16233 (= mapRes!16233 (and tp!32028 e!238884))))

(declare-fun mapKey!16233 () (_ BitVec 32))

(declare-datatypes ((V!14111 0))(
  ( (V!14112 (val!4922 Int)) )
))
(declare-datatypes ((ValueCell!4534 0))(
  ( (ValueCellFull!4534 (v!7167 V!14111)) (EmptyCell!4534) )
))
(declare-fun mapRest!16233 () (Array (_ BitVec 32) ValueCell!4534))

(declare-datatypes ((array!23417 0))(
  ( (array!23418 (arr!11165 (Array (_ BitVec 32) ValueCell!4534)) (size!11517 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23417)

(declare-fun mapValue!16233 () ValueCell!4534)

(assert (=> mapNonEmpty!16233 (= (arr!11165 _values!549) (store mapRest!16233 mapKey!16233 mapValue!16233))))

(declare-fun res!226217 () Bool)

(declare-fun e!238883 () Bool)

(assert (=> start!38246 (=> (not res!226217) (not e!238883))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23419 0))(
  ( (array!23420 (arr!11166 (Array (_ BitVec 32) (_ BitVec 64))) (size!11518 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23419)

(assert (=> start!38246 (= res!226217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11518 _keys!709))))))

(assert (=> start!38246 e!238883))

(assert (=> start!38246 true))

(declare-fun e!238886 () Bool)

(declare-fun array_inv!8198 (array!23417) Bool)

(assert (=> start!38246 (and (array_inv!8198 _values!549) e!238886)))

(declare-fun array_inv!8199 (array!23419) Bool)

(assert (=> start!38246 (array_inv!8199 _keys!709)))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394636 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394636 (= e!238883 (and (= (size!11517 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11518 _keys!709) (size!11517 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (not (= (size!11518 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)))))))

(declare-fun mapIsEmpty!16233 () Bool)

(assert (=> mapIsEmpty!16233 mapRes!16233))

(declare-fun b!394637 () Bool)

(declare-fun res!226216 () Bool)

(assert (=> b!394637 (=> (not res!226216) (not e!238883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394637 (= res!226216 (validMask!0 mask!1025))))

(declare-fun b!394638 () Bool)

(declare-fun tp_is_empty!9755 () Bool)

(assert (=> b!394638 (= e!238884 tp_is_empty!9755)))

(declare-fun b!394639 () Bool)

(declare-fun e!238885 () Bool)

(assert (=> b!394639 (= e!238886 (and e!238885 mapRes!16233))))

(declare-fun condMapEmpty!16233 () Bool)

(declare-fun mapDefault!16233 () ValueCell!4534)

