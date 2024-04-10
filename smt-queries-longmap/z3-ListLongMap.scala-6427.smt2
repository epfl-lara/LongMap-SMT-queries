; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82360 () Bool)

(assert start!82360)

(declare-fun b_free!18627 () Bool)

(declare-fun b_next!18627 () Bool)

(assert (=> start!82360 (= b_free!18627 (not b_next!18627))))

(declare-fun tp!64850 () Bool)

(declare-fun b_and!30115 () Bool)

(assert (=> start!82360 (= tp!64850 b_and!30115)))

(declare-fun b!960287 () Bool)

(declare-fun e!541318 () Bool)

(declare-fun tp_is_empty!21339 () Bool)

(assert (=> b!960287 (= e!541318 tp_is_empty!21339)))

(declare-fun b!960288 () Bool)

(declare-fun e!541316 () Bool)

(declare-fun mapRes!33988 () Bool)

(assert (=> b!960288 (= e!541316 (and e!541318 mapRes!33988))))

(declare-fun condMapEmpty!33988 () Bool)

(declare-datatypes ((V!33435 0))(
  ( (V!33436 (val!10720 Int)) )
))
(declare-datatypes ((ValueCell!10188 0))(
  ( (ValueCellFull!10188 (v!13277 V!33435)) (EmptyCell!10188) )
))
(declare-datatypes ((array!58769 0))(
  ( (array!58770 (arr!28258 (Array (_ BitVec 32) ValueCell!10188)) (size!28737 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58769)

(declare-fun mapDefault!33988 () ValueCell!10188)

(assert (=> b!960288 (= condMapEmpty!33988 (= (arr!28258 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10188)) mapDefault!33988)))))

(declare-fun b!960289 () Bool)

(declare-fun res!642803 () Bool)

(declare-fun e!541317 () Bool)

(assert (=> b!960289 (=> (not res!642803) (not e!541317))))

(declare-datatypes ((array!58771 0))(
  ( (array!58772 (arr!28259 (Array (_ BitVec 32) (_ BitVec 64))) (size!28738 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58771)

(declare-datatypes ((List!19652 0))(
  ( (Nil!19649) (Cons!19648 (h!20810 (_ BitVec 64)) (t!28015 List!19652)) )
))
(declare-fun arrayNoDuplicates!0 (array!58771 (_ BitVec 32) List!19652) Bool)

(assert (=> b!960289 (= res!642803 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19649))))

(declare-fun b!960290 () Bool)

(declare-fun res!642799 () Bool)

(assert (=> b!960290 (=> (not res!642799) (not e!541317))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960290 (= res!642799 (and (= (size!28737 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28738 _keys!1668) (size!28737 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960291 () Bool)

(declare-fun res!642798 () Bool)

(assert (=> b!960291 (=> (not res!642798) (not e!541317))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960291 (= res!642798 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28738 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28738 _keys!1668))))))

(declare-fun res!642800 () Bool)

(assert (=> start!82360 (=> (not res!642800) (not e!541317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82360 (= res!642800 (validMask!0 mask!2088))))

(assert (=> start!82360 e!541317))

(assert (=> start!82360 true))

(assert (=> start!82360 tp_is_empty!21339))

(declare-fun array_inv!21897 (array!58771) Bool)

(assert (=> start!82360 (array_inv!21897 _keys!1668)))

(declare-fun array_inv!21898 (array!58769) Bool)

(assert (=> start!82360 (and (array_inv!21898 _values!1386) e!541316)))

(assert (=> start!82360 tp!64850))

(declare-fun b!960292 () Bool)

(declare-fun res!642802 () Bool)

(assert (=> b!960292 (=> (not res!642802) (not e!541317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960292 (= res!642802 (validKeyInArray!0 (select (arr!28259 _keys!1668) i!793)))))

(declare-fun b!960293 () Bool)

(assert (=> b!960293 (= e!541317 false)))

(declare-fun lt!430632 () Bool)

(declare-fun minValue!1328 () V!33435)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33435)

(declare-datatypes ((tuple2!13832 0))(
  ( (tuple2!13833 (_1!6927 (_ BitVec 64)) (_2!6927 V!33435)) )
))
(declare-datatypes ((List!19653 0))(
  ( (Nil!19650) (Cons!19649 (h!20811 tuple2!13832) (t!28016 List!19653)) )
))
(declare-datatypes ((ListLongMap!12529 0))(
  ( (ListLongMap!12530 (toList!6280 List!19653)) )
))
(declare-fun contains!5379 (ListLongMap!12529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3513 (array!58771 array!58769 (_ BitVec 32) (_ BitVec 32) V!33435 V!33435 (_ BitVec 32) Int) ListLongMap!12529)

(assert (=> b!960293 (= lt!430632 (contains!5379 (getCurrentListMap!3513 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28259 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33988 () Bool)

(assert (=> mapIsEmpty!33988 mapRes!33988))

(declare-fun mapNonEmpty!33988 () Bool)

(declare-fun tp!64851 () Bool)

(declare-fun e!541320 () Bool)

(assert (=> mapNonEmpty!33988 (= mapRes!33988 (and tp!64851 e!541320))))

(declare-fun mapRest!33988 () (Array (_ BitVec 32) ValueCell!10188))

(declare-fun mapValue!33988 () ValueCell!10188)

(declare-fun mapKey!33988 () (_ BitVec 32))

(assert (=> mapNonEmpty!33988 (= (arr!28258 _values!1386) (store mapRest!33988 mapKey!33988 mapValue!33988))))

(declare-fun b!960294 () Bool)

(declare-fun res!642801 () Bool)

(assert (=> b!960294 (=> (not res!642801) (not e!541317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58771 (_ BitVec 32)) Bool)

(assert (=> b!960294 (= res!642801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960295 () Bool)

(assert (=> b!960295 (= e!541320 tp_is_empty!21339)))

(assert (= (and start!82360 res!642800) b!960290))

(assert (= (and b!960290 res!642799) b!960294))

(assert (= (and b!960294 res!642801) b!960289))

(assert (= (and b!960289 res!642803) b!960291))

(assert (= (and b!960291 res!642798) b!960292))

(assert (= (and b!960292 res!642802) b!960293))

(assert (= (and b!960288 condMapEmpty!33988) mapIsEmpty!33988))

(assert (= (and b!960288 (not condMapEmpty!33988)) mapNonEmpty!33988))

(get-info :version)

(assert (= (and mapNonEmpty!33988 ((_ is ValueCellFull!10188) mapValue!33988)) b!960295))

(assert (= (and b!960288 ((_ is ValueCellFull!10188) mapDefault!33988)) b!960287))

(assert (= start!82360 b!960288))

(declare-fun m!890569 () Bool)

(assert (=> b!960289 m!890569))

(declare-fun m!890571 () Bool)

(assert (=> b!960293 m!890571))

(declare-fun m!890573 () Bool)

(assert (=> b!960293 m!890573))

(assert (=> b!960293 m!890571))

(assert (=> b!960293 m!890573))

(declare-fun m!890575 () Bool)

(assert (=> b!960293 m!890575))

(assert (=> b!960292 m!890573))

(assert (=> b!960292 m!890573))

(declare-fun m!890577 () Bool)

(assert (=> b!960292 m!890577))

(declare-fun m!890579 () Bool)

(assert (=> start!82360 m!890579))

(declare-fun m!890581 () Bool)

(assert (=> start!82360 m!890581))

(declare-fun m!890583 () Bool)

(assert (=> start!82360 m!890583))

(declare-fun m!890585 () Bool)

(assert (=> mapNonEmpty!33988 m!890585))

(declare-fun m!890587 () Bool)

(assert (=> b!960294 m!890587))

(check-sat (not b!960293) b_and!30115 (not b!960292) (not b!960289) (not b!960294) (not start!82360) (not b_next!18627) (not mapNonEmpty!33988) tp_is_empty!21339)
(check-sat b_and!30115 (not b_next!18627))
