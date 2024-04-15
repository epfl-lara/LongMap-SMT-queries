; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43258 () Bool)

(assert start!43258)

(declare-fun b_free!12139 () Bool)

(declare-fun b_next!12139 () Bool)

(assert (=> start!43258 (= b_free!12139 (not b_next!12139))))

(declare-fun tp!42687 () Bool)

(declare-fun b_and!20865 () Bool)

(assert (=> start!43258 (= tp!42687 b_and!20865)))

(declare-fun b!479155 () Bool)

(declare-fun e!281884 () Bool)

(declare-fun tp_is_empty!13651 () Bool)

(assert (=> b!479155 (= e!281884 tp_is_empty!13651)))

(declare-fun b!479156 () Bool)

(declare-fun e!281882 () Bool)

(declare-fun mapRes!22174 () Bool)

(assert (=> b!479156 (= e!281882 (and e!281884 mapRes!22174))))

(declare-fun condMapEmpty!22174 () Bool)

(declare-datatypes ((V!19273 0))(
  ( (V!19274 (val!6873 Int)) )
))
(declare-datatypes ((ValueCell!6464 0))(
  ( (ValueCellFull!6464 (v!9156 V!19273)) (EmptyCell!6464) )
))
(declare-datatypes ((array!30965 0))(
  ( (array!30966 (arr!14889 (Array (_ BitVec 32) ValueCell!6464)) (size!15248 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30965)

(declare-fun mapDefault!22174 () ValueCell!6464)

(assert (=> b!479156 (= condMapEmpty!22174 (= (arr!14889 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6464)) mapDefault!22174)))))

(declare-fun res!285854 () Bool)

(declare-fun e!281883 () Bool)

(assert (=> start!43258 (=> (not res!285854) (not e!281883))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43258 (= res!285854 (validMask!0 mask!2352))))

(assert (=> start!43258 e!281883))

(assert (=> start!43258 true))

(assert (=> start!43258 tp_is_empty!13651))

(declare-fun array_inv!10834 (array!30965) Bool)

(assert (=> start!43258 (and (array_inv!10834 _values!1516) e!281882)))

(assert (=> start!43258 tp!42687))

(declare-datatypes ((array!30967 0))(
  ( (array!30968 (arr!14890 (Array (_ BitVec 32) (_ BitVec 64))) (size!15249 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30967)

(declare-fun array_inv!10835 (array!30967) Bool)

(assert (=> start!43258 (array_inv!10835 _keys!1874)))

(declare-fun b!479157 () Bool)

(declare-fun res!285855 () Bool)

(assert (=> b!479157 (=> (not res!285855) (not e!281883))))

(declare-datatypes ((List!9140 0))(
  ( (Nil!9137) (Cons!9136 (h!9992 (_ BitVec 64)) (t!15337 List!9140)) )
))
(declare-fun arrayNoDuplicates!0 (array!30967 (_ BitVec 32) List!9140) Bool)

(assert (=> b!479157 (= res!285855 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9137))))

(declare-fun b!479158 () Bool)

(assert (=> b!479158 (= e!281883 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217627 () Bool)

(declare-fun minValue!1458 () V!19273)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19273)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9078 0))(
  ( (tuple2!9079 (_1!4550 (_ BitVec 64)) (_2!4550 V!19273)) )
))
(declare-datatypes ((List!9141 0))(
  ( (Nil!9138) (Cons!9137 (h!9993 tuple2!9078) (t!15338 List!9141)) )
))
(declare-datatypes ((ListLongMap!7981 0))(
  ( (ListLongMap!7982 (toList!4006 List!9141)) )
))
(declare-fun contains!2581 (ListLongMap!7981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2259 (array!30967 array!30965 (_ BitVec 32) (_ BitVec 32) V!19273 V!19273 (_ BitVec 32) Int) ListLongMap!7981)

(assert (=> b!479158 (= lt!217627 (contains!2581 (getCurrentListMap!2259 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479159 () Bool)

(declare-fun res!285853 () Bool)

(assert (=> b!479159 (=> (not res!285853) (not e!281883))))

(assert (=> b!479159 (= res!285853 (and (= (size!15248 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15249 _keys!1874) (size!15248 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479160 () Bool)

(declare-fun e!281886 () Bool)

(assert (=> b!479160 (= e!281886 tp_is_empty!13651)))

(declare-fun mapIsEmpty!22174 () Bool)

(assert (=> mapIsEmpty!22174 mapRes!22174))

(declare-fun b!479161 () Bool)

(declare-fun res!285852 () Bool)

(assert (=> b!479161 (=> (not res!285852) (not e!281883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30967 (_ BitVec 32)) Bool)

(assert (=> b!479161 (= res!285852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22174 () Bool)

(declare-fun tp!42688 () Bool)

(assert (=> mapNonEmpty!22174 (= mapRes!22174 (and tp!42688 e!281886))))

(declare-fun mapRest!22174 () (Array (_ BitVec 32) ValueCell!6464))

(declare-fun mapValue!22174 () ValueCell!6464)

(declare-fun mapKey!22174 () (_ BitVec 32))

(assert (=> mapNonEmpty!22174 (= (arr!14889 _values!1516) (store mapRest!22174 mapKey!22174 mapValue!22174))))

(assert (= (and start!43258 res!285854) b!479159))

(assert (= (and b!479159 res!285853) b!479161))

(assert (= (and b!479161 res!285852) b!479157))

(assert (= (and b!479157 res!285855) b!479158))

(assert (= (and b!479156 condMapEmpty!22174) mapIsEmpty!22174))

(assert (= (and b!479156 (not condMapEmpty!22174)) mapNonEmpty!22174))

(get-info :version)

(assert (= (and mapNonEmpty!22174 ((_ is ValueCellFull!6464) mapValue!22174)) b!479160))

(assert (= (and b!479156 ((_ is ValueCellFull!6464) mapDefault!22174)) b!479155))

(assert (= start!43258 b!479156))

(declare-fun m!460641 () Bool)

(assert (=> start!43258 m!460641))

(declare-fun m!460643 () Bool)

(assert (=> start!43258 m!460643))

(declare-fun m!460645 () Bool)

(assert (=> start!43258 m!460645))

(declare-fun m!460647 () Bool)

(assert (=> b!479157 m!460647))

(declare-fun m!460649 () Bool)

(assert (=> b!479158 m!460649))

(assert (=> b!479158 m!460649))

(declare-fun m!460651 () Bool)

(assert (=> b!479158 m!460651))

(declare-fun m!460653 () Bool)

(assert (=> b!479161 m!460653))

(declare-fun m!460655 () Bool)

(assert (=> mapNonEmpty!22174 m!460655))

(check-sat (not mapNonEmpty!22174) (not b!479158) (not b!479161) b_and!20865 (not start!43258) (not b_next!12139) (not b!479157) tp_is_empty!13651)
(check-sat b_and!20865 (not b_next!12139))
