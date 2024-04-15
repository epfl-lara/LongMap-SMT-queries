; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35526 () Bool)

(assert start!35526)

(declare-fun b!355857 () Bool)

(declare-fun e!218068 () Bool)

(declare-fun tp_is_empty!7993 () Bool)

(assert (=> b!355857 (= e!218068 tp_is_empty!7993)))

(declare-fun mapNonEmpty!13497 () Bool)

(declare-fun mapRes!13497 () Bool)

(declare-fun tp!27474 () Bool)

(declare-fun e!218066 () Bool)

(assert (=> mapNonEmpty!13497 (= mapRes!13497 (and tp!27474 e!218066))))

(declare-fun mapKey!13497 () (_ BitVec 32))

(declare-datatypes ((V!11635 0))(
  ( (V!11636 (val!4041 Int)) )
))
(declare-datatypes ((ValueCell!3653 0))(
  ( (ValueCellFull!3653 (v!6229 V!11635)) (EmptyCell!3653) )
))
(declare-fun mapValue!13497 () ValueCell!3653)

(declare-datatypes ((array!19545 0))(
  ( (array!19546 (arr!9266 (Array (_ BitVec 32) ValueCell!3653)) (size!9619 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19545)

(declare-fun mapRest!13497 () (Array (_ BitVec 32) ValueCell!3653))

(assert (=> mapNonEmpty!13497 (= (arr!9266 _values!1208) (store mapRest!13497 mapKey!13497 mapValue!13497))))

(declare-fun b!355858 () Bool)

(declare-fun res!197440 () Bool)

(declare-fun e!218067 () Bool)

(assert (=> b!355858 (=> (not res!197440) (not e!218067))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19547 0))(
  ( (array!19548 (arr!9267 (Array (_ BitVec 32) (_ BitVec 64))) (size!9620 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19547)

(assert (=> b!355858 (= res!197440 (and (= (size!9619 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9620 _keys!1456) (size!9619 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355859 () Bool)

(assert (=> b!355859 (= e!218066 tp_is_empty!7993)))

(declare-fun b!355861 () Bool)

(declare-fun res!197439 () Bool)

(assert (=> b!355861 (=> (not res!197439) (not e!218067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19547 (_ BitVec 32)) Bool)

(assert (=> b!355861 (= res!197439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355862 () Bool)

(assert (=> b!355862 (= e!218067 false)))

(declare-fun lt!165670 () Bool)

(declare-datatypes ((List!5331 0))(
  ( (Nil!5328) (Cons!5327 (h!6183 (_ BitVec 64)) (t!10472 List!5331)) )
))
(declare-fun arrayNoDuplicates!0 (array!19547 (_ BitVec 32) List!5331) Bool)

(assert (=> b!355862 (= lt!165670 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5328))))

(declare-fun mapIsEmpty!13497 () Bool)

(assert (=> mapIsEmpty!13497 mapRes!13497))

(declare-fun b!355860 () Bool)

(declare-fun e!218069 () Bool)

(assert (=> b!355860 (= e!218069 (and e!218068 mapRes!13497))))

(declare-fun condMapEmpty!13497 () Bool)

(declare-fun mapDefault!13497 () ValueCell!3653)

(assert (=> b!355860 (= condMapEmpty!13497 (= (arr!9266 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3653)) mapDefault!13497)))))

(declare-fun res!197438 () Bool)

(assert (=> start!35526 (=> (not res!197438) (not e!218067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35526 (= res!197438 (validMask!0 mask!1842))))

(assert (=> start!35526 e!218067))

(assert (=> start!35526 true))

(declare-fun array_inv!6852 (array!19545) Bool)

(assert (=> start!35526 (and (array_inv!6852 _values!1208) e!218069)))

(declare-fun array_inv!6853 (array!19547) Bool)

(assert (=> start!35526 (array_inv!6853 _keys!1456)))

(assert (= (and start!35526 res!197438) b!355858))

(assert (= (and b!355858 res!197440) b!355861))

(assert (= (and b!355861 res!197439) b!355862))

(assert (= (and b!355860 condMapEmpty!13497) mapIsEmpty!13497))

(assert (= (and b!355860 (not condMapEmpty!13497)) mapNonEmpty!13497))

(get-info :version)

(assert (= (and mapNonEmpty!13497 ((_ is ValueCellFull!3653) mapValue!13497)) b!355859))

(assert (= (and b!355860 ((_ is ValueCellFull!3653) mapDefault!13497)) b!355857))

(assert (= start!35526 b!355860))

(declare-fun m!353907 () Bool)

(assert (=> mapNonEmpty!13497 m!353907))

(declare-fun m!353909 () Bool)

(assert (=> b!355861 m!353909))

(declare-fun m!353911 () Bool)

(assert (=> b!355862 m!353911))

(declare-fun m!353913 () Bool)

(assert (=> start!35526 m!353913))

(declare-fun m!353915 () Bool)

(assert (=> start!35526 m!353915))

(declare-fun m!353917 () Bool)

(assert (=> start!35526 m!353917))

(check-sat (not start!35526) (not b!355862) (not b!355861) tp_is_empty!7993 (not mapNonEmpty!13497))
(check-sat)
