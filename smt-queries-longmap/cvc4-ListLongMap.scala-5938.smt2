; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77448 () Bool)

(assert start!77448)

(declare-fun b!902614 () Bool)

(declare-fun e!505548 () Bool)

(assert (=> b!902614 (= e!505548 false)))

(declare-fun lt!407886 () Bool)

(declare-datatypes ((array!52984 0))(
  ( (array!52985 (arr!25452 (Array (_ BitVec 32) (_ BitVec 64))) (size!25911 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52984)

(declare-datatypes ((List!17887 0))(
  ( (Nil!17884) (Cons!17883 (h!19029 (_ BitVec 64)) (t!25270 List!17887)) )
))
(declare-fun arrayNoDuplicates!0 (array!52984 (_ BitVec 32) List!17887) Bool)

(assert (=> b!902614 (= lt!407886 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17884))))

(declare-fun mapIsEmpty!29401 () Bool)

(declare-fun mapRes!29401 () Bool)

(assert (=> mapIsEmpty!29401 mapRes!29401))

(declare-fun b!902615 () Bool)

(declare-fun e!505545 () Bool)

(declare-fun tp_is_empty!18461 () Bool)

(assert (=> b!902615 (= e!505545 tp_is_empty!18461)))

(declare-fun b!902616 () Bool)

(declare-fun res!609103 () Bool)

(assert (=> b!902616 (=> (not res!609103) (not e!505548))))

(declare-datatypes ((V!29579 0))(
  ( (V!29580 (val!9281 Int)) )
))
(declare-datatypes ((ValueCell!8749 0))(
  ( (ValueCellFull!8749 (v!11786 V!29579)) (EmptyCell!8749) )
))
(declare-datatypes ((array!52986 0))(
  ( (array!52987 (arr!25453 (Array (_ BitVec 32) ValueCell!8749)) (size!25912 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52986)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!902616 (= res!609103 (and (= (size!25912 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25911 _keys!1386) (size!25912 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609102 () Bool)

(assert (=> start!77448 (=> (not res!609102) (not e!505548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77448 (= res!609102 (validMask!0 mask!1756))))

(assert (=> start!77448 e!505548))

(assert (=> start!77448 true))

(declare-fun e!505544 () Bool)

(declare-fun array_inv!19952 (array!52986) Bool)

(assert (=> start!77448 (and (array_inv!19952 _values!1152) e!505544)))

(declare-fun array_inv!19953 (array!52984) Bool)

(assert (=> start!77448 (array_inv!19953 _keys!1386)))

(declare-fun mapNonEmpty!29401 () Bool)

(declare-fun tp!56460 () Bool)

(assert (=> mapNonEmpty!29401 (= mapRes!29401 (and tp!56460 e!505545))))

(declare-fun mapKey!29401 () (_ BitVec 32))

(declare-fun mapValue!29401 () ValueCell!8749)

(declare-fun mapRest!29401 () (Array (_ BitVec 32) ValueCell!8749))

(assert (=> mapNonEmpty!29401 (= (arr!25453 _values!1152) (store mapRest!29401 mapKey!29401 mapValue!29401))))

(declare-fun b!902617 () Bool)

(declare-fun res!609104 () Bool)

(assert (=> b!902617 (=> (not res!609104) (not e!505548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52984 (_ BitVec 32)) Bool)

(assert (=> b!902617 (= res!609104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902618 () Bool)

(declare-fun e!505547 () Bool)

(assert (=> b!902618 (= e!505544 (and e!505547 mapRes!29401))))

(declare-fun condMapEmpty!29401 () Bool)

(declare-fun mapDefault!29401 () ValueCell!8749)

