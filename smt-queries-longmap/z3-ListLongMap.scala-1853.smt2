; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33472 () Bool)

(assert start!33472)

(declare-fun b!332308 () Bool)

(declare-fun res!183092 () Bool)

(declare-fun e!204044 () Bool)

(assert (=> b!332308 (=> (not res!183092) (not e!204044))))

(declare-datatypes ((array!17074 0))(
  ( (array!17075 (arr!8071 (Array (_ BitVec 32) (_ BitVec 64))) (size!8423 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17074)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17074 (_ BitVec 32)) Bool)

(assert (=> b!332308 (= res!183092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332309 () Bool)

(declare-fun e!204043 () Bool)

(declare-fun tp_is_empty!6739 () Bool)

(assert (=> b!332309 (= e!204043 tp_is_empty!6739)))

(declare-fun b!332310 () Bool)

(declare-fun e!204047 () Bool)

(assert (=> b!332310 (= e!204047 tp_is_empty!6739)))

(declare-fun b!332311 () Bool)

(declare-fun res!183091 () Bool)

(assert (=> b!332311 (=> (not res!183091) (not e!204044))))

(declare-datatypes ((V!9963 0))(
  ( (V!9964 (val!3414 Int)) )
))
(declare-datatypes ((ValueCell!3026 0))(
  ( (ValueCellFull!3026 (v!5574 V!9963)) (EmptyCell!3026) )
))
(declare-datatypes ((array!17076 0))(
  ( (array!17077 (arr!8072 (Array (_ BitVec 32) ValueCell!3026)) (size!8424 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17076)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332311 (= res!183091 (and (= (size!8424 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8423 _keys!1895) (size!8424 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11493 () Bool)

(declare-fun mapRes!11493 () Bool)

(declare-fun tp!23868 () Bool)

(assert (=> mapNonEmpty!11493 (= mapRes!11493 (and tp!23868 e!204047))))

(declare-fun mapKey!11493 () (_ BitVec 32))

(declare-fun mapValue!11493 () ValueCell!3026)

(declare-fun mapRest!11493 () (Array (_ BitVec 32) ValueCell!3026))

(assert (=> mapNonEmpty!11493 (= (arr!8072 _values!1525) (store mapRest!11493 mapKey!11493 mapValue!11493))))

(declare-fun b!332312 () Bool)

(declare-fun e!204046 () Bool)

(assert (=> b!332312 (= e!204046 (and e!204043 mapRes!11493))))

(declare-fun condMapEmpty!11493 () Bool)

(declare-fun mapDefault!11493 () ValueCell!3026)

(assert (=> b!332312 (= condMapEmpty!11493 (= (arr!8072 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3026)) mapDefault!11493)))))

(declare-fun res!183090 () Bool)

(assert (=> start!33472 (=> (not res!183090) (not e!204044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33472 (= res!183090 (validMask!0 mask!2385))))

(assert (=> start!33472 e!204044))

(assert (=> start!33472 true))

(declare-fun array_inv!6004 (array!17076) Bool)

(assert (=> start!33472 (and (array_inv!6004 _values!1525) e!204046)))

(declare-fun array_inv!6005 (array!17074) Bool)

(assert (=> start!33472 (array_inv!6005 _keys!1895)))

(declare-fun b!332313 () Bool)

(assert (=> b!332313 (= e!204044 false)))

(declare-fun lt!159022 () Bool)

(declare-datatypes ((List!4505 0))(
  ( (Nil!4502) (Cons!4501 (h!5357 (_ BitVec 64)) (t!9579 List!4505)) )
))
(declare-fun arrayNoDuplicates!0 (array!17074 (_ BitVec 32) List!4505) Bool)

(assert (=> b!332313 (= lt!159022 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4502))))

(declare-fun mapIsEmpty!11493 () Bool)

(assert (=> mapIsEmpty!11493 mapRes!11493))

(assert (= (and start!33472 res!183090) b!332311))

(assert (= (and b!332311 res!183091) b!332308))

(assert (= (and b!332308 res!183092) b!332313))

(assert (= (and b!332312 condMapEmpty!11493) mapIsEmpty!11493))

(assert (= (and b!332312 (not condMapEmpty!11493)) mapNonEmpty!11493))

(get-info :version)

(assert (= (and mapNonEmpty!11493 ((_ is ValueCellFull!3026) mapValue!11493)) b!332310))

(assert (= (and b!332312 ((_ is ValueCellFull!3026) mapDefault!11493)) b!332309))

(assert (= start!33472 b!332312))

(declare-fun m!337133 () Bool)

(assert (=> b!332308 m!337133))

(declare-fun m!337135 () Bool)

(assert (=> mapNonEmpty!11493 m!337135))

(declare-fun m!337137 () Bool)

(assert (=> start!33472 m!337137))

(declare-fun m!337139 () Bool)

(assert (=> start!33472 m!337139))

(declare-fun m!337141 () Bool)

(assert (=> start!33472 m!337141))

(declare-fun m!337143 () Bool)

(assert (=> b!332313 m!337143))

(check-sat (not b!332308) tp_is_empty!6739 (not mapNonEmpty!11493) (not b!332313) (not start!33472))
(check-sat)
