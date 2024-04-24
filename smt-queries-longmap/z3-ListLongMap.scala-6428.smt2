; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82532 () Bool)

(assert start!82532)

(declare-fun b_free!18631 () Bool)

(declare-fun b_next!18631 () Bool)

(assert (=> start!82532 (= b_free!18631 (not b_next!18631))))

(declare-fun tp!64864 () Bool)

(declare-fun b_and!30129 () Bool)

(assert (=> start!82532 (= tp!64864 b_and!30129)))

(declare-fun b!961244 () Bool)

(declare-fun res!643182 () Bool)

(declare-fun e!541931 () Bool)

(assert (=> b!961244 (=> (not res!643182) (not e!541931))))

(declare-datatypes ((array!58808 0))(
  ( (array!58809 (arr!28273 (Array (_ BitVec 32) (_ BitVec 64))) (size!28753 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58808)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58808 (_ BitVec 32)) Bool)

(assert (=> b!961244 (= res!643182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961245 () Bool)

(declare-fun res!643181 () Bool)

(assert (=> b!961245 (=> (not res!643181) (not e!541931))))

(declare-datatypes ((List!19640 0))(
  ( (Nil!19637) (Cons!19636 (h!20804 (_ BitVec 64)) (t!27995 List!19640)) )
))
(declare-fun arrayNoDuplicates!0 (array!58808 (_ BitVec 32) List!19640) Bool)

(assert (=> b!961245 (= res!643181 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19637))))

(declare-fun b!961246 () Bool)

(assert (=> b!961246 (= e!541931 false)))

(declare-fun lt!430999 () Bool)

(declare-datatypes ((V!33441 0))(
  ( (V!33442 (val!10722 Int)) )
))
(declare-fun minValue!1328 () V!33441)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10190 0))(
  ( (ValueCellFull!10190 (v!13276 V!33441)) (EmptyCell!10190) )
))
(declare-datatypes ((array!58810 0))(
  ( (array!58811 (arr!28274 (Array (_ BitVec 32) ValueCell!10190)) (size!28754 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58810)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33441)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13810 0))(
  ( (tuple2!13811 (_1!6916 (_ BitVec 64)) (_2!6916 V!33441)) )
))
(declare-datatypes ((List!19641 0))(
  ( (Nil!19638) (Cons!19637 (h!20805 tuple2!13810) (t!27996 List!19641)) )
))
(declare-datatypes ((ListLongMap!12509 0))(
  ( (ListLongMap!12510 (toList!6270 List!19641)) )
))
(declare-fun contains!5382 (ListLongMap!12509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3503 (array!58808 array!58810 (_ BitVec 32) (_ BitVec 32) V!33441 V!33441 (_ BitVec 32) Int) ListLongMap!12509)

(assert (=> b!961246 (= lt!430999 (contains!5382 (getCurrentListMap!3503 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28273 _keys!1668) i!793)))))

(declare-fun b!961247 () Bool)

(declare-fun e!541929 () Bool)

(declare-fun tp_is_empty!21343 () Bool)

(assert (=> b!961247 (= e!541929 tp_is_empty!21343)))

(declare-fun b!961248 () Bool)

(declare-fun e!541930 () Bool)

(assert (=> b!961248 (= e!541930 tp_is_empty!21343)))

(declare-fun b!961249 () Bool)

(declare-fun res!643180 () Bool)

