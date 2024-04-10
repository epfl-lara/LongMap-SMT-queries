; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82306 () Bool)

(assert start!82306)

(declare-fun b_free!18579 () Bool)

(declare-fun b_next!18579 () Bool)

(assert (=> start!82306 (= b_free!18579 (not b_next!18579))))

(declare-fun tp!64698 () Bool)

(declare-fun b_and!30067 () Bool)

(assert (=> start!82306 (= tp!64698 b_and!30067)))

(declare-fun b!959572 () Bool)

(declare-fun e!540912 () Bool)

(declare-datatypes ((array!58663 0))(
  ( (array!58664 (arr!28205 (Array (_ BitVec 32) (_ BitVec 64))) (size!28684 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58663)

(assert (=> b!959572 (= e!540912 (not (bvsle #b00000000000000000000000000000000 (size!28684 _keys!1668))))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33363 0))(
  ( (V!33364 (val!10693 Int)) )
))
(declare-fun minValue!1328 () V!33363)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10161 0))(
  ( (ValueCellFull!10161 (v!13250 V!33363)) (EmptyCell!10161) )
))
(declare-datatypes ((array!58665 0))(
  ( (array!58666 (arr!28206 (Array (_ BitVec 32) ValueCell!10161)) (size!28685 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58665)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33363)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13796 0))(
  ( (tuple2!13797 (_1!6909 (_ BitVec 64)) (_2!6909 V!33363)) )
))
(declare-datatypes ((List!19614 0))(
  ( (Nil!19611) (Cons!19610 (h!20772 tuple2!13796) (t!27977 List!19614)) )
))
(declare-datatypes ((ListLongMap!12493 0))(
  ( (ListLongMap!12494 (toList!6262 List!19614)) )
))
(declare-fun contains!5363 (ListLongMap!12493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3495 (array!58663 array!58665 (_ BitVec 32) (_ BitVec 32) V!33363 V!33363 (_ BitVec 32) Int) ListLongMap!12493)

(assert (=> b!959572 (contains!5363 (getCurrentListMap!3495 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28205 _keys!1668) i!793))))

(declare-datatypes ((Unit!32197 0))(
  ( (Unit!32198) )
))
(declare-fun lt!430560 () Unit!32197)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!20 (array!58663 array!58665 (_ BitVec 32) (_ BitVec 32) V!33363 V!33363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32197)

(assert (=> b!959572 (= lt!430560 (lemmaInListMapFromThenInFromSmaller!20 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959573 () Bool)

(declare-fun res!642330 () Bool)

(assert (=> b!959573 (=> (not res!642330) (not e!540912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959573 (= res!642330 (validKeyInArray!0 (select (arr!28205 _keys!1668) i!793)))))

(declare-fun b!959574 () Bool)

(declare-fun res!642326 () Bool)

(assert (=> b!959574 (=> (not res!642326) (not e!540912))))

(declare-datatypes ((List!19615 0))(
  ( (Nil!19612) (Cons!19611 (h!20773 (_ BitVec 64)) (t!27978 List!19615)) )
))
(declare-fun arrayNoDuplicates!0 (array!58663 (_ BitVec 32) List!19615) Bool)

(assert (=> b!959574 (= res!642326 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19612))))

(declare-fun b!959575 () Bool)

(declare-fun e!540911 () Bool)

(declare-fun tp_is_empty!21285 () Bool)

(assert (=> b!959575 (= e!540911 tp_is_empty!21285)))

(declare-fun b!959576 () Bool)

(declare-fun res!642329 () Bool)

(assert (=> b!959576 (=> (not res!642329) (not e!540912))))

(assert (=> b!959576 (= res!642329 (contains!5363 (getCurrentListMap!3495 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28205 _keys!1668) i!793)))))

(declare-fun res!642328 () Bool)

(assert (=> start!82306 (=> (not res!642328) (not e!540912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82306 (= res!642328 (validMask!0 mask!2088))))

(assert (=> start!82306 e!540912))

(assert (=> start!82306 true))

(assert (=> start!82306 tp_is_empty!21285))

(declare-fun array_inv!21863 (array!58663) Bool)

(assert (=> start!82306 (array_inv!21863 _keys!1668)))

(declare-fun e!540914 () Bool)

(declare-fun array_inv!21864 (array!58665) Bool)

(assert (=> start!82306 (and (array_inv!21864 _values!1386) e!540914)))

(assert (=> start!82306 tp!64698))

(declare-fun b!959577 () Bool)

(declare-fun e!540915 () Bool)

(declare-fun mapRes!33907 () Bool)

(assert (=> b!959577 (= e!540914 (and e!540915 mapRes!33907))))

(declare-fun condMapEmpty!33907 () Bool)

(declare-fun mapDefault!33907 () ValueCell!10161)

(assert (=> b!959577 (= condMapEmpty!33907 (= (arr!28206 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10161)) mapDefault!33907)))))

(declare-fun mapIsEmpty!33907 () Bool)

(assert (=> mapIsEmpty!33907 mapRes!33907))

(declare-fun b!959578 () Bool)

(declare-fun res!642331 () Bool)

(assert (=> b!959578 (=> (not res!642331) (not e!540912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58663 (_ BitVec 32)) Bool)

(assert (=> b!959578 (= res!642331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959579 () Bool)

(declare-fun res!642327 () Bool)

(assert (=> b!959579 (=> (not res!642327) (not e!540912))))

(assert (=> b!959579 (= res!642327 (and (= (size!28685 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28684 _keys!1668) (size!28685 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959580 () Bool)

(declare-fun res!642332 () Bool)

(assert (=> b!959580 (=> (not res!642332) (not e!540912))))

(assert (=> b!959580 (= res!642332 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28684 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28684 _keys!1668))))))

(declare-fun mapNonEmpty!33907 () Bool)

(declare-fun tp!64697 () Bool)

(assert (=> mapNonEmpty!33907 (= mapRes!33907 (and tp!64697 e!540911))))

(declare-fun mapValue!33907 () ValueCell!10161)

(declare-fun mapKey!33907 () (_ BitVec 32))

(declare-fun mapRest!33907 () (Array (_ BitVec 32) ValueCell!10161))

(assert (=> mapNonEmpty!33907 (= (arr!28206 _values!1386) (store mapRest!33907 mapKey!33907 mapValue!33907))))

(declare-fun b!959581 () Bool)

(assert (=> b!959581 (= e!540915 tp_is_empty!21285)))

(assert (= (and start!82306 res!642328) b!959579))

(assert (= (and b!959579 res!642327) b!959578))

(assert (= (and b!959578 res!642331) b!959574))

(assert (= (and b!959574 res!642326) b!959580))

(assert (= (and b!959580 res!642332) b!959573))

(assert (= (and b!959573 res!642330) b!959576))

(assert (= (and b!959576 res!642329) b!959572))

(assert (= (and b!959577 condMapEmpty!33907) mapIsEmpty!33907))

(assert (= (and b!959577 (not condMapEmpty!33907)) mapNonEmpty!33907))

(get-info :version)

(assert (= (and mapNonEmpty!33907 ((_ is ValueCellFull!10161) mapValue!33907)) b!959575))

(assert (= (and b!959577 ((_ is ValueCellFull!10161) mapDefault!33907)) b!959581))

(assert (= start!82306 b!959577))

(declare-fun m!890047 () Bool)

(assert (=> mapNonEmpty!33907 m!890047))

(declare-fun m!890049 () Bool)

(assert (=> b!959578 m!890049))

(declare-fun m!890051 () Bool)

(assert (=> start!82306 m!890051))

(declare-fun m!890053 () Bool)

(assert (=> start!82306 m!890053))

(declare-fun m!890055 () Bool)

(assert (=> start!82306 m!890055))

(declare-fun m!890057 () Bool)

(assert (=> b!959573 m!890057))

(assert (=> b!959573 m!890057))

(declare-fun m!890059 () Bool)

(assert (=> b!959573 m!890059))

(declare-fun m!890061 () Bool)

(assert (=> b!959576 m!890061))

(assert (=> b!959576 m!890057))

(assert (=> b!959576 m!890061))

(assert (=> b!959576 m!890057))

(declare-fun m!890063 () Bool)

(assert (=> b!959576 m!890063))

(declare-fun m!890065 () Bool)

(assert (=> b!959574 m!890065))

(declare-fun m!890067 () Bool)

(assert (=> b!959572 m!890067))

(assert (=> b!959572 m!890057))

(assert (=> b!959572 m!890067))

(assert (=> b!959572 m!890057))

(declare-fun m!890069 () Bool)

(assert (=> b!959572 m!890069))

(declare-fun m!890071 () Bool)

(assert (=> b!959572 m!890071))

(check-sat (not b!959576) (not b!959574) (not start!82306) (not b!959573) (not b_next!18579) tp_is_empty!21285 b_and!30067 (not b!959572) (not b!959578) (not mapNonEmpty!33907))
(check-sat b_and!30067 (not b_next!18579))
