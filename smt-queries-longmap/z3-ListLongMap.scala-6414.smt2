; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82448 () Bool)

(assert start!82448)

(declare-fun b_free!18553 () Bool)

(declare-fun b_next!18553 () Bool)

(assert (=> start!82448 (= b_free!18553 (not b_next!18553))))

(declare-fun tp!64621 () Bool)

(declare-fun b_and!30051 () Bool)

(assert (=> start!82448 (= tp!64621 b_and!30051)))

(declare-fun b!960085 () Bool)

(declare-fun e!541299 () Bool)

(declare-fun e!541298 () Bool)

(declare-fun mapRes!33868 () Bool)

(assert (=> b!960085 (= e!541299 (and e!541298 mapRes!33868))))

(declare-fun condMapEmpty!33868 () Bool)

(declare-datatypes ((V!33329 0))(
  ( (V!33330 (val!10680 Int)) )
))
(declare-datatypes ((ValueCell!10148 0))(
  ( (ValueCellFull!10148 (v!13234 V!33329)) (EmptyCell!10148) )
))
(declare-datatypes ((array!58646 0))(
  ( (array!58647 (arr!28192 (Array (_ BitVec 32) ValueCell!10148)) (size!28672 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58646)

(declare-fun mapDefault!33868 () ValueCell!10148)

(assert (=> b!960085 (= condMapEmpty!33868 (= (arr!28192 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10148)) mapDefault!33868)))))

(declare-fun b!960086 () Bool)

(declare-fun tp_is_empty!21259 () Bool)

(assert (=> b!960086 (= e!541298 tp_is_empty!21259)))

(declare-fun res!642400 () Bool)

(declare-fun e!541300 () Bool)

(assert (=> start!82448 (=> (not res!642400) (not e!541300))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82448 (= res!642400 (validMask!0 mask!2088))))

(assert (=> start!82448 e!541300))

(assert (=> start!82448 true))

(assert (=> start!82448 tp_is_empty!21259))

(declare-datatypes ((array!58648 0))(
  ( (array!58649 (arr!28193 (Array (_ BitVec 32) (_ BitVec 64))) (size!28673 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58648)

(declare-fun array_inv!21935 (array!58648) Bool)

(assert (=> start!82448 (array_inv!21935 _keys!1668)))

(declare-fun array_inv!21936 (array!58646) Bool)

(assert (=> start!82448 (and (array_inv!21936 _values!1386) e!541299)))

(assert (=> start!82448 tp!64621))

(declare-fun b!960087 () Bool)

(declare-fun res!642399 () Bool)

(assert (=> b!960087 (=> (not res!642399) (not e!541300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58648 (_ BitVec 32)) Bool)

(assert (=> b!960087 (= res!642399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960088 () Bool)

(assert (=> b!960088 (= e!541300 (not true))))

(declare-fun minValue!1328 () V!33329)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33329)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13760 0))(
  ( (tuple2!13761 (_1!6891 (_ BitVec 64)) (_2!6891 V!33329)) )
))
(declare-datatypes ((List!19590 0))(
  ( (Nil!19587) (Cons!19586 (h!20754 tuple2!13760) (t!27945 List!19590)) )
))
(declare-datatypes ((ListLongMap!12459 0))(
  ( (ListLongMap!12460 (toList!6245 List!19590)) )
))
(declare-fun contains!5359 (ListLongMap!12459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3478 (array!58648 array!58646 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) Int) ListLongMap!12459)

(assert (=> b!960088 (contains!5359 (getCurrentListMap!3478 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28193 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32144 0))(
  ( (Unit!32145) )
))
(declare-fun lt!430882 () Unit!32144)

(declare-fun lemmaInListMapFromThenInFromSmaller!10 (array!58648 array!58646 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32144)

(assert (=> b!960088 (= lt!430882 (lemmaInListMapFromThenInFromSmaller!10 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960089 () Bool)

(declare-fun e!541302 () Bool)

(assert (=> b!960089 (= e!541302 tp_is_empty!21259)))

(declare-fun mapNonEmpty!33868 () Bool)

(declare-fun tp!64620 () Bool)

(assert (=> mapNonEmpty!33868 (= mapRes!33868 (and tp!64620 e!541302))))

(declare-fun mapKey!33868 () (_ BitVec 32))

(declare-fun mapRest!33868 () (Array (_ BitVec 32) ValueCell!10148))

(declare-fun mapValue!33868 () ValueCell!10148)

(assert (=> mapNonEmpty!33868 (= (arr!28192 _values!1386) (store mapRest!33868 mapKey!33868 mapValue!33868))))

(declare-fun b!960090 () Bool)

(declare-fun res!642403 () Bool)

(assert (=> b!960090 (=> (not res!642403) (not e!541300))))

(assert (=> b!960090 (= res!642403 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28673 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28673 _keys!1668))))))

(declare-fun b!960091 () Bool)

(declare-fun res!642401 () Bool)

(assert (=> b!960091 (=> (not res!642401) (not e!541300))))

(assert (=> b!960091 (= res!642401 (contains!5359 (getCurrentListMap!3478 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28193 _keys!1668) i!793)))))

(declare-fun b!960092 () Bool)

(declare-fun res!642398 () Bool)

(assert (=> b!960092 (=> (not res!642398) (not e!541300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960092 (= res!642398 (validKeyInArray!0 (select (arr!28193 _keys!1668) i!793)))))

(declare-fun b!960093 () Bool)

(declare-fun res!642397 () Bool)

(assert (=> b!960093 (=> (not res!642397) (not e!541300))))

(assert (=> b!960093 (= res!642397 (and (= (size!28672 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28673 _keys!1668) (size!28672 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960094 () Bool)

(declare-fun res!642402 () Bool)

(assert (=> b!960094 (=> (not res!642402) (not e!541300))))

(declare-datatypes ((List!19591 0))(
  ( (Nil!19588) (Cons!19587 (h!20755 (_ BitVec 64)) (t!27946 List!19591)) )
))
(declare-fun arrayNoDuplicates!0 (array!58648 (_ BitVec 32) List!19591) Bool)

(assert (=> b!960094 (= res!642402 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19588))))

(declare-fun mapIsEmpty!33868 () Bool)

(assert (=> mapIsEmpty!33868 mapRes!33868))

(assert (= (and start!82448 res!642400) b!960093))

(assert (= (and b!960093 res!642397) b!960087))

(assert (= (and b!960087 res!642399) b!960094))

(assert (= (and b!960094 res!642402) b!960090))

(assert (= (and b!960090 res!642403) b!960092))

(assert (= (and b!960092 res!642398) b!960091))

(assert (= (and b!960091 res!642401) b!960088))

(assert (= (and b!960085 condMapEmpty!33868) mapIsEmpty!33868))

(assert (= (and b!960085 (not condMapEmpty!33868)) mapNonEmpty!33868))

(get-info :version)

(assert (= (and mapNonEmpty!33868 ((_ is ValueCellFull!10148) mapValue!33868)) b!960089))

(assert (= (and b!960085 ((_ is ValueCellFull!10148) mapDefault!33868)) b!960086))

(assert (= start!82448 b!960085))

(declare-fun m!891003 () Bool)

(assert (=> start!82448 m!891003))

(declare-fun m!891005 () Bool)

(assert (=> start!82448 m!891005))

(declare-fun m!891007 () Bool)

(assert (=> start!82448 m!891007))

(declare-fun m!891009 () Bool)

(assert (=> b!960094 m!891009))

(declare-fun m!891011 () Bool)

(assert (=> b!960091 m!891011))

(declare-fun m!891013 () Bool)

(assert (=> b!960091 m!891013))

(assert (=> b!960091 m!891011))

(assert (=> b!960091 m!891013))

(declare-fun m!891015 () Bool)

(assert (=> b!960091 m!891015))

(assert (=> b!960092 m!891013))

(assert (=> b!960092 m!891013))

(declare-fun m!891017 () Bool)

(assert (=> b!960092 m!891017))

(declare-fun m!891019 () Bool)

(assert (=> mapNonEmpty!33868 m!891019))

(declare-fun m!891021 () Bool)

(assert (=> b!960087 m!891021))

(declare-fun m!891023 () Bool)

(assert (=> b!960088 m!891023))

(assert (=> b!960088 m!891013))

(assert (=> b!960088 m!891023))

(assert (=> b!960088 m!891013))

(declare-fun m!891025 () Bool)

(assert (=> b!960088 m!891025))

(declare-fun m!891027 () Bool)

(assert (=> b!960088 m!891027))

(check-sat tp_is_empty!21259 b_and!30051 (not mapNonEmpty!33868) (not start!82448) (not b!960094) (not b!960088) (not b!960087) (not b!960091) (not b!960092) (not b_next!18553))
(check-sat b_and!30051 (not b_next!18553))
