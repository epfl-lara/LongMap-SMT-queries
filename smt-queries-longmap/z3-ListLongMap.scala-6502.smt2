; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82834 () Bool)

(assert start!82834)

(declare-fun b_free!18979 () Bool)

(declare-fun b_next!18979 () Bool)

(assert (=> start!82834 (= b_free!18979 (not b_next!18979))))

(declare-fun tp!66066 () Bool)

(declare-fun b_and!30441 () Bool)

(assert (=> start!82834 (= tp!66066 b_and!30441)))

(declare-fun b!966296 () Bool)

(declare-fun res!646859 () Bool)

(declare-fun e!544704 () Bool)

(assert (=> b!966296 (=> (not res!646859) (not e!544704))))

(declare-datatypes ((array!59582 0))(
  ( (array!59583 (arr!28660 (Array (_ BitVec 32) (_ BitVec 64))) (size!29141 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59582)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966296 (= res!646859 (validKeyInArray!0 (select (arr!28660 _keys!1686) i!803)))))

(declare-fun b!966297 () Bool)

(declare-fun e!544706 () Bool)

(declare-fun e!544707 () Bool)

(declare-fun mapRes!34675 () Bool)

(assert (=> b!966297 (= e!544706 (and e!544707 mapRes!34675))))

(declare-fun condMapEmpty!34675 () Bool)

(declare-datatypes ((V!34033 0))(
  ( (V!34034 (val!10944 Int)) )
))
(declare-datatypes ((ValueCell!10412 0))(
  ( (ValueCellFull!10412 (v!13501 V!34033)) (EmptyCell!10412) )
))
(declare-datatypes ((array!59584 0))(
  ( (array!59585 (arr!28661 (Array (_ BitVec 32) ValueCell!10412)) (size!29142 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59584)

(declare-fun mapDefault!34675 () ValueCell!10412)

(assert (=> b!966297 (= condMapEmpty!34675 (= (arr!28661 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10412)) mapDefault!34675)))))

(declare-fun b!966298 () Bool)

(declare-fun e!544705 () Bool)

(declare-fun tp_is_empty!21787 () Bool)

(assert (=> b!966298 (= e!544705 tp_is_empty!21787)))

(declare-fun b!966299 () Bool)

(assert (=> b!966299 (= e!544707 tp_is_empty!21787)))

(declare-fun mapIsEmpty!34675 () Bool)

(assert (=> mapIsEmpty!34675 mapRes!34675))

(declare-fun b!966300 () Bool)

(declare-fun res!646858 () Bool)

(assert (=> b!966300 (=> (not res!646858) (not e!544704))))

(declare-datatypes ((List!19949 0))(
  ( (Nil!19946) (Cons!19945 (h!21107 (_ BitVec 64)) (t!28303 List!19949)) )
))
(declare-fun arrayNoDuplicates!0 (array!59582 (_ BitVec 32) List!19949) Bool)

(assert (=> b!966300 (= res!646858 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19946))))

(declare-fun b!966301 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966301 (= e!544704 (and (bvsgt from!2084 newFrom!159) (bvsle from!2084 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!34675 () Bool)

(declare-fun tp!66067 () Bool)

(assert (=> mapNonEmpty!34675 (= mapRes!34675 (and tp!66067 e!544705))))

(declare-fun mapRest!34675 () (Array (_ BitVec 32) ValueCell!10412))

(declare-fun mapValue!34675 () ValueCell!10412)

(declare-fun mapKey!34675 () (_ BitVec 32))

(assert (=> mapNonEmpty!34675 (= (arr!28661 _values!1400) (store mapRest!34675 mapKey!34675 mapValue!34675))))

(declare-fun b!966302 () Bool)

(declare-fun res!646860 () Bool)

(assert (=> b!966302 (=> (not res!646860) (not e!544704))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34033)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34033)

(declare-datatypes ((tuple2!14144 0))(
  ( (tuple2!14145 (_1!7083 (_ BitVec 64)) (_2!7083 V!34033)) )
))
(declare-datatypes ((List!19950 0))(
  ( (Nil!19947) (Cons!19946 (h!21108 tuple2!14144) (t!28304 List!19950)) )
))
(declare-datatypes ((ListLongMap!12831 0))(
  ( (ListLongMap!12832 (toList!6431 List!19950)) )
))
(declare-fun contains!5476 (ListLongMap!12831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3593 (array!59582 array!59584 (_ BitVec 32) (_ BitVec 32) V!34033 V!34033 (_ BitVec 32) Int) ListLongMap!12831)

(assert (=> b!966302 (= res!646860 (contains!5476 (getCurrentListMap!3593 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28660 _keys!1686) i!803)))))

(declare-fun res!646857 () Bool)

(assert (=> start!82834 (=> (not res!646857) (not e!544704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82834 (= res!646857 (validMask!0 mask!2110))))

(assert (=> start!82834 e!544704))

(assert (=> start!82834 true))

(declare-fun array_inv!22253 (array!59584) Bool)

(assert (=> start!82834 (and (array_inv!22253 _values!1400) e!544706)))

(declare-fun array_inv!22254 (array!59582) Bool)

(assert (=> start!82834 (array_inv!22254 _keys!1686)))

(assert (=> start!82834 tp!66066))

(assert (=> start!82834 tp_is_empty!21787))

(declare-fun b!966303 () Bool)

(declare-fun res!646861 () Bool)

(assert (=> b!966303 (=> (not res!646861) (not e!544704))))

(assert (=> b!966303 (= res!646861 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29141 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29141 _keys!1686))))))

(declare-fun b!966304 () Bool)

(declare-fun res!646862 () Bool)

(assert (=> b!966304 (=> (not res!646862) (not e!544704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59582 (_ BitVec 32)) Bool)

(assert (=> b!966304 (= res!646862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966305 () Bool)

(declare-fun res!646856 () Bool)

(assert (=> b!966305 (=> (not res!646856) (not e!544704))))

(assert (=> b!966305 (= res!646856 (and (= (size!29142 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29141 _keys!1686) (size!29142 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82834 res!646857) b!966305))

(assert (= (and b!966305 res!646856) b!966304))

(assert (= (and b!966304 res!646862) b!966300))

(assert (= (and b!966300 res!646858) b!966303))

(assert (= (and b!966303 res!646861) b!966296))

(assert (= (and b!966296 res!646859) b!966302))

(assert (= (and b!966302 res!646860) b!966301))

(assert (= (and b!966297 condMapEmpty!34675) mapIsEmpty!34675))

(assert (= (and b!966297 (not condMapEmpty!34675)) mapNonEmpty!34675))

(get-info :version)

(assert (= (and mapNonEmpty!34675 ((_ is ValueCellFull!10412) mapValue!34675)) b!966298))

(assert (= (and b!966297 ((_ is ValueCellFull!10412) mapDefault!34675)) b!966299))

(assert (= start!82834 b!966297))

(declare-fun m!894541 () Bool)

(assert (=> b!966302 m!894541))

(declare-fun m!894543 () Bool)

(assert (=> b!966302 m!894543))

(assert (=> b!966302 m!894541))

(assert (=> b!966302 m!894543))

(declare-fun m!894545 () Bool)

(assert (=> b!966302 m!894545))

(assert (=> b!966296 m!894543))

(assert (=> b!966296 m!894543))

(declare-fun m!894547 () Bool)

(assert (=> b!966296 m!894547))

(declare-fun m!894549 () Bool)

(assert (=> b!966300 m!894549))

(declare-fun m!894551 () Bool)

(assert (=> start!82834 m!894551))

(declare-fun m!894553 () Bool)

(assert (=> start!82834 m!894553))

(declare-fun m!894555 () Bool)

(assert (=> start!82834 m!894555))

(declare-fun m!894557 () Bool)

(assert (=> b!966304 m!894557))

(declare-fun m!894559 () Bool)

(assert (=> mapNonEmpty!34675 m!894559))

(check-sat (not b!966300) (not mapNonEmpty!34675) b_and!30441 (not b!966302) (not start!82834) tp_is_empty!21787 (not b!966296) (not b!966304) (not b_next!18979))
(check-sat b_and!30441 (not b_next!18979))
