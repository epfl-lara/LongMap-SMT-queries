; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33634 () Bool)

(assert start!33634)

(declare-fun b_free!6883 () Bool)

(declare-fun b_next!6883 () Bool)

(assert (=> start!33634 (= b_free!6883 (not b_next!6883))))

(declare-fun tp!24152 () Bool)

(declare-fun b_and!14037 () Bool)

(assert (=> start!33634 (= tp!24152 b_and!14037)))

(declare-fun mapIsEmpty!11649 () Bool)

(declare-fun mapRes!11649 () Bool)

(assert (=> mapIsEmpty!11649 mapRes!11649))

(declare-fun b!333800 () Bool)

(declare-fun e!204925 () Bool)

(assert (=> b!333800 (= e!204925 (not true))))

(declare-datatypes ((array!17245 0))(
  ( (array!17246 (arr!8153 (Array (_ BitVec 32) (_ BitVec 64))) (size!8506 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17245)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333800 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3150 0))(
  ( (MissingZero!3150 (index!14779 (_ BitVec 32))) (Found!3150 (index!14780 (_ BitVec 32))) (Intermediate!3150 (undefined!3962 Bool) (index!14781 (_ BitVec 32)) (x!33279 (_ BitVec 32))) (Undefined!3150) (MissingVacant!3150 (index!14782 (_ BitVec 32))) )
))
(declare-fun lt!159222 () SeekEntryResult!3150)

(declare-datatypes ((Unit!10364 0))(
  ( (Unit!10365) )
))
(declare-fun lt!159221 () Unit!10364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17245 (_ BitVec 64) (_ BitVec 32)) Unit!10364)

(assert (=> b!333800 (= lt!159221 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14780 lt!159222)))))

(declare-fun b!333801 () Bool)

(declare-fun res!183979 () Bool)

(declare-fun e!204922 () Bool)

