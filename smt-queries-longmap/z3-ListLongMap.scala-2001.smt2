; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34988 () Bool)

(assert start!34988)

(declare-fun b_free!7677 () Bool)

(declare-fun b_next!7677 () Bool)

(assert (=> start!34988 (= b_free!7677 (not b_next!7677))))

(declare-fun tp!26609 () Bool)

(declare-fun b_and!14907 () Bool)

(assert (=> start!34988 (= tp!26609 b_and!14907)))

(declare-fun b!350414 () Bool)

(declare-fun res!194182 () Bool)

(declare-fun e!214648 () Bool)

(assert (=> b!350414 (=> (not res!194182) (not e!214648))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11149 0))(
  ( (V!11150 (val!3859 Int)) )
))
(declare-fun zeroValue!1467 () V!11149)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3471 0))(
  ( (ValueCellFull!3471 (v!6046 V!11149)) (EmptyCell!3471) )
))
(declare-datatypes ((array!18845 0))(
  ( (array!18846 (arr!8928 (Array (_ BitVec 32) ValueCell!3471)) (size!9280 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18845)

(declare-datatypes ((array!18847 0))(
  ( (array!18848 (arr!8929 (Array (_ BitVec 32) (_ BitVec 64))) (size!9281 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18847)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11149)

(declare-datatypes ((tuple2!5574 0))(
  ( (tuple2!5575 (_1!2798 (_ BitVec 64)) (_2!2798 V!11149)) )
))
(declare-datatypes ((List!5194 0))(
  ( (Nil!5191) (Cons!5190 (h!6046 tuple2!5574) (t!10332 List!5194)) )
))
(declare-datatypes ((ListLongMap!4487 0))(
  ( (ListLongMap!4488 (toList!2259 List!5194)) )
))
(declare-fun contains!2328 (ListLongMap!4487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1780 (array!18847 array!18845 (_ BitVec 32) (_ BitVec 32) V!11149 V!11149 (_ BitVec 32) Int) ListLongMap!4487)

(assert (=> b!350414 (= res!194182 (not (contains!2328 (getCurrentListMap!1780 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350415 () Bool)

(declare-fun e!214649 () Bool)

(assert (=> b!350415 (= e!214648 e!214649)))

(declare-fun res!194179 () Bool)

(assert (=> b!350415 (=> (not res!194179) (not e!214649))))

(declare-datatypes ((SeekEntryResult!3439 0))(
  ( (MissingZero!3439 (index!15935 (_ BitVec 32))) (Found!3439 (index!15936 (_ BitVec 32))) (Intermediate!3439 (undefined!4251 Bool) (index!15937 (_ BitVec 32)) (x!34879 (_ BitVec 32))) (Undefined!3439) (MissingVacant!3439 (index!15938 (_ BitVec 32))) )
))
(declare-fun lt!164577 () SeekEntryResult!3439)

(get-info :version)

(assert (=> b!350415 (= res!194179 (and (not ((_ is Found!3439) lt!164577)) (not ((_ is MissingZero!3439) lt!164577)) ((_ is MissingVacant!3439) lt!164577)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18847 (_ BitVec 32)) SeekEntryResult!3439)

(assert (=> b!350415 (= lt!164577 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350416 () Bool)

(declare-fun res!194177 () Bool)

(assert (=> b!350416 (=> (not res!194177) (not e!214648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18847 (_ BitVec 32)) Bool)

(assert (=> b!350416 (= res!194177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350417 () Bool)

(declare-fun res!194180 () Bool)

(assert (=> b!350417 (=> (not res!194180) (not e!214648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350417 (= res!194180 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12915 () Bool)

(declare-fun mapRes!12915 () Bool)

(declare-fun tp!26610 () Bool)

(declare-fun e!214647 () Bool)

(assert (=> mapNonEmpty!12915 (= mapRes!12915 (and tp!26610 e!214647))))

(declare-fun mapRest!12915 () (Array (_ BitVec 32) ValueCell!3471))

(declare-fun mapValue!12915 () ValueCell!3471)

(declare-fun mapKey!12915 () (_ BitVec 32))

(assert (=> mapNonEmpty!12915 (= (arr!8928 _values!1525) (store mapRest!12915 mapKey!12915 mapValue!12915))))

(declare-fun b!350418 () Bool)

(declare-fun e!214651 () Bool)

(declare-fun tp_is_empty!7629 () Bool)

(assert (=> b!350418 (= e!214651 tp_is_empty!7629)))

(declare-fun mapIsEmpty!12915 () Bool)

(assert (=> mapIsEmpty!12915 mapRes!12915))

(declare-fun res!194181 () Bool)

(assert (=> start!34988 (=> (not res!194181) (not e!214648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34988 (= res!194181 (validMask!0 mask!2385))))

(assert (=> start!34988 e!214648))

(assert (=> start!34988 true))

(assert (=> start!34988 tp_is_empty!7629))

(assert (=> start!34988 tp!26609))

(declare-fun e!214650 () Bool)

(declare-fun array_inv!6592 (array!18845) Bool)

(assert (=> start!34988 (and (array_inv!6592 _values!1525) e!214650)))

(declare-fun array_inv!6593 (array!18847) Bool)

(assert (=> start!34988 (array_inv!6593 _keys!1895)))

(declare-fun b!350419 () Bool)

(assert (=> b!350419 (= e!214649 false)))

(declare-fun lt!164578 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18847 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350419 (= lt!164578 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350420 () Bool)

(declare-fun res!194183 () Bool)

(assert (=> b!350420 (=> (not res!194183) (not e!214648))))

(declare-datatypes ((List!5195 0))(
  ( (Nil!5192) (Cons!5191 (h!6047 (_ BitVec 64)) (t!10333 List!5195)) )
))
(declare-fun arrayNoDuplicates!0 (array!18847 (_ BitVec 32) List!5195) Bool)

(assert (=> b!350420 (= res!194183 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5192))))

(declare-fun b!350421 () Bool)

(assert (=> b!350421 (= e!214647 tp_is_empty!7629)))

(declare-fun b!350422 () Bool)

(declare-fun res!194178 () Bool)

(assert (=> b!350422 (=> (not res!194178) (not e!214649))))

(declare-fun arrayContainsKey!0 (array!18847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350422 (= res!194178 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350423 () Bool)

(declare-fun res!194184 () Bool)

(assert (=> b!350423 (=> (not res!194184) (not e!214648))))

(assert (=> b!350423 (= res!194184 (and (= (size!9280 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9281 _keys!1895) (size!9280 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350424 () Bool)

(assert (=> b!350424 (= e!214650 (and e!214651 mapRes!12915))))

(declare-fun condMapEmpty!12915 () Bool)

(declare-fun mapDefault!12915 () ValueCell!3471)

(assert (=> b!350424 (= condMapEmpty!12915 (= (arr!8928 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3471)) mapDefault!12915)))))

(assert (= (and start!34988 res!194181) b!350423))

(assert (= (and b!350423 res!194184) b!350416))

(assert (= (and b!350416 res!194177) b!350420))

(assert (= (and b!350420 res!194183) b!350417))

(assert (= (and b!350417 res!194180) b!350414))

(assert (= (and b!350414 res!194182) b!350415))

(assert (= (and b!350415 res!194179) b!350422))

(assert (= (and b!350422 res!194178) b!350419))

(assert (= (and b!350424 condMapEmpty!12915) mapIsEmpty!12915))

(assert (= (and b!350424 (not condMapEmpty!12915)) mapNonEmpty!12915))

(assert (= (and mapNonEmpty!12915 ((_ is ValueCellFull!3471) mapValue!12915)) b!350421))

(assert (= (and b!350424 ((_ is ValueCellFull!3471) mapDefault!12915)) b!350418))

(assert (= start!34988 b!350424))

(declare-fun m!350617 () Bool)

(assert (=> start!34988 m!350617))

(declare-fun m!350619 () Bool)

(assert (=> start!34988 m!350619))

(declare-fun m!350621 () Bool)

(assert (=> start!34988 m!350621))

(declare-fun m!350623 () Bool)

(assert (=> b!350417 m!350623))

(declare-fun m!350625 () Bool)

(assert (=> b!350422 m!350625))

(declare-fun m!350627 () Bool)

(assert (=> b!350419 m!350627))

(declare-fun m!350629 () Bool)

(assert (=> mapNonEmpty!12915 m!350629))

(declare-fun m!350631 () Bool)

(assert (=> b!350420 m!350631))

(declare-fun m!350633 () Bool)

(assert (=> b!350414 m!350633))

(assert (=> b!350414 m!350633))

(declare-fun m!350635 () Bool)

(assert (=> b!350414 m!350635))

(declare-fun m!350637 () Bool)

(assert (=> b!350416 m!350637))

(declare-fun m!350639 () Bool)

(assert (=> b!350415 m!350639))

(check-sat (not b!350414) tp_is_empty!7629 (not b!350415) (not mapNonEmpty!12915) (not b!350420) (not b!350417) (not b!350422) (not b!350419) (not b_next!7677) b_and!14907 (not b!350416) (not start!34988))
(check-sat b_and!14907 (not b_next!7677))
