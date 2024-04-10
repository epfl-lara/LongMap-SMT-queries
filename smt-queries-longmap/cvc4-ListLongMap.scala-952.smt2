; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20812 () Bool)

(assert start!20812)

(declare-fun b_free!5465 () Bool)

(declare-fun b_next!5465 () Bool)

(assert (=> start!20812 (= b_free!5465 (not b_next!5465))))

(declare-fun tp!19436 () Bool)

(declare-fun b_and!12211 () Bool)

(assert (=> start!20812 (= tp!19436 b_and!12211)))

(declare-fun mapIsEmpty!9059 () Bool)

(declare-fun mapRes!9059 () Bool)

(assert (=> mapIsEmpty!9059 mapRes!9059))

(declare-fun b!208640 () Bool)

(declare-fun res!101537 () Bool)

(declare-fun e!136045 () Bool)

(assert (=> b!208640 (=> (not res!101537) (not e!136045))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6749 0))(
  ( (V!6750 (val!2708 Int)) )
))
(declare-datatypes ((ValueCell!2320 0))(
  ( (ValueCellFull!2320 (v!4678 V!6749)) (EmptyCell!2320) )
))
(declare-datatypes ((array!9857 0))(
  ( (array!9858 (arr!4679 (Array (_ BitVec 32) ValueCell!2320)) (size!5004 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9857)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9859 0))(
  ( (array!9860 (arr!4680 (Array (_ BitVec 32) (_ BitVec 64))) (size!5005 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9859)

(assert (=> b!208640 (= res!101537 (and (= (size!5004 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5005 _keys!825) (size!5004 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101539 () Bool)

(assert (=> start!20812 (=> (not res!101539) (not e!136045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20812 (= res!101539 (validMask!0 mask!1149))))

(assert (=> start!20812 e!136045))

(declare-fun e!136046 () Bool)

(declare-fun array_inv!3105 (array!9857) Bool)

(assert (=> start!20812 (and (array_inv!3105 _values!649) e!136046)))

(assert (=> start!20812 true))

(declare-fun tp_is_empty!5327 () Bool)

(assert (=> start!20812 tp_is_empty!5327))

(declare-fun array_inv!3106 (array!9859) Bool)

(assert (=> start!20812 (array_inv!3106 _keys!825)))

(assert (=> start!20812 tp!19436))

(declare-fun mapNonEmpty!9059 () Bool)

(declare-fun tp!19435 () Bool)

(declare-fun e!136047 () Bool)

(assert (=> mapNonEmpty!9059 (= mapRes!9059 (and tp!19435 e!136047))))

(declare-fun mapRest!9059 () (Array (_ BitVec 32) ValueCell!2320))

(declare-fun mapKey!9059 () (_ BitVec 32))

(declare-fun mapValue!9059 () ValueCell!2320)

(assert (=> mapNonEmpty!9059 (= (arr!4679 _values!649) (store mapRest!9059 mapKey!9059 mapValue!9059))))

(declare-fun b!208641 () Bool)

(declare-fun e!136048 () Bool)

(assert (=> b!208641 (= e!136046 (and e!136048 mapRes!9059))))

(declare-fun condMapEmpty!9059 () Bool)

(declare-fun mapDefault!9059 () ValueCell!2320)

