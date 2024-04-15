; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34972 () Bool)

(assert start!34972)

(declare-fun b_free!7675 () Bool)

(declare-fun b_next!7675 () Bool)

(assert (=> start!34972 (= b_free!7675 (not b_next!7675))))

(declare-fun tp!26603 () Bool)

(declare-fun b_and!14879 () Bool)

(assert (=> start!34972 (= tp!26603 b_and!14879)))

(declare-fun b!350106 () Bool)

(declare-fun e!214456 () Bool)

(declare-fun tp_is_empty!7627 () Bool)

(assert (=> b!350106 (= e!214456 tp_is_empty!7627)))

(declare-fun mapNonEmpty!12912 () Bool)

(declare-fun mapRes!12912 () Bool)

(declare-fun tp!26604 () Bool)

(assert (=> mapNonEmpty!12912 (= mapRes!12912 (and tp!26604 e!214456))))

(declare-datatypes ((V!11147 0))(
  ( (V!11148 (val!3858 Int)) )
))
(declare-datatypes ((ValueCell!3470 0))(
  ( (ValueCellFull!3470 (v!6039 V!11147)) (EmptyCell!3470) )
))
(declare-fun mapRest!12912 () (Array (_ BitVec 32) ValueCell!3470))

(declare-fun mapKey!12912 () (_ BitVec 32))

(declare-fun mapValue!12912 () ValueCell!3470)

