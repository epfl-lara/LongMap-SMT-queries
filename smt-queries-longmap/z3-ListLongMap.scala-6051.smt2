; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78394 () Bool)

(assert start!78394)

(declare-fun b_free!16717 () Bool)

(declare-fun b_next!16717 () Bool)

(assert (=> start!78394 (= b_free!16717 (not b_next!16717))))

(declare-fun tp!58429 () Bool)

(declare-fun b_and!27303 () Bool)

(assert (=> start!78394 (= tp!58429 b_and!27303)))

(declare-fun mapNonEmpty!30430 () Bool)

(declare-fun mapRes!30430 () Bool)

(declare-fun tp!58428 () Bool)

(declare-fun e!512696 () Bool)

(assert (=> mapNonEmpty!30430 (= mapRes!30430 (and tp!58428 e!512696))))

(declare-datatypes ((V!30479 0))(
  ( (V!30480 (val!9618 Int)) )
))
(declare-datatypes ((ValueCell!9086 0))(
  ( (ValueCellFull!9086 (v!12126 V!30479)) (EmptyCell!9086) )
))
(declare-datatypes ((array!54317 0))(
  ( (array!54318 (arr!26108 (Array (_ BitVec 32) ValueCell!9086)) (size!26568 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54317)

(declare-fun mapKey!30430 () (_ BitVec 32))

(declare-fun mapValue!30430 () ValueCell!9086)

(declare-fun mapRest!30430 () (Array (_ BitVec 32) ValueCell!9086))

(assert (=> mapNonEmpty!30430 (= (arr!26108 _values!1152) (store mapRest!30430 mapKey!30430 mapValue!30430))))

(declare-fun b!913917 () Bool)

(declare-fun res!616247 () Bool)

(declare-fun e!512697 () Bool)

(assert (=> b!913917 (=> (not res!616247) (not e!512697))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54319 0))(
  ( (array!54320 (arr!26109 (Array (_ BitVec 32) (_ BitVec 64))) (size!26569 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54319)

(assert (=> b!913917 (= res!616247 (and (= (size!26568 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26569 _keys!1386) (size!26568 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913918 () Bool)

(declare-fun res!616246 () Bool)

(assert (=> b!913918 (=> (not res!616246) (not e!512697))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!913918 (= res!616246 (and (= (select (arr!26109 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913919 () Bool)

(assert (=> b!913919 (= e!512697 (not true))))

(declare-fun arrayContainsKey!0 (array!54319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913919 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun minValue!1094 () V!30479)

(declare-fun zeroValue!1094 () V!30479)

(declare-datatypes ((Unit!30886 0))(
  ( (Unit!30887) )
))
(declare-fun lt!411087 () Unit!30886)

(declare-fun lemmaKeyInListMapIsInArray!274 (array!54319 array!54317 (_ BitVec 32) (_ BitVec 32) V!30479 V!30479 (_ BitVec 64) Int) Unit!30886)

(assert (=> b!913919 (= lt!411087 (lemmaKeyInListMapIsInArray!274 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913920 () Bool)

(declare-fun res!616249 () Bool)

(assert (=> b!913920 (=> (not res!616249) (not e!512697))))

(declare-datatypes ((List!18306 0))(
  ( (Nil!18303) (Cons!18302 (h!19454 (_ BitVec 64)) (t!25887 List!18306)) )
))
(declare-fun arrayNoDuplicates!0 (array!54319 (_ BitVec 32) List!18306) Bool)

(assert (=> b!913920 (= res!616249 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18303))))

(declare-fun b!913921 () Bool)

(declare-fun res!616244 () Bool)

(assert (=> b!913921 (=> (not res!616244) (not e!512697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54319 (_ BitVec 32)) Bool)

(assert (=> b!913921 (= res!616244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913922 () Bool)

(declare-fun tp_is_empty!19135 () Bool)

(assert (=> b!913922 (= e!512696 tp_is_empty!19135)))

(declare-fun res!616245 () Bool)

(assert (=> start!78394 (=> (not res!616245) (not e!512697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78394 (= res!616245 (validMask!0 mask!1756))))

(assert (=> start!78394 e!512697))

(declare-fun e!512700 () Bool)

(declare-fun array_inv!20480 (array!54317) Bool)

(assert (=> start!78394 (and (array_inv!20480 _values!1152) e!512700)))

(assert (=> start!78394 tp!58429))

(assert (=> start!78394 true))

(assert (=> start!78394 tp_is_empty!19135))

(declare-fun array_inv!20481 (array!54319) Bool)

(assert (=> start!78394 (array_inv!20481 _keys!1386)))

(declare-fun b!913916 () Bool)

(declare-fun e!512699 () Bool)

(assert (=> b!913916 (= e!512699 tp_is_empty!19135)))

(declare-fun mapIsEmpty!30430 () Bool)

(assert (=> mapIsEmpty!30430 mapRes!30430))

(declare-fun b!913923 () Bool)

(declare-fun res!616250 () Bool)

(assert (=> b!913923 (=> (not res!616250) (not e!512697))))

(declare-datatypes ((tuple2!12488 0))(
  ( (tuple2!12489 (_1!6255 (_ BitVec 64)) (_2!6255 V!30479)) )
))
(declare-datatypes ((List!18307 0))(
  ( (Nil!18304) (Cons!18303 (h!19455 tuple2!12488) (t!25888 List!18307)) )
))
(declare-datatypes ((ListLongMap!11187 0))(
  ( (ListLongMap!11188 (toList!5609 List!18307)) )
))
(declare-fun contains!4664 (ListLongMap!11187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2870 (array!54319 array!54317 (_ BitVec 32) (_ BitVec 32) V!30479 V!30479 (_ BitVec 32) Int) ListLongMap!11187)

(assert (=> b!913923 (= res!616250 (contains!4664 (getCurrentListMap!2870 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913924 () Bool)

(assert (=> b!913924 (= e!512700 (and e!512699 mapRes!30430))))

(declare-fun condMapEmpty!30430 () Bool)

(declare-fun mapDefault!30430 () ValueCell!9086)

(assert (=> b!913924 (= condMapEmpty!30430 (= (arr!26108 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9086)) mapDefault!30430)))))

(declare-fun b!913925 () Bool)

(declare-fun res!616248 () Bool)

(assert (=> b!913925 (=> (not res!616248) (not e!512697))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913925 (= res!616248 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78394 res!616245) b!913917))

(assert (= (and b!913917 res!616247) b!913921))

(assert (= (and b!913921 res!616244) b!913920))

(assert (= (and b!913920 res!616249) b!913923))

(assert (= (and b!913923 res!616250) b!913925))

(assert (= (and b!913925 res!616248) b!913918))

(assert (= (and b!913918 res!616246) b!913919))

(assert (= (and b!913924 condMapEmpty!30430) mapIsEmpty!30430))

(assert (= (and b!913924 (not condMapEmpty!30430)) mapNonEmpty!30430))

(get-info :version)

(assert (= (and mapNonEmpty!30430 ((_ is ValueCellFull!9086) mapValue!30430)) b!913922))

(assert (= (and b!913924 ((_ is ValueCellFull!9086) mapDefault!30430)) b!913916))

(assert (= start!78394 b!913924))

(declare-fun m!848697 () Bool)

(assert (=> b!913920 m!848697))

(declare-fun m!848699 () Bool)

(assert (=> mapNonEmpty!30430 m!848699))

(declare-fun m!848701 () Bool)

(assert (=> b!913918 m!848701))

(declare-fun m!848703 () Bool)

(assert (=> b!913921 m!848703))

(declare-fun m!848705 () Bool)

(assert (=> b!913925 m!848705))

(declare-fun m!848707 () Bool)

(assert (=> start!78394 m!848707))

(declare-fun m!848709 () Bool)

(assert (=> start!78394 m!848709))

(declare-fun m!848711 () Bool)

(assert (=> start!78394 m!848711))

(declare-fun m!848713 () Bool)

(assert (=> b!913919 m!848713))

(declare-fun m!848715 () Bool)

(assert (=> b!913919 m!848715))

(declare-fun m!848717 () Bool)

(assert (=> b!913923 m!848717))

(assert (=> b!913923 m!848717))

(declare-fun m!848719 () Bool)

(assert (=> b!913923 m!848719))

(check-sat (not b!913921) b_and!27303 (not b!913919) (not b!913923) (not b!913925) (not start!78394) (not b!913920) tp_is_empty!19135 (not mapNonEmpty!30430) (not b_next!16717))
(check-sat b_and!27303 (not b_next!16717))
