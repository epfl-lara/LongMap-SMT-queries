; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35266 () Bool)

(assert start!35266)

(declare-fun res!195989 () Bool)

(declare-fun e!216486 () Bool)

(assert (=> start!35266 (=> (not res!195989) (not e!216486))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35266 (= res!195989 (validMask!0 mask!1842))))

(assert (=> start!35266 e!216486))

(assert (=> start!35266 true))

(declare-datatypes ((V!11343 0))(
  ( (V!11344 (val!3932 Int)) )
))
(declare-datatypes ((ValueCell!3544 0))(
  ( (ValueCellFull!3544 (v!6125 V!11343)) (EmptyCell!3544) )
))
(declare-datatypes ((array!19139 0))(
  ( (array!19140 (arr!9069 (Array (_ BitVec 32) ValueCell!3544)) (size!9421 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19139)

(declare-fun e!216488 () Bool)

(declare-fun array_inv!6682 (array!19139) Bool)

(assert (=> start!35266 (and (array_inv!6682 _values!1208) e!216488)))

(declare-datatypes ((array!19141 0))(
  ( (array!19142 (arr!9070 (Array (_ BitVec 32) (_ BitVec 64))) (size!9422 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19141)

(declare-fun array_inv!6683 (array!19141) Bool)

(assert (=> start!35266 (array_inv!6683 _keys!1456)))

(declare-fun b!353489 () Bool)

(declare-fun e!216485 () Bool)

(declare-fun tp_is_empty!7775 () Bool)

(assert (=> b!353489 (= e!216485 tp_is_empty!7775)))

(declare-fun mapIsEmpty!13152 () Bool)

(declare-fun mapRes!13152 () Bool)

(assert (=> mapIsEmpty!13152 mapRes!13152))

(declare-fun b!353490 () Bool)

(declare-fun e!216487 () Bool)

(assert (=> b!353490 (= e!216488 (and e!216487 mapRes!13152))))

(declare-fun condMapEmpty!13152 () Bool)

(declare-fun mapDefault!13152 () ValueCell!3544)

