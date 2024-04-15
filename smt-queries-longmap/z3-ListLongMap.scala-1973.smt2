; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34686 () Bool)

(assert start!34686)

(declare-fun b_free!7507 () Bool)

(declare-fun b_next!7507 () Bool)

(assert (=> start!34686 (= b_free!7507 (not b_next!7507))))

(declare-fun tp!26084 () Bool)

(declare-fun b_and!14701 () Bool)

(assert (=> start!34686 (= tp!26084 b_and!14701)))

(declare-fun mapIsEmpty!12645 () Bool)

(declare-fun mapRes!12645 () Bool)

(assert (=> mapIsEmpty!12645 mapRes!12645))

(declare-fun b!346506 () Bool)

(declare-fun res!191722 () Bool)

(declare-fun e!212348 () Bool)

(assert (=> b!346506 (=> (not res!191722) (not e!212348))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346506 (= res!191722 (validKeyInArray!0 k0!1348))))

(declare-fun res!191729 () Bool)

(assert (=> start!34686 (=> (not res!191729) (not e!212348))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34686 (= res!191729 (validMask!0 mask!2385))))

(assert (=> start!34686 e!212348))

(assert (=> start!34686 true))

(declare-fun tp_is_empty!7459 () Bool)

(assert (=> start!34686 tp_is_empty!7459))

(assert (=> start!34686 tp!26084))

