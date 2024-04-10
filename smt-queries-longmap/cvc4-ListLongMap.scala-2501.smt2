; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38828 () Bool)

(assert start!38828)

(declare-fun b!405338 () Bool)

(declare-fun res!233928 () Bool)

(declare-fun e!243727 () Bool)

(assert (=> b!405338 (=> (not res!233928) (not e!243727))))

(declare-datatypes ((array!24385 0))(
  ( (array!24386 (arr!11642 (Array (_ BitVec 32) (_ BitVec 64))) (size!11994 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24385)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405338 (= res!233928 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405339 () Bool)

(declare-fun res!233935 () Bool)

(assert (=> b!405339 (=> (not res!233935) (not e!243727))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24385 (_ BitVec 32)) Bool)

(assert (=> b!405339 (= res!233935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405340 () Bool)

(declare-fun res!233934 () Bool)

(assert (=> b!405340 (=> (not res!233934) (not e!243727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405340 (= res!233934 (validMask!0 mask!1025))))

(declare-fun b!405341 () Bool)

(declare-fun e!243732 () Bool)

(declare-fun e!243730 () Bool)

(declare-fun mapRes!16992 () Bool)

(assert (=> b!405341 (= e!243732 (and e!243730 mapRes!16992))))

(declare-fun condMapEmpty!16992 () Bool)

(declare-datatypes ((V!14767 0))(
  ( (V!14768 (val!5168 Int)) )
))
(declare-datatypes ((ValueCell!4780 0))(
  ( (ValueCellFull!4780 (v!7415 V!14767)) (EmptyCell!4780) )
))
(declare-datatypes ((array!24387 0))(
  ( (array!24388 (arr!11643 (Array (_ BitVec 32) ValueCell!4780)) (size!11995 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24387)

(declare-fun mapDefault!16992 () ValueCell!4780)

