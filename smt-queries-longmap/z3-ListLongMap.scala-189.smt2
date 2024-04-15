; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3744 () Bool)

(assert start!3744)

(declare-fun mapNonEmpty!1129 () Bool)

(declare-fun mapRes!1129 () Bool)

(declare-fun tp!3649 () Bool)

(declare-fun e!16964 () Bool)

(assert (=> mapNonEmpty!1129 (= mapRes!1129 (and tp!3649 e!16964))))

(declare-fun mapKey!1129 () (_ BitVec 32))

(declare-datatypes ((V!1259 0))(
  ( (V!1260 (val!564 Int)) )
))
(declare-datatypes ((ValueCell!338 0))(
  ( (ValueCellFull!338 (v!1649 V!1259)) (EmptyCell!338) )
))
(declare-datatypes ((array!1379 0))(
  ( (array!1380 (arr!647 (Array (_ BitVec 32) ValueCell!338)) (size!748 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1379)

(declare-fun mapValue!1129 () ValueCell!338)

(declare-fun mapRest!1129 () (Array (_ BitVec 32) ValueCell!338))

(assert (=> mapNonEmpty!1129 (= (arr!647 _values!1501) (store mapRest!1129 mapKey!1129 mapValue!1129))))

(declare-fun mapIsEmpty!1129 () Bool)

(assert (=> mapIsEmpty!1129 mapRes!1129))

(declare-fun res!15534 () Bool)

(declare-fun e!16966 () Bool)

(assert (=> start!3744 (=> (not res!15534) (not e!16966))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3744 (= res!15534 (validMask!0 mask!2294))))

(assert (=> start!3744 e!16966))

(assert (=> start!3744 true))

(declare-fun e!16963 () Bool)

(declare-fun array_inv!457 (array!1379) Bool)

(assert (=> start!3744 (and (array_inv!457 _values!1501) e!16963)))

(declare-datatypes ((array!1381 0))(
  ( (array!1382 (arr!648 (Array (_ BitVec 32) (_ BitVec 64))) (size!749 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1381)

(declare-fun array_inv!458 (array!1381) Bool)

(assert (=> start!3744 (array_inv!458 _keys!1833)))

(declare-fun b!26126 () Bool)

(declare-fun tp_is_empty!1075 () Bool)

(assert (=> b!26126 (= e!16964 tp_is_empty!1075)))

(declare-fun b!26127 () Bool)

(declare-fun e!16962 () Bool)

(assert (=> b!26127 (= e!16963 (and e!16962 mapRes!1129))))

(declare-fun condMapEmpty!1129 () Bool)

(declare-fun mapDefault!1129 () ValueCell!338)

(assert (=> b!26127 (= condMapEmpty!1129 (= (arr!647 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!338)) mapDefault!1129)))))

(declare-fun b!26128 () Bool)

(assert (=> b!26128 (= e!16966 false)))

(declare-fun lt!10318 () Bool)

(declare-datatypes ((List!578 0))(
  ( (Nil!575) (Cons!574 (h!1141 (_ BitVec 64)) (t!3258 List!578)) )
))
(declare-fun arrayNoDuplicates!0 (array!1381 (_ BitVec 32) List!578) Bool)

(assert (=> b!26128 (= lt!10318 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!575))))

(declare-fun b!26129 () Bool)

(declare-fun res!15535 () Bool)

(assert (=> b!26129 (=> (not res!15535) (not e!16966))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26129 (= res!15535 (and (= (size!748 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!749 _keys!1833) (size!748 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26130 () Bool)

(declare-fun res!15533 () Bool)

(assert (=> b!26130 (=> (not res!15533) (not e!16966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1381 (_ BitVec 32)) Bool)

(assert (=> b!26130 (= res!15533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26131 () Bool)

(assert (=> b!26131 (= e!16962 tp_is_empty!1075)))

(assert (= (and start!3744 res!15534) b!26129))

(assert (= (and b!26129 res!15535) b!26130))

(assert (= (and b!26130 res!15533) b!26128))

(assert (= (and b!26127 condMapEmpty!1129) mapIsEmpty!1129))

(assert (= (and b!26127 (not condMapEmpty!1129)) mapNonEmpty!1129))

(get-info :version)

(assert (= (and mapNonEmpty!1129 ((_ is ValueCellFull!338) mapValue!1129)) b!26126))

(assert (= (and b!26127 ((_ is ValueCellFull!338) mapDefault!1129)) b!26131))

(assert (= start!3744 b!26127))

(declare-fun m!20971 () Bool)

(assert (=> mapNonEmpty!1129 m!20971))

(declare-fun m!20973 () Bool)

(assert (=> start!3744 m!20973))

(declare-fun m!20975 () Bool)

(assert (=> start!3744 m!20975))

(declare-fun m!20977 () Bool)

(assert (=> start!3744 m!20977))

(declare-fun m!20979 () Bool)

(assert (=> b!26128 m!20979))

(declare-fun m!20981 () Bool)

(assert (=> b!26130 m!20981))

(check-sat (not start!3744) (not b!26130) tp_is_empty!1075 (not b!26128) (not mapNonEmpty!1129))
(check-sat)
