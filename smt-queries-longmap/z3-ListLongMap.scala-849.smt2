; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20194 () Bool)

(assert start!20194)

(declare-fun b_free!4849 () Bool)

(declare-fun b_next!4849 () Bool)

(assert (=> start!20194 (= b_free!4849 (not b_next!4849))))

(declare-fun tp!17579 () Bool)

(declare-fun b_and!11569 () Bool)

(assert (=> start!20194 (= tp!17579 b_and!11569)))

(declare-fun b!198137 () Bool)

(declare-fun e!130246 () Bool)

(declare-fun tp_is_empty!4705 () Bool)

(assert (=> b!198137 (= e!130246 tp_is_empty!4705)))

(declare-fun mapIsEmpty!8126 () Bool)

(declare-fun mapRes!8126 () Bool)

(assert (=> mapIsEmpty!8126 mapRes!8126))

(declare-fun mapNonEmpty!8126 () Bool)

(declare-fun tp!17578 () Bool)

(assert (=> mapNonEmpty!8126 (= mapRes!8126 (and tp!17578 e!130246))))

(declare-fun mapKey!8126 () (_ BitVec 32))

(declare-datatypes ((V!5921 0))(
  ( (V!5922 (val!2397 Int)) )
))
(declare-datatypes ((ValueCell!2009 0))(
  ( (ValueCellFull!2009 (v!4361 V!5921)) (EmptyCell!2009) )
))
(declare-fun mapValue!8126 () ValueCell!2009)

(declare-datatypes ((array!8637 0))(
  ( (array!8638 (arr!4068 (Array (_ BitVec 32) ValueCell!2009)) (size!4394 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8637)

(declare-fun mapRest!8126 () (Array (_ BitVec 32) ValueCell!2009))

(assert (=> mapNonEmpty!8126 (= (arr!4068 _values!649) (store mapRest!8126 mapKey!8126 mapValue!8126))))

(declare-fun b!198138 () Bool)

(declare-fun res!93887 () Bool)

(declare-fun e!130244 () Bool)

(assert (=> b!198138 (=> (not res!93887) (not e!130244))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198138 (= res!93887 (validKeyInArray!0 k0!843))))

(declare-fun b!198139 () Bool)

(declare-fun res!93884 () Bool)

(assert (=> b!198139 (=> (not res!93884) (not e!130244))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8639 0))(
  ( (array!8640 (arr!4069 (Array (_ BitVec 32) (_ BitVec 64))) (size!4395 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8639)

(assert (=> b!198139 (= res!93884 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4395 _keys!825))))))

(declare-fun b!198140 () Bool)

(declare-fun e!130245 () Bool)

(declare-fun e!130248 () Bool)

(assert (=> b!198140 (= e!130245 (and e!130248 mapRes!8126))))

(declare-fun condMapEmpty!8126 () Bool)

(declare-fun mapDefault!8126 () ValueCell!2009)

(assert (=> b!198140 (= condMapEmpty!8126 (= (arr!4068 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2009)) mapDefault!8126)))))

(declare-fun b!198141 () Bool)

(assert (=> b!198141 (= e!130244 false)))

(declare-datatypes ((tuple2!3596 0))(
  ( (tuple2!3597 (_1!1809 (_ BitVec 64)) (_2!1809 V!5921)) )
))
(declare-datatypes ((List!2528 0))(
  ( (Nil!2525) (Cons!2524 (h!3166 tuple2!3596) (t!7450 List!2528)) )
))
(declare-datatypes ((ListLongMap!2499 0))(
  ( (ListLongMap!2500 (toList!1265 List!2528)) )
))
(declare-fun lt!97705 () ListLongMap!2499)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5921)

(declare-fun zeroValue!615 () V!5921)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5921)

(declare-fun getCurrentListMapNoExtraKeys!245 (array!8639 array!8637 (_ BitVec 32) (_ BitVec 32) V!5921 V!5921 (_ BitVec 32) Int) ListLongMap!2499)