(assert (=> b!961249 (=> (not res!643180) (not e!541931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961249 (= res!643180 (validKeyInArray!0 (select (arr!28273 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33994 () Bool)

(declare-fun mapRes!33994 () Bool)

(declare-fun tp!64863 () Bool)

(assert (=> mapNonEmpty!33994 (= mapRes!33994 (and tp!64863 e!541930))))

(declare-fun mapValue!33994 () ValueCell!10190)

(declare-fun mapKey!33994 () (_ BitVec 32))

(declare-fun mapRest!33994 () (Array (_ BitVec 32) ValueCell!10190))

(assert (=> mapNonEmpty!33994 (= (arr!28274 _values!1386) (store mapRest!33994 mapKey!33994 mapValue!33994))))

(declare-fun b!961250 () Bool)

(declare-fun res!643178 () Bool)

(assert (=> b!961250 (=> (not res!643178) (not e!541931))))

(assert (=> b!961250 (= res!643178 (and (= (size!28754 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28753 _keys!1668) (size!28754 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!643183 () Bool)

(assert (=> start!82532 (=> (not res!643183) (not e!541931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82532 (= res!643183 (validMask!0 mask!2088))))

(assert (=> start!82532 e!541931))

(assert (=> start!82532 true))

(assert (=> start!82532 tp_is_empty!21343))

(declare-fun array_inv!21995 (array!58808) Bool)

(assert (=> start!82532 (array_inv!21995 _keys!1668)))

(declare-fun e!541928 () Bool)

(declare-fun array_inv!21996 (array!58810) Bool)

(assert (=> start!82532 (and (array_inv!21996 _values!1386) e!541928)))

(assert (=> start!82532 tp!64864))

(declare-fun b!961251 () Bool)

(declare-fun res!643179 () Bool)

(assert (=> b!961251 (=> (not res!643179) (not e!541931))))

(assert (=> b!961251 (= res!643179 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28753 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28753 _keys!1668))))))

(declare-fun b!961252 () Bool)

(assert (=> b!961252 (= e!541928 (and e!541929 mapRes!33994))))

(declare-fun condMapEmpty!33994 () Bool)

(declare-fun mapDefault!33994 () ValueCell!10190)

(assert (=> b!961252 (= condMapEmpty!33994 (= (arr!28274 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10190)) mapDefault!33994)))))

(declare-fun mapIsEmpty!33994 () Bool)

(assert (=> mapIsEmpty!33994 mapRes!33994))

(assert (= (and start!82532 res!643183) b!961250))

(assert (= (and b!961250 res!643178) b!961244))

(assert (= (and b!961244 res!643182) b!961245))

(assert (= (and b!961245 res!643181) b!961251))

(assert (= (and b!961251 res!643179) b!961249))

(assert (= (and b!961249 res!643180) b!961246))

(assert (= (and b!961252 condMapEmpty!33994) mapIsEmpty!33994))

(assert (= (and b!961252 (not condMapEmpty!33994)) mapNonEmpty!33994))

(get-info :version)

(assert (= (and mapNonEmpty!33994 ((_ is ValueCellFull!10190) mapValue!33994)) b!961248))

(assert (= (and b!961252 ((_ is ValueCellFull!10190) mapDefault!33994)) b!961247))

(assert (= start!82532 b!961252))

(declare-fun m!891903 () Bool)

(assert (=> b!961246 m!891903))

(declare-fun m!891905 () Bool)

(assert (=> b!961246 m!891905))

(assert (=> b!961246 m!891903))

(assert (=> b!961246 m!891905))

(declare-fun m!891907 () Bool)

(assert (=> b!961246 m!891907))

(declare-fun m!891909 () Bool)

(assert (=> b!961244 m!891909))

(assert (=> b!961249 m!891905))

(assert (=> b!961249 m!891905))

(declare-fun m!891911 () Bool)

(assert (=> b!961249 m!891911))

(declare-fun m!891913 () Bool)

(assert (=> start!82532 m!891913))

(declare-fun m!891915 () Bool)

(assert (=> start!82532 m!891915))

(declare-fun m!891917 () Bool)

(assert (=> start!82532 m!891917))

(declare-fun m!891919 () Bool)

(assert (=> mapNonEmpty!33994 m!891919))

(declare-fun m!891921 () Bool)

(assert (=> b!961245 m!891921))

(check-sat (not mapNonEmpty!33994) b_and!30129 (not b_next!18631) (not start!82532) (not b!961249) (not b!961244) (not b!961245) tp_is_empty!21343 (not b!961246))
(check-sat b_and!30129 (not b_next!18631))
