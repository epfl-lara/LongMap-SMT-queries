; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82318 () Bool)

(assert start!82318)

(declare-fun b_free!18585 () Bool)

(declare-fun b_next!18585 () Bool)

(assert (=> start!82318 (= b_free!18585 (not b_next!18585))))

(declare-fun tp!64724 () Bool)

(declare-fun b_and!30073 () Bool)

(assert (=> start!82318 (= tp!64724 b_and!30073)))

(declare-fun b!959720 () Bool)

(declare-fun res!642424 () Bool)

(declare-fun e!541001 () Bool)

(assert (=> b!959720 (=> (not res!642424) (not e!541001))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58685 0))(
  ( (array!58686 (arr!28216 (Array (_ BitVec 32) (_ BitVec 64))) (size!28695 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58685)

(declare-datatypes ((V!33379 0))(
  ( (V!33380 (val!10699 Int)) )
))
(declare-datatypes ((ValueCell!10167 0))(
  ( (ValueCellFull!10167 (v!13256 V!33379)) (EmptyCell!10167) )
))
(declare-datatypes ((array!58687 0))(
  ( (array!58688 (arr!28217 (Array (_ BitVec 32) ValueCell!10167)) (size!28696 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58687)

(assert (=> b!959720 (= res!642424 (and (= (size!28696 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28695 _keys!1668) (size!28696 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959721 () Bool)

(declare-fun e!541003 () Bool)

(declare-fun tp_is_empty!21297 () Bool)

(assert (=> b!959721 (= e!541003 tp_is_empty!21297)))

(declare-fun b!959722 () Bool)

(declare-fun e!541004 () Bool)

(declare-fun e!541002 () Bool)

(declare-fun mapRes!33925 () Bool)

(assert (=> b!959722 (= e!541004 (and e!541002 mapRes!33925))))

(declare-fun condMapEmpty!33925 () Bool)

(declare-fun mapDefault!33925 () ValueCell!10167)

(assert (=> b!959722 (= condMapEmpty!33925 (= (arr!28217 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10167)) mapDefault!33925)))))

(declare-fun b!959723 () Bool)

(declare-fun res!642425 () Bool)

(assert (=> b!959723 (=> (not res!642425) (not e!541001))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959723 (= res!642425 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28695 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28695 _keys!1668))))))

(declare-fun mapNonEmpty!33925 () Bool)

(declare-fun tp!64725 () Bool)

(assert (=> mapNonEmpty!33925 (= mapRes!33925 (and tp!64725 e!541003))))

(declare-fun mapRest!33925 () (Array (_ BitVec 32) ValueCell!10167))

(declare-fun mapKey!33925 () (_ BitVec 32))

(declare-fun mapValue!33925 () ValueCell!10167)

(assert (=> mapNonEmpty!33925 (= (arr!28217 _values!1386) (store mapRest!33925 mapKey!33925 mapValue!33925))))

(declare-fun b!959724 () Bool)

(declare-fun res!642423 () Bool)

(assert (=> b!959724 (=> (not res!642423) (not e!541001))))

(declare-datatypes ((List!19619 0))(
  ( (Nil!19616) (Cons!19615 (h!20777 (_ BitVec 64)) (t!27982 List!19619)) )
))
(declare-fun arrayNoDuplicates!0 (array!58685 (_ BitVec 32) List!19619) Bool)

(assert (=> b!959724 (= res!642423 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19616))))

(declare-fun mapIsEmpty!33925 () Bool)

(assert (=> mapIsEmpty!33925 mapRes!33925))

(declare-fun b!959725 () Bool)

(declare-fun res!642422 () Bool)

(assert (=> b!959725 (=> (not res!642422) (not e!541001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959725 (= res!642422 (validKeyInArray!0 (select (arr!28216 _keys!1668) i!793)))))

(declare-fun res!642421 () Bool)

(assert (=> start!82318 (=> (not res!642421) (not e!541001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82318 (= res!642421 (validMask!0 mask!2088))))

(assert (=> start!82318 e!541001))

(assert (=> start!82318 true))

(assert (=> start!82318 tp_is_empty!21297))

(declare-fun array_inv!21869 (array!58685) Bool)

(assert (=> start!82318 (array_inv!21869 _keys!1668)))

(declare-fun array_inv!21870 (array!58687) Bool)

(assert (=> start!82318 (and (array_inv!21870 _values!1386) e!541004)))

(assert (=> start!82318 tp!64724))

(declare-fun b!959726 () Bool)

(assert (=> b!959726 (= e!541002 tp_is_empty!21297)))

(declare-fun b!959727 () Bool)

(assert (=> b!959727 (= e!541001 (bvslt i!793 #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!13800 0))(
  ( (tuple2!13801 (_1!6911 (_ BitVec 64)) (_2!6911 V!33379)) )
))
(declare-datatypes ((List!19620 0))(
  ( (Nil!19617) (Cons!19616 (h!20778 tuple2!13800) (t!27983 List!19620)) )
))
(declare-datatypes ((ListLongMap!12497 0))(
  ( (ListLongMap!12498 (toList!6264 List!19620)) )
))
(declare-fun lt!430569 () ListLongMap!12497)

(declare-fun minValue!1328 () V!33379)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33379)

(declare-fun getCurrentListMap!3497 (array!58685 array!58687 (_ BitVec 32) (_ BitVec 32) V!33379 V!33379 (_ BitVec 32) Int) ListLongMap!12497)

(assert (=> b!959727 (= lt!430569 (getCurrentListMap!3497 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389))))

(declare-fun b!959728 () Bool)

(declare-fun res!642420 () Bool)

(assert (=> b!959728 (=> (not res!642420) (not e!541001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58685 (_ BitVec 32)) Bool)

(assert (=> b!959728 (= res!642420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82318 res!642421) b!959720))

(assert (= (and b!959720 res!642424) b!959728))

(assert (= (and b!959728 res!642420) b!959724))

(assert (= (and b!959724 res!642423) b!959723))

(assert (= (and b!959723 res!642425) b!959725))

(assert (= (and b!959725 res!642422) b!959727))

(assert (= (and b!959722 condMapEmpty!33925) mapIsEmpty!33925))

(assert (= (and b!959722 (not condMapEmpty!33925)) mapNonEmpty!33925))

(get-info :version)

(assert (= (and mapNonEmpty!33925 ((_ is ValueCellFull!10167) mapValue!33925)) b!959721))

(assert (= (and b!959722 ((_ is ValueCellFull!10167) mapDefault!33925)) b!959726))

(assert (= start!82318 b!959722))

(declare-fun m!890153 () Bool)

(assert (=> b!959727 m!890153))

(declare-fun m!890155 () Bool)

(assert (=> b!959725 m!890155))

(assert (=> b!959725 m!890155))

(declare-fun m!890157 () Bool)

(assert (=> b!959725 m!890157))

(declare-fun m!890159 () Bool)

(assert (=> b!959724 m!890159))

(declare-fun m!890161 () Bool)

(assert (=> mapNonEmpty!33925 m!890161))

(declare-fun m!890163 () Bool)

(assert (=> b!959728 m!890163))

(declare-fun m!890165 () Bool)

(assert (=> start!82318 m!890165))

(declare-fun m!890167 () Bool)

(assert (=> start!82318 m!890167))

(declare-fun m!890169 () Bool)

(assert (=> start!82318 m!890169))

(check-sat tp_is_empty!21297 (not b!959724) (not mapNonEmpty!33925) (not b!959725) (not b_next!18585) (not b!959727) b_and!30073 (not b!959728) (not start!82318))
(check-sat b_and!30073 (not b_next!18585))
