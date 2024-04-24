; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82660 () Bool)

(assert start!82660)

(declare-fun mapNonEmpty!34135 () Bool)

(declare-fun mapRes!34135 () Bool)

(declare-fun tp!65065 () Bool)

(declare-fun e!542653 () Bool)

(assert (=> mapNonEmpty!34135 (= mapRes!34135 (and tp!65065 e!542653))))

(declare-datatypes ((V!33553 0))(
  ( (V!33554 (val!10764 Int)) )
))
(declare-datatypes ((ValueCell!10232 0))(
  ( (ValueCellFull!10232 (v!13319 V!33553)) (EmptyCell!10232) )
))
(declare-fun mapRest!34135 () (Array (_ BitVec 32) ValueCell!10232))

(declare-datatypes ((array!58980 0))(
  ( (array!58981 (arr!28354 (Array (_ BitVec 32) ValueCell!10232)) (size!28834 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58980)

(declare-fun mapValue!34135 () ValueCell!10232)

(declare-fun mapKey!34135 () (_ BitVec 32))

(assert (=> mapNonEmpty!34135 (= (arr!28354 _values!1400) (store mapRest!34135 mapKey!34135 mapValue!34135))))

(declare-fun b!962309 () Bool)

(declare-fun tp_is_empty!21427 () Bool)

(assert (=> b!962309 (= e!542653 tp_is_empty!21427)))

(declare-fun b!962310 () Bool)

(declare-fun res!643801 () Bool)

(declare-fun e!542655 () Bool)

(assert (=> b!962310 (=> (not res!643801) (not e!542655))))

(declare-datatypes ((array!58982 0))(
  ( (array!58983 (arr!28355 (Array (_ BitVec 32) (_ BitVec 64))) (size!28835 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58982)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58982 (_ BitVec 32)) Bool)

(assert (=> b!962310 (= res!643801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962311 () Bool)

(declare-fun e!542654 () Bool)

(assert (=> b!962311 (= e!542654 tp_is_empty!21427)))

(declare-fun b!962312 () Bool)

(declare-fun res!643802 () Bool)

(assert (=> b!962312 (=> (not res!643802) (not e!542655))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962312 (= res!643802 (and (= (size!28834 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28835 _keys!1686) (size!28834 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962314 () Bool)

(assert (=> b!962314 (= e!542655 false)))

(declare-fun lt!431111 () Bool)

(declare-datatypes ((List!19670 0))(
  ( (Nil!19667) (Cons!19666 (h!20834 (_ BitVec 64)) (t!28025 List!19670)) )
))
(declare-fun arrayNoDuplicates!0 (array!58982 (_ BitVec 32) List!19670) Bool)

(assert (=> b!962314 (= lt!431111 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19667))))

(declare-fun mapIsEmpty!34135 () Bool)

(assert (=> mapIsEmpty!34135 mapRes!34135))

(declare-fun b!962313 () Bool)

(declare-fun e!542656 () Bool)

(assert (=> b!962313 (= e!542656 (and e!542654 mapRes!34135))))

(declare-fun condMapEmpty!34135 () Bool)

(declare-fun mapDefault!34135 () ValueCell!10232)

(assert (=> b!962313 (= condMapEmpty!34135 (= (arr!28354 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10232)) mapDefault!34135)))))

(declare-fun res!643803 () Bool)

(assert (=> start!82660 (=> (not res!643803) (not e!542655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82660 (= res!643803 (validMask!0 mask!2110))))

(assert (=> start!82660 e!542655))

(assert (=> start!82660 true))

(declare-fun array_inv!22049 (array!58980) Bool)

(assert (=> start!82660 (and (array_inv!22049 _values!1400) e!542656)))

(declare-fun array_inv!22050 (array!58982) Bool)

(assert (=> start!82660 (array_inv!22050 _keys!1686)))

(assert (= (and start!82660 res!643803) b!962312))

(assert (= (and b!962312 res!643802) b!962310))

(assert (= (and b!962310 res!643801) b!962314))

(assert (= (and b!962313 condMapEmpty!34135) mapIsEmpty!34135))

(assert (= (and b!962313 (not condMapEmpty!34135)) mapNonEmpty!34135))

(get-info :version)

(assert (= (and mapNonEmpty!34135 ((_ is ValueCellFull!10232) mapValue!34135)) b!962309))

(assert (= (and b!962313 ((_ is ValueCellFull!10232) mapDefault!34135)) b!962311))

(assert (= start!82660 b!962313))

(declare-fun m!892663 () Bool)

(assert (=> mapNonEmpty!34135 m!892663))

(declare-fun m!892665 () Bool)

(assert (=> b!962310 m!892665))

(declare-fun m!892667 () Bool)

(assert (=> b!962314 m!892667))

(declare-fun m!892669 () Bool)

(assert (=> start!82660 m!892669))

(declare-fun m!892671 () Bool)

(assert (=> start!82660 m!892671))

(declare-fun m!892673 () Bool)

(assert (=> start!82660 m!892673))

(check-sat (not start!82660) (not b!962310) tp_is_empty!21427 (not b!962314) (not mapNonEmpty!34135))
(check-sat)
