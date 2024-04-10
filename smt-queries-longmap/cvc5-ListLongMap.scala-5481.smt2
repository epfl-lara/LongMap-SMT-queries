; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72670 () Bool)

(assert start!72670)

(declare-fun mapIsEmpty!25181 () Bool)

(declare-fun mapRes!25181 () Bool)

(assert (=> mapIsEmpty!25181 mapRes!25181))

(declare-fun b!843500 () Bool)

(declare-fun res!573195 () Bool)

(declare-fun e!470643 () Bool)

(assert (=> b!843500 (=> (not res!573195) (not e!470643))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843500 (= res!573195 (validMask!0 mask!1196))))

(declare-fun b!843501 () Bool)

(assert (=> b!843501 (= e!470643 false)))

(declare-fun lt!381148 () Bool)

(declare-datatypes ((array!47690 0))(
  ( (array!47691 (arr!22876 (Array (_ BitVec 32) (_ BitVec 64))) (size!23316 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47690)

(declare-datatypes ((List!16239 0))(
  ( (Nil!16236) (Cons!16235 (h!17366 (_ BitVec 64)) (t!22610 List!16239)) )
))
(declare-fun arrayNoDuplicates!0 (array!47690 (_ BitVec 32) List!16239) Bool)

(assert (=> b!843501 (= lt!381148 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16236))))

(declare-fun res!573194 () Bool)

(assert (=> start!72670 (=> (not res!573194) (not e!470643))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72670 (= res!573194 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23316 _keys!868))))))

(assert (=> start!72670 e!470643))

(assert (=> start!72670 true))

(declare-fun array_inv!18192 (array!47690) Bool)

(assert (=> start!72670 (array_inv!18192 _keys!868)))

(declare-datatypes ((V!26009 0))(
  ( (V!26010 (val!7908 Int)) )
))
(declare-datatypes ((ValueCell!7421 0))(
  ( (ValueCellFull!7421 (v!10333 V!26009)) (EmptyCell!7421) )
))
(declare-datatypes ((array!47692 0))(
  ( (array!47693 (arr!22877 (Array (_ BitVec 32) ValueCell!7421)) (size!23317 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47692)

(declare-fun e!470644 () Bool)

(declare-fun array_inv!18193 (array!47692) Bool)

(assert (=> start!72670 (and (array_inv!18193 _values!688) e!470644)))

(declare-fun mapNonEmpty!25181 () Bool)

(declare-fun tp!48499 () Bool)

(declare-fun e!470646 () Bool)

(assert (=> mapNonEmpty!25181 (= mapRes!25181 (and tp!48499 e!470646))))

(declare-fun mapKey!25181 () (_ BitVec 32))

(declare-fun mapValue!25181 () ValueCell!7421)

(declare-fun mapRest!25181 () (Array (_ BitVec 32) ValueCell!7421))

(assert (=> mapNonEmpty!25181 (= (arr!22877 _values!688) (store mapRest!25181 mapKey!25181 mapValue!25181))))

(declare-fun b!843502 () Bool)

(declare-fun e!470647 () Bool)

(assert (=> b!843502 (= e!470644 (and e!470647 mapRes!25181))))

(declare-fun condMapEmpty!25181 () Bool)

(declare-fun mapDefault!25181 () ValueCell!7421)

