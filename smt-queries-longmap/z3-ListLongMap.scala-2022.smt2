; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35212 () Bool)

(assert start!35212)

(declare-fun b_free!7801 () Bool)

(declare-fun b_next!7801 () Bool)

(assert (=> start!35212 (= b_free!7801 (not b_next!7801))))

(declare-fun tp!26996 () Bool)

(declare-fun b_and!15015 () Bool)

(assert (=> start!35212 (= tp!26996 b_and!15015)))

(declare-fun b!352875 () Bool)

(declare-fun e!216067 () Bool)

(declare-fun tp_is_empty!7753 () Bool)

(assert (=> b!352875 (= e!216067 tp_is_empty!7753)))

(declare-fun mapNonEmpty!13116 () Bool)

(declare-fun mapRes!13116 () Bool)

(declare-fun tp!26997 () Bool)

(declare-fun e!216064 () Bool)

(assert (=> mapNonEmpty!13116 (= mapRes!13116 (and tp!26997 e!216064))))

(declare-datatypes ((V!11315 0))(
  ( (V!11316 (val!3921 Int)) )
))
(declare-datatypes ((ValueCell!3533 0))(
  ( (ValueCellFull!3533 (v!6107 V!11315)) (EmptyCell!3533) )
))
(declare-fun mapRest!13116 () (Array (_ BitVec 32) ValueCell!3533))

(declare-fun mapKey!13116 () (_ BitVec 32))

