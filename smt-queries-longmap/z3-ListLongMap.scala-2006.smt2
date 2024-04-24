; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35002 () Bool)

(assert start!35002)

(declare-fun b_free!7705 () Bool)

(declare-fun b_next!7705 () Bool)

(assert (=> start!35002 (= b_free!7705 (not b_next!7705))))

(declare-fun tp!26694 () Bool)

(declare-fun b_and!14949 () Bool)

(assert (=> start!35002 (= tp!26694 b_and!14949)))

(declare-fun b!350823 () Bool)

(declare-fun res!194510 () Bool)

(declare-fun e!214865 () Bool)

(assert (=> b!350823 (=> (not res!194510) (not e!214865))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11187 0))(
  ( (V!11188 (val!3873 Int)) )
))
(declare-fun zeroValue!1467 () V!11187)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3485 0))(
  ( (ValueCellFull!3485 (v!6061 V!11187)) (EmptyCell!3485) )
))
(declare-datatypes ((array!18890 0))(
  ( (array!18891 (arr!8950 (Array (_ BitVec 32) ValueCell!3485)) (size!9302 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18890)

(declare-datatypes ((array!18892 0))(
  ( (array!18893 (arr!8951 (Array (_ BitVec 32) (_ BitVec 64))) (size!9303 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18892)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11187)

(declare-datatypes ((tuple2!5508 0))(
  ( (tuple2!5509 (_1!2765 (_ BitVec 64)) (_2!2765 V!11187)) )
))
(declare-datatypes ((List!5114 0))(
  ( (Nil!5111) (Cons!5110 (h!5966 tuple2!5508) (t!10244 List!5114)) )
))
(declare-datatypes ((ListLongMap!4423 0))(
  ( (ListLongMap!4424 (toList!2227 List!5114)) )
))
(declare-fun contains!2315 (ListLongMap!4423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1755 (array!18892 array!18890 (_ BitVec 32) (_ BitVec 32) V!11187 V!11187 (_ BitVec 32) Int) ListLongMap!4423)

(assert (=> b!350823 (= res!194510 (not (contains!2315 (getCurrentListMap!1755 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350824 () Bool)

(declare-fun e!214867 () Bool)

(assert (=> b!350824 (= e!214867 false)))

(declare-fun lt!164679 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18892 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350824 (= lt!164679 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350825 () Bool)

(declare-fun e!214869 () Bool)

(declare-fun tp_is_empty!7657 () Bool)

(assert (=> b!350825 (= e!214869 tp_is_empty!7657)))

(declare-fun b!350826 () Bool)

(declare-fun res!194511 () Bool)

(assert (=> b!350826 (=> (not res!194511) (not e!214867))))

(declare-fun arrayContainsKey!0 (array!18892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350826 (= res!194511 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350827 () Bool)

(declare-fun res!194512 () Bool)

(assert (=> b!350827 (=> (not res!194512) (not e!214865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350827 (= res!194512 (validKeyInArray!0 k0!1348))))

(declare-fun b!350828 () Bool)

(declare-fun res!194515 () Bool)

(assert (=> b!350828 (=> (not res!194515) (not e!214865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18892 (_ BitVec 32)) Bool)

(assert (=> b!350828 (= res!194515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350829 () Bool)

(declare-fun res!194517 () Bool)

(assert (=> b!350829 (=> (not res!194517) (not e!214865))))

(declare-datatypes ((List!5115 0))(
  ( (Nil!5112) (Cons!5111 (h!5967 (_ BitVec 64)) (t!10245 List!5115)) )
))
(declare-fun arrayNoDuplicates!0 (array!18892 (_ BitVec 32) List!5115) Bool)

(assert (=> b!350829 (= res!194517 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5112))))

(declare-fun b!350830 () Bool)

(declare-fun e!214868 () Bool)

(assert (=> b!350830 (= e!214868 tp_is_empty!7657)))

(declare-fun b!350832 () Bool)

(assert (=> b!350832 (= e!214865 e!214867)))

(declare-fun res!194516 () Bool)

(assert (=> b!350832 (=> (not res!194516) (not e!214867))))

(declare-datatypes ((SeekEntryResult!3403 0))(
  ( (MissingZero!3403 (index!15791 (_ BitVec 32))) (Found!3403 (index!15792 (_ BitVec 32))) (Intermediate!3403 (undefined!4215 Bool) (index!15793 (_ BitVec 32)) (x!34880 (_ BitVec 32))) (Undefined!3403) (MissingVacant!3403 (index!15794 (_ BitVec 32))) )
))
(declare-fun lt!164680 () SeekEntryResult!3403)

(get-info :version)

(assert (=> b!350832 (= res!194516 (and (not ((_ is Found!3403) lt!164680)) (not ((_ is MissingZero!3403) lt!164680)) ((_ is MissingVacant!3403) lt!164680)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18892 (_ BitVec 32)) SeekEntryResult!3403)

(assert (=> b!350832 (= lt!164680 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12957 () Bool)

(declare-fun mapRes!12957 () Bool)

(assert (=> mapIsEmpty!12957 mapRes!12957))

(declare-fun b!350833 () Bool)

(declare-fun e!214864 () Bool)

(assert (=> b!350833 (= e!214864 (and e!214868 mapRes!12957))))

(declare-fun condMapEmpty!12957 () Bool)

(declare-fun mapDefault!12957 () ValueCell!3485)

(assert (=> b!350833 (= condMapEmpty!12957 (= (arr!8950 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3485)) mapDefault!12957)))))

(declare-fun mapNonEmpty!12957 () Bool)

(declare-fun tp!26693 () Bool)

(assert (=> mapNonEmpty!12957 (= mapRes!12957 (and tp!26693 e!214869))))

(declare-fun mapRest!12957 () (Array (_ BitVec 32) ValueCell!3485))

(declare-fun mapValue!12957 () ValueCell!3485)

(declare-fun mapKey!12957 () (_ BitVec 32))

(assert (=> mapNonEmpty!12957 (= (arr!8950 _values!1525) (store mapRest!12957 mapKey!12957 mapValue!12957))))

(declare-fun b!350831 () Bool)

(declare-fun res!194513 () Bool)

(assert (=> b!350831 (=> (not res!194513) (not e!214865))))

(assert (=> b!350831 (= res!194513 (and (= (size!9302 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9303 _keys!1895) (size!9302 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!194514 () Bool)

(assert (=> start!35002 (=> (not res!194514) (not e!214865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35002 (= res!194514 (validMask!0 mask!2385))))

(assert (=> start!35002 e!214865))

(assert (=> start!35002 true))

(assert (=> start!35002 tp_is_empty!7657))

(assert (=> start!35002 tp!26694))

(declare-fun array_inv!6610 (array!18890) Bool)

(assert (=> start!35002 (and (array_inv!6610 _values!1525) e!214864)))

(declare-fun array_inv!6611 (array!18892) Bool)

(assert (=> start!35002 (array_inv!6611 _keys!1895)))

(assert (= (and start!35002 res!194514) b!350831))

(assert (= (and b!350831 res!194513) b!350828))

(assert (= (and b!350828 res!194515) b!350829))

(assert (= (and b!350829 res!194517) b!350827))

(assert (= (and b!350827 res!194512) b!350823))

(assert (= (and b!350823 res!194510) b!350832))

(assert (= (and b!350832 res!194516) b!350826))

(assert (= (and b!350826 res!194511) b!350824))

(assert (= (and b!350833 condMapEmpty!12957) mapIsEmpty!12957))

(assert (= (and b!350833 (not condMapEmpty!12957)) mapNonEmpty!12957))

(assert (= (and mapNonEmpty!12957 ((_ is ValueCellFull!3485) mapValue!12957)) b!350825))

(assert (= (and b!350833 ((_ is ValueCellFull!3485) mapDefault!12957)) b!350830))

(assert (= start!35002 b!350833))

(declare-fun m!351177 () Bool)

(assert (=> b!350827 m!351177))

(declare-fun m!351179 () Bool)

(assert (=> b!350828 m!351179))

(declare-fun m!351181 () Bool)

(assert (=> b!350826 m!351181))

(declare-fun m!351183 () Bool)

(assert (=> b!350824 m!351183))

(declare-fun m!351185 () Bool)

(assert (=> b!350823 m!351185))

(assert (=> b!350823 m!351185))

(declare-fun m!351187 () Bool)

(assert (=> b!350823 m!351187))

(declare-fun m!351189 () Bool)

(assert (=> start!35002 m!351189))

(declare-fun m!351191 () Bool)

(assert (=> start!35002 m!351191))

(declare-fun m!351193 () Bool)

(assert (=> start!35002 m!351193))

(declare-fun m!351195 () Bool)

(assert (=> b!350829 m!351195))

(declare-fun m!351197 () Bool)

(assert (=> b!350832 m!351197))

(declare-fun m!351199 () Bool)

(assert (=> mapNonEmpty!12957 m!351199))

(check-sat (not b!350824) (not start!35002) (not b!350828) (not b!350827) (not b!350832) (not b!350826) (not b!350829) (not mapNonEmpty!12957) tp_is_empty!7657 (not b!350823) (not b_next!7705) b_and!14949)
(check-sat b_and!14949 (not b_next!7705))
