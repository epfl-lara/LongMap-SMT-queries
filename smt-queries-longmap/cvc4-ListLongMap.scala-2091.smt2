; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35718 () Bool)

(assert start!35718)

(declare-fun mapIsEmpty!13764 () Bool)

(declare-fun mapRes!13764 () Bool)

(assert (=> mapIsEmpty!13764 mapRes!13764))

(declare-fun b!358751 () Bool)

(declare-fun e!219661 () Bool)

(declare-fun tp_is_empty!8171 () Bool)

(assert (=> b!358751 (= e!219661 tp_is_empty!8171)))

(declare-fun b!358752 () Bool)

(declare-fun res!199387 () Bool)

(declare-fun e!219660 () Bool)

(assert (=> b!358752 (=> (not res!199387) (not e!219660))))

(declare-datatypes ((array!19907 0))(
  ( (array!19908 (arr!9447 (Array (_ BitVec 32) (_ BitVec 64))) (size!9799 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19907)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19907 (_ BitVec 32)) Bool)

(assert (=> b!358752 (= res!199387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13764 () Bool)

(declare-fun tp!27822 () Bool)

(declare-fun e!219659 () Bool)

(assert (=> mapNonEmpty!13764 (= mapRes!13764 (and tp!27822 e!219659))))

(declare-datatypes ((V!11871 0))(
  ( (V!11872 (val!4130 Int)) )
))
(declare-datatypes ((ValueCell!3742 0))(
  ( (ValueCellFull!3742 (v!6324 V!11871)) (EmptyCell!3742) )
))
(declare-fun mapRest!13764 () (Array (_ BitVec 32) ValueCell!3742))

(declare-fun mapValue!13764 () ValueCell!3742)

(declare-fun mapKey!13764 () (_ BitVec 32))

(declare-datatypes ((array!19909 0))(
  ( (array!19910 (arr!9448 (Array (_ BitVec 32) ValueCell!3742)) (size!9800 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19909)

(assert (=> mapNonEmpty!13764 (= (arr!9448 _values!1208) (store mapRest!13764 mapKey!13764 mapValue!13764))))

(declare-fun res!199385 () Bool)

(assert (=> start!35718 (=> (not res!199385) (not e!219660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35718 (= res!199385 (validMask!0 mask!1842))))

(assert (=> start!35718 e!219660))

(assert (=> start!35718 true))

(declare-fun e!219658 () Bool)

(declare-fun array_inv!6948 (array!19909) Bool)

(assert (=> start!35718 (and (array_inv!6948 _values!1208) e!219658)))

(declare-fun array_inv!6949 (array!19907) Bool)

(assert (=> start!35718 (array_inv!6949 _keys!1456)))

(declare-fun b!358753 () Bool)

(assert (=> b!358753 (= e!219659 tp_is_empty!8171)))

(declare-fun b!358754 () Bool)

(declare-fun res!199386 () Bool)

(assert (=> b!358754 (=> (not res!199386) (not e!219660))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358754 (= res!199386 (and (= (size!9800 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9799 _keys!1456) (size!9800 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358755 () Bool)

(assert (=> b!358755 (= e!219660 false)))

(declare-fun lt!166244 () Bool)

(declare-datatypes ((List!5444 0))(
  ( (Nil!5441) (Cons!5440 (h!6296 (_ BitVec 64)) (t!10594 List!5444)) )
))
(declare-fun arrayNoDuplicates!0 (array!19907 (_ BitVec 32) List!5444) Bool)

(assert (=> b!358755 (= lt!166244 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5441))))

(declare-fun b!358756 () Bool)

(assert (=> b!358756 (= e!219658 (and e!219661 mapRes!13764))))

(declare-fun condMapEmpty!13764 () Bool)

(declare-fun mapDefault!13764 () ValueCell!3742)

