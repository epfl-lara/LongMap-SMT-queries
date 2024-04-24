; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34710 () Bool)

(assert start!34710)

(declare-fun b_free!7531 () Bool)

(declare-fun b_next!7531 () Bool)

(assert (=> start!34710 (= b_free!7531 (not b_next!7531))))

(declare-fun tp!26157 () Bool)

(declare-fun b_and!14765 () Bool)

(assert (=> start!34710 (= tp!26157 b_and!14765)))

(declare-fun b!347124 () Bool)

(declare-fun res!192139 () Bool)

(declare-fun e!212707 () Bool)

(assert (=> b!347124 (=> (not res!192139) (not e!212707))))

(declare-datatypes ((array!18548 0))(
  ( (array!18549 (arr!8784 (Array (_ BitVec 32) (_ BitVec 64))) (size!9136 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18548)

(declare-datatypes ((List!4999 0))(
  ( (Nil!4996) (Cons!4995 (h!5851 (_ BitVec 64)) (t!10119 List!4999)) )
))
(declare-fun arrayNoDuplicates!0 (array!18548 (_ BitVec 32) List!4999) Bool)

(assert (=> b!347124 (= res!192139 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4996))))

(declare-fun b!347125 () Bool)

(declare-fun e!212704 () Bool)

(declare-fun tp_is_empty!7483 () Bool)

(assert (=> b!347125 (= e!212704 tp_is_empty!7483)))

(declare-fun mapNonEmpty!12681 () Bool)

(declare-fun mapRes!12681 () Bool)

(declare-fun tp!26156 () Bool)

(declare-fun e!212708 () Bool)

(assert (=> mapNonEmpty!12681 (= mapRes!12681 (and tp!26156 e!212708))))

(declare-datatypes ((V!10955 0))(
  ( (V!10956 (val!3786 Int)) )
))
(declare-datatypes ((ValueCell!3398 0))(
  ( (ValueCellFull!3398 (v!5969 V!10955)) (EmptyCell!3398) )
))
(declare-fun mapRest!12681 () (Array (_ BitVec 32) ValueCell!3398))

(declare-fun mapValue!12681 () ValueCell!3398)

(declare-fun mapKey!12681 () (_ BitVec 32))

(declare-datatypes ((array!18550 0))(
  ( (array!18551 (arr!8785 (Array (_ BitVec 32) ValueCell!3398)) (size!9137 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18550)

(assert (=> mapNonEmpty!12681 (= (arr!8785 _values!1525) (store mapRest!12681 mapKey!12681 mapValue!12681))))

(declare-fun b!347126 () Bool)

(declare-fun e!212703 () Bool)

(assert (=> b!347126 (= e!212703 (and e!212704 mapRes!12681))))

(declare-fun condMapEmpty!12681 () Bool)

(declare-fun mapDefault!12681 () ValueCell!3398)

(assert (=> b!347126 (= condMapEmpty!12681 (= (arr!8785 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3398)) mapDefault!12681)))))

(declare-fun res!192141 () Bool)

(assert (=> start!34710 (=> (not res!192141) (not e!212707))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34710 (= res!192141 (validMask!0 mask!2385))))

(assert (=> start!34710 e!212707))

(assert (=> start!34710 true))

(assert (=> start!34710 tp_is_empty!7483))

(assert (=> start!34710 tp!26157))

(declare-fun array_inv!6494 (array!18550) Bool)

(assert (=> start!34710 (and (array_inv!6494 _values!1525) e!212703)))

(declare-fun array_inv!6495 (array!18548) Bool)

(assert (=> start!34710 (array_inv!6495 _keys!1895)))

(declare-fun b!347127 () Bool)

(declare-fun res!192143 () Bool)

(declare-fun e!212706 () Bool)

(assert (=> b!347127 (=> (not res!192143) (not e!212706))))

(declare-datatypes ((SeekEntryResult!3343 0))(
  ( (MissingZero!3343 (index!15551 (_ BitVec 32))) (Found!3343 (index!15552 (_ BitVec 32))) (Intermediate!3343 (undefined!4155 Bool) (index!15553 (_ BitVec 32)) (x!34538 (_ BitVec 32))) (Undefined!3343) (MissingVacant!3343 (index!15554 (_ BitVec 32))) )
))
(declare-fun lt!163521 () SeekEntryResult!3343)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347127 (= res!192143 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15552 lt!163521)))))

(declare-fun b!347128 () Bool)

(declare-fun res!192136 () Bool)

(assert (=> b!347128 (=> (not res!192136) (not e!212707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18548 (_ BitVec 32)) Bool)

(assert (=> b!347128 (= res!192136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347129 () Bool)

(assert (=> b!347129 (= e!212706 (not true))))

(assert (=> b!347129 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10745 0))(
  ( (Unit!10746) )
))
(declare-fun lt!163522 () Unit!10745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18548 (_ BitVec 64) (_ BitVec 32)) Unit!10745)

(assert (=> b!347129 (= lt!163522 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15552 lt!163521)))))

(declare-fun b!347130 () Bool)

(declare-fun res!192140 () Bool)

(assert (=> b!347130 (=> (not res!192140) (not e!212707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347130 (= res!192140 (validKeyInArray!0 k0!1348))))

(declare-fun b!347131 () Bool)

(assert (=> b!347131 (= e!212707 e!212706)))

(declare-fun res!192142 () Bool)

(assert (=> b!347131 (=> (not res!192142) (not e!212706))))

(get-info :version)

(assert (=> b!347131 (= res!192142 (and ((_ is Found!3343) lt!163521) (= (select (arr!8784 _keys!1895) (index!15552 lt!163521)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18548 (_ BitVec 32)) SeekEntryResult!3343)

(assert (=> b!347131 (= lt!163521 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347132 () Bool)

(declare-fun res!192137 () Bool)

(assert (=> b!347132 (=> (not res!192137) (not e!212707))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347132 (= res!192137 (and (= (size!9137 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9136 _keys!1895) (size!9137 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347133 () Bool)

(declare-fun res!192138 () Bool)

(assert (=> b!347133 (=> (not res!192138) (not e!212707))))

(declare-fun zeroValue!1467 () V!10955)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10955)

(declare-datatypes ((tuple2!5392 0))(
  ( (tuple2!5393 (_1!2707 (_ BitVec 64)) (_2!2707 V!10955)) )
))
(declare-datatypes ((List!5000 0))(
  ( (Nil!4997) (Cons!4996 (h!5852 tuple2!5392) (t!10120 List!5000)) )
))
(declare-datatypes ((ListLongMap!4307 0))(
  ( (ListLongMap!4308 (toList!2169 List!5000)) )
))
(declare-fun contains!2252 (ListLongMap!4307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1698 (array!18548 array!18550 (_ BitVec 32) (_ BitVec 32) V!10955 V!10955 (_ BitVec 32) Int) ListLongMap!4307)

(assert (=> b!347133 (= res!192138 (not (contains!2252 (getCurrentListMap!1698 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12681 () Bool)

(assert (=> mapIsEmpty!12681 mapRes!12681))

(declare-fun b!347134 () Bool)

(assert (=> b!347134 (= e!212708 tp_is_empty!7483)))

(assert (= (and start!34710 res!192141) b!347132))

(assert (= (and b!347132 res!192137) b!347128))

(assert (= (and b!347128 res!192136) b!347124))

(assert (= (and b!347124 res!192139) b!347130))

(assert (= (and b!347130 res!192140) b!347133))

(assert (= (and b!347133 res!192138) b!347131))

(assert (= (and b!347131 res!192142) b!347127))

(assert (= (and b!347127 res!192143) b!347129))

(assert (= (and b!347126 condMapEmpty!12681) mapIsEmpty!12681))

(assert (= (and b!347126 (not condMapEmpty!12681)) mapNonEmpty!12681))

(assert (= (and mapNonEmpty!12681 ((_ is ValueCellFull!3398) mapValue!12681)) b!347134))

(assert (= (and b!347126 ((_ is ValueCellFull!3398) mapDefault!12681)) b!347125))

(assert (= start!34710 b!347126))

(declare-fun m!348371 () Bool)

(assert (=> b!347127 m!348371))

(declare-fun m!348373 () Bool)

(assert (=> b!347133 m!348373))

(assert (=> b!347133 m!348373))

(declare-fun m!348375 () Bool)

(assert (=> b!347133 m!348375))

(declare-fun m!348377 () Bool)

(assert (=> start!34710 m!348377))

(declare-fun m!348379 () Bool)

(assert (=> start!34710 m!348379))

(declare-fun m!348381 () Bool)

(assert (=> start!34710 m!348381))

(declare-fun m!348383 () Bool)

(assert (=> mapNonEmpty!12681 m!348383))

(declare-fun m!348385 () Bool)

(assert (=> b!347130 m!348385))

(declare-fun m!348387 () Bool)

(assert (=> b!347124 m!348387))

(declare-fun m!348389 () Bool)

(assert (=> b!347129 m!348389))

(declare-fun m!348391 () Bool)

(assert (=> b!347129 m!348391))

(declare-fun m!348393 () Bool)

(assert (=> b!347131 m!348393))

(declare-fun m!348395 () Bool)

(assert (=> b!347131 m!348395))

(declare-fun m!348397 () Bool)

(assert (=> b!347128 m!348397))

(check-sat (not b!347128) (not b!347127) (not start!34710) (not mapNonEmpty!12681) (not b!347131) b_and!14765 tp_is_empty!7483 (not b!347129) (not b!347130) (not b!347133) (not b_next!7531) (not b!347124))
(check-sat b_and!14765 (not b_next!7531))
