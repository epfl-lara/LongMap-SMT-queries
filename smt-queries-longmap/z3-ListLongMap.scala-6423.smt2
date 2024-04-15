; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82316 () Bool)

(assert start!82316)

(declare-fun b_free!18601 () Bool)

(declare-fun b_next!18601 () Bool)

(assert (=> start!82316 (= b_free!18601 (not b_next!18601))))

(declare-fun tp!64774 () Bool)

(declare-fun b_and!30063 () Bool)

(assert (=> start!82316 (= tp!64774 b_and!30063)))

(declare-fun b!959697 () Bool)

(declare-fun res!642456 () Bool)

(declare-fun e!540973 () Bool)

(assert (=> b!959697 (=> (not res!642456) (not e!540973))))

(declare-datatypes ((array!58654 0))(
  ( (array!58655 (arr!28201 (Array (_ BitVec 32) (_ BitVec 64))) (size!28682 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58654)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959697 (= res!642456 (validKeyInArray!0 (select (arr!28201 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33949 () Bool)

(declare-fun mapRes!33949 () Bool)

(declare-fun tp!64773 () Bool)

(declare-fun e!540975 () Bool)

(assert (=> mapNonEmpty!33949 (= mapRes!33949 (and tp!64773 e!540975))))

(declare-datatypes ((V!33401 0))(
  ( (V!33402 (val!10707 Int)) )
))
(declare-datatypes ((ValueCell!10175 0))(
  ( (ValueCellFull!10175 (v!13263 V!33401)) (EmptyCell!10175) )
))
(declare-fun mapValue!33949 () ValueCell!10175)

(declare-fun mapKey!33949 () (_ BitVec 32))

(declare-datatypes ((array!58656 0))(
  ( (array!58657 (arr!28202 (Array (_ BitVec 32) ValueCell!10175)) (size!28683 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58656)

(declare-fun mapRest!33949 () (Array (_ BitVec 32) ValueCell!10175))

(assert (=> mapNonEmpty!33949 (= (arr!28202 _values!1386) (store mapRest!33949 mapKey!33949 mapValue!33949))))

(declare-fun b!959698 () Bool)

(declare-fun res!642455 () Bool)

(assert (=> b!959698 (=> (not res!642455) (not e!540973))))

(declare-datatypes ((List!19644 0))(
  ( (Nil!19641) (Cons!19640 (h!20802 (_ BitVec 64)) (t!27998 List!19644)) )
))
(declare-fun arrayNoDuplicates!0 (array!58654 (_ BitVec 32) List!19644) Bool)

(assert (=> b!959698 (= res!642455 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19641))))

(declare-fun b!959699 () Bool)

(declare-fun res!642459 () Bool)

(assert (=> b!959699 (=> (not res!642459) (not e!540973))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58654 (_ BitVec 32)) Bool)

(assert (=> b!959699 (= res!642459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959700 () Bool)

(declare-fun res!642454 () Bool)

(assert (=> b!959700 (=> (not res!642454) (not e!540973))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959700 (= res!642454 (and (= (size!28683 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28682 _keys!1668) (size!28683 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959701 () Bool)

(declare-fun tp_is_empty!21313 () Bool)

(assert (=> b!959701 (= e!540975 tp_is_empty!21313)))

(declare-fun res!642458 () Bool)

(assert (=> start!82316 (=> (not res!642458) (not e!540973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82316 (= res!642458 (validMask!0 mask!2088))))

(assert (=> start!82316 e!540973))

(assert (=> start!82316 true))

(assert (=> start!82316 tp_is_empty!21313))

(declare-fun array_inv!21919 (array!58654) Bool)

(assert (=> start!82316 (array_inv!21919 _keys!1668)))

(declare-fun e!540976 () Bool)

(declare-fun array_inv!21920 (array!58656) Bool)

(assert (=> start!82316 (and (array_inv!21920 _values!1386) e!540976)))

(assert (=> start!82316 tp!64774))

(declare-fun b!959702 () Bool)

(assert (=> b!959702 (= e!540973 false)))

(declare-fun minValue!1328 () V!33401)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33401)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430357 () Bool)

(declare-datatypes ((tuple2!13860 0))(
  ( (tuple2!13861 (_1!6941 (_ BitVec 64)) (_2!6941 V!33401)) )
))
(declare-datatypes ((List!19645 0))(
  ( (Nil!19642) (Cons!19641 (h!20803 tuple2!13860) (t!27999 List!19645)) )
))
(declare-datatypes ((ListLongMap!12547 0))(
  ( (ListLongMap!12548 (toList!6289 List!19645)) )
))
(declare-fun contains!5332 (ListLongMap!12547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3451 (array!58654 array!58656 (_ BitVec 32) (_ BitVec 32) V!33401 V!33401 (_ BitVec 32) Int) ListLongMap!12547)

(assert (=> b!959702 (= lt!430357 (contains!5332 (getCurrentListMap!3451 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28201 _keys!1668) i!793)))))

(declare-fun b!959703 () Bool)

(declare-fun e!540977 () Bool)

(assert (=> b!959703 (= e!540976 (and e!540977 mapRes!33949))))

(declare-fun condMapEmpty!33949 () Bool)

(declare-fun mapDefault!33949 () ValueCell!10175)

(assert (=> b!959703 (= condMapEmpty!33949 (= (arr!28202 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10175)) mapDefault!33949)))))

(declare-fun mapIsEmpty!33949 () Bool)

(assert (=> mapIsEmpty!33949 mapRes!33949))

(declare-fun b!959704 () Bool)

(declare-fun res!642457 () Bool)

(assert (=> b!959704 (=> (not res!642457) (not e!540973))))

(assert (=> b!959704 (= res!642457 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28682 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28682 _keys!1668))))))

(declare-fun b!959705 () Bool)

(assert (=> b!959705 (= e!540977 tp_is_empty!21313)))

(assert (= (and start!82316 res!642458) b!959700))

(assert (= (and b!959700 res!642454) b!959699))

(assert (= (and b!959699 res!642459) b!959698))

(assert (= (and b!959698 res!642455) b!959704))

(assert (= (and b!959704 res!642457) b!959697))

(assert (= (and b!959697 res!642456) b!959702))

(assert (= (and b!959703 condMapEmpty!33949) mapIsEmpty!33949))

(assert (= (and b!959703 (not condMapEmpty!33949)) mapNonEmpty!33949))

(get-info :version)

(assert (= (and mapNonEmpty!33949 ((_ is ValueCellFull!10175) mapValue!33949)) b!959701))

(assert (= (and b!959703 ((_ is ValueCellFull!10175) mapDefault!33949)) b!959705))

(assert (= start!82316 b!959703))

(declare-fun m!889551 () Bool)

(assert (=> b!959699 m!889551))

(declare-fun m!889553 () Bool)

(assert (=> start!82316 m!889553))

(declare-fun m!889555 () Bool)

(assert (=> start!82316 m!889555))

(declare-fun m!889557 () Bool)

(assert (=> start!82316 m!889557))

(declare-fun m!889559 () Bool)

(assert (=> b!959698 m!889559))

(declare-fun m!889561 () Bool)

(assert (=> mapNonEmpty!33949 m!889561))

(declare-fun m!889563 () Bool)

(assert (=> b!959702 m!889563))

(declare-fun m!889565 () Bool)

(assert (=> b!959702 m!889565))

(assert (=> b!959702 m!889563))

(assert (=> b!959702 m!889565))

(declare-fun m!889567 () Bool)

(assert (=> b!959702 m!889567))

(assert (=> b!959697 m!889565))

(assert (=> b!959697 m!889565))

(declare-fun m!889569 () Bool)

(assert (=> b!959697 m!889569))

(check-sat (not mapNonEmpty!33949) (not b!959699) (not b!959697) b_and!30063 (not b!959702) (not b_next!18601) (not b!959698) (not start!82316) tp_is_empty!21313)
(check-sat b_and!30063 (not b_next!18601))