(assert (=> b!198141 (= lt!97705 (getCurrentListMapNoExtraKeys!245 _keys!825 (array!8638 (store (arr!4068 _values!649) i!601 (ValueCellFull!2009 v!520)) (size!4394 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97706 () ListLongMap!2499)

(assert (=> b!198141 (= lt!97706 (getCurrentListMapNoExtraKeys!245 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198142 () Bool)

(declare-fun res!93889 () Bool)

(assert (=> b!198142 (=> (not res!93889) (not e!130244))))

(assert (=> b!198142 (= res!93889 (and (= (size!4394 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4395 _keys!825) (size!4394 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!93890 () Bool)

(assert (=> start!20194 (=> (not res!93890) (not e!130244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20194 (= res!93890 (validMask!0 mask!1149))))

(assert (=> start!20194 e!130244))

(declare-fun array_inv!2647 (array!8637) Bool)

(assert (=> start!20194 (and (array_inv!2647 _values!649) e!130245)))

(assert (=> start!20194 true))

(assert (=> start!20194 tp_is_empty!4705))

(declare-fun array_inv!2648 (array!8639) Bool)

(assert (=> start!20194 (array_inv!2648 _keys!825)))

(assert (=> start!20194 tp!17579))

(declare-fun b!198143 () Bool)

(declare-fun res!93888 () Bool)

(assert (=> b!198143 (=> (not res!93888) (not e!130244))))

(declare-datatypes ((List!2529 0))(
  ( (Nil!2526) (Cons!2525 (h!3167 (_ BitVec 64)) (t!7451 List!2529)) )
))
(declare-fun arrayNoDuplicates!0 (array!8639 (_ BitVec 32) List!2529) Bool)

(assert (=> b!198143 (= res!93888 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2526))))

(declare-fun b!198144 () Bool)

(declare-fun res!93886 () Bool)

(assert (=> b!198144 (=> (not res!93886) (not e!130244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8639 (_ BitVec 32)) Bool)

(assert (=> b!198144 (= res!93886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198145 () Bool)

(assert (=> b!198145 (= e!130248 tp_is_empty!4705)))

(declare-fun b!198146 () Bool)

(declare-fun res!93885 () Bool)

(assert (=> b!198146 (=> (not res!93885) (not e!130244))))

(assert (=> b!198146 (= res!93885 (= (select (arr!4069 _keys!825) i!601) k0!843))))

(assert (= (and start!20194 res!93890) b!198142))

(assert (= (and b!198142 res!93889) b!198144))

(assert (= (and b!198144 res!93886) b!198143))

(assert (= (and b!198143 res!93888) b!198139))

(assert (= (and b!198139 res!93884) b!198138))

(assert (= (and b!198138 res!93887) b!198146))

(assert (= (and b!198146 res!93885) b!198141))

(assert (= (and b!198140 condMapEmpty!8126) mapIsEmpty!8126))

(assert (= (and b!198140 (not condMapEmpty!8126)) mapNonEmpty!8126))

(get-info :version)

(assert (= (and mapNonEmpty!8126 ((_ is ValueCellFull!2009) mapValue!8126)) b!198137))

(assert (= (and b!198140 ((_ is ValueCellFull!2009) mapDefault!8126)) b!198145))

(assert (= start!20194 b!198140))

(declare-fun m!224319 () Bool)

(assert (=> b!198143 m!224319))

(declare-fun m!224321 () Bool)

(assert (=> b!198144 m!224321))

(declare-fun m!224323 () Bool)

(assert (=> b!198141 m!224323))

(declare-fun m!224325 () Bool)

(assert (=> b!198141 m!224325))

(declare-fun m!224327 () Bool)

(assert (=> b!198141 m!224327))

(declare-fun m!224329 () Bool)

(assert (=> b!198146 m!224329))

(declare-fun m!224331 () Bool)

(assert (=> mapNonEmpty!8126 m!224331))

(declare-fun m!224333 () Bool)

(assert (=> start!20194 m!224333))

(declare-fun m!224335 () Bool)

(assert (=> start!20194 m!224335))

(declare-fun m!224337 () Bool)

(assert (=> start!20194 m!224337))

(declare-fun m!224339 () Bool)

(assert (=> b!198138 m!224339))

(check-sat b_and!11569 (not b!198143) (not b!198144) (not b!198141) (not b!198138) (not start!20194) (not b_next!4849) (not mapNonEmpty!8126) tp_is_empty!4705)
(check-sat b_and!11569 (not b_next!4849))
