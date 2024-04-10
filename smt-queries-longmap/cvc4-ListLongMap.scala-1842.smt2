; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33386 () Bool)

(assert start!33386)

(declare-fun b!331667 () Bool)

(declare-fun res!182736 () Bool)

(declare-fun e!203526 () Bool)

(assert (=> b!331667 (=> (not res!182736) (not e!203526))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9879 0))(
  ( (V!9880 (val!3383 Int)) )
))
(declare-datatypes ((ValueCell!2995 0))(
  ( (ValueCellFull!2995 (v!5541 V!9879)) (EmptyCell!2995) )
))
(declare-datatypes ((array!16947 0))(
  ( (array!16948 (arr!8012 (Array (_ BitVec 32) ValueCell!2995)) (size!8364 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16947)

(declare-datatypes ((array!16949 0))(
  ( (array!16950 (arr!8013 (Array (_ BitVec 32) (_ BitVec 64))) (size!8365 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16949)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331667 (= res!182736 (and (= (size!8364 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8365 _keys!1895) (size!8364 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331668 () Bool)

(declare-fun e!203524 () Bool)

(declare-fun tp_is_empty!6677 () Bool)

(assert (=> b!331668 (= e!203524 tp_is_empty!6677)))

(declare-fun b!331669 () Bool)

(assert (=> b!331669 (= e!203526 (bvsgt #b00000000000000000000000000000000 (size!8365 _keys!1895)))))

(declare-fun res!182735 () Bool)

(assert (=> start!33386 (=> (not res!182735) (not e!203526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33386 (= res!182735 (validMask!0 mask!2385))))

(assert (=> start!33386 e!203526))

(assert (=> start!33386 true))

(declare-fun e!203523 () Bool)

(declare-fun array_inv!5970 (array!16947) Bool)

(assert (=> start!33386 (and (array_inv!5970 _values!1525) e!203523)))

(declare-fun array_inv!5971 (array!16949) Bool)

(assert (=> start!33386 (array_inv!5971 _keys!1895)))

(declare-fun mapNonEmpty!11388 () Bool)

(declare-fun mapRes!11388 () Bool)

(declare-fun tp!23763 () Bool)

(declare-fun e!203527 () Bool)

(assert (=> mapNonEmpty!11388 (= mapRes!11388 (and tp!23763 e!203527))))

(declare-fun mapRest!11388 () (Array (_ BitVec 32) ValueCell!2995))

(declare-fun mapKey!11388 () (_ BitVec 32))

(declare-fun mapValue!11388 () ValueCell!2995)

(assert (=> mapNonEmpty!11388 (= (arr!8012 _values!1525) (store mapRest!11388 mapKey!11388 mapValue!11388))))

(declare-fun b!331670 () Bool)

(assert (=> b!331670 (= e!203527 tp_is_empty!6677)))

(declare-fun b!331671 () Bool)

(declare-fun res!182734 () Bool)

(assert (=> b!331671 (=> (not res!182734) (not e!203526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16949 (_ BitVec 32)) Bool)

(assert (=> b!331671 (= res!182734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11388 () Bool)

(assert (=> mapIsEmpty!11388 mapRes!11388))

(declare-fun b!331672 () Bool)

(assert (=> b!331672 (= e!203523 (and e!203524 mapRes!11388))))

(declare-fun condMapEmpty!11388 () Bool)

(declare-fun mapDefault!11388 () ValueCell!2995)

