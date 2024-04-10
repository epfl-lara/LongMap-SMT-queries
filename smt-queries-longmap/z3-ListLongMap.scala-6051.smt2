; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78228 () Bool)

(assert start!78228)

(declare-fun b_free!16719 () Bool)

(declare-fun b_next!16719 () Bool)

(assert (=> start!78228 (= b_free!16719 (not b_next!16719))))

(declare-fun tp!58433 () Bool)

(declare-fun b_and!27295 () Bool)

(assert (=> start!78228 (= tp!58433 b_and!27295)))

(declare-fun b!913043 () Bool)

(declare-fun e!512131 () Bool)

(declare-fun tp_is_empty!19137 () Bool)

(assert (=> b!913043 (= e!512131 tp_is_empty!19137)))

(declare-fun mapNonEmpty!30433 () Bool)

(declare-fun mapRes!30433 () Bool)

(declare-fun tp!58434 () Bool)

(assert (=> mapNonEmpty!30433 (= mapRes!30433 (and tp!58434 e!512131))))

(declare-datatypes ((V!30481 0))(
  ( (V!30482 (val!9619 Int)) )
))
(declare-datatypes ((ValueCell!9087 0))(
  ( (ValueCellFull!9087 (v!12130 V!30481)) (EmptyCell!9087) )
))
(declare-datatypes ((array!54266 0))(
  ( (array!54267 (arr!26087 (Array (_ BitVec 32) ValueCell!9087)) (size!26546 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54266)

(declare-fun mapKey!30433 () (_ BitVec 32))

(declare-fun mapValue!30433 () ValueCell!9087)

(declare-fun mapRest!30433 () (Array (_ BitVec 32) ValueCell!9087))

(assert (=> mapNonEmpty!30433 (= (arr!26087 _values!1152) (store mapRest!30433 mapKey!30433 mapValue!30433))))

(declare-fun b!913044 () Bool)

(declare-fun res!615925 () Bool)

(declare-fun e!512133 () Bool)

(assert (=> b!913044 (=> (not res!615925) (not e!512133))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54268 0))(
  ( (array!54269 (arr!26088 (Array (_ BitVec 32) (_ BitVec 64))) (size!26547 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54268)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!913044 (= res!615925 (and (= (select (arr!26088 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913045 () Bool)

(declare-fun res!615924 () Bool)

(assert (=> b!913045 (=> (not res!615924) (not e!512133))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54268 (_ BitVec 32)) Bool)

(assert (=> b!913045 (= res!615924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913046 () Bool)

(declare-fun e!512132 () Bool)

(assert (=> b!913046 (= e!512132 tp_is_empty!19137)))

(declare-fun b!913047 () Bool)

(declare-fun res!615923 () Bool)

(assert (=> b!913047 (=> (not res!615923) (not e!512133))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913047 (= res!615923 (inRange!0 i!717 mask!1756))))

(declare-fun b!913048 () Bool)

(declare-fun res!615921 () Bool)

(assert (=> b!913048 (=> (not res!615921) (not e!512133))))

(declare-fun zeroValue!1094 () V!30481)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30481)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12536 0))(
  ( (tuple2!12537 (_1!6279 (_ BitVec 64)) (_2!6279 V!30481)) )
))
(declare-datatypes ((List!18324 0))(
  ( (Nil!18321) (Cons!18320 (h!19466 tuple2!12536) (t!25913 List!18324)) )
))
(declare-datatypes ((ListLongMap!11233 0))(
  ( (ListLongMap!11234 (toList!5632 List!18324)) )
))
(declare-fun contains!4678 (ListLongMap!11233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2894 (array!54268 array!54266 (_ BitVec 32) (_ BitVec 32) V!30481 V!30481 (_ BitVec 32) Int) ListLongMap!11233)

(assert (=> b!913048 (= res!615921 (contains!4678 (getCurrentListMap!2894 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913049 () Bool)

(declare-fun res!615922 () Bool)

(assert (=> b!913049 (=> (not res!615922) (not e!512133))))

(assert (=> b!913049 (= res!615922 (and (= (size!26546 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26547 _keys!1386) (size!26546 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913050 () Bool)

(declare-fun e!512130 () Bool)

(assert (=> b!913050 (= e!512130 (and e!512132 mapRes!30433))))

(declare-fun condMapEmpty!30433 () Bool)

(declare-fun mapDefault!30433 () ValueCell!9087)

(assert (=> b!913050 (= condMapEmpty!30433 (= (arr!26087 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9087)) mapDefault!30433)))))

(declare-fun mapIsEmpty!30433 () Bool)

(assert (=> mapIsEmpty!30433 mapRes!30433))

(declare-fun res!615927 () Bool)

(assert (=> start!78228 (=> (not res!615927) (not e!512133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78228 (= res!615927 (validMask!0 mask!1756))))

(assert (=> start!78228 e!512133))

(declare-fun array_inv!20376 (array!54266) Bool)

(assert (=> start!78228 (and (array_inv!20376 _values!1152) e!512130)))

(assert (=> start!78228 tp!58433))

(assert (=> start!78228 true))

(assert (=> start!78228 tp_is_empty!19137))

(declare-fun array_inv!20377 (array!54268) Bool)

(assert (=> start!78228 (array_inv!20377 _keys!1386)))

(declare-fun b!913051 () Bool)

(assert (=> b!913051 (= e!512133 (not true))))

(declare-fun arrayContainsKey!0 (array!54268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913051 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30906 0))(
  ( (Unit!30907) )
))
(declare-fun lt!410729 () Unit!30906)

(declare-fun lemmaKeyInListMapIsInArray!278 (array!54268 array!54266 (_ BitVec 32) (_ BitVec 32) V!30481 V!30481 (_ BitVec 64) Int) Unit!30906)

(assert (=> b!913051 (= lt!410729 (lemmaKeyInListMapIsInArray!278 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913052 () Bool)

(declare-fun res!615926 () Bool)

(assert (=> b!913052 (=> (not res!615926) (not e!512133))))

(declare-datatypes ((List!18325 0))(
  ( (Nil!18322) (Cons!18321 (h!19467 (_ BitVec 64)) (t!25914 List!18325)) )
))
(declare-fun arrayNoDuplicates!0 (array!54268 (_ BitVec 32) List!18325) Bool)

(assert (=> b!913052 (= res!615926 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18322))))

(assert (= (and start!78228 res!615927) b!913049))

(assert (= (and b!913049 res!615922) b!913045))

(assert (= (and b!913045 res!615924) b!913052))

(assert (= (and b!913052 res!615926) b!913048))

(assert (= (and b!913048 res!615921) b!913047))

(assert (= (and b!913047 res!615923) b!913044))

(assert (= (and b!913044 res!615925) b!913051))

(assert (= (and b!913050 condMapEmpty!30433) mapIsEmpty!30433))

(assert (= (and b!913050 (not condMapEmpty!30433)) mapNonEmpty!30433))

(get-info :version)

(assert (= (and mapNonEmpty!30433 ((_ is ValueCellFull!9087) mapValue!30433)) b!913043))

(assert (= (and b!913050 ((_ is ValueCellFull!9087) mapDefault!30433)) b!913046))

(assert (= start!78228 b!913050))

(declare-fun m!847427 () Bool)

(assert (=> b!913051 m!847427))

(declare-fun m!847429 () Bool)

(assert (=> b!913051 m!847429))

(declare-fun m!847431 () Bool)

(assert (=> b!913045 m!847431))

(declare-fun m!847433 () Bool)

(assert (=> b!913047 m!847433))

(declare-fun m!847435 () Bool)

(assert (=> b!913048 m!847435))

(assert (=> b!913048 m!847435))

(declare-fun m!847437 () Bool)

(assert (=> b!913048 m!847437))

(declare-fun m!847439 () Bool)

(assert (=> start!78228 m!847439))

(declare-fun m!847441 () Bool)

(assert (=> start!78228 m!847441))

(declare-fun m!847443 () Bool)

(assert (=> start!78228 m!847443))

(declare-fun m!847445 () Bool)

(assert (=> mapNonEmpty!30433 m!847445))

(declare-fun m!847447 () Bool)

(assert (=> b!913052 m!847447))

(declare-fun m!847449 () Bool)

(assert (=> b!913044 m!847449))

(check-sat tp_is_empty!19137 (not b!913045) (not b!913047) (not b!913051) b_and!27295 (not b_next!16719) (not mapNonEmpty!30433) (not b!913052) (not start!78228) (not b!913048))
(check-sat b_and!27295 (not b_next!16719))
