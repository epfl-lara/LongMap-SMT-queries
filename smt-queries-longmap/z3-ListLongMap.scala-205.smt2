; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3914 () Bool)

(assert start!3914)

(declare-fun b_free!819 () Bool)

(declare-fun b_next!819 () Bool)

(assert (=> start!3914 (= b_free!819 (not b_next!819))))

(declare-fun tp!3877 () Bool)

(declare-fun b_and!1629 () Bool)

(assert (=> start!3914 (= tp!3877 b_and!1629)))

(declare-fun b!27666 () Bool)

(declare-fun res!16399 () Bool)

(declare-fun e!17989 () Bool)

(assert (=> b!27666 (=> (not res!16399) (not e!17989))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27666 (= res!16399 (validKeyInArray!0 k0!1304))))

(declare-fun res!16398 () Bool)

(assert (=> start!3914 (=> (not res!16398) (not e!17989))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3914 (= res!16398 (validMask!0 mask!2294))))

(assert (=> start!3914 e!17989))

(assert (=> start!3914 true))

(assert (=> start!3914 tp!3877))

(declare-datatypes ((V!1389 0))(
  ( (V!1390 (val!613 Int)) )
))
(declare-datatypes ((ValueCell!387 0))(
  ( (ValueCellFull!387 (v!1702 V!1389)) (EmptyCell!387) )
))
(declare-datatypes ((array!1587 0))(
  ( (array!1588 (arr!747 (Array (_ BitVec 32) ValueCell!387)) (size!848 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1587)

(declare-fun e!17991 () Bool)

(declare-fun array_inv!513 (array!1587) Bool)

(assert (=> start!3914 (and (array_inv!513 _values!1501) e!17991)))

(declare-datatypes ((array!1589 0))(
  ( (array!1590 (arr!748 (Array (_ BitVec 32) (_ BitVec 64))) (size!849 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1589)

(declare-fun array_inv!514 (array!1589) Bool)

(assert (=> start!3914 (array_inv!514 _keys!1833)))

(declare-fun tp_is_empty!1173 () Bool)

(assert (=> start!3914 tp_is_empty!1173))

(declare-fun b!27667 () Bool)

(declare-fun res!16404 () Bool)

(assert (=> b!27667 (=> (not res!16404) (not e!17989))))

(declare-datatypes ((List!630 0))(
  ( (Nil!627) (Cons!626 (h!1193 (_ BitVec 64)) (t!3323 List!630)) )
))
(declare-fun arrayNoDuplicates!0 (array!1589 (_ BitVec 32) List!630) Bool)

(assert (=> b!27667 (= res!16404 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!627))))

(declare-fun b!27668 () Bool)

(assert (=> b!27668 (= e!17989 false)))

(declare-fun lt!10703 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1589 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27668 (= lt!10703 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27669 () Bool)

(declare-fun e!17992 () Bool)

(assert (=> b!27669 (= e!17992 tp_is_empty!1173)))

(declare-fun b!27670 () Bool)

(declare-fun mapRes!1288 () Bool)

(assert (=> b!27670 (= e!17991 (and e!17992 mapRes!1288))))

(declare-fun condMapEmpty!1288 () Bool)

(declare-fun mapDefault!1288 () ValueCell!387)

(assert (=> b!27670 (= condMapEmpty!1288 (= (arr!747 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!387)) mapDefault!1288)))))

(declare-fun b!27671 () Bool)

(declare-fun res!16402 () Bool)

(assert (=> b!27671 (=> (not res!16402) (not e!17989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1589 (_ BitVec 32)) Bool)

(assert (=> b!27671 (= res!16402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27672 () Bool)

(declare-fun e!17993 () Bool)

(assert (=> b!27672 (= e!17993 tp_is_empty!1173)))

(declare-fun mapIsEmpty!1288 () Bool)

(assert (=> mapIsEmpty!1288 mapRes!1288))

(declare-fun b!27673 () Bool)

(declare-fun res!16401 () Bool)

(assert (=> b!27673 (=> (not res!16401) (not e!17989))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27673 (= res!16401 (and (= (size!848 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!849 _keys!1833) (size!848 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27674 () Bool)

(declare-fun res!16400 () Bool)

(assert (=> b!27674 (=> (not res!16400) (not e!17989))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1389)

(declare-fun minValue!1443 () V!1389)

(declare-datatypes ((tuple2!1030 0))(
  ( (tuple2!1031 (_1!526 (_ BitVec 64)) (_2!526 V!1389)) )
))
(declare-datatypes ((List!631 0))(
  ( (Nil!628) (Cons!627 (h!1194 tuple2!1030) (t!3324 List!631)) )
))
(declare-datatypes ((ListLongMap!607 0))(
  ( (ListLongMap!608 (toList!319 List!631)) )
))
(declare-fun contains!259 (ListLongMap!607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!149 (array!1589 array!1587 (_ BitVec 32) (_ BitVec 32) V!1389 V!1389 (_ BitVec 32) Int) ListLongMap!607)

(assert (=> b!27674 (= res!16400 (not (contains!259 (getCurrentListMap!149 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1288 () Bool)

(declare-fun tp!3876 () Bool)

(assert (=> mapNonEmpty!1288 (= mapRes!1288 (and tp!3876 e!17993))))

(declare-fun mapValue!1288 () ValueCell!387)

(declare-fun mapKey!1288 () (_ BitVec 32))

(declare-fun mapRest!1288 () (Array (_ BitVec 32) ValueCell!387))

(assert (=> mapNonEmpty!1288 (= (arr!747 _values!1501) (store mapRest!1288 mapKey!1288 mapValue!1288))))

(declare-fun b!27675 () Bool)

(declare-fun res!16403 () Bool)

(assert (=> b!27675 (=> (not res!16403) (not e!17989))))

(declare-fun arrayContainsKey!0 (array!1589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27675 (= res!16403 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3914 res!16398) b!27673))

(assert (= (and b!27673 res!16401) b!27671))

(assert (= (and b!27671 res!16402) b!27667))

(assert (= (and b!27667 res!16404) b!27666))

(assert (= (and b!27666 res!16399) b!27674))

(assert (= (and b!27674 res!16400) b!27675))

(assert (= (and b!27675 res!16403) b!27668))

(assert (= (and b!27670 condMapEmpty!1288) mapIsEmpty!1288))

(assert (= (and b!27670 (not condMapEmpty!1288)) mapNonEmpty!1288))

(get-info :version)

(assert (= (and mapNonEmpty!1288 ((_ is ValueCellFull!387) mapValue!1288)) b!27672))

(assert (= (and b!27670 ((_ is ValueCellFull!387) mapDefault!1288)) b!27669))

(assert (= start!3914 b!27670))

(declare-fun m!22061 () Bool)

(assert (=> mapNonEmpty!1288 m!22061))

(declare-fun m!22063 () Bool)

(assert (=> b!27667 m!22063))

(declare-fun m!22065 () Bool)

(assert (=> b!27666 m!22065))

(declare-fun m!22067 () Bool)

(assert (=> b!27671 m!22067))

(declare-fun m!22069 () Bool)

(assert (=> b!27668 m!22069))

(declare-fun m!22071 () Bool)

(assert (=> b!27674 m!22071))

(assert (=> b!27674 m!22071))

(declare-fun m!22073 () Bool)

(assert (=> b!27674 m!22073))

(declare-fun m!22075 () Bool)

(assert (=> b!27675 m!22075))

(declare-fun m!22077 () Bool)

(assert (=> start!3914 m!22077))

(declare-fun m!22079 () Bool)

(assert (=> start!3914 m!22079))

(declare-fun m!22081 () Bool)

(assert (=> start!3914 m!22081))

(check-sat (not b!27666) (not b!27671) (not b!27674) b_and!1629 (not mapNonEmpty!1288) (not b_next!819) (not b!27668) (not b!27667) (not b!27675) tp_is_empty!1173 (not start!3914))
(check-sat b_and!1629 (not b_next!819))
