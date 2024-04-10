; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38486 () Bool)

(assert start!38486)

(declare-fun b!397373 () Bool)

(declare-fun res!228151 () Bool)

(declare-fun e!240328 () Bool)

(assert (=> b!397373 (=> (not res!228151) (not e!240328))))

(declare-datatypes ((array!23723 0))(
  ( (array!23724 (arr!11311 (Array (_ BitVec 32) (_ BitVec 64))) (size!11663 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23723)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397373 (= res!228151 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16479 () Bool)

(declare-fun mapRes!16479 () Bool)

(declare-fun tp!32274 () Bool)

(declare-fun e!240329 () Bool)

(assert (=> mapNonEmpty!16479 (= mapRes!16479 (and tp!32274 e!240329))))

(declare-datatypes ((V!14311 0))(
  ( (V!14312 (val!4997 Int)) )
))
(declare-datatypes ((ValueCell!4609 0))(
  ( (ValueCellFull!4609 (v!7244 V!14311)) (EmptyCell!4609) )
))
(declare-datatypes ((array!23725 0))(
  ( (array!23726 (arr!11312 (Array (_ BitVec 32) ValueCell!4609)) (size!11664 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23725)

(declare-fun mapKey!16479 () (_ BitVec 32))

(declare-fun mapRest!16479 () (Array (_ BitVec 32) ValueCell!4609))

(declare-fun mapValue!16479 () ValueCell!4609)

(assert (=> mapNonEmpty!16479 (= (arr!11312 _values!549) (store mapRest!16479 mapKey!16479 mapValue!16479))))

(declare-fun b!397374 () Bool)

(declare-fun res!228157 () Bool)

(assert (=> b!397374 (=> (not res!228157) (not e!240328))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23723 (_ BitVec 32)) Bool)

(assert (=> b!397374 (= res!228157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397375 () Bool)

(declare-fun res!228152 () Bool)

(assert (=> b!397375 (=> (not res!228152) (not e!240328))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397375 (= res!228152 (or (= (select (arr!11311 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11311 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397376 () Bool)

(declare-fun e!240326 () Bool)

(assert (=> b!397376 (= e!240328 e!240326)))

(declare-fun res!228158 () Bool)

(assert (=> b!397376 (=> (not res!228158) (not e!240326))))

(declare-fun lt!187294 () array!23723)

(assert (=> b!397376 (= res!228158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187294 mask!1025))))

(assert (=> b!397376 (= lt!187294 (array!23724 (store (arr!11311 _keys!709) i!563 k!794) (size!11663 _keys!709)))))

(declare-fun b!397377 () Bool)

(declare-fun tp_is_empty!9905 () Bool)

(assert (=> b!397377 (= e!240329 tp_is_empty!9905)))

(declare-fun b!397378 () Bool)

(declare-fun res!228150 () Bool)

(assert (=> b!397378 (=> (not res!228150) (not e!240328))))

(declare-datatypes ((List!6547 0))(
  ( (Nil!6544) (Cons!6543 (h!7399 (_ BitVec 64)) (t!11721 List!6547)) )
))
(declare-fun arrayNoDuplicates!0 (array!23723 (_ BitVec 32) List!6547) Bool)

(assert (=> b!397378 (= res!228150 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6544))))

(declare-fun b!397379 () Bool)

(declare-fun e!240327 () Bool)

(assert (=> b!397379 (= e!240327 tp_is_empty!9905)))

(declare-fun b!397380 () Bool)

(assert (=> b!397380 (= e!240326 false)))

(declare-fun lt!187295 () Bool)

(assert (=> b!397380 (= lt!187295 (arrayNoDuplicates!0 lt!187294 #b00000000000000000000000000000000 Nil!6544))))

(declare-fun b!397381 () Bool)

(declare-fun res!228154 () Bool)

(assert (=> b!397381 (=> (not res!228154) (not e!240328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397381 (= res!228154 (validKeyInArray!0 k!794))))

(declare-fun res!228155 () Bool)

(assert (=> start!38486 (=> (not res!228155) (not e!240328))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38486 (= res!228155 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11663 _keys!709))))))

(assert (=> start!38486 e!240328))

(assert (=> start!38486 true))

(declare-fun e!240330 () Bool)

(declare-fun array_inv!8290 (array!23725) Bool)

(assert (=> start!38486 (and (array_inv!8290 _values!549) e!240330)))

(declare-fun array_inv!8291 (array!23723) Bool)

(assert (=> start!38486 (array_inv!8291 _keys!709)))

(declare-fun b!397382 () Bool)

(declare-fun res!228159 () Bool)

(assert (=> b!397382 (=> (not res!228159) (not e!240328))))

(assert (=> b!397382 (= res!228159 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11663 _keys!709))))))

(declare-fun mapIsEmpty!16479 () Bool)

(assert (=> mapIsEmpty!16479 mapRes!16479))

(declare-fun b!397383 () Bool)

(declare-fun res!228156 () Bool)

(assert (=> b!397383 (=> (not res!228156) (not e!240328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397383 (= res!228156 (validMask!0 mask!1025))))

(declare-fun b!397384 () Bool)

(assert (=> b!397384 (= e!240330 (and e!240327 mapRes!16479))))

(declare-fun condMapEmpty!16479 () Bool)

(declare-fun mapDefault!16479 () ValueCell!4609)

