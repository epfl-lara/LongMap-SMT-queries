; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39548 () Bool)

(assert start!39548)

(declare-fun b_free!9829 () Bool)

(declare-fun b_next!9829 () Bool)

(assert (=> start!39548 (= b_free!9829 (not b_next!9829))))

(declare-fun tp!35015 () Bool)

(declare-fun b_and!17459 () Bool)

(assert (=> start!39548 (= tp!35015 b_and!17459)))

(declare-fun b!423128 () Bool)

(declare-fun res!247316 () Bool)

(declare-fun e!251550 () Bool)

(assert (=> b!423128 (=> (not res!247316) (not e!251550))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423128 (= res!247316 (bvsle from!863 i!563))))

(declare-fun b!423129 () Bool)

(declare-fun res!247322 () Bool)

(declare-fun e!251545 () Bool)

(assert (=> b!423129 (=> (not res!247322) (not e!251545))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423129 (= res!247322 (validMask!0 mask!1025))))

(declare-fun b!423130 () Bool)

(assert (=> b!423130 (= e!251545 e!251550)))

(declare-fun res!247324 () Bool)

(assert (=> b!423130 (=> (not res!247324) (not e!251550))))

(declare-datatypes ((array!25791 0))(
  ( (array!25792 (arr!12345 (Array (_ BitVec 32) (_ BitVec 64))) (size!12698 (_ BitVec 32))) )
))
(declare-fun lt!193927 () array!25791)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25791 (_ BitVec 32)) Bool)

(assert (=> b!423130 (= res!247324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193927 mask!1025))))

(declare-fun _keys!709 () array!25791)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423130 (= lt!193927 (array!25792 (store (arr!12345 _keys!709) i!563 k0!794) (size!12698 _keys!709)))))

(declare-fun b!423132 () Bool)

(assert (=> b!423132 (= e!251550 false)))

