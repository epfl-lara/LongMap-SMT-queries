; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133442 () Bool)

(assert start!133442)

(declare-fun b!1560281 () Bool)

(declare-fun res!1066989 () Bool)

(declare-fun e!869442 () Bool)

(assert (=> b!1560281 (=> (not res!1066989) (not e!869442))))

(declare-datatypes ((array!103792 0))(
  ( (array!103793 (arr!50089 (Array (_ BitVec 32) (_ BitVec 64))) (size!50641 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103792)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103792 (_ BitVec 32)) Bool)

(assert (=> b!1560281 (= res!1066989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560282 () Bool)

(declare-fun res!1066987 () Bool)

(assert (=> b!1560282 (=> (not res!1066987) (not e!869442))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59641 0))(
  ( (V!59642 (val!19371 Int)) )
))
(declare-datatypes ((ValueCell!18257 0))(
  ( (ValueCellFull!18257 (v!22119 V!59641)) (EmptyCell!18257) )
))
(declare-datatypes ((array!103794 0))(
  ( (array!103795 (arr!50090 (Array (_ BitVec 32) ValueCell!18257)) (size!50642 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103794)

(assert (=> b!1560282 (= res!1066987 (and (= (size!50642 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50641 _keys!637) (size!50642 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560283 () Bool)

(declare-fun e!869445 () Bool)

(declare-fun tp_is_empty!38575 () Bool)

(assert (=> b!1560283 (= e!869445 tp_is_empty!38575)))

(declare-fun b!1560284 () Bool)

(assert (=> b!1560284 (= e!869442 false)))

(declare-fun lt!670733 () Bool)

(declare-datatypes ((List!36441 0))(
  ( (Nil!36438) (Cons!36437 (h!37884 (_ BitVec 64)) (t!51166 List!36441)) )
))
(declare-fun arrayNoDuplicates!0 (array!103792 (_ BitVec 32) List!36441) Bool)

(assert (=> b!1560284 (= lt!670733 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36438))))

(declare-fun mapIsEmpty!59238 () Bool)

(declare-fun mapRes!59238 () Bool)

(assert (=> mapIsEmpty!59238 mapRes!59238))

(declare-fun b!1560285 () Bool)

(declare-fun e!869444 () Bool)

(assert (=> b!1560285 (= e!869444 tp_is_empty!38575)))

(declare-fun mapNonEmpty!59238 () Bool)

(declare-fun tp!112894 () Bool)

(assert (=> mapNonEmpty!59238 (= mapRes!59238 (and tp!112894 e!869445))))

(declare-fun mapKey!59238 () (_ BitVec 32))

(declare-fun mapValue!59238 () ValueCell!18257)

(declare-fun mapRest!59238 () (Array (_ BitVec 32) ValueCell!18257))

(assert (=> mapNonEmpty!59238 (= (arr!50090 _values!487) (store mapRest!59238 mapKey!59238 mapValue!59238))))

(declare-fun b!1560286 () Bool)

(declare-fun e!869443 () Bool)

(assert (=> b!1560286 (= e!869443 (and e!869444 mapRes!59238))))

(declare-fun condMapEmpty!59238 () Bool)

(declare-fun mapDefault!59238 () ValueCell!18257)

(assert (=> b!1560286 (= condMapEmpty!59238 (= (arr!50090 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18257)) mapDefault!59238)))))

(declare-fun res!1066988 () Bool)

(assert (=> start!133442 (=> (not res!1066988) (not e!869442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133442 (= res!1066988 (validMask!0 mask!947))))

(assert (=> start!133442 e!869442))

(assert (=> start!133442 true))

(declare-fun array_inv!39133 (array!103794) Bool)

(assert (=> start!133442 (and (array_inv!39133 _values!487) e!869443)))

(declare-fun array_inv!39134 (array!103792) Bool)

(assert (=> start!133442 (array_inv!39134 _keys!637)))

(assert (= (and start!133442 res!1066988) b!1560282))

(assert (= (and b!1560282 res!1066987) b!1560281))

(assert (= (and b!1560281 res!1066989) b!1560284))

(assert (= (and b!1560286 condMapEmpty!59238) mapIsEmpty!59238))

(assert (= (and b!1560286 (not condMapEmpty!59238)) mapNonEmpty!59238))

(get-info :version)

(assert (= (and mapNonEmpty!59238 ((_ is ValueCellFull!18257) mapValue!59238)) b!1560283))

(assert (= (and b!1560286 ((_ is ValueCellFull!18257) mapDefault!59238)) b!1560285))

(assert (= start!133442 b!1560286))

(declare-fun m!1435497 () Bool)

(assert (=> b!1560281 m!1435497))

(declare-fun m!1435499 () Bool)

(assert (=> b!1560284 m!1435499))

(declare-fun m!1435501 () Bool)

(assert (=> mapNonEmpty!59238 m!1435501))

(declare-fun m!1435503 () Bool)

(assert (=> start!133442 m!1435503))

(declare-fun m!1435505 () Bool)

(assert (=> start!133442 m!1435505))

(declare-fun m!1435507 () Bool)

(assert (=> start!133442 m!1435507))

(check-sat (not start!133442) (not mapNonEmpty!59238) (not b!1560281) (not b!1560284) tp_is_empty!38575)
(check-sat)
