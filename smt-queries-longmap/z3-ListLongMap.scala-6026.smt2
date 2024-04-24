; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78208 () Bool)

(assert start!78208)

(declare-fun b_free!16567 () Bool)

(declare-fun b_next!16567 () Bool)

(assert (=> start!78208 (= b_free!16567 (not b_next!16567))))

(declare-fun tp!57973 () Bool)

(declare-fun b_and!27149 () Bool)

(assert (=> start!78208 (= tp!57973 b_and!27149)))

(declare-fun b!911871 () Bool)

(declare-fun res!615009 () Bool)

(declare-fun e!511422 () Bool)

(assert (=> b!911871 (=> (not res!615009) (not e!511422))))

(declare-datatypes ((array!54039 0))(
  ( (array!54040 (arr!25971 (Array (_ BitVec 32) (_ BitVec 64))) (size!26431 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54039)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54039 (_ BitVec 32)) Bool)

(assert (=> b!911871 (= res!615009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911872 () Bool)

(declare-fun e!511419 () Bool)

(declare-fun e!511418 () Bool)

(declare-fun mapRes!30199 () Bool)

(assert (=> b!911872 (= e!511419 (and e!511418 mapRes!30199))))

(declare-fun condMapEmpty!30199 () Bool)

(declare-datatypes ((V!30279 0))(
  ( (V!30280 (val!9543 Int)) )
))
(declare-datatypes ((ValueCell!9011 0))(
  ( (ValueCellFull!9011 (v!12049 V!30279)) (EmptyCell!9011) )
))
(declare-datatypes ((array!54041 0))(
  ( (array!54042 (arr!25972 (Array (_ BitVec 32) ValueCell!9011)) (size!26432 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54041)

(declare-fun mapDefault!30199 () ValueCell!9011)

(assert (=> b!911872 (= condMapEmpty!30199 (= (arr!25972 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9011)) mapDefault!30199)))))

(declare-fun b!911873 () Bool)

(assert (=> b!911873 (= e!511422 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30279)

(declare-fun lt!410694 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30279)

(declare-datatypes ((tuple2!12394 0))(
  ( (tuple2!12395 (_1!6208 (_ BitVec 64)) (_2!6208 V!30279)) )
))
(declare-datatypes ((List!18216 0))(
  ( (Nil!18213) (Cons!18212 (h!19364 tuple2!12394) (t!25793 List!18216)) )
))
(declare-datatypes ((ListLongMap!11093 0))(
  ( (ListLongMap!11094 (toList!5562 List!18216)) )
))
(declare-fun contains!4615 (ListLongMap!11093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2823 (array!54039 array!54041 (_ BitVec 32) (_ BitVec 32) V!30279 V!30279 (_ BitVec 32) Int) ListLongMap!11093)

(assert (=> b!911873 (= lt!410694 (contains!4615 (getCurrentListMap!2823 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!615010 () Bool)

(assert (=> start!78208 (=> (not res!615010) (not e!511422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78208 (= res!615010 (validMask!0 mask!1756))))

(assert (=> start!78208 e!511422))

(declare-fun array_inv!20378 (array!54041) Bool)

(assert (=> start!78208 (and (array_inv!20378 _values!1152) e!511419)))

(assert (=> start!78208 tp!57973))

(assert (=> start!78208 true))

(declare-fun tp_is_empty!18985 () Bool)

(assert (=> start!78208 tp_is_empty!18985))

(declare-fun array_inv!20379 (array!54039) Bool)

(assert (=> start!78208 (array_inv!20379 _keys!1386)))

(declare-fun b!911874 () Bool)

(declare-fun res!615008 () Bool)

(assert (=> b!911874 (=> (not res!615008) (not e!511422))))

(declare-datatypes ((List!18217 0))(
  ( (Nil!18214) (Cons!18213 (h!19365 (_ BitVec 64)) (t!25794 List!18217)) )
))
(declare-fun arrayNoDuplicates!0 (array!54039 (_ BitVec 32) List!18217) Bool)

(assert (=> b!911874 (= res!615008 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18214))))

(declare-fun b!911875 () Bool)

(declare-fun res!615011 () Bool)

(assert (=> b!911875 (=> (not res!615011) (not e!511422))))

(assert (=> b!911875 (= res!615011 (and (= (size!26432 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26431 _keys!1386) (size!26432 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30199 () Bool)

(assert (=> mapIsEmpty!30199 mapRes!30199))

(declare-fun b!911876 () Bool)

(assert (=> b!911876 (= e!511418 tp_is_empty!18985)))

(declare-fun mapNonEmpty!30199 () Bool)

(declare-fun tp!57972 () Bool)

(declare-fun e!511421 () Bool)

(assert (=> mapNonEmpty!30199 (= mapRes!30199 (and tp!57972 e!511421))))

(declare-fun mapKey!30199 () (_ BitVec 32))

(declare-fun mapRest!30199 () (Array (_ BitVec 32) ValueCell!9011))

(declare-fun mapValue!30199 () ValueCell!9011)

(assert (=> mapNonEmpty!30199 (= (arr!25972 _values!1152) (store mapRest!30199 mapKey!30199 mapValue!30199))))

(declare-fun b!911877 () Bool)

(assert (=> b!911877 (= e!511421 tp_is_empty!18985)))

(assert (= (and start!78208 res!615010) b!911875))

(assert (= (and b!911875 res!615011) b!911871))

(assert (= (and b!911871 res!615009) b!911874))

(assert (= (and b!911874 res!615008) b!911873))

(assert (= (and b!911872 condMapEmpty!30199) mapIsEmpty!30199))

(assert (= (and b!911872 (not condMapEmpty!30199)) mapNonEmpty!30199))

(get-info :version)

(assert (= (and mapNonEmpty!30199 ((_ is ValueCellFull!9011) mapValue!30199)) b!911877))

(assert (= (and b!911872 ((_ is ValueCellFull!9011) mapDefault!30199)) b!911876))

(assert (= start!78208 b!911872))

(declare-fun m!847135 () Bool)

(assert (=> start!78208 m!847135))

(declare-fun m!847137 () Bool)

(assert (=> start!78208 m!847137))

(declare-fun m!847139 () Bool)

(assert (=> start!78208 m!847139))

(declare-fun m!847141 () Bool)

(assert (=> b!911874 m!847141))

(declare-fun m!847143 () Bool)

(assert (=> b!911871 m!847143))

(declare-fun m!847145 () Bool)

(assert (=> mapNonEmpty!30199 m!847145))

(declare-fun m!847147 () Bool)

(assert (=> b!911873 m!847147))

(assert (=> b!911873 m!847147))

(declare-fun m!847149 () Bool)

(assert (=> b!911873 m!847149))

(check-sat tp_is_empty!18985 (not mapNonEmpty!30199) (not b!911871) (not b!911874) b_and!27149 (not b_next!16567) (not b!911873) (not start!78208))
(check-sat b_and!27149 (not b_next!16567))
