; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7426 () Bool)

(assert start!7426)

(declare-fun b!47804 () Bool)

(declare-fun e!30645 () Bool)

(declare-fun call!3738 () Bool)

(assert (=> b!47804 (= e!30645 (not call!3738))))

(declare-fun b!47805 () Bool)

(declare-fun e!30643 () Bool)

(assert (=> b!47805 (= e!30643 (not call!3738))))

(declare-fun b!47806 () Bool)

(declare-fun e!30648 () Bool)

(assert (=> b!47806 (= e!30648 e!30645)))

(declare-fun c!6426 () Bool)

(declare-datatypes ((SeekEntryResult!211 0))(
  ( (MissingZero!211 (index!2966 (_ BitVec 32))) (Found!211 (index!2967 (_ BitVec 32))) (Intermediate!211 (undefined!1023 Bool) (index!2968 (_ BitVec 32)) (x!8791 (_ BitVec 32))) (Undefined!211) (MissingVacant!211 (index!2969 (_ BitVec 32))) )
))
(declare-fun lt!20456 () SeekEntryResult!211)

(assert (=> b!47806 (= c!6426 (is-MissingVacant!211 lt!20456))))

(declare-fun res!27796 () Bool)

(declare-fun e!30646 () Bool)

(assert (=> start!7426 (=> (not res!27796) (not e!30646))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7426 (= res!27796 (validMask!0 mask!2458))))

(assert (=> start!7426 e!30646))

(assert (=> start!7426 true))

(declare-datatypes ((array!3187 0))(
  ( (array!3188 (arr!1528 (Array (_ BitVec 32) (_ BitVec 64))) (size!1750 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3187)

(declare-fun array_inv!924 (array!3187) Bool)

(assert (=> start!7426 (array_inv!924 _keys!1940)))

(declare-datatypes ((V!2483 0))(
  ( (V!2484 (val!1070 Int)) )
))
(declare-datatypes ((ValueCell!742 0))(
  ( (ValueCellFull!742 (v!2131 V!2483)) (EmptyCell!742) )
))
(declare-datatypes ((array!3189 0))(
  ( (array!3190 (arr!1529 (Array (_ BitVec 32) ValueCell!742)) (size!1751 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3189)

(declare-fun e!30644 () Bool)

(declare-fun array_inv!925 (array!3189) Bool)

(assert (=> start!7426 (and (array_inv!925 _values!1550) e!30644)))

(declare-fun b!47807 () Bool)

(declare-fun res!27799 () Bool)

(assert (=> b!47807 (=> res!27799 e!30643)))

(assert (=> b!47807 (= res!27799 (not (is-MissingZero!211 lt!20456)))))

(assert (=> b!47807 (= e!30645 e!30643)))

(declare-fun b!47808 () Bool)

(declare-fun call!3739 () Bool)

(assert (=> b!47808 (= e!30648 (not call!3739))))

(declare-fun b!47809 () Bool)

(declare-fun e!30642 () Bool)

(declare-fun tp_is_empty!2063 () Bool)

(assert (=> b!47809 (= e!30642 tp_is_empty!2063)))

(declare-fun mapIsEmpty!2138 () Bool)

(declare-fun mapRes!2138 () Bool)

(assert (=> mapIsEmpty!2138 mapRes!2138))

(declare-fun mapNonEmpty!2138 () Bool)

(declare-fun tp!6287 () Bool)

(assert (=> mapNonEmpty!2138 (= mapRes!2138 (and tp!6287 e!30642))))

(declare-fun mapValue!2138 () ValueCell!742)

(declare-fun mapKey!2138 () (_ BitVec 32))

(declare-fun mapRest!2138 () (Array (_ BitVec 32) ValueCell!742))

(assert (=> mapNonEmpty!2138 (= (arr!1529 _values!1550) (store mapRest!2138 mapKey!2138 mapValue!2138))))

(declare-fun b!47810 () Bool)

(declare-fun e!30647 () Bool)

(assert (=> b!47810 (= e!30644 (and e!30647 mapRes!2138))))

(declare-fun condMapEmpty!2138 () Bool)

(declare-fun mapDefault!2138 () ValueCell!742)

