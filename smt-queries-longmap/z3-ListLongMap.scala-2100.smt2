; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35754 () Bool)

(assert start!35754)

(declare-fun b!359247 () Bool)

(declare-fun e!220002 () Bool)

(declare-fun tp_is_empty!8221 () Bool)

(assert (=> b!359247 (= e!220002 tp_is_empty!8221)))

(declare-fun mapNonEmpty!13839 () Bool)

(declare-fun mapRes!13839 () Bool)

(declare-fun tp!27906 () Bool)

(declare-fun e!220001 () Bool)

(assert (=> mapNonEmpty!13839 (= mapRes!13839 (and tp!27906 e!220001))))

(declare-datatypes ((V!11939 0))(
  ( (V!11940 (val!4155 Int)) )
))
(declare-datatypes ((ValueCell!3767 0))(
  ( (ValueCellFull!3767 (v!6350 V!11939)) (EmptyCell!3767) )
))
(declare-fun mapValue!13839 () ValueCell!3767)

(declare-fun mapRest!13839 () (Array (_ BitVec 32) ValueCell!3767))

(declare-fun mapKey!13839 () (_ BitVec 32))

(declare-datatypes ((array!19978 0))(
  ( (array!19979 (arr!9482 (Array (_ BitVec 32) ValueCell!3767)) (size!9834 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19978)

(assert (=> mapNonEmpty!13839 (= (arr!9482 _values!1208) (store mapRest!13839 mapKey!13839 mapValue!13839))))

(declare-fun b!359248 () Bool)

(declare-fun e!220000 () Bool)

(assert (=> b!359248 (= e!220000 false)))

(declare-fun lt!166337 () Bool)

(declare-datatypes ((array!19980 0))(
  ( (array!19981 (arr!9483 (Array (_ BitVec 32) (_ BitVec 64))) (size!9835 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19980)

(declare-datatypes ((List!5371 0))(
  ( (Nil!5368) (Cons!5367 (h!6223 (_ BitVec 64)) (t!10513 List!5371)) )
))
(declare-fun arrayNoDuplicates!0 (array!19980 (_ BitVec 32) List!5371) Bool)

(assert (=> b!359248 (= lt!166337 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5368))))

(declare-fun b!359249 () Bool)

(declare-fun res!199708 () Bool)

(assert (=> b!359249 (=> (not res!199708) (not e!220000))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19980 (_ BitVec 32)) Bool)

(assert (=> b!359249 (= res!199708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199707 () Bool)

(assert (=> start!35754 (=> (not res!199707) (not e!220000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35754 (= res!199707 (validMask!0 mask!1842))))

(assert (=> start!35754 e!220000))

(assert (=> start!35754 true))

(declare-fun e!220003 () Bool)

(declare-fun array_inv!7008 (array!19978) Bool)

(assert (=> start!35754 (and (array_inv!7008 _values!1208) e!220003)))

(declare-fun array_inv!7009 (array!19980) Bool)

(assert (=> start!35754 (array_inv!7009 _keys!1456)))

(declare-fun b!359250 () Bool)

(assert (=> b!359250 (= e!220003 (and e!220002 mapRes!13839))))

(declare-fun condMapEmpty!13839 () Bool)

(declare-fun mapDefault!13839 () ValueCell!3767)

(assert (=> b!359250 (= condMapEmpty!13839 (= (arr!9482 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3767)) mapDefault!13839)))))

(declare-fun b!359251 () Bool)

(assert (=> b!359251 (= e!220001 tp_is_empty!8221)))

(declare-fun b!359252 () Bool)

(declare-fun res!199706 () Bool)

(assert (=> b!359252 (=> (not res!199706) (not e!220000))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359252 (= res!199706 (and (= (size!9834 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9835 _keys!1456) (size!9834 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13839 () Bool)

(assert (=> mapIsEmpty!13839 mapRes!13839))

(assert (= (and start!35754 res!199707) b!359252))

(assert (= (and b!359252 res!199706) b!359249))

(assert (= (and b!359249 res!199708) b!359248))

(assert (= (and b!359250 condMapEmpty!13839) mapIsEmpty!13839))

(assert (= (and b!359250 (not condMapEmpty!13839)) mapNonEmpty!13839))

(get-info :version)

(assert (= (and mapNonEmpty!13839 ((_ is ValueCellFull!3767) mapValue!13839)) b!359251))

(assert (= (and b!359250 ((_ is ValueCellFull!3767) mapDefault!13839)) b!359247))

(assert (= start!35754 b!359250))

(declare-fun m!357075 () Bool)

(assert (=> mapNonEmpty!13839 m!357075))

(declare-fun m!357077 () Bool)

(assert (=> b!359248 m!357077))

(declare-fun m!357079 () Bool)

(assert (=> b!359249 m!357079))

(declare-fun m!357081 () Bool)

(assert (=> start!35754 m!357081))

(declare-fun m!357083 () Bool)

(assert (=> start!35754 m!357083))

(declare-fun m!357085 () Bool)

(assert (=> start!35754 m!357085))

(check-sat (not b!359248) (not mapNonEmpty!13839) (not start!35754) (not b!359249) tp_is_empty!8221)
(check-sat)
