; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33454 () Bool)

(assert start!33454)

(declare-fun b!331924 () Bool)

(declare-fun e!203767 () Bool)

(declare-fun tp_is_empty!6721 () Bool)

(assert (=> b!331924 (= e!203767 tp_is_empty!6721)))

(declare-fun b!331925 () Bool)

(declare-fun res!182883 () Bool)

(declare-fun e!203770 () Bool)

(assert (=> b!331925 (=> (not res!182883) (not e!203770))))

(declare-datatypes ((array!17023 0))(
  ( (array!17024 (arr!8046 (Array (_ BitVec 32) (_ BitVec 64))) (size!8399 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17023)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17023 (_ BitVec 32)) Bool)

(assert (=> b!331925 (= res!182883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331926 () Bool)

(declare-fun e!203766 () Bool)

(assert (=> b!331926 (= e!203766 tp_is_empty!6721)))

(declare-fun res!182885 () Bool)

(assert (=> start!33454 (=> (not res!182885) (not e!203770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33454 (= res!182885 (validMask!0 mask!2385))))

(assert (=> start!33454 e!203770))

(assert (=> start!33454 true))

(declare-datatypes ((V!9939 0))(
  ( (V!9940 (val!3405 Int)) )
))
(declare-datatypes ((ValueCell!3017 0))(
  ( (ValueCellFull!3017 (v!5558 V!9939)) (EmptyCell!3017) )
))
(declare-datatypes ((array!17025 0))(
  ( (array!17026 (arr!8047 (Array (_ BitVec 32) ValueCell!3017)) (size!8400 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17025)

(declare-fun e!203768 () Bool)

(declare-fun array_inv!6006 (array!17025) Bool)

(assert (=> start!33454 (and (array_inv!6006 _values!1525) e!203768)))

(declare-fun array_inv!6007 (array!17023) Bool)

(assert (=> start!33454 (array_inv!6007 _keys!1895)))

(declare-fun b!331927 () Bool)

(declare-fun mapRes!11466 () Bool)

(assert (=> b!331927 (= e!203768 (and e!203767 mapRes!11466))))

(declare-fun condMapEmpty!11466 () Bool)

(declare-fun mapDefault!11466 () ValueCell!3017)

(assert (=> b!331927 (= condMapEmpty!11466 (= (arr!8047 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3017)) mapDefault!11466)))))

(declare-fun b!331928 () Bool)

(declare-fun res!182884 () Bool)

(assert (=> b!331928 (=> (not res!182884) (not e!203770))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331928 (= res!182884 (and (= (size!8400 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8399 _keys!1895) (size!8400 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11466 () Bool)

(declare-fun tp!23841 () Bool)

(assert (=> mapNonEmpty!11466 (= mapRes!11466 (and tp!23841 e!203766))))

(declare-fun mapRest!11466 () (Array (_ BitVec 32) ValueCell!3017))

(declare-fun mapValue!11466 () ValueCell!3017)

(declare-fun mapKey!11466 () (_ BitVec 32))

(assert (=> mapNonEmpty!11466 (= (arr!8047 _values!1525) (store mapRest!11466 mapKey!11466 mapValue!11466))))

(declare-fun b!331929 () Bool)

(assert (=> b!331929 (= e!203770 false)))

(declare-fun lt!158742 () Bool)

(declare-datatypes ((List!4552 0))(
  ( (Nil!4549) (Cons!4548 (h!5404 (_ BitVec 64)) (t!9625 List!4552)) )
))
(declare-fun arrayNoDuplicates!0 (array!17023 (_ BitVec 32) List!4552) Bool)

(assert (=> b!331929 (= lt!158742 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4549))))

(declare-fun mapIsEmpty!11466 () Bool)

(assert (=> mapIsEmpty!11466 mapRes!11466))

(assert (= (and start!33454 res!182885) b!331928))

(assert (= (and b!331928 res!182884) b!331925))

(assert (= (and b!331925 res!182883) b!331929))

(assert (= (and b!331927 condMapEmpty!11466) mapIsEmpty!11466))

(assert (= (and b!331927 (not condMapEmpty!11466)) mapNonEmpty!11466))

(get-info :version)

(assert (= (and mapNonEmpty!11466 ((_ is ValueCellFull!3017) mapValue!11466)) b!331926))

(assert (= (and b!331927 ((_ is ValueCellFull!3017) mapDefault!11466)) b!331924))

(assert (= start!33454 b!331927))

(declare-fun m!336071 () Bool)

(assert (=> b!331925 m!336071))

(declare-fun m!336073 () Bool)

(assert (=> start!33454 m!336073))

(declare-fun m!336075 () Bool)

(assert (=> start!33454 m!336075))

(declare-fun m!336077 () Bool)

(assert (=> start!33454 m!336077))

(declare-fun m!336079 () Bool)

(assert (=> mapNonEmpty!11466 m!336079))

(declare-fun m!336081 () Bool)

(assert (=> b!331929 m!336081))

(check-sat tp_is_empty!6721 (not start!33454) (not b!331929) (not b!331925) (not mapNonEmpty!11466))
(check-sat)
