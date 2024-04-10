; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34912 () Bool)

(assert start!34912)

(declare-fun b_free!7653 () Bool)

(declare-fun b_next!7653 () Bool)

(assert (=> start!34912 (= b_free!7653 (not b_next!7653))))

(declare-fun tp!26532 () Bool)

(declare-fun b_and!14879 () Bool)

(assert (=> start!34912 (= tp!26532 b_and!14879)))

(declare-fun b!349628 () Bool)

(declare-fun e!214167 () Bool)

(declare-fun e!214166 () Bool)

(declare-fun mapRes!12873 () Bool)

(assert (=> b!349628 (= e!214167 (and e!214166 mapRes!12873))))

(declare-fun condMapEmpty!12873 () Bool)

(declare-datatypes ((V!11117 0))(
  ( (V!11118 (val!3847 Int)) )
))
(declare-datatypes ((ValueCell!3459 0))(
  ( (ValueCellFull!3459 (v!6032 V!11117)) (EmptyCell!3459) )
))
(declare-datatypes ((array!18795 0))(
  ( (array!18796 (arr!8905 (Array (_ BitVec 32) ValueCell!3459)) (size!9257 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18795)

(declare-fun mapDefault!12873 () ValueCell!3459)

(assert (=> b!349628 (= condMapEmpty!12873 (= (arr!8905 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3459)) mapDefault!12873)))))

(declare-fun b!349629 () Bool)

(declare-datatypes ((Unit!10823 0))(
  ( (Unit!10824) )
))
(declare-fun e!214170 () Unit!10823)

(declare-fun Unit!10825 () Unit!10823)

(assert (=> b!349629 (= e!214170 Unit!10825)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11117)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18797 0))(
  ( (array!18798 (arr!8906 (Array (_ BitVec 32) (_ BitVec 64))) (size!9258 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18797)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11117)

(declare-fun lt!164249 () Unit!10823)

(declare-fun lemmaArrayContainsKeyThenInListMap!319 (array!18797 array!18795 (_ BitVec 32) (_ BitVec 32) V!11117 V!11117 (_ BitVec 64) (_ BitVec 32) Int) Unit!10823)

(declare-fun arrayScanForKey!0 (array!18797 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349629 (= lt!164249 (lemmaArrayContainsKeyThenInListMap!319 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349629 false))

(declare-fun b!349631 () Bool)

(declare-fun res!193773 () Bool)

(declare-fun e!214171 () Bool)

(assert (=> b!349631 (=> (not res!193773) (not e!214171))))

(declare-datatypes ((tuple2!5556 0))(
  ( (tuple2!5557 (_1!2789 (_ BitVec 64)) (_2!2789 V!11117)) )
))
(declare-datatypes ((List!5177 0))(
  ( (Nil!5174) (Cons!5173 (h!6029 tuple2!5556) (t!10311 List!5177)) )
))
(declare-datatypes ((ListLongMap!4469 0))(
  ( (ListLongMap!4470 (toList!2250 List!5177)) )
))
(declare-fun contains!2317 (ListLongMap!4469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1771 (array!18797 array!18795 (_ BitVec 32) (_ BitVec 32) V!11117 V!11117 (_ BitVec 32) Int) ListLongMap!4469)

(assert (=> b!349631 (= res!193773 (not (contains!2317 (getCurrentListMap!1771 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349632 () Bool)

(declare-fun res!193775 () Bool)

(assert (=> b!349632 (=> (not res!193775) (not e!214171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18797 (_ BitVec 32)) Bool)

(assert (=> b!349632 (= res!193775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349633 () Bool)

(declare-fun tp_is_empty!7605 () Bool)

(assert (=> b!349633 (= e!214166 tp_is_empty!7605)))

(declare-fun b!349634 () Bool)

(declare-fun res!193776 () Bool)

(assert (=> b!349634 (=> (not res!193776) (not e!214171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349634 (= res!193776 (validKeyInArray!0 k0!1348))))

(declare-fun b!349635 () Bool)

(declare-fun Unit!10826 () Unit!10823)

(assert (=> b!349635 (= e!214170 Unit!10826)))

(declare-fun b!349636 () Bool)

(declare-fun res!193779 () Bool)

(assert (=> b!349636 (=> (not res!193779) (not e!214171))))

(assert (=> b!349636 (= res!193779 (and (= (size!9257 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9258 _keys!1895) (size!9257 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12873 () Bool)

(declare-fun tp!26531 () Bool)

(declare-fun e!214165 () Bool)

(assert (=> mapNonEmpty!12873 (= mapRes!12873 (and tp!26531 e!214165))))

(declare-fun mapRest!12873 () (Array (_ BitVec 32) ValueCell!3459))

(declare-fun mapKey!12873 () (_ BitVec 32))

(declare-fun mapValue!12873 () ValueCell!3459)

(assert (=> mapNonEmpty!12873 (= (arr!8905 _values!1525) (store mapRest!12873 mapKey!12873 mapValue!12873))))

(declare-fun res!193774 () Bool)

(assert (=> start!34912 (=> (not res!193774) (not e!214171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34912 (= res!193774 (validMask!0 mask!2385))))

(assert (=> start!34912 e!214171))

(assert (=> start!34912 true))

(assert (=> start!34912 tp_is_empty!7605))

(assert (=> start!34912 tp!26532))

(declare-fun array_inv!6582 (array!18795) Bool)

(assert (=> start!34912 (and (array_inv!6582 _values!1525) e!214167)))

(declare-fun array_inv!6583 (array!18797) Bool)

(assert (=> start!34912 (array_inv!6583 _keys!1895)))

(declare-fun b!349630 () Bool)

(assert (=> b!349630 (= e!214165 tp_is_empty!7605)))

(declare-fun mapIsEmpty!12873 () Bool)

(assert (=> mapIsEmpty!12873 mapRes!12873))

(declare-fun b!349637 () Bool)

(declare-fun e!214169 () Bool)

(assert (=> b!349637 (= e!214171 e!214169)))

(declare-fun res!193777 () Bool)

(assert (=> b!349637 (=> (not res!193777) (not e!214169))))

(declare-datatypes ((SeekEntryResult!3430 0))(
  ( (MissingZero!3430 (index!15899 (_ BitVec 32))) (Found!3430 (index!15900 (_ BitVec 32))) (Intermediate!3430 (undefined!4242 Bool) (index!15901 (_ BitVec 32)) (x!34818 (_ BitVec 32))) (Undefined!3430) (MissingVacant!3430 (index!15902 (_ BitVec 32))) )
))
(declare-fun lt!164250 () SeekEntryResult!3430)

(get-info :version)

(assert (=> b!349637 (= res!193777 (and (not ((_ is Found!3430) lt!164250)) ((_ is MissingZero!3430) lt!164250)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18797 (_ BitVec 32)) SeekEntryResult!3430)

(assert (=> b!349637 (= lt!164250 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349638 () Bool)

(declare-fun lt!164251 () Bool)

(assert (=> b!349638 (= e!214169 lt!164251)))

(declare-fun lt!164248 () Unit!10823)

(assert (=> b!349638 (= lt!164248 e!214170)))

(declare-fun c!53292 () Bool)

(assert (=> b!349638 (= c!53292 lt!164251)))

(declare-fun arrayContainsKey!0 (array!18797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349638 (= lt!164251 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349639 () Bool)

(declare-fun res!193778 () Bool)

(assert (=> b!349639 (=> (not res!193778) (not e!214171))))

(declare-datatypes ((List!5178 0))(
  ( (Nil!5175) (Cons!5174 (h!6030 (_ BitVec 64)) (t!10312 List!5178)) )
))
(declare-fun arrayNoDuplicates!0 (array!18797 (_ BitVec 32) List!5178) Bool)

(assert (=> b!349639 (= res!193778 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5175))))

(assert (= (and start!34912 res!193774) b!349636))

(assert (= (and b!349636 res!193779) b!349632))

(assert (= (and b!349632 res!193775) b!349639))

(assert (= (and b!349639 res!193778) b!349634))

(assert (= (and b!349634 res!193776) b!349631))

(assert (= (and b!349631 res!193773) b!349637))

(assert (= (and b!349637 res!193777) b!349638))

(assert (= (and b!349638 c!53292) b!349629))

(assert (= (and b!349638 (not c!53292)) b!349635))

(assert (= (and b!349628 condMapEmpty!12873) mapIsEmpty!12873))

(assert (= (and b!349628 (not condMapEmpty!12873)) mapNonEmpty!12873))

(assert (= (and mapNonEmpty!12873 ((_ is ValueCellFull!3459) mapValue!12873)) b!349630))

(assert (= (and b!349628 ((_ is ValueCellFull!3459) mapDefault!12873)) b!349633))

(assert (= start!34912 b!349628))

(declare-fun m!350079 () Bool)

(assert (=> b!349639 m!350079))

(declare-fun m!350081 () Bool)

(assert (=> start!34912 m!350081))

(declare-fun m!350083 () Bool)

(assert (=> start!34912 m!350083))

(declare-fun m!350085 () Bool)

(assert (=> start!34912 m!350085))

(declare-fun m!350087 () Bool)

(assert (=> b!349638 m!350087))

(declare-fun m!350089 () Bool)

(assert (=> mapNonEmpty!12873 m!350089))

(declare-fun m!350091 () Bool)

(assert (=> b!349634 m!350091))

(declare-fun m!350093 () Bool)

(assert (=> b!349631 m!350093))

(assert (=> b!349631 m!350093))

(declare-fun m!350095 () Bool)

(assert (=> b!349631 m!350095))

(declare-fun m!350097 () Bool)

(assert (=> b!349637 m!350097))

(declare-fun m!350099 () Bool)

(assert (=> b!349632 m!350099))

(declare-fun m!350101 () Bool)

(assert (=> b!349629 m!350101))

(assert (=> b!349629 m!350101))

(declare-fun m!350103 () Bool)

(assert (=> b!349629 m!350103))

(check-sat (not start!34912) (not b!349637) b_and!14879 (not b!349634) (not b!349632) (not mapNonEmpty!12873) (not b!349629) (not b!349638) (not b!349631) (not b!349639) (not b_next!7653) tp_is_empty!7605)
(check-sat b_and!14879 (not b_next!7653))
