; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43200 () Bool)

(assert start!43200)

(declare-fun b!478851 () Bool)

(declare-fun e!281632 () Bool)

(declare-fun e!281633 () Bool)

(declare-fun mapRes!22099 () Bool)

(assert (=> b!478851 (= e!281632 (and e!281633 mapRes!22099))))

(declare-fun condMapEmpty!22099 () Bool)

(declare-datatypes ((V!19209 0))(
  ( (V!19210 (val!6849 Int)) )
))
(declare-datatypes ((ValueCell!6440 0))(
  ( (ValueCellFull!6440 (v!9139 V!19209)) (EmptyCell!6440) )
))
(declare-datatypes ((array!30868 0))(
  ( (array!30869 (arr!14841 (Array (_ BitVec 32) ValueCell!6440)) (size!15199 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30868)

(declare-fun mapDefault!22099 () ValueCell!6440)

(assert (=> b!478851 (= condMapEmpty!22099 (= (arr!14841 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6440)) mapDefault!22099)))))

(declare-fun b!478852 () Bool)

(declare-fun res!285696 () Bool)

(declare-fun e!281630 () Bool)

(assert (=> b!478852 (=> (not res!285696) (not e!281630))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30870 0))(
  ( (array!30871 (arr!14842 (Array (_ BitVec 32) (_ BitVec 64))) (size!15200 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30870)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478852 (= res!285696 (and (= (size!15199 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15200 _keys!1874) (size!15199 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478853 () Bool)

(declare-fun res!285697 () Bool)

(assert (=> b!478853 (=> (not res!285697) (not e!281630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30870 (_ BitVec 32)) Bool)

(assert (=> b!478853 (= res!285697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478854 () Bool)

(declare-fun e!281634 () Bool)

(declare-fun tp_is_empty!13603 () Bool)

(assert (=> b!478854 (= e!281634 tp_is_empty!13603)))

(declare-fun mapIsEmpty!22099 () Bool)

(assert (=> mapIsEmpty!22099 mapRes!22099))

(declare-fun mapNonEmpty!22099 () Bool)

(declare-fun tp!42574 () Bool)

(assert (=> mapNonEmpty!22099 (= mapRes!22099 (and tp!42574 e!281634))))

(declare-fun mapKey!22099 () (_ BitVec 32))

(declare-fun mapRest!22099 () (Array (_ BitVec 32) ValueCell!6440))

(declare-fun mapValue!22099 () ValueCell!6440)

(assert (=> mapNonEmpty!22099 (= (arr!14841 _values!1516) (store mapRest!22099 mapKey!22099 mapValue!22099))))

(declare-fun b!478855 () Bool)

(assert (=> b!478855 (= e!281633 tp_is_empty!13603)))

(declare-fun b!478856 () Bool)

(assert (=> b!478856 (= e!281630 false)))

(declare-fun lt!217801 () Bool)

(declare-datatypes ((List!8984 0))(
  ( (Nil!8981) (Cons!8980 (h!9836 (_ BitVec 64)) (t!15182 List!8984)) )
))
(declare-fun arrayNoDuplicates!0 (array!30870 (_ BitVec 32) List!8984) Bool)

(assert (=> b!478856 (= lt!217801 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8981))))

(declare-fun res!285698 () Bool)

(assert (=> start!43200 (=> (not res!285698) (not e!281630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43200 (= res!285698 (validMask!0 mask!2352))))

(assert (=> start!43200 e!281630))

(assert (=> start!43200 true))

(declare-fun array_inv!10784 (array!30868) Bool)

(assert (=> start!43200 (and (array_inv!10784 _values!1516) e!281632)))

(declare-fun array_inv!10785 (array!30870) Bool)

(assert (=> start!43200 (array_inv!10785 _keys!1874)))

(assert (= (and start!43200 res!285698) b!478852))

(assert (= (and b!478852 res!285696) b!478853))

(assert (= (and b!478853 res!285697) b!478856))

(assert (= (and b!478851 condMapEmpty!22099) mapIsEmpty!22099))

(assert (= (and b!478851 (not condMapEmpty!22099)) mapNonEmpty!22099))

(get-info :version)

(assert (= (and mapNonEmpty!22099 ((_ is ValueCellFull!6440) mapValue!22099)) b!478854))

(assert (= (and b!478851 ((_ is ValueCellFull!6440) mapDefault!22099)) b!478855))

(assert (= start!43200 b!478851))

(declare-fun m!461203 () Bool)

(assert (=> b!478853 m!461203))

(declare-fun m!461205 () Bool)

(assert (=> mapNonEmpty!22099 m!461205))

(declare-fun m!461207 () Bool)

(assert (=> b!478856 m!461207))

(declare-fun m!461209 () Bool)

(assert (=> start!43200 m!461209))

(declare-fun m!461211 () Bool)

(assert (=> start!43200 m!461211))

(declare-fun m!461213 () Bool)

(assert (=> start!43200 m!461213))

(check-sat (not b!478856) (not start!43200) tp_is_empty!13603 (not b!478853) (not mapNonEmpty!22099))
(check-sat)
