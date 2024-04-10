; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131866 () Bool)

(assert start!131866)

(declare-fun b!1543749 () Bool)

(declare-fun e!859221 () Bool)

(declare-fun tp_is_empty!37855 () Bool)

(assert (=> b!1543749 (= e!859221 tp_is_empty!37855)))

(declare-fun res!1059150 () Bool)

(declare-fun e!859224 () Bool)

(assert (=> start!131866 (=> (not res!1059150) (not e!859224))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131866 (= res!1059150 (validMask!0 mask!926))))

(assert (=> start!131866 e!859224))

(assert (=> start!131866 true))

(declare-datatypes ((V!58917 0))(
  ( (V!58918 (val!19005 Int)) )
))
(declare-datatypes ((ValueCell!18017 0))(
  ( (ValueCellFull!18017 (v!21806 V!58917)) (EmptyCell!18017) )
))
(declare-datatypes ((array!102928 0))(
  ( (array!102929 (arr!49666 (Array (_ BitVec 32) ValueCell!18017)) (size!50216 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102928)

(declare-fun e!859222 () Bool)

(declare-fun array_inv!38635 (array!102928) Bool)

(assert (=> start!131866 (and (array_inv!38635 _values!470) e!859222)))

(declare-datatypes ((array!102930 0))(
  ( (array!102931 (arr!49667 (Array (_ BitVec 32) (_ BitVec 64))) (size!50217 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102930)

(declare-fun array_inv!38636 (array!102930) Bool)

(assert (=> start!131866 (array_inv!38636 _keys!618)))

(declare-fun mapIsEmpty!58486 () Bool)

(declare-fun mapRes!58486 () Bool)

(assert (=> mapIsEmpty!58486 mapRes!58486))

(declare-fun b!1543750 () Bool)

(declare-fun e!859220 () Bool)

(assert (=> b!1543750 (= e!859220 tp_is_empty!37855)))

(declare-fun b!1543751 () Bool)

(declare-fun res!1059148 () Bool)

(assert (=> b!1543751 (=> (not res!1059148) (not e!859224))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543751 (= res!1059148 (and (= (size!50216 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50217 _keys!618) (size!50216 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543752 () Bool)

(assert (=> b!1543752 (= e!859222 (and e!859221 mapRes!58486))))

(declare-fun condMapEmpty!58486 () Bool)

(declare-fun mapDefault!58486 () ValueCell!18017)

