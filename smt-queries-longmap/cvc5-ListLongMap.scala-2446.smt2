; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38494 () Bool)

(assert start!38494)

(declare-fun b!397529 () Bool)

(declare-fun res!228270 () Bool)

(declare-fun e!240401 () Bool)

(assert (=> b!397529 (=> (not res!228270) (not e!240401))))

(declare-datatypes ((array!23739 0))(
  ( (array!23740 (arr!11319 (Array (_ BitVec 32) (_ BitVec 64))) (size!11671 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23739)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397529 (= res!228270 (or (= (select (arr!11319 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11319 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397530 () Bool)

(declare-fun res!228271 () Bool)

(assert (=> b!397530 (=> (not res!228271) (not e!240401))))

(declare-datatypes ((List!6551 0))(
  ( (Nil!6548) (Cons!6547 (h!7403 (_ BitVec 64)) (t!11725 List!6551)) )
))
(declare-fun arrayNoDuplicates!0 (array!23739 (_ BitVec 32) List!6551) Bool)

(assert (=> b!397530 (= res!228271 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6548))))

(declare-fun b!397531 () Bool)

(declare-fun res!228278 () Bool)

(assert (=> b!397531 (=> (not res!228278) (not e!240401))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397531 (= res!228278 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397532 () Bool)

(declare-fun res!228274 () Bool)

(assert (=> b!397532 (=> (not res!228274) (not e!240401))))

(assert (=> b!397532 (= res!228274 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11671 _keys!709))))))

(declare-fun b!397533 () Bool)

(declare-fun res!228276 () Bool)

(assert (=> b!397533 (=> (not res!228276) (not e!240401))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397533 (= res!228276 (validMask!0 mask!1025))))

(declare-fun b!397534 () Bool)

(declare-fun e!240398 () Bool)

(declare-fun e!240400 () Bool)

(declare-fun mapRes!16491 () Bool)

(assert (=> b!397534 (= e!240398 (and e!240400 mapRes!16491))))

(declare-fun condMapEmpty!16491 () Bool)

(declare-datatypes ((V!14323 0))(
  ( (V!14324 (val!5001 Int)) )
))
(declare-datatypes ((ValueCell!4613 0))(
  ( (ValueCellFull!4613 (v!7248 V!14323)) (EmptyCell!4613) )
))
(declare-datatypes ((array!23741 0))(
  ( (array!23742 (arr!11320 (Array (_ BitVec 32) ValueCell!4613)) (size!11672 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23741)

(declare-fun mapDefault!16491 () ValueCell!4613)

