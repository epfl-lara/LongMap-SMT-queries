; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35750 () Bool)

(assert start!35750)

(declare-fun b!359138 () Bool)

(declare-fun e!219899 () Bool)

(declare-fun tp_is_empty!8203 () Bool)

(assert (=> b!359138 (= e!219899 tp_is_empty!8203)))

(declare-fun res!199628 () Bool)

(declare-fun e!219900 () Bool)

(assert (=> start!35750 (=> (not res!199628) (not e!219900))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35750 (= res!199628 (validMask!0 mask!1842))))

(assert (=> start!35750 e!219900))

(assert (=> start!35750 true))

(declare-datatypes ((V!11915 0))(
  ( (V!11916 (val!4146 Int)) )
))
(declare-datatypes ((ValueCell!3758 0))(
  ( (ValueCellFull!3758 (v!6340 V!11915)) (EmptyCell!3758) )
))
(declare-datatypes ((array!19965 0))(
  ( (array!19966 (arr!9476 (Array (_ BitVec 32) ValueCell!3758)) (size!9828 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19965)

(declare-fun e!219898 () Bool)

(declare-fun array_inv!6974 (array!19965) Bool)

(assert (=> start!35750 (and (array_inv!6974 _values!1208) e!219898)))

(declare-datatypes ((array!19967 0))(
  ( (array!19968 (arr!9477 (Array (_ BitVec 32) (_ BitVec 64))) (size!9829 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19967)

(declare-fun array_inv!6975 (array!19967) Bool)

(assert (=> start!35750 (array_inv!6975 _keys!1456)))

(declare-fun mapNonEmpty!13812 () Bool)

(declare-fun mapRes!13812 () Bool)

(declare-fun tp!27879 () Bool)

(declare-fun e!219901 () Bool)

(assert (=> mapNonEmpty!13812 (= mapRes!13812 (and tp!27879 e!219901))))

(declare-fun mapValue!13812 () ValueCell!3758)

(declare-fun mapRest!13812 () (Array (_ BitVec 32) ValueCell!3758))

(declare-fun mapKey!13812 () (_ BitVec 32))

(assert (=> mapNonEmpty!13812 (= (arr!9476 _values!1208) (store mapRest!13812 mapKey!13812 mapValue!13812))))

(declare-fun b!359139 () Bool)

(declare-fun res!199629 () Bool)

(assert (=> b!359139 (=> (not res!199629) (not e!219900))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359139 (= res!199629 (and (= (size!9828 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9829 _keys!1456) (size!9828 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359140 () Bool)

(assert (=> b!359140 (= e!219900 false)))

(declare-fun lt!166292 () Bool)

(declare-datatypes ((List!5457 0))(
  ( (Nil!5454) (Cons!5453 (h!6309 (_ BitVec 64)) (t!10607 List!5457)) )
))
(declare-fun arrayNoDuplicates!0 (array!19967 (_ BitVec 32) List!5457) Bool)

(assert (=> b!359140 (= lt!166292 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5454))))

(declare-fun b!359141 () Bool)

(assert (=> b!359141 (= e!219898 (and e!219899 mapRes!13812))))

(declare-fun condMapEmpty!13812 () Bool)

(declare-fun mapDefault!13812 () ValueCell!3758)

