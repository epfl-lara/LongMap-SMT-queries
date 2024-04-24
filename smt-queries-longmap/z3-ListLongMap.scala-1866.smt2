; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33616 () Bool)

(assert start!33616)

(declare-fun b_free!6865 () Bool)

(declare-fun b_next!6865 () Bool)

(assert (=> start!33616 (= b_free!6865 (not b_next!6865))))

(declare-fun tp!24098 () Bool)

(declare-fun b_and!14059 () Bool)

(assert (=> start!33616 (= tp!24098 b_and!14059)))

(declare-fun mapIsEmpty!11622 () Bool)

(declare-fun mapRes!11622 () Bool)

(assert (=> mapIsEmpty!11622 mapRes!11622))

(declare-fun b!333724 () Bool)

(declare-fun res!183889 () Bool)

(declare-fun e!204900 () Bool)

(assert (=> b!333724 (=> (not res!183889) (not e!204900))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10067 0))(
  ( (V!10068 (val!3453 Int)) )
))
(declare-fun zeroValue!1467 () V!10067)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3065 0))(
  ( (ValueCellFull!3065 (v!5616 V!10067)) (EmptyCell!3065) )
))
(declare-datatypes ((array!17222 0))(
  ( (array!17223 (arr!8141 (Array (_ BitVec 32) ValueCell!3065)) (size!8493 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17222)

(declare-datatypes ((array!17224 0))(
  ( (array!17225 (arr!8142 (Array (_ BitVec 32) (_ BitVec 64))) (size!8494 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17224)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10067)

(declare-datatypes ((tuple2!4936 0))(
  ( (tuple2!4937 (_1!2479 (_ BitVec 64)) (_2!2479 V!10067)) )
))
(declare-datatypes ((List!4552 0))(
  ( (Nil!4549) (Cons!4548 (h!5404 tuple2!4936) (t!9632 List!4552)) )
))
(declare-datatypes ((ListLongMap!3851 0))(
  ( (ListLongMap!3852 (toList!1941 List!4552)) )
))
(declare-fun contains!2004 (ListLongMap!3851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1473 (array!17224 array!17222 (_ BitVec 32) (_ BitVec 32) V!10067 V!10067 (_ BitVec 32) Int) ListLongMap!3851)

(assert (=> b!333724 (= res!183889 (not (contains!2004 (getCurrentListMap!1473 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333725 () Bool)

(declare-fun e!204903 () Bool)

(declare-fun e!204904 () Bool)

(assert (=> b!333725 (= e!204903 (and e!204904 mapRes!11622))))

(declare-fun condMapEmpty!11622 () Bool)

(declare-fun mapDefault!11622 () ValueCell!3065)

(assert (=> b!333725 (= condMapEmpty!11622 (= (arr!8141 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3065)) mapDefault!11622)))))

(declare-fun res!183893 () Bool)

(assert (=> start!33616 (=> (not res!183893) (not e!204900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33616 (= res!183893 (validMask!0 mask!2385))))

(assert (=> start!33616 e!204900))

(assert (=> start!33616 true))

(declare-fun tp_is_empty!6817 () Bool)

(assert (=> start!33616 tp_is_empty!6817))

(assert (=> start!33616 tp!24098))

(declare-fun array_inv!6058 (array!17222) Bool)

(assert (=> start!33616 (and (array_inv!6058 _values!1525) e!204903)))

(declare-fun array_inv!6059 (array!17224) Bool)

(assert (=> start!33616 (array_inv!6059 _keys!1895)))

(declare-fun b!333726 () Bool)

(declare-fun res!183894 () Bool)

(declare-fun e!204901 () Bool)

(assert (=> b!333726 (=> (not res!183894) (not e!204901))))

(declare-datatypes ((SeekEntryResult!3109 0))(
  ( (MissingZero!3109 (index!14615 (_ BitVec 32))) (Found!3109 (index!14616 (_ BitVec 32))) (Intermediate!3109 (undefined!3921 Bool) (index!14617 (_ BitVec 32)) (x!33216 (_ BitVec 32))) (Undefined!3109) (MissingVacant!3109 (index!14618 (_ BitVec 32))) )
))
(declare-fun lt!159420 () SeekEntryResult!3109)

(declare-fun arrayContainsKey!0 (array!17224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333726 (= res!183894 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14616 lt!159420)))))

(declare-fun b!333727 () Bool)

(assert (=> b!333727 (= e!204900 e!204901)))

(declare-fun res!183895 () Bool)

(assert (=> b!333727 (=> (not res!183895) (not e!204901))))

(get-info :version)

(assert (=> b!333727 (= res!183895 (and ((_ is Found!3109) lt!159420) (= (select (arr!8142 _keys!1895) (index!14616 lt!159420)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17224 (_ BitVec 32)) SeekEntryResult!3109)

(assert (=> b!333727 (= lt!159420 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11622 () Bool)

(declare-fun tp!24099 () Bool)

(declare-fun e!204905 () Bool)

(assert (=> mapNonEmpty!11622 (= mapRes!11622 (and tp!24099 e!204905))))

(declare-fun mapValue!11622 () ValueCell!3065)

(declare-fun mapKey!11622 () (_ BitVec 32))

(declare-fun mapRest!11622 () (Array (_ BitVec 32) ValueCell!3065))

(assert (=> mapNonEmpty!11622 (= (arr!8141 _values!1525) (store mapRest!11622 mapKey!11622 mapValue!11622))))

(declare-fun b!333728 () Bool)

(assert (=> b!333728 (= e!204904 tp_is_empty!6817)))

(declare-fun b!333729 () Bool)

(declare-fun res!183890 () Bool)

(assert (=> b!333729 (=> (not res!183890) (not e!204900))))

(assert (=> b!333729 (= res!183890 (and (= (size!8493 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8494 _keys!1895) (size!8493 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333730 () Bool)

(declare-fun res!183892 () Bool)

(assert (=> b!333730 (=> (not res!183892) (not e!204900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17224 (_ BitVec 32)) Bool)

(assert (=> b!333730 (= res!183892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333731 () Bool)

(assert (=> b!333731 (= e!204905 tp_is_empty!6817)))

(declare-fun b!333732 () Bool)

(declare-fun res!183896 () Bool)

(assert (=> b!333732 (=> (not res!183896) (not e!204900))))

(declare-datatypes ((List!4553 0))(
  ( (Nil!4550) (Cons!4549 (h!5405 (_ BitVec 64)) (t!9633 List!4553)) )
))
(declare-fun arrayNoDuplicates!0 (array!17224 (_ BitVec 32) List!4553) Bool)

(assert (=> b!333732 (= res!183896 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4550))))

(declare-fun b!333733 () Bool)

(assert (=> b!333733 (= e!204901 (not true))))

(assert (=> b!333733 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10349 0))(
  ( (Unit!10350) )
))
(declare-fun lt!159421 () Unit!10349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17224 (_ BitVec 64) (_ BitVec 32)) Unit!10349)

(assert (=> b!333733 (= lt!159421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14616 lt!159420)))))

(declare-fun b!333734 () Bool)

(declare-fun res!183891 () Bool)

(assert (=> b!333734 (=> (not res!183891) (not e!204900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333734 (= res!183891 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33616 res!183893) b!333729))

(assert (= (and b!333729 res!183890) b!333730))

(assert (= (and b!333730 res!183892) b!333732))

(assert (= (and b!333732 res!183896) b!333734))

(assert (= (and b!333734 res!183891) b!333724))

(assert (= (and b!333724 res!183889) b!333727))

(assert (= (and b!333727 res!183895) b!333726))

(assert (= (and b!333726 res!183894) b!333733))

(assert (= (and b!333725 condMapEmpty!11622) mapIsEmpty!11622))

(assert (= (and b!333725 (not condMapEmpty!11622)) mapNonEmpty!11622))

(assert (= (and mapNonEmpty!11622 ((_ is ValueCellFull!3065) mapValue!11622)) b!333731))

(assert (= (and b!333725 ((_ is ValueCellFull!3065) mapDefault!11622)) b!333728))

(assert (= start!33616 b!333725))

(declare-fun m!338165 () Bool)

(assert (=> b!333730 m!338165))

(declare-fun m!338167 () Bool)

(assert (=> mapNonEmpty!11622 m!338167))

(declare-fun m!338169 () Bool)

(assert (=> start!33616 m!338169))

(declare-fun m!338171 () Bool)

(assert (=> start!33616 m!338171))

(declare-fun m!338173 () Bool)

(assert (=> start!33616 m!338173))

(declare-fun m!338175 () Bool)

(assert (=> b!333726 m!338175))

(declare-fun m!338177 () Bool)

(assert (=> b!333724 m!338177))

(assert (=> b!333724 m!338177))

(declare-fun m!338179 () Bool)

(assert (=> b!333724 m!338179))

(declare-fun m!338181 () Bool)

(assert (=> b!333734 m!338181))

(declare-fun m!338183 () Bool)

(assert (=> b!333733 m!338183))

(declare-fun m!338185 () Bool)

(assert (=> b!333733 m!338185))

(declare-fun m!338187 () Bool)

(assert (=> b!333727 m!338187))

(declare-fun m!338189 () Bool)

(assert (=> b!333727 m!338189))

(declare-fun m!338191 () Bool)

(assert (=> b!333732 m!338191))

(check-sat (not b!333724) (not b!333733) (not start!33616) (not mapNonEmpty!11622) (not b!333734) (not b!333730) (not b!333732) (not b!333727) b_and!14059 tp_is_empty!6817 (not b_next!6865) (not b!333726))
(check-sat b_and!14059 (not b_next!6865))
