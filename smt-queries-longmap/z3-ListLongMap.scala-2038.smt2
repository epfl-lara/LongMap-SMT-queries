; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35382 () Bool)

(assert start!35382)

(declare-fun b!354075 () Bool)

(declare-fun res!196306 () Bool)

(declare-fun e!216989 () Bool)

(assert (=> b!354075 (=> (not res!196306) (not e!216989))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19267 0))(
  ( (array!19268 (arr!9127 (Array (_ BitVec 32) (_ BitVec 64))) (size!9480 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19267)

(declare-datatypes ((V!11443 0))(
  ( (V!11444 (val!3969 Int)) )
))
(declare-datatypes ((ValueCell!3581 0))(
  ( (ValueCellFull!3581 (v!6157 V!11443)) (EmptyCell!3581) )
))
(declare-datatypes ((array!19269 0))(
  ( (array!19270 (arr!9128 (Array (_ BitVec 32) ValueCell!3581)) (size!9481 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19269)

(assert (=> b!354075 (= res!196306 (and (= (size!9481 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9480 _keys!1456) (size!9481 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13281 () Bool)

(declare-fun mapRes!13281 () Bool)

(declare-fun tp!27177 () Bool)

(declare-fun e!216987 () Bool)

(assert (=> mapNonEmpty!13281 (= mapRes!13281 (and tp!27177 e!216987))))

(declare-fun mapRest!13281 () (Array (_ BitVec 32) ValueCell!3581))

(declare-fun mapKey!13281 () (_ BitVec 32))

(declare-fun mapValue!13281 () ValueCell!3581)

(assert (=> mapNonEmpty!13281 (= (arr!9128 _values!1208) (store mapRest!13281 mapKey!13281 mapValue!13281))))

(declare-fun b!354076 () Bool)

(declare-fun e!216988 () Bool)

(declare-fun e!216986 () Bool)

(assert (=> b!354076 (= e!216988 (and e!216986 mapRes!13281))))

(declare-fun condMapEmpty!13281 () Bool)

(declare-fun mapDefault!13281 () ValueCell!3581)

(assert (=> b!354076 (= condMapEmpty!13281 (= (arr!9128 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3581)) mapDefault!13281)))))

(declare-fun res!196305 () Bool)

(assert (=> start!35382 (=> (not res!196305) (not e!216989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35382 (= res!196305 (validMask!0 mask!1842))))

(assert (=> start!35382 e!216989))

(assert (=> start!35382 true))

(declare-fun array_inv!6760 (array!19269) Bool)

(assert (=> start!35382 (and (array_inv!6760 _values!1208) e!216988)))

(declare-fun array_inv!6761 (array!19267) Bool)

(assert (=> start!35382 (array_inv!6761 _keys!1456)))

(declare-fun b!354077 () Bool)

(declare-fun tp_is_empty!7849 () Bool)

(assert (=> b!354077 (= e!216986 tp_is_empty!7849)))

(declare-fun mapIsEmpty!13281 () Bool)

(assert (=> mapIsEmpty!13281 mapRes!13281))

(declare-fun b!354078 () Bool)

(assert (=> b!354078 (= e!216987 tp_is_empty!7849)))

(declare-fun b!354079 () Bool)

(assert (=> b!354079 (= e!216989 false)))

(declare-fun lt!165454 () Bool)

(declare-datatypes ((List!5267 0))(
  ( (Nil!5264) (Cons!5263 (h!6119 (_ BitVec 64)) (t!10408 List!5267)) )
))
(declare-fun arrayNoDuplicates!0 (array!19267 (_ BitVec 32) List!5267) Bool)

(assert (=> b!354079 (= lt!165454 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5264))))

(declare-fun b!354080 () Bool)

(declare-fun res!196304 () Bool)

(assert (=> b!354080 (=> (not res!196304) (not e!216989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19267 (_ BitVec 32)) Bool)

(assert (=> b!354080 (= res!196304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35382 res!196305) b!354075))

(assert (= (and b!354075 res!196306) b!354080))

(assert (= (and b!354080 res!196304) b!354079))

(assert (= (and b!354076 condMapEmpty!13281) mapIsEmpty!13281))

(assert (= (and b!354076 (not condMapEmpty!13281)) mapNonEmpty!13281))

(get-info :version)

(assert (= (and mapNonEmpty!13281 ((_ is ValueCellFull!3581) mapValue!13281)) b!354078))

(assert (= (and b!354076 ((_ is ValueCellFull!3581) mapDefault!13281)) b!354077))

(assert (= start!35382 b!354076))

(declare-fun m!352665 () Bool)

(assert (=> mapNonEmpty!13281 m!352665))

(declare-fun m!352667 () Bool)

(assert (=> start!35382 m!352667))

(declare-fun m!352669 () Bool)

(assert (=> start!35382 m!352669))

(declare-fun m!352671 () Bool)

(assert (=> start!35382 m!352671))

(declare-fun m!352673 () Bool)

(assert (=> b!354079 m!352673))

(declare-fun m!352675 () Bool)

(assert (=> b!354080 m!352675))

(check-sat tp_is_empty!7849 (not mapNonEmpty!13281) (not start!35382) (not b!354080) (not b!354079))
(check-sat)