(declare-datatypes ((array!19073 0))(
  ( (array!19074 (arr!9037 (Array (_ BitVec 32) ValueCell!3533)) (size!9390 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19073)

(declare-fun mapValue!13116 () ValueCell!3533)

(assert (=> mapNonEmpty!13116 (= (arr!9037 _values!1525) (store mapRest!13116 mapKey!13116 mapValue!13116))))

(declare-fun b!352876 () Bool)

(declare-fun res!195704 () Bool)

(declare-fun e!216066 () Bool)

(assert (=> b!352876 (=> (not res!195704) (not e!216066))))

(declare-datatypes ((array!19075 0))(
  ( (array!19076 (arr!9038 (Array (_ BitVec 32) (_ BitVec 64))) (size!9391 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19075)

(declare-datatypes ((List!5241 0))(
  ( (Nil!5238) (Cons!5237 (h!6093 (_ BitVec 64)) (t!10380 List!5241)) )
))
(declare-fun arrayNoDuplicates!0 (array!19075 (_ BitVec 32) List!5241) Bool)

(assert (=> b!352876 (= res!195704 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5238))))

(declare-fun b!352877 () Bool)

(declare-fun res!195705 () Bool)

(assert (=> b!352877 (=> (not res!195705) (not e!216066))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352877 (= res!195705 (and (= (size!9390 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9391 _keys!1895) (size!9390 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352878 () Bool)

(declare-fun res!195706 () Bool)

(assert (=> b!352878 (=> (not res!195706) (not e!216066))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11315)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11315)

(declare-datatypes ((tuple2!5628 0))(
  ( (tuple2!5629 (_1!2825 (_ BitVec 64)) (_2!2825 V!11315)) )
))
(declare-datatypes ((List!5242 0))(
  ( (Nil!5239) (Cons!5238 (h!6094 tuple2!5628) (t!10381 List!5242)) )
))
(declare-datatypes ((ListLongMap!4531 0))(
  ( (ListLongMap!4532 (toList!2281 List!5242)) )
))
(declare-fun contains!2366 (ListLongMap!4531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1786 (array!19075 array!19073 (_ BitVec 32) (_ BitVec 32) V!11315 V!11315 (_ BitVec 32) Int) ListLongMap!4531)

(assert (=> b!352878 (= res!195706 (not (contains!2366 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352879 () Bool)

(declare-fun res!195703 () Bool)

(assert (=> b!352879 (=> (not res!195703) (not e!216066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352879 (= res!195703 (validKeyInArray!0 k0!1348))))

(declare-fun b!352881 () Bool)

(assert (=> b!352881 (= e!216066 false)))

(declare-datatypes ((SeekEntryResult!3477 0))(
  ( (MissingZero!3477 (index!16087 (_ BitVec 32))) (Found!3477 (index!16088 (_ BitVec 32))) (Intermediate!3477 (undefined!4289 Bool) (index!16089 (_ BitVec 32)) (x!35130 (_ BitVec 32))) (Undefined!3477) (MissingVacant!3477 (index!16090 (_ BitVec 32))) )
))
(declare-fun lt!165228 () SeekEntryResult!3477)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19075 (_ BitVec 32)) SeekEntryResult!3477)

(assert (=> b!352881 (= lt!165228 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13116 () Bool)

(assert (=> mapIsEmpty!13116 mapRes!13116))

(declare-fun b!352882 () Bool)

(assert (=> b!352882 (= e!216064 tp_is_empty!7753)))

(declare-fun b!352883 () Bool)

(declare-fun res!195702 () Bool)

(assert (=> b!352883 (=> (not res!195702) (not e!216066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19075 (_ BitVec 32)) Bool)

(assert (=> b!352883 (= res!195702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!195707 () Bool)

(assert (=> start!35212 (=> (not res!195707) (not e!216066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35212 (= res!195707 (validMask!0 mask!2385))))

(assert (=> start!35212 e!216066))

(assert (=> start!35212 true))

(assert (=> start!35212 tp_is_empty!7753))

(assert (=> start!35212 tp!26996))

(declare-fun e!216065 () Bool)

(declare-fun array_inv!6692 (array!19073) Bool)

(assert (=> start!35212 (and (array_inv!6692 _values!1525) e!216065)))

(declare-fun array_inv!6693 (array!19075) Bool)

(assert (=> start!35212 (array_inv!6693 _keys!1895)))

(declare-fun b!352880 () Bool)

(assert (=> b!352880 (= e!216065 (and e!216067 mapRes!13116))))

(declare-fun condMapEmpty!13116 () Bool)

(declare-fun mapDefault!13116 () ValueCell!3533)

(assert (=> b!352880 (= condMapEmpty!13116 (= (arr!9037 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3533)) mapDefault!13116)))))

(assert (= (and start!35212 res!195707) b!352877))

(assert (= (and b!352877 res!195705) b!352883))

(assert (= (and b!352883 res!195702) b!352876))

(assert (= (and b!352876 res!195704) b!352879))

(assert (= (and b!352879 res!195703) b!352878))

(assert (= (and b!352878 res!195706) b!352881))

(assert (= (and b!352880 condMapEmpty!13116) mapIsEmpty!13116))

(assert (= (and b!352880 (not condMapEmpty!13116)) mapNonEmpty!13116))

(get-info :version)

(assert (= (and mapNonEmpty!13116 ((_ is ValueCellFull!3533) mapValue!13116)) b!352882))

(assert (= (and b!352880 ((_ is ValueCellFull!3533) mapDefault!13116)) b!352875))

(assert (= start!35212 b!352880))

(declare-fun m!351871 () Bool)

(assert (=> b!352881 m!351871))

(declare-fun m!351873 () Bool)

(assert (=> b!352878 m!351873))

(assert (=> b!352878 m!351873))

(declare-fun m!351875 () Bool)

(assert (=> b!352878 m!351875))

(declare-fun m!351877 () Bool)

(assert (=> b!352876 m!351877))

(declare-fun m!351879 () Bool)

(assert (=> b!352879 m!351879))

(declare-fun m!351881 () Bool)

(assert (=> b!352883 m!351881))

(declare-fun m!351883 () Bool)

(assert (=> mapNonEmpty!13116 m!351883))

(declare-fun m!351885 () Bool)

(assert (=> start!35212 m!351885))

(declare-fun m!351887 () Bool)

(assert (=> start!35212 m!351887))

(declare-fun m!351889 () Bool)

(assert (=> start!35212 m!351889))

(check-sat (not b!352878) (not mapNonEmpty!13116) b_and!15015 (not b_next!7801) (not b!352876) (not b!352883) (not start!35212) tp_is_empty!7753 (not b!352879) (not b!352881))
(check-sat b_and!15015 (not b_next!7801))
