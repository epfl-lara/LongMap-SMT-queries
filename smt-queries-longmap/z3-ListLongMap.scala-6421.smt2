; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82324 () Bool)

(assert start!82324)

(declare-fun b_free!18591 () Bool)

(declare-fun b_next!18591 () Bool)

(assert (=> start!82324 (= b_free!18591 (not b_next!18591))))

(declare-fun tp!64743 () Bool)

(declare-fun b_and!30079 () Bool)

(assert (=> start!82324 (= tp!64743 b_and!30079)))

(declare-fun b!959801 () Bool)

(declare-fun res!642475 () Bool)

(declare-fun e!541049 () Bool)

(assert (=> b!959801 (=> (not res!642475) (not e!541049))))

(declare-datatypes ((array!58697 0))(
  ( (array!58698 (arr!28222 (Array (_ BitVec 32) (_ BitVec 64))) (size!28701 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58697)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959801 (= res!642475 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28701 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28701 _keys!1668))))))

(declare-fun b!959802 () Bool)

(declare-fun res!642478 () Bool)

(assert (=> b!959802 (=> (not res!642478) (not e!541049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959802 (= res!642478 (validKeyInArray!0 (select (arr!28222 _keys!1668) i!793)))))

(declare-fun b!959803 () Bool)

(declare-fun res!642479 () Bool)

(assert (=> b!959803 (=> (not res!642479) (not e!541049))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33387 0))(
  ( (V!33388 (val!10702 Int)) )
))
(declare-datatypes ((ValueCell!10170 0))(
  ( (ValueCellFull!10170 (v!13259 V!33387)) (EmptyCell!10170) )
))
(declare-datatypes ((array!58699 0))(
  ( (array!58700 (arr!28223 (Array (_ BitVec 32) ValueCell!10170)) (size!28702 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58699)

(assert (=> b!959803 (= res!642479 (and (= (size!28702 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28701 _keys!1668) (size!28702 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959804 () Bool)

(declare-fun res!642474 () Bool)

(assert (=> b!959804 (=> (not res!642474) (not e!541049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58697 (_ BitVec 32)) Bool)

(assert (=> b!959804 (= res!642474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642477 () Bool)

(assert (=> start!82324 (=> (not res!642477) (not e!541049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82324 (= res!642477 (validMask!0 mask!2088))))

(assert (=> start!82324 e!541049))

(assert (=> start!82324 true))

(declare-fun tp_is_empty!21303 () Bool)

(assert (=> start!82324 tp_is_empty!21303))

(declare-fun array_inv!21873 (array!58697) Bool)

(assert (=> start!82324 (array_inv!21873 _keys!1668)))

(declare-fun e!541048 () Bool)

(declare-fun array_inv!21874 (array!58699) Bool)

(assert (=> start!82324 (and (array_inv!21874 _values!1386) e!541048)))

(assert (=> start!82324 tp!64743))

(declare-fun b!959805 () Bool)

(declare-fun res!642476 () Bool)

(assert (=> b!959805 (=> (not res!642476) (not e!541049))))

(declare-datatypes ((List!19623 0))(
  ( (Nil!19620) (Cons!19619 (h!20781 (_ BitVec 64)) (t!27986 List!19623)) )
))
(declare-fun arrayNoDuplicates!0 (array!58697 (_ BitVec 32) List!19623) Bool)

(assert (=> b!959805 (= res!642476 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19620))))

(declare-fun mapNonEmpty!33934 () Bool)

(declare-fun mapRes!33934 () Bool)

(declare-fun tp!64742 () Bool)

(declare-fun e!541047 () Bool)

(assert (=> mapNonEmpty!33934 (= mapRes!33934 (and tp!64742 e!541047))))

(declare-fun mapValue!33934 () ValueCell!10170)

(declare-fun mapRest!33934 () (Array (_ BitVec 32) ValueCell!10170))

(declare-fun mapKey!33934 () (_ BitVec 32))

(assert (=> mapNonEmpty!33934 (= (arr!28223 _values!1386) (store mapRest!33934 mapKey!33934 mapValue!33934))))

(declare-fun b!959806 () Bool)

(assert (=> b!959806 (= e!541049 false)))

(declare-fun minValue!1328 () V!33387)

(declare-fun lt!430578 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33387)

(declare-datatypes ((tuple2!13804 0))(
  ( (tuple2!13805 (_1!6913 (_ BitVec 64)) (_2!6913 V!33387)) )
))
(declare-datatypes ((List!19624 0))(
  ( (Nil!19621) (Cons!19620 (h!20782 tuple2!13804) (t!27987 List!19624)) )
))
(declare-datatypes ((ListLongMap!12501 0))(
  ( (ListLongMap!12502 (toList!6266 List!19624)) )
))
(declare-fun contains!5365 (ListLongMap!12501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3499 (array!58697 array!58699 (_ BitVec 32) (_ BitVec 32) V!33387 V!33387 (_ BitVec 32) Int) ListLongMap!12501)

(assert (=> b!959806 (= lt!430578 (contains!5365 (getCurrentListMap!3499 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28222 _keys!1668) i!793)))))

(declare-fun b!959807 () Bool)

(assert (=> b!959807 (= e!541047 tp_is_empty!21303)))

(declare-fun mapIsEmpty!33934 () Bool)

(assert (=> mapIsEmpty!33934 mapRes!33934))

(declare-fun b!959808 () Bool)

(declare-fun e!541050 () Bool)

(assert (=> b!959808 (= e!541050 tp_is_empty!21303)))

(declare-fun b!959809 () Bool)

(assert (=> b!959809 (= e!541048 (and e!541050 mapRes!33934))))

(declare-fun condMapEmpty!33934 () Bool)

(declare-fun mapDefault!33934 () ValueCell!10170)

(assert (=> b!959809 (= condMapEmpty!33934 (= (arr!28223 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10170)) mapDefault!33934)))))

(assert (= (and start!82324 res!642477) b!959803))

(assert (= (and b!959803 res!642479) b!959804))

(assert (= (and b!959804 res!642474) b!959805))

(assert (= (and b!959805 res!642476) b!959801))

(assert (= (and b!959801 res!642475) b!959802))

(assert (= (and b!959802 res!642478) b!959806))

(assert (= (and b!959809 condMapEmpty!33934) mapIsEmpty!33934))

(assert (= (and b!959809 (not condMapEmpty!33934)) mapNonEmpty!33934))

(get-info :version)

(assert (= (and mapNonEmpty!33934 ((_ is ValueCellFull!10170) mapValue!33934)) b!959807))

(assert (= (and b!959809 ((_ is ValueCellFull!10170) mapDefault!33934)) b!959808))

(assert (= start!82324 b!959809))

(declare-fun m!890209 () Bool)

(assert (=> b!959805 m!890209))

(declare-fun m!890211 () Bool)

(assert (=> mapNonEmpty!33934 m!890211))

(declare-fun m!890213 () Bool)

(assert (=> b!959802 m!890213))

(assert (=> b!959802 m!890213))

(declare-fun m!890215 () Bool)

(assert (=> b!959802 m!890215))

(declare-fun m!890217 () Bool)

(assert (=> b!959804 m!890217))

(declare-fun m!890219 () Bool)

(assert (=> start!82324 m!890219))

(declare-fun m!890221 () Bool)

(assert (=> start!82324 m!890221))

(declare-fun m!890223 () Bool)

(assert (=> start!82324 m!890223))

(declare-fun m!890225 () Bool)

(assert (=> b!959806 m!890225))

(assert (=> b!959806 m!890213))

(assert (=> b!959806 m!890225))

(assert (=> b!959806 m!890213))

(declare-fun m!890227 () Bool)

(assert (=> b!959806 m!890227))

(check-sat tp_is_empty!21303 (not mapNonEmpty!33934) (not b!959805) (not b!959802) (not b!959804) b_and!30079 (not b!959806) (not b_next!18591) (not start!82324))
(check-sat b_and!30079 (not b_next!18591))
