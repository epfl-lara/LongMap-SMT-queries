; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82178 () Bool)

(assert start!82178)

(declare-fun b_free!18469 () Bool)

(declare-fun b_next!18469 () Bool)

(assert (=> start!82178 (= b_free!18469 (not b_next!18469))))

(declare-fun tp!64368 () Bool)

(declare-fun b_and!29931 () Bool)

(assert (=> start!82178 (= tp!64368 b_and!29931)))

(declare-fun mapNonEmpty!33742 () Bool)

(declare-fun mapRes!33742 () Bool)

(declare-fun tp!64369 () Bool)

(declare-fun e!539939 () Bool)

(assert (=> mapNonEmpty!33742 (= mapRes!33742 (and tp!64369 e!539939))))

(declare-datatypes ((V!33217 0))(
  ( (V!33218 (val!10638 Int)) )
))
(declare-datatypes ((ValueCell!10106 0))(
  ( (ValueCellFull!10106 (v!13194 V!33217)) (EmptyCell!10106) )
))
(declare-fun mapRest!33742 () (Array (_ BitVec 32) ValueCell!10106))

(declare-fun mapValue!33742 () ValueCell!10106)

(declare-fun mapKey!33742 () (_ BitVec 32))

(declare-datatypes ((array!58390 0))(
  ( (array!58391 (arr!28069 (Array (_ BitVec 32) ValueCell!10106)) (size!28550 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58390)

(assert (=> mapNonEmpty!33742 (= (arr!28069 _values!1386) (store mapRest!33742 mapKey!33742 mapValue!33742))))

(declare-fun b!957772 () Bool)

(declare-fun e!539941 () Bool)

(declare-fun tp_is_empty!21175 () Bool)

(assert (=> b!957772 (= e!539941 tp_is_empty!21175)))

(declare-fun b!957773 () Bool)

(declare-fun res!641150 () Bool)

(declare-fun e!539942 () Bool)

(assert (=> b!957773 (=> (not res!641150) (not e!539942))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58392 0))(
  ( (array!58393 (arr!28070 (Array (_ BitVec 32) (_ BitVec 64))) (size!28551 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58392)

(assert (=> b!957773 (= res!641150 (and (= (size!28550 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28551 _keys!1668) (size!28550 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957774 () Bool)

(declare-fun e!539940 () Bool)

(assert (=> b!957774 (= e!539940 (and e!539941 mapRes!33742))))

(declare-fun condMapEmpty!33742 () Bool)

(declare-fun mapDefault!33742 () ValueCell!10106)

(assert (=> b!957774 (= condMapEmpty!33742 (= (arr!28069 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10106)) mapDefault!33742)))))

(declare-fun mapIsEmpty!33742 () Bool)

(assert (=> mapIsEmpty!33742 mapRes!33742))

(declare-fun b!957775 () Bool)

(declare-fun res!641149 () Bool)

(assert (=> b!957775 (=> (not res!641149) (not e!539942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58392 (_ BitVec 32)) Bool)

(assert (=> b!957775 (= res!641149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957776 () Bool)

(declare-fun res!641152 () Bool)

(assert (=> b!957776 (=> (not res!641152) (not e!539942))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957776 (= res!641152 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28551 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28551 _keys!1668))))))

(declare-fun b!957777 () Bool)

(declare-fun res!641151 () Bool)

(assert (=> b!957777 (=> (not res!641151) (not e!539942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957777 (= res!641151 (validKeyInArray!0 (select (arr!28070 _keys!1668) i!793)))))

(declare-fun b!957771 () Bool)

(assert (=> b!957771 (= e!539942 false)))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33217)

(declare-fun minValue!1328 () V!33217)

(declare-fun lt!430159 () Bool)

(declare-datatypes ((tuple2!13762 0))(
  ( (tuple2!13763 (_1!6892 (_ BitVec 64)) (_2!6892 V!33217)) )
))
(declare-datatypes ((List!19548 0))(
  ( (Nil!19545) (Cons!19544 (h!20706 tuple2!13762) (t!27902 List!19548)) )
))
(declare-datatypes ((ListLongMap!12449 0))(
  ( (ListLongMap!12450 (toList!6240 List!19548)) )
))
(declare-fun contains!5286 (ListLongMap!12449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3402 (array!58392 array!58390 (_ BitVec 32) (_ BitVec 32) V!33217 V!33217 (_ BitVec 32) Int) ListLongMap!12449)

(assert (=> b!957771 (= lt!430159 (contains!5286 (getCurrentListMap!3402 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28070 _keys!1668) i!793)))))

(declare-fun res!641153 () Bool)

(assert (=> start!82178 (=> (not res!641153) (not e!539942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82178 (= res!641153 (validMask!0 mask!2088))))

(assert (=> start!82178 e!539942))

(assert (=> start!82178 true))

(assert (=> start!82178 tp_is_empty!21175))

(declare-fun array_inv!21831 (array!58392) Bool)

(assert (=> start!82178 (array_inv!21831 _keys!1668)))

(declare-fun array_inv!21832 (array!58390) Bool)

(assert (=> start!82178 (and (array_inv!21832 _values!1386) e!539940)))

(assert (=> start!82178 tp!64368))

(declare-fun b!957778 () Bool)

(declare-fun res!641154 () Bool)

(assert (=> b!957778 (=> (not res!641154) (not e!539942))))

(declare-datatypes ((List!19549 0))(
  ( (Nil!19546) (Cons!19545 (h!20707 (_ BitVec 64)) (t!27903 List!19549)) )
))
(declare-fun arrayNoDuplicates!0 (array!58392 (_ BitVec 32) List!19549) Bool)

(assert (=> b!957778 (= res!641154 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19546))))

(declare-fun b!957779 () Bool)

(assert (=> b!957779 (= e!539939 tp_is_empty!21175)))

(assert (= (and start!82178 res!641153) b!957773))

(assert (= (and b!957773 res!641150) b!957775))

(assert (= (and b!957775 res!641149) b!957778))

(assert (= (and b!957778 res!641154) b!957776))

(assert (= (and b!957776 res!641152) b!957777))

(assert (= (and b!957777 res!641151) b!957771))

(assert (= (and b!957774 condMapEmpty!33742) mapIsEmpty!33742))

(assert (= (and b!957774 (not condMapEmpty!33742)) mapNonEmpty!33742))

(get-info :version)

(assert (= (and mapNonEmpty!33742 ((_ is ValueCellFull!10106) mapValue!33742)) b!957779))

(assert (= (and b!957774 ((_ is ValueCellFull!10106) mapDefault!33742)) b!957772))

(assert (= start!82178 b!957774))

(declare-fun m!888039 () Bool)

(assert (=> b!957771 m!888039))

(declare-fun m!888041 () Bool)

(assert (=> b!957771 m!888041))

(assert (=> b!957771 m!888039))

(assert (=> b!957771 m!888041))

(declare-fun m!888043 () Bool)

(assert (=> b!957771 m!888043))

(declare-fun m!888045 () Bool)

(assert (=> mapNonEmpty!33742 m!888045))

(declare-fun m!888047 () Bool)

(assert (=> start!82178 m!888047))

(declare-fun m!888049 () Bool)

(assert (=> start!82178 m!888049))

(declare-fun m!888051 () Bool)

(assert (=> start!82178 m!888051))

(declare-fun m!888053 () Bool)

(assert (=> b!957778 m!888053))

(declare-fun m!888055 () Bool)

(assert (=> b!957775 m!888055))

(assert (=> b!957777 m!888041))

(assert (=> b!957777 m!888041))

(declare-fun m!888057 () Bool)

(assert (=> b!957777 m!888057))

(check-sat (not b!957775) (not b_next!18469) (not b!957777) tp_is_empty!21175 (not b!957778) b_and!29931 (not start!82178) (not mapNonEmpty!33742) (not b!957771))
(check-sat b_and!29931 (not b_next!18469))
