; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35024 () Bool)

(assert start!35024)

(declare-fun b_free!7713 () Bool)

(declare-fun b_next!7713 () Bool)

(assert (=> start!35024 (= b_free!7713 (not b_next!7713))))

(declare-fun tp!26718 () Bool)

(declare-fun b_and!14943 () Bool)

(assert (=> start!35024 (= tp!26718 b_and!14943)))

(declare-fun b!351008 () Bool)

(declare-fun e!214972 () Bool)

(declare-fun tp_is_empty!7665 () Bool)

(assert (=> b!351008 (= e!214972 tp_is_empty!7665)))

(declare-fun b!351009 () Bool)

(declare-fun res!194611 () Bool)

(declare-fun e!214974 () Bool)

(assert (=> b!351009 (=> (not res!194611) (not e!214974))))

(declare-datatypes ((array!18917 0))(
  ( (array!18918 (arr!8964 (Array (_ BitVec 32) (_ BitVec 64))) (size!9316 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18917)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18917 (_ BitVec 32)) Bool)

(assert (=> b!351009 (= res!194611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351010 () Bool)

(declare-fun res!194616 () Bool)

(assert (=> b!351010 (=> (not res!194616) (not e!214974))))

(declare-datatypes ((List!5215 0))(
  ( (Nil!5212) (Cons!5211 (h!6067 (_ BitVec 64)) (t!10353 List!5215)) )
))
(declare-fun arrayNoDuplicates!0 (array!18917 (_ BitVec 32) List!5215) Bool)

(assert (=> b!351010 (= res!194616 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5212))))

(declare-fun mapNonEmpty!12969 () Bool)

(declare-fun mapRes!12969 () Bool)

(declare-fun tp!26717 () Bool)

(assert (=> mapNonEmpty!12969 (= mapRes!12969 (and tp!26717 e!214972))))

(declare-fun mapKey!12969 () (_ BitVec 32))

(declare-datatypes ((V!11197 0))(
  ( (V!11198 (val!3877 Int)) )
))
(declare-datatypes ((ValueCell!3489 0))(
  ( (ValueCellFull!3489 (v!6064 V!11197)) (EmptyCell!3489) )
))
(declare-fun mapRest!12969 () (Array (_ BitVec 32) ValueCell!3489))

(declare-fun mapValue!12969 () ValueCell!3489)

(declare-datatypes ((array!18919 0))(
  ( (array!18920 (arr!8965 (Array (_ BitVec 32) ValueCell!3489)) (size!9317 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18919)

(assert (=> mapNonEmpty!12969 (= (arr!8965 _values!1525) (store mapRest!12969 mapKey!12969 mapValue!12969))))

(declare-fun mapIsEmpty!12969 () Bool)

(assert (=> mapIsEmpty!12969 mapRes!12969))

(declare-fun b!351012 () Bool)

(declare-fun e!214970 () Bool)

(declare-fun e!214973 () Bool)

(assert (=> b!351012 (= e!214970 (and e!214973 mapRes!12969))))

(declare-fun condMapEmpty!12969 () Bool)

(declare-fun mapDefault!12969 () ValueCell!3489)

(assert (=> b!351012 (= condMapEmpty!12969 (= (arr!8965 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3489)) mapDefault!12969)))))

(declare-fun b!351013 () Bool)

(assert (=> b!351013 (= e!214973 tp_is_empty!7665)))

(declare-fun b!351014 () Bool)

(declare-fun res!194610 () Bool)

(assert (=> b!351014 (=> (not res!194610) (not e!214974))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351014 (= res!194610 (validKeyInArray!0 k0!1348))))

(declare-fun b!351015 () Bool)

(declare-fun e!214971 () Bool)

(assert (=> b!351015 (= e!214971 false)))

(declare-fun lt!164686 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18917 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351015 (= lt!164686 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351016 () Bool)

(assert (=> b!351016 (= e!214974 e!214971)))

(declare-fun res!194614 () Bool)

(assert (=> b!351016 (=> (not res!194614) (not e!214971))))

(declare-datatypes ((SeekEntryResult!3449 0))(
  ( (MissingZero!3449 (index!15975 (_ BitVec 32))) (Found!3449 (index!15976 (_ BitVec 32))) (Intermediate!3449 (undefined!4261 Bool) (index!15977 (_ BitVec 32)) (x!34937 (_ BitVec 32))) (Undefined!3449) (MissingVacant!3449 (index!15978 (_ BitVec 32))) )
))
(declare-fun lt!164685 () SeekEntryResult!3449)

(get-info :version)

(assert (=> b!351016 (= res!194614 (and (not ((_ is Found!3449) lt!164685)) (not ((_ is MissingZero!3449) lt!164685)) ((_ is MissingVacant!3449) lt!164685)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18917 (_ BitVec 32)) SeekEntryResult!3449)

(assert (=> b!351016 (= lt!164685 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351011 () Bool)

(declare-fun res!194613 () Bool)

(assert (=> b!351011 (=> (not res!194613) (not e!214971))))

(declare-fun arrayContainsKey!0 (array!18917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351011 (= res!194613 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194609 () Bool)

(assert (=> start!35024 (=> (not res!194609) (not e!214974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35024 (= res!194609 (validMask!0 mask!2385))))

(assert (=> start!35024 e!214974))

(assert (=> start!35024 true))

(assert (=> start!35024 tp_is_empty!7665))

(assert (=> start!35024 tp!26718))

(declare-fun array_inv!6618 (array!18919) Bool)

(assert (=> start!35024 (and (array_inv!6618 _values!1525) e!214970)))

(declare-fun array_inv!6619 (array!18917) Bool)

(assert (=> start!35024 (array_inv!6619 _keys!1895)))

(declare-fun b!351017 () Bool)

(declare-fun res!194612 () Bool)

(assert (=> b!351017 (=> (not res!194612) (not e!214974))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351017 (= res!194612 (and (= (size!9317 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9316 _keys!1895) (size!9317 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351018 () Bool)

(declare-fun res!194615 () Bool)

(assert (=> b!351018 (=> (not res!194615) (not e!214974))))

(declare-fun zeroValue!1467 () V!11197)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11197)

(declare-datatypes ((tuple2!5596 0))(
  ( (tuple2!5597 (_1!2809 (_ BitVec 64)) (_2!2809 V!11197)) )
))
(declare-datatypes ((List!5216 0))(
  ( (Nil!5213) (Cons!5212 (h!6068 tuple2!5596) (t!10354 List!5216)) )
))
(declare-datatypes ((ListLongMap!4509 0))(
  ( (ListLongMap!4510 (toList!2270 List!5216)) )
))
(declare-fun contains!2339 (ListLongMap!4509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1791 (array!18917 array!18919 (_ BitVec 32) (_ BitVec 32) V!11197 V!11197 (_ BitVec 32) Int) ListLongMap!4509)

(assert (=> b!351018 (= res!194615 (not (contains!2339 (getCurrentListMap!1791 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!35024 res!194609) b!351017))

(assert (= (and b!351017 res!194612) b!351009))

(assert (= (and b!351009 res!194611) b!351010))

(assert (= (and b!351010 res!194616) b!351014))

(assert (= (and b!351014 res!194610) b!351018))

(assert (= (and b!351018 res!194615) b!351016))

(assert (= (and b!351016 res!194614) b!351011))

(assert (= (and b!351011 res!194613) b!351015))

(assert (= (and b!351012 condMapEmpty!12969) mapIsEmpty!12969))

(assert (= (and b!351012 (not condMapEmpty!12969)) mapNonEmpty!12969))

(assert (= (and mapNonEmpty!12969 ((_ is ValueCellFull!3489) mapValue!12969)) b!351008))

(assert (= (and b!351012 ((_ is ValueCellFull!3489) mapDefault!12969)) b!351013))

(assert (= start!35024 b!351012))

(declare-fun m!351049 () Bool)

(assert (=> start!35024 m!351049))

(declare-fun m!351051 () Bool)

(assert (=> start!35024 m!351051))

(declare-fun m!351053 () Bool)

(assert (=> start!35024 m!351053))

(declare-fun m!351055 () Bool)

(assert (=> b!351011 m!351055))

(declare-fun m!351057 () Bool)

(assert (=> b!351010 m!351057))

(declare-fun m!351059 () Bool)

(assert (=> b!351015 m!351059))

(declare-fun m!351061 () Bool)

(assert (=> b!351018 m!351061))

(assert (=> b!351018 m!351061))

(declare-fun m!351063 () Bool)

(assert (=> b!351018 m!351063))

(declare-fun m!351065 () Bool)

(assert (=> b!351016 m!351065))

(declare-fun m!351067 () Bool)

(assert (=> b!351014 m!351067))

(declare-fun m!351069 () Bool)

(assert (=> mapNonEmpty!12969 m!351069))

(declare-fun m!351071 () Bool)

(assert (=> b!351009 m!351071))

(check-sat (not b!351014) tp_is_empty!7665 (not b!351009) (not b_next!7713) (not b!351018) (not b!351011) (not mapNonEmpty!12969) (not start!35024) b_and!14943 (not b!351010) (not b!351015) (not b!351016))
(check-sat b_and!14943 (not b_next!7713))
