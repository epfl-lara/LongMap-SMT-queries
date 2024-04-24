; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33436 () Bool)

(assert start!33436)

(declare-fun mapIsEmpty!11439 () Bool)

(declare-fun mapRes!11439 () Bool)

(assert (=> mapIsEmpty!11439 mapRes!11439))

(declare-fun b!331984 () Bool)

(declare-fun res!182928 () Bool)

(declare-fun e!203776 () Bool)

(assert (=> b!331984 (=> (not res!182928) (not e!203776))))

(declare-datatypes ((array!17002 0))(
  ( (array!17003 (arr!8035 (Array (_ BitVec 32) (_ BitVec 64))) (size!8387 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17002)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17002 (_ BitVec 32)) Bool)

(assert (=> b!331984 (= res!182928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331985 () Bool)

(declare-fun res!182929 () Bool)

(assert (=> b!331985 (=> (not res!182929) (not e!203776))))

(declare-datatypes ((V!9915 0))(
  ( (V!9916 (val!3396 Int)) )
))
(declare-datatypes ((ValueCell!3008 0))(
  ( (ValueCellFull!3008 (v!5556 V!9915)) (EmptyCell!3008) )
))
(declare-datatypes ((array!17004 0))(
  ( (array!17005 (arr!8036 (Array (_ BitVec 32) ValueCell!3008)) (size!8388 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17004)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331985 (= res!182929 (and (= (size!8388 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8387 _keys!1895) (size!8388 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331986 () Bool)

(declare-fun e!203775 () Bool)

(declare-fun e!203777 () Bool)

(assert (=> b!331986 (= e!203775 (and e!203777 mapRes!11439))))

(declare-fun condMapEmpty!11439 () Bool)

(declare-fun mapDefault!11439 () ValueCell!3008)

(assert (=> b!331986 (= condMapEmpty!11439 (= (arr!8036 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3008)) mapDefault!11439)))))

(declare-fun mapNonEmpty!11439 () Bool)

(declare-fun tp!23814 () Bool)

(declare-fun e!203773 () Bool)

(assert (=> mapNonEmpty!11439 (= mapRes!11439 (and tp!23814 e!203773))))

(declare-fun mapRest!11439 () (Array (_ BitVec 32) ValueCell!3008))

(declare-fun mapKey!11439 () (_ BitVec 32))

(declare-fun mapValue!11439 () ValueCell!3008)

(assert (=> mapNonEmpty!11439 (= (arr!8036 _values!1525) (store mapRest!11439 mapKey!11439 mapValue!11439))))

(declare-fun b!331987 () Bool)

(assert (=> b!331987 (= e!203776 false)))

(declare-fun lt!158968 () Bool)

(declare-datatypes ((List!4493 0))(
  ( (Nil!4490) (Cons!4489 (h!5345 (_ BitVec 64)) (t!9567 List!4493)) )
))
(declare-fun arrayNoDuplicates!0 (array!17002 (_ BitVec 32) List!4493) Bool)

(assert (=> b!331987 (= lt!158968 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4490))))

(declare-fun b!331988 () Bool)

(declare-fun tp_is_empty!6703 () Bool)

(assert (=> b!331988 (= e!203773 tp_is_empty!6703)))

(declare-fun res!182930 () Bool)

(assert (=> start!33436 (=> (not res!182930) (not e!203776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33436 (= res!182930 (validMask!0 mask!2385))))

(assert (=> start!33436 e!203776))

(assert (=> start!33436 true))

(declare-fun array_inv!5976 (array!17004) Bool)

(assert (=> start!33436 (and (array_inv!5976 _values!1525) e!203775)))

(declare-fun array_inv!5977 (array!17002) Bool)

(assert (=> start!33436 (array_inv!5977 _keys!1895)))

(declare-fun b!331989 () Bool)

(assert (=> b!331989 (= e!203777 tp_is_empty!6703)))

(assert (= (and start!33436 res!182930) b!331985))

(assert (= (and b!331985 res!182929) b!331984))

(assert (= (and b!331984 res!182928) b!331987))

(assert (= (and b!331986 condMapEmpty!11439) mapIsEmpty!11439))

(assert (= (and b!331986 (not condMapEmpty!11439)) mapNonEmpty!11439))

(get-info :version)

(assert (= (and mapNonEmpty!11439 ((_ is ValueCellFull!3008) mapValue!11439)) b!331988))

(assert (= (and b!331986 ((_ is ValueCellFull!3008) mapDefault!11439)) b!331989))

(assert (= start!33436 b!331986))

(declare-fun m!336917 () Bool)

(assert (=> b!331984 m!336917))

(declare-fun m!336919 () Bool)

(assert (=> mapNonEmpty!11439 m!336919))

(declare-fun m!336921 () Bool)

(assert (=> b!331987 m!336921))

(declare-fun m!336923 () Bool)

(assert (=> start!33436 m!336923))

(declare-fun m!336925 () Bool)

(assert (=> start!33436 m!336925))

(declare-fun m!336927 () Bool)

(assert (=> start!33436 m!336927))

(check-sat (not start!33436) (not mapNonEmpty!11439) (not b!331987) (not b!331984) tp_is_empty!6703)
(check-sat)
