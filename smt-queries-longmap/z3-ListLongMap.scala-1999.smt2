; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34934 () Bool)

(assert start!34934)

(declare-fun b_free!7663 () Bool)

(declare-fun b_next!7663 () Bool)

(assert (=> start!34934 (= b_free!7663 (not b_next!7663))))

(declare-fun tp!26565 () Bool)

(declare-fun b_and!14865 () Bool)

(assert (=> start!34934 (= tp!26565 b_and!14865)))

(declare-fun b!349690 () Bool)

(declare-fun e!214196 () Bool)

(declare-fun tp_is_empty!7615 () Bool)

(assert (=> b!349690 (= e!214196 tp_is_empty!7615)))

(declare-fun b!349691 () Bool)

(declare-datatypes ((Unit!10823 0))(
  ( (Unit!10824) )
))
(declare-fun e!214197 () Unit!10823)

(declare-fun Unit!10825 () Unit!10823)

(assert (=> b!349691 (= e!214197 Unit!10825)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11131 0))(
  ( (V!11132 (val!3852 Int)) )
))
(declare-fun zeroValue!1467 () V!11131)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3464 0))(
  ( (ValueCellFull!3464 (v!6032 V!11131)) (EmptyCell!3464) )
))
(declare-datatypes ((array!18795 0))(
  ( (array!18796 (arr!8904 (Array (_ BitVec 32) ValueCell!3464)) (size!9257 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18795)

(declare-fun lt!164175 () Unit!10823)

(declare-datatypes ((array!18797 0))(
  ( (array!18798 (arr!8905 (Array (_ BitVec 32) (_ BitVec 64))) (size!9258 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18797)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11131)

(declare-fun lemmaArrayContainsKeyThenInListMap!323 (array!18797 array!18795 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 64) (_ BitVec 32) Int) Unit!10823)

(declare-fun arrayScanForKey!0 (array!18797 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349691 (= lt!164175 (lemmaArrayContainsKeyThenInListMap!323 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349691 false))

(declare-fun b!349692 () Bool)

(declare-fun res!193823 () Bool)

(declare-fun e!214198 () Bool)

(assert (=> b!349692 (=> (not res!193823) (not e!214198))))

(declare-datatypes ((tuple2!5526 0))(
  ( (tuple2!5527 (_1!2774 (_ BitVec 64)) (_2!2774 V!11131)) )
))
(declare-datatypes ((List!5141 0))(
  ( (Nil!5138) (Cons!5137 (h!5993 tuple2!5526) (t!10268 List!5141)) )
))
(declare-datatypes ((ListLongMap!4429 0))(
  ( (ListLongMap!4430 (toList!2230 List!5141)) )
))
(declare-fun contains!2309 (ListLongMap!4429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1735 (array!18797 array!18795 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 32) Int) ListLongMap!4429)

(assert (=> b!349692 (= res!193823 (not (contains!2309 (getCurrentListMap!1735 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349693 () Bool)

(declare-fun e!214195 () Bool)

(declare-fun e!214194 () Bool)

(declare-fun mapRes!12891 () Bool)

(assert (=> b!349693 (= e!214195 (and e!214194 mapRes!12891))))

(declare-fun condMapEmpty!12891 () Bool)

(declare-fun mapDefault!12891 () ValueCell!3464)

(assert (=> b!349693 (= condMapEmpty!12891 (= (arr!8904 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3464)) mapDefault!12891)))))

(declare-fun b!349694 () Bool)

(declare-fun res!193824 () Bool)

(assert (=> b!349694 (=> (not res!193824) (not e!214198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349694 (= res!193824 (validKeyInArray!0 k0!1348))))

(declare-fun b!349695 () Bool)

(declare-fun res!193821 () Bool)

(assert (=> b!349695 (=> (not res!193821) (not e!214198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18797 (_ BitVec 32)) Bool)

(assert (=> b!349695 (= res!193821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349696 () Bool)

(declare-fun e!214199 () Bool)

(assert (=> b!349696 (= e!214198 e!214199)))

(declare-fun res!193818 () Bool)

(assert (=> b!349696 (=> (not res!193818) (not e!214199))))

(declare-datatypes ((SeekEntryResult!3431 0))(
  ( (MissingZero!3431 (index!15903 (_ BitVec 32))) (Found!3431 (index!15904 (_ BitVec 32))) (Intermediate!3431 (undefined!4243 Bool) (index!15905 (_ BitVec 32)) (x!34840 (_ BitVec 32))) (Undefined!3431) (MissingVacant!3431 (index!15906 (_ BitVec 32))) )
))
(declare-fun lt!164174 () SeekEntryResult!3431)

(get-info :version)

(assert (=> b!349696 (= res!193818 (and (not ((_ is Found!3431) lt!164174)) ((_ is MissingZero!3431) lt!164174)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18797 (_ BitVec 32)) SeekEntryResult!3431)

(assert (=> b!349696 (= lt!164174 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!193819 () Bool)

(assert (=> start!34934 (=> (not res!193819) (not e!214198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34934 (= res!193819 (validMask!0 mask!2385))))

(assert (=> start!34934 e!214198))

(assert (=> start!34934 true))

(assert (=> start!34934 tp_is_empty!7615))

(assert (=> start!34934 tp!26565))

(declare-fun array_inv!6602 (array!18795) Bool)

(assert (=> start!34934 (and (array_inv!6602 _values!1525) e!214195)))

(declare-fun array_inv!6603 (array!18797) Bool)

(assert (=> start!34934 (array_inv!6603 _keys!1895)))

(declare-fun mapNonEmpty!12891 () Bool)

(declare-fun tp!26564 () Bool)

(assert (=> mapNonEmpty!12891 (= mapRes!12891 (and tp!26564 e!214196))))

(declare-fun mapKey!12891 () (_ BitVec 32))

(declare-fun mapRest!12891 () (Array (_ BitVec 32) ValueCell!3464))

(declare-fun mapValue!12891 () ValueCell!3464)

(assert (=> mapNonEmpty!12891 (= (arr!8904 _values!1525) (store mapRest!12891 mapKey!12891 mapValue!12891))))

(declare-fun b!349697 () Bool)

(declare-fun res!193822 () Bool)

(assert (=> b!349697 (=> (not res!193822) (not e!214198))))

(assert (=> b!349697 (= res!193822 (and (= (size!9257 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9258 _keys!1895) (size!9257 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349698 () Bool)

(declare-fun res!193820 () Bool)

(assert (=> b!349698 (=> (not res!193820) (not e!214198))))

(declare-datatypes ((List!5142 0))(
  ( (Nil!5139) (Cons!5138 (h!5994 (_ BitVec 64)) (t!10269 List!5142)) )
))
(declare-fun arrayNoDuplicates!0 (array!18797 (_ BitVec 32) List!5142) Bool)

(assert (=> b!349698 (= res!193820 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5139))))

(declare-fun b!349699 () Bool)

(assert (=> b!349699 (= e!214199 false)))

(declare-fun lt!164173 () Unit!10823)

(assert (=> b!349699 (= lt!164173 e!214197)))

(declare-fun c!53273 () Bool)

(declare-fun arrayContainsKey!0 (array!18797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349699 (= c!53273 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349700 () Bool)

(assert (=> b!349700 (= e!214194 tp_is_empty!7615)))

(declare-fun mapIsEmpty!12891 () Bool)

(assert (=> mapIsEmpty!12891 mapRes!12891))

(declare-fun b!349701 () Bool)

(declare-fun Unit!10826 () Unit!10823)

(assert (=> b!349701 (= e!214197 Unit!10826)))

(assert (= (and start!34934 res!193819) b!349697))

(assert (= (and b!349697 res!193822) b!349695))

(assert (= (and b!349695 res!193821) b!349698))

(assert (= (and b!349698 res!193820) b!349694))

(assert (= (and b!349694 res!193824) b!349692))

(assert (= (and b!349692 res!193823) b!349696))

(assert (= (and b!349696 res!193818) b!349699))

(assert (= (and b!349699 c!53273) b!349691))

(assert (= (and b!349699 (not c!53273)) b!349701))

(assert (= (and b!349693 condMapEmpty!12891) mapIsEmpty!12891))

(assert (= (and b!349693 (not condMapEmpty!12891)) mapNonEmpty!12891))

(assert (= (and mapNonEmpty!12891 ((_ is ValueCellFull!3464) mapValue!12891)) b!349690))

(assert (= (and b!349693 ((_ is ValueCellFull!3464) mapDefault!12891)) b!349700))

(assert (= start!34934 b!349693))

(declare-fun m!349587 () Bool)

(assert (=> b!349696 m!349587))

(declare-fun m!349589 () Bool)

(assert (=> start!34934 m!349589))

(declare-fun m!349591 () Bool)

(assert (=> start!34934 m!349591))

(declare-fun m!349593 () Bool)

(assert (=> start!34934 m!349593))

(declare-fun m!349595 () Bool)

(assert (=> mapNonEmpty!12891 m!349595))

(declare-fun m!349597 () Bool)

(assert (=> b!349695 m!349597))

(declare-fun m!349599 () Bool)

(assert (=> b!349692 m!349599))

(assert (=> b!349692 m!349599))

(declare-fun m!349601 () Bool)

(assert (=> b!349692 m!349601))

(declare-fun m!349603 () Bool)

(assert (=> b!349691 m!349603))

(assert (=> b!349691 m!349603))

(declare-fun m!349605 () Bool)

(assert (=> b!349691 m!349605))

(declare-fun m!349607 () Bool)

(assert (=> b!349694 m!349607))

(declare-fun m!349609 () Bool)

(assert (=> b!349698 m!349609))

(declare-fun m!349611 () Bool)

(assert (=> b!349699 m!349611))

(check-sat (not mapNonEmpty!12891) (not b!349699) (not b!349696) b_and!14865 (not b!349691) tp_is_empty!7615 (not b!349694) (not b!349698) (not b!349692) (not b_next!7663) (not start!34934) (not b!349695))
(check-sat b_and!14865 (not b_next!7663))
