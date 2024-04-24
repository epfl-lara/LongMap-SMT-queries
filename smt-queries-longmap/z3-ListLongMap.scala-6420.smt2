; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82484 () Bool)

(assert start!82484)

(declare-fun b_free!18583 () Bool)

(declare-fun b_next!18583 () Bool)

(assert (=> start!82484 (= b_free!18583 (not b_next!18583))))

(declare-fun tp!64720 () Bool)

(declare-fun b_and!30081 () Bool)

(assert (=> start!82484 (= tp!64720 b_and!30081)))

(declare-fun mapIsEmpty!33922 () Bool)

(declare-fun mapRes!33922 () Bool)

(assert (=> mapIsEmpty!33922 mapRes!33922))

(declare-fun b!960596 () Bool)

(declare-fun res!642746 () Bool)

(declare-fun e!541570 () Bool)

(assert (=> b!960596 (=> (not res!642746) (not e!541570))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58714 0))(
  ( (array!58715 (arr!28226 (Array (_ BitVec 32) (_ BitVec 64))) (size!28706 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58714)

(declare-datatypes ((V!33377 0))(
  ( (V!33378 (val!10698 Int)) )
))
(declare-datatypes ((ValueCell!10166 0))(
  ( (ValueCellFull!10166 (v!13252 V!33377)) (EmptyCell!10166) )
))
(declare-datatypes ((array!58716 0))(
  ( (array!58717 (arr!28227 (Array (_ BitVec 32) ValueCell!10166)) (size!28707 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58716)

(assert (=> b!960596 (= res!642746 (and (= (size!28707 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28706 _keys!1668) (size!28707 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960597 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!960597 (= e!541570 (bvslt i!793 #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!13778 0))(
  ( (tuple2!13779 (_1!6900 (_ BitVec 64)) (_2!6900 V!33377)) )
))
(declare-datatypes ((List!19610 0))(
  ( (Nil!19607) (Cons!19606 (h!20774 tuple2!13778) (t!27965 List!19610)) )
))
(declare-datatypes ((ListLongMap!12477 0))(
  ( (ListLongMap!12478 (toList!6254 List!19610)) )
))
(declare-fun lt!430927 () ListLongMap!12477)

(declare-fun minValue!1328 () V!33377)

(declare-fun defaultEntry!1389 () Int)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun zeroValue!1328 () V!33377)

(declare-fun getCurrentListMap!3487 (array!58714 array!58716 (_ BitVec 32) (_ BitVec 32) V!33377 V!33377 (_ BitVec 32) Int) ListLongMap!12477)

(assert (=> b!960597 (= lt!430927 (getCurrentListMap!3487 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389))))

(declare-fun b!960598 () Bool)

(declare-fun e!541572 () Bool)

(declare-fun tp_is_empty!21295 () Bool)

(assert (=> b!960598 (= e!541572 tp_is_empty!21295)))

(declare-fun b!960599 () Bool)

(declare-fun res!642747 () Bool)

(assert (=> b!960599 (=> (not res!642747) (not e!541570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960599 (= res!642747 (validKeyInArray!0 (select (arr!28226 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33922 () Bool)

(declare-fun tp!64719 () Bool)

(assert (=> mapNonEmpty!33922 (= mapRes!33922 (and tp!64719 e!541572))))

(declare-fun mapKey!33922 () (_ BitVec 32))

(declare-fun mapRest!33922 () (Array (_ BitVec 32) ValueCell!10166))

(declare-fun mapValue!33922 () ValueCell!10166)

(assert (=> mapNonEmpty!33922 (= (arr!28227 _values!1386) (store mapRest!33922 mapKey!33922 mapValue!33922))))

(declare-fun res!642750 () Bool)

(assert (=> start!82484 (=> (not res!642750) (not e!541570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82484 (= res!642750 (validMask!0 mask!2088))))

(assert (=> start!82484 e!541570))

(assert (=> start!82484 true))

(assert (=> start!82484 tp_is_empty!21295))

(declare-fun array_inv!21957 (array!58714) Bool)

(assert (=> start!82484 (array_inv!21957 _keys!1668)))

(declare-fun e!541571 () Bool)

(declare-fun array_inv!21958 (array!58716) Bool)

(assert (=> start!82484 (and (array_inv!21958 _values!1386) e!541571)))

(assert (=> start!82484 tp!64720))

(declare-fun b!960600 () Bool)

(declare-fun e!541568 () Bool)

(assert (=> b!960600 (= e!541568 tp_is_empty!21295)))

(declare-fun b!960601 () Bool)

(declare-fun res!642748 () Bool)

(assert (=> b!960601 (=> (not res!642748) (not e!541570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58714 (_ BitVec 32)) Bool)

(assert (=> b!960601 (= res!642748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960602 () Bool)

(declare-fun res!642749 () Bool)

(assert (=> b!960602 (=> (not res!642749) (not e!541570))))

(declare-datatypes ((List!19611 0))(
  ( (Nil!19608) (Cons!19607 (h!20775 (_ BitVec 64)) (t!27966 List!19611)) )
))
(declare-fun arrayNoDuplicates!0 (array!58714 (_ BitVec 32) List!19611) Bool)

(assert (=> b!960602 (= res!642749 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19608))))

(declare-fun b!960603 () Bool)

(assert (=> b!960603 (= e!541571 (and e!541568 mapRes!33922))))

(declare-fun condMapEmpty!33922 () Bool)

(declare-fun mapDefault!33922 () ValueCell!10166)

(assert (=> b!960603 (= condMapEmpty!33922 (= (arr!28227 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10166)) mapDefault!33922)))))

(declare-fun b!960604 () Bool)

(declare-fun res!642751 () Bool)

(assert (=> b!960604 (=> (not res!642751) (not e!541570))))

(assert (=> b!960604 (= res!642751 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28706 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28706 _keys!1668))))))

(assert (= (and start!82484 res!642750) b!960596))

(assert (= (and b!960596 res!642746) b!960601))

(assert (= (and b!960601 res!642748) b!960602))

(assert (= (and b!960602 res!642749) b!960604))

(assert (= (and b!960604 res!642751) b!960599))

(assert (= (and b!960599 res!642747) b!960597))

(assert (= (and b!960603 condMapEmpty!33922) mapIsEmpty!33922))

(assert (= (and b!960603 (not condMapEmpty!33922)) mapNonEmpty!33922))

(get-info :version)

(assert (= (and mapNonEmpty!33922 ((_ is ValueCellFull!10166) mapValue!33922)) b!960598))

(assert (= (and b!960603 ((_ is ValueCellFull!10166) mapDefault!33922)) b!960600))

(assert (= start!82484 b!960603))

(declare-fun m!891429 () Bool)

(assert (=> start!82484 m!891429))

(declare-fun m!891431 () Bool)

(assert (=> start!82484 m!891431))

(declare-fun m!891433 () Bool)

(assert (=> start!82484 m!891433))

(declare-fun m!891435 () Bool)

(assert (=> mapNonEmpty!33922 m!891435))

(declare-fun m!891437 () Bool)

(assert (=> b!960601 m!891437))

(declare-fun m!891439 () Bool)

(assert (=> b!960602 m!891439))

(declare-fun m!891441 () Bool)

(assert (=> b!960599 m!891441))

(assert (=> b!960599 m!891441))

(declare-fun m!891443 () Bool)

(assert (=> b!960599 m!891443))

(declare-fun m!891445 () Bool)

(assert (=> b!960597 m!891445))

(check-sat (not b!960601) (not b_next!18583) b_and!30081 (not mapNonEmpty!33922) (not start!82484) (not b!960599) tp_is_empty!21295 (not b!960597) (not b!960602))
(check-sat b_and!30081 (not b_next!18583))
