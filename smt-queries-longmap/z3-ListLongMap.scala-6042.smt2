; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78154 () Bool)

(assert start!78154)

(declare-fun b_free!16665 () Bool)

(declare-fun b_next!16665 () Bool)

(assert (=> start!78154 (= b_free!16665 (not b_next!16665))))

(declare-fun tp!58268 () Bool)

(declare-fun b_and!27239 () Bool)

(assert (=> start!78154 (= tp!58268 b_and!27239)))

(declare-fun b!912124 () Bool)

(declare-fun e!511646 () Bool)

(declare-fun e!511644 () Bool)

(declare-fun mapRes!30349 () Bool)

(assert (=> b!912124 (= e!511646 (and e!511644 mapRes!30349))))

(declare-fun condMapEmpty!30349 () Bool)

(declare-datatypes ((V!30409 0))(
  ( (V!30410 (val!9592 Int)) )
))
(declare-datatypes ((ValueCell!9060 0))(
  ( (ValueCellFull!9060 (v!12102 V!30409)) (EmptyCell!9060) )
))
(declare-datatypes ((array!54162 0))(
  ( (array!54163 (arr!26036 (Array (_ BitVec 32) ValueCell!9060)) (size!26495 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54162)

(declare-fun mapDefault!30349 () ValueCell!9060)

(assert (=> b!912124 (= condMapEmpty!30349 (= (arr!26036 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9060)) mapDefault!30349)))))

(declare-fun res!615317 () Bool)

(declare-fun e!511647 () Bool)

(assert (=> start!78154 (=> (not res!615317) (not e!511647))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78154 (= res!615317 (validMask!0 mask!1756))))

(assert (=> start!78154 e!511647))

(declare-fun array_inv!20344 (array!54162) Bool)

(assert (=> start!78154 (and (array_inv!20344 _values!1152) e!511646)))

(assert (=> start!78154 tp!58268))

(assert (=> start!78154 true))

(declare-fun tp_is_empty!19083 () Bool)

(assert (=> start!78154 tp_is_empty!19083))

(declare-datatypes ((array!54164 0))(
  ( (array!54165 (arr!26037 (Array (_ BitVec 32) (_ BitVec 64))) (size!26496 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54164)

(declare-fun array_inv!20345 (array!54164) Bool)

(assert (=> start!78154 (array_inv!20345 _keys!1386)))

(declare-fun b!912125 () Bool)

(declare-fun e!511643 () Bool)

(assert (=> b!912125 (= e!511643 tp_is_empty!19083)))

(declare-fun b!912126 () Bool)

(assert (=> b!912126 (= e!511644 tp_is_empty!19083)))

(declare-fun mapIsEmpty!30349 () Bool)

(assert (=> mapIsEmpty!30349 mapRes!30349))

(declare-fun b!912127 () Bool)

(assert (=> b!912127 (= e!511647 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30409)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410558 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30409)

(declare-datatypes ((tuple2!12498 0))(
  ( (tuple2!12499 (_1!6260 (_ BitVec 64)) (_2!6260 V!30409)) )
))
(declare-datatypes ((List!18288 0))(
  ( (Nil!18285) (Cons!18284 (h!19430 tuple2!12498) (t!25875 List!18288)) )
))
(declare-datatypes ((ListLongMap!11195 0))(
  ( (ListLongMap!11196 (toList!5613 List!18288)) )
))
(declare-fun contains!4658 (ListLongMap!11195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2875 (array!54164 array!54162 (_ BitVec 32) (_ BitVec 32) V!30409 V!30409 (_ BitVec 32) Int) ListLongMap!11195)

(assert (=> b!912127 (= lt!410558 (contains!4658 (getCurrentListMap!2875 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30349 () Bool)

(declare-fun tp!58269 () Bool)

(assert (=> mapNonEmpty!30349 (= mapRes!30349 (and tp!58269 e!511643))))

(declare-fun mapKey!30349 () (_ BitVec 32))

(declare-fun mapValue!30349 () ValueCell!9060)

(declare-fun mapRest!30349 () (Array (_ BitVec 32) ValueCell!9060))

(assert (=> mapNonEmpty!30349 (= (arr!26036 _values!1152) (store mapRest!30349 mapKey!30349 mapValue!30349))))

(declare-fun b!912128 () Bool)

(declare-fun res!615315 () Bool)

(assert (=> b!912128 (=> (not res!615315) (not e!511647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54164 (_ BitVec 32)) Bool)

(assert (=> b!912128 (= res!615315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912129 () Bool)

(declare-fun res!615316 () Bool)

(assert (=> b!912129 (=> (not res!615316) (not e!511647))))

(assert (=> b!912129 (= res!615316 (and (= (size!26495 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26496 _keys!1386) (size!26495 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912130 () Bool)

(declare-fun res!615318 () Bool)

(assert (=> b!912130 (=> (not res!615318) (not e!511647))))

(declare-datatypes ((List!18289 0))(
  ( (Nil!18286) (Cons!18285 (h!19431 (_ BitVec 64)) (t!25876 List!18289)) )
))
(declare-fun arrayNoDuplicates!0 (array!54164 (_ BitVec 32) List!18289) Bool)

(assert (=> b!912130 (= res!615318 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18286))))

(assert (= (and start!78154 res!615317) b!912129))

(assert (= (and b!912129 res!615316) b!912128))

(assert (= (and b!912128 res!615315) b!912130))

(assert (= (and b!912130 res!615318) b!912127))

(assert (= (and b!912124 condMapEmpty!30349) mapIsEmpty!30349))

(assert (= (and b!912124 (not condMapEmpty!30349)) mapNonEmpty!30349))

(get-info :version)

(assert (= (and mapNonEmpty!30349 ((_ is ValueCellFull!9060) mapValue!30349)) b!912125))

(assert (= (and b!912124 ((_ is ValueCellFull!9060) mapDefault!30349)) b!912126))

(assert (= start!78154 b!912124))

(declare-fun m!846711 () Bool)

(assert (=> mapNonEmpty!30349 m!846711))

(declare-fun m!846713 () Bool)

(assert (=> b!912127 m!846713))

(assert (=> b!912127 m!846713))

(declare-fun m!846715 () Bool)

(assert (=> b!912127 m!846715))

(declare-fun m!846717 () Bool)

(assert (=> b!912130 m!846717))

(declare-fun m!846719 () Bool)

(assert (=> b!912128 m!846719))

(declare-fun m!846721 () Bool)

(assert (=> start!78154 m!846721))

(declare-fun m!846723 () Bool)

(assert (=> start!78154 m!846723))

(declare-fun m!846725 () Bool)

(assert (=> start!78154 m!846725))

(check-sat (not b!912128) (not mapNonEmpty!30349) (not b!912130) tp_is_empty!19083 (not b!912127) b_and!27239 (not b_next!16665) (not start!78154))
(check-sat b_and!27239 (not b_next!16665))
