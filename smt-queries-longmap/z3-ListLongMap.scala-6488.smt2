; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82936 () Bool)

(assert start!82936)

(declare-fun b_free!18901 () Bool)

(declare-fun b_next!18901 () Bool)

(assert (=> start!82936 (= b_free!18901 (not b_next!18901))))

(declare-fun tp!65824 () Bool)

(declare-fun b_and!30399 () Bool)

(assert (=> start!82936 (= tp!65824 b_and!30399)))

(declare-fun b!966311 () Bool)

(declare-fun e!544804 () Bool)

(declare-fun tp_is_empty!21703 () Bool)

(assert (=> b!966311 (= e!544804 tp_is_empty!21703)))

(declare-fun b!966312 () Bool)

(declare-fun res!646562 () Bool)

(declare-fun e!544808 () Bool)

(assert (=> b!966312 (=> (not res!646562) (not e!544808))))

(declare-datatypes ((array!59508 0))(
  ( (array!59509 (arr!28618 (Array (_ BitVec 32) (_ BitVec 64))) (size!29098 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59508)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966312 (= res!646562 (validKeyInArray!0 (select (arr!28618 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34549 () Bool)

(declare-fun mapRes!34549 () Bool)

(assert (=> mapIsEmpty!34549 mapRes!34549))

(declare-fun b!966313 () Bool)

(declare-fun e!544805 () Bool)

(declare-fun e!544806 () Bool)

(assert (=> b!966313 (= e!544805 (and e!544806 mapRes!34549))))

(declare-fun condMapEmpty!34549 () Bool)

(declare-datatypes ((V!33921 0))(
  ( (V!33922 (val!10902 Int)) )
))
(declare-datatypes ((ValueCell!10370 0))(
  ( (ValueCellFull!10370 (v!13457 V!33921)) (EmptyCell!10370) )
))
(declare-datatypes ((array!59510 0))(
  ( (array!59511 (arr!28619 (Array (_ BitVec 32) ValueCell!10370)) (size!29099 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59510)

(declare-fun mapDefault!34549 () ValueCell!10370)

(assert (=> b!966313 (= condMapEmpty!34549 (= (arr!28619 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10370)) mapDefault!34549)))))

(declare-fun b!966314 () Bool)

(assert (=> b!966314 (= e!544806 tp_is_empty!21703)))

(declare-fun b!966315 () Bool)

(declare-fun res!646561 () Bool)

(assert (=> b!966315 (=> (not res!646561) (not e!544808))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966315 (= res!646561 (and (= (size!29099 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29098 _keys!1686) (size!29099 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34549 () Bool)

(declare-fun tp!65823 () Bool)

(assert (=> mapNonEmpty!34549 (= mapRes!34549 (and tp!65823 e!544804))))

(declare-fun mapRest!34549 () (Array (_ BitVec 32) ValueCell!10370))

(declare-fun mapValue!34549 () ValueCell!10370)

(declare-fun mapKey!34549 () (_ BitVec 32))

(assert (=> mapNonEmpty!34549 (= (arr!28619 _values!1400) (store mapRest!34549 mapKey!34549 mapValue!34549))))

(declare-fun b!966316 () Bool)

(declare-fun res!646566 () Bool)

(assert (=> b!966316 (=> (not res!646566) (not e!544808))))

(declare-datatypes ((List!19849 0))(
  ( (Nil!19846) (Cons!19845 (h!21013 (_ BitVec 64)) (t!28204 List!19849)) )
))
(declare-fun arrayNoDuplicates!0 (array!59508 (_ BitVec 32) List!19849) Bool)

(assert (=> b!966316 (= res!646566 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19846))))

(declare-fun b!966318 () Bool)

(declare-fun res!646564 () Bool)

(assert (=> b!966318 (=> (not res!646564) (not e!544808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59508 (_ BitVec 32)) Bool)

(assert (=> b!966318 (= res!646564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966319 () Bool)

(declare-fun res!646565 () Bool)

(assert (=> b!966319 (=> (not res!646565) (not e!544808))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966319 (= res!646565 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29098 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29098 _keys!1686))))))

(declare-fun res!646563 () Bool)

(assert (=> start!82936 (=> (not res!646563) (not e!544808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82936 (= res!646563 (validMask!0 mask!2110))))

(assert (=> start!82936 e!544808))

(assert (=> start!82936 true))

(declare-fun array_inv!22223 (array!59510) Bool)

(assert (=> start!82936 (and (array_inv!22223 _values!1400) e!544805)))

(declare-fun array_inv!22224 (array!59508) Bool)

(assert (=> start!82936 (array_inv!22224 _keys!1686)))

(assert (=> start!82936 tp!65824))

(assert (=> start!82936 tp_is_empty!21703))

(declare-fun b!966317 () Bool)

(assert (=> b!966317 (= e!544808 false)))

(declare-fun lt!431597 () Bool)

(declare-fun minValue!1342 () V!33921)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33921)

(declare-datatypes ((tuple2!14004 0))(
  ( (tuple2!14005 (_1!7013 (_ BitVec 64)) (_2!7013 V!33921)) )
))
(declare-datatypes ((List!19850 0))(
  ( (Nil!19847) (Cons!19846 (h!21014 tuple2!14004) (t!28205 List!19850)) )
))
(declare-datatypes ((ListLongMap!12703 0))(
  ( (ListLongMap!12704 (toList!6367 List!19850)) )
))
(declare-fun contains!5482 (ListLongMap!12703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3600 (array!59508 array!59510 (_ BitVec 32) (_ BitVec 32) V!33921 V!33921 (_ BitVec 32) Int) ListLongMap!12703)

(assert (=> b!966317 (= lt!431597 (contains!5482 (getCurrentListMap!3600 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28618 _keys!1686) i!803)))))

(assert (= (and start!82936 res!646563) b!966315))

(assert (= (and b!966315 res!646561) b!966318))

(assert (= (and b!966318 res!646564) b!966316))

(assert (= (and b!966316 res!646566) b!966319))

(assert (= (and b!966319 res!646565) b!966312))

(assert (= (and b!966312 res!646562) b!966317))

(assert (= (and b!966313 condMapEmpty!34549) mapIsEmpty!34549))

(assert (= (and b!966313 (not condMapEmpty!34549)) mapNonEmpty!34549))

(get-info :version)

(assert (= (and mapNonEmpty!34549 ((_ is ValueCellFull!10370) mapValue!34549)) b!966311))

(assert (= (and b!966313 ((_ is ValueCellFull!10370) mapDefault!34549)) b!966314))

(assert (= start!82936 b!966313))

(declare-fun m!895783 () Bool)

(assert (=> b!966316 m!895783))

(declare-fun m!895785 () Bool)

(assert (=> b!966318 m!895785))

(declare-fun m!895787 () Bool)

(assert (=> b!966317 m!895787))

(declare-fun m!895789 () Bool)

(assert (=> b!966317 m!895789))

(assert (=> b!966317 m!895787))

(assert (=> b!966317 m!895789))

(declare-fun m!895791 () Bool)

(assert (=> b!966317 m!895791))

(declare-fun m!895793 () Bool)

(assert (=> start!82936 m!895793))

(declare-fun m!895795 () Bool)

(assert (=> start!82936 m!895795))

(declare-fun m!895797 () Bool)

(assert (=> start!82936 m!895797))

(declare-fun m!895799 () Bool)

(assert (=> mapNonEmpty!34549 m!895799))

(assert (=> b!966312 m!895789))

(assert (=> b!966312 m!895789))

(declare-fun m!895801 () Bool)

(assert (=> b!966312 m!895801))

(check-sat (not b!966316) b_and!30399 (not start!82936) (not b!966318) (not b!966317) (not mapNonEmpty!34549) tp_is_empty!21703 (not b_next!18901) (not b!966312))
(check-sat b_and!30399 (not b_next!18901))
