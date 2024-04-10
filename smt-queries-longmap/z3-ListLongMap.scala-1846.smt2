; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33446 () Bool)

(assert start!33446)

(declare-fun b!332001 () Bool)

(declare-fun res!182913 () Bool)

(declare-fun e!203781 () Bool)

(assert (=> b!332001 (=> (not res!182913) (not e!203781))))

(declare-datatypes ((array!16999 0))(
  ( (array!17000 (arr!8034 (Array (_ BitVec 32) (_ BitVec 64))) (size!8386 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16999)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16999 (_ BitVec 32)) Bool)

(assert (=> b!332001 (= res!182913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332002 () Bool)

(assert (=> b!332002 (= e!203781 false)))

(declare-fun lt!158944 () Bool)

(declare-datatypes ((List!4579 0))(
  ( (Nil!4576) (Cons!4575 (h!5431 (_ BitVec 64)) (t!9661 List!4579)) )
))
(declare-fun arrayNoDuplicates!0 (array!16999 (_ BitVec 32) List!4579) Bool)

(assert (=> b!332002 (= lt!158944 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4576))))

(declare-fun mapIsEmpty!11433 () Bool)

(declare-fun mapRes!11433 () Bool)

(assert (=> mapIsEmpty!11433 mapRes!11433))

(declare-fun b!332003 () Bool)

(declare-fun e!203780 () Bool)

(declare-fun tp_is_empty!6699 () Bool)

(assert (=> b!332003 (= e!203780 tp_is_empty!6699)))

(declare-fun res!182915 () Bool)

(assert (=> start!33446 (=> (not res!182915) (not e!203781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33446 (= res!182915 (validMask!0 mask!2385))))

(assert (=> start!33446 e!203781))

(assert (=> start!33446 true))

(declare-datatypes ((V!9909 0))(
  ( (V!9910 (val!3394 Int)) )
))
(declare-datatypes ((ValueCell!3006 0))(
  ( (ValueCellFull!3006 (v!5553 V!9909)) (EmptyCell!3006) )
))
(declare-datatypes ((array!17001 0))(
  ( (array!17002 (arr!8035 (Array (_ BitVec 32) ValueCell!3006)) (size!8387 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17001)

(declare-fun e!203778 () Bool)

(declare-fun array_inv!5984 (array!17001) Bool)

(assert (=> start!33446 (and (array_inv!5984 _values!1525) e!203778)))

(declare-fun array_inv!5985 (array!16999) Bool)

(assert (=> start!33446 (array_inv!5985 _keys!1895)))

(declare-fun b!332004 () Bool)

(declare-fun res!182914 () Bool)

(assert (=> b!332004 (=> (not res!182914) (not e!203781))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332004 (= res!182914 (and (= (size!8387 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8386 _keys!1895) (size!8387 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11433 () Bool)

(declare-fun tp!23808 () Bool)

(declare-fun e!203777 () Bool)

(assert (=> mapNonEmpty!11433 (= mapRes!11433 (and tp!23808 e!203777))))

(declare-fun mapValue!11433 () ValueCell!3006)

(declare-fun mapRest!11433 () (Array (_ BitVec 32) ValueCell!3006))

(declare-fun mapKey!11433 () (_ BitVec 32))

(assert (=> mapNonEmpty!11433 (= (arr!8035 _values!1525) (store mapRest!11433 mapKey!11433 mapValue!11433))))

(declare-fun b!332005 () Bool)

(assert (=> b!332005 (= e!203777 tp_is_empty!6699)))

(declare-fun b!332006 () Bool)

(assert (=> b!332006 (= e!203778 (and e!203780 mapRes!11433))))

(declare-fun condMapEmpty!11433 () Bool)

(declare-fun mapDefault!11433 () ValueCell!3006)

(assert (=> b!332006 (= condMapEmpty!11433 (= (arr!8035 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3006)) mapDefault!11433)))))

(assert (= (and start!33446 res!182915) b!332004))

(assert (= (and b!332004 res!182914) b!332001))

(assert (= (and b!332001 res!182913) b!332002))

(assert (= (and b!332006 condMapEmpty!11433) mapIsEmpty!11433))

(assert (= (and b!332006 (not condMapEmpty!11433)) mapNonEmpty!11433))

(get-info :version)

(assert (= (and mapNonEmpty!11433 ((_ is ValueCellFull!3006) mapValue!11433)) b!332005))

(assert (= (and b!332006 ((_ is ValueCellFull!3006) mapDefault!11433)) b!332003))

(assert (= start!33446 b!332006))

(declare-fun m!336669 () Bool)

(assert (=> b!332001 m!336669))

(declare-fun m!336671 () Bool)

(assert (=> b!332002 m!336671))

(declare-fun m!336673 () Bool)

(assert (=> start!33446 m!336673))

(declare-fun m!336675 () Bool)

(assert (=> start!33446 m!336675))

(declare-fun m!336677 () Bool)

(assert (=> start!33446 m!336677))

(declare-fun m!336679 () Bool)

(assert (=> mapNonEmpty!11433 m!336679))

(check-sat (not start!33446) tp_is_empty!6699 (not b!332001) (not mapNonEmpty!11433) (not b!332002))
(check-sat)
