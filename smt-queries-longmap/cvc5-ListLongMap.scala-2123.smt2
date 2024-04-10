; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35936 () Bool)

(assert start!35936)

(declare-fun b!361171 () Bool)

(declare-fun e!221137 () Bool)

(declare-fun tp_is_empty!8359 () Bool)

(assert (=> b!361171 (= e!221137 tp_is_empty!8359)))

(declare-fun b!361172 () Bool)

(declare-fun e!221135 () Bool)

(assert (=> b!361172 (= e!221135 tp_is_empty!8359)))

(declare-fun b!361173 () Bool)

(declare-fun e!221136 () Bool)

(declare-datatypes ((array!20269 0))(
  ( (array!20270 (arr!9625 (Array (_ BitVec 32) (_ BitVec 64))) (size!9977 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20269)

(assert (=> b!361173 (= e!221136 (and (bvsle #b00000000000000000000000000000000 (size!9977 _keys!1541)) (bvsge (size!9977 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun res!200919 () Bool)

(assert (=> start!35936 (=> (not res!200919) (not e!221136))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35936 (= res!200919 (validMask!0 mask!1943))))

(assert (=> start!35936 e!221136))

(assert (=> start!35936 true))

(declare-datatypes ((V!12123 0))(
  ( (V!12124 (val!4224 Int)) )
))
(declare-datatypes ((ValueCell!3836 0))(
  ( (ValueCellFull!3836 (v!6418 V!12123)) (EmptyCell!3836) )
))
(declare-datatypes ((array!20271 0))(
  ( (array!20272 (arr!9626 (Array (_ BitVec 32) ValueCell!3836)) (size!9978 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20271)

(declare-fun e!221133 () Bool)

(declare-fun array_inv!7076 (array!20271) Bool)

(assert (=> start!35936 (and (array_inv!7076 _values!1277) e!221133)))

(declare-fun array_inv!7077 (array!20269) Bool)

(assert (=> start!35936 (array_inv!7077 _keys!1541)))

(declare-fun mapNonEmpty!14055 () Bool)

(declare-fun mapRes!14055 () Bool)

(declare-fun tp!28131 () Bool)

(assert (=> mapNonEmpty!14055 (= mapRes!14055 (and tp!28131 e!221135))))

(declare-fun mapValue!14055 () ValueCell!3836)

(declare-fun mapKey!14055 () (_ BitVec 32))

(declare-fun mapRest!14055 () (Array (_ BitVec 32) ValueCell!3836))

(assert (=> mapNonEmpty!14055 (= (arr!9626 _values!1277) (store mapRest!14055 mapKey!14055 mapValue!14055))))

(declare-fun b!361174 () Bool)

(declare-fun res!200918 () Bool)

(assert (=> b!361174 (=> (not res!200918) (not e!221136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20269 (_ BitVec 32)) Bool)

(assert (=> b!361174 (= res!200918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapIsEmpty!14055 () Bool)

(assert (=> mapIsEmpty!14055 mapRes!14055))

(declare-fun b!361175 () Bool)

(declare-fun res!200917 () Bool)

(assert (=> b!361175 (=> (not res!200917) (not e!221136))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361175 (= res!200917 (and (= (size!9978 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9977 _keys!1541) (size!9978 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361176 () Bool)

(assert (=> b!361176 (= e!221133 (and e!221137 mapRes!14055))))

(declare-fun condMapEmpty!14055 () Bool)

(declare-fun mapDefault!14055 () ValueCell!3836)

