; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81940 () Bool)

(assert start!81940)

(declare-fun b_free!18435 () Bool)

(declare-fun b_next!18435 () Bool)

(assert (=> start!81940 (= b_free!18435 (not b_next!18435))))

(declare-fun tp!64005 () Bool)

(declare-fun b_and!29921 () Bool)

(assert (=> start!81940 (= tp!64005 b_and!29921)))

(declare-fun b!955827 () Bool)

(declare-fun res!640092 () Bool)

(declare-fun e!538453 () Bool)

(assert (=> b!955827 (=> (not res!640092) (not e!538453))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58061 0))(
  ( (array!58062 (arr!27910 (Array (_ BitVec 32) (_ BitVec 64))) (size!28389 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58061)

(assert (=> b!955827 (= res!640092 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28389 _keys!1441))))))

(declare-fun b!955828 () Bool)

(declare-fun res!640086 () Bool)

(assert (=> b!955828 (=> (not res!640086) (not e!538453))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58061 (_ BitVec 32)) Bool)

(assert (=> b!955828 (= res!640086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33430 () Bool)

(declare-fun mapRes!33430 () Bool)

(declare-fun tp!64004 () Bool)

(declare-fun e!538450 () Bool)

(assert (=> mapNonEmpty!33430 (= mapRes!33430 (and tp!64004 e!538450))))

(declare-fun mapKey!33430 () (_ BitVec 32))

(declare-datatypes ((V!32955 0))(
  ( (V!32956 (val!10540 Int)) )
))
(declare-datatypes ((ValueCell!10008 0))(
  ( (ValueCellFull!10008 (v!13095 V!32955)) (EmptyCell!10008) )
))
(declare-fun mapRest!33430 () (Array (_ BitVec 32) ValueCell!10008))

(declare-datatypes ((array!58063 0))(
  ( (array!58064 (arr!27911 (Array (_ BitVec 32) ValueCell!10008)) (size!28390 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58063)

(declare-fun mapValue!33430 () ValueCell!10008)

(assert (=> mapNonEmpty!33430 (= (arr!27911 _values!1197) (store mapRest!33430 mapKey!33430 mapValue!33430))))

(declare-fun b!955829 () Bool)

(declare-fun e!538449 () Bool)

(declare-fun tp_is_empty!20979 () Bool)

(assert (=> b!955829 (= e!538449 tp_is_empty!20979)))

(declare-fun res!640089 () Bool)

(assert (=> start!81940 (=> (not res!640089) (not e!538453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81940 (= res!640089 (validMask!0 mask!1823))))

(assert (=> start!81940 e!538453))

(assert (=> start!81940 true))

(assert (=> start!81940 tp_is_empty!20979))

(declare-fun array_inv!21657 (array!58061) Bool)

(assert (=> start!81940 (array_inv!21657 _keys!1441)))

(declare-fun e!538451 () Bool)

(declare-fun array_inv!21658 (array!58063) Bool)

(assert (=> start!81940 (and (array_inv!21658 _values!1197) e!538451)))

(assert (=> start!81940 tp!64005))

(declare-fun b!955830 () Bool)

(declare-fun res!640091 () Bool)

(assert (=> b!955830 (=> (not res!640091) (not e!538453))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32955)

(declare-fun minValue!1139 () V!32955)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13682 0))(
  ( (tuple2!13683 (_1!6852 (_ BitVec 64)) (_2!6852 V!32955)) )
))
(declare-datatypes ((List!19455 0))(
  ( (Nil!19452) (Cons!19451 (h!20613 tuple2!13682) (t!27816 List!19455)) )
))
(declare-datatypes ((ListLongMap!12379 0))(
  ( (ListLongMap!12380 (toList!6205 List!19455)) )
))
(declare-fun contains!5303 (ListLongMap!12379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3438 (array!58061 array!58063 (_ BitVec 32) (_ BitVec 32) V!32955 V!32955 (_ BitVec 32) Int) ListLongMap!12379)

(assert (=> b!955830 (= res!640091 (contains!5303 (getCurrentListMap!3438 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27910 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33430 () Bool)

(assert (=> mapIsEmpty!33430 mapRes!33430))

(declare-fun b!955831 () Bool)

(assert (=> b!955831 (= e!538450 tp_is_empty!20979)))

(declare-fun b!955832 () Bool)

(declare-fun res!640088 () Bool)

(assert (=> b!955832 (=> (not res!640088) (not e!538453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955832 (= res!640088 (validKeyInArray!0 (select (arr!27910 _keys!1441) i!735)))))

(declare-fun b!955833 () Bool)

(declare-fun res!640087 () Bool)

(assert (=> b!955833 (=> (not res!640087) (not e!538453))))

(declare-datatypes ((List!19456 0))(
  ( (Nil!19453) (Cons!19452 (h!20614 (_ BitVec 64)) (t!27817 List!19456)) )
))
(declare-fun arrayNoDuplicates!0 (array!58061 (_ BitVec 32) List!19456) Bool)

(assert (=> b!955833 (= res!640087 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19453))))

(declare-fun b!955834 () Bool)

(assert (=> b!955834 (= e!538451 (and e!538449 mapRes!33430))))

(declare-fun condMapEmpty!33430 () Bool)

(declare-fun mapDefault!33430 () ValueCell!10008)

(assert (=> b!955834 (= condMapEmpty!33430 (= (arr!27911 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10008)) mapDefault!33430)))))

(declare-fun b!955835 () Bool)

(declare-fun res!640090 () Bool)

(assert (=> b!955835 (=> (not res!640090) (not e!538453))))

(assert (=> b!955835 (= res!640090 (and (= (size!28390 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28389 _keys!1441) (size!28390 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955836 () Bool)

(assert (=> b!955836 (= e!538453 (not (bvsle #b00000000000000000000000000000000 (size!28389 _keys!1441))))))

(assert (=> b!955836 (contains!5303 (getCurrentListMap!3438 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27910 _keys!1441) i!735))))

(declare-datatypes ((Unit!32131 0))(
  ( (Unit!32132) )
))
(declare-fun lt!430046 () Unit!32131)

(declare-fun lemmaInListMapFromThenFromZero!20 (array!58061 array!58063 (_ BitVec 32) (_ BitVec 32) V!32955 V!32955 (_ BitVec 32) (_ BitVec 32) Int) Unit!32131)

(assert (=> b!955836 (= lt!430046 (lemmaInListMapFromThenFromZero!20 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(assert (= (and start!81940 res!640089) b!955835))

(assert (= (and b!955835 res!640090) b!955828))

(assert (= (and b!955828 res!640086) b!955833))

(assert (= (and b!955833 res!640087) b!955827))

(assert (= (and b!955827 res!640092) b!955832))

(assert (= (and b!955832 res!640088) b!955830))

(assert (= (and b!955830 res!640091) b!955836))

(assert (= (and b!955834 condMapEmpty!33430) mapIsEmpty!33430))

(assert (= (and b!955834 (not condMapEmpty!33430)) mapNonEmpty!33430))

(get-info :version)

(assert (= (and mapNonEmpty!33430 ((_ is ValueCellFull!10008) mapValue!33430)) b!955831))

(assert (= (and b!955834 ((_ is ValueCellFull!10008) mapDefault!33430)) b!955829))

(assert (= start!81940 b!955834))

(declare-fun m!887293 () Bool)

(assert (=> b!955828 m!887293))

(declare-fun m!887295 () Bool)

(assert (=> mapNonEmpty!33430 m!887295))

(declare-fun m!887297 () Bool)

(assert (=> b!955832 m!887297))

(assert (=> b!955832 m!887297))

(declare-fun m!887299 () Bool)

(assert (=> b!955832 m!887299))

(declare-fun m!887301 () Bool)

(assert (=> b!955830 m!887301))

(assert (=> b!955830 m!887297))

(assert (=> b!955830 m!887301))

(assert (=> b!955830 m!887297))

(declare-fun m!887303 () Bool)

(assert (=> b!955830 m!887303))

(declare-fun m!887305 () Bool)

(assert (=> b!955833 m!887305))

(declare-fun m!887307 () Bool)

(assert (=> start!81940 m!887307))

(declare-fun m!887309 () Bool)

(assert (=> start!81940 m!887309))

(declare-fun m!887311 () Bool)

(assert (=> start!81940 m!887311))

(declare-fun m!887313 () Bool)

(assert (=> b!955836 m!887313))

(assert (=> b!955836 m!887297))

(assert (=> b!955836 m!887313))

(assert (=> b!955836 m!887297))

(declare-fun m!887315 () Bool)

(assert (=> b!955836 m!887315))

(declare-fun m!887317 () Bool)

(assert (=> b!955836 m!887317))

(check-sat (not mapNonEmpty!33430) (not b_next!18435) (not b!955833) (not b!955828) b_and!29921 (not start!81940) tp_is_empty!20979 (not b!955830) (not b!955832) (not b!955836))
(check-sat b_and!29921 (not b_next!18435))
