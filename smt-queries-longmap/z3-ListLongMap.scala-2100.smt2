; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35754 () Bool)

(assert start!35754)

(declare-fun b!359025 () Bool)

(declare-fun e!219861 () Bool)

(declare-fun tp_is_empty!8221 () Bool)

(assert (=> b!359025 (= e!219861 tp_is_empty!8221)))

(declare-fun b!359027 () Bool)

(declare-fun e!219858 () Bool)

(assert (=> b!359027 (= e!219858 tp_is_empty!8221)))

(declare-fun b!359028 () Bool)

(declare-fun e!219857 () Bool)

(assert (=> b!359028 (= e!219857 false)))

(declare-fun lt!166084 () Bool)

(declare-datatypes ((array!19975 0))(
  ( (array!19976 (arr!9481 (Array (_ BitVec 32) (_ BitVec 64))) (size!9834 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19975)

(declare-datatypes ((List!5426 0))(
  ( (Nil!5423) (Cons!5422 (h!6278 (_ BitVec 64)) (t!10567 List!5426)) )
))
(declare-fun arrayNoDuplicates!0 (array!19975 (_ BitVec 32) List!5426) Bool)

(assert (=> b!359028 (= lt!166084 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5423))))

(declare-fun b!359026 () Bool)

(declare-fun e!219859 () Bool)

(declare-fun mapRes!13839 () Bool)

(assert (=> b!359026 (= e!219859 (and e!219858 mapRes!13839))))

(declare-fun condMapEmpty!13839 () Bool)

(declare-datatypes ((V!11939 0))(
  ( (V!11940 (val!4155 Int)) )
))
(declare-datatypes ((ValueCell!3767 0))(
  ( (ValueCellFull!3767 (v!6343 V!11939)) (EmptyCell!3767) )
))
(declare-datatypes ((array!19977 0))(
  ( (array!19978 (arr!9482 (Array (_ BitVec 32) ValueCell!3767)) (size!9835 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19977)

(declare-fun mapDefault!13839 () ValueCell!3767)

(assert (=> b!359026 (= condMapEmpty!13839 (= (arr!9482 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3767)) mapDefault!13839)))))

(declare-fun res!199581 () Bool)

(assert (=> start!35754 (=> (not res!199581) (not e!219857))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35754 (= res!199581 (validMask!0 mask!1842))))

(assert (=> start!35754 e!219857))

(assert (=> start!35754 true))

(declare-fun array_inv!6998 (array!19977) Bool)

(assert (=> start!35754 (and (array_inv!6998 _values!1208) e!219859)))

(declare-fun array_inv!6999 (array!19975) Bool)

(assert (=> start!35754 (array_inv!6999 _keys!1456)))

(declare-fun mapIsEmpty!13839 () Bool)

(assert (=> mapIsEmpty!13839 mapRes!13839))

(declare-fun b!359029 () Bool)

(declare-fun res!199582 () Bool)

(assert (=> b!359029 (=> (not res!199582) (not e!219857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19975 (_ BitVec 32)) Bool)

(assert (=> b!359029 (= res!199582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359030 () Bool)

(declare-fun res!199580 () Bool)

(assert (=> b!359030 (=> (not res!199580) (not e!219857))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359030 (= res!199580 (and (= (size!9835 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9834 _keys!1456) (size!9835 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13839 () Bool)

(declare-fun tp!27906 () Bool)

(assert (=> mapNonEmpty!13839 (= mapRes!13839 (and tp!27906 e!219861))))

(declare-fun mapKey!13839 () (_ BitVec 32))

(declare-fun mapRest!13839 () (Array (_ BitVec 32) ValueCell!3767))

(declare-fun mapValue!13839 () ValueCell!3767)

(assert (=> mapNonEmpty!13839 (= (arr!9482 _values!1208) (store mapRest!13839 mapKey!13839 mapValue!13839))))

(assert (= (and start!35754 res!199581) b!359030))

(assert (= (and b!359030 res!199580) b!359029))

(assert (= (and b!359029 res!199582) b!359028))

(assert (= (and b!359026 condMapEmpty!13839) mapIsEmpty!13839))

(assert (= (and b!359026 (not condMapEmpty!13839)) mapNonEmpty!13839))

(get-info :version)

(assert (= (and mapNonEmpty!13839 ((_ is ValueCellFull!3767) mapValue!13839)) b!359025))

(assert (= (and b!359026 ((_ is ValueCellFull!3767) mapDefault!13839)) b!359027))

(assert (= start!35754 b!359026))

(declare-fun m!356121 () Bool)

(assert (=> b!359028 m!356121))

(declare-fun m!356123 () Bool)

(assert (=> start!35754 m!356123))

(declare-fun m!356125 () Bool)

(assert (=> start!35754 m!356125))

(declare-fun m!356127 () Bool)

(assert (=> start!35754 m!356127))

(declare-fun m!356129 () Bool)

(assert (=> b!359029 m!356129))

(declare-fun m!356131 () Bool)

(assert (=> mapNonEmpty!13839 m!356131))

(check-sat (not mapNonEmpty!13839) tp_is_empty!8221 (not b!359028) (not start!35754) (not b!359029))
(check-sat)
