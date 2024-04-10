; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78632 () Bool)

(assert start!78632)

(declare-fun b_free!16845 () Bool)

(declare-fun b_next!16845 () Bool)

(assert (=> start!78632 (= b_free!16845 (not b_next!16845))))

(declare-fun tp!58976 () Bool)

(declare-fun b_and!27467 () Bool)

(assert (=> start!78632 (= tp!58976 b_and!27467)))

(declare-fun b!916674 () Bool)

(declare-fun e!514591 () Bool)

(declare-fun e!514590 () Bool)

(declare-fun mapRes!30786 () Bool)

(assert (=> b!916674 (= e!514591 (and e!514590 mapRes!30786))))

(declare-fun condMapEmpty!30786 () Bool)

(declare-datatypes ((V!30769 0))(
  ( (V!30770 (val!9727 Int)) )
))
(declare-datatypes ((ValueCell!9195 0))(
  ( (ValueCellFull!9195 (v!12245 V!30769)) (EmptyCell!9195) )
))
(declare-datatypes ((array!54692 0))(
  ( (array!54693 (arr!26291 (Array (_ BitVec 32) ValueCell!9195)) (size!26750 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54692)

(declare-fun mapDefault!30786 () ValueCell!9195)

(assert (=> b!916674 (= condMapEmpty!30786 (= (arr!26291 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9195)) mapDefault!30786)))))

(declare-fun b!916675 () Bool)

(declare-fun res!617974 () Bool)

(declare-fun e!514594 () Bool)

(assert (=> b!916675 (=> (not res!617974) (not e!514594))))

(declare-datatypes ((array!54694 0))(
  ( (array!54695 (arr!26292 (Array (_ BitVec 32) (_ BitVec 64))) (size!26751 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54694)

(declare-datatypes ((List!18433 0))(
  ( (Nil!18430) (Cons!18429 (h!19575 (_ BitVec 64)) (t!26046 List!18433)) )
))
(declare-fun arrayNoDuplicates!0 (array!54694 (_ BitVec 32) List!18433) Bool)

(assert (=> b!916675 (= res!617974 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18430))))

(declare-fun mapNonEmpty!30786 () Bool)

(declare-fun tp!58975 () Bool)

(declare-fun e!514589 () Bool)

(assert (=> mapNonEmpty!30786 (= mapRes!30786 (and tp!58975 e!514589))))

(declare-fun mapRest!30786 () (Array (_ BitVec 32) ValueCell!9195))

(declare-fun mapKey!30786 () (_ BitVec 32))

(declare-fun mapValue!30786 () ValueCell!9195)

(assert (=> mapNonEmpty!30786 (= (arr!26291 _values!1231) (store mapRest!30786 mapKey!30786 mapValue!30786))))

(declare-fun mapIsEmpty!30786 () Bool)

(assert (=> mapIsEmpty!30786 mapRes!30786))

(declare-fun res!617977 () Bool)

(assert (=> start!78632 (=> (not res!617977) (not e!514594))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78632 (= res!617977 (validMask!0 mask!1881))))

(assert (=> start!78632 e!514594))

(assert (=> start!78632 true))

(declare-fun array_inv!20504 (array!54692) Bool)

(assert (=> start!78632 (and (array_inv!20504 _values!1231) e!514591)))

(assert (=> start!78632 tp!58976))

(declare-fun array_inv!20505 (array!54694) Bool)

(assert (=> start!78632 (array_inv!20505 _keys!1487)))

(declare-fun tp_is_empty!19353 () Bool)

(assert (=> start!78632 tp_is_empty!19353))

(declare-fun b!916676 () Bool)

(assert (=> b!916676 (= e!514589 tp_is_empty!19353)))

(declare-fun b!916677 () Bool)

(declare-fun res!617975 () Bool)

(assert (=> b!916677 (=> (not res!617975) (not e!514594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54694 (_ BitVec 32)) Bool)

(assert (=> b!916677 (= res!617975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916678 () Bool)

(assert (=> b!916678 (= e!514590 tp_is_empty!19353)))

(declare-fun b!916679 () Bool)

(declare-fun e!514592 () Bool)

(assert (=> b!916679 (= e!514592 false)))

(declare-fun lt!411844 () V!30769)

(declare-datatypes ((tuple2!12622 0))(
  ( (tuple2!12623 (_1!6322 (_ BitVec 64)) (_2!6322 V!30769)) )
))
(declare-datatypes ((List!18434 0))(
  ( (Nil!18431) (Cons!18430 (h!19576 tuple2!12622) (t!26047 List!18434)) )
))
(declare-datatypes ((ListLongMap!11319 0))(
  ( (ListLongMap!11320 (toList!5675 List!18434)) )
))
(declare-fun lt!411843 () ListLongMap!11319)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!533 (ListLongMap!11319 (_ BitVec 64)) V!30769)

(assert (=> b!916679 (= lt!411844 (apply!533 lt!411843 k0!1099))))

(declare-fun b!916680 () Bool)

(assert (=> b!916680 (= e!514594 e!514592)))

(declare-fun res!617972 () Bool)

(assert (=> b!916680 (=> (not res!617972) (not e!514592))))

(declare-fun contains!4728 (ListLongMap!11319 (_ BitVec 64)) Bool)

(assert (=> b!916680 (= res!617972 (contains!4728 lt!411843 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30769)

(declare-fun minValue!1173 () V!30769)

(declare-fun getCurrentListMap!2935 (array!54694 array!54692 (_ BitVec 32) (_ BitVec 32) V!30769 V!30769 (_ BitVec 32) Int) ListLongMap!11319)

(assert (=> b!916680 (= lt!411843 (getCurrentListMap!2935 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916681 () Bool)

(declare-fun res!617973 () Bool)

(assert (=> b!916681 (=> (not res!617973) (not e!514594))))

(assert (=> b!916681 (= res!617973 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26751 _keys!1487))))))

(declare-fun b!916682 () Bool)

(declare-fun res!617976 () Bool)

(assert (=> b!916682 (=> (not res!617976) (not e!514594))))

(assert (=> b!916682 (= res!617976 (and (= (size!26750 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26751 _keys!1487) (size!26750 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78632 res!617977) b!916682))

(assert (= (and b!916682 res!617976) b!916677))

(assert (= (and b!916677 res!617975) b!916675))

(assert (= (and b!916675 res!617974) b!916681))

(assert (= (and b!916681 res!617973) b!916680))

(assert (= (and b!916680 res!617972) b!916679))

(assert (= (and b!916674 condMapEmpty!30786) mapIsEmpty!30786))

(assert (= (and b!916674 (not condMapEmpty!30786)) mapNonEmpty!30786))

(get-info :version)

(assert (= (and mapNonEmpty!30786 ((_ is ValueCellFull!9195) mapValue!30786)) b!916676))

(assert (= (and b!916674 ((_ is ValueCellFull!9195) mapDefault!30786)) b!916678))

(assert (= start!78632 b!916674))

(declare-fun m!850623 () Bool)

(assert (=> start!78632 m!850623))

(declare-fun m!850625 () Bool)

(assert (=> start!78632 m!850625))

(declare-fun m!850627 () Bool)

(assert (=> start!78632 m!850627))

(declare-fun m!850629 () Bool)

(assert (=> b!916675 m!850629))

(declare-fun m!850631 () Bool)

(assert (=> b!916679 m!850631))

(declare-fun m!850633 () Bool)

(assert (=> b!916677 m!850633))

(declare-fun m!850635 () Bool)

(assert (=> mapNonEmpty!30786 m!850635))

(declare-fun m!850637 () Bool)

(assert (=> b!916680 m!850637))

(declare-fun m!850639 () Bool)

(assert (=> b!916680 m!850639))

(check-sat (not b!916680) (not start!78632) (not b!916677) (not mapNonEmpty!30786) (not b!916675) (not b_next!16845) tp_is_empty!19353 b_and!27467 (not b!916679))
(check-sat b_and!27467 (not b_next!16845))
