; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82340 () Bool)

(assert start!82340)

(declare-fun b_free!18625 () Bool)

(declare-fun b_next!18625 () Bool)

(assert (=> start!82340 (= b_free!18625 (not b_next!18625))))

(declare-fun tp!64845 () Bool)

(declare-fun b_and!30087 () Bool)

(assert (=> start!82340 (= tp!64845 b_and!30087)))

(declare-fun res!642673 () Bool)

(declare-fun e!541153 () Bool)

(assert (=> start!82340 (=> (not res!642673) (not e!541153))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82340 (= res!642673 (validMask!0 mask!2088))))

(assert (=> start!82340 e!541153))

(assert (=> start!82340 true))

(declare-fun tp_is_empty!21337 () Bool)

(assert (=> start!82340 tp_is_empty!21337))

(declare-datatypes ((array!58700 0))(
  ( (array!58701 (arr!28224 (Array (_ BitVec 32) (_ BitVec 64))) (size!28705 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58700)

(declare-fun array_inv!21937 (array!58700) Bool)

(assert (=> start!82340 (array_inv!21937 _keys!1668)))

(declare-datatypes ((V!33433 0))(
  ( (V!33434 (val!10719 Int)) )
))
(declare-datatypes ((ValueCell!10187 0))(
  ( (ValueCellFull!10187 (v!13275 V!33433)) (EmptyCell!10187) )
))
(declare-datatypes ((array!58702 0))(
  ( (array!58703 (arr!28225 (Array (_ BitVec 32) ValueCell!10187)) (size!28706 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58702)

(declare-fun e!541155 () Bool)

(declare-fun array_inv!21938 (array!58702) Bool)

(assert (=> start!82340 (and (array_inv!21938 _values!1386) e!541155)))

(assert (=> start!82340 tp!64845))

(declare-fun b!960021 () Bool)

(declare-fun res!642671 () Bool)

(assert (=> b!960021 (=> (not res!642671) (not e!541153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58700 (_ BitVec 32)) Bool)

(assert (=> b!960021 (= res!642671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960022 () Bool)

(declare-fun e!541157 () Bool)

(assert (=> b!960022 (= e!541157 tp_is_empty!21337)))

(declare-fun b!960023 () Bool)

(declare-fun res!642675 () Bool)

(assert (=> b!960023 (=> (not res!642675) (not e!541153))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960023 (= res!642675 (validKeyInArray!0 (select (arr!28224 _keys!1668) i!793)))))

(declare-fun b!960024 () Bool)

(assert (=> b!960024 (= e!541153 false)))

(declare-fun lt!430393 () Bool)

(declare-fun minValue!1328 () V!33433)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun zeroValue!1328 () V!33433)

(declare-datatypes ((tuple2!13880 0))(
  ( (tuple2!13881 (_1!6951 (_ BitVec 64)) (_2!6951 V!33433)) )
))
(declare-datatypes ((List!19664 0))(
  ( (Nil!19661) (Cons!19660 (h!20822 tuple2!13880) (t!28018 List!19664)) )
))
(declare-datatypes ((ListLongMap!12567 0))(
  ( (ListLongMap!12568 (toList!6299 List!19664)) )
))
(declare-fun contains!5342 (ListLongMap!12567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3461 (array!58700 array!58702 (_ BitVec 32) (_ BitVec 32) V!33433 V!33433 (_ BitVec 32) Int) ListLongMap!12567)

(assert (=> b!960024 (= lt!430393 (contains!5342 (getCurrentListMap!3461 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28224 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33985 () Bool)

(declare-fun mapRes!33985 () Bool)

(assert (=> mapIsEmpty!33985 mapRes!33985))

(declare-fun b!960025 () Bool)

(assert (=> b!960025 (= e!541155 (and e!541157 mapRes!33985))))

(declare-fun condMapEmpty!33985 () Bool)

(declare-fun mapDefault!33985 () ValueCell!10187)

(assert (=> b!960025 (= condMapEmpty!33985 (= (arr!28225 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10187)) mapDefault!33985)))))

(declare-fun b!960026 () Bool)

(declare-fun res!642670 () Bool)

(assert (=> b!960026 (=> (not res!642670) (not e!541153))))

(assert (=> b!960026 (= res!642670 (and (= (size!28706 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28705 _keys!1668) (size!28706 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33985 () Bool)

(declare-fun tp!64846 () Bool)

(declare-fun e!541154 () Bool)

(assert (=> mapNonEmpty!33985 (= mapRes!33985 (and tp!64846 e!541154))))

(declare-fun mapKey!33985 () (_ BitVec 32))

(declare-fun mapRest!33985 () (Array (_ BitVec 32) ValueCell!10187))

(declare-fun mapValue!33985 () ValueCell!10187)

(assert (=> mapNonEmpty!33985 (= (arr!28225 _values!1386) (store mapRest!33985 mapKey!33985 mapValue!33985))))

(declare-fun b!960027 () Bool)

(declare-fun res!642674 () Bool)

(assert (=> b!960027 (=> (not res!642674) (not e!541153))))

(declare-datatypes ((List!19665 0))(
  ( (Nil!19662) (Cons!19661 (h!20823 (_ BitVec 64)) (t!28019 List!19665)) )
))
(declare-fun arrayNoDuplicates!0 (array!58700 (_ BitVec 32) List!19665) Bool)

(assert (=> b!960027 (= res!642674 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19662))))

(declare-fun b!960028 () Bool)

(declare-fun res!642672 () Bool)

(assert (=> b!960028 (=> (not res!642672) (not e!541153))))

(assert (=> b!960028 (= res!642672 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28705 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28705 _keys!1668))))))

(declare-fun b!960029 () Bool)

(assert (=> b!960029 (= e!541154 tp_is_empty!21337)))

(assert (= (and start!82340 res!642673) b!960026))

(assert (= (and b!960026 res!642670) b!960021))

(assert (= (and b!960021 res!642671) b!960027))

(assert (= (and b!960027 res!642674) b!960028))

(assert (= (and b!960028 res!642672) b!960023))

(assert (= (and b!960023 res!642675) b!960024))

(assert (= (and b!960025 condMapEmpty!33985) mapIsEmpty!33985))

(assert (= (and b!960025 (not condMapEmpty!33985)) mapNonEmpty!33985))

(get-info :version)

(assert (= (and mapNonEmpty!33985 ((_ is ValueCellFull!10187) mapValue!33985)) b!960029))

(assert (= (and b!960025 ((_ is ValueCellFull!10187) mapDefault!33985)) b!960022))

(assert (= start!82340 b!960025))

(declare-fun m!889791 () Bool)

(assert (=> b!960027 m!889791))

(declare-fun m!889793 () Bool)

(assert (=> b!960024 m!889793))

(declare-fun m!889795 () Bool)

(assert (=> b!960024 m!889795))

(assert (=> b!960024 m!889793))

(assert (=> b!960024 m!889795))

(declare-fun m!889797 () Bool)

(assert (=> b!960024 m!889797))

(declare-fun m!889799 () Bool)

(assert (=> start!82340 m!889799))

(declare-fun m!889801 () Bool)

(assert (=> start!82340 m!889801))

(declare-fun m!889803 () Bool)

(assert (=> start!82340 m!889803))

(assert (=> b!960023 m!889795))

(assert (=> b!960023 m!889795))

(declare-fun m!889805 () Bool)

(assert (=> b!960023 m!889805))

(declare-fun m!889807 () Bool)

(assert (=> b!960021 m!889807))

(declare-fun m!889809 () Bool)

(assert (=> mapNonEmpty!33985 m!889809))

(check-sat (not mapNonEmpty!33985) b_and!30087 (not start!82340) (not b_next!18625) (not b!960024) (not b!960027) (not b!960021) tp_is_empty!21337 (not b!960023))
(check-sat b_and!30087 (not b_next!18625))
