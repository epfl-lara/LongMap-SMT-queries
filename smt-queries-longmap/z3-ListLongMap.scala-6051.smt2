; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78208 () Bool)

(assert start!78208)

(declare-fun b_free!16717 () Bool)

(declare-fun b_next!16717 () Bool)

(assert (=> start!78208 (= b_free!16717 (not b_next!16717))))

(declare-fun tp!58429 () Bool)

(declare-fun b_and!27267 () Bool)

(assert (=> start!78208 (= tp!58429 b_and!27267)))

(declare-fun b!912774 () Bool)

(declare-fun e!511968 () Bool)

(declare-fun tp_is_empty!19135 () Bool)

(assert (=> b!912774 (= e!511968 tp_is_empty!19135)))

(declare-fun b!912775 () Bool)

(declare-fun res!615791 () Bool)

(declare-fun e!511970 () Bool)

(assert (=> b!912775 (=> (not res!615791) (not e!511970))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54263 0))(
  ( (array!54264 (arr!26086 (Array (_ BitVec 32) (_ BitVec 64))) (size!26547 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54263)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912775 (= res!615791 (and (= (select (arr!26086 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!615790 () Bool)

(assert (=> start!78208 (=> (not res!615790) (not e!511970))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78208 (= res!615790 (validMask!0 mask!1756))))

(assert (=> start!78208 e!511970))

(declare-datatypes ((V!30479 0))(
  ( (V!30480 (val!9618 Int)) )
))
(declare-datatypes ((ValueCell!9086 0))(
  ( (ValueCellFull!9086 (v!12128 V!30479)) (EmptyCell!9086) )
))
(declare-datatypes ((array!54265 0))(
  ( (array!54266 (arr!26087 (Array (_ BitVec 32) ValueCell!9086)) (size!26548 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54265)

(declare-fun e!511969 () Bool)

(declare-fun array_inv!20452 (array!54265) Bool)

(assert (=> start!78208 (and (array_inv!20452 _values!1152) e!511969)))

(assert (=> start!78208 tp!58429))

(assert (=> start!78208 true))

(assert (=> start!78208 tp_is_empty!19135))

(declare-fun array_inv!20453 (array!54263) Bool)

(assert (=> start!78208 (array_inv!20453 _keys!1386)))

(declare-fun b!912776 () Bool)

(assert (=> b!912776 (= e!511970 (not true))))

(declare-fun arrayContainsKey!0 (array!54263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912776 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30826 0))(
  ( (Unit!30827) )
))
(declare-fun lt!410490 () Unit!30826)

(declare-fun zeroValue!1094 () V!30479)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30479)

(declare-fun lemmaKeyInListMapIsInArray!270 (array!54263 array!54265 (_ BitVec 32) (_ BitVec 32) V!30479 V!30479 (_ BitVec 64) Int) Unit!30826)

(assert (=> b!912776 (= lt!410490 (lemmaKeyInListMapIsInArray!270 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912777 () Bool)

(declare-fun res!615796 () Bool)

(assert (=> b!912777 (=> (not res!615796) (not e!511970))))

(declare-datatypes ((tuple2!12578 0))(
  ( (tuple2!12579 (_1!6300 (_ BitVec 64)) (_2!6300 V!30479)) )
))
(declare-datatypes ((List!18358 0))(
  ( (Nil!18355) (Cons!18354 (h!19500 tuple2!12578) (t!25938 List!18358)) )
))
(declare-datatypes ((ListLongMap!11265 0))(
  ( (ListLongMap!11266 (toList!5648 List!18358)) )
))
(declare-fun contains!4651 (ListLongMap!11265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2850 (array!54263 array!54265 (_ BitVec 32) (_ BitVec 32) V!30479 V!30479 (_ BitVec 32) Int) ListLongMap!11265)

(assert (=> b!912777 (= res!615796 (contains!4651 (getCurrentListMap!2850 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912778 () Bool)

(declare-fun res!615794 () Bool)

(assert (=> b!912778 (=> (not res!615794) (not e!511970))))

(assert (=> b!912778 (= res!615794 (and (= (size!26548 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26547 _keys!1386) (size!26548 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912779 () Bool)

(declare-fun res!615795 () Bool)

(assert (=> b!912779 (=> (not res!615795) (not e!511970))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912779 (= res!615795 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30430 () Bool)

(declare-fun mapRes!30430 () Bool)

(declare-fun tp!58428 () Bool)

(assert (=> mapNonEmpty!30430 (= mapRes!30430 (and tp!58428 e!511968))))

(declare-fun mapValue!30430 () ValueCell!9086)

(declare-fun mapRest!30430 () (Array (_ BitVec 32) ValueCell!9086))

(declare-fun mapKey!30430 () (_ BitVec 32))

(assert (=> mapNonEmpty!30430 (= (arr!26087 _values!1152) (store mapRest!30430 mapKey!30430 mapValue!30430))))

(declare-fun b!912780 () Bool)

(declare-fun res!615793 () Bool)

(assert (=> b!912780 (=> (not res!615793) (not e!511970))))

(declare-datatypes ((List!18359 0))(
  ( (Nil!18356) (Cons!18355 (h!19501 (_ BitVec 64)) (t!25939 List!18359)) )
))
(declare-fun arrayNoDuplicates!0 (array!54263 (_ BitVec 32) List!18359) Bool)

(assert (=> b!912780 (= res!615793 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18356))))

(declare-fun mapIsEmpty!30430 () Bool)

(assert (=> mapIsEmpty!30430 mapRes!30430))

(declare-fun b!912781 () Bool)

(declare-fun res!615792 () Bool)

(assert (=> b!912781 (=> (not res!615792) (not e!511970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54263 (_ BitVec 32)) Bool)

(assert (=> b!912781 (= res!615792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912782 () Bool)

(declare-fun e!511966 () Bool)

(assert (=> b!912782 (= e!511966 tp_is_empty!19135)))

(declare-fun b!912783 () Bool)

(assert (=> b!912783 (= e!511969 (and e!511966 mapRes!30430))))

(declare-fun condMapEmpty!30430 () Bool)

(declare-fun mapDefault!30430 () ValueCell!9086)

(assert (=> b!912783 (= condMapEmpty!30430 (= (arr!26087 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9086)) mapDefault!30430)))))

(assert (= (and start!78208 res!615790) b!912778))

(assert (= (and b!912778 res!615794) b!912781))

(assert (= (and b!912781 res!615792) b!912780))

(assert (= (and b!912780 res!615793) b!912777))

(assert (= (and b!912777 res!615796) b!912779))

(assert (= (and b!912779 res!615795) b!912775))

(assert (= (and b!912775 res!615791) b!912776))

(assert (= (and b!912783 condMapEmpty!30430) mapIsEmpty!30430))

(assert (= (and b!912783 (not condMapEmpty!30430)) mapNonEmpty!30430))

(get-info :version)

(assert (= (and mapNonEmpty!30430 ((_ is ValueCellFull!9086) mapValue!30430)) b!912774))

(assert (= (and b!912783 ((_ is ValueCellFull!9086) mapDefault!30430)) b!912782))

(assert (= start!78208 b!912783))

(declare-fun m!846645 () Bool)

(assert (=> b!912781 m!846645))

(declare-fun m!846647 () Bool)

(assert (=> b!912777 m!846647))

(assert (=> b!912777 m!846647))

(declare-fun m!846649 () Bool)

(assert (=> b!912777 m!846649))

(declare-fun m!846651 () Bool)

(assert (=> b!912779 m!846651))

(declare-fun m!846653 () Bool)

(assert (=> b!912780 m!846653))

(declare-fun m!846655 () Bool)

(assert (=> start!78208 m!846655))

(declare-fun m!846657 () Bool)

(assert (=> start!78208 m!846657))

(declare-fun m!846659 () Bool)

(assert (=> start!78208 m!846659))

(declare-fun m!846661 () Bool)

(assert (=> b!912776 m!846661))

(declare-fun m!846663 () Bool)

(assert (=> b!912776 m!846663))

(declare-fun m!846665 () Bool)

(assert (=> b!912775 m!846665))

(declare-fun m!846667 () Bool)

(assert (=> mapNonEmpty!30430 m!846667))

(check-sat (not b!912780) (not b!912776) (not b!912779) tp_is_empty!19135 (not b!912781) (not b_next!16717) (not start!78208) (not b!912777) b_and!27267 (not mapNonEmpty!30430))
(check-sat b_and!27267 (not b_next!16717))
