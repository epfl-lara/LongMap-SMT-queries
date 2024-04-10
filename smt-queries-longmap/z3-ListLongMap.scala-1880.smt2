; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33716 () Bool)

(assert start!33716)

(declare-fun b_free!6951 () Bool)

(declare-fun b_next!6951 () Bool)

(assert (=> start!33716 (= b_free!6951 (not b_next!6951))))

(declare-fun tp!24356 () Bool)

(declare-fun b_and!14131 () Bool)

(assert (=> start!33716 (= tp!24356 b_and!14131)))

(declare-fun b!335196 () Bool)

(declare-fun res!184926 () Bool)

(declare-fun e!205750 () Bool)

(assert (=> b!335196 (=> (not res!184926) (not e!205750))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10181 0))(
  ( (V!10182 (val!3496 Int)) )
))
(declare-datatypes ((ValueCell!3108 0))(
  ( (ValueCellFull!3108 (v!5658 V!10181)) (EmptyCell!3108) )
))
(declare-datatypes ((array!17399 0))(
  ( (array!17400 (arr!8230 (Array (_ BitVec 32) ValueCell!3108)) (size!8582 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17399)

(declare-datatypes ((array!17401 0))(
  ( (array!17402 (arr!8231 (Array (_ BitVec 32) (_ BitVec 64))) (size!8583 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17401)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335196 (= res!184926 (and (= (size!8582 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8583 _keys!1895) (size!8582 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335197 () Bool)

(declare-fun e!205755 () Bool)

(declare-fun tp_is_empty!6903 () Bool)

(assert (=> b!335197 (= e!205755 tp_is_empty!6903)))

(declare-fun b!335198 () Bool)

(declare-fun res!184928 () Bool)

(assert (=> b!335198 (=> (not res!184928) (not e!205750))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335198 (= res!184928 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11751 () Bool)

(declare-fun mapRes!11751 () Bool)

(declare-fun tp!24357 () Bool)

(declare-fun e!205754 () Bool)

(assert (=> mapNonEmpty!11751 (= mapRes!11751 (and tp!24357 e!205754))))

(declare-fun mapValue!11751 () ValueCell!3108)

(declare-fun mapKey!11751 () (_ BitVec 32))

(declare-fun mapRest!11751 () (Array (_ BitVec 32) ValueCell!3108))

(assert (=> mapNonEmpty!11751 (= (arr!8230 _values!1525) (store mapRest!11751 mapKey!11751 mapValue!11751))))

(declare-fun b!335199 () Bool)

(declare-fun e!205749 () Bool)

(assert (=> b!335199 (= e!205750 e!205749)))

(declare-fun res!184925 () Bool)

(assert (=> b!335199 (=> (not res!184925) (not e!205749))))

(declare-datatypes ((tuple2!5076 0))(
  ( (tuple2!5077 (_1!2549 (_ BitVec 64)) (_2!2549 V!10181)) )
))
(declare-datatypes ((List!4698 0))(
  ( (Nil!4695) (Cons!4694 (h!5550 tuple2!5076) (t!9786 List!4698)) )
))
(declare-datatypes ((ListLongMap!3989 0))(
  ( (ListLongMap!3990 (toList!2010 List!4698)) )
))
(declare-fun lt!159745 () ListLongMap!3989)

(declare-fun contains!2054 (ListLongMap!3989 (_ BitVec 64)) Bool)

(assert (=> b!335199 (= res!184925 (not (contains!2054 lt!159745 k0!1348)))))

(declare-fun zeroValue!1467 () V!10181)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10181)

(declare-fun getCurrentListMap!1535 (array!17401 array!17399 (_ BitVec 32) (_ BitVec 32) V!10181 V!10181 (_ BitVec 32) Int) ListLongMap!3989)

(assert (=> b!335199 (= lt!159745 (getCurrentListMap!1535 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun res!184927 () Bool)

(assert (=> start!33716 (=> (not res!184927) (not e!205750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33716 (= res!184927 (validMask!0 mask!2385))))

(assert (=> start!33716 e!205750))

(assert (=> start!33716 true))

(assert (=> start!33716 tp_is_empty!6903))

(assert (=> start!33716 tp!24356))

(declare-fun e!205753 () Bool)

(declare-fun array_inv!6116 (array!17399) Bool)

(assert (=> start!33716 (and (array_inv!6116 _values!1525) e!205753)))

(declare-fun array_inv!6117 (array!17401) Bool)

(assert (=> start!33716 (array_inv!6117 _keys!1895)))

(declare-fun b!335200 () Bool)

(assert (=> b!335200 (= e!205753 (and e!205755 mapRes!11751))))

(declare-fun condMapEmpty!11751 () Bool)

(declare-fun mapDefault!11751 () ValueCell!3108)

(assert (=> b!335200 (= condMapEmpty!11751 (= (arr!8230 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3108)) mapDefault!11751)))))

(declare-fun b!335201 () Bool)

(declare-fun e!205751 () Bool)

(assert (=> b!335201 (= e!205749 e!205751)))

(declare-fun res!184930 () Bool)

(assert (=> b!335201 (=> (not res!184930) (not e!205751))))

(declare-datatypes ((SeekEntryResult!3181 0))(
  ( (MissingZero!3181 (index!14903 (_ BitVec 32))) (Found!3181 (index!14904 (_ BitVec 32))) (Intermediate!3181 (undefined!3993 Bool) (index!14905 (_ BitVec 32)) (x!33403 (_ BitVec 32))) (Undefined!3181) (MissingVacant!3181 (index!14906 (_ BitVec 32))) )
))
(declare-fun lt!159744 () SeekEntryResult!3181)

(get-info :version)

(assert (=> b!335201 (= res!184930 (and ((_ is Found!3181) lt!159744) (= (select (arr!8231 _keys!1895) (index!14904 lt!159744)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17401 (_ BitVec 32)) SeekEntryResult!3181)

(assert (=> b!335201 (= lt!159744 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335202 () Bool)

(declare-fun res!184924 () Bool)

(assert (=> b!335202 (=> (not res!184924) (not e!205751))))

(declare-fun arrayContainsKey!0 (array!17401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335202 (= res!184924 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14904 lt!159744)))))

(declare-fun b!335203 () Bool)

(assert (=> b!335203 (= e!205751 (not true))))

(assert (=> b!335203 (contains!2054 lt!159745 (select (arr!8231 _keys!1895) (index!14904 lt!159744)))))

(declare-datatypes ((Unit!10431 0))(
  ( (Unit!10432) )
))
(declare-fun lt!159743 () Unit!10431)

(declare-fun lemmaValidKeyInArrayIsInListMap!162 (array!17401 array!17399 (_ BitVec 32) (_ BitVec 32) V!10181 V!10181 (_ BitVec 32) Int) Unit!10431)

(assert (=> b!335203 (= lt!159743 (lemmaValidKeyInArrayIsInListMap!162 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14904 lt!159744) defaultEntry!1528))))

(assert (=> b!335203 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159742 () Unit!10431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17401 (_ BitVec 64) (_ BitVec 32)) Unit!10431)

(assert (=> b!335203 (= lt!159742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14904 lt!159744)))))

(declare-fun b!335204 () Bool)

(declare-fun res!184931 () Bool)

(assert (=> b!335204 (=> (not res!184931) (not e!205750))))

(declare-datatypes ((List!4699 0))(
  ( (Nil!4696) (Cons!4695 (h!5551 (_ BitVec 64)) (t!9787 List!4699)) )
))
(declare-fun arrayNoDuplicates!0 (array!17401 (_ BitVec 32) List!4699) Bool)

(assert (=> b!335204 (= res!184931 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4696))))

(declare-fun mapIsEmpty!11751 () Bool)

(assert (=> mapIsEmpty!11751 mapRes!11751))

(declare-fun b!335205 () Bool)

(assert (=> b!335205 (= e!205754 tp_is_empty!6903)))

(declare-fun b!335206 () Bool)

(declare-fun res!184929 () Bool)

(assert (=> b!335206 (=> (not res!184929) (not e!205750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17401 (_ BitVec 32)) Bool)

(assert (=> b!335206 (= res!184929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33716 res!184927) b!335196))

(assert (= (and b!335196 res!184926) b!335206))

(assert (= (and b!335206 res!184929) b!335204))

(assert (= (and b!335204 res!184931) b!335198))

(assert (= (and b!335198 res!184928) b!335199))

(assert (= (and b!335199 res!184925) b!335201))

(assert (= (and b!335201 res!184930) b!335202))

(assert (= (and b!335202 res!184924) b!335203))

(assert (= (and b!335200 condMapEmpty!11751) mapIsEmpty!11751))

(assert (= (and b!335200 (not condMapEmpty!11751)) mapNonEmpty!11751))

(assert (= (and mapNonEmpty!11751 ((_ is ValueCellFull!3108) mapValue!11751)) b!335205))

(assert (= (and b!335200 ((_ is ValueCellFull!3108) mapDefault!11751)) b!335197))

(assert (= start!33716 b!335200))

(declare-fun m!339197 () Bool)

(assert (=> b!335199 m!339197))

(declare-fun m!339199 () Bool)

(assert (=> b!335199 m!339199))

(declare-fun m!339201 () Bool)

(assert (=> b!335202 m!339201))

(declare-fun m!339203 () Bool)

(assert (=> b!335206 m!339203))

(declare-fun m!339205 () Bool)

(assert (=> b!335204 m!339205))

(declare-fun m!339207 () Bool)

(assert (=> start!33716 m!339207))

(declare-fun m!339209 () Bool)

(assert (=> start!33716 m!339209))

(declare-fun m!339211 () Bool)

(assert (=> start!33716 m!339211))

(declare-fun m!339213 () Bool)

(assert (=> b!335203 m!339213))

(declare-fun m!339215 () Bool)

(assert (=> b!335203 m!339215))

(declare-fun m!339217 () Bool)

(assert (=> b!335203 m!339217))

(declare-fun m!339219 () Bool)

(assert (=> b!335203 m!339219))

(assert (=> b!335203 m!339213))

(declare-fun m!339221 () Bool)

(assert (=> b!335203 m!339221))

(declare-fun m!339223 () Bool)

(assert (=> mapNonEmpty!11751 m!339223))

(declare-fun m!339225 () Bool)

(assert (=> b!335198 m!339225))

(assert (=> b!335201 m!339213))

(declare-fun m!339227 () Bool)

(assert (=> b!335201 m!339227))

(check-sat (not mapNonEmpty!11751) b_and!14131 (not start!33716) (not b!335198) (not b!335206) (not b!335201) (not b!335203) (not b_next!6951) tp_is_empty!6903 (not b!335202) (not b!335204) (not b!335199))
(check-sat b_and!14131 (not b_next!6951))
