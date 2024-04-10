; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33464 () Bool)

(assert start!33464)

(declare-fun b!332163 () Bool)

(declare-fun res!182996 () Bool)

(declare-fun e!203913 () Bool)

(assert (=> b!332163 (=> (not res!182996) (not e!203913))))

(declare-datatypes ((array!17029 0))(
  ( (array!17030 (arr!8049 (Array (_ BitVec 32) (_ BitVec 64))) (size!8401 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17029)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17029 (_ BitVec 32)) Bool)

(assert (=> b!332163 (= res!182996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11460 () Bool)

(declare-fun mapRes!11460 () Bool)

(declare-fun tp!23835 () Bool)

(declare-fun e!203914 () Bool)

(assert (=> mapNonEmpty!11460 (= mapRes!11460 (and tp!23835 e!203914))))

(declare-fun mapKey!11460 () (_ BitVec 32))

(declare-datatypes ((V!9933 0))(
  ( (V!9934 (val!3403 Int)) )
))
(declare-datatypes ((ValueCell!3015 0))(
  ( (ValueCellFull!3015 (v!5562 V!9933)) (EmptyCell!3015) )
))
(declare-fun mapValue!11460 () ValueCell!3015)

(declare-datatypes ((array!17031 0))(
  ( (array!17032 (arr!8050 (Array (_ BitVec 32) ValueCell!3015)) (size!8402 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17031)

(declare-fun mapRest!11460 () (Array (_ BitVec 32) ValueCell!3015))

(assert (=> mapNonEmpty!11460 (= (arr!8050 _values!1525) (store mapRest!11460 mapKey!11460 mapValue!11460))))

(declare-fun b!332164 () Bool)

(declare-fun e!203912 () Bool)

(declare-fun e!203915 () Bool)

(assert (=> b!332164 (= e!203912 (and e!203915 mapRes!11460))))

(declare-fun condMapEmpty!11460 () Bool)

(declare-fun mapDefault!11460 () ValueCell!3015)

(assert (=> b!332164 (= condMapEmpty!11460 (= (arr!8050 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3015)) mapDefault!11460)))))

(declare-fun mapIsEmpty!11460 () Bool)

(assert (=> mapIsEmpty!11460 mapRes!11460))

(declare-fun b!332165 () Bool)

(declare-fun res!182995 () Bool)

(assert (=> b!332165 (=> (not res!182995) (not e!203913))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332165 (= res!182995 (and (= (size!8402 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8401 _keys!1895) (size!8402 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182994 () Bool)

(assert (=> start!33464 (=> (not res!182994) (not e!203913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33464 (= res!182994 (validMask!0 mask!2385))))

(assert (=> start!33464 e!203913))

(assert (=> start!33464 true))

(declare-fun array_inv!5994 (array!17031) Bool)

(assert (=> start!33464 (and (array_inv!5994 _values!1525) e!203912)))

(declare-fun array_inv!5995 (array!17029) Bool)

(assert (=> start!33464 (array_inv!5995 _keys!1895)))

(declare-fun b!332166 () Bool)

(declare-fun tp_is_empty!6717 () Bool)

(assert (=> b!332166 (= e!203914 tp_is_empty!6717)))

(declare-fun b!332167 () Bool)

(assert (=> b!332167 (= e!203913 false)))

(declare-fun lt!158971 () Bool)

(declare-datatypes ((List!4583 0))(
  ( (Nil!4580) (Cons!4579 (h!5435 (_ BitVec 64)) (t!9665 List!4583)) )
))
(declare-fun arrayNoDuplicates!0 (array!17029 (_ BitVec 32) List!4583) Bool)

(assert (=> b!332167 (= lt!158971 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4580))))

(declare-fun b!332168 () Bool)

(assert (=> b!332168 (= e!203915 tp_is_empty!6717)))

(assert (= (and start!33464 res!182994) b!332165))

(assert (= (and b!332165 res!182995) b!332163))

(assert (= (and b!332163 res!182996) b!332167))

(assert (= (and b!332164 condMapEmpty!11460) mapIsEmpty!11460))

(assert (= (and b!332164 (not condMapEmpty!11460)) mapNonEmpty!11460))

(get-info :version)

(assert (= (and mapNonEmpty!11460 ((_ is ValueCellFull!3015) mapValue!11460)) b!332166))

(assert (= (and b!332164 ((_ is ValueCellFull!3015) mapDefault!11460)) b!332168))

(assert (= start!33464 b!332164))

(declare-fun m!336777 () Bool)

(assert (=> b!332163 m!336777))

(declare-fun m!336779 () Bool)

(assert (=> mapNonEmpty!11460 m!336779))

(declare-fun m!336781 () Bool)

(assert (=> start!33464 m!336781))

(declare-fun m!336783 () Bool)

(assert (=> start!33464 m!336783))

(declare-fun m!336785 () Bool)

(assert (=> start!33464 m!336785))

(declare-fun m!336787 () Bool)

(assert (=> b!332167 m!336787))

(check-sat tp_is_empty!6717 (not b!332167) (not start!33464) (not mapNonEmpty!11460) (not b!332163))
(check-sat)
