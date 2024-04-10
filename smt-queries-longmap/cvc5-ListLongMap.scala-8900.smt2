; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108040 () Bool)

(assert start!108040)

(declare-fun b!1276054 () Bool)

(declare-fun e!728601 () Bool)

(declare-fun tp_is_empty!33313 () Bool)

(assert (=> b!1276054 (= e!728601 tp_is_empty!33313)))

(declare-fun b!1276055 () Bool)

(declare-fun res!848073 () Bool)

(declare-fun e!728604 () Bool)

(assert (=> b!1276055 (=> (not res!848073) (not e!728604))))

(declare-datatypes ((array!83720 0))(
  ( (array!83721 (arr!40372 (Array (_ BitVec 32) (_ BitVec 64))) (size!40922 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83720)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83720 (_ BitVec 32)) Bool)

(assert (=> b!1276055 (= res!848073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276056 () Bool)

(declare-fun e!728603 () Bool)

(declare-fun mapRes!51497 () Bool)

(assert (=> b!1276056 (= e!728603 (and e!728601 mapRes!51497))))

(declare-fun condMapEmpty!51497 () Bool)

(declare-datatypes ((V!49521 0))(
  ( (V!49522 (val!16731 Int)) )
))
(declare-datatypes ((ValueCell!15758 0))(
  ( (ValueCellFull!15758 (v!19328 V!49521)) (EmptyCell!15758) )
))
(declare-datatypes ((array!83722 0))(
  ( (array!83723 (arr!40373 (Array (_ BitVec 32) ValueCell!15758)) (size!40923 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83722)

(declare-fun mapDefault!51497 () ValueCell!15758)

