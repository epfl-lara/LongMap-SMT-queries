; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35778 () Bool)

(assert start!35778)

(declare-fun b!359463 () Bool)

(declare-fun e!220180 () Bool)

(assert (=> b!359463 (= e!220180 false)))

(declare-fun lt!166373 () Bool)

(declare-datatypes ((array!20026 0))(
  ( (array!20027 (arr!9506 (Array (_ BitVec 32) (_ BitVec 64))) (size!9858 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20026)

(declare-datatypes ((List!5378 0))(
  ( (Nil!5375) (Cons!5374 (h!6230 (_ BitVec 64)) (t!10520 List!5378)) )
))
(declare-fun arrayNoDuplicates!0 (array!20026 (_ BitVec 32) List!5378) Bool)

(assert (=> b!359463 (= lt!166373 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5375))))

(declare-fun res!199814 () Bool)

(assert (=> start!35778 (=> (not res!199814) (not e!220180))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35778 (= res!199814 (validMask!0 mask!1842))))

(assert (=> start!35778 e!220180))

(assert (=> start!35778 true))

(declare-datatypes ((V!11971 0))(
  ( (V!11972 (val!4167 Int)) )
))
(declare-datatypes ((ValueCell!3779 0))(
  ( (ValueCellFull!3779 (v!6362 V!11971)) (EmptyCell!3779) )
))
(declare-datatypes ((array!20028 0))(
  ( (array!20029 (arr!9507 (Array (_ BitVec 32) ValueCell!3779)) (size!9859 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20028)

(declare-fun e!220181 () Bool)

(declare-fun array_inv!7028 (array!20028) Bool)

(assert (=> start!35778 (and (array_inv!7028 _values!1208) e!220181)))

(declare-fun array_inv!7029 (array!20026) Bool)

(assert (=> start!35778 (array_inv!7029 _keys!1456)))

(declare-fun b!359464 () Bool)

(declare-fun e!220182 () Bool)

(declare-fun tp_is_empty!8245 () Bool)

(assert (=> b!359464 (= e!220182 tp_is_empty!8245)))

(declare-fun b!359465 () Bool)

(declare-fun res!199815 () Bool)

(assert (=> b!359465 (=> (not res!199815) (not e!220180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20026 (_ BitVec 32)) Bool)

(assert (=> b!359465 (= res!199815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359466 () Bool)

(declare-fun mapRes!13875 () Bool)

(assert (=> b!359466 (= e!220181 (and e!220182 mapRes!13875))))

(declare-fun condMapEmpty!13875 () Bool)

(declare-fun mapDefault!13875 () ValueCell!3779)

(assert (=> b!359466 (= condMapEmpty!13875 (= (arr!9507 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3779)) mapDefault!13875)))))

(declare-fun mapIsEmpty!13875 () Bool)

(assert (=> mapIsEmpty!13875 mapRes!13875))

(declare-fun mapNonEmpty!13875 () Bool)

(declare-fun tp!27942 () Bool)

(declare-fun e!220183 () Bool)

(assert (=> mapNonEmpty!13875 (= mapRes!13875 (and tp!27942 e!220183))))

(declare-fun mapKey!13875 () (_ BitVec 32))

(declare-fun mapValue!13875 () ValueCell!3779)

(declare-fun mapRest!13875 () (Array (_ BitVec 32) ValueCell!3779))

(assert (=> mapNonEmpty!13875 (= (arr!9507 _values!1208) (store mapRest!13875 mapKey!13875 mapValue!13875))))

(declare-fun b!359467 () Bool)

(assert (=> b!359467 (= e!220183 tp_is_empty!8245)))

(declare-fun b!359468 () Bool)

(declare-fun res!199816 () Bool)

(assert (=> b!359468 (=> (not res!199816) (not e!220180))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359468 (= res!199816 (and (= (size!9859 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9858 _keys!1456) (size!9859 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35778 res!199814) b!359468))

(assert (= (and b!359468 res!199816) b!359465))

(assert (= (and b!359465 res!199815) b!359463))

(assert (= (and b!359466 condMapEmpty!13875) mapIsEmpty!13875))

(assert (= (and b!359466 (not condMapEmpty!13875)) mapNonEmpty!13875))

(get-info :version)

(assert (= (and mapNonEmpty!13875 ((_ is ValueCellFull!3779) mapValue!13875)) b!359467))

(assert (= (and b!359466 ((_ is ValueCellFull!3779) mapDefault!13875)) b!359464))

(assert (= start!35778 b!359466))

(declare-fun m!357219 () Bool)

(assert (=> b!359463 m!357219))

(declare-fun m!357221 () Bool)

(assert (=> start!35778 m!357221))

(declare-fun m!357223 () Bool)

(assert (=> start!35778 m!357223))

(declare-fun m!357225 () Bool)

(assert (=> start!35778 m!357225))

(declare-fun m!357227 () Bool)

(assert (=> b!359465 m!357227))

(declare-fun m!357229 () Bool)

(assert (=> mapNonEmpty!13875 m!357229))

(check-sat (not start!35778) tp_is_empty!8245 (not mapNonEmpty!13875) (not b!359463) (not b!359465))
(check-sat)
