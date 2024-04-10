; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35990 () Bool)

(assert start!35990)

(declare-fun res!201099 () Bool)

(declare-fun e!221391 () Bool)

(assert (=> start!35990 (=> (not res!201099) (not e!221391))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35990 (= res!201099 (validMask!0 mask!1943))))

(assert (=> start!35990 e!221391))

(assert (=> start!35990 true))

(declare-datatypes ((V!12155 0))(
  ( (V!12156 (val!4236 Int)) )
))
(declare-datatypes ((ValueCell!3848 0))(
  ( (ValueCellFull!3848 (v!6431 V!12155)) (EmptyCell!3848) )
))
(declare-datatypes ((array!20317 0))(
  ( (array!20318 (arr!9646 (Array (_ BitVec 32) ValueCell!3848)) (size!9998 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20317)

(declare-fun e!221389 () Bool)

(declare-fun array_inv!7092 (array!20317) Bool)

(assert (=> start!35990 (and (array_inv!7092 _values!1277) e!221389)))

(declare-datatypes ((array!20319 0))(
  ( (array!20320 (arr!9647 (Array (_ BitVec 32) (_ BitVec 64))) (size!9999 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20319)

(declare-fun array_inv!7093 (array!20319) Bool)

(assert (=> start!35990 (array_inv!7093 _keys!1541)))

(declare-fun b!361503 () Bool)

(declare-fun res!201100 () Bool)

(assert (=> b!361503 (=> (not res!201100) (not e!221391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20319 (_ BitVec 32)) Bool)

(assert (=> b!361503 (= res!201100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapIsEmpty!14100 () Bool)

(declare-fun mapRes!14100 () Bool)

(assert (=> mapIsEmpty!14100 mapRes!14100))

(declare-fun b!361504 () Bool)

(declare-fun e!221390 () Bool)

(declare-fun tp_is_empty!8383 () Bool)

(assert (=> b!361504 (= e!221390 tp_is_empty!8383)))

(declare-fun mapNonEmpty!14100 () Bool)

(declare-fun tp!28176 () Bool)

(assert (=> mapNonEmpty!14100 (= mapRes!14100 (and tp!28176 e!221390))))

(declare-fun mapValue!14100 () ValueCell!3848)

(declare-fun mapKey!14100 () (_ BitVec 32))

(declare-fun mapRest!14100 () (Array (_ BitVec 32) ValueCell!3848))

(assert (=> mapNonEmpty!14100 (= (arr!9646 _values!1277) (store mapRest!14100 mapKey!14100 mapValue!14100))))

(declare-fun b!361505 () Bool)

(declare-fun res!201101 () Bool)

(assert (=> b!361505 (=> (not res!201101) (not e!221391))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361505 (= res!201101 (and (= (size!9998 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9999 _keys!1541) (size!9998 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361506 () Bool)

(declare-fun e!221387 () Bool)

(assert (=> b!361506 (= e!221387 tp_is_empty!8383)))

(declare-fun b!361507 () Bool)

(assert (=> b!361507 (= e!221389 (and e!221387 mapRes!14100))))

(declare-fun condMapEmpty!14100 () Bool)

(declare-fun mapDefault!14100 () ValueCell!3848)

