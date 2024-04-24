; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33724 () Bool)

(assert start!33724)

(declare-fun b_free!6973 () Bool)

(declare-fun b_next!6973 () Bool)

(assert (=> start!33724 (= b_free!6973 (not b_next!6973))))

(declare-fun tp!24422 () Bool)

(declare-fun b_and!14167 () Bool)

(assert (=> start!33724 (= tp!24422 b_and!14167)))

(declare-fun b!335506 () Bool)

(declare-fun res!185185 () Bool)

(declare-fun e!205952 () Bool)

(assert (=> b!335506 (=> (not res!185185) (not e!205952))))

(declare-datatypes ((array!17432 0))(
  ( (array!17433 (arr!8246 (Array (_ BitVec 32) (_ BitVec 64))) (size!8598 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17432)

(declare-datatypes ((List!4632 0))(
  ( (Nil!4629) (Cons!4628 (h!5484 (_ BitVec 64)) (t!9712 List!4632)) )
))
(declare-fun arrayNoDuplicates!0 (array!17432 (_ BitVec 32) List!4632) Bool)

(assert (=> b!335506 (= res!185185 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4629))))

(declare-fun res!185189 () Bool)

(assert (=> start!33724 (=> (not res!185189) (not e!205952))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33724 (= res!185189 (validMask!0 mask!2385))))

(assert (=> start!33724 e!205952))

(assert (=> start!33724 true))

(declare-fun tp_is_empty!6925 () Bool)

(assert (=> start!33724 tp_is_empty!6925))

(assert (=> start!33724 tp!24422))

(declare-datatypes ((V!10211 0))(
  ( (V!10212 (val!3507 Int)) )
))
(declare-datatypes ((ValueCell!3119 0))(
  ( (ValueCellFull!3119 (v!5670 V!10211)) (EmptyCell!3119) )
))
(declare-datatypes ((array!17434 0))(
  ( (array!17435 (arr!8247 (Array (_ BitVec 32) ValueCell!3119)) (size!8599 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17434)

(declare-fun e!205950 () Bool)

(declare-fun array_inv!6134 (array!17434) Bool)

(assert (=> start!33724 (and (array_inv!6134 _values!1525) e!205950)))

(declare-fun array_inv!6135 (array!17432) Bool)

(assert (=> start!33724 (array_inv!6135 _keys!1895)))

(declare-fun b!335507 () Bool)

(declare-fun e!205946 () Bool)

(assert (=> b!335507 (= e!205946 tp_is_empty!6925)))

(declare-fun b!335508 () Bool)

(declare-fun e!205948 () Bool)

(assert (=> b!335508 (= e!205948 tp_is_empty!6925)))

(declare-fun mapNonEmpty!11784 () Bool)

(declare-fun mapRes!11784 () Bool)

(declare-fun tp!24423 () Bool)

(assert (=> mapNonEmpty!11784 (= mapRes!11784 (and tp!24423 e!205948))))

(declare-fun mapRest!11784 () (Array (_ BitVec 32) ValueCell!3119))

(declare-fun mapValue!11784 () ValueCell!3119)

(declare-fun mapKey!11784 () (_ BitVec 32))

(assert (=> mapNonEmpty!11784 (= (arr!8247 _values!1525) (store mapRest!11784 mapKey!11784 mapValue!11784))))

(declare-fun b!335509 () Bool)

(declare-fun e!205949 () Bool)

(assert (=> b!335509 (= e!205949 (not true))))

(declare-datatypes ((tuple2!5014 0))(
  ( (tuple2!5015 (_1!2518 (_ BitVec 64)) (_2!2518 V!10211)) )
))
(declare-datatypes ((List!4633 0))(
  ( (Nil!4630) (Cons!4629 (h!5485 tuple2!5014) (t!9713 List!4633)) )
))
(declare-datatypes ((ListLongMap!3929 0))(
  ( (ListLongMap!3930 (toList!1980 List!4633)) )
))
(declare-fun lt!159892 () ListLongMap!3929)

(declare-datatypes ((SeekEntryResult!3153 0))(
  ( (MissingZero!3153 (index!14791 (_ BitVec 32))) (Found!3153 (index!14792 (_ BitVec 32))) (Intermediate!3153 (undefined!3965 Bool) (index!14793 (_ BitVec 32)) (x!33404 (_ BitVec 32))) (Undefined!3153) (MissingVacant!3153 (index!14794 (_ BitVec 32))) )
))
(declare-fun lt!159893 () SeekEntryResult!3153)

(declare-fun contains!2043 (ListLongMap!3929 (_ BitVec 64)) Bool)

(assert (=> b!335509 (contains!2043 lt!159892 (select (arr!8246 _keys!1895) (index!14792 lt!159893)))))

(declare-fun zeroValue!1467 () V!10211)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10211)

(declare-datatypes ((Unit!10421 0))(
  ( (Unit!10422) )
))
(declare-fun lt!159894 () Unit!10421)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaValidKeyInArrayIsInListMap!168 (array!17432 array!17434 (_ BitVec 32) (_ BitVec 32) V!10211 V!10211 (_ BitVec 32) Int) Unit!10421)

(assert (=> b!335509 (= lt!159894 (lemmaValidKeyInArrayIsInListMap!168 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14792 lt!159893) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335509 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159895 () Unit!10421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17432 (_ BitVec 64) (_ BitVec 32)) Unit!10421)

(assert (=> b!335509 (= lt!159895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14792 lt!159893)))))

(declare-fun b!335510 () Bool)

(declare-fun res!185191 () Bool)

(assert (=> b!335510 (=> (not res!185191) (not e!205952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335510 (= res!185191 (validKeyInArray!0 k0!1348))))

(declare-fun b!335511 () Bool)

(declare-fun e!205947 () Bool)

(assert (=> b!335511 (= e!205947 e!205949)))

(declare-fun res!185188 () Bool)

(assert (=> b!335511 (=> (not res!185188) (not e!205949))))

(get-info :version)

(assert (=> b!335511 (= res!185188 (and ((_ is Found!3153) lt!159893) (= (select (arr!8246 _keys!1895) (index!14792 lt!159893)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17432 (_ BitVec 32)) SeekEntryResult!3153)

(assert (=> b!335511 (= lt!159893 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335512 () Bool)

(declare-fun res!185186 () Bool)

(assert (=> b!335512 (=> (not res!185186) (not e!205952))))

(assert (=> b!335512 (= res!185186 (and (= (size!8599 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8598 _keys!1895) (size!8599 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335513 () Bool)

(declare-fun res!185192 () Bool)

(assert (=> b!335513 (=> (not res!185192) (not e!205949))))

(assert (=> b!335513 (= res!185192 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14792 lt!159893)))))

(declare-fun b!335514 () Bool)

(assert (=> b!335514 (= e!205952 e!205947)))

(declare-fun res!185187 () Bool)

(assert (=> b!335514 (=> (not res!185187) (not e!205947))))

(assert (=> b!335514 (= res!185187 (not (contains!2043 lt!159892 k0!1348)))))

(declare-fun getCurrentListMap!1509 (array!17432 array!17434 (_ BitVec 32) (_ BitVec 32) V!10211 V!10211 (_ BitVec 32) Int) ListLongMap!3929)

(assert (=> b!335514 (= lt!159892 (getCurrentListMap!1509 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335515 () Bool)

(declare-fun res!185190 () Bool)

(assert (=> b!335515 (=> (not res!185190) (not e!205952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17432 (_ BitVec 32)) Bool)

(assert (=> b!335515 (= res!185190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11784 () Bool)

(assert (=> mapIsEmpty!11784 mapRes!11784))

(declare-fun b!335516 () Bool)

(assert (=> b!335516 (= e!205950 (and e!205946 mapRes!11784))))

(declare-fun condMapEmpty!11784 () Bool)

(declare-fun mapDefault!11784 () ValueCell!3119)

(assert (=> b!335516 (= condMapEmpty!11784 (= (arr!8247 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3119)) mapDefault!11784)))))

(assert (= (and start!33724 res!185189) b!335512))

(assert (= (and b!335512 res!185186) b!335515))

(assert (= (and b!335515 res!185190) b!335506))

(assert (= (and b!335506 res!185185) b!335510))

(assert (= (and b!335510 res!185191) b!335514))

(assert (= (and b!335514 res!185187) b!335511))

(assert (= (and b!335511 res!185188) b!335513))

(assert (= (and b!335513 res!185192) b!335509))

(assert (= (and b!335516 condMapEmpty!11784) mapIsEmpty!11784))

(assert (= (and b!335516 (not condMapEmpty!11784)) mapNonEmpty!11784))

(assert (= (and mapNonEmpty!11784 ((_ is ValueCellFull!3119) mapValue!11784)) b!335508))

(assert (= (and b!335516 ((_ is ValueCellFull!3119) mapDefault!11784)) b!335507))

(assert (= start!33724 b!335516))

(declare-fun m!339773 () Bool)

(assert (=> b!335506 m!339773))

(declare-fun m!339775 () Bool)

(assert (=> mapNonEmpty!11784 m!339775))

(declare-fun m!339777 () Bool)

(assert (=> start!33724 m!339777))

(declare-fun m!339779 () Bool)

(assert (=> start!33724 m!339779))

(declare-fun m!339781 () Bool)

(assert (=> start!33724 m!339781))

(declare-fun m!339783 () Bool)

(assert (=> b!335513 m!339783))

(declare-fun m!339785 () Bool)

(assert (=> b!335514 m!339785))

(declare-fun m!339787 () Bool)

(assert (=> b!335514 m!339787))

(declare-fun m!339789 () Bool)

(assert (=> b!335511 m!339789))

(declare-fun m!339791 () Bool)

(assert (=> b!335511 m!339791))

(declare-fun m!339793 () Bool)

(assert (=> b!335510 m!339793))

(declare-fun m!339795 () Bool)

(assert (=> b!335515 m!339795))

(declare-fun m!339797 () Bool)

(assert (=> b!335509 m!339797))

(assert (=> b!335509 m!339789))

(assert (=> b!335509 m!339789))

(declare-fun m!339799 () Bool)

(assert (=> b!335509 m!339799))

(declare-fun m!339801 () Bool)

(assert (=> b!335509 m!339801))

(declare-fun m!339803 () Bool)

(assert (=> b!335509 m!339803))

(check-sat (not b_next!6973) tp_is_empty!6925 (not mapNonEmpty!11784) (not b!335510) b_and!14167 (not b!335514) (not b!335506) (not b!335513) (not b!335515) (not start!33724) (not b!335509) (not b!335511))
(check-sat b_and!14167 (not b_next!6973))
