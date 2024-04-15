; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82780 () Bool)

(assert start!82780)

(declare-fun b_free!18925 () Bool)

(declare-fun b_next!18925 () Bool)

(assert (=> start!82780 (= b_free!18925 (not b_next!18925))))

(declare-fun tp!65904 () Bool)

(declare-fun b_and!30387 () Bool)

(assert (=> start!82780 (= tp!65904 b_and!30387)))

(declare-fun b!965565 () Bool)

(declare-fun e!544302 () Bool)

(declare-fun tp_is_empty!21733 () Bool)

(assert (=> b!965565 (= e!544302 tp_is_empty!21733)))

(declare-fun b!965567 () Bool)

(declare-fun e!544301 () Bool)

(declare-fun mapRes!34594 () Bool)

(assert (=> b!965567 (= e!544301 (and e!544302 mapRes!34594))))

(declare-fun condMapEmpty!34594 () Bool)

(declare-datatypes ((V!33961 0))(
  ( (V!33962 (val!10917 Int)) )
))
(declare-datatypes ((ValueCell!10385 0))(
  ( (ValueCellFull!10385 (v!13474 V!33961)) (EmptyCell!10385) )
))
(declare-datatypes ((array!59480 0))(
  ( (array!59481 (arr!28609 (Array (_ BitVec 32) ValueCell!10385)) (size!29090 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59480)

(declare-fun mapDefault!34594 () ValueCell!10385)

(assert (=> b!965567 (= condMapEmpty!34594 (= (arr!28609 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10385)) mapDefault!34594)))))

(declare-fun b!965568 () Bool)

(declare-fun res!646371 () Bool)

(declare-fun e!544303 () Bool)

(assert (=> b!965568 (=> (not res!646371) (not e!544303))))

(declare-datatypes ((array!59482 0))(
  ( (array!59483 (arr!28610 (Array (_ BitVec 32) (_ BitVec 64))) (size!29091 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59482)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965568 (= res!646371 (validKeyInArray!0 (select (arr!28610 _keys!1686) i!803)))))

(declare-fun b!965569 () Bool)

(declare-fun e!544299 () Bool)

(assert (=> b!965569 (= e!544299 tp_is_empty!21733)))

(declare-fun b!965570 () Bool)

(declare-fun res!646370 () Bool)

(assert (=> b!965570 (=> (not res!646370) (not e!544303))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965570 (= res!646370 (and (= (size!29090 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29091 _keys!1686) (size!29090 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965571 () Bool)

(declare-fun res!646373 () Bool)

(assert (=> b!965571 (=> (not res!646373) (not e!544303))))

(declare-datatypes ((List!19911 0))(
  ( (Nil!19908) (Cons!19907 (h!21069 (_ BitVec 64)) (t!28265 List!19911)) )
))
(declare-fun arrayNoDuplicates!0 (array!59482 (_ BitVec 32) List!19911) Bool)

(assert (=> b!965571 (= res!646373 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19908))))

(declare-fun b!965566 () Bool)

(declare-fun res!646372 () Bool)

(assert (=> b!965566 (=> (not res!646372) (not e!544303))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965566 (= res!646372 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29091 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29091 _keys!1686))))))

(declare-fun res!646368 () Bool)

(assert (=> start!82780 (=> (not res!646368) (not e!544303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82780 (= res!646368 (validMask!0 mask!2110))))

(assert (=> start!82780 e!544303))

(assert (=> start!82780 true))

(declare-fun array_inv!22213 (array!59480) Bool)

(assert (=> start!82780 (and (array_inv!22213 _values!1400) e!544301)))

(declare-fun array_inv!22214 (array!59482) Bool)

(assert (=> start!82780 (array_inv!22214 _keys!1686)))

(assert (=> start!82780 tp!65904))

(assert (=> start!82780 tp_is_empty!21733))

(declare-fun b!965572 () Bool)

(assert (=> b!965572 (= e!544303 false)))

(declare-fun minValue!1342 () V!33961)

(declare-fun lt!431027 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33961)

(declare-datatypes ((tuple2!14104 0))(
  ( (tuple2!14105 (_1!7063 (_ BitVec 64)) (_2!7063 V!33961)) )
))
(declare-datatypes ((List!19912 0))(
  ( (Nil!19909) (Cons!19908 (h!21070 tuple2!14104) (t!28266 List!19912)) )
))
(declare-datatypes ((ListLongMap!12791 0))(
  ( (ListLongMap!12792 (toList!6411 List!19912)) )
))
(declare-fun contains!5456 (ListLongMap!12791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3573 (array!59482 array!59480 (_ BitVec 32) (_ BitVec 32) V!33961 V!33961 (_ BitVec 32) Int) ListLongMap!12791)

(assert (=> b!965572 (= lt!431027 (contains!5456 (getCurrentListMap!3573 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28610 _keys!1686) i!803)))))

(declare-fun b!965573 () Bool)

(declare-fun res!646369 () Bool)

(assert (=> b!965573 (=> (not res!646369) (not e!544303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59482 (_ BitVec 32)) Bool)

(assert (=> b!965573 (= res!646369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34594 () Bool)

(declare-fun tp!65905 () Bool)

(assert (=> mapNonEmpty!34594 (= mapRes!34594 (and tp!65905 e!544299))))

(declare-fun mapValue!34594 () ValueCell!10385)

(declare-fun mapRest!34594 () (Array (_ BitVec 32) ValueCell!10385))

(declare-fun mapKey!34594 () (_ BitVec 32))

(assert (=> mapNonEmpty!34594 (= (arr!28609 _values!1400) (store mapRest!34594 mapKey!34594 mapValue!34594))))

(declare-fun mapIsEmpty!34594 () Bool)

(assert (=> mapIsEmpty!34594 mapRes!34594))

(assert (= (and start!82780 res!646368) b!965570))

(assert (= (and b!965570 res!646370) b!965573))

(assert (= (and b!965573 res!646369) b!965571))

(assert (= (and b!965571 res!646373) b!965566))

(assert (= (and b!965566 res!646372) b!965568))

(assert (= (and b!965568 res!646371) b!965572))

(assert (= (and b!965567 condMapEmpty!34594) mapIsEmpty!34594))

(assert (= (and b!965567 (not condMapEmpty!34594)) mapNonEmpty!34594))

(get-info :version)

(assert (= (and mapNonEmpty!34594 ((_ is ValueCellFull!10385) mapValue!34594)) b!965569))

(assert (= (and b!965567 ((_ is ValueCellFull!10385) mapDefault!34594)) b!965565))

(assert (= start!82780 b!965567))

(declare-fun m!894001 () Bool)

(assert (=> b!965571 m!894001))

(declare-fun m!894003 () Bool)

(assert (=> b!965572 m!894003))

(declare-fun m!894005 () Bool)

(assert (=> b!965572 m!894005))

(assert (=> b!965572 m!894003))

(assert (=> b!965572 m!894005))

(declare-fun m!894007 () Bool)

(assert (=> b!965572 m!894007))

(assert (=> b!965568 m!894005))

(assert (=> b!965568 m!894005))

(declare-fun m!894009 () Bool)

(assert (=> b!965568 m!894009))

(declare-fun m!894011 () Bool)

(assert (=> mapNonEmpty!34594 m!894011))

(declare-fun m!894013 () Bool)

(assert (=> b!965573 m!894013))

(declare-fun m!894015 () Bool)

(assert (=> start!82780 m!894015))

(declare-fun m!894017 () Bool)

(assert (=> start!82780 m!894017))

(declare-fun m!894019 () Bool)

(assert (=> start!82780 m!894019))

(check-sat (not b!965571) (not b!965572) (not b_next!18925) (not b!965573) (not start!82780) (not b!965568) b_and!30387 (not mapNonEmpty!34594) tp_is_empty!21733)
(check-sat b_and!30387 (not b_next!18925))
