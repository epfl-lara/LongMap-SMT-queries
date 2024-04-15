; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82376 () Bool)

(assert start!82376)

(declare-fun b_free!18661 () Bool)

(declare-fun b_next!18661 () Bool)

(assert (=> start!82376 (= b_free!18661 (not b_next!18661))))

(declare-fun tp!64954 () Bool)

(declare-fun b_and!30123 () Bool)

(assert (=> start!82376 (= tp!64954 b_and!30123)))

(declare-fun b!960509 () Bool)

(declare-fun res!642998 () Bool)

(declare-fun e!541427 () Bool)

(assert (=> b!960509 (=> (not res!642998) (not e!541427))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58772 0))(
  ( (array!58773 (arr!28260 (Array (_ BitVec 32) (_ BitVec 64))) (size!28741 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58772)

(declare-datatypes ((V!33481 0))(
  ( (V!33482 (val!10737 Int)) )
))
(declare-datatypes ((ValueCell!10205 0))(
  ( (ValueCellFull!10205 (v!13293 V!33481)) (EmptyCell!10205) )
))
(declare-datatypes ((array!58774 0))(
  ( (array!58775 (arr!28261 (Array (_ BitVec 32) ValueCell!10205)) (size!28742 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58774)

(assert (=> b!960509 (= res!642998 (and (= (size!28742 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28741 _keys!1668) (size!28742 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960510 () Bool)

(declare-fun res!642999 () Bool)

(assert (=> b!960510 (=> (not res!642999) (not e!541427))))

(declare-datatypes ((List!19687 0))(
  ( (Nil!19684) (Cons!19683 (h!20845 (_ BitVec 64)) (t!28041 List!19687)) )
))
(declare-fun arrayNoDuplicates!0 (array!58772 (_ BitVec 32) List!19687) Bool)

(assert (=> b!960510 (= res!642999 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19684))))

(declare-fun b!960511 () Bool)

(declare-fun res!642997 () Bool)

(assert (=> b!960511 (=> (not res!642997) (not e!541427))))

(declare-fun minValue!1328 () V!33481)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33481)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13902 0))(
  ( (tuple2!13903 (_1!6962 (_ BitVec 64)) (_2!6962 V!33481)) )
))
(declare-datatypes ((List!19688 0))(
  ( (Nil!19685) (Cons!19684 (h!20846 tuple2!13902) (t!28042 List!19688)) )
))
(declare-datatypes ((ListLongMap!12589 0))(
  ( (ListLongMap!12590 (toList!6310 List!19688)) )
))
(declare-fun contains!5353 (ListLongMap!12589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3472 (array!58772 array!58774 (_ BitVec 32) (_ BitVec 32) V!33481 V!33481 (_ BitVec 32) Int) ListLongMap!12589)

(assert (=> b!960511 (= res!642997 (contains!5353 (getCurrentListMap!3472 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28260 _keys!1668) i!793)))))

(declare-fun b!960512 () Bool)

(declare-fun res!642996 () Bool)

(assert (=> b!960512 (=> (not res!642996) (not e!541427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960512 (= res!642996 (validKeyInArray!0 (select (arr!28260 _keys!1668) i!793)))))

(declare-fun b!960513 () Bool)

(declare-fun res!643001 () Bool)

(assert (=> b!960513 (=> (not res!643001) (not e!541427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58772 (_ BitVec 32)) Bool)

(assert (=> b!960513 (= res!643001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!34039 () Bool)

(declare-fun mapRes!34039 () Bool)

(declare-fun tp!64953 () Bool)

(declare-fun e!541423 () Bool)

(assert (=> mapNonEmpty!34039 (= mapRes!34039 (and tp!64953 e!541423))))

(declare-fun mapKey!34039 () (_ BitVec 32))

(declare-fun mapValue!34039 () ValueCell!10205)

(declare-fun mapRest!34039 () (Array (_ BitVec 32) ValueCell!10205))

(assert (=> mapNonEmpty!34039 (= (arr!28261 _values!1386) (store mapRest!34039 mapKey!34039 mapValue!34039))))

(declare-fun b!960514 () Bool)

(declare-fun e!541425 () Bool)

(declare-fun e!541426 () Bool)

(assert (=> b!960514 (= e!541425 (and e!541426 mapRes!34039))))

(declare-fun condMapEmpty!34039 () Bool)

(declare-fun mapDefault!34039 () ValueCell!10205)

(assert (=> b!960514 (= condMapEmpty!34039 (= (arr!28261 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10205)) mapDefault!34039)))))

(declare-fun b!960515 () Bool)

(declare-fun res!643002 () Bool)

(assert (=> b!960515 (=> (not res!643002) (not e!541427))))

(assert (=> b!960515 (= res!643002 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28741 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28741 _keys!1668))))))

(declare-fun b!960516 () Bool)

(declare-fun tp_is_empty!21373 () Bool)

(assert (=> b!960516 (= e!541423 tp_is_empty!21373)))

(declare-fun mapIsEmpty!34039 () Bool)

(assert (=> mapIsEmpty!34039 mapRes!34039))

(declare-fun res!643000 () Bool)

(assert (=> start!82376 (=> (not res!643000) (not e!541427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82376 (= res!643000 (validMask!0 mask!2088))))

(assert (=> start!82376 e!541427))

(assert (=> start!82376 true))

(assert (=> start!82376 tp_is_empty!21373))

(declare-fun array_inv!21957 (array!58772) Bool)

(assert (=> start!82376 (array_inv!21957 _keys!1668)))

(declare-fun array_inv!21958 (array!58774) Bool)

(assert (=> start!82376 (and (array_inv!21958 _values!1386) e!541425)))

(assert (=> start!82376 tp!64954))

(declare-fun b!960517 () Bool)

(assert (=> b!960517 (= e!541427 (not (bvsge i!793 #b00000000000000000000000000000000)))))

(assert (=> b!960517 (contains!5353 (getCurrentListMap!3472 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28260 _keys!1668) i!793))))

(declare-datatypes ((Unit!32056 0))(
  ( (Unit!32057) )
))
(declare-fun lt!430447 () Unit!32056)

(declare-fun lemmaInListMapFromThenInFromSmaller!19 (array!58772 array!58774 (_ BitVec 32) (_ BitVec 32) V!33481 V!33481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32056)

(assert (=> b!960517 (= lt!430447 (lemmaInListMapFromThenInFromSmaller!19 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960518 () Bool)

(assert (=> b!960518 (= e!541426 tp_is_empty!21373)))

(assert (= (and start!82376 res!643000) b!960509))

(assert (= (and b!960509 res!642998) b!960513))

(assert (= (and b!960513 res!643001) b!960510))

(assert (= (and b!960510 res!642999) b!960515))

(assert (= (and b!960515 res!643002) b!960512))

(assert (= (and b!960512 res!642996) b!960511))

(assert (= (and b!960511 res!642997) b!960517))

(assert (= (and b!960514 condMapEmpty!34039) mapIsEmpty!34039))

(assert (= (and b!960514 (not condMapEmpty!34039)) mapNonEmpty!34039))

(get-info :version)

(assert (= (and mapNonEmpty!34039 ((_ is ValueCellFull!10205) mapValue!34039)) b!960516))

(assert (= (and b!960514 ((_ is ValueCellFull!10205) mapDefault!34039)) b!960518))

(assert (= start!82376 b!960514))

(declare-fun m!890151 () Bool)

(assert (=> b!960512 m!890151))

(assert (=> b!960512 m!890151))

(declare-fun m!890153 () Bool)

(assert (=> b!960512 m!890153))

(declare-fun m!890155 () Bool)

(assert (=> b!960517 m!890155))

(assert (=> b!960517 m!890151))

(assert (=> b!960517 m!890155))

(assert (=> b!960517 m!890151))

(declare-fun m!890157 () Bool)

(assert (=> b!960517 m!890157))

(declare-fun m!890159 () Bool)

(assert (=> b!960517 m!890159))

(declare-fun m!890161 () Bool)

(assert (=> b!960511 m!890161))

(assert (=> b!960511 m!890151))

(assert (=> b!960511 m!890161))

(assert (=> b!960511 m!890151))

(declare-fun m!890163 () Bool)

(assert (=> b!960511 m!890163))

(declare-fun m!890165 () Bool)

(assert (=> b!960513 m!890165))

(declare-fun m!890167 () Bool)

(assert (=> start!82376 m!890167))

(declare-fun m!890169 () Bool)

(assert (=> start!82376 m!890169))

(declare-fun m!890171 () Bool)

(assert (=> start!82376 m!890171))

(declare-fun m!890173 () Bool)

(assert (=> mapNonEmpty!34039 m!890173))

(declare-fun m!890175 () Bool)

(assert (=> b!960510 m!890175))

(check-sat (not b!960512) tp_is_empty!21373 b_and!30123 (not b!960513) (not b!960511) (not start!82376) (not mapNonEmpty!34039) (not b!960517) (not b!960510) (not b_next!18661))
(check-sat b_and!30123 (not b_next!18661))
