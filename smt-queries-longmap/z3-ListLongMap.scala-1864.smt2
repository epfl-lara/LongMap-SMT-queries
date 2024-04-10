; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33620 () Bool)

(assert start!33620)

(declare-fun b_free!6855 () Bool)

(declare-fun b_next!6855 () Bool)

(assert (=> start!33620 (= b_free!6855 (not b_next!6855))))

(declare-fun tp!24068 () Bool)

(declare-fun b_and!14035 () Bool)

(assert (=> start!33620 (= tp!24068 b_and!14035)))

(declare-fun b!333638 () Bool)

(declare-fun e!204857 () Bool)

(assert (=> b!333638 (= e!204857 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17209 0))(
  ( (array!17210 (arr!8135 (Array (_ BitVec 32) (_ BitVec 64))) (size!8487 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17209)

(declare-datatypes ((SeekEntryResult!3140 0))(
  ( (MissingZero!3140 (index!14739 (_ BitVec 32))) (Found!3140 (index!14740 (_ BitVec 32))) (Intermediate!3140 (undefined!3952 Bool) (index!14741 (_ BitVec 32)) (x!33234 (_ BitVec 32))) (Undefined!3140) (MissingVacant!3140 (index!14742 (_ BitVec 32))) )
))
(declare-fun lt!159385 () SeekEntryResult!3140)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17209 (_ BitVec 32)) SeekEntryResult!3140)

(assert (=> b!333638 (= lt!159385 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333639 () Bool)

(declare-fun res!183799 () Bool)

(assert (=> b!333639 (=> (not res!183799) (not e!204857))))

(declare-datatypes ((List!4629 0))(
  ( (Nil!4626) (Cons!4625 (h!5481 (_ BitVec 64)) (t!9717 List!4629)) )
))
(declare-fun arrayNoDuplicates!0 (array!17209 (_ BitVec 32) List!4629) Bool)

(assert (=> b!333639 (= res!183799 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4626))))

(declare-fun b!333640 () Bool)

(declare-fun e!204859 () Bool)

(declare-fun tp_is_empty!6807 () Bool)

(assert (=> b!333640 (= e!204859 tp_is_empty!6807)))

(declare-fun b!333641 () Bool)

(declare-fun e!204858 () Bool)

(assert (=> b!333641 (= e!204858 tp_is_empty!6807)))

(declare-fun mapIsEmpty!11607 () Bool)

(declare-fun mapRes!11607 () Bool)

(assert (=> mapIsEmpty!11607 mapRes!11607))

(declare-fun res!183802 () Bool)

(assert (=> start!33620 (=> (not res!183802) (not e!204857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33620 (= res!183802 (validMask!0 mask!2385))))

(assert (=> start!33620 e!204857))

(assert (=> start!33620 true))

(assert (=> start!33620 tp_is_empty!6807))

(assert (=> start!33620 tp!24068))

(declare-datatypes ((V!10053 0))(
  ( (V!10054 (val!3448 Int)) )
))
(declare-datatypes ((ValueCell!3060 0))(
  ( (ValueCellFull!3060 (v!5610 V!10053)) (EmptyCell!3060) )
))
(declare-datatypes ((array!17211 0))(
  ( (array!17212 (arr!8136 (Array (_ BitVec 32) ValueCell!3060)) (size!8488 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17211)

(declare-fun e!204861 () Bool)

(declare-fun array_inv!6050 (array!17211) Bool)

(assert (=> start!33620 (and (array_inv!6050 _values!1525) e!204861)))

(declare-fun array_inv!6051 (array!17209) Bool)

(assert (=> start!33620 (array_inv!6051 _keys!1895)))

(declare-fun mapNonEmpty!11607 () Bool)

(declare-fun tp!24069 () Bool)

(assert (=> mapNonEmpty!11607 (= mapRes!11607 (and tp!24069 e!204858))))

(declare-fun mapRest!11607 () (Array (_ BitVec 32) ValueCell!3060))

(declare-fun mapKey!11607 () (_ BitVec 32))

(declare-fun mapValue!11607 () ValueCell!3060)

(assert (=> mapNonEmpty!11607 (= (arr!8136 _values!1525) (store mapRest!11607 mapKey!11607 mapValue!11607))))

(declare-fun b!333642 () Bool)

(declare-fun res!183798 () Bool)

(assert (=> b!333642 (=> (not res!183798) (not e!204857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17209 (_ BitVec 32)) Bool)

(assert (=> b!333642 (= res!183798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333643 () Bool)

(declare-fun res!183801 () Bool)

(assert (=> b!333643 (=> (not res!183801) (not e!204857))))

(declare-fun zeroValue!1467 () V!10053)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10053)

(declare-datatypes ((tuple2!5010 0))(
  ( (tuple2!5011 (_1!2516 (_ BitVec 64)) (_2!2516 V!10053)) )
))
(declare-datatypes ((List!4630 0))(
  ( (Nil!4627) (Cons!4626 (h!5482 tuple2!5010) (t!9718 List!4630)) )
))
(declare-datatypes ((ListLongMap!3923 0))(
  ( (ListLongMap!3924 (toList!1977 List!4630)) )
))
(declare-fun contains!2021 (ListLongMap!3923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1505 (array!17209 array!17211 (_ BitVec 32) (_ BitVec 32) V!10053 V!10053 (_ BitVec 32) Int) ListLongMap!3923)

(assert (=> b!333643 (= res!183801 (not (contains!2021 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333644 () Bool)

(declare-fun res!183800 () Bool)

(assert (=> b!333644 (=> (not res!183800) (not e!204857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333644 (= res!183800 (validKeyInArray!0 k0!1348))))

(declare-fun b!333645 () Bool)

(declare-fun res!183803 () Bool)

(assert (=> b!333645 (=> (not res!183803) (not e!204857))))

(assert (=> b!333645 (= res!183803 (and (= (size!8488 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8487 _keys!1895) (size!8488 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333646 () Bool)

(assert (=> b!333646 (= e!204861 (and e!204859 mapRes!11607))))

(declare-fun condMapEmpty!11607 () Bool)

(declare-fun mapDefault!11607 () ValueCell!3060)

(assert (=> b!333646 (= condMapEmpty!11607 (= (arr!8136 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3060)) mapDefault!11607)))))

(assert (= (and start!33620 res!183802) b!333645))

(assert (= (and b!333645 res!183803) b!333642))

(assert (= (and b!333642 res!183798) b!333639))

(assert (= (and b!333639 res!183799) b!333644))

(assert (= (and b!333644 res!183800) b!333643))

(assert (= (and b!333643 res!183801) b!333638))

(assert (= (and b!333646 condMapEmpty!11607) mapIsEmpty!11607))

(assert (= (and b!333646 (not condMapEmpty!11607)) mapNonEmpty!11607))

(get-info :version)

(assert (= (and mapNonEmpty!11607 ((_ is ValueCellFull!3060) mapValue!11607)) b!333641))

(assert (= (and b!333646 ((_ is ValueCellFull!3060) mapDefault!11607)) b!333640))

(assert (= start!33620 b!333646))

(declare-fun m!337841 () Bool)

(assert (=> b!333642 m!337841))

(declare-fun m!337843 () Bool)

(assert (=> b!333643 m!337843))

(assert (=> b!333643 m!337843))

(declare-fun m!337845 () Bool)

(assert (=> b!333643 m!337845))

(declare-fun m!337847 () Bool)

(assert (=> mapNonEmpty!11607 m!337847))

(declare-fun m!337849 () Bool)

(assert (=> start!33620 m!337849))

(declare-fun m!337851 () Bool)

(assert (=> start!33620 m!337851))

(declare-fun m!337853 () Bool)

(assert (=> start!33620 m!337853))

(declare-fun m!337855 () Bool)

(assert (=> b!333638 m!337855))

(declare-fun m!337857 () Bool)

(assert (=> b!333644 m!337857))

(declare-fun m!337859 () Bool)

(assert (=> b!333639 m!337859))

(check-sat tp_is_empty!6807 b_and!14035 (not b!333642) (not b!333639) (not b!333644) (not mapNonEmpty!11607) (not b_next!6855) (not b!333643) (not start!33620) (not b!333638))
(check-sat b_and!14035 (not b_next!6855))
