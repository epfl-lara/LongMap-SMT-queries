; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72296 () Bool)

(assert start!72296)

(declare-fun b!837629 () Bool)

(declare-fun res!569655 () Bool)

(declare-fun e!467518 () Bool)

(assert (=> b!837629 (=> (not res!569655) (not e!467518))))

(declare-datatypes ((array!46992 0))(
  ( (array!46993 (arr!22527 (Array (_ BitVec 32) (_ BitVec 64))) (size!22967 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46992)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46992 (_ BitVec 32)) Bool)

(assert (=> b!837629 (= res!569655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837630 () Bool)

(declare-fun res!569654 () Bool)

(assert (=> b!837630 (=> (not res!569654) (not e!467518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837630 (= res!569654 (validMask!0 mask!1196))))

(declare-fun b!837631 () Bool)

(declare-fun e!467515 () Bool)

(declare-fun tp_is_empty!15347 () Bool)

(assert (=> b!837631 (= e!467515 tp_is_empty!15347)))

(declare-fun mapNonEmpty!24620 () Bool)

(declare-fun mapRes!24620 () Bool)

(declare-fun tp!47614 () Bool)

(declare-fun e!467514 () Bool)

(assert (=> mapNonEmpty!24620 (= mapRes!24620 (and tp!47614 e!467514))))

(declare-fun mapKey!24620 () (_ BitVec 32))

(declare-datatypes ((V!25509 0))(
  ( (V!25510 (val!7721 Int)) )
))
(declare-datatypes ((ValueCell!7234 0))(
  ( (ValueCellFull!7234 (v!10146 V!25509)) (EmptyCell!7234) )
))
(declare-fun mapValue!24620 () ValueCell!7234)

(declare-fun mapRest!24620 () (Array (_ BitVec 32) ValueCell!7234))

(declare-datatypes ((array!46994 0))(
  ( (array!46995 (arr!22528 (Array (_ BitVec 32) ValueCell!7234)) (size!22968 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46994)

(assert (=> mapNonEmpty!24620 (= (arr!22528 _values!688) (store mapRest!24620 mapKey!24620 mapValue!24620))))

(declare-fun b!837632 () Bool)

(assert (=> b!837632 (= e!467514 tp_is_empty!15347)))

(declare-fun b!837633 () Bool)

(declare-fun res!569656 () Bool)

(assert (=> b!837633 (=> (not res!569656) (not e!467518))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837633 (= res!569656 (and (= (size!22968 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22967 _keys!868) (size!22968 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24620 () Bool)

(assert (=> mapIsEmpty!24620 mapRes!24620))

(declare-fun b!837634 () Bool)

(assert (=> b!837634 (= e!467518 false)))

(declare-fun lt!380587 () Bool)

(declare-datatypes ((List!16033 0))(
  ( (Nil!16030) (Cons!16029 (h!17160 (_ BitVec 64)) (t!22404 List!16033)) )
))
(declare-fun arrayNoDuplicates!0 (array!46992 (_ BitVec 32) List!16033) Bool)

(assert (=> b!837634 (= lt!380587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16030))))

(declare-fun res!569657 () Bool)

(assert (=> start!72296 (=> (not res!569657) (not e!467518))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72296 (= res!569657 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22967 _keys!868))))))

(assert (=> start!72296 e!467518))

(assert (=> start!72296 true))

(declare-fun array_inv!17954 (array!46992) Bool)

(assert (=> start!72296 (array_inv!17954 _keys!868)))

(declare-fun e!467516 () Bool)

(declare-fun array_inv!17955 (array!46994) Bool)

(assert (=> start!72296 (and (array_inv!17955 _values!688) e!467516)))

(declare-fun b!837635 () Bool)

(assert (=> b!837635 (= e!467516 (and e!467515 mapRes!24620))))

(declare-fun condMapEmpty!24620 () Bool)

(declare-fun mapDefault!24620 () ValueCell!7234)

