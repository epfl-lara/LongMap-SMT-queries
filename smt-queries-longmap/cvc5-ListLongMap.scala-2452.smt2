; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38530 () Bool)

(assert start!38530)

(declare-fun res!228811 () Bool)

(declare-fun e!240724 () Bool)

(assert (=> start!38530 (=> (not res!228811) (not e!240724))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23809 0))(
  ( (array!23810 (arr!11354 (Array (_ BitVec 32) (_ BitVec 64))) (size!11706 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23809)

(assert (=> start!38530 (= res!228811 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11706 _keys!709))))))

(assert (=> start!38530 e!240724))

(assert (=> start!38530 true))

(declare-datatypes ((V!14371 0))(
  ( (V!14372 (val!5019 Int)) )
))
(declare-datatypes ((ValueCell!4631 0))(
  ( (ValueCellFull!4631 (v!7266 V!14371)) (EmptyCell!4631) )
))
(declare-datatypes ((array!23811 0))(
  ( (array!23812 (arr!11355 (Array (_ BitVec 32) ValueCell!4631)) (size!11707 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23811)

(declare-fun e!240726 () Bool)

(declare-fun array_inv!8320 (array!23811) Bool)

(assert (=> start!38530 (and (array_inv!8320 _values!549) e!240726)))

(declare-fun array_inv!8321 (array!23809) Bool)

(assert (=> start!38530 (array_inv!8321 _keys!709)))

(declare-fun b!398231 () Bool)

(declare-fun res!228816 () Bool)

(assert (=> b!398231 (=> (not res!228816) (not e!240724))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398231 (= res!228816 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11706 _keys!709))))))

(declare-fun b!398232 () Bool)

(declare-fun res!228817 () Bool)

(assert (=> b!398232 (=> (not res!228817) (not e!240724))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398232 (= res!228817 (and (= (size!11707 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11706 _keys!709) (size!11707 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398233 () Bool)

(declare-fun res!228812 () Bool)

(assert (=> b!398233 (=> (not res!228812) (not e!240724))))

(assert (=> b!398233 (= res!228812 (or (= (select (arr!11354 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11354 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398234 () Bool)

(declare-fun res!228818 () Bool)

(assert (=> b!398234 (=> (not res!228818) (not e!240724))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398234 (= res!228818 (validKeyInArray!0 k!794))))

(declare-fun b!398235 () Bool)

(declare-fun res!228813 () Bool)

(assert (=> b!398235 (=> (not res!228813) (not e!240724))))

(declare-fun arrayContainsKey!0 (array!23809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398235 (= res!228813 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398236 () Bool)

(declare-fun res!228815 () Bool)

(assert (=> b!398236 (=> (not res!228815) (not e!240724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398236 (= res!228815 (validMask!0 mask!1025))))

(declare-fun b!398237 () Bool)

(declare-fun e!240722 () Bool)

(assert (=> b!398237 (= e!240724 e!240722)))

(declare-fun res!228810 () Bool)

(assert (=> b!398237 (=> (not res!228810) (not e!240722))))

(declare-fun lt!187427 () array!23809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23809 (_ BitVec 32)) Bool)

(assert (=> b!398237 (= res!228810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187427 mask!1025))))

(assert (=> b!398237 (= lt!187427 (array!23810 (store (arr!11354 _keys!709) i!563 k!794) (size!11706 _keys!709)))))

(declare-fun b!398238 () Bool)

(declare-fun e!240725 () Bool)

(declare-fun tp_is_empty!9949 () Bool)

(assert (=> b!398238 (= e!240725 tp_is_empty!9949)))

(declare-fun b!398239 () Bool)

(declare-fun e!240723 () Bool)

(declare-fun mapRes!16545 () Bool)

(assert (=> b!398239 (= e!240726 (and e!240723 mapRes!16545))))

(declare-fun condMapEmpty!16545 () Bool)

(declare-fun mapDefault!16545 () ValueCell!4631)

