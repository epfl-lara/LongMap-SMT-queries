; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35228 () Bool)

(assert start!35228)

(declare-fun b_free!7803 () Bool)

(declare-fun b_next!7803 () Bool)

(assert (=> start!35228 (= b_free!7803 (not b_next!7803))))

(declare-fun tp!27002 () Bool)

(declare-fun b_and!15043 () Bool)

(assert (=> start!35228 (= tp!27002 b_and!15043)))

(declare-fun b!353177 () Bool)

(declare-fun res!195852 () Bool)

(declare-fun e!216257 () Bool)

(assert (=> b!353177 (=> (not res!195852) (not e!216257))))

(declare-datatypes ((array!19101 0))(
  ( (array!19102 (arr!9051 (Array (_ BitVec 32) (_ BitVec 64))) (size!9403 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19101)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19101 (_ BitVec 32)) Bool)

(assert (=> b!353177 (= res!195852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!13119 () Bool)

(declare-fun mapRes!13119 () Bool)

(declare-fun tp!27003 () Bool)

(declare-fun e!216254 () Bool)

(assert (=> mapNonEmpty!13119 (= mapRes!13119 (and tp!27003 e!216254))))

(declare-datatypes ((V!11317 0))(
  ( (V!11318 (val!3922 Int)) )
))
(declare-datatypes ((ValueCell!3534 0))(
  ( (ValueCellFull!3534 (v!6114 V!11317)) (EmptyCell!3534) )
))
(declare-fun mapRest!13119 () (Array (_ BitVec 32) ValueCell!3534))

(declare-datatypes ((array!19103 0))(
  ( (array!19104 (arr!9052 (Array (_ BitVec 32) ValueCell!3534)) (size!9404 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19103)

(declare-fun mapValue!13119 () ValueCell!3534)

(declare-fun mapKey!13119 () (_ BitVec 32))

(assert (=> mapNonEmpty!13119 (= (arr!9052 _values!1525) (store mapRest!13119 mapKey!13119 mapValue!13119))))

(declare-fun b!353178 () Bool)

(declare-fun res!195851 () Bool)

(assert (=> b!353178 (=> (not res!195851) (not e!216257))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11317)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11317)

(declare-datatypes ((tuple2!5652 0))(
  ( (tuple2!5653 (_1!2837 (_ BitVec 64)) (_2!2837 V!11317)) )
))
(declare-datatypes ((List!5271 0))(
  ( (Nil!5268) (Cons!5267 (h!6123 tuple2!5652) (t!10419 List!5271)) )
))
(declare-datatypes ((ListLongMap!4565 0))(
  ( (ListLongMap!4566 (toList!2298 List!5271)) )
))
(declare-fun contains!2372 (ListLongMap!4565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1819 (array!19101 array!19103 (_ BitVec 32) (_ BitVec 32) V!11317 V!11317 (_ BitVec 32) Int) ListLongMap!4565)

(assert (=> b!353178 (= res!195851 (not (contains!2372 (getCurrentListMap!1819 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!353179 () Bool)

(declare-fun res!195849 () Bool)

(assert (=> b!353179 (=> (not res!195849) (not e!216257))))

(assert (=> b!353179 (= res!195849 (and (= (size!9404 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9403 _keys!1895) (size!9404 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353180 () Bool)

(declare-fun res!195854 () Bool)

(assert (=> b!353180 (=> (not res!195854) (not e!216257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353180 (= res!195854 (validKeyInArray!0 k0!1348))))

(declare-fun b!353181 () Bool)

(assert (=> b!353181 (= e!216257 false)))

(declare-datatypes ((SeekEntryResult!3482 0))(
  ( (MissingZero!3482 (index!16107 (_ BitVec 32))) (Found!3482 (index!16108 (_ BitVec 32))) (Intermediate!3482 (undefined!4294 Bool) (index!16109 (_ BitVec 32)) (x!35140 (_ BitVec 32))) (Undefined!3482) (MissingVacant!3482 (index!16110 (_ BitVec 32))) )
))
(declare-fun lt!165466 () SeekEntryResult!3482)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19101 (_ BitVec 32)) SeekEntryResult!3482)

(assert (=> b!353181 (= lt!165466 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353182 () Bool)

(declare-fun e!216255 () Bool)

(declare-fun tp_is_empty!7755 () Bool)

(assert (=> b!353182 (= e!216255 tp_is_empty!7755)))

(declare-fun res!195853 () Bool)

(assert (=> start!35228 (=> (not res!195853) (not e!216257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35228 (= res!195853 (validMask!0 mask!2385))))

(assert (=> start!35228 e!216257))

(assert (=> start!35228 true))

(assert (=> start!35228 tp_is_empty!7755))

(assert (=> start!35228 tp!27002))

(declare-fun e!216256 () Bool)

(declare-fun array_inv!6670 (array!19103) Bool)

(assert (=> start!35228 (and (array_inv!6670 _values!1525) e!216256)))

(declare-fun array_inv!6671 (array!19101) Bool)

(assert (=> start!35228 (array_inv!6671 _keys!1895)))

(declare-fun b!353183 () Bool)

(assert (=> b!353183 (= e!216256 (and e!216255 mapRes!13119))))

(declare-fun condMapEmpty!13119 () Bool)

(declare-fun mapDefault!13119 () ValueCell!3534)

(assert (=> b!353183 (= condMapEmpty!13119 (= (arr!9052 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3534)) mapDefault!13119)))))

(declare-fun b!353184 () Bool)

(assert (=> b!353184 (= e!216254 tp_is_empty!7755)))

(declare-fun b!353185 () Bool)

(declare-fun res!195850 () Bool)

(assert (=> b!353185 (=> (not res!195850) (not e!216257))))

(declare-datatypes ((List!5272 0))(
  ( (Nil!5269) (Cons!5268 (h!6124 (_ BitVec 64)) (t!10420 List!5272)) )
))
(declare-fun arrayNoDuplicates!0 (array!19101 (_ BitVec 32) List!5272) Bool)

(assert (=> b!353185 (= res!195850 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5269))))

(declare-fun mapIsEmpty!13119 () Bool)

(assert (=> mapIsEmpty!13119 mapRes!13119))

(assert (= (and start!35228 res!195853) b!353179))

(assert (= (and b!353179 res!195849) b!353177))

(assert (= (and b!353177 res!195852) b!353185))

(assert (= (and b!353185 res!195850) b!353180))

(assert (= (and b!353180 res!195854) b!353178))

(assert (= (and b!353178 res!195851) b!353181))

(assert (= (and b!353183 condMapEmpty!13119) mapIsEmpty!13119))

(assert (= (and b!353183 (not condMapEmpty!13119)) mapNonEmpty!13119))

(get-info :version)

(assert (= (and mapNonEmpty!13119 ((_ is ValueCellFull!3534) mapValue!13119)) b!353184))

(assert (= (and b!353183 ((_ is ValueCellFull!3534) mapDefault!13119)) b!353182))

(assert (= start!35228 b!353183))

(declare-fun m!352621 () Bool)

(assert (=> b!353178 m!352621))

(assert (=> b!353178 m!352621))

(declare-fun m!352623 () Bool)

(assert (=> b!353178 m!352623))

(declare-fun m!352625 () Bool)

(assert (=> b!353180 m!352625))

(declare-fun m!352627 () Bool)

(assert (=> start!35228 m!352627))

(declare-fun m!352629 () Bool)

(assert (=> start!35228 m!352629))

(declare-fun m!352631 () Bool)

(assert (=> start!35228 m!352631))

(declare-fun m!352633 () Bool)

(assert (=> b!353177 m!352633))

(declare-fun m!352635 () Bool)

(assert (=> b!353185 m!352635))

(declare-fun m!352637 () Bool)

(assert (=> mapNonEmpty!13119 m!352637))

(declare-fun m!352639 () Bool)

(assert (=> b!353181 m!352639))

(check-sat tp_is_empty!7755 (not b!353180) (not b_next!7803) (not start!35228) (not mapNonEmpty!13119) (not b!353177) (not b!353185) (not b!353178) (not b!353181) b_and!15043)
(check-sat b_and!15043 (not b_next!7803))
