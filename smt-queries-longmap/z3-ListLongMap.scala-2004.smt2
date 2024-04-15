; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34990 () Bool)

(assert start!34990)

(declare-fun b_free!7693 () Bool)

(declare-fun b_next!7693 () Bool)

(assert (=> start!34990 (= b_free!7693 (not b_next!7693))))

(declare-fun tp!26658 () Bool)

(declare-fun b_and!14897 () Bool)

(assert (=> start!34990 (= tp!26658 b_and!14897)))

(declare-fun b!350403 () Bool)

(declare-fun res!194243 () Bool)

(declare-fun e!214617 () Bool)

(assert (=> b!350403 (=> (not res!194243) (not e!214617))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350403 (= res!194243 (validKeyInArray!0 k0!1348))))

(declare-fun b!350404 () Bool)

(declare-fun res!194244 () Bool)

(declare-fun e!214615 () Bool)

(assert (=> b!350404 (=> (not res!194244) (not e!214615))))

(declare-datatypes ((array!18857 0))(
  ( (array!18858 (arr!8934 (Array (_ BitVec 32) (_ BitVec 64))) (size!9287 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18857)

(declare-fun arrayContainsKey!0 (array!18857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350404 (= res!194244 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350405 () Bool)

(declare-fun e!214616 () Bool)

(declare-fun tp_is_empty!7645 () Bool)

(assert (=> b!350405 (= e!214616 tp_is_empty!7645)))

(declare-fun b!350406 () Bool)

(declare-fun res!194242 () Bool)

(assert (=> b!350406 (=> (not res!194242) (not e!214617))))

(declare-datatypes ((List!5166 0))(
  ( (Nil!5163) (Cons!5162 (h!6018 (_ BitVec 64)) (t!10295 List!5166)) )
))
(declare-fun arrayNoDuplicates!0 (array!18857 (_ BitVec 32) List!5166) Bool)

(assert (=> b!350406 (= res!194242 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5163))))

(declare-fun b!350407 () Bool)

(assert (=> b!350407 (= e!214617 e!214615)))

(declare-fun res!194245 () Bool)

(assert (=> b!350407 (=> (not res!194245) (not e!214615))))

(declare-datatypes ((SeekEntryResult!3442 0))(
  ( (MissingZero!3442 (index!15947 (_ BitVec 32))) (Found!3442 (index!15948 (_ BitVec 32))) (Intermediate!3442 (undefined!4254 Bool) (index!15949 (_ BitVec 32)) (x!34901 (_ BitVec 32))) (Undefined!3442) (MissingVacant!3442 (index!15950 (_ BitVec 32))) )
))
(declare-fun lt!164390 () SeekEntryResult!3442)

(get-info :version)

(assert (=> b!350407 (= res!194245 (and (not ((_ is Found!3442) lt!164390)) (not ((_ is MissingZero!3442) lt!164390)) ((_ is MissingVacant!3442) lt!164390)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18857 (_ BitVec 32)) SeekEntryResult!3442)

(assert (=> b!350407 (= lt!164390 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12939 () Bool)

(declare-fun mapRes!12939 () Bool)

(assert (=> mapIsEmpty!12939 mapRes!12939))

(declare-fun b!350408 () Bool)

(declare-fun res!194246 () Bool)

(assert (=> b!350408 (=> (not res!194246) (not e!214617))))

(declare-datatypes ((V!11171 0))(
  ( (V!11172 (val!3867 Int)) )
))
(declare-fun zeroValue!1467 () V!11171)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3479 0))(
  ( (ValueCellFull!3479 (v!6048 V!11171)) (EmptyCell!3479) )
))
(declare-datatypes ((array!18859 0))(
  ( (array!18860 (arr!8935 (Array (_ BitVec 32) ValueCell!3479)) (size!9288 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18859)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11171)

(declare-datatypes ((tuple2!5552 0))(
  ( (tuple2!5553 (_1!2787 (_ BitVec 64)) (_2!2787 V!11171)) )
))
(declare-datatypes ((List!5167 0))(
  ( (Nil!5164) (Cons!5163 (h!6019 tuple2!5552) (t!10296 List!5167)) )
))
(declare-datatypes ((ListLongMap!4455 0))(
  ( (ListLongMap!4456 (toList!2243 List!5167)) )
))
(declare-fun contains!2323 (ListLongMap!4455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1748 (array!18857 array!18859 (_ BitVec 32) (_ BitVec 32) V!11171 V!11171 (_ BitVec 32) Int) ListLongMap!4455)

(assert (=> b!350408 (= res!194246 (not (contains!2323 (getCurrentListMap!1748 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!194240 () Bool)

(assert (=> start!34990 (=> (not res!194240) (not e!214617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34990 (= res!194240 (validMask!0 mask!2385))))

(assert (=> start!34990 e!214617))

(assert (=> start!34990 true))

(assert (=> start!34990 tp_is_empty!7645))

(assert (=> start!34990 tp!26658))

(declare-fun e!214614 () Bool)

(declare-fun array_inv!6622 (array!18859) Bool)

(assert (=> start!34990 (and (array_inv!6622 _values!1525) e!214614)))

(declare-fun array_inv!6623 (array!18857) Bool)

(assert (=> start!34990 (array_inv!6623 _keys!1895)))

(declare-fun mapNonEmpty!12939 () Bool)

(declare-fun tp!26657 () Bool)

(assert (=> mapNonEmpty!12939 (= mapRes!12939 (and tp!26657 e!214616))))

(declare-fun mapKey!12939 () (_ BitVec 32))

(declare-fun mapRest!12939 () (Array (_ BitVec 32) ValueCell!3479))

(declare-fun mapValue!12939 () ValueCell!3479)

(assert (=> mapNonEmpty!12939 (= (arr!8935 _values!1525) (store mapRest!12939 mapKey!12939 mapValue!12939))))

(declare-fun b!350409 () Bool)

(assert (=> b!350409 (= e!214615 false)))

(declare-fun lt!164391 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18857 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350409 (= lt!164391 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350410 () Bool)

(declare-fun e!214619 () Bool)

(assert (=> b!350410 (= e!214619 tp_is_empty!7645)))

(declare-fun b!350411 () Bool)

(declare-fun res!194241 () Bool)

(assert (=> b!350411 (=> (not res!194241) (not e!214617))))

(assert (=> b!350411 (= res!194241 (and (= (size!9288 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9287 _keys!1895) (size!9288 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350412 () Bool)

(declare-fun res!194247 () Bool)

(assert (=> b!350412 (=> (not res!194247) (not e!214617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18857 (_ BitVec 32)) Bool)

(assert (=> b!350412 (= res!194247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350413 () Bool)

(assert (=> b!350413 (= e!214614 (and e!214619 mapRes!12939))))

(declare-fun condMapEmpty!12939 () Bool)

(declare-fun mapDefault!12939 () ValueCell!3479)

(assert (=> b!350413 (= condMapEmpty!12939 (= (arr!8935 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3479)) mapDefault!12939)))))

(assert (= (and start!34990 res!194240) b!350411))

(assert (= (and b!350411 res!194241) b!350412))

(assert (= (and b!350412 res!194247) b!350406))

(assert (= (and b!350406 res!194242) b!350403))

(assert (= (and b!350403 res!194243) b!350408))

(assert (= (and b!350408 res!194246) b!350407))

(assert (= (and b!350407 res!194245) b!350404))

(assert (= (and b!350404 res!194244) b!350409))

(assert (= (and b!350413 condMapEmpty!12939) mapIsEmpty!12939))

(assert (= (and b!350413 (not condMapEmpty!12939)) mapNonEmpty!12939))

(assert (= (and mapNonEmpty!12939 ((_ is ValueCellFull!3479) mapValue!12939)) b!350405))

(assert (= (and b!350413 ((_ is ValueCellFull!3479) mapDefault!12939)) b!350410))

(assert (= start!34990 b!350413))

(declare-fun m!350079 () Bool)

(assert (=> b!350404 m!350079))

(declare-fun m!350081 () Bool)

(assert (=> b!350407 m!350081))

(declare-fun m!350083 () Bool)

(assert (=> b!350412 m!350083))

(declare-fun m!350085 () Bool)

(assert (=> b!350406 m!350085))

(declare-fun m!350087 () Bool)

(assert (=> b!350403 m!350087))

(declare-fun m!350089 () Bool)

(assert (=> b!350408 m!350089))

(assert (=> b!350408 m!350089))

(declare-fun m!350091 () Bool)

(assert (=> b!350408 m!350091))

(declare-fun m!350093 () Bool)

(assert (=> b!350409 m!350093))

(declare-fun m!350095 () Bool)

(assert (=> start!34990 m!350095))

(declare-fun m!350097 () Bool)

(assert (=> start!34990 m!350097))

(declare-fun m!350099 () Bool)

(assert (=> start!34990 m!350099))

(declare-fun m!350101 () Bool)

(assert (=> mapNonEmpty!12939 m!350101))

(check-sat b_and!14897 (not b!350403) tp_is_empty!7645 (not b!350412) (not mapNonEmpty!12939) (not start!34990) (not b!350409) (not b_next!7693) (not b!350408) (not b!350406) (not b!350404) (not b!350407))
(check-sat b_and!14897 (not b_next!7693))
