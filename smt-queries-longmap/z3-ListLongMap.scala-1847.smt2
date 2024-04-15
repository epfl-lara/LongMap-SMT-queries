; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33436 () Bool)

(assert start!33436)

(declare-fun b!331763 () Bool)

(declare-fun res!182804 () Bool)

(declare-fun e!203632 () Bool)

(assert (=> b!331763 (=> (not res!182804) (not e!203632))))

(declare-datatypes ((array!16991 0))(
  ( (array!16992 (arr!8030 (Array (_ BitVec 32) (_ BitVec 64))) (size!8383 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16991)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16991 (_ BitVec 32)) Bool)

(assert (=> b!331763 (= res!182804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331764 () Bool)

(declare-fun res!182803 () Bool)

(assert (=> b!331764 (=> (not res!182803) (not e!203632))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!9915 0))(
  ( (V!9916 (val!3396 Int)) )
))
(declare-datatypes ((ValueCell!3008 0))(
  ( (ValueCellFull!3008 (v!5549 V!9915)) (EmptyCell!3008) )
))
(declare-datatypes ((array!16993 0))(
  ( (array!16994 (arr!8031 (Array (_ BitVec 32) ValueCell!3008)) (size!8384 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16993)

(assert (=> b!331764 (= res!182803 (and (= (size!8384 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8383 _keys!1895) (size!8384 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11439 () Bool)

(declare-fun mapRes!11439 () Bool)

(assert (=> mapIsEmpty!11439 mapRes!11439))

(declare-fun b!331765 () Bool)

(declare-fun e!203633 () Bool)

(declare-fun e!203635 () Bool)

(assert (=> b!331765 (= e!203633 (and e!203635 mapRes!11439))))

(declare-fun condMapEmpty!11439 () Bool)

(declare-fun mapDefault!11439 () ValueCell!3008)

(assert (=> b!331765 (= condMapEmpty!11439 (= (arr!8031 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3008)) mapDefault!11439)))))

(declare-fun b!331766 () Bool)

(assert (=> b!331766 (= e!203632 false)))

(declare-fun lt!158715 () Bool)

(declare-datatypes ((List!4547 0))(
  ( (Nil!4544) (Cons!4543 (h!5399 (_ BitVec 64)) (t!9620 List!4547)) )
))
(declare-fun arrayNoDuplicates!0 (array!16991 (_ BitVec 32) List!4547) Bool)

(assert (=> b!331766 (= lt!158715 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4544))))

(declare-fun mapNonEmpty!11439 () Bool)

(declare-fun tp!23814 () Bool)

(declare-fun e!203634 () Bool)

(assert (=> mapNonEmpty!11439 (= mapRes!11439 (and tp!23814 e!203634))))

(declare-fun mapKey!11439 () (_ BitVec 32))

(declare-fun mapValue!11439 () ValueCell!3008)

(declare-fun mapRest!11439 () (Array (_ BitVec 32) ValueCell!3008))

(assert (=> mapNonEmpty!11439 (= (arr!8031 _values!1525) (store mapRest!11439 mapKey!11439 mapValue!11439))))

(declare-fun b!331767 () Bool)

(declare-fun tp_is_empty!6703 () Bool)

(assert (=> b!331767 (= e!203634 tp_is_empty!6703)))

(declare-fun b!331762 () Bool)

(assert (=> b!331762 (= e!203635 tp_is_empty!6703)))

(declare-fun res!182802 () Bool)

(assert (=> start!33436 (=> (not res!182802) (not e!203632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33436 (= res!182802 (validMask!0 mask!2385))))

(assert (=> start!33436 e!203632))

(assert (=> start!33436 true))

(declare-fun array_inv!5994 (array!16993) Bool)

(assert (=> start!33436 (and (array_inv!5994 _values!1525) e!203633)))

(declare-fun array_inv!5995 (array!16991) Bool)

(assert (=> start!33436 (array_inv!5995 _keys!1895)))

(assert (= (and start!33436 res!182802) b!331764))

(assert (= (and b!331764 res!182803) b!331763))

(assert (= (and b!331763 res!182804) b!331766))

(assert (= (and b!331765 condMapEmpty!11439) mapIsEmpty!11439))

(assert (= (and b!331765 (not condMapEmpty!11439)) mapNonEmpty!11439))

(get-info :version)

(assert (= (and mapNonEmpty!11439 ((_ is ValueCellFull!3008) mapValue!11439)) b!331767))

(assert (= (and b!331765 ((_ is ValueCellFull!3008) mapDefault!11439)) b!331762))

(assert (= start!33436 b!331765))

(declare-fun m!335963 () Bool)

(assert (=> b!331763 m!335963))

(declare-fun m!335965 () Bool)

(assert (=> b!331766 m!335965))

(declare-fun m!335967 () Bool)

(assert (=> mapNonEmpty!11439 m!335967))

(declare-fun m!335969 () Bool)

(assert (=> start!33436 m!335969))

(declare-fun m!335971 () Bool)

(assert (=> start!33436 m!335971))

(declare-fun m!335973 () Bool)

(assert (=> start!33436 m!335973))

(check-sat tp_is_empty!6703 (not start!33436) (not b!331763) (not mapNonEmpty!11439) (not b!331766))
(check-sat)
