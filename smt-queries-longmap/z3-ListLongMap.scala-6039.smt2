; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78302 () Bool)

(assert start!78302)

(declare-fun b_free!16645 () Bool)

(declare-fun b_next!16645 () Bool)

(assert (=> start!78302 (= b_free!16645 (not b_next!16645))))

(declare-fun tp!58209 () Bool)

(declare-fun b_and!27229 () Bool)

(assert (=> start!78302 (= tp!58209 b_and!27229)))

(declare-fun b!912817 () Bool)

(declare-fun e!512079 () Bool)

(declare-fun tp_is_empty!19063 () Bool)

(assert (=> b!912817 (= e!512079 tp_is_empty!19063)))

(declare-fun b!912818 () Bool)

(declare-fun e!512076 () Bool)

(assert (=> b!912818 (= e!512076 tp_is_empty!19063)))

(declare-fun mapIsEmpty!30319 () Bool)

(declare-fun mapRes!30319 () Bool)

(assert (=> mapIsEmpty!30319 mapRes!30319))

(declare-fun b!912819 () Bool)

(declare-fun res!615540 () Bool)

(declare-fun e!512075 () Bool)

(assert (=> b!912819 (=> (not res!615540) (not e!512075))))

(declare-datatypes ((array!54187 0))(
  ( (array!54188 (arr!26044 (Array (_ BitVec 32) (_ BitVec 64))) (size!26504 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54187)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54187 (_ BitVec 32)) Bool)

(assert (=> b!912819 (= res!615540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!615542 () Bool)

(assert (=> start!78302 (=> (not res!615542) (not e!512075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78302 (= res!615542 (validMask!0 mask!1756))))

(assert (=> start!78302 e!512075))

(declare-datatypes ((V!30383 0))(
  ( (V!30384 (val!9582 Int)) )
))
(declare-datatypes ((ValueCell!9050 0))(
  ( (ValueCellFull!9050 (v!12089 V!30383)) (EmptyCell!9050) )
))
(declare-datatypes ((array!54189 0))(
  ( (array!54190 (arr!26045 (Array (_ BitVec 32) ValueCell!9050)) (size!26505 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54189)

(declare-fun e!512078 () Bool)

(declare-fun array_inv!20438 (array!54189) Bool)

(assert (=> start!78302 (and (array_inv!20438 _values!1152) e!512078)))

(assert (=> start!78302 tp!58209))

(assert (=> start!78302 true))

(assert (=> start!78302 tp_is_empty!19063))

(declare-fun array_inv!20439 (array!54187) Bool)

(assert (=> start!78302 (array_inv!20439 _keys!1386)))

(declare-fun b!912820 () Bool)

(declare-fun res!615539 () Bool)

(assert (=> b!912820 (=> (not res!615539) (not e!512075))))

(declare-datatypes ((List!18268 0))(
  ( (Nil!18265) (Cons!18264 (h!19416 (_ BitVec 64)) (t!25847 List!18268)) )
))
(declare-fun arrayNoDuplicates!0 (array!54187 (_ BitVec 32) List!18268) Bool)

(assert (=> b!912820 (= res!615539 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18265))))

(declare-fun b!912821 () Bool)

(assert (=> b!912821 (= e!512078 (and e!512079 mapRes!30319))))

(declare-fun condMapEmpty!30319 () Bool)

(declare-fun mapDefault!30319 () ValueCell!9050)

(assert (=> b!912821 (= condMapEmpty!30319 (= (arr!26045 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9050)) mapDefault!30319)))))

(declare-fun mapNonEmpty!30319 () Bool)

(declare-fun tp!58210 () Bool)

(assert (=> mapNonEmpty!30319 (= mapRes!30319 (and tp!58210 e!512076))))

(declare-fun mapKey!30319 () (_ BitVec 32))

(declare-fun mapValue!30319 () ValueCell!9050)

(declare-fun mapRest!30319 () (Array (_ BitVec 32) ValueCell!9050))

(assert (=> mapNonEmpty!30319 (= (arr!26045 _values!1152) (store mapRest!30319 mapKey!30319 mapValue!30319))))

(declare-fun b!912822 () Bool)

(assert (=> b!912822 (= e!512075 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30383)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410889 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30383)

(declare-datatypes ((tuple2!12448 0))(
  ( (tuple2!12449 (_1!6235 (_ BitVec 64)) (_2!6235 V!30383)) )
))
(declare-datatypes ((List!18269 0))(
  ( (Nil!18266) (Cons!18265 (h!19417 tuple2!12448) (t!25848 List!18269)) )
))
(declare-datatypes ((ListLongMap!11147 0))(
  ( (ListLongMap!11148 (toList!5589 List!18269)) )
))
(declare-fun contains!4643 (ListLongMap!11147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2850 (array!54187 array!54189 (_ BitVec 32) (_ BitVec 32) V!30383 V!30383 (_ BitVec 32) Int) ListLongMap!11147)

(assert (=> b!912822 (= lt!410889 (contains!4643 (getCurrentListMap!2850 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912823 () Bool)

(declare-fun res!615541 () Bool)

(assert (=> b!912823 (=> (not res!615541) (not e!512075))))

(assert (=> b!912823 (= res!615541 (and (= (size!26505 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26504 _keys!1386) (size!26505 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78302 res!615542) b!912823))

(assert (= (and b!912823 res!615541) b!912819))

(assert (= (and b!912819 res!615540) b!912820))

(assert (= (and b!912820 res!615539) b!912822))

(assert (= (and b!912821 condMapEmpty!30319) mapIsEmpty!30319))

(assert (= (and b!912821 (not condMapEmpty!30319)) mapNonEmpty!30319))

(get-info :version)

(assert (= (and mapNonEmpty!30319 ((_ is ValueCellFull!9050) mapValue!30319)) b!912818))

(assert (= (and b!912821 ((_ is ValueCellFull!9050) mapDefault!30319)) b!912817))

(assert (= start!78302 b!912821))

(declare-fun m!847845 () Bool)

(assert (=> mapNonEmpty!30319 m!847845))

(declare-fun m!847847 () Bool)

(assert (=> b!912819 m!847847))

(declare-fun m!847849 () Bool)

(assert (=> b!912820 m!847849))

(declare-fun m!847851 () Bool)

(assert (=> start!78302 m!847851))

(declare-fun m!847853 () Bool)

(assert (=> start!78302 m!847853))

(declare-fun m!847855 () Bool)

(assert (=> start!78302 m!847855))

(declare-fun m!847857 () Bool)

(assert (=> b!912822 m!847857))

(assert (=> b!912822 m!847857))

(declare-fun m!847859 () Bool)

(assert (=> b!912822 m!847859))

(check-sat (not start!78302) (not b!912820) (not mapNonEmpty!30319) tp_is_empty!19063 b_and!27229 (not b_next!16645) (not b!912819) (not b!912822))
(check-sat b_and!27229 (not b_next!16645))
