; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82202 () Bool)

(assert start!82202)

(declare-fun b_free!18475 () Bool)

(declare-fun b_next!18475 () Bool)

(assert (=> start!82202 (= b_free!18475 (not b_next!18475))))

(declare-fun tp!64386 () Bool)

(declare-fun b_and!29963 () Bool)

(assert (=> start!82202 (= tp!64386 b_and!29963)))

(declare-fun b!958091 () Bool)

(declare-fun res!641318 () Bool)

(declare-fun e!540132 () Bool)

(assert (=> b!958091 (=> (not res!641318) (not e!540132))))

(declare-datatypes ((array!58465 0))(
  ( (array!58466 (arr!28106 (Array (_ BitVec 32) (_ BitVec 64))) (size!28585 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58465)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58465 (_ BitVec 32)) Bool)

(assert (=> b!958091 (= res!641318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641315 () Bool)

(assert (=> start!82202 (=> (not res!641315) (not e!540132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82202 (= res!641315 (validMask!0 mask!2088))))

(assert (=> start!82202 e!540132))

(assert (=> start!82202 true))

(declare-fun tp_is_empty!21181 () Bool)

(assert (=> start!82202 tp_is_empty!21181))

(declare-fun array_inv!21803 (array!58465) Bool)

(assert (=> start!82202 (array_inv!21803 _keys!1668)))

(declare-datatypes ((V!33225 0))(
  ( (V!33226 (val!10641 Int)) )
))
(declare-datatypes ((ValueCell!10109 0))(
  ( (ValueCellFull!10109 (v!13198 V!33225)) (EmptyCell!10109) )
))
(declare-datatypes ((array!58467 0))(
  ( (array!58468 (arr!28107 (Array (_ BitVec 32) ValueCell!10109)) (size!28586 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58467)

(declare-fun e!540131 () Bool)

(declare-fun array_inv!21804 (array!58467) Bool)

(assert (=> start!82202 (and (array_inv!21804 _values!1386) e!540131)))

(assert (=> start!82202 tp!64386))

(declare-fun mapIsEmpty!33751 () Bool)

(declare-fun mapRes!33751 () Bool)

(assert (=> mapIsEmpty!33751 mapRes!33751))

(declare-fun b!958092 () Bool)

(declare-fun res!641316 () Bool)

(assert (=> b!958092 (=> (not res!641316) (not e!540132))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958092 (= res!641316 (validKeyInArray!0 (select (arr!28106 _keys!1668) i!793)))))

(declare-fun b!958093 () Bool)

(declare-fun e!540134 () Bool)

(assert (=> b!958093 (= e!540134 tp_is_empty!21181)))

(declare-fun b!958094 () Bool)

(declare-fun e!540135 () Bool)

(assert (=> b!958094 (= e!540135 tp_is_empty!21181)))

(declare-fun b!958095 () Bool)

(declare-fun res!641317 () Bool)

(assert (=> b!958095 (=> (not res!641317) (not e!540132))))

(declare-datatypes ((List!19539 0))(
  ( (Nil!19536) (Cons!19535 (h!20697 (_ BitVec 64)) (t!27902 List!19539)) )
))
(declare-fun arrayNoDuplicates!0 (array!58465 (_ BitVec 32) List!19539) Bool)

(assert (=> b!958095 (= res!641317 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19536))))

(declare-fun b!958096 () Bool)

(declare-fun res!641314 () Bool)

(assert (=> b!958096 (=> (not res!641314) (not e!540132))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958096 (= res!641314 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28585 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28585 _keys!1668))))))

(declare-fun b!958097 () Bool)

(declare-fun res!641313 () Bool)

(assert (=> b!958097 (=> (not res!641313) (not e!540132))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958097 (= res!641313 (and (= (size!28586 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28585 _keys!1668) (size!28586 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958098 () Bool)

(assert (=> b!958098 (= e!540132 false)))

(declare-fun lt!430404 () Bool)

(declare-fun minValue!1328 () V!33225)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33225)

(declare-datatypes ((tuple2!13718 0))(
  ( (tuple2!13719 (_1!6870 (_ BitVec 64)) (_2!6870 V!33225)) )
))
(declare-datatypes ((List!19540 0))(
  ( (Nil!19537) (Cons!19536 (h!20698 tuple2!13718) (t!27903 List!19540)) )
))
(declare-datatypes ((ListLongMap!12415 0))(
  ( (ListLongMap!12416 (toList!6223 List!19540)) )
))
(declare-fun contains!5324 (ListLongMap!12415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3456 (array!58465 array!58467 (_ BitVec 32) (_ BitVec 32) V!33225 V!33225 (_ BitVec 32) Int) ListLongMap!12415)

(assert (=> b!958098 (= lt!430404 (contains!5324 (getCurrentListMap!3456 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28106 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33751 () Bool)

(declare-fun tp!64385 () Bool)

(assert (=> mapNonEmpty!33751 (= mapRes!33751 (and tp!64385 e!540135))))

(declare-fun mapKey!33751 () (_ BitVec 32))

(declare-fun mapRest!33751 () (Array (_ BitVec 32) ValueCell!10109))

(declare-fun mapValue!33751 () ValueCell!10109)

(assert (=> mapNonEmpty!33751 (= (arr!28107 _values!1386) (store mapRest!33751 mapKey!33751 mapValue!33751))))

(declare-fun b!958099 () Bool)

(assert (=> b!958099 (= e!540131 (and e!540134 mapRes!33751))))

(declare-fun condMapEmpty!33751 () Bool)

(declare-fun mapDefault!33751 () ValueCell!10109)

