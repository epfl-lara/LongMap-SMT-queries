; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78516 () Bool)

(assert start!78516)

(declare-fun mapIsEmpty!30639 () Bool)

(declare-fun mapRes!30639 () Bool)

(assert (=> mapIsEmpty!30639 mapRes!30639))

(declare-fun b!915259 () Bool)

(declare-fun e!513678 () Bool)

(assert (=> b!915259 (= e!513678 false)))

(declare-fun lt!411446 () Bool)

(declare-datatypes ((array!54499 0))(
  ( (array!54500 (arr!26195 (Array (_ BitVec 32) (_ BitVec 64))) (size!26656 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54499)

(declare-datatypes ((List!18410 0))(
  ( (Nil!18407) (Cons!18406 (h!19552 (_ BitVec 64)) (t!26014 List!18410)) )
))
(declare-fun arrayNoDuplicates!0 (array!54499 (_ BitVec 32) List!18410) Bool)

(assert (=> b!915259 (= lt!411446 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18407))))

(declare-fun b!915260 () Bool)

(declare-fun e!513677 () Bool)

(declare-fun e!513675 () Bool)

(assert (=> b!915260 (= e!513677 (and e!513675 mapRes!30639))))

(declare-fun condMapEmpty!30639 () Bool)

(declare-datatypes ((V!30639 0))(
  ( (V!30640 (val!9678 Int)) )
))
(declare-datatypes ((ValueCell!9146 0))(
  ( (ValueCellFull!9146 (v!12195 V!30639)) (EmptyCell!9146) )
))
(declare-datatypes ((array!54501 0))(
  ( (array!54502 (arr!26196 (Array (_ BitVec 32) ValueCell!9146)) (size!26657 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54501)

(declare-fun mapDefault!30639 () ValueCell!9146)

(assert (=> b!915260 (= condMapEmpty!30639 (= (arr!26196 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9146)) mapDefault!30639)))))

(declare-fun b!915261 () Bool)

(declare-fun res!617128 () Bool)

(assert (=> b!915261 (=> (not res!617128) (not e!513678))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54499 (_ BitVec 32)) Bool)

(assert (=> b!915261 (= res!617128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617129 () Bool)

(assert (=> start!78516 (=> (not res!617129) (not e!513678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78516 (= res!617129 (validMask!0 mask!1881))))

(assert (=> start!78516 e!513678))

(assert (=> start!78516 true))

(declare-fun array_inv!20526 (array!54501) Bool)

(assert (=> start!78516 (and (array_inv!20526 _values!1231) e!513677)))

(declare-fun array_inv!20527 (array!54499) Bool)

(assert (=> start!78516 (array_inv!20527 _keys!1487)))

(declare-fun b!915262 () Bool)

(declare-fun e!513674 () Bool)

(declare-fun tp_is_empty!19255 () Bool)

(assert (=> b!915262 (= e!513674 tp_is_empty!19255)))

(declare-fun b!915263 () Bool)

(assert (=> b!915263 (= e!513675 tp_is_empty!19255)))

(declare-fun mapNonEmpty!30639 () Bool)

(declare-fun tp!58707 () Bool)

(assert (=> mapNonEmpty!30639 (= mapRes!30639 (and tp!58707 e!513674))))

(declare-fun mapKey!30639 () (_ BitVec 32))

(declare-fun mapRest!30639 () (Array (_ BitVec 32) ValueCell!9146))

(declare-fun mapValue!30639 () ValueCell!9146)

(assert (=> mapNonEmpty!30639 (= (arr!26196 _values!1231) (store mapRest!30639 mapKey!30639 mapValue!30639))))

(declare-fun b!915264 () Bool)

(declare-fun res!617127 () Bool)

(assert (=> b!915264 (=> (not res!617127) (not e!513678))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915264 (= res!617127 (and (= (size!26657 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26656 _keys!1487) (size!26657 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78516 res!617129) b!915264))

(assert (= (and b!915264 res!617127) b!915261))

(assert (= (and b!915261 res!617128) b!915259))

(assert (= (and b!915260 condMapEmpty!30639) mapIsEmpty!30639))

(assert (= (and b!915260 (not condMapEmpty!30639)) mapNonEmpty!30639))

(get-info :version)

(assert (= (and mapNonEmpty!30639 ((_ is ValueCellFull!9146) mapValue!30639)) b!915262))

(assert (= (and b!915260 ((_ is ValueCellFull!9146) mapDefault!30639)) b!915263))

(assert (= start!78516 b!915260))

(declare-fun m!849097 () Bool)

(assert (=> b!915259 m!849097))

(declare-fun m!849099 () Bool)

(assert (=> b!915261 m!849099))

(declare-fun m!849101 () Bool)

(assert (=> start!78516 m!849101))

(declare-fun m!849103 () Bool)

(assert (=> start!78516 m!849103))

(declare-fun m!849105 () Bool)

(assert (=> start!78516 m!849105))

(declare-fun m!849107 () Bool)

(assert (=> mapNonEmpty!30639 m!849107))

(check-sat (not start!78516) (not mapNonEmpty!30639) (not b!915259) (not b!915261) tp_is_empty!19255)
(check-sat)
