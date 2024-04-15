; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82334 () Bool)

(assert start!82334)

(declare-fun b_free!18619 () Bool)

(declare-fun b_next!18619 () Bool)

(assert (=> start!82334 (= b_free!18619 (not b_next!18619))))

(declare-fun tp!64828 () Bool)

(declare-fun b_and!30081 () Bool)

(assert (=> start!82334 (= tp!64828 b_and!30081)))

(declare-fun b!959940 () Bool)

(declare-fun e!541110 () Bool)

(declare-fun tp_is_empty!21331 () Bool)

(assert (=> b!959940 (= e!541110 tp_is_empty!21331)))

(declare-fun b!959941 () Bool)

(declare-fun res!642621 () Bool)

(declare-fun e!541108 () Bool)

(assert (=> b!959941 (=> (not res!642621) (not e!541108))))

(declare-datatypes ((array!58688 0))(
  ( (array!58689 (arr!28218 (Array (_ BitVec 32) (_ BitVec 64))) (size!28699 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58688)

(declare-datatypes ((List!19659 0))(
  ( (Nil!19656) (Cons!19655 (h!20817 (_ BitVec 64)) (t!28013 List!19659)) )
))
(declare-fun arrayNoDuplicates!0 (array!58688 (_ BitVec 32) List!19659) Bool)

(assert (=> b!959941 (= res!642621 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19656))))

(declare-fun b!959942 () Bool)

(declare-fun e!541112 () Bool)

(declare-fun e!541109 () Bool)

(declare-fun mapRes!33976 () Bool)

(assert (=> b!959942 (= e!541112 (and e!541109 mapRes!33976))))

(declare-fun condMapEmpty!33976 () Bool)

(declare-datatypes ((V!33425 0))(
  ( (V!33426 (val!10716 Int)) )
))
(declare-datatypes ((ValueCell!10184 0))(
  ( (ValueCellFull!10184 (v!13272 V!33425)) (EmptyCell!10184) )
))
(declare-datatypes ((array!58690 0))(
  ( (array!58691 (arr!28219 (Array (_ BitVec 32) ValueCell!10184)) (size!28700 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58690)

(declare-fun mapDefault!33976 () ValueCell!10184)

(assert (=> b!959942 (= condMapEmpty!33976 (= (arr!28219 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10184)) mapDefault!33976)))))

(declare-fun b!959943 () Bool)

(declare-fun res!642620 () Bool)

(assert (=> b!959943 (=> (not res!642620) (not e!541108))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959943 (= res!642620 (validKeyInArray!0 (select (arr!28218 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33976 () Bool)

(assert (=> mapIsEmpty!33976 mapRes!33976))

(declare-fun b!959944 () Bool)

(declare-fun res!642616 () Bool)

(assert (=> b!959944 (=> (not res!642616) (not e!541108))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959944 (= res!642616 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28699 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28699 _keys!1668))))))

(declare-fun res!642618 () Bool)

(assert (=> start!82334 (=> (not res!642618) (not e!541108))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82334 (= res!642618 (validMask!0 mask!2088))))

(assert (=> start!82334 e!541108))

(assert (=> start!82334 true))

(assert (=> start!82334 tp_is_empty!21331))

(declare-fun array_inv!21931 (array!58688) Bool)

(assert (=> start!82334 (array_inv!21931 _keys!1668)))

(declare-fun array_inv!21932 (array!58690) Bool)

(assert (=> start!82334 (and (array_inv!21932 _values!1386) e!541112)))

(assert (=> start!82334 tp!64828))

(declare-fun b!959945 () Bool)

(assert (=> b!959945 (= e!541108 false)))

(declare-fun minValue!1328 () V!33425)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33425)

(declare-fun lt!430384 () Bool)

(declare-datatypes ((tuple2!13876 0))(
  ( (tuple2!13877 (_1!6949 (_ BitVec 64)) (_2!6949 V!33425)) )
))
(declare-datatypes ((List!19660 0))(
  ( (Nil!19657) (Cons!19656 (h!20818 tuple2!13876) (t!28014 List!19660)) )
))
(declare-datatypes ((ListLongMap!12563 0))(
  ( (ListLongMap!12564 (toList!6297 List!19660)) )
))
(declare-fun contains!5340 (ListLongMap!12563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3459 (array!58688 array!58690 (_ BitVec 32) (_ BitVec 32) V!33425 V!33425 (_ BitVec 32) Int) ListLongMap!12563)

(assert (=> b!959945 (= lt!430384 (contains!5340 (getCurrentListMap!3459 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28218 _keys!1668) i!793)))))

(declare-fun b!959946 () Bool)

(declare-fun res!642617 () Bool)

(assert (=> b!959946 (=> (not res!642617) (not e!541108))))

(assert (=> b!959946 (= res!642617 (and (= (size!28700 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28699 _keys!1668) (size!28700 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959947 () Bool)

(assert (=> b!959947 (= e!541109 tp_is_empty!21331)))

(declare-fun b!959948 () Bool)

(declare-fun res!642619 () Bool)

(assert (=> b!959948 (=> (not res!642619) (not e!541108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58688 (_ BitVec 32)) Bool)

(assert (=> b!959948 (= res!642619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33976 () Bool)

(declare-fun tp!64827 () Bool)

(assert (=> mapNonEmpty!33976 (= mapRes!33976 (and tp!64827 e!541110))))

(declare-fun mapValue!33976 () ValueCell!10184)

(declare-fun mapRest!33976 () (Array (_ BitVec 32) ValueCell!10184))

(declare-fun mapKey!33976 () (_ BitVec 32))

(assert (=> mapNonEmpty!33976 (= (arr!28219 _values!1386) (store mapRest!33976 mapKey!33976 mapValue!33976))))

(assert (= (and start!82334 res!642618) b!959946))

(assert (= (and b!959946 res!642617) b!959948))

(assert (= (and b!959948 res!642619) b!959941))

(assert (= (and b!959941 res!642621) b!959944))

(assert (= (and b!959944 res!642616) b!959943))

(assert (= (and b!959943 res!642620) b!959945))

(assert (= (and b!959942 condMapEmpty!33976) mapIsEmpty!33976))

(assert (= (and b!959942 (not condMapEmpty!33976)) mapNonEmpty!33976))

(get-info :version)

(assert (= (and mapNonEmpty!33976 ((_ is ValueCellFull!10184) mapValue!33976)) b!959940))

(assert (= (and b!959942 ((_ is ValueCellFull!10184) mapDefault!33976)) b!959947))

(assert (= start!82334 b!959942))

(declare-fun m!889731 () Bool)

(assert (=> mapNonEmpty!33976 m!889731))

(declare-fun m!889733 () Bool)

(assert (=> start!82334 m!889733))

(declare-fun m!889735 () Bool)

(assert (=> start!82334 m!889735))

(declare-fun m!889737 () Bool)

(assert (=> start!82334 m!889737))

(declare-fun m!889739 () Bool)

(assert (=> b!959943 m!889739))

(assert (=> b!959943 m!889739))

(declare-fun m!889741 () Bool)

(assert (=> b!959943 m!889741))

(declare-fun m!889743 () Bool)

(assert (=> b!959945 m!889743))

(assert (=> b!959945 m!889739))

(assert (=> b!959945 m!889743))

(assert (=> b!959945 m!889739))

(declare-fun m!889745 () Bool)

(assert (=> b!959945 m!889745))

(declare-fun m!889747 () Bool)

(assert (=> b!959948 m!889747))

(declare-fun m!889749 () Bool)

(assert (=> b!959941 m!889749))

(check-sat (not b!959941) (not b!959943) (not b!959945) b_and!30081 tp_is_empty!21331 (not b_next!18619) (not mapNonEmpty!33976) (not start!82334) (not b!959948))
(check-sat b_and!30081 (not b_next!18619))
