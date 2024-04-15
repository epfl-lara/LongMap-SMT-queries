; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33472 () Bool)

(assert start!33472)

(declare-fun mapIsEmpty!11493 () Bool)

(declare-fun mapRes!11493 () Bool)

(assert (=> mapIsEmpty!11493 mapRes!11493))

(declare-fun b!332086 () Bool)

(declare-fun e!203905 () Bool)

(assert (=> b!332086 (= e!203905 false)))

(declare-fun lt!158769 () Bool)

(declare-datatypes ((array!17059 0))(
  ( (array!17060 (arr!8064 (Array (_ BitVec 32) (_ BitVec 64))) (size!8417 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17059)

(declare-datatypes ((List!4559 0))(
  ( (Nil!4556) (Cons!4555 (h!5411 (_ BitVec 64)) (t!9632 List!4559)) )
))
(declare-fun arrayNoDuplicates!0 (array!17059 (_ BitVec 32) List!4559) Bool)

(assert (=> b!332086 (= lt!158769 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4556))))

(declare-fun res!182966 () Bool)

(assert (=> start!33472 (=> (not res!182966) (not e!203905))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33472 (= res!182966 (validMask!0 mask!2385))))

(assert (=> start!33472 e!203905))

(assert (=> start!33472 true))

(declare-datatypes ((V!9963 0))(
  ( (V!9964 (val!3414 Int)) )
))
(declare-datatypes ((ValueCell!3026 0))(
  ( (ValueCellFull!3026 (v!5567 V!9963)) (EmptyCell!3026) )
))
(declare-datatypes ((array!17061 0))(
  ( (array!17062 (arr!8065 (Array (_ BitVec 32) ValueCell!3026)) (size!8418 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17061)

(declare-fun e!203904 () Bool)

(declare-fun array_inv!6022 (array!17061) Bool)

(assert (=> start!33472 (and (array_inv!6022 _values!1525) e!203904)))

(declare-fun array_inv!6023 (array!17059) Bool)

(assert (=> start!33472 (array_inv!6023 _keys!1895)))

(declare-fun b!332087 () Bool)

(declare-fun res!182964 () Bool)

(assert (=> b!332087 (=> (not res!182964) (not e!203905))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332087 (= res!182964 (and (= (size!8418 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8417 _keys!1895) (size!8418 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332088 () Bool)

(declare-fun res!182965 () Bool)

(assert (=> b!332088 (=> (not res!182965) (not e!203905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17059 (_ BitVec 32)) Bool)

(assert (=> b!332088 (= res!182965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332089 () Bool)

(declare-fun e!203903 () Bool)

(declare-fun tp_is_empty!6739 () Bool)

(assert (=> b!332089 (= e!203903 tp_is_empty!6739)))

(declare-fun mapNonEmpty!11493 () Bool)

(declare-fun tp!23868 () Bool)

(assert (=> mapNonEmpty!11493 (= mapRes!11493 (and tp!23868 e!203903))))

(declare-fun mapKey!11493 () (_ BitVec 32))

(declare-fun mapRest!11493 () (Array (_ BitVec 32) ValueCell!3026))

(declare-fun mapValue!11493 () ValueCell!3026)

(assert (=> mapNonEmpty!11493 (= (arr!8065 _values!1525) (store mapRest!11493 mapKey!11493 mapValue!11493))))

(declare-fun b!332090 () Bool)

(declare-fun e!203901 () Bool)

(assert (=> b!332090 (= e!203904 (and e!203901 mapRes!11493))))

(declare-fun condMapEmpty!11493 () Bool)

(declare-fun mapDefault!11493 () ValueCell!3026)

(assert (=> b!332090 (= condMapEmpty!11493 (= (arr!8065 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3026)) mapDefault!11493)))))

(declare-fun b!332091 () Bool)

(assert (=> b!332091 (= e!203901 tp_is_empty!6739)))

(assert (= (and start!33472 res!182966) b!332087))

(assert (= (and b!332087 res!182964) b!332088))

(assert (= (and b!332088 res!182965) b!332086))

(assert (= (and b!332090 condMapEmpty!11493) mapIsEmpty!11493))

(assert (= (and b!332090 (not condMapEmpty!11493)) mapNonEmpty!11493))

(get-info :version)

(assert (= (and mapNonEmpty!11493 ((_ is ValueCellFull!3026) mapValue!11493)) b!332089))

(assert (= (and b!332090 ((_ is ValueCellFull!3026) mapDefault!11493)) b!332091))

(assert (= start!33472 b!332090))

(declare-fun m!336179 () Bool)

(assert (=> b!332086 m!336179))

(declare-fun m!336181 () Bool)

(assert (=> start!33472 m!336181))

(declare-fun m!336183 () Bool)

(assert (=> start!33472 m!336183))

(declare-fun m!336185 () Bool)

(assert (=> start!33472 m!336185))

(declare-fun m!336187 () Bool)

(assert (=> b!332088 m!336187))

(declare-fun m!336189 () Bool)

(assert (=> mapNonEmpty!11493 m!336189))

(check-sat (not mapNonEmpty!11493) (not start!33472) (not b!332088) tp_is_empty!6739 (not b!332086))
(check-sat)