(declare-datatypes ((V!15747 0))(
  ( (V!15748 (val!5535 Int)) )
))
(declare-fun minValue!515 () V!15747)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5147 0))(
  ( (ValueCellFull!5147 (v!7776 V!15747)) (EmptyCell!5147) )
))
(declare-datatypes ((array!25793 0))(
  ( (array!25794 (arr!12346 (Array (_ BitVec 32) ValueCell!5147)) (size!12699 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25793)

(declare-fun zeroValue!515 () V!15747)

(declare-datatypes ((tuple2!7256 0))(
  ( (tuple2!7257 (_1!3639 (_ BitVec 64)) (_2!3639 V!15747)) )
))
(declare-datatypes ((List!7250 0))(
  ( (Nil!7247) (Cons!7246 (h!8102 tuple2!7256) (t!12685 List!7250)) )
))
(declare-datatypes ((ListLongMap!6159 0))(
  ( (ListLongMap!6160 (toList!3095 List!7250)) )
))
(declare-fun lt!193928 () ListLongMap!6159)

(declare-fun v!412 () V!15747)

(declare-fun getCurrentListMapNoExtraKeys!1303 (array!25791 array!25793 (_ BitVec 32) (_ BitVec 32) V!15747 V!15747 (_ BitVec 32) Int) ListLongMap!6159)

(assert (=> b!423132 (= lt!193928 (getCurrentListMapNoExtraKeys!1303 lt!193927 (array!25794 (store (arr!12346 _values!549) i!563 (ValueCellFull!5147 v!412)) (size!12699 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193926 () ListLongMap!6159)

(assert (=> b!423132 (= lt!193926 (getCurrentListMapNoExtraKeys!1303 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18093 () Bool)

(declare-fun mapRes!18093 () Bool)

(assert (=> mapIsEmpty!18093 mapRes!18093))

(declare-fun mapNonEmpty!18093 () Bool)

(declare-fun tp!35016 () Bool)

(declare-fun e!251547 () Bool)

(assert (=> mapNonEmpty!18093 (= mapRes!18093 (and tp!35016 e!251547))))

(declare-fun mapValue!18093 () ValueCell!5147)

(declare-fun mapRest!18093 () (Array (_ BitVec 32) ValueCell!5147))

(declare-fun mapKey!18093 () (_ BitVec 32))

(assert (=> mapNonEmpty!18093 (= (arr!12346 _values!549) (store mapRest!18093 mapKey!18093 mapValue!18093))))

(declare-fun b!423133 () Bool)

(declare-fun res!247315 () Bool)

(assert (=> b!423133 (=> (not res!247315) (not e!251545))))

(assert (=> b!423133 (= res!247315 (or (= (select (arr!12345 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12345 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423134 () Bool)

(declare-fun res!247320 () Bool)

(assert (=> b!423134 (=> (not res!247320) (not e!251550))))

(declare-datatypes ((List!7251 0))(
  ( (Nil!7248) (Cons!7247 (h!8103 (_ BitVec 64)) (t!12686 List!7251)) )
))
(declare-fun arrayNoDuplicates!0 (array!25791 (_ BitVec 32) List!7251) Bool)

(assert (=> b!423134 (= res!247320 (arrayNoDuplicates!0 lt!193927 #b00000000000000000000000000000000 Nil!7248))))

(declare-fun b!423135 () Bool)

(declare-fun res!247323 () Bool)

(assert (=> b!423135 (=> (not res!247323) (not e!251545))))

(declare-fun arrayContainsKey!0 (array!25791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423135 (= res!247323 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423136 () Bool)

(declare-fun e!251548 () Bool)

(declare-fun e!251546 () Bool)

(assert (=> b!423136 (= e!251548 (and e!251546 mapRes!18093))))

(declare-fun condMapEmpty!18093 () Bool)

(declare-fun mapDefault!18093 () ValueCell!5147)

(assert (=> b!423136 (= condMapEmpty!18093 (= (arr!12346 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5147)) mapDefault!18093)))))

(declare-fun b!423137 () Bool)

(declare-fun res!247326 () Bool)

(assert (=> b!423137 (=> (not res!247326) (not e!251545))))

(assert (=> b!423137 (= res!247326 (and (= (size!12699 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12698 _keys!709) (size!12699 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423138 () Bool)

(declare-fun tp_is_empty!10981 () Bool)

(assert (=> b!423138 (= e!251547 tp_is_empty!10981)))

(declare-fun res!247318 () Bool)

(assert (=> start!39548 (=> (not res!247318) (not e!251545))))

(assert (=> start!39548 (= res!247318 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12698 _keys!709))))))

(assert (=> start!39548 e!251545))

(assert (=> start!39548 tp_is_empty!10981))

(assert (=> start!39548 tp!35015))

(assert (=> start!39548 true))

(declare-fun array_inv!9030 (array!25793) Bool)

(assert (=> start!39548 (and (array_inv!9030 _values!549) e!251548)))

(declare-fun array_inv!9031 (array!25791) Bool)

(assert (=> start!39548 (array_inv!9031 _keys!709)))

(declare-fun b!423131 () Bool)

(assert (=> b!423131 (= e!251546 tp_is_empty!10981)))

(declare-fun b!423139 () Bool)

(declare-fun res!247317 () Bool)

(assert (=> b!423139 (=> (not res!247317) (not e!251545))))

(assert (=> b!423139 (= res!247317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423140 () Bool)

(declare-fun res!247321 () Bool)

(assert (=> b!423140 (=> (not res!247321) (not e!251545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423140 (= res!247321 (validKeyInArray!0 k0!794))))

(declare-fun b!423141 () Bool)

(declare-fun res!247325 () Bool)

(assert (=> b!423141 (=> (not res!247325) (not e!251545))))

(assert (=> b!423141 (= res!247325 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7248))))

(declare-fun b!423142 () Bool)

(declare-fun res!247319 () Bool)

(assert (=> b!423142 (=> (not res!247319) (not e!251545))))

(assert (=> b!423142 (= res!247319 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12698 _keys!709))))))

(assert (= (and start!39548 res!247318) b!423129))

(assert (= (and b!423129 res!247322) b!423137))

(assert (= (and b!423137 res!247326) b!423139))

(assert (= (and b!423139 res!247317) b!423141))

(assert (= (and b!423141 res!247325) b!423142))

(assert (= (and b!423142 res!247319) b!423140))

(assert (= (and b!423140 res!247321) b!423133))

(assert (= (and b!423133 res!247315) b!423135))

(assert (= (and b!423135 res!247323) b!423130))

(assert (= (and b!423130 res!247324) b!423134))

(assert (= (and b!423134 res!247320) b!423128))

(assert (= (and b!423128 res!247316) b!423132))

(assert (= (and b!423136 condMapEmpty!18093) mapIsEmpty!18093))

(assert (= (and b!423136 (not condMapEmpty!18093)) mapNonEmpty!18093))

(get-info :version)

(assert (= (and mapNonEmpty!18093 ((_ is ValueCellFull!5147) mapValue!18093)) b!423138))

(assert (= (and b!423136 ((_ is ValueCellFull!5147) mapDefault!18093)) b!423131))

(assert (= start!39548 b!423136))

(declare-fun m!412161 () Bool)

(assert (=> b!423139 m!412161))

(declare-fun m!412163 () Bool)

(assert (=> b!423141 m!412163))

(declare-fun m!412165 () Bool)

(assert (=> b!423140 m!412165))

(declare-fun m!412167 () Bool)

(assert (=> b!423129 m!412167))

(declare-fun m!412169 () Bool)

(assert (=> b!423132 m!412169))

(declare-fun m!412171 () Bool)

(assert (=> b!423132 m!412171))

(declare-fun m!412173 () Bool)

(assert (=> b!423132 m!412173))

(declare-fun m!412175 () Bool)

(assert (=> b!423135 m!412175))

(declare-fun m!412177 () Bool)

(assert (=> b!423133 m!412177))

(declare-fun m!412179 () Bool)

(assert (=> b!423130 m!412179))

(declare-fun m!412181 () Bool)

(assert (=> b!423130 m!412181))

(declare-fun m!412183 () Bool)

(assert (=> mapNonEmpty!18093 m!412183))

(declare-fun m!412185 () Bool)

(assert (=> b!423134 m!412185))

(declare-fun m!412187 () Bool)

(assert (=> start!39548 m!412187))

(declare-fun m!412189 () Bool)

(assert (=> start!39548 m!412189))

(check-sat (not b!423129) (not b!423130) (not b!423141) (not mapNonEmpty!18093) tp_is_empty!10981 (not b!423134) (not start!39548) (not b!423139) (not b!423135) (not b_next!9829) b_and!17459 (not b!423132) (not b!423140))
(check-sat b_and!17459 (not b_next!9829))
