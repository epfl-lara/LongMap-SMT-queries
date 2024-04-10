; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35496 () Bool)

(assert start!35496)

(declare-fun b!355736 () Bool)

(declare-fun e!217915 () Bool)

(declare-fun tp_is_empty!7949 () Bool)

(assert (=> b!355736 (= e!217915 tp_is_empty!7949)))

(declare-fun res!197370 () Bool)

(declare-fun e!217912 () Bool)

(assert (=> start!35496 (=> (not res!197370) (not e!217912))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35496 (= res!197370 (validMask!0 mask!1842))))

(assert (=> start!35496 e!217912))

(assert (=> start!35496 true))

(declare-datatypes ((V!11575 0))(
  ( (V!11576 (val!4019 Int)) )
))
(declare-datatypes ((ValueCell!3631 0))(
  ( (ValueCellFull!3631 (v!6213 V!11575)) (EmptyCell!3631) )
))
(declare-datatypes ((array!19475 0))(
  ( (array!19476 (arr!9231 (Array (_ BitVec 32) ValueCell!3631)) (size!9583 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19475)

(declare-fun e!217916 () Bool)

(declare-fun array_inv!6784 (array!19475) Bool)

(assert (=> start!35496 (and (array_inv!6784 _values!1208) e!217916)))

(declare-datatypes ((array!19477 0))(
  ( (array!19478 (arr!9232 (Array (_ BitVec 32) (_ BitVec 64))) (size!9584 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19477)

(declare-fun array_inv!6785 (array!19477) Bool)

(assert (=> start!35496 (array_inv!6785 _keys!1456)))

(declare-fun mapNonEmpty!13431 () Bool)

(declare-fun mapRes!13431 () Bool)

(declare-fun tp!27408 () Bool)

(assert (=> mapNonEmpty!13431 (= mapRes!13431 (and tp!27408 e!217915))))

(declare-fun mapRest!13431 () (Array (_ BitVec 32) ValueCell!3631))

(declare-fun mapKey!13431 () (_ BitVec 32))

(declare-fun mapValue!13431 () ValueCell!3631)

(assert (=> mapNonEmpty!13431 (= (arr!9231 _values!1208) (store mapRest!13431 mapKey!13431 mapValue!13431))))

(declare-fun b!355737 () Bool)

(declare-fun e!217914 () Bool)

(assert (=> b!355737 (= e!217914 tp_is_empty!7949)))

(declare-fun b!355738 () Bool)

(declare-fun res!197371 () Bool)

(assert (=> b!355738 (=> (not res!197371) (not e!217912))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355738 (= res!197371 (and (= (size!9583 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9584 _keys!1456) (size!9583 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355739 () Bool)

(assert (=> b!355739 (= e!217916 (and e!217914 mapRes!13431))))

(declare-fun condMapEmpty!13431 () Bool)

(declare-fun mapDefault!13431 () ValueCell!3631)

