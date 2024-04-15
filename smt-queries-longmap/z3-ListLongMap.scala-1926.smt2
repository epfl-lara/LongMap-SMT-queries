; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34188 () Bool)

(assert start!34188)

(declare-fun b_free!7225 () Bool)

(declare-fun b_next!7225 () Bool)

(assert (=> start!34188 (= b_free!7225 (not b_next!7225))))

(declare-fun tp!25209 () Bool)

(declare-fun b_and!14399 () Bool)

(assert (=> start!34188 (= tp!25209 b_and!14399)))

(declare-fun mapNonEmpty!12192 () Bool)

(declare-fun mapRes!12192 () Bool)

(declare-fun tp!25208 () Bool)

(declare-fun e!209010 () Bool)

(assert (=> mapNonEmpty!12192 (= mapRes!12192 (and tp!25208 e!209010))))

(declare-datatypes ((V!10547 0))(
  ( (V!10548 (val!3633 Int)) )
))
(declare-datatypes ((ValueCell!3245 0))(
  ( (ValueCellFull!3245 (v!5799 V!10547)) (EmptyCell!3245) )
))
(declare-fun mapRest!12192 () (Array (_ BitVec 32) ValueCell!3245))

(declare-fun mapValue!12192 () ValueCell!3245)

(declare-fun mapKey!12192 () (_ BitVec 32))

