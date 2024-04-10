; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33686 () Bool)

(assert start!33686)

(declare-fun b_free!6921 () Bool)

(declare-fun b_next!6921 () Bool)

(assert (=> start!33686 (= b_free!6921 (not b_next!6921))))

(declare-fun tp!24267 () Bool)

(declare-fun b_and!14101 () Bool)

(assert (=> start!33686 (= tp!24267 b_and!14101)))

(declare-fun b!334701 () Bool)

(declare-fun e!205439 () Bool)

(declare-fun e!205441 () Bool)

(declare-fun mapRes!11706 () Bool)

(assert (=> b!334701 (= e!205439 (and e!205441 mapRes!11706))))

(declare-fun condMapEmpty!11706 () Bool)

(declare-datatypes ((V!10141 0))(
  ( (V!10142 (val!3481 Int)) )
))
(declare-datatypes ((ValueCell!3093 0))(
  ( (ValueCellFull!3093 (v!5643 V!10141)) (EmptyCell!3093) )
))
(declare-datatypes ((array!17339 0))(
  ( (array!17340 (arr!8200 (Array (_ BitVec 32) ValueCell!3093)) (size!8552 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17339)

(declare-fun mapDefault!11706 () ValueCell!3093)

(assert (=> b!334701 (= condMapEmpty!11706 (= (arr!8200 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3093)) mapDefault!11706)))))

(declare-fun mapIsEmpty!11706 () Bool)

(assert (=> mapIsEmpty!11706 mapRes!11706))

(declare-fun res!184566 () Bool)

(declare-fun e!205442 () Bool)

(assert (=> start!33686 (=> (not res!184566) (not e!205442))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33686 (= res!184566 (validMask!0 mask!2385))))

(assert (=> start!33686 e!205442))

(assert (=> start!33686 true))

(declare-fun tp_is_empty!6873 () Bool)

(assert (=> start!33686 tp_is_empty!6873))

(assert (=> start!33686 tp!24267))

(declare-fun array_inv!6096 (array!17339) Bool)

(assert (=> start!33686 (and (array_inv!6096 _values!1525) e!205439)))

(declare-datatypes ((array!17341 0))(
  ( (array!17342 (arr!8201 (Array (_ BitVec 32) (_ BitVec 64))) (size!8553 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17341)

(declare-fun array_inv!6097 (array!17341) Bool)

(assert (=> start!33686 (array_inv!6097 _keys!1895)))

(declare-fun b!334702 () Bool)

(declare-fun e!205443 () Bool)

(assert (=> b!334702 (= e!205443 tp_is_empty!6873)))

(declare-fun b!334703 () Bool)

(declare-fun res!184569 () Bool)

(declare-fun e!205438 () Bool)

(assert (=> b!334703 (=> (not res!184569) (not e!205438))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3169 0))(
  ( (MissingZero!3169 (index!14855 (_ BitVec 32))) (Found!3169 (index!14856 (_ BitVec 32))) (Intermediate!3169 (undefined!3981 Bool) (index!14857 (_ BitVec 32)) (x!33351 (_ BitVec 32))) (Undefined!3169) (MissingVacant!3169 (index!14858 (_ BitVec 32))) )
))
(declare-fun lt!159570 () SeekEntryResult!3169)

(declare-fun arrayContainsKey!0 (array!17341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334703 (= res!184569 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14856 lt!159570)))))

(declare-fun mapNonEmpty!11706 () Bool)

(declare-fun tp!24266 () Bool)

(assert (=> mapNonEmpty!11706 (= mapRes!11706 (and tp!24266 e!205443))))

(declare-fun mapKey!11706 () (_ BitVec 32))

(declare-fun mapRest!11706 () (Array (_ BitVec 32) ValueCell!3093))

(declare-fun mapValue!11706 () ValueCell!3093)

(assert (=> mapNonEmpty!11706 (= (arr!8200 _values!1525) (store mapRest!11706 mapKey!11706 mapValue!11706))))

(declare-fun b!334704 () Bool)

(declare-fun res!184570 () Bool)

(assert (=> b!334704 (=> (not res!184570) (not e!205442))))

(declare-fun zeroValue!1467 () V!10141)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10141)

(declare-datatypes ((tuple2!5052 0))(
  ( (tuple2!5053 (_1!2537 (_ BitVec 64)) (_2!2537 V!10141)) )
))
(declare-datatypes ((List!4677 0))(
  ( (Nil!4674) (Cons!4673 (h!5529 tuple2!5052) (t!9765 List!4677)) )
))
(declare-datatypes ((ListLongMap!3965 0))(
  ( (ListLongMap!3966 (toList!1998 List!4677)) )
))
(declare-fun contains!2042 (ListLongMap!3965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1526 (array!17341 array!17339 (_ BitVec 32) (_ BitVec 32) V!10141 V!10141 (_ BitVec 32) Int) ListLongMap!3965)

(assert (=> b!334704 (= res!184570 (not (contains!2042 (getCurrentListMap!1526 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334705 () Bool)

(declare-fun res!184567 () Bool)

(assert (=> b!334705 (=> (not res!184567) (not e!205442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334705 (= res!184567 (validKeyInArray!0 k0!1348))))

(declare-fun b!334706 () Bool)

(assert (=> b!334706 (= e!205442 e!205438)))

(declare-fun res!184568 () Bool)

(assert (=> b!334706 (=> (not res!184568) (not e!205438))))

(get-info :version)

(assert (=> b!334706 (= res!184568 (and ((_ is Found!3169) lt!159570) (= (select (arr!8201 _keys!1895) (index!14856 lt!159570)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17341 (_ BitVec 32)) SeekEntryResult!3169)

(assert (=> b!334706 (= lt!159570 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334707 () Bool)

(assert (=> b!334707 (= e!205438 (not true))))

(assert (=> b!334707 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10411 0))(
  ( (Unit!10412) )
))
(declare-fun lt!159571 () Unit!10411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17341 (_ BitVec 64) (_ BitVec 32)) Unit!10411)

(assert (=> b!334707 (= lt!159571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14856 lt!159570)))))

(declare-fun b!334708 () Bool)

(declare-fun res!184565 () Bool)

(assert (=> b!334708 (=> (not res!184565) (not e!205442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17341 (_ BitVec 32)) Bool)

(assert (=> b!334708 (= res!184565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334709 () Bool)

(declare-fun res!184564 () Bool)

(assert (=> b!334709 (=> (not res!184564) (not e!205442))))

(declare-datatypes ((List!4678 0))(
  ( (Nil!4675) (Cons!4674 (h!5530 (_ BitVec 64)) (t!9766 List!4678)) )
))
(declare-fun arrayNoDuplicates!0 (array!17341 (_ BitVec 32) List!4678) Bool)

(assert (=> b!334709 (= res!184564 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4675))))

(declare-fun b!334710 () Bool)

(declare-fun res!184571 () Bool)

(assert (=> b!334710 (=> (not res!184571) (not e!205442))))

(assert (=> b!334710 (= res!184571 (and (= (size!8552 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8553 _keys!1895) (size!8552 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334711 () Bool)

(assert (=> b!334711 (= e!205441 tp_is_empty!6873)))

(assert (= (and start!33686 res!184566) b!334710))

(assert (= (and b!334710 res!184571) b!334708))

(assert (= (and b!334708 res!184565) b!334709))

(assert (= (and b!334709 res!184564) b!334705))

(assert (= (and b!334705 res!184567) b!334704))

(assert (= (and b!334704 res!184570) b!334706))

(assert (= (and b!334706 res!184568) b!334703))

(assert (= (and b!334703 res!184569) b!334707))

(assert (= (and b!334701 condMapEmpty!11706) mapIsEmpty!11706))

(assert (= (and b!334701 (not condMapEmpty!11706)) mapNonEmpty!11706))

(assert (= (and mapNonEmpty!11706 ((_ is ValueCellFull!3093) mapValue!11706)) b!334702))

(assert (= (and b!334701 ((_ is ValueCellFull!3093) mapDefault!11706)) b!334711))

(assert (= start!33686 b!334701))

(declare-fun m!338725 () Bool)

(assert (=> start!33686 m!338725))

(declare-fun m!338727 () Bool)

(assert (=> start!33686 m!338727))

(declare-fun m!338729 () Bool)

(assert (=> start!33686 m!338729))

(declare-fun m!338731 () Bool)

(assert (=> b!334707 m!338731))

(declare-fun m!338733 () Bool)

(assert (=> b!334707 m!338733))

(declare-fun m!338735 () Bool)

(assert (=> mapNonEmpty!11706 m!338735))

(declare-fun m!338737 () Bool)

(assert (=> b!334705 m!338737))

(declare-fun m!338739 () Bool)

(assert (=> b!334708 m!338739))

(declare-fun m!338741 () Bool)

(assert (=> b!334706 m!338741))

(declare-fun m!338743 () Bool)

(assert (=> b!334706 m!338743))

(declare-fun m!338745 () Bool)

(assert (=> b!334709 m!338745))

(declare-fun m!338747 () Bool)

(assert (=> b!334703 m!338747))

(declare-fun m!338749 () Bool)

(assert (=> b!334704 m!338749))

(assert (=> b!334704 m!338749))

(declare-fun m!338751 () Bool)

(assert (=> b!334704 m!338751))

(check-sat (not mapNonEmpty!11706) (not b!334706) (not b!334705) tp_is_empty!6873 (not b!334709) (not b!334708) (not b_next!6921) (not b!334707) (not b!334704) (not b!334703) (not start!33686) b_and!14101)
(check-sat b_and!14101 (not b_next!6921))
