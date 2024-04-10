; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33470 () Bool)

(assert start!33470)

(declare-fun b!332217 () Bool)

(declare-fun res!183022 () Bool)

(declare-fun e!203960 () Bool)

(assert (=> b!332217 (=> (not res!183022) (not e!203960))))

(declare-datatypes ((array!17041 0))(
  ( (array!17042 (arr!8055 (Array (_ BitVec 32) (_ BitVec 64))) (size!8407 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17041)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17041 (_ BitVec 32)) Bool)

(assert (=> b!332217 (= res!183022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11469 () Bool)

(declare-fun mapRes!11469 () Bool)

(declare-fun tp!23844 () Bool)

(declare-fun e!203958 () Bool)

(assert (=> mapNonEmpty!11469 (= mapRes!11469 (and tp!23844 e!203958))))

(declare-datatypes ((V!9941 0))(
  ( (V!9942 (val!3406 Int)) )
))
(declare-datatypes ((ValueCell!3018 0))(
  ( (ValueCellFull!3018 (v!5565 V!9941)) (EmptyCell!3018) )
))
(declare-datatypes ((array!17043 0))(
  ( (array!17044 (arr!8056 (Array (_ BitVec 32) ValueCell!3018)) (size!8408 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17043)

(declare-fun mapValue!11469 () ValueCell!3018)

(declare-fun mapKey!11469 () (_ BitVec 32))

(declare-fun mapRest!11469 () (Array (_ BitVec 32) ValueCell!3018))

(assert (=> mapNonEmpty!11469 (= (arr!8056 _values!1525) (store mapRest!11469 mapKey!11469 mapValue!11469))))

(declare-fun b!332218 () Bool)

(assert (=> b!332218 (= e!203960 false)))

(declare-fun lt!158980 () Bool)

(declare-datatypes ((List!4585 0))(
  ( (Nil!4582) (Cons!4581 (h!5437 (_ BitVec 64)) (t!9667 List!4585)) )
))
(declare-fun arrayNoDuplicates!0 (array!17041 (_ BitVec 32) List!4585) Bool)

(assert (=> b!332218 (= lt!158980 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4582))))

(declare-fun b!332219 () Bool)

(declare-fun e!203961 () Bool)

(declare-fun e!203959 () Bool)

(assert (=> b!332219 (= e!203961 (and e!203959 mapRes!11469))))

(declare-fun condMapEmpty!11469 () Bool)

(declare-fun mapDefault!11469 () ValueCell!3018)

(assert (=> b!332219 (= condMapEmpty!11469 (= (arr!8056 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3018)) mapDefault!11469)))))

(declare-fun mapIsEmpty!11469 () Bool)

(assert (=> mapIsEmpty!11469 mapRes!11469))

(declare-fun b!332220 () Bool)

(declare-fun tp_is_empty!6723 () Bool)

(assert (=> b!332220 (= e!203959 tp_is_empty!6723)))

(declare-fun res!183021 () Bool)

(assert (=> start!33470 (=> (not res!183021) (not e!203960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33470 (= res!183021 (validMask!0 mask!2385))))

(assert (=> start!33470 e!203960))

(assert (=> start!33470 true))

(declare-fun array_inv!5998 (array!17043) Bool)

(assert (=> start!33470 (and (array_inv!5998 _values!1525) e!203961)))

(declare-fun array_inv!5999 (array!17041) Bool)

(assert (=> start!33470 (array_inv!5999 _keys!1895)))

(declare-fun b!332221 () Bool)

(declare-fun res!183023 () Bool)

(assert (=> b!332221 (=> (not res!183023) (not e!203960))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332221 (= res!183023 (and (= (size!8408 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8407 _keys!1895) (size!8408 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332222 () Bool)

(assert (=> b!332222 (= e!203958 tp_is_empty!6723)))

(assert (= (and start!33470 res!183021) b!332221))

(assert (= (and b!332221 res!183023) b!332217))

(assert (= (and b!332217 res!183022) b!332218))

(assert (= (and b!332219 condMapEmpty!11469) mapIsEmpty!11469))

(assert (= (and b!332219 (not condMapEmpty!11469)) mapNonEmpty!11469))

(get-info :version)

(assert (= (and mapNonEmpty!11469 ((_ is ValueCellFull!3018) mapValue!11469)) b!332222))

(assert (= (and b!332219 ((_ is ValueCellFull!3018) mapDefault!11469)) b!332220))

(assert (= start!33470 b!332219))

(declare-fun m!336813 () Bool)

(assert (=> b!332217 m!336813))

(declare-fun m!336815 () Bool)

(assert (=> mapNonEmpty!11469 m!336815))

(declare-fun m!336817 () Bool)

(assert (=> b!332218 m!336817))

(declare-fun m!336819 () Bool)

(assert (=> start!33470 m!336819))

(declare-fun m!336821 () Bool)

(assert (=> start!33470 m!336821))

(declare-fun m!336823 () Bool)

(assert (=> start!33470 m!336823))

(check-sat (not b!332218) (not b!332217) tp_is_empty!6723 (not mapNonEmpty!11469) (not start!33470))
(check-sat)
