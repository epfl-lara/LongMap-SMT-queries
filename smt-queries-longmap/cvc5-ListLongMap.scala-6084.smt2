; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78612 () Bool)

(assert start!78612)

(declare-fun b_free!16825 () Bool)

(declare-fun b_next!16825 () Bool)

(assert (=> start!78612 (= b_free!16825 (not b_next!16825))))

(declare-fun tp!58916 () Bool)

(declare-fun b_and!27447 () Bool)

(assert (=> start!78612 (= tp!58916 b_and!27447)))

(declare-fun mapIsEmpty!30756 () Bool)

(declare-fun mapRes!30756 () Bool)

(assert (=> mapIsEmpty!30756 mapRes!30756))

(declare-fun b!916404 () Bool)

(declare-fun res!617794 () Bool)

(declare-fun e!514412 () Bool)

(assert (=> b!916404 (=> (not res!617794) (not e!514412))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54654 0))(
  ( (array!54655 (arr!26272 (Array (_ BitVec 32) (_ BitVec 64))) (size!26731 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54654)

(assert (=> b!916404 (= res!617794 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26731 _keys!1487))))))

(declare-fun b!916405 () Bool)

(declare-fun res!617797 () Bool)

(assert (=> b!916405 (=> (not res!617797) (not e!514412))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54654 (_ BitVec 32)) Bool)

(assert (=> b!916405 (= res!617797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916406 () Bool)

(declare-fun e!514414 () Bool)

(declare-fun tp_is_empty!19333 () Bool)

(assert (=> b!916406 (= e!514414 tp_is_empty!19333)))

(declare-fun res!617796 () Bool)

(assert (=> start!78612 (=> (not res!617796) (not e!514412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78612 (= res!617796 (validMask!0 mask!1881))))

(assert (=> start!78612 e!514412))

(assert (=> start!78612 true))

(declare-datatypes ((V!30743 0))(
  ( (V!30744 (val!9717 Int)) )
))
(declare-datatypes ((ValueCell!9185 0))(
  ( (ValueCellFull!9185 (v!12235 V!30743)) (EmptyCell!9185) )
))
(declare-datatypes ((array!54656 0))(
  ( (array!54657 (arr!26273 (Array (_ BitVec 32) ValueCell!9185)) (size!26732 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54656)

(declare-fun e!514413 () Bool)

(declare-fun array_inv!20492 (array!54656) Bool)

(assert (=> start!78612 (and (array_inv!20492 _values!1231) e!514413)))

(assert (=> start!78612 tp!58916))

(declare-fun array_inv!20493 (array!54654) Bool)

(assert (=> start!78612 (array_inv!20493 _keys!1487)))

(assert (=> start!78612 tp_is_empty!19333))

(declare-fun b!916407 () Bool)

(declare-fun res!617793 () Bool)

(assert (=> b!916407 (=> (not res!617793) (not e!514412))))

(declare-datatypes ((List!18417 0))(
  ( (Nil!18414) (Cons!18413 (h!19559 (_ BitVec 64)) (t!26030 List!18417)) )
))
(declare-fun arrayNoDuplicates!0 (array!54654 (_ BitVec 32) List!18417) Bool)

(assert (=> b!916407 (= res!617793 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18414))))

(declare-fun mapNonEmpty!30756 () Bool)

(declare-fun tp!58915 () Bool)

(declare-fun e!514409 () Bool)

(assert (=> mapNonEmpty!30756 (= mapRes!30756 (and tp!58915 e!514409))))

(declare-fun mapRest!30756 () (Array (_ BitVec 32) ValueCell!9185))

(declare-fun mapValue!30756 () ValueCell!9185)

(declare-fun mapKey!30756 () (_ BitVec 32))

(assert (=> mapNonEmpty!30756 (= (arr!26273 _values!1231) (store mapRest!30756 mapKey!30756 mapValue!30756))))

(declare-fun b!916408 () Bool)

(declare-fun e!514411 () Bool)

(assert (=> b!916408 (= e!514412 e!514411)))

(declare-fun res!617792 () Bool)

(assert (=> b!916408 (=> (not res!617792) (not e!514411))))

(declare-datatypes ((tuple2!12606 0))(
  ( (tuple2!12607 (_1!6314 (_ BitVec 64)) (_2!6314 V!30743)) )
))
(declare-datatypes ((List!18418 0))(
  ( (Nil!18415) (Cons!18414 (h!19560 tuple2!12606) (t!26031 List!18418)) )
))
(declare-datatypes ((ListLongMap!11303 0))(
  ( (ListLongMap!11304 (toList!5667 List!18418)) )
))
(declare-fun lt!411783 () ListLongMap!11303)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4721 (ListLongMap!11303 (_ BitVec 64)) Bool)

(assert (=> b!916408 (= res!617792 (contains!4721 lt!411783 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30743)

(declare-fun minValue!1173 () V!30743)

(declare-fun getCurrentListMap!2928 (array!54654 array!54656 (_ BitVec 32) (_ BitVec 32) V!30743 V!30743 (_ BitVec 32) Int) ListLongMap!11303)

(assert (=> b!916408 (= lt!411783 (getCurrentListMap!2928 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916409 () Bool)

(declare-fun res!617795 () Bool)

(assert (=> b!916409 (=> (not res!617795) (not e!514412))))

(assert (=> b!916409 (= res!617795 (and (= (size!26732 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26731 _keys!1487) (size!26732 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916410 () Bool)

(assert (=> b!916410 (= e!514409 tp_is_empty!19333)))

(declare-fun b!916411 () Bool)

(assert (=> b!916411 (= e!514411 false)))

(declare-fun lt!411784 () V!30743)

(declare-fun apply!526 (ListLongMap!11303 (_ BitVec 64)) V!30743)

(assert (=> b!916411 (= lt!411784 (apply!526 lt!411783 k!1099))))

(declare-fun b!916412 () Bool)

(assert (=> b!916412 (= e!514413 (and e!514414 mapRes!30756))))

(declare-fun condMapEmpty!30756 () Bool)

(declare-fun mapDefault!30756 () ValueCell!9185)

