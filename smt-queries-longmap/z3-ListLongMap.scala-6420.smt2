; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82298 () Bool)

(assert start!82298)

(declare-fun b_free!18583 () Bool)

(declare-fun b_next!18583 () Bool)

(assert (=> start!82298 (= b_free!18583 (not b_next!18583))))

(declare-fun tp!64719 () Bool)

(declare-fun b_and!30045 () Bool)

(assert (=> start!82298 (= tp!64719 b_and!30045)))

(declare-fun b!959454 () Bool)

(declare-fun res!642297 () Bool)

(declare-fun e!540841 () Bool)

(assert (=> b!959454 (=> (not res!642297) (not e!540841))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33377 0))(
  ( (V!33378 (val!10698 Int)) )
))
(declare-datatypes ((ValueCell!10166 0))(
  ( (ValueCellFull!10166 (v!13254 V!33377)) (EmptyCell!10166) )
))
(declare-datatypes ((array!58618 0))(
  ( (array!58619 (arr!28183 (Array (_ BitVec 32) ValueCell!10166)) (size!28664 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58618)

(declare-datatypes ((array!58620 0))(
  ( (array!58621 (arr!28184 (Array (_ BitVec 32) (_ BitVec 64))) (size!28665 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58620)

(assert (=> b!959454 (= res!642297 (and (= (size!28664 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28665 _keys!1668) (size!28664 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959455 () Bool)

(declare-fun e!540839 () Bool)

(declare-fun tp_is_empty!21295 () Bool)

(assert (=> b!959455 (= e!540839 tp_is_empty!21295)))

(declare-fun b!959456 () Bool)

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!959456 (= e!540841 (bvslt i!793 #b00000000000000000000000000000000))))

(declare-fun minValue!1328 () V!33377)

(declare-datatypes ((tuple2!13842 0))(
  ( (tuple2!13843 (_1!6932 (_ BitVec 64)) (_2!6932 V!33377)) )
))
(declare-datatypes ((List!19627 0))(
  ( (Nil!19624) (Cons!19623 (h!20785 tuple2!13842) (t!27981 List!19627)) )
))
(declare-datatypes ((ListLongMap!12529 0))(
  ( (ListLongMap!12530 (toList!6280 List!19627)) )
))
(declare-fun lt!430330 () ListLongMap!12529)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33377)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun getCurrentListMap!3442 (array!58620 array!58618 (_ BitVec 32) (_ BitVec 32) V!33377 V!33377 (_ BitVec 32) Int) ListLongMap!12529)

(assert (=> b!959456 (= lt!430330 (getCurrentListMap!3442 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389))))

(declare-fun b!959457 () Bool)

(declare-fun res!642294 () Bool)

(assert (=> b!959457 (=> (not res!642294) (not e!540841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959457 (= res!642294 (validKeyInArray!0 (select (arr!28184 _keys!1668) i!793)))))

(declare-fun b!959458 () Bool)

(declare-fun e!540838 () Bool)

(assert (=> b!959458 (= e!540838 tp_is_empty!21295)))

(declare-fun mapNonEmpty!33922 () Bool)

(declare-fun mapRes!33922 () Bool)

(declare-fun tp!64720 () Bool)

(assert (=> mapNonEmpty!33922 (= mapRes!33922 (and tp!64720 e!540839))))

(declare-fun mapValue!33922 () ValueCell!10166)

(declare-fun mapRest!33922 () (Array (_ BitVec 32) ValueCell!10166))

(declare-fun mapKey!33922 () (_ BitVec 32))

(assert (=> mapNonEmpty!33922 (= (arr!28183 _values!1386) (store mapRest!33922 mapKey!33922 mapValue!33922))))

(declare-fun b!959459 () Bool)

(declare-fun res!642293 () Bool)

(assert (=> b!959459 (=> (not res!642293) (not e!540841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58620 (_ BitVec 32)) Bool)

(assert (=> b!959459 (= res!642293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959460 () Bool)

(declare-fun res!642296 () Bool)

(assert (=> b!959460 (=> (not res!642296) (not e!540841))))

(declare-datatypes ((List!19628 0))(
  ( (Nil!19625) (Cons!19624 (h!20786 (_ BitVec 64)) (t!27982 List!19628)) )
))
(declare-fun arrayNoDuplicates!0 (array!58620 (_ BitVec 32) List!19628) Bool)

(assert (=> b!959460 (= res!642296 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19625))))

(declare-fun b!959461 () Bool)

(declare-fun res!642292 () Bool)

(assert (=> b!959461 (=> (not res!642292) (not e!540841))))

(assert (=> b!959461 (= res!642292 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28665 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28665 _keys!1668))))))

(declare-fun b!959462 () Bool)

(declare-fun e!540840 () Bool)

(assert (=> b!959462 (= e!540840 (and e!540838 mapRes!33922))))

(declare-fun condMapEmpty!33922 () Bool)

(declare-fun mapDefault!33922 () ValueCell!10166)

(assert (=> b!959462 (= condMapEmpty!33922 (= (arr!28183 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10166)) mapDefault!33922)))))

(declare-fun res!642295 () Bool)

(assert (=> start!82298 (=> (not res!642295) (not e!540841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82298 (= res!642295 (validMask!0 mask!2088))))

(assert (=> start!82298 e!540841))

(assert (=> start!82298 true))

(assert (=> start!82298 tp_is_empty!21295))

(declare-fun array_inv!21903 (array!58620) Bool)

(assert (=> start!82298 (array_inv!21903 _keys!1668)))

(declare-fun array_inv!21904 (array!58618) Bool)

(assert (=> start!82298 (and (array_inv!21904 _values!1386) e!540840)))

(assert (=> start!82298 tp!64719))

(declare-fun mapIsEmpty!33922 () Bool)

(assert (=> mapIsEmpty!33922 mapRes!33922))

(assert (= (and start!82298 res!642295) b!959454))

(assert (= (and b!959454 res!642297) b!959459))

(assert (= (and b!959459 res!642293) b!959460))

(assert (= (and b!959460 res!642296) b!959461))

(assert (= (and b!959461 res!642292) b!959457))

(assert (= (and b!959457 res!642294) b!959456))

(assert (= (and b!959462 condMapEmpty!33922) mapIsEmpty!33922))

(assert (= (and b!959462 (not condMapEmpty!33922)) mapNonEmpty!33922))

(get-info :version)

(assert (= (and mapNonEmpty!33922 ((_ is ValueCellFull!10166) mapValue!33922)) b!959455))

(assert (= (and b!959462 ((_ is ValueCellFull!10166) mapDefault!33922)) b!959458))

(assert (= start!82298 b!959462))

(declare-fun m!889377 () Bool)

(assert (=> b!959456 m!889377))

(declare-fun m!889379 () Bool)

(assert (=> start!82298 m!889379))

(declare-fun m!889381 () Bool)

(assert (=> start!82298 m!889381))

(declare-fun m!889383 () Bool)

(assert (=> start!82298 m!889383))

(declare-fun m!889385 () Bool)

(assert (=> mapNonEmpty!33922 m!889385))

(declare-fun m!889387 () Bool)

(assert (=> b!959457 m!889387))

(assert (=> b!959457 m!889387))

(declare-fun m!889389 () Bool)

(assert (=> b!959457 m!889389))

(declare-fun m!889391 () Bool)

(assert (=> b!959460 m!889391))

(declare-fun m!889393 () Bool)

(assert (=> b!959459 m!889393))

(check-sat b_and!30045 (not b!959457) tp_is_empty!21295 (not mapNonEmpty!33922) (not b_next!18583) (not start!82298) (not b!959460) (not b!959459) (not b!959456))
(check-sat b_and!30045 (not b_next!18583))