(declare-datatypes ((V!10923 0))(
  ( (V!10924 (val!3774 Int)) )
))
(declare-datatypes ((ValueCell!3386 0))(
  ( (ValueCellFull!3386 (v!5950 V!10923)) (EmptyCell!3386) )
))
(declare-datatypes ((array!18495 0))(
  ( (array!18496 (arr!8758 (Array (_ BitVec 32) ValueCell!3386)) (size!9111 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18495)

(declare-fun e!212346 () Bool)

(declare-fun array_inv!6504 (array!18495) Bool)

(assert (=> start!34686 (and (array_inv!6504 _values!1525) e!212346)))

(declare-datatypes ((array!18497 0))(
  ( (array!18498 (arr!8759 (Array (_ BitVec 32) (_ BitVec 64))) (size!9112 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18497)

(declare-fun array_inv!6505 (array!18497) Bool)

(assert (=> start!34686 (array_inv!6505 _keys!1895)))

(declare-fun b!346507 () Bool)

(declare-fun e!212347 () Bool)

(assert (=> b!346507 (= e!212347 tp_is_empty!7459)))

(declare-fun b!346508 () Bool)

(declare-fun e!212350 () Bool)

(assert (=> b!346508 (= e!212350 tp_is_empty!7459)))

(declare-fun b!346509 () Bool)

(assert (=> b!346509 (= e!212346 (and e!212347 mapRes!12645))))

(declare-fun condMapEmpty!12645 () Bool)

(declare-fun mapDefault!12645 () ValueCell!3386)

(assert (=> b!346509 (= condMapEmpty!12645 (= (arr!8758 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3386)) mapDefault!12645)))))

(declare-fun mapNonEmpty!12645 () Bool)

(declare-fun tp!26085 () Bool)

(assert (=> mapNonEmpty!12645 (= mapRes!12645 (and tp!26085 e!212350))))

(declare-fun mapKey!12645 () (_ BitVec 32))

(declare-fun mapRest!12645 () (Array (_ BitVec 32) ValueCell!3386))

(declare-fun mapValue!12645 () ValueCell!3386)

(assert (=> mapNonEmpty!12645 (= (arr!8758 _values!1525) (store mapRest!12645 mapKey!12645 mapValue!12645))))

(declare-fun b!346510 () Bool)

(declare-fun res!191723 () Bool)

(assert (=> b!346510 (=> (not res!191723) (not e!212348))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346510 (= res!191723 (and (= (size!9111 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9112 _keys!1895) (size!9111 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346511 () Bool)

(declare-fun e!212345 () Bool)

(assert (=> b!346511 (= e!212345 (not true))))

(declare-fun arrayContainsKey!0 (array!18497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346511 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3373 0))(
  ( (MissingZero!3373 (index!15671 (_ BitVec 32))) (Found!3373 (index!15672 (_ BitVec 32))) (Intermediate!3373 (undefined!4185 Bool) (index!15673 (_ BitVec 32)) (x!34534 (_ BitVec 32))) (Undefined!3373) (MissingVacant!3373 (index!15674 (_ BitVec 32))) )
))
(declare-fun lt!163197 () SeekEntryResult!3373)

(declare-datatypes ((Unit!10734 0))(
  ( (Unit!10735) )
))
(declare-fun lt!163196 () Unit!10734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18497 (_ BitVec 64) (_ BitVec 32)) Unit!10734)

(assert (=> b!346511 (= lt!163196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15672 lt!163197)))))

(declare-fun b!346512 () Bool)

(declare-fun res!191727 () Bool)

(assert (=> b!346512 (=> (not res!191727) (not e!212348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18497 (_ BitVec 32)) Bool)

(assert (=> b!346512 (= res!191727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346513 () Bool)

(declare-fun res!191725 () Bool)

(assert (=> b!346513 (=> (not res!191725) (not e!212345))))

(assert (=> b!346513 (= res!191725 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15672 lt!163197)))))

(declare-fun b!346514 () Bool)

(assert (=> b!346514 (= e!212348 e!212345)))

(declare-fun res!191724 () Bool)

(assert (=> b!346514 (=> (not res!191724) (not e!212345))))

(get-info :version)

(assert (=> b!346514 (= res!191724 (and ((_ is Found!3373) lt!163197) (= (select (arr!8759 _keys!1895) (index!15672 lt!163197)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18497 (_ BitVec 32)) SeekEntryResult!3373)

(assert (=> b!346514 (= lt!163197 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346515 () Bool)

(declare-fun res!191728 () Bool)

(assert (=> b!346515 (=> (not res!191728) (not e!212348))))

(declare-datatypes ((List!5035 0))(
  ( (Nil!5032) (Cons!5031 (h!5887 (_ BitVec 64)) (t!10154 List!5035)) )
))
(declare-fun arrayNoDuplicates!0 (array!18497 (_ BitVec 32) List!5035) Bool)

(assert (=> b!346515 (= res!191728 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5032))))

(declare-fun b!346516 () Bool)

(declare-fun res!191726 () Bool)

(assert (=> b!346516 (=> (not res!191726) (not e!212348))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10923)

(declare-fun zeroValue!1467 () V!10923)

(declare-datatypes ((tuple2!5418 0))(
  ( (tuple2!5419 (_1!2720 (_ BitVec 64)) (_2!2720 V!10923)) )
))
(declare-datatypes ((List!5036 0))(
  ( (Nil!5033) (Cons!5032 (h!5888 tuple2!5418) (t!10155 List!5036)) )
))
(declare-datatypes ((ListLongMap!4321 0))(
  ( (ListLongMap!4322 (toList!2176 List!5036)) )
))
(declare-fun contains!2251 (ListLongMap!4321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1682 (array!18497 array!18495 (_ BitVec 32) (_ BitVec 32) V!10923 V!10923 (_ BitVec 32) Int) ListLongMap!4321)

(assert (=> b!346516 (= res!191726 (not (contains!2251 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34686 res!191729) b!346510))

(assert (= (and b!346510 res!191723) b!346512))

(assert (= (and b!346512 res!191727) b!346515))

(assert (= (and b!346515 res!191728) b!346506))

(assert (= (and b!346506 res!191722) b!346516))

(assert (= (and b!346516 res!191726) b!346514))

(assert (= (and b!346514 res!191724) b!346513))

(assert (= (and b!346513 res!191725) b!346511))

(assert (= (and b!346509 condMapEmpty!12645) mapIsEmpty!12645))

(assert (= (and b!346509 (not condMapEmpty!12645)) mapNonEmpty!12645))

(assert (= (and mapNonEmpty!12645 ((_ is ValueCellFull!3386) mapValue!12645)) b!346508))

(assert (= (and b!346509 ((_ is ValueCellFull!3386) mapDefault!12645)) b!346507))

(assert (= start!34686 b!346509))

(declare-fun m!347081 () Bool)

(assert (=> b!346516 m!347081))

(assert (=> b!346516 m!347081))

(declare-fun m!347083 () Bool)

(assert (=> b!346516 m!347083))

(declare-fun m!347085 () Bool)

(assert (=> b!346513 m!347085))

(declare-fun m!347087 () Bool)

(assert (=> b!346512 m!347087))

(declare-fun m!347089 () Bool)

(assert (=> mapNonEmpty!12645 m!347089))

(declare-fun m!347091 () Bool)

(assert (=> b!346514 m!347091))

(declare-fun m!347093 () Bool)

(assert (=> b!346514 m!347093))

(declare-fun m!347095 () Bool)

(assert (=> start!34686 m!347095))

(declare-fun m!347097 () Bool)

(assert (=> start!34686 m!347097))

(declare-fun m!347099 () Bool)

(assert (=> start!34686 m!347099))

(declare-fun m!347101 () Bool)

(assert (=> b!346506 m!347101))

(declare-fun m!347103 () Bool)

(assert (=> b!346511 m!347103))

(declare-fun m!347105 () Bool)

(assert (=> b!346511 m!347105))

(declare-fun m!347107 () Bool)

(assert (=> b!346515 m!347107))

(check-sat (not b!346506) (not b_next!7507) (not b!346514) (not b!346511) (not b!346515) b_and!14701 (not b!346512) (not mapNonEmpty!12645) tp_is_empty!7459 (not b!346516) (not b!346513) (not start!34686))
(check-sat b_and!14701 (not b_next!7507))
