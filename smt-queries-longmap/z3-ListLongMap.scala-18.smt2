; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!532 () Bool)

(assert start!532)

(declare-fun b!3123 () Bool)

(declare-fun e!1384 () Bool)

(declare-fun e!1388 () Bool)

(declare-fun mapRes!95 () Bool)

(assert (=> b!3123 (= e!1384 (and e!1388 mapRes!95))))

(declare-fun condMapEmpty!95 () Bool)

(declare-datatypes ((V!301 0))(
  ( (V!302 (val!52 Int)) )
))
(declare-datatypes ((ValueCell!30 0))(
  ( (ValueCellFull!30 (v!1139 V!301)) (EmptyCell!30) )
))
(declare-datatypes ((array!125 0))(
  ( (array!126 (arr!56 (Array (_ BitVec 32) ValueCell!30)) (size!118 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!125)

(declare-fun mapDefault!95 () ValueCell!30)

(assert (=> b!3123 (= condMapEmpty!95 (= (arr!56 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!30)) mapDefault!95)))))

(declare-fun b!3124 () Bool)

(declare-fun e!1385 () Bool)

(assert (=> b!3124 (= e!1385 false)))

(declare-fun lt!423 () Bool)

(declare-datatypes ((array!127 0))(
  ( (array!128 (arr!57 (Array (_ BitVec 32) (_ BitVec 64))) (size!119 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!127)

(declare-datatypes ((List!44 0))(
  ( (Nil!41) (Cons!40 (h!606 (_ BitVec 64)) (t!2171 List!44)) )
))
(declare-fun arrayNoDuplicates!0 (array!127 (_ BitVec 32) List!44) Bool)

(assert (=> b!3124 (= lt!423 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!41))))

(declare-fun b!3125 () Bool)

(declare-fun e!1386 () Bool)

(declare-fun tp_is_empty!93 () Bool)

(assert (=> b!3125 (= e!1386 tp_is_empty!93)))

(declare-fun b!3126 () Bool)

(declare-fun res!5022 () Bool)

(assert (=> b!3126 (=> (not res!5022) (not e!1385))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3126 (= res!5022 (and (= (size!118 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!119 _keys!1806) (size!118 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!95 () Bool)

(assert (=> mapIsEmpty!95 mapRes!95))

(declare-fun b!3127 () Bool)

(declare-fun res!5021 () Bool)

(assert (=> b!3127 (=> (not res!5021) (not e!1385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!127 (_ BitVec 32)) Bool)

(assert (=> b!3127 (= res!5021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5023 () Bool)

(assert (=> start!532 (=> (not res!5023) (not e!1385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!532 (= res!5023 (validMask!0 mask!2250))))

(assert (=> start!532 e!1385))

(assert (=> start!532 true))

(declare-fun array_inv!37 (array!125) Bool)

(assert (=> start!532 (and (array_inv!37 _values!1492) e!1384)))

(declare-fun array_inv!38 (array!127) Bool)

(assert (=> start!532 (array_inv!38 _keys!1806)))

(declare-fun b!3128 () Bool)

(assert (=> b!3128 (= e!1388 tp_is_empty!93)))

(declare-fun mapNonEmpty!95 () Bool)

(declare-fun tp!335 () Bool)

(assert (=> mapNonEmpty!95 (= mapRes!95 (and tp!335 e!1386))))

(declare-fun mapKey!95 () (_ BitVec 32))

(declare-fun mapRest!95 () (Array (_ BitVec 32) ValueCell!30))

(declare-fun mapValue!95 () ValueCell!30)

(assert (=> mapNonEmpty!95 (= (arr!56 _values!1492) (store mapRest!95 mapKey!95 mapValue!95))))

(assert (= (and start!532 res!5023) b!3126))

(assert (= (and b!3126 res!5022) b!3127))

(assert (= (and b!3127 res!5021) b!3124))

(assert (= (and b!3123 condMapEmpty!95) mapIsEmpty!95))

(assert (= (and b!3123 (not condMapEmpty!95)) mapNonEmpty!95))

(get-info :version)

(assert (= (and mapNonEmpty!95 ((_ is ValueCellFull!30) mapValue!95)) b!3125))

(assert (= (and b!3123 ((_ is ValueCellFull!30) mapDefault!95)) b!3128))

(assert (= start!532 b!3123))

(declare-fun m!1445 () Bool)

(assert (=> b!3124 m!1445))

(declare-fun m!1447 () Bool)

(assert (=> b!3127 m!1447))

(declare-fun m!1449 () Bool)

(assert (=> start!532 m!1449))

(declare-fun m!1451 () Bool)

(assert (=> start!532 m!1451))

(declare-fun m!1453 () Bool)

(assert (=> start!532 m!1453))

(declare-fun m!1455 () Bool)

(assert (=> mapNonEmpty!95 m!1455))

(check-sat (not mapNonEmpty!95) (not start!532) (not b!3127) (not b!3124) tp_is_empty!93)
(check-sat)
