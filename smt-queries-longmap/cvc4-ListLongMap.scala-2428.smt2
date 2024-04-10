; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38342 () Bool)

(assert start!38342)

(declare-fun b!395388 () Bool)

(declare-fun e!239388 () Bool)

(declare-fun tp_is_empty!9809 () Bool)

(assert (=> b!395388 (= e!239388 tp_is_empty!9809)))

(declare-fun b!395389 () Bool)

(declare-fun res!226663 () Bool)

(declare-fun e!239390 () Bool)

(assert (=> b!395389 (=> (not res!226663) (not e!239390))))

(declare-datatypes ((array!23525 0))(
  ( (array!23526 (arr!11215 (Array (_ BitVec 32) (_ BitVec 64))) (size!11567 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23525)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14183 0))(
  ( (V!14184 (val!4949 Int)) )
))
(declare-datatypes ((ValueCell!4561 0))(
  ( (ValueCellFull!4561 (v!7195 V!14183)) (EmptyCell!4561) )
))
(declare-datatypes ((array!23527 0))(
  ( (array!23528 (arr!11216 (Array (_ BitVec 32) ValueCell!4561)) (size!11568 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23527)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395389 (= res!226663 (and (= (size!11568 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11567 _keys!709) (size!11568 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16326 () Bool)

(declare-fun mapRes!16326 () Bool)

(declare-fun tp!32121 () Bool)

(assert (=> mapNonEmpty!16326 (= mapRes!16326 (and tp!32121 e!239388))))

(declare-fun mapKey!16326 () (_ BitVec 32))

(declare-fun mapValue!16326 () ValueCell!4561)

(declare-fun mapRest!16326 () (Array (_ BitVec 32) ValueCell!4561))

(assert (=> mapNonEmpty!16326 (= (arr!11216 _values!549) (store mapRest!16326 mapKey!16326 mapValue!16326))))

(declare-fun mapIsEmpty!16326 () Bool)

(assert (=> mapIsEmpty!16326 mapRes!16326))

(declare-fun b!395390 () Bool)

(declare-fun res!226666 () Bool)

(assert (=> b!395390 (=> (not res!226666) (not e!239390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23525 (_ BitVec 32)) Bool)

(assert (=> b!395390 (= res!226666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395391 () Bool)

(declare-fun e!239392 () Bool)

(assert (=> b!395391 (= e!239392 tp_is_empty!9809)))

(declare-fun b!395392 () Bool)

(declare-fun res!226664 () Bool)

(assert (=> b!395392 (=> (not res!226664) (not e!239390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395392 (= res!226664 (validMask!0 mask!1025))))

(declare-fun res!226665 () Bool)

(assert (=> start!38342 (=> (not res!226665) (not e!239390))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38342 (= res!226665 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11567 _keys!709))))))

(assert (=> start!38342 e!239390))

(assert (=> start!38342 true))

(declare-fun e!239389 () Bool)

(declare-fun array_inv!8232 (array!23527) Bool)

(assert (=> start!38342 (and (array_inv!8232 _values!549) e!239389)))

(declare-fun array_inv!8233 (array!23525) Bool)

(assert (=> start!38342 (array_inv!8233 _keys!709)))

(declare-fun b!395393 () Bool)

(assert (=> b!395393 (= e!239389 (and e!239392 mapRes!16326))))

(declare-fun condMapEmpty!16326 () Bool)

(declare-fun mapDefault!16326 () ValueCell!4561)

