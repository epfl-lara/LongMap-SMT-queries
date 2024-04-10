; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36000 () Bool)

(assert start!36000)

(declare-fun mapNonEmpty!14115 () Bool)

(declare-fun mapRes!14115 () Bool)

(declare-fun tp!28191 () Bool)

(declare-fun e!221462 () Bool)

(assert (=> mapNonEmpty!14115 (= mapRes!14115 (and tp!28191 e!221462))))

(declare-datatypes ((V!12167 0))(
  ( (V!12168 (val!4241 Int)) )
))
(declare-datatypes ((ValueCell!3853 0))(
  ( (ValueCellFull!3853 (v!6436 V!12167)) (EmptyCell!3853) )
))
(declare-datatypes ((array!20337 0))(
  ( (array!20338 (arr!9656 (Array (_ BitVec 32) ValueCell!3853)) (size!10008 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20337)

(declare-fun mapValue!14115 () ValueCell!3853)

(declare-fun mapRest!14115 () (Array (_ BitVec 32) ValueCell!3853))

(declare-fun mapKey!14115 () (_ BitVec 32))

(assert (=> mapNonEmpty!14115 (= (arr!9656 _values!1277) (store mapRest!14115 mapKey!14115 mapValue!14115))))

(declare-fun res!201152 () Bool)

(declare-fun e!221463 () Bool)

(assert (=> start!36000 (=> (not res!201152) (not e!221463))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36000 (= res!201152 (validMask!0 mask!1943))))

(assert (=> start!36000 e!221463))

(assert (=> start!36000 true))

(declare-datatypes ((array!20339 0))(
  ( (array!20340 (arr!9657 (Array (_ BitVec 32) (_ BitVec 64))) (size!10009 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20339)

(declare-fun array_inv!7102 (array!20339) Bool)

(assert (=> start!36000 (array_inv!7102 _keys!1541)))

(declare-fun e!221465 () Bool)

(declare-fun array_inv!7103 (array!20337) Bool)

(assert (=> start!36000 (and (array_inv!7103 _values!1277) e!221465)))

(declare-fun b!361601 () Bool)

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361601 (= e!221463 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10009 _keys!1541)) (bvsge (size!10009 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361602 () Bool)

(declare-fun tp_is_empty!8393 () Bool)

(assert (=> b!361602 (= e!221462 tp_is_empty!8393)))

(declare-fun b!361603 () Bool)

(declare-fun e!221464 () Bool)

(assert (=> b!361603 (= e!221465 (and e!221464 mapRes!14115))))

(declare-fun condMapEmpty!14115 () Bool)

(declare-fun mapDefault!14115 () ValueCell!3853)