(declare-datatypes ((array!18821 0))(
  ( (array!18822 (arr!8916 (Array (_ BitVec 32) ValueCell!3470)) (size!9269 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18821)

(assert (=> mapNonEmpty!12912 (= (arr!8916 _values!1525) (store mapRest!12912 mapKey!12912 mapValue!12912))))

(declare-fun mapIsEmpty!12912 () Bool)

(assert (=> mapIsEmpty!12912 mapRes!12912))

(declare-fun b!350107 () Bool)

(declare-fun res!194027 () Bool)

(declare-fun e!214453 () Bool)

(assert (=> b!350107 (=> (not res!194027) (not e!214453))))

(declare-datatypes ((array!18823 0))(
  ( (array!18824 (arr!8917 (Array (_ BitVec 32) (_ BitVec 64))) (size!9270 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18823)

(declare-datatypes ((List!5152 0))(
  ( (Nil!5149) (Cons!5148 (h!6004 (_ BitVec 64)) (t!10281 List!5152)) )
))
(declare-fun arrayNoDuplicates!0 (array!18823 (_ BitVec 32) List!5152) Bool)

(assert (=> b!350107 (= res!194027 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5149))))

(declare-fun res!194026 () Bool)

(assert (=> start!34972 (=> (not res!194026) (not e!214453))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34972 (= res!194026 (validMask!0 mask!2385))))

(assert (=> start!34972 e!214453))

(assert (=> start!34972 true))

(assert (=> start!34972 tp_is_empty!7627))

(assert (=> start!34972 tp!26603))

(declare-fun e!214452 () Bool)

(declare-fun array_inv!6612 (array!18821) Bool)

(assert (=> start!34972 (and (array_inv!6612 _values!1525) e!214452)))

(declare-fun array_inv!6613 (array!18823) Bool)

(assert (=> start!34972 (array_inv!6613 _keys!1895)))

(declare-fun b!350108 () Bool)

(declare-fun e!214457 () Bool)

(assert (=> b!350108 (= e!214453 e!214457)))

(declare-fun res!194031 () Bool)

(assert (=> b!350108 (=> (not res!194031) (not e!214457))))

(declare-datatypes ((SeekEntryResult!3437 0))(
  ( (MissingZero!3437 (index!15927 (_ BitVec 32))) (Found!3437 (index!15928 (_ BitVec 32))) (Intermediate!3437 (undefined!4249 Bool) (index!15929 (_ BitVec 32)) (x!34872 (_ BitVec 32))) (Undefined!3437) (MissingVacant!3437 (index!15930 (_ BitVec 32))) )
))
(declare-fun lt!164336 () SeekEntryResult!3437)

(get-info :version)

(assert (=> b!350108 (= res!194031 (and (not ((_ is Found!3437) lt!164336)) (not ((_ is MissingZero!3437) lt!164336)) ((_ is MissingVacant!3437) lt!164336)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18823 (_ BitVec 32)) SeekEntryResult!3437)

(assert (=> b!350108 (= lt!164336 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350109 () Bool)

(declare-fun res!194029 () Bool)

(assert (=> b!350109 (=> (not res!194029) (not e!214453))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350109 (= res!194029 (and (= (size!9269 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9270 _keys!1895) (size!9269 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350110 () Bool)

(declare-fun e!214455 () Bool)

(assert (=> b!350110 (= e!214452 (and e!214455 mapRes!12912))))

(declare-fun condMapEmpty!12912 () Bool)

(declare-fun mapDefault!12912 () ValueCell!3470)

(assert (=> b!350110 (= condMapEmpty!12912 (= (arr!8916 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3470)) mapDefault!12912)))))

(declare-fun b!350111 () Bool)

(declare-fun res!194030 () Bool)

(assert (=> b!350111 (=> (not res!194030) (not e!214453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350111 (= res!194030 (validKeyInArray!0 k0!1348))))

(declare-fun b!350112 () Bool)

(declare-fun res!194024 () Bool)

(assert (=> b!350112 (=> (not res!194024) (not e!214453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18823 (_ BitVec 32)) Bool)

(assert (=> b!350112 (= res!194024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350113 () Bool)

(declare-fun res!194025 () Bool)

(assert (=> b!350113 (=> (not res!194025) (not e!214457))))

(declare-fun arrayContainsKey!0 (array!18823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350113 (= res!194025 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350114 () Bool)

(assert (=> b!350114 (= e!214455 tp_is_empty!7627)))

(declare-fun b!350115 () Bool)

(declare-fun res!194028 () Bool)

(assert (=> b!350115 (=> (not res!194028) (not e!214453))))

(declare-fun zeroValue!1467 () V!11147)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11147)

(declare-datatypes ((tuple2!5538 0))(
  ( (tuple2!5539 (_1!2780 (_ BitVec 64)) (_2!2780 V!11147)) )
))
(declare-datatypes ((List!5153 0))(
  ( (Nil!5150) (Cons!5149 (h!6005 tuple2!5538) (t!10282 List!5153)) )
))
(declare-datatypes ((ListLongMap!4441 0))(
  ( (ListLongMap!4442 (toList!2236 List!5153)) )
))
(declare-fun contains!2316 (ListLongMap!4441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1741 (array!18823 array!18821 (_ BitVec 32) (_ BitVec 32) V!11147 V!11147 (_ BitVec 32) Int) ListLongMap!4441)

(assert (=> b!350115 (= res!194028 (not (contains!2316 (getCurrentListMap!1741 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350116 () Bool)

(assert (=> b!350116 (= e!214457 false)))

(declare-fun lt!164337 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18823 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350116 (= lt!164337 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34972 res!194026) b!350109))

(assert (= (and b!350109 res!194029) b!350112))

(assert (= (and b!350112 res!194024) b!350107))

(assert (= (and b!350107 res!194027) b!350111))

(assert (= (and b!350111 res!194030) b!350115))

(assert (= (and b!350115 res!194028) b!350108))

(assert (= (and b!350108 res!194031) b!350113))

(assert (= (and b!350113 res!194025) b!350116))

(assert (= (and b!350110 condMapEmpty!12912) mapIsEmpty!12912))

(assert (= (and b!350110 (not condMapEmpty!12912)) mapNonEmpty!12912))

(assert (= (and mapNonEmpty!12912 ((_ is ValueCellFull!3470) mapValue!12912)) b!350106))

(assert (= (and b!350110 ((_ is ValueCellFull!3470) mapDefault!12912)) b!350114))

(assert (= start!34972 b!350110))

(declare-fun m!349863 () Bool)

(assert (=> b!350116 m!349863))

(declare-fun m!349865 () Bool)

(assert (=> b!350108 m!349865))

(declare-fun m!349867 () Bool)

(assert (=> b!350107 m!349867))

(declare-fun m!349869 () Bool)

(assert (=> b!350112 m!349869))

(declare-fun m!349871 () Bool)

(assert (=> mapNonEmpty!12912 m!349871))

(declare-fun m!349873 () Bool)

(assert (=> b!350111 m!349873))

(declare-fun m!349875 () Bool)

(assert (=> b!350115 m!349875))

(assert (=> b!350115 m!349875))

(declare-fun m!349877 () Bool)

(assert (=> b!350115 m!349877))

(declare-fun m!349879 () Bool)

(assert (=> start!34972 m!349879))

(declare-fun m!349881 () Bool)

(assert (=> start!34972 m!349881))

(declare-fun m!349883 () Bool)

(assert (=> start!34972 m!349883))

(declare-fun m!349885 () Bool)

(assert (=> b!350113 m!349885))

(check-sat (not b_next!7675) (not b!350108) (not b!350116) (not b!350115) (not b!350107) (not b!350113) b_and!14879 (not start!34972) (not mapNonEmpty!12912) (not b!350111) (not b!350112) tp_is_empty!7627)
(check-sat b_and!14879 (not b_next!7675))
