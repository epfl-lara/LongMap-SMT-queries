; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40342 () Bool)

(assert start!40342)

(declare-fun b!443237 () Bool)

(declare-fun res!262628 () Bool)

(declare-fun e!260801 () Bool)

(assert (=> b!443237 (=> (not res!262628) (not e!260801))))

(declare-datatypes ((array!27293 0))(
  ( (array!27294 (arr!13095 (Array (_ BitVec 32) (_ BitVec 64))) (size!13447 (_ BitVec 32))) )
))
(declare-fun lt!203303 () array!27293)

(declare-datatypes ((List!7852 0))(
  ( (Nil!7849) (Cons!7848 (h!8704 (_ BitVec 64)) (t!13610 List!7852)) )
))
(declare-fun arrayNoDuplicates!0 (array!27293 (_ BitVec 32) List!7852) Bool)

(assert (=> b!443237 (= res!262628 (arrayNoDuplicates!0 lt!203303 #b00000000000000000000000000000000 Nil!7849))))

(declare-fun b!443238 () Bool)

(declare-fun res!262632 () Bool)

(declare-fun e!260805 () Bool)

(assert (=> b!443238 (=> (not res!262632) (not e!260805))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27293)

(assert (=> b!443238 (= res!262632 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13447 _keys!709))))))

(declare-fun b!443239 () Bool)

(declare-fun res!262629 () Bool)

(assert (=> b!443239 (=> (not res!262629) (not e!260805))))

(assert (=> b!443239 (= res!262629 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7849))))

(declare-fun res!262633 () Bool)

(assert (=> start!40342 (=> (not res!262633) (not e!260805))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40342 (= res!262633 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13447 _keys!709))))))

(assert (=> start!40342 e!260805))

(assert (=> start!40342 true))

(declare-datatypes ((V!16759 0))(
  ( (V!16760 (val!5915 Int)) )
))
(declare-datatypes ((ValueCell!5527 0))(
  ( (ValueCellFull!5527 (v!8166 V!16759)) (EmptyCell!5527) )
))
(declare-datatypes ((array!27295 0))(
  ( (array!27296 (arr!13096 (Array (_ BitVec 32) ValueCell!5527)) (size!13448 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27295)

(declare-fun e!260804 () Bool)

(declare-fun array_inv!9498 (array!27295) Bool)

(assert (=> start!40342 (and (array_inv!9498 _values!549) e!260804)))

(declare-fun array_inv!9499 (array!27293) Bool)

(assert (=> start!40342 (array_inv!9499 _keys!709)))

(declare-fun b!443240 () Bool)

(declare-fun res!262631 () Bool)

(assert (=> b!443240 (=> (not res!262631) (not e!260805))))

(assert (=> b!443240 (= res!262631 (or (= (select (arr!13095 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13095 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443241 () Bool)

(declare-fun res!262625 () Bool)

(assert (=> b!443241 (=> (not res!262625) (not e!260805))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443241 (= res!262625 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443242 () Bool)

(declare-fun res!262630 () Bool)

(assert (=> b!443242 (=> (not res!262630) (not e!260805))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27293 (_ BitVec 32)) Bool)

(assert (=> b!443242 (= res!262630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443243 () Bool)

(declare-fun e!260802 () Bool)

(declare-fun tp_is_empty!11741 () Bool)

(assert (=> b!443243 (= e!260802 tp_is_empty!11741)))

(declare-fun b!443244 () Bool)

(declare-fun res!262627 () Bool)

(assert (=> b!443244 (=> (not res!262627) (not e!260805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443244 (= res!262627 (validKeyInArray!0 k!794))))

(declare-fun b!443245 () Bool)

(declare-fun mapRes!19236 () Bool)

(assert (=> b!443245 (= e!260804 (and e!260802 mapRes!19236))))

(declare-fun condMapEmpty!19236 () Bool)

(declare-fun mapDefault!19236 () ValueCell!5527)