(assert (=> b!333801 (=> (not res!183979) (not e!204922))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10091 0))(
  ( (V!10092 (val!3462 Int)) )
))
(declare-fun zeroValue!1467 () V!10091)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3074 0))(
  ( (ValueCellFull!3074 (v!5618 V!10091)) (EmptyCell!3074) )
))
(declare-datatypes ((array!17247 0))(
  ( (array!17248 (arr!8154 (Array (_ BitVec 32) ValueCell!3074)) (size!8507 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17247)

(declare-fun minValue!1467 () V!10091)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!4976 0))(
  ( (tuple2!4977 (_1!2499 (_ BitVec 64)) (_2!2499 V!10091)) )
))
(declare-datatypes ((List!4617 0))(
  ( (Nil!4614) (Cons!4613 (h!5469 tuple2!4976) (t!9696 List!4617)) )
))
(declare-datatypes ((ListLongMap!3879 0))(
  ( (ListLongMap!3880 (toList!1955 List!4617)) )
))
(declare-fun contains!2010 (ListLongMap!3879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1464 (array!17245 array!17247 (_ BitVec 32) (_ BitVec 32) V!10091 V!10091 (_ BitVec 32) Int) ListLongMap!3879)

(assert (=> b!333801 (= res!183979 (not (contains!2010 (getCurrentListMap!1464 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333802 () Bool)

(declare-fun res!183982 () Bool)

(assert (=> b!333802 (=> (not res!183982) (not e!204925))))

(assert (=> b!333802 (= res!183982 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14780 lt!159222)))))

(declare-fun b!333803 () Bool)

(declare-fun e!204923 () Bool)

(declare-fun tp_is_empty!6835 () Bool)

(assert (=> b!333803 (= e!204923 tp_is_empty!6835)))

(declare-fun b!333804 () Bool)

(declare-fun e!204924 () Bool)

(assert (=> b!333804 (= e!204924 tp_is_empty!6835)))

(declare-fun b!333805 () Bool)

(declare-fun res!183986 () Bool)

(assert (=> b!333805 (=> (not res!183986) (not e!204922))))

(assert (=> b!333805 (= res!183986 (and (= (size!8507 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8506 _keys!1895) (size!8507 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333806 () Bool)

(assert (=> b!333806 (= e!204922 e!204925)))

(declare-fun res!183985 () Bool)

(assert (=> b!333806 (=> (not res!183985) (not e!204925))))

(get-info :version)

(assert (=> b!333806 (= res!183985 (and ((_ is Found!3150) lt!159222) (= (select (arr!8153 _keys!1895) (index!14780 lt!159222)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17245 (_ BitVec 32)) SeekEntryResult!3150)

(assert (=> b!333806 (= lt!159222 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333799 () Bool)

(declare-fun res!183980 () Bool)

(assert (=> b!333799 (=> (not res!183980) (not e!204922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17245 (_ BitVec 32)) Bool)

(assert (=> b!333799 (= res!183980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183983 () Bool)

(assert (=> start!33634 (=> (not res!183983) (not e!204922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33634 (= res!183983 (validMask!0 mask!2385))))

(assert (=> start!33634 e!204922))

(assert (=> start!33634 true))

(assert (=> start!33634 tp_is_empty!6835))

(assert (=> start!33634 tp!24152))

(declare-fun e!204920 () Bool)

(declare-fun array_inv!6084 (array!17247) Bool)

(assert (=> start!33634 (and (array_inv!6084 _values!1525) e!204920)))

(declare-fun array_inv!6085 (array!17245) Bool)

(assert (=> start!33634 (array_inv!6085 _keys!1895)))

(declare-fun b!333807 () Bool)

(declare-fun res!183981 () Bool)

(assert (=> b!333807 (=> (not res!183981) (not e!204922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333807 (= res!183981 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11649 () Bool)

(declare-fun tp!24153 () Bool)

(assert (=> mapNonEmpty!11649 (= mapRes!11649 (and tp!24153 e!204924))))

(declare-fun mapRest!11649 () (Array (_ BitVec 32) ValueCell!3074))

(declare-fun mapKey!11649 () (_ BitVec 32))

(declare-fun mapValue!11649 () ValueCell!3074)

(assert (=> mapNonEmpty!11649 (= (arr!8154 _values!1525) (store mapRest!11649 mapKey!11649 mapValue!11649))))

(declare-fun b!333808 () Bool)

(assert (=> b!333808 (= e!204920 (and e!204923 mapRes!11649))))

(declare-fun condMapEmpty!11649 () Bool)

(declare-fun mapDefault!11649 () ValueCell!3074)

(assert (=> b!333808 (= condMapEmpty!11649 (= (arr!8154 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3074)) mapDefault!11649)))))

(declare-fun b!333809 () Bool)

(declare-fun res!183984 () Bool)

(assert (=> b!333809 (=> (not res!183984) (not e!204922))))

(declare-datatypes ((List!4618 0))(
  ( (Nil!4615) (Cons!4614 (h!5470 (_ BitVec 64)) (t!9697 List!4618)) )
))
(declare-fun arrayNoDuplicates!0 (array!17245 (_ BitVec 32) List!4618) Bool)

(assert (=> b!333809 (= res!183984 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4615))))

(assert (= (and start!33634 res!183983) b!333805))

(assert (= (and b!333805 res!183986) b!333799))

(assert (= (and b!333799 res!183980) b!333809))

(assert (= (and b!333809 res!183984) b!333807))

(assert (= (and b!333807 res!183981) b!333801))

(assert (= (and b!333801 res!183979) b!333806))

(assert (= (and b!333806 res!183985) b!333802))

(assert (= (and b!333802 res!183982) b!333800))

(assert (= (and b!333808 condMapEmpty!11649) mapIsEmpty!11649))

(assert (= (and b!333808 (not condMapEmpty!11649)) mapNonEmpty!11649))

(assert (= (and mapNonEmpty!11649 ((_ is ValueCellFull!3074) mapValue!11649)) b!333804))

(assert (= (and b!333808 ((_ is ValueCellFull!3074) mapDefault!11649)) b!333803))

(assert (= start!33634 b!333808))

(declare-fun m!337463 () Bool)

(assert (=> mapNonEmpty!11649 m!337463))

(declare-fun m!337465 () Bool)

(assert (=> b!333799 m!337465))

(declare-fun m!337467 () Bool)

(assert (=> b!333806 m!337467))

(declare-fun m!337469 () Bool)

(assert (=> b!333806 m!337469))

(declare-fun m!337471 () Bool)

(assert (=> b!333809 m!337471))

(declare-fun m!337473 () Bool)

(assert (=> b!333802 m!337473))

(declare-fun m!337475 () Bool)

(assert (=> b!333807 m!337475))

(declare-fun m!337477 () Bool)

(assert (=> b!333801 m!337477))

(assert (=> b!333801 m!337477))

(declare-fun m!337479 () Bool)

(assert (=> b!333801 m!337479))

(declare-fun m!337481 () Bool)

(assert (=> b!333800 m!337481))

(declare-fun m!337483 () Bool)

(assert (=> b!333800 m!337483))

(declare-fun m!337485 () Bool)

(assert (=> start!33634 m!337485))

(declare-fun m!337487 () Bool)

(assert (=> start!33634 m!337487))

(declare-fun m!337489 () Bool)

(assert (=> start!33634 m!337489))

(check-sat (not b!333807) (not b!333802) (not b!333809) (not b!333800) (not b!333801) (not b!333806) (not b_next!6883) (not start!33634) b_and!14037 tp_is_empty!6835 (not mapNonEmpty!11649) (not b!333799))
(check-sat b_and!14037 (not b_next!6883))
