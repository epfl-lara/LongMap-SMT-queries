; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3756 () Bool)

(assert start!3756)

(declare-fun res!15554 () Bool)

(declare-fun e!17000 () Bool)

(assert (=> start!3756 (=> (not res!15554) (not e!17000))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3756 (= res!15554 (validMask!0 mask!2294))))

(assert (=> start!3756 e!17000))

(assert (=> start!3756 true))

(declare-datatypes ((V!1267 0))(
  ( (V!1268 (val!567 Int)) )
))
(declare-datatypes ((ValueCell!341 0))(
  ( (ValueCellFull!341 (v!1653 V!1267)) (EmptyCell!341) )
))
(declare-datatypes ((array!1391 0))(
  ( (array!1392 (arr!653 (Array (_ BitVec 32) ValueCell!341)) (size!754 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1391)

(declare-fun e!17002 () Bool)

(declare-fun array_inv!457 (array!1391) Bool)

(assert (=> start!3756 (and (array_inv!457 _values!1501) e!17002)))

(declare-datatypes ((array!1393 0))(
  ( (array!1394 (arr!654 (Array (_ BitVec 32) (_ BitVec 64))) (size!755 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1393)

(declare-fun array_inv!458 (array!1393) Bool)

(assert (=> start!3756 (array_inv!458 _keys!1833)))

(declare-fun b!26162 () Bool)

(declare-fun e!16998 () Bool)

(declare-fun tp_is_empty!1081 () Bool)

(assert (=> b!26162 (= e!16998 tp_is_empty!1081)))

(declare-fun b!26163 () Bool)

(declare-fun e!16999 () Bool)

(assert (=> b!26163 (= e!16999 tp_is_empty!1081)))

(declare-fun b!26164 () Bool)

(declare-fun res!15553 () Bool)

(assert (=> b!26164 (=> (not res!15553) (not e!17000))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26164 (= res!15553 (and (= (size!754 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!755 _keys!1833) (size!754 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26165 () Bool)

(declare-fun mapRes!1138 () Bool)

(assert (=> b!26165 (= e!17002 (and e!16999 mapRes!1138))))

(declare-fun condMapEmpty!1138 () Bool)

(declare-fun mapDefault!1138 () ValueCell!341)

(assert (=> b!26165 (= condMapEmpty!1138 (= (arr!653 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!341)) mapDefault!1138)))))

(declare-fun b!26166 () Bool)

(assert (=> b!26166 (= e!17000 false)))

(declare-fun lt!10287 () Bool)

(declare-datatypes ((List!577 0))(
  ( (Nil!574) (Cons!573 (h!1140 (_ BitVec 64)) (t!3258 List!577)) )
))
(declare-fun arrayNoDuplicates!0 (array!1393 (_ BitVec 32) List!577) Bool)

(assert (=> b!26166 (= lt!10287 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!574))))

(declare-fun mapIsEmpty!1138 () Bool)

(assert (=> mapIsEmpty!1138 mapRes!1138))

(declare-fun mapNonEmpty!1138 () Bool)

(declare-fun tp!3658 () Bool)

(assert (=> mapNonEmpty!1138 (= mapRes!1138 (and tp!3658 e!16998))))

(declare-fun mapKey!1138 () (_ BitVec 32))

(declare-fun mapValue!1138 () ValueCell!341)

(declare-fun mapRest!1138 () (Array (_ BitVec 32) ValueCell!341))

(assert (=> mapNonEmpty!1138 (= (arr!653 _values!1501) (store mapRest!1138 mapKey!1138 mapValue!1138))))

(declare-fun b!26167 () Bool)

(declare-fun res!15552 () Bool)

(assert (=> b!26167 (=> (not res!15552) (not e!17000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1393 (_ BitVec 32)) Bool)

(assert (=> b!26167 (= res!15552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3756 res!15554) b!26164))

(assert (= (and b!26164 res!15553) b!26167))

(assert (= (and b!26167 res!15552) b!26166))

(assert (= (and b!26165 condMapEmpty!1138) mapIsEmpty!1138))

(assert (= (and b!26165 (not condMapEmpty!1138)) mapNonEmpty!1138))

(get-info :version)

(assert (= (and mapNonEmpty!1138 ((_ is ValueCellFull!341) mapValue!1138)) b!26162))

(assert (= (and b!26165 ((_ is ValueCellFull!341) mapDefault!1138)) b!26163))

(assert (= start!3756 b!26165))

(declare-fun m!20925 () Bool)

(assert (=> start!3756 m!20925))

(declare-fun m!20927 () Bool)

(assert (=> start!3756 m!20927))

(declare-fun m!20929 () Bool)

(assert (=> start!3756 m!20929))

(declare-fun m!20931 () Bool)

(assert (=> b!26166 m!20931))

(declare-fun m!20933 () Bool)

(assert (=> mapNonEmpty!1138 m!20933))

(declare-fun m!20935 () Bool)

(assert (=> b!26167 m!20935))

(check-sat (not b!26166) tp_is_empty!1081 (not start!3756) (not mapNonEmpty!1138) (not b!26167))
(check-sat)
