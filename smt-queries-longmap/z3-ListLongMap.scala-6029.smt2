; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78060 () Bool)

(assert start!78060)

(declare-fun b_free!16587 () Bool)

(declare-fun b_next!16587 () Bool)

(assert (=> start!78060 (= b_free!16587 (not b_next!16587))))

(declare-fun tp!58031 () Bool)

(declare-fun b_and!27159 () Bool)

(assert (=> start!78060 (= tp!58031 b_and!27159)))

(declare-fun b!911178 () Bool)

(declare-fun e!510990 () Bool)

(declare-fun tp_is_empty!19005 () Bool)

(assert (=> b!911178 (= e!510990 tp_is_empty!19005)))

(declare-fun b!911179 () Bool)

(declare-fun res!614786 () Bool)

(declare-fun e!510988 () Bool)

(assert (=> b!911179 (=> (not res!614786) (not e!510988))))

(declare-datatypes ((array!54014 0))(
  ( (array!54015 (arr!25963 (Array (_ BitVec 32) (_ BitVec 64))) (size!26422 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54014)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54014 (_ BitVec 32)) Bool)

(assert (=> b!911179 (= res!614786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911180 () Bool)

(declare-fun res!614785 () Bool)

(assert (=> b!911180 (=> (not res!614785) (not e!510988))))

(declare-datatypes ((V!30305 0))(
  ( (V!30306 (val!9553 Int)) )
))
(declare-datatypes ((ValueCell!9021 0))(
  ( (ValueCellFull!9021 (v!12062 V!30305)) (EmptyCell!9021) )
))
(declare-datatypes ((array!54016 0))(
  ( (array!54017 (arr!25964 (Array (_ BitVec 32) ValueCell!9021)) (size!26423 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54016)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911180 (= res!614785 (and (= (size!26423 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26422 _keys!1386) (size!26423 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911181 () Bool)

(declare-fun res!614784 () Bool)

(assert (=> b!911181 (=> (not res!614784) (not e!510988))))

(declare-datatypes ((List!18236 0))(
  ( (Nil!18233) (Cons!18232 (h!19378 (_ BitVec 64)) (t!25821 List!18236)) )
))
(declare-fun arrayNoDuplicates!0 (array!54014 (_ BitVec 32) List!18236) Bool)

(assert (=> b!911181 (= res!614784 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18233))))

(declare-fun res!614787 () Bool)

(assert (=> start!78060 (=> (not res!614787) (not e!510988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78060 (= res!614787 (validMask!0 mask!1756))))

(assert (=> start!78060 e!510988))

(declare-fun e!510987 () Bool)

(declare-fun array_inv!20298 (array!54016) Bool)

(assert (=> start!78060 (and (array_inv!20298 _values!1152) e!510987)))

(assert (=> start!78060 tp!58031))

(assert (=> start!78060 true))

(assert (=> start!78060 tp_is_empty!19005))

(declare-fun array_inv!20299 (array!54014) Bool)

(assert (=> start!78060 (array_inv!20299 _keys!1386)))

(declare-fun mapNonEmpty!30229 () Bool)

(declare-fun mapRes!30229 () Bool)

(declare-fun tp!58032 () Bool)

(assert (=> mapNonEmpty!30229 (= mapRes!30229 (and tp!58032 e!510990))))

(declare-fun mapValue!30229 () ValueCell!9021)

(declare-fun mapRest!30229 () (Array (_ BitVec 32) ValueCell!9021))

(declare-fun mapKey!30229 () (_ BitVec 32))

(assert (=> mapNonEmpty!30229 (= (arr!25964 _values!1152) (store mapRest!30229 mapKey!30229 mapValue!30229))))

(declare-fun mapIsEmpty!30229 () Bool)

(assert (=> mapIsEmpty!30229 mapRes!30229))

(declare-fun b!911182 () Bool)

(declare-fun e!510989 () Bool)

(assert (=> b!911182 (= e!510987 (and e!510989 mapRes!30229))))

(declare-fun condMapEmpty!30229 () Bool)

(declare-fun mapDefault!30229 () ValueCell!9021)

(assert (=> b!911182 (= condMapEmpty!30229 (= (arr!25964 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9021)) mapDefault!30229)))))

(declare-fun b!911183 () Bool)

(assert (=> b!911183 (= e!510988 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30305)

(declare-fun lt!410363 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30305)

(declare-datatypes ((tuple2!12446 0))(
  ( (tuple2!12447 (_1!6234 (_ BitVec 64)) (_2!6234 V!30305)) )
))
(declare-datatypes ((List!18237 0))(
  ( (Nil!18234) (Cons!18233 (h!19379 tuple2!12446) (t!25822 List!18237)) )
))
(declare-datatypes ((ListLongMap!11143 0))(
  ( (ListLongMap!11144 (toList!5587 List!18237)) )
))
(declare-fun contains!4631 (ListLongMap!11143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2849 (array!54014 array!54016 (_ BitVec 32) (_ BitVec 32) V!30305 V!30305 (_ BitVec 32) Int) ListLongMap!11143)

(assert (=> b!911183 (= lt!410363 (contains!4631 (getCurrentListMap!2849 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911184 () Bool)

(assert (=> b!911184 (= e!510989 tp_is_empty!19005)))

(assert (= (and start!78060 res!614787) b!911180))

(assert (= (and b!911180 res!614785) b!911179))

(assert (= (and b!911179 res!614786) b!911181))

(assert (= (and b!911181 res!614784) b!911183))

(assert (= (and b!911182 condMapEmpty!30229) mapIsEmpty!30229))

(assert (= (and b!911182 (not condMapEmpty!30229)) mapNonEmpty!30229))

(get-info :version)

(assert (= (and mapNonEmpty!30229 ((_ is ValueCellFull!9021) mapValue!30229)) b!911178))

(assert (= (and b!911182 ((_ is ValueCellFull!9021) mapDefault!30229)) b!911184))

(assert (= start!78060 b!911182))

(declare-fun m!846001 () Bool)

(assert (=> mapNonEmpty!30229 m!846001))

(declare-fun m!846003 () Bool)

(assert (=> b!911181 m!846003))

(declare-fun m!846005 () Bool)

(assert (=> b!911179 m!846005))

(declare-fun m!846007 () Bool)

(assert (=> b!911183 m!846007))

(assert (=> b!911183 m!846007))

(declare-fun m!846009 () Bool)

(assert (=> b!911183 m!846009))

(declare-fun m!846011 () Bool)

(assert (=> start!78060 m!846011))

(declare-fun m!846013 () Bool)

(assert (=> start!78060 m!846013))

(declare-fun m!846015 () Bool)

(assert (=> start!78060 m!846015))

(check-sat (not start!78060) tp_is_empty!19005 (not mapNonEmpty!30229) (not b!911181) (not b_next!16587) b_and!27159 (not b!911183) (not b!911179))
(check-sat b_and!27159 (not b_next!16587))
