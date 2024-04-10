; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35794 () Bool)

(assert start!35794)

(declare-fun b!359534 () Bool)

(declare-fun e!220232 () Bool)

(assert (=> b!359534 (= e!220232 false)))

(declare-fun lt!166358 () Bool)

(declare-datatypes ((array!20049 0))(
  ( (array!20050 (arr!9518 (Array (_ BitVec 32) (_ BitVec 64))) (size!9870 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20049)

(declare-datatypes ((List!5471 0))(
  ( (Nil!5468) (Cons!5467 (h!6323 (_ BitVec 64)) (t!10621 List!5471)) )
))
(declare-fun arrayNoDuplicates!0 (array!20049 (_ BitVec 32) List!5471) Bool)

(assert (=> b!359534 (= lt!166358 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5468))))

(declare-fun mapNonEmpty!13878 () Bool)

(declare-fun mapRes!13878 () Bool)

(declare-fun tp!27945 () Bool)

(declare-fun e!220228 () Bool)

(assert (=> mapNonEmpty!13878 (= mapRes!13878 (and tp!27945 e!220228))))

(declare-fun mapKey!13878 () (_ BitVec 32))

(declare-datatypes ((V!11973 0))(
  ( (V!11974 (val!4168 Int)) )
))
(declare-datatypes ((ValueCell!3780 0))(
  ( (ValueCellFull!3780 (v!6362 V!11973)) (EmptyCell!3780) )
))
(declare-fun mapRest!13878 () (Array (_ BitVec 32) ValueCell!3780))

(declare-fun mapValue!13878 () ValueCell!3780)

(declare-datatypes ((array!20051 0))(
  ( (array!20052 (arr!9519 (Array (_ BitVec 32) ValueCell!3780)) (size!9871 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20051)

(assert (=> mapNonEmpty!13878 (= (arr!9519 _values!1208) (store mapRest!13878 mapKey!13878 mapValue!13878))))

(declare-fun res!199828 () Bool)

(assert (=> start!35794 (=> (not res!199828) (not e!220232))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35794 (= res!199828 (validMask!0 mask!1842))))

(assert (=> start!35794 e!220232))

(assert (=> start!35794 true))

(declare-fun e!220230 () Bool)

(declare-fun array_inv!7002 (array!20051) Bool)

(assert (=> start!35794 (and (array_inv!7002 _values!1208) e!220230)))

(declare-fun array_inv!7003 (array!20049) Bool)

(assert (=> start!35794 (array_inv!7003 _keys!1456)))

(declare-fun mapIsEmpty!13878 () Bool)

(assert (=> mapIsEmpty!13878 mapRes!13878))

(declare-fun b!359535 () Bool)

(declare-fun tp_is_empty!8247 () Bool)

(assert (=> b!359535 (= e!220228 tp_is_empty!8247)))

(declare-fun b!359536 () Bool)

(declare-fun res!199827 () Bool)

(assert (=> b!359536 (=> (not res!199827) (not e!220232))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359536 (= res!199827 (and (= (size!9871 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9870 _keys!1456) (size!9871 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359537 () Bool)

(declare-fun res!199826 () Bool)

(assert (=> b!359537 (=> (not res!199826) (not e!220232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20049 (_ BitVec 32)) Bool)

(assert (=> b!359537 (= res!199826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359538 () Bool)

(declare-fun e!220231 () Bool)

(assert (=> b!359538 (= e!220231 tp_is_empty!8247)))

(declare-fun b!359539 () Bool)

(assert (=> b!359539 (= e!220230 (and e!220231 mapRes!13878))))

(declare-fun condMapEmpty!13878 () Bool)

(declare-fun mapDefault!13878 () ValueCell!3780)

(assert (=> b!359539 (= condMapEmpty!13878 (= (arr!9519 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3780)) mapDefault!13878)))))

(assert (= (and start!35794 res!199828) b!359536))

(assert (= (and b!359536 res!199827) b!359537))

(assert (= (and b!359537 res!199826) b!359534))

(assert (= (and b!359539 condMapEmpty!13878) mapIsEmpty!13878))

(assert (= (and b!359539 (not condMapEmpty!13878)) mapNonEmpty!13878))

(get-info :version)

(assert (= (and mapNonEmpty!13878 ((_ is ValueCellFull!3780) mapValue!13878)) b!359535))

(assert (= (and b!359539 ((_ is ValueCellFull!3780) mapDefault!13878)) b!359538))

(assert (= start!35794 b!359539))

(declare-fun m!357007 () Bool)

(assert (=> b!359534 m!357007))

(declare-fun m!357009 () Bool)

(assert (=> mapNonEmpty!13878 m!357009))

(declare-fun m!357011 () Bool)

(assert (=> start!35794 m!357011))

(declare-fun m!357013 () Bool)

(assert (=> start!35794 m!357013))

(declare-fun m!357015 () Bool)

(assert (=> start!35794 m!357015))

(declare-fun m!357017 () Bool)

(assert (=> b!359537 m!357017))

(check-sat tp_is_empty!8247 (not b!359534) (not mapNonEmpty!13878) (not b!359537) (not start!35794))
(check-sat)