(declare-datatypes ((array!17929 0))(
  ( (array!17930 (arr!8485 (Array (_ BitVec 32) ValueCell!3245)) (size!8838 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17929)

(assert (=> mapNonEmpty!12192 (= (arr!8485 _values!1525) (store mapRest!12192 mapKey!12192 mapValue!12192))))

(declare-fun b!340782 () Bool)

(declare-fun res!188347 () Bool)

(declare-fun e!209011 () Bool)

(assert (=> b!340782 (=> (not res!188347) (not e!209011))))

(declare-datatypes ((array!17931 0))(
  ( (array!17932 (arr!8486 (Array (_ BitVec 32) (_ BitVec 64))) (size!8839 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17931)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340782 (= res!188347 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340783 () Bool)

(declare-fun e!209012 () Bool)

(declare-fun e!209009 () Bool)

(assert (=> b!340783 (= e!209012 (and e!209009 mapRes!12192))))

(declare-fun condMapEmpty!12192 () Bool)

(declare-fun mapDefault!12192 () ValueCell!3245)

(assert (=> b!340783 (= condMapEmpty!12192 (= (arr!8485 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3245)) mapDefault!12192)))))

(declare-fun b!340784 () Bool)

(declare-fun tp_is_empty!7177 () Bool)

(assert (=> b!340784 (= e!209010 tp_is_empty!7177)))

(declare-fun b!340785 () Bool)

(declare-fun res!188351 () Bool)

(declare-fun e!209014 () Bool)

(assert (=> b!340785 (=> (not res!188351) (not e!209014))))

(declare-datatypes ((List!4834 0))(
  ( (Nil!4831) (Cons!4830 (h!5686 (_ BitVec 64)) (t!9933 List!4834)) )
))
(declare-fun arrayNoDuplicates!0 (array!17931 (_ BitVec 32) List!4834) Bool)

(assert (=> b!340785 (= res!188351 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4831))))

(declare-fun b!340786 () Bool)

(assert (=> b!340786 (= e!209011 false)))

(declare-fun lt!161465 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17931 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340786 (= lt!161465 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340787 () Bool)

(assert (=> b!340787 (= e!209009 tp_is_empty!7177)))

(declare-fun b!340788 () Bool)

(declare-fun res!188348 () Bool)

(assert (=> b!340788 (=> (not res!188348) (not e!209014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340788 (= res!188348 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12192 () Bool)

(assert (=> mapIsEmpty!12192 mapRes!12192))

(declare-fun b!340789 () Bool)

(declare-fun res!188349 () Bool)

(assert (=> b!340789 (=> (not res!188349) (not e!209014))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340789 (= res!188349 (and (= (size!8838 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8839 _keys!1895) (size!8838 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340781 () Bool)

(declare-fun res!188345 () Bool)

(assert (=> b!340781 (=> (not res!188345) (not e!209014))))

(declare-fun zeroValue!1467 () V!10547)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10547)

(declare-datatypes ((tuple2!5210 0))(
  ( (tuple2!5211 (_1!2616 (_ BitVec 64)) (_2!2616 V!10547)) )
))
(declare-datatypes ((List!4835 0))(
  ( (Nil!4832) (Cons!4831 (h!5687 tuple2!5210) (t!9934 List!4835)) )
))
(declare-datatypes ((ListLongMap!4113 0))(
  ( (ListLongMap!4114 (toList!2072 List!4835)) )
))
(declare-fun contains!2137 (ListLongMap!4113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1578 (array!17931 array!17929 (_ BitVec 32) (_ BitVec 32) V!10547 V!10547 (_ BitVec 32) Int) ListLongMap!4113)

(assert (=> b!340781 (= res!188345 (not (contains!2137 (getCurrentListMap!1578 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!188346 () Bool)

(assert (=> start!34188 (=> (not res!188346) (not e!209014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34188 (= res!188346 (validMask!0 mask!2385))))

(assert (=> start!34188 e!209014))

(assert (=> start!34188 true))

(assert (=> start!34188 tp_is_empty!7177))

(assert (=> start!34188 tp!25209))

(declare-fun array_inv!6312 (array!17929) Bool)

(assert (=> start!34188 (and (array_inv!6312 _values!1525) e!209012)))

(declare-fun array_inv!6313 (array!17931) Bool)

(assert (=> start!34188 (array_inv!6313 _keys!1895)))

(declare-fun b!340790 () Bool)

(assert (=> b!340790 (= e!209014 e!209011)))

(declare-fun res!188344 () Bool)

(assert (=> b!340790 (=> (not res!188344) (not e!209011))))

(declare-datatypes ((SeekEntryResult!3267 0))(
  ( (MissingZero!3267 (index!15247 (_ BitVec 32))) (Found!3267 (index!15248 (_ BitVec 32))) (Intermediate!3267 (undefined!4079 Bool) (index!15249 (_ BitVec 32)) (x!33952 (_ BitVec 32))) (Undefined!3267) (MissingVacant!3267 (index!15250 (_ BitVec 32))) )
))
(declare-fun lt!161466 () SeekEntryResult!3267)

(get-info :version)

(assert (=> b!340790 (= res!188344 (and (not ((_ is Found!3267) lt!161466)) (not ((_ is MissingZero!3267) lt!161466)) ((_ is MissingVacant!3267) lt!161466)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17931 (_ BitVec 32)) SeekEntryResult!3267)

(assert (=> b!340790 (= lt!161466 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340791 () Bool)

(declare-fun res!188350 () Bool)

(assert (=> b!340791 (=> (not res!188350) (not e!209014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17931 (_ BitVec 32)) Bool)

(assert (=> b!340791 (= res!188350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34188 res!188346) b!340789))

(assert (= (and b!340789 res!188349) b!340791))

(assert (= (and b!340791 res!188350) b!340785))

(assert (= (and b!340785 res!188351) b!340788))

(assert (= (and b!340788 res!188348) b!340781))

(assert (= (and b!340781 res!188345) b!340790))

(assert (= (and b!340790 res!188344) b!340782))

(assert (= (and b!340782 res!188347) b!340786))

(assert (= (and b!340783 condMapEmpty!12192) mapIsEmpty!12192))

(assert (= (and b!340783 (not condMapEmpty!12192)) mapNonEmpty!12192))

(assert (= (and mapNonEmpty!12192 ((_ is ValueCellFull!3245) mapValue!12192)) b!340784))

(assert (= (and b!340783 ((_ is ValueCellFull!3245) mapDefault!12192)) b!340787))

(assert (= start!34188 b!340783))

(declare-fun m!342861 () Bool)

(assert (=> start!34188 m!342861))

(declare-fun m!342863 () Bool)

(assert (=> start!34188 m!342863))

(declare-fun m!342865 () Bool)

(assert (=> start!34188 m!342865))

(declare-fun m!342867 () Bool)

(assert (=> b!340781 m!342867))

(assert (=> b!340781 m!342867))

(declare-fun m!342869 () Bool)

(assert (=> b!340781 m!342869))

(declare-fun m!342871 () Bool)

(assert (=> b!340785 m!342871))

(declare-fun m!342873 () Bool)

(assert (=> b!340782 m!342873))

(declare-fun m!342875 () Bool)

(assert (=> b!340791 m!342875))

(declare-fun m!342877 () Bool)

(assert (=> b!340790 m!342877))

(declare-fun m!342879 () Bool)

(assert (=> b!340786 m!342879))

(declare-fun m!342881 () Bool)

(assert (=> mapNonEmpty!12192 m!342881))

(declare-fun m!342883 () Bool)

(assert (=> b!340788 m!342883))

(check-sat (not b!340781) (not b!340791) (not b!340788) (not start!34188) (not b_next!7225) b_and!14399 (not b!340786) (not b!340785) (not b!340790) (not b!340782) tp_is_empty!7177 (not mapNonEmpty!12192))
(check-sat b_and!14399 (not b_next!7225))
