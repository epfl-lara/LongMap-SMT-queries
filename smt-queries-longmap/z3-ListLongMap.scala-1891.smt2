; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33822 () Bool)

(assert start!33822)

(declare-fun b_free!7015 () Bool)

(declare-fun b_next!7015 () Bool)

(assert (=> start!33822 (= b_free!7015 (not b_next!7015))))

(declare-fun tp!24558 () Bool)

(declare-fun b_and!14215 () Bool)

(assert (=> start!33822 (= tp!24558 b_and!14215)))

(declare-fun b!336514 () Bool)

(declare-fun res!185764 () Bool)

(declare-fun e!206553 () Bool)

(assert (=> b!336514 (=> (not res!185764) (not e!206553))))

(declare-datatypes ((array!17518 0))(
  ( (array!17519 (arr!8286 (Array (_ BitVec 32) (_ BitVec 64))) (size!8638 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17518)

(declare-datatypes ((List!4661 0))(
  ( (Nil!4658) (Cons!4657 (h!5513 (_ BitVec 64)) (t!9747 List!4661)) )
))
(declare-fun arrayNoDuplicates!0 (array!17518 (_ BitVec 32) List!4661) Bool)

(assert (=> b!336514 (= res!185764 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4658))))

(declare-fun b!336515 () Bool)

(declare-fun res!185760 () Bool)

(assert (=> b!336515 (=> (not res!185760) (not e!206553))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10267 0))(
  ( (V!10268 (val!3528 Int)) )
))
(declare-fun zeroValue!1467 () V!10267)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3140 0))(
  ( (ValueCellFull!3140 (v!5694 V!10267)) (EmptyCell!3140) )
))
(declare-datatypes ((array!17520 0))(
  ( (array!17521 (arr!8287 (Array (_ BitVec 32) ValueCell!3140)) (size!8639 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17520)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10267)

(declare-datatypes ((tuple2!5046 0))(
  ( (tuple2!5047 (_1!2534 (_ BitVec 64)) (_2!2534 V!10267)) )
))
(declare-datatypes ((List!4662 0))(
  ( (Nil!4659) (Cons!4658 (h!5514 tuple2!5046) (t!9748 List!4662)) )
))
(declare-datatypes ((ListLongMap!3961 0))(
  ( (ListLongMap!3962 (toList!1996 List!4662)) )
))
(declare-fun contains!2062 (ListLongMap!3961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1525 (array!17518 array!17520 (_ BitVec 32) (_ BitVec 32) V!10267 V!10267 (_ BitVec 32) Int) ListLongMap!3961)

(assert (=> b!336515 (= res!185760 (not (contains!2062 (getCurrentListMap!1525 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11856 () Bool)

(declare-fun mapRes!11856 () Bool)

(declare-fun tp!24557 () Bool)

(declare-fun e!206558 () Bool)

(assert (=> mapNonEmpty!11856 (= mapRes!11856 (and tp!24557 e!206558))))

(declare-fun mapRest!11856 () (Array (_ BitVec 32) ValueCell!3140))

(declare-fun mapKey!11856 () (_ BitVec 32))

(declare-fun mapValue!11856 () ValueCell!3140)

(assert (=> mapNonEmpty!11856 (= (arr!8287 _values!1525) (store mapRest!11856 mapKey!11856 mapValue!11856))))

(declare-fun res!185759 () Bool)

(assert (=> start!33822 (=> (not res!185759) (not e!206553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33822 (= res!185759 (validMask!0 mask!2385))))

(assert (=> start!33822 e!206553))

(assert (=> start!33822 true))

(declare-fun tp_is_empty!6967 () Bool)

(assert (=> start!33822 tp_is_empty!6967))

(assert (=> start!33822 tp!24558))

(declare-fun e!206557 () Bool)

(declare-fun array_inv!6162 (array!17520) Bool)

(assert (=> start!33822 (and (array_inv!6162 _values!1525) e!206557)))

(declare-fun array_inv!6163 (array!17518) Bool)

(assert (=> start!33822 (array_inv!6163 _keys!1895)))

(declare-fun b!336516 () Bool)

(assert (=> b!336516 (= e!206558 tp_is_empty!6967)))

(declare-fun b!336517 () Bool)

(declare-fun e!206556 () Bool)

(assert (=> b!336517 (= e!206557 (and e!206556 mapRes!11856))))

(declare-fun condMapEmpty!11856 () Bool)

(declare-fun mapDefault!11856 () ValueCell!3140)

(assert (=> b!336517 (= condMapEmpty!11856 (= (arr!8287 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3140)) mapDefault!11856)))))

(declare-fun b!336518 () Bool)

(declare-fun e!206554 () Bool)

(assert (=> b!336518 (= e!206554 false)))

(declare-fun lt!160294 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17518 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336518 (= lt!160294 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11856 () Bool)

(assert (=> mapIsEmpty!11856 mapRes!11856))

(declare-fun b!336519 () Bool)

(assert (=> b!336519 (= e!206556 tp_is_empty!6967)))

(declare-fun b!336520 () Bool)

(declare-fun res!185762 () Bool)

(assert (=> b!336520 (=> (not res!185762) (not e!206554))))

(declare-fun arrayContainsKey!0 (array!17518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336520 (= res!185762 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336521 () Bool)

(declare-fun res!185763 () Bool)

(assert (=> b!336521 (=> (not res!185763) (not e!206553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17518 (_ BitVec 32)) Bool)

(assert (=> b!336521 (= res!185763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336522 () Bool)

(declare-fun res!185765 () Bool)

(assert (=> b!336522 (=> (not res!185765) (not e!206553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336522 (= res!185765 (validKeyInArray!0 k0!1348))))

(declare-fun b!336523 () Bool)

(declare-fun res!185761 () Bool)

(assert (=> b!336523 (=> (not res!185761) (not e!206553))))

(assert (=> b!336523 (= res!185761 (and (= (size!8639 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8638 _keys!1895) (size!8639 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336524 () Bool)

(assert (=> b!336524 (= e!206553 e!206554)))

(declare-fun res!185758 () Bool)

(assert (=> b!336524 (=> (not res!185758) (not e!206554))))

(declare-datatypes ((SeekEntryResult!3168 0))(
  ( (MissingZero!3168 (index!14851 (_ BitVec 32))) (Found!3168 (index!14852 (_ BitVec 32))) (Intermediate!3168 (undefined!3980 Bool) (index!14853 (_ BitVec 32)) (x!33505 (_ BitVec 32))) (Undefined!3168) (MissingVacant!3168 (index!14854 (_ BitVec 32))) )
))
(declare-fun lt!160293 () SeekEntryResult!3168)

(get-info :version)

(assert (=> b!336524 (= res!185758 (and (not ((_ is Found!3168) lt!160293)) ((_ is MissingZero!3168) lt!160293)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17518 (_ BitVec 32)) SeekEntryResult!3168)

(assert (=> b!336524 (= lt!160293 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33822 res!185759) b!336523))

(assert (= (and b!336523 res!185761) b!336521))

(assert (= (and b!336521 res!185763) b!336514))

(assert (= (and b!336514 res!185764) b!336522))

(assert (= (and b!336522 res!185765) b!336515))

(assert (= (and b!336515 res!185760) b!336524))

(assert (= (and b!336524 res!185758) b!336520))

(assert (= (and b!336520 res!185762) b!336518))

(assert (= (and b!336517 condMapEmpty!11856) mapIsEmpty!11856))

(assert (= (and b!336517 (not condMapEmpty!11856)) mapNonEmpty!11856))

(assert (= (and mapNonEmpty!11856 ((_ is ValueCellFull!3140) mapValue!11856)) b!336516))

(assert (= (and b!336517 ((_ is ValueCellFull!3140) mapDefault!11856)) b!336519))

(assert (= start!33822 b!336517))

(declare-fun m!340555 () Bool)

(assert (=> b!336520 m!340555))

(declare-fun m!340557 () Bool)

(assert (=> b!336518 m!340557))

(declare-fun m!340559 () Bool)

(assert (=> b!336515 m!340559))

(assert (=> b!336515 m!340559))

(declare-fun m!340561 () Bool)

(assert (=> b!336515 m!340561))

(declare-fun m!340563 () Bool)

(assert (=> b!336521 m!340563))

(declare-fun m!340565 () Bool)

(assert (=> start!33822 m!340565))

(declare-fun m!340567 () Bool)

(assert (=> start!33822 m!340567))

(declare-fun m!340569 () Bool)

(assert (=> start!33822 m!340569))

(declare-fun m!340571 () Bool)

(assert (=> b!336522 m!340571))

(declare-fun m!340573 () Bool)

(assert (=> b!336524 m!340573))

(declare-fun m!340575 () Bool)

(assert (=> mapNonEmpty!11856 m!340575))

(declare-fun m!340577 () Bool)

(assert (=> b!336514 m!340577))

(check-sat (not b!336518) (not b!336521) (not start!33822) (not b!336522) (not b!336514) (not b!336524) (not b!336520) tp_is_empty!6967 (not b_next!7015) (not b!336515) b_and!14215 (not mapNonEmpty!11856))
(check-sat b_and!14215 (not b_next!7015))
