; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20806 () Bool)

(assert start!20806)

(declare-fun b_free!5459 () Bool)

(declare-fun b_next!5459 () Bool)

(assert (=> start!20806 (= b_free!5459 (not b_next!5459))))

(declare-fun tp!19418 () Bool)

(declare-fun b_and!12205 () Bool)

(assert (=> start!20806 (= tp!19418 b_and!12205)))

(declare-fun b!208550 () Bool)

(declare-fun res!101475 () Bool)

(declare-fun e!136003 () Bool)

(assert (=> b!208550 (=> (not res!101475) (not e!136003))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208550 (= res!101475 (validKeyInArray!0 k!843))))

(declare-fun b!208551 () Bool)

(declare-fun res!101479 () Bool)

(assert (=> b!208551 (=> (not res!101479) (not e!136003))))

(declare-datatypes ((array!9845 0))(
  ( (array!9846 (arr!4673 (Array (_ BitVec 32) (_ BitVec 64))) (size!4998 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9845)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9845 (_ BitVec 32)) Bool)

(assert (=> b!208551 (= res!101479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208552 () Bool)

(declare-fun res!101477 () Bool)

(assert (=> b!208552 (=> (not res!101477) (not e!136003))))

(declare-datatypes ((List!2995 0))(
  ( (Nil!2992) (Cons!2991 (h!3633 (_ BitVec 64)) (t!7926 List!2995)) )
))
(declare-fun arrayNoDuplicates!0 (array!9845 (_ BitVec 32) List!2995) Bool)

(assert (=> b!208552 (= res!101477 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2992))))

(declare-fun b!208553 () Bool)

(declare-fun e!136001 () Bool)

(declare-fun tp_is_empty!5321 () Bool)

(assert (=> b!208553 (= e!136001 tp_is_empty!5321)))

(declare-fun b!208554 () Bool)

(declare-fun res!101476 () Bool)

(assert (=> b!208554 (=> (not res!101476) (not e!136003))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208554 (= res!101476 (= (select (arr!4673 _keys!825) i!601) k!843))))

(declare-fun b!208555 () Bool)

(declare-fun res!101473 () Bool)

(assert (=> b!208555 (=> (not res!101473) (not e!136003))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6741 0))(
  ( (V!6742 (val!2705 Int)) )
))
(declare-datatypes ((ValueCell!2317 0))(
  ( (ValueCellFull!2317 (v!4675 V!6741)) (EmptyCell!2317) )
))
(declare-datatypes ((array!9847 0))(
  ( (array!9848 (arr!4674 (Array (_ BitVec 32) ValueCell!2317)) (size!4999 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9847)

(assert (=> b!208555 (= res!101473 (and (= (size!4999 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4998 _keys!825) (size!4999 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208556 () Bool)

(declare-fun e!136004 () Bool)

(assert (=> b!208556 (= e!136004 tp_is_empty!5321)))

(declare-fun mapNonEmpty!9050 () Bool)

(declare-fun mapRes!9050 () Bool)

(declare-fun tp!19417 () Bool)

(assert (=> mapNonEmpty!9050 (= mapRes!9050 (and tp!19417 e!136001))))

(declare-fun mapValue!9050 () ValueCell!2317)

(declare-fun mapRest!9050 () (Array (_ BitVec 32) ValueCell!2317))

(declare-fun mapKey!9050 () (_ BitVec 32))

(assert (=> mapNonEmpty!9050 (= (arr!4674 _values!649) (store mapRest!9050 mapKey!9050 mapValue!9050))))

(declare-fun res!101478 () Bool)

(assert (=> start!20806 (=> (not res!101478) (not e!136003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20806 (= res!101478 (validMask!0 mask!1149))))

(assert (=> start!20806 e!136003))

(declare-fun e!136000 () Bool)

(declare-fun array_inv!3099 (array!9847) Bool)

(assert (=> start!20806 (and (array_inv!3099 _values!649) e!136000)))

(assert (=> start!20806 true))

(assert (=> start!20806 tp_is_empty!5321))

(declare-fun array_inv!3100 (array!9845) Bool)

(assert (=> start!20806 (array_inv!3100 _keys!825)))

(assert (=> start!20806 tp!19418))

(declare-fun b!208557 () Bool)

(assert (=> b!208557 (= e!136000 (and e!136004 mapRes!9050))))

(declare-fun condMapEmpty!9050 () Bool)

(declare-fun mapDefault!9050 () ValueCell!2317)

