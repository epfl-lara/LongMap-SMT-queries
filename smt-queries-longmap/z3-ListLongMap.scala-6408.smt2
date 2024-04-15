; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82226 () Bool)

(assert start!82226)

(declare-fun b_free!18517 () Bool)

(declare-fun b_next!18517 () Bool)

(assert (=> start!82226 (= b_free!18517 (not b_next!18517))))

(declare-fun tp!64512 () Bool)

(declare-fun b_and!29979 () Bool)

(assert (=> start!82226 (= tp!64512 b_and!29979)))

(declare-fun b!958419 () Bool)

(declare-fun res!641581 () Bool)

(declare-fun e!540302 () Bool)

(assert (=> b!958419 (=> (not res!641581) (not e!540302))))

(declare-datatypes ((array!58482 0))(
  ( (array!58483 (arr!28115 (Array (_ BitVec 32) (_ BitVec 64))) (size!28596 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58482)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58482 (_ BitVec 32)) Bool)

(assert (=> b!958419 (= res!641581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958420 () Bool)

(declare-fun e!540301 () Bool)

(declare-fun tp_is_empty!21223 () Bool)

(assert (=> b!958420 (= e!540301 tp_is_empty!21223)))

(declare-fun res!641586 () Bool)

(assert (=> start!82226 (=> (not res!641586) (not e!540302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82226 (= res!641586 (validMask!0 mask!2088))))

(assert (=> start!82226 e!540302))

(assert (=> start!82226 true))

(assert (=> start!82226 tp_is_empty!21223))

(declare-fun array_inv!21861 (array!58482) Bool)

(assert (=> start!82226 (array_inv!21861 _keys!1668)))

(declare-datatypes ((V!33281 0))(
  ( (V!33282 (val!10662 Int)) )
))
(declare-datatypes ((ValueCell!10130 0))(
  ( (ValueCellFull!10130 (v!13218 V!33281)) (EmptyCell!10130) )
))
(declare-datatypes ((array!58484 0))(
  ( (array!58485 (arr!28116 (Array (_ BitVec 32) ValueCell!10130)) (size!28597 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58484)

(declare-fun e!540300 () Bool)

(declare-fun array_inv!21862 (array!58484) Bool)

(assert (=> start!82226 (and (array_inv!21862 _values!1386) e!540300)))

(assert (=> start!82226 tp!64512))

(declare-fun b!958421 () Bool)

(declare-fun res!641582 () Bool)

(assert (=> b!958421 (=> (not res!641582) (not e!540302))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958421 (= res!641582 (validKeyInArray!0 (select (arr!28115 _keys!1668) i!793)))))

(declare-fun b!958422 () Bool)

(declare-fun res!641583 () Bool)

(assert (=> b!958422 (=> (not res!641583) (not e!540302))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958422 (= res!641583 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28596 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28596 _keys!1668))))))

(declare-fun b!958423 () Bool)

(declare-fun e!540299 () Bool)

(assert (=> b!958423 (= e!540299 tp_is_empty!21223)))

(declare-fun b!958424 () Bool)

(declare-fun mapRes!33814 () Bool)

(assert (=> b!958424 (= e!540300 (and e!540299 mapRes!33814))))

(declare-fun condMapEmpty!33814 () Bool)

(declare-fun mapDefault!33814 () ValueCell!10130)

(assert (=> b!958424 (= condMapEmpty!33814 (= (arr!28116 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10130)) mapDefault!33814)))))

(declare-fun b!958425 () Bool)

(declare-fun res!641585 () Bool)

(assert (=> b!958425 (=> (not res!641585) (not e!540302))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958425 (= res!641585 (and (= (size!28597 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28596 _keys!1668) (size!28597 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33814 () Bool)

(assert (=> mapIsEmpty!33814 mapRes!33814))

(declare-fun b!958426 () Bool)

(declare-fun res!641584 () Bool)

(assert (=> b!958426 (=> (not res!641584) (not e!540302))))

(declare-datatypes ((List!19582 0))(
  ( (Nil!19579) (Cons!19578 (h!20740 (_ BitVec 64)) (t!27936 List!19582)) )
))
(declare-fun arrayNoDuplicates!0 (array!58482 (_ BitVec 32) List!19582) Bool)

(assert (=> b!958426 (= res!641584 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19579))))

(declare-fun b!958427 () Bool)

(assert (=> b!958427 (= e!540302 false)))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33281)

(declare-fun lt!430231 () Bool)

(declare-fun minValue!1328 () V!33281)

(declare-datatypes ((tuple2!13796 0))(
  ( (tuple2!13797 (_1!6909 (_ BitVec 64)) (_2!6909 V!33281)) )
))
(declare-datatypes ((List!19583 0))(
  ( (Nil!19580) (Cons!19579 (h!20741 tuple2!13796) (t!27937 List!19583)) )
))
(declare-datatypes ((ListLongMap!12483 0))(
  ( (ListLongMap!12484 (toList!6257 List!19583)) )
))
(declare-fun contains!5303 (ListLongMap!12483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3419 (array!58482 array!58484 (_ BitVec 32) (_ BitVec 32) V!33281 V!33281 (_ BitVec 32) Int) ListLongMap!12483)

(assert (=> b!958427 (= lt!430231 (contains!5303 (getCurrentListMap!3419 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28115 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33814 () Bool)

(declare-fun tp!64513 () Bool)

(assert (=> mapNonEmpty!33814 (= mapRes!33814 (and tp!64513 e!540301))))

(declare-fun mapKey!33814 () (_ BitVec 32))

(declare-fun mapRest!33814 () (Array (_ BitVec 32) ValueCell!10130))

(declare-fun mapValue!33814 () ValueCell!10130)

(assert (=> mapNonEmpty!33814 (= (arr!28116 _values!1386) (store mapRest!33814 mapKey!33814 mapValue!33814))))

(assert (= (and start!82226 res!641586) b!958425))

(assert (= (and b!958425 res!641585) b!958419))

(assert (= (and b!958419 res!641581) b!958426))

(assert (= (and b!958426 res!641584) b!958422))

(assert (= (and b!958422 res!641583) b!958421))

(assert (= (and b!958421 res!641582) b!958427))

(assert (= (and b!958424 condMapEmpty!33814) mapIsEmpty!33814))

(assert (= (and b!958424 (not condMapEmpty!33814)) mapNonEmpty!33814))

(get-info :version)

(assert (= (and mapNonEmpty!33814 ((_ is ValueCellFull!10130) mapValue!33814)) b!958420))

(assert (= (and b!958424 ((_ is ValueCellFull!10130) mapDefault!33814)) b!958423))

(assert (= start!82226 b!958424))

(declare-fun m!888519 () Bool)

(assert (=> b!958421 m!888519))

(assert (=> b!958421 m!888519))

(declare-fun m!888521 () Bool)

(assert (=> b!958421 m!888521))

(declare-fun m!888523 () Bool)

(assert (=> b!958426 m!888523))

(declare-fun m!888525 () Bool)

(assert (=> b!958427 m!888525))

(assert (=> b!958427 m!888519))

(assert (=> b!958427 m!888525))

(assert (=> b!958427 m!888519))

(declare-fun m!888527 () Bool)

(assert (=> b!958427 m!888527))

(declare-fun m!888529 () Bool)

(assert (=> mapNonEmpty!33814 m!888529))

(declare-fun m!888531 () Bool)

(assert (=> b!958419 m!888531))

(declare-fun m!888533 () Bool)

(assert (=> start!82226 m!888533))

(declare-fun m!888535 () Bool)

(assert (=> start!82226 m!888535))

(declare-fun m!888537 () Bool)

(assert (=> start!82226 m!888537))

(check-sat (not b!958421) (not b!958419) (not b!958427) (not b_next!18517) (not start!82226) b_and!29979 tp_is_empty!21223 (not mapNonEmpty!33814) (not b!958426))
(check-sat b_and!29979 (not b_next!18517))
